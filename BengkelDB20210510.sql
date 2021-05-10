-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: bengkelDB
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_resets_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2021_01_02_012505_create_barangs_table',1),(4,'2021_01_02_025846_create_suppliers_table',1),(5,'2021_01_02_233418_create_kategoris_table',1),(6,'2021_01_03_000733_satuan',1),(10,'2021_02_05_061214_create_transaksis_table',1),(11,'2021_02_08_162955_create_penjualans_table',1),(12,'2021_02_12_082257_pembelian',1),(13,'2021_02_12_113120_pembelian_detail',1),(14,'2021_02_21_073842_kartustok',1),(15,'2021_02_27_174740_users',1),(16,'2021_03_02_091025_stokopname',1),(17,'2021_03_02_174311_create_stok_opname_details_table',1),(18,'2021_03_04_115835_tmp_penjualan_detail',1),(19,'2021_03_19_215018_create_inventoris_table',1),(20,'2021_03_22_114649_create_kartu_stok_inventoris_table',1),(21,'2021_04_05_155901_create_pelanggans_table',2),(22,'2021_04_05_172059_penjualan_detail',3),(23,'2021_05_07_164227_create_motors_table',4),(24,'2021_05_07_163415_create_mekaniks_table',5),(25,'2021_04_13_201357_create_grand_juals_table',6),(26,'2021_04_13_201603_grand_jual_detail',7),(27,'2021_05_07_164505_create_lifts_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBarang`
--

DROP TABLE IF EXISTS `tblBarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblBarang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBarang`
--

LOCK TABLES `tblBarang` WRITE;
/*!40000 ALTER TABLE `tblBarang` DISABLE KEYS */;
INSERT INTO `tblBarang` VALUES (1,'DB-2021-1','123456','Kampas Kopling',200000,300000,'KT-2021-1','NGK','3',NULL,'2','20','jjjhuh','2021-03-26 11:23:36','2021-05-09 12:29:30','Box'),(2,'DB-2021-2','123','Busi',9000,15000,'KT-2021-1','NGK','20',NULL,'2','4','Busi Ngk','2021-04-06 10:42:47','2021-05-09 12:29:48','PCS'),(3,'DB-2021-3','1234568766','Rantai Standart Supra X 100CC',90000,160000,'KT-2021-1','Aspira','-1',NULL,'2','100','Rantai Standart','2021-04-15 05:26:03','2021-04-15 05:26:03','PCS'),(5,'DB-2021-4','0987654321','Kampas Rem Vario 110',50000,60000,'KT-2021-1','Aspira','0',NULL,'2','100','Kampas Rem Maut','2021-04-15 05:29:06','2021-04-15 05:29:06','PCS'),(6,'DB-2021-5','234','Speedo Meter Vario',50000,60000,'KT-2021-1','Aspira','-2',NULL,'2','100','Kampas Rem Maut','2021-04-15 05:29:50','2021-04-15 05:34:34','PCS');
/*!40000 ALTER TABLE `tblBarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblGrandJual`
--

DROP TABLE IF EXISTS `tblGrandJual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblGrandJual` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodePelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblGrandJual`
--

LOCK TABLES `tblGrandJual` WRITE;
/*!40000 ALTER TABLE `tblGrandJual` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblGrandJual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblGrandJualDetail`
--

DROP TABLE IF EXISTS `tblGrandJualDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblGrandJualDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noNotaPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembayaranGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userGrandJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblGrandJualDetail`
--

LOCK TABLES `tblGrandJualDetail` WRITE;
/*!40000 ALTER TABLE `tblGrandJualDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblGrandJualDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKartuStok`
--

DROP TABLE IF EXISTS `tblKartuStok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKartuStok` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyMasuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyKeluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanKartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKartuStok`
--

LOCK TABLES `tblKartuStok` WRITE;
/*!40000 ALTER TABLE `tblKartuStok` DISABLE KEYS */;
INSERT INTO `tblKartuStok` VALUES (13,'DB-2021-1','2021/04/06','0','1','INV-2021-1','Penjualan','Box','2021-04-06 00:32:12','2021-04-06 00:32:12'),(14,'DB-2021-2','2021/04/06','20','0','PB-2021-1','Pembelian','PCS','2021-04-06 10:43:28','2021-04-06 10:43:28'),(15,'DB-2021-1','2021/04/06','20','0','PB-2021-1','Pembelian','Box','2021-04-06 10:44:35','2021-04-06 10:44:35'),(26,'DB-2021-1','2021/04/06','0','2','INV-2021-5','Penjualan','Box','2021-04-06 23:58:06','2021-04-06 23:58:06'),(28,'DB-2021-1','2021/04/12','2','0','PB-2021-2','Pembelian','Box','2021-04-12 00:06:09','2021-04-12 00:06:09'),(29,'DB-2021-2','2021/04/12','3','0','PB-2021-2','Pembelian','PCS','2021-04-12 00:06:21','2021-04-12 00:06:21'),(31,'DB-2021-1','2021/04/15','0','-1','OP-2021-1','Stok Opname-Untuk Ecer','Box','2021-04-15 03:12:11','2021-04-15 03:12:11'),(32,'DB-2021-2','2021/04/15','0','-1','OP-2021-1','Stok Opname-Untuk Ecer','PCS','2021-04-15 03:12:28','2021-04-15 03:12:28'),(35,'DB-2021-1','2021/04/15','2','0','PB-2021-3','Pembelian','Box','2021-04-15 03:19:30','2021-04-15 03:19:30'),(36,'DB-2021-2','2021/04/15','3','0','PB-2021-4','Pembelian','PCS','2021-04-15 03:27:34','2021-04-15 03:27:34'),(37,'DB-2021-1','2021/04/15','2','0','PB-2021-5','Pembelian','Box','2021-04-15 04:12:57','2021-04-15 04:12:57'),(38,'DB-2021-2','2021/04/15','4','0','PB-2021-6','Pembelian','PCS','2021-04-15 04:13:36','2021-04-15 04:13:36'),(39,'DB-2021-2','2021/04/15','0','1','INV-2021-7','Penjualan','PCS','2021-04-15 04:14:44','2021-04-15 04:14:44'),(42,'DB-2021-1','2021/04/15','0','2','INV-2021-9','Penjualan','Box','2021-04-15 04:24:40','2021-04-15 04:24:40'),(43,'DB-2021-1','2021/04/15','0','2','INV-2021-10','Penjualan','Box','2021-04-15 04:26:36','2021-04-15 04:26:36'),(44,'DB-2021-1','2021/04/15','0','2','INV-2021-11','Penjualan','Box','2021-04-15 04:31:10','2021-04-15 04:31:10'),(45,'DB-2021-5','2021/04/16','1','0','PB-2021-7','Pembelian','PCS','2021-04-16 22:55:31','2021-04-16 22:55:31'),(46,'DB-2021-2','2021/04/16','1','0','PB-2021-7','Pembelian','PCS','2021-04-16 22:55:43','2021-04-16 22:55:43'),(51,'DB-2021-1','2021/05/07','0','1','INV-2021-2','Penjualan','Box','2021-05-07 12:36:19','2021-05-07 12:36:19'),(52,'DB-2021-2','2021/05/07','0','1','INV-2021-2','Penjualan','PCS','2021-05-07 12:36:28','2021-05-07 12:36:28'),(60,'DB-2021-5','2021/05/09','0','1','INV-2021-3','Penjualan','PCS','2021-05-09 02:32:56','2021-05-09 02:32:56'),(61,'DB-2021-3','2021/05/09','0','1','INV-2021-3','Penjualan','PCS','2021-05-09 02:35:34','2021-05-09 02:35:34'),(62,'DB-2021-2','2021/05/09','0','2','INV-2021-4','Penjualan','PCS','2021-05-09 11:12:26','2021-05-09 11:12:26'),(64,'DB-2021-2','2021/05/09','0','1','INV-2021-6','Penjualan','PCS','2021-05-09 11:15:29','2021-05-09 11:15:29'),(65,'DB-2021-5','2021/05/09','0','1','INV-2021-6','Penjualan','PCS','2021-05-09 11:15:35','2021-05-09 11:15:35'),(69,'DB-2021-2','2021/05/10','0','2','INV-2021-8','Penjualan','PCS','2021-05-10 00:04:17','2021-05-10 00:04:17'),(70,'DB-2021-5','2021/05/10','0','1','INV-2021-8','Penjualan','PCS','2021-05-10 00:04:21','2021-05-10 00:04:21'),(71,'DB-2021-1','2021/05/10','0','1','INV-2021-8','Penjualan','Box','2021-05-10 00:04:28','2021-05-10 00:04:28'),(72,'DB-2021-2','2021/05/10','0','3','INV-2021-10','Penjualan','PCS','2021-05-10 00:18:32','2021-05-10 00:18:32');
/*!40000 ALTER TABLE `tblKartuStok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKategori`
--

DROP TABLE IF EXISTS `tblKategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKategori` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kodeKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaKtg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKategori`
--

LOCK TABLES `tblKategori` WRITE;
/*!40000 ALTER TABLE `tblKategori` DISABLE KEYS */;
INSERT INTO `tblKategori` VALUES (1,'KT-2021-1','Spare PArt','2021-03-26 11:20:43','2021-04-15 03:10:33'),(2,'KT-2021-2','OLI Gardan','2021-04-15 03:03:08','2021-04-15 03:10:56'),(3,'KT-2021-3','OLi Mesin','2021-04-15 03:10:43','2021-04-15 03:10:43');
/*!40000 ALTER TABLE `tblKategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKomposisi`
--

DROP TABLE IF EXISTS `tblKomposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblKomposisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idMenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBarang` double NOT NULL,
  `satuanBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hargaBarang` double NOT NULL,
  `totalBarang` double NOT NULL,
  `totalSatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKomposisi`
--

LOCK TABLES `tblKomposisi` WRITE;
/*!40000 ALTER TABLE `tblKomposisi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblKomposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblLift`
--

DROP TABLE IF EXISTS `tblLift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblLift` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mekanikLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusLift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblLift`
--

LOCK TABLES `tblLift` WRITE;
/*!40000 ALTER TABLE `tblLift` DISABLE KEYS */;
INSERT INTO `tblLift` VALUES (1,'LF-2021-1','1','-','0','2021-05-09 23:43:50','2021-05-09 23:43:50'),(2,'LF-2021-2','2','-','0','2021-05-09 23:44:54','2021-05-09 23:44:54'),(3,'LF-2021-3','3','-','0','2021-05-09 23:45:00','2021-05-09 23:45:00'),(4,'LF-2021-4','4','-','0','2021-05-09 23:45:09','2021-05-09 23:47:34');
/*!40000 ALTER TABLE `tblLift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMekanik`
--

DROP TABLE IF EXISTS `tblMekanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblMekanik` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamatMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTlpMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatanMekanik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMekanik`
--

LOCK TABLES `tblMekanik` WRITE;
/*!40000 ALTER TABLE `tblMekanik` DISABLE KEYS */;
INSERT INTO `tblMekanik` VALUES (1,'MK-2021-1','None','-','-','-','2021-05-09 06:31:28','2021-05-09 11:53:09'),(2,'MK-2021-2','Andi','Sesetan','868678','Mekanik','2021-05-09 06:34:13','2021-05-09 06:34:13'),(3,'MK-2021-3','Gede','Gianyar','7687','Mekanik','2021-05-09 06:36:06','2021-05-09 06:36:06'),(4,'MK-2021-4','ketut','Badung','554534543','Mekanik','2021-05-09 06:36:21','2021-05-09 06:58:28');
/*!40000 ALTER TABLE `tblMekanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMotor`
--

DROP TABLE IF EXISTS `tblMotor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblMotor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilikMotor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMotor`
--

LOCK TABLES `tblMotor` WRITE;
/*!40000 ALTER TABLE `tblMotor` DISABLE KEYS */;
INSERT INTO `tblMotor` VALUES (1,'MT-2021-1','0000','Motor','PL-2021-1','2021-05-09 01:01:37','2021-05-09 01:56:37'),(2,'MT-2021-2','DK 1234 QA','Scoopy','PL-2021-3','2021-05-09 02:02:53','2021-05-09 02:02:53'),(3,'MT-2021-3','DK 3434 QW','PCX','PL-2021-3','2021-05-09 02:03:19','2021-05-09 02:03:19');
/*!40000 ALTER TABLE `tblMotor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPelanggan`
--

DROP TABLE IF EXISTS `tblPelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPelanggan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kodePelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaPelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamatPelanggan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTlp` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `diskonPelanggan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPelanggan`
--

LOCK TABLES `tblPelanggan` WRITE;
/*!40000 ALTER TABLE `tblPelanggan` DISABLE KEYS */;
INSERT INTO `tblPelanggan` VALUES (1,'PL-2021-1','Cash','Denpasar','081',NULL,'2021-05-09 02:14:50','0'),(2,'PL-2021-2','Rihan UUU','Badung','09887578','2021-04-05 08:56:46','2021-05-09 02:14:43','0'),(3,'PL-2021-3','Nengah','Karangasem','987668','2021-04-15 03:14:05','2021-05-09 02:14:04','10');
/*!40000 ALTER TABLE `tblPelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPembelian`
--

DROP TABLE IF EXISTS `tblPembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPembelian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelian`
--

LOCK TABLES `tblPembelian` WRITE;
/*!40000 ALTER TABLE `tblPembelian` DISABLE KEYS */;
INSERT INTO `tblPembelian` VALUES (4,'SP-2021-2','PB-2021-4','2021/04/15','27000','1','2021-04-15 03:28:49','2021-04-15 03:28:49','2','14','20000','7000'),(5,'SP-2021-2','PB-2021-5','2021/04/15','400000','1','2021-04-15 04:13:12','2021-04-15 04:13:12','1','0','0','400000'),(6,'SP-2021-1','PB-2021-6','2021/04/15','36000','1','2021-04-15 04:13:48','2021-04-15 04:13:48','2','14','26000','10000'),(7,'SP-2021-2','PB-2021-7','2021/04/16','59000','1','2021-04-16 22:56:03','2021-04-16 22:56:03','1','0','-1000','60000');
/*!40000 ALTER TABLE `tblPembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPembelianDetail`
--

DROP TABLE IF EXISTS `tblPembelianDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPembelianDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaPembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgPokok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalBeli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPembelianDetail`
--

LOCK TABLES `tblPembelianDetail` WRITE;
/*!40000 ALTER TABLE `tblPembelianDetail` DISABLE KEYS */;
INSERT INTO `tblPembelianDetail` VALUES (8,'PB-2021-4','DB-2021-2','9000','3','27000','2021-04-15 03:27:34','2021-04-15 03:27:34'),(9,'PB-2021-5','DB-2021-1','200000','2','400000','2021-04-15 04:12:57','2021-04-15 04:12:57'),(10,'PB-2021-6','DB-2021-2','9000','4','36000','2021-04-15 04:13:36','2021-04-15 04:13:36'),(11,'PB-2021-7','DB-2021-5','50000','1','50000','2021-04-16 22:55:31','2021-04-16 22:55:31'),(12,'PB-2021-7','DB-2021-2','9000','1','9000','2021-04-16 22:55:43','2021-04-16 22:55:43');
/*!40000 ALTER TABLE `tblPembelianDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPenjualan`
--

DROP TABLE IF EXISTS `tblPenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPenjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `liftNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mekanikNota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piutangNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jthTempoNota` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualan`
--

LOCK TABLES `tblPenjualan` WRITE;
/*!40000 ALTER TABLE `tblPenjualan` DISABLE KEYS */;
INSERT INTO `tblPenjualan` VALUES (6,'INV-2021-5','1','PL-2021-2','2021/04/06','600000','0','0','100000','-500000','1','2021-04-06 23:58:27','2021-04-06 23:58:27','mekanik 1','2','30','500000',NULL),(7,'INV-2021-6','1','PL-2021-2','2021/04/09','300000','0','0','300000','0','1','2021-04-09 00:11:30','2021-04-09 00:11:30','mekanik 1','1','0','0',NULL),(8,'INV-2021-7','1','PL-2021-3','2021/04/15','15000','0','0','15000','0','1','2021-04-15 04:14:57','2021-04-15 04:14:57','mekanik 1','1','0','0',NULL),(9,'INV-2021-8','1','PL-2021-3','2021/04/15','675000','0','0','100000','-575000','1','2021-04-15 04:15:52','2021-04-15 04:15:52','mekanik 1','2','14','575000',NULL),(10,'INV-2021-9','1','PL-2021-3','2021/04/15','600000','0','0','100000','-500000','1','2021-04-15 04:25:42','2021-04-15 04:25:42','mekanik 1','2','14','500000',NULL),(11,'INV-2021-10','1','PL-2021-3','2021/04/15','600000','0','0','50000','-550000','1','2021-04-15 04:26:49','2021-04-15 04:26:49','mekanik 1','2','14','550000',NULL),(12,'INV-2021-11','1','PL-2021-3','2021/04/15','600000','0','0','600000','0','1','2021-04-15 04:33:23','2021-04-15 04:33:23','mekanik 1','1','0','0',NULL),(13,'INV-2021-2','1','PL-2021-1','2021/05/07','315000','0','0','350000','35000','1','2021-05-07 12:37:36','2021-05-07 12:37:36','mekanik 1','1','0','0',NULL),(14,'INV-2021-3','1','PL-2021-3','2021/05/09','198000','0','22000','200000','2000','1','2021-05-09 02:35:59','2021-05-09 02:35:59','mekanik 1','1','0','0',NULL),(15,'INV-2021-4','1','PL-2021-3','2021/05/09','837000','0','93000','837000','0','1','2021-05-09 11:13:15','2021-05-09 11:13:15','MK-2021-2','1','0','0',NULL),(16,'INV-2021-6','1','PL-2021-3','2021/05/09','75000','0','0','0','-75000','1','2021-05-09 11:16:08','2021-05-09 11:16:08','MK-2021-1','2','14','75000',NULL),(17,'INV-2021-8','LF-2021-1','PL-2021-1','2021/05/10','390000','0','0','390000','0','1','2021-05-10 00:04:57','2021-05-10 00:04:57','MK-2021-1','1','0','0',NULL);
/*!40000 ALTER TABLE `tblPenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPenjualanDetail`
--

DROP TABLE IF EXISTS `tblPenjualanDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblPenjualanDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaPenjualan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalJual` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tglPenjualan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPenjualanDetail`
--

LOCK TABLES `tblPenjualanDetail` WRITE;
/*!40000 ALTER TABLE `tblPenjualanDetail` DISABLE KEYS */;
INSERT INTO `tblPenjualanDetail` VALUES (26,'INV-2021-5','DB-2021-1','300000','2','Box','600000','2021-04-06 23:58:06','2021-04-06 23:58:06','2021/04/06'),(29,'INV-2021-7','DB-2021-2','15000','1','PCS','15000','2021-04-15 04:14:44','2021-04-15 04:14:44','2021/04/15'),(32,'INV-2021-9','DB-2021-1','300000','2','Box','600000','2021-04-15 04:24:40','2021-04-15 04:24:40','2021/04/15'),(33,'INV-2021-10','DB-2021-1','300000','2','Box','600000','2021-04-15 04:26:36','2021-04-15 04:26:36','2021/04/15'),(34,'INV-2021-11','DB-2021-1','300000','2','Box','600000','2021-04-15 04:31:10','2021-04-15 04:31:10','2021/04/15'),(35,'INV-2021-2','DB-2021-1','300000','1','Box','300000','2021-05-07 12:36:19','2021-05-07 12:36:19','2021/05/07'),(36,'INV-2021-2','DB-2021-2','15000','1','PCS','15000','2021-05-07 12:36:28','2021-05-07 12:36:28','2021/05/07'),(44,'INV-2021-3','DB-2021-5','60000','1','PCS','60000','2021-05-09 02:32:56','2021-05-09 02:32:56','2021/05/09'),(45,'INV-2021-3','DB-2021-3','160000','1','PCS','160000','2021-05-09 02:35:34','2021-05-09 02:35:34','2021/05/09'),(46,'INV-2021-4','DB-2021-1','300000','3','Box','900000','2021-05-09 07:12:10','2021-05-09 07:12:10','2021/05/09'),(47,'INV-2021-4','DB-2021-2','15000','2','PCS','30000','2021-05-09 11:12:26','2021-05-09 11:12:26','2021/05/09'),(49,'INV-2021-6','DB-2021-2','15000','1','PCS','15000','2021-05-09 11:15:29','2021-05-09 11:15:29','2021/05/09'),(50,'INV-2021-6','DB-2021-5','60000','1','PCS','60000','2021-05-09 11:15:35','2021-05-09 11:15:35','2021/05/09'),(54,'INV-2021-8','DB-2021-2','15000','2','PCS','30000','2021-05-10 00:04:17','2021-05-10 00:04:17','2021/05/10'),(55,'INV-2021-8','DB-2021-5','60000','1','PCS','60000','2021-05-10 00:04:21','2021-05-10 00:04:21','2021/05/10'),(56,'INV-2021-8','DB-2021-1','300000','1','Box','300000','2021-05-10 00:04:28','2021-05-10 00:04:28','2021/05/10'),(57,'INV-2021-10','DB-2021-2','15000','3','PCS','45000','2021-05-10 00:18:32','2021-05-10 00:18:32','2021/05/10');
/*!40000 ALTER TABLE `tblPenjualanDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSatuan`
--

DROP TABLE IF EXISTS `tblSatuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblSatuan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ktgSatuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtySatuan` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSatuan`
--

LOCK TABLES `tblSatuan` WRITE;
/*!40000 ALTER TABLE `tblSatuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblSatuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblStokOpname`
--

DROP TABLE IF EXISTS `tblStokOpname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblStokOpname` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpname`
--

LOCK TABLES `tblStokOpname` WRITE;
/*!40000 ALTER TABLE `tblStokOpname` DISABLE KEYS */;
INSERT INTO `tblStokOpname` VALUES (1,'OP-2021-1','2021/04/15','-209000','2021-04-15 03:12:32','2021-04-15 03:12:32');
/*!40000 ALTER TABLE `tblStokOpname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblStokOpnameDetail`
--

DROP TABLE IF EXISTS `tblStokOpnameDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblStokOpnameDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noStokOpname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyGudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selisihStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keteranganStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilaiStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanStok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblStokOpnameDetail`
--

LOCK TABLES `tblStokOpnameDetail` WRITE;
/*!40000 ALTER TABLE `tblStokOpnameDetail` DISABLE KEYS */;
INSERT INTO `tblStokOpnameDetail` VALUES (1,'OP-2021-1','DB-2021-1','8','-1','Untuk Ecer','-200000','Box','2021-04-15 03:12:11','2021-04-15 03:12:11'),(2,'OP-2021-1','DB-2021-2','12','-1','Untuk Ecer','-9000','PCS','2021-04-15 03:12:28','2021-04-15 03:12:28');
/*!40000 ALTER TABLE `tblStokOpnameDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSupplier`
--

DROP TABLE IF EXISTS `tblSupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblSupplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kdSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontakSupplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSupplier`
--

LOCK TABLES `tblSupplier` WRITE;
/*!40000 ALTER TABLE `tblSupplier` DISABLE KEYS */;
INSERT INTO `tblSupplier` VALUES (1,'SP-2021-1','Dwi JAti Motor Ku','Panjer','098767','Andi','2021-04-06 10:44:17','2021-04-15 03:13:42'),(2,'SP-2021-2','Adi Raya','P. Batam','56546','BUdi','2021-04-15 03:13:25','2021-04-15 03:13:25');
/*!40000 ALTER TABLE `tblSupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTmp_TransaksiDetail`
--

DROP TABLE IF EXISTS `tblTmp_TransaksiDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblTmp_TransaksiDetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noMejaTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJualTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarangTmp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTmp_TransaksiDetail`
--

LOCK TABLES `tblTmp_TransaksiDetail` WRITE;
/*!40000 ALTER TABLE `tblTmp_TransaksiDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTmp_TransaksiDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTmp_Transaksis`
--

DROP TABLE IF EXISTS `tblTmp_Transaksis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblTmp_Transaksis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTmp_Transaksis`
--

LOCK TABLES `tblTmp_Transaksis` WRITE;
/*!40000 ALTER TABLE `tblTmp_Transaksis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblTmp_Transaksis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','Admin','admi','$2y$10$V3fQLE3PlC1uv6s0WTgjoOVQZIMl8XfjXTXo1367wsyQeTCaLAJ5q',NULL,'2021-04-05 07:43:07','2021-04-05 07:43:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-10  8:24:10
