-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Cze 2021, 17:23
-- Wersja serwera: 10.4.18-MariaDB
-- Wersja PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projectaccident3`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accidents`
--

CREATE TABLE `accidents` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `works` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_data_and_time` datetime DEFAULT NULL,
  `finish_data_and_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `accidents`
--

INSERT INTO `accidents` (`id`, `type`, `status`, `machine_id`, `event`, `works`, `start_data_and_time`, `finish_data_and_time`, `created_at`, `updated_at`) VALUES
(1, 'defect', 'waiting for parts', 1, 'Nie działa Panel HMI', 'Wymiana panelu', '2021-05-24 20:45:00', '2021-05-24 21:00:00', '2021-05-24 18:45:07', '2021-06-27 15:42:41'),
(2, 'accident', 'waiting for parts', 2, 'Brak zasilania', NULL, '2021-05-25 19:42:00', NULL, '2021-05-25 17:42:12', '2021-06-22 16:45:58'),
(3, 'accident', 'registration', 2, 'Skrzywiona belka główna', NULL, '2021-06-27 15:41:00', NULL, '2021-06-27 13:41:14', '2021-06-27 13:41:14'),
(4, 'defect', 'registration', 1, 'Komora próżniowa nie odzyskuje SF6', NULL, '2021-06-27 17:41:00', NULL, '2021-06-27 15:41:50', '2021-06-27 15:41:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accident_image`
--

CREATE TABLE `accident_image` (
  `accident_id` int(10) UNSIGNED NOT NULL,
  `image_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accident_part`
--

CREATE TABLE `accident_part` (
  `part_id` int(10) UNSIGNED NOT NULL,
  `accident_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `accident_part`
--

INSERT INTO `accident_part` (`part_id`, `accident_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-24 18:46:31', '2021-05-24 18:46:31'),
(4, 2, '2021-06-27 08:42:52', '2021-06-27 08:42:52'),
(2, 2, '2021-06-27 08:42:52', '2021-06-27 08:42:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contractors`
--

CREATE TABLE `contractors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personContact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `contractors`
--

INSERT INTO `contractors` (`id`, `name`, `nip`, `regon`, `adress`, `personContact`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ISKRA Zakład Maszyn i Łożysk Specjalnych Sp. z o.o.', '6570232302', '290040888', 'ul. Mielczarskiego 43, 25-709 Kielce', 'Jan Kowalski tel.: 607556890 (Handel)', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 'Amada Sp. z o.o.', '6751491800', '122957367', 'Cholerzyn 467 32-060 Liszki', 'jan.kowalski@gmail.com Jan Kowalski tel.: 607556890 (Handel)', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 'APVACUUM Sp. z o.o.', '7773161855', '301439770', 'ul. Klonowa 24 62-002 Suchy Las k. Poznania', 't: +48 61 656 35 30 e: biuro@apvacuum.com', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(4, 'RGB Elektronika Centrum Automatyki Przemysłowej', '8951985034', '021407892', 'ul. Jana Długosza 2-6 51-162 Wrocław', '24/7: +48 71 325 15 05 kontakt@rgbelektronika.pl', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contractor_machine`
--

CREATE TABLE `contractor_machine` (
  `machine_id` int(10) UNSIGNED NOT NULL,
  `contractor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contractor_part`
--

CREATE TABLE `contractor_part` (
  `part_id` int(10) UNSIGNED NOT NULL,
  `contractor_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `contractor_part`
--

INSERT INTO `contractor_part` (`part_id`, `contractor_id`, `created_at`, `updated_at`) VALUES
(4, 2, '2021-05-27 18:29:17', '2021-05-27 18:29:17');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'W1 - Wydział Konstrukcji Stalowych', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 'W2 - Wydział Maszyn', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 'W3 - Wydział Elektryczny', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(4, 'W4 - Wydział Betoniarni', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(5, 'W5 - Wydział Wysokiego Napięcia', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(6, 'W6 - Wydział Rozłączników', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(7, 'W7 - Wydział Montażu Stacji', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(8, 'W8 - Wydział Żywic', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(9, 'W9 - Wydział Słupów Wirowanych', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(10, 'W10 - Wydział Obróbki Machanicznej', '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `images`
--

INSERT INTO `images` (`id`, `title`, `description`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Wymiana panelu', 'Test Test', 'images/LlaXAshS28bpZbXMVhqmOdYXpiacDJ6GFndnGxex.jpg', 1, '2021-05-25 16:32:53', '2021-05-25 16:32:53'),
(5, 'Marmolada', 'test aaa', 'images/W3V57WVLA5aNSI84uAC3m5ZXY3mHGCewzfrf2GxF.bmp', 1, '2021-05-25 17:46:19', '2021-05-25 17:46:19'),
(7, 'Test - BBB', 'BBB', 'images/cga0jt0hJ8kEsxXBHYUcxMLYRBm1SSAYLareGlAj.bmp', 1, '2021-05-26 09:34:24', '2021-05-26 09:34:24'),
(10, 'Wymiana panelu', 'Test - CCC', 'images/G1d3DwOoEQYAO8YfuPWnqwUmUvH2YmUuQ6ZrEcvW.jpg', 1, '2021-05-27 11:32:52', '2021-05-27 11:32:52'),
(20, 'test  zapisu', 'test', 'images/SlCz1dRM3UT0CKVASwXQsobe0OsJEk77WWlDTiD6.jpg', 1, '2021-06-05 17:54:10', '2021-06-05 17:54:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image_review`
--

CREATE TABLE `image_review` (
  `image_id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `image_review`
--

INSERT INTO `image_review` (`image_id`, `review_id`, `created_at`, `updated_at`) VALUES
(4, 2, '2021-05-25 16:38:51', '2021-05-25 16:38:51'),
(20, 4, '2021-06-05 17:54:37', '2021-06-05 17:54:37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `accident_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `check` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `logs`
--

INSERT INTO `logs` (`id`, `review_id`, `accident_id`, `user_id`, `check`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'create', '2021-05-24 18:45:07', '2021-05-24 18:45:07'),
(2, NULL, 1, 1, 'status/works/finish_data_and_time/', '2021-05-24 18:46:31', '2021-05-24 18:46:31'),
(3, NULL, 1, 1, 'empty', '2021-05-25 07:48:55', '2021-05-25 07:48:55'),
(4, 1, NULL, 1, 'create', '2021-05-25 11:19:36', '2021-05-25 11:19:36'),
(5, 2, NULL, 1, 'create', '2021-05-25 11:20:53', '2021-05-25 11:20:53'),
(6, 1, NULL, 1, 'empty', '2021-05-25 11:52:48', '2021-05-25 11:52:48'),
(7, 2, NULL, 1, 'empty', '2021-05-25 16:38:51', '2021-05-25 16:38:51'),
(8, NULL, 2, 1, 'create', '2021-05-25 17:42:12', '2021-05-25 17:42:12'),
(9, 3, NULL, 1, 'create', '2021-05-26 08:45:31', '2021-05-26 08:45:31'),
(10, 3, NULL, 1, 'empty', '2021-05-26 08:46:26', '2021-05-26 08:46:26'),
(11, 4, NULL, 1, 'create', '2021-05-26 18:07:11', '2021-05-26 18:07:11'),
(12, 4, NULL, 1, 'empty', '2021-05-26 18:13:39', '2021-05-26 18:13:39'),
(13, 4, NULL, 1, 'empty', '2021-05-27 18:25:38', '2021-05-27 18:25:38'),
(14, 5, NULL, 1, 'create', '2021-05-27 18:26:30', '2021-05-27 18:26:30'),
(15, 4, NULL, 1, 'realization/finish_data_and_time/', '2021-05-27 18:26:30', '2021-05-27 18:26:30'),
(16, 4, NULL, 1, 'empty', '2021-06-03 18:12:55', '2021-06-03 18:12:55'),
(17, 4, NULL, 1, 'empty', '2021-06-03 18:44:37', '2021-06-03 18:44:37'),
(18, 4, NULL, 1, 'empty', '2021-06-03 18:52:31', '2021-06-03 18:52:31'),
(19, 4, NULL, 1, 'empty', '2021-06-03 18:55:58', '2021-06-03 18:55:58'),
(20, 4, NULL, 1, 'empty', '2021-06-03 18:57:12', '2021-06-03 18:57:12'),
(21, 4, NULL, 1, 'empty', '2021-06-03 18:59:06', '2021-06-03 18:59:06'),
(22, 4, NULL, 1, 'empty', '2021-06-03 19:00:56', '2021-06-03 19:00:56'),
(23, 4, NULL, 1, 'empty', '2021-06-03 19:02:27', '2021-06-03 19:02:27'),
(24, 4, NULL, 1, 'empty', '2021-06-05 17:54:37', '2021-06-05 17:54:37'),
(25, NULL, 2, 1, 'status/', '2021-06-22 16:45:58', '2021-06-22 16:45:58'),
(26, NULL, 1, 1, 'type/', '2021-06-22 17:16:52', '2021-06-22 17:16:52'),
(27, 6, NULL, 1, 'create', '2021-06-23 19:07:34', '2021-06-23 19:07:34'),
(28, 1, NULL, 1, 'realization/planning_data_and_time/finish_data_and_time/', '2021-06-23 19:07:34', '2021-06-23 19:07:34'),
(29, NULL, 2, 1, 'empty', '2021-06-27 08:42:52', '2021-06-27 08:42:52'),
(30, NULL, 3, 1, 'create', '2021-06-27 13:41:14', '2021-06-27 13:41:14'),
(31, NULL, 1, 1, 'status/', '2021-06-27 15:40:37', '2021-06-27 15:40:37'),
(32, NULL, 4, 1, 'create', '2021-06-27 15:41:50', '2021-06-27 15:41:50'),
(33, NULL, 1, 1, 'status/', '2021-06-27 15:42:41', '2021-06-27 15:42:41');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `machines`
--

CREATE TABLE `machines` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `udt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `machines`
--

INSERT INTO `machines` (`id`, `department_id`, `number`, `name`, `type`, `serial`, `udt`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, 'M-00001', 'Komora próżniowa Telstar do badania rozłączników', 'B-63797559', '', '', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 2, 'M-00002', 'Prasa hydrauliczna krawędziowa Amada HFE 3i', 'HFE 3i 8025 8 axes', 'I100737', '', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `machine_part`
--

CREATE TABLE `machine_part` (
  `part_id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_15_125632_create_departments_table', 1),
(5, '2020_07_16_080826_create_machines_table', 1),
(6, '2020_07_16_080827_create_accidents_table', 1),
(7, '2020_08_26_115724_create_admins_table', 1),
(8, '2020_09_29_181712_create_roles_table', 1),
(9, '2020_09_30_174541_create_role_has_users_table', 1),
(10, '2020_11_01_103941_create_contractors_table', 1),
(11, '2020_11_01_104024_create_parts_table', 1),
(12, '2020_11_27_133909_create_contractor_part_table', 1),
(13, '2020_11_27_142748_create_accident_part_table', 1),
(14, '2020_11_27_145923_create_machine_part_table', 1),
(15, '2020_11_29_164102_create_contractor_machine_table', 1),
(16, '2020_12_19_165737_create_reviews_table', 1),
(17, '2020_12_19_185205_create_part_review_table', 1),
(18, '2021_02_13_200141_create_images_table', 1),
(19, '2021_02_17_092749_create_image_review_table', 1),
(20, '2021_02_21_131539_create_accident_image_table', 1),
(21, '2021_03_06_123107_create_logs_table', 1),
(22, '2021_05_04_124412_create_prices_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `parts`
--

CREATE TABLE `parts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ktm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `parts`
--

INSERT INTO `parts` (`id`, `ktm`, `name`, `type`, `number`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'MBA-23-456-234', 'Panel HMI 640 x 480 pixels 10.4', 'HMIGTO5310', NULL, 'Główny Panel Telstar - strategiczny', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 'MBA-23-456-200', 'Łożysko kulkowe zwykłe (bez uszczelnienia)', NULL, '16005', 'Wymiary główne: d=25mm, D=47mm, B=8mm, rs=min0.3mm', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 'MBA-23-456-100', 'Łożyska kulkowe wahliwe', '126 TW RHP', '74702304346', 'Wymiary główne: d=6mm, D=19mm, B=6mm', 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(4, 'MBA-20-458-100', 'Detektor Adixen ASI 30', NULL, NULL, NULL, 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `part_review`
--

CREATE TABLE `part_review` (
  `part_id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `part_review`
--

INSERT INTO `part_review` (`part_id`, `review_id`, `created_at`, `updated_at`) VALUES
(4, 4, '2021-05-27 18:25:38', '2021-05-27 18:25:38'),
(1, 4, '2021-05-27 18:25:38', '2021-05-27 18:25:38');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `prices`
--

CREATE TABLE `prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `accidentsId` int(10) UNSIGNED DEFAULT NULL,
  `reviewsId` int(10) UNSIGNED DEFAULT NULL,
  `partsId` int(10) UNSIGNED NOT NULL,
  `quantity` double(7,2) NOT NULL,
  `value` double(9,2) NOT NULL,
  `sum` double(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `prices`
--

INSERT INTO `prices` (`id`, `accidentsId`, `reviewsId`, `partsId`, `quantity`, `value`, `sum`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1.00, 7400.00, 7400.00, '2021-05-24 18:46:31', '2021-05-24 18:46:31'),
(2, NULL, 4, 4, 1.00, 235.00, 235.00, '2021-05-27 18:25:38', '2021-05-27 18:25:38'),
(3, NULL, 4, 1, 1.00, 1340.00, 1340.00, '2021-05-27 18:25:38', '2021-05-27 18:25:38'),
(4, 2, NULL, 4, 1.00, 1000.00, 1000.00, '2021-06-27 08:42:52', '2021-06-27 08:42:52'),
(5, 2, NULL, 2, 2.00, 30.00, 60.00, '2021-06-27 08:42:52', '2021-06-27 08:42:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `works` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realization` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodicity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planning_data_and_time` datetime NOT NULL,
  `finish_data_and_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `reviews`
--

INSERT INTO `reviews` (`id`, `machine_id`, `action`, `works`, `comments`, `realization`, `periodicity`, `planning_data_and_time`, `finish_data_and_time`, `created_at`, `updated_at`) VALUES
(1, 2, 'Kontrola prowadnika przewodów', '1. Kontrola prowadnika przewodów', NULL, 'finished', 'month', '2021-05-25 13:18:00', '2021-06-24 21:06:00', '2021-05-25 11:19:36', '2021-06-23 19:07:34'),
(2, 1, 'Kalibracja detektora cząstek helu', 'Kalibracja detektora cząstek helu', NULL, 'planning', 'one year', '2021-04-22 20:10:00', NULL, '2021-05-25 11:20:53', '2021-05-25 11:20:53'),
(3, 1, 'Sprawdzenie stanu łożysk', 'Sprawdzenie stanu łożysk', NULL, 'planning', 'two weeks', '2021-05-26 11:10:00', NULL, '2021-05-26 08:45:30', '2021-05-26 08:45:30'),
(4, 2, 'Wymiana stępla', '1. Wymiana stępla\r\n2. Wymiana czegoś tam', NULL, 'finished', 'month', '2021-05-26 20:50:00', '2021-05-27 20:30:00', '2021-05-26 18:07:11', '2021-05-27 18:26:30'),
(5, 2, 'Wymiana stępla', '1. Wymiana stępla\r\n2. Wymiana czegoś tam', NULL, 'planning', 'month', '2021-06-27 20:30:00', NULL, '2021-05-27 18:26:30', '2021-05-27 18:26:30'),
(6, 2, 'Kontrola prowadnika przewodów', '1. Kontrola prowadnika przewodów', NULL, 'planning', 'month', '2021-07-24 21:06:00', NULL, '2021-06-23 19:07:34', '2021-06-23 19:07:34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 'Moderator', '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 'User', '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role_has_users`
--

CREATE TABLE `role_has_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `role_has_users`
--

INSERT INTO `role_has_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 2, 2, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 3, 3, '2021-05-24 18:43:10', '2021-05-24 18:43:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Grzegorz', 'grzegorz@gmail.com', NULL, '$2y$10$kwaYkxCClGD8y7kZ2h7Qg.WwY/0D4f/Xh/ugfvfS8ywy7Y5gxLz0O', NULL, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(2, 'Marcin', 'marcin@gmail.com', NULL, '$2y$10$8m8cfoUOrC1YFoUiLVq0CefwGlk77D46WdG9JdLNqnN6hEXUmP3/6', NULL, '2021-05-24 18:43:10', '2021-05-24 18:43:10'),
(3, 'Tomasz', 'tomasz@gmail.com', NULL, '$2y$10$0EQv8cBCRksoti/yeY1LHO63zusuipApEHCqbRj8YccE.NIxkAA/i', NULL, '2021-05-24 18:43:10', '2021-05-24 18:43:10');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `accidents`
--
ALTER TABLE `accidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accidents_machine_id_foreign` (`machine_id`);

--
-- Indeksy dla tabeli `accident_image`
--
ALTER TABLE `accident_image`
  ADD KEY `accident_image_accident_id_foreign` (`accident_id`),
  ADD KEY `accident_image_image_id_foreign` (`image_id`);

--
-- Indeksy dla tabeli `accident_part`
--
ALTER TABLE `accident_part`
  ADD KEY `accident_part_part_id_foreign` (`part_id`),
  ADD KEY `accident_part_accident_id_foreign` (`accident_id`);

--
-- Indeksy dla tabeli `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeksy dla tabeli `contractors`
--
ALTER TABLE `contractors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contractors_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `contractor_machine`
--
ALTER TABLE `contractor_machine`
  ADD KEY `contractor_machine_machine_id_foreign` (`machine_id`),
  ADD KEY `contractor_machine_contractor_id_foreign` (`contractor_id`);

--
-- Indeksy dla tabeli `contractor_part`
--
ALTER TABLE `contractor_part`
  ADD KEY `contractor_part_part_id_foreign` (`part_id`),
  ADD KEY `contractor_part_contractor_id_foreign` (`contractor_id`);

--
-- Indeksy dla tabeli `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `image_review`
--
ALTER TABLE `image_review`
  ADD KEY `image_review_image_id_foreign` (`image_id`),
  ADD KEY `image_review_review_id_foreign` (`review_id`);

--
-- Indeksy dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machines_department_id_foreign` (`department_id`),
  ADD KEY `machines_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `machine_part`
--
ALTER TABLE `machine_part`
  ADD KEY `machine_part_part_id_foreign` (`part_id`),
  ADD KEY `machine_part_machine_id_foreign` (`machine_id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_user_id_foreign` (`user_id`);

--
-- Indeksy dla tabeli `part_review`
--
ALTER TABLE `part_review`
  ADD KEY `part_review_part_id_foreign` (`part_id`),
  ADD KEY `part_review_review_id_foreign` (`review_id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_machine_id_foreign` (`machine_id`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `role_has_users`
--
ALTER TABLE `role_has_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_has_users_user_id_foreign` (`user_id`),
  ADD KEY `role_has_users_role_id_foreign` (`role_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `accidents`
--
ALTER TABLE `accidents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT dla tabeli `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `role_has_users`
--
ALTER TABLE `role_has_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `accidents`
--
ALTER TABLE `accidents`
  ADD CONSTRAINT `accidents_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`);

--
-- Ograniczenia dla tabeli `accident_image`
--
ALTER TABLE `accident_image`
  ADD CONSTRAINT `accident_image_accident_id_foreign` FOREIGN KEY (`accident_id`) REFERENCES `accidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accident_image_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `accident_part`
--
ALTER TABLE `accident_part`
  ADD CONSTRAINT `accident_part_accident_id_foreign` FOREIGN KEY (`accident_id`) REFERENCES `accidents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accident_part_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `contractors`
--
ALTER TABLE `contractors`
  ADD CONSTRAINT `contractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `contractor_machine`
--
ALTER TABLE `contractor_machine`
  ADD CONSTRAINT `contractor_machine_contractor_id_foreign` FOREIGN KEY (`contractor_id`) REFERENCES `contractors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contractor_machine_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `contractor_part`
--
ALTER TABLE `contractor_part`
  ADD CONSTRAINT `contractor_part_contractor_id_foreign` FOREIGN KEY (`contractor_id`) REFERENCES `contractors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contractor_part_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `image_review`
--
ALTER TABLE `image_review`
  ADD CONSTRAINT `image_review_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `image_review_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `machines_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `machines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `machine_part`
--
ALTER TABLE `machine_part`
  ADD CONSTRAINT `machine_part_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `machine_part_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `part_review`
--
ALTER TABLE `part_review`
  ADD CONSTRAINT `part_review_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `part_review_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `role_has_users`
--
ALTER TABLE `role_has_users`
  ADD CONSTRAINT `role_has_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_has_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
