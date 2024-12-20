-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bbdms
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbladmin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladmin`
--

LOCK TABLES `tbladmin` WRITE;
/*!40000 ALTER TABLE `tbladmin` DISABLE KEYS */;
INSERT INTO `tbladmin` VALUES (1,'Admin','admin',8000000000,'admin123@gmail.com','admin@123','2023-09-28 04:36:52');
/*!40000 ALTER TABLE `tbladmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblblooddonars`
--

DROP TABLE IF EXISTS `tblblooddonars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblblooddonars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bgroup` (`BloodGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=25836 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblblooddonars`
--

LOCK TABLES `tblblooddonars` WRITE;
/*!40000 ALTER TABLE `tblblooddonars` DISABLE KEYS */;
INSERT INTO `tblblooddonars` VALUES (24886,'Kishor Patil','8787878787','kk@gmail.com','Female',28,'AB-','Pune,Maharashtra',' I want to become a blood donar.','2023-09-29 08:56:52',1,'java@1991'),(25835,'Aniket Patil','8787878787','aniket@yahoomail.com','Male',15,'A+','Pune,Maharashtra',' I want to donate my blood','2023-09-29 09:37:16',1,'aniket@123');
/*!40000 ALTER TABLE `tblblooddonars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodgroup`
--

DROP TABLE IF EXISTS `tblbloodgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbloodgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `BloodGroup` (`BloodGroup`),
  KEY `BloodGroup_2` (`BloodGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodgroup`
--

LOCK TABLES `tblbloodgroup` WRITE;
/*!40000 ALTER TABLE `tblbloodgroup` DISABLE KEYS */;
INSERT INTO `tblbloodgroup` VALUES (1,'A+ Ve','2023-10-01 13:10:43'),(2,'B+ Ve','2023-10-01 13:11:05'),(3,'A- Ve','2023-10-01 13:11:24'),(4,'B- Ve','2023-10-01 13:11:39'),(5,'O+ Ve','2023-10-01 13:11:48'),(6,'O- Ve','2023-10-01 13:11:56');
/*!40000 ALTER TABLE `tblbloodgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbloodrequirer`
--

DROP TABLE IF EXISTS `tblbloodrequirer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbloodrequirer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BloodDonarID` int DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `ContactNumber` bigint DEFAULT NULL,
  `BloodRequirefor` varchar(250) DEFAULT NULL,
  `Message` mediumtext,
  `ApplyDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `donorid` (`BloodDonarID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbloodrequirer`
--

LOCK TABLES `tblbloodrequirer` WRITE;
/*!40000 ALTER TABLE `tblbloodrequirer` DISABLE KEYS */;
INSERT INTO `tblbloodrequirer` VALUES (2,24886,'Arun Tripathi','aruntripathi@gmail.com',9876543210,'Father','Need urgently blood for my father.','2023-09-30 07:23:17'),(3,24886,'Sagar Mishra','sagarmishra@gmail.com',8585858585,'Sister','Need urgently blood.','2023-09-30 08:47:04'),(4,25835,'Mayur Tiwari','tiwarimayur@gmail.com',7574747474,'Brother','Need blood urgently.','2023-09-30 08:48:17'),(5,25835,'Sakshi Yadav','sakshiyadav@gmail.com',8281838486,'Father','We want emergency blood.','2023-10-02 04:46:16');
/*!40000 ALTER TABLE `tblbloodrequirer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontactusinfo`
--

DROP TABLE IF EXISTS `tblcontactusinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcontactusinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontactusinfo`
--

LOCK TABLES `tblcontactusinfo` WRITE;
/*!40000 ALTER TABLE `tblcontactusinfo` DISABLE KEYS */;
INSERT INTO `tblcontactusinfo` VALUES (1,'Maharashtra																						','bloodbankportal@blood.com','8080808080');
/*!40000 ALTER TABLE `tblcontactusinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontactusquery`
--

DROP TABLE IF EXISTS `tblcontactusquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcontactusquery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontactusquery`
--

LOCK TABLES `tblcontactusquery` WRITE;
/*!40000 ALTER TABLE `tblcontactusquery` DISABLE KEYS */;
INSERT INTO `tblcontactusquery` VALUES (9,'Chetan Gupta','chetangupta@yahoomail.com','9696969696','I want blood plasma, is it available?','2023-10-01 03:41:59',0);
/*!40000 ALTER TABLE `tblcontactusquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpages`
--

DROP TABLE IF EXISTS `tblpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblpages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpages`
--

LOCK TABLES `tblpages` WRITE;
/*!40000 ALTER TABLE `tblpages` DISABLE KEYS */;
INSERT INTO `tblpages` VALUES (3,'About Us ','aboutus','<div style=\"text-align: justify;\"><div>Welcome to the Blood Bank Portal, We are a dedicated organization committed to ensuring the safe and efficient management of blood resources to support healthcare institutions, patients, and donors. Our mission is to bridge the gap between those in need of life-saving blood and those willing to donate, making a positive impact on the health and well-being of our community.</div><div><br></div></div>');
/*!40000 ALTER TABLE `tblpages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-19 14:19:28
