-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: munaydb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add aula',7,'add_aula'),(26,'Can change aula',7,'change_aula'),(27,'Can delete aula',7,'delete_aula'),(28,'Can view aula',7,'view_aula'),(29,'Can add dicta',8,'add_dicta'),(30,'Can change dicta',8,'change_dicta'),(31,'Can delete dicta',8,'delete_dicta'),(32,'Can view dicta',8,'view_dicta'),(33,'Can add docente',9,'add_docente'),(34,'Can change docente',9,'change_docente'),(35,'Can delete docente',9,'delete_docente'),(36,'Can view docente',9,'view_docente'),(37,'Can add grupo',10,'add_grupo'),(38,'Can change grupo',10,'change_grupo'),(39,'Can delete grupo',10,'delete_grupo'),(40,'Can view grupo',10,'view_grupo'),(41,'Can add materia',11,'add_materia'),(42,'Can change materia',11,'change_materia'),(43,'Can delete materia',11,'delete_materia'),(44,'Can view materia',11,'view_materia'),(45,'Can add reserva',12,'add_reserva'),(46,'Can change reserva',12,'change_reserva'),(47,'Can delete reserva',12,'delete_reserva'),(48,'Can view reserva',12,'view_reserva'),(49,'Can add access attempt',13,'add_accessattempt'),(50,'Can change access attempt',13,'change_accessattempt'),(51,'Can delete access attempt',13,'delete_accessattempt'),(52,'Can view access attempt',13,'view_accessattempt'),(53,'Can add access log',14,'add_accesslog'),(54,'Can change access log',14,'change_accesslog'),(55,'Can delete access log',14,'delete_accesslog'),(56,'Can view access log',14,'view_accesslog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Z2Qf7OaOAq8pg5AuIbqyVd$EOJyhIZQrrut9htUFCDEJb8r93Vpqv0S8ZCUEXglgss=','2022-04-02 04:53:03.182706',1,'munay','','','munayTec@gmail.com',1,1,'2022-04-02 04:52:47.539165'),(2,'pbkdf2_sha256$260000$HRR02kLCbQ7xDL3cJldmRp$Pb0i4Nse8tAVUn5rj6fhWq9ivkJEJzcNsHQVz3bYlWI=',NULL,0,'achaperez@gmail.com','','','',0,1,'2022-04-02 04:56:46.000000'),(3,'pbkdf2_sha256$260000$CCViZj1Wqc843FUVWRb4aE$6MhuMxv+FihCRtyMclWVxYv0QtCLG5v4KwW+/e9Yqo0=',NULL,0,'agredacorrales@gmail.com','','','',0,1,'2022-04-02 04:59:19.000000'),(4,'pbkdf2_sha256$260000$WGpOQML8ZPUlxzbhBXH6iS$AFd5bRG4RomdbKlBv4OAC1HvXbat+O6BYePZ0Yag9fE=',NULL,0,'aguilarmamani@gmail.com','','','',0,1,'2022-04-02 23:50:08.000000'),(5,'pbkdf2_sha256$260000$mWw5kFCToey88HH90txBg4$328lc6Z93VC8oUMyJ13SCql0h4FGLMaHQOL9Istogow=',NULL,0,'aguirretorrico@gmail.com','','','',0,1,'2022-04-02 23:50:43.000000'),(6,'pbkdf2_sha256$260000$wFiCBQ7wkl58ydVwskjuLo$//v0D3uTbiGH9BA7aFyttepkayuVKcElCNJ5drOqp9Y=',NULL,0,'alcocergarnica@gmail.com','','','',0,1,'2022-04-02 23:51:59.000000'),(7,'pbkdf2_sha256$260000$n1tsgOnsg5GD03tRxm78vQ$MhLD6wr2AUgccsrdze+mXBDMjo1u/h9wMQ19oa01MGE=',NULL,0,'alconpuña@gmail.com','','','',0,1,'2022-04-03 00:11:16.000000'),(8,'pbkdf2_sha256$260000$PZeI1L4hFY8nskYPHpy6FW$jgKAFUo3x9zQCpCmWN7HV1qwAa/dZrdJ4iroJq/IZq4=',NULL,0,'alejoespinoza@gmail.com','','','',0,1,'2022-04-03 00:12:20.000000'),(9,'pbkdf2_sha256$260000$lgdESsqTpHpzhLN7DWAjg3$5SkMJJSpuPdeSGtRnFMnJFgea2gJlXFcsYwzhxdJlDI=',NULL,0,'alfarodenus@gmail.com','','','',0,1,'2022-04-03 00:13:02.000000'),(10,'pbkdf2_sha256$260000$g5WdcG6nsH6IogU934bBWK$syqz/fzKMz7yxmR2Yzy+OI5QkaiIWqKEJ57u8oguEQs=',NULL,0,'alissparedes@gmail.com','','','',0,1,'2022-04-03 00:13:40.000000'),(11,'pbkdf2_sha256$260000$NM0odkwOGCZT1XIuUpOrvO$RgrUZ2sFbpcXabwY4OTtpA+AFJNIG2VnM7mKQY9PRwo=',NULL,0,'alvarezcaero@gmail.com','','','',0,1,'2022-04-03 00:14:54.000000'),(12,'pbkdf2_sha256$260000$z5gpalPmtCqJjMxCTIH41R$YuRnvXQWH7NtTctKU2tgiXnHJAqVQwZdHh3NE4ylvhM=',NULL,0,'alvarezquiroz@gmail.com','','','',0,1,'2022-04-03 00:15:43.000000'),(13,'pbkdf2_sha256$260000$kR0J6QOoXvO3RhUnpmyfF2$Ah1Dx6VJ5firb3UsLKVD6PzU5U4kJPks09nVgoetI9c=',NULL,0,'andradeuzieta@gmail.com','','','',0,1,'2022-04-03 00:18:03.000000'),(14,'pbkdf2_sha256$260000$mmxXubOlQESpU0RRXkOwkn$NsXeOK8TKH8335l0gom9KO8wsnjKdTaN1gwapxvw/OQ=',NULL,0,'antezanacamacho@gmail.com','','','',0,1,'2022-04-03 00:30:43.000000'),(15,'pbkdf2_sha256$260000$stOvSAovnFe5wq1KmTcWtL$UJwJ8djjcuqRq537pDVdPshNpfcMkxVjnSPgEMVT6Yo=',NULL,0,'antezanafernandez@gmail.com','','','',0,1,'2022-04-03 00:31:24.000000'),(16,'pbkdf2_sha256$260000$qTI5Kr19KgxLxjYIkTJdqO$vEhgGgGC5Y7z7f8gZRrBjcnGc5TeHys+1JZDHoyNiWA=',NULL,0,'antezananogales@gmail.com','','','',0,1,'2022-04-03 00:36:00.000000'),(17,'pbkdf2_sha256$260000$a93j6UgCXlEpYPp7AfmPuL$fys8QNG8vDSff005cU+w2kie9dPeuCBhWJHN5fMUnxw=',NULL,0,'antezanaroman@gmail.com','','','',0,1,'2022-04-03 00:37:45.000000'),(18,'pbkdf2_sha256$260000$6TRkWra3N6lHGscwIVaqzi$6OQiS/U5nuqJCOT9l+Htmcvc1IH/fh/rv/9vp9xvqaU=',NULL,0,'antezanavalera@gmail.com','','','',0,1,'2022-04-03 00:38:22.000000'),(19,'pbkdf2_sha256$260000$MRoLqsOTctem9WRZzNNkYn$TFg2vg78ACOzuxlgBU5yujwAA8nTXMMzvpxfOHmaF5s=',NULL,0,'aparicioyuja@gmail.com','','','',0,1,'2022-04-03 00:38:49.000000'),(20,'pbkdf2_sha256$260000$HtmhSFGW61zJJcFRcsbm4K$QwspCHVCFB891lPDe9l1RQcGolco9P+6ilFep4KXIhE=',NULL,0,'arancibiaguzman@gmail.com','','','',0,1,'2022-04-03 00:39:14.000000'),(21,'pbkdf2_sha256$260000$ZVpeQxN3qXzmS4ZUPNb8Kp$0LXQ5nu8HK8PduFqJaXUSTo5YhyAkYRs62/SBpqcBXA=',NULL,0,'arancibiamiranda@gmail.com','','','',0,1,'2022-04-03 00:45:11.000000'),(22,'pbkdf2_sha256$260000$wyNCX9SyP754DxZeITNtOI$4N+B9J+lfDuqoBhO3IrqHHCU+TzmuFiOGgGAh0NdixI=',NULL,0,'aranibarlafuente@gmail.com','','','',0,1,'2022-04-03 00:48:46.000000'),(23,'pbkdf2_sha256$260000$4HZ6f2brIAT6bam95K54lO$z/8rGB0mSyuIjw3q3wSd8V2C1QeqHg9lR3/WuZ+7x7k=',NULL,0,'araozjaldin@gmail.com','','','',0,1,'2022-04-03 00:51:14.000000'),(24,'pbkdf2_sha256$260000$2oUDOItlMIcfyGPmur0d2m$7MdpbalgFYrzU91lLsKppisD8PUJSII6KcL8wxweOeA=',NULL,0,'arcegarcia@gmail.com','','','',0,1,'2022-04-03 00:51:44.000000'),(25,'pbkdf2_sha256$260000$Dwz1aLZc3nPrrGJmGDTXjP$V/mlhgp5Z8Ah7nib+hYlBo4kvVWscIaHrV/PN7vuDeU=',NULL,0,'arispesantander@gmail.com','','','',0,1,'2022-04-03 00:52:10.000000'),(26,'pbkdf2_sha256$260000$gFxJNPKrJRhobtlg6dxSWF$SU/AOG/hNfcgqzGd5uV1Ad1Tk5LDjt4BcRReErCbxXs=',NULL,0,'arispesantander2@gmail.com','','','',0,1,'2022-04-03 00:52:30.000000'),(27,'pbkdf2_sha256$260000$XpfqQOIjy0nV2Jcb30KCWc$tjyu3+yUOwZx20sodZgcKuEINz+hHrAawnZFqfn/LbI=',NULL,0,'arnezcamacho@gmail.com','','','',0,1,'2022-04-03 16:24:26.000000'),(28,'pbkdf2_sha256$260000$V3BCkBxEunP6mWC764qRNG$WQ/TvjfRRbCiqaDJRdk8PPrJGK0DQKpNSDTqzqUzz04=',NULL,0,'arneztorrico@gmail.com','','','',0,1,'2022-04-03 16:25:23.000000'),(29,'pbkdf2_sha256$260000$1i4WLEOhEZfJIsMN0uipUo$z/cckYLq0uLaJ5b5bodIj1we1Y75jWwbsqigOPW66Rk=',NULL,0,'arrazolarivero@gmail.com','','','',0,1,'2022-04-03 16:27:48.000000'),(30,'pbkdf2_sha256$260000$8ezinHxQdvPctBU7cO3VrO$XWwpMUSBaqHHL1hsnYp0yTQUZK4TuIXe38fu8p2xebg=',NULL,0,'arzabemaure@gmail.com','','','',0,1,'2022-04-03 16:28:15.000000'),(31,'pbkdf2_sha256$260000$ay3Ki5B0mz6qb2gVzBlDGi$gDc/r6sFhvIBXzP+BOHcAVyvWiwpzZe75Pjz2Gpod2o=',NULL,0,'atahuachi@gmail.com','','','',0,1,'2022-04-03 16:30:59.000000'),(32,'pbkdf2_sha256$260000$XNKU5FGAoPaZwn64epZA2p$Ub/rAbAWmaTX7fMBdVJdqBFF0DaqtL7YJBaROoPO7Wk=',NULL,0,'avilaalba@gmail.com','','','',0,1,'2022-04-03 16:31:25.000000'),(33,'pbkdf2_sha256$260000$yphCM665XcPSs9620QfWfq$+pNvW1swDg1QbcMyJyfQVgwHBMN5V/ieXoyFhRxAHbU=',NULL,0,'avilalara@gmail.com','','','',0,1,'2022-04-03 16:32:35.000000'),(34,'pbkdf2_sha256$260000$NHpQ8RuiZNnTuiRTWkOQ9N$YwMqWnWp/zo+EjcRX5uD7p6u6Kp1l8exzD+Eq1F/I50=',NULL,0,'ayllonacosta@gmail.com','','','',0,1,'2022-04-03 16:34:05.000000'),(35,'pbkdf2_sha256$260000$RhTsru4F2TS97c5SM3Jqtv$Y9WCRZf3UQXnj/AdEWz9f4zeQIgGkQjpd7bXbDdcMFM=',NULL,0,'ayoroacardozo@gmail.com','','','',0,1,'2022-04-03 16:34:30.000000'),(36,'pbkdf2_sha256$260000$7vTakUXyJCPEXQPTzoIGsN$5ZQKfTvfewDjcufwJlST9o1EzTii+jD1GnzzcZ7SS/0=',NULL,0,'azeroalcocer@gmail.com','','','',0,1,'2022-04-03 16:34:56.000000'),(37,'pbkdf2_sha256$260000$bULVmuyJYe1Kn83PojgNA7$+KeKMNbAlHwpGw1Qn4vEsm7MgbiVsIbY3s6DWnYROVI=',NULL,0,'Balderramaangulo@gmail.com','','','',0,1,'2022-04-03 16:40:35.000000'),(38,'pbkdf2_sha256$260000$SfuBsvNNQ6AL2cBtIdIQUS$HO9PxOStR2ZDOxnF+p4UpDl9MS53l2iAJmhDSG1PjEA=',NULL,0,'balderramaidina@gmail.com','','','',0,1,'2022-04-03 16:41:01.000000'),(39,'pbkdf2_sha256$260000$8oJdXYY3owjO5u0WDD94en$SWN2EEHSB7msOt+SSCHlSaW+0KSFr48QMtJIg1xf6W0=',NULL,0,'balderramatorrico@gmail.com','','','',0,1,'2022-04-03 16:41:40.000000'),(40,'pbkdf2_sha256$260000$5hdmWb01dROW8dBVygHkrh$Ff3/xQ3iACXDIyziHsaC0HW19EUp67k0ypQDfmpc15s=',NULL,0,'Baldiviesosaenz@gmail.com','','','',0,1,'2022-04-03 16:42:16.000000'),(41,'pbkdf2_sha256$260000$dlU4O22bQB1eFiwzYDAGpq$WCCSCEX5BvVHA8j1Pu85IkjQDQJizuYr4eHv+4WyvEE=',NULL,0,'baptistachuya@gmail.com','','','',0,1,'2022-04-03 16:42:40.000000'),(42,'pbkdf2_sha256$260000$8h3NcEz3roBvEPiS5iqGAA$JfeQ/JERfZLi0qhe7V1Hlb9FKbizHquLsOhEnNVSQsQ=',NULL,0,'bautistaherbas@gmail.com','','','',0,1,'2022-04-03 16:46:23.000000'),(43,'pbkdf2_sha256$260000$OPPGk5zjqvdaiPqiKq4DWw$JmhvwyFTwvMSW04D6ZJWc8klt6Jo7xFmbqnaeZ7bP3g=',NULL,0,'blancococa@gmail.com','','','',0,1,'2022-04-03 16:46:48.000000'),(44,'pbkdf2_sha256$260000$m669gzFOBsAz7aAwwel5zG$/8ndTH8z1ZdiEhDPmQPtzN/f/wkqr9p2PZhWBp8ZQoQ=',NULL,0,'brucknerbazoberry@gmail.com','','','',0,1,'2022-04-03 16:50:15.000000'),(45,'pbkdf2_sha256$260000$Aq5OObiQ55uGZoAOL8Wqwh$te9O1INXlbHhoIjjJtknzWN6MCChbphRPwrCZ53q24o=',NULL,0,'bustillosvargas@gmail.com','','','',0,1,'2022-04-03 16:50:51.000000'),(46,'pbkdf2_sha256$260000$8vPhoJMsJxz2Sfvy8CSIuv$QyB/7kTva3oInwsuX2lKOK08lFFTpatxN7Jy3q2jBy4=',NULL,0,'butrongandarillas@gmail.com','','','',0,1,'2022-04-03 16:51:13.000000'),(47,'pbkdf2_sha256$260000$BxdQT4WhoEBUT43DmW9Kz8$jGNG0HUqAvqrLuYzyA70z9lmRMhGX+noqOjlFVI14nI=',NULL,0,'caballeroflores@gmail.com','','','',0,1,'2022-04-03 16:51:34.000000'),(48,'pbkdf2_sha256$260000$3Ah2doDe3JenflGuXiuS5c$L+CqjCYoFpup2iSYqA2hjcnzE7nwGtC2RKGOfki5+Wg=',NULL,0,'cahillmangudo@gmail.com','','','',0,1,'2022-04-03 16:51:58.000000'),(49,'pbkdf2_sha256$260000$SB3MTCRHnXEXOGykHuyMqG$5tfXqmEpCfmNhm+aRBmJPdnuSrrdN37aUltyRDmXL0U=',NULL,0,'calanchanavia@gmail.com','','','',0,1,'2022-04-03 16:52:21.000000'),(50,'pbkdf2_sha256$260000$bEBCaBu86uJsqx4eEljscX$7fCAbRm546ZHQUM5khjuVhDahMuJBZCnT9Y75mBQWjE=',NULL,0,'camachodelcastillo@gmail.com','','','',0,1,'2022-04-03 16:52:45.000000'),(51,'pbkdf2_sha256$260000$bWfepIBEndWH7ZAv9d5aAR$MTguPrQpr/gesSqKiEIc+Use2qvDAl0im/pmjgo2PtI=',NULL,0,'camachopeña@gmail.com','','','',0,1,'2022-04-03 16:53:09.000000'),(52,'pbkdf2_sha256$260000$psHrkbrsdhZu7zcxNwYAdw$nK/IDmd+lj1Fqo0x7eiYw48CM2bpQEfuS0ysmUAlj6E=',NULL,0,'camachoquiroga@gmail.com','','','',0,1,'2022-04-03 16:53:54.000000'),(53,'pbkdf2_sha256$260000$qIVtO01TaFXOWN5hpYR6Y5$v6xrCFOqGdHBgbatuh+W8qxvJv+mWZ2yvVOosrxbxx0=',NULL,0,'camachovillazon@gmail.com','','','',0,1,'2022-04-03 16:54:17.000000'),(54,'pbkdf2_sha256$260000$OibfUQ6EV5asHMcyb5J2jT$AByiSCb8r7Fvx0ebbXuHAetkpkC5qtiUe1MQK7ViQR8=',NULL,0,'canedoespinoza@gmail.com','','','',0,1,'2022-04-03 16:54:41.000000'),(55,'pbkdf2_sha256$260000$5hFUoBXUBFDuronlKOsZBG$634t67yLBtyItuRpDqu+dOeOhdboNW8a6IvgU4k9cHQ=',NULL,0,'carballocadima@gmail.com','','','',0,1,'2022-04-03 16:55:02.000000'),(56,'pbkdf2_sha256$260000$GW6jCiQqspdU07ZoF5SZin$9F6jWzSQ4Yn0LMONies/ft0uXaAMkBYqq2bRJPVttnU=',NULL,0,'carrascocalvo@gmail.com','','','',0,1,'2022-04-03 16:55:26.000000'),(57,'pbkdf2_sha256$260000$clCW5jKSvUcFrktaNo3RZV$FgN8kZ2NozUkFqpfyrZMXr+uYPsKvmntw28J7e9Uw0A=',NULL,0,'castellonreynaga@gmail.com','','','',0,1,'2022-04-03 16:55:47.000000'),(58,'pbkdf2_sha256$260000$MOsDzbeMlPUuL1KM31FlEo$lXRFMBnhYNKs4JN9KDUbNvhMHw+QLAlwfi1tJp+qe5E=',NULL,0,'castellontorrico@gmail.com','','','',0,1,'2022-04-03 16:56:08.000000'),(59,'pbkdf2_sha256$260000$9IqWgCnOgrYR4hoQ77a2AB$pTEVVp75Q5CS4Wre+wVi1TVb5oJ4mccsSrh/3QPbpOs=',NULL,0,'castillozegarra@gmail.com','','','',0,1,'2022-04-03 16:56:32.000000'),(60,'pbkdf2_sha256$260000$Al38Lm48zLBHN82eMCUi4X$qOjYpMEVqaWNnF7I+/cXag7YAp8mf1Nb+p8AJQI7ohc=',NULL,0,'castrolazarte@gmail.com','','','',0,1,'2022-04-03 16:56:55.000000'),(61,'pbkdf2_sha256$260000$TIasnAcVKuAjScEbP9nsWw$x4pwaz9EL7W43w7l8sWiBPlZyZDdJuoOBEW1YY8tyiQ=',NULL,0,'cataririos@gmail.com','','','',0,1,'2022-04-03 16:57:24.000000'),(62,'pbkdf2_sha256$260000$qmRLPfhL0QR9Ufm95vQjY8$uEH8jfcWy+5N7thB8r4ka0jbauhsGbeeeVeVqi9z++Y=',NULL,0,'cespedesguizada@gmail.com','','','',0,1,'2022-04-03 16:57:50.000000'),(63,'pbkdf2_sha256$260000$MZtJ8cQTNoi87mlyequCvJ$He/iHNGjwQSlFCK9fgc6TxE5fSn4Ywy4eEyROYBDEmk=',NULL,0,'choqueflores@gmail.com','','','',0,1,'2022-04-03 16:58:13.000000'),(64,'pbkdf2_sha256$260000$0RzvttJ62fNfUYY6E9aQ6y$/Y+oTJUP65wjy8PLXqmFFVGRniRw0WWQL658DYZzJ3g=',NULL,0,'choqueuno@gmail.com','','','',0,1,'2022-04-03 16:58:34.000000'),(65,'pbkdf2_sha256$260000$KhukqmguS7o5f8X2sS85mW$xPnTFWQDEbbjkhjHHZvQPcT8LFoWozi2d3zT3Sqh46w=',NULL,0,'claroscruz@gmail.com','','','',0,1,'2022-04-03 16:58:55.000000'),(66,'pbkdf2_sha256$260000$JOi1kTPt6uYXUezfeFBqMP$gja89aGy6bdF40XCC9zypTpuJKEJA1+yJI1ISa2h02k=',NULL,0,'claurerichard@gmail.com','','','',0,1,'2022-04-03 16:59:14.000000'),(67,'pbkdf2_sha256$260000$P9UQWgoasXhfz4VU24GgY8$aYJgdwmne+JL4H3MDPXicsCXQo4tBJYat9uNUO/VQso=',NULL,0,'cocamendez@gmail.com','','','',0,1,'2022-04-03 16:59:39.000000'),(68,'pbkdf2_sha256$260000$RE3bGNSq4XnQrG3S167tnT$YUn17jqSa0B7Q3JsRkcYNeDcCy2FJA6mw9Uq7KXYOpo=',NULL,0,'cosiopapadopolis@gmail.com','','','',0,1,'2022-04-03 17:00:09.000000'),(69,'pbkdf2_sha256$260000$rgEX6QyIB0xokQW1hPGxtw$g1OkBsna/uG9wHik7nmYJdVOKRRzjqe5ICNiDAhAU1w=',NULL,0,'cossiocabrera@gmail.com','','','',0,1,'2022-04-03 17:03:25.000000'),(70,'pbkdf2_sha256$260000$Myte9XPEkRU08F8wn34r9o$Bz2gIEdTntFNxQoosWbvEznpKFS+ODnvwvoco29coyI=',NULL,0,'costasjauregui@gmail.com','','','',0,1,'2022-04-03 17:03:52.000000'),(71,'pbkdf2_sha256$260000$IY3qF8jmu6jbgqDbVsyxGN$FWznjAG1d+yNaXLRSfQ8grqBIoNkUXMlGoniAWwzYPI=',NULL,0,'crespogarcia@gmail.com','','','',0,1,'2022-04-03 17:04:18.000000'),(72,'pbkdf2_sha256$260000$4whpCWZYdf75mAf4zwjtKi$iZdeocuNjJNcFAPkG6glz6PJrrUaKpuyYvEkpiyux3E=',NULL,0,'cuellarolivera@gmail.com','','','',0,1,'2022-04-03 17:04:39.000000'),(73,'pbkdf2_sha256$260000$IkUw3IH2zzcRbDooMUeFKp$J0SwhSmgdqdFr6Dd34v37WDGT/ZDGhKYvh0OBJe7Lqs=',NULL,0,'cupeclemente@gmail.com','','','',0,1,'2022-04-03 17:05:02.000000'),(74,'pbkdf2_sha256$260000$52bg5eW0IlpbIyelOM6Jli$Ijvp1Hbvi3e3zOMt8rrhTubBW0SxDVe2+j/J6a5GU2w=',NULL,0,'cussinicolas@gmail.com','','','',0,1,'2022-04-03 17:05:23.000000'),(75,'pbkdf2_sha256$260000$wPedoPIwfsueqUrWLhTqD7$56uC619YIXeWpJ3PMt+iUWFfQh8rUJMVxdTLt6mzKJ0=',NULL,0,'davalosbrozovic@gmail.com','','','',0,1,'2022-04-03 17:05:45.000000'),(76,'pbkdf2_sha256$260000$D0iAwR5FMoqG32J5RJhWIu$hIuYVHqKdoK2GUV09w8bkAnOkh27qtpNKF/rMTUvgxI=',NULL,0,'davilacabrera@gmail.com','','','',0,1,'2022-04-03 17:06:11.000000'),(77,'pbkdf2_sha256$260000$SitILRqK4FxT1b2lsptShp$XPEODSWu925PAfPOXKmbVNXY15HiCga+VSVFZHIC3Ck=',NULL,0,'delcastilloantezana@gmail.com','','','',0,1,'2022-04-03 17:06:37.000000'),(78,'pbkdf2_sha256$260000$w2vvOGVjBfATPyUnnXp2hI$pqwQuBYhJgNXEEKMS7PkYsf4dqE3A3/C1oV483lEIuw=',NULL,0,'delgadillocossio@gmail.com','','','',0,1,'2022-04-03 17:06:58.000000'),(79,'pbkdf2_sha256$260000$ulz3kI4qquJogOz3rV54kO$9HtvCju856fa1o6M6uGlgGirfInbXLE1CCcT7vNb4Rs=',NULL,0,'diazcoimbra@gmail.com','','','',0,1,'2022-04-03 17:07:33.000000'),(80,'pbkdf2_sha256$260000$D1tOiDDLe5hc49T9cFm9h6$hAaDixTyznbRXcLSXfF53//VoMy7I/6e/puusoyfGUA=',NULL,0,'dominguez@gmail.com','','','',0,1,'2022-04-03 17:08:00.000000'),(81,'pbkdf2_sha256$260000$OZTxmXXK7mQWZe0byUjI2J$CE7S1Jnt6rckltWAvBZgRoetCA1ssFdzcov6gJf5z0Y=',NULL,0,'dominguezblanco@gmail.com','','','',0,1,'2022-04-03 17:08:22.000000'),(82,'pbkdf2_sha256$260000$MWHxIyK0nW05mRuE4bs3XF$Rt91bGDvAVj5yzyKlNC7j9mllrQ84BdG7fWAxujAGTo=',NULL,0,'dominguezchura@gmail.com','','','',0,1,'2022-04-03 17:08:48.000000'),(83,'pbkdf2_sha256$260000$7KmgUgYfAJJFO97zIRDCYd$LzPKpcmhM1JJOfYdIfUCnir//BqhVK13MCME3X/BDK8=',NULL,0,'duchenayala@gmail.com','','','',0,1,'2022-04-03 17:09:13.000000'),(84,'pbkdf2_sha256$260000$YHWZp2mr7uo23amDN0nZnP$mVtBgvBKhk1i4gaBW9WVRtVoLa3IrSpTJzz7utvpG1E=',NULL,0,'echeverriaherrera@gmail.com','','','',0,1,'2022-04-03 17:09:37.000000'),(85,'pbkdf2_sha256$260000$QgeYi7PyeH3xrMs2GErwdo$3yCIwYT+0OXQ/h9YxfRztCbVUwC0rpZVIqkbf19f3RM=',NULL,0,'eduardofranz@gmail.com','','','',0,1,'2022-04-03 17:09:58.000000'),(86,'pbkdf2_sha256$260000$GRJo5TZSp5qVB47xrNBGBr$lxCtToyZ5CmD94UWeHFdDi3swVhQErabyNlGR08SEjo=',NULL,0,'escalerafernandez@gmail.com','','','',0,1,'2022-04-03 17:10:19.000000'),(87,'pbkdf2_sha256$260000$hydWZLgnk63ZC8G5Pz0AnN$BCzz6+NCiBIllC78ehsE3nD2EAuPwB4qFxb/UwVImwY=',NULL,0,'escaleramejia@gmail.com','','','',0,1,'2022-04-03 17:10:40.000000'),(88,'pbkdf2_sha256$260000$PxQYZcMtuseifVolXpEI5z$el+ceqZtwo2a33qym8rTkMnOb1Dvtq/inS1/zRW0kQw=',NULL,0,'escaleravasquez@gmail.com','','','',0,1,'2022-04-03 17:11:01.000000'),(89,'pbkdf2_sha256$260000$tSarbN8lMAx7HnsjwT3MLt$nUbmOSLz2b34nWjtklv1Y2izEQ5BzFsDNzKLoTi6b6s=',NULL,0,'escobarseleme@gmail.com','','','',0,1,'2022-04-03 17:11:31.000000'),(90,'pbkdf2_sha256$260000$uVCctaW0a9EglMATtEttBD$zD6Zyo+fI8yvYDNtuI1VAuG//L9EQza7q0lGbGU9H7E=',NULL,0,'espinozaalcocer@gmail.com','','','',0,1,'2022-04-03 17:11:51.000000'),(91,'pbkdf2_sha256$260000$ZWCtZ2dB3XV8omcMjw068U$dC2noYi/mDO+AH4pPZ//yvu1EmE+rUDULd2tu2bYfz0=',NULL,0,'espinozaorosco@gmail.com','','','',0,1,'2022-04-03 17:12:10.000000'),(92,'pbkdf2_sha256$260000$rfjDwfF4utq4hNZqxceMRc$4MPNQiBvQp4MubbWF7BdjfAaV0GOfYfGWc5wscYQYtw=',NULL,0,'espinozaorosco2@gmail.com','','','',0,1,'2022-04-03 17:12:34.000000'),(93,'pbkdf2_sha256$260000$sNELfhEREu4qMwBOh9R1AC$t7PQ3/hDBfHB8tnKqvqvzKsoi0zlH8GEyLRwnjJ6iP4=',NULL,0,'fernandezcalatayud@gmail.com','','','',0,1,'2022-04-03 17:13:22.000000'),(94,'pbkdf2_sha256$260000$h4a8qG5rB3ArB1xmlWP0Zc$bRRxDe/vLglP37YgN/X27Qf3ZQpLQxlJk3qWmOaOcoQ=',NULL,0,'fernandezguzman@gmail.com','','','',0,1,'2022-04-03 17:13:49.000000'),(95,'pbkdf2_sha256$260000$CVWaetAvHgnuZfgh4uxwa0$8weQ0e5Ik4fbsx3RwwGbFRFsG5W7UoC8EzL1fCbz4nU=',NULL,0,'fernandezleon@gmail.com','','','',0,1,'2022-04-03 17:14:16.000000'),(96,'pbkdf2_sha256$260000$usSxzD36BXH1qUXKyXXdbo$DKl+ewQ7jHWGHJDF9XDtnpCkLUf3zWXAqU15lhzdNVc=',NULL,0,'fernandezramos@gmail.com','','','',0,1,'2022-04-03 17:14:35.000000'),(97,'pbkdf2_sha256$260000$aBgBEQKV2rI3oOSzM2qfbi$tk8EEL3ABAQjjxIVznflMYk9LcQb4KcAiHhLBn9cF/E=',NULL,0,'fernandezrios@gmail.com','','','',0,1,'2022-04-03 17:14:57.000000'),(98,'pbkdf2_sha256$260000$XJPSisurMU7HDPfQYk6Q5l$fXKgEEBe/b4DaP6MXiNUJvfLFWSfLt7pXVbYocm2siI=',NULL,0,'fernandezterrazas@gmail.com','','','',0,1,'2022-04-03 17:15:19.000000'),(99,'pbkdf2_sha256$260000$mNCPPcdlU1j2E7UOcgRgXg$bXj3gwfxRUc15sqBJZ3FWQgRfBB6KAIVMc0CroewAGw=',NULL,0,'ferrufinoguardia@gmail.com','','','',0,1,'2022-04-03 17:15:40.000000'),(100,'pbkdf2_sha256$260000$C56yeJSM5g02bmhtvRdFzY$6LD3444x8oWwsH0V4Xc1x2mAmkNrCsHaghZFEoqPYtA=',NULL,0,'fiorilolozada@gmail.com','','','',0,1,'2022-04-03 17:16:02.000000'),(101,'pbkdf2_sha256$260000$8s6dAbcU3UjQ1ydO2QnNa9$U0Vtq7WGvyq+m8E9gcYc/4/DT9O1gwnWRPukD/wPD3s=',NULL,0,'floreroortuño@gmail.com','','','',0,1,'2022-04-03 17:16:34.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accessattempt`
--

DROP TABLE IF EXISTS `axes_accessattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `axes_accessattempt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `get_data` longtext NOT NULL,
  `post_data` longtext NOT NULL,
  `failures_since_start` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq` (`username`,`ip_address`,`user_agent`),
  KEY `axes_accessattempt_ip_address_10922d9c` (`ip_address`),
  KEY `axes_accessattempt_user_agent_ad89678b` (`user_agent`),
  KEY `axes_accessattempt_username_3f2d4ca0` (`username`),
  CONSTRAINT `axes_accessattempt_chk_1` CHECK ((`failures_since_start` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accessattempt`
--

LOCK TABLES `axes_accessattempt` WRITE;
/*!40000 ALTER TABLE `axes_accessattempt` DISABLE KEYS */;
INSERT INTO `axes_accessattempt` VALUES (1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.42','127.0.0.1','munay','text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9','/admin/login/','2022-04-02 04:50:05.176652','next=/admin/','csrfmiddlewaretoken=b3xUsCc9QVR937XNjvI5yxLWkIUpk3mGpsboE01ekChdVkR7er7hsIk0AGxJWcdx\nusername=munay\npassword=********************\nnext=/admin/',1);
/*!40000 ALTER TABLE `axes_accessattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axes_accesslog`
--

DROP TABLE IF EXISTS `axes_accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `axes_accesslog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `http_accept` varchar(1025) NOT NULL,
  `path_info` varchar(255) NOT NULL,
  `attempt_time` datetime(6) NOT NULL,
  `logout_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `axes_accesslog_ip_address_86b417e5` (`ip_address`),
  KEY `axes_accesslog_user_agent_0e659004` (`user_agent`),
  KEY `axes_accesslog_username_df93064b` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axes_accesslog`
--

LOCK TABLES `axes_accesslog` WRITE;
/*!40000 ALTER TABLE `axes_accesslog` DISABLE KEYS */;
INSERT INTO `axes_accesslog` VALUES (1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.42','127.0.0.1','munay','text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9','/admin/login/','2022-04-02 04:53:03.186695',NULL);
/*!40000 ALTER TABLE `axes_accesslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-02 04:56:47.208603','2','achaperez@gmail.com',1,'[{\"added\": {}}]',4,1),(2,'2022-04-02 04:57:24.704931','2','achaperez@gmail.com',2,'[]',4,1),(3,'2022-04-02 04:59:19.629280','3','agredacorrales@gmail.com',1,'[{\"added\": {}}]',4,1),(4,'2022-04-02 04:59:22.162672','3','agredacorrales@gmail.com',2,'[]',4,1),(5,'2022-04-02 23:50:08.863301','4','aguilarmamani@gmail.com',1,'[{\"added\": {}}]',4,1),(6,'2022-04-02 23:50:12.070571','4','aguilarmamani@gmail.com',2,'[]',4,1),(7,'2022-04-02 23:50:43.695259','5','aguirretorrico@gmail.com',1,'[{\"added\": {}}]',4,1),(8,'2022-04-02 23:50:50.137450','5','aguirretorrico@gmail.com',2,'[]',4,1),(9,'2022-04-02 23:52:02.844471','6','alcocergarnica@gmail.com',1,'[{\"added\": {}}]',4,1),(10,'2022-04-02 23:52:06.420532','6','alcocergarnica@gmail.com',2,'[]',4,1),(11,'2022-04-03 00:11:19.203763','7','alconpuña@gmail.com',1,'[{\"added\": {}}]',4,1),(12,'2022-04-03 00:11:32.229865','7','alconpuña@gmail.com',2,'[]',4,1),(13,'2022-04-03 00:12:23.631545','8','alejoespinoza@gmail.com',1,'[{\"added\": {}}]',4,1),(14,'2022-04-03 00:12:29.556634','8','alejoespinoza@gmail.com',2,'[]',4,1),(15,'2022-04-03 00:13:05.756631','9','alfarodenus@gmail.com',1,'[{\"added\": {}}]',4,1),(16,'2022-04-03 00:13:10.078725','9','alfarodenus@gmail.com',2,'[]',4,1),(17,'2022-04-03 00:13:41.357592','10','alissparedes@gmail.com',1,'[{\"added\": {}}]',4,1),(18,'2022-04-03 00:13:47.437649','10','alissparedes@gmail.com',2,'[]',4,1),(19,'2022-04-03 00:14:57.623644','11','alvarezcaero@gmail.com',1,'[{\"added\": {}}]',4,1),(20,'2022-04-03 00:15:02.888739','11','alvarezcaero@gmail.com',2,'[]',4,1),(21,'2022-04-03 00:15:44.431578','12','alvarezquiroz@gmail.com',1,'[{\"added\": {}}]',4,1),(22,'2022-04-03 00:15:51.179758','12','alvarezquiroz@gmail.com',2,'[]',4,1),(23,'2022-04-03 00:18:04.515629','13','andradeuzieta@gmail.com',1,'[{\"added\": {}}]',4,1),(24,'2022-04-03 00:18:09.293616','13','andradeuzieta@gmail.com',2,'[]',4,1),(25,'2022-04-03 00:30:43.957028','14','antezanacamacho@gmail.com',1,'[{\"added\": {}}]',4,1),(26,'2022-04-03 00:30:48.509755','14','antezanacamacho@gmail.com',2,'[]',4,1),(27,'2022-04-03 00:31:24.735419','15','antezanafernandez@gmail.com',1,'[{\"added\": {}}]',4,1),(28,'2022-04-03 00:31:28.754988','15','antezanafernandez@gmail.com',2,'[]',4,1),(29,'2022-04-03 00:36:00.548456','16','antezananogales@gmail.com',1,'[{\"added\": {}}]',4,1),(30,'2022-04-03 00:37:15.502620','16','antezananogales@gmail.com',2,'[]',4,1),(31,'2022-04-03 00:37:46.349138','17','antezanaroman@gmail.com',1,'[{\"added\": {}}]',4,1),(32,'2022-04-03 00:37:51.395915','17','antezanaroman@gmail.com',2,'[]',4,1),(33,'2022-04-03 00:38:22.469064','18','antezanavalera@gmail.com',1,'[{\"added\": {}}]',4,1),(34,'2022-04-03 00:38:25.498081','18','antezanavalera@gmail.com',2,'[]',4,1),(35,'2022-04-03 00:38:49.971342','19','aparicioyuja@gmail.com',1,'[{\"added\": {}}]',4,1),(36,'2022-04-03 00:38:52.747651','19','aparicioyuja@gmail.com',2,'[]',4,1),(37,'2022-04-03 00:39:14.936638','20','arancibiaguzman@gmail.com',1,'[{\"added\": {}}]',4,1),(38,'2022-04-03 00:39:17.708342','20','arancibiaguzman@gmail.com',2,'[]',4,1),(39,'2022-04-03 00:45:11.859819','21','aranciabiamiranda@gmail.com',1,'[{\"added\": {}}]',4,1),(40,'2022-04-03 00:45:14.158850','21','aranciabiamiranda@gmail.com',2,'[]',4,1),(41,'2022-04-03 00:47:21.654768','21','arancibiamiranda@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(42,'2022-04-03 00:48:46.630216','22','aranibarlafuente@gmail.com',1,'[{\"added\": {}}]',4,1),(43,'2022-04-03 00:48:50.090308','22','aranibarlafuente@gmail.com',2,'[]',4,1),(44,'2022-04-03 00:51:15.106259','23','araozjaldin@gmail.com',1,'[{\"added\": {}}]',4,1),(45,'2022-04-03 00:51:21.094764','23','araozjaldin@gmail.com',2,'[]',4,1),(46,'2022-04-03 00:51:44.581196','24','arcegarcia@gmail.com',1,'[{\"added\": {}}]',4,1),(47,'2022-04-03 00:51:47.528036','24','arcegarcia@gmail.com',2,'[]',4,1),(48,'2022-04-03 00:52:10.737341','25','arispesantander@gmail.com',1,'[{\"added\": {}}]',4,1),(49,'2022-04-03 00:52:13.878736','25','arispesantander@gmail.com',2,'[]',4,1),(50,'2022-04-03 00:52:30.594246','26','arispesantander2@gmail.com',1,'[{\"added\": {}}]',4,1),(51,'2022-04-03 00:52:34.695084','26','arispesantander2@gmail.com',2,'[]',4,1),(52,'2022-04-03 16:24:27.144631','27','arnezcamacho@gmail.com',1,'[{\"added\": {}}]',4,1),(53,'2022-04-03 16:24:57.697223','27','arnezcamacho@gmail.com',2,'[]',4,1),(54,'2022-04-03 16:25:23.887851','28','arneztorrico@gmail.com',1,'[{\"added\": {}}]',4,1),(55,'2022-04-03 16:25:27.810536','28','arneztorrico@gmail.com',2,'[]',4,1),(56,'2022-04-03 16:27:49.145699','29','arrazolarivero@gmail.com',1,'[{\"added\": {}}]',4,1),(57,'2022-04-03 16:27:51.922144','29','arrazolarivero@gmail.com',2,'[]',4,1),(58,'2022-04-03 16:28:15.497016','30','arzabemaure@gmail.com',1,'[{\"added\": {}}]',4,1),(59,'2022-04-03 16:29:00.681247','30','arzabemaure@gmail.com',2,'[]',4,1),(60,'2022-04-03 16:31:00.009525','31','atahuachi@gmail.com',1,'[{\"added\": {}}]',4,1),(61,'2022-04-03 16:31:02.798744','31','atahuachi@gmail.com',2,'[]',4,1),(62,'2022-04-03 16:31:26.291388','32','avilaalba@gmail.com',1,'[{\"added\": {}}]',4,1),(63,'2022-04-03 16:32:04.271308','32','avilaalba@gmail.com',2,'[]',4,1),(64,'2022-04-03 16:32:35.710479','33','avilalara@gmail.com',1,'[{\"added\": {}}]',4,1),(65,'2022-04-03 16:33:37.424617','33','avilalara@gmail.com',2,'[]',4,1),(66,'2022-04-03 16:34:06.194497','34','ayllonacosta@gmail.com',1,'[{\"added\": {}}]',4,1),(67,'2022-04-03 16:34:10.055470','34','ayllonacosta@gmail.com',2,'[]',4,1),(68,'2022-04-03 16:34:30.594626','35','ayoroacardozo@gmail.com',1,'[{\"added\": {}}]',4,1),(69,'2022-04-03 16:34:33.155396','35','ayoroacardozo@gmail.com',2,'[]',4,1),(70,'2022-04-03 16:34:56.744741','36','azeroalcocer@gmail.com',1,'[{\"added\": {}}]',4,1),(71,'2022-04-03 16:35:02.641115','36','azeroalcocer@gmail.com',2,'[]',4,1),(72,'2022-04-03 16:40:36.071790','37','Balderramaangulo@gmail.com',1,'[{\"added\": {}}]',4,1),(73,'2022-04-03 16:40:40.041492','37','Balderramaangulo@gmail.com',2,'[]',4,1),(74,'2022-04-03 16:41:01.624001','38','balderramaidina@gmail.com',1,'[{\"added\": {}}]',4,1),(75,'2022-04-03 16:41:04.463433','38','balderramaidina@gmail.com',2,'[]',4,1),(76,'2022-04-03 16:41:41.279023','39','balderramatorrico@gmail.com',1,'[{\"added\": {}}]',4,1),(77,'2022-04-03 16:41:48.203796','39','balderramatorrico@gmail.com',2,'[]',4,1),(78,'2022-04-03 16:42:17.113977','40','Baldiviesosaenz@gmail.com',1,'[{\"added\": {}}]',4,1),(79,'2022-04-03 16:42:19.623834','40','Baldiviesosaenz@gmail.com',2,'[]',4,1),(80,'2022-04-03 16:42:40.414085','41','baptistachuya@gmail.com',1,'[{\"added\": {}}]',4,1),(81,'2022-04-03 16:42:44.104114','41','baptistachuya@gmail.com',2,'[]',4,1),(82,'2022-04-03 16:46:23.753551','42','bautistaherbas@gmail.com',1,'[{\"added\": {}}]',4,1),(83,'2022-04-03 16:46:26.341485','42','bautistaherbas@gmail.com',2,'[]',4,1),(84,'2022-04-03 16:46:49.263760','43','blancococa@gmail.com',1,'[{\"added\": {}}]',4,1),(85,'2022-04-03 16:46:51.763401','43','blancococa@gmail.com',2,'[]',4,1),(86,'2022-04-03 16:50:15.708450','44','brucknerbazoberry@gmail.com',1,'[{\"added\": {}}]',4,1),(87,'2022-04-03 16:50:25.032298','44','brucknerbazoberry@gmail.com',2,'[]',4,1),(88,'2022-04-03 16:50:51.882292','45','bustillosvargas@gmail.com',1,'[{\"added\": {}}]',4,1),(89,'2022-04-03 16:50:54.174476','45','bustillosvargas@gmail.com',2,'[]',4,1),(90,'2022-04-03 16:51:14.013680','46','butrongandarillas@gmail.com',1,'[{\"added\": {}}]',4,1),(91,'2022-04-03 16:51:16.342866','46','butrongandarillas@gmail.com',2,'[]',4,1),(92,'2022-04-03 16:51:35.092167','47','caballeroflores@gmail.com',1,'[{\"added\": {}}]',4,1),(93,'2022-04-03 16:51:37.319478','47','caballeroflores@gmail.com',2,'[]',4,1),(94,'2022-04-03 16:51:58.862661','48','cahillmangudo@gmail.com',1,'[{\"added\": {}}]',4,1),(95,'2022-04-03 16:52:01.058215','48','cahillmangudo@gmail.com',2,'[]',4,1),(96,'2022-04-03 16:52:22.122607','49','calanchanavia@gmail.com',1,'[{\"added\": {}}]',4,1),(97,'2022-04-03 16:52:24.898380','49','calanchanavia@gmail.com',2,'[]',4,1),(98,'2022-04-03 16:52:45.342851','50','camachodelcastillo@gmail.com',1,'[{\"added\": {}}]',4,1),(99,'2022-04-03 16:52:47.662643','50','camachodelcastillo@gmail.com',2,'[]',4,1),(100,'2022-04-03 16:53:09.922404','51','camachopeña@gmail.com',1,'[{\"added\": {}}]',4,1),(101,'2022-04-03 16:53:12.852272','51','camachopeña@gmail.com',2,'[]',4,1),(102,'2022-04-03 16:53:54.452350','52','camachoquiroga@gmail.com',1,'[{\"added\": {}}]',4,1),(103,'2022-04-03 16:53:56.982972','52','camachoquiroga@gmail.com',2,'[]',4,1),(104,'2022-04-03 16:54:18.092211','53','camachovillazon@gmail.com',1,'[{\"added\": {}}]',4,1),(105,'2022-04-03 16:54:23.731849','53','camachovillazon@gmail.com',2,'[]',4,1),(106,'2022-04-03 16:54:42.242574','54','canedoespinoza@gmail.com',1,'[{\"added\": {}}]',4,1),(107,'2022-04-03 16:54:44.912725','54','canedoespinoza@gmail.com',2,'[]',4,1),(108,'2022-04-03 16:55:02.932076','55','carballocadima@gmail.com',1,'[{\"added\": {}}]',4,1),(109,'2022-04-03 16:55:05.497856','55','carballocadima@gmail.com',2,'[]',4,1),(110,'2022-04-03 16:55:26.622337','56','carrascocalvo@gmail.com',1,'[{\"added\": {}}]',4,1),(111,'2022-04-03 16:55:29.487747','56','carrascocalvo@gmail.com',2,'[]',4,1),(112,'2022-04-03 16:55:47.661614','57','castellonreynaga@gmail.com',1,'[{\"added\": {}}]',4,1),(113,'2022-04-03 16:55:50.529564','57','castellonreynaga@gmail.com',2,'[]',4,1),(114,'2022-04-03 16:56:09.292145','58','castellontorrico@gmail.com',1,'[{\"added\": {}}]',4,1),(115,'2022-04-03 16:56:11.891820','58','castellontorrico@gmail.com',2,'[]',4,1),(116,'2022-04-03 16:56:32.952741','59','castillozegarra@gmail.com',1,'[{\"added\": {}}]',4,1),(117,'2022-04-03 16:56:36.782421','59','castillozegarra@gmail.com',2,'[]',4,1),(118,'2022-04-03 16:56:56.282649','60','castrolazarte@gmail.com',1,'[{\"added\": {}}]',4,1),(119,'2022-04-03 16:56:59.040260','60','castrolazarte@gmail.com',2,'[]',4,1),(120,'2022-04-03 16:57:24.802032','61','cataririos@gmail.com',1,'[{\"added\": {}}]',4,1),(121,'2022-04-03 16:57:27.315386','61','cataririos@gmail.com',2,'[]',4,1),(122,'2022-04-03 16:57:50.842280','62','cespedesguizada@gmail.com',1,'[{\"added\": {}}]',4,1),(123,'2022-04-03 16:57:53.182410','62','cespedesguizada@gmail.com',2,'[]',4,1),(124,'2022-04-03 16:58:13.513174','63','choqueflores@gmail.com',1,'[{\"added\": {}}]',4,1),(125,'2022-04-03 16:58:15.756792','63','choqueflores@gmail.com',2,'[]',4,1),(126,'2022-04-03 16:58:34.371340','64','choqueuno@gmail.com',1,'[{\"added\": {}}]',4,1),(127,'2022-04-03 16:58:37.037964','64','choqueuno@gmail.com',2,'[]',4,1),(128,'2022-04-03 16:58:55.487101','65','claroscruz@gmail.com',1,'[{\"added\": {}}]',4,1),(129,'2022-04-03 16:58:58.107412','65','claroscruz@gmail.com',2,'[]',4,1),(130,'2022-04-03 16:59:15.272103','66','claurerichard@gmail.com',1,'[{\"added\": {}}]',4,1),(131,'2022-04-03 16:59:17.341278','66','claurerichard@gmail.com',2,'[]',4,1),(132,'2022-04-03 16:59:40.271264','67','cocamendez@gmail.com',1,'[{\"added\": {}}]',4,1),(133,'2022-04-03 16:59:47.401021','67','cocamendez@gmail.com',2,'[]',4,1),(134,'2022-04-03 17:00:09.651131','68','cosiopapadopolis@gmail.com',1,'[{\"added\": {}}]',4,1),(135,'2022-04-03 17:00:11.977176','68','cosiopapadopolis@gmail.com',2,'[]',4,1),(136,'2022-04-03 17:03:25.433157','69','cossiocabrera@gmail.com',1,'[{\"added\": {}}]',4,1),(137,'2022-04-03 17:03:27.704640','69','cossiocabrera@gmail.com',2,'[]',4,1),(138,'2022-04-03 17:03:53.253272','70','costasjauregui@gmail.com',1,'[{\"added\": {}}]',4,1),(139,'2022-04-03 17:03:56.683179','70','costasjauregui@gmail.com',2,'[]',4,1),(140,'2022-04-03 17:04:18.633216','71','crespogarcia@gmail.com',1,'[{\"added\": {}}]',4,1),(141,'2022-04-03 17:04:21.132664','71','crespogarcia@gmail.com',2,'[]',4,1),(142,'2022-04-03 17:04:39.883503','72','cuellarolivera@gmail.com',1,'[{\"added\": {}}]',4,1),(143,'2022-04-03 17:04:42.103334','72','cuellarolivera@gmail.com',2,'[]',4,1),(144,'2022-04-03 17:05:02.693060','73','cupeclemente@gmail.com',1,'[{\"added\": {}}]',4,1),(145,'2022-04-03 17:05:04.622453','73','cupeclemente@gmail.com',2,'[]',4,1),(146,'2022-04-03 17:05:23.967004','74','cussinicolas@gmail.com',1,'[{\"added\": {}}]',4,1),(147,'2022-04-03 17:05:26.313269','74','cussinicolas@gmail.com',2,'[]',4,1),(148,'2022-04-03 17:05:46.242887','75','davalosbrozovic@gmail.com',1,'[{\"added\": {}}]',4,1),(149,'2022-04-03 17:05:49.483132','75','davalosbrozovic@gmail.com',2,'[]',4,1),(150,'2022-04-03 17:06:11.823463','76','davilacabrera@gmail.com',1,'[{\"added\": {}}]',4,1),(151,'2022-04-03 17:06:13.756431','76','davilacabrera@gmail.com',2,'[]',4,1),(152,'2022-04-03 17:06:37.769007','77','delcastilloantezana@gmail.com',1,'[{\"added\": {}}]',4,1),(153,'2022-04-03 17:06:40.018733','77','delcastilloantezana@gmail.com',2,'[]',4,1),(154,'2022-04-03 17:06:58.488730','78','delgadillocossio@gmail.com',1,'[{\"added\": {}}]',4,1),(155,'2022-04-03 17:07:00.688818','78','delgadillocossio@gmail.com',2,'[]',4,1),(156,'2022-04-03 17:07:34.198557','79','diazcoimbra@gmail.com',1,'[{\"added\": {}}]',4,1),(157,'2022-04-03 17:07:36.671929','79','diazcoimbra@gmail.com',2,'[]',4,1),(158,'2022-04-03 17:08:00.667859','80','dominguez@gmail.com',1,'[{\"added\": {}}]',4,1),(159,'2022-04-03 17:08:03.274167','80','dominguez@gmail.com',2,'[]',4,1),(160,'2022-04-03 17:08:23.238928','81','dominguezblanco@gmail.com',1,'[{\"added\": {}}]',4,1),(161,'2022-04-03 17:08:26.098868','81','dominguezblanco@gmail.com',2,'[]',4,1),(162,'2022-04-03 17:08:49.228506','82','dominguezchura@gmail.com',1,'[{\"added\": {}}]',4,1),(163,'2022-04-03 17:08:51.198132','82','dominguezchura@gmail.com',2,'[]',4,1),(164,'2022-04-03 17:09:14.185416','83','duchenayala@gmail.com',1,'[{\"added\": {}}]',4,1),(165,'2022-04-03 17:09:19.039730','83','duchenayala@gmail.com',2,'[]',4,1),(166,'2022-04-03 17:09:37.718658','84','echeverriaherrera@gmail.com',1,'[{\"added\": {}}]',4,1),(167,'2022-04-03 17:09:40.093658','84','echeverriaherrera@gmail.com',2,'[]',4,1),(168,'2022-04-03 17:09:58.758171','85','eduardofranz@gmail.com',1,'[{\"added\": {}}]',4,1),(169,'2022-04-03 17:10:00.629504','85','eduardofranz@gmail.com',2,'[]',4,1),(170,'2022-04-03 17:10:19.728683','86','escalerafernandez@gmail.com',1,'[{\"added\": {}}]',4,1),(171,'2022-04-03 17:10:21.993410','86','escalerafernandez@gmail.com',2,'[]',4,1),(172,'2022-04-03 17:10:40.943318','87','escaleramejia@gmail.com',1,'[{\"added\": {}}]',4,1),(173,'2022-04-03 17:10:43.527697','87','escaleramejia@gmail.com',2,'[]',4,1),(174,'2022-04-03 17:11:01.790243','88','escaleravasquez@gmail.com',1,'[{\"added\": {}}]',4,1),(175,'2022-04-03 17:11:03.787718','88','escaleravasquez@gmail.com',2,'[]',4,1),(176,'2022-04-03 17:11:31.508111','89','escobarseleme@gmail.com',1,'[{\"added\": {}}]',4,1),(177,'2022-04-03 17:11:33.288855','89','escobarseleme@gmail.com',2,'[]',4,1),(178,'2022-04-03 17:11:51.588609','90','espinozaalcocer@gmail.com',1,'[{\"added\": {}}]',4,1),(179,'2022-04-03 17:11:53.283117','90','espinozaalcocer@gmail.com',2,'[]',4,1),(180,'2022-04-03 17:12:10.923062','91','espinozaorosco@gmail.com',1,'[{\"added\": {}}]',4,1),(181,'2022-04-03 17:12:12.922994','91','espinozaorosco@gmail.com',2,'[]',4,1),(182,'2022-04-03 17:12:34.889735','92','espinozaorosco2@gmail.com',1,'[{\"added\": {}}]',4,1),(183,'2022-04-03 17:12:37.499009','92','espinozaorosco2@gmail.com',2,'[]',4,1),(184,'2022-04-03 17:13:23.106133','93','fernandezcalatayud@gmail.com',1,'[{\"added\": {}}]',4,1),(185,'2022-04-03 17:13:25.282656','93','fernandezcalatayud@gmail.com',2,'[]',4,1),(186,'2022-04-03 17:13:50.104780','94','fernandezguzman@gmail.com',1,'[{\"added\": {}}]',4,1),(187,'2022-04-03 17:13:52.370619','94','fernandezguzman@gmail.com',2,'[]',4,1),(188,'2022-04-03 17:14:16.899067','95','fernandezleon@gmail.com',1,'[{\"added\": {}}]',4,1),(189,'2022-04-03 17:14:18.986606','95','fernandezleon@gmail.com',2,'[]',4,1),(190,'2022-04-03 17:14:36.309078','96','fernandezramos@gmail.com',1,'[{\"added\": {}}]',4,1),(191,'2022-04-03 17:14:38.034312','96','fernandezramos@gmail.com',2,'[]',4,1),(192,'2022-04-03 17:14:58.267285','97','fernandezrios@gmail.com',1,'[{\"added\": {}}]',4,1),(193,'2022-04-03 17:15:00.387050','97','fernandezrios@gmail.com',2,'[]',4,1),(194,'2022-04-03 17:15:19.890460','98','fernandezterrazas@gmail.com',1,'[{\"added\": {}}]',4,1),(195,'2022-04-03 17:15:21.666613','98','fernandezterrazas@gmail.com',2,'[]',4,1),(196,'2022-04-03 17:15:41.302462','99','ferrufinoguardia@gmail.com',1,'[{\"added\": {}}]',4,1),(197,'2022-04-03 17:15:42.946751','99','ferrufinoguardia@gmail.com',2,'[]',4,1),(198,'2022-04-03 17:16:03.176998','100','fiorilolozada@gmail.com',1,'[{\"added\": {}}]',4,1),(199,'2022-04-03 17:16:07.314811','100','fiorilolozada@gmail.com',2,'[]',4,1),(200,'2022-04-03 17:16:34.496418','101','floreroortuño@gmail.com',1,'[{\"added\": {}}]',4,1),(201,'2022-04-03 17:16:37.210821','101','floreroortuño@gmail.com',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'axes','accessattempt'),(14,'axes','accesslog'),(5,'contenttypes','contenttype'),(7,'GestionDB','aula'),(8,'GestionDB','dicta'),(9,'GestionDB','docente'),(10,'GestionDB','grupo'),(11,'GestionDB','materia'),(12,'GestionDB','reserva'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'GestionDB','0001_initial','2022-04-02 04:12:18.124168'),(2,'GestionDB','0002_auto_20220331_1920','2022-04-02 04:12:18.448301'),(3,'GestionDB','0003_remove_docente_direccion_docente','2022-04-02 04:12:18.492183'),(4,'contenttypes','0001_initial','2022-04-02 04:12:18.571969'),(5,'auth','0001_initial','2022-04-02 04:12:19.000824'),(6,'admin','0001_initial','2022-04-02 04:12:19.108315'),(7,'admin','0002_logentry_remove_auto_add','2022-04-02 04:12:19.118287'),(8,'admin','0003_logentry_add_action_flag_choices','2022-04-02 04:12:19.131254'),(9,'contenttypes','0002_remove_content_type_name','2022-04-02 04:12:19.225999'),(10,'auth','0002_alter_permission_name_max_length','2022-04-02 04:12:19.278859'),(11,'auth','0003_alter_user_email_max_length','2022-04-02 04:12:19.318751'),(12,'auth','0004_alter_user_username_opts','2022-04-02 04:12:19.335706'),(13,'auth','0005_alter_user_last_login_null','2022-04-02 04:12:19.384143'),(14,'auth','0006_require_contenttypes_0002','2022-04-02 04:12:19.389129'),(15,'auth','0007_alter_validators_add_error_messages','2022-04-02 04:12:19.399102'),(16,'auth','0008_alter_user_username_max_length','2022-04-02 04:12:19.462930'),(17,'auth','0009_alter_user_last_name_max_length','2022-04-02 04:12:19.576626'),(18,'auth','0010_alter_group_name_max_length','2022-04-02 04:12:19.598569'),(19,'auth','0011_update_proxy_permissions','2022-04-02 04:12:19.612532'),(20,'auth','0012_alter_user_first_name_max_length','2022-04-02 04:12:19.674135'),(21,'axes','0001_initial','2022-04-02 04:12:19.730981'),(22,'axes','0002_auto_20151217_2044','2022-04-02 04:12:19.850734'),(23,'axes','0003_auto_20160322_0929','2022-04-02 04:12:19.865815'),(24,'axes','0004_auto_20181024_1538','2022-04-02 04:12:19.881772'),(25,'axes','0005_remove_accessattempt_trusted','2022-04-02 04:12:19.915922'),(26,'axes','0006_remove_accesslog_trusted','2022-04-02 04:12:19.958787'),(27,'axes','0007_alter_accessattempt_unique_together','2022-04-02 04:12:20.028811'),(28,'sessions','0001_initial','2022-04-02 04:12:20.061700'),(29,'GestionDB','0004_remove_docente_telefono_docente','2022-04-02 04:26:04.560344');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('id8y1l2ga7j6prunw26c7qw2xp03hmte','.eJxVjM0OwiAQhN-FsyEsuBQ9eu8zkF1-pGogKe3J-O62SQ-auc33zbyFp3Upfu1p9lMUVwHi9NsxhWeqO4gPqvcmQ6vLPLHcFXnQLscW0-t2uH8HhXrZ1oiQM1p0CgPSlgCBsmGDZMhcEpDRdmBO4CJptmpwlM4ZNJBCo1B8vuMtN6w:1naVl1:6c63j2xajw7PZtHIDfdFE9IrImGvaEpIRipQWqzUL5c','2022-04-16 04:53:03.189640');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_aula`
--

DROP TABLE IF EXISTS `gestiondb_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_aula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Cant_Estudiante` int NOT NULL,
  `Cod_Reserva_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GestionDB_aula_Cod_Reserva_id_6ca90fcc_fk_GestionDB_reserva_id` (`Cod_Reserva_id`),
  CONSTRAINT `GestionDB_aula_Cod_Reserva_id_6ca90fcc_fk_GestionDB_reserva_id` FOREIGN KEY (`Cod_Reserva_id`) REFERENCES `gestiondb_reserva` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_aula`
--

LOCK TABLES `gestiondb_aula` WRITE;
/*!40000 ALTER TABLE `gestiondb_aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiondb_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_dicta`
--

DROP TABLE IF EXISTS `gestiondb_dicta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_dicta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Cod_Docente_id` bigint DEFAULT NULL,
  `Cod_Grupo_id` bigint DEFAULT NULL,
  `Cod_Materia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GestionDB_dicta_Cod_Docente_id_a179dffd_fk_GestionDB_docente_id` (`Cod_Docente_id`),
  KEY `GestionDB_dicta_Cod_Grupo_id_18fba6ff_fk_GestionDB_grupo_id` (`Cod_Grupo_id`),
  KEY `GestionDB_dicta_Cod_Materia_id_075ecc61_fk_GestionDB_materia_id` (`Cod_Materia_id`),
  CONSTRAINT `GestionDB_dicta_Cod_Docente_id_a179dffd_fk_GestionDB_docente_id` FOREIGN KEY (`Cod_Docente_id`) REFERENCES `gestiondb_docente` (`id`),
  CONSTRAINT `GestionDB_dicta_Cod_Grupo_id_18fba6ff_fk_GestionDB_grupo_id` FOREIGN KEY (`Cod_Grupo_id`) REFERENCES `gestiondb_grupo` (`id`),
  CONSTRAINT `GestionDB_dicta_Cod_Materia_id_075ecc61_fk_GestionDB_materia_id` FOREIGN KEY (`Cod_Materia_id`) REFERENCES `gestiondb_materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_dicta`
--

LOCK TABLES `gestiondb_dicta` WRITE;
/*!40000 ALTER TABLE `gestiondb_dicta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiondb_dicta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_docente`
--

DROP TABLE IF EXISTS `gestiondb_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_docente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_Docente` varchar(50) NOT NULL,
  `apellido_Docente` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_docente`
--

LOCK TABLES `gestiondb_docente` WRITE;
/*!40000 ALTER TABLE `gestiondb_docente` DISABLE KEYS */;
INSERT INTO `gestiondb_docente` VALUES (1,'Samuel','Achá Perez','achaperez@gmail.com','mantequilla'),(2,'Luis Roberto','Agreda Corrales','agredacorrales@gmail.com','mantequilla'),(3,'Wilson Gonzalo','Aguilar Mamani','aguilarmamani@gmail.com','mantequilla'),(4,'Ivan Felix','Aguirre Torrico','aguirretorrico@gmail.com','mantequilla'),(5,'Richard Cesar','Alcocer Garnica','alcocergarnica@gmail.com','mantequilla'),(6,'Juan Nolasco','Alcon Puña','alconpuña@gmail.com','mantequilla'),(7,'Lucio','Alejo Espinoza','alejoespinoza@gmail.com','mantequilla'),(8,'Gonzalo','Alfaro Denus','alfarodenus@gmail.com','mantequilla'),(9,'Emilio','Aliss Paredes','alissparedes@gmail.com','mantequilla'),(10,'Maria Mercedes','Alvarez Caero','alvarezcaero@gmail.com','mantequilla'),(11,'Richard Milton','Alvarez Quiroz','alvarezquiroz@gmail.com','mantequilla'),(12,'Marko Jorge','Andrade Uzieta','andradeuzieta@gmail.com','mantequilla'),(13,'Marcelo','Antezana Camacho','antezanacamacho@gmail.com','mantequilla'),(14,'Henry','Antezana Fernandez','antezanafernandez@gmail.com','mantequilla'),(15,'Victor Hugo','Antezana Nogales','antezananogales@gmail.com','mantequilla'),(16,'Omar','Antezana Roman','antezanaroman@gmail.com','mantequilla'),(17,'Carola','Antezana Valera','antezanavalera@gmail.com','mantequilla'),(18,'Tatiana ','Aparicio Yuja','aparicioyuja@gmail.com','mantequilla'),(19,'Marcelo Eduardo','Arancibia Guzman','arancibiaguzman@gmail.com','mantequilla'),(20,'Marco Antonio','Arancibia Miranda','arancibiamiranda@gmail.com','mantequilla'),(21,'Ligia Jaqueline','Aranibar Lafuente','aranibarlafuente@gmail.com','mantequilla'),(22,'Joaquin Ricardo','Araoz Jaldin','araozjaldin@gmail.com','mantequilla'),(23,'Omar Orlando','Arce Garcia','arcegarcia@gmail.com','mantequilla'),(24,'Alberto','Arispe Santander','arispesantander@gmail.com','mantequilla'),(25,'Walter ','Arispe Santander','arispesantander2@gmail.com','mantequilla'),(26,'Maria Del Carmen','Arnez Camacho','arnezcamacho@gmail.com','mantequilla'),(27,'Edith Maritza','Arnez Torrico','arneztorrico@gmail.com','mantequilla'),(28,'Silvia Susana','Arrazola Rivero','arrazolarivero@gmail.com','mantequilla'),(29,'Jose Omar','Arzabe Maure','arzabemaure@gmail.com','mantequilla'),(30,'Margoth','Atahuachi','atahuachi@gmail.com','mantequilla'),(31,'Martha Teresa','Avila Alba','avilaalba@gmail.com','mantequilla'),(32,'Alfredo ','Avila Lara','avilalara@gmail.com','mantequilla'),(33,'Jaime','Ayllon Acosta','ayllonacosta@gmail.com','mantequilla'),(34,'Jose Richard','Ayoroa Cardozo','ayoroacardozo@gmail.com','mantequilla'),(35,'Pablo','Azero Alcocer','azeroalcocer@gmail.com','mantequilla'),(36,'Roger Wilmer','Balderrama Angulo','Balderramaangulo@gmail.com','mantequilla'),(37,'Jose Luis','Balderrama Idina','balderramaidina@gmail.com','mantequilla'),(38,'Jose Antonio','Balderrama Torrico','balderramatorrico@gmail.com','mantequilla'),(39,'Rene Jesus','Baldivieso Saenz','Baldiviesosaenz@gmail.com','mantequilla'),(40,'Lizeth Monica','Baptista Chuya','baptistachuya@gmail.com','mantequilla'),(41,'Toribio','Bautista Herbas','bautistaherbas@gmail.com','mantequilla'),(42,'Leticia','Blanco Coca','blancococa@gmail.com','mantequilla'),(43,'Maria Lidia Amparo','Bruckner Bazoberry','brucknerbazoberry@gmail.com','mantequilla'),(44,'Alex Isrrael','Bustillos Vargas','bustillosvargas@gmail.com','mantequilla'),(45,'Fernando','Butron Gandarillas','butrongandarillas@gmail.com','mantequilla'),(46,'Javier ','Caballero Flores','caballeroflores@gmail.com','mantequilla'),(47,'Jennifer','Cahill Mangudo','cahillmangudo@gmail.com','mantequilla'),(48,'Boris','Calancha Navia','calanchanavia@gmail.com','mantequilla'),(49,'Indira','Camacho Del Castillo','camachodelcastillo@gmail.com','mantequilla'),(50,'Christian Boris','Camacho Peña','camachopeña@gmail.com','mantequilla'),(51,'Roger Orlando','Camacho Quiroga','camachoquiroga@gmail.com','mantequilla'),(52,'Jimmy Erick','Camacho Villazon','camachovillazon@gmail.com','mantequilla'),(53,'Walter','Canedo Espinoza','canedoespinoza@gmail.com','mantequilla'),(54,'Sergio Carlos','Carballo Cadima','carballocadima@gmail.com','mantequilla'),(55,'Alvaro Hernando','Carrasco Calvo','carrascocalvo@gmail.com','mantequilla'),(56,'Dilian','Castellon Reynaga','castellonreynaga@gmail.com','mantequilla'),(57,'Raul Fernando','Castellon Torrico','castellontorrico@gmail.com','mantequilla'),(58,'Juan Carlos','Castillo Zegarra','castillozegarra@gmail.com','mantequilla'),(59,'Cecilia Beatriz','Castro Lazarte','castrolazarte@gmail.com','mantequilla'),(60,'Raul ','Catari Rios','cataririos@gmail.com','mantequilla'),(61,'Maria Benita','Cespedes Guizada','cespedesguizada@gmail.com','mantequilla'),(62,'Alex Danchgelo','Choque Flores','choqueflores@gmail.com','mantequilla'),(63,'Francisco','Choque Uno','choqueuno@gmail.com','mantequilla'),(64,'Luis Gualberto','Claros Cruz','claroscruz@gmail.com','mantequilla'),(65,'Patricia Angelica','Claure Richard','claurerichard@gmail.com','mantequilla'),(66,'Juan Carlos','Coca Mendez','cocamendez@gmail.com','mantequilla'),(67,'Carlos Javier Alfredo','Cosio Papadopolis','cosiopapadopolis@gmail.com','mantequilla'),(68,'Walter Felix','Cossio Cabrera','cossiocabrera@gmail.com','mantequilla'),(69,'Vladimir Abel','Costas Jauregui','costasjauregui@gmail.com','mantequilla'),(70,'Alberto Rudy','Crespo Garcia','crespogarcia@gmail.com','mantequilla'),(71,'Oscar ','Cuellar Olivera','cuellarolivera@gmail.com','mantequilla'),(72,'Gualberto','Cupe Clemente','cupeclemente@gmail.com','mantequilla'),(73,'Grover Humberto','Cussi Nicolas','cussinicolas@gmail.com','mantequilla'),(74,'Jorge','Davalos Brozovic','davalosbrozovic@gmail.com','mantequilla'),(75,'Marcelo Armando','Davila Cabrera','davilacabrera@gmail.com','mantequilla'),(76,'Marithza','Del Castillo Antezana','delcastilloantezana@gmail.com','mantequilla'),(77,'David Alfredo','Delgadillo Cossio','delgadillocossio@gmail.com','mantequilla'),(78,'Rolando','Diaz Coimbra','diazcoimbra@gmail.com','mantequilla'),(79,'Gerardo','Dominguez','dominguez@gmail.com','mantequilla'),(80,'Carmen Rosario','Dominguez Blanco','dominguezblanco@gmail.com','mantequilla'),(81,'Raul Agapito','Dominguez Chura','dominguezchura@gmail.com','mantequilla'),(82,'Jorge Martin','Duchen Ayala','duchenayala@gmail.com','mantequilla'),(83,'Rodrigo Carlos','Echeverria Herrera','echeverriaherrera@gmail.com','mantequilla'),(84,'Marcelo','Eduardo Franz','eduardofranz@gmail.com','mantequilla'),(85,'David','Escalera Fernandez','escalerafernandez@gmail.com','mantequilla'),(86,'Edwin','Escalera Mejia','escaleramejia@gmail.com','mantequilla'),(87,'Armando ','Escalera Vasquez','escaleravasquez@gmail.com','mantequilla'),(88,'Marco ','Escobar Seleme','escobarseleme@gmail.com','mantequilla'),(89,'Jenny','Espinoza Alcocer','espinozaalcocer@gmail.com','mantequilla'),(90,'Jose ','Espinoza Orosco','espinozaorosco@gmail.com','mantequilla'),(91,'Ruben','Espinoza Orosco','espinozaorosco2@gmail.com','mantequilla'),(92,'Milton','Fernandez Calatayud','fernandezcalatayud@gmail.com','mantequilla'),(93,'Helder Octavio','Fernandez Guzman','fernandezguzman@gmail.com','mantequilla'),(94,'Juan A.','Fernandez Leon','fernandezleon@gmail.com','mantequilla'),(95,'David','Fernandez Ramos','fernandezramos@gmail.com','mantequilla'),(96,'Hugo William','Fernandez Rios','fernandezrios@gmail.com','mantequilla'),(97,'Erika','Fernandez Terrazas','fernandezterrazas@gmail.com','mantequilla'),(98,'Erick Vladimir','Ferrufino Guardia','ferrufinoguardia@gmail.com','mantequilla'),(99,'Americo','Fiorilo Lozada','fiorilolozada@gmail.com','mantequilla'),(100,'Oscar','Florero Ortuño','floreroortuño@gmail.com','mantequilla'),(101,'Freddy','Flores Flores','floresflores@gmail.com','mantequilla'),(102,'Hernan','Flores Garcia','floresgarcia@gmail.com','mantequilla'),(103,'Abraham','Flores Rios','floresrios@gmail.com','mantequilla'),(104,'Juan Marcelo','Flores Soliz','floressoliz@gmail.com','mantequilla'),(105,'Corina','Flores Villaroel','floresvillaroel@gmail.com','mantequilla'),(106,'Ivan ','Fuentes Miranda','fuentesmiranda@gmail.com','mantequilla'),(107,'Angel','Galarza Barron','galarzabarron@gmail.com','mantequilla'),(108,'Oscar Ricardo','Garcia Anturiano','garciaanturiano@gmail.com','mantequilla'),(109,'Juan Ruben','Garcia Molina','garciamolina@gmail.com','mantequilla'),(110,'Ana Lineth','Garcia Orellana','garciaorellana@gmail.com','mantequilla'),(111,'Carmen Rosa','Garcia Perez','garciaperez@gmail.com','mantequilla'),(112,'Rolando','Garnica Arostegui','garnicaarostegui@gmail.com','mantequilla'),(113,'Andres','Garrido Vargas','garridovargas@gmail.com','mantequilla'),(114,'Maria Esther','Giannini Zallocco','gianninizalloco@gmail.com','mantequilla'),(115,'Edgar','Goitia Arce','goitiaarce@gmail.com','mantequilla'),(116,'Oscar Javier','Goitia Arze','goitiaarze@gmail.com','mantequilla'),(117,'Guido','Gomez Ugarte','gomezugarte@gmail.com','mantequilla'),(118,'Nelson Emilio','Gomez Vargas','gomezvargas@gmail.com','mantequilla'),(119,'Raul Humberto','Gonzales Acosta','gonzalesacosta@gmail.com','mantequilla'),(120,'Andres Saul','Gonzales Amaya','gonzalesamaya@gmail.com','mantequilla'),(121,'Lucio','Gonzales Cartagena','gonzalescartagena@gmail.com','mantequilla'),(122,'Carlos Esteban','Gonzales Castellon','gonzalescastellon@gmail.com','mantequilla'),(123,'Maria Estela','Grilo Salvatierra','grilosalvatierra@gmail.com','mantequilla'),(124,'Roxana ','Guillen Salvador','guillensalvador@gmail.com','mantequilla'),(125,'Osvaldo Walter','Gutierrez Andrade','gutierrezandrade@gmail.com','mantequilla'),(126,'Victor','Gutierrez Martinez','gutierrezmartinez@gmail.com','mantequilla'),(127,'Gerardo','Guzman Alanes','guzmanalanes@gmail.com','mantequilla'),(128,'Gonzalo Enrique Antonio','Guzman Orellana','guzmanorellana@gmail.com','mantequilla'),(129,'Rocio','Guzman Saavedra','guzmansaavedra@gmail.com','mantequilla'),(130,'Hector Orlando','Guzman Suarez','guzmansuarez@gmail.com','mantequilla'),(131,'Adelina','Herbas Angulo','herbasangulo@gmail.com','mantequilla'),(132,'Boris Christian','Herbas Torrico','herbastorrico@gmail.com','mantequilla'),(133,'Marcelo Waldo','Heredia Gomez','herediagomez@gmail.com','mantequilla'),(134,'Wilson','Heredia Soliz','herediasoliz@gmail.com','mantequilla'),(135,'Mary Isabel','Hidalgo Sanchez','hidalgosanchez@gmail.com','mantequilla'),(136,'Nelson','Hinojosa Salazar','hinojosasalazar@gmail.com','mantequilla'),(137,'Marcelo Jose','Hinojosa Torrico','hinojosatorrico@gmail.com','mantequilla'),(138,'Mauricio','Hoepfner Reynolds','hoepfnerreynolds@gmail.com','mantequilla'),(139,'Ronald','Hosse Sahonero','hossesahonero@gmail.com','mantequilla'),(140,'Mercedes','Iriarte Puña','iriartepuña@gmail.com','mantequilla'),(141,'Hernan ','Jaldin Florero','jaldinflorero@gmail.com','mantequilla'),(142,'K. Rolando','Jaldin Rosales','jaldinrosales@gmail.com','mantequilla'),(143,'Juan','Jaldin Salazar','jaldinsalazar@gmail.com','mantequilla'),(144,'Maria Ivonne','Jauregui Carrasco','jaureguicarrasco@gmail.com','mantequilla'),(145,'Carlos Gaston','Joffre Lara','joffrelara@gmail.com','mantequilla'),(146,'Demetrio','Juchani Bazualdo','juchanibazualdo@gmail.com','mantequilla'),(147,'Valentin','Laime Zapata','laimezapata@gmail.com','mantequilla'),(148,'Wilhelm Eduardo','Lange Gonzales','langegonzales@gmail.com','mantequilla'),(149,'Patricia Sandra','Lazarte Astulla','lazarteastulla@gmail.com','mantequilla'),(150,'Luis ','Lazarte Villaroel','lazartevillaroel@gmail.com','mantequilla'),(151,'Fernando Arturo','Ledezma Perizza','ledezmaperizza@gmail.com','mantequilla'),(152,'Gualberto','Leon Romero','leonromero@gmail.com','mantequilla'),(153,'Tito Anibal','Lima Vacaflor','limavacaflor@gmail.com','mantequilla'),(154,'Edgar ','Llave Vincenti','llavevincenti@gmail.com','mantequilla'),(155,'Javier Bernardo','Lopez Arze','lopezarze@gmail.com','mantequilla'),(156,'Maria Alicia','Lopez Lopez','lopezlopez@gmail.com','mantequilla'),(157,'Grover Dante','Lopez Loredo','lopezloredo@gmail.com','mantequilla'),(158,'Marcelo Javier','Lucano Lucano','lucanolucano@gmail.com','mantequilla'),(159,'Mabel Gloria','Magariños Villaroel','magariñosvillaroel@gmail.com','mantequilla'),(160,'Raul','Maldonado Cespedes','maldonadocespedes@gmail.com','mantequilla'),(161,'Eliana Mirtha','Maldonado Gutierrez','maldonadogutierrez@gmail.com','mantequilla'),(162,'Pascual','Maldonado Lopez','maldonadolopez@gmail.com','mantequilla'),(163,'Mabel','Maldonado Maldonado','maldonadomaldonado@gmail.com','mantequilla'),(164,'Roberto Juan','Manchego Castellon','manchegocastellon@gmail.com','mantequilla'),(165,'Juvenal','Manzaneda Mamani','manzanedamamani@gmail.com','mantequilla'),(166,'Carlos B.','Manzur Soria','manzursoria@gmail.com','mantequilla'),(167,'Amilcar Saul','Martinez Maida','martinezmaida@gmail.com','mantequilla'),(168,'Vidal','Matias Marca','matiasmarca@gmail.com','mantequilla'),(169,'Julio','Medina Gamboa','medinagamboa@gmail.com','mantequilla'),(170,'Ruder','Medrano Antezana','medranoantezana@gmail.com','mantequilla'),(171,'Nora','Medrano Mercado','medranomercado@gmail.com','mantequilla'),(172,'Victor Ramiro','Mejia Urquieta','mejiaurquieta@gmail.com','mantequilla'),(173,'Roberto','Mendez Torrico','mendeztorrico@gmail.com','mantequilla'),(174,'Ivan','Mendez Velasquez','mendezvelasquez@gmail.com','mantequilla'),(175,'Sonia','Mendieta Brito','mendietabrito@gmail.com','mantequilla'),(176,'Alvaro Rodolfo','Mercado Guzman','mercadoguzman@gmail.com','mantequilla'),(177,'Reinaldo','Merida Lopez','meridalopez@gmail.com','mantequilla'),(178,'Jose','Meruvia Meruvia','meruviameruvia@gmail.com','mantequilla'),(179,'Felix','Meza Rosso','mezarosso@gmail.com','mantequilla'),(180,'Ana Maria','Michel Vargas','michelvargas@gmail.com','mantequilla'),(181,'Juan Francisco','Montaño Anaya','montañoanaya@gmail.com','mantequilla'),(182,'Sergio Arnaldo','Montaño Medina','montañomedina@gmail.com','mantequilla'),(183,'Rosario','Montaño Merida','montañomerida@gmail.com','mantequilla'),(184,'Victor Hugo','Montaño Quiroga','montañoquiroga@gmail.com','mantequilla'),(185,'Marco Antonio','Montecinos Choque','montecinoschoque@gmail.com','mantequilla'),(186,'Luis Edgar','Montenegro Terrazas','montenegroterrazas@gmail.com','mantequilla'),(187,'Juan Jose Edgar','Montero Guevara','monteroguevara@gmail.com','mantequilla'),(188,'Yony Richard','Montoya Burgos','montoyaburgos@gmail.com','mantequilla'),(189,'Andres ','Morales Maldonado','moralesmaldonado@gmail.com','mantequilla'),(190,'Oscar','Morato Gamboa','moratogamboa@gmail.com','mantequilla'),(191,'Rene ','Moreira Calizaya','moreiracalizaya@gmail.com','mantequilla'),(192,'Boris Arturo','Moreira Rosas','moreirarosas@gmail.com','mantequilla'),(193,'Martin','Moya Albarracin','moyaalbarracin@gmail.com','mantequilla'),(194,'Hans Cristian','Muller Santa Cruz','mullersantacruz@gmail.com','mantequilla'),(195,'Maria Susana Del Rosario','Muñoz Collazos','muñozcollazos@gmail.com','mantequilla'),(196,'Vladimir Felix','Muñoz Quispe','muñozquispe@gmail.com','mantequilla'),(197,'Galo Osvaldo','Muñoz Vasquez','muñozvasquez@gmail.com','mantequilla'),(198,'Freddy ','Navarro Antezana','navarroantezana@gmail.com','mantequilla'),(199,'Jose Gil','Omonte Ojalvo','omonteojalvo@gmail.com','mantequilla'),(200,'Jose Roberto','Omonte Ojalvo','omonteojalvo2@gmail.com','mantequilla'),(201,'Carla ','Oporto','oporto@gmail.com','mantequilla'),(202,'Miguel Angel','Ordoñez Salvatierra','ordoñezsalvatierra@gmail.com','mantequilla'),(203,'Jorge Walter','Orellana Araoz','orellanaaraoz@gmail.com','mantequilla'),(204,'Jaime ','Orellana Jimenez','orellanajimenez@gmail.com','mantequilla'),(205,'Hernan ','Orsi Saldias','orsisaldias@gmail.com','mantequilla'),(206,'Roberto','Pacheco Garcia','pachecogarcia@gmail.com','mantequilla'),(207,'Juan Fernando','Pardo Iriarte','pardoiriarte@gmail.com','mantequilla'),(208,'Ronald Edgar','Patiño Tito','patiñotito@gmail.com','mantequilla'),(209,'Magda Lena','Peeters Ilonaa','peetersilonaa@gmail.com','mantequilla'),(210,'Jose Luis ','Perez Aparicio','perezaparicio@gmail.com','mantequilla'),(211,'Jose Roberto','Perez Cespedes','perezcespedes@gmail.com','mantequilla'),(212,'Maribel','Perez Chacon','perezchacon@gmail.com','mantequilla'),(213,'Omar David','Perez Fuentes','perezfuentes@gmail.com','mantequilla'),(214,'Gustavo Adolfo','Perez Parra','perezparra@gmail.com','mantequilla'),(215,'Yuri German','Perez Peredo','perezperedo@gmail.com','mantequilla'),(216,'Daysi Del Rosario','Perez Rea','perezrea@gmail.com','mantequilla'),(217,'Jose Carlos','Perez Zubieta','perezzubieta@gmail.com','mantequilla'),(218,'Alfredo','Pericon Balderrama','periconbalderrama@gmail.com','mantequilla'),(219,'Mauricio Luis','Ponce Del Leon','poncedelleon@gmail.com','mantequilla'),(220,'Leyton Jorge','Quillaguaman','quillaguaman@gmail.com','mantequilla'),(221,'Abdon','Quiroz Chavez','quirozchavez@gmail.com','mantequilla'),(222,'Santiago','Relos Paco','pelospaco@gmail.com','mantequilla'),(223,'Luz Maya','Revollo Teran','revolloteran@gmail.com','mantequilla'),(224,'Gaston Gil','Rioja Cardenas','riojacardenas@gmail.com','mantequilla'),(225,'Juan','Rios Del Prado','riosdelprado@gmail.com','mantequilla'),(226,'Mirtha Judith','Rivero Lujan','riverolujan@gmail.com','mantequilla'),(227,'Felix Rustan','Roca Subirana','rocasubirana@gmail.com','mantequilla'),(228,'Juan Carlos','Rocha Cuadros','rochacuadros@gmail.com','mantequilla'),(229,'German','Rocha Maldonado','rochamaldonado@gmail.com','mantequilla'),(230,'Edwin Augusto','Rocha Triveño','rochatriveño@gmail.com','mantequilla'),(231,'Erika Patricia','Rodriguez Bilbao','rodriguezbilbao@gmail.com','mantequilla'),(232,'Juan Carlos','Rodriguez Ostria','rodriguezostria@gmail.com','mantequilla'),(233,'Carlos Alberto','Rodriguez Ramirez','rodriguezramirez@gmail.com','mantequilla'),(234,'Gabriel','Rodriguez Roca','rodriguezroca@gmail.com','mantequilla'),(235,'Juan Antonio','Rodriguez Sejas','rodriguezsejas@gmail.com','mantequilla'),(236,'Helmer Jimy','Rodriguez Soriano','rodriguezsoriano@gmail.com','mantequilla'),(237,'Cinthia Carola','Rojas Arnez','rojasarnez@gmail.com','mantequilla'),(238,'Jenny','Rojas Cespedes','rojascespedes@gmail.com','mantequilla'),(239,'Maria Fernanda','Rojas Michaga','rojasmichaga@gmail.com','mantequilla'),(240,'Hugo ','Rojas Salinas','rojassalinas@gmail.com','mantequilla'),(241,'Ramiro','Rojas Zurita','rojaszurita@gmail.com','mantequilla'),(242,'Manuel Fdo.','Roman Arispe','romanarispe@gmail.com','mantequilla'),(243,'Raul','Romero Encinas','romeroencinas@gmail.com','mantequilla'),(244,'Ana Maria','Romero Jaldin','romerojaldin@gmail.com','mantequilla'),(245,'Patricia','Romero Rodriguez','romerorodriguez@gmail.com','mantequilla'),(246,'Olga ','Ruiz Betancur','ruizbetancur@gmail.com','mantequilla'),(247,'Ivan','Ruiz Ucumari','ruizucumari@gmail.com','mantequilla'),(248,'Felipe Ramiro','Saavedra Antezana','saavedraantezana@gmail.com','mantequilla'),(249,'Oscar','Saca Ventura','sacaventura@gmail.com','mantequilla'),(250,'Ricardo','Sahonero Irahola','sahoneroirahola@gmail.com','mantequilla'),(251,'Rosemary','Salazar Anaya','salazaranaya@gmail.com','mantequilla'),(252,'Carla','Salazar Serrudo','salazarserrudo@gmail.com','mantequilla'),(253,'Luis Mauricio','Salinas Pereira','salinaspereira@gmail.com','mantequilla'),(254,'Walter Oscar Gonzalo','Salinas Pericon','salinaspericon@gmail.com','mantequilla'),(255,'Arturo','Saramani Aguilar','saramaniaguilar@gmail.com','mantequilla'),(256,'Ariel Antonio','Sarmiento Franco','sarmientofranco@gmail.com','mantequilla'),(257,'Angelica','Severiche Chacon','severichechacon@gmail.com','mantequilla'),(258,'Galina','Shitikov Gagarina','shitikovgagarina@gmail.com','mantequilla'),(259,'Rene Fernando','Soliz Martinez','solizmartinez@gmail.com','mantequilla'),(260,'Jose Antonio','Soruco Maita','sorucomaita@gmail.com','mantequilla'),(261,'Juan Carlos','Soto Moreira','sotomoreira@gmail.com','mantequilla'),(262,'Jose Roberto','Soto Soliz','sotosoliz@gmail.com','mantequilla'),(263,'Cesar Martin','Suarez Suarez','suarezsuarez@gmail.com','mantequilla'),(264,'Fidel','Taborga Acha','taborgaacha@gmail.com','mantequilla'),(265,'Jose Felix','Tancara Sandagorda','tancarasandagorda@gmail.com','mantequilla'),(266,'Darlong Howard','Taylor Terrazas','taylorterrazas@gmail.com','mantequilla'),(267,'Rodolfo Raul','Teran Aiza','teranaiza@gmail.com','mantequilla'),(268,'Juan','Terrazas Lobo','terrazaslobo@gmail.com','mantequilla'),(269,'Israel','Terrazas Maldonado','terrazasmaldonado@gmail.com','mantequilla'),(270,'Juan Carlos','Terrazas Vargas','terrazasvargas@gmail.com','mantequilla'),(271,'Julio Marcelo','Torrejon Rocabado','torrejonrocabado@gmail.com','mantequilla'),(272,'Epifanio Julio','Torres Navarro','torresnavarro@gmail.com','mantequilla'),(273,'Raul Wilder','Torrez Pelaez','torrezpelaez@gmail.com','mantequilla'),(274,'Edwin Teofilo','Torrez Quinteros','torrezquiteros@gmail.com','mantequilla'),(275,'Norman','Torrico Barron','torricobarron@gmail.com','mantequilla'),(276,'Rosemary','Torrico Bascope','torricobascope@gmail.com','mantequilla'),(277,'Rene','Torrico Mejia','torricomejia@gmail.com','mantequilla'),(278,'Milka Monica','Torrico Troche','torricotroche@gmail.com','mantequilla'),(279,'Sonia ','Torrico Vallejos','torricovallejos@gmail.com','mantequilla'),(280,'Ingrid Vicky','Trigo Rocha','trigorocha@gmail.com','mantequilla'),(281,'Pedro','Triveno Herrera','trivenoherrera@gmail.com','mantequilla'),(282,'Wilson Orlando','Trujillo Aranibar','trujilloaranibar@gmail.com','mantequilla'),(283,'Felix','Ugarte Cejas','ugartecejas@gmail.com','mantequilla'),(284,'Edwin Claudio','Ureña Perez','ureñaperez@gmail.com','mantequilla'),(285,'Mario','Urey Contreras','ureycontreras@gmail.com','mantequilla'),(286,'Jose A.','Urrutia Medrano','urrutiamedrano@gmail.com','mantequilla'),(287,'Jose Gabriel','Urrutia Zelada','urrutiazelada@gmail.com','mantequilla'),(288,'Victor Rene','Ustariz Aramayo','ustarizaramayo@gmail.com','mantequilla'),(289,'Hernan','Ustaris Vargas','ustarisvargas@gmail.com','mantequilla'),(290,'Roberto','Valenzuela Miranda','valenzuelamiranda@gmail.com','mantequilla'),(291,'Marco Antonio','Vallejo Camacho','vallejocamacho@gmail.com','mantequilla'),(292,'Ademar Marcelo','Vargas Antezana','vargasantezana@gmail.com','mantequilla'),(293,'Aidee','Vargas Colque','vargascolque@gmail.com','mantequilla'),(294,'Emir Felix','Vargas Peredo','vargasperedo@gmail.com','mantequilla'),(295,'Carlos Alberto','Vargas Quiroz','vargasquiroz@gmail.com','mantequilla'),(296,'Juan Carlos','Vargas Reinaga','vargasreinaga@gmail.com','mantequilla'),(297,'Luz Virginia','Vargas Vallejos','vargasvallejos@gmail.com','mantequilla'),(298,'Michael Huascar','Vasquez Carrillo','vasquezcarrillo@gmail.com','mantequilla'),(299,'Wilfredo','Vega Alfaro','vegaalfaro@gmail.com','mantequilla'),(300,'Carlos Alberto','Vera Cortes','veracortes@gmail.com','mantequilla'),(301,'Luis Antonio','Vilaseca Gamarra','vilasecagamarra@gmail.com','mantequilla'),(302,'Gilarmando','Villaroel','villaroel@gmail.com','mantequilla'),(303,'Jimmy','Villaroel Novillo','villaroelnovillo@gmail.com','mantequilla'),(304,'Henry Frank','Villaroel Tapia','villaroeltapia@gmail.com','mantequilla'),(305,'Mauricio Florencio','Villazon Gomez','villazongomez@gmail.com','mantequilla'),(306,'Yamir','Villazon Rocha','villazonrocha@gmail.com','mantequilla'),(307,'Marco Antonio','Viscarra Vargas','viscarravargas@gmail.com','mantequilla'),(308,'Oscar A. ','Zabalaga Montaño','zabalagamontaño@gmail.com','mantequilla'),(309,'Mario Grover','Zalles Medrano','zallesmedrano@gmail.com','mantequilla'),(310,'Jhomil Efrain','Zambrana Burgos','zambranaburgos@gmail.com','mantequilla'),(311,'Jose Eduardo','Zambrana Montan','zambranamontan@gmail.com','mantequilla'),(312,'Jorge','Zambrana Vilar','zambranavilar@gmail.com','mantequilla'),(313,'Maria E.','Zapata Schultze','zapataschltze@gmail.com','mantequilla'),(314,'Luis Roberto','Zegarra Dorado','zegarradorado@gmail.com','mantequilla'),(315,'Rimer Mauricio','Zurita Orellana','zuritaorellana@gmail.com','mantequilla');
/*!40000 ALTER TABLE `gestiondb_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_grupo`
--

DROP TABLE IF EXISTS `gestiondb_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_grupo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Numero_Grupo` varchar(32) NOT NULL,
  `Cod_Materia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GestionDB_grupo_Cod_Materia_id_cfc732f3_fk_GestionDB_materia_id` (`Cod_Materia_id`),
  CONSTRAINT `GestionDB_grupo_Cod_Materia_id_cfc732f3_fk_GestionDB_materia_id` FOREIGN KEY (`Cod_Materia_id`) REFERENCES `gestiondb_materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_grupo`
--

LOCK TABLES `gestiondb_grupo` WRITE;
/*!40000 ALTER TABLE `gestiondb_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiondb_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_materia`
--

DROP TABLE IF EXISTS `gestiondb_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_materia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_materia`
--

LOCK TABLES `gestiondb_materia` WRITE;
/*!40000 ALTER TABLE `gestiondb_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiondb_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiondb_reserva`
--

DROP TABLE IF EXISTS `gestiondb_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiondb_reserva` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cant_Periodos` int NOT NULL,
  `fecha_Reserva` time(6) NOT NULL,
  `Fecha_Solicitud_Res` time(6) NOT NULL,
  `motivo` varchar(256) NOT NULL,
  `cant_Estudiantes` int NOT NULL,
  `Cod_Docente_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GestionDB_reserva_Cod_Docente_id_eafeaf18_fk_GestionDB` (`Cod_Docente_id`),
  CONSTRAINT `GestionDB_reserva_Cod_Docente_id_eafeaf18_fk_GestionDB` FOREIGN KEY (`Cod_Docente_id`) REFERENCES `gestiondb_docente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiondb_reserva`
--

LOCK TABLES `gestiondb_reserva` WRITE;
/*!40000 ALTER TABLE `gestiondb_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestiondb_reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03 17:40:31
