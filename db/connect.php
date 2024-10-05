<?php

# Load db configs
$env = parse_ini_file("../.env");

// Database connection
$db_host = isset($env['DB_HOST']) ? $env['DB_HOST'] : 'localhost';
$db_user = isset($env['DB_USER']) ? $env['DB_USER'] : 'root';
$db_pass = isset($env['DB_PASS']) ? $env['DB_PASS'] : '';
$db_name = isset($env['DB_NAME']) ? $env['DB_NAME'] : 'academy';

// Proceed with connecting to the database
$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Check connection
if (!$conn || $conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

