CREATE DATABASE  IF NOT EXISTS `farm_rental_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farm_rental_system`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: farm_rental_system
-- ------------------------------------------------------
-- Server version	8.0.37

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add machine_details',7,'add_machine_details'),(26,'Can change machine_details',7,'change_machine_details'),(27,'Can delete machine_details',7,'delete_machine_details'),(28,'Can view machine_details',7,'view_machine_details'),(29,'Can add machine owner',8,'add_machineowner'),(30,'Can change machine owner',8,'change_machineowner'),(31,'Can delete machine owner',8,'delete_machineowner'),(32,'Can view machine owner',8,'view_machineowner'),(33,'Can add farmer',9,'add_farmer'),(34,'Can change farmer',9,'change_farmer'),(35,'Can delete farmer',9,'delete_farmer'),(36,'Can view farmer',9,'view_farmer'),(37,'Can add rental request',10,'add_rentalrequest'),(38,'Can change rental request',10,'change_rentalrequest'),(39,'Can delete rental request',10,'delete_rentalrequest'),(40,'Can view rental request',10,'view_rentalrequest'),(41,'Can add payment',11,'add_payment'),(42,'Can change payment',11,'change_payment'),(43,'Can delete payment',11,'delete_payment'),(44,'Can view payment',11,'view_payment');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'farmer','farmer'),(11,'farmer','payment'),(10,'farmer','rentalrequest'),(7,'index','machine_details'),(8,'Machine_owner','machineowner'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Machine_owner','0001_initial','2024-07-28 13:40:04.573889'),(2,'contenttypes','0001_initial','2024-07-28 13:40:04.739823'),(3,'auth','0001_initial','2024-07-28 13:40:06.413531'),(4,'admin','0001_initial','2024-07-28 13:40:06.838922'),(5,'admin','0002_logentry_remove_auto_add','2024-07-28 13:40:06.876216'),(6,'admin','0003_logentry_add_action_flag_choices','2024-07-28 13:40:06.922035'),(7,'contenttypes','0002_remove_content_type_name','2024-07-28 13:40:07.149794'),(8,'auth','0002_alter_permission_name_max_length','2024-07-28 13:40:07.363979'),(9,'auth','0003_alter_user_email_max_length','2024-07-28 13:40:07.455850'),(10,'auth','0004_alter_user_username_opts','2024-07-28 13:40:07.485156'),(11,'auth','0005_alter_user_last_login_null','2024-07-28 13:40:07.715625'),(12,'auth','0006_require_contenttypes_0002','2024-07-28 13:40:07.715625'),(13,'auth','0007_alter_validators_add_error_messages','2024-07-28 13:40:07.756003'),(14,'auth','0008_alter_user_username_max_length','2024-07-28 13:40:07.951247'),(15,'auth','0009_alter_user_last_name_max_length','2024-07-28 13:40:08.150050'),(16,'auth','0010_alter_group_name_max_length','2024-07-28 13:40:08.221885'),(17,'auth','0011_update_proxy_permissions','2024-07-28 13:40:08.247049'),(18,'auth','0012_alter_user_first_name_max_length','2024-07-28 13:40:08.480747'),(19,'index','0001_initial','2024-07-28 13:40:08.717424'),(20,'farmer','0001_initial','2024-07-28 13:40:08.992591'),(21,'farmer','0002_initial','2024-07-28 13:40:09.340723'),(22,'sessions','0001_initial','2024-07-28 13:40:09.452454'),(23,'farmer','0003_payment','2024-07-29 12:42:37.993129'),(24,'farmer','0004_remove_rentalrequest_total_days','2024-07-29 13:44:17.944387'),(25,'index','0002_remove_machine_details_days','2024-07-30 08:56:08.664612'),(26,'farmer','0005_payment_payment_status','2024-07-30 15:07:12.608727');
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
INSERT INTO `django_session` VALUES ('vc4u9qm73aulu95b5xwziqsz7jtfilfy','eyJ1c2VyX2lkIjoxfQ:1sYpjN:moWk9BpO3K5A04rB_3DFqZIHZ2xc95djBCsf786Bp84','2024-08-13 16:29:45.372548');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_farmer`
--

DROP TABLE IF EXISTS `farmer_farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer_farmer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `aadhar_no` (`aadhar_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_farmer`
--

LOCK TABLES `farmer_farmer` WRITE;
/*!40000 ALTER TABLE `farmer_farmer` DISABLE KEYS */;
INSERT INTO `farmer_farmer` VALUES (1,'ram','pbkdf2_sha256$600000$zuadojVvRcH5Xe84Q2svJZ$YmWjnH3XJbRqc2Tyow/Z9J2rBUl5aSAqrchGtued09c=','ram67r@gmail.com','1/49 A Keezhaurthirangudi , sankaran pandal , Thrangambadi (Tk), Mayiladuthurai (Dt), Tamil nadu, India - 609308','07010689434','89765765675');
/*!40000 ALTER TABLE `farmer_farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_payment`
--

DROP TABLE IF EXISTS `farmer_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `cvv_number` varchar(4) NOT NULL,
  `debit_card_number` varchar(16) NOT NULL,
  `farmer_id` bigint NOT NULL,
  `rental_request_id` bigint NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `farmer_payment_farmer_id_ea3352b4_fk_farmer_farmer_id` (`farmer_id`),
  KEY `farmer_payment_rental_request_id_8ce21060_fk_farmer_re` (`rental_request_id`),
  CONSTRAINT `farmer_payment_farmer_id_ea3352b4_fk_farmer_farmer_id` FOREIGN KEY (`farmer_id`) REFERENCES `farmer_farmer` (`id`),
  CONSTRAINT `farmer_payment_rental_request_id_8ce21060_fk_farmer_re` FOREIGN KEY (`rental_request_id`) REFERENCES `farmer_rentalrequest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_payment`
--

LOCK TABLES `farmer_payment` WRITE;
/*!40000 ALTER TABLE `farmer_payment` DISABLE KEYS */;
INSERT INTO `farmer_payment` VALUES (1,2000.00,'2024-07-29 12:57:35.490122','886c836ac615461db8eeb7451284f40c','123','890766765',1,1,'Completed'),(2,69000.00,'2024-07-29 15:02:38.396294','8077c2321009465bab9311439531d935','123','2978268847',1,1,'Completed'),(3,60000.00,'2024-07-30 09:28:32.123693','7c9799804a194be68360142cb88fd0cf','126','2978268890',1,3,'Completed');
/*!40000 ALTER TABLE `farmer_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_rentalrequest`
--

DROP TABLE IF EXISTS `farmer_rentalrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer_rentalrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `rental_days` int unsigned NOT NULL,
  `farmer_name` varchar(150) NOT NULL,
  `farmer_contact` varchar(15) NOT NULL,
  `owner_username` varchar(150) NOT NULL,
  `farmer_id` bigint NOT NULL,
  `machine_id` bigint NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmer_rentalrequest_farmer_id_c6646f61_fk_farmer_farmer_id` (`farmer_id`),
  KEY `farmer_rentalrequest_machine_id_9c5c8d9e_fk_index_mac` (`machine_id`),
  KEY `farmer_rentalrequest_owner_id_41b5e97e_fk_Machine_o` (`owner_id`),
  CONSTRAINT `farmer_rentalrequest_farmer_id_c6646f61_fk_farmer_farmer_id` FOREIGN KEY (`farmer_id`) REFERENCES `farmer_farmer` (`id`),
  CONSTRAINT `farmer_rentalrequest_machine_id_9c5c8d9e_fk_index_mac` FOREIGN KEY (`machine_id`) REFERENCES `index_machine_details` (`Machine_id`),
  CONSTRAINT `farmer_rentalrequest_owner_id_41b5e97e_fk_Machine_o` FOREIGN KEY (`owner_id`) REFERENCES `machine_owner_machineowner` (`id`),
  CONSTRAINT `farmer_rentalrequest_chk_1` CHECK ((`rental_days` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_rentalrequest`
--

LOCK TABLES `farmer_rentalrequest` WRITE;
/*!40000 ALTER TABLE `farmer_rentalrequest` DISABLE KEYS */;
INSERT INTO `farmer_rentalrequest` VALUES (1,'APPROVED',23,'ram','07010689434','abi',1,1,1),(2,'REJECTED',10,'ram','07010689434','abi',1,1,1),(3,'APPROVED',20,'ram','07010689434','abi',1,1,1),(4,'APPROVED',10,'ram','07010689434','abi',1,1,1),(5,'APPROVED',13,'ram','07010689434','abi',1,1,1),(6,'APPROVED',20,'ram','07010689434','abi',1,1,1),(7,'REJECTED',10,'ram','07010689434','abi',1,1,1);
/*!40000 ALTER TABLE `farmer_rentalrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_machine_details`
--

DROP TABLE IF EXISTS `index_machine_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_machine_details` (
  `Machine_id` bigint NOT NULL AUTO_INCREMENT,
  `Machine_Name` varchar(200) NOT NULL,
  `Machine_type` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Machine_price` decimal(10,2) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Machine_owner_id` bigint NOT NULL,
  PRIMARY KEY (`Machine_id`),
  KEY `index_machine_detail_Machine_owner_id_fea386ae_fk_Machine_o` (`Machine_owner_id`),
  CONSTRAINT `index_machine_detail_Machine_owner_id_fea386ae_fk_Machine_o` FOREIGN KEY (`Machine_owner_id`) REFERENCES `machine_owner_machineowner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_machine_details`
--

LOCK TABLES `index_machine_details` WRITE;
/*!40000 ALTER TABLE `index_machine_details` DISABLE KEYS */;
INSERT INTO `index_machine_details` VALUES (1,'blue tracktor','Vechile','Used to farm recycling',3000.00,'uploads/farm.jpg',1),(2,'Traktor','Vechile','Used to farm recycling',1000.00,'uploads/cow.jpg',1),(3,'Red trcktor','Vechile','Used to farm recycling',30000.00,'uploads/farm_TMZQNT0.jpg',1),(4,'truck','Vechile','Used to farm recycling',3000.00,'uploads/farm_hE2gxwJ.jpg',1),(5,'Red trcktor','Vechile','Used to farm recycling',3000.00,'uploads/paddy.jpg',1),(6,'Red trcktor','Vechile','Used to farm recycling',3400.00,'uploads/tractor.jpg',2),(7,'Red trcktor','Vechile','Used to farm recycling',3400.00,'uploads/tractor_guCIYHL.jpg',2),(8,'Red trcktor','Vechile','Used to farm recycling',5000.00,'uploads/paddy_hXzLJhL.jpg',2),(9,'Red trcktor','Vechile','Used to farm recycling',5000.00,'uploads/paddy_ooZs5Dv.jpg',2),(10,'Red trcktor','Vechile','Used to farm recycling',5000.00,'uploads/paddy_dSCD1JM.jpg',2),(11,'Red trcktor','Vechile','Used to farm recycling',5000.00,'uploads/paddy_INzoWn4.jpg',2),(12,'Red trcktor','Vechile','Used to farm recycling',4000.00,'uploads/tractor_9Hcei21.jpg',2),(13,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1.jpg',1),(14,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_Ij34blg.jpg',1),(15,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_gYvsmz5.jpg',1),(16,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_mYlwH4g.jpg',1),(17,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_K8sbSsc.jpg',1),(18,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_mnD6Nsp.jpg',1),(19,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_d3YH0Ua.jpg',1),(20,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_BCDyxC9.jpg',1),(21,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_OMD6aki.jpg',1),(22,'truck','Vechile','Used to load paddy',4000.00,'uploads/tractor1_iiAXi9D.jpg',1),(23,'Red trcktor','Vechile','Used to farm recycling',5000.00,'uploads/tractor1_TWf7VKR.jpg',2),(24,'truck','Vechile','Used to load paddy',4000.00,'uploads/paddy_GHtZ70B.jpg',2);
/*!40000 ALTER TABLE `index_machine_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_owner_machineowner`
--

DROP TABLE IF EXISTS `machine_owner_machineowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine_owner_machineowner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `aadhar_no` (`aadhar_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_owner_machineowner`
--

LOCK TABLES `machine_owner_machineowner` WRITE;
/*!40000 ALTER TABLE `machine_owner_machineowner` DISABLE KEYS */;
INSERT INTO `machine_owner_machineowner` VALUES (1,'abi','pbkdf2_sha256$600000$tt4xXWtOIybbskbwEJtI05$020dNba+FeNup3LVut5BY/rxdvhjN8mPLcgsPPxTllM=','abi45a@gmail.com','1/490A north , sankaran pandal , Thrangambadi (Tk), Mayiladuthurai (Dt), Tamil nadu, India - 609308','8078654323','6789654323'),(2,'surya','pbkdf2_sha256$600000$SZqSBr4bKQW3rkElEhO3w0$YJ6Em3cAwTi3B2trSm9zTSHt3kbm+lf/ygiwuy4SBV0=','suryamca85s@gmail.com','1/49 A Keezhaurthirangudi , sankaran pandal , Thrangambadi (Tk), Mayiladuthurai (Dt), Tamil nadu, India - 609308','07010689434','7898918787');
/*!40000 ALTER TABLE `machine_owner_machineowner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 11:19:56
