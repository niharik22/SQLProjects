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
-- Table structure for table `patrons`
--

DROP TABLE IF EXISTS `patrons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrons` (
  `PatronID` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `PatronType` varchar(10) NOT NULL,
  PRIMARY KEY (`PatronID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrons`
--

LOCK TABLES `patrons` WRITE;
/*!40000 ALTER TABLE `patrons` DISABLE KEYS */;
INSERT INTO `patrons` VALUES (1001,'John','Doe','Student'),(1002,'Jane','Smith','Faculty'),(1003,'Alice','Johnson','Student'),(1160,'Robert','Carter','Faculty'),(1161,'Kelsey','Koch','Faculty'),(1165,'Cedric','Baldwin','Faculty'),(1166,'Vera','Alvarado','Student'),(1167,'Alan','Martin','Faculty'),(1170,'Cory','Barry','Faculty'),(1171,'Peggy','Marsh','Student'),(1172,'Tony','Miles','Student'),(1174,'Betsy','Malone','Student'),(1180,'Nadine','Blair','Student'),(1181,'Allen','Horne','Student'),(1182,'Jamal','Melendez','Student'),(1183,'Helena','Hughes','Faculty'),(1184,'Jimmie','Love','Student'),(1185,'Sandra','Yang','Student'),(1200,'Lorenzo','Torres','Student'),(1201,'Shelby','Noble','Student'),(1202,'Holly','Anthony','Student'),(1203,'Tyler','Pope','Student'),(1204,'Thomas','Duran','Student'),(1205,'Claire','Gomez','Student'),(1207,'Iva','Ramos','Student'),(1208,'Ollie','Cantrell','Student'),(1209,'Rena','Mathis','Student'),(1210,'Keith','Cooley','Student'),(1211,'Jerald','Gaines','Student'),(1212,'Iva','McClain','Student'),(1213,'Desiree','Rivas','Student'),(1214,'Marina','King','Student'),(1215,'Maureen','Downs','Student'),(1218,'Angel','Terrell','Student'),(1219,'Desiree','Harrington','Student'),(1220,'Carlton','Morton','Student'),(1221,'Gloria','Pitts','Student'),(1222,'Zach','Kelly','Student'),(1223,'Jose','Hays','Student'),(1224,'Jewel','England','Student'),(1225,'Wilfred','Fuller','Student'),(1226,'Jeff','Owens','Student'),(1227,'Alicia','Dickson','Student'),(1228,'Homer','Goodman','Student'),(1229,'Gerald','Burke','Student'),(1237,'Brandi','Larson','Student'),(1238,'Erika','Bowen','Student'),(1239,'Elton','Irwin','Student'),(1240,'Jan','Joyce','Student'),(1241,'Irene','West','Student'),(1242,'Mario','King','Student'),(1243,'Roberto','Kennedy','Student'),(1244,'Leon','Richmond','Student');
/*!40000 ALTER TABLE `patrons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10 20:22:09
