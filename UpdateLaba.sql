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
-- Table structure for table `tblpenjualan`
--

DROP TABLE IF EXISTS `tblpenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpenjualan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `liftNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelangganNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskonNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bayarNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargeNota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kembalianNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mekanikNota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeNota` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeBayarNota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `termNota` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piutangNota` int(45) DEFAULT NULL,
  `jthTempoNota` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalPokok` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualan`
--

LOCK TABLES `tblpenjualan` WRITE;
/*!40000 ALTER TABLE `tblpenjualan` DISABLE KEYS */;
INSERT INTO `tblpenjualan` VALUES (1,'INV2021061','LF-2021-1','PL-2021-1','2021/06/26','675000','0','0','675000','0','0','1','2021-06-26 12:35:24','2021-06-26 12:35:24','MK-2021-1','1','1','0',0,'2021/06/26','45010'),(2,'INV2021062','LF-2021-1','PL-2021-1','2021/06/26','545000','0','0','545000','0','0','1','2021-06-26 12:40:41','2021-06-26 12:40:41','MK-2021-1','1','1','0',0,'2021/06/26','99005'),(3,'INV2021063','LF-2021-1','PL-2021-1','2021/06/25','430000','0','0','430000','0','20000','1','2021-06-26 13:01:16','2021-06-26 13:01:16','MK-2021-1','1','1','0',0,'2021/06/25','50005');
/*!40000 ALTER TABLE `tblpenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpenjualandetail`
--

DROP TABLE IF EXISTS `tblpenjualandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblpenjualandetail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `noNotaPenjualan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qtyJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuanJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tglPenjualan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nmBarangJual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalPokokJual` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpenjualandetail`
--

LOCK TABLES `tblpenjualandetail` WRITE;
/*!40000 ALTER TABLE `tblpenjualandetail` DISABLE KEYS */;
INSERT INTO `tblpenjualandetail` VALUES (5,'INV2021061','DB-2021-2','15000','5','PCS','75000','2021-06-26 12:19:42','2021-06-26 12:19:42','2021/06/26','Busi','45000'),(6,'INV2021061','DB-2021-1','300000','2','Box','600000','2021-06-26 12:27:08','2021-06-26 12:27:08','2021/06/26','Kampas Kopling','10'),(7,'INV2021062','DB-2021-1','300000','1','Box','300000','2021-06-26 12:40:12','2021-06-26 12:40:12','2021/06/26','Kampas Kopling','5'),(8,'INV2021062','DB-2021-2','15000','1','PCS','15000','2021-06-26 12:40:15','2021-06-26 12:40:15','2021/06/26','Busi','9000'),(9,'INV2021062','DB-2021-3','160000','1','PCS','160000','2021-06-26 12:40:18','2021-06-26 12:40:18','2021/06/26','Rantai Standart Supra X 100CC','90000'),(10,'INV2021063','DB-2021-1','300000','1','Box','300000','2021-06-26 13:00:52','2021-06-26 13:00:52','2021/06/25','Kampas Kopling','5'),(11,'INV2021063','DB-2021-4','60000','1','PCS','60000','2021-06-26 13:00:56','2021-06-26 13:00:56','2021/06/25','Kampas Rem Vario 110','50000');
/*!40000 ALTER TABLE `tblpenjualandetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-26 21:04:26
