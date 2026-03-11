<?php
header('Content-Type: application/json');
$result = [
    'gd_loaded' => extension_loaded('gd'),
    'gd_info' => function_exists('gd_info') ? gd_info() : 'N/A',
    'uploads_dir' => realpath('../uploads/'),
    'uploads_exists' => is_dir('../uploads/'),
    'uploads_writable' => is_writable('../uploads/'),
    'cwd' => getcwd(),
    'php_version' => PHP_VERSION,
];
echo json_encode($result, JSON_PRETTY_PRINT);
