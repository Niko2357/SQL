CREATE DATABASE  IF NOT EXISTS `podnik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `podnik`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: podnik
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
-- Temporary view structure for view `obsazeni_profesi`
--

DROP TABLE IF EXISTS `obsazeni_profesi`;
/*!50001 DROP VIEW IF EXISTS `obsazeni_profesi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `obsazeni_profesi` AS SELECT 
 1 AS `nazev`,
 1 AS `pocet`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `profese`
--

DROP TABLE IF EXISTS `profese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profese` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profese`
--

LOCK TABLES `profese` WRITE;
/*!40000 ALTER TABLE `profese` DISABLE KEYS */;
INSERT INTO `profese` VALUES (1,'web_frontend'),(2,'web_backend'),(3,'security_specialist'),(4,'programmer'),(5,'web_developer');
/*!40000 ALTER TABLE `profese` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `seznam_zam`
--

DROP TABLE IF EXISTS `seznam_zam`;
/*!50001 DROP VIEW IF EXISTS `seznam_zam`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `seznam_zam` AS SELECT 
 1 AS `prijmeni`,
 1 AS `jmeno`,
 1 AS `nazev`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zam`
--

DROP TABLE IF EXISTS `zam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prijmeni` varchar(30) NOT NULL,
  `jmeno` varchar(20) NOT NULL,
  `plat` int DEFAULT NULL,
  `profese_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profese_id` (`profese_id`),
  CONSTRAINT `zam_ibfk_1` FOREIGN KEY (`profese_id`) REFERENCES `profese` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zam`
--

LOCK TABLES `zam` WRITE;
/*!40000 ALTER TABLE `zam` DISABLE KEYS */;
INSERT INTO `zam` VALUES (1,'hus','david',57000,5),(2,'leclerc','charles',35000,5),(3,'alonso','fernando',47000,4),(4,'albon','alex',57000,1),(5,'tsunoda','yuki',50000,3),(6,'hamilton','louis',68000,5),(7,'raikonnen','miki',31000,4),(8,'schumacher','michael',49000,1),(9,'prost','alan',78000,3),(10,'lauda','niki',67000,4),(11,'senna','aerton',39000,3);
/*!40000 ALTER TABLE `zam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'podnik'
--
/*!50003 DROP PROCEDURE IF EXISTS `Novy_zam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Novy_zam`(in prijmeni varchar(30), in jmeno varchar(20), in plat int, in nazev_profese varchar(30))
begin 
	insert into zam(prijmeni, jmeno, plat, profese_id) values(prijmeni, jmeno, plat, (select id from profese where nazev = nazev_profese));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Zmena_platu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Zmena_platu`(in  prijmeni varchar(30), jmeno varchar(20), in procentualni_pridani decimal(10,2))
begin 
	update zam set plat = plat + plat*(procentualni_pridani/100) where prijmeni = prijmeni and jmeno = jmeno;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `obsazeni_profesi`
--

/*!50001 DROP VIEW IF EXISTS `obsazeni_profesi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `obsazeni_profesi` AS select `profese`.`nazev` AS `nazev`,count(`zam`.`profese_id`) AS `pocet` from (`zam` join `profese` on((`profese`.`id` = `zam`.`profese_id`))) group by `profese`.`nazev` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seznam_zam`
--

/*!50001 DROP VIEW IF EXISTS `seznam_zam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seznam_zam` AS select `zam`.`prijmeni` AS `prijmeni`,`zam`.`jmeno` AS `jmeno`,`profese`.`nazev` AS `nazev` from (`zam` join `profese` on((`zam`.`profese_id` = `profese`.`id`))) order by `profese`.`nazev`,`zam`.`prijmeni`,`zam`.`jmeno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-06 11:30:32
