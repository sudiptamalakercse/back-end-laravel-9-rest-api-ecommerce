-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2022 at 11:16 AM
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
(1, 'Isobel Bartoletti', 'deffertz@example.org', '2022-08-27 02:54:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CQRErCfCE5', '2022-08-27 02:54:55', '2022-08-27 02:54:55');

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
(1, 'Mali', '71147 Bauch Spring\nArmstrongstad, NE 60757-8944', 'West Eusebiobury', '41622', '+16237475117', 'Sint vel et aut quos aperiam eius et. Maxime nemo velit laboriosam accusantium explicabo fugiat.', 1, '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(2, 'Kenya', '964 Nitzsche Overpass Apt. 371\nEast Olga, KS 02819-7990', 'West Lukas', '72258-0845', '+17746803124', 'Quia molestias temporibus culpa est. Est est dolorum magni. Aut aut eos ut.', 10, '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(3, 'Faroe Islands', '4203 Meagan Drives\nMetaside, HI 59241-3157', 'North Kathleenchester', '99466', '+14129027316', 'Facilis ut aut aperiam eaque. Aut voluptatem sit non assumenda.', 10, '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(4, 'Palau', '206 Padberg Skyway Suite 539\nKovacekchester, KY 07331-4051', 'North Zechariahbury', '61534', '+13213655344', 'Dolor quia itaque dolore perspiciatis et voluptatibus maiores. Omnis maxime sed minima.', 3, '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(5, 'American Samoa', '5450 Germaine Alley Suite 985\nEast Edwardtown, NE 78643-9131', 'Lake Kennedyfort', '04979-7097', '+13136579504', 'Doloribus ut doloremque eaque non dolorum voluptatem perspiciatis. Non eos qui illo non rem.', 7, '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(6, 'Mauritius', '947 Beahan Mall\nNew Clarissaport, ID 11686', 'North Chandler', '63975-4859', '+15855094436', 'Alias enim officia incidunt accusamus. Fugiat est doloribus aut veniam error tempora nostrum.', 4, '2022-08-27 02:55:02', '2022-08-27 02:55:02'),
(7, 'Azerbaijan', '603 Treutel Valley Suite 748\nBrannonmouth, IN 59520', 'Nehashire', '49112-7873', '+16206061898', 'Fuga qui voluptatem sunt sunt. Totam dolore laborum ducimus eos. Quia nam labore sit voluptatum.', 4, '2022-08-27 02:55:02', '2022-08-27 02:55:02'),
(8, 'Portugal', '3074 Simeon Lock\nKadenview, CT 59534', 'Alfonzohaven', '28731', '+19074579389', 'Ipsa rerum in iste nam voluptate. Omnis provident ipsa facilis totam et voluptatem nam.', 6, '2022-08-27 02:55:02', '2022-08-27 02:55:02'),
(9, 'Niger', '984 Juliana Bridge\nCarrollton, TX 20874', 'Port Caroleshire', '04026', '+17203485577', 'Ut optio rerum dolorem laboriosam. Cum repellat commodi id est et quo totam.', 9, '2022-08-27 02:55:02', '2022-08-27 02:55:02'),
(10, 'Paraguay', '748 Christophe Park Suite 107\nUptonborough, MA 07202', 'New Jenaton', '44950', '+15024283778', 'Saepe ut porro dolore delectus dolor rerum. Ipsam sint sit sed totam id aut dolor.', 8, '2022-08-27 02:55:02', '2022-08-27 02:55:02');

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
(1, 'Category 180', 'Img of Category 180', 1, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(2, 'Category 89', 'Img of Category 89', 0, 1, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(3, 'Category 99', 'Img of Category 99', 1, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(4, 'Category 107', 'Img of Category 107', 0, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(5, 'Category 173', 'Img of Category 173', 0, 1, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(6, 'Category 139', 'Img of Category 139', 0, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(7, 'Category 78', 'Img of Category 78', 0, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(8, 'Category 177', 'Img of Category 177', 0, 1, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(9, 'Category 170', 'Img of Category 170', 1, 1, '2022-08-27 02:54:56', '2022-08-27 02:54:56'),
(10, 'Category 55', 'Img of Category 55', 0, 0, '2022-08-27 02:54:56', '2022-08-27 02:54:56');

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
(1, '7522 Ebert Extensions\nWest Kavonmouth, MO 35200', '+17867333995', 'vlueilwitz@example.org', '10.00 AM to 8.00 PM. Friday is Off Day', 'Img 176', '2022-08-27 02:55:07', '2022-08-27 02:55:07');

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
(1, 'cb142', 19, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(2, '01a183', 153, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(3, '522168', 80, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(4, '3c4155', 126, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(5, 'b9d81', 188, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(6, '71a135', 146, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(7, '015119', 182, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(8, 'e2664', 169, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(9, 'ec186', 199, '2022-08-27 02:55:05', '2022-08-27 02:55:05'),
(10, 'd23179', 75, '2022-08-27 02:55:05', '2022-08-27 02:55:05');

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
(1, 'Mr. Alek Tromp III', 'angelita.grant@example.com', 'Minima qui nisi quia totam maxime. Voluptas architecto reiciendis reprehenderit vero.', 1, '2022-08-27 02:55:06', '2022-08-27 02:55:06'),
(2, 'Norberto Wilderman', 'goldner.claudia@example.com', 'Fugiat ut hic minima ipsum. Atque error corrupti quos suscipit recusandae qui.', 0, '2022-08-27 02:55:06', '2022-08-27 02:55:06'),
(3, 'Bernard Ritchie', 'whodkiewicz@example.net', 'Quidem repellendus in mollitia voluptatum. Odio voluptatum in eligendi eum numquam et.', 0, '2022-08-27 02:55:06', '2022-08-27 02:55:06'),
(4, 'Elmo Heller II', 'ohilpert@example.org', 'Ut labore adipisci placeat accusamus voluptas praesentium. Esse non velit aspernatur nostrum.', 0, '2022-08-27 02:55:06', '2022-08-27 02:55:06'),
(5, 'Kayli Jast', 'fadel.cecilia@example.org', 'Et voluptas veritatis corporis quisquam tenetur. Voluptatum quo ex corrupti et cumque.', 0, '2022-08-27 02:55:06', '2022-08-27 02:55:06'),
(6, 'Miss Claudie Moen', 'dicki.myra@example.com', 'Enim aut magnam molestiae illum. Sed dolor ullam vel inventore sapiente. Eos aut qui deleniti sed.', 1, '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(7, 'Ryley Johnson', 'kailyn49@example.org', 'Debitis officia iste numquam officia. Et et ea qui aut.', 1, '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(8, 'Micaela Russel', 'mcclure.lucy@example.org', 'Dolorum sit et et. Sapiente voluptatem aperiam tempore et sequi sint error voluptatem.', 1, '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(9, 'Mr. Jasper Grady V', 'eudora.kohler@example.net', 'Quaerat eos qui ipsa voluptatibus. Quis neque quidem voluptate.', 0, '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(10, 'Fausto Halvorson', 'hgoyette@example.com', 'Et quae et placeat quo quas ex beatae rem. Rerum ab delectus et est repellat.', 1, '2022-08-27 02:55:07', '2022-08-27 02:55:07');

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
(1, 'colleen.little@example.org', '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(2, 'craig08@example.net', '2022-08-27 02:55:07', '2022-08-27 02:55:07'),
(3, 'annalise.yundt@example.org', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(4, 'abshire.rowan@example.org', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(5, 'will.watsica@example.com', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(6, 'streutel@example.org', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(7, 'hmante@example.net', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(8, 'raynor.rosendo@example.org', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(9, 'tre.conn@example.net', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(10, 'lynch.thora@example.net', '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(12, 'malakersudipta@gmail.com', '2022-08-27 09:38:53', '2022-08-27 09:38:53'),
(13, 'sudiptarakib@gmail.com', '2022-08-27 11:38:00', '2022-08-27 11:38:00');

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
(2, 'App\\Models\\Admin', 1, 'deffertz@example.org', '52399e4333899906bff288419946887da2c285daeba67696d81687ce3d4722e7', '[\"*\"]', '2022-08-27 21:29:07', '2022-08-27 21:00:46', '2022-08-27 21:29:07');

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
(1, 9, 921, 35.00, 235.00, 3, 0, 99, 0, 6, 8, 7, 1, '2022-08-27 02:55:10', '2022-08-27 02:55:10'),
(2, 10, 977, 325.00, 525.00, 7, 0, 117, 1, 1, 8, 7, 1, '2022-08-27 02:55:10', '2022-08-27 02:55:10'),
(3, 10, 814, 334.00, 534.00, 1, 0, 404, 0, 9, 1, 9, 1, '2022-08-27 02:55:10', '2022-08-27 02:55:10'),
(4, 7, 138, 577.00, 777.00, 10, 17, 101, 0, 3, 4, 2, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(5, 8, 372, 825.00, 1025.00, 3, 32, 405, 1, 7, 7, 1, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(6, 10, 431, 232.00, 432.00, 4, 0, 371, 1, 8, 10, 8, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(7, 10, 771, 222.00, 422.00, 9, 0, 51, 0, 7, 9, 9, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(8, 1, 687, 435.00, 635.00, 1, 28, 10, 0, 10, 5, 9, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(9, 7, 870, 990.00, 1190.00, 7, 47, 191, 1, 9, 1, 2, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11'),
(10, 1, 370, 510.00, 710.00, 3, 44, 379, 1, 7, 3, 7, 1, '2022-08-27 02:55:11', '2022-08-27 02:55:11');

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
(1, 'Color 194', 'Img of Color 194', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(2, 'Color 82', 'Img of Color 82', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(3, 'Color 25', 'Img of Color 25', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(4, 'Color 130', 'Img of Color 130', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(5, 'Color 11', 'Img of Color 11', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(6, 'Color 95', 'Img of Color 95', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(7, 'Color 143', 'Img of Color 143', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(8, 'Color 195', 'Img of Color 195', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(9, 'Color 190', 'Img of Color 190', '2022-08-27 02:55:01', '2022-08-27 02:55:01'),
(10, 'Color 162', 'Img of Color 162', '2022-08-27 02:55:01', '2022-08-27 02:55:01');

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
(1, 'Product Img 94', 6, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(2, 'Product Img 185', 9, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(3, 'Product Img 71', 5, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(4, 'Product Img 47', 5, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(5, 'Product Img 189', 5, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(6, 'Product Img 87', 7, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(7, 'Product Img 51', 3, '2022-08-27 02:55:12', '2022-08-27 02:55:12'),
(8, 'Product Img 192', 5, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(9, 'Product Img 9', 8, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(10, 'Product Img 184', 3, '2022-08-27 02:55:13', '2022-08-27 02:55:13');

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
(1, 'Product 134', 'Accusantium sint esse enim facilis pariatur fugiat modi. Itaque deserunt hic iusto et quo quia eum.', 'Non distinctio error aperiam autem non. Minus ut iste sequi nemo doloribus aut omnis.', 1, '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(2, 'Product 8', 'Eaque consequatur voluptatem ut quidem ea ullam ut. Consequatur sunt qui rem voluptates ipsum.', 'Veniam dolor nam aliquam. Ea provident nulla culpa laborum. Repellat eius vero aut ullam repellat.', 4, '2022-08-27 02:55:08', '2022-08-27 02:55:08'),
(3, 'Product 18', 'Nobis eaque placeat ut veniam repellendus. Velit eveniet esse praesentium aspernatur.', 'Dolor est molestiae aut sunt repudiandae veritatis. Magni aut itaque est expedita soluta.', 8, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(4, 'Product 88', 'Sint pariatur itaque assumenda et maiores in quo excepturi. Soluta quo temporibus veritatis ut in.', 'Et minus mollitia consectetur inventore. Rerum aliquid quo dolorem maiores voluptatem et corporis.', 1, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(5, 'Product 5', 'Nihil quis tenetur fuga vel ut. Ipsa quaerat necessitatibus culpa libero sed.', 'Ea minus et numquam voluptatem rerum perspiciatis. Qui omnis ipsum aut odio beatae eum molestiae.', 2, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(6, 'Product 74', 'Minima dolorum facere optio. Aut excepturi assumenda est aut maiores.', 'Quo praesentium fugit rerum quia occaecati reprehenderit. Distinctio nihil vitae sed consequatur.', 3, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(7, 'Product 30', 'Fuga fuga aut in dolorum. Quos culpa suscipit et et voluptatem. Facere est quo doloremque quia et.', 'Et qui eligendi mollitia autem adipisci ratione. Pariatur nisi quibusdam itaque.', 1, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(8, 'Product 50', 'Sint autem hic placeat alias repellat odit. Eligendi asperiores voluptas quia enim autem.', 'Officia illum et doloribus ducimus architecto fuga molestiae. Doloremque suscipit et error ullam.', 7, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(9, 'Product 2', 'Consequuntur et unde porro quisquam. Corrupti ipsa omnis incidunt.', 'Eum aut sit aut. Tempore velit aut velit. Optio corporis est sit.', 3, '2022-08-27 02:55:09', '2022-08-27 02:55:09'),
(10, 'Product 114', 'Eius culpa ut dolores. Et velit quae aut.', 'Quae nobis sunt voluptatem. Earum corporis id nesciunt.', 9, '2022-08-27 02:55:09', '2022-08-27 02:55:09');

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
(1, 'Est maiores laborum tempore. Cum ut repellat quasi esse enim. Quo quasi quae unde voluptatem.', 4, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-27 02:55:03', '2022-08-27 02:55:03'),
(2, 'Ad id itaque at. Harum impedit voluptates harum vero culpa omnis nostrum. Quia tempora ut hic.', 7, 'Card', 1, '66d5ccbc412c2f58b17be128fe692c25', 0, 0, 0, 1, NULL, '2022-08-27 02:55:03', '2022-08-27 02:55:03'),
(3, 'Dignissimos quis laborum id accusamus. Qui unde quo mollitia et dolor sed.', 10, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-27 02:55:03', '2022-08-27 02:55:03'),
(4, 'Consequatur consequatur vitae voluptates. Dolores autem illum velit minima.', 10, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(5, 'Placeat vero ab aliquid fuga libero asperiores laborum. Et sed fugit non possimus.', 1, 'Cash', 0, '', 0, 0, 0, 1, NULL, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(6, 'Velit est non mollitia reiciendis. Eum dolor soluta in iste. Aut consequatur quia voluptas et.', 10, 'Card', 1, '347f6e34d95aa3dd4f0508a45278ff3b', 1, 1, 1, 0, 1, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(7, 'Iure id autem aut id nemo magnam et itaque. Autem rerum voluptas laudantium.', 10, 'Card', 1, '5accbd025fba41ff8865064bee4e2d26', 1, 1, 1, 0, 1, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(8, 'Nemo perspiciatis consectetur voluptatibus. Repellendus at et nihil.', 4, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(9, 'Porro sit magni enim. Et eligendi et iure reprehenderit voluptatum ut iusto facere.', 2, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-27 02:55:04', '2022-08-27 02:55:04'),
(10, 'Impedit quam veniam distinctio facilis eaque consequuntur vitae. Doloremque quibusdam in et sequi.', 10, 'Cash', 0, '', 0, 0, 0, 0, NULL, '2022-08-27 02:55:04', '2022-08-27 02:55:04');

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
(1, 184, 0, 2, '2022-08-27 02:55:12', '2022-08-27 02:55:12');

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
(1, 'Size 54', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(2, 'Size 24', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(3, 'Size 175', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(4, 'Size 45', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(5, 'Size 33', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(6, 'Size 129', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(7, 'Size 52', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(8, 'Size 131', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(9, 'Size 198', '2022-08-27 02:55:00', '2022-08-27 02:55:00'),
(10, 'Size 120', '2022-08-27 02:55:00', '2022-08-27 02:55:00');

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
(1, 'Cum quisquam dolor sit ut error placeat. Ipsam beatae est quam et.', 3, 2, 8, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(2, 'Sit maxime assumenda praesentium numquam. Culpa quis ea voluptatem illum commodi.', 1, 4, 8, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(3, 'Sequi nemo est ut libero. Alias reprehenderit laborum facere deleniti hic distinctio sequi qui.', 4, 8, 3, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(4, 'Id quo nam quis. Mollitia amet quaerat corrupti sit ut perspiciatis qui.', 2, 1, 5, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(5, 'Harum et saepe voluptas cum. Eos iure quo assumenda placeat recusandae architecto iste fugit.', 4, 4, 6, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(6, 'Quia facilis facilis et officia repellendus. Nesciunt nihil officiis quae nam ipsam.', 2, 2, 2, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(7, 'Aut ut consequatur optio iure incidunt eveniet. Eligendi doloribus vitae nemo rem rem.', 3, 6, 5, '2022-08-27 02:55:13', '2022-08-27 02:55:13'),
(8, 'Esse qui placeat necessitatibus. Consectetur sit quo hic id quo. Dignissimos et iste iusto.', 1, 6, 4, '2022-08-27 02:55:14', '2022-08-27 02:55:14'),
(9, 'Numquam qui quisquam eum. Magnam praesentium assumenda ipsa. Et ea rem asperiores tempora.', 5, 2, 5, '2022-08-27 02:55:14', '2022-08-27 02:55:14'),
(10, 'Quo reiciendis at eius non doloremque nemo non aut. Hic sit voluptatem dolorum.', 3, 3, 10, '2022-08-27 02:55:14', '2022-08-27 02:55:14');

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
(1, 31, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(2, 191, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(3, 21, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(4, 69, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(5, 164, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(6, 149, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(7, 96, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(8, 49, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(9, 104, '2022-08-27 02:54:57', '2022-08-27 02:54:57'),
(10, 133, '2022-08-27 02:54:57', '2022-08-27 02:54:57');

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
(1, 76, 4, '2022-08-27 02:55:11', '2022-08-27 02:55:11');

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
(1, 'Unit 105', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(2, 'Unit 123', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(3, 'Unit 103', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(4, 'Unit 72', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(5, 'Unit 108', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(6, 'Unit 171', '2022-08-27 02:54:58', '2022-08-27 02:54:58'),
(7, 'Unit 187', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(8, 'Unit 122', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(9, 'Unit 121', '2022-08-27 02:54:59', '2022-08-27 02:54:59'),
(10, 'Unit 200', '2022-08-27 02:54:59', '2022-08-27 02:54:59');

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
(1, 'Curtis Bosco DDS', 'emelia.yost@example.org', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NnI0fqhZ0z', '2022-08-27 02:54:54', '2022-08-27 02:54:54'),
(2, 'Julianne Kutch', 'xveum@example.com', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jlFsYmG9VZ', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(3, 'Nannie Johns', 'zbahringer@example.net', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k2t9sSf1xU', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(4, 'Daron Schowalter', 'candice36@example.org', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OzVAq0ZFb5', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(5, 'Ms. Mandy Dooley', 'abbott.dax@example.net', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wMOR6cFu9F', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(6, 'Skyla Orn V', 'glen90@example.org', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Wx7N3C0dRf', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(7, 'Jazlyn Spinka', 'cmoore@example.net', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'z4S7OIN2kf', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(8, 'Arvilla Paucek', 'frederik.wintheiser@example.net', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XQqE4l9H5U', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(9, 'Mrs. Mae Wehner', 'santos.hamill@example.net', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MMHASpKkP8', '2022-08-27 02:54:55', '2022-08-27 02:54:55'),
(10, 'Mae Legros', 'mabelle.hirthe@example.org', '2022-08-27 02:54:54', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PkYQMADd9a', '2022-08-27 02:54:55', '2022-08-27 02:54:55');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
