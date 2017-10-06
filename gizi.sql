-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2017 at 12:57 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gizi`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(4) NOT NULL,
  `x` int(4) NOT NULL,
  `y` int(4) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `x`, `y`, `status`) VALUES
(1, 4, 53, '1'),
(2, 5, 63, '1'),
(3, 10, 59, '1'),
(4, 9, 77, '1'),
(5, 13, 49, '1'),
(6, 13, 69, '1'),
(7, 12, 88, '1'),
(8, 15, 75, '1'),
(9, 18, 61, '1'),
(10, 19, 65, '1'),
(11, 22, 74, '1'),
(12, 27, 72, '1'),
(13, 28, 76, '1'),
(14, 24, 58, '1'),
(15, 27, 55, '1'),
(16, 28, 60, '1'),
(21, 28, 147, '3'),
(22, 32, 149, '3'),
(23, 35, 153, '3'),
(24, 33, 154, '3'),
(25, 38, 151, '3'),
(26, 41, 150, '3'),
(27, 38, 145, '3'),
(28, 38, 143, '3'),
(29, 32, 143, '3'),
(30, 34, 141, '3'),
(31, 44, 156, '3'),
(32, 44, 149, '3'),
(33, 44, 143, '3'),
(34, 46, 142, '3'),
(35, 47, 149, '3'),
(36, 49, 152, '3'),
(37, 50, 142, '3'),
(38, 53, 144, '3'),
(39, 52, 152, '3'),
(44, 86, 132, '2'),
(45, 85, 115, '2'),
(46, 85, 96, '2'),
(47, 78, 94, '2'),
(48, 74, 96, '2'),
(49, 97, 122, '2'),
(50, 98, 116, '2'),
(51, 98, 124, '2'),
(52, 99, 119, '2'),
(53, 99, 128, '2'),
(54, 101, 115, '2'),
(55, 108, 111, '2'),
(56, 110, 111, '2'),
(57, 108, 116, '2'),
(58, 111, 126, '2'),
(61, 70, 4, '4'),
(62, 77, 12, '4'),
(63, 83, 21, '4'),
(64, 61, 15, '4'),
(65, 69, 15, '4'),
(66, 78, 16, '4'),
(67, 66, 18, '4'),
(68, 58, 13, '4'),
(69, 64, 20, '4'),
(70, 69, 21, '4'),
(71, 66, 23, '4'),
(72, 61, 25, '4');

-- --------------------------------------------------------

--
-- Table structure for table `sementara`
--

CREATE TABLE `sementara` (
  `id` int(4) NOT NULL,
  `x` int(4) NOT NULL,
  `y` int(4) NOT NULL,
  `status` varchar(20) NOT NULL,
  `jarak` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sementara`
--

INSERT INTO `sementara` (`id`, `x`, `y`, `status`, `jarak`) VALUES
(61, 70, 4, '4', 62.482),
(62, 77, 12, '4', 61.7171),
(61, 70, 4, '4', 132.378),
(62, 77, 12, '4', 125.16);

-- --------------------------------------------------------

--
-- Table structure for table `urut`
--

CREATE TABLE `urut` (
  `id` int(4) NOT NULL,
  `x` int(4) NOT NULL,
  `y` int(4) NOT NULL,
  `status` varchar(20) NOT NULL,
  `jarak` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
