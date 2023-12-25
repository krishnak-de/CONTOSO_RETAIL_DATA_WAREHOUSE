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
-- Table structure for table `dimpromotion`
--

DROP TABLE IF EXISTS `dimpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimpromotion` (
  `PromotionKey` int NOT NULL,
  `PromotionLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PromotionName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PromotionDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DiscountPercent` double DEFAULT NULL,
  `PromotionType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PromotionCategory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) DEFAULT NULL,
  `MinQuantity` int DEFAULT NULL,
  `MaxQuantity` int DEFAULT NULL,
  `ETLLoadID` int DEFAULT NULL,
  `LoadDate` datetime(6) DEFAULT NULL,
  `UpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PromotionKey`),
  UNIQUE KEY `AK_DimPromotion_PromotionLabel` (`PromotionLabel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimpromotion`
--

LOCK TABLES `dimpromotion` WRITE;
/*!40000 ALTER TABLE `dimpromotion` DISABLE KEYS */;
INSERT INTO `dimpromotion` VALUES (1,'001','No Discount','No Discount',0,'No Discount','No Discount','2003-01-01 00:00:00.000000','2010-12-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(2,'002','North America Spring Promotion','North America Spring Promotion',0.05,'Seasonal Discount','Store','2007-01-01 00:00:00.000000','2007-03-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(3,'003','North America Back-to-School Promotion','North America Back-to-School Promotion',0.1,'Seasonal Discount','Store','2007-07-01 00:00:00.000000','2007-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(4,'004','North America Holiday Promotion','North America Holiday Promotion',0.2,'Seasonal Discount','Store','2007-11-01 00:00:00.000000','2007-12-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(5,'005','Asian Holiday Promotion','Asian Holiday Promotion',0.15,'Seasonal Discount','Store','2007-11-01 00:00:00.000000','2008-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(6,'006','Asian Spring Promotion','Asian Spring Promotion',0.2,'Seasonal Discount','Store','2007-02-01 00:00:00.000000','2007-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(7,'007','Asian Summer Promotion','Asian Summer Promotion',0.1,'Seasonal Discount','Store','2007-05-01 00:00:00.000000','2007-06-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(8,'008','European Spring Promotion','European Spring Promotion',0.07,'Seasonal Discount','Store','2007-02-01 00:00:00.000000','2007-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(9,'009','European Back-to-Scholl Promotion','European Back-to-Scholl Promotion',0.1,'Seasonal Discount','Store','2007-08-01 00:00:00.000000','2007-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(10,'010','European Holiday Promotion','European Holiday Promotion',0.2,'Seasonal Discount','Store','2007-10-01 00:00:00.000000','2008-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(11,'011','North America Spring Promotion','North America Spring Promotion',0.05,'Seasonal Discount','Store','2008-01-01 00:00:00.000000','2008-03-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(12,'012','North America Back-to-School Promotion','North America Back-to-School Promotion',0.1,'Seasonal Discount','Store','2008-07-01 00:00:00.000000','2008-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(13,'013','North America Holiday Promotion','North America Holiday Promotion',0.2,'Seasonal Discount','Store','2008-11-01 00:00:00.000000','2008-12-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(14,'014','Asian Holiday Promotion','Asian Holiday Promotion',0.15,'Seasonal Discount','Store','2008-11-01 00:00:00.000000','2009-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(15,'015','Asian Spring Promotion','Asian Spring Promotion',0.2,'Seasonal Discount','Store','2008-02-01 00:00:00.000000','2008-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(16,'016','Asian Summer Promotion','Asian Summer Promotion',0.1,'Seasonal Discount','Store','2008-05-01 00:00:00.000000','2008-06-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(17,'017','European Spring Promotion','European Spring Promotion',0.07,'Seasonal Discount','Store','2008-02-01 00:00:00.000000','2008-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(18,'018','European Back-to-Scholl Promotion','European Back-to-Scholl Promotion',0.1,'Seasonal Discount','Store','2008-08-01 00:00:00.000000','2008-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(19,'019','European Holiday Promotion','European Holiday Promotion',0.2,'Seasonal Discount','Store','2008-10-01 00:00:00.000000','2009-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(20,'020','North America Spring Promotion','North America Spring Promotion',0.05,'Seasonal Discount','Store','2009-01-01 00:00:00.000000','2010-03-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(21,'021','North America Back-to-School Promotion','North America Back-to-School Promotion',0.1,'Seasonal Discount','Store','2009-07-01 00:00:00.000000','2009-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(22,'022','North America Holiday Promotion','North America Holiday Promotion',0.2,'Seasonal Discount','Store','2009-11-01 00:00:00.000000','2009-12-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(23,'023','Asian Holiday Promotion','Asian Holiday Promotion',0.15,'Seasonal Discount','Store','2009-11-01 00:00:00.000000','2010-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(24,'024','Asian Spring Promotion','Asian Spring Promotion',0.2,'Seasonal Discount','Store','2009-02-01 00:00:00.000000','2009-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(25,'025','Asian Summer Promotion','Asian Summer Promotion',0.1,'Seasonal Discount','Store','2009-05-01 00:00:00.000000','2009-06-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(26,'026','European Spring Promotion','European Spring Promotion',0.07,'Seasonal Discount','Store','2009-02-01 00:00:00.000000','2009-04-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(27,'027','European Back-to-Scholl Promotion','European Back-to-Scholl Promotion',0.1,'Seasonal Discount','Store','2009-08-01 00:00:00.000000','2009-09-30 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000'),(28,'028','European Holiday Promotion','European Holiday Promotion',0.2,'Seasonal Discount','Store','2009-10-01 00:00:00.000000','2010-01-31 00:00:00.000000',NULL,NULL,1,'2009-09-01 00:00:00.000000','2009-09-01 00:00:00.000000');
/*!40000 ALTER TABLE `dimpromotion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 17:30:59
