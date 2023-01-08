-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 04:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pooltech_cab`
--

-- --------------------------------------------------------

--
-- Table structure for table `corporates`
--

CREATE TABLE `corporates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `device_type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `corporates`
--

INSERT INTO `corporates` (`id`, `name`, `profile`, `email`, `country_code`, `mobile_number`, `vat_number`, `password`, `remember_token`, `status`, `device_type`, `device_id`, `language`, `address`, `city`, `state`, `country`, `postal_code`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test corporate', '', 'waqasayubawan123@gmail.com', '92', '03075004113', NULL, '12345678', NULL, 'Pending', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, '2023-01-07 04:50:22', '2023-01-07 04:50:22', NULL),
(2, 'test corporate', '', 'testcorporate@gmail.com', '93', '03075004113', NULL, '12345678', NULL, 'Pending', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, '2023-01-07 04:50:46', '2023-01-07 04:50:46', NULL),
(3, 'test corporate', '', 'testcorporate123@gmail.com', '93', '03075004123', NULL, '12345678', NULL, 'Pending', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, '2023-01-07 04:56:46', '2023-01-07 04:56:46', NULL),
(4, 'test corporate', '', 'testcorporate4123@gmail.com', '93', '030750044123', NULL, '$2y$10$mTYLEMZ/IaunDtZcQlRQfe4obTsKgYMTljotyQnUbzW8M1VRigLsm', NULL, 'Pending', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, '2023-01-07 05:02:21', '2023-01-07 05:02:21', NULL),
(5, 'test', '', 'waqasayubawan12233@gmail.com', '92', '2342323', NULL, '$2y$10$0y7mZX/YqESXsOigWEmBauPpI7SiLdaqRaSQsNaTuUxUQBmupAYDS', NULL, 'Active', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, '2023-01-07 05:04:58', '2023-01-07 05:04:58', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corporates`
--
ALTER TABLE `corporates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `corporates_country_id_foreign` (`country_id`),
  ADD KEY `corporates_status_index` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corporates`
--
ALTER TABLE `corporates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `corporates`
--
ALTER TABLE `corporates`
  ADD CONSTRAINT `corporates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
