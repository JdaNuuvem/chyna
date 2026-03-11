<?php
session_start();
include_once('../ad-min/services/database.php');
include_once('../ad-min/services/funcao.php');
include_once('../ad-min/services/crud.php');
global $mysqli;

// Log de callback
$logFile = $_SERVER['DOCUMENT_ROOT'] . '/logs/amplopay_callback_' . date('Y-m-d') . '.log';
$logDir = dirname($logFile);
if (!is_dir($logDir)) { @mkdir($logDir, 0777, true); }

$rawInput = file_get_contents("php://input");
file_put_contents($logFile, date('Y-m-d H:i:s') . " - Callback recebido: " . $rawInput . "\n", FILE_APPEND);

// Receber dados da solicitação POST JSON
$data = json_decode($rawInput, true);

// Verificar se o JSON foi decodificado com sucesso
if ($data === null && json_last_error() !== JSON_ERROR_NONE) {
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - ERRO: JSON inválido\n", FILE_APPEND);
    http_response_code(400);
    exit;
}

#====================================================================#
# Log completo do webhook para debug
$debugLogFile = $_SERVER['DOCUMENT_ROOT'] . '/logs/webhook_debug_' . date('Y-m-d') . '.log';
$debugEntry = str_repeat('=', 60) . "\n";
$debugEntry .= date('Y-m-d H:i:s') . " - AmploPay Callback\n";
$debugEntry .= "Headers: " . json_encode(getallheaders(), JSON_PRETTY_PRINT) . "\n";
$debugEntry .= "Body: " . $rawInput . "\n";
$debugEntry .= str_repeat('=', 60) . "\n\n";
file_put_contents($debugLogFile, $debugEntry, FILE_APPEND);

#====================================================================#
# Extrair campos do webhook AmploPay
$event = isset($data['event']) ? $data['event'] : null;
$transaction = isset($data['transaction']) ? $data['transaction'] : null;

if ($transaction) {
    # AmploPay pode enviar o identifier em diferentes campos
    $idTransaction = null;
    if (isset($transaction['identifier'])) {
        $idTransaction = PHP_SEGURO($transaction['identifier']);
    } elseif (isset($transaction['id'])) {
        # Tentar buscar pelo ID interno da AmploPay na tabela transacoes
        $idTransaction = PHP_SEGURO($transaction['id']);
    }
    $statusTransaction = isset($transaction['status']) ? $transaction['status'] : null;
    $paymentMethod = isset($transaction['paymentMethod']) ? $transaction['paymentMethod'] : null;

    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Transaction fields: " . json_encode(array_keys($transaction)) . "\n", FILE_APPEND);
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Transaction data: " . json_encode($transaction) . "\n", FILE_APPEND);
} else {
    $idTransaction = null;
    $statusTransaction = null;
    $paymentMethod = null;
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - AVISO: campo 'transaction' não encontrado no payload\n", FILE_APPEND);
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Campos disponíveis: " . json_encode(array_keys($data ?? [])) . "\n", FILE_APPEND);
}

#====================================================================#
function busca_valor_ipn($transacao_id)
{
    global $mysqli;
    $stmt = $mysqli->prepare("SELECT usuario, valor FROM transacoes WHERE transacao_id = ?");
    $stmt->bind_param("s", $transacao_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
        $retornaUSER = get_user_by_id($data['usuario']);
        if ($retornaUSER) {
            $retorna_insert_saldo = enviarSaldo($retornaUSER['mobile'], $data['valor']);
            return $retorna_insert_saldo;
        }
    }
    return false;
}

function get_user_by_id($user_id)
{
    global $mysqli;
    $stmt = $mysqli->prepare("SELECT mobile FROM usuarios WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->bind_result($mobile);
    $stmt->fetch();
    $stmt->close();
    if (!isset($mobile)) {
        return false;
    }
    return ['mobile' => $mobile];
}

#====================================================================#
function att_paymentpix($transacao_id)
{
    global $mysqli;
    $sql = $mysqli->prepare("UPDATE transacoes SET status='pago' WHERE transacao_id=?");
    $sql->bind_param("s", $transacao_id);
    if ($sql->execute()) {
        $buscar = busca_valor_ipn($transacao_id);
        if ($buscar) {
            $rf = 1;
        } else {
            $rf = 0;
        }
    } else {
        $rf = 0;
    }
    return $rf;
}

#====================================================================#
# Processar eventos AmploPay
file_put_contents($logFile, date('Y-m-d H:i:s') . " - Event: $event | Status: $statusTransaction | ID: $idTransaction\n", FILE_APPEND);

# Aceitar evento TRANSACTION_PAID com status COMPLETED ou PAID
$isPaid = ($event === 'TRANSACTION_PAID') && $idTransaction &&
          in_array($statusTransaction, ['COMPLETED', 'PAID', 'completed', 'paid'], true);

if ($isPaid) {
    $att_transacao = att_paymentpix($idTransaction);
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Pagamento processado: transacao=$idTransaction resultado=$att_transacao\n", FILE_APPEND);

    if ($att_transacao == 0) {
        # Se não encontrou pelo identifier, tentar buscar pelo transactionId da AmploPay
        file_put_contents($logFile, date('Y-m-d H:i:s') . " - AVISO: att_paymentpix retornou 0 para ID=$idTransaction, verificando alternativas...\n", FILE_APPEND);

        # Tentar o outro campo (se usamos 'id', tentar 'identifier' e vice-versa)
        $altId = null;
        if (isset($transaction['identifier']) && $idTransaction !== PHP_SEGURO($transaction['identifier'])) {
            $altId = PHP_SEGURO($transaction['identifier']);
        } elseif (isset($transaction['id']) && $idTransaction !== PHP_SEGURO($transaction['id'])) {
            $altId = PHP_SEGURO($transaction['id']);
        }

        if ($altId) {
            $att_transacao2 = att_paymentpix($altId);
            file_put_contents($logFile, date('Y-m-d H:i:s') . " - Tentativa alternativa com ID=$altId resultado=$att_transacao2\n", FILE_APPEND);
        }
    }
} else {
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Evento ignorado: event=$event status=$statusTransaction id=$idTransaction\n", FILE_APPEND);
}

# Responder 200 para confirmar recebimento
http_response_code(200);
echo json_encode(['status' => 'ok']);
#====================================================================#
