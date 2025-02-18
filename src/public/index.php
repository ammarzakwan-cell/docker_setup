<?php
$servername = getenv("DB_INFO_EDGE_HOST");
$username = getenv("DB_INFO_EDGE_USERNAME");
$password = getenv("DB_INFO_EDGE_PASSWORD");

var_dump($servername);
var_dump($username);

// Create connection
$conn = new mysqli('127.0.0.1', 'root', '');

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>