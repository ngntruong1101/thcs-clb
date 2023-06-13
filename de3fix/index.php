<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('location:signin.php');
}
?>
<?php require_once 'header.php' ?>
 <div style=" text-align: center; " class="logo">
            <img style="    height: 80px; width: 80px;"
                src="logo.png" alt=""> Quản lí Học Sinh
        </div>
    <content style=" text-align: center; ">
<div class="nav container" style="background-color:#b4c2c4;">
   <ul class="nav " >
                <li class="nav-item">
                    <a class="nav-link" href="cau1.png">Ảnh Câu 1</a>
                </li>
                <li class="nav-item">
                    <a href="dshocsinh.php" class="nav-link">Danh Sách Học Sinh</a>
                </li>
                 <li class="nav-item">
                    <a href="out.php" class="nav-link">Đăng Xuất</a>
                </li>                             
            </ul>   
</div>
</content>
<?php require_once 'footer.php' ?>