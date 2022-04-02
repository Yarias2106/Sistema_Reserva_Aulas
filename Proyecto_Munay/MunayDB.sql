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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Z2Qf7OaOAq8pg5AuIbqyVd$EOJyhIZQrrut9htUFCDEJb8r93Vpqv0S8ZCUEXglgss=','2022-04-02 04:53:03.182706',1,'munay','','','munayTec@gmail.com',1,1,'2022-04-02 04:52:47.539165'),(2,'pbkdf2_sha256$260000$HRR02kLCbQ7xDL3cJldmRp$Pb0i4Nse8tAVUn5rj6fhWq9ivkJEJzcNsHQVz3bYlWI=',NULL,0,'achaperez@gmail.com','','','',0,1,'2022-04-02 04:56:46.000000'),(3,'pbkdf2_sha256$260000$CCViZj1Wqc843FUVWRb4aE$6MhuMxv+FihCRtyMclWVxYv0QtCLG5v4KwW+/e9Yqo0=',NULL,0,'agredacorrales@gmail.com','','','',0,1,'2022-04-02 04:59:19.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-02 04:56:47.208603','2','achaperez@gmail.com',1,'[{\"added\": {}}]',4,1),(2,'2022-04-02 04:57:24.704931','2','achaperez@gmail.com',2,'[]',4,1),(3,'2022-04-02 04:59:19.629280','3','agredacorrales@gmail.com',1,'[{\"added\": {}}]',4,1),(4,'2022-04-02 04:59:22.162672','3','agredacorrales@gmail.com',2,'[]',4,1);
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
INSERT INTO `gestiondb_docente` VALUES (1,'Samuel','Achá Perez','achaperez@gmail.com','mantequilla'),(2,'Luis Roberto','Agreda Corrales','agredacorrales@gmail.com','mantequilla'),(3,'Wilson Gonzalo','Aguilar Mamani','aguilarmamani@gmail.com','mantequilla'),(4,'Ivan Felix','Aguirre Torrico','aguirretorrico@gmail.com','mantequilla'),(5,'Richard Cesar','Alcocer Garnica','alcocergarnica@gmail.com','mantequilla'),(6,'Juan Nolasco','Alcon Puña','alconpuña@gmail.com','mantequilla'),(7,'Lucio','Alejo Espinoza','alejoespinoza@gmail.com','mantequilla'),(8,'Gonzalo','Alfaro Denus','alfarodenus@gmail.com','mantequilla'),(9,'Emilio','Aliss Paredes','alissparedes@gmail.com','mantequilla'),(10,'Maria Mercedes','Alvarez Caero','alvarezcaero@gmail.com','mantequilla'),(11,'Richard Milton','Alvarez Quiroz','alvarezquiroz@gmail.com','mantequilla'),(12,'Marko Jorge','Andrade Uzieta','andradeuzieta@gmail.com','mantequilla'),(13,'Marcelo','Antezana Camacho','antezanacamacho@gmail.com','mantequilla'),(14,'Henry','Antezana Fernandez','antezanafernandez@gmail.com','mantequilla'),(15,'Victor Hugo','Antezana Nogales','antezananogales@gmail.com','mantequilla'),(16,'Omar','Antezana Roman','antezanaroman@gmail.com','mantequilla'),(17,'Carola','Antezana Valera','antezanavalera@gmail.com','mantequilla'),(18,'Tatiana ','Aparicio Yuja','aparicioyuja@gmail.com','mantequilla'),(19,'Marcelo Eduardo','Arancibia Guzman','arancibiaguzman@gmail.com','mantequilla'),(20,'Marco Antonio','Arancibia Miranda','aranciabiamiranda@gmail.com','mantequilla'),(21,'Ligia Jaqueline','Aranibar Lafuente','aranibarlafuente@gmail.com','mantequilla'),(22,'Joaquin Ricardo','Araoz Jaldin','araozjaldin@gmail.com','mantequilla'),(23,'Omar Orlando','Arce Garcia','arcegarcia@gmail.com','mantequilla'),(24,'Alberto','Arispe Santander','arispesantander@gmail.com','mantequilla'),(25,'Walter ','Arispe Santander','arispesantander2@gmail.com','mantequilla'),(26,'Maria Del Carmen','Arnez Camacho','arnezcamacho@gmail.com','mantequilla'),(27,'Edith Maritza','Arnez Torrico','arneztorrico@gmail.com','mantequilla'),(28,'Silvia Susana','Arrazola Rivero','arrazolarivero@gmail.com','mantequilla'),(29,'Jose Omar','Arzabe Maure','arzabemaure@gmail.com','mantequilla'),(30,'Margoth','Atahuachi','atahuachi@gmail.com','mantequilla'),(31,'Martha Teresa','Avila Alba','avilaalba@gmail.com','mantequilla'),(32,'Alfredo ','Avila Lara','avilalara@gmail.com','mantequilla'),(33,'Jaime','Ayllon Acosta','ayllonacosta@gmail.com','mantequilla'),(34,'Jose Richard','Ayoroa Cardozo','ayoroacardozo@gmail.com','mantequilla'),(35,'Pablo','Azero Alcocer','azeroalcocer@gmail.com','mantequilla'),(36,'Roger Wilmer','Balderrama Angulo','Balderramaangulo@gmail.com','mantequilla'),(37,'Jose Luis','Balderrama Idina','balderramaidina@gmail.com','mantequilla'),(38,'Jose Antonio','Balderrama Torrico','balderramatorrico@gmail.com','mantequilla'),(39,'Rene Jesus','Baldivieso Saenz','Baldiviesosaenz@gmail.com','mantequilla'),(40,'Lizeth Monica','Baptista Chuya','baptistachuya@gmail.com','mantequilla'),(41,'Toribio','Bautista Herbas','bautistaherbas@gmail.com','mantequilla'),(42,'Leticia','Blanco Coca','blancococa@gmail.com','mantequilla'),(43,'Maria Lidia Amparo','Bruckner Bazoberry','brucknerbazoberry@gmail.com','mantequilla'),(44,'Alex Isrrael','Bustillos Vargas','bustillosvargas@gmail.com','mantequilla'),(45,'Fernando','Butron Gandarillas','butrongandarillas@gmail.com','mantequilla'),(46,'Javier ','Caballero Flores','caballeroflores@gmail.com','mantequilla'),(47,'Jennifer','Cahill Mangudo','cahillmangudo@gmail.com','mantequilla'),(48,'Boris','Calancha Navia','calanchanavia@gmail.com','mantequilla'),(49,'Indira','Camacho Del Castillo','camachodelcastillo@gmail.com','mantequilla'),(50,'Christian Boris','Camacho Peña','camachopeña@gmail.com','mantequilla'),(51,'Roger Orlando','Camacho Quiroga','camachoquiroga@gmail.com','mantequilla'),(52,'Jimmy Erick','Camacho Villazon','camachovillazon@gmail.com','mantequilla'),(53,'Walter','Canedo Espinoza','canedoespinoza@gmail.com','mantequilla'),(54,'Sergio Carlos','Carballo Cadima','carballocadima@gmail.com','mantequilla'),(55,'Alvaro Hernando','Carrasco Calvo','carrascocalvo@gmail.com','mantequilla'),(56,'Dilian','Castellon Reynaga','castellonreynaga@gmail.com','mantequilla'),(57,'Raul Fernando','Castellon Torrico','castellontorrico@gmail.com','mantequilla'),(58,'Juan Carlos','Castillo Zegarra','castillozegarra@gmail.com','mantequilla'),(59,'Cecilia Beatriz','Castro Lazarte','castrolazarte@gmail.com','mantequilla'),(60,'Raul ','Catari Rios','cataririos@gmail.com','mantequilla'),(61,'Maria Benita','Cespedes Guizada','cespedesguizada@gmail.com','mantequilla'),(62,'Alex Danchgelo','Choque Flores','choqueflores@gmail.com','mantequilla'),(63,'Francisco','Choque Uno','choqueuno@gmail.com','mantequilla'),(64,'Luis Gualberto','Claros Cruz','claroscruz@gmail.com','mantequilla'),(65,'Patricia Angelica','Claure Richard','claurerichard@gmail.com','mantequilla'),(66,'Juan Carlos','Coca Mendez','cocamendez@gmail.com','mantequilla'),(67,'Carlos Javier Alfredo','Cosio Papadopolis','cosiopapadopolis@gmail.com','mantequilla'),(68,'Walter Felix','Cossio Cabrera','cossiocabrera','mantequilla'),(69,'Vladimir Abel','Costas Jauregui','costasjauregui@gmail.com','mantequilla'),(70,'Alberto Rudy','Crespo Garcia','crespogarcia@gmail.com','mantequilla'),(71,'Oscar ','Cuellar Olivera','cuellarolivera@gmail.com','mantequilla'),(72,'Gualberto','Cupe Clemente','cupeclemente@gmail.com','mantequilla'),(73,'Grover Humberto','Cussi Nicolas','cussinicolas@gmail.com','mantequilla'),(74,'Jorge','Davalos Brozovic','davalosbrozovic@gmail.com','mantequilla'),(75,'Marcelo Armando','Davila Cabrera','davilacabrera@gmail.com','mantequilla'),(76,'Marithza','Del Castillo Antezana','delcastilloantezana@gmail.com','mantequilla'),(77,'David Alfredo','Delgadillo Cossio','delgadillocossio@gmail.com','mantequilla'),(78,'Rolando','Diaz Coimbra','diazcoimbra@gmail.com','mantequilla'),(79,'Gerardo','Dominguez','dominguez@gmail.com','mantequilla'),(80,'Carmen Rosario','Dominguez Blanco','dominguezblanco@gmail.com','mantequilla'),(81,'Raul Agapito','Dominguez Chura','dominguezchura@gmail.com','mantequilla'),(82,'Jorge Martin','Duchen Ayala','duchenayala@gmail.com','mantequilla'),(83,'Rodrigo Carlos','Echeverria Herrera','echeverriaherrera@gmail.com','mantequilla'),(84,'Marcelo','Eduardo Franz','eduardofranz@gmail.com','mantequilla'),(85,'David','Escalera Fernandez','escalerafernandez@gmail.com','mantequilla'),(86,'Edwin','Escalera Mejia','escaleramejia@gmail.com','mantequilla'),(87,'Armando ','Escalera Vasquez','escaleravasquez@gmail.com','mantequilla'),(88,'Marco ','Escobar Seleme','escobarseleme@gmail.com','mantequilla'),(89,'Jenny','Espinoza Alcocer','espinozaalcocer@gmail.com','mantequilla'),(90,'Jose ','Espinoza Orosco','espinozaorosco@gmail.com','mantequilla'),(91,'Ruben','Espinoza Orosco','espinozaorosco2@gmail.com','mantequilla'),(92,'Milton','Fernandez Calatayud','fernandezcalatayud@gmail.com','mantequilla'),(93,'Helder Octavio','Fernandez Guzman','fernandezguzman@gmail.com','mantequilla'),(94,'Juan A.','Fernandez Leon','fernandezleon@gmail.com','mantequilla'),(95,'David','Fernandez Ramos','fernandezramos@gmail.com','mantequilla'),(96,'Hugo William','Fernandez Rios','fernandezrios@gmail.com','mantequilla'),(97,'Erika','Fernandez Terrazas','fernandezterrazas@gmail.com','mantequilla'),(98,'Erick Vladimir','Ferrufino Guardia','ferrufinoguardia@gmail.com','mantequilla'),(99,'Americo','Fiorilo Lozada','fiorilolozada@gmail.com','mantequilla'),(100,'Oscar','Florero Ortuño','floreroortuño@gmail.com','mantequilla'),(101,'Freddy','Flores Flores','floresflores@gmail.com','mantequilla'),(102,'Hernan','Flores Garcia','floresgarcia@gmail.com','mantequilla'),(103,'Abraham','Flores Rios','floresrios@gmail.com','mantequilla'),(104,'Juan Marcelo','Flores Soliz','floressoliz@gmail.com','mantequilla'),(105,'Corina','Flores Villaroel','floresvillaroel@gmail.com','mantequilla'),(106,'Ivan ','Fuentes Miranda','fuentesmiranda@gmail.com','mantequilla'),(107,'Angel','Galarza Barron','galarzabarron@gmail.com','mantequilla'),(108,'Oscar Ricardo','Garcia Anturiano','garciaanturiano@gmail.com','mantequilla'),(109,'Juan Ruben','Garcia Molina','garciamolina@gmail.com','mantequilla'),(110,'Ana Lineth','Garcia Orellana','garciaorellana@gmail.com','mantequilla'),(111,'Carmen Rosa','Garcia Perez','garciaperez@gmail.com','mantequilla'),(112,'Rolando','Garnica Arostegui','garnicaarostegui@gmail.com','mantequilla'),(113,'Andres','Garrido Vargas','garridovargas@gmail.com','mantequilla'),(114,'Maria Esther','Giannini Zallocco','gianninizalloco@gmail.com','mantequilla'),(115,'Edgar','Goitia Arce','goitiaarce@gmail.com','mantequilla'),(116,'Oscar Javier','Goitia Arze','goitiaarze@gmail.com','mantequilla'),(117,'Guido','Gomez Ugarte','gomezugarte@gmail.com','mantequilla'),(118,'Nelson Emilio','Gomez Vargas','gomezvargas@gmail.com','mantequilla'),(119,'Raul Humberto','Gonzales Acosta','gonzalesacosta@gmail.com','mantequilla'),(120,'Andres Saul','Gonzales Amaya','gonzalesamaya@gmail.com','mantequilla'),(121,'Lucio','Gonzales Cartagena','gonzalescartagena@gmail.com','mantequilla'),(122,'Carlos Esteban','Gonzales Castellon','gonzalescastellon@gmail.com','mantequilla'),(123,'Maria Estela','Grilo Salvatierra','grilosalvatierra@gmail.com','mantequilla'),(124,'Roxana ','Guillen Salvador','guillensalvador@gmail.com','mantequilla'),(125,'Osvaldo Walter','Gutierrez Andrade','gutierrezandrade@gmail.com','mantequilla'),(126,'Victor','Gutierrez Martinez','gutierrezmartinez@gmail.com','mantequilla'),(127,'Gerardo','Guzman Alanes','guzmanalanes@gmail.com','mantequilla'),(128,'Gonzalo Enrique Antonio','Guzman Orellana','guzmanorellana@gmail.com','mantequilla'),(129,'Rocio','Guzman Saavedra','guzmansaavedra@gmail.com','mantequilla'),(130,'Hector Orlando','Guzman Suarez','guzmansuarez@gmail.com','mantequilla'),(131,'Adelina','Herbas Angulo','herbasangulo@gmail.com','mantequilla'),(132,'Boris Christian','Herbas Torrico','herbastorrico@gmail.com','mantequilla'),(133,'Marcelo Waldo','Heredia Gomez','herediagomez@gmail.com','mantequilla'),(134,'Wilson','Heredia Soliz','herediasoliz@gmail.com','mantequilla'),(135,'Mary Isabel','Hidalgo Sanchez','hidalgosanchez@gmail.com','mantequilla'),(136,'Nelson','Hinojosa Salazar','hinojosasalazar@gmail.com','mantequilla'),(137,'Marcelo Jose','Hinojosa Torrico','hinojosatorrico@gmail.com','mantequilla'),(138,'Mauricio','Hoepfner Reynolds','hoepfnerreynolds@gmail.com','mantequilla'),(139,'Ronald','Hosse Sahonero','hossesahonero@gmail.com','mantequilla'),(140,'Mercedes','Iriarte Puña','iriartepuña@gmail.com','mantequilla'),(141,'Hernan ','Jaldin Florero','jaldinflorero@gmail.com','mantequilla'),(142,'K. Rolando','Jaldin Rosales','jaldinrosales@gmail.com','mantequilla'),(143,'Juan','Jaldin Salazar','jaldinsalazar@gmail.com','mantequilla'),(144,'Maria Ivonne','Jauregui Carrasco','jaureguicarrasco@gmail.com','mantequilla'),(145,'Carlos Gaston','Joffre Lara','joffrelara@gmail.com','mantequilla'),(146,'Demetrio','Juchani Bazualdo','juchanibazualdo@gmail.com','mantequilla'),(147,'Valentin','Laime Zapata','laimezapata@gmail.com','mantequilla'),(148,'Wilhelm Eduardo','Lange Gonzales','langegonzales@gmail.com','mantequilla'),(149,'Patricia Sandra','Lazarte Astulla','lazarteastulla@gmail.com','mantequilla'),(150,'Luis ','Lazarte Villaroel','lazartevillaroel@gmail.com','mantequilla'),(151,'Fernando Arturo','Ledezma Perizza','ledezmaperizza@gmail.com','mantequilla'),(152,'Gualberto','Leon Romero','leonromero@gmail.com','mantequilla'),(153,'Tito Anibal','Lima Vacaflor','limavacaflor@gmail.com','mantequilla'),(154,'Edgar ','Llave Vincenti','llavevincenti@gmail.com','mantequilla'),(155,'Javier Bernardo','Lopez Arze','lopezarze@gmail.com','mantequilla'),(156,'Maria Alicia','Lopez Lopez','lopezlopez@gmail.com','mantequilla'),(157,'Grover Dante','Lopez Loredo','lopezloredo@gmail.com','mantequilla'),(158,'Marcelo Javier','Lucano Lucano','lucanolucano@gmail.com','mantequilla'),(159,'Mabel Gloria','Magariños Villaroel','magariñosvillaroel@gmail.com','mantequilla'),(160,'Raul','Maldonado Cespedes','maldonadocespedes@gmail.com','mantequilla'),(161,'Eliana Mirtha','Maldonado Gutierrez','maldonadogutierrez@gmail.com','mantequilla'),(162,'Pascual','Maldonado Lopez','maldonadolopez@gmail.com','mantequilla'),(163,'Mabel','Maldonado Maldonado','maldonadomaldonado@gmail.com','mantequilla'),(164,'Roberto Juan','Manchego Castellon','manchegocastellon@gmail.com','mantequilla'),(165,'Juvenal','Manzaneda Mamani','manzanedamamani@gmail.com','mantequilla'),(166,'Carlos B.','Manzur Soria','manzursoria@gmail.com','mantequilla'),(167,'Amilcar Saul','Martinez Maida','martinezmaida@gmail.com','mantequilla'),(168,'Vidal','Matias Marca','matiasmarca@gmail.com','mantequilla'),(169,'Julio','Medina Gamboa','medinagamboa@gmail.com','mantequilla'),(170,'Ruder','Medrano Antezana','medranoantezana@gmail.com','mantequilla'),(171,'Nora','Medrano Mercado','medranomercado@gmail.com','mantequilla'),(172,'Victor Ramiro','Mejia Urquieta','mejiaurquieta@gmail.com','mantequilla'),(173,'Roberto','Mendez Torrico','mendeztorrico@gmail.com','mantequilla'),(174,'Ivan','Mendez Velasquez','mendezvelasquez@gmail.com','mantequilla'),(175,'Sonia','Mendieta Brito','mendietabrito@gmail.com','mantequilla'),(176,'Alvaro Rodolfo','Mercado Guzman','mercadoguzman@gmail.com','mantequilla'),(177,'Reinaldo','Merida Lopez','meridalopez@gmail.com','mantequilla'),(178,'Jose','Meruvia Meruvia','meruviameruvia@gmail.com','mantequilla'),(179,'Felix','Meza Rosso','mezarosso@gmail.com','mantequilla'),(180,'Ana Maria','Michel Vargas','michelvargas@gmail.com','mantequilla'),(181,'Juan Francisco','Montaño Anaya','montañoanaya@gmail.com','mantequilla'),(182,'Sergio Arnaldo','Montaño Medina','montañomedina@gmail.com','mantequilla'),(183,'Rosario','Montaño Merida','montañomerida@gmail.com','mantequilla'),(184,'Victor Hugo','Montaño Quiroga','montañoquiroga@gmail.com','mantequilla'),(185,'Marco Antonio','Montecinos Choque','montecinoschoque@gmail.com','mantequilla'),(186,'Luis Edgar','Montenegro Terrazas','montenegroterrazas@gmail.com','mantequilla'),(187,'Juan Jose Edgar','Montero Guevara','monteroguevara@gmail.com','mantequilla'),(188,'Yony Richard','Montoya Burgos','montoyaburgos@gmail.com','mantequilla'),(189,'Andres ','Morales Maldonado','moralesmaldonado@gmail.com','mantequilla'),(190,'Oscar','Morato Gamboa','moratogamboa@gmail.com','mantequilla'),(191,'Rene ','Moreira Calizaya','moreiracalizaya@gmail.com','mantequilla'),(192,'Boris Arturo','Moreira Rosas','moreirarosas@gmail.com','mantequilla'),(193,'Martin','Moya Albarracin','moyaalbarracin@gmail.com','mantequilla'),(194,'Hans Cristian','Muller Santa Cruz','mullersantacruz@gmail.com','mantequilla'),(195,'Maria Susana Del Rosario','Muñoz Collazos','muñozcollazos@gmail.com','mantequilla'),(196,'Vladimir Felix','Muñoz Quispe','muñozquispe@gmail.com','mantequilla'),(197,'Galo Osvaldo','Muñoz Vasquez','muñozvasquez@gmail.com','mantequilla'),(198,'Freddy ','Navarro Antezana','navarroantezana@gmail.com','mantequilla'),(199,'Jose Gil','Omonte Ojalvo','omonteojalvo@gmail.com','mantequilla'),(200,'Jose Roberto','Omonte Ojalvo','omonteojalvo2@gmail.com','mantequilla'),(201,'Carla ','Oporto','oporto@gmail.com','mantequilla'),(202,'Miguel Angel','Ordoñez Salvatierra','ordoñezsalvatierra@gmail.com','mantequilla'),(203,'Jorge Walter','Orellana Araoz','orellanaaraoz@gmail.com','mantequilla'),(204,'Jaime ','Orellana Jimenez','orellanajimenez@gmail.com','mantequilla'),(205,'Hernan ','Orsi Saldias','orsisaldias@gmail.com','mantequilla'),(206,'Roberto','Pacheco Garcia','pachecogarcia@gmail.com','mantequilla'),(207,'Juan Fernando','Pardo Iriarte','pardoiriarte@gmail.com','mantequilla'),(208,'Ronald Edgar','Patiño Tito','patiñotito@gmail.com','mantequilla'),(209,'Magda Lena','Peeters Ilonaa','peetersilonaa@gmail.com','mantequilla'),(210,'Jose Luis ','Perez Aparicio','perezaparicio@gmail.com','mantequilla'),(211,'Jose Roberto','Perez Cespedes','perezcespedes@gmail.com','mantequilla'),(212,'Maribel','Perez Chacon','perezchacon@gmail.com','mantequilla'),(213,'Omar David','Perez Fuentes','perezfuentes@gmail.com','mantequilla'),(214,'Gustavo Adolfo','Perez Parra','perezparra@gmail.com','mantequilla'),(215,'Yuri German','Perez Peredo','perezperedo@gmail.com','mantequilla'),(216,'Daysi Del Rosario','Perez Rea','perezrea@gmail.com','mantequilla'),(217,'Jose Carlos','Perez Zubieta','perezzubieta@gmail.com','mantequilla'),(218,'Alfredo','Pericon Balderrama','periconbalderrama@gmail.com','mantequilla'),(219,'Mauricio Luis','Ponce Del Leon','poncedelleon@gmail.com','mantequilla'),(220,'Leyton Jorge','Quillaguaman','quillaguaman@gmail.com','mantequilla'),(221,'Abdon','Quiroz Chavez','quirozchavez@gmail.com','mantequilla'),(222,'Santiago','Relos Paco','pelospaco@gmail.com','mantequilla'),(223,'Luz Maya','Revollo Teran','revolloteran@gmail.com','mantequilla'),(224,'Gaston Gil','Rioja Cardenas','riojacardenas@gmail.com','mantequilla'),(225,'Juan','Rios Del Prado','riosdelprado@gmail.com','mantequilla'),(226,'Mirtha Judith','Rivero Lujan','riverolujan@gmail.com','mantequilla'),(227,'Felix Rustan','Roca Subirana','rocasubirana@gmail.com','mantequilla'),(228,'Juan Carlos','Rocha Cuadros','rochacuadros@gmail.com','mantequilla'),(229,'German','Rocha Maldonado','rochamaldonado@gmail.com','mantequilla'),(230,'Edwin Augusto','Rocha Triveño','rochatriveño@gmail.com','mantequilla'),(231,'Erika Patricia','Rodriguez Bilbao','rodriguezbilbao@gmail.com','mantequilla'),(232,'Juan Carlos','Rodriguez Ostria','rodriguezostria@gmail.com','mantequilla'),(233,'Carlos Alberto','Rodriguez Ramirez','rodriguezramirez@gmail.com','mantequilla'),(234,'Gabriel','Rodriguez Roca','rodriguezroca@gmail.com','mantequilla'),(235,'Juan Antonio','Rodriguez Sejas','rodriguezsejas@gmail.com','mantequilla'),(236,'Helmer Jimy','Rodriguez Soriano','rodriguezsoriano@gmail.com','mantequilla'),(237,'Cinthia Carola','Rojas Arnez','rojasarnez@gmail.com','mantequilla'),(238,'Jenny','Rojas Cespedes','rojascespedes@gmail.com','mantequilla'),(239,'Maria Fernanda','Rojas Michaga','rojasmichaga@gmail.com','mantequilla'),(240,'Hugo ','Rojas Salinas','rojassalinas@gmail.com','mantequilla'),(241,'Ramiro','Rojas Zurita','rojaszurita@gmail.com','mantequilla'),(242,'Manuel Fdo.','Roman Arispe','romanarispe@gmail.com','mantequilla'),(243,'Raul','Romero Encinas','romeroencinas@gmail.com','mantequilla'),(244,'Ana Maria','Romero Jaldin','romerojaldin@gmail.com','mantequilla'),(245,'Patricia','Romero Rodriguez','romerorodriguez@gmail.com','mantequilla'),(246,'Olga ','Ruiz Betancur','ruizbetancur@gmail.com','mantequilla'),(247,'Ivan','Ruiz Ucumari','ruizucumari@gmail.com','mantequilla'),(248,'Felipe Ramiro','Saavedra Antezana','saavedraantezana@gmail.com','mantequilla'),(249,'Oscar','Saca Ventura','sacaventura@gmail.com','mantequilla'),(250,'Ricardo','Sahonero Irahola','sahoneroirahola@gmail.com','mantequilla'),(251,'Rosemary','Salazar Anaya','salazaranaya@gmail.com','mantequilla'),(252,'Carla','Salazar Serrudo','salazarserrudo@gmail.com','mantequilla'),(253,'Luis Mauricio','Salinas Pereira','salinaspereira@gmail.com','mantequilla'),(254,'Walter Oscar Gonzalo','Salinas Pericon','salinaspericon@gmail.com','mantequilla'),(255,'Arturo','Saramani Aguilar','saramaniaguilar@gmail.com','mantequilla'),(256,'Ariel Antonio','Sarmiento Franco','sarmientofranco@gmail.com','mantequilla'),(257,'Angelica','Severiche Chacon','severichechacon@gmail.com','mantequilla'),(258,'Galina','Shitikov Gagarina','shitikovgagarina@gmail.com','mantequilla'),(259,'Rene Fernando','Soliz Martinez','solizmartinez@gmail.com','mantequilla'),(260,'Jose Antonio','Soruco Maita','sorucomaita@gmail.com','mantequilla'),(261,'Juan Carlos','Soto Moreira','sotomoreira@gmail.com','mantequilla'),(262,'Jose Roberto','Soto Soliz','sotosoliz@gmail.com','mantequilla'),(263,'Cesar Martin','Suarez Suarez','suarezsuarez@gmail.com','mantequilla'),(264,'Fidel','Taborga Acha','taborgaacha@gmail.com','mantequilla'),(265,'Jose Felix','Tancara Sandagorda','tancarasandagorda@gmail.com','mantequilla'),(266,'Darlong Howard','Taylor Terrazas','taylorterrazas@gmail.com','mantequilla'),(267,'Rodolfo Raul','Teran Aiza','teranaiza@gmail.com','mantequilla'),(268,'Juan','Terrazas Lobo','terrazaslobo@gmail.com','mantequilla'),(269,'Israel','Terrazas Maldonado','terrazasmaldonado@gmail.com','mantequilla'),(270,'Juan Carlos','Terrazas Vargas','terrazasvargas@gmail.com','mantequilla'),(271,'Julio Marcelo','Torrejon Rocabado','torrejonrocabado@gmail.com','mantequilla'),(272,'Epifanio Julio','Torres Navarro','torresnavarro@gmail.com','mantequilla'),(273,'Raul Wilder','Torrez Pelaez','torrezpelaez@gmail.com','mantequilla'),(274,'Edwin Teofilo','Torrez Quinteros','torrezquiteros@gmail.com','mantequilla'),(275,'Norman','Torrico Barron','torricobarron@gmail.com','mantequilla'),(276,'Rosemary','Torrico Bascope','torricobascope@gmail.com','mantequilla'),(277,'Rene','Torrico Mejia','torricomejia@gmail.com','mantequilla'),(278,'Milka Monica','Torrico Troche','torricotroche@gmail.com','mantequilla'),(279,'Sonia ','Torrico Vallejos','torricovallejos@gmail.com','mantequilla'),(280,'Ingrid Vicky','Trigo Rocha','trigorocha@gmail.com','mantequilla'),(281,'Pedro','Triveno Herrera','trivenoherrera@gmail.com','mantequilla'),(282,'Wilson Orlando','Trujillo Aranibar','trujilloaranibar@gmail.com','mantequilla'),(283,'Felix','Ugarte Cejas','ugartecejas@gmail.com','mantequilla'),(284,'Edwin Claudio','Ureña Perez','ureñaperez@gmail.com','mantequilla'),(285,'Mario','Urey Contreras','ureycontreras@gmail.com','mantequilla'),(286,'Jose A.','Urrutia Medrano','urrutiamedrano@gmail.com','mantequilla'),(287,'Jose Gabriel','Urrutia Zelada','urrutiazelada@gmail.com','mantequilla'),(288,'Victor Rene','Ustariz Aramayo','ustarizaramayo@gmail.com','mantequilla'),(289,'Hernan','Ustaris Vargas','ustarisvargas@gmail.com','mantequilla'),(290,'Roberto','Valenzuela Miranda','valenzuelamiranda@gmail.com','mantequilla'),(291,'Marco Antonio','Vallejo Camacho','vallejocamacho@gmail.com','mantequilla'),(292,'Ademar Marcelo','Vargas Antezana','vargasantezana@gmail.com','mantequilla'),(293,'Aidee','Vargas Colque','vargascolque@gmail.com','mantequilla'),(294,'Emir Felix','Vargas Peredo','vargasperedo@gmail.com','mantequilla'),(295,'Carlos Alberto','Vargas Quiroz','vargasquiroz@gmail.com','mantequilla'),(296,'Juan Carlos','Vargas Reinaga','vargasreinaga@gmail.com','mantequilla'),(297,'Luz Virginia','Vargas Vallejos','vargasvallejos@gmail.com','mantequilla'),(298,'Michael Huascar','Vasquez Carrillo','vasquezcarrillo@gmail.com','mantequilla'),(299,'Wilfredo','Vega Alfaro','vegaalfaro@gmail.com','mantequilla'),(300,'Carlos Alberto','Vera Cortes','veracortes@gmail.com','mantequilla'),(301,'Luis Antonio','Vilaseca Gamarra','vilasecagamarra@gmail.com','mantequilla'),(302,'Gilarmando','Villaroel','villaroel@gmail.com','mantequilla'),(303,'Jimmy','Villaroel Novillo','villaroelnovillo@gmail.com','mantequilla'),(304,'Henry Frank','Villaroel Tapia','villaroeltapia@gmail.com','mantequilla'),(305,'Mauricio Florencio','Villazon Gomez','villazongomez@gmail.com','mantequilla'),(306,'Yamir','Villazon Rocha','villazonrocha@gmail.com','mantequilla'),(307,'Marco Antonio','Viscarra Vargas','viscarravargas@gmail.com','mantequilla'),(308,'Oscar A. ','Zabalaga Montaño','zabalagamontaño@gmail.com','mantequilla'),(309,'Mario Grover','Zalles Medrano','zallesmedrano@gmail.com','mantequilla'),(310,'Jhomil Efrain','Zambrana Burgos','zambranaburgos@gmail.com','mantequilla'),(311,'Jose Eduardo','Zambrana Montan','zambranamontan@gmail.com','mantequilla'),(312,'Jorge','Zambrana Vilar','zambranavilar@gmail.com','mantequilla'),(313,'Maria E.','Zapata Schultze','zapataschltze@gmail.com','mantequilla'),(314,'Luis Roberto','Zegarra Dorado','zegarradorado@gmail.com','mantequilla'),(315,'Rimer Mauricio','Zurita Orellana','zuritaorellana@gmail.com','mantequilla');
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

-- Dump completed on 2022-04-02 12:53:00
