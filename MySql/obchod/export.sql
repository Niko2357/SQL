-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: obchod
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
-- Table structure for table `objednavka`
--

DROP TABLE IF EXISTS `objednavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objednavka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `klient_id` int DEFAULT NULL,
  `zbozi_id` int DEFAULT NULL,
  `pocet` int DEFAULT NULL,
  `cena_celkem` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_id` (`klient_id`),
  KEY `zbozi_id` (`zbozi_id`),
  CONSTRAINT `objednavka_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `zakaznik` (`id`),
  CONSTRAINT `objednavka_ibfk_2` FOREIGN KEY (`zbozi_id`) REFERENCES `zbozi` (`id`),
  CONSTRAINT `objednavka_chk_1` CHECK ((`pocet` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objednavka`
--

LOCK TABLES `objednavka` WRITE;
/*!40000 ALTER TABLE `objednavka` DISABLE KEYS */;
INSERT INTO `objednavka` VALUES (4,1,NULL,4,NULL),(5,1,NULL,2,NULL);
/*!40000 ALTER TABLE `objednavka` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `storno_objednavky` BEFORE DELETE ON `objednavka` FOR EACH ROW begin 
	insert into zaloha(kliend_id, zbozi_id, pocet, cena_celkem) values(old.klient_id, old.zbozi_id, old.pocet, old.cena_celkem);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `zakaznik`
--

DROP TABLE IF EXISTS `zakaznik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaznik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `zakaznik_chk_1` CHECK ((`email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaznik`
--

LOCK TABLES `zakaznik` WRITE;
/*!40000 ALTER TABLE `zakaznik` DISABLE KEYS */;
INSERT INTO `zakaznik` VALUES (1,'novak@seznam.cz'),(2,'kos@seznam.cz'),(3,'polopos@gmail.com');
/*!40000 ALTER TABLE `zakaznik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaloha`
--

DROP TABLE IF EXISTS `zaloha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaloha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `klient_id` int DEFAULT NULL,
  `zbozi_id` int DEFAULT NULL,
  `pocet` int DEFAULT NULL,
  `cena_celkem` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_id` (`klient_id`),
  KEY `zbozi_id` (`zbozi_id`),
  CONSTRAINT `zaloha_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `zakaznik` (`id`),
  CONSTRAINT `zaloha_ibfk_2` FOREIGN KEY (`zbozi_id`) REFERENCES `zbozi` (`id`),
  CONSTRAINT `zaloha_chk_1` CHECK ((`pocet` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaloha`
--

LOCK TABLES `zaloha` WRITE;
/*!40000 ALTER TABLE `zaloha` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaloha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbozi`
--

DROP TABLE IF EXISTS `zbozi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zbozi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(20) DEFAULT NULL,
  `cena_ks` decimal(10,2) DEFAULT NULL,
  `dan_procenta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `zbozi_chk_1` CHECK ((`cena_ks` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbozi`
--

LOCK TABLES `zbozi` WRITE;
/*!40000 ALTER TABLE `zbozi` DISABLE KEYS */;
INSERT INTO `zbozi` VALUES (1,'kniha',359.00,10),(2,'hrnek',275.00,12),(3,'miska',239.00,12);
/*!40000 ALTER TABLE `zbozi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'obchod'
--
/*!50003 DROP FUNCTION IF EXISTS `cena_s_dani` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cena_s_dani`(cena_zbozi decimal(10,2), dan_procenta int) RETURNS decimal(10,2)
    DETERMINISTIC
begin
	declare cena_s_dani decimal(10,2) ;
    set cena_s_dani = cena_zbozi + cena_zbozi*(dan_procenta/100);
	return cena_s_dani;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pridej_objednavku` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pridej_objednavku`(in zbozi_nazev varchar(20), in pocet int, in zakaznik_mail varchar(20))
begin 
	declare zaka_id int;
    declare zboz_id int;
	declare cena_zboz decimal(10,2);
    declare dan_proc int; 
    declare cena_celk decimal(10,2); 
    set cena_celk = cena_s_dani(cena_zboz, dan_proc) * pocet;
    set zaka_id = (select id from zakaznik where email = zakaznik_mail);
    set zboz_id = (select id from zbozi where nazev = zbozi_nazev);
    set cena_zboz = (select cena_ks from zbozi where nazev = zbozi_nazev);
    set dan_proc = (select dan_proc from zbozi where nazev = zbozi_nazev);
	insert into objednavka(klient_id, zbozi_id, pocet, cena_celkem) values(zaka_id, zbozi_id, pocet, cena_celk);
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

-- Dump completed on 2025-12-09 11:42:24
