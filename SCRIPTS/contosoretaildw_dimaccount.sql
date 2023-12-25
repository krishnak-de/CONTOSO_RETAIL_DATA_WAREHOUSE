CREATE DATABASE  IF NOT EXISTS `contosoretaildw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `contosoretaildw`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: contosoretaildw
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `dimaccount`
--

DROP TABLE IF EXISTS `dimaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimaccount` (
  `AccountKey` int NOT NULL,
  `ParentAccountKey` int DEFAULT NULL,
  `AccountLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AccountName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AccountDescription` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AccountType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Operator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CustomMembers` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValueType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CustomMemberOptions` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ETLLoadID` int DEFAULT NULL,
  `LoadDate` datetime(6) DEFAULT NULL,
  `UpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`AccountKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimaccount`
--

LOCK TABLES `dimaccount` WRITE;
/*!40000 ALTER TABLE `dimaccount` DISABLE KEYS */;
INSERT INTO `dimaccount` VALUES (1,NULL,'100000','Profit and Loss after tax','Profit and Loss after tax',NULL,NULL,NULL,NULL,NULL,1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(2,24,'111000','Income','Income','Income','+',NULL,'Income','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(3,24,'112000','Expense','Expense','Expense','-',NULL,'Expense','-',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(4,2,'110100','Sale Revenue','Sale Revenue','Income','+',NULL,'Income','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(5,3,'112100','Cost of Goods Sold','Cost of Goods Sold','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(6,3,'112200','Selling, General & Administrative Expenses','Selling, General & Administrative Expenses','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(7,6,'112300','Administration Expense','Administration Expense','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(8,6,'112400','IT Cost','IT Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(9,6,'112500','Human Capital','Human Capital','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(10,6,'112600','Light, Heat, Communication Cost','Light, Heat, Communication Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(11,6,'112700','Property Costs','Property Costs','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(12,6,'112800','Other Expenses','Other Expenses','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(13,6,'112900','Marketing Cost','Marketing & Advertisement Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(14,13,'112910','Holiday Ad Cost','Holiday Ad Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(15,13,'112920','Spring Ad Cost','Spring Ad Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(16,13,'112930','Back-to-School Ad Cost','Back-to-School Ad Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(17,13,'112940','Business Ad Cost','Business Ad Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(18,13,'112950','Tax Time / Summer Ad Cost','Tax Time / Summer Ad Cost','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(19,1,'131000','Taxation','Taxation','Taxation','-',NULL,'Taxation','-',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(20,14,'112911','Radio & TV','Holiday Ad Cost by Radio & TV','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(21,14,'112912','Print','Holiday Ad Cost by Print','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(22,14,'112913','Internet','Holiday Ad Cost by Internet','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(23,14,'112914','Other','Holiday Ad Cost by Other','Expense','+',NULL,'Expense','+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000'),(24,1,'110000','Profit and Loss before tax','Profit and Loss before tax',NULL,'+',NULL,NULL,'+',1,'2009-08-17 20:45:00.000000','2009-08-17 20:45:00.000000');
/*!40000 ALTER TABLE `dimaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 17:31:13
