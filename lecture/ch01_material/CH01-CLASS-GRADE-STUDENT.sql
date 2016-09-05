CREATE DATABASE  IF NOT EXISTS `ch01` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `ch01`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: ch01
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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `ClassNumber` int(11) NOT NULL DEFAULT '0',
  `ClassName` varchar(25) DEFAULT NULL,
  `Term` varchar(12) DEFAULT NULL,
  `Section` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ClassNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`ClassNumber`, `ClassName`, `Term`, `Section`) VALUES (10,'CHEM 101','2014-Fall',1),(20,'CHEM 101','2014-Fall',2),(30,'CHEM 101','2015-Spring',1),(40,'ACCT 101','2014-Fall',1),(50,'ACCT 101','2015-Spring',1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `StudentNumber` int(11) NOT NULL DEFAULT '0',
  `ClassNumber` int(11) NOT NULL DEFAULT '0',
  `Grade` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`StudentNumber`,`ClassNumber`),
  KEY `STUDENT_FK_idx` (`StudentNumber`),
  KEY `CLASS_FK_idx` (`ClassNumber`),
  CONSTRAINT `CLASS_FK` FOREIGN KEY (`ClassNumber`) REFERENCES `class` (`ClassNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STUDENT_FK` FOREIGN KEY (`StudentNumber`) REFERENCES `student` (`StudentNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` (`StudentNumber`, `ClassNumber`, `Grade`) VALUES (1,10,3.70),(1,40,3.50),(2,20,3.70),(3,30,3.10),(4,40,3.00),(4,50,3.50);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StudentNumber` int(11) NOT NULL DEFAULT '0',
  `LastName` varchar(25) DEFAULT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StudentNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`StudentNumber`, `LastName`, `FirstName`, `EmailAddress`) VALUES (1,'Cooke','Sam','Sam.Cooke@OurU.edu'),(2,'Lau','Marcia','Marcia.Lau@OurU.edu'),(3,'Harris','Lou','Lou.Harris@OurU.edu'),(4,'Greene','Grace','Grace.Greene@OurU.edu');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-05 12:49:56



SELECT * FROM STUDENT;

INSERT INTO STUDENT (LastName, FirstName, EmailAddress)
VALUES ('Minsu', 'Lee', 'minsu@busan.ac.kr');


UPDATE STUDENT
SET EmailAddress = 'minsu@pusan.ac.kr'
WHERE LastName = 'Minsu';

DELETE FROM STUDENT
WHERE LastName = 'Minsu';
