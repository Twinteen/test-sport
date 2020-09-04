-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'1991-12-12 09:03:06',1,2,1),(2,'1991-12-12 08:00:00',1,3,1),(3,'1991-12-13 09:01:00',2,3,1),(4,'1991-12-13 09:35:00',3,4,1),(5,'1991-12-14 08:59:00',6,7,2),(6,'1991-12-15 08:59:00',8,9,2),(7,'1991-12-03 07:44:00',12,13,3),(8,'1991-12-15 15:00:00',14,13,3),(9,'1991-12-17 15:00:00',18,19,4),(10,'1991-12-17 15:00:00',16,20,4),(11,'2020-09-25 13:27:00',2,1,1),(12,'2020-09-17 10:43:00',7,9,2),(13,'2020-09-17 10:46:00',5,1,1),(14,'2020-10-03 10:47:00',18,20,4),(15,'2020-09-18 14:50:00',13,11,3),(16,'2020-10-11 12:57:00',13,15,3),(17,'2020-09-09 10:00:00',5,1,1),(18,'2020-09-09 11:19:00',9,6,2),(19,'2020-09-09 11:28:00',9,6,2),(20,'2020-09-16 11:28:00',5,2,1),(21,'2020-09-17 11:35:00',5,2,1),(22,'2020-09-09 14:47:00',1,5,1),(23,'2020-10-10 14:51:00',17,20,4),(24,'2020-09-24 17:57:00',18,20,4),(25,'2020-10-11 15:57:00',5,3,1),(26,'2020-09-02 14:58:00',11,13,3),(27,'2020-09-23 11:04:00',9,6,2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `events_details`
--

LOCK TABLES `events_details` WRITE;
/*!40000 ALTER TABLE `events_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
INSERT INTO `sport` VALUES (4,'baseball'),(2,'basketball'),(1,'football'),(3,'ice-hockey');
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (14,3,'AGH Field Hockey'),(19,4,'Angels'),(17,4,'Astros'),(4,1,'Barcelona'),(1,1,'Bayern'),(10,2,'Boston Celtics'),(18,4,'DiamondBacks'),(12,3,'Freedom HKY'),(13,3,'Gateway FH'),(5,1,'Juventus'),(9,2,'LA Clippers'),(2,1,'Liverpool'),(7,2,'Los Angeles Lakers'),(20,4,'Mets'),(6,2,'Milwaukee Bucks'),(3,1,'Real Madrid'),(16,4,'Red Sox'),(8,2,'Toronto Raptors'),(11,3,'Windy City'),(15,3,'Wizards');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teams_details`
--

LOCK TABLES `teams_details` WRITE;
/*!40000 ALTER TABLE `teams_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-04 15:56:57
