CREATE DATABASE  IF NOT EXISTS `lms_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms_project`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_project
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL,
  `Title` varchar(120) NOT NULL,
  `YearPublished` int DEFAULT NULL,
  `Cost` decimal(8,2) DEFAULT NULL,
  `Subject` varchar(120) DEFAULT NULL,
  `Copies` int DEFAULT '3',
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (5235,'Beginner Guide to JAVA',2014,59.95,'Programming',3),(5236,'Database in the Cloud',2014,79.95,'Cloud',3),(5237,'Mastering the database environment',2015,89.95,'Database',3),(5238,'Conceptual Programming',2015,59.95,'Programming',3),(5239,'J++ in Mobile Apps',2015,49.95,'Programming',3),(5240,'iOS Programming',2015,79.95,'Programming',3),(5241,'JAVA First Steps',2015,49.95,'Programming',2),(5242,'C# in Middleware Deployment',2015,59.95,'Middleware',3),(5243,'DATABASES in Theory',2015,129.95,'Database',3),(5244,'Cloud-based Mobile Applications',2015,69.95,'Cloud',3),(5245,'The Golden Road to Platform independence',2016,119.95,'Middleware',3),(5246,'Capture the Cloud',2016,69.95,'Cloud',3),(5247,'Shining Through the Cloud: Sun Programming',2016,109.95,'Programming',3),(5248,'What You Always Wanted to Know About Database, But Were Afraid to Ask',2016,49.95,'Database',3),(5249,'Starlight Applications',2016,69.95,'Cloud',3),(5250,'Reengineering the Middle Tier',2016,89.95,'Middleware',3),(5251,'Thoughts on Revitalizing Ruby',2016,59.95,'Programming',3),(5252,'Beyond the Database Veil',2016,69.95,'Database',3),(5253,'Virtual Programming for Virtual Environments',2016,79.95,'Programming',3),(5254,'Coding Style for Maintenance',2017,49.95,'Programming',3),(5255,'Coding Style for Java by Rik',2023,49.95,'Programming',0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Validate_Book_Copies` BEFORE INSERT ON `books` FOR EACH ROW BEGIN
    IF NEW.Copies < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Copies count cannot be negative';
    END IF;
END */;;
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

-- Dump completed on 2024-01-10 20:22:10
