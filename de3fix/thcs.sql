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
-- Database: `thcs`
--

-- --------------------------------------------------------

--
-- Table structure for table `dieuchuyen`
--

CREATE TABLE `dieuchuyen` (
  `id` varchar(32) NOT NULL,
  `hocsinh` varchar(32) NOT NULL,
  `tungay` datetime NOT NULL,
  `lop_id` int(11) NOT NULL,
  `lydo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hocsinh`
--

CREATE TABLE `hocsinh` (
  `id` varchar(32) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `lop_id` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hocsinh`
--

INSERT INTO `hocsinh` (`id`, `trangthai`, `lop_id`, `hovaten`, `ngaysinh`, `mota`) VALUES
('1', 1, 1, 'ho va ten 1', '2023-01-18 21:26:39', 'mo ta 1'),
('2', 2, 2, 'ho va ten 2', '2023-01-26 21:26:39', 'mo ta 2');

-- --------------------------------------------------------

--
-- Table structure for table `lop`
--

CREATE TABLE `lop` (
  `id` int(11) NOT NULL,
  `namvaotruong` int(11) NOT NULL,
  `khoihientai` int(11) NOT NULL,
  `datotnghiep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lop`
--

INSERT INTO `lop` (`id`, `namvaotruong`, `khoihientai`, `datotnghiep`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `thannhan`
--

CREATE TABLE `thannhan` (
  `id` int(11) NOT NULL,
  `hocsinh_id` varchar(32) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `quanhe` varchar(50) NOT NULL,
  `dienthoai` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tongketnam`
--

CREATE TABLE `tongketnam` (
  `id` int(11) NOT NULL,
  `hocsinh_id` varchar(32) NOT NULL,
  `namhoc` varchar(9) NOT NULL,
  `nhanxetchung` text NOT NULL,
  `uudiem` text NOT NULL,
  `cankhacphuc` text NOT NULL,
  `duoclenlop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tongketnam`
--

INSERT INTO `tongketnam` (`id`, `hocsinh_id`, `namhoc`, `nhanxetchung`, `uudiem`, `cankhacphuc`, `duoclenlop`) VALUES
(1, '1', 'nam hoc 1', 'nhan xet 1', 'uu diem 1', 'can khac phuc 1', 1),
(2, '2', 'nam hoc 2', 'nhan xet chung 2', 'uu diem 2', 'can khac phuc 2', 2),
(3, '2', 'nam hoc 3', 'nx 3', 'ud 3', 'ckp 3', 3),
(4, '2', 'nam hoc 3', 'nx 3', 'ud 3', 'ckp 3', 3),
(5, '1', 'nam hoc 3', 'nhan xe 3', '1', '1', 2),
(6, '1', 'nam hoc 3', 'nhan xe 3', 'uu diem 3', 'can khac phuc 2', 0),
(7, '1', '', '', '', '', 0),
(8, '1', 'nam hoc 3', 'nhan xe 3', 'uu diem 3', 'can khac phuc 2', 2);

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
(1, 'truong', '123', '\'\'', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dieuchuyen`
--
ALTER TABLE `dieuchuyen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lop_id` (`lop_id`);

--
-- Indexes for table `hocsinh`
--
ALTER TABLE `hocsinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lop_id` (`lop_id`);

--
-- Indexes for table `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thannhan`
--
ALTER TABLE `thannhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hocsinh_id` (`hocsinh_id`);

--
-- Indexes for table `tongketnam`
--
ALTER TABLE `tongketnam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hocsinh_id` (`hocsinh_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lop`
--
ALTER TABLE `lop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `thannhan`
--
ALTER TABLE `thannhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tongketnam`
--
ALTER TABLE `tongketnam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dieuchuyen`
--
ALTER TABLE `dieuchuyen`
  ADD CONSTRAINT `dieuchuyen_ibfk_1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`id`);

--
-- Constraints for table `hocsinh`
--
ALTER TABLE `hocsinh`
  ADD CONSTRAINT `hocsinh_ibfk_1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`id`);

--
-- Constraints for table `thannhan`
--
ALTER TABLE `thannhan`
  ADD CONSTRAINT `thannhan_ibfk_1` FOREIGN KEY (`hocsinh_id`) REFERENCES `hocsinh` (`id`);

--
-- Constraints for table `tongketnam`
--
ALTER TABLE `tongketnam`
  ADD CONSTRAINT `tongketnam_ibfk_1` FOREIGN KEY (`hocsinh_id`) REFERENCES `hocsinh` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
