<?php
header('Content-Type: application/json');

// Teste direto da API AmploPay
$public_key = 'leonnardodom_fo2uc1v4y5v03lad';
$secret_key = 'xpslhe9vxmz9u7qtsxy6wt0mywsua43jst5nn1zjkk2j9qwnidoiobssezzmgu2v';

$transacao_id = 'TEST' . rand(0, 999) . '-' . date('YmdHis');
$dataDeHoje = new DateTime();
$dataDeAmanha = $dataDeHoje->modify('+1 day');
$dataFormatada = $dataDeAmanha->format('Y-m-d');

$url = 'https://app.amplopay.com/api/v1/gateway/pix/receive';

$data = array(
    'identifier' => $transacao_id,
    'amount' => 20.0,
    'client' => array(
        'name' => 'Teste',
        'email' => 'teste@gmail.com',
        'phone' => '11999999999',
        'document' => '05703373484',
    ),
    'dueDate' => $dataFormatada,
    'callbackUrl' => 'https://app.moneybetplay.fun/gateway/amplopay',
);

$header = array(
    'Content-Type: application/json',
    'x-public-key: ' . $public_key,
    'x-secret-key: ' . $secret_key,
);

$ch = curl_init();
$data_json = json_encode($data);

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data_json);
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

echo json_encode([
    'request_url' => $url,
    'request_data' => $data,
    'http_code' => $httpCode,
    'curl_error' => $curlError,
    'raw_response' => $response,
    'decoded_response' => json_decode($response, true),
], JSON_PRETTY_PRINT);
