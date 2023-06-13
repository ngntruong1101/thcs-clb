<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:signin.php');
}
?>
<?php
require_once 'header.php';
require_once 'connect.php';
if (isset( $_GET['ten'])) {
    $ten = $_GET['ten'];
    $sql = "SELECT caulacbo.*, sinhvien.hovaten FROM caulacbo INNER JOIN sinhvien ON caulacbo.chutich_id = sinhvien.id WHERE ten LIKE '%$ten%'";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $sql = "SELECT caulacbo.*, sinhvien.hovaten FROM caulacbo INNER JOIN sinhvien ON caulacbo.chutich_id = sinhvien.id";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

?>
<div class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
</div>
<form>
    <label class="form-label">Tìm kiếm câu lạc bộ</label>
    <input type="text" class="form-control" name="ten" placeholder="Nhập tên">
    <input type="submit" value="Tìm Kiếm" class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Năm thành lập</th>
            <th>Tên</th>
            <th>Mục tiêu</th>
            <th>Chủ tịch</th>
            <th>Thêm hoạt động</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($items as $item) {
            ?>
            <tr>
                <td><?php echo $item['id'] ?></td>
                <td><?php echo $item['namthanhlap'] ?></td>
                <td><?php echo $item['ten'] ?></td>
                <td><?php echo $item['muctieu'] ?></td>
                <td><?php echo $item['hovaten'] ?></td>
                <td>
                <a href="themhoatdong.php?id=<?php echo $item['id'] ?>" class="btn btn-primary">Thêm</a>
                </td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>