<?php
/**
 * Script para verificar status de pagamentos pendentes na AmploPay
 * Acesse: GET /gateway/check-payments.php?token=moneybetplay2026
 *
 * Ações:
 * - ?action=pending  - Lista transações pendentes (padrão)
 * - ?action=check&id=TRANSACAO_ID - Consulta uma transação específica na AmploPay
 * - ?action=check_all - Consulta todas pendentes na AmploPay
 * - ?action=approve&id=TRANSACAO_ID - Aprova manualmente uma transação
 */

session_start();
include_once('../ad-min/services/database.php');
include_once('../ad-min/services/funcao.php');
include_once('../ad-min/services/crud.php');
global $mysqli;

header('Content-Type: application/json; charset=utf-8');

// Proteção por token
$token = $_GET['token'] ?? '';
if ($token !== 'moneybetplay2026') {
    http_response_code(403);
    echo json_encode(['error' => 'Token invalido']);
    exit;
}

$action = $_GET['action'] ?? 'pending';

// Buscar chaves AmploPay
$amplopay_result = $mysqli->query("SELECT public_key, secret_key FROM amplopay WHERE id = 1");
if (!$amplopay_result || $amplopay_result->num_rows === 0) {
    echo json_encode(['error' => 'Chaves AmploPay nao encontradas no banco']);
    exit;
}
$amplopay_keys = $amplopay_result->fetch_assoc();

function amplopay_api_get($endpoint, $public_key, $secret_key) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://app.amplopay.com/api/v1/gateway/' . $endpoint);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'x-public-key: ' . $public_key,
        'x-secret-key: ' . $secret_key,
    ]);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);

    return [
        'http_code' => $httpCode,
        'response' => json_decode($response, true),
        'raw' => $response,
        'error' => $error,
    ];
}

switch ($action) {
    case 'pending':
        // Listar transações pendentes
        $result = $mysqli->query("SELECT id, transacao_id, usuario, valor, status, data_hora, tipo FROM transacoes WHERE status IN ('processamento', 'pendente') ORDER BY id DESC LIMIT 20");
        $transactions = [];
        while ($row = $result->fetch_assoc()) {
            $transactions[] = $row;
        }
        echo json_encode([
            'action' => 'pending',
            'count' => count($transactions),
            'transactions' => $transactions,
            'amplopay_keys' => [
                'public_key' => substr($amplopay_keys['public_key'], 0, 10) . '...',
                'secret_key' => substr($amplopay_keys['secret_key'], 0, 10) . '...',
            ],
        ], JSON_PRETTY_PRINT);
        break;

    case 'check':
        // Consultar uma transação específica na AmploPay
        $transacao_id = $_GET['id'] ?? '';
        if (empty($transacao_id)) {
            echo json_encode(['error' => 'Informe o ID da transacao: ?action=check&id=TRANSACAO_ID']);
            exit;
        }

        // Buscar na nossa base
        $stmt = $mysqli->prepare("SELECT id, transacao_id, usuario, valor, status, data_hora FROM transacoes WHERE transacao_id = ?");
        $stmt->bind_param("s", $transacao_id);
        $stmt->execute();
        $local = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        // Consultar na AmploPay por clientIdentifier
        $api_result = amplopay_api_get(
            'transactions?clientIdentifier=' . urlencode($transacao_id),
            $amplopay_keys['public_key'],
            $amplopay_keys['secret_key']
        );

        echo json_encode([
            'action' => 'check',
            'transacao_id' => $transacao_id,
            'local_db' => $local,
            'amplopay_api' => $api_result,
        ], JSON_PRETTY_PRINT);
        break;

    case 'check_all':
        // Consultar todas pendentes na AmploPay
        $result = $mysqli->query("SELECT transacao_id, usuario, valor, status, data_hora FROM transacoes WHERE status IN ('processamento', 'pendente') ORDER BY id DESC LIMIT 10");
        $results = [];
        while ($row = $result->fetch_assoc()) {
            $api_result = amplopay_api_get(
                'transactions?clientIdentifier=' . urlencode($row['transacao_id']),
                $amplopay_keys['public_key'],
                $amplopay_keys['secret_key']
            );
            $results[] = [
                'local' => $row,
                'amplopay' => $api_result,
            ];
            usleep(300000); // 300ms entre requests
        }
        echo json_encode([
            'action' => 'check_all',
            'count' => count($results),
            'results' => $results,
        ], JSON_PRETTY_PRINT);
        break;

    case 'approve':
        // Aprovar manualmente uma transação (creditar saldo)
        $transacao_id = $_GET['id'] ?? '';
        if (empty($transacao_id)) {
            echo json_encode(['error' => 'Informe o ID: ?action=approve&id=TRANSACAO_ID']);
            exit;
        }

        // Verificar se existe e está pendente
        $stmt = $mysqli->prepare("SELECT id, transacao_id, usuario, valor, status FROM transacoes WHERE transacao_id = ? AND status IN ('processamento', 'pendente')");
        $stmt->bind_param("s", $transacao_id);
        $stmt->execute();
        $tx = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        if (!$tx) {
            echo json_encode(['error' => 'Transacao nao encontrada ou ja processada']);
            exit;
        }

        // Atualizar status e creditar saldo
        $sql = $mysqli->prepare("UPDATE transacoes SET status='pago' WHERE transacao_id=?");
        $sql->bind_param("s", $transacao_id);
        $sql->execute();
        $sql->close();

        // Creditar saldo ao usuário
        $user_stmt = $mysqli->prepare("SELECT mobile FROM usuarios WHERE id = ?");
        $user_stmt->bind_param("i", $tx['usuario']);
        $user_stmt->execute();
        $user_stmt->bind_result($mobile);
        $user_stmt->fetch();
        $user_stmt->close();

        $saldo_result = false;
        if ($mobile) {
            $saldo_result = enviarSaldo($mobile, $tx['valor']);
            creditar_comissao_afiliado($tx['usuario'], $tx['valor']);
        }

        echo json_encode([
            'action' => 'approve',
            'transacao' => $tx,
            'mobile' => $mobile,
            'saldo_creditado' => $saldo_result ? true : false,
        ], JSON_PRETTY_PRINT);
        break;

    default:
        echo json_encode([
            'error' => 'Acao invalida',
            'acoes_disponiveis' => ['pending', 'check', 'check_all', 'approve'],
        ]);
}
