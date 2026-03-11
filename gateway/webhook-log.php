<?php
/**
 * Endpoint de debug para webhooks
 * Acesse GET /gateway/webhook-log.php para ver os últimos logs
 * POST para este endpoint também é logado
 */

$logDir = __DIR__ . '/../logs';
if (!is_dir($logDir)) { @mkdir($logDir, 0777, true); }

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Logar webhook recebido
    $logFile = $logDir . '/webhook_debug_' . date('Y-m-d') . '.log';
    $rawInput = file_get_contents("php://input");
    $headers = getallheaders();

    $logEntry = str_repeat('=', 60) . "\n";
    $logEntry .= date('Y-m-d H:i:s') . " - POST recebido\n";
    $logEntry .= "Headers: " . json_encode($headers, JSON_PRETTY_PRINT) . "\n";
    $logEntry .= "Body: " . $rawInput . "\n";
    $logEntry .= "IP: " . ($_SERVER['REMOTE_ADDR'] ?? 'unknown') . "\n";
    $logEntry .= str_repeat('=', 60) . "\n\n";

    file_put_contents($logFile, $logEntry, FILE_APPEND);

    http_response_code(200);
    echo json_encode(['status' => 'ok', 'logged' => true]);
    exit;
}

if ($method === 'GET') {
    // Mostrar logs recentes (protegido por token simples)
    $token = $_GET['token'] ?? '';
    if ($token !== 'moneybetplay2026') {
        http_response_code(403);
        echo json_encode(['error' => 'Token invalido. Use ?token=moneybetplay2026']);
        exit;
    }

    $type = $_GET['type'] ?? 'callback';
    $date = $_GET['date'] ?? date('Y-m-d');

    header('Content-Type: text/plain; charset=utf-8');

    if ($type === 'callback') {
        $logFile = $logDir . '/amplopay_callback_' . $date . '.log';
    } elseif ($type === 'create') {
        $logFile = $logDir . '/amplopay_' . $date . '.log';
    } elseif ($type === 'debug') {
        $logFile = $logDir . '/webhook_debug_' . $date . '.log';
    } else {
        echo "Tipos disponiveis: callback, create, debug\n";
        echo "Uso: ?token=moneybetplay2026&type=callback&date=2026-03-11\n";
        exit;
    }

    if (file_exists($logFile)) {
        echo "=== LOG: $logFile ===\n\n";
        echo file_get_contents($logFile);
    } else {
        echo "Nenhum log encontrado para: $logFile\n";
        echo "Logs disponiveis:\n";
        $files = glob($logDir . '/*.log');
        foreach ($files as $f) {
            echo "  - " . basename($f) . "\n";
        }
    }
    exit;
}

http_response_code(405);
echo json_encode(['error' => 'Method not allowed']);
