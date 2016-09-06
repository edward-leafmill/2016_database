-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: cape_codd
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ORDER_ITEM`
--

DROP TABLE IF EXISTS `ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ITEM` (
  `OrderNumber` int(11) NOT NULL,
  `SKU` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(9,2) NOT NULL,
  `ExtendedPrice` decimal(9,2) NOT NULL,
  PRIMARY KEY (`SKU`,`OrderNumber`),
  KEY `RETAIL_ORDER_SKU_FK` (`OrderNumber`),
  CONSTRAINT `ORDER_ITEM_SKU_FK` FOREIGN KEY (`SKU`) REFERENCES `SKU_DATA` (`SKU`),
  CONSTRAINT `RETAIL_ORDER_SKU_FK` FOREIGN KEY (`OrderNumber`) REFERENCES `RETAIL_ORDER` (`OrderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ITEM`
--

LOCK TABLES `ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `ORDER_ITEM` DISABLE KEYS */;
INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`, `Quantity`, `Price`, `ExtendedPrice`) VALUES (3000,100200,1,300.00,300.00),(2000,101100,4,50.00,200.00),(3000,101100,2,50.00,100.00),(2000,101200,2,50.00,100.00),(3000,101200,1,50.00,50.00),(1000,201000,1,300.00,300.00),(1000,202000,1,130.00,130.00);
/*!40000 ALTER TABLE `ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RETAIL_ORDER`
--

DROP TABLE IF EXISTS `RETAIL_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RETAIL_ORDER` (
  `OrderNumber` int(11) NOT NULL,
  `StoreNumber` int(11) DEFAULT NULL,
  `StoreZip` char(9) DEFAULT NULL,
  `OrderMonth` char(12) NOT NULL,
  `OrderYear` int(11) NOT NULL,
  `OrderTotal` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RETAIL_ORDER`
--

LOCK TABLES `RETAIL_ORDER` WRITE;
/*!40000 ALTER TABLE `RETAIL_ORDER` DISABLE KEYS */;
INSERT INTO `RETAIL_ORDER` (`OrderNumber`, `StoreNumber`, `StoreZip`, `OrderMonth`, `OrderYear`, `OrderTotal`) VALUES (1000,10,'98110','December',2014,445.00),(2000,20,'02335','December',2014,310.00),(3000,10,'98110','January',2015,480.00);
/*!40000 ALTER TABLE `RETAIL_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKU_DATA`
--

DROP TABLE IF EXISTS `SKU_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKU_DATA` (
  `SKU` int(11) NOT NULL,
  `SKU_Description` char(35) NOT NULL,
  `Department` char(30) NOT NULL,
  `Buyer` char(30) DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKU_DATA`
--

LOCK TABLES `SKU_DATA` WRITE;
/*!40000 ALTER TABLE `SKU_DATA` DISABLE KEYS */;
INSERT INTO `SKU_DATA` (`SKU`, `SKU_Description`, `Department`, `Buyer`) VALUES (100100,'Std. Scuba Tank, Yellow','Water Sports','Pete Hansen'),(100200,'Std. Scuba Tank, Magenta','Water Sports','Pete Hansen'),(101100,'Dive Mask, Small Clear','Water Sports','Nancy Meyers'),(101200,'Dive Mask, Med Clear','Water Sports','Nancy Meyers'),(201000,'Half-dome Tent','Camping','Cindy Lo'),(202000,'Half-dome Tent Vestibule','Camping','Cindy Lo'),(301000,'Light Fly Climbing Harness','Climbing','Jerry Martin'),(302000,'Locking Carabiner, Oval','Climbing','Jerry Martin');
/*!40000 ALTER TABLE `SKU_DATA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-06 11:46:40
