<?php
    $conn = "mysql:host=localhost;dbname=clb";
    $user = 'root';
    $pass = '';
    $pdo = new PDO($conn, $user , $pass);
    if(!$pdo){
        echo "Kết nối thất bại !";
    }
?>