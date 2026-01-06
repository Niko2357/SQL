-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: expedition
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
-- Table structure for table `expedition`
--

DROP TABLE IF EXISTS `expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expedition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `team_lead_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_lead_id` (`team_lead_id`),
  CONSTRAINT `expedition_ibfk_1` FOREIGN KEY (`team_lead_id`) REFERENCES `scientist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedition`
--

LOCK TABLES `expedition` WRITE;
/*!40000 ALTER TABLE `expedition` DISABLE KEYS */;
INSERT INTO `expedition` VALUES (1,'Expedition Aurora 2024','Arctic','2024-03-01','2024-05-15',1),(2,'Icebreaker 2023','Antarctic','2023-11-20','2024-01-25',2),(3,'North Pole Trek 2025','Arctic','2025-04-10','2025-04-20',3),(4,'Coral Reef Census 2025','Great Barrier Reef','2025-03-15','2025-04-20',1),(5,'Amazon Biodiversity Survey','Amazon Rainforest','2025-06-01','2025-08-30',2),(6,'Arctic Seabird Watch','Arctic Circle','2025-07-10','2025-07-25',4),(7,'Desert Sands Survey 2024','Sahara Desert','2024-09-01','2024-09-30',9),(8,'Andean Peaks Study 2025','Andes Mountains','2025-01-10','2025-02-15',10),(9,'Borneo Rainforest Initiative','Borneo Rainforest','2024-10-15','2024-12-20',4),(10,'Great Lakes Monitoring','Great Lakes','2025-05-01','2025-05-30',5),(11,'Galapagos Marine Reserve','Galapagos Islands','2025-08-01','2025-09-15',12),(12,'Australian Outback Flora','Australian Outback','2024-07-01','2024-07-21',11),(13,'Arctic Ice Core Drilling','Greenland','2023-08-01','2023-10-30',10),(14,'African Savannah Census','Serengeti','2025-09-10','2025-10-15',14),(15,'Project Ghost Study 2026','Remote Siberia','2026-01-01','2026-03-01',3);
/*!40000 ALTER TABLE `expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientist`
--

DROP TABLE IF EXISTS `scientist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scientist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `speciality` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientist`
--

LOCK TABLES `scientist` WRITE;
/*!40000 ALTER TABLE `scientist` DISABLE KEYS */;
INSERT INTO `scientist` VALUES (1,'Dr. Aris Thorne','Marine Biology','Canadian'),(2,'Dr. Elara Vance','Ornithology','British'),(3,'Dr. Lena Petrova','Zoology','Russian'),(4,'Dr. Evelyn Reed','Marine Biology','American'),(5,'Dr. Ben Carter','Ecology','British'),(6,'Dr. Mei Chen','Botany','Chinese'),(7,'Dr. Samuel Hayes','Ornithology','Canadian'),(8,'Dr. Hiroshi Tanaka','Seismology','Japanese'),(9,'Dr. Anya Sharma','Geology','Indian'),(10,'Dr. James Peterson','Climatology','American'),(11,'Dr. Sophie Dubois','Botany','French'),(12,'Dr. Carlos Rivera','Ecology','Mexican'),(13,'Dr. Maria Schmidt','Marine Biology','German'),(14,'Dr. Kaiya Adams','Ornithology','Australian'),(15,'Dr. Liam O\'Connell','Zoology','Irish'),(16,'Dr. Fatima Al-Farsi','Astrophysics','Omani'),(17,'Dr. Noah Kim','Mycology','Korean');
/*!40000 ALTER TABLE `scientist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sighting`
--

DROP TABLE IF EXISTS `sighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sighting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expedition_id` int NOT NULL,
  `scientist_id` int NOT NULL,
  `animal_type` varchar(50) NOT NULL,
  `count` int NOT NULL,
  `sighting_date` date DEFAULT NULL,
  `location_lat` decimal(10,7) DEFAULT NULL,
  `location_long` decimal(10,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expedition_id` (`expedition_id`),
  KEY `scientist_id` (`scientist_id`),
  CONSTRAINT `sighting_ibfk_1` FOREIGN KEY (`expedition_id`) REFERENCES `expedition` (`id`),
  CONSTRAINT `sighting_ibfk_2` FOREIGN KEY (`scientist_id`) REFERENCES `scientist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sighting`
--

LOCK TABLES `sighting` WRITE;
/*!40000 ALTER TABLE `sighting` DISABLE KEYS */;
INSERT INTO `sighting` VALUES (1,1,1,'Polar Bear',2,'2024-03-10',74.5000000,-100.1200000),(2,1,2,'Arctic Tern',45,'2024-03-11',74.6100000,-100.0500000),(3,2,4,'Emperor Penguin',150,'2023-12-01',-64.1200000,-58.9000000),(4,2,1,'Humpback Whale',5,'2023-12-05',-64.5500000,-59.2200000),(5,2,4,'Seal',12,'2024-01-10',-63.9900000,-58.5000000),(6,3,3,'Narwhal',1,'2025-04-12',85.1000000,10.0000000),(7,1,1,'Narwhal',3,'2024-04-20',78.2100000,15.6400000),(8,4,5,'Clownfish',50,'2025-03-22',-19.1356000,146.9018000),(9,4,6,'Sea Turtle',5,'2025-03-24',-19.1400000,146.9100000),(10,5,6,'Jaguar',1,'2025-06-15',-3.4653000,-58.3842000),(11,5,7,'Capybara',12,'2025-06-18',-3.4500000,-58.3900000),(12,6,8,'Puffin',200,'2025-07-14',70.4500000,-22.1000000),(13,1,1,'Arctic Fox',5,'2024-03-15',74.5500000,-100.2000000),(14,1,4,'Ringed Seal',8,'2024-03-20',75.0000000,-99.8000000),(15,2,2,'Blue Whale',1,'2023-12-10',-65.0000000,-60.0000000),(16,2,4,'Leopard Seal',3,'2024-01-05',-64.2000000,-58.8000000),(17,3,3,'Polar Bear',1,'2025-04-14',85.2000000,10.5000000),(18,4,1,'Manta Ray',2,'2025-03-25',-19.1500000,146.9200000),(19,4,5,'Sea Cucumber',100,'2025-03-28',-19.1600000,146.9000000),(20,4,6,'Dugong',1,'2025-04-01',-19.1000000,146.8500000),(21,5,7,'Pink River Dolphin',4,'2025-06-20',-3.5000000,-58.4000000),(22,5,5,'Poison Dart Frog',30,'2025-07-01',-3.4000000,-58.3000000),(23,5,6,'Toucan',8,'2025-07-15',-3.4200000,-58.3500000),(24,6,8,'Guillemot',500,'2025-07-15',70.4600000,-22.1100000),(25,6,7,'Kittiwake',300,'2025-07-16',70.4700000,-22.1200000),(26,7,9,'Fennec Fox',2,'2024-09-10',25.0000000,-5.0000000),(27,7,5,'Scorpion',15,'2024-09-12',25.1000000,-5.1000000),(28,8,10,'Condor',3,'2025-01-20',-15.0000000,-70.0000000),(29,8,3,'Llama',20,'2025-01-22',-15.1000000,-70.1000000),(30,9,4,'Orangutan',5,'2024-11-01',2.5000000,115.0000000),(31,9,6,'Rafflesia Flower',1,'2024-11-15',2.4500000,115.1000000),(32,10,5,'Bald Eagle',2,'2025-05-10',43.0000000,-79.0000000),(33,11,12,'Giant Tortoise',10,'2025-08-15',-0.5000000,-90.0000000),(34,11,1,'Hammerhead Shark',4,'2025-08-20',-0.6000000,-90.1000000),(35,12,11,'Kangaroo Paw (plant)',50,'2024-07-10',-25.0000000,120.0000000),(36,12,13,'Emu',6,'2024-07-12',-25.1000000,120.1000000),(37,14,14,'Lion',8,'2025-09-20',-2.5000000,34.0000000),(38,14,7,'Giraffe',15,'2025-09-21',-2.6000000,34.1000000);
/*!40000 ALTER TABLE `sighting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-16 11:53:03
