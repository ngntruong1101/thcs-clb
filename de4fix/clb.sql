-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clb`
--

-- --------------------------------------------------------

--
-- Table structure for table `caulacbo`
--

CREATE TABLE `caulacbo` (
  `id` int(11) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `muctieu` text NOT NULL,
  `chutich_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `caulacbo`
--

INSERT INTO `caulacbo` (`id`, `namthanhlap`, `ten`, `muctieu`, `chutich_id`) VALUES
(1, 1, 'ten 1', 'muc tieu 1', '1'),
(2, 2, 'ten 2', 'muc tieu 2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoatdong`
--

CREATE TABLE `chitiethoatdong` (
  `id` int(11) NOT NULL,
  `hoatdong_id` int(11) NOT NULL,
  `sinhvien_id` varchar(32) NOT NULL,
  `nhiemvu` varchar(500) NOT NULL,
  `nhanxet` text NOT NULL,
  `diemdanhgia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chitiethoatdong`
--

INSERT INTO `chitiethoatdong` (`id`, `hoatdong_id`, `sinhvien_id`, `nhiemvu`, `nhanxet`, `diemdanhgia`) VALUES
(3, 1, '1', 'nhiem vu 1', 'nhan xet 1', 1),
(4, 2, '2', 'nhiem vu 2', 'nhan xet 2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dangkythanhvien`
--

CREATE TABLE `dangkythanhvien` (
  `id` int(11) NOT NULL,
  `sinhvien_id` varchar(32) NOT NULL,
  `clb_id` int(11) NOT NULL,
  `ngaydangky` datetime NOT NULL,
  `ngayxetduyet` datetime NOT NULL,
  `chutichclb_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoatdong`
--

CREATE TABLE `hoatdong` (
  `id` int(11) NOT NULL,
  `clbtochuc_id` int(32) NOT NULL,
  `tungay` datetime NOT NULL,
  `denngay` datetime NOT NULL,
  `muctieu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hoatdong`
--

INSERT INTO `hoatdong` (`id`, `clbtochuc_id`, `tungay`, `denngay`, `muctieu`) VALUES
(1, 1, '2023-06-17 00:00:00', '2023-06-14 00:00:00', 'muc tieu 1'),
(2, 2, '2023-06-18 00:00:00', '2023-06-14 00:00:00', 'muc tieu 2'),
(3, 1, '2023-06-19 00:00:00', '2023-06-14 00:00:00', 'muc tieu 2'),
(4, 1, '2023-06-20 00:00:00', '2023-06-14 00:00:00', 'muc tieu 3');

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id` varchar(32) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`id`, `trangthai`, `hovaten`, `ngaysinh`, `mota`) VALUES
('1', 1, 'ho va ten 1', '2023-01-12 18:43:19', 'mo ta 1'),
('2', 2, 'ho va ten 2', '2023-01-12 18:43:19', 'mo ta 2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `tendaydu` varchar(255) NOT NULL,
  `quyenhan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `matkhau`, `tendaydu`, `quyenhan`) VALUES
(1101, 'truong', '123', 'nguyen quoc truong', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caulacbo`
--
ALTER TABLE `caulacbo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chutich_id` (`chutich_id`);

--
-- Indexes for table `chitiethoatdong`
--
ALTER TABLE `chitiethoatdong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sinhvien_id` (`sinhvien_id`),
  ADD KEY `hoatdong_id` (`hoatdong_id`);

--
-- Indexes for table `dangkythanhvien`
--
ALTER TABLE `dangkythanhvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sinhvien_id` (`sinhvien_id`),
  ADD KEY `chutichclb_id` (`chutichclb_id`),
  ADD KEY `clb_id` (`clb_id`);

--
-- Indexes for table `hoatdong`
--
ALTER TABLE `hoatdong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clbtochuc_id` (`clbtochuc_id`);

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caulacbo`
--
ALTER TABLE `caulacbo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chitiethoatdong`
--
ALTER TABLE `chitiethoatdong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dangkythanhvien`
--
ALTER TABLE `dangkythanhvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hoatdong`
--
ALTER TABLE `hoatdong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caulacbo`
--
ALTER TABLE `caulacbo`
  ADD CONSTRAINT `caulacbo_ibfk_1` FOREIGN KEY (`chutich_id`) REFERENCES `sinhvien` (`id`);

--
-- Constraints for table `chitiethoatdong`
--
ALTER TABLE `chitiethoatdong`
  ADD CONSTRAINT `chitiethoatdong_ibfk_1` FOREIGN KEY (`sinhvien_id`) REFERENCES `sinhvien` (`id`),
  ADD CONSTRAINT `chitiethoatdong_ibfk_2` FOREIGN KEY (`hoatdong_id`) REFERENCES `hoatdong` (`id`);

--
-- Constraints for table `dangkythanhvien`
--
ALTER TABLE `dangkythanhvien`
  ADD CONSTRAINT `dangkythanhvien_ibfk_1` FOREIGN KEY (`sinhvien_id`) REFERENCES `sinhvien` (`id`),
  ADD CONSTRAINT `dangkythanhvien_ibfk_2` FOREIGN KEY (`chutichclb_id`) REFERENCES `sinhvien` (`id`),
  ADD CONSTRAINT `dangkythanhvien_ibfk_3` FOREIGN KEY (`clb_id`) REFERENCES `caulacbo` (`id`);

--
-- Constraints for table `hoatdong`
--
ALTER TABLE `hoatdong`
  ADD CONSTRAINT `hoatdong_ibfk_1` FOREIGN KEY (`clbtochuc_id`) REFERENCES `caulacbo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
