-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2020 at 06:38 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `kodeakun` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`kodeakun`, `nama`) VALUES
('1800060', 'Biaya admin bank');

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `idpeminjam` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`idpeminjam`, `nama`, `telepon`) VALUES
('alvien.chandra01@gmail.com', 'alvienchandra', '123123'),
('alvien@sawitindo.com', 'alvien', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `id` varchar(1) NOT NULL,
  `saldo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id`, `saldo`) VALUES
('1', 4800000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` varchar(12) NOT NULL,
  `kodeakun` varchar(20) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `kredit` int(1) NOT NULL,
  `statustrans` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `kodeakun`, `peminjam`, `jumlah`, `keterangan`, `kredit`, `statustrans`) VALUES
('200700707070', '1101010', 'alvien@sawitindo.com', 900000, 'asd', 0, 0),
('200700707071', '1101010', 'alvien@sawitindo.com', 800000, 'asd', 0, 0),
('200700707072', '1101010', 'alvien@sawitindo.com', 100000, 'asd', 0, 0),
('200803232419', '1800060', 'alvien@sawitindo.com', 500000, '1', 1, 0),
('200803232715', '1800060', 'alvien@sawitindo.com', 500000, '1', 1, 0),
('200805231104', '1101010', '--Pengisian Saldo--', 100000, '', 0, 0),
('200805231113', '1101010', '--Pengisian Saldo--', 800000, '', 0, 0),
('200805231159', '1800060', 'alvien@sawitindo.com', 2500000, '00', 1, 0),
('200805231704', '1101010', '--Pengisian Saldo--', 2500000, '', 0, 0),
('200806000618', '1101010', '--Pengisian Saldo--', 1900000, '', 0, 0),
('200806000647', '1800060', 'alvien@sawitindo.com', 80000, '800000', 1, 0),
('200806000756', '1800060', 'alvien@sawitindo.com', 4500000, '123', 1, 0),
('200806000835', '1101010', '--Pengisian Saldo--', 4500000, '', 0, 0),
('200806000843', '1101010', '--Pengisian Saldo--', 80000, '', 0, 0),
('200806000903', '1800060', 'alvien@sawitindo.com', 4700000, '123', 1, 0),
('200806000920', '1101010', '--Pengisian Saldo--', 4700000, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `saldo` int(15) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nama`, `password`, `saldo`, `status`) VALUES
('admin', ' Admin ', '21232f297a57a5a743894a0e4a801fc3', 1600000, 0),
('asd', 'asd', '7815696ecbf1c96e6894b779456d330e', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kodeakun`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`idpeminjam`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
