-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 08:19 PM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `country_code`, `country_id`, `mobile_number`, `remember_token`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pooladmin', 'admin@poolus.com', '$2y$10$MmmQUFoYreVs5fQRoofWBeMpJH.qc4hP5CSztw9v5/g0.YnXvHKwe', '254', 110, '0722000000', NULL, 'Active', '2022-09-10 05:17:11', '2022-09-23 11:45:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_credentials`
--

CREATE TABLE `api_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_credentials`
--

INSERT INTO `api_credentials` (`id`, `name`, `value`, `site`) VALUES
(1, 'key', 'AIzaSyDx5iv1bzXNf6RrJiGQ97GTz7izXXhKvkQ', 'GoogleMap'),
(2, 'server_key', 'AIzaSyDx5iv1bzXNf6RrJiGQ97GTz7izXXhKvkQ', 'GoogleMap'),
(3, 'sid', 'ACf64f4d6b2a55e6c56b592b6dec3919ae', 'Twillo'),
(4, 'token', 'bc882b0e7159ab5cb0945c3fc59b345a', 'Twillo'),
(5, 'service_sid', 'ACf64f5d6b2a55e7c56b592b6dec3919ae', 'Twillo'),
(6, 'from', '+15594238858', 'Twillo'),
(7, 'server_key', 'AAAABarcTo4:APA91bHwiSxBc0X2w14BYNwOCQfOcio_LgsH4gf9ixqH9HY7niQbrhoVvRXxpT38enqKvBOYwFT8esKV6cCYnlbnViCtaPM4Xi7tQYSWrYItP6Ib0lHU3oXDzxKYYcW8N2TeY89paHg9', 'FCM'),
(8, 'sender_id', '24341401230', 'FCM'),
(9, 'client_id', '1105658852897547', 'Facebook'),
(10, 'client_secret', '65c4d6d3dc2ba3471297c17585a60aff', 'Facebook'),
(11, 'client_id', '409945005762-u4dmgprr97dnp7t2c7b52us660mmdv57.apps.googleusercontent.com', 'Google'),
(12, 'client_secret', 'xlMKt8ULNXaYtGA-Mf6nq0rz', 'Google'),
(13, 'sinch_key', '55992d18-0a40-44b9-8cf6-456f729031e7', 'Sinch'),
(14, 'sinch_secret_key', 'yx4js89/Y0KxBNHwJWv+3w==', 'Sinch'),
(15, 'service_id', 'com.poolus.tech.clientid', 'Apple'),
(16, 'team_id', 'W89HL6566S', 'Apple'),
(17, 'key_id', 'C3M97888J3', 'Apple'),
(18, 'key_file', '/public/key.txt', 'Apple'),
(19, 'database_url', 'https://pooltech-362308-default-rtdb.firebaseio.com', 'Firebase'),
(20, 'service_account', '/resources/credentials//service_account.json', 'Firebase'),
(21, 'site_key', '6LfJKvoUAAAAAFe8tYNw85mY5Tur-_A4tp865bL3', 'Recaptcha'),
(22, 'secret_key', '6LfJKvoUAAAAABh-36UFZrtp-_bZEtdgcg0kwWhy', 'Recaptcha');

-- --------------------------------------------------------

--
-- Table structure for table `applied_referrals`
--

CREATE TABLE `applied_referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE `app_version` (
  `id` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` tinyint(4) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  `force_update` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancel`
--

CREATE TABLE `cancel` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cancel_reason_id` int(10) UNSIGNED NOT NULL,
  `cancel_comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancelled_by` enum('Rider','Driver') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancel_reasons`
--

CREATE TABLE `cancel_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancelled_by` enum('Rider','Driver','Admin','Company') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancel_reasons`
--

INSERT INTO `cancel_reasons` (`id`, `reason`, `cancelled_by`, `status`) VALUES
(1, 'Driver Not Available', 'Rider', 'Active'),
(2, 'Driver did not respond proper', 'Rider', 'Inactive'),
(3, 'Wrong Route', 'Rider', 'Active'),
(4, 'Rider Not Available', 'Driver', 'Active'),
(5, 'Rider not respond proper', 'Driver', 'Active'),
(6, 'Rider not yet come', 'Driver', 'Active'),
(7, 'Rider ask for Cancel', 'Admin', 'Active'),
(8, 'Other Reasons', 'Admin', 'Active'),
(9, 'Rider Cancelled', 'Company', 'Active'),
(10, 'Driver asked', 'Admin', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_reason_translations`
--

CREATE TABLE `cancel_reason_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `cancel_reason_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `car_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_pool` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`id`, `car_name`, `description`, `vehicle_image`, `active_image`, `is_pool`, `status`) VALUES
(1, 'Pool Micro', 'Pool Micro', 'GoferGo.png', 'GoferGo_blue.png', 'No', 'Active'),
(2, 'Pool Mini', 'Pool Mini', 'GoferX.png', 'GoferX_Blue.png', 'No', 'Active'),
(3, 'Pool Lite', 'Pool Lite', 'GoferXL.png', 'GoferXL_Blue.png', 'No', 'Active'),
(4, 'Pool', 'Pool', 'Goferpool_black.png', 'Goferpool.png', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
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
  `company_commission` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `profile`, `email`, `country_code`, `mobile_number`, `vat_number`, `password`, `remember_token`, `status`, `device_type`, `device_id`, `language`, `address`, `city`, `state`, `country`, `postal_code`, `company_commission`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pool', '', 'company@poolus.com', '254', '0722000000', NULL, '$2y$10$hfMDQWzxTIfjdXzbcZH8se/5/nxMjJbULLcx0F1oENLzkzk0WStzK', NULL, 'Active', NULL, '', '', 'Moi Avenue', 'Nairobi', NULL, '254', '00200', '', 110, '2016-04-17 00:00:00', '2022-09-12 11:50:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_documents`
--

CREATE TABLE `company_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date DEFAULT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_payout_credentials`
--

CREATE TABLE `company_payout_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `preference_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payout_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_payout_preference`
--

CREATE TABLE `company_payout_preference` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routing_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_type` enum('Individual','Company') COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_document_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_document_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_kanji` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn_last_4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `corporate`
--

CREATE TABLE `corporate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `corporate`
--

INSERT INTO `corporate` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '324234', '2022-12-29 06:07:48', '2022-12-29 06:07:48'),
(2, 'Seven Kocepy', '2022-12-29 06:12:13', '2022-12-29 06:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) UNSIGNED NOT NULL,
  `short_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_country` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `short_name`, `long_name`, `iso3`, `num_code`, `phone_code`, `stripe_country`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', '4', '93', 'No'),
(2, 'AL', 'Albania', 'ALB', '8', '355', 'No'),
(3, 'DZ', 'Algeria', 'DZA', '12', '213', 'No'),
(4, 'AS', 'American Samoa', 'ASM', '16', '1', 'No'),
(5, 'AD', 'Andorra', 'AND', '20', '376', 'No'),
(6, 'AO', 'Angola', 'AGO', '24', '244', 'No'),
(7, 'AI', 'Anguilla', 'AIA', '660', '1', 'No'),
(8, 'AQ', 'Antarctica', NULL, NULL, '0', 'No'),
(9, 'AG', 'Antigua and Barbuda', 'ATG', '28', '1', 'No'),
(10, 'AR', 'Argentina', 'ARG', '32', '54', 'No'),
(11, 'AM', 'Armenia', 'ARM', '51', '374', 'No'),
(12, 'AW', 'Aruba', 'ABW', '533', '297', 'No'),
(13, 'AU', 'Australia', 'AUS', '36', '61', 'Yes'),
(14, 'AT', 'Austria', 'AUT', '40', '43', 'Yes'),
(15, 'AZ', 'Azerbaijan', 'AZE', '31', '994', 'No'),
(16, 'BS', 'Bahamas', 'BHS', '44', '1', 'No'),
(17, 'BH', 'Bahrain', 'BHR', '48', '973', 'No'),
(18, 'BD', 'Bangladesh', 'BGD', '50', '880', 'No'),
(19, 'BB', 'Barbados', 'BRB', '52', '1', 'No'),
(20, 'BY', 'Belarus', 'BLR', '112', '375', 'No'),
(21, 'BE', 'Belgium', 'BEL', '56', '32', 'Yes'),
(22, 'BZ', 'Belize', 'BLZ', '84', '501', 'No'),
(23, 'BJ', 'Benin', 'BEN', '204', '229', 'No'),
(24, 'BM', 'Bermuda', 'BMU', '60', '1', 'No'),
(25, 'BT', 'Bhutan', 'BTN', '64', '975', 'No'),
(26, 'BO', 'Bolivia', 'BOL', '68', '591', 'No'),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', '70', '387', 'No'),
(28, 'BW', 'Botswana', 'BWA', '72', '267', 'No'),
(29, 'BV', 'Bouvet Island', NULL, NULL, '0', 'No'),
(30, 'BR', 'Brazil', 'BRA', '76', '55', 'No'),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL, '246', 'No'),
(32, 'BN', 'Brunei Darussalam', 'BRN', '96', '673', 'No'),
(33, 'BG', 'Bulgaria', 'BGR', '100', '359', 'No'),
(34, 'BF', 'Burkina Faso', 'BFA', '854', '226', 'No'),
(35, 'BI', 'Burundi', 'BDI', '108', '257', 'No'),
(36, 'KH', 'Cambodia', 'KHM', '116', '855', 'No'),
(37, 'CM', 'Cameroon', 'CMR', '120', '237', 'No'),
(38, 'CA', 'Canada', 'CAN', '124', '1', 'Yes'),
(39, 'CV', 'Cape Verde', 'CPV', '132', '238', 'No'),
(40, 'KY', 'Cayman Islands', 'CYM', '136', '1', 'No'),
(41, 'CF', 'Central African Republic', 'CAF', '140', '236', 'No'),
(42, 'TD', 'Chad', 'TCD', '148', '235', 'No'),
(43, 'CL', 'Chile', 'CHL', '152', '56', 'No'),
(44, 'CN', 'China', 'CHN', '156', '86', 'No'),
(45, 'CX', 'Christmas Island', NULL, NULL, '61', 'No'),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, '672', 'No'),
(47, 'CO', 'Colombia', 'COL', '170', '57', 'No'),
(48, 'KM', 'Comoros', 'COM', '174', '269', 'No'),
(49, 'CG', 'Congo', 'COG', '178', '242', 'No'),
(50, 'CD', 'Democratic Republic of the Congo', 'COD', '180', '242', 'No'),
(51, 'CK', 'Cook Islands', 'COK', '184', '682', 'No'),
(52, 'CR', 'Costa Rica', 'CRI', '188', '506', 'No'),
(53, 'CI', 'Cote D\'Ivoire', 'CIV', '384', '225', 'No'),
(54, 'HR', 'Croatia', 'HRV', '191', '385', 'No'),
(55, 'CU', 'Cuba', 'CUB', '192', '53', 'No'),
(56, 'CY', 'Cyprus', 'CYP', '196', '357', 'No'),
(57, 'CZ', 'Czech Republic', 'CZE', '203', '420', 'No'),
(58, 'DK', 'Denmark', 'DNK', '208', '45', 'Yes'),
(59, 'DJ', 'Djibouti', 'DJI', '262', '253', 'No'),
(60, 'DM', 'Dominica', 'DMA', '212', '1', 'No'),
(61, 'DO', 'Dominican Republic', 'DOM', '214', '1', 'No'),
(62, 'EC', 'Ecuador', 'ECU', '218', '593', 'No'),
(63, 'EG', 'Egypt', 'EGY', '818', '20', 'No'),
(64, 'SV', 'El Salvador', 'SLV', '222', '503', 'No'),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', '226', '240', 'No'),
(66, 'ER', 'Eritrea', 'ERI', '232', '291', 'No'),
(67, 'EE', 'Estonia', 'EST', '233', '372', 'No'),
(68, 'ET', 'Ethiopia', 'ETH', '231', '251', 'No'),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', '238', '500', 'No'),
(70, 'FO', 'Faroe Islands', 'FRO', '234', '298', 'No'),
(71, 'FJ', 'Fiji', 'FJI', '242', '679', 'No'),
(72, 'FI', 'Finland', 'FIN', '246', '358', 'Yes'),
(73, 'FR', 'France', 'FRA', '250', '33', 'Yes'),
(74, 'GF', 'French Guiana', 'GUF', '254', '594', 'No'),
(75, 'PF', 'French Polynesia', 'PYF', '258', '689', 'No'),
(76, 'TF', 'French Southern Territories', NULL, NULL, '0', 'No'),
(77, 'GA', 'Gabon', 'GAB', '266', '241', 'No'),
(78, 'GM', 'Gambia', 'GMB', '270', '220', 'No'),
(79, 'GE', 'Georgia', 'GEO', '268', '995', 'No'),
(80, 'DE', 'Germany', 'DEU', '276', '49', 'Yes'),
(81, 'GH', 'Ghana', 'GHA', '288', '233', 'No'),
(82, 'GI', 'Gibraltar', 'GIB', '292', '350', 'No'),
(83, 'GR', 'Greece', 'GRC', '300', '30', 'No'),
(84, 'GL', 'Greenland', 'GRL', '304', '299', 'No'),
(85, 'GD', 'Grenada', 'GRD', '308', '1', 'No'),
(86, 'GP', 'Guadeloupe', 'GLP', '312', '590', 'No'),
(87, 'GU', 'Guam', 'GUM', '316', '1', 'No'),
(88, 'GT', 'Guatemala', 'GTM', '320', '502', 'No'),
(89, 'GN', 'Guinea', 'GIN', '324', '224', 'No'),
(90, 'GW', 'Guinea-Bissau', 'GNB', '624', '245', 'No'),
(91, 'GY', 'Guyana', 'GUY', '328', '592', 'No'),
(92, 'HT', 'Haiti', 'HTI', '332', '509', 'No'),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL, '0', 'No'),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', '336', '39', 'No'),
(95, 'HN', 'Honduras', 'HND', '340', '504', 'No'),
(96, 'HK', 'Hong Kong', 'HKG', '344', '852', 'Yes'),
(97, 'HU', 'Hungary', 'HUN', '348', '36', 'No'),
(98, 'IS', 'Iceland', 'ISL', '352', '354', 'No'),
(99, 'IN', 'India', 'IND', '356', '91', 'No'),
(100, 'ID', 'Indonesia', 'IDN', '360', '62', 'No'),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', '364', '98', 'No'),
(102, 'IQ', 'Iraq', 'IRQ', '368', '964', 'No'),
(103, 'IE', 'Ireland', 'IRL', '372', '353', 'Yes'),
(104, 'IL', 'Israel', 'ISR', '376', '972', 'No'),
(105, 'IT', 'Italy', 'ITA', '380', '39', 'Yes'),
(106, 'JM', 'Jamaica', 'JAM', '388', '1', 'No'),
(107, 'JP', 'Japan', 'JPN', '392', '81', 'Yes'),
(108, 'JO', 'Jordan', 'JOR', '400', '962', 'No'),
(109, 'KZ', 'Kazakhstan', 'KAZ', '398', '7', 'No'),
(110, 'KE', 'Kenya', 'KEN', '404', '254', 'No'),
(111, 'KI', 'Kiribati', 'KIR', '296', '686', 'No'),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', '408', '850', 'No'),
(113, 'KR', 'Korea, Republic of', 'KOR', '410', '82', 'No'),
(114, 'KW', 'Kuwait', 'KWT', '414', '965', 'No'),
(115, 'KG', 'Kyrgyzstan', 'KGZ', '417', '996', 'No'),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', '418', '856', 'No'),
(117, 'LV', 'Latvia', 'LVA', '428', '371', 'No'),
(118, 'LB', 'Lebanon', 'LBN', '422', '961', 'No'),
(119, 'LS', 'Lesotho', 'LSO', '426', '266', 'No'),
(120, 'LR', 'Liberia', 'LBR', '430', '231', 'No'),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', '434', '218', 'No'),
(122, 'LI', 'Liechtenstein', 'LIE', '438', '423', 'No'),
(123, 'LT', 'Lithuania', 'LTU', '440', '370', 'No'),
(124, 'LU', 'Luxembourg', 'LUX', '442', '352', 'Yes'),
(125, 'MO', 'Macao', 'MAC', '446', '853', 'No'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807', '389', 'No'),
(127, 'MG', 'Madagascar', 'MDG', '450', '261', 'No'),
(128, 'MW', 'Malawi', 'MWI', '454', '265', 'No'),
(129, 'MY', 'Malaysia', 'MYS', '458', '60', 'No'),
(130, 'MV', 'Maldives', 'MDV', '462', '960', 'No'),
(131, 'ML', 'Mali', 'MLI', '466', '223', 'No'),
(132, 'MT', 'Malta', 'MLT', '470', '356', 'No'),
(133, 'MH', 'Marshall Islands', 'MHL', '584', '692', 'No'),
(134, 'MQ', 'Martinique', 'MTQ', '474', '596', 'No'),
(135, 'MR', 'Mauritania', 'MRT', '478', '222', 'No'),
(136, 'MU', 'Mauritius', 'MUS', '480', '230', 'No'),
(137, 'YT', 'Mayotte', NULL, NULL, '269', 'No'),
(138, 'MX', 'Mexico', 'MEX', '484', '52', 'No'),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', '583', '691', 'No'),
(140, 'MD', 'Moldova, Republic of', 'MDA', '498', '373', 'No'),
(141, 'MC', 'Monaco', 'MCO', '492', '377', 'No'),
(142, 'MN', 'Mongolia', 'MNG', '496', '976', 'No'),
(143, 'MS', 'Montserrat', 'MSR', '500', '1', 'No'),
(144, 'MA', 'Morocco', 'MAR', '504', '212', 'No'),
(145, 'MZ', 'Mozambique', 'MOZ', '508', '258', 'No'),
(146, 'MM', 'Myanmar', 'MMR', '104', '95', 'No'),
(147, 'NA', 'Namibia', 'NAM', '516', '264', 'No'),
(148, 'NR', 'Nauru', 'NRU', '520', '674', 'No'),
(149, 'NP', 'Nepal', 'NPL', '524', '977', 'No'),
(150, 'NL', 'Netherlands', 'NLD', '528', '31', 'Yes'),
(151, 'AN', 'Netherlands Antilles', 'ANT', '530', '599', 'No'),
(152, 'NC', 'New Caledonia', 'NCL', '540', '687', 'No'),
(153, 'NZ', 'New Zealand', 'NZL', '554', '64', 'Yes'),
(154, 'NI', 'Nicaragua', 'NIC', '558', '505', 'No'),
(155, 'NE', 'Niger', 'NER', '562', '227', 'No'),
(156, 'NG', 'Nigeria', 'NGA', '566', '234', 'No'),
(157, 'NU', 'Niue', 'NIU', '570', '683', 'No'),
(158, 'NF', 'Norfolk Island', 'NFK', '574', '672', 'No'),
(159, 'MP', 'Northern Mariana Islands', 'MNP', '580', '1', 'No'),
(160, 'NO', 'Norway', 'NOR', '578', '47', 'Yes'),
(161, 'OM', 'Oman', 'OMN', '512', '968', 'No'),
(162, 'PK', 'Pakistan', 'PAK', '586', '92', 'No'),
(163, 'PW', 'Palau', 'PLW', '585', '680', 'No'),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL, '970', 'No'),
(165, 'PA', 'Panama', 'PAN', '591', '507', 'No'),
(166, 'PG', 'Papua New Guinea', 'PNG', '598', '675', 'No'),
(167, 'PY', 'Paraguay', 'PRY', '600', '595', 'No'),
(168, 'PE', 'Peru', 'PER', '604', '51', 'No'),
(169, 'PH', 'Philippines', 'PHL', '608', '63', 'No'),
(170, 'PN', 'Pitcairn', 'PCN', '612', '0', 'No'),
(171, 'PL', 'Poland', 'POL', '616', '48', 'No'),
(172, 'PT', 'Portugal', 'PRT', '620', '351', 'Yes'),
(173, 'PR', 'Puerto Rico', 'PRI', '630', '1', 'No'),
(174, 'QA', 'Qatar', 'QAT', '634', '974', 'No'),
(175, 'RE', 'Reunion', 'REU', '638', '262', 'No'),
(176, 'RO', 'Romania', 'ROM', '642', '40', 'No'),
(177, 'RU', 'Russian Federation', 'RUS', '643', '70', 'No'),
(178, 'RW', 'Rwanda', 'RWA', '646', '250', 'No'),
(179, 'SH', 'Saint Helena', 'SHN', '654', '290', 'No'),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', '659', '1', 'No'),
(181, 'LC', 'Saint Lucia', 'LCA', '662', '1', 'No'),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', '666', '508', 'No'),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', '670', '1', 'No'),
(184, 'WS', 'Samoa', 'WSM', '882', '684', 'No'),
(185, 'SM', 'San Marino', 'SMR', '674', '378', 'No'),
(186, 'ST', 'Sao Tome and Principe', 'STP', '678', '239', 'No'),
(187, 'SA', 'Saudi Arabia', 'SAU', '682', '966', 'No'),
(188, 'SN', 'Senegal', 'SEN', '686', '221', 'No'),
(189, 'RS', 'Serbia and Montenegro', NULL, NULL, '381', 'No'),
(190, 'SC', 'Seychelles', 'SYC', '690', '248', 'No'),
(191, 'SL', 'Sierra Leone', 'SLE', '694', '232', 'No'),
(192, 'SG', 'Singapore', 'SGP', '702', '65', 'Yes'),
(193, 'SK', 'Slovakia', 'SVK', '703', '421', 'No'),
(194, 'SI', 'Slovenia', 'SVN', '705', '386', 'No'),
(195, 'SB', 'Solomon Islands', 'SLB', '90', '677', 'No'),
(196, 'SO', 'Somalia', 'SOM', '706', '252', 'No'),
(197, 'ZA', 'South Africa', 'ZAF', '710', '27', 'No'),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL, '0', 'No'),
(199, 'ES', 'Spain', 'ESP', '724', '34', 'Yes'),
(200, 'LK', 'Sri Lanka', 'LKA', '144', '94', 'No'),
(201, 'SD', 'Sudan', 'SDN', '736', '249', 'No'),
(202, 'SS', 'South Sudan', 'SSD', '728', '211', 'No'),
(203, 'SR', 'Suriname', 'SUR', '740', '597', 'No'),
(204, 'SJ', 'Svalbard and Jan Mayen', 'SJM', '744', '47', 'No'),
(205, 'SZ', 'Swaziland', 'SWZ', '748', '268', 'No'),
(206, 'SE', 'Sweden', 'SWE', '752', '46', 'Yes'),
(207, 'CH', 'Switzerland', 'CHE', '756', '41', 'Yes'),
(208, 'SY', 'Syrian Arab Republic', 'SYR', '760', '963', 'No'),
(209, 'TW', 'Taiwan, Province of China', 'TWN', '158', '886', 'No'),
(210, 'TJ', 'Tajikistan', 'TJK', '762', '992', 'No'),
(211, 'TZ', 'Tanzania, United Republic of', 'TZA', '834', '255', 'No'),
(212, 'TH', 'Thailand', 'THA', '764', '66', 'No'),
(213, 'TL', 'Timor-Leste', NULL, NULL, '670', 'No'),
(214, 'TG', 'Togo', 'TGO', '768', '228', 'No'),
(215, 'TK', 'Tokelau', 'TKL', '772', '690', 'No'),
(216, 'TO', 'Tonga', 'TON', '776', '676', 'No'),
(217, 'TT', 'Trinidad and Tobago', 'TTO', '780', '1', 'No'),
(218, 'TN', 'Tunisia', 'TUN', '788', '216', 'No'),
(219, 'TR', 'Turkey', 'TUR', '792', '90', 'No'),
(220, 'TM', 'Turkmenistan', 'TKM', '795', '7370', 'No'),
(221, 'TC', 'Turks and Caicos Islands', 'TCA', '796', '1', 'No'),
(222, 'TV', 'Tuvalu', 'TUV', '798', '688', 'No'),
(223, 'UG', 'Uganda', 'UGA', '800', '256', 'No'),
(224, 'UA', 'Ukraine', 'UKR', '804', '380', 'No'),
(225, 'AE', 'United Arab Emirates', 'ARE', '784', '971', 'No'),
(226, 'GB', 'United Kingdom', 'GBR', '826', '44', 'Yes'),
(227, 'US', 'United States', 'USA', '840', '1', 'Yes'),
(228, 'UM', 'United States Minor Outlying Islands', NULL, NULL, '1', 'No'),
(229, 'UY', 'Uruguay', 'URY', '858', '598', 'No'),
(230, 'UZ', 'Uzbekistan', 'UZB', '860', '998', 'No'),
(231, 'VU', 'Vanuatu', 'VUT', '548', '678', 'No'),
(232, 'VE', 'Venezuela', 'VEN', '862', '58', 'No'),
(233, 'VN', 'Viet Nam', 'VNM', '704', '84', 'No'),
(234, 'VG', 'Virgin Islands, British', 'VGB', '92', '1', 'No'),
(235, 'VI', 'Virgin Islands, U.s.', 'VIR', '850', '1', 'No'),
(236, 'WF', 'Wallis and Futuna', 'WLF', '876', '681', 'No'),
(237, 'EH', 'Western Sahara', 'ESH', '732', '212', 'No'),
(238, 'YE', 'Yemen', 'YEM', '887', '967', 'No'),
(239, 'ZM', 'Zambia', 'ZMB', '894', '260', 'No'),
(240, 'ZW', 'Zimbabwe', 'ZWE', '716', '263', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `default_currency` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_currency` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `rate`, `status`, `default_currency`, `paypal_currency`) VALUES
(1, 'US Dollar', 'USD', '&#36;', '1.00', 'Active', '0', 'Yes'),
(2, 'Pound Sterling', 'GBP', '&pound;', '0.78', 'Active', '0', 'Yes'),
(3, 'Europe', 'EUR', '&euro;', '0.90', 'Active', '0', 'Yes'),
(4, 'Australian Dollar', 'AUD', '&#36;', '1.46', 'Active', '0', 'Yes'),
(5, 'Singapore', 'SGD', '&#36;', '1.36', 'Active', '0', 'Yes'),
(6, 'Swedish Krona', 'SEK', 'kr', '9.65', 'Active', '0', 'Yes'),
(7, 'Danish Krone', 'DKK', 'kr', '6.70', 'Active', '0', 'Yes'),
(8, 'Mexican Peso', 'MXN', '$', '19.12', 'Active', '0', 'Yes'),
(9, 'Brazilian Real', 'BRL', 'R$', '4.12', 'Active', '0', 'Yes'),
(10, 'Malaysian Ringgit', 'MYR', 'RM', '4.19', 'Active', '0', 'Yes'),
(11, 'Philippine Peso', 'PHP', 'P', '51.35', 'Active', '0', 'Yes'),
(12, 'Swiss Franc', 'CHF', '&euro;', '0.99', 'Active', '0', 'Yes'),
(13, 'India', 'INR', '&#x20B9;', '70.99', 'Active', '0', 'Yes'),
(14, 'Argentine Peso', 'ARS', '&#36;', '58.13', 'Active', '0', 'No'),
(15, 'Canadian Dollar', 'CAD', '&#36;', '1.31', 'Active', '0', 'Yes'),
(16, 'Chinese Yuan', 'CNY', '&#165;', '7.07', 'Active', '0', 'No'),
(17, 'Czech Republic Koruna', 'CZK', 'K&#269;', '22.98', 'Active', '0', 'Yes'),
(18, 'Hong Kong Dollar', 'HKD', '&#36;', '7.84', 'Active', '0', 'Yes'),
(19, 'Hungarian Forint', 'HUF', 'Ft', '296.75', 'Active', '0', 'Yes'),
(20, 'Indonesian Rupiah', 'IDR', 'Rp', '14117.00', 'Active', '0', 'No'),
(21, 'Israeli New Sheqel', 'ILS', '&#8362;', '3.54', 'Active', '0', 'Yes'),
(22, 'Japanese Yen', 'JPY', '&#165;', '108.50', 'Active', '0', 'Yes'),
(23, 'South Korean Won', 'KRW', '&#8361;', '1173.91', 'Active', '0', 'No'),
(24, 'Norwegian Krone', 'NOK', 'kr', '9.16', 'Active', '0', 'Yes'),
(25, 'New Zealand Dollar', 'NZD', '&#36;', '1.56', 'Active', '0', 'Yes'),
(26, 'Polish Zloty', 'PLN', 'z&#322;', '3.84', 'Active', '0', 'Yes'),
(27, 'Russian Ruble', 'RUB', 'p', '63.80', 'Active', '0', 'Yes'),
(28, 'Thai Baht', 'THB', '&#3647;', '30.27', 'Active', '0', 'Yes'),
(29, 'Turkish Lira', 'TRY', '&#8378;', '5.79', 'Active', '0', 'No'),
(30, 'New Taiwan Dollar', 'TWD', '&#36;', '30.56', 'Active', '0', 'Yes'),
(31, 'Vietnamese Dong', 'VND', '&#8363;', '23161.61', 'Active', '0', 'No'),
(32, 'South African Rand', 'ZAR', 'R', '14.80', 'Active', '0', 'No'),
(33, 'Ethiopian Birr', 'ETB', 'ETB', '1.00', 'Active', '1', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Driver','Vehicle','Company') COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_on_date` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `required` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `document_name`, `type`, `country_code`, `expire_on_date`, `status`, `required`, `created_at`, `updated_at`) VALUES
(1, 'Driving License', 'Driver', 'all', 'Yes', 'Active', 'optional', '2022-09-12 11:51:08', '2022-10-06 08:28:13'),
(2, 'Passport Photo Size', 'Driver', 'all', 'No', 'Active', 'mandatory', '2022-09-12 11:51:40', '2022-09-12 11:51:40'),
(3, 'Librae', 'Driver', 'all', 'Yes', 'Active', 'mandatory', '2022-09-12 11:52:15', '2022-09-12 16:56:05'),
(4, 'Car Photo Back with plate visible', 'Vehicle', 'all', 'No', 'Active', 'mandatory', '2022-09-12 11:52:55', '2022-09-14 05:58:10'),
(5, 'Car Photo Back', 'Vehicle', 'all', 'No', 'Active', 'mandatory', '2022-09-12 11:53:21', '2022-09-12 11:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `documents_langs`
--

CREATE TABLE `documents_langs` (
  `id` int(10) UNSIGNED NOT NULL,
  `documents_id` int(10) UNSIGNED NOT NULL,
  `document_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_address`
--

CREATE TABLE `driver_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address_line1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_address`
--

INSERT INTO `driver_address` (`id`, `user_id`, `address_line1`, `address_line2`, `city`, `state`, `postal_code`) VALUES
(1, 10001, 'Moi Avenue', '', 'Nairobi', 'Nairobi County', '00200'),
(3, 10005, 'Moi Avenue', 'Address 2', 'Nairobi', 'Nairobi Country', '00200'),
(4, 10007, '', '', 'addis a aba', '', ''),
(5, 10010, '', '', 'Addis Ababa', '', ''),
(6, 10014, '', '', 'Pakistan', '', ''),
(8, 10017, '', '', 'Attock', 'Punjab', ''),
(9, 10018, '23eeqwe', '', '23wqewqeqwewq', 'were', '3233'),
(10, 10019, '', '', 'Attock', 'Punjab', ''),
(11, 10020, '23eeqwe', '', '23wqewqeqwewq', 'were', '3233'),
(12, 10023, '.', '', 'Attock', 'punjab', '23456'),
(13, 10024, '', '', 'Attock', 'Punjab', ''),
(14, 10025, '', '', 'Attock', 'Punjab', ''),
(15, 10027, '', '', 'rawalpindi', '', ''),
(16, 10044, '', '', 'rawalpindi', '', ''),
(17, 10045, '', '', 'rawalpindi', '', ''),
(19, 10047, '', '', 'rawalpindi', '', ''),
(20, 10050, '', '', 'rawalpindi', '', ''),
(21, 10053, '', '', 'rawalpindi', '', ''),
(22, 10072, '', '', 'rawalpindi', '', ''),
(23, 10078, '', '', 'rawalpindi', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `driver_documents`
--

CREATE TABLE `driver_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('Driver','Vehicle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Driver',
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `expired_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_documents`
--

INSERT INTO `driver_documents` (`id`, `type`, `vehicle_id`, `user_id`, `document_id`, `document`, `status`, `expired_date`) VALUES
(1, 'Driver', 0, 10001, '1', 'https://pool.ronelssolutions.co.ke/images/users/10001/driving_license_1662990216.jpg', '1', '2023-06-13'),
(2, 'Driver', 0, 10001, '2', 'https://pool.ronelssolutions.co.ke/images/users/10001/passport_photo_size_1662990216.jpg', '1', NULL),
(3, 'Driver', 0, 10001, '3', 'https://pool.ronelssolutions.co.ke/images/users/10001/covid_19_certificate_1662990216.jpg', '1', NULL),
(4, 'Vehicle', 1, 10001, '4', 'https://pool.ronelssolutions.co.ke/images/vehicle/1/car_photo_front_1662990348.jpg', '1', NULL),
(5, 'Vehicle', 1, 10001, '5', 'https://pool.ronelssolutions.co.ke/images/vehicle/1/car_photo_back_1662990348.jpg', '1', NULL),
(6, 'Driver', 0, 10003, '1', 'https://pool.ronelssolutions.co.ke/images/users/10003/driving_license_1663002019.PNG', '1', '2022-09-13'),
(7, 'Driver', 0, 10003, '2', 'https://pool.ronelssolutions.co.ke/images/users/10003/passport_photo_size_1663002019.jpg', '1', NULL),
(8, 'Driver', 0, 10003, '3', 'https://pool.ronelssolutions.co.ke/images/users/10003/librae_1663002019.PNG', '1', '2022-09-13'),
(9, 'Vehicle', 2, 10005, '4', 'https://poolus.biz/images/users/10005/car_photo_back_with_plate_visible_1663899089.jpg', '1', NULL),
(10, 'Vehicle', 2, 10005, '5', 'https://poolus.biz/images/users/10005/car_photo_back_1663899114.jpg', '1', NULL),
(11, 'Driver', 0, 10005, '1', 'https://poolus.biz/images/users/10005/driving_license_1663899154.jpg', '1', '2023-03-31'),
(12, 'Driver', 0, 10005, '2', 'https://poolus.biz/images/users/10005/passport_photo_size_1663899166.jpg', '1', NULL),
(13, 'Driver', 0, 10005, '3', 'https://poolus.biz/images/users/10005/librae_1663899189.jpg', '1', '2023-04-21'),
(14, 'Driver', 0, 10007, '1', 'https://poolus.biz/images/users/10007/driving_license_1664163551.jpg', '0', '2022-09-30'),
(15, 'Driver', 0, 10007, '2', 'https://poolus.biz/images/users/10007/passport_photo_size_1664163570.jpg', '0', NULL),
(16, 'Driver', 0, 10007, '3', 'https://poolus.biz/images/users/10007/librae_1664163608.jpg', '0', '2022-11-30'),
(17, 'Driver', 0, 10015, '1', 'http://127.0.0.1:8000/images/users/10015/driving_license_1664435335.png', '0', '2022-09-30'),
(18, 'Driver', 0, 10015, '2', 'http://127.0.0.1:8000/images/users/10015/passport_photo_size_1664435335.png', '0', NULL),
(19, 'Driver', 0, 10015, '3', 'http://127.0.0.1:8000/images/users/10015/librae_1664435335.png', '0', '2022-09-30'),
(20, 'Driver', 0, 10018, '1', 'http://127.0.0.1:8000/images/users/10018/driving_license_1664459111.png', '0', '2022-09-30'),
(21, 'Driver', 0, 10018, '2', 'http://127.0.0.1:8000/images/users/10018/passport_photo_size_1664459111.png', '0', NULL),
(22, 'Driver', 0, 10018, '3', 'http://127.0.0.1:8000/images/users/10018/librae_1664459111.png', '0', '2022-10-01'),
(23, 'Vehicle', 7, 10001, '4', 'http://127.0.0.1:8000/images/vehicle/7/car_photo_back_with_plate_visible_1664786796.png', '0', NULL),
(24, 'Vehicle', 7, 10001, '5', 'http://127.0.0.1:8000/images/vehicle/7/car_photo_back_1664786796.png', '0', NULL),
(25, 'Vehicle', 8, 10001, '4', 'http://127.0.0.1:8000/images/vehicle/8/car_photo_back_with_plate_visible_1664786979.png', '0', NULL),
(26, 'Vehicle', 8, 10001, '5', 'http://127.0.0.1:8000/images/vehicle/8/car_photo_back_1664786979.png', '1', NULL),
(27, 'Vehicle', 9, 10001, '4', 'http://127.0.0.1:8000/images/vehicle/9/car_photo_back_with_plate_visible_1664787184.jpeg', '1', NULL),
(28, 'Vehicle', 9, 10001, '5', 'http://127.0.0.1:8000/images/vehicle/9/car_photo_back_1664787184.jpeg', '1', NULL),
(29, 'Driver', 0, 10020, '1', 'http://127.0.0.1:8000/images/users/10020/driving_license_1664866226.jpeg', '1', '2022-10-05'),
(30, 'Driver', 0, 10020, '2', 'http://127.0.0.1:8000/images/users/10020/passport_photo_size_1664866226.jpeg', '1', NULL),
(31, 'Driver', 0, 10020, '3', 'http://127.0.0.1:8000/images/users/10020/librae_1664866226.jpeg', '1', '2022-10-19'),
(32, 'Driver', 0, 10023, '1', 'http://127.0.0.1:8000/images/users/10023/driving_license_1664868063.jpeg', '1', '2022-10-13'),
(33, 'Driver', 0, 10023, '2', 'http://127.0.0.1:8000/images/users/10023/passport_photo_size_1664868063.jpeg', '1', NULL),
(34, 'Driver', 0, 10023, '3', 'http://127.0.0.1:8000/images/users/10023/librae_1664868063.jpeg', '1', '2022-10-20'),
(35, 'Vehicle', 11, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/11/car_photo_back_with_plate_visible_1664977289.jpeg', '1', NULL),
(36, 'Vehicle', 11, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/11/car_photo_back_1664977289.jpeg', '1', NULL),
(37, 'Vehicle', 13, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/13/car_photo_back_with_plate_visible_1664977924.jpeg', '1', NULL),
(38, 'Vehicle', 13, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/13/car_photo_back_1664977924.jpeg', '1', NULL),
(39, 'Vehicle', 14, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/14/car_photo_back_with_plate_visible_1664977977.jpeg', '1', NULL),
(40, 'Vehicle', 14, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/14/car_photo_back_1664977977.jpeg', '1', NULL),
(41, 'Vehicle', 21, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/21/car_photo_back_with_plate_visible_1664978636.jpeg', '1', NULL),
(42, 'Vehicle', 21, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/21/car_photo_back_1664978636.jpeg', '1', NULL),
(43, 'Vehicle', 24, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/24/car_photo_back_with_plate_visible_1664979477.jpeg', '1', NULL),
(44, 'Vehicle', 24, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/24/car_photo_back_1664979477.jpeg', '1', NULL),
(45, 'Vehicle', 26, 10024, '4', 'http://127.0.0.1:8000/images/vehicle/26/car_photo_back_with_plate_visible_1665063980.jpeg', '1', NULL),
(46, 'Vehicle', 26, 10024, '5', 'http://127.0.0.1:8000/images/vehicle/26/car_photo_back_1665063980.jpeg', '1', NULL),
(47, 'Vehicle', 27, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/27/car_photo_back_with_plate_visible_1665254474.jpeg', '0', NULL),
(48, 'Vehicle', 27, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/27/car_photo_back_1665254474.jpeg', '0', NULL),
(49, 'Vehicle', 28, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/28/car_photo_back_with_plate_visible_1665292372.jpeg', '0', NULL),
(50, 'Vehicle', 28, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/28/car_photo_back_1665292372.jpeg', '0', NULL),
(51, 'Vehicle', 29, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/29/car_photo_back_with_plate_visible_1665314872.jpeg', '0', NULL),
(52, 'Vehicle', 29, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/29/car_photo_back_1665314872.jpeg', '0', NULL),
(53, 'Vehicle', 30, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/30/car_photo_back_with_plate_visible_1665322735.jpeg', '0', NULL),
(54, 'Vehicle', 30, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/30/car_photo_back_1665322735.jpeg', '0', NULL),
(55, 'Vehicle', 31, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/31/car_photo_back_with_plate_visible_1665323045.jpeg', '0', NULL),
(56, 'Vehicle', 31, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/31/car_photo_back_1665323045.jpeg', '0', NULL),
(57, 'Vehicle', 32, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/32/car_photo_back_with_plate_visible_1665324366.jpeg', '0', NULL),
(58, 'Vehicle', 32, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/32/car_photo_back_1665324366.jpeg', '0', NULL),
(59, 'Vehicle', 33, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/33/car_photo_back_with_plate_visible_1665331422.jpeg', '0', NULL),
(60, 'Vehicle', 33, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/33/car_photo_back_1665331422.jpeg', '0', NULL),
(61, 'Vehicle', 34, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/34/car_photo_back_with_plate_visible_1665332148.jpeg', '0', NULL),
(62, 'Vehicle', 34, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/34/car_photo_back_1665332148.jpeg', '0', NULL),
(63, 'Vehicle', 35, 10025, '4', 'http://127.0.0.1:8000/images/vehicle/35/car_photo_back_with_plate_visible_1665332251.jpeg', '0', NULL),
(64, 'Vehicle', 35, 10025, '5', 'http://127.0.0.1:8000/images/vehicle/35/car_photo_back_1665332251.jpeg', '0', NULL),
(65, 'Vehicle', 36, 10045, '4', 'http://127.0.0.1:8000/images/vehicle/36/car_photo_back_with_plate_visible_1666166382.png', '1', NULL),
(66, 'Vehicle', 36, 10045, '5', 'http://127.0.0.1:8000/images/vehicle/36/car_photo_back_1666166382.png', '1', NULL),
(67, 'Vehicle', 37, 10050, '4', 'http://127.0.0.1:8000/images/vehicle/37/car_photo_back_with_plate_visible_1666866767.jpeg', '0', NULL),
(68, 'Vehicle', 37, 10050, '5', 'http://127.0.0.1:8000/images/vehicle/37/car_photo_back_1666866767.jpeg', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `pool_trip_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('Online','Offline','Trip','Pool Trip') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Offline',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`id`, `user_id`, `latitude`, `longitude`, `car_id`, `pool_trip_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 10005, '-1.2843415', '36.9442839', 4, NULL, 'Online', '2022-09-23 02:19:51', '2022-09-25 21:03:18'),
(2, 10027, '', '', 1, NULL, 'Offline', '2022-10-13 00:36:43', '2022-10-13 00:36:43'),
(3, 10053, '33.384490', '73.323550', 4, NULL, 'Online', '2022-09-23 02:19:51', '2022-09-25 21:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `driver_owe_amounts`
--

CREATE TABLE `driver_owe_amounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `currency_code` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_owe_amounts`
--

INSERT INTO `driver_owe_amounts` (`id`, `user_id`, `amount`, `currency_code`) VALUES
(1, 10001, '0.00', 'USD'),
(3, 10005, '30.00', 'ETB'),
(4, 10007, '0.00', 'ETB'),
(5, 10010, '0.00', 'ETB'),
(6, 10014, '0.00', 'ETB'),
(8, 10017, '0.00', 'ETB'),
(9, 10018, '0.00', 'ETB'),
(10, 10019, '0.00', 'ETB'),
(11, 10020, '0.00', 'ETB'),
(12, 10021, '0.00', 'ETB'),
(13, 10022, '0.00', 'ETB'),
(14, 10023, '0.00', 'ETB'),
(15, 10024, '0.00', 'ETB'),
(16, 10025, '0.00', 'ETB'),
(17, 10027, '0.00', 'ETB'),
(18, 10044, '0.00', 'ETB'),
(19, 10045, '0.00', 'ETB'),
(21, 10047, '0.00', 'ETB'),
(22, 10050, '0.00', 'ETB'),
(23, 10053, '0.00', 'ETB'),
(24, 10072, '0.00', 'ETB'),
(25, 10078, '0.00', 'ETB');

-- --------------------------------------------------------

--
-- Table structure for table `driver_owe_amount_payments`
--

CREATE TABLE `driver_owe_amount_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `currency_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_payment`
--

CREATE TABLE `driver_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `last_trip_id` int(10) UNSIGNED NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_amount` decimal(7,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `name`, `value`) VALUES
(1, 'driver', 'smtp'),
(2, 'host', 'smtp.gmail.com'),
(3, 'port', '587'),
(4, 'from_address', 'pooltechnology22@gmail.com'),
(5, 'from_name', 'Poolus'),
(6, 'encryption', 'tls'),
(7, 'username', 'pooltechnology22@gmail.com'),
(8, 'password', 'vjbzmmzzxuctgexc'),
(9, 'domain', 'sandboxcc51fc42882e46ccbffd90316d4731e7.mailgun.org'),
(10, 'secret', 'key-3160b23116332e595b861f60d77fa720');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_sos`
--

CREATE TABLE `emergency_sos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergency_sos`
--

INSERT INTO `emergency_sos` (`id`, `user_id`, `name`, `country_code`, `mobile_number`, `country_id`) VALUES
(1, 10006, 'Irene', '254', '0712462858', 110),
(2, 10006, 'Irene 2', '254', '254794328350', 110);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `name`, `value`) VALUES
(1, 'access_fee', '0'),
(2, 'driver_peak_fare', '70'),
(3, 'driver_access_fee', '10'),
(4, 'additional_fee', 'Yes'),
(5, 'additional_rider_fare', '75');

-- --------------------------------------------------------

--
-- Table structure for table `filter_objects`
--

CREATE TABLE `filter_objects` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('vehicle','rider') COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filter_objects`
--

INSERT INTO `filter_objects` (`id`, `type`, `object_id`, `filter_id`, `created_at`, `updated_at`) VALUES
(1, 'rider', 10013, 2, '2022-09-28 15:26:57', '2022-09-28 15:26:57'),
(2, 'rider', 10013, 3, '2022-09-28 15:35:18', '2022-09-28 15:35:18'),
(3, 'vehicle', 7, 2, '2022-10-03 03:46:35', '2022-10-03 03:46:35'),
(4, 'vehicle', 7, 3, '2022-10-03 03:46:35', '2022-10-03 03:46:35'),
(5, 'vehicle', 8, 2, '2022-10-03 03:49:39', '2022-10-03 03:49:39'),
(6, 'vehicle', 8, 3, '2022-10-03 03:49:39', '2022-10-03 03:49:39'),
(7, 'vehicle', 9, 2, '2022-10-03 03:53:04', '2022-10-03 03:53:04'),
(8, 'vehicle', 9, 3, '2022-10-03 03:53:04', '2022-10-03 03:53:04'),
(9, 'vehicle', 10, 2, '2022-10-05 08:27:10', '2022-10-05 08:27:10'),
(10, 'vehicle', 10, 3, '2022-10-05 08:27:10', '2022-10-05 08:27:10'),
(11, 'vehicle', 11, 2, '2022-10-05 08:41:29', '2022-10-05 08:41:29'),
(12, 'vehicle', 11, 3, '2022-10-05 08:41:29', '2022-10-05 08:41:29'),
(13, 'vehicle', 12, 2, '2022-10-05 08:46:13', '2022-10-05 08:46:13'),
(14, 'vehicle', 12, 3, '2022-10-05 08:46:13', '2022-10-05 08:46:13'),
(15, 'vehicle', 13, 2, '2022-10-05 08:52:04', '2022-10-05 08:52:04'),
(16, 'vehicle', 13, 3, '2022-10-05 08:52:04', '2022-10-05 08:52:04'),
(17, 'vehicle', 14, 2, '2022-10-05 08:52:57', '2022-10-05 08:52:57'),
(18, 'vehicle', 14, 3, '2022-10-05 08:52:57', '2022-10-05 08:52:57'),
(19, 'vehicle', 15, 2, '2022-10-05 08:58:50', '2022-10-05 08:58:50'),
(20, 'vehicle', 15, 3, '2022-10-05 08:58:50', '2022-10-05 08:58:50'),
(21, 'vehicle', 16, 2, '2022-10-05 08:59:21', '2022-10-05 08:59:21'),
(22, 'vehicle', 16, 3, '2022-10-05 08:59:21', '2022-10-05 08:59:21'),
(23, 'vehicle', 17, 2, '2022-10-05 08:59:28', '2022-10-05 08:59:28'),
(24, 'vehicle', 17, 3, '2022-10-05 08:59:28', '2022-10-05 08:59:28'),
(25, 'vehicle', 18, 2, '2022-10-05 09:00:17', '2022-10-05 09:00:17'),
(26, 'vehicle', 18, 3, '2022-10-05 09:00:17', '2022-10-05 09:00:17'),
(27, 'vehicle', 19, 2, '2022-10-05 09:02:16', '2022-10-05 09:02:16'),
(28, 'vehicle', 19, 3, '2022-10-05 09:02:16', '2022-10-05 09:02:16'),
(29, 'vehicle', 20, 2, '2022-10-05 09:03:08', '2022-10-05 09:03:08'),
(30, 'vehicle', 20, 3, '2022-10-05 09:03:08', '2022-10-05 09:03:08'),
(31, 'vehicle', 21, 2, '2022-10-05 09:03:56', '2022-10-05 09:03:56'),
(32, 'vehicle', 21, 3, '2022-10-05 09:03:56', '2022-10-05 09:03:56'),
(33, 'vehicle', 22, 2, '2022-10-05 09:06:17', '2022-10-05 09:06:17'),
(34, 'vehicle', 22, 3, '2022-10-05 09:06:17', '2022-10-05 09:06:17'),
(35, 'vehicle', 23, 2, '2022-10-05 09:16:45', '2022-10-05 09:16:45'),
(36, 'vehicle', 23, 3, '2022-10-05 09:16:45', '2022-10-05 09:16:45'),
(37, 'vehicle', 24, 2, '2022-10-05 09:17:57', '2022-10-05 09:17:57'),
(38, 'vehicle', 24, 3, '2022-10-05 09:17:57', '2022-10-05 09:17:57'),
(39, 'vehicle', 25, 2, '2022-10-06 08:40:02', '2022-10-06 08:40:02'),
(40, 'vehicle', 25, 3, '2022-10-06 08:40:03', '2022-10-06 08:40:03'),
(41, 'vehicle', 26, 2, '2022-10-06 08:46:20', '2022-10-06 08:46:20'),
(42, 'vehicle', 26, 3, '2022-10-06 08:46:20', '2022-10-06 08:46:20'),
(45, 'vehicle', 29, 2, '2022-10-09 06:27:52', '2022-10-09 06:27:52'),
(46, 'vehicle', 29, 3, '2022-10-09 06:27:52', '2022-10-09 06:27:52'),
(47, 'vehicle', 30, 2, '2022-10-09 08:38:55', '2022-10-09 08:38:55'),
(48, 'vehicle', 30, 3, '2022-10-09 08:38:55', '2022-10-09 08:38:55'),
(53, 'vehicle', 33, 2, '2022-10-09 09:14:22', '2022-10-09 09:14:22'),
(54, 'vehicle', 33, 3, '2022-10-09 09:14:22', '2022-10-09 09:14:22'),
(55, 'vehicle', 34, 2, '2022-10-09 11:15:48', '2022-10-09 11:15:48'),
(56, 'vehicle', 34, 3, '2022-10-09 11:15:48', '2022-10-09 11:15:48'),
(57, 'vehicle', 35, 2, '2022-10-09 11:17:31', '2022-10-09 11:17:31'),
(58, 'vehicle', 35, 3, '2022-10-09 11:17:31', '2022-10-09 11:17:31'),
(59, 'vehicle', 36, 2, '2022-10-19 05:59:41', '2022-10-19 05:59:41'),
(60, 'vehicle', 36, 3, '2022-10-19 05:59:41', '2022-10-19 05:59:41'),
(61, 'vehicle', 37, 2, '2022-10-27 08:32:46', '2022-10-27 08:32:46'),
(62, 'vehicle', 37, 3, '2022-10-27 08:32:46', '2022-10-27 08:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `filter_options`
--

CREATE TABLE `filter_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filter_options`
--

INSERT INTO `filter_options` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Prefer Female Riders only', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 'Prefer Handicap Accessibility', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(3, 'Prefer Child Seat Accessibility', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 'Prefer Female Drivers only', '2022-09-10 05:17:15', '2022-09-10 05:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `filter_options_translations`
--

CREATE TABLE `filter_options_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `filter_option_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filter_options_translations`
--

INSERT INTO `filter_options_translations` (`id`, `filter_option_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'تفضل الفرسان الإناث فقط', 'ar', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 1, 'Preferir solo mujeres jinetes', 'es', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(3, 1, 'فقط زن سوارکار را ترجیح دهید', 'fa', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 1, 'Prefira apenas mulheres', 'pt', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(5, 2, 'تفضل الوصول للمعاقين', 'ar', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(6, 2, 'Prefiero la accesibilidad para discapacitados', 'es', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(7, 2, 'دسترسی معلولیت را ترجیح دهید', 'fa', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(8, 2, 'Prefira acessibilidade para deficientes', 'pt', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(9, 3, 'تفضل الوصول إلى مقعد الطفل', 'ar', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(10, 3, 'Prefiero la accesibilidad del asiento para niños', 'es', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(11, 3, 'دسترسی صندلی کودک را ترجیح دهید', 'fa', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(12, 3, 'Acessibilidade preferencial para cadeirinha de criança', 'pt', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(13, 4, 'تفضل السائقات الإناث فقط', 'ar', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(14, 4, 'Prefiero solo mujeres conductoras', 'es', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(15, 4, 'فقط رانندگان زن را ترجیح دهید', 'fa', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(16, 4, 'Prefira apenas motoristas', 'pt', '2022-09-10 05:17:15', '2022-09-10 05:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` mediumblob DEFAULT NULL,
  `suggested` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_category`
--

CREATE TABLE `help_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_category_lang`
--

CREATE TABLE `help_category_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_subcategory`
--

CREATE TABLE `help_subcategory` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_sub_category_lang`
--

CREATE TABLE `help_sub_category_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_translations`
--

CREATE TABLE `help_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `help_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `join_us`
--

CREATE TABLE `join_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `join_us`
--

INSERT INTO `join_us` (`id`, `name`, `value`) VALUES
(1, 'facebook', 'https://www.facebook.com/'),
(2, 'google_plus', ''),
(3, 'twitter', 'https://twitter.com'),
(4, 'linkedin', 'https://www.linkedin.com'),
(5, 'pinterest', 'https://in.pinterest.com'),
(6, 'youtube', 'https://www.youtube.com'),
(7, 'instagram', 'https://www.instagram.com'),
(8, 'app_store_rider', 'https://itunes.apple.com/in/app/'),
(9, 'app_store_driver', 'https://itunes.apple.com/in/app'),
(10, 'play_store_rider', 'https://play.google.com/store/apps'),
(11, 'play_store_driver', 'https://play.google.com/store/apps');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `default_language` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `value`, `status`, `default_language`) VALUES
(1, 'English', 'en', 'Active', '1'),
(2, 'Persian', 'fa', 'Active', '0'),
(3, 'Arabic', 'ar', 'Active', '0'),
(4, 'Spanish', 'es', 'Active', '0'),
(5, 'Português', 'pt', 'Active', '0'),
(6, 'Amharic', 'A', 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `coordinates`, `status`) VALUES
(1, 'Nairobi CBD', 'POLYGON((-1.232093 36.705642, -1.149027 36.788039, -1.179920 36.988540, -1.288384 37.025618, -1.376251 36.983046, -1.432539 36.873870, -1.424989 36.737914, -1.349480 36.711821, -1.232093 36.705642 ))', 'Active'),
(2, 'Addis Ababa', 'POLYGON((8.683987 35.229561, 11.431351 35.361397, 12.613318 38.349678, 12.591875 41.272041, 9.530110 41.381905, 7.531096 40.854561, 5.282194 39.843819, 5.960067 34.987862, 8.683987 35.229561 ))', 'Active'),
(3, 'Bole', 'POLYGON((8.984042 38.797416, 8.984424 38.795893, 8.985303 38.795238, 8.984042 38.797416 ))', 'Active'),
(4, 'islamabad', 'POLYGON((33.800440 72.625232, 33.840372 73.174548, 33.599358 73.563189, 33.406977 73.331103, 33.322102 72.877917, 33.350785 72.474170, 33.567324 72.453570, 33.798158 72.489276, 33.800440 72.625232 ))', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `manage_fare`
--

CREATE TABLE `manage_fare` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `base_fare` decimal(5,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `min_fare` decimal(5,2) NOT NULL,
  `per_min` decimal(5,2) NOT NULL,
  `per_km` decimal(5,2) NOT NULL,
  `schedule_fare` decimal(5,2) NOT NULL,
  `schedule_cancel_fare` decimal(5,2) NOT NULL,
  `waiting_time` int(11) DEFAULT NULL,
  `waiting_charge` decimal(5,2) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_peak` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_night` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_fare`
--

INSERT INTO `manage_fare` (`id`, `location_id`, `vehicle_id`, `base_fare`, `capacity`, `min_fare`, `per_min`, `per_km`, `schedule_fare`, `schedule_cancel_fare`, `waiting_time`, `waiting_charge`, `currency_code`, `apply_peak`, `apply_night`) VALUES
(1, 1, 4, '75.00', 3, '100.00', '5.00', '30.00', '5.00', '0.00', 4, '5.00', 'ETB', 'No', 'No'),
(2, 3, 2, '100.00', 3, '70.00', '3.00', '50.00', '150.00', '0.00', 2, '10.00', 'ETB', 'No', 'No'),
(3, 2, 4, '95.00', 4, '100.00', '0.00', '13.00', '100.00', '0.00', 1, '2.00', 'ETB', 'No', 'Yes'),
(4, 4, 4, '12.00', 4, '5.00', '2.00', '2.00', '12.00', '0.00', 10, '12.00', 'ETB', 'No', 'No'),
(5, 4, 2, '12.00', 4, '5.00', '2.00', '2.00', '12.00', '0.00', 10, '12.00', 'ETB', 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `url`, `title`, `description`, `keywords`) VALUES
(1, '/', 'Home Page', 'Home Page', ''),
(2, 'signin', 'Sign In', 'Sign In', ''),
(3, 'signin_driver', 'Sign In Driver', 'Sign In Driver', ''),
(4, 'signin_rider', 'Sign In Rider', 'Sign In Rider', ''),
(5, 'signup', 'Sing Up', 'Sing Up', ''),
(6, 'signup_driver', 'Sign Up Driver', 'Sign Up Driver', ''),
(7, 'signup_rider', 'Sign Up Rider', 'Sign Up Rider', ''),
(8, 'ride', 'Rider Home Page', 'Rider Home Page', ''),
(9, 'drive', 'Driver Home Page', 'Driver Home Page', ''),
(10, 'safety', 'Trip safety', 'Trip safety', ''),
(11, 'how_it_works', 'How its works', 'How its works', ''),
(12, 'requirements', 'Driver requirements', 'Driver requirements', ''),
(13, 'driver_app', 'Driver App', 'Driver App', ''),
(14, 'drive_safety', 'Driver Safety', 'Driver Safety', ''),
(15, 'driver_profile', 'Driver Profile', 'Driver Profile', ''),
(16, 'documents/{id}', 'Driver Documents', 'Driver Documents', ''),
(17, 'driver_payment', 'Driver Payment', 'Driver Payment', ''),
(18, 'driver_invoice', 'Driver Invoice', 'Driver Invoice', ''),
(19, 'driver_trip', 'Driver Trips', 'Driver Trips', ''),
(20, 'driver_trip_detail/{id}', 'Driver Trips Details', 'Driver Trips Details', ''),
(21, 'download_invoice/{id}', 'Invoice', 'Invoice', ''),
(22, 'trip', 'Trips', 'Trips', ''),
(23, 'profile', 'Profile', 'Profile', ''),
(24, 'forgot_password_driver', 'Forgot Password', 'Forgot Password', ''),
(25, 'reset_password', 'Reset Password', 'Reset Password', ''),
(26, 'forgot_password_rider', 'Forgot Password', 'Forgot Password', ''),
(27, 'forgot_password_link/{id}', 'Forgot Password Link', 'Forgot Password Link', ''),
(28, 'payout_preferences', 'Payout Preferences', 'Payout Preferences', ''),
(29, 'help', 'Help Center', 'Help Center', ''),
(30, 'help/topic/{id}/{category}', 'Help Center', 'Help Center', ''),
(31, 'help/article/{id}/{question}', 'Help Center', 'Help Center', ''),
(32, 'signin_company', 'Sign In Company', 'Sign In Company', ''),
(33, 'signup_company', 'Sign Up Company', 'Sign Up Company', ''),
(34, 'forgot_password_company', 'Forgot Password', 'Forgot Password', ''),
(35, 'company/reset_password', 'Reset Password', 'Reset Password', ''),
(36, 'admin', 'Admin Panel', 'Admin Panel', ''),
(37, 'company', 'Company Panel', 'Company Panel', ''),
(38, 'app/driver', 'Diver App', 'Diver App', ''),
(39, 'app/rider', 'Rider App', 'Rider App', '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_08_25_160119_create_country_table', 1),
(2, '2014_10_11_095317_create_companies_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2015_08_17_142217_create_session_table', 1),
(6, '2015_08_23_070159_create_site_settings_table', 1),
(7, '2015_09_24_163220_create_admins_table', 1),
(8, '2016_03_25_173347_create_pages_table', 1),
(9, '2016_03_27_084526_create_join_us_table', 1),
(10, '2016_04_02_160807_create_metas_table', 1),
(11, '2016_05_09_140352_create_help_category_table', 1),
(12, '2016_05_09_140411_create_help_subcategory_table', 1),
(13, '2016_05_09_140500_create_help_table', 1),
(14, '2016_10_13_114638_create_currency_table', 1),
(15, '2017_04_18_070421_create_profile_picture_table', 1),
(16, '2017_04_18_080501_create_driver_documents_table', 1),
(17, '2017_04_24_071834_create_driver_address_table', 1),
(18, '2017_04_24_141629_create_car_type_table', 1),
(19, '2017_04_25_063221_create_driver_location_table', 1),
(20, '2017_04_27_101812_create_request_table', 1),
(21, '2017_05_08_123453_create_toll_reason_table', 1),
(22, '2017_05_09_044810_create_trips_table', 1),
(23, '2017_05_23_060535_create_rider_location_table', 1),
(24, '2017_05_24_092403_create_rating_table', 1),
(25, '2017_05_24_095832_create_cancel_reasons_table', 1),
(26, '2017_05_24_095833_create_cancel_table', 1),
(27, '2017_06_01_130626_create_fees_table', 1),
(28, '2017_06_08_085929_create_api_credentials_table', 1),
(29, '2017_06_08_102833_create_payment_gateway_table', 1),
(30, '2017_06_16_112151_create_payment_table', 1),
(31, '2017_06_16_112152_create_driver_payment_table', 1),
(32, '2017_09_21_115741_create_jobs_table', 1),
(33, '2017_11_12_133719_create_wallet_table', 1),
(34, '2017_11_17_071107_create_promo_code_table', 1),
(35, '2017_11_17_072500_create_users_promo_code_table', 1),
(36, '2018_03_09_193432_create_help_category_lang_table', 1),
(37, '2018_03_09_193447_create_help_sub_category_lang_table', 1),
(38, '2018_04_02_130448_create_language_table', 1),
(39, '2018_05_26_000018_create_payout_preference_table', 1),
(40, '2018_05_26_000020_create_payment_method_table', 1),
(41, '2018_07_13_063641_CreateEmergencySosTable', 1),
(42, '2018_07_13_073129_create_schedule_ride_table', 1),
(43, '2018_07_16_063607_entrust_setup_tables', 1),
(44, '2018_08_08_100000_create_telescope_entries_table', 1),
(45, '2019_01_09_111401_create_locations_table', 1),
(46, '2019_01_09_115510_create_manage_fare_table', 1),
(47, '2019_01_09_120028_create_peak_fare_details_table', 1),
(48, '2019_01_19_062416_create_email_settings_table', 1),
(49, '2019_01_19_132454_create_payout_credentials', 1),
(50, '2019_02_06_055025_create_help_translations_table', 1),
(51, '2019_03_07_131731_create_schedule_cancel_table', 1),
(52, '2019_04_01_100347_create_company_documents_table', 1),
(53, '2019_04_08_125114_create_company_payout_credentials_table', 1),
(54, '2019_04_09_051226_create_company_payout_preference_table', 1),
(55, '2019_04_11_115908_create_vehicle_table', 1),
(56, '2019_06_22_052259_create_referral_settings_table', 1),
(57, '2019_06_22_053324_create_referral_users_table', 1),
(58, '2019_09_24_051053_create_driver_owe_amounts_table', 1),
(59, '2019_09_25_104410_create_driver_owe_amount_payments_table', 1),
(60, '2019_10_18_130612_create_trip_toll_reasons_table', 1),
(61, '2019_10_21_123628_create_applied_referrals_table', 1),
(62, '2020_02_24_070641_create_failed_jobs_table', 1),
(63, '2020_05_28_105123_create_pool_trips_table', 1),
(64, '2020_07_10_061326_create_vehicle_make', 1),
(65, '2020_07_10_090927_create_vehicle_model', 1),
(66, '2020_07_10_135338_create_documents_table', 1),
(67, '2020_07_25_061824_create_documents_langs_table', 1),
(68, '2020_10_20_113351_create_filter_options_table', 1),
(69, '2020_10_22_070142_create_filter_objects_table', 1),
(70, '2020_10_22_123351_create_filter_options_translations', 1),
(71, '2020_11_05_132127_create_supports_table', 1),
(72, '2021_03_11_102950_create_app_version_table', 1),
(73, '2021_05_17_082442_create_cancel_reason_translations_table', 1),
(74, '2021_05_19_044410_create_pages_translations', 1),
(75, '2022_11_18_104043_create_ringtones_table', 2),
(76, '2022_12_29_100846_create_corporate_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `under` enum('company','discover','hosting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `footer`, `under`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Terms of Service', 'terms_of_service', 'yes', '', '<span id=\"docs-internal-guid-f7e67a51-7fff-1c1d-45ae-29ad878ff34a\"><h4 dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size: 24pt; font-family: Arial; color: rgb(0, 0, 0); font-weight: 700; vertical-align: baseline; white-space: pre-wrap;\">Terms </span></h4></span>', 'Active', '2016-03-26 14:50:11', '2022-09-12 13:09:53'),
(2, 'Privacy Policy', 'privacy_policy', 'yes', '', '<h1>Privacy Policy</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><br></p><p></p><p></p>', 'Active', '2016-03-26 16:26:38', '2022-09-12 13:10:22'),
(3, 'About Us', 'about_us', 'yes', '', '&nbsp;&nbsp;&nbsp;<div class=\"text-copy\"><h1 class=\"h2 row-space-4\">About Us</h1><p>&nbsp;&nbsp;</p></div>', 'Active', '2016-03-26 18:22:05', '2022-09-12 13:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `pages_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `correlation_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_payout_status` enum('Pending','Processing','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `driver_payout_status` enum('Pending','Processing','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `trip_id`, `correlation_id`, `admin_transaction_id`, `driver_transaction_id`, `admin_payout_status`, `driver_payout_status`) VALUES
(1, 1, NULL, NULL, NULL, 'Pending', 'Pending'),
(2, 2, NULL, NULL, NULL, 'Pending', 'Pending'),
(3, 3, NULL, NULL, NULL, 'Pending', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway`
--

INSERT INTO `payment_gateway` (`id`, `name`, `value`, `site`) VALUES
(1, 'trip_default', 'cash', 'Common'),
(2, 'payout_methods', 'bank_transfer,paypal,stripe', 'Common'),
(3, 'is_enabled', '1', 'Cash'),
(4, 'is_enabled', '1', 'Paypal'),
(5, 'paypal_id', 'pooltechnology22@gmail.com', 'Paypal'),
(6, 'mode', 'sandbox', 'Paypal'),
(7, 'client', 'AbZqxwGM86-fRHI-HnG_plBoz-Z_j2OgcAKRFQzgdR4qd5dszhQXS5nk6FTPd9sw0vSSLMadISBc2_lA', 'Paypal'),
(8, 'secret', 'EDFYQf8itbqoWi-1BIzgzrNvGWLI62UEliT1i8f_APi_MAJkteZLwnXGmTvBkBIRAVy-jCBi-PmYyNUa', 'Paypal'),
(9, 'access_token', 'access_token$sandbox$d2852qvvw6wj277m$71ad22f88418c3a7f17d824ad0786ffc', 'Paypal'),
(10, 'is_enabled', '1', 'Stripe'),
(11, 'publish', 'pk_test_lQctuc2tx2IVDCSYIjiFodaz01n0TNteiG', 'Stripe'),
(12, 'secret', 'sk_test_1tiewAwj00VlKzL7uwMPZcTN013Vk0kWl6', 'Stripe'),
(13, 'api_version', '2019-12-03', 'Stripe'),
(14, 'is_enabled', '0', 'Braintree'),
(15, 'mode', 'sandbox', 'Braintree'),
(16, 'merchant_id', 'g3dprd7kyfs7f3jr', 'Braintree'),
(17, 'public_key', 'prwd98qgnqkdptkp', 'Braintree'),
(18, 'private_key', 'fe3e98760ba97b6b2e01fe28379cd417', 'Braintree'),
(19, 'tokenization_key', 'sandbox_jy9mwggn_q8v7ynjw9fssn2hy', 'Braintree'),
(20, 'merchant_account_id', '', 'Braintree'),
(21, 'is_web_payment', '', 'Common');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `customer_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intent_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last4` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_credentials`
--

CREATE TABLE `payout_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `preference_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payout_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_credentials`
--

INSERT INTO `payout_credentials` (`id`, `user_id`, `preference_id`, `default`, `type`, `payout_id`, `created_at`, `updated_at`) VALUES
(1, 10001, '1', 'yes', 'BankTransfer', '123456789', '2022-09-12 13:48:00', '2022-09-12 13:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `payout_preference`
--

CREATE TABLE `payout_preference` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routing_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_type` enum('Individual','Company') COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_document_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_document_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_kanji` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn_last_4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_preference`
--

INSERT INTO `payout_preference` (`id`, `user_id`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `payout_method`, `paypal_email`, `currency_code`, `routing_number`, `account_number`, `holder_name`, `holder_type`, `document_id`, `document_image`, `additional_document_id`, `additional_document_image`, `phone_number`, `address_kanji`, `bank_name`, `bank_location`, `branch_name`, `branch_code`, `ssn_last_4`, `created_at`, `updated_at`) VALUES
(1, 10001, 'Development House, Moi Avenue', '', 'Nairobi', 'Nairobi County', '00200', 'KE', 'BankTransfer', '123456789', '', '', '123456789', 'Nelson Juma', 'Company', NULL, NULL, NULL, NULL, '', '[]', 'Prime Bank', 'Nairobi', '', 'KE0001', '', '2022-09-12 13:48:00', '2022-09-12 13:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `peak_fare_details`
--

CREATE TABLE `peak_fare_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `fare_id` int(10) UNSIGNED NOT NULL,
  `type` enum('Peak','Night') COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peak_fare_details`
--

INSERT INTO `peak_fare_details` (`id`, `fare_id`, `type`, `day`, `start_time`, `end_time`, `price`) VALUES
(1, 3, 'Night', NULL, '00:00:00', '06:00:00', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'manage_admin', 'Manage Admin', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 'create_rider', 'Create Rider', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(3, 'view_rider', 'View Rider', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 'update_rider', 'Update Rider', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(5, 'delete_rider', 'Delete Rider', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(6, 'create_driver', 'Create Driver', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(7, 'view_driver', 'View Driver', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(8, 'update_driver', 'Update Driver', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(9, 'delete_driver', 'Delete Driver', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(10, 'create_company', 'Create Company', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(11, 'view_company', 'View Company', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(12, 'update_company', 'Update Company', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(13, 'delete_company', 'Delete Company', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(14, 'manage_vehicle_type', 'Manage Vehicle Type', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(15, 'manage_send_message', 'Manage Send Message', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(16, 'manage_api_credentials', 'Manage Api Credentials', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(17, 'manage_payment_gateway', 'Manage Payment Gateway', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(18, 'manage_site_settings', 'Manage Site Settings', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(19, 'manage_map', 'Manage Map', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(20, 'manage_statements', 'Manage Statements', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(21, 'manage_trips', 'Manage Trips', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(22, 'manage_wallet', 'Manage Wallet', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(23, 'manage_owe_amount', 'Manage Owe Amount', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(24, 'manage_promo_code', 'Manage Promo Code', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(25, 'manage_driver_payments', 'Manage Driver Payments', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(26, 'manage_cancel_trips', 'Manage Cancel Trips', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(27, 'manage_rating', 'Manage Rating', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(28, 'manage_fees', 'Manage Fees', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(29, 'manage_join_us', 'Manage Join Us', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(30, 'manage_requests', 'Manage Requests', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(31, 'manage_currency', 'Manage Currency', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(32, 'manage_static_pages', 'Manage Static Pages', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(33, 'manage_metas', 'Manage Metas', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(34, 'manage_locations', 'Manage Locations', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(35, 'manage_peak_based_fare', 'Manage Peak Based Fare', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(36, 'manage_send_email', 'Manage Send Email', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(37, 'manage_email_settings', 'Manage Email Settings', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(38, 'manage_language', 'Manage Language', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(39, 'manage_help', 'Manage Help', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(40, 'manage_country', 'Manage Country', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(41, 'manage_heat_map', 'Manage Heat Map', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(42, 'manage_manual_booking', 'Manage Manual Booking', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(43, 'manage_company_payment', 'Manage Company Payment', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(44, 'manage_payments', 'Manage Payments', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(45, 'manage_vehicle', 'Manage Vehicle', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(46, 'manage_referral_settings', 'Manage Referral Settings', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(47, 'manage_rider_referrals', 'Manage Rider Referrals', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(48, 'manage_driver_referrals', 'Manage Driver Referrals', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(49, 'create_manage_reason', 'Create Manage Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(50, 'view_manage_reason', 'View Manage Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(51, 'update_manage_reason', 'Update Manage Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(52, 'delete_manage_reason', 'Delete Manage Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(53, 'create_additional_reason', 'Create Additional Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(54, 'view_additional_reason', 'View Additional Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(55, 'update_additional_reason', 'Update Additional Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(56, 'delete_additional_reason', 'Delete Additional Reason', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(57, 'create_vehicle_make', 'Create Vehicle Make', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(58, 'view_vehicle_make', 'View Vehicle Make', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(59, 'update_vehicle_make', 'Update Vehicle Make', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(60, 'delete_vehicle_make', 'Delete Vehicle Make', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(61, 'create_vehicle_model', 'Create Vehicle Model', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(62, 'view_vehicle_model', 'View Vehicle Model', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(63, 'update_vehicle_model', 'Update Vehicle Model', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(64, 'delete_vehicle_model', 'Delete Vehicle Model', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(65, 'create_documents', 'Create Documents', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(66, 'view_documents', 'View Documents', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(67, 'update_documents', 'Update Documents', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(68, 'delete_documents', 'Delete Documents', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(69, 'manage_support', 'Manage Support', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(70, 'manage_mobile_app_version', 'Manage Mobile App Version', NULL, '2022-09-10 05:17:15', '2022-09-10 05:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(8, 4),
(9, 1),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(22, 4),
(23, 1),
(23, 4),
(24, 1),
(24, 4),
(25, 1),
(25, 4),
(26, 1),
(26, 2),
(26, 4),
(27, 1),
(27, 4),
(28, 1),
(28, 4),
(29, 1),
(29, 4),
(30, 1),
(30, 4),
(31, 1),
(31, 4),
(32, 1),
(32, 4),
(33, 1),
(33, 4),
(34, 1),
(34, 4),
(35, 1),
(35, 4),
(36, 1),
(36, 4),
(37, 1),
(37, 4),
(38, 1),
(38, 4),
(39, 1),
(39, 4),
(40, 1),
(40, 4),
(41, 1),
(41, 4),
(42, 1),
(42, 2),
(42, 4),
(43, 1),
(43, 4),
(44, 1),
(44, 4),
(45, 1),
(45, 4),
(46, 1),
(46, 4),
(47, 1),
(47, 4),
(48, 1),
(48, 4),
(49, 1),
(49, 4),
(50, 1),
(50, 4),
(51, 1),
(51, 4),
(52, 1),
(52, 4),
(53, 1),
(53, 4),
(54, 1),
(54, 4),
(55, 1),
(55, 4),
(56, 1),
(56, 4),
(57, 1),
(57, 4),
(58, 1),
(58, 4),
(59, 1),
(59, 4),
(60, 1),
(60, 4),
(61, 1),
(61, 4),
(62, 1),
(62, 4),
(63, 1),
(63, 4),
(64, 1),
(64, 4),
(65, 1),
(65, 4),
(66, 1),
(66, 4),
(67, 1),
(67, 4),
(68, 1),
(68, 4),
(69, 1),
(69, 4),
(70, 1),
(70, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pool_trips`
--

CREATE TABLE `pool_trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `seats` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `pickup_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_time` decimal(7,2) NOT NULL,
  `total_km` decimal(7,2) NOT NULL,
  `time_fare` decimal(11,2) NOT NULL,
  `distance_fare` decimal(11,2) NOT NULL,
  `base_fare` decimal(11,2) NOT NULL,
  `additional_rider_amount` decimal(11,2) NOT NULL,
  `peak_fare` decimal(11,2) NOT NULL,
  `peak_amount` decimal(11,2) NOT NULL,
  `driver_peak_amount` decimal(11,2) NOT NULL,
  `schedule_fare` decimal(11,2) NOT NULL,
  `access_fee` decimal(11,2) NOT NULL,
  `tips` decimal(11,2) NOT NULL DEFAULT 0.00,
  `waiting_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `toll_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `toll_fee` decimal(11,2) NOT NULL DEFAULT 0.00,
  `wallet_amount` decimal(11,2) NOT NULL,
  `promo_amount` decimal(11,2) NOT NULL,
  `subtotal_fare` decimal(11,2) NOT NULL,
  `total_fare` decimal(11,2) NOT NULL,
  `driver_payout` decimal(11,2) NOT NULL,
  `driver_or_company_commission` decimal(11,2) NOT NULL,
  `owe_amount` decimal(11,2) NOT NULL,
  `remaining_owe_amount` decimal(11,2) NOT NULL,
  `applied_owe_amount` decimal(11,2) NOT NULL,
  `arrive_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `begin_trip` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_trip` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_picture`
--

CREATE TABLE `profile_picture` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `src` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_source` enum('Facebook','Google','Local') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_picture`
--

INSERT INTO `profile_picture` (`user_id`, `src`, `photo_source`) VALUES
(10001, 'profile_pic_1662990548.jpg', 'Local'),
(10002, '', 'Local'),
(10004, '', 'Local'),
(10005, 'https://poolus.biz/images/users/10005/profile_pic_1663899712.jpg', 'Local'),
(10006, '', 'Local'),
(10007, '', 'Local'),
(10008, '', 'Local'),
(10009, '', 'Local'),
(10010, '', 'Local'),
(10011, '', 'Local'),
(10014, '', 'Local'),
(10016, '', 'Local'),
(10017, '', 'Local'),
(10018, '', 'Local'),
(10019, '', 'Local'),
(10020, '', 'Local'),
(10023, '', 'Local'),
(10024, '', 'Local'),
(10025, '', 'Local'),
(10026, '', 'Local'),
(10027, '', 'Local'),
(10028, '', 'Local'),
(10044, '', 'Local'),
(10045, '', 'Local'),
(10047, '', 'Local'),
(10050, '', 'Local'),
(10053, '', 'Local'),
(10072, '', 'Local'),
(10078, '', 'Local'),
(10081, '', 'Local'),
(10082, '', 'Local'),
(10083, '', 'Local');

-- --------------------------------------------------------

--
-- Table structure for table `promo_code`
--

CREATE TABLE `promo_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `rider_rating` int(11) NOT NULL,
  `rider_comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_rating` int(11) NOT NULL,
  `driver_comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `trip_id`, `user_id`, `driver_id`, `rider_rating`, `rider_comments`, `driver_rating`, `driver_comments`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10006, 10005, 0, '', 5, 'Good', '2022-09-25 19:07:17', '2022-09-25 19:07:17', NULL),
(2, 2, 10006, 10005, 5, 'Good', 5, 'Good', '2022-09-25 19:49:09', '2022-09-25 19:49:51', NULL),
(3, 3, 10006, 10005, 0, '', 5, 'Good', '2022-09-25 19:52:55', '2022-09-25 19:52:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referral_settings`
--

CREATE TABLE `referral_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('Driver','Rider') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referral_settings`
--

INSERT INTO `referral_settings` (`id`, `name`, `value`, `user_type`) VALUES
(1, 'apply_referral', '1', 'Driver'),
(2, 'number_of_trips', '5', 'Driver'),
(3, 'number_of_days', '3', 'Driver'),
(4, 'currency_code', 'ETB', 'Driver'),
(5, 'referral_amount', '3', 'Driver'),
(6, 'apply_referral', '1', 'Rider'),
(7, 'number_of_trips', '5', 'Rider'),
(8, 'number_of_days', '3', 'Rider'),
(9, 'currency_code', 'USD', 'Rider'),
(10, 'referral_amount', '10', 'Rider');

-- --------------------------------------------------------

--
-- Table structure for table `referral_users`
--

CREATE TABLE `referral_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `referral_id` int(10) UNSIGNED NOT NULL,
  `user_type` enum('Rider','Driver') COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(10) UNSIGNED NOT NULL,
  `trips` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) NOT NULL,
  `pending_amount` decimal(11,2) NOT NULL,
  `payment_status` enum('Pending','Expired','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referral_users`
--

INSERT INTO `referral_users` (`id`, `user_id`, `referral_id`, `user_type`, `days`, `trips`, `start_date`, `end_date`, `currency_code`, `amount`, `pending_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 10018, 10019, 'Driver', 3, 5, '2022-10-03', '2022-10-06', 'ETB', '3.00', '3.00', 'Pending', '2022-10-03 11:44:47', '2022-10-03 11:44:47'),
(2, 10023, 10024, 'Driver', 3, 5, '2022-10-04', '2022-10-07', 'ETB', '3.00', '3.00', 'Pending', '2022-10-04 02:25:22', '2022-10-04 02:25:22'),
(3, 10029, 10030, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:41:25', '2022-10-13 00:41:25'),
(4, 10029, 10031, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:42:04', '2022-10-13 00:42:04'),
(5, 10029, 10032, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:44:16', '2022-10-13 00:44:16'),
(6, 10029, 10033, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:55:57', '2022-10-13 00:55:57'),
(7, 10029, 10034, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:56:13', '2022-10-13 00:56:13'),
(8, 10029, 10035, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:56:26', '2022-10-13 00:56:26'),
(9, 10029, 10036, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:57:00', '2022-10-13 00:57:00'),
(10, 10029, 10037, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:57:37', '2022-10-13 00:57:37'),
(11, 10029, 10038, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:57:52', '2022-10-13 00:57:52'),
(12, 10029, 10039, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:58:11', '2022-10-13 00:58:11'),
(13, 10029, 10040, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:58:24', '2022-10-13 00:58:24'),
(14, 10029, 10041, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 00:59:48', '2022-10-13 00:59:48'),
(15, 10029, 10042, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 01:01:18', '2022-10-13 01:01:18'),
(16, 10029, 10043, 'Rider', 3, 5, '2022-10-13', '2022-10-16', 'USD', '10.00', '10.00', 'Pending', '2022-10-13 01:02:08', '2022-10-13 01:02:08'),
(17, 10029, 10044, 'Rider', 3, 5, '2022-10-16', '2022-10-19', 'USD', '10.00', '10.00', 'Pending', '2022-10-16 17:24:28', '2022-10-16 17:24:28'),
(18, 10029, 10045, 'Rider', 3, 5, '2022-10-16', '2022-10-19', 'USD', '10.00', '10.00', 'Pending', '2022-10-16 18:10:10', '2022-10-16 18:10:10'),
(20, 10029, 10047, 'Rider', 3, 5, '2022-10-25', '2022-10-28', 'USD', '10.00', '10.00', 'Pending', '2022-10-25 16:48:54', '2022-10-25 16:48:54'),
(21, 10029, 10048, 'Rider', 3, 5, '2022-10-25', '2022-10-28', 'USD', '10.00', '10.00', 'Pending', '2022-10-25 16:49:48', '2022-10-25 16:49:48'),
(22, 10029, 10050, 'Rider', 3, 5, '2022-10-27', '2022-10-30', 'USD', '10.00', '10.00', 'Pending', '2022-10-27 08:28:20', '2022-10-27 08:28:20'),
(23, 10029, 10052, 'Rider', 3, 5, '2022-10-27', '2022-10-30', 'USD', '10.00', '10.00', 'Pending', '2022-10-27 08:35:57', '2022-10-27 08:35:57'),
(24, 10029, 10053, 'Rider', 3, 5, '2022-11-04', '2022-11-07', 'USD', '10.00', '10.00', 'Pending', '2022-11-04 02:26:30', '2022-11-04 02:26:30'),
(25, 10029, 10054, 'Rider', 3, 5, '2022-11-04', '2022-11-07', 'USD', '10.00', '10.00', 'Pending', '2022-11-04 02:33:37', '2022-11-04 02:33:37'),
(26, 10029, 10055, 'Rider', 3, 5, '2022-11-04', '2022-11-07', 'USD', '10.00', '10.00', 'Pending', '2022-11-04 02:40:20', '2022-11-04 02:40:20'),
(27, 10029, 10056, 'Rider', 3, 5, '2022-11-04', '2022-11-07', 'USD', '10.00', '10.00', 'Pending', '2022-11-04 05:24:14', '2022-11-04 05:24:14'),
(28, 10029, 10057, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 05:25:16', '2022-11-05 05:25:16'),
(29, 10029, 10058, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 05:40:15', '2022-11-05 05:40:15'),
(30, 10029, 10059, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 05:45:03', '2022-11-05 05:45:03'),
(31, 10029, 10060, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:12:11', '2022-11-05 06:12:11'),
(32, 10029, 10061, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:13:51', '2022-11-05 06:13:51'),
(33, 10029, 10062, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:14:23', '2022-11-05 06:14:23'),
(34, 10029, 10063, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:16:23', '2022-11-05 06:16:23'),
(35, 10029, 10064, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:18:12', '2022-11-05 06:18:12'),
(36, 10029, 10065, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:20:40', '2022-11-05 06:20:40'),
(37, 10029, 10066, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:25:47', '2022-11-05 06:25:47'),
(38, 10029, 10067, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:39:21', '2022-11-05 06:39:21'),
(39, 10029, 10068, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 06:41:35', '2022-11-05 06:41:35'),
(40, 10029, 10069, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 14:10:39', '2022-11-05 14:10:39'),
(41, 10029, 10070, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 14:12:04', '2022-11-05 14:12:04'),
(42, 10029, 10071, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 14:12:25', '2022-11-05 14:12:25'),
(43, 10029, 10072, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 16:07:12', '2022-11-05 16:07:12'),
(44, 10029, 10073, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 18:07:28', '2022-11-05 18:07:28'),
(45, 10029, 10075, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 18:18:49', '2022-11-05 18:18:49'),
(46, 10029, 10076, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 18:19:41', '2022-11-05 18:19:41'),
(47, 10029, 10077, 'Rider', 3, 5, '2022-11-05', '2022-11-08', 'USD', '10.00', '10.00', 'Pending', '2022-11-05 18:23:36', '2022-11-05 18:23:36'),
(48, 10029, 10078, 'Rider', 3, 5, '2022-11-06', '2022-11-09', 'USD', '10.00', '10.00', 'Pending', '2022-11-06 03:23:45', '2022-11-06 03:23:45'),
(49, 10029, 10079, 'Rider', 3, 5, '2022-11-06', '2022-11-09', 'USD', '10.00', '10.00', 'Pending', '2022-11-06 03:42:50', '2022-11-06 03:42:50'),
(50, 10029, 10080, 'Rider', 3, 5, '2022-11-06', '2022-11-09', 'USD', '10.00', '10.00', 'Pending', '2022-11-06 03:43:46', '2022-11-06 03:43:46'),
(51, 10029, 10081, 'Rider', 3, 5, '2022-12-29', '2023-01-01', 'USD', '10.00', '10.00', 'Pending', '2022-12-29 05:59:29', '2022-12-29 05:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `seats` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `pickup_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `payment_mode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Credit Card',
  `schedule_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Null',
  `location_id` int(10) UNSIGNED NOT NULL,
  `additional_fare` enum('Peak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_fare` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_rider` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `seats`, `pickup_latitude`, `pickup_longitude`, `drop_latitude`, `drop_longitude`, `pickup_location`, `drop_location`, `car_id`, `group_id`, `driver_id`, `payment_mode`, `schedule_id`, `location_id`, `additional_fare`, `peak_fare`, `additional_rider`, `timezone`, `trip_path`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10006, 0, '-1.2843344', '36.9442635', '-1.301301', '36.8069899', 'PW8V+4GH, Nairobi, Kenya', 'Kenyatta National Hospital, Hospital Road, Nairobi, Kenya', 4, 1, 10005, 'Cash', '', 1, '', '0', '75', 'Africa/Nairobi', 'lzyF{tn`FNl@R~@x@zCJPtCy@zDeAdGaBvBk@xCy@~EsAbBa@f@S^KFIBGVGj@UROUc@mAyBg@cA}AuCsEqI_PkZqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCuEoJsH}RyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgEgDwEyAwBqDwD{ByBuJ_IqDmDm@a@KKGWKKYIm@Uy@q@sEyCuDuBCA@IBINw@xAv@vA~@nA|@t@v@rDdDJP@HJJ`@F\\Th@\\rBtBx@x@lB`BdI~GbAjAfChCfAzAtDjF`ClDnCpDfDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`JlF~JxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCpBpCjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJjObKfKbHnDrC~AdBz@jAxA|BfAhCp@xBl@bD^|CPpA\\|AdAlHTdA^fAj@fAv@dAr@ZRCR@RJJTBNANn@n@nCtAvCdBfBpAlAnAnCnDlDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAnAnDfC`FrLbUdPzZjNzWdCtElCnEbCtDbAhA\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@_@lAaAvBSt@Ib@_@tBc@rAuC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYzCrb@zApT@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzG{BxEoBxDaC|E}@rBaIzOyHlO{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhC_DnAc@\\AJELUR_@F]Ge@B}PlGsG~Be@XELGHMFOfACz@CZMjAc@jCe@vDD\\JLNDv@i@nBuAn@]JC`@@j@TRZv@tBNp@PbBBAD@BBDF?DELYLgAd@aA\\BH`@pATv@zBhK~A`HrBfGVhABp@Ej@WbAaAjBi@x@Q`@?Hn@z@\\l@Jh@`@dCPhA?^Cb@CXOd@Q\\a@b@_@Vs@R\\hABbCzCF~ABDdGeCXaEd@cCA', 'Cancelled', '2022-09-25 22:04:04', '2022-09-25 22:04:16', NULL),
(2, 10006, 0, '-1.2843344', '36.9442635', '-1.301301', '36.8069899', 'PW8V+4GH, Nairobi, Kenya', 'Kenyatta National Hospital, Hospital Road, Nairobi, Kenya', 4, 2, 10005, 'Cash', '', 1, '', '0', '75', 'Africa/Nairobi', 'lzyF{tn`FNl@R~@x@zCJPtCy@zDeAdGaBvBk@xCy@~EsAbBa@f@S^KFIBGVGj@UROUc@mAyBg@cA}AuCsEqI_PkZqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCuEoJsH}RyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgEgDwEyAwBqDwD{ByBuJ_IqDmDm@a@KKGWKKYIm@Uy@q@sEyCuDuBCA@IBINw@xAv@vA~@nA|@t@v@rDdDJP@HJJ`@F\\Th@\\rBtBx@x@lB`BdI~GbAjAfChCfAzAtDjF`ClDnCpDfDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`JlF~JxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCpBpCjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJjObKfKbHnDrC~AdBz@jAxA|BfAhCp@xBl@bD^|CPpA\\|AdAlHTdA^fAj@fAv@dAr@ZRCR@RJJTBNANn@n@nCtAvCdBfBpAlAnAnCnDlDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAnAnDfC`FrLbUdPzZjNzWdCtElCnEbCtDbAhA\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@_@lAaAvBSt@Ib@_@tBc@rAuC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYzCrb@zApT@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzG{BxEoBxDaC|E}@rBaIzOyHlO{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhC_DnAc@\\AJELUR_@F]Ge@B}PlGsG~Be@XELGHMFOfACz@CZMjAc@jCe@vDD\\JLNDv@i@nBuAn@]JC`@@j@TRZv@tBNp@PbBBAD@BBDF?DELYLgAd@aA\\BH`@pATv@zBhK~A`HrBfGVhABp@Ej@WbAaAjBi@x@Q`@?Hn@z@\\l@Jh@`@dCPhA?^Cb@CXOd@Q\\a@b@_@Vs@R\\hABbCzCF~ABDdGeCXaEd@cCA', 'Accepted', '2022-09-25 22:04:28', '2022-09-25 19:04:38', NULL),
(3, 10006, 0, '-1.2843425', '36.9442895', '-1.2883969', '36.8275639', 'PW8V+4GH, Nairobi, Kenya', 'Development House, Tom Mboya Street, Nairobi, Kenya', 4, 3, 10005, 'Cash', '', 1, '', '0', '75', 'Africa/Nairobi', 'jzyF}tn`FJRDZR~@f@lBPl@JPtCy@zDeAdGaBvBk@`AUvAc@lBk@pBg@bBa@f@S^KFIBGVGb@MFGROUc@mAyBg@cA}AuCsEqIcIiO_@s@{AqC_B{CqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCs@{AyBuEg@}@oA_DcF}MyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgE_AuAgBaCyAwBqDwDq@q@iAgAuJ_IqDmDm@a@KKGWKKEESCSEYO][[U_BeAsBsAuDuBCA@IBINw@xAv@vA~@nA|@t@v@lAhAdBzAJP@HJJ`@F\\Th@\\rBtBx@x@lB`B`H~FXRHJbAjAfChC\\^h@z@v@fA|BbD`ClD|AtBp@z@fDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`Jj@jA`ErHxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCd@t@jAzAjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJnFnDzGrErEzCrDfCnDrC~AdBz@jAxA|BfAhCp@xBJb@`@~B^|CPpA\\|AdAlHTdA^fAj@fAv@dAPJ`@NHCH?R@RJJTBNANn@n@nCtA|@d@xA~@fBpAlAnA\\^pBnClDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAl@hB`@dAfC`FrLbUdPzZjNzWdCtElAvB~@vAbCtD^^b@h@\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@Ib@Uh@[h@e@lASt@Ib@_@tBI`@Yp@uC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYbApNvA`Sp@lJh@bI@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzGeA`Cu@vAqAdC]r@aC|E}@rBmBvDsEbJiChFoDbH{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhCiBn@u@^c@\\AJELURMDQ@OAMEe@B}PlGsG~Be@XELGHQHW@QGKIc@?sCd@_@H{@X}@d@}C|AeEnBaEjB_@RqEfC{CzAcAp@AFCJSNW?ICKKE[BKHG@I?MGk@qAgDoHwQ{EsL_@q@OOWOI?QGIKEIBYFQi@sAyGhCr@`BbDqA@?', 'Accepted', '2022-09-25 22:46:28', '2022-09-25 19:46:36', NULL),
(4, 10006, 0, '-1.2843726', '36.944283', '-1.2920658999999999', '36.8219462', 'PW8V+4GH, Nairobi, Kenya', 'Nairobi C B D, Nairobi, Kenya', 4, 4, 10005, 'Cash', '', 1, '', '0', '75', 'Africa/Nairobi', 'lzyFytn`FHNDZR~@f@lBPl@JPtCy@zDeAdGaBvBk@`AUvAc@lBk@pBg@bBa@f@S^KFIBGVGb@MFGROUc@mAyBg@cA}AuCsEqIcIiO_@s@{AqC_B{CqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCs@{AyBuEg@}@oA_DcF}MyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgE_AuAgBaCyAwBqDwDq@q@iAgAuJ_IqDmDm@a@KKGWKKEESCSEYO][[U_BeAsBsAuDuBCA@IBINw@xAv@vA~@nA|@t@v@lAhAdBzAJP@HJJ`@F\\Th@\\rBtBx@x@lB`B`H~FXRHJbAjAfChC\\^h@z@v@fA|BbD`ClD|AtBp@z@fDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`Jj@jA`ErHxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCd@t@jAzAjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJnFnDzGrErEzCrDfCnDrC~AdBz@jAxA|BfAhCp@xBJb@`@~B^|CPpA\\|AdAlHTdA^fAj@fAv@dAPJ`@NHCH?R@RJJTBNANn@n@nCtA|@d@xA~@fBpAlAnA\\^pBnClDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAl@hB`@dAfC`FrLbUdPzZjNzWdCtElAvB~@vAbCtD^^b@h@\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@Ib@Uh@[h@e@lASt@Ib@_@tBI`@Yp@uC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYbApNvA`Sp@lJh@bI@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzGeA`Cu@vAqAdC]r@aC|E}@rBmBvDsEbJiChFoDbH{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhCiBn@u@^c@\\AJELURMDQ@OAMEe@B}PlGsG~Be@XELGHQHW@QGKIc@?sCd@_@H{@X}@d@}C|AeEnBaEjB_@RqEfC{CzAcAp@AFCJSNW?ICKKE[BKHG@I?MGk@qAgDUm@', 'Accepted', '2022-09-25 22:51:51', '2022-09-25 19:52:01', NULL),
(5, 10068, 4, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, NULL, 10053, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 06:41:35', '2022-11-05 06:41:35', NULL),
(6, 10071, 4, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, NULL, 10053, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 14:12:25', '2022-11-05 14:12:25', NULL),
(7, 10073, 4, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, NULL, 10072, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 18:07:28', '2022-11-05 18:07:28', NULL),
(8, 10075, 4, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, NULL, 10072, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 18:18:49', '2022-11-05 18:18:49', NULL),
(9, 10076, 4, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, NULL, 10072, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 18:19:41', '2022-11-05 18:19:41', NULL),
(10, 10077, 4, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, NULL, 10072, 'CASH', '0', 4, '', '0', '75', 'Asia/karachi', 'sdasd', 'Accepted', '2022-11-05 18:23:36', '2022-11-05 18:23:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rider_location`
--

CREATE TABLE `rider_location` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `home` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_location`
--

INSERT INTO `rider_location` (`id`, `user_id`, `home`, `work`, `home_latitude`, `home_longitude`, `work_latitude`, `work_longitude`, `latitude`, `longitude`) VALUES
(1, 10002, 'Nairobi', 'Nairobi', '', '', '', '', '', ''),
(2, 10004, 'Bole, Addis Ababa, Ethiopia', 'Jomo Kenyatta St, Addis Ababa, Ethiopia', '8.9831138', '38.8100855', '9.0098881', '38.7720447', '', ''),
(3, 10008, '', '', '', '', '', '', '9.00827658861541', '38.77860780805349'),
(4, 10011, '', '', '', '', '', '', '9.010138257069055', '38.76921370625496'),
(7, 10016, 'Sanjwal Cantt., Attock, Punjab, Pakistan', 'P3MQ+8CJ, Agha Khan Rd, F-5/1 F-5, Islamabad, Islamabad Capital Territory, Pakistan', '33.7853678', '72.41693769999999', '33.7333378', '73.0885127', '', ''),
(8, 10081, '', '', '', '', '', '', '', ''),
(9, 10082, '', '', '', '', '', '', '', ''),
(10, 10083, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ringtones`
--

CREATE TABLE `ringtones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 'dispatcher', 'Dispatcher', 'Dispatcher', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 'super_admin', 'Superadmin', 'Super admin manages all admin', '2022-09-13 12:45:16', '2022-09-13 12:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_cancel`
--

CREATE TABLE `schedule_cancel` (
  `id` int(10) UNSIGNED NOT NULL,
  `schedule_ride_id` int(10) UNSIGNED NOT NULL,
  `cancel_reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_reason_id` int(10) UNSIGNED NOT NULL,
  `cancel_by` enum('Rider','Driver','Admin','Company') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_ride`
--

CREATE TABLE `schedule_ride` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `schedule_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_end_date` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_end_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `peak_id` int(10) UNSIGNED NOT NULL,
  `booking_type` enum('Manual Booking','Schedule Booking') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Schedule Booking',
  `driver_id` int(11) NOT NULL DEFAULT 0,
  `status` enum('Pending','Completed','Cancelled','Car Not Found') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fare_estimation` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_wallet` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KqvixSGT13lcCR1MjlUwwcVMQdMRp1EzLJYjlfyK', 10083, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo4OntzOjg6ImN1cnJlbmN5IjtzOjM6IkVUQiI7czo2OiJzeW1ib2wiO3M6MzoiRVRCIjtzOjg6Imxhbmd1YWdlIjtzOjI6ImVuIjtzOjY6Il90b2tlbiI7czo0MDoiNkYzdU85N3V0Q1Z0ZWQ0S1UxODdCZ09XN1UyajJLVGM1R2V2WWJuaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yaWRlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTA6ImxvZ2luX3R5cGUiO3M6MTM6Im1vYmlsZV9udW1iZXIiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwMDgzO30=', 1672945814);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `name`, `value`) VALUES
(1, 'site_name', 'Pooltechnology'),
(2, 'payment_currency', 'USD'),
(3, 'version', '2.4'),
(4, 'logo', 'logo.png'),
(5, 'page_logo', 'page_logo.png'),
(6, 'favicon', 'favicon.png'),
(7, 'driver_km', '5'),
(8, 'head_code', ''),
(9, 'admin_contact', '9221'),
(10, 'admin_country_code', '68'),
(11, 'site_url', 'http://pool.ronelssolutions.co.ke/'),
(12, 'heat_map', 'On'),
(13, 'heat_map_hours', '3'),
(14, 'update_loc_interval', '10'),
(15, 'offline_hours', '1'),
(16, 'pickup_km', '3'),
(17, 'drop_km', '1'),
(18, 'max_waiting_time', '2'),
(19, 'social_logins', ''),
(20, 'otp_verification', '0'),
(21, 'covid_enable', '0'),
(22, 'driver_request_seconds', '12'),
(23, 'driver_request_limit', '10'),
(24, 'copyright_year', '2022'),
(25, 'copyright_url', 'https://poolus.biz/'),
(26, 'copyright_name', 'Pool Technology');

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supports`
--

INSERT INTO `supports` (`id`, `name`, `link`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Whatsapp', '254729040226', 'Active', 'whatsapp.png', NULL, NULL),
(2, 'Skype', '123456745', 'Active', 'skype.jpeg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toll_reasons`
--

CREATE TABLE `toll_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `toll_reasons`
--

INSERT INTO `toll_reasons` (`id`, `reason`, `status`) VALUES
(1, 'Other Fees', 'Active'),
(2, 'Parking', 'Active'),
(3, 'money', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pool_id` int(10) UNSIGNED NOT NULL,
  `pickup_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_id` int(10) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED NOT NULL,
  `trip_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` tinyint(3) UNSIGNED NOT NULL,
  `total_time` decimal(7,2) NOT NULL,
  `total_km` decimal(7,2) NOT NULL,
  `time_fare` decimal(11,2) NOT NULL,
  `distance_fare` decimal(11,2) NOT NULL,
  `base_fare` decimal(11,2) NOT NULL,
  `additional_rider` int(10) UNSIGNED NOT NULL,
  `additional_rider_amount` decimal(11,2) NOT NULL,
  `peak_fare` decimal(11,2) NOT NULL,
  `peak_amount` decimal(11,2) NOT NULL,
  `driver_peak_amount` decimal(11,2) NOT NULL,
  `schedule_fare` decimal(11,2) NOT NULL,
  `access_fee` decimal(11,2) NOT NULL,
  `tips` decimal(11,2) NOT NULL DEFAULT 0.00,
  `waiting_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `toll_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `toll_fee` decimal(11,2) NOT NULL DEFAULT 0.00,
  `wallet_amount` decimal(11,2) NOT NULL,
  `promo_amount` decimal(11,2) NOT NULL,
  `subtotal_fare` decimal(11,2) NOT NULL,
  `total_fare` decimal(11,2) NOT NULL,
  `driver_payout` decimal(11,2) NOT NULL,
  `driver_or_company_commission` decimal(11,2) NOT NULL,
  `owe_amount` decimal(11,2) NOT NULL,
  `remaining_owe_amount` decimal(11,2) NOT NULL,
  `applied_owe_amount` decimal(11,2) NOT NULL,
  `to_trip_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrive_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `begin_trip` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_trip` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paykey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_mode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Braintree',
  `payment_status` enum('Pending','Completed','Trip Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `is_calculation` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fare_estimation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Scheduled','Cancelled','Begin trip','End trip','Payment','Rating','Completed','Null') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Null',
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `user_id`, `pool_id`, `pickup_latitude`, `pickup_longitude`, `drop_latitude`, `drop_longitude`, `pickup_location`, `drop_location`, `car_id`, `request_id`, `driver_id`, `trip_path`, `map_image`, `seats`, `total_time`, `total_km`, `time_fare`, `distance_fare`, `base_fare`, `additional_rider`, `additional_rider_amount`, `peak_fare`, `peak_amount`, `driver_peak_amount`, `schedule_fare`, `access_fee`, `tips`, `waiting_charge`, `toll_reason_id`, `toll_fee`, `wallet_amount`, `promo_amount`, `subtotal_fare`, `total_fare`, `driver_payout`, `driver_or_company_commission`, `owe_amount`, `remaining_owe_amount`, `applied_owe_amount`, `to_trip_id`, `arrive_time`, `begin_trip`, `end_trip`, `paykey`, `payment_mode`, `payment_status`, `is_calculation`, `currency_code`, `fare_estimation`, `status`, `otp`, `created_at`, `updated_at`) VALUES
(1, 10006, 0, '-1.2844566', '36.9439834', '-1.2843518', '36.9442686', 'PW8V+4GH, Nairobi, Kenya', 'PW8V+4GH, Nairobi, Kenya', 4, 2, 10005, 'lzyF{tn`FNl@R~@x@zCJPtCy@zDeAdGaBvBk@xCy@~EsAbBa@f@S^KFIBGVGj@UROUc@mAyBg@cA}AuCsEqI_PkZqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCuEoJsH}RyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgEgDwEyAwBqDwD{ByBuJ_IqDmDm@a@KKGWKKYIm@Uy@q@sEyCuDuBCA@IBINw@xAv@vA~@nA|@t@v@rDdDJP@HJJ`@F\\Th@\\rBtBx@x@lB`BdI~GbAjAfChCfAzAtDjF`ClDnCpDfDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`JlF~JxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCpBpCjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJjObKfKbHnDrC~AdBz@jAxA|BfAhCp@xBl@bD^|CPpA\\|AdAlHTdA^fAj@fAv@dAr@ZRCR@RJJTBNANn@n@nCtAvCdBfBpAlAnAnCnDlDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAnAnDfC`FrLbUdPzZjNzWdCtElCnEbCtDbAhA\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@_@lAaAvBSt@Ib@_@tBc@rAuC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYzCrb@zApT@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzG{BxEoBxDaC|E}@rBaIzOyHlO{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhC_DnAc@\\AJELUR_@F]Ge@B}PlGsG~Be@XELGHMFOfACz@CZMjAc@jCe@vDD\\JLNDv@i@nBuAn@]JC`@@j@TRZv@tBNp@PbBBAD@BBDF?DELYLgAd@aA\\BH`@pATv@zBhK~A`HrBfGVhABp@Ej@WbAaAjBi@x@Q`@?Hn@z@\\l@Jh@`@dCPhA?^Cb@CXOd@Q\\a@b@_@Vs@R\\hABbCzCF~ABDdGeCXaEd@cCA', 'db8ca638.jpg', 0, '0.00', '0.04', '0.00', '1.20', '98.80', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '100.00', '100.00', '0.00', '10.00', '10.00', '0.00', '0.00', '', '2022-09-25 22:06:10', '2022-09-25 22:06:46', '2022-09-25 22:07:06', '', 'Cash', 'Completed', '1', 'ETB', '{\"status\":\"success\",\"distance\":31315,\"time\":2824}', 'Completed', '0', '2022-09-25 22:04:38', '2022-09-25 20:38:27'),
(2, 10006, 0, '-1.2843527', '36.94425', '-1.2843207', '36.9440629', 'PW8V+4GH, Nairobi, Kenya', 'PW8V+4GH, Nairobi, Kenya', 4, 3, 10005, 'jzyF}tn`FJRDZR~@f@lBPl@JPtCy@zDeAdGaBvBk@`AUvAc@lBk@pBg@bBa@f@S^KFIBGVGb@MFGROUc@mAyBg@cA}AuCsEqIcIiO_@s@{AqC_B{CqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCs@{AyBuEg@}@oA_DcF}MyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgE_AuAgBaCyAwBqDwDq@q@iAgAuJ_IqDmDm@a@KKGWKKEESCSEYO][[U_BeAsBsAuDuBCA@IBINw@xAv@vA~@nA|@t@v@lAhAdBzAJP@HJJ`@F\\Th@\\rBtBx@x@lB`B`H~FXRHJbAjAfChC\\^h@z@v@fA|BbD`ClD|AtBp@z@fDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`Jj@jA`ErHxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCd@t@jAzAjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJnFnDzGrErEzCrDfCnDrC~AdBz@jAxA|BfAhCp@xBJb@`@~B^|CPpA\\|AdAlHTdA^fAj@fAv@dAPJ`@NHCH?R@RJJTBNANn@n@nCtA|@d@xA~@fBpAlAnA\\^pBnClDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAl@hB`@dAfC`FrLbUdPzZjNzWdCtElAvB~@vAbCtD^^b@h@\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@Ib@Uh@[h@e@lASt@Ib@_@tBI`@Yp@uC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYbApNvA`Sp@lJh@bI@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzGeA`Cu@vAqAdC]r@aC|E}@rBmBvDsEbJiChFoDbH{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhCiBn@u@^c@\\AJELURMDQ@OAMEe@B}PlGsG~Be@XELGHQHW@QGKIc@?sCd@_@H{@X}@d@}C|AeEnBaEjB_@RqEfC{CzAcAp@AFCJSNW?ICKKE[BKHG@I?MGk@qAgDoHwQ{EsL_@q@OOWOI?QGIKEIBYFQi@sAyGhCr@`BbDqA@?', '46e9f649.jpg', 0, '1.00', '0.03', '5.00', '0.90', '94.10', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '100.00', '100.00', '0.00', '10.00', '10.00', '0.00', '0.00', '', '2022-09-25 22:46:53', '2022-09-25 22:47:45', '2022-09-25 22:48:45', '', 'Cash', 'Completed', '1', 'ETB', '{\"status\":\"success\",\"distance\":30756,\"time\":2751}', 'Completed', '0', '2022-09-25 22:46:36', '2022-09-25 19:50:01'),
(3, 10006, 0, '-1.2843379', '36.944317', '-1.2843407', '36.9443386', 'PW8V+4GH, Nairobi, Kenya', 'PW8V+4GH, Nairobi, Kenya', 4, 4, 10005, 'lzyFytn`FHNDZR~@f@lBPl@JPtCy@zDeAdGaBvBk@`AUvAc@lBk@pBg@bBa@f@S^KFIBGVGb@MFGROUc@mAyBg@cA}AuCsEqIcIiO_@s@{AqC_B{CqIyOOc@gB_DQ[y@{AyA{CkBkDsAaCs@{AyBuEg@}@oA_DcF}MyAmEi@kAqBoEs@aBi@s@EMSW_AmA}BoCU[]So@q@c@]yAcBw@q@iCeCk@s@kAeAiAoAiAoAcBwByCgE_AuAgBaCyAwBqDwDq@q@iAgAuJ_IqDmDm@a@KKGWKKEESCSEYO][[U_BeAsBsAuDuBCA@IBINw@xAv@vA~@nA|@t@v@lAhAdBzAJP@HJJ`@F\\Th@\\rBtBx@x@lB`B`H~FXRHJbAjAfChC\\^h@z@v@fA|BbD`ClD|AtBp@z@fDrDzGzG`A~@`Av@bAfAtDlEdAtAl@jA|AtCpAvC`BdEr@nBnC~HvBxFvE`Jj@jA`ErHxExIdEhIlBhDnAdCpEnIjDtGrAzCpBtDxAnCrClFjAtB|@dB~AjCd@t@jAzAjArAr@r@tDvChM`JnBnAz@j@dFfDpMxIlNhJnFnDzGrErEzCrDfCnDrC~AdBz@jAxA|BfAhCp@xBJb@`@~B^|CPpA\\|AdAlHTdA^fAj@fAv@dAPJ`@NHCH?R@RJJTBNANn@n@nCtA|@d@xA~@fBpAlAnA\\^pBnClDrFhBnD`AjC~@pD\\vBNdAL~BFfCIfC?jDY~FM|DCp@BdBZhEHt@VjAl@hB`@dAfC`FrLbUdPzZjNzWdCtElAvB~@vAbCtD^^b@h@\\X\\Df@Td@Ph@FxALZJh@^RXTl@Fb@?l@Ib@Uh@[h@e@lASt@Ib@_@tBI`@Yp@uC~E_AjBmAdE_@lAg@tCUxBKr@GxB@fDPnDH~Ad@fHN~Bb@bFh@hHnBpYbApNvA`Sp@lJh@bI@`HWfEo@pD_@nAe@pBk@xAyA`DcEfIyCjG{ErJeEjIiA~Bu@bBeBdDkDzGeA`Cu@vAqAdC]r@aC|E}@rBmBvDsEbJiChFoDbH{AvCQz@i@dCe@pBWr@e@jAw@pAe@r@_BnBcDtCYNO@_Az@uBzAmBhAmEhBeGxBiHfCwNhFwHhCiBn@u@^c@\\AJELURMDQ@OAMEe@B}PlGsG~Be@XELGHQHW@QGKIc@?sCd@_@H{@X}@d@}C|AeEnBaEjB_@RqEfC{CzAcAp@AFCJSNW?ICKKE[BKHG@I?MGk@qAgDUm@', '8ca95dba.jpg', 0, '0.00', '0.00', '0.00', '0.00', '100.00', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '100.00', '100.00', '0.00', '10.00', '10.00', '0.00', '0.00', '', '2022-09-25 22:52:10', '2022-09-25 22:52:35', '2022-09-25 22:52:45', '', 'Cash', 'Completed', '1', 'ETB', '{\"status\":\"success\",\"distance\":29624,\"time\":2486}', 'Completed', '0', '2022-09-25 22:52:01', '2022-09-25 19:53:05'),
(6, 10042, 0, '27.2046', '77.4977', '33.768051', '72.360703', 'pakistan', 'pakistan', 1, 1, 10027, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"fail\",\"msg\":\"Something Went Wrong\",\"time\":\"0\",\"distance\":\"0\"}', 'Scheduled', '4245', '2022-10-13 01:01:19', '2022-10-13 01:01:19'),
(7, 10043, 0, '27.2046', '77.4977', '33.768051', '72.360703', 'pakistan', 'pakistan', 1, 1, 10027, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"fail\",\"msg\":\"No Route Found\",\"time\":\"0\",\"distance\":\"0\"}', 'Scheduled', '3735', '2022-10-13 01:02:09', '2022-10-13 01:02:09'),
(8, 10052, 0, '33.619017315841', '72.960026711226', '33.616637686879', '72.959890253842', 'Islamabad, Punjab, Pakistan', 'Service Road North I-14, Islamabad, Punjab, Pakistan', 1, 4, 10050, 'yeelEe_i|L?T[AU?[q@[yBGKE]@UFITOEI?WHi@JBNcAZ}@BA^wATo@h@TH@LE^q@DOJMbAdCrAbDpBzEjAnC', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"fail\",\"msg\":\"Something Went Wrong\",\"time\":\"0\",\"distance\":\"0\"}', 'Scheduled', '0', '2022-10-27 08:36:08', '2022-10-27 08:36:08'),
(9, 10054, 0, '27.2046', '77.4977', '33.768051', '72.360703', 'pakistan', 'pakistan', 1, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"fail\",\"msg\":\"No Route Found\",\"time\":\"0\",\"distance\":\"0\"}', 'Scheduled', '0', '2022-11-04 02:33:38', '2022-11-04 02:33:38'),
(10, 10055, 0, '27.2046', '77.4977', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"fail\",\"msg\":\"No Route Found\",\"time\":\"0\",\"distance\":\"0\"}', 'Scheduled', '0', '2022-11-04 02:40:21', '2022-11-04 02:40:21'),
(11, 10056, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-04 05:24:15', '2022-11-04 05:24:15'),
(12, 10057, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 05:25:17', '2022-11-05 05:25:17'),
(13, 10058, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 05:40:16', '2022-11-05 05:40:16'),
(14, 10059, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 05:45:04', '2022-11-05 05:45:04'),
(15, 10060, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '\"176.00\"', 'Scheduled', '0', '2022-11-05 06:12:12', '2022-11-05 06:12:12'),
(16, 10061, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"car_id\":4,\"car_name\":\"Pool\",\"is_pool\":false,\"driver_id\":0,\"capacity\":4,\"base_fare\":\"12.00\",\"waiting_time\":10,\"waiting_charge\":\"12.00\",\"per_min\":\"2.00\",\"per_km\":\"2.00\",\"min_fare\":\"5.00\",\"schedule_fare\":\"12.00\",\"schedule_cancel_fare\":\"0.00\",\"location\":[],\"drivers\":[],\"fare_estimation\":\"176.00\",\"additional_rider_percentage\":\"75\",\"min_time\":\"No cabs\",\"apply_peak\":\"No\",\"peak_price\":0,\"location_id\":4,\"peak_id\":0,\"car_image\":\"http:\\/\\/127.0.0.1:8000\\/images\\/car_image\\/Goferpool_black.png\",\"car_active_image\":\"http:\\/\\/127.0.0.1:8000\\/images\\/car_image\\/Goferpool.png\"}', 'Scheduled', '0', '2022-11-05 06:13:51', '2022-11-05 06:13:51'),
(17, 10062, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"car_id\":4,\"car_name\":\"Pool\",\"is_pool\":false,\"driver_id\":0,\"capacity\":4,\"base_fare\":\"12.00\",\"waiting_time\":10,\"waiting_charge\":\"12.00\",\"per_min\":\"2.00\",\"per_km\":\"2.00\",\"min_fare\":\"5.00\",\"schedule_fare\":\"12.00\",\"schedule_cancel_fare\":\"0.00\",\"location\":[],\"drivers\":[],\"fare_estimation\":\"176.00\",\"additional_rider_percentage\":\"75\",\"min_time\":\"No cabs\",\"apply_peak\":\"No\",\"peak_price\":0,\"location_id\":4,\"peak_id\":0,\"car_image\":\"http:\\/\\/127.0.0.1:8000\\/images\\/car_image\\/Goferpool_black.png\",\"car_active_image\":\"http:\\/\\/127.0.0.1:8000\\/images\\/car_image\\/Goferpool.png\"}', 'Scheduled', '0', '2022-11-05 06:14:23', '2022-11-05 06:14:23'),
(18, 10063, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '\"176.00\"', 'Scheduled', '0', '2022-11-05 06:16:23', '2022-11-05 06:16:23'),
(19, 10064, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '\"176.00\"', 'Scheduled', '0', '2022-11-05 06:18:12', '2022-11-05 06:18:12'),
(20, 10065, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '\"176.00\"', 'Scheduled', '0', '2022-11-05 06:20:40', '2022-11-05 06:20:40'),
(21, 10066, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 4, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 06:25:48', '2022-11-05 06:25:48'),
(22, 10068, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 5, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 06:41:36', '2022-11-05 06:41:36'),
(23, 10071, 0, '33.800440', '72.625232', '33.768051', '72.360703', 'pakistan', 'pakistan', 4, 6, 10053, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":32117,\"time\":3024}', 'Scheduled', '0', '2022-11-05 14:12:26', '2022-11-05 14:12:26'),
(24, 10073, 0, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, 7, 10072, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":3501,\"time\":502}', 'Scheduled', '0', '2022-11-05 18:07:29', '2022-11-05 18:07:29'),
(25, 10075, 0, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, 8, 10072, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":3501,\"time\":502}', 'Scheduled', '0', '2022-11-05 18:18:50', '2022-11-05 18:18:50'),
(26, 10076, 0, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, 9, 10072, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":3501,\"time\":502}', 'Scheduled', '0', '2022-11-05 18:19:42', '2022-11-05 18:19:42'),
(27, 10077, 0, '33.6666', '73.0710', '33.6680', '73.0448', 'pakistan', 'pakistan', 4, 10, 10072, 'sdasd', '', 4, '0.00', '0.00', '0.00', '0.00', '0.00', 75, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'CASH', 'Pending', '0', 'ETB', '{\"status\":\"success\",\"distance\":3501,\"time\":502}', 'Scheduled', '0', '2022-11-05 18:23:37', '2022-11-05 18:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `trip_toll_reasons`
--

CREATE TABLE `trip_toll_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(10) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('Rider','Driver','Corporate') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','Pending','Car_details','Document_details') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral_code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_referral_code` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `corporate_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `country_code`, `gender`, `mobile_number`, `password`, `user_type`, `company_id`, `remember_token`, `firebase_token`, `fb_id`, `google_id`, `apple_id`, `status`, `device_type`, `device_id`, `referral_code`, `used_referral_code`, `currency_code`, `language`, `country_id`, `created_at`, `updated_at`, `deleted_at`, `corporate_id`) VALUES
(10001, 'Nelson', 'Juma', 'kisnelson65@gmail.com', '254', '1', '0711972926', '$2y$10$CBd0vN3FltJc7OQ3VdjFBO5uePotWTutpnSxp2BTbSjh76e3ENFqq', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Pending', NULL, '', 'KNB6UZOC5B', NULL, NULL, '', 110, '2022-09-12 11:38:27', '2022-09-12 13:45:48', NULL, NULL),
(10002, 'Irene', 'Mutinda', 'irenemutinda@gmail.com', '254', '2', '0794328350', '$2y$10$OxJMeNh7wgHh/5P2Bf5U1.fWUq0gmvZBbaqxMvT0Bv88XCkUJqbw2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', 'TEMDWAK6RF', NULL, NULL, '', 110, '2022-09-12 11:47:59', '2022-09-12 11:47:59', NULL, NULL),
(10004, 'Rider1', 'pool', 'heaventek13@gmail.com', '251', '2', '0931388356', '$2y$10$NjipNH/WAagoQq.0kkL.M..giCK4UwptIwLZao7J57nAgDYhz4QQy', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', 'UKDOSWYQGS', NULL, NULL, '', 68, '2022-09-13 12:59:34', '2022-09-13 12:59:34', NULL, NULL),
(10005, 'AppTest', 'Driver', 'nelsonjuma0808@gmail.com', '254', '1', '114096609', '$2y$10$m8hN6A7qwCY8HrQ.FKUMFOhub.WuhQrm5ZI5K85JJshWBqEkNWYxm', 'Driver', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6Im5lbHNvbmp1bWEwODA4QGdtYWlsLmNvbSAtIERyaXZlciIsImlhdCI6MTY2NDEzOTc5NiwiZXhwIjoxNjY0MTQzMzk2fQ.GSU4R3ZRH0t2CNQZS5UoRg_vzkYDCMKzZ6Fa5XtJRI2azvvhm3kgYzHnPL93sG7QKEoQxP-Zi-PPJ76wHrsSbnefh6Hgz_wxQ-mdz5WcGUM0KBfLDI4EbmDxG22STBwmS6qFOC87zgSmnCnIvszihhT2mfwrEb8u-C44Nd5bPtnyXr_STnDjm_bi3pctLYda-ykHt6rf0kWfU-AbuIItxIACYxLST68SDY-PJlDGA9udule8R31S2_Ni0wiTrjMnjrYYrRINyxIwXYG0YIee3jvfXpAh6T-aR6knSMOyBij_qw6aBkA3Vi8RcK5ToXad-kOmAavBmQjPltAhC8DXAA', NULL, NULL, NULL, 'Active', '2', 'dBvjb3xRQ8mSXczJPh5RkU:APA91bHOBMFfXYH09aR4-ronLahXyO2YXeKjTbc78Qh5A3Et1aBATFij7sl-ouw2VBRKAfJ2SKIC7D9glGTjtoz9Bc9lW2odxQ18cvS_mrukeyryXkgogHPDTI30CLh9t3IjTHaj_BCM', 'EVX9U7TNLJ', '', 'ETB', 'en', 110, '2022-09-23 02:08:55', '2022-09-25 21:03:16', NULL, NULL),
(10006, 'Test', 'User', 'info@ronelssolutions.com', '254', '1', '729040226', '$2y$10$K1pr2JOGRHLx.SrjIPhjIOJzzZ.GnQHN/fIcyKeRsFV5Fv7vxYfOO', 'Rider', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6ImluZm9Acm9uZWxzc29sdXRpb25zLmNvbSAtIFJpZGVyIiwiaWF0IjoxNjY0MTM3MDk3LCJleHAiOjE2NjQxNDA2OTd9.CIPSywJLruLCmRnm_0mS7BtPiHlg3p0pBvBk4It-BoHkl-gQx9bgfEbAOzuoVBS4-POz-IGDB4IYHPyE5DYeEX1TsxG6mg50EHrivfhjv8UEoqePYhaMj4f9MiY_bLvSCsCRwjP759kEJHLVanAiqXuM1eTtemk4zjPLgSU9uVdkVbhut0-c3OA8OdBt-v5BqGzphf_L2sDtW_ofKwlIgDwmrP6Bbl9D26qPG1Cb_PexxOTNqvLeCX40DypU7lyRxb6n50gzKkYi4Fi9X6txMJlzmaoxdOx8b4FvfBGGlgGswtAJNsP51LVS0ChrVAXS9QYEK4NbohC2CsvzdA3UiQ', NULL, NULL, NULL, 'Active', '2', 'c0qXK8TIQD2BB6zqP1s4mM:APA91bEWuf5Xh3HpxAYZ_TnP-d5tY5pxBWyaBOw5q4VyCJHfvG_Px3N5oIRFxLpgL_15UFIZPIztNIKYzqzYVyaaamOG0Vppej7tJKUp_3zwiI-Bgepy1KYu-7fBEaZq0BK7ruWJ-_QY', '0XL9XTPIEJ', '', 'ETB', 'en', 110, '2022-09-25 18:39:46', '2022-09-25 20:18:17', NULL, NULL),
(10007, 'Migbar', 'Asrat', 'asmigbar@gmail.com', '251', '1', '940278806', '$2y$10$rB8n0thedfxmflLA0UqDVOfEsijD0EtYCMCFHON8B.UGMF2DiXh0O', 'Driver', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6ImFzbWlnYmFyQGdtYWlsLmNvbSAtIERyaXZlciIsImlhdCI6MTY2NDE3NDA5NywiZXhwIjoxNjY0MTc3Njk3fQ.AIFsT0Atwj_iV5F1Rl_UEQVl93KYyBwZCTZQgGKrbQ0jsO1LGELJgnM6N9mH1RKKHPcaX7kSl3P4M7tnyVp1TcyUzZGRK3Y8QX9KS1XdoT8pDYnllmY3w8VrOW_FJGAnvWteiy6PG1NdB01Bs4dxfJ1B1ROunoNW2mWhD2smrAYFayRReOZx5tyKknOrhRdLszDelwccCfK2givGfaWPSCTLwRG_fhs9tgzu8uydvEy1RH37QIwH-17N-HHg3uCrNV4_jakmrLw93SROksZ3RQjjIGa2gnKzC8EWsq3wgsehq8DlxeU1kT71nUlkVB5ELBJq-x7smb4WcARajMFOug', NULL, NULL, NULL, 'Car_details', '2', 'dNu5KEwmSLiSRB4aAF4HxY:APA91bFuZg5aTWUH0rb14Wez8wNly0MiTGMhKYTHuI9AtGC6w1f4LfjEj9vx3l79kvPhYAoH2gVkc_8GtYlEmTqEthmrzYhCMfVdR9LJAvg2mrzMFpYhKa0AsbFtZCJLsC47_VBzF6i0', 'QGTGKWBGCE', '', 'ETB', 'en', 68, '2022-09-26 03:35:06', '2022-09-28 08:52:38', NULL, NULL),
(10008, 'Migbar', 'asrat', 'asmigbar@gmail.com', '251', '1', '940278806', '$2y$10$CQ7jAd9w.DzeD7yl.9Zyzuww7eQRRkjtutWR75hkerp9wDco0LjMq', 'Rider', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6ImFzbWlnYmFyQGdtYWlsLmNvbSAtIFJpZGVyIiwiaWF0IjoxNjY0MTcyNTgyLCJleHAiOjE2NjQxNzYxODJ9.JZDb5-TZU98O3D0VvvaJuiFK1QIrvJTnDEiBQVxtiTHj1wt_xJgBndV58t1ddaz6BiTzOKf0WUNVFOXjAUPN7r3KQfv6XQ8hx7degfWYicPTHCqPJl8uLJkZU3mrLSI3AX-p20WWVmrfYtWiRzPLFJC073BIkpBMIInzoecLCqDiZ5w-3ul_A1AG0yARhcmhXdQUEYHlhvxU91zFRV_9lhKhVqieG9pN1EQdMn1rgnsjKcsIxyhoSnlL6FJBzlFKqTGo75vWD-Um40HGXs-ZiQhffqvIpV2WIAruFT9AnzI5mwNowXBhGj7q4UYxpv6qC7Mz4qGVinHftGf0u6xe3w', NULL, NULL, NULL, 'Active', '2', 'fvCp8U4-RKWse73ZgXQPHm:APA91bFMordqXTRA1X1v4qX18INwr6jTvUiERo5tQOEwA2e6vbdWnBl12lTyeoSF8KxOVeES2kH3hUsTu2hmJm6TJU-EXI4TKxPAq8LHq-qAxT4XQrsvEjzqea-AyyJbwUV2m8vgM7Mk', 'IVKGNZ47PA', '', 'ETB', 'en', 68, '2022-09-26 04:08:46', '2022-09-26 06:09:42', NULL, NULL),
(10009, 'Yabu', 'Man', 'manyabu534@gmail.com', '251', '1', '924909854', '$2y$10$raSsGIwCnfNrL59/ejvx5OyAWv9tTpOBe5UMJwF989inzMTjsbpVW', 'Rider', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6Im1hbnlhYnU1MzRAZ21haWwuY29tIC0gUmlkZXIiLCJpYXQiOjE2NjQxNzYzNzIsImV4cCI6MTY2NDE3OTk3Mn0.IMgRx6sAMfp6yS7N5qxe131s430OcPnDChYiDmtnL9X0EHAv_xtf95sFLGQb9eC7Xfx1PDzM_CAZ-00lDEhNoVu4jtZGoqZXHEiU-exMR0eJs2cIBkMBp1VQUcMQXedswcSZ9MFrt5DIlB4UiSU06unSPpiy6uQKDs26sIms0uK8Ln8hoph4kgd_oQhjKTO-7eysrop6vC8iJQYRkq_zusZONx6_UA8mzZJ75kihI0n3r0mpbJc5weaaXvqz7gvacdWHasAQmoyMNre2sfd_hoE5SqCf6tYzhbkd4craNGf8m4MrGhhwYUk8QBYA7RzejoQdkKDIgBw4SQKhTFR7qg', NULL, NULL, NULL, 'Active', '2', 'fKrh1YbpTUqSTNL4xLhaem:APA91bGXtJhqOPRnyEDi9A_s9MOb7zujQgO8ir4oYoRwLXQ22F1Zt2gjcN0QbWSADWMRU1zdJ7sqwOav1kyyj17BnW_1zKAk-YwPfjBxgbVwHdO_U5P6GIAlv-DVxhn5dYK31l-4o9bD', 'HIOVBVLM3G', '', 'ETB', 'en', 68, '2022-09-26 04:47:36', '2022-09-26 07:12:52', NULL, NULL),
(10010, 'Genet', 'Teklay', 'heaventek13@gmail.com', '251', '2', '931388356', '$2y$10$uprOgHNJOPpDPzl8O9SN0.s4THuId2zzdgQuS/b0sawC9Co7KdF/e', 'Driver', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6ImhlYXZlbnRlazEzQGdtYWlsLmNvbSAtIERyaXZlciIsImlhdCI6MTY2NDE3NjE5MSwiZXhwIjoxNjY0MTc5NzkxfQ.LdsamUU6H6kLla8BacmeWcNp6IUvxkJMaFQXDepmijZ4dx4Qim0QmD_hmTw01yaoMRpfTibe_39jnDUVevqbqUKe_FZ4dTJGIHiVTg1jUadzjis0uP2op8Zji72PkHEmYn1SQSuvskx7l9ZSll1Ftj3F47cXZmz0moFspNzRp4FVt5gaI_Za3iLAROxPuQTI0qIZF4SiyP1ujgUDAxD0ZQXOAR41Xybd0V8uYr_AlwE87P4ZmHsVTd0Bd42vcBuDveq_Pfia_PoiKFGSbk3SyT2QPbBDwRQkmCfJ9PYoCpB_Qh9l9Acoq8sMB5u19D2LwAFjRb8Ue0GDy9bUzyYi4Q', NULL, NULL, NULL, 'Car_details', '2', 'eL3_FcDXTpWsv0clKid1OK:APA91bFaTcPHbo5r0kXe9uzfVTiAsH4V2Uxl33JnPLga1YcqfoJtWC5VjJX_QNBjQmS6y8KIsytBX-fKzKaIoVMGW2K-5fG2HOL19wzB5ATExtMhKwl8X94q9hb0TISzJwXa--ebP9sX', 'GPCXSWT4UQ', '', 'ETB', 'en', 68, '2022-09-26 06:37:16', '2022-09-26 07:09:51', NULL, NULL),
(10011, 'Genet', 'teklay', 'geniteklay30@gmail.com', '251', '2', '931388356', '$2y$10$hU/6tJe4E4Z6hhwlYw3kL.KkzPPag0HsdpwPjqjU9IzdqeLRcKtDW', 'Rider', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay00cnFkbUBwb29sdGVjaC0zNjIzMDguaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJhdWQiOiJodHRwczpcL1wvaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tXC9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsInVpZCI6Imdlbml0ZWtsYXkzMEBnbWFpbC5jb20gLSBSaWRlciIsImlhdCI6MTY2NDE3ODMwMiwiZXhwIjoxNjY0MTgxOTAyfQ.Vl1PyM3cW4nigAF6c1l3SKaj0Ir8B7yXdaChDV_cRDuz9sCxVqi6zq5zFacHhI4BRvw_CHi3WoYhQ_K2rMT6HQBgaAEb3Tpuy_tntbBY6Gb1fWQOjPNeNuz0cQbFEaHZoyCMXnwxf9pp5zx-g9MpWRv180L4LDixGRQ5OqiL_85aE_vODaNsUHeZQTT1-Ej2avaZLTvULpHnnsntvw3bvR_p2KznC2PQoLK3GxU6gVTzde4jWEbv5GdS1ZebtOc6i2IVmIrW7VpqvzRD0mdn0FdVHVsDnadbfrVq0OdH8pPw2jNNp1U3DL4evalIOxRpMJcHIMbs4yFnDF5iNDKdPg', NULL, NULL, NULL, 'Active', NULL, '', 'T6JMY1MD2B', '', 'ETB', 'en', 68, '2022-09-26 06:59:16', '2022-09-26 07:46:09', NULL, NULL),
(10014, 'waqas', 'ayub', 'waqasayubawan123@gmail.com', '92', '1', '3075004113', '$2y$10$6QZFqAIql07LpQbuEq3hg./o3RNNGMQi/VuDIv4EI5QVeeBeV1ASG', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'dZ4O3qJjRv2WTyZ_J9GYT_:APA91bEywdSlqTIIkdopXCRv1NQkWX4D25qZwH3-xajaDG4ZDnSptzhzpa6S4Puy_e0-Ga4zMjTswwGbdaNxdK18B9uYtUxF9H6TpAO3P2jaWyuviYULDhUpQ1YRuRRGxS83_Xs9xHW9', 'KGRXS1ZDGP', '', 'ETB', 'en', 162, '2022-09-28 15:33:54', '2022-09-28 15:33:55', NULL, NULL),
(10016, 'Ayesha', 'Ishfaq', NULL, '92', '1', '03075004113', '$2y$10$QCBG4aKTg6oGhC1tTJPLY.AeqH8b4PVlcM0qe6gSGJEejiRUuUaBy', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', 'EF0UQGJMFR', NULL, NULL, '', 162, '2022-09-29 02:29:54', '2022-09-29 02:29:54', NULL, NULL),
(10017, 'waqas', 'ayub', NULL, '92', '1', '3075001222', '$2y$10$cOby6dnmFGNTWJ2hl67.qemYEO5xHk4FV5dpm.v3HQxs.BaCEW5Rq', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', 'M635AUMSEG', '', NULL, '', 162, '2022-09-29 03:03:06', '2022-09-29 03:03:06', NULL, NULL),
(10018, 'waqas', 'ayub', NULL, '994', '1', '03076767345', '$2y$10$3obHbvcCbry6RmHxI4MXqO9Uv2OrmeCuNlzYZG.lJc5DfcAXiY0DG', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', '1E9UAZRMJN', NULL, NULL, '', 15, '2022-09-29 08:45:10', '2022-09-29 08:45:10', NULL, NULL),
(10019, 'Ali', 'ayub', NULL, '93', '1', '2222222', '$2y$10$y0w9EYp7Raa21zFFCNAw8OHxI0deEmLRKL0nnTDl3Y0BebwgT1i1i', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', 'LIJN3ITENL', '1E9UAZRMJN', NULL, '', 1, '2022-10-03 11:44:47', '2022-10-03 11:44:47', NULL, NULL),
(10020, 'esha', 'Usman', 'fsdsdf123445@gmail.com', '92', '1', '03076707345', '$2y$10$b9UWkAIrSbr2/lIN7b8Sw.IYxwhCOJEhi0uQfFXre28r28DTlh4Dm', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', 'NZ9K8PTTHM', NULL, NULL, '', 162, '2022-10-04 01:50:26', '2022-10-04 01:50:26', NULL, NULL),
(10021, 'Ali', 'awan', 'waqasayasdsadubawan123@gmail.com', '92', '1', '03072767345', '$2y$10$wdhwjySBcG0E0Be5o1KW9u0OQqVDYeTHI3RdFsvAnV8rXyv2EF36G', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', 'RSNMYAVQOD', NULL, NULL, '', 162, '2022-10-04 02:05:36', '2022-10-04 02:05:36', NULL, NULL),
(10022, 'Ali', 'awan', '2323234234234234234234@gmail.com', '92', '1', '03072723345', '$2y$10$1A7/Y5PrTCKtJuKefVx.Kuozc5bc4zn8wCDlXJ5Rc0FSpFGVTS.JC', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', 'lante', NULL, NULL, '', 162, '2022-10-04 02:09:27', '2022-10-04 02:09:27', NULL, NULL),
(10023, 'Ali', 'awan', '1@gmail.com', '92', '1', '03072723112', '$2y$10$.TFNiRDw6v/BoELUZDyope4GpDTjd2tCJpHdj7UNu54CRayDoc2rm', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', '03072723112', NULL, NULL, '', 162, '2022-10-04 02:21:03', '2022-10-04 02:21:03', NULL, NULL),
(10024, 'noman', 'aziz', 'nomanaz@gmail.com', '92', '1', '3004846199', '$2y$10$fRoeWg.S5zs1OqfkQ62xeOU8HwePsFMwsSu8118LWp6dblVDbdf3e', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', NULL, '', '3004846199', '03072723112', NULL, '', 162, '2022-10-04 02:25:22', '2022-10-04 02:25:22', NULL, NULL),
(10025, 'waqas', 'ayub', NULL, '92', '1', '3081234567', '$2y$10$hTRyNKxQLr7oYHCrnc54R.Ir9KHknpfH/xHtmdr.ghv.vSbnthlIe', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Document_details', NULL, '', '3081234567', '', NULL, '', 162, '2022-10-08 09:53:05', '2022-10-08 13:41:14', NULL, NULL),
(10026, 'Usman', 'nazir', NULL, '92', '1', '32154462223423', '$2y$10$IwrBl0SccYZJWBLLjNtYnuZLhaOmkBnlcJkyLhWpyz2p5TmbUmbmm', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '321544622234', '', 'ETB', 'en', 162, '2022-10-13 00:35:25', '2022-10-13 00:35:25', NULL, NULL),
(10027, 'Usman', 'nazir', NULL, '92', '1', '32154462223423', '$2a$12$rpyitBprcEMt45m3ZGfD4ubTjmgGaob0VlGlWdymY8eK/KKMfJUIO\r\n', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'dncuidxkR36MHu8knVi2GP:APA91bFGB51lV5uo0K620Z3jjI1IqKpVNp3343-AbKosz4KgoGfLUUS8bqFFRMiNPSw5pL9MwV28lnExHX1B0rq2m-JmbKy2_IZFcoxpSUzYXl6z3B82Gc4jYnC7ZCv94GZRVUeb7-uB', '321544622234', '', 'ETB', 'en', 162, '2022-10-13 00:35:51', '2022-10-13 00:37:24', NULL, NULL),
(10028, 'wicky', 'g', NULL, '92', '2', '308777636636', '$2y$10$kbUhRX5KVTjsnh8iTJvkkOyj1P07ilYB8VmgMoJVqLQDeGtnyC3BG', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '1', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjY1NjI4NjAzLCJleHAiOjE2NjgyNTY2MDMsIm5iZiI6MTY2NTYyODYwMywianRpIjoiaTE4NHpFWHllTG9WbmJIVSIsInN1YiI6MTAwMjcsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.lGuxDnJQKx6boY2R8nIc_wXfa8Uc9FSIvanjXNkffek', '308777636636', '', 'ETB', 'en', 162, '2022-10-13 00:37:42', '2022-10-13 00:37:42', NULL, NULL),
(10029, 'wicky', 'g', '', '92', '2', '308777636636', '$2a$12$rpyitBprcEMt45m3ZGfD4ubTjmgGaob0VlGlWdymY8eK/KKMfJUIO\n', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '', '', 'ETB', 'en', 162, '2022-10-13 00:39:32', '2022-10-13 00:39:32', NULL, NULL),
(10030, 'wicky', 'g', '', '92', '2', '3087776366363', '$2y$10$8J364fSaKf4j5eySC0ikT.9GsH1lHfcFjrkDg4LHFOvX6dWgtXOR2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636636', '', 'ETB', 'en', 162, '2022-10-13 00:41:25', '2022-10-13 00:41:25', NULL, NULL),
(10031, 'wicky', 'g', '', '92', '2', '30877763663', '$2y$10$6kZWFtZm17RIH4rw9uCSzeb3c1JskTruSUo6DqNbYagnwgZ/uD3S.', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '30877763663', '', 'ETB', 'en', 162, '2022-10-13 00:42:04', '2022-10-13 00:42:04', NULL, NULL),
(10032, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$JNHYJaFyWksrKTPAbPXkYeIO3X.D6BpJdqG6Un6xFiQTujKet7lJC', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:44:16', '2022-10-13 00:44:16', NULL, NULL),
(10033, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$5IFIhyvFsJvzdcUBcMDCVOnI7DtGlrxkYBNS690Xu1MKSiYInnCWa', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:55:57', '2022-10-13 00:55:57', NULL, NULL),
(10034, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$ga2T0NIUniEikWjWpsWoX.0OrmadrghRa17KaPST88xspB/RAmTpm', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:56:13', '2022-10-13 00:56:13', NULL, NULL),
(10035, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$5QCFd7JygrXv5GZrRlovTunJiUY0M62jeXs.ofgbRs6ea2q1f.q3q', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:56:26', '2022-10-13 00:56:26', NULL, NULL),
(10036, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$oHsbZvUUjFyqD1pDbBXRS.p2mQ3e1QltsucHflOC8e8kjdQ319ol6', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:57:00', '2022-10-13 00:57:00', NULL, NULL),
(10037, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$hFxOfj1B/.o0sgNjE9U01eT4G4nZJ9Au2DyxV4NA60YRkcwDme32W', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:57:37', '2022-10-13 00:57:37', NULL, NULL),
(10038, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$p9vQLIjtfBr2558XinBjGuIO9MeJ6J/QIOI50f2L9KBGOp4pwNlGq', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:57:52', '2022-10-13 00:57:52', NULL, NULL),
(10039, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$I0DcPK/QgLuKABDAf1SZdOSVNu43zSkuz5Gz3Z0.UxPB9ttW8m6t2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:58:11', '2022-10-13 00:58:11', NULL, NULL),
(10040, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$VjTL1iRRvCivDOsxlQlMherQjlmXNT7zzoRVsvNOl3PaSN6qyN.VC', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:58:24', '2022-10-13 00:58:24', NULL, NULL),
(10041, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$MtXqlhS0pRc/HPCwBZTmfeFXI.17gkoHXAtiJ/NaSipQCGYV1Wh.O', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 00:59:48', '2022-10-13 00:59:48', NULL, NULL),
(10042, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$bltpWKmNJbXg6uVvt03UCu.i1eKytGbCEcoQVG8ZPE5uj5apaUKLS', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 01:01:18', '2022-10-13 01:01:18', NULL, NULL),
(10043, 'wicky', 'g', '', '92', '2', '3087776366312', '$2y$10$pylYl6dGF2OohBdWYCoa0OFs7.hoizhD6zWQRnR0ZnaSqu/Nuj1kG', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-10-13 01:02:08', '2022-10-13 01:02:08', NULL, NULL),
(10044, 'Usman', 'nazir', NULL, '92', '1', '32154462223423412', '$2y$10$pcsyOzl6Dyb8n62yxgPyr.J2CFZBehEbF.MzeQ8QjEN6VVQJQ7Fz.', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '321544622234', '', 'ETB', 'en', 162, '2022-10-16 17:24:28', '2022-10-16 17:24:28', NULL, NULL),
(10045, 'Usman', 'nazir', NULL, '92', '1', '321544622234234124', '$2y$10$d9DacaZNgXqCkmEDJZH.Ae0Q5ty/s/WhY6bqbwjTsSoX3ppXZzUO6', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '321544622234', '', 'ETB', 'en', 162, '2022-10-16 18:10:09', '2022-10-16 18:10:09', NULL, NULL),
(10047, 'Usman', 'nazir', NULL, '92', '1', '3215446222342341242', '$2y$10$.twQqL46iXxdzNxe5AmT1uzDaNTOCt3fVujAoy4vacXzVdY/MMNCm', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '321544622234', '', 'ETB', 'en', 162, '2022-10-25 16:48:54', '2022-10-25 16:48:54', NULL, NULL),
(10048, 'Ibrar', 'Ali', '', '92', '2', '3135304919', '$2y$10$Rh2qs0pjee6f2n2hh7Ezeu2RxO3nrXLmusYzJlIAVV/yzff9V8Cma', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '3135304919', '', 'ETB', 'en', 162, '2022-10-25 16:49:48', '2022-10-25 16:49:48', NULL, NULL),
(10049, 'Ibrar', 'Ali', '', '92', '2', '3135304919', '$2y$10$XdrNgmll31eQeO04K9CbEuXB9e2LSPsFH1R9OCmNbOG.RMNdN7rS.', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '', '', 'ETB', 'en', 162, '2022-10-25 17:23:31', '2022-10-25 17:23:31', NULL, NULL),
(10050, 'Usman', 'nazir', NULL, '92', '1', '32154462223423412423', '$2y$10$X7ggq7auKI7oGH5NdWWq0ueVcFR0purQZbufo6fbGFKOMBYpu6awa', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '321544622234', '', 'ETB', 'en', 162, '2022-10-27 08:28:20', '2022-10-27 08:28:20', NULL, NULL),
(10051, 'Ibrar', 'Ali', '', '92', '2', '3135304919', '$2y$10$I5RrXNt5d0kaOGPsWs2YyeUp4XuCRrDwDOnMteFrzFqkpr4RtGWhK', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '', '', 'ETB', 'en', 162, '2022-10-27 08:28:46', '2022-10-27 08:28:46', NULL, NULL),
(10052, 'Ibrar', 'Ali', '', '92', '2', '313530491932', '$2y$10$gecNtPpAJpQLl2sGvrnR5exDZUMYpA.y4RIGq4Ugs8RD6T1G9aGrK', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '313530491932', '', 'ETB', 'en', 162, '2022-10-27 08:35:57', '2022-10-27 08:35:57', NULL, NULL),
(10053, 'Usman', 'nazir', NULL, '92', '1', '03075004113', '$2y$10$uG0z0dmKABcJ59pTrZq5W.QhTj7olUS/agugcyvoSsqXJ9PAd9O9m', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '03075004113', '', 'ETB', 'en', 162, '2022-11-04 02:26:30', '2022-11-04 02:26:30', NULL, NULL),
(10054, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$7pdusQ7/TsDwHsWDLJvBpuKq1jCIoMDiSVCLl/EcnihYsBpN/5EwG', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-04 02:33:37', '2022-11-04 02:33:37', NULL, NULL),
(10055, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$h3PJH8XquhBTaD1V.OOOK.yBbkGnXHb3QD53umc7xuxORBufYvcwe', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-04 02:40:20', '2022-11-04 02:40:20', NULL, NULL),
(10056, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$J4wKiNg71r7e9lOUb2lc8ujCi3aWtUQHuAmZiZOrt3k5cWhspO.kO', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-04 05:24:14', '2022-11-04 05:24:14', NULL, NULL),
(10057, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$fdPppJRNYk9gu2.pmYfajubZhUG.SopsAdmSdxGSUT4cXdbLvYeGi', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 05:25:16', '2022-11-05 05:25:16', NULL, NULL),
(10058, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$e01CknqW3Hp4nB9DIGQkj.l.WvpVyctRjY.TU3xeJeOzsKMZKr6VW', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 05:40:15', '2022-11-05 05:40:15', NULL, NULL),
(10059, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$YE5aZx2RQqk1cMV2GAKbk..gUbxkbnuCLXkhSi4Ddcfejs2OIhlYm', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 05:45:03', '2022-11-05 05:45:03', NULL, NULL),
(10060, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$gawtAhOwyQX.s/b5AvXIyemkwpupSpDLpXgoVgvpbhG6X1WrRQTqe', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:12:11', '2022-11-05 06:12:11', NULL, NULL),
(10061, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$ilMKjS3K0uedZeu7/HGKpeZzlU8HWmgJuYc49lYY/QagJnkqF0ZLi', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:13:51', '2022-11-05 06:13:51', NULL, NULL),
(10062, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$me6HGDLdN/J0A1aychhgaeHNtjkYDrIB9orDZyGLM0lkPD/uCJ3Z6', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:14:22', '2022-11-05 06:14:22', NULL, NULL),
(10063, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$mFLO49vvWFw1hY/E.PX7au89hK7k/Ez/p8voY7E.hd6bpEp9tlEfm', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:16:23', '2022-11-05 06:16:23', NULL, NULL),
(10064, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$jq1E2e.NUiJN.cdKgGXFB.zDsAm2c24YIF8BfqvaK/1C5ftSLtOS2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:18:12', '2022-11-05 06:18:12', NULL, NULL),
(10065, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$aHhhzYfVrQl8bEKU28XDz.iNDdSbvpVVbIaa66HQPUQqags.usvDi', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:20:40', '2022-11-05 06:20:40', NULL, NULL),
(10066, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$WJNqGzovLuOo7AectDT6aekbKEuU/JGWPPBh0X5XqwOXQ7vEGG8N.', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:25:47', '2022-11-05 06:25:47', NULL, NULL),
(10067, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$RSvHxXCFutnlqaOkEUYpaujv7OQnXFczwHAeVBj9gl4h.Ca7SbTUC', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:39:21', '2022-11-05 06:39:21', NULL, NULL),
(10068, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$zyNjSUx5qaylNEW2pLTSQO9EzR35oBmx53ElWfUCCVLmjkosBtb9m', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 06:41:35', '2022-11-05 06:41:35', NULL, NULL),
(10069, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$MzpBJiYX6yHJOAd24vq9HOXxOikBo.HDsMvTGZKxwTw/O0dqHNiiW', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 14:10:39', '2022-11-05 14:10:39', NULL, NULL),
(10070, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$77gWXszeMWhGWANhJXJvjuYZ.bEZfkwr96RB4w8ufyuoyrMoLB8y6', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 14:12:04', '2022-11-05 14:12:04', NULL, NULL),
(10071, 'wicky', 'g', '', '92', '2', '308777636631223', '$2y$10$fUYORr.KQgRUOFdCLmBu7OCs2s.lHXUWgFcaEjesEDEP2ukYd2l1S', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '308777636631', '', 'ETB', 'en', 162, '2022-11-05 14:12:25', '2022-11-05 14:12:25', NULL, NULL),
(10072, 'Osama', 'Ali', NULL, '92', '1', '03092323233', '$2y$10$kPBVcT22AHtSHPDK7rRL4OOgPzoEekgKDHhvxOF1DgDjuIguMhj2m', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '03092323233', '', 'ETB', 'en', 162, '2022-11-05 16:07:11', '2022-11-05 16:07:11', NULL, NULL),
(10073, 'asd', 'sads', '', '92', '2', '33234234234324444444', '$2y$10$BV7qgTz2rM0ZtQNBFFseWeZXaC8chy05nLNB3vYk/6HqWO1.YjGVi', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '332342342343', '', 'ETB', 'en', 162, '2022-11-05 18:07:28', '2022-11-05 18:07:28', NULL, NULL),
(10074, '', '', '', '92', '2', '', '$2y$10$4VFQwx7yoj00LbRONpkfbuZwuidM61LEmGmbgMWjjhHRZAZFd7XN2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '', '', 'ETB', 'en', 162, '2022-11-05 18:07:49', '2022-11-05 18:07:49', NULL, NULL),
(10075, 'sdas', 'asdd', '', '92', '2', '234234343244234', '$2y$10$WOyYyPxWgZbP5Yn934aS6.Ie6iaXxKFP4R8/mb5DJ7vNzS1r1b/8.', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '234234343244', '', 'ETB', 'en', 162, '2022-11-05 18:18:49', '2022-11-05 18:18:49', NULL, NULL),
(10076, 'sdas', 'asdd', '', '92', '2', '234234343244234', '$2y$10$kF5zM5UQnkDLytX3rOzf5uSP17Yg0CjzAyZME34oFSY4wr1PeuFz.', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '234234343244', '', 'ETB', 'en', 162, '2022-11-05 18:19:41', '2022-11-05 18:19:41', NULL, NULL),
(10077, 'sdas', 'asdd', '', '92', '2', '234234343244234', '$2y$10$2IKLvHOvIsPTD/QMDbEEZ.gj6G13OtupN0WiUkGCvBCp73VRrd0j2', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', '234234343244', '', 'ETB', 'en', 162, '2022-11-05 18:23:36', '2022-11-05 18:23:36', NULL, NULL),
(10078, 'Osama', 'Ali', NULL, '92', '1', '0309232323378424', '$2y$10$JUr0NDX6sXsqrPIZZtVa/OC/UBY.rr07.BV6Si92IsUjGybtRCkGC', 'Driver', 1, NULL, NULL, NULL, NULL, NULL, 'Car_details', '2', 'cxxPdhEOT3Gz1brxdNcKQ9:APA91bHAIaI9OpuWoAOSANnDdSFmkRhWS7YFViIOZZvI03KAiKLJqx5AdvOygtGfLBLTGrr1dR1Km8XnhZYwuFwgqSOnmn7z4STjPgdsXhfToIMKkTzYyzmNCjyHOx30a5RK_PeegLMA', '030923232337', '', 'ETB', 'en', 162, '2022-11-06 03:23:45', '2022-11-06 03:23:45', NULL, NULL),
(10079, '0UEiQGl4s5', '7MNcktTx9K', '', '92', '2', '5895183', '$2y$10$W6jZQvG2mnNeecBSPw1teerlQmE9HZJO7pM.WC9H2mhPOVL6a/6hC', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', ' 34534543534', '', 'ETB', ' en', 162, '2022-11-06 03:42:49', '2022-11-06 03:42:49', NULL, NULL),
(10080, '3IVhgSgEHb', 'aX8jrNhXcX', '', '92', '2', '6542585', '$2y$10$r.2PUDdoJaKeUak.cwPwNuEHbTPxms482zXBXahaJMDhVPQyKvpkC', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', '', '', ' 34534543534', '', 'ETB', ' en', 162, '2022-11-06 03:43:46', '2022-11-06 03:43:46', NULL, NULL),
(10081, 'waqas', 'Ishfaq', 'fsdsdf@gmail.com', '92', '1', '234232356756765', '$2y$10$eu/iVEHjLa/epNQwYePXc.3tWj9t21BOLXueV4sGEjuwhmRaKU3ye', 'Rider', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', '234232356756', '', NULL, '', 162, '2022-12-29 05:59:29', '2022-12-29 05:59:29', NULL, NULL),
(10082, 'Adeel', 'Ahemed', 'fsdsdf234@gmail.com', '93', '1', '234234234234', '$2y$10$rLPx9Rtfqo6HGiXBboQkSOTiWchpf4fpE1wNr.noLS9IKQIEZTkZG', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', '234234234234', '', NULL, '', NULL, '2022-12-29 06:07:48', '2022-12-29 06:07:48', NULL, 1),
(10083, 'Muneeba', 'Ayub', 'waqs@sevenkocept.com', '92', '1', '312012121212', '$2a$12$XWF1mxS5zhsqJAst0m2ETOTjgdb4PydDFOL42TulDA3wDbRjYdj1K', 'Corporate', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, '', '312012121212', '', NULL, '', NULL, '2022-12-29 06:12:13', '2022-12-29 06:12:13', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_promo_code`
--

CREATE TABLE `users_promo_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `promo_code_id` int(10) UNSIGNED NOT NULL,
  `trip_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `vehicle_make_id` int(11) NOT NULL,
  `vehicle_model_id` int(11) NOT NULL,
  `vehicle_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `user_id`, `company_id`, `vehicle_make_id`, `vehicle_model_id`, `vehicle_id`, `vehicle_type`, `vehicle_name`, `vehicle_number`, `is_active`, `year`, `color`, `default_type`, `status`) VALUES
(1, 10001, 1, 4, 7, '4', 'Pool', 'Toyota Axio', 'KCA978K', 1, '2019', 'Silver', '1', 'Active'),
(2, 10005, 1, 4, 7, '4', 'Pool', 'Toyota Axio', 'KAZ00J', 1, '2015', 'White', '1', 'Active'),
(3, 10007, 1, 4, 7, '3', 'Pool Lite', 'Toyota Axio', '34521', 0, '2001', 'blue', '0', 'Inactive'),
(4, 10007, 1, 3, 6, '4', 'Pool', 'Nissan Sunny', '33333', 0, '1999', 'd', '0', 'Inactive'),
(5, 10010, 1, 4, 7, '2', 'Pool Mini', 'Toyota Axio', '123', 0, '2022', 'red', '0', 'Inactive'),
(7, 10001, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '3453454', 1, '2022', 'red', '0', 'Active'),
(8, 10001, 1, 1, 1, '1', 'Pool Micro', 'Maruti Swift', '3453454', 0, '2022', 'red', '0', 'Inactive'),
(9, 10001, 1, 3, 5, '1', 'Pool Micro', 'Nissan Terrano', '22222345345', 1, '2022', 'blue', '0', 'Active'),
(10, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '5001', 1, '2022', 'black', '0', 'Active'),
(11, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '2222223', 1, '2022', 'red', '', 'Active'),
(12, 10024, 1, 2, 4, '1', 'Pool Micro', 'Hyundai Grand i10', '22222233', 1, '2021', 'red', '', 'Active'),
(13, 10024, 1, 1, 1, '1', 'Pool Micro', 'Maruti Swift', '2222223345', 1, '2021', 'red', '', 'Active'),
(14, 10024, 1, 1, 2, '1', 'Pool Micro', 'Maruti Wagon R', '2222223234', 1, '2021', 'red', '', 'Active'),
(15, 10024, 1, 1, 0, '1', 'Pool Micro', 'Maruti ', '2222234534554', 1, '2022', 'red', '', 'Active'),
(16, 10024, 1, 1, 0, '1', 'Pool Micro', 'Maruti ', '2222234534554', 1, '2022', 'red', '', 'Active'),
(17, 10024, 1, 1, 0, '1', 'Pool Micro', 'Maruti ', '2222234534554', 1, '2022', 'red', '', 'Active'),
(18, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '2222234534523', 1, '2022', 'red', '0', 'Active'),
(19, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '2222234534523', 1, '2022', 'red', '0', 'Active'),
(20, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '3453454234234', 1, '2021', 'red', '', 'Active'),
(21, 10024, 1, 3, 5, '1', 'Pool Micro', 'Nissan Terrano', '3453454234234', 1, '2021', 'red', '0', 'Active'),
(22, 10024, 1, 2, 3, '1', 'Pool Micro', 'Hyundai Elite i20', '12345678', 1, '2022', 'red', '', 'Active'),
(23, 10024, 1, 2, 4, '3', 'Pool Lite', 'Hyundai Grand i10', '123456789', 1, '2022', 'black', '', 'Active'),
(24, 10024, 1, 2, 3, '4', 'Pool', 'Hyundai Elite i20', '2021', 1, '2022', 'red', '', 'Active'),
(25, 10024, 1, 2, 3, '3', 'Pool Lite', 'Hyundai Elite i20', '2222234534545', 1, '2022', 'red', '0', 'Active'),
(26, 10024, 1, 1, 1, '1', 'Pool Micro', 'Maruti Swift', '545645645trt', 1, '2022', 'red', '1', 'Active'),
(28, 10025, 1, 0, 0, '2', 'Pool Mini', 'Mehran 2012', 'KBK6344', 0, '2022', 'pink', '0', 'Inactive'),
(29, 10025, 1, 0, 0, '4', 'Pool', 'test other make test other model', '22222345', 1, '2022', 'red', '0', 'Active'),
(30, 10025, 1, 0, 0, '4', 'Pool', 'Honda City X', '2222212345', 1, '2022', 'red', '0', 'Active'),
(33, 10025, 1, 0, 0, '4', 'Pool', 'Civic 234 - Test model', '34534541234', 1, '2022', 'red', '1', 'Active'),
(34, 10025, 1, 0, 0, '4', 'Pool', ' - ', '345345432ewrewr', 0, '2022', 'red', '0', 'Inactive'),
(35, 10025, 1, 1, 5, '4', 'Pool', 'Maruti - Terrano', '2222223asd', 0, '2022', 'red', '0', 'Inactive'),
(36, 10045, 1, 1, 1, '1', 'Pool Micro', 'Maruti - Swift', '2222223455654645', 1, '2022', 'purple', '0', 'Active'),
(37, 10050, 1, 1, 2, '1', 'Pool Micro', 'Maruti - Wagon R', '345345435345', 1, '2022', '23', '0', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_make`
--

CREATE TABLE `vehicle_make` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make_vehicle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_make`
--

INSERT INTO `vehicle_make` (`id`, `make_vehicle_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Maruti', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 'Hyundai', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(3, 'Nissan', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 'Toyota', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_model`
--

CREATE TABLE `vehicle_model` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_make_id` int(11) NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_model`
--

INSERT INTO `vehicle_model` (`id`, `vehicle_make_id`, `model_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Swift', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(2, 1, 'Wagon R', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(3, 2, 'Elite i20', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(4, 2, 'Grand i10', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(5, 3, 'Terrano', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(6, 3, 'Sunny', 'Active', '2022-09-10 05:17:15', '2022-09-10 05:17:15'),
(7, 4, 'Axio', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paykey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `api_credentials`
--
ALTER TABLE `api_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applied_referrals`
--
ALTER TABLE `applied_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applied_referrals_user_id_foreign` (`user_id`),
  ADD KEY `applied_referrals_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel`
--
ALTER TABLE `cancel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancel_trip_id_foreign` (`trip_id`),
  ADD KEY `cancel_user_id_foreign` (`user_id`),
  ADD KEY `cancel_cancel_reason_id_foreign` (`cancel_reason_id`);

--
-- Indexes for table `cancel_reasons`
--
ALTER TABLE `cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel_reason_translations`
--
ALTER TABLE `cancel_reason_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cancel_reason_translations_cancel_reason_id_locale_unique` (`cancel_reason_id`,`locale`),
  ADD KEY `cancel_reason_translations_locale_index` (`locale`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_type_status_index` (`status`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_country_id_foreign` (`country_id`),
  ADD KEY `companies_status_index` (`status`);

--
-- Indexes for table `company_documents`
--
ALTER TABLE `company_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_documents_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_payout_credentials`
--
ALTER TABLE `company_payout_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_payout_credentials_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_payout_preference`
--
ALTER TABLE `company_payout_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_payout_preference_company_id_foreign` (`company_id`);

--
-- Indexes for table `corporate`
--
ALTER TABLE `corporate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_short_name_unique` (`short_name`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_code_unique` (`code`),
  ADD KEY `currency_status_default_currency_paypal_currency_index` (`status`,`default_currency`,`paypal_currency`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_status_index` (`status`);

--
-- Indexes for table `documents_langs`
--
ALTER TABLE `documents_langs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_langs_documents_id_locale_unique` (`documents_id`,`locale`),
  ADD KEY `documents_langs_locale_index` (`locale`);

--
-- Indexes for table `driver_address`
--
ALTER TABLE `driver_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `driver_address_user_id_unique` (`user_id`);

--
-- Indexes for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_documents_type_vehicle_id_user_id_index` (`type`,`vehicle_id`,`user_id`);

--
-- Indexes for table `driver_location`
--
ALTER TABLE `driver_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_location_user_id_foreign` (`user_id`),
  ADD KEY `driver_location_car_id_foreign` (`car_id`),
  ADD KEY `driver_location_status_latitude_longitude_index` (`status`,`latitude`,`longitude`);

--
-- Indexes for table `driver_owe_amounts`
--
ALTER TABLE `driver_owe_amounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_owe_amounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `driver_owe_amount_payments`
--
ALTER TABLE `driver_owe_amount_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_owe_amount_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `driver_payment`
--
ALTER TABLE `driver_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_payment_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_sos`
--
ALTER TABLE `emergency_sos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emergency_sos_user_id_foreign` (`user_id`),
  ADD KEY `emergency_sos_country_id_foreign` (`country_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filter_objects`
--
ALTER TABLE `filter_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_objects_filter_id_foreign` (`filter_id`);

--
-- Indexes for table `filter_options`
--
ALTER TABLE `filter_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filter_options_translations`
--
ALTER TABLE `filter_options_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_options_translations_filter_option_id_foreign` (`filter_option_id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`),
  ADD KEY `help_category_id_foreign` (`category_id`);

--
-- Indexes for table `help_category`
--
ALTER TABLE `help_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_category_lang`
--
ALTER TABLE `help_category_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_category_lang_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `help_category_lang_locale_index` (`locale`);

--
-- Indexes for table `help_subcategory`
--
ALTER TABLE `help_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `help_subcategory_category_id_foreign` (`category_id`);

--
-- Indexes for table `help_sub_category_lang`
--
ALTER TABLE `help_sub_category_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_sub_category_lang_sub_category_id_locale_unique` (`sub_category_id`,`locale`),
  ADD KEY `help_sub_category_lang_locale_index` (`locale`);

--
-- Indexes for table `help_translations`
--
ALTER TABLE `help_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_translations_help_id_locale_unique` (`help_id`,`locale`),
  ADD KEY `help_translations_locale_index` (`locale`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `join_us`
--
ALTER TABLE `join_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_value_index` (`value`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_fare`
--
ALTER TABLE `manage_fare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manage_fare_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_translations_pages_id_locale_unique` (`pages_id`,`locale`),
  ADD KEY `pages_translations_locale_index` (`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_user_id_foreign` (`user_id`);

--
-- Indexes for table `payout_credentials`
--
ALTER TABLE `payout_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payout_credentials_type_index` (`type`);

--
-- Indexes for table `payout_preference`
--
ALTER TABLE `payout_preference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peak_fare_details`
--
ALTER TABLE `peak_fare_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peak_fare_details_fare_id_foreign` (`fare_id`),
  ADD KEY `peak_fare_details_day_start_time_end_time_index` (`day`,`start_time`,`end_time`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pool_trips`
--
ALTER TABLE `pool_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pool_trips_driver_id_foreign` (`driver_id`),
  ADD KEY `pool_trips_toll_reason_id_foreign` (`toll_reason_id`),
  ADD KEY `pool_trips_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `profile_picture`
--
ALTER TABLE `profile_picture`
  ADD UNIQUE KEY `profile_picture_user_id_unique` (`user_id`);

--
-- Indexes for table `promo_code`
--
ALTER TABLE `promo_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_code_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_trip_id_foreign` (`trip_id`),
  ADD KEY `rating_user_id_foreign` (`user_id`),
  ADD KEY `rating_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `referral_settings`
--
ALTER TABLE `referral_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_users_user_id_foreign` (`user_id`),
  ADD KEY `referral_users_referral_id_foreign` (`referral_id`),
  ADD KEY `referral_users_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_user_id_foreign` (`user_id`),
  ADD KEY `request_car_id_foreign` (`car_id`),
  ADD KEY `request_driver_id_foreign` (`driver_id`),
  ADD KEY `request_status_index` (`status`);

--
-- Indexes for table `rider_location`
--
ALTER TABLE `rider_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rider_location_user_id_unique` (`user_id`);

--
-- Indexes for table `ringtones`
--
ALTER TABLE `ringtones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedule_cancel`
--
ALTER TABLE `schedule_cancel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_cancel_schedule_ride_id_foreign` (`schedule_ride_id`),
  ADD KEY `schedule_cancel_cancel_reason_id_foreign` (`cancel_reason_id`);

--
-- Indexes for table `schedule_ride`
--
ALTER TABLE `schedule_ride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_ride_user_id_foreign` (`user_id`),
  ADD KEY `schedule_ride_company_id_foreign` (`company_id`),
  ADD KEY `schedule_ride_car_id_foreign` (`car_id`),
  ADD KEY `schedule_ride_status_index` (`status`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supports_status_index` (`status`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `toll_reasons`
--
ALTER TABLE `toll_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_user_id_foreign` (`user_id`),
  ADD KEY `trips_car_id_foreign` (`car_id`),
  ADD KEY `trips_request_id_foreign` (`request_id`),
  ADD KEY `trips_driver_id_foreign` (`driver_id`),
  ADD KEY `trips_toll_reason_id_foreign` (`toll_reason_id`),
  ADD KEY `trips_currency_code_foreign` (`currency_code`);

--
-- Indexes for table `trip_toll_reasons`
--
ALTER TABLE `trip_toll_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_toll_reasons_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_fb_id_unique` (`fb_id`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`),
  ADD UNIQUE KEY `users_apple_id_unique` (`apple_id`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_country_id_foreign` (`country_id`),
  ADD KEY `users_status_user_type_index` (`status`,`user_type`);

--
-- Indexes for table `users_promo_code`
--
ALTER TABLE `users_promo_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_promo_code_user_id_foreign` (`user_id`),
  ADD KEY `users_promo_code_promo_code_id_foreign` (`promo_code_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_user_id_foreign` (`user_id`),
  ADD KEY `vehicle_company_id_foreign` (`company_id`),
  ADD KEY `vehicle_status_index` (`status`);

--
-- Indexes for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD UNIQUE KEY `wallet_user_id_unique` (`user_id`),
  ADD KEY `wallet_currency_code_foreign` (`currency_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `api_credentials`
--
ALTER TABLE `api_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `applied_referrals`
--
ALTER TABLE `applied_referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancel`
--
ALTER TABLE `cancel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancel_reasons`
--
ALTER TABLE `cancel_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cancel_reason_translations`
--
ALTER TABLE `cancel_reason_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_documents`
--
ALTER TABLE `company_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_payout_credentials`
--
ALTER TABLE `company_payout_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_payout_preference`
--
ALTER TABLE `company_payout_preference`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `corporate`
--
ALTER TABLE `corporate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documents_langs`
--
ALTER TABLE `documents_langs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver_address`
--
ALTER TABLE `driver_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_owe_amounts`
--
ALTER TABLE `driver_owe_amounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `driver_owe_amount_payments`
--
ALTER TABLE `driver_owe_amount_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_payment`
--
ALTER TABLE `driver_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `emergency_sos`
--
ALTER TABLE `emergency_sos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `filter_objects`
--
ALTER TABLE `filter_objects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `filter_options`
--
ALTER TABLE `filter_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `filter_options_translations`
--
ALTER TABLE `filter_options_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_category`
--
ALTER TABLE `help_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_category_lang`
--
ALTER TABLE `help_category_lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_subcategory`
--
ALTER TABLE `help_subcategory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_sub_category_lang`
--
ALTER TABLE `help_sub_category_lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_translations`
--
ALTER TABLE `help_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `join_us`
--
ALTER TABLE `join_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manage_fare`
--
ALTER TABLE `manage_fare`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages_translations`
--
ALTER TABLE `pages_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_credentials`
--
ALTER TABLE `payout_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payout_preference`
--
ALTER TABLE `payout_preference`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peak_fare_details`
--
ALTER TABLE `peak_fare_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `pool_trips`
--
ALTER TABLE `pool_trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_code`
--
ALTER TABLE `promo_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referral_settings`
--
ALTER TABLE `referral_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `referral_users`
--
ALTER TABLE `referral_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rider_location`
--
ALTER TABLE `rider_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ringtones`
--
ALTER TABLE `ringtones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule_cancel`
--
ALTER TABLE `schedule_cancel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_ride`
--
ALTER TABLE `schedule_ride`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toll_reasons`
--
ALTER TABLE `toll_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `trip_toll_reasons`
--
ALTER TABLE `trip_toll_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10084;

--
-- AUTO_INCREMENT for table `users_promo_code`
--
ALTER TABLE `users_promo_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applied_referrals`
--
ALTER TABLE `applied_referrals`
  ADD CONSTRAINT `applied_referrals_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`),
  ADD CONSTRAINT `applied_referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cancel`
--
ALTER TABLE `cancel`
  ADD CONSTRAINT `cancel_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `cancel_reasons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cancel_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cancel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cancel_reason_translations`
--
ALTER TABLE `cancel_reason_translations`
  ADD CONSTRAINT `cancel_reason_translations_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `cancel_reasons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_documents`
--
ALTER TABLE `company_documents`
  ADD CONSTRAINT `company_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_payout_credentials`
--
ALTER TABLE `company_payout_credentials`
  ADD CONSTRAINT `company_payout_credentials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `company_payout_preference`
--
ALTER TABLE `company_payout_preference`
  ADD CONSTRAINT `company_payout_preference_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `documents_langs`
--
ALTER TABLE `documents_langs`
  ADD CONSTRAINT `documents_langs_documents_id_foreign` FOREIGN KEY (`documents_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_address`
--
ALTER TABLE `driver_address`
  ADD CONSTRAINT `driver_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_location`
--
ALTER TABLE `driver_location`
  ADD CONSTRAINT `driver_location_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `car_type` (`id`),
  ADD CONSTRAINT `driver_location_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_owe_amounts`
--
ALTER TABLE `driver_owe_amounts`
  ADD CONSTRAINT `driver_owe_amounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `driver_owe_amount_payments`
--
ALTER TABLE `driver_owe_amount_payments`
  ADD CONSTRAINT `driver_owe_amount_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `driver_payment`
--
ALTER TABLE `driver_payment`
  ADD CONSTRAINT `driver_payment_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emergency_sos`
--
ALTER TABLE `emergency_sos`
  ADD CONSTRAINT `emergency_sos_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `emergency_sos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filter_objects`
--
ALTER TABLE `filter_objects`
  ADD CONSTRAINT `filter_objects_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filter_options_translations`
--
ALTER TABLE `filter_options_translations`
  ADD CONSTRAINT `filter_options_translations_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `help`
--
ALTER TABLE `help`
  ADD CONSTRAINT `help_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `help_category` (`id`);

--
-- Constraints for table `help_category_lang`
--
ALTER TABLE `help_category_lang`
  ADD CONSTRAINT `help_category_lang_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `help_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `help_subcategory`
--
ALTER TABLE `help_subcategory`
  ADD CONSTRAINT `help_subcategory_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `help_category` (`id`);

--
-- Constraints for table `help_sub_category_lang`
--
ALTER TABLE `help_sub_category_lang`
  ADD CONSTRAINT `help_sub_category_lang_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `help_subcategory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `help_translations`
--
ALTER TABLE `help_translations`
  ADD CONSTRAINT `help_translations_help_id_foreign` FOREIGN KEY (`help_id`) REFERENCES `help` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `manage_fare`
--
ALTER TABLE `manage_fare`
  ADD CONSTRAINT `manage_fare_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `payment_method_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `peak_fare_details`
--
ALTER TABLE `peak_fare_details`
  ADD CONSTRAINT `peak_fare_details_fare_id_foreign` FOREIGN KEY (`fare_id`) REFERENCES `manage_fare` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pool_trips`
--
ALTER TABLE `pool_trips`
  ADD CONSTRAINT `pool_trips_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`),
  ADD CONSTRAINT `pool_trips_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pool_trips_toll_reason_id_foreign` FOREIGN KEY (`toll_reason_id`) REFERENCES `toll_reasons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profile_picture`
--
ALTER TABLE `profile_picture`
  ADD CONSTRAINT `profile_picture_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_code`
--
ALTER TABLE `promo_code`
  ADD CONSTRAINT `promo_code_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD CONSTRAINT `referral_users_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`),
  ADD CONSTRAINT `referral_users_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `referral_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `car_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_location`
--
ALTER TABLE `rider_location`
  ADD CONSTRAINT `rider_location_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ringtones`
--
ALTER TABLE `ringtones`
  ADD CONSTRAINT `ringtones_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule_cancel`
--
ALTER TABLE `schedule_cancel`
  ADD CONSTRAINT `schedule_cancel_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `cancel_reasons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_cancel_schedule_ride_id_foreign` FOREIGN KEY (`schedule_ride_id`) REFERENCES `schedule_ride` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule_ride`
--
ALTER TABLE `schedule_ride`
  ADD CONSTRAINT `schedule_ride_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `car_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_ride_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `schedule_ride_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `car_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trips_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`),
  ADD CONSTRAINT `trips_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trips_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trips_toll_reason_id_foreign` FOREIGN KEY (`toll_reason_id`) REFERENCES `toll_reasons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_toll_reasons`
--
ALTER TABLE `trip_toll_reasons`
  ADD CONSTRAINT `trip_toll_reasons_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_promo_code`
--
ALTER TABLE `users_promo_code`
  ADD CONSTRAINT `users_promo_code_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_code` (`id`),
  ADD CONSTRAINT `users_promo_code_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `vehicle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_currency_code_foreign` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`),
  ADD CONSTRAINT `wallet_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
