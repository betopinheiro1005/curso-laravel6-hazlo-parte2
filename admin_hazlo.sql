-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 16, 2020 at 09:52 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_hazlo`
--

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2020_08_10_034650_create_roles_tables', 1),
(5, '2020_08_10_221849_add_image_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notas`
--

INSERT INTO `notas` (`id`, `user_id`, `titulo`, `texto`, `created_at`, `updated_at`) VALUES
(1, 2, 'Nota 1', 'Este é o texto da nota 1.', '2020-08-10 07:13:39', '2020-08-10 07:13:39'),
(2, 3, 'Nota 2', 'Esta é uma nota criada manualmente.', '2020-08-10 07:14:50', '2020-08-10 07:14:50'),
(3, 2, 'Nota 3', 'Esta é a nota mais legal de todas.', '2020-08-10 07:16:00', '2020-08-10 07:16:00'),
(4, 1, 'Nota 4 atualizada', 'Esta é uma nota criada a partir de um formulário editada a partir de um textarea.', '2020-08-10 10:22:30', '2020-08-10 10:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'administrador', NULL, '2020-08-10 10:35:05', '2020-08-10 10:35:05'),
(2, 'moderador', NULL, '2020-08-10 10:43:50', '2020-08-10 10:43:50'),
(3, 'leitor', NULL, '2020-08-10 18:18:58', '2020-08-10 18:18:58'),
(4, 'público', NULL, '2020-08-10 18:21:17', '2020-08-10 18:21:17'),
(5, 'convidado', NULL, '2020-08-10 21:40:25', '2020-08-10 21:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-08-11 02:41:11', '2020-08-11 02:41:11'),
(15, 1, '2020-08-11 06:29:29', '2020-08-11 23:54:25'),
(16, 5, '2020-08-11 06:31:20', '2020-08-11 06:31:20'),
(17, 2, '2020-08-11 06:33:29', '2020-08-11 06:33:29'),
(18, 2, '2020-08-12 05:26:53', '2020-08-12 06:08:45'),
(20, 1, '2020-08-12 07:17:26', '2020-08-12 07:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Roberto Pinheiro', 'betopinheiro1005@yahoo.com.br', '2020-08-11 06:22:31', NULL, '$2y$10$sby7S8saWbdXru5EAJ0L.O3uRDJUiE0qPZNhGrImMYetfcoXNqy4S', NULL, '2020-08-11 06:22:31', '2020-08-11 06:22:31'),
(2, 'Randal Bode', 'barry27@example.org', '2020-08-11 06:22:32', NULL, '$2y$10$wRaTUEJzfJXeb.TBpHWlVuPbztSAaWxC0qQljXKhrz0uGrrfpGIgC', 'Qgd2csXq7h', '2020-08-11 06:22:33', '2020-08-11 06:22:33'),
(3, 'Michael Schiller', 'samanta37@example.net', '2020-08-11 06:22:32', NULL, '$2y$10$5uq3yH22C7bVOYQRBZStEeGa1IEQVdcwPjdqfKzMMhnoEhS3kUOtK', 'L4RyH8bFvz', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(4, 'Mina Stanton', 'runolfsson.jodie@example.org', '2020-08-11 06:22:32', NULL, '$2y$10$xkGR4LmW5zKAW39spCMI3OjTe6MwehWvnmg1BPJucgXlTWyDbGWSS', '7tHhxM9vPD', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(5, 'Jabari Kub', 'pluettgen@example.org', '2020-08-11 06:22:32', NULL, '$2y$10$0YIc0tToxZyyT/dXSvkmKukI/iXCu7xq1XYoFSLeuOhnpoa9fUDiS', 'yncnoPeu7z', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(6, 'Dr. Pamela Jakubowski III', 'torp.simeon@example.com', '2020-08-11 06:22:32', NULL, '$2y$10$TidptUFdMvRkD1ECYocS5OkyhK5I0RkylcFOvh7S6Jb4KjQCPKczC', '2C1oAFIaor', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(7, 'Angelica Berge', 'kurtis.jacobs@example.net', '2020-08-11 06:22:32', NULL, '$2y$10$mapfip8Ch/A3zl6Bp9UoH.kR0jXFC/b4qEE877bTcL3oQ3bmGyJAC', 'JkewHGWI6z', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(8, 'Golda Hoeger', 'cali.hand@example.com', '2020-08-11 06:22:32', NULL, '$2y$10$Ymfg2o.ugfQKjw1BQFGGPu8FMO8bWS5mYMUGmHULNcNLx1KblWN0e', 'RJkgBwNRm1', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(9, 'Bridie Adams', 'akerluke@example.org', '2020-08-11 06:22:33', NULL, '$2y$10$3dLqP.k/fbkrNA3yB8BMJel0sMwQ9m.ArQlzUjXFn/ac4SSEOvZhm', 'ljYim70WWJ', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(10, 'Mr. Jeromy Crooks', 'shyanne.monahan@example.net', '2020-08-11 06:22:33', NULL, '$2y$10$Xcc7WgTAUldxzqWBW9vwvuy4hmEZlorRfeHd.lIdO0OMWWL1iRQVS', 'OtwifXJOcw', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(11, 'Dejon Dooley', 'brisa.cummerata@example.net', '2020-08-11 06:22:33', NULL, '$2y$10$lD/P3Otjn0oay0HOz5RlZuPS/IsXoaSJt6eVnqb/25efZoo4Vg75G', 'wSXQ91FdFy', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(12, 'Lula Hoeger', 'yvolkman@example.net', '2020-08-11 06:22:33', NULL, '$2y$10$ntYxToOMfFEsrt2avL1X1ecUAqEtb/XsQa3uKclfe2ct1wran.pWO', 'FT9t67WEbf', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(13, 'Mr. Fritz Reichert', 'murphy.zelda@example.net', '2020-08-11 06:22:33', NULL, '$2y$10$YZS199SFTO0hfN3IF5viKeGo4DJm1EvLetlOmC8CO2v.wnW.IP5F6', '2yJFAS7Yfp', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(14, 'Harmon Reynolds', 'hills.lambert@example.net', '2020-08-11 06:22:33', NULL, '$2y$10$DHxoLUmcnTjGtXMw5Z0fb.eoF7zuopw9Ifnh7HUU/WmTv4Lts6JNa', 'SZ2CkRTcsk', '2020-08-11 06:22:34', '2020-08-11 06:22:34'),
(15, 'Andres Lopez', 'andres_lopez@gmail.com', NULL, 'avatar2.png', '$2y$10$N3yY8AQu7.rK5lQ4Tp1hReWB/IzIsPy8ENIfaNJZzRLVVuvbNEmlq', NULL, '2020-08-11 06:29:29', '2020-08-11 23:54:25'),
(16, 'Marcos Invitado', 'marcos@gmail.com', NULL, NULL, '$2y$10$mr8N.aNhOs5vmRhQNffjBeleSIBHNth/tQcOFrHzLsk5nF65K730W', NULL, '2020-08-11 06:31:20', '2020-08-11 06:31:20'),
(17, 'Eduardo', 'eduardo@gmail.com', NULL, 'avatar1.png', '$2y$10$c/OOmduleTL9ar3Otp42hOIgQl7MueSRIEYB9jKwKmIsT/WC5beZi', NULL, '2020-08-11 06:33:28', '2020-08-11 06:33:28'),
(18, 'Carlos Mendez', 'carlos_mendez@gmail.com', NULL, 'avatar3.png', '$2y$10$zp7SJ.jk756BHRGFQL7ZzebvOhUCGNrSzP6.WgtrynOqigF9IK5Ji', NULL, '2020-08-12 05:26:53', '2020-08-12 06:03:12'),
(20, 'Roberto Pinheiro', 'beto10561@gmail.com', '2020-08-12 07:33:18', NULL, '$2y$10$dbxTwixfdcZEqsboHVmaweEUz9iHFruO.Lg.yaQkrMp7l2Kh3UD3.', NULL, '2020-08-12 07:17:26', '2020-08-12 07:33:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
