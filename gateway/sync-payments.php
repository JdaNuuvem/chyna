<?php
/**
 * Script automático para sincronizar pagamentos pendentes com a AmploPay.
 *
 * Verifica todas as transações com status 'processamento' na AmploPay API.
 * Se estiver COMPLETED, atualiza para 'pago' e credita o saldo do usuário.
 *
 * Uso via URL (protegido por token):
 *   GET /gateway/sync-payments.php?token=moneybetplay2026
 *
 * Uso via CLI (cron job):
 *   php /var/www/html/gateway/sync-payments.php
 */

$isCli = (php_sapi_name() === 'cli');

if (!$isCli) {
    session_start();
}

// Simular SERVER vars para CLI (necessário para funcao.php)
if ($isCli) {
    $_SERVER['HTTP_HOST'] = 'app.moneybetplay.fun';
    $_SERVER['HTTPS'] = 'on';
    $_SERVER['SERVER_PORT'] = 443;
    $_SERVER['REQUEST_METHOD'] = 'GET';
}

include_once(__DIR__ . '/../ad-min/services/database.php');
include_once(__DIR__ . '/../ad-min/services/funcao.php');
include_once(__DIR__ . '/../ad-min/services/crud.php');
global $mysqli;

if (!$isCli) {
    header('Content-Type: application/json; charset=utf-8');

    $token = $_GET['token'] ?? '';
    if ($token !== 'moneybetplay2026') {
        http_response_code(403);
        echo json_encode(['error' => 'Token invalido']);
        exit;
    }
}

// Log
$logDir = $isCli ? (__DIR__ . '/../logs') : ($_SERVER['DOCUMENT_ROOT'] . '/logs');
if (!is_dir($logDir)) {
    @mkdir($logDir, 0777, true);
}
$logFile = $logDir . '/sync_payments_' . date('Y-m-d') . '.log';

function sync_log($msg) {
    global $logFile;
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - " . $msg . "\n", FILE_APPEND);
}

// Buscar chaves AmploPay
$amplopay_result = $mysqli->query("SELECT public_key, secret_key FROM amplopay WHERE id = 1");
if (!$amplopay_result || $amplopay_result->num_rows === 0) {
    $msg = 'Chaves AmploPay nao encontradas no banco';
    sync_log("ERRO: $msg");
    if (!$isCli) {
        echo json_encode(['error' => $msg]);
    }
    exit(1);
}
$keys = $amplopay_result->fetch_assoc();

function amplopay_check($clientIdentifier, $public_key, $secret_key) {
    $url = 'https://app.amplopay.com/api/v1/gateway/transactions?clientIdentifier=' . urlencode($clientIdentifier);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
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

    if ($error) {
        return ['error' => $error];
    }

    $data = json_decode($response, true);
    return [
        'http_code' => $httpCode,
        'data' => $data,
    ];
}

// Buscar transações pendentes
sync_log("=== INICIO SINCRONIZACAO ===");

$result = $mysqli->query("SELECT id, transacao_id, usuario, valor, status FROM transacoes WHERE status IN ('processamento', 'pendente') ORDER BY id DESC");

$total = 0;
$aprovadas = 0;
$nao_pagas = 0;
$erros = 0;
$detalhes = [];

while ($row = $result->fetch_assoc()) {
    $total++;
    $transacao_id = $row['transacao_id'];

    sync_log("Verificando: $transacao_id (usuario={$row['usuario']}, valor={$row['valor']})");

    // Consultar AmploPay
    $api = amplopay_check($transacao_id, $keys['public_key'], $keys['secret_key']);

    if (isset($api['error'])) {
        sync_log("  ERRO API: " . $api['error']);
        $erros++;
        $detalhes[] = [
            'transacao_id' => $transacao_id,
            'resultado' => 'erro_api',
            'detalhe' => $api['error'],
        ];
        continue;
    }

    if ($api['http_code'] !== 200 || !isset($api['data']['status'])) {
        sync_log("  ERRO: HTTP {$api['http_code']} - resposta invalida");
        $erros++;
        $detalhes[] = [
            'transacao_id' => $transacao_id,
            'resultado' => 'erro_http',
            'http_code' => $api['http_code'],
        ];
        continue;
    }

    $amplo_status = strtoupper($api['data']['status']);
    sync_log("  AmploPay status: $amplo_status");

    if ($amplo_status === 'COMPLETED' || $amplo_status === 'PAID') {
        // Atualizar status para 'pago'
        $stmt = $mysqli->prepare("UPDATE transacoes SET status = 'pago' WHERE transacao_id = ? AND status IN ('processamento', 'pendente')");
        $stmt->bind_param("s", $transacao_id);
        $stmt->execute();
        $affected = $stmt->affected_rows;
        $stmt->close();

        if ($affected > 0) {
            // Buscar mobile do usuário e creditar saldo
            $user_stmt = $mysqli->prepare("SELECT mobile FROM usuarios WHERE id = ?");
            $user_stmt->bind_param("i", $row['usuario']);
            $user_stmt->execute();
            $user_stmt->bind_result($mobile);
            $user_stmt->fetch();
            $user_stmt->close();

            $saldo_ok = false;
            if ($mobile) {
                $saldo_ok = enviarSaldo($mobile, $row['valor']) == 1;
            }

            sync_log("  APROVADA: status=pago, mobile=$mobile, saldo_creditado=" . ($saldo_ok ? 'sim' : 'nao'));
            $aprovadas++;
            $detalhes[] = [
                'transacao_id' => $transacao_id,
                'resultado' => 'aprovada',
                'valor' => $row['valor'],
                'usuario' => $row['usuario'],
                'mobile' => $mobile,
                'saldo_creditado' => $saldo_ok,
                'pago_em' => $api['data']['payedAt'] ?? null,
            ];
        } else {
            sync_log("  JA PROCESSADA (affected_rows=0)");
            $detalhes[] = [
                'transacao_id' => $transacao_id,
                'resultado' => 'ja_processada',
            ];
        }
    } else {
        sync_log("  NAO PAGA: status=$amplo_status");
        $nao_pagas++;
        $detalhes[] = [
            'transacao_id' => $transacao_id,
            'resultado' => 'nao_paga',
            'amplopay_status' => $amplo_status,
        ];
    }

    // Intervalo entre requests para não sobrecarregar a API
    usleep(300000);
}

$resumo = [
    'timestamp' => date('Y-m-d H:i:s'),
    'total_pendentes' => $total,
    'aprovadas' => $aprovadas,
    'nao_pagas' => $nao_pagas,
    'erros' => $erros,
    'detalhes' => $detalhes,
];

sync_log("=== FIM: total=$total aprovadas=$aprovadas nao_pagas=$nao_pagas erros=$erros ===");

if ($isCli) {
    echo "Sincronizacao concluida: $aprovadas aprovadas de $total pendentes ($erros erros)\n";
    foreach ($detalhes as $d) {
        if ($d['resultado'] === 'aprovada') {
            echo "  + {$d['transacao_id']} R\${$d['valor']} -> usuario {$d['usuario']} (saldo: " . ($d['saldo_creditado'] ? 'OK' : 'FALHOU') . ")\n";
        }
    }
} else {
    echo json_encode($resumo, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
}
