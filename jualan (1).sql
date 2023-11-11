-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2023 at 04:42 AM
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
-- Database: `jualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` varchar(3) NOT NULL,
  `nama_barang` varchar(80) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga`) VALUES
('A01', 'naruto', 20000.00),
('A02', 'chitato', 40000.00),
('A03', 'batagorku', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(3) NOT NULL,
  `nama` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama`) VALUES
('001', 'adi'),
('002', 'dian'),
('003', 'dadi');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_jual` varchar(4) NOT NULL,
  `id_barang` varchar(3) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_jual`, `id_barang`, `qty`) VALUES
('j001', 'A01', 1),
('j002', 'A02', 2),
('j003', 'A03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `id` varchar(4) NOT NULL DEFAULT 'j001',
  `tgl_jual` date DEFAULT NULL,
  `id_customer` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan_barang`
--

INSERT INTO `penjualan_barang` (`id`, `tgl_jual`, `id_customer`) VALUES
('j001', '2023-11-01', '001'),
('j002', '2023-11-01', '002'),
('j003', '2023-11-03', '003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id_jual`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_jual`) REFERENCES `penjualan_barang` (`id`),
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`);

--
-- Constraints for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
