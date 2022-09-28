-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2022 at 05:32 PM
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
(1, 'Dr. Junior Gottlieb PhD', 'lacy50@example.net', '2022-09-13 01:08:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '78CouWd28Z', '2022-09-13 01:08:33', '2022-09-13 01:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_details`
--

INSERT INTO `billing_details` (`id`, `phone`, `apartment`, `street`, `zip`, `city`, `state`, `country`, `order_note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '+14089893079', 'Id cum asperiores velit nobis voluptas nihil.', 'Eos aut accusantium sed aut est sapiente et vel.', '05366-8008', 'Russelfurt', 'New York', 'Rwanda', 'Et cupiditate est facere optio sed.', 11, '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(2, '+17637197688', 'Odio vel ut iste sit nesciunt pariatur.', 'Fuga cum aut quis asperiores totam repellendus.', '49341', 'Klingmouth', 'North Dakota', 'Estonia', 'In dolores aliquid accusamus.', 6, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(3, '+14089893079', 'Id cum asperiores velit nobis voluptas nihil.', 'Eos aut accusantium sed aut est sapiente et vel.', '05366-8008', 'Russelfurt', 'New York', 'Rwanda', 'Qui ipsam similique quod odio aut libero sed.', 1, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(4, '+12252807873', 'Natus nesciunt in culpa.', 'Aliquid iure ut vel consequatur voluptas.', '03226-6029', 'East Lorenfort', 'Wyoming', 'San Marino', 'Dolorem quia quo animi sunt quos sunt.', 11, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(5, '+12252807873', 'Natus nesciunt in culpa.', 'Aliquid iure ut vel consequatur voluptas.', '03226-6029', 'East Lorenfort', 'Wyoming', 'San Marino', 'Laudantium iusto tenetur quae distinctio nobis.', 2, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(6, '+14089893079', 'Id cum asperiores velit nobis voluptas nihil.', 'Eos aut accusantium sed aut est sapiente et vel.', '05366-8008', 'Russelfurt', 'New York', 'Rwanda', 'Officiis animi velit dolores omnis.', 1, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(7, '+16675422021', 'Qui quae ab nobis delectus animi.', 'Enim possimus maiores quidem eius iusto.', '57111', 'West Crawford', 'South Dakota', 'Mozambique', 'Vero eveniet quia rerum nam voluptas et non.', 5, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(8, '+19203593858', 'Molestiae itaque fugiat consequatur.', 'Repellat aliquam iusto deserunt in quis tempore.', '42191', 'North Vincentburgh', 'Wisconsin', 'Singapore', 'Cupiditate et repellat odio rem culpa officia.', 3, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(9, '+17856167870', 'Eligendi et qui voluptate doloribus velit.', 'Qui delectus quaerat quaerat ut.', '12388', 'New Sally', 'North Carolina', 'Slovakia (Slovak Republic)', 'Porro porro quia molestias aut.', 4, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(10, '+16675422021', 'Qui quae ab nobis delectus animi.', 'Enim possimus maiores quidem eius iusto.', '57111', 'West Crawford', 'South Dakota', 'Mozambique', 'Aut deleniti molestiae fuga ea autem.', 5, '2022-09-13 01:08:38', '2022-09-13 01:08:38'),
(11, '123456789', 'Apartment', 'Street', 'Zip', 'City', 'State', 'Country', 'Order Note', 11, '2022-09-19 23:15:25', '2022-09-19 23:15:25'),
(12, '123456789', 'Apartment', 'Street', 'Zip', 'City', 'State', 'Country', 'Order Note', 11, '2022-09-21 10:40:13', '2022-09-21 10:40:13');

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
(1, 'Category 116', 'Img of Category 116', 0, 1, '2022-09-13 01:08:33', '2022-09-13 01:08:33'),
(2, 'Category 188', 'Img of Category 188', 0, 0, '2022-09-13 01:08:33', '2022-09-13 01:08:33'),
(3, 'Category 123', 'Img of Category 123', 1, 0, '2022-09-13 01:08:33', '2022-09-13 01:08:33'),
(4, 'Category 158', 'Img of Category 158', 0, 0, '2022-09-13 01:08:33', '2022-09-13 01:08:33'),
(5, 'Category 106', 'Img of Category 106', 0, 0, '2022-09-13 01:08:33', '2022-09-13 01:08:33'),
(6, 'Category 171', 'Img of Category 171', 0, 0, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(7, 'Category 109', 'Img of Category 109', 0, 0, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(8, 'Category 128', 'Img of Category 128', 1, 0, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(9, 'Category 60', 'Img of Category 60', 1, 1, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(10, 'Category 119', 'Img of Category 119', 1, 1, '2022-09-13 01:08:34', '2022-09-13 01:08:34');

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
(1, '32326 Angela Road Suite 600\nWest Alyce, MS 60216', '+16039154001', 'pjacobs@example.org', '10.00 AM to 8.00 PM. Friday is Off Day', 'Img 181', '2022-09-13 01:08:41', '2022-09-13 01:08:41');

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
(1, '06a24', 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(2, '6d3120', 138, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(3, 'b8d111', 167, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(4, 'a1b46', 146, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(5, 'c19177', 25, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(6, '0f47', 41, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(7, 'b0c176', 80, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(8, 'cef47', 42, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(9, 'ba5184', 13, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(10, 'cf791', 21, '2022-09-13 01:08:40', '2022-09-13 01:08:40');

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
(1, 'Billy Okuneva', 'bnikolaus@example.com', 'Maxime voluptatum animi quia ea. Animi error ut et unde sunt quis sed. Autem voluptas ab ut quas.', 1, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(2, 'Marjory Daugherty', 'ashtyn.cassin@example.org', 'Est dolor suscipit dolorem dignissimos eos quisquam eos. Dolor est numquam et quas dolorem.', 0, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(3, 'Daren Gutkowski', 'warren77@example.com', 'Fugiat accusamus est quae. Alias aut eum repellat sequi. Cupiditate qui ut minima a enim veniam.', 0, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(4, 'Ms. Minnie Bailey MD', 'xzavier55@example.net', 'Minus enim iusto et magnam. Et dolorem saepe nemo sunt explicabo. Pariatur sed odio qui non.', 0, '2022-09-13 01:08:40', '2022-09-13 01:08:40'),
(5, 'Rachael Considine', 'qnolan@example.org', 'Vero quam dolor in provident. Minus doloribus rerum sit vitae et.', 1, '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(6, 'Eulalia Steuber Sr.', 'clemmie08@example.com', 'Beatae necessitatibus eveniet et provident esse porro ratione. Officiis animi et sit minus eum ex.', 0, '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(7, 'Louie Vandervort', 'lily.paucek@example.com', 'Maiores hic est soluta qui. Laudantium molestiae sit sed ea.', 0, '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(8, 'Branson Cummerata', 'lilly12@example.net', 'Amet mollitia qui sit esse et. Rerum sint voluptatem deserunt ipsam veniam corrupti.', 1, '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(9, 'Prof. Luella Reichel', 'sdach@example.net', 'Odio distinctio sit quia est non eum. Necessitatibus quidem et quisquam at repudiandae perferendis.', 1, '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(10, 'Asia Hand', 'ulises.bashirian@example.com', 'Voluptatum aliquid libero nemo et nam. Ex ex et adipisci dolor eos.', 0, '2022-09-13 01:08:41', '2022-09-13 01:08:41');

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
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2022_07_20_101129_create_admins_table', 1),
(9, '2022_07_22_154152_create_user_verifies_table', 1),
(10, '2022_08_09_074532_create_categories_table', 1),
(11, '2022_08_09_075512_create_shippings_table', 1),
(12, '2022_08_09_080332_create_units_table', 1),
(13, '2022_08_09_080724_create_product_sizes_table', 1),
(14, '2022_08_09_081002_create_product_colors_table', 1),
(15, '2022_08_09_092844_create_billing_details_table', 1),
(16, '2022_08_09_093114_create_product_orders_table', 1),
(17, '2022_08_09_093444_create_discounts_table', 1),
(18, '2022_08_09_093707_create_messages_table', 1),
(19, '2022_08_09_093834_create_contact_us_table', 1),
(20, '2022_08_09_094130_create_news_letters_table', 1),
(21, '2022_08_11_153533_create_product_informations_table', 1),
(22, '2022_08_12_085835_create_products_table', 1),
(23, '2022_08_12_090716_create_stoke_out_product_request_by_user_to_admins_table', 1),
(24, '2022_08_12_091317_create_product_order_by_admin_to_companies_table', 1),
(25, '2022_08_12_091933_create_product_imgs_table', 1),
(26, '2022_08_12_092402_create_reviews_table', 1);

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
(1, 'stracke.rhianna@example.org', '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(2, 'rosella.davis@example.org', '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(3, 'mateo.upton@example.com', '2022-09-13 01:08:41', '2022-09-13 01:08:41'),
(4, 'halvorson.libby@example.org', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(5, 'stokes.caesar@example.net', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(6, 'klein.kieran@example.com', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(7, 'dfeest@example.net', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(8, 'xkoelpin@example.com', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(9, 'felipe.leannon@example.com', '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(10, 'daphney.hills@example.org', '2022-09-13 01:08:42', '2022-09-13 01:08:42');

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
(1, 'App\\Models\\User', 11, 'malakersudipta@gmail.com', '2bbab93c01c7348aa4241d5365b56df26f28309a4eaafb070c7f47a0b1625214', '[\"*\"]', '2022-09-21 10:40:11', '2022-09-13 10:46:33', '2022-09-21 10:40:11'),
(2, 'App\\Models\\User', 11, 'malakersudipta@gmail.com', '71fc2a3069df11d2fd678f011aad12c8a5b53cf24e5218c0d7c00bfb4c8a2b19', '[\"*\"]', '2022-09-23 23:14:08', '2022-09-19 08:09:35', '2022-09-23 23:14:08'),
(3, 'App\\Models\\Admin', 1, 'lacy50@example.net', 'c9edf23380269381918ccd0a3554aacb4954905e2d441c943f3d047bec783fbe', '[\"*\"]', '2022-09-28 09:29:44', '2022-09-23 23:17:38', '2022-09-28 09:29:44');

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
(1, 4, 4, 635.00, 835.00, 7, 12, 99, 0, 4, 8, 5, 1, '2022-09-13 01:08:44', '2022-09-13 01:08:44'),
(2, 7, 945, 623.00, 823.00, 1, 3, 45, 0, 7, 7, 10, 1, '2022-09-13 01:08:44', '2022-09-13 01:08:44'),
(3, 9, 169, 166.00, 366.00, 4, 21, 216, 0, 3, 7, 6, 1, '2022-09-13 01:08:44', '2022-09-13 01:08:44'),
(4, 10, 416, 159.00, 359.00, 6, 5, 424, 1, 7, 10, 2, 1, '2022-09-13 01:08:44', '2022-09-13 01:08:44'),
(5, 1, 603, 867.00, 1067.00, 2, 33, 335, 1, 2, 5, 6, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(6, 7, 457, 802.00, 1002.00, 10, 37, 433, 1, 8, 2, 7, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(7, 7, 61, 842.00, 1042.00, 6, 15, 85, 0, 1, NULL, NULL, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(8, 3, 50, 583.00, 783.00, 1, 32, 25, 0, 4, 1, 5, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(9, 10, 480, 682.00, 882.00, 3, 36, 106, 0, 4, 2, 4, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(10, 9, 579, 888.00, 1088.00, 3, 47, 113, 0, 9, 4, 1, 1, '2022-09-13 01:08:45', '2022-09-13 01:08:45');

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
(1, 'Color 193', 'Img of Color 193', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(2, 'Color 66', 'Img of Color 66', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(3, 'Color 39', 'Img of Color 39', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(4, 'Color 44', 'Img of Color 44', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(5, 'Color 182', 'Img of Color 182', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(6, 'Color 92', 'Img of Color 92', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(7, 'Color 156', 'Img of Color 156', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(8, 'Color 155', 'Img of Color 155', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(9, 'Color 15', 'Img of Color 15', '2022-09-13 01:08:37', '2022-09-13 01:08:37'),
(10, 'Color 110', 'Img of Color 110', '2022-09-13 01:08:37', '2022-09-13 01:08:37');

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
(1, 'Product Img 68', 8, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(2, 'Product Img 194', 4, '2022-09-13 01:08:45', '2022-09-13 01:08:45'),
(3, 'Product Img 163', 7, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(4, 'Product Img 118', 7, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(5, 'Product Img 174', 5, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(6, 'Product Img 168', 6, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(7, 'Product Img 71', 5, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(8, 'Product Img 55', 9, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(9, 'Product Img 198', 5, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(10, 'Product Img 102', 10, '2022-09-13 01:08:46', '2022-09-13 01:08:46');

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
(1, 'Product 54', 'Facere nesciunt quis recusandae dolore qui alias quis. Illo eum et vitae totam.', 'Perferendis distinctio nihil commodi eos. Et illo dolorem vitae ad impedit.', 6, '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(2, 'Product 82', 'Eos qui voluptatum quisquam dolores voluptatem. Fugit enim maiores et ut est quos.', 'Quos odit ut asperiores deserunt iusto voluptas necessitatibus. Alias sequi occaecati illum qui.', 1, '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(3, 'Product 8', 'Tempore dolores dolorem voluptates iste accusamus. Nostrum fuga corporis sit quibusdam.', 'Iusto explicabo voluptatem qui ducimus. Error est quia eum et officiis.', 2, '2022-09-13 01:08:42', '2022-09-13 01:08:42'),
(4, 'Product 159', 'Laboriosam consequatur dolores voluptatem eos ratione. Facere est explicabo quaerat magnam.', 'Deleniti cupiditate soluta ut. Placeat beatae voluptate et enim.', 7, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(5, 'Product 85', 'Est nemo est corporis optio sapiente est. Ut in consequuntur magnam ullam. Et neque et nulla.', 'Autem ut ratione tenetur architecto. Rerum qui sunt quam quas non unde.', 2, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(6, 'Product 11', 'Dolorum quia officiis architecto rem non. Perspiciatis quis quisquam quibusdam velit adipisci.', 'Voluptate explicabo fugit aspernatur. Aut autem reprehenderit quia qui.', 3, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(7, 'Product 154', 'Officiis enim aut ducimus perspiciatis illo. Dolor sed tempore repudiandae.', 'Mollitia nam rerum velit in amet. Officia quae quis fuga a praesentium nihil et.', 7, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(8, 'Product 69', 'Laboriosam dicta sunt reiciendis ut tempora. Voluptatem aperiam aut unde et.', 'Maxime eum quidem sed. Alias reprehenderit laudantium veritatis.', 9, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(9, 'Product 144', 'Omnis autem temporibus occaecati. Molestias explicabo cum tempora nulla quia quisquam.', 'Voluptatem sed ab atque. Et nostrum quis dicta est cum.', 1, '2022-09-13 01:08:43', '2022-09-13 01:08:43'),
(10, 'Product 117', 'Et minus iusto occaecati aut culpa. Adipisci et aliquam quibusdam. Natus eum cupiditate et eaque.', 'Et et temporibus quo delectus ea itaque numquam. Vel similique dignissimos qui dolores qui aut.', 5, '2022-09-13 01:08:43', '2022-09-13 01:08:43');

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
  `transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_intent_id_for_refund` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `product_orders` (`id`, `order_detail`, `billing_detail_id`, `payment_type`, `payment_status`, `transaction_id`, `payment_intent_id_for_refund`, `product_coming`, `product_receiving`, `product_received`, `is_canceled`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 7, 'Card', 1, '533dd2f4b0b5164f119b26763acf2f6f', '1a557b929022132c601c5a3c0a6384fc', 1, 1, 1, 0, 1, '2022-09-13 01:08:38', '2022-09-24 09:15:06'),
(2, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 3, 'Card', 1, 'b91e735c51df5b72ead209e60ecd34a7', '327246982453cdb000abd760d11a37d3', 1, 1, 1, 0, NULL, '2022-09-13 01:08:39', '2022-09-24 09:15:06'),
(3, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 4, 'Cash', 1, '', '', 1, 1, 1, 0, 1, '2022-09-13 01:08:39', '2022-09-28 00:55:22'),
(4, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 6, 'Cash', 0, '', '', 1, 1, 1, 0, 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(5, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 3, 'Card', 1, '0d0cb3bde25fc24ad72d52010d909216', 'd7045900161672a51a5bb9612dddcc79', 1, 1, 1, 0, 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(6, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 2, 'Card', 1, 'e992f58d35c43a0ec66925e6974adf3b', 'a7d6b7e5adadc708fb69c98bba5dfcd3', 0, 0, 0, 0, 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(7, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 6, 'Cash', 0, '', '', 1, 1, 1, 0, 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(8, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 8, 'Cash', 0, '', '', 1, 1, 1, 0, 1, '2022-09-13 01:08:39', '2022-09-13 01:08:39'),
(9, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 4, 'Card', 1, '411ceb8d4bba69fa0a8db610f66bc636', 'df382e23246ca201e0538d4446abdfca', 1, 1, 1, 1, NULL, '2022-10-13 01:08:39', '2022-09-13 01:08:39'),
(10, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 9, 'Card', 1, 'e12903a3c60655207dfb27131f51613f', 'b7d2283b788758534f42ec9b77a3cc41', 1, 1, 1, 0, NULL, '2022-10-13 01:08:39', '2022-09-13 01:08:39'),
(11, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 11, 'card', 1, 'ch_3LjynlAkSjuvMYOz0nNF6eZi', 'pi_3LjynlAkSjuvMYOz0urjZyKB', 0, 0, 0, 0, NULL, '2023-09-19 23:15:25', '2022-09-22 09:08:29'),
(12, '{\"product_list\":[{\"product_id\":6,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 168\",\"product_name\":\"Product 154\",\"product_size\":\"Size 86\",\"product_color\":\"Color 156\",\"product_color_img\":\"http:\\/\\/127.0.0.1:8000Img of Color 156\",\"is_product_shipping_free\":\"Yes\",\"product_minimum_quantity\":457,\"product_unit\":\"Unit 83\",\"product_minimum_quantity_selling_price\":1002,\"product_discount_in_percent\":37,\"product_minimum_quantity_selling_price_after_discount\":632,\"product_quantity_want_to_order\":2,\"total_product_price_want_to_order\":1264,\"product_minimum_quantity_buying_price\":802,\"total_product_buying_price_want_to_order\":1604},{\"product_id\":7,\"product_img\":\"http:\\/\\/127.0.0.1:8000Product Img 163\",\"product_name\":\"Product 154\",\"is_product_shipping_free\":\"No\",\"product_minimum_quantity\":61,\"product_unit\":\"Unit 139\",\"product_minimum_quantity_selling_price\":1042,\"product_discount_in_percent\":15,\"product_minimum_quantity_selling_price_after_discount\":886,\"product_quantity_want_to_order\":3,\"total_product_price_want_to_order\":2658,\"product_minimum_quantity_buying_price\":842,\"total_product_buying_price_want_to_order\":2526}],\"subtotal_product_price\":3922,\"coupon_code\":\"06a24\",\"discount_in_percent_on_subtotal_product_price_for_coupon_code\":1,\"price_reduced_from_subtotal_product_price_for_coupon_code\":40,\"subtotal_product_price_after_coupon_code_discount\":3882,\"product_delivery_charge\":200,\"total_price_will_be_charged_from_card\":4082,\"total_product_selling_price\":3882,\"total_product_buying_price\":4130,\"total_profit_without_profit_from_delivery_charge\":-248,\"actual_product_delivery_charge\":200,\"profit_from_delivery_charge\":0,\"finally_total_profit_with_profit_from_delivery_charge\":-248,\"total_expense\":4330,\"finally_total_profit_with_profit_from_delivery_charge_in_percentage\":-6}', 12, 'cash', 1, NULL, NULL, 1, 1, 1, 1, NULL, '2023-09-21 10:40:13', '2022-09-22 09:06:28');

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
(1, 132, 0, 2, '2022-09-13 01:08:45', '2022-09-13 01:08:45');

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
(1, 'Size 16', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(2, 'Size 86', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(3, 'Size 53', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(4, 'Size 12', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(5, 'Size 197', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(6, 'Size 112', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(7, 'Size 124', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(8, 'Size 52', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(9, 'Size 33', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(10, 'Size 151', '2022-09-13 01:08:36', '2022-09-13 01:08:36');

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
(1, 'Ut atque occaecati qui velit. Assumenda dolores ipsa aut dolorem dicta. Et corporis quis quos.', 4, 9, 1, '2022-09-13 01:08:46', '2022-09-13 01:08:46'),
(2, 'Et libero sit sint ullam. Voluptatum aut deleniti id. Ipsa error nam sit.', 1, 10, 3, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(3, 'Omnis impedit architecto et quia aliquam aut suscipit amet. Sit laudantium commodi dolore.', 1, 4, 7, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(4, 'Ut beatae in saepe sequi. Ducimus rerum sunt qui rem cupiditate et.', 5, 4, 2, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(5, 'Voluptatem corrupti id ex tenetur. Commodi recusandae natus necessitatibus voluptatum.', 3, 6, 2, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(6, 'Minima vitae dolore animi. Et maiores est quod adipisci veritatis. Nemo nulla nam magni.', 1, 5, 8, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(7, 'Provident optio laborum quas. Quis voluptatem rerum aperiam quos.', 2, 2, 2, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(8, 'Hic eos officiis nesciunt. Iure reprehenderit deserunt ipsum quia atque quisquam.', 2, 4, 9, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(9, 'Quia aut sit rerum molestiae. Enim ut qui iusto. Et temporibus accusantium qui voluptas.', 4, 5, 6, '2022-09-13 01:08:47', '2022-09-13 01:08:47'),
(10, 'Id qui quis animi ab. Delectus quisquam est consequatur repellat est quod.', 2, 9, 1, '2022-09-13 01:08:47', '2022-09-13 01:08:47');

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
(1, 51, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(2, 94, '2022-09-13 01:08:34', '2022-09-13 01:08:34'),
(3, 19, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(4, 74, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(5, 96, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(6, 108, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(7, 2, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(8, 143, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(9, 134, '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(10, 172, '2022-09-13 01:08:35', '2022-09-13 01:08:35');

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
(1, 196, 3, '2022-09-13 01:08:45', '2022-09-13 01:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Unit 101', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(2, 'Unit 179', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(3, 'Unit 164', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(4, 'Unit 121', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(5, 'Unit 5', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(6, 'Unit 139', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(7, 'Unit 90', '2022-09-13 01:08:35', '2022-09-13 01:08:35'),
(8, 'Unit 20', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(9, 'Unit 153', '2022-09-13 01:08:36', '2022-09-13 01:08:36'),
(10, 'Unit 83', '2022-09-13 01:08:36', '2022-09-13 01:08:36');

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
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_email_verified`, `password`, `remember_token`, `phone`, `apartment`, `street`, `zip`, `city`, `state`, `country`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Esmeralda Harber DDS', 'vcarter@example.net', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UyjQ0d2YhI', '+14089893079', 'Id cum asperiores velit nobis voluptas nihil.', 'Eos aut accusantium sed aut est sapiente et vel.', '05366-8008', 'Russelfurt', 'New York', 'Rwanda', '2022-09-13 01:08:31', '2022-09-13 01:08:31', NULL, NULL, NULL, NULL),
(2, 'Gerard Batz II', 'wstehr@example.com', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Q5PxQxtnEJ', '+12252807873', 'Natus nesciunt in culpa.', 'Aliquid iure ut vel consequatur voluptas.', '03226-6029', 'East Lorenfort', 'Wyoming', 'San Marino', '2022-09-13 01:08:31', '2022-09-13 01:08:31', NULL, NULL, NULL, NULL),
(3, 'Anthony Klein', 'mortimer.cole@example.org', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XoUfmF7rpm', '+19203593858', 'Molestiae itaque fugiat consequatur.', 'Repellat aliquam iusto deserunt in quis tempore.', '42191', 'North Vincentburgh', 'Wisconsin', 'Singapore', '2022-09-13 01:08:31', '2022-09-13 01:08:31', NULL, NULL, NULL, NULL),
(4, 'Jaida Nikolaus', 'dbalistreri@example.com', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zNfdyBNcCK', '+17856167870', 'Eligendi et qui voluptate doloribus velit.', 'Qui delectus quaerat quaerat ut.', '12388', 'New Sally', 'North Carolina', 'Slovakia (Slovak Republic)', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(5, 'Teagan Trantow', 'michele.ratke@example.org', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'azWKq7U4a9', '+16675422021', 'Qui quae ab nobis delectus animi.', 'Enim possimus maiores quidem eius iusto.', '57111', 'West Crawford', 'South Dakota', 'Mozambique', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(6, 'Bert Kutch DDS', 'xyost@example.com', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UngqIYbign', '+17637197688', 'Odio vel ut iste sit nesciunt pariatur.', 'Fuga cum aut quis asperiores totam repellendus.', '49341', 'Klingmouth', 'North Dakota', 'Estonia', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(7, 'Lenora Kling', 'chanel05@example.org', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FU3fESH14T', '+12512133145', 'Quos dolores aut ut ullam ab.', 'Quia velit aut officiis nisi.', '40807-1589', 'Collinsberg', 'Rhode Island', 'Kiribati', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(8, 'Patience Stoltenberg', 'roxanne.harris@example.net', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZDPeL3vhAo', '+17022930165', 'Aut ex ex qui qui.', 'Suscipit voluptatem voluptas dolor illo illo.', '04818', 'South Zoey', 'Minnesota', 'Brunei Darussalam', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(9, 'Mr. Raphael Wiza', 'jarrett.abshire@example.com', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C8V1INxWkJ', '+19134324088', 'Ratione et voluptas facere.', 'Aut incidunt ullam et eum deserunt.', '53834-2648', 'South Melanyview', 'Nebraska', 'Bosnia and Herzegovina', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(10, 'Dr. Lindsay Bernier', 'weissnat.sherwood@example.net', '2022-09-13 01:08:31', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LKAKoVQcUE', '+18609905033', 'Et nesciunt rerum voluptatem.', 'Animi omnis incidunt dignissimos sit animi magni.', '02051', 'Cadenfurt', 'Kansas', 'Sweden', '2022-09-13 01:08:32', '2022-09-13 01:08:32', NULL, NULL, NULL, NULL),
(11, 'Sudipta  Malaker', 'malakersudipta@gmail.com', NULL, 1, '$2y$10$e4JLsbhVO7zJvkyCYXT5kegwR9jSQpa1D9MAVhLVEjPaAE5NrhGBm', NULL, '123456789', 'Apartment', 'Street', 'Zip', 'City', 'State', 'Country', '2022-09-13 10:46:18', '2022-09-14 11:34:40', 'cus_MQrCCMX4vnttlT', NULL, NULL, NULL);

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
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
