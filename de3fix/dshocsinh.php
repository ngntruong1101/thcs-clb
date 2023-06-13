<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:signin.php');
}
?>
<?php
require_once 'header.php';
require_once 'connect.php';
if (isset( $_GET['hovaten'])) {
    $hovaten = $_GET['hovaten'];
    $sql = "SELECT * FROM hocsinh WHERE hovaten LIKE '%$hovaten%'";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $sql = "SELECT * FROM hocsinh";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

?>
<div>
    <content style=" text-align: center; ">
<div class="nav container" style="background-color:white;">
<ul class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
</div>
</ul>
<form>
    <label class="form-label">Tìm Kiếm Học Sinh</label>
    <input type="text" class="form-control" name="hovaten" placeholder="Nhập tên">
    <input type="submit" value="Tìm Kiếm" class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Trạng Thái</th>
            <th>Lớp</th>
            <th>Họ và Tên</th>
            <th>Ngày Sinh</th>
            <th>Mô Tả</th>
            <th>Thêm</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($items as $item) {
            ?>
            <tr>
                <td><?php echo $item['id'] ?></td>
                <td><?php echo $item['trangthai'] ?></td>
                <td><?php echo $item['lop_id'] ?></td>
                <td><?php echo $item['hovaten'] ?></td>
                <td><?php echo $item['ngaysinh'] ?></td>
                <td><?php echo $item['mota'] ?></td>
                <td>
                <a href="themhocsinh.php?id=<?php echo $item['id'] ?>" class="btn btn-primary">Thêm</a>
                </td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>