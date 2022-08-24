-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 08:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nolan Koelpin Sr.', 'amparo02@example.com', '2022-08-24 11:20:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X2UGCZUuic', '2022-08-24 11:20:27', '2022-08-24 11:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode_or_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_details`
--

INSERT INTO `billing_details` (`id`, `country`, `address`, `city`, `postcode_or_zip`, `phone`, `order_note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Sweden', '407 General Mountain\nKautzerchester, MA 60116', 'Flatleyfurt', '43513-3401', '+18102936586', 'Repellat quasi porro enim. Aut perferendis deleniti ea saepe dolor labore.', 7, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(2, 'Germany', '9051 Margarete Plain\nPort Elyse, KS 26964', 'Port Nicole', '95874', '+16093231178', 'Et optio illum ea ipsam. Aut aut provident minima id. Saepe omnis ea quia porro et.', 5, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(3, 'Taiwan', '5174 Stewart Point\nBeierburgh, NC 28282', 'O\'Connerport', '32440', '+18288094521', 'Voluptas quam et quasi sed. Et similique aut labore voluptate atque.', 9, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(4, 'Eritrea', '232 Gusikowski Centers\nPort Colten, OR 07631', 'Wisokyport', '43709', '+19184791941', 'Mollitia voluptatibus ut porro voluptas. Dicta dolore alias et et quis aut. Ad minima rerum alias.', 6, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(5, 'Tokelau', '126 Rowe Run Apt. 790\nWest Vivianeberg, OR 79991-6031', 'South Darwinland', '16773-6424', '+13809735201', 'Est mollitia tempore ex ut. Nesciunt placeat voluptates aut dolorem molestiae.', 10, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(6, 'Mauritius', '850 Witting Common\nPort Korey, NY 02719-5534', 'South Christianburgh', '41697-6707', '+13517498909', 'Optio cumque nobis ea odit et. Voluptatem quas dicta qui accusamus rerum mollitia corporis.', 8, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(7, 'Peru', '67338 Hettinger Mission Suite 472\nWest Jeanne, DE 70424-5276', 'East Christine', '17362-8011', '+19712793683', 'Libero reprehenderit tenetur ut et. Sunt qui omnis eos dolore.', 4, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(8, 'France', '36014 Bradtke Hills\nZiemannfort, TX 27697-1533', 'Sidneyport', '71117-9405', '+18727547628', 'Excepturi explicabo est at iure. Sed sequi soluta consequatur ut aut.', 7, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(9, 'South Africa', '50808 Peggie Extensions\nEast Joelleburgh, MA 51874', 'East Deshaunmouth', '68025', '+18015882391', 'Consequuntur officiis officia similique ex laborum nobis. Ducimus in aut eius ut.', 4, '2022-08-24 11:20:32', '2022-08-24 11:20:32'),
(10, 'Bhutan', '7733 Shields Camp\nBalistreriborough, UT 39042-4677', 'Smithbury', '57501', '+14233073945', 'Modi et voluptatibus fugit in facilis. Tempore vero aut est nisi animi.', 6, '2022-08-24 11:20:32', '2022-08-24 11:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_size_available` tinyint(1) NOT NULL,
  `is_color_available` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`, `is_size_available`, `is_color_available`, `created_at`, `updated_at`) VALUES
(1, 'Category 101', 'Img of Category 101', 0, 1, '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(2, 'Category 112', 'Img of Category 112', 1, 0, '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(3, 'Category 197', 'Img of Category 197', 0, 0, '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(4, 'Category 60', 'Img of Category 60', 0, 1, '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(5, 'Category 158', 'Img of Category 158', 1, 1, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(6, 'Category 66', 'Img of Category 66', 1, 1, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(7, 'Category 141', 'Img of Category 141', 0, 0, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(8, 'Category 3', 'Img of Category 3', 0, 1, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(9, 'Category 103', 'Img of Category 103', 1, 0, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(10, 'Category 87', 'Img of Category 87', 1, 0, '2022-08-24 11:20:28', '2022-08-24 11:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `address`, `phone`, `email`, `open_time`, `img`, `created_at`, `updated_at`) VALUES
(1, '413 Schultz Street Apt. 875\nPort Bud, IA 87262', '+15085701589', 'keara91@example.com', '10.00 AM to 8.00 PM. Friday is Off Day', 'Img 122', '2022-08-24 11:20:35', '2022-08-24 11:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_in_percent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `code`, `amount_in_percent`, `created_at`, `updated_at`) VALUES
(1, '7b013', 151, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(2, '93217', 27, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(3, 'd4a100', 108, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(4, 'efc107', 118, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(5, '08c117', 12, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(6, '70292', 91, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(7, '8e4174', 18, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(8, '46e102', 46, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(9, '37144', 186, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(10, '67e184', 148, '2022-08-24 11:20:34', '2022-08-24 11:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_marked_as_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `is_marked_as_read`, `created_at`, `updated_at`) VALUES
(1, 'Riley Turner', 'mconsidine@example.com', 'Ut magni aut ab debitis omnis eaque recusandae. Sed et a dolores dolor.', 0, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(2, 'Norbert Cole DVM', 'doyle.vicky@example.net', 'Rerum deleniti quia atque eos. Ipsam neque alias id quidem quia vitae non.', 1, '2022-08-24 11:20:34', '2022-08-24 11:20:34'),
(3, 'Shea Balistreri Sr.', 'atowne@example.net', 'Voluptate et inventore natus explicabo. Laudantium sed eos doloremque voluptate quia est.', 0, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(4, 'Oran Kertzmann', 'maynard.sawayn@example.org', 'Veniam amet corporis id explicabo dolorum ut. Rerum ullam quo aliquam distinctio voluptatem.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(5, 'Wyman Walsh', 'buckridge.gayle@example.net', 'Consequatur aut cum molestiae sunt. Harum ea veritatis sed fugiat.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(6, 'Miss Ivy Koch', 'qmarks@example.com', 'Enim dicta magnam labore necessitatibus sed. Et sint magni aut qui provident.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(7, 'Prof. Fay Wuckert', 'cremin.keith@example.org', 'Dolores est voluptatum repellat consequatur. Neque fugit ut qui eaque qui consequatur.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(8, 'Kiarra Klocko', 'wiza.alverta@example.net', 'Aut et quia sapiente. Ut aut ullam dolor quas sint. Asperiores magnam id ipsa.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(9, 'Frankie Corkery Jr.', 'parker.murray@example.net', 'Tempora corporis sequi praesentium exercitationem vel. Quae error dolorum cum eaque corporis.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(10, 'Vella Armstrong', 'hegmann.jewell@example.com', 'Et tempore reprehenderit eaque ea sit ad est ut. Dolorem voluptatem excepturi pariatur et.', 1, '2022-08-24 11:20:35', '2022-08-24 11:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_20_101129_create_admins_table', 1),
(6, '2022_07_22_154152_create_user_verifies_table', 1),
(7, '2022_08_09_074532_create_categories_table', 1),
(8, '2022_08_09_075512_create_shippings_table', 1),
(9, '2022_08_09_080332_create_units_table', 1),
(10, '2022_08_09_080724_create_product_sizes_table', 1),
(11, '2022_08_09_081002_create_product_colors_table', 1),
(12, '2022_08_09_092844_create_billing_details_table', 1),
(13, '2022_08_09_093114_create_product_orders_table', 1),
(14, '2022_08_09_093444_create_discounts_table', 1),
(15, '2022_08_09_093707_create_messages_table', 1),
(16, '2022_08_09_093834_create_contact_us_table', 1),
(17, '2022_08_09_094130_create_news_letters_table', 1),
(18, '2022_08_11_153533_create_product_informations_table', 1),
(19, '2022_08_12_085835_create_products_table', 1),
(20, '2022_08_12_090716_create_stoke_out_product_request_by_user_to_admins_table', 1),
(21, '2022_08_12_091317_create_product_order_by_admin_to_companies_table', 1),
(22, '2022_08_12_091933_create_product_imgs_table', 1),
(23, '2022_08_12_092402_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_letters`
--

CREATE TABLE `news_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_letters`
--

INSERT INTO `news_letters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'schmidt.mireya@example.net', '2022-08-24 11:20:35', '2022-08-24 11:20:35'),
(2, 'sipes.manuel@example.org', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(3, 'qvon@example.net', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(4, 'gisselle73@example.com', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(5, 'mrath@example.net', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(6, 'mya.cassin@example.net', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(7, 'hbuckridge@example.net', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(8, 'gkunde@example.org', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(9, 'osbaldo01@example.org', '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(10, 'edmund15@example.net', '2022-08-24 11:20:36', '2022-08-24 11:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_information_id` bigint(20) UNSIGNED NOT NULL,
  `minimum_quantity` int(11) NOT NULL,
  `minimum_quantity_buying_price` double(8,2) NOT NULL,
  `minimum_quantity_selling_price` double(8,2) NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `discount_in_percent` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `is_shipping_free` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `product_size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_information_id`, `minimum_quantity`, `minimum_quantity_buying_price`, `minimum_quantity_selling_price`, `unit_id`, `discount_in_percent`, `stock`, `is_shipping_free`, `shipping_id`, `product_size_id`, `product_color_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 3, 862, 245.00, 445.00, 7, 11, 331, 1, 7, 3, 10, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(2, 9, 354, 942.00, 1142.00, 2, 42, 389, 1, 9, 7, 6, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(3, 8, 529, 245.00, 445.00, 10, 14, 204, 1, 2, 6, 4, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(4, 7, 407, 683.00, 883.00, 1, 14, 338, 0, 7, 1, 5, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(5, 7, 94, 747.00, 947.00, 10, 29, 53, 0, 6, 6, 2, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(6, 6, 441, 327.00, 527.00, 4, 41, 234, 0, 3, 4, 8, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(7, 7, 286, 751.00, 951.00, 9, 41, 476, 0, 2, 4, 5, 1, '2022-08-24 11:20:38', '2022-08-24 11:20:38'),
(8, 1, 485, 547.00, 747.00, 5, 39, 439, 1, 8, 5, 9, 1, '2022-08-24 11:20:39', '2022-08-24 11:20:39'),
(9, 5, 573, 869.00, 1069.00, 7, 3, 480, 0, 8, 5, 2, 1, '2022-08-24 11:20:39', '2022-08-24 11:20:39'),
(10, 3, 715, 483.00, 683.00, 10, 31, 436, 0, 8, 3, 3, 1, '2022-08-24 11:20:39', '2022-08-24 11:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Color 34', 'Img of Color 34', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(2, 'Color 128', 'Img of Color 128', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(3, 'Color 176', 'Img of Color 176', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(4, 'Color 162', 'Img of Color 162', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(5, 'Color 180', 'Img of Color 180', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(6, 'Color 77', 'Img of Color 77', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(7, 'Color 72', 'Img of Color 72', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(8, 'Color 55', 'Img of Color 55', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(9, 'Color 78', 'Img of Color 78', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(10, 'Color 188', 'Img of Color 188', '2022-08-24 11:20:31', '2022-08-24 11:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_imgs`
--

CREATE TABLE `product_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_imgs`
--

INSERT INTO `product_imgs` (`id`, `img`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'Product Img 61', 2, '2022-08-24 11:20:39', '2022-08-24 11:20:39'),
(2, 'Product Img 173', 1, '2022-08-24 11:20:39', '2022-08-24 11:20:39'),
(3, 'Product Img 73', 6, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(4, 'Product Img 109', 5, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(5, 'Product Img 69', 2, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(6, 'Product Img 21', 9, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(7, 'Product Img 56', 8, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(8, 'Product Img 52', 3, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(9, 'Product Img 160', 8, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(10, 'Product Img 86', 9, '2022-08-24 11:20:40', '2022-08-24 11:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_informations`
--

CREATE TABLE `product_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_informations`
--

INSERT INTO `product_informations` (`id`, `name`, `detail`, `information`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Product 138', 'Quia rerum veniam accusantium voluptas. Vel saepe sit eos. Quia in animi unde sit vero nihil.', 'Nobis quaerat ad quam voluptatem. Doloribus reiciendis aliquam ut saepe quasi occaecati.', 9, '2022-08-24 11:20:36', '2022-08-24 11:20:36'),
(2, 'Product 181', 'Et ullam voluptate voluptatum est corrupti a. Voluptas eum voluptates quia.', 'Quod illum modi ad qui minus dolores. Voluptas quo praesentium asperiores odit.', 3, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(3, 'Product 198', 'Fuga enim et necessitatibus consequuntur. Atque aut itaque dolores.', 'Error labore et fugiat ratione aut. Quos quaerat ut qui consequuntur et totam veniam.', 5, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(4, 'Product 95', 'Voluptatem velit ab repellat sit dicta perferendis voluptatem. Inventore tempore et iure pariatur.', 'Quis sunt ducimus totam nihil. Omnis perspiciatis natus corporis. Dolore nisi saepe est.', 9, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(5, 'Product 124', 'Fugiat magnam omnis odio maxime cum amet in. Ut quidem est voluptas.', 'Quasi cumque dolore odit. Eum placeat omnis possimus quam saepe amet reiciendis.', 8, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(6, 'Product 79', 'Sed enim necessitatibus quia doloremque. Quisquam fugit et sed nihil.', 'Odio modi quo velit quam eum. Occaecati dolor culpa fuga optio dolor et quia. Ut sed omnis nostrum.', 7, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(7, 'Product 161', 'Quos vel soluta et. Et animi sint dolores modi. Aliquam vel consequuntur et dolores distinctio.', 'Voluptatem aut itaque sit voluptatum. Voluptatem dignissimos at atque omnis aut eligendi vitae.', 7, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(8, 'Product 75', 'Qui quos in consequatur voluptatum nulla eum. Repellendus cumque nihil quia repudiandae id.', 'Deleniti rerum omnis alias a tempore praesentium. Aut doloribus suscipit et sit dicta impedit.', 4, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(9, 'Product 25', 'Adipisci saepe dolorem mollitia repellendus. Maxime consequatur quasi tempora.', 'Quos sit sunt ipsam voluptas eveniet et porro. Eum officia rerum officia quo et id quas.', 3, '2022-08-24 11:20:37', '2022-08-24 11:20:37'),
(10, 'Product 200', 'Ut ratione odio consectetur. Facere tenetur at voluptatem ad soluta nobis maxime qui.', 'Architecto qui quis eum vel odit cum nostrum. Qui repellat quidem eum ipsum.', 10, '2022-08-24 11:20:37', '2022-08-24 11:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_detail_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_coming` tinyint(1) NOT NULL DEFAULT 0,
  `product_receiving` tinyint(1) NOT NULL DEFAULT 0,
  `product_received` tinyint(1) NOT NULL DEFAULT 0,
  `is_canceled` tinyint(1) NOT NULL DEFAULT 0,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `order_detail`, `billing_detail_id`, `payment_type`, `payment_status`, `transaction_id`, `product_coming`, `product_receiving`, `product_received`, `is_canceled`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 'Quae odio quibusdam reiciendis sapiente. Ut voluptatem et velit sunt dignissimos dolorem.', 2, 'Card', 1, '66f916299e065b787ea4bc699b5560aa', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(2, 'Fugiat voluptates alias esse. Labore adipisci sint numquam ipsa delectus sed.', 1, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(3, 'Error nemo optio maiores facere. Quia qui sit voluptatibus a est enim.', 10, 'Card', 1, '43b39faf7a9c0d7761073790f4f6119b', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(4, 'Consequatur voluptatum qui voluptate unde et officiis. Ut aspernatur atque adipisci eaque.', 7, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(5, 'In iusto autem et. Consequatur et porro velit. Ea nostrum ullam quam dolorum aut eum nulla vel.', 7, 'Card', 1, '94972aac23be62a6238ea8a32abe0e4a', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(6, 'Error sint tempore nisi odit recusandae quas officia. Eos aspernatur dolorem sunt ut odit.', 6, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(7, 'Eos doloremque ea nostrum qui quam placeat quae. A quia eaque aut.', 3, 'Card', 1, '388aafee06d854f7ecd7f6f2e2bd5993', 0, 0, 0, 0, NULL, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(8, 'Iusto vel veritatis non in et. Doloribus sequi dolores dolorem quidem autem repudiandae voluptas.', 4, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(9, 'Nam omnis tempora est totam rerum. Nisi ut aliquid aliquam nulla ut laboriosam facilis nam.', 3, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-24 11:20:33', '2022-08-24 11:20:33'),
(10, 'Aliquam laboriosam atque eos est. Voluptates atque sed ut earum.', 5, 'Card', 1, '1d6f26024cf5f980b7c425391fa02744', 1, 1, 1, 0, 1, '2022-08-24 11:20:33', '2022-08-24 11:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_order_by_admin_to_companies`
--

CREATE TABLE `product_order_by_admin_to_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_received` tinyint(1) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_order_by_admin_to_companies`
--

INSERT INTO `product_order_by_admin_to_companies` (`id`, `quantity`, `is_received`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 74, 0, 7, '2022-08-24 11:20:39', '2022-08-24 11:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size 89', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(2, 'Size 10', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(3, 'Size 59', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(4, 'Size 99', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(5, 'Size 183', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(6, 'Size 179', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(7, 'Size 26', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(8, 'Size 144', '2022-08-24 11:20:30', '2022-08-24 11:20:30'),
(9, 'Size 192', '2022-08-24 11:20:31', '2022-08-24 11:20:31'),
(10, 'Size 29', '2022-08-24 11:20:31', '2022-08-24 11:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `star`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Voluptas qui fugiat tempora possimus consequatur totam odio. Minima dolor dolor alias.', 3, 9, 8, '2022-08-24 11:20:40', '2022-08-24 11:20:40'),
(2, 'Unde ullam earum aut a molestiae id occaecati est. Iure et atque quam facere recusandae est.', 5, 10, 1, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(3, 'Sunt perspiciatis iste magnam ratione eius est. Suscipit iusto rem molestias et aliquid.', 2, 3, 9, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(4, 'Sit harum voluptatem possimus optio sit enim. Minima consequatur eum laboriosam et ea a.', 5, 3, 7, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(5, 'Nihil et sed quos ex velit sit. Fuga sit est qui blanditiis fugit. Vero illum qui neque veniam.', 2, 2, 3, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(6, 'Doloremque inventore aut sint est placeat adipisci voluptatem optio. Temporibus officia qui et.', 2, 10, 1, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(7, 'Praesentium nemo ut temporibus animi. Voluptate molestiae et qui dignissimos sed mollitia.', 3, 1, 2, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(8, 'Eligendi sint rerum dolore ipsum consequatur. Consequatur illum doloremque hic illo soluta non.', 5, 3, 5, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(9, 'In doloremque aspernatur maxime officiis. Quia aut iusto harum ea. Iste voluptatem qui vel numquam.', 4, 8, 2, '2022-08-24 11:20:41', '2022-08-24 11:20:41'),
(10, 'Non perspiciatis et earum ea odit vitae. Qui amet laboriosam laborum officiis ratione consequatur.', 2, 3, 8, '2022-08-24 11:20:42', '2022-08-24 11:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_day` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `shipping_day`, `created_at`, `updated_at`) VALUES
(1, 80, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(2, 48, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(3, 97, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(4, 38, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(5, 155, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(6, 135, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(7, 150, '2022-08-24 11:20:28', '2022-08-24 11:20:28'),
(8, 191, '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(9, 137, '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(10, 37, '2022-08-24 11:20:29', '2022-08-24 11:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `stoke_out_product_request_by_user_to_admins`
--

CREATE TABLE `stoke_out_product_request_by_user_to_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stoke_out_product_request_by_user_to_admins`
--

INSERT INTO `stoke_out_product_request_by_user_to_admins` (`id`, `quantity`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 91, 6, '2022-08-24 11:20:39', '2022-08-24 11:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Unit 63', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(2, 'Unit 64', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(3, 'Unit 171', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(4, 'Unit 2', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(5, 'Unit 119', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(6, 'Unit 196', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(7, 'Unit 58', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(8, 'Unit 39', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(9, 'Unit 20', '2022-08-24 11:20:29', '2022-08-24 11:20:29'),
(10, 'Unit 132', '2022-08-24 11:20:29', '2022-08-24 11:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_email_verified`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dewayne Cruickshank PhD', 'wwelch@example.net', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VgaYPKhbrP', '2022-08-24 11:20:26', '2022-08-24 11:20:26'),
(2, 'Bennett Borer', 'katelyn.auer@example.net', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gqICrODnPn', '2022-08-24 11:20:26', '2022-08-24 11:20:26'),
(3, 'Prof. Roger Hoppe III', 'rcronin@example.com', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3ydHbXT193', '2022-08-24 11:20:26', '2022-08-24 11:20:26'),
(4, 'Chloe Botsford', 'qyost@example.net', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PAEGBNLmSy', '2022-08-24 11:20:26', '2022-08-24 11:20:26'),
(5, 'Anjali Nicolas', 'creichel@example.org', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TlM0Pp85Sd', '2022-08-24 11:20:26', '2022-08-24 11:20:26'),
(6, 'Prof. Lou Smith', 'barton.denis@example.com', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Z4cLu6BX8P', '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(7, 'Orpha Armstrong', 'chase55@example.net', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'p2zn6s9niz', '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(8, 'Dr. Ford Krajcik III', 'beau.hermiston@example.com', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8eXJaWj6uP', '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(9, 'Jerrold Metz', 'vnolan@example.net', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5OnEnKEkUu', '2022-08-24 11:20:27', '2022-08-24 11:20:27'),
(10, 'Jayden Bednar', 'olson.deborah@example.com', '2022-08-24 11:20:26', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zm4Buk4aru', '2022-08-24 11:20:27', '2022-08-24 11:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_img_unique` (`img`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_us_email_unique` (`email`),
  ADD UNIQUE KEY `contact_us_img_unique` (`img`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discounts_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_letters`
--
ALTER TABLE `news_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_letters_email_unique` (`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_product_information_id_foreign` (`product_information_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_shipping_id_foreign` (`shipping_id`),
  ADD KEY `products_product_size_id_foreign` (`product_size_id`),
  ADD KEY `products_product_color_id_foreign` (`product_color_id`),
  ADD KEY `products_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_colors_name_unique` (`name`),
  ADD UNIQUE KEY `product_colors_img_unique` (`img`);

--
-- Indexes for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_imgs_img_unique` (`img`),
  ADD KEY `product_imgs_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_informations`
--
ALTER TABLE `product_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_informations_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_billing_detail_id_foreign` (`billing_detail_id`),
  ADD KEY `product_orders_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `product_order_by_admin_to_companies`
--
ALTER TABLE `product_order_by_admin_to_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_by_admin_to_companies_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_sizes_name_unique` (`name`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shippings_shipping_day_unique` (`shipping_day`);

--
-- Indexes for table `stoke_out_product_request_by_user_to_admins`
--
ALTER TABLE `stoke_out_product_request_by_user_to_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stoke_out_product_request_by_user_to_admins_product_id_foreign` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_type_unique` (`type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_verifies_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_details`
--
ALTER TABLE `billing_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `news_letters`
--
ALTER TABLE `news_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_imgs`
--
ALTER TABLE `product_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_informations`
--
ALTER TABLE `product_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_order_by_admin_to_companies`
--
ALTER TABLE `product_order_by_admin_to_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stoke_out_product_request_by_user_to_admins`
--
ALTER TABLE `stoke_out_product_request_by_user_to_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD CONSTRAINT `billing_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `products_product_color_id_foreign` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`),
  ADD CONSTRAINT `products_product_information_id_foreign` FOREIGN KEY (`product_information_id`) REFERENCES `product_informations` (`id`),
  ADD CONSTRAINT `products_product_size_id_foreign` FOREIGN KEY (`product_size_id`) REFERENCES `product_sizes` (`id`),
  ADD CONSTRAINT `products_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD CONSTRAINT `product_imgs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_informations`
--
ALTER TABLE `product_informations`
  ADD CONSTRAINT `product_informations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `product_orders_billing_detail_id_foreign` FOREIGN KEY (`billing_detail_id`) REFERENCES `billing_details` (`id`);

--
-- Constraints for table `product_order_by_admin_to_companies`
--
ALTER TABLE `product_order_by_admin_to_companies`
  ADD CONSTRAINT `product_order_by_admin_to_companies_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stoke_out_product_request_by_user_to_admins`
--
ALTER TABLE `stoke_out_product_request_by_user_to_admins`
  ADD CONSTRAINT `stoke_out_product_request_by_user_to_admins_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD CONSTRAINT `user_verifies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
