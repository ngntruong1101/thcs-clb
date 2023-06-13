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
    $clb_id = $_GET['id'];
}
$sql = "SELECT hoatdong.*, caulacbo.ten FROM hoatdong INNER JOIN caulacbo ON hoatdong.clbtochuc_id = caulacbo.id WHERE hoatdong.clbtochuc_id=$clb_id ORDER BY hoatdong.tungay";
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
<div class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
    <a href="dsclb.php"
       class="btn btn-primary me-3">Danh Sách CLB</a>
</div>
<h3>Thêm hoạt động</h3>
<form action="them.php" method="post">
    <input type="hidden" name="clb_id" value="<?php echo $clb_id ?>">
    <label class="form-label">Từ ngày</label>
    <input type="datetime-local" class="form-control" name="tungay">
    <label class="form-label">Đến ngày</label>
    <input type="datetime-local" class="form-control" name="denngay">
    <label class="form-label">Mục tiêu</label>
    <input type="text" class="form-control" name="muctieu">

    <input type="submit" value="Thêm" class="btn btn-primary mt-3">
</form>
<br>
<br>

<h3>Danh Sách Hoạt Động</h3>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>CLB tổ chức</th>
            <th>Từ ngày</th>
            <th>Đến ngày</th>
            <th>Mục tiêu</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($items as $item) {
            ?>
            <tr>
                <td><?php echo $item['id'] ?></td>
                <td><?php echo $item['ten'] ?></td>
                <td><?php echo $item['tungay'] ?></td>
                <td><?php echo $item['denngay'] ?></td>
                <td><?php echo $item['muctieu'] ?></td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>