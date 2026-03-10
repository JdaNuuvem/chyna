<?php
include_once('../ad-min/services/database.php');
global $mysqli;

$gateway = 'amplopay';
$sql = $mysqli->prepare("UPDATE config SET gateway_default = ? WHERE id = 1");
$sql->bind_param("s", $gateway);
if ($sql->execute()) {
    echo json_encode(['status' => 'success', 'gateway' => $gateway]);
} else {
    echo json_encode(['status' => 'error', 'message' => $mysqli->error]);
}
