<?php

$host = getenv('DB_HOST') ?: 'localhost';
$db = getenv('DB_NAME') ?: 'u371585379_teste';
$user = getenv('DB_USER') ?: 'u371585379_teste';
$pass = getenv('DB_PASS') ?: '5+rPRib8az';
$charset = "UTF8";
//  -- Setar o timezone padrão do sistema  --------------------------------------------------------//
date_default_timezone_set("America/Sao_Paulo");
define('PRODUCAO', true);
if (PRODUCAO) {
    $bd = array(
        'local' => $host, // local/ip
        'usuario' => $user, // user bd
        'senha' => $pass, // senha bd
        'banco' => $db // nome bd
    );
} else {
    $bd = array(
        'local' => $host, // local/ip
        'usuario' => $user, // user bd
        'senha' => $pass, // senha bd
        'banco' => $db // nome bd
    );
}
#----------------------------------------------------------------------------------------------------------#
//-- conexao procedural --------------------------------------------------------------------------//
$mysqli = new mysqli($bd['local'], $bd['usuario'], $bd['senha'], $bd['banco']);
if ($mysqli->connect_errno) {
    echo "Erro ao Conectar o BD: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    exit;
}
$mysqli->set_charset("utf8");


$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    // Criar uma nova instância PDO
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    // Lidar com erros de conexão
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

#----------------------------------------------------------------------------------------------------------#
//-- Auto-migração: cria tabelas necessárias se não existirem -------------------------------------------//
$check_amplopay = $mysqli->query("SHOW TABLES LIKE 'amplopay'");
if ($check_amplopay && $check_amplopay->num_rows === 0) {
    $mysqli->query("CREATE TABLE `amplopay` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `public_key` varchar(255) NOT NULL,
        `secret_key` varchar(255) NOT NULL,
        `ativo` tinyint(1) NOT NULL DEFAULT 1,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
    $stmt_ap = $mysqli->prepare("INSERT INTO `amplopay` (`id`, `public_key`, `secret_key`, `ativo`) VALUES (1, ?, ?, 1)");
    $ap_pub = getenv('AMPLOPAY_PUBLIC_KEY') ?: 'leonnardodom_fo2uc1v4y5v03lad';
    $ap_sec = getenv('AMPLOPAY_SECRET_KEY') ?: 'xpslhe9vxmz9u7qtsxy6wt0mywsua43jst5nn1zjkk2j9qwnidoiobssezzmgu2v';
    $stmt_ap->bind_param("ss", $ap_pub, $ap_sec);
    $stmt_ap->execute();
    $stmt_ap->close();
    // Definir AmploPay como gateway padrão
    $mysqli->query("UPDATE `config` SET `gateway_default` = 'amplopay' WHERE `id` = 1");
}
