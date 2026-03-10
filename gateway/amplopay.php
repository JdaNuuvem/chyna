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
# Webhook para monitoramento
$dev_hook = 'https://webhook.site/c6640d43-fc1d-4565-bbc3-e3dee5a9d603';
//===================================================================#
function url_send()
{
    global $data, $dev_hook;
    $url = $dev_hook;
    $ch = curl_init($url);
    $corpo = json_encode($data);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $corpo);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $resultado = curl_exec($ch);
    curl_close($ch);
    return $resultado;
}
url_send();

#====================================================================#
# Extrair campos do webhook AmploPay
$event = isset($data['event']) ? $data['event'] : null;
$transaction = isset($data['transaction']) ? $data['transaction'] : null;

if ($transaction) {
    $idTransaction = isset($transaction['identifier']) ? PHP_SEGURO($transaction['identifier']) : null;
    $statusTransaction = isset($transaction['status']) ? $transaction['status'] : null;
    $paymentMethod = isset($transaction['paymentMethod']) ? $transaction['paymentMethod'] : null;
} else {
    $idTransaction = null;
    $statusTransaction = null;
    $paymentMethod = null;
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
# Status COMPLETED = pago | evento TRANSACTION_PAID
file_put_contents($logFile, date('Y-m-d H:i:s') . " - Event: $event | Status: $statusTransaction | ID: $idTransaction\n", FILE_APPEND);

if ($event === 'TRANSACTION_PAID' && $idTransaction && $statusTransaction === 'COMPLETED') {
    $att_transacao = att_paymentpix($idTransaction);
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Pagamento processado: transacao=$idTransaction resultado=$att_transacao\n", FILE_APPEND);
} else {
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - Evento ignorado (não é TRANSACTION_PAID/COMPLETED)\n", FILE_APPEND);
}

# Responder 200 para confirmar recebimento
http_response_code(200);
echo json_encode(['status' => 'ok']);
#====================================================================#
