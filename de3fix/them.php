<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:signin.php');
}
?>
<?php
require_once 'connect.php';
var_dump($_POST);
$hocsinh_id = $_POST['hocsinh_id'];
$namhoc = $_POST['namhoc'];
$nhanxetchung = $_POST['nhanxetchung'];
$uudiem = $_POST['uudiem'];
$cankhacphuc = $_POST['cankhacphuc'];
$duoclenlop = $_POST['duoclenlop'];

$sql = "INSERT INTO tongketnam(hocsinh_id,namhoc,nhanxetchung,uudiem,cankhacphuc,duoclenlop) VALUES(
    '$hocsinh_id', '$namhoc', '$nhanxetchung', '$uudiem', '$cankhacphuc', '$duoclenlop')";
$stmt = $pdo->prepare($sql);
$row = $stmt->execute();

if ($row) {
    header("Location:" . 'themhocsinh.php?id=' . $hocsinh_id);
}
?>