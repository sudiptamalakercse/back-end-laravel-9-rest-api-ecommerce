-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2022 at 02:46 PM
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
(1, 'Mr. Brady Rowe DVM', 'dubuque.elmer@example.net', '2022-08-14 06:45:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dLxDL1rhdx', '2022-08-14 06:45:08', '2022-08-14 06:45:08');

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
(1, 'Botswana', '41355 Huels Courts\nLake Arvillaborough, SC 42509-2655', 'East Dedrickchester', '26264-9300', '+15414522936', 'Ducimus excepturi corporis sapiente. Minima maxime necessitatibus aut doloremque amet fugiat quas.', 10, '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(2, 'Armenia', '835 Amina Knoll\nMonahanton, CT 29688', 'Kristofferborough', '82074', '+16512199339', 'Minima laborum magnam aut nemo. Quia eum rerum et. Enim sed aut ut.', 9, '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(3, 'American Samoa', '5390 Ronny Estates Suite 460\nKorbinmouth, NJ 03674-9652', 'Dayanaport', '17194', '+14786278701', 'Et blanditiis unde rerum dolorem odio veniam et. Vel laboriosam quod alias quisquam.', 3, '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(4, 'Israel', '547 Kihn Hills\nEddmouth, ND 58776-8809', 'Tysonfort', '51096-1062', '+15755991440', 'Quia et suscipit optio a ullam. Voluptatem magnam dolores maxime voluptatum qui omnis.', 9, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(5, 'Cuba', '943 Lon Trail\nEulamouth, RI 77743', 'Wardbury', '53696-8735', '+15178470980', 'Omnis culpa ex omnis. Ut quo esse iusto maiores. Rerum sunt exercitationem voluptatem quos.', 3, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(6, 'Guernsey', '2646 Von Landing\nNew Erica, MS 96501', 'Langworthport', '27663-8562', '+19192296129', 'Pariatur totam dolores sint. Nulla vero doloribus saepe quaerat. Reprehenderit rerum facere animi.', 1, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(7, 'Marshall Islands', '98855 Annamae Parks\nRubybury, IN 43016-7610', 'South Blake', '01032-0748', '+18547760100', 'Itaque rerum deleniti aut. Iusto nemo harum nisi ipsum voluptas.', 8, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(8, 'Cameroon', '11070 Paucek Stravenue Apt. 123\nPort Franceschester, MI 41615', 'Kiarrachester', '79951-1146', '+12052129311', 'Et est nisi ea est. Est explicabo tempora laborum. Dolorem ad et iure.', 8, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(9, 'Haiti', '738 Metz Wells\nSouth Trinityview, VT 08934-2603', 'Lake Laurianne', '41265', '+17545229928', 'Voluptatem itaque enim molestias commodi illo. Nemo iste eligendi facere numquam.', 10, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(10, 'Grenada', '9066 Schaden Manor\nRoobville, HI 60485', 'New Claudie', '24272', '+13807626094', 'Ex illo possimus aspernatur vero. Explicabo in rerum pariatur possimus.', 5, '2022-08-14 06:45:14', '2022-08-14 06:45:14');

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
(1, 'Category 35', 'Img of Category 35', 1, 1, '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(2, 'Category 134', 'Img of Category 134', 0, 1, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(3, 'Category 187', 'Img of Category 187', 0, 0, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(4, 'Category 71', 'Img of Category 71', 0, 1, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(5, 'Category 106', 'Img of Category 106', 1, 0, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(6, 'Category 14', 'Img of Category 14', 0, 1, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(7, 'Category 27', 'Img of Category 27', 0, 0, '2022-08-14 06:45:09', '2022-08-14 06:45:09'),
(8, 'Category 100', 'Img of Category 100', 1, 1, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(9, 'Category 191', 'Img of Category 191', 1, 0, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(10, 'Category 38', 'Img of Category 38', 1, 1, '2022-08-14 06:45:10', '2022-08-14 06:45:10');

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
(1, '775 Elijah Rest Suite 023\nMcKenziehaven, DE 75031-8303', '+16785551775', 'johnson.otha@example.com', '10.00 AM to 8.00 PM. Friday is Off Day', 'Img 81', '2022-08-14 06:45:17', '2022-08-14 06:45:17');

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
(1, '1f5109', 197, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(2, '43f155', 26, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(3, 'e1c74', 150, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(4, '1d01', 77, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(5, '4ad15', 166, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(6, 'bfb130', 129, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(7, 'c0348', 108, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(8, '1cb147', 105, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(9, 'c31168', 78, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(10, '70a22', 30, '2022-08-14 06:45:16', '2022-08-14 06:45:16');

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
(1, 'Shannon Emard', 'swift.athena@example.org', 'Rerum ea et eos sit enim omnis. Culpa qui quis ut distinctio. Totam dolore suscipit consequatur id.', 0, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(2, 'Maria Kessler', 'savanna45@example.net', 'Quisquam eos similique ut eum numquam amet eaque. Voluptatem unde mollitia similique iste eaque.', 0, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(3, 'Aaron Jones', 'clangworth@example.com', 'Repellendus est nihil ut rerum vel optio voluptas saepe. Suscipit nam et fugit dolorum voluptate.', 1, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(4, 'Vernice O\'Kon PhD', 'diego.roberts@example.com', 'Est at qui amet. Iure et rerum sit architecto.', 1, '2022-08-14 06:45:16', '2022-08-14 06:45:16'),
(5, 'Mr. Cedrick Hand', 'sean.schroeder@example.org', 'Ducimus magni quidem delectus molestias. Sit consectetur odit ea illum. Saepe in est odio atque.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(6, 'Keshaun Dietrich', 'jessica.vandervort@example.org', 'Laborum occaecati qui voluptatem et quia in. Aut dignissimos laborum et.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(7, 'Braulio Wisoky', 'alessandro.cummerata@example.net', 'Consequatur enim omnis odio. Fugiat nam ut dolores. Blanditiis eius porro in.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(8, 'Angie Sanford Jr.', 'carolyne13@example.org', 'Quas sequi nobis et. Quia perferendis molestiae magni explicabo.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(9, 'Prof. Jordan Doyle III', 'weissnat.kaylah@example.com', 'Vel sit sunt voluptatem dignissimos voluptatem. Nulla odit sunt id iure.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(10, 'Coby Goodwin', 'xmcclure@example.org', 'Vitae et est et est ducimus velit. Sit officiis aut voluptate molestias.', 1, '2022-08-14 06:45:17', '2022-08-14 06:45:17');

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
(1, 'gwintheiser@example.com', '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(2, 'luz.medhurst@example.net', '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(3, 'marie36@example.net', '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(4, 'millie87@example.com', '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(5, 'feest.velva@example.net', '2022-08-14 06:45:17', '2022-08-14 06:45:17'),
(6, 'scassin@example.net', '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(7, 'ckshlerin@example.com', '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(8, 'idell.schmidt@example.com', '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(9, 'ydurgan@example.com', '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(10, 'jadyn29@example.org', '2022-08-14 06:45:18', '2022-08-14 06:45:18');

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
(1, 7, 162, 30.00, 230.00, 8, 32, 160, 0, 1, 8, 10, 1, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(2, 4, 532, 434.00, 634.00, 1, 5, 428, 0, 8, 9, 10, 1, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(3, 8, 258, 830.00, 1030.00, 6, 26, 340, 1, 10, 2, 6, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(4, 6, 384, 464.00, 664.00, 2, 8, 241, 0, 1, 7, 4, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(5, 1, 358, 546.00, 746.00, 9, 9, 302, 0, 2, 8, 5, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(6, 3, 649, 435.00, 635.00, 6, 33, 100, 1, 10, 10, 3, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(7, 3, 130, 123.00, 323.00, 3, 35, 379, 1, 7, 10, 8, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(8, 10, 301, 760.00, 960.00, 2, 45, 258, 0, 3, 3, 3, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(9, 6, 439, 572.00, 772.00, 3, 7, 392, 0, 3, 6, 9, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20'),
(10, 5, 709, 704.00, 904.00, 6, 14, 207, 0, 10, 10, 2, 1, '2022-08-14 06:45:20', '2022-08-14 06:45:20');

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
(1, 'Color 96', 'Img of Color 96', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(2, 'Color 113', 'Img of Color 113', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(3, 'Color 146', 'Img of Color 146', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(4, 'Color 143', 'Img of Color 143', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(5, 'Color 6', 'Img of Color 6', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(6, 'Color 12', 'Img of Color 12', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(7, 'Color 90', 'Img of Color 90', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(8, 'Color 183', 'Img of Color 183', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(9, 'Color 153', 'Img of Color 153', '2022-08-14 06:45:13', '2022-08-14 06:45:13'),
(10, 'Color 107', 'Img of Color 107', '2022-08-14 06:45:13', '2022-08-14 06:45:13');

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
(1, 'Product Img 54', 2, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(2, 'Product Img 60', 6, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(3, 'Product Img 119', 1, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(4, 'Product Img 91', 4, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(5, 'Product Img 73', 1, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(6, 'Product Img 46', 6, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(7, 'Product Img 86', 3, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(8, 'Product Img 104', 8, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(9, 'Product Img 101', 4, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(10, 'Product Img 189', 1, '2022-08-14 06:45:21', '2022-08-14 06:45:21');

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
(1, 'Product 127', 'Rerum mollitia voluptas eius repellat et aspernatur rem. Neque id rerum ut facere modi commodi cum.', 'Voluptate ut et possimus consequatur eligendi voluptatem. Voluptates libero expedita quam.', 10, '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(2, 'Product 87', 'Quia sint quis reprehenderit tenetur. Vel ullam eos culpa.', 'Occaecati sit iure consequatur nesciunt ut sunt et. Quia iste iure error id.', 1, '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(3, 'Product 25', 'Et nulla non et in et unde est. Temporibus enim non sed ab. Nam nostrum ut omnis facere.', 'Consequuntur cum vel laborum. Unde nihil est culpa aut id. Harum a sed porro ad in rem.', 3, '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(4, 'Product 33', 'Neque veniam excepturi est fugiat eos. Nobis sit laudantium vero possimus nostrum quo eos qui.', 'Dolores libero alias rerum omnis excepturi necessitatibus et. Voluptas et accusantium optio unde.', 3, '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(5, 'Product 8', 'Perferendis rem repellendus consequuntur. Porro et cum et et. Libero voluptas delectus eos minima.', 'Maiores aperiam eligendi non eum. Ab est dolor est esse cumque tenetur. Sed est eum quae.', 3, '2022-08-14 06:45:18', '2022-08-14 06:45:18'),
(6, 'Product 152', 'Enim veniam quia debitis qui. Dolores voluptatem commodi rem dicta eligendi.', 'Eos quia aut id. Sequi ipsam aut quaerat. Error ea debitis illum.', 4, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(7, 'Product 10', 'Aut nam ut sint eveniet quia sint repellat. Aut eaque commodi qui enim rem tempora numquam.', 'Modi non eum non quisquam ut aut ut. Debitis et et neque quas sit quia. Saepe et tempora rem at.', 2, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(8, 'Product 49', 'Est non sunt enim non. Excepturi iusto iure repellat quo.', 'Consequatur dolor laborum facere est. Non vel inventore quas quos quo. At possimus ad perspiciatis.', 10, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(9, 'Product 139', 'Qui quasi dignissimos ut cum sed qui delectus. Est et soluta rerum quos blanditiis.', 'Quis ut tempora neque est ipsum ipsa sit. Culpa veniam pariatur perspiciatis voluptatem sed quia.', 8, '2022-08-14 06:45:19', '2022-08-14 06:45:19'),
(10, 'Product 116', 'In sunt quo aut. Beatae autem expedita id fuga. Consequatur qui fuga dicta.', 'Error dolor quaerat architecto vel. Nulla eius dolores et earum cum. Et adipisci omnis et.', 7, '2022-08-14 06:45:19', '2022-08-14 06:45:19');

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
(1, 'Pariatur et at molestiae in nisi. Ut doloribus dolor est qui. Voluptatem impedit et at.', 5, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(2, 'Placeat quam qui eum natus aut. Optio voluptas doloremque rem qui quia.', 7, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(3, 'Ipsa modi iusto qui rerum. Aut optio at perspiciatis qui commodi. Ut sit dolores facere et eaque.', 1, 'Card', 1, '74fd37b6e7f254ac99327df72ac58a37', 0, 0, 0, 0, NULL, '2022-08-14 06:45:14', '2022-08-14 06:45:14'),
(4, 'Eos ratione deleniti quis et molestiae aliquam maxime. Ut beatae corporis reiciendis tempora.', 1, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(5, 'Consectetur atque enim ut nisi. Omnis molestiae quia non occaecati deserunt.', 3, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(6, 'Nihil maiores est consequatur iste. Occaecati quia quasi perspiciatis suscipit itaque ut unde.', 10, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(7, 'Qui qui sunt quidem consequatur ipsam. Et alias est ratione illo. Et impedit consequatur est quia.', 10, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(8, 'Voluptatem quibusdam eaque ut voluptas quidem fugit velit. Omnis cum est ut et rerum aut.', 5, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(9, 'Aut ut et dolores voluptatibus. Dolorem quod voluptas voluptatem unde molestias fugit.', 7, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-14 06:45:15', '2022-08-14 06:45:15'),
(10, 'A itaque illum accusamus aut et laborum facere. Aliquam vel nam sit a voluptatem.', 6, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-14 06:45:15', '2022-08-14 06:45:15');

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
(1, 4, 0, 8, '2022-08-14 06:45:20', '2022-08-14 06:45:20');

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
(1, 'Size 68', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(2, 'Size 69', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(3, 'Size 39', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(4, 'Size 180', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(5, 'Size 142', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(6, 'Size 28', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(7, 'Size 45', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(8, 'Size 115', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(9, 'Size 43', '2022-08-14 06:45:12', '2022-08-14 06:45:12'),
(10, 'Size 56', '2022-08-14 06:45:12', '2022-08-14 06:45:12');

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
(1, 'Rem harum quia reprehenderit quas. Facere maiores natus et corporis rerum.', 1, 2, 9, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(2, 'Quis qui et impedit aut. Ab et a pariatur perspiciatis non molestias.', 4, 7, 4, '2022-08-14 06:45:21', '2022-08-14 06:45:21'),
(3, 'Perspiciatis et aut quis est fugiat voluptates. Labore ut sed mollitia possimus consequatur.', 4, 3, 4, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(4, 'Numquam illo est omnis magnam. Facilis et saepe vel. Ducimus id atque quas quo.', 2, 6, 8, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(5, 'Adipisci dicta in quae molestias aut sit sint. Harum possimus dolores autem illo.', 4, 7, 4, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(6, 'Officia laboriosam maxime aut. Ullam quis quos facere mollitia. Laboriosam non voluptatibus in non.', 5, 1, 8, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(7, 'Non at aut ipsa doloremque. Suscipit debitis esse doloribus aut sapiente culpa.', 2, 10, 5, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(8, 'Tenetur fuga itaque occaecati voluptates rem qui facere. Sit et laudantium sed.', 2, 10, 4, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(9, 'Modi ea autem nam. Ea est ipsam illum repellendus. Nam sed quos quis vitae.', 2, 1, 5, '2022-08-14 06:45:22', '2022-08-14 06:45:22'),
(10, 'Aut nesciunt velit veniam id. Nulla eaque ut ab commodi.', 2, 8, 1, '2022-08-14 06:45:22', '2022-08-14 06:45:22');

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
(1, 122, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(2, 37, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(3, 55, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(4, 62, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(5, 13, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(6, 21, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(7, 23, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(8, 195, '2022-08-14 06:45:10', '2022-08-14 06:45:10'),
(9, 200, '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(10, 88, '2022-08-14 06:45:11', '2022-08-14 06:45:11');

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
(1, 21, 10, '2022-08-14 06:45:20', '2022-08-14 06:45:20');

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
(1, 'Unit 181', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(2, 'Unit 94', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(3, 'Unit 128', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(4, 'Unit 47', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(5, 'Unit 194', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(6, 'Unit 103', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(7, 'Unit 80', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(8, 'Unit 24', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(9, 'Unit 92', '2022-08-14 06:45:11', '2022-08-14 06:45:11'),
(10, 'Unit 169', '2022-08-14 06:45:12', '2022-08-14 06:45:12');

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
(1, 'Leanna Hegmann', 'bernier.izabella@example.org', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iL504YYpU7', '2022-08-14 06:45:07', '2022-08-14 06:45:07'),
(2, 'Johnny Schinner', 'umclaughlin@example.org', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aAdayfimw1', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(3, 'Dr. Tom Rowe', 'heidenreich.kaylin@example.org', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mN8ml8wcBP', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(4, 'Jacey Pacocha', 'willms.gonzalo@example.org', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3FEKLgmzFU', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(5, 'Mr. Golden Toy IV', 'viola64@example.net', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Fa7ZkG9mkZ', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(6, 'Giles Hirthe', 'dfriesen@example.com', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xxm1vl5PD5', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(7, 'Thea Senger III', 'jay.brekke@example.net', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ugMh7S7GkP', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(8, 'Prof. Henri Greenfelder I', 'ocollier@example.org', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rkJr9fWbkY', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(9, 'Minerva Borer', 'candida.lind@example.com', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ukeMLMGbSb', '2022-08-14 06:45:08', '2022-08-14 06:45:08'),
(10, 'Dr. Dax Kohler', 'bergstrom.art@example.com', '2022-08-14 06:45:07', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HZFOqO2fMW', '2022-08-14 06:45:08', '2022-08-14 06:45:08');

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
