-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 06:37 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmingcrowdfunding`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `goal_amount` int(15) NOT NULL,
  `current_amount` int(15) NOT NULL,
  `perks` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `backer_count` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `short_description`, `description`, `goal_amount`, `current_amount`, `perks`, `slug`, `backer_count`, `created_at`, `updated_at`) VALUES
(1, 32, 'Bantu Pertanian Porang Organik Pak Tarno', 'deskripsi singkat bangett heey deskripsi singkat bangett heey', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 65000000, 50000000, 'Dapat goodiebag cantik,Dapat keuntungan 10%,menjadi bagian dari perubahan', 'campaign-satu', '5', '2021-07-31 07:47:30.000000', '2021-08-14 11:31:38.799000'),
(2, 2, 'Campaign 2', 'short description', 'looooooong', 200000000, 0, 'perks satu, perks dua, perks tiga', 'campaign-dua', '0', '2021-07-31 07:47:30.000000', '2021-07-31 07:47:30.000000'),
(31, 2, 'Peternakan untuk Qurban', 'Mari kita berkurban', 'Mari kita berkurban untuk idul adha tahun depan', 100000000, 0, 'keuntungan dapat sapi limosin, harga murah, berkah', 'peternakan-untuk-qurban-2', '0', '2021-08-04 17:53:30.380000', '2021-08-04 17:53:30.380000'),
(35, 1, 'Bantu Pertanian Organik pak tarno', 'Pertanian organik pak lurah desa Cipayung Girang', 'Organic farming is an agricultural system that uses fertilizers of organic origin such as compost manure, green manure, and bone meal and places emphasis on techniques such as crop rotation and companion planting. It originated early in the 20th century in reaction to rapidly changing farming practices.', 65000000, 0, 'mendapatkan 10% keuntungan panen,menjadi bagian dari kesuksesan panen pertanian organik', 'bantu-pertanian-organik-pak-lurah-1', '0', '2021-08-13 17:50:15.049000', '2021-08-14 00:06:20.618000');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_images`
--

CREATE TABLE `campaign_images` (
  `id` int(10) NOT NULL,
  `campaign_id` int(10) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `is_primary` tinyint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaign_images`
--

INSERT INTO `campaign_images` (`id`, `campaign_id`, `file_name`, `is_primary`, `created_at`, `updated_at`) VALUES
(39, 1, 'images/32-mahkamah_agung.jpg', 0, '2021-08-13 19:28:36.004000', '2021-08-13 19:37:14.218000'),
(40, 1, 'images/32-btpn_syariah.jpg', 0, '2021-08-13 19:29:01.673000', '2021-08-13 19:37:14.218000'),
(41, 1, 'images/32-pupr.jpg', 0, '2021-08-13 19:36:03.382000', '2021-08-13 19:37:14.218000'),
(42, 1, 'images/32-bimtek.jpg', 1, '2021-08-13 19:37:14.284000', '2021-08-13 19:37:14.284000'),
(43, 2, 'images/2-merci.jpg', 0, '2021-08-13 20:26:20.845000', '2021-08-13 20:26:35.154000'),
(44, 2, 'images/2-pupr.jpg', 0, '2021-08-13 20:26:27.990000', '2021-08-13 20:26:35.154000'),
(45, 2, 'images/2-vivo_gas_station.jpg', 1, '2021-08-13 20:26:35.212000', '2021-08-13 20:26:35.212000'),
(46, 31, 'images/2-mahkamah_agung.jpg', 0, '2021-08-13 20:28:51.933000', '2021-08-13 20:29:04.367000'),
(47, 31, 'images/2-mens_republic.jpg', 0, '2021-08-13 20:28:57.860000', '2021-08-13 20:29:04.367000'),
(48, 31, 'images/2-btpn_syariah.jpg', 1, '2021-08-13 20:29:04.495000', '2021-08-13 20:29:04.495000'),
(49, 35, 'images/1-pupr_goodie.jpg', 0, '2021-08-13 20:29:53.091000', '2021-08-13 20:29:58.104000'),
(50, 35, 'images/1-bimtek.jpg', 1, '2021-08-13 20:29:58.151000', '2021-08-13 20:29:58.151000');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) NOT NULL,
  `campaign_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `amount` int(20) NOT NULL,
  `status` varchar(15) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `payment_url` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `campaign_id`, `user_id`, `amount`, `status`, `code`, `payment_url`, `created_at`, `updated_at`) VALUES
(30, 30, 32, 345, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/cb385881-a8e1-4ccf-b7ec-f364e59c64b7', '2021-08-13 00:00:00.000000', '2021-08-13 13:28:13.619000'),
(31, 30, 32, 23424, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/6d7794b8-ddc2-4d51-bbfa-41a73ea47260', '2021-08-13 00:00:00.000000', '2021-08-13 13:28:48.315000'),
(32, 30, 32, 345345, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/0558cde5-5e23-463b-9d31-fe50e74a0582', '2021-08-13 00:00:00.000000', '2021-08-13 13:47:40.040000'),
(33, 1, 32, 1200000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/9e66feb5-b637-4a4e-9236-210013ee12ea', '2021-08-13 15:05:42.856000', '2021-08-13 15:05:43.468000'),
(34, 2, 32, 123123, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/6f01e706-6b1a-4459-b2f7-c1f106b6f493', '2021-08-13 15:10:26.603000', '2021-08-13 15:10:26.918000'),
(35, 2, 32, 4800000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/22f15111-3a5b-4e6c-8083-04390c052182', '2021-08-13 15:12:00.618000', '2021-08-13 15:12:00.935000'),
(36, 1, 1, 4000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/328b4ae0-f5c1-4bd1-bd21-5525453ad5a3', '2021-08-13 17:46:54.504000', '2021-08-13 17:46:55.340000'),
(37, 1, 32, 3445, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/84cff6da-7f57-4f1e-9177-9886642f2c56', '2021-08-13 19:43:10.049000', '2021-08-13 19:43:10.815000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `occupation` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password_hash` char(60) NOT NULL,
  `avatar_file_name` varchar(40) NOT NULL,
  `role` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `occupation`, `email`, `password_hash`, `avatar_file_name`, `role`, `created_at`, `updated_at`) VALUES
(1, 'dian', 'CMO', 'dian@gmail.com', '$2a$04$kSYIx2zBs59VmJd6g3NVaOCdA1NgFGRXr4cFwitTR2YFmTY1COJoq', 'images/26-Foto CV NEW.jpeg', 'user', '2021-07-29 16:30:33.915000', '2021-07-31 06:47:53.092000'),
(2, 'odon', 'CEO', 'odon@gmail.com', '$2a$04$gU7jaqYgfN0Mf7KoCNpASul9uCb5HtSkADxFsB.fzZAx7vMAl1COS', 'images/27-mens_republic.jpg', 'user', '2021-07-29 16:37:35.149000', '2021-08-02 14:49:35.660000'),
(3, 'test jwt', 'Architect', 'jwt@gmail.com', '$2a$04$..pMSBNAP/1lDMl4wiKGwufg0U85.9PE4yEwGMDbsNcccAsSmHCPu', '', 'user', '2021-07-30 22:37:01.946000', '2021-07-30 22:37:01.946000'),
(29, 'test jwt', 'Architect', 'jwt@gmail.com', '$2a$04$BLGAtFZYpWnwZVr98mfIguprIWok8EPA4xfzLxU7ZVvStl1zGtHNu', '', 'user', '2021-08-11 15:29:28.399000', '2021-08-11 15:29:28.399000'),
(30, 'Julia Keeva', 'Product Designer', 'julia@bwa.com', '$2a$04$ist3PWU5tWE1V.PZpXivcuPdBmrnn40j65EfUg1pplnz5jOV7TvGy', '', 'user', '2021-08-11 15:54:54.305000', '2021-08-11 15:54:54.305000'),
(31, 'Julia Keeva', 'Product Designer', 'julia@bwa.com', '$2a$04$.i7IS/qDqjDPuFefxtt/yOHizAFJJ2uklc4g64Idi8MLJw2Ltbz7m', '', 'user', '2021-08-11 15:55:26.973000', '2021-08-11 15:55:26.973000'),
(32, 'themordhon', 'programmer', 'themordhon@gmail.com', '$2a$04$u1H5S0P7JTX4fGEPBePgEeTJvvGrX7kXSO44K1U8vQhfi9yvfkevW', 'images/32-customer4.png', 'user', '2021-08-12 14:00:51.203000', '2021-08-13 10:26:21.961000'),
(33, 'Umar Ghazi Alfatih', 'Petani', 'umarghaz@gmail.com', '$2a$04$tecshX4VzPbiLqwM458Br.e4vf3E4HBup9fSH2SGgirxs83mj8eL.', 'images/33-customer2.png', 'user', '2021-08-12 19:40:57.407000', '2021-08-12 19:41:46.781000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_images`
--
ALTER TABLE `campaign_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `campaign_images`
--
ALTER TABLE `campaign_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
