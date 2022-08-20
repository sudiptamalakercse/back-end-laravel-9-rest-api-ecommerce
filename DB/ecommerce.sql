-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2022 at 06:08 AM
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
(1, 'Teresa Connelly', 'andre.johnston@example.net', '2022-08-16 10:17:45', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KH7EuAOy6q', '2022-08-16 10:17:45', '2022-08-16 10:17:45');

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
(1, 'Saudi Arabia', '95856 Schaefer Village\nSipesside, NY 26230-1215', 'Port Ronnymouth', '07632-6781', '+16513741163', 'Accusamus nam dolores unde qui. Vero dolore tempore voluptas id sed.', 10, '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(2, 'Denmark', '16904 Arlene Knoll Apt. 389\nHauckmouth, IA 43445-0531', 'Ebertport', '41009-5747', '+18705493808', 'Quam soluta consequatur recusandae a. Ullam enim et voluptatem.', 5, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(3, 'Slovakia (Slovak Republic)', '615 Hellen Neck\nNolanberg, DE 44800', 'Willberg', '72387-3001', '+17152313142', 'Doloremque tenetur quia consequuntur consectetur. Hic voluptas repellat iure est vero.', 5, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(4, 'Ireland', '283 Swift Land Suite 990\nWuckertchester, NY 52821', 'Binsbury', '53624-6839', '+17475768642', 'Quod ad eum labore et dolore. Sunt ut qui rerum est. Sunt unde corrupti voluptas.', 6, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(5, 'Morocco', '18975 Dessie Island Apt. 541\nAmirbury, NC 40891', 'South Joeyview', '95199-7682', '+13518102499', 'Officia architecto sunt est porro sit. Deserunt rerum fugiat assumenda velit impedit.', 7, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(6, 'Aruba', '962 Howe Mountains Apt. 902\nWest Anahiview, SC 60638', 'Goldnertown', '44923', '+15858398578', 'Accusamus quasi earum enim vel tempora iste. Quis aliquam inventore dolores neque.', 3, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(7, 'Tajikistan', '8636 Miguel Village\nLake Cortney, NJ 02190', 'West Keyshawnshire', '59487-6351', '+17604011009', 'Necessitatibus sequi dicta aut quo dolore voluptatem. Illo necessitatibus esse expedita.', 2, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(8, 'Yemen', '550 Treutel Oval Apt. 405\nPort Paxton, AR 59844-7731', 'Darrelton', '28607-0703', '+16627103988', 'Aut dolores corporis rerum eaque cumque. Error deserunt quis molestias dolor voluptatum.', 1, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(9, 'Trinidad and Tobago', '952 Bartell Tunnel\nNorth Gilberto, AZ 75377-7075', 'Denischester', '77183', '+14237954873', 'Dolores ea dolores alias aspernatur eum. Nostrum accusamus autem ducimus expedita magnam facilis.', 7, '2022-08-16 10:17:53', '2022-08-16 10:17:53'),
(10, 'Rwanda', '272 Isai Corners Apt. 733\nWest Mariela, VA 94116-6528', 'Ethaville', '01887', '+14696910684', 'Fugiat ipsam reprehenderit consectetur vel nihil rem est. Eaque et perspiciatis tenetur eligendi.', 10, '2022-08-16 10:17:53', '2022-08-16 10:17:53');

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
(1, 'Category 16', '/images/categories/i1.png', 0, 1, '2022-08-16 10:17:46', '2022-08-16 10:17:46'),
(2, 'Category 120', '/images/categories/i2.png', 0, 1, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(3, 'Category 123', 'Img of Category 123', 0, 1, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(4, 'Category 36', NULL, 0, 0, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(5, 'Category 103', 'Img of Category 103', 0, 0, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(6, 'Category 161', 'Img of Category 161', 0, 0, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(7, 'Category 7', 'Img of Category 7', 0, 0, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(8, 'Category 90', '/images/categories/i3.png', 0, 1, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(9, 'Category 106', 'Img of Category 106', 1, 1, '2022-08-16 10:17:47', '2022-08-16 10:17:47'),
(10, 'Category 17', 'Img of Category 17', 0, 1, '2022-08-16 10:17:47', '2022-08-16 10:17:47');

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
(1, '478 Damaris Curve\nNew Meganeton, FL 93725', '+13219614765', 'cormier.alvis@example.com', '10.00 AM to 8.00 PM. Friday is Off Day', '/images/contact-us/image.jpg', '2022-08-16 10:17:56', '2022-08-16 10:17:56');

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
(1, 'a1692', 170, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(2, 'ab32', 100, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(3, '9ac174', 23, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(4, 'bd01', 102, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(5, '84079', 35, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(6, '5f298', 83, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(7, '8ea24', 89, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(8, 'ff354', 107, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(9, '29444', 95, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(10, '69b14', 145, '2022-08-16 10:17:55', '2022-08-16 10:17:55');

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
(1, 'Prof. Chaim Purdy', 'trinity98@example.net', 'Sed sequi impedit in ullam id enim. Et autem libero ipsa. Eum consequatur voluptatem aliquam iure.', 0, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(2, 'Prof. Dewitt Farrell V', 'jkunze@example.com', 'Enim rerum necessitatibus reprehenderit quisquam. Cupiditate voluptate enim nihil.', 0, '2022-08-16 10:17:55', '2022-08-16 10:17:55'),
(3, 'Erika Crooks', 'hipolito32@example.org', 'Dignissimos ut omnis rerum soluta harum quis. Excepturi recusandae fugiat omnis natus.', 1, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(4, 'Ms. Yadira West', 'vhartmann@example.net', 'Cum quas cum sunt. Molestias tempore voluptatem magni et. Voluptas mollitia omnis non sit.', 0, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(5, 'Hertha Cronin', 'kshlerin.kevin@example.org', 'Sint voluptatem dolore necessitatibus dolor officiis. Autem et illum magni.', 1, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(6, 'Cecile Ondricka', 'vwalter@example.net', 'Reiciendis sit incidunt laborum ut. Nobis est alias totam incidunt dolorum.', 0, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(7, 'Prof. Eliza Ferry', 'zyundt@example.com', 'Suscipit rem nemo doloremque blanditiis id. Ea molestiae dicta consequatur ea id totam eius.', 0, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(8, 'Jaylen O\'Connell', 'bryon92@example.net', 'Reiciendis quis voluptatem eum. Pariatur molestiae qui eum et maxime tempore.', 0, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(9, 'Aileen Farrell MD', 'rosa74@example.com', 'Dolor et soluta nemo est. Praesentium nostrum nisi consequuntur.', 1, '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(10, 'Peggie Wisoky', 'dalton97@example.com', 'Eum inventore sunt magni recusandae. Dolores cupiditate eos autem saepe inventore aspernatur.', 1, '2022-08-16 10:17:56', '2022-08-16 10:17:56');

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
(1, 'nels15@example.net', '2022-08-16 10:17:56', '2022-08-16 10:17:56'),
(2, 'einar81@example.net', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(3, 'daphney.jast@example.org', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(4, 'gwendolyn.murazik@example.net', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(5, 'jabernathy@example.org', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(6, 'roel.murphy@example.org', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(7, 'mvandervort@example.net', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(8, 'mayer.holden@example.org', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(9, 'vhand@example.net', '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(10, 'sylvia.walsh@example.com', '2022-08-16 10:17:57', '2022-08-16 10:17:57');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'malakersudipta@gmail.com', '655ab0186834b9cf6674807f5f9f509a865146200d0df20fce665e7b2359af0f', '[\"*\"]', NULL, '2022-08-17 01:24:41', '2022-08-17 01:24:41');

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
  `product_size_id` bigint(20) UNSIGNED NOT NULL,
  `product_color_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_information_id`, `minimum_quantity`, `minimum_quantity_buying_price`, `minimum_quantity_selling_price`, `unit_id`, `discount_in_percent`, `stock`, `is_shipping_free`, `shipping_id`, `product_size_id`, `product_color_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 6, 306, 281.00, 481.00, 2, 21, 386, 0, 9, 7, 10, 1, '2022-08-16 10:17:59', '2022-08-16 10:17:59'),
(2, 7, 76, 789.00, 989.00, 7, 8, 113, 1, 6, 1, 10, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(3, 10, 944, 273.00, 473.00, 9, 35, 488, 0, 3, 1, 10, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(4, 9, 304, 161.00, 361.00, 8, 22, 318, 1, 5, 7, 5, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(5, 2, 211, 63.00, 263.00, 4, 37, 396, 0, 1, 6, 2, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(6, 2, 732, 122.00, 322.00, 5, 1, 10, 0, 8, 4, 9, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(7, 8, 639, 13.00, 213.00, 2, 32, 353, 0, 3, 4, 1, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(8, 3, 320, 71.00, 271.00, 7, 31, 468, 0, 10, 7, 9, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(9, 5, 732, 438.00, 638.00, 2, 21, 382, 1, 1, 7, 4, 1, '2022-08-16 10:18:00', '2022-08-16 10:18:00'),
(10, 1, 443, 367.00, 567.00, 2, 23, 131, 0, 9, 9, 7, 1, '2022-08-16 10:18:01', '2022-08-16 10:18:01');

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
(1, 'Color 66', 'Img of Color 66', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(2, 'Color 8', 'Img of Color 8', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(3, 'Color 26', 'Img of Color 26', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(4, 'Color 47', 'Img of Color 47', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(5, 'Color 160', 'Img of Color 160', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(6, 'Color 93', 'Img of Color 93', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(7, 'Color 68', 'Img of Color 68', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(8, 'Color 29', 'Img of Color 29', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(9, 'Color 45', 'Img of Color 45', '2022-08-16 10:17:52', '2022-08-16 10:17:52'),
(10, 'Color 154', 'Img of Color 154', '2022-08-16 10:17:52', '2022-08-16 10:17:52');

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
(1, 'Product Img 10', 4, '2022-08-16 10:18:01', '2022-08-16 10:18:01'),
(2, 'Product Img 142', 9, '2022-08-16 10:18:01', '2022-08-16 10:18:01'),
(3, 'Product Img 42', 10, '2022-08-16 10:18:01', '2022-08-16 10:18:01'),
(4, 'Product Img 197', 4, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(5, 'Product Img 37', 1, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(6, 'Product Img 85', 5, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(7, 'Product Img 189', 6, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(8, 'Product Img 62', 3, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(9, 'Product Img 15', 7, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(10, 'Product Img 5', 7, '2022-08-16 10:18:02', '2022-08-16 10:18:02');

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
(1, 'Product 4', 'Dicta sunt odio ipsa inventore facere. Reprehenderit dicta nihil voluptatum laboriosam adipisci.', 'Alias occaecati neque quod rerum blanditiis consequatur. Enim fugiat vel mollitia ullam sunt.', 4, '2022-08-16 10:17:57', '2022-08-16 10:17:57'),
(2, 'Product 172', 'Quia omnis voluptatem placeat eos eos possimus. Nulla ut vitae animi voluptatibus est.', 'Nisi aut rerum excepturi molestias. Asperiores ut a voluptatum in sapiente. Qui est dolorem totam.', 8, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(3, 'Product 91', 'Nulla qui saepe autem aut. Maxime deserunt sit modi. Aut qui fugit commodi quia nemo.', 'Dolor odio eligendi illo. Aut commodi sunt vel laborum dolore.', 4, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(4, 'Product 99', 'Quasi vel explicabo voluptatum. Doloribus reprehenderit facere velit consequatur aliquid ut eos.', 'Libero aspernatur illo sed ut. Odit ut est voluptatem placeat culpa laudantium.', 4, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(5, 'Product 11', 'Corporis a sit ex quo quod consectetur. In ab inventore voluptas possimus quo omnis.', 'Quos aut quidem omnis. Aperiam debitis dolore aut quisquam delectus voluptatem assumenda.', 3, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(6, 'Product 94', 'Ipsa soluta non adipisci est et eum. Quia dolore est corrupti nobis sed necessitatibus aliquam.', 'Quam ut nam dolores nihil in dolorem. Animi maiores accusamus debitis qui.', 1, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(7, 'Product 31', 'Recusandae est minus repudiandae iste libero. In nihil ut expedita sequi.', 'Expedita laudantium natus tenetur excepturi. In modi et quis aut aut.', 2, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(8, 'Product 32', 'Voluptatibus sunt consequatur debitis sed sint voluptatem. In neque laudantium autem.', 'Voluptatem vel aut quis in. Reiciendis voluptatem suscipit veniam aut ea.', 10, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(9, 'Product 135', 'Velit deserunt aut explicabo et sit numquam. Ea et est cumque ducimus. Aut porro sequi molestias.', 'Ut porro soluta veritatis voluptatem id dolor ea. Illo nobis eligendi adipisci distinctio.', 10, '2022-08-16 10:17:58', '2022-08-16 10:17:58'),
(10, 'Product 168', 'Est sit iure illum odio vel. Ratione ea nisi omnis. Sed ut ut debitis et dolor.', 'Dignissimos voluptatem repellendus ut. Rerum nihil nihil repellat quis nostrum quia.', 5, '2022-08-16 10:17:58', '2022-08-16 10:17:58');

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
(1, 'Consequatur assumenda deserunt dolor. Et qui consequatur enim.', 10, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(2, 'Maiores inventore fugit dolores. Error qui rerum velit doloremque. Aperiam nesciunt excepturi aut.', 3, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(3, 'Quas repellendus similique quam. Dolor distinctio officia vitae rerum.', 1, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(4, 'Dolorem et rem et rerum. Est fugiat fuga saepe quasi recusandae vitae.', 8, 'Card', 1, '295b298064998c60fae4f59ede336149', 1, 1, 1, 0, 1, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(5, 'Repellendus esse odio porro perspiciatis. Et quia voluptatem non quia placeat quidem.', 1, 'Card', 1, '2215e78b3bcb082e301f140d3d869deb', 0, 0, 0, 0, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(6, 'Cum minus rerum incidunt harum et ut quo cum. Eius ad ex et cumque illum quia molestias.', 7, 'Card', 1, 'c8d0ab55cdf264236c42180af527c12d', 1, 1, 1, 0, 1, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(7, 'Alias amet ducimus tenetur et recusandae soluta. Eius tempore iusto unde. Aut qui culpa ipsam.', 5, 'Card', 1, '75f2f3ab1615d38fe1842482a83ef080', 0, 0, 0, 1, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(8, 'Ex fuga accusantium provident non. Dolorum voluptatibus illo magnam libero quia.', 3, 'Card', 1, '320da956c8f0f37e062bbc07547cf68a', 0, 0, 0, 1, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(9, 'Qui neque magni veniam velit ut molestiae magni. Ducimus sed fugit sunt cupiditate voluptas.', 3, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-16 10:17:54', '2022-08-16 10:17:54'),
(10, 'Voluptatem modi neque odio cumque recusandae hic et. Facere rerum voluptate officiis nulla.', 9, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-16 10:17:54', '2022-08-16 10:17:54');

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
(1, 120, 0, 5, '2022-08-16 10:18:01', '2022-08-16 10:18:01');

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
(1, 'Size 20', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(2, 'Size 80', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(3, 'Size 166', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(4, 'Size 192', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(5, 'Size 193', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(6, 'Size 143', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(7, 'Size 118', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(8, 'Size 75', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(9, 'Size 162', '2022-08-16 10:17:51', '2022-08-16 10:17:51'),
(10, 'Size 171', '2022-08-16 10:17:51', '2022-08-16 10:17:51');

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
(1, 'Itaque cumque veniam nihil qui itaque et. Porro voluptatem odit quae. Quas qui et architecto.', 2, 10, 9, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(2, 'Quis et a et quo. Et natus eaque reiciendis.', 1, 8, 4, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(3, 'Voluptate ad quos commodi quidem et amet provident. Nam minima praesentium sapiente.', 4, 2, 2, '2022-08-16 10:18:02', '2022-08-16 10:18:02'),
(4, 'Molestiae rerum est illo amet ad suscipit vel. Quia recusandae ratione non sit.', 1, 1, 7, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(5, 'Ducimus aut quia deserunt est. Quaerat vel sunt qui. Et aut quo magni earum omnis illum dolor sed.', 2, 2, 5, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(6, 'Nulla sit voluptate qui quae. Recusandae fugit vel voluptatum sit nemo quis maxime.', 3, 7, 6, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(7, 'Fugiat quo est sed optio. Vel assumenda et qui ut ut. A est fuga sequi eum.', 3, 2, 5, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(8, 'Id sapiente enim qui ullam odit optio. Aut impedit repellat occaecati nulla tempora.', 4, 2, 2, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(9, 'Quaerat et est assumenda rerum. Ex iste voluptates enim dolorum cumque consectetur.', 2, 10, 8, '2022-08-16 10:18:03', '2022-08-16 10:18:03'),
(10, 'Possimus libero sed dolorem dolores aut. Adipisci similique libero voluptate voluptatibus odit.', 2, 9, 5, '2022-08-16 10:18:03', '2022-08-16 10:18:03');

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
(1, 33, '2022-08-16 10:17:48', '2022-08-16 10:17:48'),
(2, 30, '2022-08-16 10:17:48', '2022-08-16 10:17:48'),
(3, 182, '2022-08-16 10:17:48', '2022-08-16 10:17:48'),
(4, 63, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(5, 175, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(6, 65, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(7, 155, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(8, 108, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(9, 196, '2022-08-16 10:17:49', '2022-08-16 10:17:49'),
(10, 41, '2022-08-16 10:17:49', '2022-08-16 10:17:49');

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
(1, 96, 1, '2022-08-16 10:18:01', '2022-08-16 10:18:01');

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
(1, 'Unit 69', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(2, 'Unit 140', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(3, 'Unit 82', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(4, 'Unit 48', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(5, 'Unit 28', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(6, 'Unit 61', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(7, 'Unit 191', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(8, 'Unit 18', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(9, 'Unit 163', '2022-08-16 10:17:50', '2022-08-16 10:17:50'),
(10, 'Unit 87', '2022-08-16 10:17:50', '2022-08-16 10:17:50');

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
(1, 'Dr. Tania Anderson II', 'malakersudipta@gmail.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'j9vOCt9cRJ', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(2, 'Dominic Hand III', 'antonetta.mcglynn@example.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jjDjRR6PmW', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(3, 'Mr. Dusty Lueilwitz', 'jamison.lang@example.net', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DugnBzH7f9', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(4, 'Stacy Beier', 'chester.wintheiser@example.org', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'd4OCXf7Zzj', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(5, 'Breanne Bogan', 'miller.donald@example.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gjx3Q4faDs', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(6, 'Kianna Koepp', 'amoen@example.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SNsWeUAyBM', '2022-08-16 10:17:44', '2022-08-16 10:17:44'),
(7, 'Amie Predovic', 'hkessler@example.net', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YTkw1nGO1d', '2022-08-16 10:17:45', '2022-08-16 10:17:45'),
(8, 'Ilene Emard', 'wharris@example.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6RnGnpYHEO', '2022-08-16 10:17:45', '2022-08-16 10:17:45'),
(9, 'Kaylin Tromp', 'magnus.abernathy@example.com', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gR0fRS9rIu', '2022-08-16 10:17:45', '2022-08-16 10:17:45'),
(10, 'Major Muller', 'banderson@example.net', '2022-08-16 10:17:44', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OduQSsWcbI', '2022-08-16 10:17:45', '2022-08-16 10:17:45');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
