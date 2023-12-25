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
-- Table structure for table `dimproductcategory`
--

DROP TABLE IF EXISTS `dimproductcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimproductcategory` (
  `ProductCategoryKey` int NOT NULL,
  `ProductCategoryLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProductCategoryName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductCategoryDescription` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ETLLoadID` int DEFAULT NULL,
  `LoadDate` datetime(6) DEFAULT NULL,
  `UpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryKey`),
  UNIQUE KEY `AK_DimProductCategory_ProductCategoryLabel` (`ProductCategoryLabel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimproductcategory`
--

LOCK TABLES `dimproductcategory` WRITE;
/*!40000 ALTER TABLE `dimproductcategory` DISABLE KEYS */;
INSERT INTO `dimproductcategory` VALUES (1,'01','Audio','Audio',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(2,'02','TV and Video','TV and Video',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(3,'03','Computers','Computers',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(4,'04','Cameras and camcorders ','Cameras and camcorders ',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(5,'05','Cell phones','Cell phones',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(6,'06','Music, Movies and Audio Books','Music, Movies and Audio Books',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(7,'07','Games and Toys','Games and Toys',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(8,'08','Home Appliances','Home Appliances',1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000');
/*!40000 ALTER TABLE `dimproductcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 17:31:41
