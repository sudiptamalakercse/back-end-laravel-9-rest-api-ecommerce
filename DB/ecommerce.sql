-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2022 at 10:37 AM
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
(1, 'Cortez Lemke', 'mathias83@example.net', '2022-08-25 02:32:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OhorGKiZ1A', '2022-08-25 02:32:53', '2022-08-25 02:32:53');

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
(1, 'Reunion', '150 Christian Plain Suite 518\nWest Jarredborough, NE 97165-2716', 'New Shyannbury', '12089-9730', '+16103852076', 'Similique adipisci perferendis minus ab tempore. Itaque aspernatur sit magni.', 9, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(2, 'British Virgin Islands', '27823 Cruickshank Islands Suite 195\nHesterhaven, DC 55603-2837', 'North Elwinberg', '50390-1718', '+13528834481', 'Facere aut omnis id. Veritatis eum officia distinctio in delectus non distinctio.', 9, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(3, 'Netherlands Antilles', '43897 Charley View\nLeannaville, NV 59226-1976', 'Chelseatown', '94625', '+16282267254', 'Laboriosam minima velit non porro repudiandae quidem in. Neque velit dolore sunt ipsa.', 3, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(4, 'Saint Vincent and the Grenadines', '228 Camden Creek Apt. 121\nSoledadchester, MI 90157', 'Lake Polly', '81160', '+18507727088', 'Dolores et rerum quam. Omnis totam voluptatum voluptates ipsa. Porro et fuga voluptatem.', 5, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(5, 'Falkland Islands (Malvinas)', '431 Lysanne Stream\nCorineton, CO 07701', 'Crookston', '79004', '+17259707293', 'Vel mollitia nihil sed et. Voluptatem eaque eum occaecati. Voluptatem accusamus ut nihil sunt.', 2, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(6, 'Honduras', '3360 Beer Valley Suite 896\nWest Rhianna, WA 26605', 'East Iliana', '43344', '+19159363557', 'Sint facilis ea aliquid tempora. Assumenda porro ullam ut beatae. Id soluta ea esse eum distinctio.', 10, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(7, 'Togo', '506 Kshlerin Land\nNorth Briafort, SD 90852', 'Gislasonshire', '70433', '+13367200003', 'Eum quia quisquam a et. Quos dolores earum et nisi. In magni autem dolorum ut ipsa neque.', 9, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(8, 'Christmas Island', '5609 Marion Locks Apt. 050\nNorth Alyshaside, ID 37776-7914', 'Elmerberg', '73025-8341', '+13514278898', 'Pariatur ut velit dicta. Adipisci sint iure unde totam. Laborum et optio tempore et.', 5, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(9, 'Bhutan', '6179 Janice Road Suite 480\nEast Maudieville, NY 21635-3347', 'East Cameronland', '59417-7135', '+17277300035', 'Commodi corporis et ducimus ea. Excepturi suscipit reprehenderit modi.', 1, '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(10, 'Guernsey', '91829 Hill Drive\nWest Yazminberg, NY 41062-9564', 'West Myronberg', '62952-0278', '+12404359571', 'Eos quidem eveniet assumenda eaque placeat quia nesciunt dolore. Nesciunt sit ut cumque.', 9, '2022-08-25 02:32:58', '2022-08-25 02:32:58');

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
(1, 'Category 19', 'Img of Category 19', 0, 0, '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(2, 'Category 92', 'Img of Category 92', 0, 0, '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(3, 'Category 143', 'Img of Category 143', 1, 1, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(4, 'Category 31', 'Img of Category 31', 0, 1, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(5, 'Category 118', 'Img of Category 118', 1, 0, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(6, 'Category 171', 'Img of Category 171', 1, 0, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(7, 'Category 167', 'Img of Category 167', 0, 1, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(8, 'Category 140', 'Img of Category 140', 1, 0, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(9, 'Category 61', 'Img of Category 61', 1, 0, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(10, 'Category 88', 'Img of Category 88', 0, 1, '2022-08-25 02:32:54', '2022-08-25 02:32:54');

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
(1, '4762 Deckow Gateway Apt. 478\nEast Caitlyn, AK 74354-9028', '+17549337810', 'aliyah.kling@example.org', '10.00 AM to 8.00 PM. Friday is Off Day', 'Img 127', '2022-08-25 02:33:02', '2022-08-25 02:33:02');

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
(1, 'b9784', 98, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(2, 'c2565', 60, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(3, '47194', 116, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(4, 'c1c41', 10, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(5, '0ca45', 25, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(6, '9d02', 39, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(7, 'd55157', 104, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(8, '76e147', 27, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(9, '2f536', 135, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(10, 'a47136', 150, '2022-08-25 02:33:01', '2022-08-25 02:33:01');

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
(1, 'Mr. Carmelo Hirthe Jr.', 'riley.howell@example.org', 'Non modi saepe laborum earum et ipsa nam qui. Maiores doloribus aut totam suscipit natus.', 0, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(2, 'Guy Runte', 'forest.halvorson@example.com', 'Perspiciatis ex amet fugit quos. Tenetur unde natus cum id quia. Aut ut aliquam modi delectus.', 1, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(3, 'Dr. Freddy Boehm', 'kovacek.cassandra@example.com', 'Aliquam iusto eius est ex. Asperiores placeat corrupti commodi voluptas illum repellendus velit.', 1, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(4, 'Nigel Skiles', 'zrunolfsdottir@example.com', 'Omnis ipsum odit reiciendis consequatur quia aperiam. Fugit sit autem beatae praesentium et.', 0, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(5, 'Prof. Hiram Hayes', 'idella56@example.com', 'Praesentium id quibusdam suscipit ut qui dolorum. Fugiat sunt ab dolorem suscipit ipsum sit rerum.', 0, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(6, 'Marilyne Gottlieb', 'bartoletti.jerrod@example.org', 'Eum dolorem eos aut nemo distinctio dolorem. Occaecati cum velit expedita.', 0, '2022-08-25 02:33:01', '2022-08-25 02:33:01'),
(7, 'Miss Anne Boehm V', 'kaylah.fahey@example.net', 'Nulla perferendis cum dicta minima. Dignissimos adipisci vitae deleniti.', 1, '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(8, 'Alejandrin Vandervort', 'lamar54@example.org', 'Enim corporis provident sint esse ipsum. Et ratione cupiditate doloribus blanditiis omnis.', 1, '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(9, 'Miss Kasey Lubowitz', 'gthiel@example.net', 'Molestiae dolor nobis voluptatem tempore corporis. Autem odio ea ducimus sint.', 1, '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(10, 'Brady Wisoky', 'donald.hahn@example.com', 'Itaque facere ut cumque non perspiciatis. Enim officia voluptates odio facere laborum.', 1, '2022-08-25 02:33:02', '2022-08-25 02:33:02');

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
(1, 'mbotsford@example.org', '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(2, 'lafayette41@example.net', '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(3, 'deangelo.schumm@example.org', '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(4, 'breitenberg.margarita@example.com', '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(5, 'udietrich@example.net', '2022-08-25 02:33:02', '2022-08-25 02:33:02'),
(6, 'mayra.kris@example.org', '2022-08-25 02:33:03', '2022-08-25 02:33:03'),
(7, 'taya10@example.net', '2022-08-25 02:33:03', '2022-08-25 02:33:03'),
(8, 'bhoeger@example.org', '2022-08-25 02:33:03', '2022-08-25 02:33:03'),
(9, 'swaniawski.rosemary@example.com', '2022-08-25 02:33:03', '2022-08-25 02:33:03'),
(10, 'giovanna.murazik@example.net', '2022-08-25 02:33:03', '2022-08-25 02:33:03');

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
(1, 1, 740, 981.00, 1181.00, 6, 5, 154, 0, 1, 1, 4, 1, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(2, 2, 83, 797.00, 997.00, 6, 44, 326, 1, 4, 3, 2, 1, '2022-08-25 02:33:05', '2022-08-25 02:33:05'),
(3, 4, 550, 19.00, 219.00, 3, 41, 86, 0, 4, 2, 4, 1, '2022-08-25 02:33:05', '2022-08-25 02:33:05'),
(4, 4, 959, 198.00, 398.00, 8, 45, 398, 0, 10, 7, 10, 1, '2022-08-25 02:33:05', '2022-08-25 02:33:05'),
(5, 7, 550, 327.00, 527.00, 10, 26, 120, 0, 4, 1, 2, 1, '2022-08-25 02:33:06', '2022-08-25 02:33:06'),
(6, 1, 338, 86.00, 286.00, 5, 22, 38, 1, 6, 6, 7, 1, '2022-08-25 02:33:06', '2022-08-25 02:33:06'),
(7, 3, 222, 680.00, 880.00, 8, 25, 410, 0, 9, 5, 9, 1, '2022-08-25 02:33:06', '2022-08-25 02:33:06'),
(8, 10, 378, 286.00, 486.00, 4, 31, 27, 1, 7, 3, 1, 1, '2022-08-25 02:33:07', '2022-08-25 02:33:07'),
(9, 6, 935, 905.00, 1105.00, 8, 17, 96, 1, 1, 9, 8, 1, '2022-08-25 02:33:07', '2022-08-25 02:33:07'),
(10, 2, 110, 644.00, 844.00, 10, 2, 259, 0, 8, 7, 5, 1, '2022-08-25 02:33:07', '2022-08-25 02:33:07');

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
(1, 'Color 53', 'Img of Color 53', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(2, 'Color 106', 'Img of Color 106', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(3, 'Color 56', 'Img of Color 56', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(4, 'Color 109', 'Img of Color 109', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(5, 'Color 50', 'Img of Color 50', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(6, 'Color 1', 'Img of Color 1', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(7, 'Color 33', 'Img of Color 33', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(8, 'Color 82', 'Img of Color 82', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(9, 'Color 14', 'Img of Color 14', '2022-08-25 02:32:58', '2022-08-25 02:32:58'),
(10, 'Color 55', 'Img of Color 55', '2022-08-25 02:32:58', '2022-08-25 02:32:58');

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
(1, 'Product Img 76', 5, '2022-08-25 02:33:08', '2022-08-25 02:33:08'),
(2, 'Product Img 123', 7, '2022-08-25 02:33:08', '2022-08-25 02:33:08'),
(3, 'Product Img 99', 9, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(4, 'Product Img 112', 3, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(5, 'Product Img 188', 3, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(6, 'Product Img 40', 4, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(7, 'Product Img 181', 9, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(8, 'Product Img 28', 5, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(9, 'Product Img 13', 10, '2022-08-25 02:33:09', '2022-08-25 02:33:09'),
(10, 'Product Img 166', 4, '2022-08-25 02:33:10', '2022-08-25 02:33:10');

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
(1, 'Product 49', 'Ut repellat quos tenetur. Ut magni et earum.', 'Eligendi similique ab assumenda deserunt. Delectus similique culpa magni iure rem eos sed.', 7, '2022-08-25 02:33:03', '2022-08-25 02:33:03'),
(2, 'Product 67', 'Rem omnis veniam et reiciendis ratione sit. Magni voluptates eligendi aut.', 'Ratione suscipit harum sit non. Deleniti sed officia quo consequatur quia perferendis et.', 6, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(3, 'Product 70', 'Quod aut fuga a a. Nemo dolorem molestiae ut quos sint assumenda ut.', 'Nihil sunt dolore aut. Eveniet cupiditate et eaque ex aperiam.', 6, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(4, 'Product 161', 'Sit et voluptas distinctio rerum inventore deserunt itaque. Odio possimus et possimus.', 'Voluptas vero rerum et. Dolor nobis et tempora voluptate magnam dolor aut consequatur.', 2, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(5, 'Product 152', 'Sint omnis et sint dolorem ipsum. Qui quaerat et cum nulla sequi natus.', 'Adipisci ut dolorem et numquam. Accusamus eligendi porro vel repudiandae eum fuga expedita.', 4, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(6, 'Product 72', 'Sunt architecto nobis est maxime delectus nam qui. Qui aut eos consequuntur alias aut.', 'Aut molestiae eum et enim debitis ut. Aut suscipit iure quibusdam quo eveniet nihil ut.', 2, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(7, 'Product 124', 'Architecto nesciunt officia tempora occaecati et ut aut. Ducimus nobis itaque eum explicabo.', 'Nostrum perspiciatis quaerat perspiciatis. Porro ipsum officiis dolores.', 5, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(8, 'Product 23', 'Perferendis excepturi consequatur ut ut tempore tempore. Nemo quo sed quos enim maiores.', 'Quae omnis possimus laboriosam. Sunt quas repudiandae assumenda nesciunt iusto doloremque.', 6, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(9, 'Product 145', 'Sit quia mollitia consectetur dolor. Consequuntur ab cum earum quos vel ut.', 'Perferendis distinctio aut cumque et. Vel aut qui quaerat cumque totam quia.', 5, '2022-08-25 02:33:04', '2022-08-25 02:33:04'),
(10, 'Product 43', 'Perspiciatis nihil voluptatem commodi. Ut odio mollitia alias delectus ut.', 'Mollitia expedita reiciendis sunt. Molestiae dolores suscipit ut voluptas.', 3, '2022-08-25 02:33:04', '2022-08-25 02:33:04');

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
(1, 'Autem rerum qui odio quae sed. Ut voluptatem doloribus laborum dignissimos earum.', 5, 'Card', 1, '0d4f0154f26bd2eb2906e593164956f4', 0, 0, 0, 0, NULL, '2022-08-25 02:32:59', '2022-08-25 02:32:59'),
(2, 'Aut facilis est doloremque explicabo et est repellendus. Molestiae repellat nobis velit ut.', 4, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-25 02:32:59', '2022-08-25 02:32:59'),
(3, 'Sint fugiat enim ut odio itaque et deserunt aut. Incidunt deleniti et iure perspiciatis.', 7, 'Card', 1, '9d6956d07d7f7ca60a3fb5e82a986832', 0, 0, 0, 0, NULL, '2022-08-25 02:32:59', '2022-08-25 02:32:59'),
(4, 'Accusamus quis quibusdam rerum modi. Eius voluptatem voluptatum fuga ad repellat quis ea.', 7, 'Card', 1, '3b5b9b190ec78228c37518567c3153ae', 0, 0, 0, 1, NULL, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(5, 'Voluptas sit animi et. Laborum similique quibusdam et et.', 2, 'Card', 1, '93682ffe130df78e468842b1b8f0dfbe', 1, 1, 1, 0, 1, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(6, 'Aspernatur ut nihil nemo temporibus. Pariatur nam assumenda modi laboriosam facilis consectetur.', 8, 'Card', 1, '5e978d315a381a15bf94b74dfb6fcde4', 0, 0, 0, 1, NULL, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(7, 'Incidunt aspernatur autem atque id. Quia id dolor voluptates sint. Magnam mollitia sit est.', 7, 'Card', 1, '94319087571b41a4d53d458d8d592755', 1, 1, 1, 0, 1, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(8, 'Suscipit asperiores quis quia. Tempora et consequatur amet a.', 5, 'Card', 1, '299900ac84538ddf54a3b8fe9531335a', 1, 1, 1, 0, 1, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(9, 'Dolorum voluptas illo in harum quaerat. Autem rerum fugit natus nihil quasi.', 7, 'Card', 1, '90c58be5b89a8f13741c16ec4505784e', 1, 1, 1, 0, 1, '2022-08-25 02:33:00', '2022-08-25 02:33:00'),
(10, 'Aut nihil maxime aut facere quo non. Voluptates nihil aut autem a. Quam quam id culpa ratione.', 10, 'Cash', 0, '', 1, 1, 1, 0, 1, '2022-08-25 02:33:00', '2022-08-25 02:33:00');

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
(1, 87, 0, 3, '2022-08-25 02:33:08', '2022-08-25 02:33:08');

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
(1, 'Size 46', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(2, 'Size 108', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(3, 'Size 9', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(4, 'Size 66', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(5, 'Size 174', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(6, 'Size 191', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(7, 'Size 170', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(8, 'Size 120', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(9, 'Size 162', '2022-08-25 02:32:57', '2022-08-25 02:32:57'),
(10, 'Size 192', '2022-08-25 02:32:57', '2022-08-25 02:32:57');

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
(1, 'Et quis ipsam autem illo error et at facilis. Qui illo est quo omnis quasi reprehenderit.', 5, 3, 7, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(2, 'Quis sint omnis est reiciendis quisquam. Porro impedit quasi quia magnam excepturi.', 1, 9, 10, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(3, 'Natus itaque quaerat qui dolorem aut voluptatem. Aliquid aliquid tempora totam.', 2, 8, 5, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(4, 'Quo error quo et culpa doloremque atque. Ut odio ducimus maiores et.', 5, 5, 8, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(5, 'Et quis aut perferendis saepe. Commodi incidunt illo explicabo soluta.', 1, 5, 6, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(6, 'Quo a est sequi qui. Ratione omnis nobis aut est explicabo deserunt. Et sed sed non eius tenetur.', 4, 3, 7, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(7, 'Dolorem nemo aspernatur modi. Aut tempore aliquam ab asperiores. Culpa sit eum ipsam.', 4, 5, 5, '2022-08-25 02:33:10', '2022-08-25 02:33:10'),
(8, 'Placeat rerum alias non velit omnis non sint et. Eveniet veritatis nemo molestiae aut.', 1, 3, 4, '2022-08-25 02:33:11', '2022-08-25 02:33:11'),
(9, 'Hic dolores suscipit earum. Et et ab sed voluptatem.', 2, 9, 10, '2022-08-25 02:33:11', '2022-08-25 02:33:11'),
(10, 'Distinctio et assumenda est eveniet voluptatem. Quia voluptatem autem inventore vitae.', 5, 4, 6, '2022-08-25 02:33:11', '2022-08-25 02:33:11');

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
(1, 81, '2022-08-25 02:32:54', '2022-08-25 02:32:54'),
(2, 169, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(3, 125, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(4, 37, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(5, 95, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(6, 144, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(7, 18, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(8, 179, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(9, 146, '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(10, 52, '2022-08-25 02:32:55', '2022-08-25 02:32:55');

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
(1, 60, 10, '2022-08-25 02:33:07', '2022-08-25 02:33:07');

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
(1, 'Unit 177', '2022-08-25 02:32:55', '2022-08-25 02:32:55'),
(2, 'Unit 74', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(3, 'Unit 85', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(4, 'Unit 58', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(5, 'Unit 187', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(6, 'Unit 115', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(7, 'Unit 133', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(8, 'Unit 168', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(9, 'Unit 83', '2022-08-25 02:32:56', '2022-08-25 02:32:56'),
(10, 'Unit 121', '2022-08-25 02:32:56', '2022-08-25 02:32:56');

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
(1, 'Dr. Jayme Fritsch', 'libby.quitzon@example.com', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S6Y91JVHli', '2022-08-25 02:32:52', '2022-08-25 02:32:52'),
(2, 'Jonatan Schuppe', 'akessler@example.org', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qmxGatqJtV', '2022-08-25 02:32:52', '2022-08-25 02:32:52'),
(3, 'Ned Schmitt', 'dwaelchi@example.net', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CBBaf5zdLW', '2022-08-25 02:32:52', '2022-08-25 02:32:52'),
(4, 'Jammie Hackett', 'beth.osinski@example.net', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8VAnXdifYY', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(5, 'Roslyn Ritchie Sr.', 'adolphus18@example.org', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NewC68Rkon', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(6, 'Julien McClure DDS', 'jberge@example.org', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4vKITnbPJy', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(7, 'Miss Leonie Kutch II', 'janae92@example.net', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L0MK2nu1Pv', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(8, 'Aidan Emmerich', 'heaney.madaline@example.org', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5vdkhXNGVu', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(9, 'Emerald Hilpert', 'joesph.stanton@example.com', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ie6OPWO0mh', '2022-08-25 02:32:53', '2022-08-25 02:32:53'),
(10, 'John Schumm', 'mina24@example.com', '2022-08-25 02:32:52', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Go1fGEtZPJ', '2022-08-25 02:32:53', '2022-08-25 02:32:53');

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
