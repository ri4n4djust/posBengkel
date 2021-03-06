-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2021 pada 08.30
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkeldb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel', '2021-06-21 01:29:31', '2021-06-21 01:29:31'),
(2, 1, 'Vue js', '2021-06-21 01:29:46', '2021-06-21 01:29:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_01_02_012505_create_barangs_table', 1),
(4, '2021_01_02_025846_create_suppliers_table', 1),
(5, '2021_01_02_233418_create_kategoris_table', 1),
(6, '2021_01_03_000733_satuan', 1),
(10, '2021_02_05_061214_create_transaksis_table', 1),
(11, '2021_02_08_162955_create_penjualans_table', 1),
(12, '2021_02_12_082257_pembelian', 1),
(13, '2021_02_12_113120_pembelian_detail', 1),
(14, '2021_02_21_073842_kartustok', 1),
(15, '2021_02_27_174740_users', 1),
(16, '2021_03_02_091025_stokopname', 1),
(17, '2021_03_02_174311_create_stok_opname_details_table', 1),
(18, '2021_03_04_115835_tmp_penjualan_detail', 1),
(19, '2021_03_19_215018_create_inventoris_table', 1),
(20, '2021_03_22_114649_create_kartu_stok_inventoris_table', 1),
(21, '2021_04_05_155901_create_pelanggans_table', 2),
(22, '2021_04_05_172059_penjualan_detail', 3),
(23, '2021_05_07_164227_create_motors_table', 4),
(24, '2021_05_07_163415_create_mekaniks_table', 5),
(25, '2021_04_13_201357_create_grand_juals_table', 6),
(26, '2021_04_13_201603_grand_jual_detail', 7),
(27, '2021_05_07_164505_create_lifts_table', 8),
(28, '2021_05_12_074653_create_jasas_table', 9),
(29, '2021_05_12_075122_create_jasajuals_table', 10),
(30, '2021_05_24_154550_create_grand_belis_table', 11),
(31, '2021_05_24_154817_create_grand_beli_details_table', 12),
(32, '2021_06_15_162330_create_setups_table', 13),
(33, '2021_06_21_063331_create_categories_table', 14),
(34, '2021_06_21_101058_tbl_merek_motor', 15),
(35, '2021_06_21_101239_tbl_jenis_motor', 16),
(36, '2021_06_21_101448_tbl_type_motor', 17),
(37, '2021_06_21_101643_tbl_tahun_motor', 18),
(38, '2021_06_21_101956_tbl_kat_sp_motor', 19),
(39, '2021_06_21_161344_tbl_detail_part_motor', 20),
(40, '2021_06_25_112012_create_detail_catalogs_table', 21);

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
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id_prov` char(2) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id_prov`, `nama`) VALUES
('11', 'Aceh'),
('12', 'Sumatera Utara'),
('13', 'Sumatera Barat'),
('14', 'Riau'),
('15', 'Jambi'),
('16', 'Sumatera Selatan'),
('17', 'Bengkulu'),
('18', 'Lampung'),
('19', 'Kepulauan Bangka Belitung'),
('21', 'Kepulauan Riau'),
('31', 'DKI Jakarta'),
('32', 'Jawa Barat'),
('33', 'Jawa Tengah'),
('34', 'DI Yogyakarta'),
('35', 'Jawa Timur'),
('36', 'Banten'),
('51', 'Bali'),
('52', 'Nusa Tenggara Barat'),
('53', 'Nusa Tenggara Timur'),
('61', 'Kalimantan Barat'),
('62', 'Kalimantan Tengah'),
('63', 'Kalimantan Selatan'),
('64', 'Kalimantan Timur'),
('65', 'Kalimantan Utara'),
('71', 'Sulawesi Utara'),
('72', 'Sulawesi Tengah'),
('73', 'Sulawesi Selatan'),
('74', 'Sulawesi Tenggara'),
('75', 'Gorontalo'),
('76', 'Sulawesi Barat'),
('81', 'Maluku'),
('82', 'Maluku Utara'),
('91', 'Papua Barat'),
('92', 'Papua');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbarang`
--

CREATE TABLE `tblbarang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merek` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stkBarang` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stkSatuan` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qtyMin` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMax` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `barcode`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `merek`, `stkBarang`, `stkSatuan`, `qtyMin`, `qtyMax`, `deskripsi`, `created_at`, `updated_at`, `satuanBarang`) VALUES
(1, 'DB-2021-1', '123456', 'Kampas Kopling', 5, 300000, 'KT-2021-1', 'NGK', '11', NULL, '2', '20', 'jjjhuh', '2021-03-26 11:23:36', '2021-06-16 06:59:56', 'Box'),
(2, 'DB-2021-2', '123', 'Busi', 9000, 15000, 'KT-2021-1', 'NGK', '26', NULL, '2', '4', 'Busi Ngk', '2021-04-06 10:42:47', '2021-05-09 12:29:48', 'PCS'),
(3, 'DB-2021-3', '1234568766', 'Rantai Standart Supra X 100CC', 90000, 160000, 'KT-2021-1', 'Aspira', '23', NULL, '2', '100', 'Rantai Standart', '2021-04-15 05:26:03', '2021-04-15 05:26:03', 'PCS'),
(5, 'DB-2021-4', '0987654321', 'Kampas Rem Vario 110', 50000, 60000, 'KT-2021-1', 'Aspira', '6', NULL, '2', '100', 'Kampas Rem Maut', '2021-04-15 05:29:06', '2021-04-15 05:29:06', 'PCS'),
(6, 'DB-2021-5', '234', 'Speedo Meter Vario', 50000, 60000, 'KT-2021-1', 'Aspira', '36', NULL, '2', '100', 'Kampas Rem Maut', '2021-04-15 05:29:50', '2021-04-15 05:34:34', 'PCS'),
(7, 'DB-2021-6', '789', 'Busi NGK Vario BOX', 200000, 300000, 'KT-2021-1', 'NGK', '23', NULL, '2', '10', 'Busi NGK 1Box', '2021-05-10 06:36:15', '2021-05-10 06:36:15', 'BOX'),
(8, 'DB-2021-7', '789', 'Spul VArio 110', 190000, 250000, 'KT-2021-1', 'Astra', '4', NULL, '2', '20', 'Spul Untuk Vario 110 Karbu', '2021-05-10 06:41:03', '2021-05-10 06:41:03', 'PCS'),
(9, 'DB-2021-8', '2DP-E1631-00', 'PISTON YAMAHA', 5000, 15000, 'KT-2021-2', 'Mpx', '13', NULL, '5', '200', 'Oli Gardan', '2021-05-21 08:34:39', '2021-06-14 08:51:32', 'Botol'),
(10, 'DB-2021-9', '12345687', 'Ban Dalam', 30000, 50000, 'KT-2021-1', 'Aspira', '24', NULL, '2', '50', 'Ban Dalam', '2021-05-21 08:37:55', '2021-05-21 08:37:55', 'PCS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldetailjasajual`
--

CREATE TABLE `tbldetailjasajual` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNotaPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biayaJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbldetailjasajual`
--

INSERT INTO `tbldetailjasajual` (`id`, `noNotaPenjualan`, `kdJasa`, `namaJasa`, `biayaJasa`, `qtyJasa`, `totalJasa`, `tglPenjualan`, `created_at`, `updated_at`) VALUES
(53, 'INV2021051', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:27:06', '2021-05-14 04:27:06'),
(54, 'INV2021052', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:30:52', '2021-05-14 04:30:52'),
(55, 'INV2021053', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 04:31:59', '2021-05-14 04:31:59'),
(56, 'INV2021054', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:32:18', '2021-05-14 04:32:18'),
(57, 'INV2021055', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:32:51', '2021-05-14 04:32:51'),
(58, 'INV2021056', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 04:33:20', '2021-05-14 04:33:20'),
(59, 'INV2021057', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:34:55', '2021-05-14 04:34:55'),
(60, 'INV2021058', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 04:35:16', '2021-05-14 04:35:16'),
(61, 'INV2021059', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:35:32', '2021-05-14 04:35:32'),
(62, 'INV20210510', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 04:36:04', '2021-05-14 04:36:04'),
(63, 'INV20210511', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 04:37:24', '2021-05-14 04:37:24'),
(64, 'INV20210512', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 04:38:03', '2021-05-14 04:38:03'),
(65, 'INV20210513', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 08:14:14', '2021-05-14 08:14:14'),
(68, 'INV20210515', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 09:18:30', '2021-05-14 09:18:30'),
(69, 'INV20210516', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 09:23:01', '2021-05-14 09:23:01'),
(70, 'INV20210517', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 09:29:17', '2021-05-14 09:29:17'),
(71, 'INV20210517', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/14', '2021-05-14 09:29:27', '2021-05-14 09:29:27'),
(72, 'INV20210518', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 09:30:28', '2021-05-14 09:30:28'),
(74, 'INV20210519', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/14', '2021-05-14 09:33:42', '2021-05-14 09:33:42'),
(75, 'INV20210520', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/15', '2021-05-15 02:47:03', '2021-05-15 02:47:03'),
(76, 'INV20210521', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/20', '2021-05-20 01:14:13', '2021-05-20 01:14:13'),
(77, 'INV20210522', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/20', '2021-05-20 01:14:50', '2021-05-20 01:14:50'),
(78, 'INV20210523', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/20', '2021-05-20 01:22:57', '2021-05-20 01:22:57'),
(79, 'INV20210524', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/21', '2021-05-21 07:39:21', '2021-05-21 07:39:21'),
(80, 'INV20210525', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/21', '2021-05-21 08:23:57', '2021-05-21 08:23:57'),
(81, 'INV20210526', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/21', '2021-05-21 08:25:35', '2021-05-21 08:25:35'),
(82, 'INV20210527', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/05/21', '2021-05-21 08:28:51', '2021-05-21 08:28:51'),
(83, 'INV20210528', 'JS-2021-1', 'Service Ringan', '50000', '1', '50000', '2021/05/21', '2021-05-21 09:10:00', '2021-05-21 09:10:00'),
(86, 'INV20210630', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/06/12', '2021-06-12 02:02:55', '2021-06-12 02:02:55'),
(87, 'INV20210631', 'JS-2021-2', 'Bongkar Mesin', '70000', '1', '70000', '2021/06/14', '2021-06-14 02:40:50', '2021-06-14 02:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldetailkatalog`
--

CREATE TABLE `tbldetailkatalog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdKatSP` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noBarang` int(5) NOT NULL,
  `nmBarang` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbldetailkatalog`
--

INSERT INTO `tbldetailkatalog` (`id`, `kdKatSP`, `barcode`, `noBarang`, `nmBarang`, `created_at`, `updated_at`) VALUES
(5, 'KATSP005', '1234568766', 12, 'Rantai Standart Supra X 100CC', '2021-06-25 03:51:01', '2021-06-25 03:51:01'),
(6, 'KATSP005', '123456', 3, 'Kampas Kopling', '2021-06-25 03:52:31', '2021-06-25 03:52:31'),
(7, 'KATSP006', '123', 12, 'Busi', '2021-06-25 03:52:53', '2021-06-25 03:52:53'),
(8, 'KATSP005', '1234568766', 1, 'Rantai Standart Supra X 100CC', '2021-06-25 04:46:30', '2021-06-25 04:46:30'),
(9, 'KATSP005', '123', 2, 'Busi', '2021-06-25 04:46:49', '2021-06-25 04:46:49'),
(10, 'KATSP005', '0987654321', 7, 'Kampas Rem Vario 110', '2021-06-25 04:54:43', '2021-06-25 04:54:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbldetailpartmotor`
--

CREATE TABLE `tbldetailpartmotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdDetailMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdTahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warnaDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gbrDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbldetailpartmotor`
--

INSERT INTO `tbldetailpartmotor` (`id`, `kdDetail`, `kdDetailMotor`, `kdType`, `kdTahun`, `nmDetail`, `warnaDetail`, `gbrDetail`, `created_at`, `updated_at`) VALUES
(7, 'MTR001MTJ001VR001TH004', 'DETMTR002', 'VARIO 110', '2008', 'VARIO 110 FI', 'HITAM', '1624500985.png', '2021-06-24 02:16:25', '2021-06-24 02:16:25'),
(9, 'MTR002MTJ003MI001TH0011', 'DETMTR002', 'MIO 110', '2014', 'MIO 110 KARBU', 'BIRU', '1624502213.png', '2021-06-24 02:36:53', '2021-06-24 02:36:53'),
(10, 'MTR003MTJ005MTY002TH003', 'DETMTR002', 'SUZUKI NEXT FI', '2013', 'SUZUKI NEXT FI', 'HITAM', '1624502513.jpeg', '2021-06-24 02:41:53', '2021-06-24 02:41:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgrandbeli`
--

CREATE TABLE `tblgrandbeli` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblgrandbeli`
--

INSERT INTO `tblgrandbeli` (`id`, `kdGrandBeli`, `tglGrandBeli`, `kdSupplier`, `totalGrandBeli`, `pembayaranGrandBeli`, `userGrandBeli`, `created_at`, `updated_at`) VALUES
(2, 'GB2021051', '2021/05/24', 'SP-2021-2', '20000', '1', '1', '2021-05-24 08:50:43', '2021-05-24 08:50:43'),
(3, 'GB2021052', '2021/05/24', 'SP-2021-2', '20000', '1', '1', '2021-05-24 08:53:12', '2021-05-24 08:53:12'),
(4, 'GB2021053', '2021/05/24', 'SP-2021-2', '20000', '1', '1', '2021-05-24 09:01:48', '2021-05-24 09:01:48'),
(5, 'GB2021054', '2021/05/24', 'SP-2021-2', '20000', '1', '1', '2021-05-24 09:06:45', '2021-05-24 09:06:45'),
(6, 'GB2021055', '2021/05/24', 'SP-2021-2', '689000', '2', '1', '2021-05-24 09:09:08', '2021-05-24 09:09:08'),
(7, 'GB2021056', '2021/05/27', 'SP-2021-2', '4000000', '1', '1', '2021-05-27 07:50:50', '2021-05-27 07:50:50'),
(8, 'GB2021057', '2021/05/27', 'SP-2021-2', '100000', '1', '1', '2021-05-27 07:51:16', '2021-05-27 07:51:16'),
(9, 'GB2021068', '2021/06/12', 'SP-2021-2', '200000', '1', '1', '2021-06-12 01:16:51', '2021-06-12 01:16:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgrandbelidetail`
--

CREATE TABLE `tblgrandbelidetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblgrandbelidetail`
--

INSERT INTO `tblgrandbelidetail` (`id`, `kdGrandBeli`, `tglGrandBeli`, `noNotaPembelian`, `totalGrandBeli`, `pembayaranGrandBeli`, `userGrandBeli`, `created_at`, `updated_at`) VALUES
(1, 'GB2021054', '2021/04/15', 'PB-2021-4', '20000', '1', '1', '2021-05-24 09:06:50', '2021-05-24 09:06:50'),
(2, 'GB2021054', '2021/05/10', 'PB-2021-8', '0', '1', '1', '2021-05-24 09:06:50', '2021-05-24 09:06:50'),
(3, 'GB2021054', '2021/05/10', 'PB-2021-11', '0', '1', '1', '2021-05-24 09:06:50', '2021-05-24 09:06:50'),
(4, 'GB2021054', '2021/05/11', 'PB-2021-12', '0', '1', '1', '2021-05-24 09:06:50', '2021-05-24 09:06:50'),
(5, 'GB2021055', '2021/05/10', 'PB-2021-8', '9000', '2', '1', '2021-05-24 09:09:09', '2021-05-24 09:09:09'),
(6, 'GB2021055', '2021/05/10', 'PB-2021-11', '500000', '2', '1', '2021-05-24 09:09:09', '2021-05-24 09:09:09'),
(7, 'GB2021055', '2021/05/11', 'PB-2021-12', '180000', '2', '1', '2021-05-24 09:09:09', '2021-05-24 09:09:09'),
(8, 'GB2021056', '2021/05/10', 'PB-2021-8', '4000000', '1', '1', '2021-05-27 07:50:52', '2021-05-27 07:50:52'),
(9, 'GB2021056', '2021/05/10', 'PB-2021-11', '0', '1', '1', '2021-05-27 07:50:52', '2021-05-27 07:50:52'),
(10, 'GB2021056', '2021/05/27', 'PB-2021-15', '0', '1', '1', '2021-05-27 07:50:52', '2021-05-27 07:50:52'),
(11, 'GB2021057', '2021/05/10', 'PB-2021-11', '100000', '1', '1', '2021-05-27 07:51:17', '2021-05-27 07:51:17'),
(12, 'GB2021068', '2021/05/10', 'PB-2021-11', '200000', '1', '1', '2021-06-12 01:16:52', '2021-06-12 01:16:52'),
(13, 'GB2021068', '2021/05/27', 'PB-2021-15', '0', '1', '1', '2021-06-12 01:16:53', '2021-06-12 01:16:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgrandjual`
--

CREATE TABLE `tblgrandjual` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodePelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblgrandjual`
--

INSERT INTO `tblgrandjual` (`id`, `kdGrandJual`, `kodePelanggan`, `tglGrandJual`, `totalGrandJual`, `pembayaranGrandJual`, `userGrandJual`, `created_at`, `updated_at`) VALUES
(2, 'GJ2021051', 'PL-2021-1', '2021/05/19', '50000', '1', '1', '2021-05-19 10:12:50', '2021-05-19 10:12:50'),
(3, 'GJ2021052', 'PL-2021-1', '2021/05/19', '60000', '1', '1', '2021-05-19 10:14:07', '2021-05-19 10:14:07'),
(4, 'GJ2021053', 'PL-2021-3', '2021/05/20', '50000', '1', '1', '2021-05-20 01:12:56', '2021-05-20 01:12:56'),
(5, 'GJ2021054', 'PL-2021-1', '2021/05/20', '150000', '1', '1', '2021-05-20 01:25:30', '2021-05-20 01:25:30'),
(6, 'GJ2021055', 'PL-2021-1', '2021/05/20', '55000', '1', '1', '2021-05-20 09:07:22', '2021-05-20 09:07:22'),
(7, 'GJ2021056', 'PL-2021-3', '2021/05/20', '50000', '1', '1', '2021-05-20 09:08:12', '2021-05-20 09:08:12'),
(8, 'GJ2021057', 'PL-2021-1', '2021/05/21', '375000', '1', '1', '2021-05-21 07:40:36', '2021-05-21 07:40:36'),
(9, 'GJ2021058', 'PL-2021-3', '2021/05/21', '489750', '1', '1', '2021-05-21 08:30:13', '2021-05-21 08:30:13'),
(10, 'GJ2021059', 'PL-2021-3', '2021/05/21', '5500', '1', '1', '2021-05-21 08:31:08', '2021-05-21 08:31:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblgrandjualdetail`
--

CREATE TABLE `tblgrandjualdetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblgrandjualdetail`
--

INSERT INTO `tblgrandjualdetail` (`id`, `kdGrandJual`, `tglGrandJual`, `noNotaPenjualan`, `totalGrandJual`, `pembayaranGrandJual`, `userGrandJual`, `created_at`, `updated_at`) VALUES
(2, 'GJ2021051', '2021/05/14', 'INV2021052', '50000', '1', '1', '2021-05-19 10:12:52', '2021-05-19 10:12:52'),
(3, 'GJ2021051', '2021/05/14', 'INV2021056', '0', '1', '1', '2021-05-19 10:12:52', '2021-05-19 10:12:52'),
(4, 'GJ2021051', '2021/05/14', 'INV2021059', '0', '1', '1', '2021-05-19 10:12:52', '2021-05-19 10:12:52'),
(5, 'GJ2021052', '2021/05/14', 'INV2021052', '50000', '1', '1', '2021-05-19 10:14:10', '2021-05-19 10:14:10'),
(6, 'GJ2021052', '2021/05/14', 'INV2021056', '10000', '1', '1', '2021-05-19 10:14:10', '2021-05-19 10:14:10'),
(7, 'GJ2021052', '2021/05/14', 'INV2021059', '0', '1', '1', '2021-05-19 10:14:10', '2021-05-19 10:14:10'),
(8, 'GJ2021053', '2021/05/14', 'INV2021055', '50000', '1', '1', '2021-05-20 01:12:57', '2021-05-20 01:12:57'),
(9, 'GJ2021054', '2021/05/14', 'INV2021059', '0', '1', '1', '2021-05-20 01:25:32', '2021-05-20 01:25:32'),
(10, 'GJ2021054', '2021/05/14', 'INV2021056', '50000', '1', '1', '2021-05-20 01:25:32', '2021-05-20 01:25:32'),
(11, 'GJ2021054', '2021/05/14', 'INV2021052', '100000', '1', '1', '2021-05-20 01:25:32', '2021-05-20 01:25:32'),
(12, 'GJ2021054', '2021/05/20', 'INV20210523', '0', '1', '1', '2021-05-20 01:25:32', '2021-05-20 01:25:32'),
(13, 'GJ2021055', '2021/05/14', 'INV2021059', '0', '1', '1', '2021-05-20 09:07:23', '2021-05-20 09:07:23'),
(14, 'GJ2021055', '2021/05/20', 'INV20210523', '55000', '1', '1', '2021-05-20 09:07:23', '2021-05-20 09:07:23'),
(15, 'GJ2021056', '2021/05/14', 'INV2021055', '50000', '1', '1', '2021-05-20 09:08:13', '2021-05-20 09:08:13'),
(16, 'GJ2021056', '2021/05/20', 'INV20210522', '0', '1', '1', '2021-05-20 09:08:13', '2021-05-20 09:08:13'),
(17, 'GJ2021057', '2021/05/14', 'INV2021059', '200000', '1', '1', '2021-05-21 07:40:37', '2021-05-21 07:40:37'),
(18, 'GJ2021057', '2021/05/20', 'INV20210523', '150000', '1', '1', '2021-05-21 07:40:37', '2021-05-21 07:40:37'),
(19, 'GJ2021057', '2021/05/21', 'INV20210524', '25000', '1', '1', '2021-05-21 07:40:37', '2021-05-21 07:40:37'),
(20, 'GJ2021058', '2021/05/20', 'INV20210522', '289750', '1', '1', '2021-05-21 08:30:14', '2021-05-21 08:30:14'),
(21, 'GJ2021058', '2021/05/21', 'INV20210527', '200000', '1', '1', '2021-05-21 08:30:15', '2021-05-21 08:30:15'),
(22, 'GJ2021059', '2021/05/21', 'INV20210527', '5500', '1', '1', '2021-05-21 08:31:09', '2021-05-21 08:31:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljasa`
--

CREATE TABLE `tbljasa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biayaJasa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbljasa`
--

INSERT INTO `tbljasa` (`id`, `kdJasa`, `namaJasa`, `desJasa`, `biayaJasa`, `created_at`, `updated_at`) VALUES
(1, 'JS-2021-1', 'Service Ringan', 'Membersihkan Karbu', '50000', '2021-05-13 01:38:28', '2021-05-13 01:38:28'),
(2, 'JS-2021-2', 'Bongkar Mesin', 'Bongkar Kop', '70000', '2021-05-14 02:33:09', '2021-05-14 02:33:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljenismotor`
--

CREATE TABLE `tbljenismotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMerek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdJenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmJenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbljenismotor`
--

INSERT INTO `tbljenismotor` (`id`, `kdMerek`, `kdJenis`, `nmJenis`, `created_at`, `updated_at`) VALUES
(1, 'MTR001', 'MTJ001', 'MATIC', NULL, NULL),
(2, 'MTR001', 'MTJ002', 'MANUAL', NULL, NULL),
(3, 'MTR002', 'MTJ003', 'MATIC YAMAHA', NULL, NULL),
(4, 'MTR002', 'MTJ004', 'MANUAL YAMAHA', NULL, NULL),
(8, 'MTR003', 'MTJ005', 'MATIC SUZUKI', '2021-06-22 01:12:37', '2021-06-22 01:12:37'),
(9, 'MTR004', 'MTJ006', 'SPORT', '2021-06-22 01:49:00', '2021-06-22 01:49:00'),
(11, 'MTR004', 'MTJ007', 'MANUAL', '2021-06-22 01:52:35', '2021-06-22 01:52:35'),
(12, 'MTR004', 'MTJ008', 'MATIC', '2021-06-22 02:05:01', '2021-06-22 02:05:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkartustok`
--

CREATE TABLE `tblkartustok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblkartustok`
--

INSERT INTO `tblkartustok` (`id`, `kdBarang`, `tglKartu`, `qtyMasuk`, `qtyKeluar`, `noTransaksi`, `keteranganKartu`, `satuanKartu`, `created_at`, `updated_at`) VALUES
(14, 'DB-2021-2', '2021/04/06', '20', '0', 'PB-2021-1', 'Pembelian', 'PCS', '2021-04-06 10:43:28', '2021-04-06 10:43:28'),
(15, 'DB-2021-1', '2021/04/06', '20', '0', 'PB-2021-1', 'Pembelian', 'Box', '2021-04-06 10:44:35', '2021-04-06 10:44:35'),
(28, 'DB-2021-1', '2021/04/12', '2', '0', 'PB-2021-2', 'Pembelian', 'Box', '2021-04-12 00:06:09', '2021-04-12 00:06:09'),
(29, 'DB-2021-2', '2021/04/12', '3', '0', 'PB-2021-2', 'Pembelian', 'PCS', '2021-04-12 00:06:21', '2021-04-12 00:06:21'),
(31, 'DB-2021-1', '2021/04/15', '0', '-1', 'OP-2021-1', 'Stok Opname-Untuk Ecer', 'Box', '2021-04-15 03:12:11', '2021-04-15 03:12:11'),
(32, 'DB-2021-2', '2021/04/15', '0', '-1', 'OP-2021-1', 'Stok Opname-Untuk Ecer', 'PCS', '2021-04-15 03:12:28', '2021-04-15 03:12:28'),
(35, 'DB-2021-1', '2021/04/15', '2', '0', 'PB-2021-3', 'Pembelian', 'Box', '2021-04-15 03:19:30', '2021-04-15 03:19:30'),
(36, 'DB-2021-2', '2021/04/15', '3', '0', 'PB-2021-4', 'Pembelian', 'PCS', '2021-04-15 03:27:34', '2021-04-15 03:27:34'),
(37, 'DB-2021-1', '2021/04/15', '2', '0', 'PB-2021-5', 'Pembelian', 'Box', '2021-04-15 04:12:57', '2021-04-15 04:12:57'),
(38, 'DB-2021-2', '2021/04/15', '4', '0', 'PB-2021-6', 'Pembelian', 'PCS', '2021-04-15 04:13:36', '2021-04-15 04:13:36'),
(42, 'DB-2021-1', '2021/04/15', '0', '2', 'INV-2021-9', 'Penjualan', 'Box', '2021-04-15 04:24:40', '2021-04-15 04:24:40'),
(44, 'DB-2021-1', '2021/04/15', '0', '2', 'INV-2021-11', 'Penjualan', 'Box', '2021-04-15 04:31:10', '2021-04-15 04:31:10'),
(45, 'DB-2021-5', '2021/04/16', '1', '0', 'PB-2021-7', 'Pembelian', 'PCS', '2021-04-16 22:55:31', '2021-04-16 22:55:31'),
(46, 'DB-2021-2', '2021/04/16', '1', '0', 'PB-2021-7', 'Pembelian', 'PCS', '2021-04-16 22:55:43', '2021-04-16 22:55:43'),
(51, 'DB-2021-1', '2021/05/07', '0', '1', 'INV-2021-2', 'Penjualan', 'Box', '2021-05-07 12:36:19', '2021-05-07 12:36:19'),
(61, 'DB-2021-3', '2021/05/09', '0', '1', 'INV-2021-3', 'Penjualan', 'PCS', '2021-05-09 02:35:34', '2021-05-09 02:35:34'),
(70, 'DB-2021-5', '2021/05/10', '0', '1', 'INV-2021-8', 'Penjualan', 'PCS', '2021-05-10 00:04:21', '2021-05-10 00:04:21'),
(77, 'DB-2021-5', '2021/05/10', '0', '1', 'INV-2021-1', 'Penjualan', 'PCS', '2021-05-10 05:16:32', '2021-05-10 05:16:32'),
(78, 'DB-2021-5', '2021/05/10', '0', '1', 'INV-2021-5', 'Penjualan', 'PCS', '2021-05-10 05:18:07', '2021-05-10 05:18:07'),
(80, 'DB-2021-5', '2021/05/10', '0', '1', 'INV-2021-1', 'Penjualan', 'PCS', '2021-05-10 05:20:14', '2021-05-10 05:20:14'),
(83, 'DB-2021-1', '2021/05/10', '0', '1', 'INV-2021-2', 'Penjualan', 'Box', '2021-05-10 05:20:59', '2021-05-10 05:20:59'),
(85, 'DB-2021-4', '2021/05/10', '0', '1', 'INV-2021-3', 'Penjualan', 'PCS', '2021-05-10 05:26:21', '2021-05-10 05:26:21'),
(86, 'DB-2021-3', '2021/05/10', '0', '1', 'INV-2021-3', 'Penjualan', 'PCS', '2021-05-10 05:26:26', '2021-05-10 05:26:26'),
(89, 'DB-2021-1', '2021/05/10', '0', '1', 'INV-2021-5', 'Penjualan', 'Box', '2021-05-10 05:28:16', '2021-05-10 05:28:16'),
(90, 'DB-2021-4', '2021/05/10', '0', '1', 'INV-2021-5', 'Penjualan', 'PCS', '2021-05-10 05:28:22', '2021-05-10 05:28:22'),
(94, 'DB-2021-1', '2021/05/10', '20', '0', 'PB-2021-8', 'Pembelian', 'Box', '2021-05-10 06:26:44', '2021-05-10 06:26:44'),
(95, 'DB-2021-5', '2021/05/10', '20', '0', 'PB-2021-8', 'Pembelian', 'PCS', '2021-05-10 06:26:53', '2021-05-10 06:26:53'),
(96, 'DB-2021-2', '2021/05/10', '1', '0', 'PB-2021-8', 'Pembelian', 'PCS', '2021-05-10 06:30:24', '2021-05-10 06:30:24'),
(97, 'DB-2021-3', '2021/05/10', '20', '0', 'PB-2021-9', 'Pembelian', 'PCS', '2021-05-10 06:32:31', '2021-05-10 06:32:31'),
(98, 'DB-2021-4', '2021/05/10', '20', '0', 'PB-2021-9', 'Pembelian', 'PCS', '2021-05-10 06:32:37', '2021-05-10 06:32:37'),
(99, 'DB-2021-6', '2021/05/10', '3', '0', 'PB-2021-10', 'Pembelian', 'BOX', '2021-05-10 06:36:47', '2021-05-10 06:36:47'),
(102, 'DB-2021-7', '2021/05/10', '10', '0', 'PB-2021-11', 'Pembelian', 'PCS', '2021-05-10 06:41:37', '2021-05-10 06:41:37'),
(104, 'DB-2021-7', '2021/05/10', '0', '3', 'INV-2021-7', 'Penjualan', 'PCS', '2021-05-10 06:43:45', '2021-05-10 06:43:45'),
(106, 'DB-2021-7', '2021/05/08', '0', '1', 'INV-2021-8', 'Penjualan', 'PCS', '2021-05-10 07:35:57', '2021-05-10 07:35:57'),
(112, 'DB-2021-7', '2021/05/10', '0', '1', 'INV-2021-1', 'Penjualan', 'PCS', '2021-05-10 08:41:30', '2021-05-10 08:41:30'),
(124, 'DB-2021-4', '2021/05/08', '0', '1', 'INV-2021-1', 'Penjualan', 'PCS', '2021-05-10 09:36:15', '2021-05-10 09:36:15'),
(130, 'DB-2021-2', '2021/05/11', '20', '0', 'PB-2021-12', 'Pembelian', 'PCS', '2021-05-11 02:29:52', '2021-05-11 02:29:52'),
(134, 'DB-2021-1', '2021/05/11', '0', '1', 'INV-2021-4', 'Penjualan', 'Box', '2021-05-11 09:47:37', '2021-05-11 09:47:37'),
(135, 'DB-2021-7', '2021/05/11', '0', '1', 'INV-2021-5', 'Penjualan', 'PCS', '2021-05-11 09:48:26', '2021-05-11 09:48:26'),
(156, 'DB-2021-3', '2021/05/14', '0', '1', 'INV-2021-6', 'Penjualan', 'PCS', '2021-05-14 02:20:39', '2021-05-14 02:20:39'),
(157, 'DB-2021-2', '2021/05/14', '0', '1', 'INV-2021-7', 'Penjualan', 'PCS', '2021-05-14 02:21:16', '2021-05-14 02:21:16'),
(158, 'DB-2021-4', '2021/05/14', '0', '1', 'INV-2021-7', 'Penjualan', 'PCS', '2021-05-14 02:21:28', '2021-05-14 02:21:28'),
(163, 'DB-2021-2', '2021/05/14', '0', '1', 'INV-2021-8', 'Penjualan', 'PCS', '2021-05-14 02:33:25', '2021-05-14 02:33:25'),
(164, 'DB-2021-3', '2021/05/14', '0', '1', 'INV-2021-8', 'Penjualan', 'PCS', '2021-05-14 02:33:31', '2021-05-14 02:33:31'),
(165, 'DB-2021-4', '2021/05/14', '0', '1', 'INV-2021-8', 'Penjualan', 'PCS', '2021-05-14 02:33:40', '2021-05-14 02:33:40'),
(166, 'DB-2021-1', '2021/05/14', '0', '1', 'INV-2021-9', 'Penjualan', 'Box', '2021-05-14 02:38:00', '2021-05-14 02:38:00'),
(167, 'DB-2021-4', '2021/05/14', '0', '1', 'INV-2021-9', 'Penjualan', 'PCS', '2021-05-14 02:38:05', '2021-05-14 02:38:05'),
(182, 'DB-2021-1', '2021/05/14', '0', '1', 'INV-2021-10', 'Penjualan', 'Box', '2021-05-14 03:44:43', '2021-05-14 03:44:43'),
(190, 'DB-2021-3', '2021/05/14', '0', '1', 'INV-2021-6', 'Penjualan', 'PCS', '2021-05-14 03:55:55', '2021-05-14 03:55:55'),
(201, 'DB-2021-2', '2021/05/14', '0', '1', 'INV2021051', 'Penjualan', 'PCS', '2021-05-14 04:27:04', '2021-05-14 04:27:04'),
(202, 'DB-2021-1', '2021/05/14', '0', '1', 'INV2021052', 'Penjualan', 'Box', '2021-05-14 04:30:50', '2021-05-14 04:30:50'),
(203, 'DB-2021-3', '2021/05/14', '0', '1', 'INV2021053', 'Penjualan', 'PCS', '2021-05-14 04:31:57', '2021-05-14 04:31:57'),
(204, 'DB-2021-2', '2021/05/14', '0', '1', 'INV2021054', 'Penjualan', 'PCS', '2021-05-14 04:32:16', '2021-05-14 04:32:16'),
(205, 'DB-2021-4', '2021/05/14', '0', '1', 'INV2021055', 'Penjualan', 'PCS', '2021-05-14 04:32:49', '2021-05-14 04:32:49'),
(206, 'DB-2021-2', '2021/05/14', '0', '1', 'INV2021056', 'Penjualan', 'PCS', '2021-05-14 04:33:17', '2021-05-14 04:33:17'),
(207, 'DB-2021-3', '2021/05/14', '0', '1', 'INV2021057', 'Penjualan', 'PCS', '2021-05-14 04:34:53', '2021-05-14 04:34:53'),
(208, 'DB-2021-4', '2021/05/14', '0', '1', 'INV2021058', 'Penjualan', 'PCS', '2021-05-14 04:35:14', '2021-05-14 04:35:14'),
(209, 'DB-2021-3', '2021/05/14', '0', '1', 'INV2021059', 'Penjualan', 'PCS', '2021-05-14 04:35:30', '2021-05-14 04:35:30'),
(210, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210510', 'Penjualan', 'PCS', '2021-05-14 04:36:02', '2021-05-14 04:36:02'),
(211, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210511', 'Penjualan', 'PCS', '2021-05-14 04:37:21', '2021-05-14 04:37:21'),
(212, 'DB-2021-1', '2021/05/14', '0', '1', 'INV20210511', 'Penjualan', 'Box', '2021-05-14 04:37:27', '2021-05-14 04:37:27'),
(213, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210512', 'Penjualan', 'PCS', '2021-05-14 04:37:58', '2021-05-14 04:37:58'),
(214, 'DB-2021-5', '2021/05/14', '0', '1', 'INV20210512', 'Penjualan', 'PCS', '2021-05-14 04:38:00', '2021-05-14 04:38:00'),
(216, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210513', 'Penjualan', 'PCS', '2021-05-14 08:14:10', '2021-05-14 08:14:10'),
(217, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210513', 'Penjualan', 'PCS', '2021-05-14 08:14:29', '2021-05-14 08:14:29'),
(219, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210514', 'Penjualan', 'PCS', '2021-05-14 08:16:20', '2021-05-14 08:16:20'),
(220, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210514', 'Penjualan', 'PCS', '2021-05-14 08:16:46', '2021-05-14 08:16:46'),
(221, 'DB-2021-4', '2021/05/14', '0', '1', 'INV20210514', 'Penjualan', 'PCS', '2021-05-14 08:16:52', '2021-05-14 08:16:52'),
(226, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210515', 'Penjualan', 'PCS', '2021-05-14 09:18:24', '2021-05-14 09:18:24'),
(227, 'DB-2021-4', '2021/05/14', '0', '1', 'INV20210515', 'Penjualan', 'PCS', '2021-05-14 09:18:35', '2021-05-14 09:18:35'),
(228, 'DB-2021-1', '2021/05/14', '0', '1', 'INV20210516', 'Penjualan', 'Box', '2021-05-14 09:22:32', '2021-05-14 09:22:32'),
(229, 'DB-2021-4', '2021/05/14', '0', '1', 'INV20210516', 'Penjualan', 'PCS', '2021-05-14 09:22:45', '2021-05-14 09:22:45'),
(230, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210516', 'Penjualan', 'PCS', '2021-05-14 09:22:53', '2021-05-14 09:22:53'),
(231, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210517', 'Penjualan', 'PCS', '2021-05-14 09:29:12', '2021-05-14 09:29:12'),
(232, 'DB-2021-1', '2021/05/14', '0', '1', 'INV20210517', 'Penjualan', 'Box', '2021-05-14 09:29:32', '2021-05-14 09:29:32'),
(233, 'DB-2021-1', '2021/05/14', '0', '1', 'INV20210518', 'Penjualan', 'Box', '2021-05-14 09:30:09', '2021-05-14 09:30:09'),
(234, 'DB-2021-3', '2021/05/14', '0', '1', 'INV20210518', 'Penjualan', 'PCS', '2021-05-14 09:30:11', '2021-05-14 09:30:11'),
(235, 'DB-2021-5', '2021/05/14', '0', '2', 'INV20210518', 'Penjualan', 'PCS', '2021-05-14 09:30:15', '2021-05-14 09:30:15'),
(238, 'DB-2021-1', '2021/05/14', '0', '1', 'INV20210519', 'Penjualan', 'Box', '2021-05-14 09:33:31', '2021-05-14 09:33:31'),
(239, 'DB-2021-2', '2021/05/14', '0', '1', 'INV20210519', 'Penjualan', 'PCS', '2021-05-14 09:33:37', '2021-05-14 09:33:37'),
(240, 'DB-2021-1', '2021/05/15', '0', '1', 'INV20210520', 'Penjualan', 'Box', '2021-05-15 02:46:57', '2021-05-15 02:46:57'),
(241, 'DB-2021-1', '2021/05/20', '0', '1', 'INV20210521', 'Penjualan', 'Box', '2021-05-20 01:14:03', '2021-05-20 01:14:03'),
(242, 'DB-2021-2', '2021/05/20', '0', '1', 'INV20210521', 'Penjualan', 'PCS', '2021-05-20 01:14:05', '2021-05-20 01:14:05'),
(243, 'DB-2021-5', '2021/05/20', '0', '1', 'INV20210521', 'Penjualan', 'PCS', '2021-05-20 01:14:09', '2021-05-20 01:14:09'),
(244, 'DB-2021-5', '2021/05/20', '0', '1', 'INV20210522', 'Penjualan', 'PCS', '2021-05-20 01:14:39', '2021-05-20 01:14:39'),
(245, 'DB-2021-2', '2021/05/20', '0', '1', 'INV20210522', 'Penjualan', 'PCS', '2021-05-20 01:14:42', '2021-05-20 01:14:42'),
(246, 'DB-2021-3', '2021/05/20', '0', '1', 'INV20210522', 'Penjualan', 'PCS', '2021-05-20 01:14:45', '2021-05-20 01:14:45'),
(247, 'DB-2021-2', '2021/05/20', '0', '1', 'INV20210523', 'Penjualan', 'PCS', '2021-05-20 01:22:15', '2021-05-20 01:22:15'),
(248, 'DB-2021-4', '2021/05/20', '0', '1', 'INV20210523', 'Penjualan', 'PCS', '2021-05-20 01:22:22', '2021-05-20 01:22:22'),
(249, 'DB-2021-5', '2021/05/20', '0', '1', 'INV20210523', 'Penjualan', 'PCS', '2021-05-20 01:22:28', '2021-05-20 01:22:28'),
(250, 'DB-2021-3', '2021/05/20', '20', '0', 'PB-2021-13', 'Pembelian', 'PCS', '2021-05-20 01:32:07', '2021-05-20 01:32:07'),
(251, 'DB-2021-5', '2021/05/20', '20', '0', 'PB-2021-13', 'Pembelian', 'PCS', '2021-05-20 01:32:19', '2021-05-20 01:32:19'),
(252, 'DB-2021-2', '2021/05/20', '20', '0', 'PB-2021-13', 'Pembelian', 'PCS', '2021-05-20 01:32:24', '2021-05-20 01:32:24'),
(253, 'DB-2021-2', '2021/05/21', '0', '1', 'INV20210524', 'Penjualan', 'PCS', '2021-05-21 07:39:25', '2021-05-21 07:39:25'),
(254, 'DB-2021-5', '2021/05/21', '0', '1', 'INV20210524', 'Penjualan', 'PCS', '2021-05-21 07:39:30', '2021-05-21 07:39:30'),
(255, 'DB-2021-2', '2021/05/21', '0', '1', 'INV20210525', 'Penjualan', 'PCS', '2021-05-21 08:23:53', '2021-05-21 08:23:53'),
(256, 'DB-2021-1', '2021/05/21', '0', '1', 'INV20210525', 'Penjualan', 'Box', '2021-05-21 08:24:03', '2021-05-21 08:24:03'),
(257, 'DB-2021-5', '2021/05/21', '0', '2', 'INV20210526', 'Penjualan', 'PCS', '2021-05-21 08:25:31', '2021-05-21 08:25:31'),
(258, 'DB-2021-1', '2021/05/21', '0', '1', 'INV20210527', 'Penjualan', 'Box', '2021-05-21 08:28:43', '2021-05-21 08:28:43'),
(259, 'DB-2021-4', '2021/05/21', '0', '1', 'INV20210527', 'Penjualan', 'PCS', '2021-05-21 08:28:45', '2021-05-21 08:28:45'),
(260, 'DB-2021-5', '2021/05/21', '0', '1', 'INV20210527', 'Penjualan', 'PCS', '2021-05-21 08:28:48', '2021-05-21 08:28:48'),
(263, 'DB-2021-8', '2021/05/21', '10', '0', 'OP-2021-2', 'Stok Opname-Stok Awal', 'Botol', '2021-05-21 09:03:58', '2021-05-21 09:03:58'),
(264, 'DB-2021-9', '2021/05/21', '20', '0', 'OP-2021-2', 'Stok Opname-Stok Awal', 'PCS', '2021-05-21 09:04:07', '2021-05-21 09:04:07'),
(265, 'DB-2021-8', '2021/05/21', '10', '0', 'PB-2021-14', 'Pembelian', 'Botol', '2021-05-21 09:06:12', '2021-05-21 09:06:12'),
(266, 'DB-2021-9', '2021/05/21', '5', '0', 'PB-2021-14', 'Pembelian', 'PCS', '2021-05-21 09:06:21', '2021-05-21 09:06:21'),
(267, 'DB-2021-8', '2021/05/21', '0', '-5', 'OP-2021-3', 'Stok Opname-Hilang', 'Botol', '2021-05-21 09:08:34', '2021-05-21 09:08:34'),
(268, 'DB-2021-8', '2021/05/21', '0', '1', 'INV20210528', 'Penjualan', 'Botol', '2021-05-21 09:09:47', '2021-05-21 09:09:47'),
(269, 'DB-2021-9', '2021/05/21', '0', '1', 'INV20210528', 'Penjualan', 'PCS', '2021-05-21 09:09:53', '2021-05-21 09:09:53'),
(271, 'DB-2021-8', '2021/05/21', '0', '1', 'INV20210529', 'Penjualan', 'Botol', '2021-05-21 09:14:03', '2021-05-21 09:14:03'),
(272, 'DB-2021-5', '2021/05/27', '10', '0', 'PB-2021-15', 'Pembelian', 'PCS', '2021-05-22 04:28:51', '2021-05-22 04:28:51'),
(273, 'DB-2021-6', '2021/05/27', '10', '0', 'PB-2021-15', 'Pembelian', 'BOX', '2021-05-22 04:28:59', '2021-05-22 04:28:59'),
(274, 'DB-2021-2', '2021/05/27', '10', '0', 'PB-2021-15', 'Pembelian', 'PCS', '2021-05-22 04:30:09', '2021-05-22 04:30:09'),
(276, 'DB-2021-1', '2021/05/27', '5', '0', 'PB-2021-15', 'Pembelian', 'Box', '2021-05-27 07:49:48', '2021-05-27 07:49:48'),
(277, 'DB-2021-6', '2021/05/27', '10', '0', 'PB-2021-15', 'Pembelian', 'BOX', '2021-05-27 07:49:56', '2021-05-27 07:49:56'),
(280, 'DB-2021-1', '2021/06/12', '0', '1', 'INV20210630', 'Penjualan', 'Box', '2021-06-12 02:02:47', '2021-06-12 02:02:47'),
(281, 'DB-2021-2', '2021/06/12', '0', '1', 'INV20210630', 'Penjualan', 'PCS', '2021-06-12 02:02:50', '2021-06-12 02:02:50'),
(282, 'DB-2021-1', '2021/06/14', '0', '1', 'INV20210631', 'Penjualan', 'Box', '2021-06-14 02:40:29', '2021-06-14 02:40:29'),
(283, 'DB-2021-3', '2021/06/14', '0', '1', 'INV20210631', 'Penjualan', 'PCS', '2021-06-14 02:40:33', '2021-06-14 02:40:33'),
(284, 'DB-2021-4', '2021/06/14', '0', '1', 'INV20210631', 'Penjualan', 'PCS', '2021-06-14 02:40:39', '2021-06-14 02:40:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkategori`
--

CREATE TABLE `tblkategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kodeKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblkategori`
--

INSERT INTO `tblkategori` (`id`, `kodeKtg`, `namaKtg`, `created_at`, `updated_at`) VALUES
(1, 'KT-2021-1', 'Spare PArt', '2021-03-26 11:20:43', '2021-04-15 03:10:33'),
(2, 'KT-2021-2', 'OLI Gardan', '2021-04-15 03:03:08', '2021-04-15 03:10:56'),
(3, 'KT-2021-3', 'OLi Mesin', '2021-04-15 03:10:43', '2021-04-15 03:10:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkatspmotor`
--

CREATE TABLE `tblkatspmotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdDetail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdDetailMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdKatSp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmKatSp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gbrKatSp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblkatspmotor`
--

INSERT INTO `tblkatspmotor` (`id`, `kdDetail`, `kdDetailMotor`, `kdKatSp`, `nmKatSp`, `gbrKatSp`, `created_at`, `updated_at`) VALUES
(9, 'MTR001MTJ001VR001TH004', 'DETMTR002', 'KATSP005', 'Cilinder', '1624585881.png', '2021-06-25 01:51:22', '2021-06-25 01:51:22'),
(11, 'MTR001MTJ001VR001TH004', 'DETMTR002', 'KATSP006', 'Camsaft', '1624587359.png', '2021-06-25 02:15:59', '2021-06-25 02:15:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkomposisi`
--

CREATE TABLE `tblkomposisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBarang` double NOT NULL,
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaBarang` double NOT NULL,
  `totalBarang` double NOT NULL,
  `totalSatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllift`
--

CREATE TABLE `tbllift` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mekanikLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbllift`
--

INSERT INTO `tbllift` (`id`, `kdLift`, `noLift`, `mekanikLift`, `statusLift`, `created_at`, `updated_at`) VALUES
(1, 'LF-2021-1', '1', '-', '0', '2021-05-09 23:43:50', '2021-05-09 23:43:50'),
(2, 'LF-2021-2', '2', '-', '0', '2021-05-09 23:44:54', '2021-05-09 23:44:54'),
(3, 'LF-2021-3', '3', '-', '0', '2021-05-09 23:45:00', '2021-05-09 23:45:00'),
(4, 'LF-2021-4', '4', '-', '0', '2021-05-09 23:45:09', '2021-05-09 23:47:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblmekanik`
--

CREATE TABLE `tblmekanik` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamatMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTlpMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatanMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblmekanik`
--

INSERT INTO `tblmekanik` (`id`, `kdMekanik`, `namaMekanik`, `alamatMekanik`, `noTlpMekanik`, `jabatanMekanik`, `created_at`, `updated_at`) VALUES
(1, 'MK-2021-1', 'None', '-', '-', '-', '2021-05-09 06:31:28', '2021-05-09 11:53:09'),
(2, 'MK-2021-2', 'Andi', 'Sesetan', '868678', 'Mekanik', '2021-05-09 06:34:13', '2021-05-09 06:34:13'),
(3, 'MK-2021-3', 'Gede', 'Gianyar', '7687', 'Mekanik', '2021-05-09 06:36:06', '2021-05-09 06:36:06'),
(4, 'MK-2021-4', 'ketut', 'Badung', '554534543', 'Mekanik', '2021-05-09 06:36:21', '2021-05-09 06:58:28'),
(5, 'MK-2021-5', 'WAWAN', 'GAtsu', '548646154', 'Kepala Mekanik', '2021-05-21 09:12:46', '2021-05-21 09:12:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblmerekmotor`
--

CREATE TABLE `tblmerekmotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMerek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmMerek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblmerekmotor`
--

INSERT INTO `tblmerekmotor` (`id`, `kdMerek`, `nmMerek`, `created_at`, `updated_at`) VALUES
(1, 'MTR001', 'HONDA', NULL, NULL),
(2, 'MTR002', 'YAMAHA', NULL, NULL),
(4, 'MTR003', 'SUZUKI', '2021-06-22 01:12:20', '2021-06-22 01:12:20'),
(5, 'MTR004', 'KAWASAKI', '2021-06-22 01:48:39', '2021-06-22 01:48:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblmotor`
--

CREATE TABLE `tblmotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilikMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblmotor`
--

INSERT INTO `tblmotor` (`id`, `kdMotor`, `platMotor`, `namaMotor`, `pemilikMotor`, `created_at`, `updated_at`) VALUES
(1, 'MT-2021-1', '0000', 'Motor', 'PL-2021-1', '2021-05-09 01:01:37', '2021-05-09 01:56:37'),
(2, 'MT-2021-2', 'DK 1234 QA', 'Scoopy', 'PL-2021-3', '2021-05-09 02:02:53', '2021-05-09 02:02:53'),
(3, 'MT-2021-3', 'DK 3434 QW', 'PCX', 'PL-2021-3', '2021-05-09 02:03:19', '2021-05-09 02:03:19'),
(4, 'MT-2021-4', 'DK 1234 GB', 'HONDA BEAT', 'PL-2021-2', '2021-05-21 09:11:59', '2021-05-21 09:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpelanggan`
--

CREATE TABLE `tblpelanggan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kodePelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaPelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamatPelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTlp` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `diskonPelanggan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpelanggan`
--

INSERT INTO `tblpelanggan` (`id`, `kodePelanggan`, `namaPelanggan`, `alamatPelanggan`, `noTlp`, `created_at`, `updated_at`, `diskonPelanggan`) VALUES
(1, 'PL-2021-1', 'Cash', 'Denpasar', '081', NULL, '2021-05-09 02:14:50', '0'),
(2, 'PL-2021-2', 'Rihan UUU', 'Badung', '09887578', '2021-04-05 08:56:46', '2021-05-09 02:14:43', '0'),
(3, 'PL-2021-3', 'Nengah', 'Karangasem', '987668', '2021-04-15 03:14:05', '2021-05-14 09:26:34', '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpembayaran`
--

CREATE TABLE `tblpembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notaPembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonPembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pajakPembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typePembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargePembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noKartuPembayaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpembayaran`
--

INSERT INTO `tblpembayaran` (`id`, `notaPembayaran`, `diskonPembayaran`, `pajakPembayaran`, `typePembayaran`, `chargePembayaran`, `noKartuPembayaran`, `created_at`, `updated_at`) VALUES
(1, 'INV20210630', '0', '0', '1', '0', '0', NULL, NULL),
(2, 'INV20210631', '0', '0', '1', '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpembelian`
--

CREATE TABLE `tblpembelian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typePembelian` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termPembelian` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hutangPembelian` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bayarNotaPembelian` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jthTempoPembelian` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpembelian`
--

INSERT INTO `tblpembelian` (`id`, `idSupplier`, `noNotaPembelian`, `tglNotaPembelian`, `totalNotaPembelian`, `userPembelian`, `created_at`, `updated_at`, `typePembelian`, `termPembelian`, `hutangPembelian`, `bayarNotaPembelian`, `jthTempoPembelian`) VALUES
(4, 'SP-2021-2', 'PB-2021-4', '2021/04/15', '27000', '1', '2021-04-15 03:28:49', '2021-05-24 09:06:50', '2', '14', '0', '7000', ''),
(5, 'SP-2021-2', 'PB-2021-5', '2021/04/15', '400000', '1', '2021-04-15 04:13:12', '2021-04-15 04:13:12', '1', '0', '0', '400000', ''),
(6, 'SP-2021-1', 'PB-2021-6', '2021/04/15', '36000', '1', '2021-04-15 04:13:48', '2021-04-15 04:13:48', '2', '14', '26000', '10000', ''),
(8, 'SP-2021-2', 'PB-2021-8', '2021/05/10', '5009000', '1', '2021-05-10 06:30:56', '2021-05-27 07:50:52', '2', '30', '0', '5000000', '2021/06/09'),
(9, 'SP-2021-1', 'PB-2021-9', '2021/05/10', '2800000', '1', '2021-05-10 06:33:23', '2021-05-10 06:33:23', '1', '0', '0', '2800000', '2021/05/10'),
(10, 'SP-2021-2', 'PB-2021-10', '2021/05/10', '600000', '1', '2021-05-10 06:36:56', '2021-05-10 06:36:56', '1', '0', '0', '600000', '2021/05/10'),
(11, 'SP-2021-2', 'PB-2021-11', '2021/05/10', '1900000', '1', '2021-05-10 06:42:09', '2021-06-12 01:16:52', '2', '25', '200000', '1200000', '2021/06/04'),
(12, 'SP-2021-2', 'PB-2021-12', '2021/05/11', '180000', '1', '2021-05-11 02:30:05', '2021-05-24 09:09:09', '2', '15', '0', '0', '2021/05/26'),
(13, 'SP-2021-2', 'PB-2021-13', '2021/05/20', '2980000', '1', '2021-05-20 01:33:05', '2021-05-20 01:33:05', '2', '20', '0', '2980000', '2021/06/09'),
(14, 'SP-2021-2', 'PB-2021-14', '2021/05/21', '200000', '1', '2021-05-21 09:06:45', '2021-05-21 09:06:45', '1', '0', '0', '200000', '2021/05/21'),
(16, 'SP-2021-2', 'PB-2021-15', '2021/05/27', '3000000', '1', '2021-05-27 07:50:16', '2021-06-12 01:16:53', '2', '15', '3000000', '0', '2021/06/11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpembeliandetail`
--

CREATE TABLE `tblpembeliandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpembeliandetail`
--

INSERT INTO `tblpembeliandetail` (`id`, `noNotaPembelian`, `kdBarang`, `hrgPokok`, `qtyBeli`, `totalBeli`, `created_at`, `updated_at`) VALUES
(8, 'PB-2021-4', 'DB-2021-2', '9000', '3', '27000', '2021-04-15 03:27:34', '2021-04-15 03:27:34'),
(9, 'PB-2021-5', 'DB-2021-1', '200000', '2', '400000', '2021-04-15 04:12:57', '2021-04-15 04:12:57'),
(10, 'PB-2021-6', 'DB-2021-2', '9000', '4', '36000', '2021-04-15 04:13:36', '2021-04-15 04:13:36'),
(17, 'PB-2021-8', 'DB-2021-1', '200000', '20', '4000000', '2021-05-10 06:26:44', '2021-05-10 06:26:44'),
(18, 'PB-2021-8', 'DB-2021-5', '50000', '20', '1000000', '2021-05-10 06:26:53', '2021-05-10 06:26:53'),
(19, 'PB-2021-8', 'DB-2021-2', '9000', '1', '9000', '2021-05-10 06:30:24', '2021-05-10 06:30:24'),
(20, 'PB-2021-9', 'DB-2021-3', '90000', '20', '1800000', '2021-05-10 06:32:31', '2021-05-10 06:32:31'),
(21, 'PB-2021-9', 'DB-2021-4', '50000', '20', '1000000', '2021-05-10 06:32:37', '2021-05-10 06:32:37'),
(22, 'PB-2021-10', 'DB-2021-6', '200000', '3', '600000', '2021-05-10 06:36:47', '2021-05-10 06:36:47'),
(23, 'PB-2021-11', 'DB-2021-7', '190000', '10', '1900000', '2021-05-10 06:41:37', '2021-05-10 06:41:37'),
(24, 'PB-2021-12', 'DB-2021-2', '9000', '20', '180000', '2021-05-11 02:29:52', '2021-05-11 02:29:52'),
(25, 'PB-2021-13', 'DB-2021-3', '90000', '20', '1800000', '2021-05-20 01:32:07', '2021-05-20 01:32:07'),
(26, 'PB-2021-13', 'DB-2021-5', '50000', '20', '1000000', '2021-05-20 01:32:19', '2021-05-20 01:32:19'),
(27, 'PB-2021-13', 'DB-2021-2', '9000', '20', '180000', '2021-05-20 01:32:24', '2021-05-20 01:32:24'),
(30, 'PB-2021-14', 'DB-2021-8', '5000', '10', '50000', '2021-05-21 09:06:12', '2021-05-21 09:06:12'),
(31, 'PB-2021-14', 'DB-2021-9', '30000', '5', '150000', '2021-05-21 09:06:21', '2021-05-21 09:06:21'),
(35, 'PB-2021-15', 'DB-2021-1', '200000', '5', '1000000', '2021-05-27 07:49:48', '2021-05-27 07:49:48'),
(36, 'PB-2021-15', 'DB-2021-6', '200000', '10', '2000000', '2021-05-27 07:49:56', '2021-05-27 07:49:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpenjualan`
--

CREATE TABLE `tblpenjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `liftNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargeNota` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mekanikNota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeBayarNota` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `termNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piutangNota` int(45) DEFAULT NULL,
  `jthTempoNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpenjualan`
--

INSERT INTO `tblpenjualan` (`id`, `noNota`, `liftNo`, `pelangganNota`, `tglNota`, `totalNota`, `taxNota`, `diskonNota`, `bayarNota`, `chargeNota`, `kembalianNota`, `userNota`, `created_at`, `updated_at`, `mekanikNota`, `typeNota`, `typeBayarNota`, `termNota`, `piutangNota`, `jthTempoNota`) VALUES
(18, 'INV2021051', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '85000', '0', '0', '85000', '0', '15000', '1', '2021-05-14 04:27:12', '2021-05-14 04:27:12', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(19, 'INV2021052', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '370000', '0', '0', '70000', '0', '-300000', '1', '2021-05-14 04:31:06', '2021-05-20 01:25:32', 'MK-2021-1', '2', '1', '7', 0, '2021/05/21'),
(20, 'INV2021053', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '210000', '0', '0', '210000', '0', '40000', '1', '2021-05-14 04:32:05', '2021-05-14 04:32:05', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(21, 'INV2021054', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '78030', '0', '8500', '78030', '1530', '1530', '1', '2021-05-14 04:32:40', '2021-05-14 04:32:40', 'MK-2021-1', '1', '2', '0', 0, '2021/05/14'),
(22, 'INV2021055', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '117000', '0', '13000', '0', '0', '-117000', '1', '2021-05-14 04:33:07', '2021-05-20 09:08:13', 'MK-2021-1', '2', '1', '30', 0, '2021/06/13'),
(23, 'INV2021056', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '66300', '0', '0', '6300', '1300', '-58700', '1', '2021-05-14 04:33:40', '2021-05-20 01:25:32', 'MK-2021-1', '2', '2', '14', 0, '2021/05/28'),
(24, 'INV2021057', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '207000', '0', '23000', '207000', '0', '3000', '1', '2021-05-14 04:35:03', '2021-05-14 04:35:03', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(25, 'INV2021058', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '99000', '0', '11000', '99000', '0', '51000', '1', '2021-05-14 04:35:22', '2021-05-14 04:35:22', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(26, 'INV2021059', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '230000', '0', '0', '30000', '0', '-200000', '1', '2021-05-14 04:35:45', '2021-05-21 07:40:37', 'MK-2021-1', '2', '1', '14', 0, '2021/05/28'),
(27, 'INV20210510', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '210000', '0', '0', '210000', '0', '40000', '1', '2021-05-14 04:36:11', '2021-05-14 04:36:11', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(28, 'INV20210511', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '510000', '0', '0', '510000', '0', '40000', '1', '2021-05-14 04:37:35', '2021-05-14 04:37:35', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(29, 'INV20210512', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '295800', '0', '0', '295800', '5800', '5800', '1', '2021-05-14 04:38:21', '2021-05-14 04:38:21', 'MK-2021-1', '1', '2', '0', 0, '2021/05/14'),
(30, 'INV20210513', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '245000', '0', '0', '245000', '0', '5000', '1', '2021-05-14 08:14:40', '2021-05-14 08:14:40', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(31, 'INV20210514', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '235000', '0', '0', '235000', '0', '15000', '1', '2021-05-14 08:17:29', '2021-05-14 08:17:29', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(32, 'INV20210515', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '147900', '0', '0', '147900', '2900', '2900', '1', '2021-05-14 09:19:01', '2021-05-14 09:19:01', 'MK-2021-1', '1', '2', '0', 0, '2021/05/14'),
(33, 'INV20210516', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '445000', '0', '0', '445000', '0', '0', '1', '2021-05-14 09:23:22', '2021-05-14 09:23:22', 'MK-2021-1', '1', '2', '0', 0, '2021/05/14'),
(34, 'INV20210517', 'LF-2021-1', 'PL-2021-3', '2021/05/14', '413250', '0', '21750', '413250', '0', '0', '1', '2021-05-14 09:29:55', '2021-05-14 09:29:55', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(35, 'INV20210518', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '650000', '0', '0', '650000', '0', '0', '1', '2021-05-14 09:30:40', '2021-05-14 09:30:40', 'MK-2021-1', '1', '2', '0', 0, '2021/05/14'),
(36, 'INV20210519', 'LF-2021-1', 'PL-2021-1', '2021/05/14', '385000', '0', '0', '385000', '0', '15000', '1', '2021-05-14 09:33:59', '2021-05-14 09:33:59', 'MK-2021-1', '1', '1', '0', 0, '2021/05/14'),
(37, 'INV20210520', 'LF-2021-1', 'PL-2021-1', '2021/05/15', '370000', '0', '0', '370000', '0', '30000', '1', '2021-05-15 02:47:13', '2021-05-15 02:47:13', 'MK-2021-1', '1', '1', '0', 0, '2021/05/15'),
(38, 'INV20210521', 'LF-2021-1', 'PL-2021-1', '2021/05/20', '425000', '0', '0', '425000', '0', '25000', '1', '2021-05-20 01:14:25', '2021-05-20 01:14:25', 'MK-2021-1', '1', '1', '0', 0, '2021/05/20'),
(39, 'INV20210522', 'LF-2021-1', 'PL-2021-3', '2021/05/20', '289750', '0', '15250', '0', '0', '-289750', '1', '2021-05-20 01:15:03', '2021-05-21 08:30:14', 'MK-2021-1', '2', '1', '15', 0, '2021/06/04'),
(40, 'INV20210523', 'LF-2021-1', 'PL-2021-1', '2021/05/20', '205000', '0', '0', '0', '0', '-205000', '1', '2021-05-20 01:23:19', '2021-05-21 07:40:37', 'MK-2021-1', '2', '1', '15', 0, '2021/06/04'),
(41, 'INV20210524', 'LF-2021-1', 'PL-2021-1', '2021/05/21', '125000', '0', '0', '0', '0', '-125000', '1', '2021-05-21 07:39:44', '2021-05-21 07:40:37', 'MK-2021-1', '2', '1', '30', 100000, '2021/06/20'),
(42, 'INV20210525', 'LF-2021-1', 'PL-2021-1', '2021/05/21', '365000', '0', '0', '365000', '0', '35000', '1', '2021-05-21 08:24:16', '2021-05-21 08:24:16', 'MK-2021-1', '1', '1', '0', 0, '2021/05/21'),
(43, 'INV20210526', 'LF-2021-1', 'PL-2021-1', '2021/05/21', '193800', '0', '0', '193800', '3800', '3800', '1', '2021-05-21 08:26:16', '2021-05-21 08:26:16', 'MK-2021-1', '1', '2', '0', 0, '2021/05/21'),
(44, 'INV20210527', 'LF-2021-1', 'PL-2021-3', '2021/05/21', '465500', '0', '24500', '0', '0', '-465500', '1', '2021-05-21 08:29:02', '2021-05-21 08:31:09', 'MK-2021-1', '2', '1', '14', 260000, '2021/06/04'),
(45, 'INV20210528', 'LF-2021-1', 'PL-2021-1', '2021/05/21', '115000', '0', '0', '115000', '0', '5000', '1', '2021-05-21 09:10:23', '2021-05-21 09:10:23', 'MK-2021-1', '1', '1', '0', 0, '2021/05/21'),
(47, 'INV20210629', 'LF-2021-1', 'PL-2021-1', '2021/06/12', '145000', '0', '0', '145000', '0', '0', '1', '2021-06-12 02:01:12', '2021-06-12 02:01:12', 'MK-2021-1', '1', '1', '0', 0, '2021/06/12'),
(48, 'INV20210629', 'LF-2021-1', 'PL-2021-1', '2021/06/12', '145000', '0', '0', '145000', '0', '0', '1', '2021-06-12 02:01:13', '2021-06-12 02:01:13', 'MK-2021-1', '1', '1', '0', 0, '2021/06/12'),
(49, 'INV20210630', 'LF-2021-1', 'PL-2021-1', '2021/06/12', '385000', '0', '0', '385000', '0', '0', '1', '2021-06-12 02:03:14', '2021-06-12 02:03:14', 'MK-2021-1', '1', '1', '0', 0, '2021/06/12'),
(50, 'INV20210630', 'LF-2021-1', 'PL-2021-1', '2021/06/12', '385000', '0', '0', '385000', '0', '0', '1', '2021-06-12 02:07:56', '2021-06-12 02:07:56', 'MK-2021-1', '1', '1', '0', 0, '2021/06/12'),
(51, 'INV20210631', 'LF-2021-1', 'PL-2021-1', '2021/06/14', '590000', '0', '0', '590000', '0', '10000', '1', '2021-06-14 02:40:58', '2021-06-14 02:40:58', 'MK-2021-1', '1', '1', '0', 0, '2021/06/14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpenjualandetail`
--

CREATE TABLE `tblpenjualandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNotaPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tglPenjualan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarangJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblpenjualandetail`
--

INSERT INTO `tblpenjualandetail` (`id`, `noNotaPenjualan`, `kdBarang`, `hrgJual`, `qtyJual`, `satuanJual`, `totalJual`, `created_at`, `updated_at`, `tglPenjualan`, `nmBarangJual`) VALUES
(19, 'INV2021051', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 04:27:04', '2021-05-14 04:27:04', '2021/05/14', 'Busi'),
(20, 'INV2021052', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 04:30:50', '2021-05-14 04:30:50', '2021/05/14', 'Kampas Kopling'),
(21, 'INV2021053', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:31:57', '2021-05-14 04:31:57', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(22, 'INV2021054', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 04:32:16', '2021-05-14 04:32:16', '2021/05/14', 'Busi'),
(23, 'INV2021055', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-14 04:32:49', '2021-05-14 04:32:49', '2021/05/14', 'Kampas Rem Vario 110'),
(24, 'INV2021056', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 04:33:17', '2021-05-14 04:33:17', '2021/05/14', 'Busi'),
(25, 'INV2021057', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:34:53', '2021-05-14 04:34:53', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(26, 'INV2021058', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-14 04:35:14', '2021-05-14 04:35:14', '2021/05/14', 'Kampas Rem Vario 110'),
(27, 'INV2021059', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:35:30', '2021-05-14 04:35:30', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(28, 'INV20210510', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:36:02', '2021-05-14 04:36:02', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(29, 'INV20210511', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:37:21', '2021-05-14 04:37:21', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(30, 'INV20210511', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 04:37:27', '2021-05-14 04:37:27', '2021/05/14', 'Kampas Kopling'),
(31, 'INV20210512', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 04:37:58', '2021-05-14 04:37:58', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(32, 'INV20210512', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-14 04:38:00', '2021-05-14 04:38:00', '2021/05/14', 'Speedo Meter Vario'),
(34, 'INV20210513', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 08:14:10', '2021-05-14 08:14:10', '2021/05/14', 'Busi'),
(35, 'INV20210513', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 08:14:29', '2021-05-14 08:14:29', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(37, 'INV20210514', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 08:16:20', '2021-05-14 08:16:20', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(38, 'INV20210514', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 08:16:46', '2021-05-14 08:16:46', '2021/05/14', 'Busi'),
(39, 'INV20210514', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-14 08:16:52', '2021-05-14 08:16:52', '2021/05/14', 'Kampas Rem Vario 110'),
(44, 'INV20210515', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 09:18:24', '2021-05-14 09:18:24', '2021/05/14', 'Busi'),
(45, 'INV20210515', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-14 09:18:35', '2021-05-14 09:18:35', '2021/05/14', 'Kampas Rem Vario 110'),
(46, 'INV20210516', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 09:22:32', '2021-05-14 09:22:32', '2021/05/14', 'Kampas Kopling'),
(47, 'INV20210516', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-14 09:22:45', '2021-05-14 09:22:45', '2021/05/14', 'Kampas Rem Vario 110'),
(48, 'INV20210516', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 09:22:53', '2021-05-14 09:22:53', '2021/05/14', 'Busi'),
(49, 'INV20210517', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 09:29:12', '2021-05-14 09:29:12', '2021/05/14', 'Busi'),
(50, 'INV20210517', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 09:29:32', '2021-05-14 09:29:32', '2021/05/14', 'Kampas Kopling'),
(51, 'INV20210518', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 09:30:09', '2021-05-14 09:30:09', '2021/05/14', 'Kampas Kopling'),
(52, 'INV20210518', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-14 09:30:11', '2021-05-14 09:30:11', '2021/05/14', 'Rantai Standart Supra X 100CC'),
(53, 'INV20210518', 'DB-2021-5', '60000', '2', 'PCS', '120000', '2021-05-14 09:30:15', '2021-05-14 09:30:15', '2021/05/14', 'Speedo Meter Vario'),
(56, 'INV20210519', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-14 09:33:31', '2021-05-14 09:33:31', '2021/05/14', 'Kampas Kopling'),
(57, 'INV20210519', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-14 09:33:37', '2021-05-14 09:33:37', '2021/05/14', 'Busi'),
(58, 'INV20210520', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-15 02:46:57', '2021-05-15 02:46:57', '2021/05/15', 'Kampas Kopling'),
(59, 'INV20210521', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-20 01:14:03', '2021-05-20 01:14:03', '2021/05/20', 'Kampas Kopling'),
(60, 'INV20210521', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-20 01:14:05', '2021-05-20 01:14:05', '2021/05/20', 'Busi'),
(61, 'INV20210521', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-20 01:14:09', '2021-05-20 01:14:09', '2021/05/20', 'Speedo Meter Vario'),
(62, 'INV20210522', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-20 01:14:39', '2021-05-20 01:14:39', '2021/05/20', 'Speedo Meter Vario'),
(63, 'INV20210522', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-20 01:14:42', '2021-05-20 01:14:42', '2021/05/20', 'Busi'),
(64, 'INV20210522', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-05-20 01:14:45', '2021-05-20 01:14:45', '2021/05/20', 'Rantai Standart Supra X 100CC'),
(65, 'INV20210523', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-20 01:22:15', '2021-05-20 01:22:15', '2021/05/20', 'Busi'),
(66, 'INV20210523', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-20 01:22:22', '2021-05-20 01:22:22', '2021/05/20', 'Kampas Rem Vario 110'),
(67, 'INV20210523', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-20 01:22:28', '2021-05-20 01:22:28', '2021/05/20', 'Speedo Meter Vario'),
(68, 'INV20210524', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-21 07:39:25', '2021-05-21 07:39:25', '2021/05/21', 'Busi'),
(69, 'INV20210524', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-21 07:39:30', '2021-05-21 07:39:30', '2021/05/21', 'Speedo Meter Vario'),
(70, 'INV20210525', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-05-21 08:23:53', '2021-05-21 08:23:53', '2021/05/21', 'Busi'),
(71, 'INV20210525', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-21 08:24:03', '2021-05-21 08:24:03', '2021/05/21', 'Kampas Kopling'),
(72, 'INV20210526', 'DB-2021-5', '60000', '2', 'PCS', '120000', '2021-05-21 08:25:31', '2021-05-21 08:25:31', '2021/05/21', 'Speedo Meter Vario'),
(73, 'INV20210527', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-05-21 08:28:43', '2021-05-21 08:28:43', '2021/05/21', 'Kampas Kopling'),
(74, 'INV20210527', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-05-21 08:28:45', '2021-05-21 08:28:45', '2021/05/21', 'Kampas Rem Vario 110'),
(75, 'INV20210527', 'DB-2021-5', '60000', '1', 'PCS', '60000', '2021-05-21 08:28:48', '2021-05-21 08:28:48', '2021/05/21', 'Speedo Meter Vario'),
(76, 'INV20210528', 'DB-2021-8', '15000', '1', 'Botol', '15000', '2021-05-21 09:09:47', '2021-05-21 09:09:47', '2021/05/21', 'Oli Gardan'),
(77, 'INV20210528', 'DB-2021-9', '50000', '1', 'PCS', '50000', '2021-05-21 09:09:53', '2021-05-21 09:09:53', '2021/05/21', 'Ban Dalam'),
(83, 'INV20210630', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-06-12 02:02:47', '2021-06-12 02:02:47', '2021/06/12', 'Kampas Kopling'),
(84, 'INV20210630', 'DB-2021-2', '15000', '1', 'PCS', '15000', '2021-06-12 02:02:50', '2021-06-12 02:02:50', '2021/06/12', 'Busi'),
(85, 'INV20210631', 'DB-2021-1', '300000', '1', 'Box', '300000', '2021-06-14 02:40:29', '2021-06-14 02:40:29', '2021/06/14', 'Kampas Kopling'),
(86, 'INV20210631', 'DB-2021-3', '160000', '1', 'PCS', '160000', '2021-06-14 02:40:33', '2021-06-14 02:40:33', '2021/06/14', 'Rantai Standart Supra X 100CC'),
(87, 'INV20210631', 'DB-2021-4', '60000', '1', 'PCS', '60000', '2021-06-14 02:40:39', '2021-06-14 02:40:39', '2021/06/14', 'Kampas Rem Vario 110');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblsatuan`
--

CREATE TABLE `tblsatuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ktgSatuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtySatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblsetupharga`
--

CREATE TABLE `tblsetupharga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noHrg` int(5) NOT NULL,
  `codeHrg` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblsetupharga`
--

INSERT INTO `tblsetupharga` (`id`, `noHrg`, `codeHrg`, `created_at`, `updated_at`) VALUES
(1, 1, 'Z', NULL, '2021-06-23 08:27:58'),
(2, 2, 'B', NULL, '2021-06-23 08:27:58'),
(3, 3, 'C', NULL, '2021-06-23 08:27:58'),
(4, 4, 'D', NULL, '2021-06-23 08:27:58'),
(5, 5, 'E', NULL, '2021-06-23 08:27:58'),
(6, 6, 'F', NULL, '2021-06-23 08:27:59'),
(7, 7, 'G', NULL, '2021-06-23 08:27:59'),
(8, 8, 'H', NULL, '2021-06-23 08:27:59'),
(9, 9, 'I', NULL, '2021-06-23 08:27:59'),
(10, 0, 'X', NULL, '2021-06-23 08:27:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblstokopname`
--

CREATE TABLE `tblstokopname` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblstokopname`
--

INSERT INTO `tblstokopname` (`id`, `noStokOpname`, `tglStok`, `totalOpname`, `created_at`, `updated_at`) VALUES
(1, 'OP-2021-1', '2021/04/15', '-209000', '2021-04-15 03:12:32', '2021-04-15 03:12:32'),
(2, 'OP-2021-2', '2021/05/21', '650000', '2021-05-21 09:04:11', '2021-05-21 09:04:11'),
(3, 'OP-2021-3', '2021/05/21', '-25000', '2021-05-21 09:08:37', '2021-05-21 09:08:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblstokopnamedetail`
--

CREATE TABLE `tblstokopnamedetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyGudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selisihStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilaiStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblstokopnamedetail`
--

INSERT INTO `tblstokopnamedetail` (`id`, `noStokOpname`, `kdBarang`, `qtyGudang`, `selisihStok`, `keteranganStok`, `nilaiStok`, `satuanStok`, `created_at`, `updated_at`) VALUES
(1, 'OP-2021-1', 'DB-2021-1', '8', '-1', 'Untuk Ecer', '-200000', 'Box', '2021-04-15 03:12:11', '2021-04-15 03:12:11'),
(2, 'OP-2021-1', 'DB-2021-2', '12', '-1', 'Untuk Ecer', '-9000', 'PCS', '2021-04-15 03:12:28', '2021-04-15 03:12:28'),
(4, 'OP-2021-2', 'DB-2021-8', '10', '10', 'Stok Awal', '50000', 'Botol', '2021-05-21 09:03:58', '2021-05-21 09:03:58'),
(5, 'OP-2021-2', 'DB-2021-9', '20', '20', 'Stok Awal', '600000', 'PCS', '2021-05-21 09:04:07', '2021-05-21 09:04:07'),
(6, 'OP-2021-3', 'DB-2021-8', '15', '-5', 'Hilang', '-25000', 'Botol', '2021-05-21 09:08:34', '2021-05-21 09:08:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `kdSupplier`, `nmSupplier`, `almtSupplier`, `noHp`, `kontakSupplier`, `created_at`, `updated_at`) VALUES
(1, 'SP-2021-1', 'Dwi JAti Motor Ku', 'Panjer', '098767', 'Andi', '2021-04-06 10:44:17', '2021-04-15 03:13:42'),
(2, 'SP-2021-2', 'Adi Raya', 'P. Batam', '56546', 'BUdi', '2021-04-15 03:13:25', '2021-04-15 03:13:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltahunmotor`
--

CREATE TABLE `tbltahunmotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMerek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdJenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdTahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmTahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbltahunmotor`
--

INSERT INTO `tbltahunmotor` (`id`, `kdMerek`, `kdType`, `kdJenis`, `kdTahun`, `nmTahun`, `created_at`, `updated_at`) VALUES
(4, 'MTR003', 'MTY002', 'MTJ005', 'TH003', '2013', '2021-06-22 01:36:21', '2021-06-22 01:36:21'),
(5, 'MTR001', 'VR001', 'MTJ001', 'TH004', '2008', '2021-06-22 01:41:49', '2021-06-22 01:41:49'),
(6, 'MTR001', 'VR001', 'MTJ001', 'TH009', '2009', '2021-06-22 01:42:16', '2021-06-22 01:42:16'),
(7, 'MTR004', 'MTY003', 'MTJ006', 'TH005', '2014', '2021-06-22 01:51:13', '2021-06-22 01:51:13'),
(8, 'MTR002', 'MI001', 'MTJ003', 'TH006', '2015', '2021-06-22 01:55:01', '2021-06-22 01:55:01'),
(9, 'MTR001', 'MTY004', 'MTJ001', 'TH007', '2014', '2021-06-22 01:59:59', '2021-06-22 01:59:59'),
(10, 'MTR001', 'MTY004', 'MTJ001', 'TH007', '2017', '2021-06-22 02:00:12', '2021-06-22 02:00:12'),
(11, 'MTR001', 'MTY006', 'MTJ002', 'TH008', '2010', '2021-06-23 01:34:24', '2021-06-23 01:34:24'),
(12, 'MTR001', 'VR001', 'MTJ001', 'TH0010', '2013', '2021-06-23 03:14:03', '2021-06-23 03:14:03'),
(13, 'MTR002', 'MI001', 'MTJ003', 'TH0011', '2014', '2021-06-23 03:15:22', '2021-06-23 03:15:22'),
(14, 'MTR002', 'NM001', 'MTJ003', 'TH0012', '2014', '2021-06-23 03:18:03', '2021-06-23 03:18:03'),
(15, 'MTR002', 'MTY007', 'MTJ003', 'TH0013', '2007', '2021-06-23 03:19:04', '2021-06-23 03:19:04'),
(16, 'MTR002', 'MTY008', 'MTJ003', 'TH0014', '2015', '2021-06-23 08:24:44', '2021-06-23 08:24:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltmp_transaksidetail`
--

CREATE TABLE `tbltmp_transaksidetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNotaTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMejaTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJualTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltmp_transaksis`
--

CREATE TABLE `tbltmp_transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltypemotor`
--

CREATE TABLE `tbltypemotor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kdMerek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdJenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbltypemotor`
--

INSERT INTO `tbltypemotor` (`id`, `kdMerek`, `kdJenis`, `kdType`, `nmType`, `created_at`, `updated_at`) VALUES
(1, 'MTR001', 'MTJ001', 'VR001', 'VARIO 110', NULL, NULL),
(2, 'MTR001', 'MTJ001', 'BT001', 'Beat 110', NULL, NULL),
(3, 'MTR002', 'MTJ003', 'MI001', 'MIO 110', NULL, NULL),
(4, 'MTR002', 'MTJ003', 'NM001', 'N MAX 150', NULL, NULL),
(5, 'MTR003', 'MTJ005', 'MTY002', 'SUZUKI NEXT FI', '2021-06-22 01:13:02', '2021-06-22 01:13:02'),
(6, 'MTR004', 'MTJ006', 'MTY003', 'NINJA 250 CC', '2021-06-22 01:49:24', '2021-06-22 01:49:24'),
(7, 'MTR001', 'MTJ001', 'MTY004', 'SCOOPY', '2021-06-22 01:57:41', '2021-06-22 01:57:41'),
(8, 'MTR001', 'MTJ001', 'MTY004', 'SPACY', '2021-06-22 01:57:59', '2021-06-22 01:57:59'),
(9, 'MTR004', 'MTJ007', 'MTY005', 'KAZE R', '2021-06-22 02:05:51', '2021-06-22 02:05:51'),
(10, 'MTR001', 'MTJ002', 'MTY006', 'SUPRA X 125', '2021-06-23 01:34:00', '2021-06-23 01:34:00'),
(11, 'MTR002', 'MTJ003', 'MTY007', 'MIO SOUL', '2021-06-23 03:18:43', '2021-06-23 03:18:43'),
(12, 'MTR002', 'MTJ003', 'MTY008', 'LEXI 150', '2021-06-23 08:24:23', '2021-06-23 08:24:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `role`, `email`, `password`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'Admin', 'admi', '$2y$10$V3fQLE3PlC1uv6s0WTgjoOVQZIMl8XfjXTXo1367wsyQeTCaLAJ5q', NULL, '2021-04-05 07:43:07', '2021-04-05 07:43:07'),
(2, 'wawan', 'wawan', 'Admin', 'admin@admin.com', '$2y$10$z1ZZc0gn75MKjN/.2800YeN3MmvaSyMcuhwpeAQ5EqJ3adbeuiydu', NULL, '2021-05-21 09:16:29', '2021-05-21 09:16:29'),
(3, 'a', 'a', 'Admin', 'a', '$2y$10$2.Ry8tyZS2jim1kwGBzUO.j3NYKRPBUXdS6NFW6cRu.az9rP7jFP.', NULL, '2021-05-21 09:24:05', '2021-05-21 09:24:05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_prov`) USING BTREE;

--
-- Indeks untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbldetailjasajual`
--
ALTER TABLE `tbldetailjasajual`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbldetailkatalog`
--
ALTER TABLE `tbldetailkatalog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbldetailpartmotor`
--
ALTER TABLE `tbldetailpartmotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblgrandbeli`
--
ALTER TABLE `tblgrandbeli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblgrandbelidetail`
--
ALTER TABLE `tblgrandbelidetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblgrandjual`
--
ALTER TABLE `tblgrandjual`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblgrandjualdetail`
--
ALTER TABLE `tblgrandjualdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbljasa`
--
ALTER TABLE `tbljasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbljenismotor`
--
ALTER TABLE `tbljenismotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblkartustok`
--
ALTER TABLE `tblkartustok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblkatspmotor`
--
ALTER TABLE `tblkatspmotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblkomposisi`
--
ALTER TABLE `tblkomposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbllift`
--
ALTER TABLE `tbllift`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblmekanik`
--
ALTER TABLE `tblmekanik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblmerekmotor`
--
ALTER TABLE `tblmerekmotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblmotor`
--
ALTER TABLE `tblmotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpembayaran`
--
ALTER TABLE `tblpembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpembelian`
--
ALTER TABLE `tblpembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpembeliandetail`
--
ALTER TABLE `tblpembeliandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblpenjualandetail`
--
ALTER TABLE `tblpenjualandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblsatuan`
--
ALTER TABLE `tblsatuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblsetupharga`
--
ALTER TABLE `tblsetupharga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblstokopname`
--
ALTER TABLE `tblstokopname`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblstokopnamedetail`
--
ALTER TABLE `tblstokopnamedetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltahunmotor`
--
ALTER TABLE `tbltahunmotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltmp_transaksidetail`
--
ALTER TABLE `tbltmp_transaksidetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltmp_transaksis`
--
ALTER TABLE `tbltmp_transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltypemotor`
--
ALTER TABLE `tbltypemotor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbldetailjasajual`
--
ALTER TABLE `tbldetailjasajual`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `tbldetailkatalog`
--
ALTER TABLE `tbldetailkatalog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbldetailpartmotor`
--
ALTER TABLE `tbldetailpartmotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tblgrandbeli`
--
ALTER TABLE `tblgrandbeli`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tblgrandbelidetail`
--
ALTER TABLE `tblgrandbelidetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tblgrandjual`
--
ALTER TABLE `tblgrandjual`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tblgrandjualdetail`
--
ALTER TABLE `tblgrandjualdetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbljasa`
--
ALTER TABLE `tbljasa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbljenismotor`
--
ALTER TABLE `tbljenismotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tblkartustok`
--
ALTER TABLE `tblkartustok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT untuk tabel `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tblkatspmotor`
--
ALTER TABLE `tblkatspmotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tblkomposisi`
--
ALTER TABLE `tblkomposisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbllift`
--
ALTER TABLE `tbllift`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblmekanik`
--
ALTER TABLE `tblmekanik`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tblmerekmotor`
--
ALTER TABLE `tblmerekmotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tblmotor`
--
ALTER TABLE `tblmotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tblpembayaran`
--
ALTER TABLE `tblpembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tblpembelian`
--
ALTER TABLE `tblpembelian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tblpembeliandetail`
--
ALTER TABLE `tblpembeliandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `tblpenjualandetail`
--
ALTER TABLE `tblpenjualandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT untuk tabel `tblsatuan`
--
ALTER TABLE `tblsatuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tblsetupharga`
--
ALTER TABLE `tblsetupharga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tblstokopname`
--
ALTER TABLE `tblstokopname`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tblstokopnamedetail`
--
ALTER TABLE `tblstokopnamedetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbltahunmotor`
--
ALTER TABLE `tbltahunmotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbltmp_transaksidetail`
--
ALTER TABLE `tbltmp_transaksidetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbltmp_transaksis`
--
ALTER TABLE `tbltmp_transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbltypemotor`
--
ALTER TABLE `tbltypemotor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
