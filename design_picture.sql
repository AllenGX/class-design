-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: design
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `pictureId` int(11) NOT NULL AUTO_INCREMENT,
  `picturePath` varchar(80) DEFAULT NULL,
  `pictureTime` varchar(20) DEFAULT NULL,
  `pictureTitle` varchar(45) DEFAULT NULL,
  `pictureContent` varchar(300) DEFAULT NULL,
  `keyWord` varchar(150) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pictureId`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (71,'../image/12/201806090432043dcf641d-c95c-4b7a-901b-8fbd7f01f4cd.jpg','2018-06-09','','','',12),(74,'../image/11/20180609095035cdfb8e27-9b70-486c-9b7e-af48ecaf82ec.jpg','2018-06-09','','','',11),(76,'../image/11/20180609110209f40adf12-1f7c-4a63-a4ac-91480b49d969.png','2018-06-09','23432','234','',11),(77,'../image/11/20180610020024bbecf305-9d0e-423e-982d-6c6a634d7e06.jpg','2018-06-10','32','234','',11),(78,'../image/11/20180610021932cafedc35-e7c6-43c9-933c-5250701928e1.jpg','2018-06-10','0','0','',11),(79,'../image/11/20180610022622b371d4ff-d197-44a6-bcca-edea16e0e7a0.jpg','2018-06-10','werew','ferrw','',11),(80,'../image/11/20180610022622910377ec-cdea-4e62-864e-7aa4d7f8c295.png','2018-06-10','werew','ferrw','',11),(81,'../image/11/201806100226221d23ae32-755a-4e2f-a274-005286b53d85.jpg','2018-06-10','werew','ferrw','',11),(82,'../image/11/201806100226224bba95a5-ea6d-4f69-bf1e-f2127a414e3f.jpg','2018-06-10','werew','ferrw','',11),(83,'../image/11/20180610022622358306fb-1bfe-4bb6-8da6-490fa9cd82ec.jpg','2018-06-10','werew','ferrw','',11),(84,'../image/11/20180610022622cb923c59-4d2d-4387-bf50-e14bcba2e65e.jpg','2018-06-10','werew','ferrw','',11),(85,'../image/11/201806100226220895078d-95d0-4f16-af21-0b465bbdd897.jpg','2018-06-10','werew','ferrw','',11),(86,'../image/11/201806100226229b6ebb74-2c07-4aff-81f8-56bb770c5c03.jpg','2018-06-10','werew','ferrw','',11),(87,'../image/11/20180610022622cdcb4fdc-351d-4cce-a3f7-01b43e141689.png','2018-06-10','werew','ferrw','',11),(88,'../image/11/2018061002262294f06c9a-ecfd-4e4c-ad68-97fbce97c0f7.jpg','2018-06-10','werew','ferrw','',11),(89,'../image/12/20180610023538a357a4a2-95ea-44f2-8e58-0fa46805bdfb.png','2018-06-10','werwe','qwewqe','',12),(90,'../image/12/201806100235387b71961f-563d-42a6-b903-5c5a50c69564.jpg','2018-06-10','werwe','qwewqe','',12);
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-10 15:17:40
