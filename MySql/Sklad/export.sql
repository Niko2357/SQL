-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: sklada
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barva`
--

DROP TABLE IF EXISTS `barva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barva`
--

LOCK TABLES `barva` WRITE;
/*!40000 ALTER TABLE `barva` DISABLE KEYS */;
/*!40000 ALTER TABLE `barva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nakup`
--

DROP TABLE IF EXISTS `nakup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nakup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `vyrobek_id` int DEFAULT NULL,
  `mnozstvi` int DEFAULT NULL,
  `zaplaceno` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vyrobek_id` (`vyrobek_id`),
  CONSTRAINT `nakup_ibfk_1` FOREIGN KEY (`vyrobek_id`) REFERENCES `vyrobek` (`id`),
  CONSTRAINT `nakup_chk_1` CHECK ((`mnozstvi` > 0)),
  CONSTRAINT `nakup_chk_2` CHECK ((`zaplaceno` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nakup`
--

LOCK TABLES `nakup` WRITE;
/*!40000 ALTER TABLE `nakup` DISABLE KEYS */;
/*!40000 ALTER TABLE `nakup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nakup` AFTER INSERT ON `nakup` FOR EACH ROW begin
	insert into Sklad values(new.vyrobek_id, new.mnozstvi);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prodej`
--

DROP TABLE IF EXISTS `prodej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodej` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `vyrobek_id` int DEFAULT NULL,
  `mnozstvi` int DEFAULT NULL,
  `vydelano` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vyrobek_id` (`vyrobek_id`),
  CONSTRAINT `prodej_ibfk_1` FOREIGN KEY (`vyrobek_id`) REFERENCES `vyrobek` (`id`),
  CONSTRAINT `prodej_chk_1` CHECK ((`mnozstvi` > 0)),
  CONSTRAINT `prodej_chk_2` CHECK ((`vydelano` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodej`
--

LOCK TABLES `prodej` WRITE;
/*!40000 ALTER TABLE `prodej` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodej` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prodej` AFTER INSERT ON `prodej` FOR EACH ROW begin
	update Sklad set mnozstvi = new.mnozstvi where vyrobek_id = new.vyrobek_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vyrobek_id` int DEFAULT NULL,
  `mnozstvi` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vyrobek_id` (`vyrobek_id`),
  CONSTRAINT `sklad_ibfk_1` FOREIGN KEY (`vyrobek_id`) REFERENCES `vyrobek` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vyrobek`
--

DROP TABLE IF EXISTS `vyrobek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vyrobek` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(20) NOT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `jednotka` varchar(20) DEFAULT NULL,
  `popis` varchar(50) DEFAULT NULL,
  `dan` decimal(10,2) DEFAULT NULL,
  `barva_id` int DEFAULT NULL,
  `kategorie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barva_id` (`barva_id`),
  KEY `kategorie_id` (`kategorie_id`),
  CONSTRAINT `vyrobek_ibfk_1` FOREIGN KEY (`barva_id`) REFERENCES `barva` (`id`),
  CONSTRAINT `vyrobek_ibfk_2` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`),
  CONSTRAINT `vyrobek_chk_1` CHECK ((`cena` > 0)),
  CONSTRAINT `vyrobek_chk_2` CHECK ((`dan` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vyrobek`
--

LOCK TABLES `vyrobek` WRITE;
/*!40000 ALTER TABLE `vyrobek` DISABLE KEYS */;
/*!40000 ALTER TABLE `vyrobek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sklada'
--
/*!50003 DROP PROCEDURE IF EXISTS `obraty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obraty`(in od date, in do date, in id_vyrobku int, out obrat decimal(10, 2))
begin 
	select count(vydelano) as obrat from Prodej where datum < od and datum > do;
    select vyr.nazev, Sklad.mnozstvi from Sklad inner join Vyrobek as vyr on
    Sklad.vyrobek_id = vyr.id order by mnozstvi;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25 11:53:31
