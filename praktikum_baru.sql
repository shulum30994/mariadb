-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: praktikum
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-2ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lahan`
--

DROP TABLE IF EXISTS `lahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lahan` (
  `no_hgu` varchar(10) NOT NULL,
  `operasional_lahan` varchar(10) NOT NULL,
  `regional_lahan` varchar(10) NOT NULL,
  `komoditas_lahan` varchar(25) DEFAULT NULL,
  `luas_lahan` double DEFAULT NULL,
  `produksi_lahan` double DEFAULT NULL,
  `populasi_lahan` double DEFAULT NULL,
  `elevasi_lahan` double DEFAULT NULL,
  PRIMARY KEY (`no_hgu`),
  KEY `operasional_ke_lahan` (`operasional_lahan`),
  KEY `regional_ke_lahan` (`regional_lahan`),
  CONSTRAINT `operasional_ke_lahan` FOREIGN KEY (`operasional_lahan`) REFERENCES `operasional` (`no_operasional`),
  CONSTRAINT `regional_ke_lahan` FOREIGN KEY (`regional_lahan`) REFERENCES `regional` (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lahan`
--

LOCK TABLES `lahan` WRITE;
/*!40000 ALTER TABLE `lahan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operasional`
--

DROP TABLE IF EXISTS `operasional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operasional` (
  `no_operasional` varchar(10) NOT NULL,
  `kode_regional` varchar(10) NOT NULL,
  `manajer_operasional` varchar(25) DEFAULT NULL,
  `kantor_operasional` varchar(25) DEFAULT NULL,
  `nama_kebun` varchar(25) DEFAULT NULL,
  `wilayah_kerja` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`no_operasional`),
  KEY `operasional_regional` (`kode_regional`),
  CONSTRAINT `operasional_regional` FOREIGN KEY (`kode_regional`) REFERENCES `regional` (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operasional`
--

LOCK TABLES `operasional` WRITE;
/*!40000 ALTER TABLE `operasional` DISABLE KEYS */;
/*!40000 ALTER TABLE `operasional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pekerja`
--

DROP TABLE IF EXISTS `pekerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pekerja` (
  `laporan_tk` varchar(10) NOT NULL,
  `operasional_tk` varchar(10) NOT NULL,
  `regional_tk` varchar(10) NOT NULL,
  `hgu_tk` varchar(10) NOT NULL,
  `komoditas_tk` varchar(25) DEFAULT NULL,
  `jumlah_tkp` double DEFAULT NULL,
  `jumlah_tkw` double DEFAULT NULL,
  `jam_tkp` double DEFAULT NULL,
  `jam_tkw` double DEFAULT NULL,
  `hkp` double DEFAULT NULL,
  `hkw` double DEFAULT NULL,
  PRIMARY KEY (`laporan_tk`),
  KEY `operasional_ke_tk` (`operasional_tk`),
  KEY `regional_ke_tk` (`regional_tk`),
  KEY `hgu_ke_tk` (`hgu_tk`),
  CONSTRAINT `hgu_ke_tk` FOREIGN KEY (`hgu_tk`) REFERENCES `lahan` (`no_hgu`),
  CONSTRAINT `operasional_ke_tk` FOREIGN KEY (`operasional_tk`) REFERENCES `operasional` (`no_operasional`),
  CONSTRAINT `regional_ke_tk` FOREIGN KEY (`regional_tk`) REFERENCES `regional` (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pekerja`
--

LOCK TABLES `pekerja` WRITE;
/*!40000 ALTER TABLE `pekerja` DISABLE KEYS */;
/*!40000 ALTER TABLE `pekerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendapatan`
--

DROP TABLE IF EXISTS `pendapatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendapatan` (
  `laporan_keuangan` varchar(10) NOT NULL,
  `pusat_keuangan` varchar(10) NOT NULL,
  `regional_keuangan` varchar(10) NOT NULL,
  `komoditas_keuangan` varchar(25) DEFAULT NULL,
  `biaya_tsp` double DEFAULT NULL,
  `biaya_kcl` double DEFAULT NULL,
  `biaya_urea` double DEFAULT NULL,
  `biaya_pupuk` double DEFAULT NULL,
  `biaya_tkp` double DEFAULT NULL,
  `biaya_tkw` double DEFAULT NULL,
  `biaya_tk` double DEFAULT NULL,
  `total_biaya` double DEFAULT NULL,
  `total_prouduksi` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  `total_penerimaan` double DEFAULT NULL,
  `pendapatan` double DEFAULT NULL,
  `kriteria` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`laporan_keuangan`),
  KEY `pusat_ke_keuangan` (`pusat_keuangan`),
  KEY `regional_ke_keuangan` (`regional_keuangan`),
  CONSTRAINT `pusat_ke_keuangan` FOREIGN KEY (`pusat_keuangan`) REFERENCES `pusat` (`kode_perusahaan`),
  CONSTRAINT `regional_ke_keuangan` FOREIGN KEY (`regional_keuangan`) REFERENCES `regional` (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendapatan`
--

LOCK TABLES `pendapatan` WRITE;
/*!40000 ALTER TABLE `pendapatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendapatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pupuk`
--

DROP TABLE IF EXISTS `pupuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pupuk` (
  `laporan_pupuk` varchar(10) NOT NULL,
  `operasional_pupuk` varchar(10) NOT NULL,
  `regional_pupuk` varchar(10) NOT NULL,
  `hgu_pupuk` varchar(10) NOT NULL,
  `komoditas_pupuk` varchar(25) DEFAULT NULL,
  `tsp` double DEFAULT NULL,
  `kcl` double DEFAULT NULL,
  `urea` double DEFAULT NULL,
  PRIMARY KEY (`laporan_pupuk`),
  KEY `operasional_ke_pupuk` (`operasional_pupuk`),
  KEY `regional_ke_pupuk` (`regional_pupuk`),
  KEY `hgu_ke_pupuk` (`hgu_pupuk`),
  CONSTRAINT `hgu_ke_pupuk` FOREIGN KEY (`hgu_pupuk`) REFERENCES `lahan` (`no_hgu`),
  CONSTRAINT `operasional_ke_pupuk` FOREIGN KEY (`operasional_pupuk`) REFERENCES `operasional` (`no_operasional`),
  CONSTRAINT `regional_ke_pupuk` FOREIGN KEY (`regional_pupuk`) REFERENCES `regional` (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pupuk`
--

LOCK TABLES `pupuk` WRITE;
/*!40000 ALTER TABLE `pupuk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pupuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pusat`
--

DROP TABLE IF EXISTS `pusat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pusat` (
  `kode_perusahaan` varchar(10) NOT NULL,
  `nama_direktur` varchar(25) DEFAULT NULL,
  `jumlah_regional` varchar(5) DEFAULT NULL,
  `kantor_pusat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`kode_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pusat`
--

LOCK TABLES `pusat` WRITE;
/*!40000 ALTER TABLE `pusat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pusat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regional`
--

DROP TABLE IF EXISTS `regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional` (
  `no_regional` varchar(10) NOT NULL,
  `manajer_regional` varchar(25) DEFAULT NULL,
  `kantor_pusat` varchar(25) DEFAULT NULL,
  `wilayah_kerja` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no_regional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regional`
--

LOCK TABLES `regional` WRITE;
/*!40000 ALTER TABLE `regional` DISABLE KEYS */;
/*!40000 ALTER TABLE `regional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 10:47:48
