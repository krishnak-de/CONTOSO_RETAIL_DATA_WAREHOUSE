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
-- Table structure for table `dimproductsubcategory`
--

DROP TABLE IF EXISTS `dimproductsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimproductsubcategory` (
  `ProductSubcategoryKey` int NOT NULL,
  `ProductSubcategoryLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProductSubcategoryName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductSubcategoryDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProductCategoryKey` int DEFAULT NULL,
  `ETLLoadID` int DEFAULT NULL,
  `LoadDate` datetime(6) DEFAULT NULL,
  `UpdateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ProductSubcategoryKey`),
  UNIQUE KEY `AK_DimProductSubcategory_ProductSubcategoryLabel` (`ProductSubcategoryLabel`),
  KEY `FK_DimProductSubcategory_DimProductCategory` (`ProductCategoryKey`),
  CONSTRAINT `FK_DimProductSubcategory_DimProductCategory` FOREIGN KEY (`ProductCategoryKey`) REFERENCES `dimproductcategory` (`ProductCategoryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimproductsubcategory`
--

LOCK TABLES `dimproductsubcategory` WRITE;
/*!40000 ALTER TABLE `dimproductsubcategory` DISABLE KEYS */;
INSERT INTO `dimproductsubcategory` VALUES (1,'0101','MP4&MP3','MP4&MP3',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(2,'0102','Recorder','Recorder',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(3,'0103','Radio','Radio',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(4,'0104','Recording Pen','Recording Pen',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(5,'0105','Headphones','Headphones',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(6,'0106','Bluetooth Headphones','Bluetooth Headphones',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(7,'0107','Speakers','Speakers',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(8,'0108','Audio Accessories','Audio Accessories',1,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(9,'0201','Televisions','Televisions',2,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(10,'0202','VCD & DVD','VCD & DVD',2,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(11,'0203','Home Theater System','Home Theater System',2,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(13,'0205','Car Video','Car Video',2,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(14,'0206','TV & Video Accessories','TV & Video Accessories',2,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(15,'0301','Laptops','Laptops',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(16,'0302','Netbooks','Netbooks',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(17,'0303','Desktops','Desktops',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(18,'0304','Monitors','Monitors',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(19,'0305','Projectors & Screens','Projectors & Screens',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(20,'0306','Printers, Scanners & Fax','Printers, Scanners & Fax',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(21,'0307','Computer Setup & Service','Computer Setup & Service',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(22,'0308','Computers Accessories','Computers Accessories',3,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(23,'0401','Digital Cameras','Digital Cameras',4,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(24,'0402','Digital SLR Cameras','Digital SLR Cameras',4,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(25,'0403','Film Cameras','Film Cameras',4,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(27,'0405','Camcorders','Camcorders',4,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(28,'0406','Cameras & Camcorders Accessories','Cameras & Camcorders Accessories',4,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(29,'0501','Home & Office Phones','Home & Office Phones',5,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(31,'0503','Touch Screen Phones ','Touch Screen Phones ',5,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(32,'0504','Smart phones & PDAs ','Smart phones & PDAs ',5,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(33,'0505','Cell phones Accessories','Cell phones Accessories',5,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(34,'0601','Music CD','Music CD',6,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(35,'0602','Movie DVD','Movie DVD',6,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(36,'0603','Audio Books','Audio Books',6,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(38,'0701','Boxed Games','Boxed Games',7,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(39,'0702','Download Games','Download Games',7,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(40,'0703','Games Accessories','Games Accessories',7,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(41,'0801','Washers & Dryers','Washers & Dryers',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(42,'0802','Refrigerators','Refrigerators',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(43,'0803','Microwaves','Microwaves',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(44,'0804','Water Heaters','Water Heaters',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(45,'0805','Coffee Machines','Coffee Machines',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(46,'0806','Lamps','Lamps',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(47,'0807','Air Conditioners','Air Conditioners',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000'),(48,'0808','Fans','Fans',8,1,'2009-07-07 00:00:00.000000','2009-07-07 00:00:00.000000');
/*!40000 ALTER TABLE `dimproductsubcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 17:30:44
