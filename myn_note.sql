-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2024 pada 16.58
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myn_note`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(70, '2024_07_04_152332_update_note_table', 1),
(101, '2014_10_12_000000_create_users_table', 2),
(102, '2014_10_12_100000_create_password_resets_table', 2),
(103, '2019_08_19_000000_create_failed_jobs_table', 2),
(104, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(105, '2024_07_01_075244_create_note_table', 2),
(106, '2024_07_04_162726_update_token_access', 3),
(107, '2024_07_05_060409_update_note_table', 4),
(108, '2024_07_05_102216_add_soft_delete_to_note_table', 5),
(109, '2024_07_05_102400_add_soft_delete_to_users_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `note`
--

CREATE TABLE `note` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_masuk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_keluar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_dipakai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_selesai_dipakai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` int(11) NOT NULL,
  `jenis` enum('pemasukan','pengeluaran') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `note`
--

INSERT INTO `note` (`id`, `id_user`, `nama`, `tanggal_masuk`, `tanggal_keluar`, `tanggal_dipakai`, `tanggal_selesai_dipakai`, `nominal`, `jenis`, `deskripsi`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'Gaji', '03-07-2024', NULL, NULL, NULL, 3000000, 'pemasukan', 'gaji bulan ini', '2024-07-04 23:06:17', '2024-07-05 00:45:04', NULL),
(2, 'a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'check', '02-10-2024', NULL, NULL, NULL, 10000000, 'pemasukan', 'gaji untuk bulan ini', '2024-07-05 03:34:55', '2024-07-05 03:36:08', '2024-07-05 03:36:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 'a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'auth_token', '0f460753440fce5631454fce5b6261f472aa32904e2f8f26ba36e0f719add02d', '[\"*\"]', NULL, '2024-07-04 09:32:16', '2024-07-04 09:32:16'),
(2, 'App\\Models\\User', 'a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'auth_token', 'd0769322aa1afbc44f14568abc871e9c1d1eb3f4367d3750f7162ba9aeb8b639', '[\"*\"]', NULL, '2024-07-04 09:32:28', '2024-07-04 09:32:28'),
(3, 'App\\Models\\User', 'a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'auth_token', 'dedd9a16b231387cd71163739086ddb310834f82bbc3610cecfdc074145748e4', '[\"*\"]', '2024-07-10 02:11:54', '2024-07-04 18:28:04', '2024-07-10 02:11:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('a5bc3b38-58fe-405a-91b2-c5ce338b9a58', 'myname', 'myname@gmail.com', NULL, '$2y$10$xtYjDiZvYfh6w4xXugqDv.ahX2u0hm7W0FlzTXD6UkP6xzPmtj2ES', NULL, '2024-07-04 09:31:29', '2024-07-04 09:31:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `note`
--
ALTER TABLE `note`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
