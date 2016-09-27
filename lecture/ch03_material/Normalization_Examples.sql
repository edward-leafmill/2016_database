CREATE DATABASE  IF NOT EXISTS `ch03` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ch03`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: ch03
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
-- Table structure for table `BUYER`
--

DROP TABLE IF EXISTS `BUYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUYER` (
  `buyer` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `department` char(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUYER`
--

LOCK TABLES `BUYER` WRITE;
/*!40000 ALTER TABLE `BUYER` DISABLE KEYS */;
INSERT INTO `BUYER` (`buyer`, `department`) VALUES ('Cindy Lo','Camping'),('Jerry Martin','Climbing'),('Nancy Meyers','Water Sports'),('Pete Hansen','Water Sports');
/*!40000 ALTER TABLE `BUYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT_ITEM`
--

DROP TABLE IF EXISTS `EQUIPMENT_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPMENT_ITEM` (
  `ItemNumber` int(11) NOT NULL,
  `EquipmentType` varchar(45) DEFAULT NULL,
  `AcquisitionCost` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT_ITEM`
--

LOCK TABLES `EQUIPMENT_ITEM` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT_ITEM` DISABLE KEYS */;
INSERT INTO `EQUIPMENT_ITEM` (`ItemNumber`, `EquipmentType`, `AcquisitionCost`) VALUES (100,'Drill Press',3500),(200,'Lathe',4750),(300,'Mill',27300);
/*!40000 ALTER TABLE `EQUIPMENT_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT_REPAIR`
--

DROP TABLE IF EXISTS `EQUIPMENT_REPAIR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EQUIPMENT_REPAIR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemNumber` int(11) DEFAULT NULL,
  `EquipmentType` varchar(45) DEFAULT NULL,
  `AcquisitionCost` int(11) DEFAULT NULL,
  `RepairNumber` int(11) DEFAULT NULL,
  `RepairDate` varchar(45) DEFAULT NULL,
  `RepairCost` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT_REPAIR`
--

LOCK TABLES `EQUIPMENT_REPAIR` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT_REPAIR` DISABLE KEYS */;
INSERT INTO `EQUIPMENT_REPAIR` (`ID`, `ItemNumber`, `EquipmentType`, `AcquisitionCost`, `RepairNumber`, `RepairDate`, `RepairCost`) VALUES (1,100,'Drill Press',3500,2000,'2013-05-05',375),(2,200,'Lathe',4750,2100,'2013-05-07',255),(3,100,'Drill Press',3500,2200,'2013-06-19',178),(4,300,'Mill',27300,2300,'2013-06-19',1875),(5,100,'Drill Press',3500,2400,'2013-07-05',0),(6,100,'Drill Press',3500,2500,'2013-08-17',275);
/*!40000 ALTER TABLE `EQUIPMENT_REPAIR` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `ORDER_ITEM2`
--

DROP TABLE IF EXISTS `ORDER_ITEM2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ITEM2` (
  `ordernumber` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ITEM2`
--

LOCK TABLES `ORDER_ITEM2` WRITE;
/*!40000 ALTER TABLE `ORDER_ITEM2` DISABLE KEYS */;
INSERT INTO `ORDER_ITEM2` (`ordernumber`, `sku`, `quantity`, `price`) VALUES (3000,100200,1,300.00),(2000,101100,4,50.00),(3000,101100,2,50.00),(2000,101200,2,50.00),(3000,101200,1,50.00),(1000,201000,1,300.00),(1000,202000,1,130.00);
/*!40000 ALTER TABLE `ORDER_ITEM2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPAIR`
--

DROP TABLE IF EXISTS `REPAIR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPAIR` (
  `RepairNumber` int(11) NOT NULL,
  `ItemNumber` int(11) DEFAULT NULL,
  `RepairDate` varchar(45) DEFAULT NULL,
  `RepairCost` int(11) DEFAULT NULL,
  PRIMARY KEY (`RepairNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPAIR`
--

LOCK TABLES `REPAIR` WRITE;
/*!40000 ALTER TABLE `REPAIR` DISABLE KEYS */;
INSERT INTO `REPAIR` (`RepairNumber`, `ItemNumber`, `RepairDate`, `RepairCost`) VALUES (2000,100,'2013-05-05',375),(2100,200,'2013-05-07',255),(2200,100,'2013-06-19',178),(2300,300,'2013-06-19',1875),(2400,100,'2013-07-05',0);
/*!40000 ALTER TABLE `REPAIR` ENABLE KEYS */;
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

--
-- Table structure for table `SKU_DATA2`
--

DROP TABLE IF EXISTS `SKU_DATA2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKU_DATA2` (
  `sku` int(11) NOT NULL,
  `sku_description` char(35) CHARACTER SET utf8 NOT NULL,
  `buyer` char(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKU_DATA2`
--

LOCK TABLES `SKU_DATA2` WRITE;
/*!40000 ALTER TABLE `SKU_DATA2` DISABLE KEYS */;
INSERT INTO `SKU_DATA2` (`sku`, `sku_description`, `buyer`) VALUES (100100,'Std. Scuba Tank, Yellow','Pete Hansen'),(100200,'Std. Scuba Tank, Magenta','Pete Hansen'),(101100,'Dive Mask, Small Clear','Nancy Meyers'),(101200,'Dive Mask, Med Clear','Nancy Meyers'),(201000,'Half-dome Tent','Cindy Lo'),(202000,'Half-dome Tent Vestibule','Cindy Lo'),(301000,'Light Fly Climbing Harness','Jerry Martin'),(302000,'Locking Carabiner, Oval','Jerry Martin');
/*!40000 ALTER TABLE `SKU_DATA2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27 13:37:05
