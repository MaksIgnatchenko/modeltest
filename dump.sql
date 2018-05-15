-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: modeltest
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comment` int(5) NOT NULL AUTO_INCREMENT,
  `id_post` int(5) NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'Maks','Exp2','2018-05-15 14:23:59');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id_post` int(5) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT 'Guest',
  `message` varchar(255) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Taras','Hello world','2018-05-13 17:15:56'),(2,'Maks','Hello from method','2018-05-15 11:05:51'),(3,'Maks','Hello from method','2018-05-15 11:07:20'),(4,'Maks','Hello wordl 2','2018-05-15 11:07:20'),(5,'Maks','One','2018-05-15 11:09:26'),(6,'Maks','Two','2018-05-15 11:09:26'),(7,'Maks','111','2018-05-15 11:17:24'),(8,'Maks','111','2018-05-15 11:18:09'),(9,'Maks','111','2018-05-15 11:19:34'),(10,'Maks','222','2018-05-15 11:19:34'),(11,'Maks','111','2018-05-15 11:19:46'),(12,'Maks','222','2018-05-15 11:19:46'),(13,'Maks','111','2018-05-15 11:20:22'),(14,'Maks','222','2018-05-15 11:20:22'),(15,'Maks','111','2018-05-15 11:20:44'),(16,'Maks','222','2018-05-15 11:20:44'),(17,'Maks','111','2018-05-15 11:22:17'),(18,'Maks','111','2018-05-15 11:24:11'),(19,'Maks','222','2018-05-15 11:24:11'),(20,'Maks','111','2018-05-15 11:25:51'),(21,'Maks','222','2018-05-15 11:25:51'),(22,'Maks','222','2018-05-15 11:29:14'),(23,'Maks','222','2018-05-15 11:29:43'),(24,'Maks','222','2018-05-15 11:32:19'),(25,'Vasilisa','222','2018-05-15 11:37:35'),(26,'Maks','Exp','2018-05-15 14:25:29'),(27,'Maks','Exp','2018-05-15 14:26:04');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-15 20:48:45
