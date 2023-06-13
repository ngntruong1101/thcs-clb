<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:signin.php');
}
?>
<?php
require_once 'header.php';
require_once 'connect.php';
if (isset($_GET['id']) ) {
    $hocsinh_id = $_GET['id'];
}
$sql = "SELECT * FROM tongketnam WHERE hocsinh_id=$hocsinh_id";
$stmt = $pdo->query($sql);
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// if ($_GET['hovaten']) {
//     $hovaten = $_GET['hovaten'];
//     $sql = "SELECT * FROM hocsinh WHERE hovaten LIKE '%$hovaten%'";
//     $stmt = $pdo->query($sql);
//     $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// } else {
//     $sql = "SELECT * FROM hocsinh";
//     $stmt = $pdo->query($sql);
//     $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// }

?>
<div>
    <content style=" text-align: center; ">
<div class="nav container" style="background-color:#b4c2c4;">
<ul class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
    <a href="dshocsinh.php"
       class="btn btn-primary me-3">Danh Sách Học Sinh</a>
   </ul>
</div>
<h3>Thêm Nhận Xét Tổng Kết</h3>
<form action="them.php" method="post">
    <input type="hidden" name="hocsinh_id" value="<?php echo $hocsinh_id ?>">
    <label class="form-label">Năm Học</label>
    <input type="text" class="form-control" name="namhoc">
    <label class="form-label">Nhận Xét Chung</label>
    <input type="text" class="form-control" name="nhanxetchung">
    <label class="form-label">Ưu điểm</label>
    <input type="text" class="form-control" name="uudiem">
    <label class="form-label">Cần Khắc phục</label>
    <input type="text" class="form-control" name="cankhacphuc">
    <label class="form-label">Được lên lớp</label>
    <input type="number" class="form-control" name="duoclenlop">

    <input type="submit" value="Thêm" class="btn btn-primary mt-3">
</form>
<br>
<br>

<h3>Danh Sách Nhận Xét Tổng Kết</h3>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Học Sinh</th>
            <th>Năm Học</th>
            <th>Nhận Xét Chung</th>
            <th>Ưu điểm</th>
            <th>Cần Khắc phục</th>
            <th>Được lên lớp</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($items as $item) {
            ?>
            <tr>
                <td><?php echo $item['id'] ?></td>
                <td><?php echo $item['hocsinh_id'] ?></td>
                <td><?php echo $item['namhoc'] ?></td>
                <td><?php echo $item['nhanxetchung'] ?></td>
                <td><?php echo $item['uudiem'] ?></td>
                <td><?php echo $item['cankhacphuc'] ?></td>
                <td><?php echo $item['duoclenlop'] ?></td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>