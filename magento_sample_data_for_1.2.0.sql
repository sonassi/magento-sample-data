
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
-- Table structure for table `admin_assert`
--
DROP TABLE IF EXISTS `admin_assert`;
CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts';
--
-- Dumping data for table `admin_assert`
--
LOCK TABLES `admin_assert` WRITE;
/*!40000 ALTER TABLE `admin_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_assert` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `admin_role`
--
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ACL Roles';
--
-- Dumping data for table `admin_role`
--
LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,0,1,1,'G',0,'Administrators'),(3,1,1,0,'U',1,'Store');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `admin_rule`
--
DROP TABLE IF EXISTS `admin_rule`;
CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ACL Rules';
--
-- Dumping data for table `admin_rule`
--
LOCK TABLES `admin_rule` WRITE;
/*!40000 ALTER TABLE `admin_rule` DISABLE KEYS */;
INSERT INTO `admin_rule` VALUES (1,1,'all','',0,'G','allow');
/*!40000 ALTER TABLE `admin_rule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `admin_user`
--
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `logdate` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  `extra` text,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Users';
--
-- Dumping data for table `admin_user`
--
LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Store','Owner','owner@example.com','admin','60c320903e22e3cdd29b614b126941d1:yC','2008-08-07 14:39:09','2008-12-27 20:51:54','2008-12-27 21:05:00',2,0,1,'N;');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `adminnotification_inbox`
--
DROP TABLE IF EXISTS `adminnotification_inbox`;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL auto_increment,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL default '0',
  `is_remove` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `adminnotification_inbox`
--
LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `api_assert`
--
DROP TABLE IF EXISTS `api_assert`;
CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL auto_increment,
  `assert_type` varchar(20) NOT NULL default '',
  `assert_data` text,
  PRIMARY KEY  (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
--
-- Dumping data for table `api_assert`
--
LOCK TABLES `api_assert` WRITE;
/*!40000 ALTER TABLE `api_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assert` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `api_role`
--
DROP TABLE IF EXISTS `api_role`;
CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL default '0',
  `tree_level` tinyint(3) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `role_type` char(1) NOT NULL default '0',
  `user_id` int(11) unsigned NOT NULL default '0',
  `role_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
--
-- Dumping data for table `api_role`
--
LOCK TABLES `api_role` WRITE;
/*!40000 ALTER TABLE `api_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_role` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `api_rule`
--
DROP TABLE IF EXISTS `api_rule`;
CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `resource_id` varchar(255) NOT NULL default '',
  `privileges` varchar(20) NOT NULL default '',
  `assert_id` int(10) unsigned NOT NULL default '0',
  `role_type` char(1) default NULL,
  `permission` varchar(10) default NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
--
-- Dumping data for table `api_rule`
--
LOCK TABLES `api_rule` WRITE;
/*!40000 ALTER TABLE `api_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `api_user`
--
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user` (
  `user_id` mediumint(9) unsigned NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL default '',
  `lastname` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `username` varchar(40) NOT NULL default '',
  `api_key` varchar(40) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime default NULL,
  `logdate` datetime default NULL,
  `lognum` smallint(5) unsigned NOT NULL default '0',
  `sessid` varchar(40) NOT NULL,
  `reload_acl_flag` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';
--
-- Dumping data for table `api_user`
--
LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity`
--
DROP TABLE IF EXISTS `catalog_category_entity`;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Category Entityies';
--
-- Dumping data for table `catalog_category_entity`
--
LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,9,12,0,'2007-07-20 18:46:08','2007-08-07 09:50:15','1',1,0,26),(3,9,12,1,'2007-08-22 15:54:41','2007-12-05 04:38:59','1/3',3,1,25),(4,9,12,18,'2007-08-22 15:55:34','2008-08-08 00:56:48','1/3/18/4',4,3,0),(5,9,12,18,'2007-08-22 16:21:29','2008-08-07 23:55:38','1/3/18/5',5,3,2),(8,9,12,13,'2007-08-22 18:10:30','2008-08-07 23:51:26','1/3/13/8',8,3,0),(10,9,12,3,'2007-08-23 11:45:22','2008-08-08 00:01:18','1/3/10',10,2,2),(12,9,12,13,'2007-08-24 12:34:30','2008-08-07 23:54:48','1/3/13/12',12,3,2),(13,9,12,3,'2007-08-24 13:31:01','2008-08-08 00:02:23','1/3/13',13,2,13),(15,9,12,13,'2007-08-24 13:33:17','2008-07-25 01:53:39','1/3/13/15',15,3,8),(16,9,12,5,'2007-08-24 15:41:52','2008-08-07 23:56:01','1/3/18/5/16',16,4,0),(17,9,12,5,'2007-08-24 15:43:07','2008-08-07 23:56:28','1/3/18/5/17',17,4,0),(18,9,12,3,'2007-08-24 15:44:31','2008-08-07 23:54:16','1/3/18',18,2,6),(19,9,12,18,'2007-08-24 20:05:28','2008-08-07 23:57:03','1/3/18/19',19,3,0),(20,9,12,3,'2007-08-25 13:14:09','2008-08-07 23:58:57','1/3/20',20,2,0),(22,9,12,10,'2007-08-26 14:49:39','2008-08-08 00:01:45','1/3/10/22',22,3,0),(23,9,12,10,'2007-08-27 10:35:27','2008-08-07 23:49:18','1/3/10/23',23,3,0),(24,9,12,18,'2007-08-28 18:32:41','2007-08-29 23:20:36','1/3/18/24',24,3,0),(25,9,12,12,'2007-08-29 19:49:52','2008-08-07 23:46:35','1/3/13/12/25',25,4,0),(26,9,12,12,'2007-08-29 20:37:22','2008-08-07 23:47:02','1/3/13/12/26',26,4,0),(27,9,12,15,'2008-07-25 00:36:22','2008-08-07 23:48:15','1/3/13/15/27',1,4,0),(28,9,12,15,'2008-07-25 00:39:10','2008-08-08 13:02:59','1/3/13/15/28',2,4,0),(29,9,12,13,'2008-07-25 00:39:54','2008-07-25 00:39:54','1/3/13/15/29',3,4,0),(30,9,12,13,'2008-07-25 00:41:11','2008-07-25 00:41:11','1/3/13/15/30',4,4,0),(31,9,12,13,'2008-07-25 00:41:56','2008-07-25 00:41:56','1/3/13/15/31',5,4,0),(32,9,12,13,'2008-07-25 00:42:57','2008-07-25 00:42:57','1/3/13/15/32',6,4,0),(33,9,12,13,'2008-07-25 00:43:25','2008-07-25 00:43:25','1/3/13/15/33',7,4,0),(34,9,12,13,'2008-07-25 00:44:17','2008-07-25 00:44:17','1/3/13/15/34',8,4,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity_datetime`
--
DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_entity_datetime`
--
LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity_decimal`
--
DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_entity_decimal`
--
LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity_int`
--
DROP TABLE IF EXISTS `catalog_category_entity_int`;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_entity_int`
--
LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,9,120,0,13,1),(2,9,120,0,5,1),(3,9,120,0,18,1),(4,9,120,0,16,1),(5,9,120,0,17,1),(6,9,120,0,4,1),(7,9,120,0,19,0),(8,9,120,0,22,0),(9,9,120,0,10,1),(10,9,120,0,15,1),(11,9,119,0,1,1),(12,9,119,0,4,1),(13,9,119,0,8,1),(14,9,119,0,12,1),(15,9,119,0,15,1),(16,9,119,0,17,1),(17,9,120,0,23,0),(18,9,117,0,13,3),(19,9,119,0,23,1),(20,9,120,0,12,1),(21,9,117,0,8,4),(22,9,120,0,8,1),(23,9,120,0,26,1),(24,9,564,0,17,1),(25,9,119,0,3,1),(26,9,120,0,20,0),(27,9,119,0,5,1),(28,9,119,0,10,1),(29,9,119,0,13,1),(30,9,119,0,16,1),(31,9,119,0,18,1),(32,9,119,0,19,1),(33,9,119,0,20,0),(34,9,119,0,22,1),(35,9,119,0,24,0),(36,9,119,0,25,1),(37,9,119,0,26,1),(38,9,564,0,15,1),(39,9,119,0,27,1),(40,9,120,0,27,0),(41,9,564,0,27,1),(42,9,119,0,28,1),(43,9,120,0,28,1),(44,9,564,0,28,1),(45,9,119,0,29,1),(46,9,120,0,29,1),(47,9,564,0,29,1),(48,9,119,0,30,1),(49,9,120,0,30,1),(50,9,564,0,30,1),(51,9,119,0,31,1),(52,9,120,0,31,1),(53,9,564,0,31,1),(54,9,119,0,32,1),(55,9,120,0,32,1),(56,9,564,0,32,1),(57,9,119,0,33,1),(58,9,120,0,33,1),(59,9,564,0,33,1),(60,9,119,0,34,1),(61,9,120,0,34,1),(62,9,564,0,34,1),(63,9,564,0,22,1),(64,9,564,0,23,1),(65,9,564,0,10,1),(66,9,564,0,12,1),(67,9,120,0,25,0),(68,9,564,0,25,1),(69,9,564,0,26,1),(70,9,564,0,8,1),(71,9,564,0,18,1),(72,9,564,0,4,1),(73,9,564,0,5,1),(74,9,564,0,16,1),(75,9,564,0,19,1),(76,9,564,0,20,1);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity_text`
--
DROP TABLE IF EXISTS `catalog_category_entity_text`;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_entity_text`
--
LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_text` VALUES (1,9,121,0,3,'3,18,4,5,16,17,19,24,10,22,23,13,8,12,26,25,15,20'),(2,9,121,0,4,'4'),(3,9,122,0,4,'4,18'),(4,9,123,0,3,'18,10,13,20'),(5,9,121,0,5,'5,16,17'),(6,9,122,0,5,'5,18'),(7,9,121,0,8,'8'),(8,9,122,0,8,'8,13'),(9,9,121,0,10,'10,22,23'),(10,9,122,0,10,'10'),(11,9,121,0,12,'12,26,25'),(12,9,122,0,12,'12,13'),(13,9,121,0,13,'13,8,12,26,25,15'),(14,9,122,0,13,'13'),(15,9,123,0,13,'8,12,15'),(16,9,121,0,15,'15'),(17,9,122,0,15,'15,13'),(18,9,123,0,5,'16,17'),(19,9,122,0,18,'18'),(20,9,123,0,18,'4,5,19,24'),(21,9,122,0,19,'19,18'),(22,9,122,0,20,'20'),(23,9,121,0,22,'22'),(24,9,122,0,22,'22,10'),(25,9,123,0,10,'22,23'),(26,9,121,0,23,'23'),(27,9,122,0,23,'23,10'),(28,9,123,0,22,''),(29,9,123,0,16,''),(30,9,123,0,4,''),(31,9,123,0,23,''),(32,9,123,0,19,''),(33,9,123,0,15,''),(34,9,121,0,24,'24'),(35,9,122,0,24,'24,18'),(36,9,123,0,24,''),(37,9,123,0,8,''),(38,9,112,0,25,'Random accessories for different electronic items'),(39,9,115,0,25,'electric, accesories, gadgets'),(40,9,122,0,25,'25,12,13'),(41,9,123,0,25,''),(42,9,121,0,26,'26'),(43,9,122,0,26,'26,12,13'),(44,9,123,0,26,''),(45,9,123,0,17,''),(46,9,122,0,3,''),(47,9,112,0,15,''),(48,9,115,0,15,''),(49,9,116,0,15,''),(50,9,530,0,15,''),(51,9,112,0,27,''),(52,9,115,0,27,''),(53,9,116,0,27,''),(54,9,530,0,27,''),(55,9,112,0,28,''),(56,9,115,0,28,''),(57,9,116,0,28,''),(58,9,530,0,28,''),(59,9,112,0,29,''),(60,9,115,0,29,''),(61,9,116,0,29,''),(62,9,530,0,29,''),(63,9,112,0,30,''),(64,9,115,0,30,''),(65,9,116,0,30,''),(66,9,112,0,31,''),(67,9,116,0,31,''),(68,9,530,0,31,''),(69,9,112,0,32,''),(70,9,115,0,32,''),(71,9,116,0,32,''),(72,9,530,0,32,''),(73,9,112,0,33,''),(74,9,115,0,33,''),(75,9,116,0,33,''),(76,9,530,0,33,''),(77,9,112,0,34,''),(78,9,115,0,34,''),(79,9,116,0,34,''),(80,9,112,0,22,''),(81,9,116,0,22,''),(82,9,530,0,22,''),(83,9,112,0,23,''),(84,9,115,0,23,''),(85,9,116,0,23,''),(86,9,530,0,23,''),(87,9,112,0,10,''),(88,9,115,0,10,''),(89,9,116,0,10,''),(90,9,530,0,10,''),(91,9,112,0,12,''),(92,9,115,0,12,''),(93,9,116,0,12,''),(94,9,530,0,12,''),(95,9,116,0,25,''),(96,9,112,0,26,''),(97,9,116,0,26,''),(98,9,112,0,8,''),(99,9,115,0,8,''),(100,9,116,0,8,''),(101,9,530,0,8,''),(102,9,112,0,18,''),(103,9,115,0,18,''),(104,9,116,0,18,''),(105,9,530,0,18,''),(106,9,112,0,4,''),(107,9,115,0,4,''),(108,9,116,0,4,''),(109,9,530,0,4,''),(110,9,112,0,5,''),(111,9,115,0,5,''),(112,9,116,0,5,''),(113,9,530,0,5,''),(114,9,112,0,16,''),(115,9,115,0,16,''),(116,9,116,0,16,''),(117,9,530,0,16,''),(118,9,112,0,17,''),(119,9,115,0,17,''),(120,9,116,0,17,''),(121,9,530,0,17,''),(122,9,112,0,19,''),(123,9,115,0,19,''),(124,9,530,0,19,''),(125,9,115,0,20,''),(126,9,530,0,20,''),(127,9,121,0,16,'16'),(128,9,122,0,16,'16,5,18'),(129,9,121,0,17,'17'),(130,9,122,0,17,'17,5,18'),(131,9,121,0,18,'18,4,5,16,17,19,24'),(132,9,121,0,19,'19'),(133,9,121,0,20,'20'),(134,9,123,0,20,''),(135,9,121,0,25,'25'),(136,9,123,0,12,'26,25'),(137,9,530,0,30,''),(138,9,115,0,31,''),(139,9,530,0,34,''),(140,9,115,0,22,''),(141,9,530,0,25,''),(142,9,115,0,26,''),(143,9,530,0,26,''),(144,9,116,0,19,''),(145,9,112,0,20,''),(146,9,116,0,20,'');
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_entity_varchar`
--
DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  UNIQUE KEY `IDX_BASE` USING BTREE (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_entity_varchar`
--
LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,9,111,0,3,'Root Catalog'),(2,9,118,0,3,'PRODUCTS'),(3,9,479,0,3,'root-catalog'),(4,9,111,0,4,'Shirts'),(5,9,118,0,4,'PRODUCTS'),(6,9,479,0,4,'shirts'),(7,9,111,0,5,'Shoes'),(8,9,118,0,5,'PRODUCTS'),(9,9,479,0,5,'shoes'),(10,9,111,0,8,'Cell Phones'),(11,9,118,0,8,'PRODUCTS_AND_PAGE'),(12,9,479,0,8,'cell-phones'),(13,9,111,0,10,'Furniture'),(14,9,118,0,10,'PRODUCTS'),(15,9,479,0,10,'furniture'),(16,9,111,0,12,'Cameras'),(17,9,118,0,12,'PRODUCTS'),(18,9,479,0,12,'cameras'),(19,9,111,0,13,'Electronics'),(20,9,118,0,13,'PAGE'),(21,9,479,0,13,'electronics'),(22,9,111,0,15,'Computers'),(23,9,118,0,15,'PRODUCTS'),(24,9,479,0,15,'computers'),(25,9,111,0,16,'Mens'),(26,9,118,0,16,'PRODUCTS'),(27,9,479,0,16,'mens'),(28,9,111,0,17,'Womens'),(29,9,118,0,17,'PRODUCTS'),(30,9,479,0,17,'womens'),(31,9,111,0,18,'Apparel'),(32,9,118,0,18,'PRODUCTS'),(33,9,479,0,18,'apparel'),(34,9,111,0,19,'Hoodies'),(35,9,118,0,19,'PRODUCTS'),(36,9,479,0,19,'hoodies'),(37,9,113,0,4,'shirts.jpg'),(38,9,113,0,12,'camera.jpg'),(39,9,111,0,20,'Household Items'),(40,9,118,0,20,'PRODUCTS'),(41,9,479,0,20,'household-items'),(42,9,111,0,22,'Living Room'),(43,9,118,0,22,'PRODUCTS_AND_PAGE'),(44,9,118,0,23,'PRODUCTS'),(45,9,111,0,23,'Bedroom'),(46,9,113,0,5,'shoes.jpg'),(47,9,113,0,23,'bedroom.jpg'),(48,9,113,0,18,'apparel.jpg'),(49,9,113,0,10,'furniture.jpg'),(50,9,514,0,13,'one_column'),(51,9,514,0,8,''),(52,9,111,0,24,'Pants'),(53,9,118,0,24,'PRODUCTS'),(54,9,111,0,25,'Accessories'),(55,9,118,0,25,'PRODUCTS'),(56,9,111,0,26,'Digital Cameras'),(57,9,118,0,26,'PRODUCTS'),(58,9,533,0,18,'apparel'),(59,9,533,0,4,'apparel/shirts'),(60,9,533,0,5,'apparel/shoes'),(61,9,533,0,16,'apparel/shoes/mens'),(62,9,533,0,17,'apparel/shoes/womens'),(63,9,533,0,19,'apparel/hoodies'),(64,9,533,0,10,'furniture'),(65,9,533,0,13,'electronics'),(66,9,533,0,8,'electronics/cell-phones'),(67,9,533,0,12,'electronics/cameras'),(68,9,533,0,15,'electronics/computers'),(69,9,533,0,20,'household-items'),(70,9,479,0,22,'living-room'),(71,9,533,0,22,'furniture/living-room'),(72,9,479,0,23,'bedroom'),(73,9,533,0,23,'furniture/bedroom'),(74,9,479,0,25,'accessories'),(75,9,533,0,25,'electronics/cameras/accessories'),(76,9,479,0,26,'digital-cameras'),(77,9,533,0,26,'electronics/cameras/digital-cameras'),(78,9,479,0,24,'pants'),(79,9,533,0,24,'apparel/pants'),(80,9,114,0,15,''),(81,9,563,0,15,''),(82,9,514,0,15,''),(83,9,111,0,27,'Build Your Own'),(84,9,114,0,27,''),(85,9,118,0,27,'PRODUCTS'),(86,9,479,0,27,'build-your-own'),(87,9,563,0,27,''),(88,9,514,0,27,''),(89,9,533,0,27,'electronics/computers/build-your-own'),(90,9,111,0,28,'Laptops'),(91,9,114,0,28,''),(92,9,118,0,28,'PRODUCTS'),(93,9,479,0,28,'laptops'),(94,9,563,0,28,''),(95,9,514,0,28,''),(96,9,533,0,28,'electronics/computers/laptops'),(97,9,111,0,29,'Hard Drives'),(98,9,114,0,29,''),(99,9,118,0,29,'PRODUCTS'),(100,9,479,0,29,'hard-drives'),(101,9,563,0,29,''),(102,9,514,0,29,''),(103,9,533,0,29,'electronics/computers/hard-drives'),(104,9,111,0,30,'Monitors'),(105,9,114,0,30,''),(106,9,118,0,30,'PRODUCTS'),(107,9,479,0,30,'monitors'),(108,9,563,0,30,''),(109,9,514,0,30,''),(110,9,533,0,30,'electronics/computers/monitors'),(111,9,111,0,31,'RAM / Memory'),(112,9,114,0,31,''),(113,9,118,0,31,'PRODUCTS'),(114,9,479,0,31,'ram-memory'),(115,9,563,0,31,''),(116,9,514,0,31,''),(117,9,533,0,31,'electronics/computers/ram-memory'),(118,9,111,0,32,'Cases'),(119,9,114,0,32,''),(120,9,118,0,32,'PRODUCTS'),(121,9,479,0,32,'cases'),(122,9,563,0,32,''),(123,9,514,0,32,''),(124,9,533,0,32,'electronics/computers/cases'),(125,9,111,0,33,'Processors'),(126,9,114,0,33,''),(127,9,118,0,33,'PRODUCTS'),(128,9,479,0,33,'processors'),(129,9,563,0,33,''),(130,9,514,0,33,''),(131,9,533,0,33,'electronics/computers/processors'),(132,9,111,0,34,'Peripherals'),(133,9,114,0,34,''),(134,9,118,0,34,'PRODUCTS'),(135,9,479,0,34,'peripherals'),(136,9,563,0,34,''),(137,9,514,0,34,''),(138,9,533,0,34,'electronics/computers/peripherals'),(139,9,114,0,22,''),(140,9,563,0,22,''),(141,9,514,0,22,''),(142,9,114,0,23,''),(143,9,563,0,23,''),(144,9,514,0,23,''),(145,9,114,0,10,''),(146,9,563,0,10,''),(147,9,514,0,10,''),(148,9,114,0,12,''),(149,9,563,0,12,''),(150,9,514,0,12,''),(151,9,114,0,25,''),(152,9,563,0,25,''),(153,9,514,0,25,''),(154,9,114,0,26,''),(155,9,563,0,26,''),(156,9,514,0,26,''),(157,9,114,0,8,''),(158,9,563,0,8,''),(159,9,114,0,18,''),(160,9,563,0,18,''),(161,9,514,0,18,''),(162,9,114,0,4,''),(163,9,563,0,4,''),(164,9,514,0,4,''),(165,9,114,0,5,''),(166,9,563,0,5,''),(167,9,514,0,5,''),(168,9,114,0,16,''),(169,9,563,0,16,''),(170,9,514,0,16,''),(171,9,114,0,17,''),(172,9,563,0,17,''),(173,9,514,0,17,''),(174,9,114,0,19,''),(175,9,563,0,19,''),(176,9,514,0,19,''),(177,9,114,0,20,''),(178,9,563,0,20,''),(179,9,514,0,20,'');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_product`
--
DROP TABLE IF EXISTS `catalog_category_product`;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_product`
--
LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (4,35,0),(4,36,0),(4,37,0),(4,38,0),(4,117,0),(4,118,0),(4,119,0),(4,120,0),(4,121,0),(4,122,0),(4,123,0),(4,124,0),(4,125,0),(4,126,0),(4,127,0),(4,128,0),(4,129,0),(4,130,0),(4,131,0),(8,16,0),(8,17,0),(8,18,0),(8,19,0),(8,20,0),(8,166,0),(12,46,0),(15,25,0),(15,26,0),(15,28,3),(15,140,0),(15,141,0),(15,143,0),(15,163,0),(16,30,0),(16,34,0),(16,83,0),(16,84,0),(16,85,0),(16,86,0),(16,87,0),(16,88,0),(16,89,0),(16,90,0),(16,91,0),(16,92,0),(16,93,0),(16,94,0),(16,95,0),(16,96,0),(16,97,0),(16,98,0),(16,99,0),(16,100,0),(16,101,0),(16,102,0),(17,31,2),(17,32,2),(17,33,2),(17,49,2),(17,74,2),(17,75,2),(17,79,2),(17,80,2),(17,81,2),(17,82,2),(17,83,2),(17,84,2),(17,85,2),(17,86,2),(17,87,2),(17,88,2),(17,89,2),(17,90,2),(17,91,2),(17,92,2),(17,103,2),(17,104,2),(17,105,2),(17,106,2),(17,107,2),(17,108,2),(17,109,2),(17,110,2),(17,111,2),(17,112,2),(17,113,2),(17,114,2),(17,115,2),(17,135,1),(19,39,0),(22,51,0),(22,52,0),(22,53,0),(22,54,0),(23,41,0),(23,42,0),(25,132,0),(25,133,0),(25,134,0),(26,44,0),(26,45,0),(26,46,0),(26,47,0),(26,48,0),(27,163,0),(27,164,0),(27,165,0),(28,25,0),(28,26,0),(28,28,0),(28,158,0),(29,149,0),(29,150,0),(29,154,0),(29,155,0),(30,147,0),(30,152,0),(30,156,0),(30,157,0),(31,140,0),(31,141,0),(31,143,0),(32,138,0),(32,139,0),(33,145,0),(33,148,0),(33,151,0),(33,153,0),(34,159,0),(34,160,0),(34,161,0),(34,162,0);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_category_product_index`
--
DROP TABLE IF EXISTS `catalog_category_product_index`;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `position` int(10) unsigned NOT NULL default '0',
  `is_parent` tinyint(1) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`is_parent`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_category_product_index`
--
LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index` VALUES (3,30,0,0,1,1),(3,34,0,0,1,1),(3,35,0,0,1,1),(3,36,0,0,1,1),(3,37,0,0,1,1),(3,38,0,0,1,1),(3,84,0,0,1,1),(3,85,0,0,1,1),(3,86,0,0,1,1),(3,87,0,0,1,1),(3,88,0,0,1,1),(3,89,0,0,1,1),(3,90,0,0,1,1),(3,91,0,0,1,1),(3,92,0,0,1,1),(3,94,0,0,1,1),(3,95,0,0,1,1),(3,96,0,0,1,1),(3,97,0,0,1,1),(3,99,0,0,1,1),(3,100,0,0,1,1),(3,101,0,0,1,1),(3,102,0,0,1,1),(3,117,0,0,1,1),(3,118,0,0,1,1),(3,121,0,0,1,1),(3,122,0,0,1,1),(3,124,0,0,1,1),(3,125,0,0,1,1),(3,127,0,0,1,1),(3,128,0,0,1,1),(3,129,0,0,1,1),(3,130,0,0,1,1),(3,131,0,0,1,1),(3,31,2,0,1,1),(3,32,2,0,1,1),(3,33,2,0,1,1),(3,49,2,0,1,1),(3,74,2,0,1,1),(3,75,2,0,1,1),(3,79,2,0,1,1),(3,80,2,0,1,1),(3,81,2,0,1,1),(3,82,2,0,1,1),(3,104,2,0,1,1),(3,105,2,0,1,1),(3,106,2,0,1,1),(3,107,2,0,1,1),(3,109,2,0,1,1),(3,110,2,0,1,1),(3,111,2,0,1,1),(3,113,2,0,1,1),(3,114,2,0,1,1),(3,115,2,0,1,1),(3,16,0,0,1,4),(3,17,0,0,1,4),(3,18,0,0,1,4),(3,19,0,0,1,4),(3,20,0,0,1,4),(3,25,0,0,1,4),(3,26,0,0,1,4),(3,39,0,0,1,4),(3,41,0,0,1,4),(3,42,0,0,1,4),(3,44,0,0,1,4),(3,45,0,0,1,4),(3,46,0,0,1,4),(3,47,0,0,1,4),(3,48,0,0,1,4),(3,51,0,0,1,4),(3,52,0,0,1,4),(3,53,0,0,1,4),(3,54,0,0,1,4),(3,83,0,0,1,4),(3,93,0,0,1,4),(3,98,0,0,1,4),(3,119,0,0,1,4),(3,120,0,0,1,4),(3,123,0,0,1,4),(3,126,0,0,1,4),(3,132,0,0,1,4),(3,133,0,0,1,4),(3,134,0,0,1,4),(3,138,0,0,1,4),(3,139,0,0,1,4),(3,140,0,0,1,4),(3,141,0,0,1,4),(3,143,0,0,1,4),(3,145,0,0,1,4),(3,147,0,0,1,4),(3,148,0,0,1,4),(3,149,0,0,1,4),(3,150,0,0,1,4),(3,151,0,0,1,4),(3,152,0,0,1,4),(3,153,0,0,1,4),(3,154,0,0,1,4),(3,155,0,0,1,4),(3,156,0,0,1,4),(3,157,0,0,1,4),(3,158,0,0,1,4),(3,159,0,0,1,4),(3,160,0,0,1,4),(3,161,0,0,1,4),(3,162,0,0,1,4),(3,163,0,0,1,4),(3,164,0,0,1,4),(3,165,0,0,1,4),(3,166,0,0,1,4),(3,135,1,0,1,4),(3,103,2,0,1,4),(3,108,2,0,1,4),(3,112,2,0,1,4),(3,28,3,0,1,4),(4,35,0,1,1,1),(4,36,0,1,1,1),(4,37,0,1,1,1),(4,38,0,1,1,1),(4,117,0,1,1,1),(4,118,0,1,1,1),(4,121,0,1,1,1),(4,122,0,1,1,1),(4,124,0,1,1,1),(4,125,0,1,1,1),(4,127,0,1,1,1),(4,128,0,1,1,1),(4,129,0,1,1,1),(4,130,0,1,1,1),(4,131,0,1,1,1),(4,119,0,1,1,4),(4,120,0,1,1,4),(4,123,0,1,1,4),(4,126,0,1,1,4),(5,30,0,0,1,1),(5,34,0,0,1,1),(5,84,0,0,1,1),(5,85,0,0,1,1),(5,86,0,0,1,1),(5,87,0,0,1,1),(5,88,0,0,1,1),(5,89,0,0,1,1),(5,90,0,0,1,1),(5,91,0,0,1,1),(5,92,0,0,1,1),(5,94,0,0,1,1),(5,95,0,0,1,1),(5,96,0,0,1,1),(5,97,0,0,1,1),(5,99,0,0,1,1),(5,100,0,0,1,1),(5,101,0,0,1,1),(5,102,0,0,1,1),(5,31,2,0,1,1),(5,32,2,0,1,1),(5,33,2,0,1,1),(5,49,2,0,1,1),(5,74,2,0,1,1),(5,75,2,0,1,1),(5,79,2,0,1,1),(5,80,2,0,1,1),(5,81,2,0,1,1),(5,82,2,0,1,1),(5,104,2,0,1,1),(5,105,2,0,1,1),(5,106,2,0,1,1),(5,107,2,0,1,1),(5,109,2,0,1,1),(5,110,2,0,1,1),(5,111,2,0,1,1),(5,113,2,0,1,1),(5,114,2,0,1,1),(5,115,2,0,1,1),(5,83,0,0,1,4),(5,93,0,0,1,4),(5,98,0,0,1,4),(5,135,1,0,1,4),(5,103,2,0,1,4),(5,108,2,0,1,4),(5,112,2,0,1,4),(8,16,0,1,1,4),(8,17,0,1,1,4),(8,18,0,1,1,4),(8,19,0,1,1,4),(8,20,0,1,1,4),(8,166,0,1,1,4),(10,41,0,0,1,4),(10,42,0,0,1,4),(10,51,0,0,1,4),(10,52,0,0,1,4),(10,53,0,0,1,4),(10,54,0,0,1,4),(12,44,0,0,1,4),(12,45,0,0,1,4),(12,47,0,0,1,4),(12,48,0,0,1,4),(12,132,0,0,1,4),(12,133,0,0,1,4),(12,134,0,0,1,4),(12,46,0,1,1,4),(13,16,0,0,1,4),(13,17,0,0,1,4),(13,18,0,0,1,4),(13,19,0,0,1,4),(13,20,0,0,1,4),(13,25,0,0,1,4),(13,26,0,0,1,4),(13,44,0,0,1,4),(13,45,0,0,1,4),(13,46,0,0,1,4),(13,47,0,0,1,4),(13,48,0,0,1,4),(13,132,0,0,1,4),(13,133,0,0,1,4),(13,134,0,0,1,4),(13,138,0,0,1,4),(13,139,0,0,1,4),(13,140,0,0,1,4),(13,141,0,0,1,4),(13,143,0,0,1,4),(13,145,0,0,1,4),(13,147,0,0,1,4),(13,148,0,0,1,4),(13,149,0,0,1,4),(13,150,0,0,1,4),(13,151,0,0,1,4),(13,152,0,0,1,4),(13,153,0,0,1,4),(13,154,0,0,1,4),(13,155,0,0,1,4),(13,156,0,0,1,4),(13,157,0,0,1,4),(13,158,0,0,1,4),(13,159,0,0,1,4),(13,160,0,0,1,4),(13,161,0,0,1,4),(13,162,0,0,1,4),(13,163,0,0,1,4),(13,164,0,0,1,4),(13,165,0,0,1,4),(13,166,0,0,1,4),(13,28,3,0,1,4),(15,138,0,0,1,4),(15,139,0,0,1,4),(15,145,0,0,1,4),(15,147,0,0,1,4),(15,148,0,0,1,4),(15,149,0,0,1,4),(15,150,0,0,1,4),(15,151,0,0,1,4),(15,152,0,0,1,4),(15,153,0,0,1,4),(15,154,0,0,1,4),(15,155,0,0,1,4),(15,156,0,0,1,4),(15,157,0,0,1,4),(15,158,0,0,1,4),(15,159,0,0,1,4),(15,160,0,0,1,4),(15,161,0,0,1,4),(15,162,0,0,1,4),(15,164,0,0,1,4),(15,165,0,0,1,4),(15,25,0,1,1,4),(15,26,0,1,1,4),(15,140,0,1,1,4),(15,141,0,1,1,4),(15,143,0,1,1,4),(15,163,0,1,1,4),(15,28,3,1,1,4),(16,30,0,1,1,1),(16,34,0,1,1,1),(16,84,0,1,1,1),(16,85,0,1,1,1),(16,86,0,1,1,1),(16,87,0,1,1,1),(16,88,0,1,1,1),(16,89,0,1,1,1),(16,90,0,1,1,1),(16,91,0,1,1,1),(16,92,0,1,1,1),(16,94,0,1,1,1),(16,95,0,1,1,1),(16,96,0,1,1,1),(16,97,0,1,1,1),(16,99,0,1,1,1),(16,100,0,1,1,1),(16,101,0,1,1,1),(16,102,0,1,1,1),(16,83,0,1,1,4),(16,93,0,1,1,4),(16,98,0,1,1,4),(17,31,2,1,1,1),(17,32,2,1,1,1),(17,33,2,1,1,1),(17,49,2,1,1,1),(17,74,2,1,1,1),(17,75,2,1,1,1),(17,79,2,1,1,1),(17,80,2,1,1,1),(17,81,2,1,1,1),(17,82,2,1,1,1),(17,84,2,1,1,1),(17,85,2,1,1,1),(17,86,2,1,1,1),(17,87,2,1,1,1),(17,88,2,1,1,1),(17,89,2,1,1,1),(17,90,2,1,1,1),(17,91,2,1,1,1),(17,92,2,1,1,1),(17,104,2,1,1,1),(17,105,2,1,1,1),(17,106,2,1,1,1),(17,107,2,1,1,1),(17,109,2,1,1,1),(17,110,2,1,1,1),(17,111,2,1,1,1),(17,113,2,1,1,1),(17,114,2,1,1,1),(17,115,2,1,1,1),(17,135,1,1,1,4),(17,83,2,1,1,4),(17,103,2,1,1,4),(17,108,2,1,1,4),(17,112,2,1,1,4),(18,30,0,0,1,1),(18,34,0,0,1,1),(18,35,0,0,1,1),(18,36,0,0,1,1),(18,37,0,0,1,1),(18,38,0,0,1,1),(18,84,0,0,1,1),(18,85,0,0,1,1),(18,86,0,0,1,1),(18,87,0,0,1,1),(18,88,0,0,1,1),(18,89,0,0,1,1),(18,90,0,0,1,1),(18,91,0,0,1,1),(18,92,0,0,1,1),(18,94,0,0,1,1),(18,95,0,0,1,1),(18,96,0,0,1,1),(18,97,0,0,1,1),(18,99,0,0,1,1),(18,100,0,0,1,1),(18,101,0,0,1,1),(18,102,0,0,1,1),(18,117,0,0,1,1),(18,118,0,0,1,1),(18,121,0,0,1,1),(18,122,0,0,1,1),(18,124,0,0,1,1),(18,125,0,0,1,1),(18,127,0,0,1,1),(18,128,0,0,1,1),(18,129,0,0,1,1),(18,130,0,0,1,1),(18,131,0,0,1,1),(18,31,2,0,1,1),(18,32,2,0,1,1),(18,33,2,0,1,1),(18,49,2,0,1,1),(18,74,2,0,1,1),(18,75,2,0,1,1),(18,79,2,0,1,1),(18,80,2,0,1,1),(18,81,2,0,1,1),(18,82,2,0,1,1),(18,104,2,0,1,1),(18,105,2,0,1,1),(18,106,2,0,1,1),(18,107,2,0,1,1),(18,109,2,0,1,1),(18,110,2,0,1,1),(18,111,2,0,1,1),(18,113,2,0,1,1),(18,114,2,0,1,1),(18,115,2,0,1,1),(18,39,0,0,1,4),(18,83,0,0,1,4),(18,93,0,0,1,4),(18,98,0,0,1,4),(18,119,0,0,1,4),(18,120,0,0,1,4),(18,123,0,0,1,4),(18,126,0,0,1,4),(18,135,1,0,1,4),(18,103,2,0,1,4),(18,108,2,0,1,4),(18,112,2,0,1,4),(19,39,0,1,1,4),(22,51,0,1,1,4),(22,52,0,1,1,4),(22,53,0,1,1,4),(22,54,0,1,1,4),(23,41,0,1,1,4),(23,42,0,1,1,4),(25,132,0,1,1,4),(25,133,0,1,1,4),(25,134,0,1,1,4),(26,44,0,1,1,4),(26,45,0,1,1,4),(26,46,0,1,1,4),(26,47,0,1,1,4),(26,48,0,1,1,4),(27,163,0,1,1,4),(27,164,0,1,1,4),(27,165,0,1,1,4),(28,25,0,1,1,4),(28,26,0,1,1,4),(28,28,0,1,1,4),(28,158,0,1,1,4),(29,149,0,1,1,4),(29,150,0,1,1,4),(29,154,0,1,1,4),(29,155,0,1,1,4),(30,147,0,1,1,4),(30,152,0,1,1,4),(30,156,0,1,1,4),(30,157,0,1,1,4),(31,140,0,1,1,4),(31,141,0,1,1,4),(31,143,0,1,1,4),(32,138,0,1,1,4),(32,139,0,1,1,4),(33,145,0,1,1,4),(33,148,0,1,1,4),(33,151,0,1,1,4),(33,153,0,1,1,4),(34,159,0,1,1,4),(34,160,0,1,1,4),(34,161,0,1,1,4),(34,162,0,1,1,4),(3,30,0,0,2,1),(3,34,0,0,2,1),(3,35,0,0,2,1),(3,36,0,0,2,1),(3,37,0,0,2,1),(3,38,0,0,2,1),(3,84,0,0,2,1),(3,85,0,0,2,1),(3,86,0,0,2,1),(3,87,0,0,2,1),(3,88,0,0,2,1),(3,89,0,0,2,1),(3,90,0,0,2,1),(3,91,0,0,2,1),(3,92,0,0,2,1),(3,94,0,0,2,1),(3,95,0,0,2,1),(3,96,0,0,2,1),(3,97,0,0,2,1),(3,99,0,0,2,1),(3,100,0,0,2,1),(3,101,0,0,2,1),(3,102,0,0,2,1),(3,117,0,0,2,1),(3,118,0,0,2,1),(3,121,0,0,2,1),(3,122,0,0,2,1),(3,124,0,0,2,1),(3,125,0,0,2,1),(3,127,0,0,2,1),(3,128,0,0,2,1),(3,129,0,0,2,1),(3,130,0,0,2,1),(3,131,0,0,2,1),(3,31,2,0,2,1),(3,32,2,0,2,1),(3,33,2,0,2,1),(3,49,2,0,2,1),(3,74,2,0,2,1),(3,75,2,0,2,1),(3,79,2,0,2,1),(3,80,2,0,2,1),(3,81,2,0,2,1),(3,82,2,0,2,1),(3,104,2,0,2,1),(3,105,2,0,2,1),(3,106,2,0,2,1),(3,107,2,0,2,1),(3,109,2,0,2,1),(3,110,2,0,2,1),(3,111,2,0,2,1),(3,113,2,0,2,1),(3,114,2,0,2,1),(3,115,2,0,2,1),(3,16,0,0,2,4),(3,17,0,0,2,4),(3,18,0,0,2,4),(3,19,0,0,2,4),(3,20,0,0,2,4),(3,25,0,0,2,4),(3,26,0,0,2,4),(3,39,0,0,2,4),(3,41,0,0,2,4),(3,42,0,0,2,4),(3,44,0,0,2,4),(3,45,0,0,2,4),(3,46,0,0,2,4),(3,47,0,0,2,4),(3,48,0,0,2,4),(3,51,0,0,2,4),(3,52,0,0,2,4),(3,53,0,0,2,4),(3,54,0,0,2,4),(3,83,0,0,2,4),(3,93,0,0,2,4),(3,98,0,0,2,4),(3,119,0,0,2,4),(3,120,0,0,2,4),(3,123,0,0,2,4),(3,126,0,0,2,4),(3,132,0,0,2,4),(3,133,0,0,2,4),(3,134,0,0,2,4),(3,138,0,0,2,4),(3,139,0,0,2,4),(3,140,0,0,2,4),(3,141,0,0,2,4),(3,143,0,0,2,4),(3,145,0,0,2,4),(3,147,0,0,2,4),(3,148,0,0,2,4),(3,149,0,0,2,4),(3,150,0,0,2,4),(3,151,0,0,2,4),(3,152,0,0,2,4),(3,153,0,0,2,4),(3,154,0,0,2,4),(3,155,0,0,2,4),(3,156,0,0,2,4),(3,157,0,0,2,4),(3,158,0,0,2,4),(3,159,0,0,2,4),(3,160,0,0,2,4),(3,161,0,0,2,4),(3,162,0,0,2,4),(3,163,0,0,2,4),(3,164,0,0,2,4),(3,165,0,0,2,4),(3,166,0,0,2,4),(3,135,1,0,2,4),(3,103,2,0,2,4),(3,108,2,0,2,4),(3,112,2,0,2,4),(3,28,3,0,2,4),(4,35,0,1,2,1),(4,36,0,1,2,1),(4,37,0,1,2,1),(4,38,0,1,2,1),(4,117,0,1,2,1),(4,118,0,1,2,1),(4,121,0,1,2,1),(4,122,0,1,2,1),(4,124,0,1,2,1),(4,125,0,1,2,1),(4,127,0,1,2,1),(4,128,0,1,2,1),(4,129,0,1,2,1),(4,130,0,1,2,1),(4,131,0,1,2,1),(4,119,0,1,2,4),(4,120,0,1,2,4),(4,123,0,1,2,4),(4,126,0,1,2,4),(5,30,0,0,2,1),(5,34,0,0,2,1),(5,84,0,0,2,1),(5,85,0,0,2,1),(5,86,0,0,2,1),(5,87,0,0,2,1),(5,88,0,0,2,1),(5,89,0,0,2,1),(5,90,0,0,2,1),(5,91,0,0,2,1),(5,92,0,0,2,1),(5,94,0,0,2,1),(5,95,0,0,2,1),(5,96,0,0,2,1),(5,97,0,0,2,1),(5,99,0,0,2,1),(5,100,0,0,2,1),(5,101,0,0,2,1),(5,102,0,0,2,1),(5,31,2,0,2,1),(5,32,2,0,2,1),(5,33,2,0,2,1),(5,49,2,0,2,1),(5,74,2,0,2,1),(5,75,2,0,2,1),(5,79,2,0,2,1),(5,80,2,0,2,1),(5,81,2,0,2,1),(5,82,2,0,2,1),(5,104,2,0,2,1),(5,105,2,0,2,1),(5,106,2,0,2,1),(5,107,2,0,2,1),(5,109,2,0,2,1),(5,110,2,0,2,1),(5,111,2,0,2,1),(5,113,2,0,2,1),(5,114,2,0,2,1),(5,115,2,0,2,1),(5,83,0,0,2,4),(5,93,0,0,2,4),(5,98,0,0,2,4),(5,135,1,0,2,4),(5,103,2,0,2,4),(5,108,2,0,2,4),(5,112,2,0,2,4),(8,16,0,1,2,4),(8,17,0,1,2,4),(8,18,0,1,2,4),(8,19,0,1,2,4),(8,20,0,1,2,4),(8,166,0,1,2,4),(10,41,0,0,2,4),(10,42,0,0,2,4),(10,51,0,0,2,4),(10,52,0,0,2,4),(10,53,0,0,2,4),(10,54,0,0,2,4),(12,44,0,0,2,4),(12,45,0,0,2,4),(12,47,0,0,2,4),(12,48,0,0,2,4),(12,132,0,0,2,4),(12,133,0,0,2,4),(12,134,0,0,2,4),(12,46,0,1,2,4),(13,16,0,0,2,4),(13,17,0,0,2,4),(13,18,0,0,2,4),(13,19,0,0,2,4),(13,20,0,0,2,4),(13,25,0,0,2,4),(13,26,0,0,2,4),(13,44,0,0,2,4),(13,45,0,0,2,4),(13,46,0,0,2,4),(13,47,0,0,2,4),(13,48,0,0,2,4),(13,132,0,0,2,4),(13,133,0,0,2,4),(13,134,0,0,2,4),(13,138,0,0,2,4),(13,139,0,0,2,4),(13,140,0,0,2,4),(13,141,0,0,2,4),(13,143,0,0,2,4),(13,145,0,0,2,4),(13,147,0,0,2,4),(13,148,0,0,2,4),(13,149,0,0,2,4),(13,150,0,0,2,4),(13,151,0,0,2,4),(13,152,0,0,2,4),(13,153,0,0,2,4),(13,154,0,0,2,4),(13,155,0,0,2,4),(13,156,0,0,2,4),(13,157,0,0,2,4),(13,158,0,0,2,4),(13,159,0,0,2,4),(13,160,0,0,2,4),(13,161,0,0,2,4),(13,162,0,0,2,4),(13,163,0,0,2,4),(13,164,0,0,2,4),(13,165,0,0,2,4),(13,166,0,0,2,4),(13,28,3,0,2,4),(15,138,0,0,2,4),(15,139,0,0,2,4),(15,145,0,0,2,4),(15,147,0,0,2,4),(15,148,0,0,2,4),(15,149,0,0,2,4),(15,150,0,0,2,4),(15,151,0,0,2,4),(15,152,0,0,2,4),(15,153,0,0,2,4),(15,154,0,0,2,4),(15,155,0,0,2,4),(15,156,0,0,2,4),(15,157,0,0,2,4),(15,158,0,0,2,4),(15,159,0,0,2,4),(15,160,0,0,2,4),(15,161,0,0,2,4),(15,162,0,0,2,4),(15,164,0,0,2,4),(15,165,0,0,2,4),(15,25,0,1,2,4),(15,26,0,1,2,4),(15,140,0,1,2,4),(15,141,0,1,2,4),(15,143,0,1,2,4),(15,163,0,1,2,4),(15,28,3,1,2,4),(16,30,0,1,2,1),(16,34,0,1,2,1),(16,84,0,1,2,1),(16,85,0,1,2,1),(16,86,0,1,2,1),(16,87,0,1,2,1),(16,88,0,1,2,1),(16,89,0,1,2,1),(16,90,0,1,2,1),(16,91,0,1,2,1),(16,92,0,1,2,1),(16,94,0,1,2,1),(16,95,0,1,2,1),(16,96,0,1,2,1),(16,97,0,1,2,1),(16,99,0,1,2,1),(16,100,0,1,2,1),(16,101,0,1,2,1),(16,102,0,1,2,1),(16,83,0,1,2,4),(16,93,0,1,2,4),(16,98,0,1,2,4),(17,31,2,1,2,1),(17,32,2,1,2,1),(17,33,2,1,2,1),(17,49,2,1,2,1),(17,74,2,1,2,1),(17,75,2,1,2,1),(17,79,2,1,2,1),(17,80,2,1,2,1),(17,81,2,1,2,1),(17,82,2,1,2,1),(17,84,2,1,2,1),(17,85,2,1,2,1),(17,86,2,1,2,1),(17,87,2,1,2,1),(17,88,2,1,2,1),(17,89,2,1,2,1),(17,90,2,1,2,1),(17,91,2,1,2,1),(17,92,2,1,2,1),(17,104,2,1,2,1),(17,105,2,1,2,1),(17,106,2,1,2,1),(17,107,2,1,2,1),(17,109,2,1,2,1),(17,110,2,1,2,1),(17,111,2,1,2,1),(17,113,2,1,2,1),(17,114,2,1,2,1),(17,115,2,1,2,1),(17,135,1,1,2,4),(17,83,2,1,2,4),(17,103,2,1,2,4),(17,108,2,1,2,4),(17,112,2,1,2,4),(18,30,0,0,2,1),(18,34,0,0,2,1),(18,35,0,0,2,1),(18,36,0,0,2,1),(18,37,0,0,2,1),(18,38,0,0,2,1),(18,84,0,0,2,1),(18,85,0,0,2,1),(18,86,0,0,2,1),(18,87,0,0,2,1),(18,88,0,0,2,1),(18,89,0,0,2,1),(18,90,0,0,2,1),(18,91,0,0,2,1),(18,92,0,0,2,1),(18,94,0,0,2,1),(18,95,0,0,2,1),(18,96,0,0,2,1),(18,97,0,0,2,1),(18,99,0,0,2,1),(18,100,0,0,2,1),(18,101,0,0,2,1),(18,102,0,0,2,1),(18,117,0,0,2,1),(18,118,0,0,2,1),(18,121,0,0,2,1),(18,122,0,0,2,1),(18,124,0,0,2,1),(18,125,0,0,2,1),(18,127,0,0,2,1),(18,128,0,0,2,1),(18,129,0,0,2,1),(18,130,0,0,2,1),(18,131,0,0,2,1),(18,31,2,0,2,1),(18,32,2,0,2,1),(18,33,2,0,2,1),(18,49,2,0,2,1),(18,74,2,0,2,1),(18,75,2,0,2,1),(18,79,2,0,2,1),(18,80,2,0,2,1),(18,81,2,0,2,1),(18,82,2,0,2,1),(18,104,2,0,2,1),(18,105,2,0,2,1),(18,106,2,0,2,1),(18,107,2,0,2,1),(18,109,2,0,2,1),(18,110,2,0,2,1),(18,111,2,0,2,1),(18,113,2,0,2,1),(18,114,2,0,2,1),(18,115,2,0,2,1),(18,39,0,0,2,4),(18,83,0,0,2,4),(18,93,0,0,2,4),(18,98,0,0,2,4),(18,119,0,0,2,4),(18,120,0,0,2,4),(18,123,0,0,2,4),(18,126,0,0,2,4),(18,135,1,0,2,4),(18,103,2,0,2,4),(18,108,2,0,2,4),(18,112,2,0,2,4),(19,39,0,1,2,4),(22,51,0,1,2,4),(22,52,0,1,2,4),(22,53,0,1,2,4),(22,54,0,1,2,4),(23,41,0,1,2,4),(23,42,0,1,2,4),(25,132,0,1,2,4),(25,133,0,1,2,4),(25,134,0,1,2,4),(26,44,0,1,2,4),(26,45,0,1,2,4),(26,46,0,1,2,4),(26,47,0,1,2,4),(26,48,0,1,2,4),(27,163,0,1,2,4),(27,164,0,1,2,4),(27,165,0,1,2,4),(28,25,0,1,2,4),(28,26,0,1,2,4),(28,28,0,1,2,4),(28,158,0,1,2,4),(29,149,0,1,2,4),(29,150,0,1,2,4),(29,154,0,1,2,4),(29,155,0,1,2,4),(30,147,0,1,2,4),(30,152,0,1,2,4),(30,156,0,1,2,4),(30,157,0,1,2,4),(31,140,0,1,2,4),(31,141,0,1,2,4),(31,143,0,1,2,4),(32,138,0,1,2,4),(32,139,0,1,2,4),(33,145,0,1,2,4),(33,148,0,1,2,4),(33,151,0,1,2,4),(33,153,0,1,2,4),(34,159,0,1,2,4),(34,160,0,1,2,4),(34,161,0,1,2,4),(34,162,0,1,2,4),(3,30,0,0,3,1),(3,34,0,0,3,1),(3,35,0,0,3,1),(3,36,0,0,3,1),(3,37,0,0,3,1),(3,38,0,0,3,1),(3,84,0,0,3,1),(3,85,0,0,3,1),(3,86,0,0,3,1),(3,87,0,0,3,1),(3,88,0,0,3,1),(3,89,0,0,3,1),(3,90,0,0,3,1),(3,91,0,0,3,1),(3,92,0,0,3,1),(3,94,0,0,3,1),(3,95,0,0,3,1),(3,96,0,0,3,1),(3,97,0,0,3,1),(3,99,0,0,3,1),(3,100,0,0,3,1),(3,101,0,0,3,1),(3,102,0,0,3,1),(3,117,0,0,3,1),(3,118,0,0,3,1),(3,121,0,0,3,1),(3,122,0,0,3,1),(3,124,0,0,3,1),(3,125,0,0,3,1),(3,127,0,0,3,1),(3,128,0,0,3,1),(3,129,0,0,3,1),(3,130,0,0,3,1),(3,131,0,0,3,1),(3,31,2,0,3,1),(3,32,2,0,3,1),(3,33,2,0,3,1),(3,49,2,0,3,1),(3,74,2,0,3,1),(3,75,2,0,3,1),(3,79,2,0,3,1),(3,80,2,0,3,1),(3,81,2,0,3,1),(3,82,2,0,3,1),(3,104,2,0,3,1),(3,105,2,0,3,1),(3,106,2,0,3,1),(3,107,2,0,3,1),(3,109,2,0,3,1),(3,110,2,0,3,1),(3,111,2,0,3,1),(3,113,2,0,3,1),(3,114,2,0,3,1),(3,115,2,0,3,1),(3,16,0,0,3,4),(3,17,0,0,3,4),(3,18,0,0,3,4),(3,19,0,0,3,4),(3,20,0,0,3,4),(3,25,0,0,3,4),(3,26,0,0,3,4),(3,39,0,0,3,4),(3,41,0,0,3,4),(3,42,0,0,3,4),(3,44,0,0,3,4),(3,45,0,0,3,4),(3,46,0,0,3,4),(3,47,0,0,3,4),(3,48,0,0,3,4),(3,51,0,0,3,4),(3,52,0,0,3,4),(3,53,0,0,3,4),(3,54,0,0,3,4),(3,83,0,0,3,4),(3,93,0,0,3,4),(3,98,0,0,3,4),(3,119,0,0,3,4),(3,120,0,0,3,4),(3,123,0,0,3,4),(3,126,0,0,3,4),(3,132,0,0,3,4),(3,133,0,0,3,4),(3,134,0,0,3,4),(3,138,0,0,3,4),(3,139,0,0,3,4),(3,140,0,0,3,4),(3,141,0,0,3,4),(3,143,0,0,3,4),(3,145,0,0,3,4),(3,147,0,0,3,4),(3,148,0,0,3,4),(3,149,0,0,3,4),(3,150,0,0,3,4),(3,151,0,0,3,4),(3,152,0,0,3,4),(3,153,0,0,3,4),(3,154,0,0,3,4),(3,155,0,0,3,4),(3,156,0,0,3,4),(3,157,0,0,3,4),(3,158,0,0,3,4),(3,159,0,0,3,4),(3,160,0,0,3,4),(3,161,0,0,3,4),(3,162,0,0,3,4),(3,163,0,0,3,4),(3,164,0,0,3,4),(3,165,0,0,3,4),(3,166,0,0,3,4),(3,135,1,0,3,4),(3,103,2,0,3,4),(3,108,2,0,3,4),(3,112,2,0,3,4),(3,28,3,0,3,4),(4,35,0,1,3,1),(4,36,0,1,3,1),(4,37,0,1,3,1),(4,38,0,1,3,1),(4,117,0,1,3,1),(4,118,0,1,3,1),(4,121,0,1,3,1),(4,122,0,1,3,1),(4,124,0,1,3,1),(4,125,0,1,3,1),(4,127,0,1,3,1),(4,128,0,1,3,1),(4,129,0,1,3,1),(4,130,0,1,3,1),(4,131,0,1,3,1),(4,119,0,1,3,4),(4,120,0,1,3,4),(4,123,0,1,3,4),(4,126,0,1,3,4),(5,30,0,0,3,1),(5,34,0,0,3,1),(5,84,0,0,3,1),(5,85,0,0,3,1),(5,86,0,0,3,1),(5,87,0,0,3,1),(5,88,0,0,3,1),(5,89,0,0,3,1),(5,90,0,0,3,1),(5,91,0,0,3,1),(5,92,0,0,3,1),(5,94,0,0,3,1),(5,95,0,0,3,1),(5,96,0,0,3,1),(5,97,0,0,3,1),(5,99,0,0,3,1),(5,100,0,0,3,1),(5,101,0,0,3,1),(5,102,0,0,3,1),(5,31,2,0,3,1),(5,32,2,0,3,1),(5,33,2,0,3,1),(5,49,2,0,3,1),(5,74,2,0,3,1),(5,75,2,0,3,1),(5,79,2,0,3,1),(5,80,2,0,3,1),(5,81,2,0,3,1),(5,82,2,0,3,1),(5,104,2,0,3,1),(5,105,2,0,3,1),(5,106,2,0,3,1),(5,107,2,0,3,1),(5,109,2,0,3,1),(5,110,2,0,3,1),(5,111,2,0,3,1),(5,113,2,0,3,1),(5,114,2,0,3,1),(5,115,2,0,3,1),(5,83,0,0,3,4),(5,93,0,0,3,4),(5,98,0,0,3,4),(5,135,1,0,3,4),(5,103,2,0,3,4),(5,108,2,0,3,4),(5,112,2,0,3,4),(8,16,0,1,3,4),(8,17,0,1,3,4),(8,18,0,1,3,4),(8,19,0,1,3,4),(8,20,0,1,3,4),(8,166,0,1,3,4),(10,41,0,0,3,4),(10,42,0,0,3,4),(10,51,0,0,3,4),(10,52,0,0,3,4),(10,53,0,0,3,4),(10,54,0,0,3,4),(12,44,0,0,3,4),(12,45,0,0,3,4),(12,47,0,0,3,4),(12,48,0,0,3,4),(12,132,0,0,3,4),(12,133,0,0,3,4),(12,134,0,0,3,4),(12,46,0,1,3,4),(13,16,0,0,3,4),(13,17,0,0,3,4),(13,18,0,0,3,4),(13,19,0,0,3,4),(13,20,0,0,3,4),(13,25,0,0,3,4),(13,26,0,0,3,4),(13,44,0,0,3,4),(13,45,0,0,3,4),(13,46,0,0,3,4),(13,47,0,0,3,4),(13,48,0,0,3,4),(13,132,0,0,3,4),(13,133,0,0,3,4),(13,134,0,0,3,4),(13,138,0,0,3,4),(13,139,0,0,3,4),(13,140,0,0,3,4),(13,141,0,0,3,4),(13,143,0,0,3,4),(13,145,0,0,3,4),(13,147,0,0,3,4),(13,148,0,0,3,4),(13,149,0,0,3,4),(13,150,0,0,3,4),(13,151,0,0,3,4),(13,152,0,0,3,4),(13,153,0,0,3,4),(13,154,0,0,3,4),(13,155,0,0,3,4),(13,156,0,0,3,4),(13,157,0,0,3,4),(13,158,0,0,3,4),(13,159,0,0,3,4),(13,160,0,0,3,4),(13,161,0,0,3,4),(13,162,0,0,3,4),(13,163,0,0,3,4),(13,164,0,0,3,4),(13,165,0,0,3,4),(13,166,0,0,3,4),(13,28,3,0,3,4),(15,138,0,0,3,4),(15,139,0,0,3,4),(15,145,0,0,3,4),(15,147,0,0,3,4),(15,148,0,0,3,4),(15,149,0,0,3,4),(15,150,0,0,3,4),(15,151,0,0,3,4),(15,152,0,0,3,4),(15,153,0,0,3,4),(15,154,0,0,3,4),(15,155,0,0,3,4),(15,156,0,0,3,4),(15,157,0,0,3,4),(15,158,0,0,3,4),(15,159,0,0,3,4),(15,160,0,0,3,4),(15,161,0,0,3,4),(15,162,0,0,3,4),(15,164,0,0,3,4),(15,165,0,0,3,4),(15,25,0,1,3,4),(15,26,0,1,3,4),(15,140,0,1,3,4),(15,141,0,1,3,4),(15,143,0,1,3,4),(15,163,0,1,3,4),(15,28,3,1,3,4),(16,30,0,1,3,1),(16,34,0,1,3,1),(16,84,0,1,3,1),(16,85,0,1,3,1),(16,86,0,1,3,1),(16,87,0,1,3,1),(16,88,0,1,3,1),(16,89,0,1,3,1),(16,90,0,1,3,1),(16,91,0,1,3,1),(16,92,0,1,3,1),(16,94,0,1,3,1),(16,95,0,1,3,1),(16,96,0,1,3,1),(16,97,0,1,3,1),(16,99,0,1,3,1),(16,100,0,1,3,1),(16,101,0,1,3,1),(16,102,0,1,3,1),(16,83,0,1,3,4),(16,93,0,1,3,4),(16,98,0,1,3,4),(17,31,2,1,3,1),(17,32,2,1,3,1),(17,33,2,1,3,1),(17,49,2,1,3,1),(17,74,2,1,3,1),(17,75,2,1,3,1),(17,79,2,1,3,1),(17,80,2,1,3,1),(17,81,2,1,3,1),(17,82,2,1,3,1),(17,84,2,1,3,1),(17,85,2,1,3,1),(17,86,2,1,3,1),(17,87,2,1,3,1),(17,88,2,1,3,1),(17,89,2,1,3,1),(17,90,2,1,3,1),(17,91,2,1,3,1),(17,92,2,1,3,1),(17,104,2,1,3,1),(17,105,2,1,3,1),(17,106,2,1,3,1),(17,107,2,1,3,1),(17,109,2,1,3,1),(17,110,2,1,3,1),(17,111,2,1,3,1),(17,113,2,1,3,1),(17,114,2,1,3,1),(17,115,2,1,3,1),(17,135,1,1,3,4),(17,83,2,1,3,4),(17,103,2,1,3,4),(17,108,2,1,3,4),(17,112,2,1,3,4),(18,30,0,0,3,1),(18,34,0,0,3,1),(18,35,0,0,3,1),(18,36,0,0,3,1),(18,37,0,0,3,1),(18,38,0,0,3,1),(18,84,0,0,3,1),(18,85,0,0,3,1),(18,86,0,0,3,1),(18,87,0,0,3,1),(18,88,0,0,3,1),(18,89,0,0,3,1),(18,90,0,0,3,1),(18,91,0,0,3,1),(18,92,0,0,3,1),(18,94,0,0,3,1),(18,95,0,0,3,1),(18,96,0,0,3,1),(18,97,0,0,3,1),(18,99,0,0,3,1),(18,100,0,0,3,1),(18,101,0,0,3,1),(18,102,0,0,3,1),(18,117,0,0,3,1),(18,118,0,0,3,1),(18,121,0,0,3,1),(18,122,0,0,3,1),(18,124,0,0,3,1),(18,125,0,0,3,1),(18,127,0,0,3,1),(18,128,0,0,3,1),(18,129,0,0,3,1),(18,130,0,0,3,1),(18,131,0,0,3,1),(18,31,2,0,3,1),(18,32,2,0,3,1),(18,33,2,0,3,1),(18,49,2,0,3,1),(18,74,2,0,3,1),(18,75,2,0,3,1),(18,79,2,0,3,1),(18,80,2,0,3,1),(18,81,2,0,3,1),(18,82,2,0,3,1),(18,104,2,0,3,1),(18,105,2,0,3,1),(18,106,2,0,3,1),(18,107,2,0,3,1),(18,109,2,0,3,1),(18,110,2,0,3,1),(18,111,2,0,3,1),(18,113,2,0,3,1),(18,114,2,0,3,1),(18,115,2,0,3,1),(18,39,0,0,3,4),(18,83,0,0,3,4),(18,93,0,0,3,4),(18,98,0,0,3,4),(18,119,0,0,3,4),(18,120,0,0,3,4),(18,123,0,0,3,4),(18,126,0,0,3,4),(18,135,1,0,3,4),(18,103,2,0,3,4),(18,108,2,0,3,4),(18,112,2,0,3,4),(19,39,0,1,3,4),(22,51,0,1,3,4),(22,52,0,1,3,4),(22,53,0,1,3,4),(22,54,0,1,3,4),(23,41,0,1,3,4),(23,42,0,1,3,4),(25,132,0,1,3,4),(25,133,0,1,3,4),(25,134,0,1,3,4),(26,44,0,1,3,4),(26,45,0,1,3,4),(26,46,0,1,3,4),(26,47,0,1,3,4),(26,48,0,1,3,4),(27,163,0,1,3,4),(27,164,0,1,3,4),(27,165,0,1,3,4),(28,25,0,1,3,4),(28,26,0,1,3,4),(28,28,0,1,3,4),(28,158,0,1,3,4),(29,149,0,1,3,4),(29,150,0,1,3,4),(29,154,0,1,3,4),(29,155,0,1,3,4),(30,147,0,1,3,4),(30,152,0,1,3,4),(30,156,0,1,3,4),(30,157,0,1,3,4),(31,140,0,1,3,4),(31,141,0,1,3,4),(31,143,0,1,3,4),(32,138,0,1,3,4),(32,139,0,1,3,4),(33,145,0,1,3,4),(33,148,0,1,3,4),(33,151,0,1,3,4),(33,153,0,1,3,4),(34,159,0,1,3,4),(34,160,0,1,3,4),(34,161,0,1,3,4),(34,162,0,1,3,4);
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_compare_item`
--
DROP TABLE IF EXISTS `catalog_compare_item`;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL auto_increment,
  `visitor_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(11) unsigned default NULL,
  `product_id` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_compare_item`
--
LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_bundle_option`
--
DROP TABLE IF EXISTS `catalog_product_bundle_option`;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL default '0',
  `position` int(10) unsigned NOT NULL default '0',
  `type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Bundle Options';
--
-- Dumping data for table `catalog_product_bundle_option`
--
LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
INSERT INTO `catalog_product_bundle_option` VALUES (1,158,0,10,'radio'),(2,158,1,0,'radio'),(3,163,0,11,'multi'),(4,163,0,10,'radio'),(5,163,0,7,'checkbox'),(6,163,0,5,'radio'),(7,163,1,4,'radio'),(8,163,1,3,'radio'),(9,163,1,2,'radio'),(10,163,1,1,'radio'),(11,164,1,4,'select'),(12,164,1,5,'multi'),(13,164,0,8,'checkbox'),(14,165,1,4,'checkbox'),(15,165,1,3,'radio'),(16,165,1,2,'radio'),(17,165,1,1,'select'),(20,164,1,3,'radio'),(21,164,1,1,'radio'),(22,165,1,1,'select');
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_bundle_option_value`
--
DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` (`option_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
--
-- Dumping data for table `catalog_product_bundle_option_value`
--
LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
INSERT INTO `catalog_product_bundle_option_value` VALUES (1,1,0,'Waranty'),(2,2,0,'Laptop'),(3,21,0,'Case'),(4,20,0,'CPU'),(5,11,0,'RAM'),(6,12,0,'Hard Drive'),(7,13,0,'Peripherals'),(8,10,0,'Case'),(9,9,0,'Processor'),(10,8,0,'Memory'),(11,7,0,'Hard Drive'),(12,6,0,'Hard Drive 2'),(13,5,0,'Peripherals'),(14,4,0,'Monitor'),(15,3,0,'Warranty'),(16,17,0,'Case'),(17,22,0,'CPU'),(18,16,0,'Hard Drive'),(19,15,0,'Ram'),(20,14,0,'Monitor');
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_bundle_selection`
--
DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL default '0',
  `selection_price_value` decimal(12,4) NOT NULL default '0.0000',
  `selection_qty` decimal(12,4) NOT NULL default '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
--
-- Dumping data for table `catalog_product_bundle_selection`
--
LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
INSERT INTO `catalog_product_bundle_selection` VALUES (1,1,158,146,20,0,0,'0.0000','1.0000',0),(2,1,158,142,0,0,0,'0.0000','1.0000',0),(3,1,158,144,10,0,0,'0.0000','1.0000',0),(4,2,158,27,0,0,0,'0.0000','1.0000',0),(5,3,163,142,0,0,0,'0.0000','1.0000',1),(6,4,163,157,0,0,0,'0.0000','1.0000',1),(7,4,163,156,0,0,0,'0.0000','1.0000',1),(8,4,163,152,0,0,0,'0.0000','1.0000',1),(9,4,163,147,0,0,0,'0.0000','1.0000',1),(10,5,163,162,50,0,0,'0.0000','1.0000',1),(11,5,163,159,0,0,0,'0.0000','1.0000',1),(12,5,163,161,0,0,0,'0.0000','1.0000',1),(13,5,163,160,100,0,0,'0.0000','1.0000',1),(14,6,163,149,0,0,0,'0.0000','1.0000',1),(15,6,163,154,0,1,0,'0.0000','1.0000',1),(16,7,163,155,0,1,0,'0.0000','1.0000',0),(17,7,163,150,0,0,0,'0.0000','1.0000',0),(18,8,163,143,0,0,0,'0.0000','1.0000',0),(19,8,163,141,0,1,0,'0.0000','1.0000',0),(20,8,163,140,0,0,0,'0.0000','1.0000',0),(21,9,163,148,0,0,0,'0.0000','1.0000',0),(22,9,163,145,0,0,0,'0.0000','1.0000',0),(23,9,163,153,0,1,0,'0.0000','1.0000',0),(24,9,163,151,0,0,0,'0.0000','1.0000',0),(25,10,163,138,0,1,0,'0.0000','1.0000',0),(26,10,163,139,0,0,0,'0.0000','1.0000',0),(27,11,164,143,0,0,0,'0.0000','1.0000',0),(28,11,164,141,0,0,0,'75.0000','1.0000',0),(29,11,164,140,0,0,0,'150.0000','1.0000',0),(30,12,164,149,0,0,0,'250.0000','1.0000',1),(31,12,164,154,0,0,0,'0.0000','1.0000',1),(32,13,164,161,0,0,0,'199.0000','1.0000',1),(33,13,164,160,0,0,0,'50.0000','1.0000',1),(34,13,164,162,0,0,0,'0.0000','1.0000',1),(35,13,164,159,0,0,0,'0.0000','1.0000',1),(36,14,165,157,0,0,0,'0.0000','1.0000',1),(37,14,165,156,0,0,0,'0.0000','1.0000',1),(38,14,165,152,0,0,0,'0.0000','1.0000',1),(39,14,165,147,0,0,0,'0.0000','1.0000',1),(40,15,165,143,0,0,0,'0.0000','1.0000',0),(41,15,165,141,0,0,0,'0.0000','1.0000',0),(42,15,165,140,0,0,0,'0.0000','1.0000',0),(43,16,165,149,0,0,0,'0.0000','1.0000',1),(44,16,165,150,0,0,0,'0.0000','1.0000',1),(45,16,165,154,0,0,0,'0.0000','1.0000',1),(46,16,165,155,0,0,0,'0.0000','1.0000',1),(47,17,165,138,0,0,0,'0.0000','1.0000',0),(48,17,165,139,0,0,0,'0.0000','1.0000',0),(54,20,164,153,0,0,0,'700.0000','1.0000',0),(55,20,164,151,0,0,0,'200.0000','1.0000',0),(56,20,164,148,0,0,0,'100.0000','1.0000',0),(57,20,164,145,0,0,0,'0.0000','1.0000',0),(58,21,164,139,0,0,0,'0.0000','1.0000',0),(59,22,165,145,0,0,0,'0.0000','1.0000',0),(60,22,165,151,0,0,0,'0.0000','1.0000',0),(61,22,165,148,0,0,0,'0.0000','1.0000',0),(62,22,165,153,0,0,0,'0.0000','1.0000',0);
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_enabled_index`
--
DROP TABLE IF EXISTS `catalog_product_enabled_index`;
CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `visibility` smallint(5) unsigned NOT NULL default '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_enabled_index`
--
LOCK TABLES `catalog_product_enabled_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_enabled_index` DISABLE KEYS */;
INSERT INTO `catalog_product_enabled_index` VALUES (16,1,4),(16,2,4),(16,3,4),(17,1,4),(17,2,4),(17,3,4),(18,1,4),(18,2,4),(18,3,4),(19,1,4),(19,2,4),(19,3,4),(20,1,4),(20,2,4),(20,3,4),(25,1,4),(25,2,4),(25,3,4),(26,1,4),(26,2,4),(26,3,4),(27,1,4),(27,2,4),(27,3,4),(28,1,4),(28,2,4),(28,3,4),(29,1,1),(29,2,1),(29,3,1),(30,1,1),(30,2,1),(30,3,1),(31,1,1),(31,2,1),(31,3,1),(32,1,1),(32,2,1),(32,3,1),(33,1,1),(33,2,1),(33,3,1),(34,1,1),(34,2,1),(34,3,1),(35,1,1),(35,2,1),(35,3,1),(36,1,1),(36,2,1),(36,3,1),(37,1,1),(37,2,1),(37,3,1),(38,1,1),(38,2,1),(38,3,1),(39,1,4),(39,2,4),(39,3,4),(41,1,4),(41,2,4),(41,3,4),(42,1,4),(42,2,4),(42,3,4),(44,1,4),(44,2,4),(44,3,4),(45,1,4),(45,2,4),(45,3,4),(46,1,4),(46,2,4),(46,3,4),(47,1,4),(47,2,4),(47,3,4),(48,1,4),(48,2,4),(48,3,4),(49,1,1),(49,2,1),(49,3,1),(51,1,4),(51,2,4),(51,3,4),(52,1,4),(52,2,4),(52,3,4),(53,1,4),(53,2,4),(53,3,4),(54,1,4),(54,2,4),(54,3,4),(74,1,1),(74,2,1),(74,3,1),(75,1,1),(75,2,1),(75,3,1),(79,1,1),(79,2,1),(79,3,1),(80,1,1),(80,2,1),(80,3,1),(81,1,1),(81,2,1),(81,3,1),(82,1,1),(82,2,1),(82,3,1),(83,1,4),(83,2,4),(83,3,4),(84,1,1),(84,2,1),(84,3,1),(85,1,1),(85,2,1),(85,3,1),(86,1,1),(86,2,1),(86,3,1),(87,1,1),(87,2,1),(87,3,1),(88,1,1),(88,2,1),(88,3,1),(89,1,1),(89,2,1),(89,3,1),(90,1,1),(90,2,1),(90,3,1),(91,1,1),(91,2,1),(91,3,1),(92,1,1),(92,2,1),(92,3,1),(93,1,4),(93,2,4),(93,3,4),(94,1,1),(94,2,1),(94,3,1),(95,1,1),(95,2,1),(95,3,1),(96,1,1),(96,2,1),(96,3,1),(97,1,1),(97,2,1),(97,3,1),(98,1,4),(98,2,4),(98,3,4),(99,1,1),(99,2,1),(99,3,1),(100,1,1),(100,2,1),(100,3,1),(101,1,1),(101,2,1),(101,3,1),(102,1,1),(102,2,1),(102,3,1),(103,1,4),(103,2,4),(103,3,4),(104,1,1),(104,2,1),(104,3,1),(105,1,1),(105,2,1),(105,3,1),(106,1,1),(106,2,1),(106,3,1),(107,1,1),(107,2,1),(107,3,1),(108,1,4),(108,2,4),(108,3,4),(109,1,1),(109,2,1),(109,3,1),(110,1,1),(110,2,1),(110,3,1),(111,1,1),(111,2,1),(111,3,1),(112,1,4),(112,2,4),(112,3,4),(113,1,1),(113,2,1),(113,3,1),(114,1,1),(114,2,1),(114,3,1),(115,1,1),(115,2,1),(115,3,1),(117,1,1),(117,2,1),(117,3,1),(118,1,1),(118,2,1),(118,3,1),(119,1,4),(119,2,4),(119,3,4),(120,1,4),(120,2,4),(120,3,4),(121,1,1),(121,2,1),(121,3,1),(122,1,1),(122,2,1),(122,3,1),(123,1,4),(123,2,4),(123,3,4),(124,1,1),(124,2,1),(124,3,1),(125,1,1),(125,2,1),(125,3,1),(126,1,4),(126,2,4),(126,3,4),(127,1,1),(127,2,1),(127,3,1),(128,1,1),(128,2,1),(128,3,1),(129,1,1),(129,2,1),(129,3,1),(130,1,1),(130,2,1),(130,3,1),(131,1,1),(131,2,1),(131,3,1),(132,1,4),(132,2,4),(132,3,4),(133,1,4),(133,2,4),(133,3,4),(134,1,4),(134,2,4),(134,3,4),(135,1,4),(135,2,4),(135,3,4),(138,1,4),(138,2,4),(138,3,4),(139,1,4),(139,2,4),(139,3,4),(140,1,4),(140,2,4),(140,3,4),(141,1,4),(141,2,4),(141,3,4),(142,1,1),(142,2,1),(142,3,1),(143,1,4),(143,2,4),(143,3,4),(144,1,1),(144,2,1),(144,3,1),(145,1,4),(145,2,4),(145,3,4),(146,1,1),(146,2,1),(146,3,1),(147,1,4),(147,2,4),(147,3,4),(148,1,4),(148,2,4),(148,3,4),(149,1,4),(149,2,4),(149,3,4),(150,1,4),(150,2,4),(150,3,4),(151,1,4),(151,2,4),(151,3,4),(152,1,4),(152,2,4),(152,3,4),(153,1,4),(153,2,4),(153,3,4),(154,1,4),(154,2,4),(154,3,4),(155,1,4),(155,2,4),(155,3,4),(156,1,4),(156,2,4),(156,3,4),(157,1,4),(157,2,4),(157,3,4),(158,1,4),(158,2,4),(158,3,4),(159,1,4),(159,2,4),(159,3,4),(160,1,4),(160,2,4),(160,3,4),(161,1,4),(161,2,4),(161,3,4),(162,1,4),(162,2,4),(162,3,4),(163,1,4),(163,2,4),(163,3,4),(164,1,4),(164,2,4),(164,3,4),(165,1,4),(165,2,4),(165,3,4),(166,1,4),(166,2,4),(166,3,4);
/*!40000 ALTER TABLE `catalog_product_enabled_index` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity`
--
DROP TABLE IF EXISTS `catalog_product_entity`;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `type_id` varchar(32) NOT NULL default 'simple',
  `sku` varchar(64) default NULL,
  `category_ids` text,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `has_options` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='Product Entityies';
--
-- Dumping data for table `catalog_product_entity`
--
LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (16,10,38,'simple','n2610','8','2007-08-23 13:03:05','2008-08-08 14:50:04',0),(17,10,38,'simple','bb8100','8','2007-08-23 15:40:26','2008-08-08 14:50:23',0),(18,10,38,'simple','sw810i','8','2007-08-23 15:47:44','2008-08-08 14:50:56',0),(19,10,38,'simple','8525PDA','8','2007-08-23 15:55:29','2008-08-08 14:51:11',0),(20,10,38,'simple','MM-A900M','8','2007-08-23 18:06:42','2008-08-08 14:51:27',0),(25,10,39,'simple','MA464LL/A','15,28','2007-08-24 14:28:50','2008-07-28 21:27:34',1),(26,10,39,'simple','LX.FR206.001','15,28','2007-08-24 14:35:16','2008-08-05 07:14:52',1),(27,10,39,'simple','VGN-TXN27N/B','','2007-08-24 14:41:56','2008-08-06 05:12:24',0),(28,10,39,'simple','M285-E','15,28','2007-08-24 14:47:57','2008-08-08 14:51:44',0),(29,10,40,'simple','cn_3','','2007-08-24 18:53:19','2008-08-08 00:51:34',0),(30,10,40,'simple','asc_8','16','2007-08-24 19:00:49','2008-07-31 17:23:28',0),(31,10,40,'simple','steve_4','17','2007-08-24 19:05:50','2008-08-08 01:02:40',0),(32,10,40,'simple','nine_3','17','2007-08-24 19:12:54','2008-07-31 18:06:25',0),(33,10,40,'simple','ecco_3','17','2007-08-24 19:21:42','2008-08-08 01:04:49',0),(34,10,40,'simple','ken_8','16','2007-08-24 19:27:04','2008-08-08 00:58:35',0),(35,10,41,'simple','coal_sm','4','2007-08-24 19:49:30','2008-07-31 17:36:42',0),(36,10,41,'simple','ink_sm','4','2007-08-24 19:53:06','2008-08-08 00:49:48',0),(37,10,41,'simple','oc_sm','4','2007-08-24 19:59:39','2008-08-08 00:47:47',0),(38,10,41,'simple','zol_r_sm','4','2007-08-24 20:02:08','2008-08-08 00:39:57',0),(39,10,41,'simple','4fasd5f5','19','2007-08-24 20:07:02','2008-06-24 23:45:44',0),(41,10,42,'simple','384822','23','2007-08-27 10:43:59','2008-07-29 22:28:43',0),(42,10,42,'simple','bar1234','23','2007-08-27 10:50:01','2008-06-24 23:59:46',0),(44,10,44,'simple','Rebel XT','26','2007-08-28 13:06:05','2008-06-24 22:50:46',0),(45,10,44,'simple','QC-2185','26','2007-08-28 13:18:56','2008-08-08 14:52:48',0),(46,10,44,'simple','750','12,26','2007-08-28 13:23:34','2008-08-08 14:57:57',0),(47,10,44,'simple','A630','26','2007-08-28 13:27:14','2008-08-08 14:58:14',0),(48,10,44,'simple','C530','26','2007-08-28 13:32:20','2008-08-08 14:58:41',0),(49,10,40,'simple','ana_9','17','2007-08-28 15:09:50','2008-08-08 01:07:50',0),(51,10,42,'simple','1111','22','2007-08-28 16:25:46','2008-08-08 14:59:04',0),(52,10,42,'simple','1112','22','2007-08-28 16:29:24','2008-08-08 14:59:17',0),(53,10,42,'simple','1113','22','2007-08-28 16:32:24','2008-08-08 14:59:40',0),(54,10,42,'grouped','1114','22','2007-08-28 16:38:54','2008-08-08 15:00:22',0),(74,10,40,'simple','ana_3','17','2007-08-28 15:09:50','2008-08-08 13:19:48',0),(75,10,40,'simple','ana_4','17','2007-08-28 15:09:50','2008-08-08 01:07:18',0),(79,10,40,'simple','ana_5','17','2007-08-28 15:09:50','2008-08-08 01:07:11',0),(80,10,40,'simple','ana_6','17','2007-08-28 15:09:50','2008-08-08 01:07:25',0),(81,10,40,'simple','ana_7','17','2007-08-28 15:09:50','2008-08-08 01:07:32',0),(82,10,40,'simple','ana_8','17','2007-08-28 15:09:50','2008-08-08 01:07:44',0),(83,10,40,'configurable','cn','16,17','2007-08-29 10:32:52','2008-08-08 15:00:07',1),(84,10,40,'simple','cn_4','16,17','2007-08-24 18:53:19','2008-08-08 00:53:37',0),(85,10,40,'simple','cn_5','16,17','2007-08-24 18:53:19','2008-08-08 00:53:55',0),(86,10,40,'simple','cn_6','16,17','2007-08-24 18:53:19','2008-08-08 00:53:50',0),(87,10,40,'simple','cn_7','16,17','2007-08-24 18:53:19','2008-08-08 00:54:00',0),(88,10,40,'simple','cn_m8','16,17','2007-08-24 18:53:19','2008-08-08 00:54:10',0),(89,10,40,'simple','cn_m9','16,17','2007-08-24 18:53:19','2008-08-08 00:54:27',0),(90,10,40,'simple','cn_m10','16,17','2007-08-24 18:53:19','2008-08-08 00:54:36',0),(91,10,40,'simple','cn_m11','16,17','2007-08-24 18:53:19','2008-08-08 00:54:40',0),(92,10,40,'simple','cn_m12','16,17','2007-08-24 18:53:19','2008-08-08 00:54:45',0),(93,10,40,'configurable','asc','16','2007-08-29 11:46:47','2008-08-08 15:00:35',1),(94,10,40,'simple','asc_9','16','2007-08-24 19:00:49','2008-07-31 17:23:18',0),(95,10,40,'simple','asc_10','16','2007-08-24 19:00:49','2008-07-31 17:23:37',0),(96,10,40,'simple','asc_11','16','2007-08-24 19:00:49','2008-07-31 17:23:47',0),(97,10,40,'simple','asc_12','16','2007-08-24 19:00:49','2008-07-31 17:23:58',0),(98,10,40,'configurable','ken','16','2007-08-29 12:09:17','2008-08-08 14:29:46',1),(99,10,40,'simple','ken_9','16','2007-08-24 19:27:04','2008-08-08 00:57:45',0),(100,10,40,'simple','ken_10','16','2007-08-24 19:27:04','2008-08-08 00:56:05',0),(101,10,40,'simple','ken_11','16','2007-08-24 19:27:04','2008-08-08 00:57:03',0),(102,10,40,'simple','ken_12','16','2007-08-24 19:27:04','2008-08-08 00:57:40',0),(103,10,40,'configurable','steve','17','2007-08-29 12:29:46','2008-08-08 15:02:24',1),(104,10,40,'simple','steve_5','17','2007-08-24 19:05:50','2008-08-08 01:02:34',0),(105,10,40,'simple','steve_6','17','2007-08-24 19:05:50','2008-08-08 01:02:56',0),(106,10,40,'simple','steve_7','17','2007-08-24 19:05:50','2008-08-08 01:03:00',0),(107,10,40,'simple','steve_8','17','2007-08-24 19:05:50','2008-08-08 01:03:06',0),(108,10,40,'configurable','nine','17','2007-08-29 12:52:39','2008-08-08 15:02:34',1),(109,10,40,'simple','nine_4','17','2007-08-24 19:12:54','2008-07-31 18:06:49',0),(110,10,40,'simple','nine_5','17','2007-08-24 19:12:54','2008-07-31 18:06:42',0),(111,10,40,'simple','nine_6','17','2007-08-24 19:12:54','2008-07-31 18:07:09',0),(112,10,40,'configurable','ecco','17','2007-08-29 13:17:43','2008-08-08 15:02:49',1),(113,10,40,'simple','ecco_4','17','2007-08-24 19:21:42','2008-08-08 01:04:28',0),(114,10,40,'simple','ecco_5','17','2007-08-24 19:21:42','2008-08-08 01:04:37',0),(115,10,40,'simple','ecco_6','17','2007-08-24 19:21:42','2008-08-08 01:04:44',0),(117,10,41,'simple','coal_md','4','2007-08-24 19:49:30','2008-07-31 17:37:23',0),(118,10,41,'simple','coal_lrg','4','2007-08-24 19:49:30','2008-07-31 17:38:30',0),(119,10,41,'configurable','coal_1','4','2007-08-29 15:00:05','2008-08-08 13:26:35',1),(120,10,41,'configurable','ink','4','2007-08-29 15:06:16','2008-08-08 15:05:04',1),(121,10,41,'simple','ink_med','4','2007-08-24 19:53:06','2008-08-08 00:49:36',0),(122,10,41,'simple','ink_lrg','4','2007-08-24 19:53:06','2008-08-08 00:49:19',0),(123,10,41,'configurable','oc','4','2007-08-29 15:14:29','2008-06-24 22:59:14',1),(124,10,41,'simple','oc_med','4','2007-08-24 19:59:39','2008-08-08 00:47:56',0),(125,10,41,'simple','oc_lrg','4','2007-08-24 19:59:39','2008-08-08 00:48:14',0),(126,10,41,'configurable','zol','4','2007-08-29 15:31:56','2008-08-08 15:05:22',1),(127,10,41,'simple','zol_g_sm','4','2007-08-24 20:02:08','2008-08-08 00:40:33',0),(128,10,41,'simple','zol_r_med','4','2007-08-24 20:02:08','2008-08-08 00:41:39',0),(129,10,41,'simple','zol_g_med','4','2007-08-24 20:02:08','2008-08-08 00:40:59',0),(130,10,41,'simple','zol_r_lrg','4','2007-08-24 20:02:08','2008-08-08 00:40:28',0),(131,10,41,'simple','zol_g_lrg','4','2007-08-24 20:02:08','2008-08-08 00:41:10',0),(132,10,9,'simple','ac674','25','2007-08-29 19:53:55','2008-08-08 15:05:45',0),(133,10,9,'simple','ac9003','25','2007-08-29 19:56:27','2008-06-28 01:57:22',0),(134,10,9,'simple','ac-66332','25','2007-08-29 19:59:29','2008-06-28 01:57:16',0),(135,10,40,'configurable','ana','17','2007-08-30 11:22:53','2008-08-08 15:06:02',1),(137,10,41,'simple','zol_b_med','','2007-10-04 07:46:58','2008-08-08 00:41:29',0),(138,10,9,'simple','apevia-black','32','2008-07-25 00:52:03','2008-08-08 13:36:29',0),(139,10,9,'simple','nzxtlexa','32','2008-07-25 00:54:41','2008-07-25 00:54:41',0),(140,10,58,'simple','2gbdimm','15,31','2008-07-25 00:59:55','2008-07-25 02:14:23',0),(141,10,58,'simple','1gbdimm','15,31','2008-07-25 01:02:21','2008-07-25 02:13:04',0),(142,10,59,'virtual','1yr_p_l','','2008-07-25 01:02:54','2008-07-25 01:02:54',0),(143,10,58,'simple','512dimm','15,31','2008-07-25 01:05:00','2008-07-25 02:12:45',0),(144,10,59,'virtual','2yr_p_l','','2008-07-25 01:06:02','2008-07-25 01:06:02',0),(145,10,60,'simple','amdphenom','33','2008-07-25 01:07:37','2008-08-08 15:10:32',0),(146,10,59,'virtual','3yr_p_l','','2008-07-25 01:07:50','2008-07-25 01:07:50',0),(147,10,61,'simple','226bw','30','2008-07-25 01:10:17','2008-08-08 15:33:30',0),(148,10,60,'simple','amda64','33','2008-07-25 01:10:21','2008-08-08 15:11:01',0),(149,10,62,'simple','1tb7200','29','2008-07-25 01:12:44','2008-07-25 02:10:08',0),(150,10,62,'simple','500gb7200','29','2008-07-25 01:12:44','2008-07-25 02:09:26',0),(151,10,60,'simple','intelc2d','33','2008-07-25 01:13:21','2008-08-08 15:33:10',0),(152,10,61,'simple','W2452T-TF','30','2008-07-25 01:14:11','2008-08-08 15:33:00',0),(153,10,60,'simple','intelcore2extreme','33','2008-07-25 01:15:29','2008-08-08 15:32:36',0),(154,10,62,'simple','500gb5400','29','2008-07-25 01:16:03','2008-07-25 02:08:37',0),(155,10,62,'simple','250gb5400','29','2008-07-25 01:16:03','2008-07-25 02:07:40',0),(156,10,61,'simple','W1952TQ-TF','30','2008-07-25 01:16:51','2008-08-08 15:33:26',0),(157,10,61,'simple','M9179LL','30','2008-07-25 01:19:30','2008-08-08 15:32:12',0),(158,10,39,'bundle','VGN-TXN27N/BW','28','2008-07-25 01:21:23','2008-07-25 02:05:56',1),(159,10,9,'simple','microsoftnatural','34','2008-07-25 01:22:14','2008-08-08 15:31:54',0),(160,10,9,'simple','logitechcord','34','2008-07-25 01:24:15','2008-08-08 15:31:33',0),(161,10,9,'simple','logidinovo','34','2008-07-25 01:25:09','2008-08-08 15:31:22',0),(162,10,9,'simple','micronmouse5000','34','2008-07-25 01:25:11','2008-08-08 15:31:01',0),(163,10,9,'bundle','computer','15,27','2008-07-25 01:34:24','2008-07-29 01:33:10',1),(164,10,9,'bundle','computer_fixed','27','2008-07-25 01:36:33','2008-07-31 09:30:37',1),(165,10,39,'bundle','mycomputer','27','2008-07-25 01:40:27','2008-07-31 16:19:40',1),(166,10,38,'simple','HTC Touch Diamond','8','2008-07-25 02:22:13','2008-07-25 02:22:44',0);
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_datetime`
--
DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_datetime`
--
LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_datetime` VALUES (1,10,568,0,165,'2008-07-30 00:00:00');
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_decimal`
--
DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_decimal`
--
LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1,10,101,0,16,'3.2000'),(2,10,99,0,16,'149.9900'),(3,10,100,0,16,'20.0000'),(4,10,101,0,17,'15.2000'),(5,10,99,0,17,'349.9900'),(6,10,100,0,17,'29.9900'),(7,10,101,0,18,'13.6000'),(8,10,99,0,18,'399.9900'),(9,10,100,0,18,'29.9900'),(10,10,101,0,20,'1.0000'),(11,10,99,0,20,'150.0000'),(12,10,100,0,20,'29.9900'),(13,10,101,0,25,'10.6000'),(14,10,99,0,25,'2299.9900'),(15,10,100,0,25,'1299.9900'),(16,10,101,0,26,'11.4000'),(17,10,99,0,26,'1799.9900'),(18,10,100,0,26,'999.9900'),(19,10,101,0,27,'2.8000'),(20,10,99,0,27,'2699.9900'),(21,10,100,0,27,'899.9900'),(22,10,101,0,28,'10.0000'),(23,10,99,0,28,'1599.9900'),(24,10,100,0,28,'899.9900'),(25,10,101,0,29,'1.0000'),(26,10,99,0,29,'15.9900'),(27,10,100,0,29,'1.0000'),(28,10,101,0,30,'3.0000'),(29,10,99,0,30,'134.9900'),(30,10,100,0,30,'29.9900'),(31,10,101,0,31,'2.0000'),(32,10,99,0,31,'69.9900'),(33,10,100,0,31,'29.9900'),(34,10,101,0,32,'2.0000'),(35,10,99,0,32,'89.9900'),(36,10,100,0,32,'29.9900'),(37,10,101,0,33,'4.0000'),(38,10,99,0,33,'159.9900'),(39,10,100,0,33,'29.9900'),(40,10,101,0,34,'2.0000'),(41,10,99,0,34,'160.9900'),(42,10,100,0,34,'29.9900'),(43,10,101,0,35,'0.5000'),(44,10,99,0,35,'15.0000'),(45,10,100,0,35,'2.0000'),(46,10,101,0,36,'0.5000'),(47,10,99,0,36,'22.0000'),(48,10,100,0,36,'2.0000'),(49,10,101,0,37,'0.4400'),(50,10,99,0,37,'15.0000'),(51,10,100,0,37,'2.0000'),(52,10,101,0,38,'0.4400'),(53,10,99,0,38,'13.5000'),(54,10,100,0,38,'2.0000'),(55,10,101,0,19,'30.0000'),(56,10,99,0,19,'199.9900'),(57,10,100,0,19,'29.9900'),(58,10,101,0,39,'1.7500'),(59,10,99,0,39,'30.0000'),(60,10,100,0,39,'5.0000'),(61,10,101,0,41,'128.9700'),(62,10,99,0,41,'399.9900'),(63,10,100,0,41,'100.0000'),(64,10,503,0,41,'399.9900'),(65,10,101,0,42,'150.0000'),(66,10,99,0,42,'2299.0000'),(67,10,100,0,42,'800.0000'),(68,10,503,0,42,'2299.0000'),(69,10,503,0,28,'1599.9900'),(70,10,503,0,27,'2699.9900'),(71,10,503,0,26,'1799.9900'),(72,10,503,0,25,'2299.9900'),(73,10,101,0,44,'4.0000'),(74,10,99,0,44,'550.0000'),(75,10,100,0,44,'200.0000'),(76,10,503,0,44,'449.0000'),(77,10,101,0,45,'1.0000'),(78,10,99,0,45,'37.4900'),(79,10,100,0,45,'20.0000'),(80,10,100,0,46,'29.9900'),(81,10,503,0,46,'161.9400'),(82,10,101,0,47,'3.0000'),(83,10,101,0,48,'2.0000'),(84,10,99,0,48,'199.9900'),(85,10,100,0,48,'29.9900'),(86,10,100,0,49,'10.0000'),(87,10,503,0,49,'41.9500'),(88,10,101,0,51,'20.0000'),(89,10,99,0,51,'299.9900'),(90,10,100,0,51,'50.0000'),(91,10,503,0,51,'299.9900'),(92,10,101,0,52,'50.0000'),(93,10,99,0,52,'129.9900'),(94,10,100,0,52,'50.0000'),(95,10,100,0,53,'200.0000'),(96,10,503,0,53,'599.9900'),(97,10,101,0,54,'500.0000'),(98,10,99,0,54,'699.9900'),(99,10,100,0,54,'300.0000'),(100,10,503,0,54,'699.9900'),(101,10,503,0,19,'199.9900'),(102,10,503,0,17,'349.9900'),(103,10,503,0,29,'15.9900'),(104,10,503,0,35,'15.0000'),(105,10,503,0,30,'134.9900'),(106,10,503,0,36,'22.0000'),(107,10,101,0,74,'2.0000'),(108,10,99,0,74,'41.9500'),(109,10,100,0,74,'10.0000'),(110,10,503,0,74,'41.9500'),(111,10,101,0,75,'2.0000'),(112,10,99,0,75,'41.9500'),(113,10,100,0,75,'10.0000'),(114,10,503,0,75,'41.9500'),(115,10,101,0,79,'2.0000'),(116,10,99,0,79,'41.9500'),(117,10,100,0,79,'10.0000'),(118,10,503,0,79,'41.9500'),(119,10,101,0,80,'2.0000'),(120,10,99,0,80,'41.9500'),(121,10,100,0,80,'10.0000'),(122,10,100,0,81,'10.0000'),(123,10,503,0,81,'41.9500'),(124,10,101,0,82,'2.0000'),(125,10,101,0,83,'1.0000'),(126,10,99,0,83,'15.9900'),(127,10,100,0,83,'2.0000'),(128,10,100,0,84,'1.0000'),(129,10,503,0,84,'15.9900'),(130,10,101,0,85,'1.0000'),(131,10,101,0,86,'1.0000'),(132,10,99,0,86,'15.9900'),(133,10,100,0,86,'1.0000'),(134,10,100,0,87,'1.0000'),(135,10,503,0,87,'15.9900'),(136,10,101,0,88,'1.0000'),(137,10,101,0,89,'1.0000'),(138,10,99,0,89,'15.9900'),(139,10,100,0,89,'1.0000'),(140,10,100,0,90,'1.0000'),(141,10,503,0,90,'15.9900'),(142,10,101,0,91,'1.0000'),(143,10,101,0,92,'1.0000'),(144,10,99,0,92,'15.9900'),(145,10,100,0,92,'1.0000'),(146,10,100,0,93,'29.9900'),(147,10,503,0,93,'134.9900'),(148,10,101,0,94,'3.0000'),(149,10,101,0,95,'3.0000'),(150,10,99,0,95,'134.9900'),(151,10,100,0,95,'29.9900'),(152,10,100,0,96,'29.9900'),(153,10,503,0,96,'134.9900'),(154,10,101,0,97,'3.0000'),(155,10,101,0,98,'2.0000'),(156,10,99,0,98,'160.9900'),(157,10,100,0,98,'29.9900'),(158,10,99,0,99,'160.9900'),(159,10,100,0,99,'29.9900'),(160,10,503,0,99,'160.9900'),(161,10,100,0,101,'29.9900'),(162,10,503,0,101,'160.9900'),(163,10,101,0,102,'2.0000'),(164,10,101,0,103,'2.0000'),(165,10,99,0,103,'69.9900'),(166,10,100,0,103,'29.9900'),(167,10,503,0,103,'69.9900'),(168,10,503,0,31,'69.9900'),(169,10,101,0,104,'2.0000'),(170,10,99,0,104,'69.9900'),(171,10,100,0,104,'29.9900'),(172,10,503,0,104,'69.9900'),(173,10,101,0,105,'2.0000'),(174,10,99,0,105,'69.9900'),(175,10,100,0,105,'29.9900'),(176,10,503,0,105,'69.9900'),(177,10,101,0,106,'2.0000'),(178,10,99,0,106,'69.9900'),(179,10,100,0,106,'29.9900'),(180,10,503,0,106,'69.9900'),(181,10,101,0,107,'2.0000'),(182,10,99,0,107,'69.9900'),(183,10,100,0,107,'29.9900'),(184,10,503,0,107,'69.9900'),(185,10,101,0,108,'2.0000'),(186,10,99,0,108,'89.9900'),(187,10,100,0,108,'29.9900'),(188,10,503,0,108,'89.9900'),(189,10,503,0,32,'89.9900'),(190,10,101,0,109,'2.0000'),(191,10,99,0,109,'89.9900'),(192,10,100,0,109,'29.9900'),(193,10,503,0,109,'89.9900'),(194,10,101,0,110,'2.0000'),(195,10,99,0,110,'89.9900'),(196,10,100,0,110,'29.9900'),(197,10,503,0,110,'89.9900'),(198,10,101,0,111,'2.0000'),(199,10,99,0,111,'89.9900'),(200,10,100,0,112,'29.9900'),(201,10,503,0,112,'159.9900'),(202,10,101,0,113,'4.0000'),(203,10,99,0,113,'159.9900'),(204,10,100,0,114,'29.9900'),(205,10,503,0,114,'159.9900'),(206,10,101,0,115,'4.0000'),(207,10,99,0,115,'159.9900'),(208,10,100,0,115,'29.9900'),(209,10,503,0,115,'159.9900'),(210,10,503,0,33,'159.9900'),(211,10,101,0,117,'0.5000'),(212,10,99,0,117,'15.0000'),(213,10,100,0,117,'2.0000'),(214,10,503,0,117,'15.0000'),(215,10,101,0,118,'0.5000'),(216,10,99,0,118,'15.0000'),(217,10,100,0,118,'2.0000'),(218,10,503,0,118,'15.0000'),(219,10,101,0,119,'0.5000'),(220,10,99,0,120,'22.0000'),(221,10,100,0,120,'2.0000'),(222,10,503,0,120,'18.0000'),(223,10,101,0,121,'0.5000'),(224,10,99,0,121,'22.0000'),(225,10,100,0,121,'2.0000'),(226,10,503,0,121,'22.0000'),(227,10,101,0,122,'0.5000'),(228,10,99,0,122,'22.0000'),(229,10,100,0,123,'2.0000'),(230,10,503,0,123,'10.0000'),(231,10,503,0,37,'15.0000'),(232,10,101,0,124,'0.4400'),(233,10,99,0,124,'15.0000'),(234,10,100,0,124,'2.0000'),(235,10,503,0,124,'15.0000'),(236,10,101,0,125,'0.4400'),(237,10,99,0,126,'13.5000'),(238,10,100,0,126,'2.0000'),(239,10,503,0,126,'9.5000'),(240,10,503,0,38,'13.5000'),(241,10,101,0,127,'0.4400'),(242,10,99,0,127,'13.5000'),(243,10,100,0,127,'2.0000'),(244,10,503,0,128,'13.5000'),(245,10,101,0,129,'0.4400'),(246,10,99,0,129,'13.5000'),(247,10,100,0,129,'2.0000'),(248,10,503,0,129,'13.5000'),(249,10,101,0,130,'0.4400'),(250,10,99,0,130,'13.5000'),(251,10,100,0,131,'2.0000'),(252,10,503,0,131,'13.5000'),(253,10,503,0,20,'150.0000'),(254,10,99,0,132,'99.0000'),(255,10,503,0,132,'99.0000'),(256,10,99,0,134,'19.0000'),(257,10,503,0,134,'19.0000'),(258,10,101,0,135,'2.0000'),(259,10,99,0,135,'41.9500'),(260,10,100,0,135,'10.0000'),(261,10,503,0,135,'41.9500'),(262,10,101,0,137,'0.4400'),(263,10,99,0,137,'13.5000'),(264,10,100,0,137,'2.0000'),(265,10,101,0,139,'10.0000'),(266,10,99,0,139,'199.9900'),(267,10,101,0,140,'1.0000'),(268,10,99,0,140,'199.9900'),(269,10,101,0,141,'1.0000'),(270,10,99,0,141,'150.9900'),(271,10,99,0,142,'150.0000'),(272,10,101,0,143,'1.0000'),(273,10,99,0,143,'99.9900'),(274,10,99,0,144,'250.0000'),(275,10,101,0,145,'1.0000'),(276,10,101,0,148,'1.0000'),(277,10,99,0,148,'98.9900'),(278,10,101,0,149,'1.0000'),(279,10,99,0,151,'98.9900'),(280,10,101,0,152,'1.0000'),(281,10,99,0,152,'699.9900'),(282,10,101,0,155,'1.0000'),(283,10,99,0,155,'99.0000'),(284,10,101,0,156,'1.0000'),(285,10,99,0,159,'99.9900'),(286,10,101,0,160,'1.0000'),(287,10,99,0,160,'79.9900'),(288,10,101,0,161,'1.0000'),(289,10,101,0,162,'1.0000'),(290,10,99,0,162,'59.9900'),(291,10,101,0,164,'20.0000'),(292,10,99,0,164,'4999.9500'),(293,10,101,0,165,'10.0000'),(294,10,101,0,166,'0.3000'),(295,10,99,0,166,'750.0000'),(296,10,567,0,165,'75.0000'),(297,10,101,0,132,'42.0000'),(298,10,503,0,45,'37.4900'),(299,10,101,0,46,'2.0000'),(300,10,99,0,46,'161.9400'),(301,10,99,0,47,'329.9900'),(302,10,100,0,47,'29.9900'),(303,10,503,0,47,'329.9900'),(304,10,503,0,48,'199.9900'),(305,10,101,0,49,'2.0000'),(306,10,99,0,49,'41.9500'),(307,10,503,0,52,'129.9900'),(308,10,101,0,53,'200.0000'),(309,10,99,0,53,'599.9900'),(310,10,503,0,80,'41.9500'),(311,10,101,0,81,'2.0000'),(312,10,99,0,81,'41.9500'),(313,10,99,0,82,'41.9500'),(314,10,100,0,82,'10.0000'),(315,10,503,0,82,'41.9500'),(316,10,503,0,83,'13.9900'),(317,10,101,0,84,'1.0000'),(318,10,99,0,84,'15.9900'),(319,10,99,0,85,'15.9900'),(320,10,100,0,85,'1.0000'),(321,10,503,0,85,'15.9900'),(322,10,503,0,86,'15.9900'),(323,10,101,0,87,'1.0000'),(324,10,99,0,87,'15.9900'),(325,10,99,0,88,'15.9900'),(326,10,100,0,88,'1.0000'),(327,10,503,0,88,'15.9900'),(328,10,503,0,89,'15.9900'),(329,10,101,0,90,'1.0000'),(330,10,99,0,90,'15.9900'),(331,10,99,0,91,'15.9900'),(332,10,100,0,91,'1.0000'),(333,10,503,0,91,'15.9900'),(334,10,503,0,92,'15.9900'),(335,10,101,0,93,'3.0000'),(336,10,99,0,93,'134.9900'),(337,10,99,0,94,'134.9900'),(338,10,100,0,94,'29.9900'),(339,10,503,0,94,'134.9900'),(340,10,503,0,95,'134.9900'),(341,10,101,0,96,'3.0000'),(342,10,99,0,96,'134.9900'),(343,10,99,0,97,'134.9900'),(344,10,100,0,97,'29.9900'),(345,10,503,0,97,'134.9900'),(346,10,503,0,98,'160.9900'),(347,10,503,0,34,'160.9900'),(348,10,101,0,99,'2.0000'),(349,10,101,0,100,'2.0000'),(350,10,99,0,100,'160.9900'),(351,10,100,0,100,'29.9900'),(352,10,503,0,100,'160.9900'),(353,10,101,0,101,'2.0000'),(354,10,99,0,101,'160.9900'),(355,10,99,0,102,'160.9900'),(356,10,100,0,102,'29.9900'),(357,10,503,0,102,'160.9900'),(358,10,100,0,111,'29.9900'),(359,10,503,0,111,'89.9900'),(360,10,101,0,112,'4.0000'),(361,10,99,0,112,'159.9900'),(362,10,100,0,113,'29.9900'),(363,10,503,0,113,'159.9900'),(364,10,101,0,114,'4.0000'),(365,10,99,0,114,'159.9900'),(366,10,99,0,119,'15.0000'),(367,10,100,0,119,'2.0000'),(368,10,503,0,119,'10.0000'),(369,10,101,0,120,'0.5000'),(370,10,100,0,122,'2.0000'),(371,10,503,0,122,'22.0000'),(372,10,101,0,123,'0.4400'),(373,10,99,0,123,'100.0000'),(374,10,99,0,125,'15.0000'),(375,10,100,0,125,'2.0000'),(376,10,503,0,125,'15.0000'),(377,10,101,0,126,'0.4400'),(378,10,503,0,127,'13.5000'),(379,10,101,0,128,'0.4400'),(380,10,99,0,128,'13.5000'),(381,10,100,0,128,'2.0000'),(382,10,100,0,130,'2.0000'),(383,10,503,0,130,'13.5000'),(384,10,101,0,131,'0.4400'),(385,10,99,0,131,'13.5000'),(386,10,503,0,16,'149.9900'),(387,10,503,0,18,'399.9900'),(388,10,99,0,133,'34.0000'),(389,10,503,0,133,'34.0000'),(390,10,503,0,137,'13.5000'),(391,10,101,0,134,'5.0000'),(392,10,101,0,138,'10.0000'),(393,10,99,0,138,'150.0000'),(394,10,99,0,145,'335.9900'),(395,10,99,0,146,'325.0000'),(396,10,101,0,147,'1.0000'),(397,10,99,0,147,'399.9900'),(398,10,99,0,149,'399.0000'),(399,10,101,0,150,'1.0000'),(400,10,99,0,150,'299.0000'),(401,10,101,0,151,'1.0000'),(402,10,101,0,153,'1.0000'),(403,10,99,0,153,'2049.9900'),(404,10,101,0,154,'1.0000'),(405,10,99,0,154,'299.0000'),(406,10,99,0,156,'399.9900'),(407,10,101,0,157,'1.0000'),(408,10,99,0,157,'699.9900'),(409,10,101,0,159,'1.0000'),(410,10,99,0,161,'239.9900');
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_gallery`
--
DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `IDX_BASE` USING BTREE (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_gallery`
--
LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_int`
--
DROP TABLE IF EXISTS `catalog_product_entity_int`;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_int`
--
LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (1,10,273,0,16,1),(2,10,274,0,16,2),(3,10,272,0,16,24),(4,10,272,0,17,23),(5,10,273,0,17,1),(6,10,274,0,17,2),(7,10,272,0,18,24),(8,10,273,0,18,1),(9,10,274,0,18,2),(10,10,272,0,20,23),(11,10,273,0,20,1),(12,10,274,0,20,2),(13,10,272,0,25,23),(14,10,273,0,25,1),(15,10,274,0,25,2),(16,10,272,0,26,24),(17,10,273,0,26,1),(18,10,274,0,26,2),(19,10,272,0,27,24),(20,10,273,0,27,1),(21,10,274,0,27,2),(22,10,272,0,28,24),(23,10,273,0,28,1),(24,10,274,0,28,2),(25,10,501,0,29,35),(26,10,272,0,29,25),(27,10,502,0,29,46),(28,10,273,0,29,1),(29,10,274,0,29,2),(30,10,501,0,30,36),(31,10,272,0,30,61),(32,10,502,0,30,41),(33,10,107,0,30,49),(34,10,273,0,30,1),(35,10,274,0,30,2),(36,10,501,0,31,35),(37,10,272,0,31,26),(38,10,502,0,31,45),(39,10,107,0,31,51),(40,10,273,0,31,1),(41,10,274,0,31,2),(42,10,501,0,32,35),(43,10,272,0,32,26),(44,10,502,0,32,46),(45,10,107,0,32,51),(46,10,273,0,32,1),(47,10,274,0,32,2),(48,10,501,0,33,35),(49,10,502,0,33,46),(50,10,107,0,33,47),(51,10,273,0,33,1),(52,10,274,0,33,2),(53,10,501,0,34,36),(54,10,272,0,34,24),(55,10,502,0,34,41),(56,10,107,0,34,52),(57,10,273,0,34,1),(58,10,274,0,34,2),(59,10,272,0,35,22),(60,10,273,0,35,1),(61,10,274,0,35,2),(62,10,272,0,36,60),(63,10,273,0,36,1),(64,10,274,0,36,2),(65,10,272,0,37,60),(66,10,273,0,37,1),(67,10,274,0,37,2),(68,10,272,0,38,26),(69,10,273,0,38,1),(70,10,274,0,38,2),(71,10,272,0,19,23),(72,10,273,0,19,1),(73,10,274,0,19,2),(74,10,272,0,39,22),(75,10,273,0,39,1),(76,10,274,0,39,2),(77,10,272,0,41,59),(78,10,508,0,41,71),(79,10,273,0,41,1),(80,10,274,0,41,2),(81,10,272,0,42,59),(82,10,508,0,42,71),(83,10,273,0,42,1),(84,10,274,0,42,2),(85,10,272,0,44,24),(86,10,513,0,44,90),(87,10,273,0,44,1),(88,10,274,0,44,2),(89,10,272,0,45,23),(90,10,513,0,45,93),(91,10,273,0,45,1),(92,10,274,0,45,2),(93,10,272,0,46,23),(94,10,513,0,46,91),(95,10,273,0,46,1),(96,10,274,0,46,2),(97,10,272,0,47,23),(98,10,513,0,47,90),(99,10,273,0,47,1),(100,10,274,0,47,2),(101,10,272,0,48,23),(102,10,513,0,48,93),(103,10,273,0,48,1),(104,10,274,0,48,2),(105,10,501,0,49,35),(106,10,272,0,49,59),(107,10,502,0,49,40),(108,10,273,0,49,1),(109,10,274,0,49,2),(110,10,107,0,49,97),(111,10,272,0,51,26),(112,10,508,0,51,72),(113,10,273,0,51,1),(114,10,274,0,51,2),(115,10,272,0,52,26),(116,10,508,0,52,72),(117,10,273,0,52,1),(118,10,274,0,52,2),(119,10,272,0,53,26),(120,10,508,0,53,72),(121,10,273,0,53,1),(122,10,274,0,53,2),(123,10,272,0,54,26),(124,10,508,0,54,72),(125,10,273,0,54,1),(126,10,274,0,54,2),(127,10,526,0,16,4),(128,10,526,0,17,4),(129,10,526,0,18,4),(130,10,526,0,20,4),(131,10,526,0,25,4),(132,10,526,0,26,4),(133,10,526,0,27,4),(134,10,526,0,28,4),(135,10,526,0,29,1),(136,10,526,0,30,1),(137,10,526,0,31,1),(138,10,526,0,32,1),(139,10,526,0,33,1),(140,10,526,0,34,1),(141,10,526,0,35,1),(142,10,526,0,36,1),(143,10,526,0,37,1),(144,10,526,0,38,1),(145,10,526,0,41,4),(146,10,526,0,44,4),(147,10,526,0,45,4),(148,10,526,0,46,4),(149,10,526,0,47,4),(150,10,526,0,49,1),(151,10,526,0,53,4),(152,10,526,0,54,4),(153,10,510,0,28,74),(154,10,510,0,27,76),(155,10,510,0,25,77),(156,10,272,0,74,59),(157,10,502,0,74,46),(158,10,273,0,74,1),(159,10,274,0,74,2),(160,10,107,0,74,97),(161,10,526,0,74,1),(162,10,501,0,75,35),(163,10,272,0,75,59),(164,10,502,0,75,45),(165,10,273,0,75,1),(166,10,274,0,75,2),(167,10,107,0,75,97),(168,10,501,0,79,35),(169,10,273,0,79,1),(170,10,274,0,79,2),(171,10,107,0,79,97),(172,10,526,0,79,1),(173,10,501,0,80,35),(174,10,272,0,80,59),(175,10,502,0,80,43),(176,10,273,0,80,1),(177,10,274,0,80,2),(178,10,107,0,80,97),(179,10,526,0,80,1),(180,10,501,0,81,35),(181,10,272,0,81,59),(182,10,502,0,81,42),(183,10,273,0,81,1),(184,10,274,0,81,2),(185,10,107,0,81,97),(186,10,526,0,81,1),(187,10,501,0,82,35),(188,10,272,0,82,59),(189,10,502,0,82,41),(190,10,273,0,82,1),(191,10,274,0,82,2),(192,10,107,0,82,97),(193,10,526,0,82,1),(194,10,273,0,83,1),(195,10,274,0,83,2),(196,10,526,0,83,4),(197,10,107,0,83,97),(198,10,272,0,83,25),(199,10,501,0,84,35),(200,10,272,0,84,25),(201,10,502,0,84,45),(202,10,273,0,84,1),(203,10,274,0,84,2),(204,10,526,0,84,1),(205,10,107,0,84,97),(206,10,272,0,85,25),(207,10,274,0,85,2),(208,10,526,0,85,1),(209,10,107,0,85,97),(210,10,501,0,86,35),(211,10,502,0,86,43),(212,10,526,0,86,1),(213,10,107,0,86,97),(214,10,501,0,87,35),(215,10,272,0,87,25),(216,10,273,0,87,1),(217,10,107,0,87,97),(218,10,501,0,88,36),(219,10,272,0,88,25),(220,10,502,0,88,41),(221,10,274,0,88,2),(222,10,501,0,89,36),(223,10,272,0,89,25),(224,10,502,0,89,40),(225,10,273,0,89,1),(226,10,274,0,89,2),(227,10,526,0,89,1),(228,10,502,0,90,39),(229,10,526,0,90,1),(230,10,107,0,90,97),(231,10,501,0,91,36),(232,10,272,0,91,25),(233,10,502,0,91,38),(234,10,273,0,91,1),(235,10,274,0,91,2),(236,10,502,0,92,37),(237,10,526,0,92,1),(238,10,107,0,92,97),(239,10,273,0,93,1),(240,10,274,0,93,2),(241,10,526,0,93,4),(242,10,107,0,93,53),(243,10,272,0,93,61),(244,10,107,0,94,49),(245,10,526,0,94,1),(246,10,501,0,95,36),(247,10,272,0,95,61),(248,10,502,0,95,39),(249,10,107,0,95,49),(250,10,273,0,95,1),(251,10,274,0,95,2),(252,10,107,0,96,49),(253,10,526,0,96,1),(254,10,501,0,97,36),(255,10,272,0,97,61),(256,10,502,0,97,37),(257,10,107,0,97,49),(258,10,273,0,97,1),(259,10,274,0,98,2),(260,10,272,0,98,24),(261,10,501,0,98,36),(262,10,501,0,99,36),(263,10,272,0,99,24),(264,10,502,0,99,40),(265,10,107,0,99,52),(266,10,273,0,99,1),(267,10,502,0,100,39),(268,10,274,0,100,2),(269,10,526,0,100,1),(270,10,501,0,101,36),(271,10,272,0,101,24),(272,10,502,0,101,38),(273,10,107,0,101,52),(274,10,274,0,101,2),(275,10,526,0,101,1),(276,10,502,0,102,37),(277,10,107,0,102,52),(278,10,273,0,102,1),(279,10,274,0,102,2),(280,10,526,0,102,1),(281,10,274,0,103,2),(282,10,526,0,103,4),(283,10,501,0,103,35),(284,10,501,0,104,35),(285,10,272,0,104,26),(286,10,502,0,104,44),(287,10,107,0,104,51),(288,10,274,0,104,2),(289,10,526,0,104,1),(290,10,502,0,105,43),(291,10,107,0,105,51),(292,10,273,0,105,1),(293,10,274,0,105,2),(294,10,526,0,105,1),(295,10,272,0,106,26),(296,10,502,0,106,42),(297,10,526,0,106,1),(298,10,502,0,107,41),(299,10,107,0,107,51),(300,10,273,0,107,1),(301,10,274,0,107,2),(302,10,526,0,107,1),(303,10,274,0,108,2),(304,10,526,0,108,4),(305,10,501,0,108,35),(306,10,501,0,109,35),(307,10,272,0,109,26),(308,10,502,0,109,45),(309,10,107,0,109,51),(310,10,273,0,109,1),(311,10,274,0,109,2),(312,10,526,0,109,1),(313,10,501,0,110,35),(314,10,272,0,110,26),(315,10,502,0,110,44),(316,10,107,0,110,51),(317,10,273,0,110,1),(318,10,274,0,110,2),(319,10,526,0,110,1),(320,10,501,0,111,35),(321,10,107,0,111,51),(322,10,526,0,111,1),(323,10,273,0,112,1),(324,10,274,0,112,2),(325,10,526,0,112,4),(326,10,107,0,112,47),(327,10,272,0,33,59),(328,10,107,0,113,47),(329,10,273,0,113,1),(330,10,274,0,113,2),(331,10,526,0,113,1),(332,10,272,0,113,59),(333,10,501,0,114,35),(334,10,502,0,114,44),(335,10,107,0,114,47),(336,10,273,0,114,1),(337,10,274,0,114,2),(338,10,526,0,114,1),(339,10,272,0,114,59),(340,10,501,0,115,35),(341,10,502,0,115,43),(342,10,107,0,115,47),(343,10,273,0,115,1),(344,10,274,0,115,2),(345,10,526,0,115,1),(346,10,272,0,115,59),(347,10,525,0,35,100),(348,10,272,0,117,22),(349,10,273,0,117,1),(350,10,274,0,117,2),(351,10,526,0,117,1),(352,10,525,0,117,99),(353,10,272,0,118,22),(354,10,273,0,118,1),(355,10,274,0,118,2),(356,10,526,0,118,1),(357,10,525,0,118,98),(358,10,273,0,119,1),(359,10,274,0,119,2),(360,10,526,0,119,4),(361,10,501,0,119,36),(362,10,272,0,119,22),(363,10,501,0,36,35),(364,10,525,0,36,100),(365,10,273,0,120,1),(366,10,274,0,120,2),(367,10,526,0,120,4),(368,10,501,0,120,35),(369,10,272,0,120,60),(370,10,272,0,121,60),(371,10,273,0,121,1),(372,10,274,0,121,2),(373,10,525,0,121,99),(374,10,274,0,122,2),(375,10,526,0,122,1),(376,10,501,0,122,35),(377,10,525,0,122,98),(378,10,273,0,123,1),(379,10,274,0,123,2),(380,10,526,0,123,4),(381,10,501,0,123,36),(382,10,272,0,123,60),(383,10,501,0,37,36),(384,10,273,0,124,1),(385,10,501,0,124,36),(386,10,525,0,124,99),(387,10,272,0,125,60),(388,10,273,0,125,1),(389,10,274,0,125,2),(390,10,526,0,125,1),(391,10,501,0,125,36),(392,10,525,0,125,98),(393,10,273,0,126,1),(394,10,274,0,126,2),(395,10,501,0,38,36),(396,10,273,0,127,1),(397,10,274,0,127,2),(398,10,526,0,127,1),(399,10,501,0,127,36),(400,10,525,0,127,100),(401,10,272,0,128,26),(402,10,273,0,128,1),(403,10,274,0,128,2),(404,10,526,0,128,1),(405,10,501,0,128,36),(406,10,273,0,129,1),(407,10,501,0,129,36),(408,10,525,0,129,99),(409,10,272,0,130,26),(410,10,273,0,130,1),(411,10,274,0,130,2),(412,10,525,0,130,98),(413,10,274,0,131,2),(414,10,526,0,131,1),(415,10,501,0,131,36),(416,10,525,0,131,98),(417,10,501,0,117,36),(418,10,501,0,118,36),(419,10,273,0,133,1),(420,10,274,0,133,2),(421,10,526,0,133,4),(422,10,273,0,132,1),(423,10,274,0,132,2),(424,10,526,0,134,4),(425,10,526,0,135,4),(426,10,272,0,135,59),(427,10,501,0,135,35),(428,10,272,0,137,24),(429,10,273,0,137,2),(430,10,274,0,137,2),(431,10,526,0,137,1),(432,10,501,0,137,36),(433,10,525,0,137,99),(434,10,501,0,39,36),(435,10,525,0,39,99),(436,10,526,0,138,4),(437,10,274,0,139,1),(438,10,526,0,139,4),(439,10,272,0,139,23),(440,10,273,0,140,1),(441,10,274,0,140,1),(442,10,273,0,141,1),(443,10,102,0,141,111),(444,10,273,0,142,1),(445,10,274,0,142,0),(446,10,526,0,142,1),(447,10,273,0,143,1),(448,10,102,0,143,111),(449,10,526,0,144,1),(450,10,273,0,145,1),(451,10,274,0,145,1),(452,10,526,0,145,4),(453,10,526,0,146,1),(454,10,273,0,147,1),(455,10,274,0,147,0),(456,10,526,0,147,4),(457,10,102,0,147,3),(458,10,875,0,147,110),(459,10,273,0,148,1),(460,10,274,0,148,1),(461,10,526,0,148,4),(462,10,102,0,148,117),(463,10,877,0,148,115),(464,10,273,0,149,1),(465,10,274,0,149,1),(466,10,526,0,149,4),(467,10,102,0,149,118),(468,10,273,0,150,1),(469,10,274,0,150,1),(470,10,526,0,150,4),(471,10,102,0,150,118),(472,10,273,0,151,1),(473,10,274,0,151,1),(474,10,526,0,151,4),(475,10,102,0,151,116),(476,10,877,0,151,112),(477,10,273,0,152,1),(478,10,274,0,152,1),(479,10,526,0,152,4),(480,10,102,0,152,1),(481,10,875,0,152,106),(482,10,273,0,153,1),(483,10,274,0,153,1),(484,10,526,0,153,4),(485,10,102,0,153,116),(486,10,877,0,153,114),(487,10,273,0,154,1),(488,10,274,0,154,1),(489,10,526,0,154,4),(490,10,102,0,154,119),(491,10,273,0,155,1),(492,10,274,0,155,1),(493,10,526,0,155,4),(494,10,102,0,155,119),(495,10,273,0,156,1),(496,10,274,0,156,0),(497,10,526,0,156,4),(498,10,102,0,156,1),(499,10,875,0,156,106),(500,10,273,0,157,1),(501,10,274,0,157,0),(502,10,526,0,157,4),(503,10,102,0,157,29),(504,10,875,0,157,107),(505,10,860,0,158,1),(506,10,861,0,158,0),(507,10,273,0,158,1),(508,10,274,0,158,2),(509,10,526,0,158,4),(510,10,859,0,158,0),(511,10,862,0,158,1),(512,10,863,0,158,0),(513,10,273,0,159,1),(514,10,274,0,159,0),(515,10,526,0,159,4),(516,10,102,0,159,120),(517,10,273,0,160,1),(518,10,274,0,160,1),(519,10,526,0,160,4),(520,10,102,0,160,121),(521,10,272,0,160,59),(522,10,273,0,161,1),(523,10,274,0,161,0),(524,10,526,0,161,4),(525,10,102,0,161,121),(526,10,273,0,162,1),(527,10,274,0,162,1),(528,10,526,0,162,4),(529,10,102,0,162,120),(530,10,272,0,162,24),(531,10,860,0,163,0),(532,10,861,0,163,0),(533,10,273,0,163,1),(534,10,274,0,163,1),(535,10,526,0,163,4),(536,10,859,0,163,0),(537,10,862,0,163,0),(538,10,863,0,163,0),(539,10,860,0,164,1),(540,10,861,0,164,1),(541,10,273,0,164,1),(542,10,274,0,164,1),(543,10,526,0,164,4),(544,10,859,0,164,1),(545,10,862,0,164,0),(546,10,863,0,164,1),(547,10,860,0,165,1),(548,10,861,0,165,1),(549,10,273,0,165,1),(550,10,274,0,165,1),(551,10,526,0,165,4),(552,10,859,0,165,0),(553,10,862,0,165,0),(554,10,863,0,165,0),(555,10,273,0,166,1),(556,10,274,0,166,2),(557,10,526,0,166,4),(558,10,272,0,166,24),(559,10,102,0,166,122),(560,10,501,0,35,36),(561,10,526,0,19,4),(562,10,526,0,39,4),(563,10,526,0,42,4),(564,10,526,0,48,4),(565,10,526,0,51,4),(566,10,526,0,52,4),(567,10,510,0,26,79),(568,10,107,0,29,97),(569,10,501,0,74,35),(570,10,526,0,75,1),(571,10,272,0,79,59),(572,10,502,0,79,44),(573,10,501,0,85,35),(574,10,502,0,85,44),(575,10,273,0,85,1),(576,10,272,0,86,25),(577,10,273,0,86,1),(578,10,274,0,86,2),(579,10,502,0,87,42),(580,10,274,0,87,2),(581,10,526,0,87,1),(582,10,273,0,88,1),(583,10,526,0,88,1),(584,10,107,0,88,97),(585,10,107,0,89,97),(586,10,501,0,90,36),(587,10,272,0,90,25),(588,10,273,0,90,1),(589,10,274,0,90,2),(590,10,526,0,91,1),(591,10,107,0,91,97),(592,10,501,0,92,36),(593,10,272,0,92,25),(594,10,273,0,92,1),(595,10,274,0,92,2),(596,10,501,0,93,36),(597,10,501,0,94,36),(598,10,272,0,94,61),(599,10,502,0,94,40),(600,10,273,0,94,1),(601,10,274,0,94,2),(602,10,526,0,95,1),(603,10,501,0,96,36),(604,10,272,0,96,61),(605,10,502,0,96,38),(606,10,273,0,96,1),(607,10,274,0,96,2),(608,10,274,0,97,2),(609,10,526,0,97,1),(610,10,273,0,98,1),(611,10,526,0,98,4),(612,10,107,0,98,52),(613,10,274,0,99,2),(614,10,526,0,99,1),(615,10,501,0,100,36),(616,10,272,0,100,24),(617,10,107,0,100,52),(618,10,273,0,100,1),(619,10,273,0,101,1),(620,10,501,0,102,36),(621,10,272,0,102,24),(622,10,273,0,103,1),(623,10,107,0,103,52),(624,10,272,0,103,26),(625,10,273,0,104,1),(626,10,501,0,105,35),(627,10,272,0,105,26),(628,10,501,0,106,35),(629,10,107,0,106,51),(630,10,273,0,106,1),(631,10,274,0,106,2),(632,10,501,0,107,35),(633,10,272,0,107,26),(634,10,273,0,108,1),(635,10,107,0,108,51),(636,10,272,0,108,26),(637,10,272,0,111,26),(638,10,502,0,111,43),(639,10,273,0,111,1),(640,10,274,0,111,2),(641,10,272,0,112,59),(642,10,501,0,112,35),(643,10,501,0,113,35),(644,10,502,0,113,45),(645,10,526,0,121,1),(646,10,501,0,121,35),(647,10,272,0,122,60),(648,10,273,0,122,1),(649,10,525,0,37,100),(650,10,272,0,124,60),(651,10,274,0,124,2),(652,10,526,0,124,1),(653,10,526,0,126,4),(654,10,501,0,126,36),(655,10,525,0,38,100),(656,10,272,0,127,22),(657,10,525,0,128,99),(658,10,272,0,129,22),(659,10,274,0,129,2),(660,10,526,0,129,1),(661,10,526,0,130,1),(662,10,501,0,130,36),(663,10,272,0,131,22),(664,10,273,0,131,1),(665,10,526,0,132,4),(666,10,273,0,134,1),(667,10,274,0,134,2),(668,10,273,0,135,1),(669,10,274,0,135,2),(670,10,107,0,135,97),(671,10,273,0,138,1),(672,10,274,0,138,1),(673,10,272,0,138,24),(674,10,273,0,139,1),(675,10,526,0,140,4),(676,10,102,0,140,111),(677,10,274,0,141,1),(678,10,526,0,141,4),(679,10,274,0,143,1),(680,10,526,0,143,4),(681,10,273,0,144,1),(682,10,274,0,144,0),(683,10,102,0,145,117),(684,10,877,0,145,113),(685,10,273,0,146,1),(686,10,274,0,146,0);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_media_gallery`
--
DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery';
--
-- Dumping data for table `catalog_product_entity_media_gallery`
--
LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery` VALUES (1,703,17,'/b/l/blackberry-8100-pearl.jpg'),(2,703,17,'/b/l/blackberry-8100-pearl-1.jpg'),(3,703,18,'/s/o/sony-ericsson-w810i.jpg'),(4,703,18,'/s/o/sony-ericsson-w810i-1.jpg'),(5,703,29,'/c/n/cn-clogs-beach-garden-clog.jpg'),(6,703,29,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(7,703,30,'/a/s/asics-men-s-gel-kayano-xii.jpg'),(8,703,30,'/a/s/asics-men-s-gel-kayano-xii-1.jpg'),(9,703,31,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(10,703,31,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(11,703,32,'/n/i/nine-west-women-s-lucero-pump.jpg'),(12,703,32,'/n/i/nine-west-women-s-lucero-pump-1.jpg'),(13,703,33,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(14,703,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(15,703,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(16,703,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(17,703,35,'/c/o/coalesce-functioning-on-impatience-t-shirt.jpg'),(18,703,36,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(19,703,37,'/t/h/the-only-children-paisley-t-shirt.jpg'),(20,703,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(21,703,19,'/a/t/at-t-8525-pda.jpg'),(22,703,39,'/t/h/the-get-up-kids-band-camp-pullover-hoodie.jpg'),(24,703,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera.jpg'),(25,703,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-1.jpg'),(26,703,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera.jpg'),(27,703,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera-1.jpg'),(28,703,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom.jpg'),(29,703,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-1.jpg'),(30,703,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera.jpg'),(31,703,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera-1.jpg'),(32,703,44,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera.jpg'),(33,703,49,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(34,703,49,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(35,703,74,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(36,703,74,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(37,703,75,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(38,703,75,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(47,703,83,'/c/n/cn-clogs-beach-garden-clog.jpg'),(84,703,103,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(102,703,112,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(112,703,119,'/c/o/coalesce-functioning-on-impatience-t-shirt.jpg'),(113,703,120,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(116,703,123,'/t/h/the-only-children-paisley-t-shirt.jpg'),(119,703,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(126,703,16,'/n/o/nokia-2610-phone.jpg'),(127,703,16,'/n/o/nokia-2610-phone-1.jpg'),(130,703,44,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(131,703,134,'/u/n/universal-camera-charger.jpg'),(133,703,119,'/c/o/coalesce-functioning-on-impatience-t-shirt-1.jpg'),(136,703,27,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(137,703,39,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(139,703,41,'/a/k/akio-dresser.jpg'),(140,703,42,'/b/a/barcelona-bamboo-platform-bed.jpg'),(141,703,138,'/a/p/apevia-black-x-cruiser-case-atx-mid-tower-case-default.jpg'),(142,703,139,'/n/z/nzxt-lexa-silver-aluminum-atx-mid-tower-case-default.jpg'),(143,703,145,'/a/m/amd-phenom-x4-9850-black-ed-2-50ghz-retail.jpg'),(144,703,148,'/a/m/amd-a64-x2-3800-2-0ghz-oem.jpg'),(145,703,147,'/2/2/22-syncmaster-lcd-monitor.jpg'),(146,703,151,'/i/n/intel-c2d-e8400-3-0ghz-retail.jpg'),(147,703,152,'/2/4/24-widescreen-flat-panel-lcd-monitor.jpg'),(148,703,153,'/i/n/intel-core-2-extreme-qx9775-3-20ghz-retail.jpg'),(149,703,156,'/1/9/19-widescreen-flat-panel-lcd-monitor.jpg'),(150,703,157,'/3/0/30-flat-panel-tft-lcd-cinema-hd-monitor.jpg'),(151,703,159,'/m/i/microsoft-natural-ergonomic-keyboard-4000.jpg'),(152,703,161,'/l/o/logitech-dinovo-edge-keyboard.jpg'),(153,703,162,'/m/i/microsoft-wireless-optical-mouse-5000.jpg'),(154,703,160,'/l/o/logitech-cordless-optical-trackman.jpg'),(155,703,163,'/c/o/computer.jpg'),(156,703,164,'/g/a/gaming-computer.jpg'),(157,703,165,'/m/y/my-computer.jpg'),(158,703,158,'/s/o/sony-vaio-11-1-notebook-pc.jpg'),(159,703,155,'/s/e/seagate-250gb-hd-5400rpm.jpg'),(160,703,154,'/s/e/seagate-500gb-hd-5400rpm.jpg'),(161,703,150,'/w/e/western-digital-500gb-hd-7200rpm.jpg'),(162,703,149,'/w/e/western-digital-1tb-hd-7200rpm.jpg'),(163,703,143,'/c/r/crucial-512mb-pc4200-ddr2-533mhz-memory.jpg'),(164,703,141,'/c/r/crucial-1gb-pc4200-ddr2-533mhz-memory.jpg'),(165,703,140,'/c/r/crucial-2gb-pc4200-ddr2-533mhz-memory.jpg'),(166,703,166,'/h/t/htc-touch-diamond.jpg'),(167,703,26,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(168,703,25,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(171,703,93,'/a/s/asics-men-s-gel-kayano-xii.jpg'),(172,703,93,'/a/s/asics-men-s-gel-kayano-xii-1.jpg'),(173,703,93,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(174,703,108,'/n/i/nine-west-women-s-lucero-pump.jpg'),(175,703,108,'/n/i/nine-west-women-s-lucero-pump-1.jpg'),(176,703,108,'/n/i/nine-west-women-s-lucero-pump-2.jpg'),(177,703,135,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(178,703,135,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(179,703,135,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(180,703,83,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(181,703,83,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(182,703,112,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(183,703,112,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(184,703,120,'/i/n/ink-eater-krylon-bombear-destroyed-tee-1.jpg'),(185,703,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(186,703,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(187,703,103,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(188,703,103,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(189,703,16,'/n/o/nokia-2610-phone-2.jpg'),(190,703,17,'/b/l/blackberry-8100-pearl-2.jpg'),(191,703,18,'/s/o/sony-ericsson-w810i-2.jpg'),(192,703,20,'/s/a/samsung-mm-a900m-ace.jpg'),(193,703,28,'/t/o/toshiba-m285-e-14.jpg'),(194,703,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(195,703,37,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(196,703,19,'/a/t/at-t-8525-pda-1.jpg'),(197,703,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(198,703,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(199,703,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(200,703,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(201,703,51,'/o/t/ottoman.jpg'),(202,703,52,'/c/h/chair.jpg'),(203,703,53,'/c/o/couch.jpg'),(204,703,54,'/m/a/magento-red-furniture-set.jpg'),(205,703,133,'/u/n/universal-camera-case.jpg'),(206,703,132,'/s/l/slr-camera-tripod.jpg'),(212,703,29,'/c/n/cn-clogs-beach-garden-clog-3.jpg'),(213,703,31,'/s/t/steven-by-steve-madden-pryme-pump-3.jpg'),(214,703,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-3.jpg'),(215,703,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-3.jpg'),(216,703,37,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(222,703,49,'/a/n/anashria-womens-premier-leather-sandal-3.jpg'),(227,703,75,'/a/n/anashria-womens-premier-leather-sandal-3.jpg'),(228,703,124,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(229,703,125,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(230,703,133,'/u/n/universal-camera-case-1.jpg'),(237,703,29,'/c/n/cn-clogs-beach-garden-clog-4.jpg'),(238,703,31,'/s/t/steven-by-steve-madden-pryme-pump-4.jpg'),(239,703,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-4.jpg'),(240,703,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-4.jpg'),(241,703,37,'/t/h/the-only-children-paisley-t-shirt-3.jpg'),(242,703,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-3.jpg'),(248,703,49,'/a/n/anashria-womens-premier-leather-sandal-4.jpg'),(253,703,75,'/a/n/anashria-womens-premier-leather-sandal-4.jpg'),(255,703,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(256,703,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(257,703,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(258,703,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(259,703,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee-2.jpg'),(260,703,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee-2.jpg'),(261,703,124,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(262,703,125,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(263,703,133,'/u/n/universal-camera-case-2.jpg'),(265,703,29,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(266,703,31,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(267,703,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(268,703,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(269,703,49,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(270,703,75,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(271,703,79,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(272,703,80,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(273,703,81,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(274,703,82,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(275,703,84,'/c/n/cn-clogs-beach-garden-clog.jpg'),(276,703,85,'/c/n/cn-clogs-beach-garden-clog.jpg'),(277,703,86,'/c/n/cn-clogs-beach-garden-clog.jpg'),(278,703,87,'/c/n/cn-clogs-beach-garden-clog.jpg'),(279,703,88,'/c/n/cn-clogs-beach-garden-clog.jpg'),(280,703,89,'/c/n/cn-clogs-beach-garden-clog.jpg'),(281,703,90,'/c/n/cn-clogs-beach-garden-clog.jpg'),(282,703,91,'/c/n/cn-clogs-beach-garden-clog.jpg'),(283,703,92,'/c/n/cn-clogs-beach-garden-clog.jpg'),(284,703,98,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(285,703,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(286,703,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(287,703,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(288,703,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(289,703,104,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(290,703,105,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(291,703,106,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(292,703,107,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(293,703,113,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(294,703,114,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(295,703,115,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(296,703,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(297,703,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(298,703,124,'/t/h/the-only-children-paisley-t-shirt.jpg'),(299,703,125,'/t/h/the-only-children-paisley-t-shirt.jpg'),(300,703,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(301,703,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(302,703,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(303,703,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(304,703,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(305,703,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(306,703,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(307,703,79,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(308,703,80,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(309,703,81,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(310,703,82,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(311,703,84,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(312,703,85,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(313,703,86,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(314,703,87,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(315,703,88,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(316,703,89,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(317,703,90,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(318,703,91,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(319,703,92,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(321,703,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(322,703,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(323,703,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(324,703,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(325,703,104,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(326,703,105,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(327,703,106,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(328,703,107,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(329,703,113,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(330,703,114,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(331,703,115,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(332,703,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee-1.jpg'),(333,703,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee-1.jpg'),(334,703,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(335,703,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(336,703,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(337,703,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(338,703,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(339,703,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(340,703,79,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(341,703,80,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(342,703,81,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(343,703,82,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(344,703,84,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(345,703,85,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(346,703,86,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(347,703,87,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(348,703,88,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(349,703,89,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(350,703,90,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(351,703,91,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(352,703,92,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(353,703,104,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(354,703,105,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(355,703,106,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(356,703,107,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(357,703,113,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(358,703,114,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(359,703,115,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(360,703,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(361,703,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(362,703,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(363,703,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(364,703,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(365,703,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg');
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--
DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `label` varchar(255) default NULL,
  `position` int(11) unsigned default NULL,
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';
--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--
LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES (1,0,'',2,0),(2,0,'',1,0),(3,0,'',0,0),(4,0,'',0,0),(5,0,'',0,1),(6,0,'',0,1),(7,0,'',0,0),(8,0,'',0,0),(9,0,'',0,1),(10,0,'',0,1),(11,0,'',0,0),(12,0,'',0,0),(13,0,'',0,1),(14,0,'',0,1),(15,0,'',0,1),(16,0,'',0,1),(17,0,'',0,0),(18,0,'',0,0),(19,0,'',0,0),(20,0,'',0,0),(21,0,'',0,0),(22,0,'',0,0),(24,0,'',1,0),(25,0,'',2,0),(26,0,'',0,0),(27,0,'',0,0),(28,0,'',1,0),(29,0,'',2,0),(30,0,'',0,0),(31,0,'',0,0),(32,0,'',0,0),(33,0,'',0,1),(34,0,'',0,1),(35,0,'',0,1),(36,0,'',0,1),(37,0,'',0,1),(38,0,'',0,1),(47,0,'',0,1),(84,0,'',0,1),(102,0,'',0,1),(112,0,'',0,0),(113,0,'',0,1),(116,0,'',0,1),(119,0,'',0,1),(126,0,'',2,0),(127,0,'',1,0),(130,0,'',1,1),(131,0,'',1,1),(133,0,'',1,1),(136,0,'',1,1),(137,0,'',1,1),(139,0,'',1,1),(140,0,'',1,1),(141,0,'',1,0),(142,0,'',1,0),(143,0,'',1,1),(144,0,'',1,1),(145,0,'',1,1),(146,0,'',1,1),(147,0,'',1,1),(148,0,'',1,1),(149,0,'',1,1),(150,0,'',1,1),(151,0,'',1,1),(152,0,'',1,1),(153,0,'',1,1),(154,0,'',1,1),(155,0,'',1,1),(156,0,'',1,1),(157,0,'',1,1),(158,0,'',1,1),(159,0,'',1,1),(160,0,'',1,1),(161,0,'',1,1),(162,0,'',1,1),(163,0,'',1,1),(164,0,'',1,1),(165,0,'',1,1),(166,0,'',1,1),(167,0,'',1,1),(168,0,'',1,1),(171,0,'',2,0),(172,0,'',1,0),(173,0,'',0,1),(174,0,'',0,1),(175,0,'',1,0),(176,0,'',2,0),(177,0,'',2,0),(178,0,'',1,0),(179,0,'',0,1),(180,0,'',0,0),(181,0,'',0,0),(182,0,'',1,0),(183,0,'',2,0),(184,0,'',0,0),(185,0,'',0,0),(186,0,'',0,0),(187,0,'',1,0),(188,0,'',2,0),(189,0,'',0,1),(190,0,'',0,1),(191,0,'',0,1),(192,0,'',0,1),(193,0,'',0,1),(194,0,'',0,1),(195,0,'',0,1),(196,0,'',0,1),(197,0,'',0,1),(198,0,'',0,1),(199,0,'',0,1),(200,0,'',0,1),(201,0,'',0,1),(202,0,'',0,1),(203,0,'',0,1),(204,0,'',0,1),(205,0,'',0,1),(206,0,'',0,1),(212,0,'',0,1),(213,0,'',0,1),(214,0,'',0,1),(215,0,'',0,1),(216,0,'',0,1),(222,0,'',0,1),(227,0,'',0,1),(228,0,'',0,1),(229,0,'',0,1),(230,0,'',0,1),(237,0,'',0,1),(238,0,'',0,1),(239,0,'',0,1),(240,0,'',0,1),(241,0,'',0,1),(242,0,'',0,1),(248,0,'',0,1),(253,0,'',0,1),(255,0,'',0,1),(256,0,'',0,1),(257,0,'',0,1),(258,0,'',0,1),(259,0,'',0,1),(260,0,'',0,1),(261,0,'',0,1),(262,0,'',0,1),(263,0,'',0,1),(265,0,'',0,1),(266,0,'',0,1),(267,0,'',0,1),(268,0,'',0,1),(269,0,'',0,1),(270,0,'',0,1),(271,0,'',0,1),(272,0,'',0,1),(273,0,'',0,1),(274,0,'',0,1),(275,0,'',0,1),(276,0,'',0,1),(277,0,'',0,1),(278,0,'',0,1),(279,0,'',0,1),(280,0,'',0,1),(281,0,'',0,1),(282,0,'',0,1),(283,0,'',0,1),(284,0,'',0,1),(285,0,'',0,1),(286,0,'',0,1),(287,0,'',0,1),(288,0,'',0,1),(289,0,'',0,1),(290,0,'',0,1),(291,0,'',0,1),(292,0,'',0,1),(293,0,'',0,1),(294,0,'',0,1),(295,0,'',0,1),(296,0,'',0,1),(297,0,'',0,1),(298,0,'',0,1),(299,0,'',0,1),(300,0,'',0,1),(301,0,'',0,1),(302,0,'',0,1),(303,0,'',0,1),(304,0,'',0,1),(305,0,'',0,1),(306,0,'',0,1),(307,0,'',0,1),(308,0,'',0,1),(309,0,'',0,1),(310,0,'',0,1),(311,0,'',0,1),(312,0,'',0,1),(313,0,'',0,1),(314,0,'',0,1),(315,0,'',0,1),(316,0,'',0,1),(317,0,'',0,1),(318,0,'',0,1),(319,0,'',0,1),(321,0,'',0,1),(322,0,'',0,1),(323,0,'',0,1),(324,0,'',0,1),(325,0,'',0,1),(326,0,'',0,1),(327,0,'',0,1),(328,0,'',0,1),(329,0,'',0,1),(330,0,'',0,1),(331,0,'',0,1),(332,0,'',0,1),(333,0,'',0,1),(334,0,'',0,1),(335,0,'',0,1),(336,0,'',0,1),(337,0,'',0,1),(338,0,'',0,1),(339,0,'',0,1),(340,0,'',0,1),(341,0,'',0,1),(342,0,'',0,1),(343,0,'',0,1),(344,0,'',0,1),(345,0,'',0,1),(346,0,'',0,1),(347,0,'',0,1),(348,0,'',0,1),(349,0,'',0,1),(350,0,'',0,1),(351,0,'',0,1),(352,0,'',0,1),(353,0,'',0,1),(354,0,'',0,1),(355,0,'',0,1),(356,0,'',0,1),(357,0,'',0,1),(358,0,'',0,1),(359,0,'',0,1),(360,0,'',0,1),(361,0,'',0,1),(362,0,'',0,1),(363,0,'',0,1),(364,0,'',0,1),(365,0,'',0,1);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_text`
--
DROP TABLE IF EXISTS `catalog_product_entity_text`;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_text`
--
LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_text` VALUES (1,10,495,0,16,'2610'),(2,10,494,0,16,'4.1 x 1.7 x 0.7 inches '),(3,10,97,0,16,'The Nokia 2610 is an easy to use device that combines multiple messaging options including email, instant messaging, and more. You can even download MP3 ringtones, graphics, and games straight to the phone, or surf the Internet with Cingular\'s MEdia Net service. It\'s the perfect complement to Cingular service for those even remotely interested in mobile Web capabilities in an affordable handset.<br><br>\r\n\r\n<b>Design</b><br>\r\nCompact and stylish, the 2610 features a candybar design sporting a bright 128 x 128 pixel display capable of displaying over 65,000 colors. Most of the phone\'s features and on-screen menus are controlled by a center toggle on the control pad. A standard hands-free headphone jack is provided, as are volume control keys, and there\'s even a \"Go-To\" button that can be assigned by the user for quick access to favorite applications. Lastly, the included speakerphone allows you to talk handsfree, and because the phone sports an internal antenna, there\'s nothing to snag or break off.\r\n\r\n'),(4,10,492,0,16,'<ul>\r\n<ul class\"disc\">\r\n<li>Integrated camera with video recorder to capture those special moments<br></li>\r\n<li>Enriched data connections for complete mobile access via Email, MMS, and MEdia Net<br></li>\r\n<li> Personalize with downloadable MP3 and polyphonic Ring tones, Games, and Graphics<br></li>\r\n<li>Use AIM, Yahoo! and MSN Messenger to stay in touch on the go<br></li>\r\n<li>Mobile Internet browser and email</li>\r\n</ul>'),(5,10,496,0,16,'Conditional $250 Equipment Discount Included: Your price paid includes an equipment discount of $250 that has been provided to you in exchange for either activating a new, non-substitute line of service or renewing an existing line of service with AT&T and your agreement that for the 181-day period following such activation or renewal you will: (1) pay your balance due to AT&T each month and otherwise maintain your account in good standing; (2) not disconnect this AT&T line of service; (3) not transfer this equipment to another AT&T line of service; (4) not change your AT&T service rate plan to a lower monthly service rate--this includes canceling or removing required PDA, BlackBerry, or smartphone features after your product has shipped; (5) not use this line of service to replace an existing account with AT&T. If these conditions are not met, you hereby authorize Magento to charge your credit card $250 as reimbursement of this equipment discount without need for further approval.'),(6,10,104,0,16,'Nokia 2610, cell, phone, '),(7,10,495,0,17,'8100'),(8,10,494,0,17,'4.2 x 2 x 0.6 inches '),(9,10,97,0,17,' Like the BlackBerry 7105t, the BlackBerry 8100 Pearl is \r\nThe BlackBerry 8100 Pearl sports a large 240 x 260 screen that supports over 65,000 colors-- plenty of real estate to view your e-mails, Web browser content, messaging sessions, and attachments. The venerable BlackBerry trackwheel has been replaced on this model with an innovative four-way trackball placed below the screen. On the rear of the handheld, you\'ll find a 1.3-megapixel camera and a self portrait mirror. The handheld\'s microSD memory card slot is located inside the device, behind the battery. There\'s also a standard 2.5mm headset jack that can be used with the included headset, as well as a mini-USB port for data connectivity.'),(10,10,492,0,17,'<ul>\r\n<ul class=\"disc\">\r\n<li> 1.3 mega pixel camera to capture those special moments<br></li>\r\n<li> MP3 player lets you listen to your favorite music on the go<br></li>\r\n<li>Menu and escape keys on the front of the device for easier access<br></li>\r\n<li> Bluetooth technology lets you experience hands free and wire free features<br></li>\r\n<li>Package Contents: phone,AC adapter,software CD,headset,USB cable,sim- card,get started poster,reference guide<br></li>\r\n</ul>'),(11,10,496,0,17,'CONDITIONAL $250 Equipment Discount Included: Your price paid includes an Equipment Discount of $250 that has been provided to you in exchange for activating a new, non-substitute line of service with T-Mobile and your agreement that for the 181-day period following such activation you will (1) pay your balance due to T-Mobile each month and otherwise maintain your account in good standing, (2) not disconnect this T-Mobile line of service, (3) not transfer this equipment to another T-Mobile line of service, (4) not change your T-Mobile service rate plan to a lower monthly service rate--this includes canceling or removing required PDA, BlackBerry, or smartphone features after your product has shipped, (5) not use this line of service to replace an existing account with T-Mobile. If these conditions are not met, you hereby authorize Magento.com to charge your credit card $250 as reimbursement of this Equipment Discount without need for further approval.'),(12,10,104,0,17,'Blackberry, 8100, pearl, cell, phone'),(13,10,495,0,18,'W810i'),(14,10,494,0,18,' 3.5 x 1.8 x 1 inches'),(15,10,97,0,18,'The W810i\'s screen sports 176 x 220 pixel resolution with support for 262,000 colors. Quick access buttons below the screen make it easy to control the phone\'s Walkman music features, while a five-way center button controls most of the phone\'s menus and features.'),(16,10,492,0,18,'<ul>\r\n<ul class=\"disc\">\r\n \r\n<li>Disc2Phone™ music copying software is supplied in the W810 kit and it’s easy to copy songs from your favorite CDs, and PC music folders<br></li>\r\n<li>The built-in W810 2 megapixel digital camera with autofus takes excellent photos and when you need to catch some action, W810 has video too<br></li>\r\n<li>Sharing images and other phone content is easy. Use Bluetooth™, or Multimedia messaging when you want to send images and video<br></li>\r\n<li> Wherever you are, you have high speed access to the internet with EDGE technology<br></li>\r\n<li> A full-function email client in your W810 gives you access to your inbox wherever you go</li>\r\n</ul>'),(17,10,496,0,18,'Conditional $250 Equipment Discount Included: Your price paid includes an equipment discount of $250 that has been provided to you in exchange for either activating a new, non-substitute line of service or renewing an existing line of service with AT&T and your agreement that for the 181-day period following such activation or renewal you will: (1) pay your balance due to AT&T each month and otherwise maintain your account in good standing; (2) not disconnect this AT&T line of service; (3) not transfer this equipment to another AT&T line of service; (4) not change your AT&T service rate plan to a lower monthly service rate--this includes canceling or removing required PDA, BlackBerry, or smartphone features after your product has shipped; (5) not use this line of service to replace an existing account with AT&T. If these conditions are not met, you hereby authorize Magento.com to charge your credit card $250 as reimbursement of this equipment discount without need for further approval.'),(18,10,104,0,18,'Sony, Ericsson ,W810i, cell, phone'),(19,10,495,0,20,'MM-A900M'),(20,10,494,0,20,'3.9 x 2 x 0.6 inches'),(21,10,97,0,20,'New services supported by both the MM-A900m include the newly announced Sprint Music StoreSM, which allows users to immediately buy and download complete songs directly to their phone; 30 channels of live and on demand video and audio from Sprint TVSM and On Demand, a personalized resource guide to news, traffic, weather, sports and entertainment. The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. Features like external music-navigation keys make these phones both functional and attractive. These handsets are sure to be at the top of many wish lists.'),(22,10,492,0,20,'<ul>\r\n<ul class=\"disc\">\r\n<li>Bluetooth Wireless Technology: Built-in radio technology allows fast, secure transmission between your phone and accessories without cables or wires. Bluetooth wireless accessories are sold separately.<br></li>\r\n<li>Mass Storage Area: Store pictures, videos, voice memos and music within the internal memory of the phone.<br></li>\r\n<li>Streaming Music Enabled: Stream music to your phone with Music Choice®. Select from Pop, Rock, Hip Hop, and R&B plus exclusive video clips, performances, and artist interviews.<br></li>\r\n</ul>\r\n   '),(23,10,496,0,20,'CONDITIONAL $250 Equipment Discount Included: Your price paid includes an equipment discount of $250 that has been provided to you in exchange for activating a new, non-substitute line of service with Sprint and your agreement that for the 181-day period following such activation you will (1) pay your balance due to Sprint each month and otherwise maintain your account in good standing, (2) not disconnect this Sprint line of service, (3) not transfer this equipment to another Sprint line of service, (4) not change your Sprint service rate plan to a lower monthly service rate--this includes canceling or removing required PDA, BlackBerry, or smartphone features after your product has shipped, and (5) not use this line of service to replace an existing account with Sprint. If these conditions are not met, you hereby authorize Magento.com to charge your credit card $250 as reimbursement of this equipment discount without need for further approval.'),(24,10,104,0,20,'Samsung, MM-A900M, cell, phone'),(25,10,495,0,25,'MA464LL/A'),(26,10,494,0,25,'19.5 x 7.6 x 19.5 inches'),(27,10,497,0,25,'2.0 GHz Intel Core Duo processor with 2 MB shared L2 Cache'),(28,10,498,0,25,'1 GB (single SODIMM) 667 MHz DDR2 SDRAM (PC2-5300)'),(29,10,499,0,25,'100 GB 5400 rpm Serial ATA hard drive'),(30,10,500,0,25,'15.4-inch TFT widescreen display with 1440 x 900 resolution'),(31,10,97,0,25,'This, combined with myriad other engineering leaps, boosts performance up to four times higher than the PowerBook G4. With this awesome power, it\'s a breeze to render complex 3D models, enjoy smooth playback of HD video, or host a four-way video conference.Intel Core Duo is the first chip built using Intel\'s groundbreaking 65-nanometer process - resulting in transistors so small, you could fit a hundred inside a single human cell. With smaller distances for electrons to travel, and two processors designed to share resources and conserve power, Intel Core Duo achieves higher levels of performance as it uses fewer watts. Which is what makes it possible to design a super-powerful MacBook Pro that\'s only one inch thin.When Mac technology makes something easy, it\'s hardly news. So here\'s more non-news for MacBook Pro owners: software just works. If you see the Universal logo on a new application, that means it will run on Intel- and PowerPC-based Mac computers. For most existing applications, you simply do what you\'ve always done: double-click them. Thanks to the Rosetta technology in Mac OS X, they look and feel just like they did before.'),(32,10,492,0,25,' <ul>\r\n<ul class=\"disc\">\r\n<li>2.0 GHz Intel Core Duo processor with 2 MB shared L2 Cache<br></li>\r\n<li>1 GB (single SODIMM) 667 MHz DDR2 SDRAM (PC2-5300); 100 GB 5400 rpm Serial ATA hard drive; slot-load SuperDrive (DVD±RW/CD-RW)<br></li>\r\n<li>One FireWire 400, two USB 2.0 ports, and ExpressCard/34 slot; no FireWire 800 slots<br></li>\r\n<li>Built-in 10/100/1000BASE-T (Gigabit); built-in 54 Mbps AirPort Extreme (802.11g); built-in Bluetooth 2.0+EDR<br></li>\r\n<li>15.4-inch TFT widescreen display with 1440 x 900 resolution</li>'),(33,10,104,0,25,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive) '),(34,10,495,0,26,'LX.FR206.001'),(35,10,497,0,26,'Mobile AMD Athlon 64 2800+'),(36,10,498,0,26,'512MB of PC2700 DDR333 SDRAM'),(37,10,499,0,26,'80 gig Western Digital'),(38,10,500,0,26,'15-inch, 200-nit, high-brightness TFT LCD screen '),(39,10,97,0,26,' Acer has flawlessly designed the Ferrari 3200, instilling it with exceptional performance, brilliant graphics, and lightning-fast connectivity. This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success.'),(40,10,492,0,26,' <ul>\r\n<ul class=\"disc\">\r\n<li>Mobile AMD Athlon 64 2800+<br></li>\r\n<li>1MB L2 Cache<br></li>\r\n<li>512MB of PC2700 DDR333 SDRAM<br></li>\r\n<li>2 RAM Slots (0 open - upgrading requires chip removal)<br></li>\r\n<li>RAM is upgradeable to 2GB</li>\r\n</ul>'),(41,10,104,0,26,'Acer Ferrari 3200 Notebook Computer PC '),(42,10,495,0,27,'VGN-TXN27N/B'),(43,10,494,0,27,'10.7 x 1.23 x 7.7 inches (WxHxD)'),(44,10,497,0,27,'Intel Core Solo Processor U1500'),(45,10,498,0,27,'2 GB RAM'),(46,10,499,0,27,'100 GB Hard Drive'),(47,10,500,0,27,'9 inches'),(48,10,97,0,27,' Weighing in at just an amazing 2.84 pounds and offering a sleek, durable carbon-fiber case in charcoal black. And with 4 to 10 hours of standard battery life, it has the stamina to power you through your most demanding applications. With the integrated wireless WAN, you can access the national Sprint Mobile Broadband service to extend your wireless coverage beyond LAN access networks and hotspots, giving you the freedom to go farther, do more, and stay connected.\r\n\r\n'),(49,10,492,0,27,' <ul>\r\n<ul class=\"disc\">\r\n<li>Processor: The Ultra Low Voltage Intel Core Solo U1500 processor offers a 1.33 GHz speed paired with a fast 533 MHz front-side bus and large 2 MB L2 cache. (An L2, or secondary, cache temporarily stores data; and a larger L2 cache can help speed up your system\'s performance. The FSB carries data between the CPU and RAM, and a faster front-side bus will deliver better overall performance.) The Core Solo processor delivers enhanced performance for today\'s demanding applications such as CAD tools, 3-D and 2-D modeling, video editing, digital music, digital photography and gaming. And Intel\'s Smart Cache technology enables smarter, more efficient cache and bus design for enhanced performance, responsiveness and power savings.</li>\r\n</ul>\r\n\r\n   '),(50,10,104,0,27,'Sony, VAIO, VGN-TXN27N/B , Notebook, PC, Intel, 2 GB RAM, Laptop'),(51,10,495,0,28,'M285-E'),(52,10,494,0,28,'17 x 7 x 13 inches'),(53,10,497,0,28,'1.66 GHz Intel Core Duo T2300E processor'),(54,10,498,0,28,'1 GB RAM'),(55,10,499,0,28,'60 GB hard drive'),(56,10,500,0,28,'14-inch screen '),(57,10,97,0,28,'Easily mobile at just 6 pounds, the Toshiba Satellite A135-S4527 makes it easy to get your work done with a large, bright 15.4-inch widescreen LCD. The XGA-resolution screen (1280 x 800) permits side-by-side viewing of documents for increased productivity. It\'s also great for using as a media center, with Toshiba\'s unique Express Media Player enabling you to bypass the system and access CDs and DVDs with a touch of button. This affordable notebook PC is powered by Intel\'s 1.73 GHz Core Duo T2080 processor, which provides an optimized, multithreaded architecture for improved gaming and multitasking performance and efficient power consumption. It also offers a 120 GB hard drive, 1 GB of installed RAM (2 GB maximum), dual-layer/multi-format DVD drive that also burns CDs, integrated 54g wireless connectivity, and Intel GMA 950 video card with up to 256 MB of shared video RAM.\r\n\r\n'),(58,10,492,0,28,' <ul>\r\n<ul class=\"disc\">\r\n<li>Processor: The Intel Core Duo T2080 processor is built with the Mobile Intel 945PM Express chipset, and it has a 1.73 GHz processor speed, fast 533 MHz front-side bus (FSB), and 1 MB L2 cache. (An L2, or secondary, cache temporarily stores data; and a larger L2 cache can help speed up your system\'s performance. The FSB carries data between the CPU and RAM, and a faster front-side bus will deliver better overall performance.)</li>\r\n</ul>'),(59,10,104,0,28,'Toshiba, notebook, laptop, intel, '),(60,10,495,0,29,'B000JI2N0I'),(61,10,97,0,29,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(62,10,492,0,29,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(63,10,104,0,29,'CN Clogs Beach/Garden Clog '),(64,10,495,0,30,'B000CP1M00'),(65,10,97,0,30,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(66,10,495,0,32,'B000LJQVF8'),(67,10,97,0,32,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(68,10,492,0,32,'The perfect pump will suit any ensemble. Leather upper. 3-3/4 inch stacked heel. Man-made sole. Imported. '),(69,10,104,0,32,'Nine West Women\'s Lucero Pump '),(70,10,495,0,33,'B000NPOA1M'),(71,10,97,0,33,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(72,10,495,0,35,'Impatience'),(73,10,97,0,35,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(74,10,104,0,35,'Coalesce: Functioning On Impatience T-Shirt'),(75,10,495,0,36,'Ink Eater:'),(76,10,97,0,36,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(77,10,104,0,36,'Ink Eater: Krylon Bombear Destroyed Tee'),(78,10,495,0,19,'8525 PDA'),(79,10,494,0,19,'4.4 x 2.4 x 0.9 inches'),(80,10,97,0,19,' The design of the 8525 is clean and uncluttered, with just a few buttons for mail, Internet Explorer, and contextual menus. Meanwhile, call answer and end buttons surround a five-way toggle that allows you to navigate and control the Windows Mobile interface. As mentioned, a full QWERTY keyboard cleverly slides out from underneath the screen. This allows you to hold the device horizontally, and the screen is automatically placed in landscape mode when you\'re using the keyboard. A side scroll wheel is conveniently tucked away on the side, making navigation when accessing the music player and other various applications a cinch when needed. A mini-SD memory expansion card slot is provided, as is an infrared port and support for a stereo Bluetooth headset. A mini-USB port is also included for wired data transfers and charging.'),(81,10,492,0,19,'<ul>\r\n<ul class=\"disc\">\r\n<li>tri-band UMTS/HSDPA; quad-band GSM/GPRS/EDGE for global use<br></li>\r\n<li>Windows Mobile 5.0 with Messaging & Security Feature Pack<br></li>\r\n<li>sliding QWERTY keyboard with improved keypad design and improved backlight for easier use in low light conditions<br></li>\r\n<li>128MB ROM / 64MB RAM; ~51MB user available memory<br></li>\r\n<li>2.0 mega-pixel camera with video capabilities</li>\r\n</ul>'),(82,10,496,0,19,'Conditional $250 Equipment Discount Included: Your price paid includes an equipment discount of $250 that has been provided to you in exchange for either activating a new, non-substitute line of service or renewing an existing line of service with AT&T and your agreement that for the 181-day period following such activation or renewal you will: (1) pay your balance due to AT&T each month and otherwise maintain your account in good standing; (2) not disconnect this AT&T line of service; (3) not transfer this equipment to another AT&T line of service; (4) not change your AT&T service rate plan to a lower monthly service rate--this includes canceling or removing required PDA, BlackBerry, or smartphone features after your product has shipped; (5) not use this line of service to replace an existing account with AT&T. If these conditions are not met, you hereby authorize Magento.com to charge your credit card $250 as reimbursement of this equipment discount without need for further approval.'),(83,10,104,0,19,'At&t, 8525, cell, phone'),(84,10,495,0,39,'The Get Up Kids: Band Camp Pullover Hoodie'),(85,10,97,0,39,'Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.  Sizing info is available here. '),(86,10,104,0,39,'The Get Up Kids: Band Camp Pullover Hoodie'),(87,10,495,0,41,'384822'),(88,10,494,0,41,'21\"W x 44\"L x 35.5\"H'),(89,10,507,0,41,'Thailand'),(90,10,509,0,41,'Asian Beechwood'),(91,10,97,0,41,'Features include inset panel sides and for spacious drawers and two wicker baskets. 41\"Wx18\"Dx36\"H.'),(92,10,104,0,41,'Hardwood, drawers, wicker, asian, beechwood'),(93,10,495,0,42,'bar1234'),(94,10,494,0,42,'62\"W x 84\"L x 8\"H'),(95,10,507,0,42,'Thailand'),(96,10,492,0,44,'<ul>\r\n<ul class=\"disc\"> \r\n\r\n<li>8.0-megapixel CMOS sensor captures enough detail for photo-quality 16 x 22-inch prints<br></li>\r\n<li>Includes Canon\'s EF-S 18-55mm, f3.5-5.6 zoom lens<br></li>\r\n<li>DIGIC II Image Processor provides fast, accurate image processing; captures images at a rate of up to 3 frames per second<br></li>\r\n<li>Fast start-up time--.2 seconds<br></li>\r\n<li>Powered by rechargeable Lithium-ion battery (included, with charger)</li>\r\n</ul>\r\n'),(97,10,104,0,44,'canon, slr, camera, 8, digital'),(98,10,495,0,45,'QC-2185'),(99,10,494,0,45,'2.75 inches x 1.5 inches'),(100,10,97,0,45,'The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.\r\n\r\nThe Argus QC-2185 features a clear and bright 1.1-inch CSTN (color super-twist nematic) LCD display that makes it easy to frame the perfect picture. Thanks to its USB 1.1 connection compatibility, this digital camera lets you quickly download pictures to your Mac or PC, and can also function as a handy web camera. The QC-2185 includes eight megabytes of internal SDRAM memory, with the ability to expand camera memory via a built-in SD (secure digital) storage card slot for easy storage and transfer of your pictures. This unit also includes a built-in auto flash with a three to seven foot range, and comes with ArcSoft PhotoImpression\'s photo editing software which makes it easy for you to edit, crop, adjust and improve all your best pictures to make them even better.\r\n'),(101,10,492,0,45,'<ul>\r\n<ul class=\"disc\".  \r\n<li>5 megapixel digital camera with a 1600 x 1200 resolution and an f2.8 aperture</li>\r\n<li> Clear and bright 1.1-inch CSTN LCD display makes it easy to frame the perfect picture</li>\r\n<li>USB 1.1 connection compatibility lets you quickly download pictures to your Mac or PC, and function as a web camera</li>\r\n<li>Runs on 3 AAA batteries, and requires; Windows OS 98 or higher, at least 32 MB of RAM and 125 MB of hard disk space, and an available USB port</li>\r\n<li>Weighs 3.4 ounces, measures 3.6 x 2.4 x 1.1 inches (W x H x D), and is backed by a 1-year manufacturer\'s warranty</li>\r\n</ul>\r\n'),(102,10,104,0,45,'Argus, QC-2185, digital, camera, 2MP'),(103,10,495,0,46,'750'),(104,10,494,0,46,'3.8 x 2.1 x 1 inches'),(105,10,97,0,46,'Olympus continues to innovate with the launch of the Stylus 750 digital camera, a technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom that tucks away into a streamlined metal, all-weather body design. The camera is distinguished by a number of premium features, including:\r\n\r\n    * An advanced combination of the mechanical CCD-shift Image Stabilization and Digital Image Stabilization work together to ensure the clearest pictures possible in any situation;\r\n    * A 5x optical zoom lens with a newly developed lens element to maintain a small compact size;\r\n    * A 2.5-inch LCD and Bright Capture Technology dramatically improve composition, capture and review of images in low-light situations;\r\n    * Olympus\' exclusive TruePic Turbo Image Processing engine is coupled with a 7.1-megapixel image sensor to produce crisp, high-quality p'),(106,10,492,0,46,'<ul>\r\n<ul class=\"disc\">\r\n\r\n<li>7.1-megapixel CCD captures enough detail for photo-quality 15 x 20-inch prints<br></li>\r\n<li>5x image-stabilized optical zoom; 2.5-inch LCD display<br></li>\r\n<li>Compact, all-weather body measures 3.8 x 2.1 x 0.96 inches<br></li>\r\n<li>Bright Capture technology; 27 selectable shooting modes; built-in Help guide<br></li>\r\n<li>Stores images on xD Picture Cards; powered by Li-Ion battery (battery and charger included)</li>\r\n</ul>'),(107,10,104,0,46,'Olympus, stylus, 750, 7MP, digital, camera, zoom'),(108,10,495,0,47,'A630 '),(109,10,494,0,47,'4.3 x 2.6 x 1.9 inches '),(110,10,97,0,47,'Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.<br>\r\n\r\nThe PowerShot A630 packs a vast array of advanced features into a remarkably compact space<br><br>\r\n\r\n'),(111,10,492,0,47,'<ul>\r\n<ul class=\"disc\">\r\n<li>8-megapixel CCD captures enough detail for photo-quality 16 x 22-inch prints<br></li>\r\n<li>4x optical zoom; 2.5-inch vari-angle LCD display<br></li>\r\n<li>ISO range up to ISO 800 for less blur in low light while hand-holding<br></li>\r\n<li>3:2 guide masks LCD to display 4 x 6-inch print size; 16:9 format option for still images<br></li>\r\n<li>Stores images on SD cards; powered by 4 AA-size batteries</li>\r\n</ul>'),(112,10,104,0,47,'canon, powershot, A630, digital, camera, optical, zoom'),(113,10,495,0,48,'C530 '),(114,10,494,0,48,' 4 x 6 x 9 inches'),(115,10,97,0,48,'Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features--such as 5.0-megapixel CCD resolution, on-camera image cropping, and an on-camera Share button--at a very affordable price.'),(116,10,492,0,48,'<ul>\r\n<ul class=\"disc\">   \r\n\r\n<li>5.0-megapixel CCD captures enough detail for photo-quality 13 x 17-inch prints<br></li>\r\n<li>1.5-inch LCD display<br></li>\r\n<li>Continuous QVGA video<br></li>\r\n<li>Auto scene mode and three color modes; in-camera cropping<br></li>\r\n<li>Powered by AA size batteries; stores images on SD memory cards (includes 16 MB internal memory)</li>\r\n</ul>'),(117,10,104,0,48,'kodak, eayshare, c530, 5MP, digital, camera'),(118,10,495,0,49,'B000KJ43SG'),(119,10,97,0,49,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(120,10,492,0,49,'Womens Premier Leather Single Layer Narrow Strap - '),(121,10,104,0,49,'womens, sandal, leather, anashria, '),(122,10,495,0,51,'magotto'),(123,10,507,0,51,'Italy'),(124,10,509,0,51,'Microfiber'),(125,10,97,0,51,'The Magento ottoman will impress with its style while it delivers on quality. This piece of living room furniture is built to last with durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.'),(126,10,104,0,51,'Ottoman'),(127,10,495,0,52,'1112'),(128,10,507,0,52,'Italy'),(129,10,509,0,52,'Microfiber'),(130,10,97,0,52,'This Magento chair features a fun, futuristic design, with fluid curves and gentle angles that follow the shape of the body to enhance ultimate relaxation. It combines a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.'),(131,10,104,0,52,'Chair'),(132,10,495,0,53,'1113'),(133,10,507,0,53,'Italy'),(134,10,509,0,53,'Microfiber'),(135,10,97,0,53,'Inspired by the classic camelback sofa, Magento offers comfort and style in a low maintenance package.  For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!'),(136,10,104,0,53,'Couch'),(137,10,495,0,54,'RFS'),(138,10,507,0,54,'Italy'),(139,10,509,0,54,'Microfiber'),(140,10,97,0,54,'The perfect furniture set for the living room!  Love red?  You\'ll love these pieces of handmade modern furniture!'),(141,10,104,0,54,'Magento, Red, Furniture, Set, ottoman, couch, chair'),(142,10,506,0,39,'Printed on American Apparel Classic style 5495 California Fleece Pull-Over Hoodies.  '),(143,10,506,0,38,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(144,10,506,0,37,'Printed on American Apparel Classic style 5495 California cotton T shirst.   '),(145,10,506,0,36,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(146,10,506,0,35,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(147,10,506,0,34,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(148,10,506,0,19,'Under the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera.'),(149,10,506,0,18,'The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here.'),(150,10,506,0,17,'The BlackBerry 8100 Pearl is a departure from the form factor of previous BlackBerry devices. This BlackBerry handset is far more phone-like, and RIM\'s engineers have managed to fit a QWERTY keyboard onto the handset\'s slim frame.'),(151,10,506,0,16,'The words \"entry level\" no longer mean \"low-end,\" especially when it comes to the Nokia 2610. Offering advanced media and calling features without breaking the bank'),(152,10,506,0,30,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(153,10,506,0,41,'Our Akio dresser has a solid hardwood frame.  '),(154,10,506,0,42,'Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.'),(155,10,506,0,44,' Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. '),(156,10,506,0,54,'Love red?  You\'ll love these pieces of handmade modern furniture!'),(157,10,495,0,74,'B000KJ43SG'),(158,10,97,0,74,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(159,10,492,0,74,'Womens Premier Leather Single Layer Narrow Strap - '),(160,10,104,0,74,'womens, sandal, leather, anashria, '),(161,10,506,0,74,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(162,10,495,0,75,'B000KJ43SG'),(163,10,97,0,75,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(164,10,492,0,75,'Womens Premier Leather Single Layer Narrow Strap - '),(165,10,492,0,80,'Womens Premier Leather Single Layer Narrow Strap - '),(166,10,104,0,80,'womens, sandal, leather, anashria, '),(167,10,506,0,80,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(168,10,495,0,81,'B000KJ43SG'),(169,10,97,0,81,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(170,10,492,0,81,'Womens Premier Leather Single Layer Narrow Strap - '),(171,10,104,0,81,'womens, sandal, leather, anashria, '),(172,10,506,0,81,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(173,10,495,0,82,'B000KJ43SG'),(174,10,495,0,84,'B000JI2N0I'),(175,10,97,0,84,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(176,10,492,0,84,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(177,10,104,0,84,'CN Clogs Beach/Garden Clog '),(178,10,104,0,85,'CN Clogs Beach/Garden Clog '),(179,10,506,0,85,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(180,10,495,0,86,'B000JI2N0I'),(181,10,97,0,86,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(182,10,97,0,87,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(183,10,492,0,87,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(184,10,104,0,87,'CN Clogs Beach/Garden Clog '),(185,10,506,0,87,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(186,10,506,0,88,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(187,10,495,0,89,'B000JI2N0I'),(188,10,97,0,89,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(189,10,492,0,89,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(190,10,492,0,90,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(191,10,104,0,90,'CN Clogs Beach/Garden Clog '),(192,10,506,0,90,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(193,10,495,0,91,'B000JI2N0I'),(194,10,495,0,92,'B000JI2N0I'),(195,10,97,0,92,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(196,10,492,0,92,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(197,10,104,0,92,'CN Clogs Beach/Garden Clog '),(198,10,97,0,93,'Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(199,10,492,0,93,'<ul>\r\n<ul class=\"disc\">\r\n<li> I.G.S.: Allows for natural foot movement from heel strike to toe-off<br></li>\r\n<li>DuoMax Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off<br></li>\r\n<li> Space Trusstic System: Allows for greater midsole deformation and more efficient foot function<br></li>\r\n<li>GEL Cushioning System: Provides maximum rearfoot/forefoot shock attenuation<br></li>\r\n<li>Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation</li>\r\n\r\n</ul>'),(200,10,495,0,94,'B000CP1M00'),(201,10,506,0,94,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(202,10,495,0,95,'B000CP1M00'),(203,10,97,0,95,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(204,10,495,0,96,'B000CP1M00'),(205,10,97,0,96,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(206,10,492,0,96,'# I.G.S.?: Allows for natural foot movement from heel strike to toe-off\r\n# DuoMax? Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off\r\n# Space Trusstic System?: Allows for greater midsole deformation and more efficient foot function\r\n# GEL? Cushioning System: Provides maximum rearfoot/forefoot shock attenuation\r\n# Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation'),(207,10,97,0,97,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(208,10,492,0,97,'# I.G.S.?: Allows for natural foot movement from heel strike to toe-off\r\n# DuoMax? Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off\r\n# Space Trusstic System?: Allows for greater midsole deformation and more efficient foot function\r\n# GEL? Cushioning System: Provides maximum rearfoot/forefoot shock attenuation\r\n# Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation'),(209,10,104,0,97,'ASICS® Men\'s GEL-Kayano® XII '),(210,10,104,0,99,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(211,10,506,0,99,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(212,10,495,0,100,'B000IKC6AY'),(213,10,506,0,100,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(214,10,495,0,101,'B000IKC6AY'),(215,10,97,0,101,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(216,10,492,0,101,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(217,10,104,0,101,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(218,10,506,0,101,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(219,10,495,0,102,'B000IKC6AY'),(220,10,97,0,102,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(221,10,492,0,102,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(222,10,104,0,102,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(223,10,506,0,102,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue'),(224,10,495,0,103,'B000NOGIKY'),(225,10,104,0,103,'Steven by Steve Madden Pryme Pump'),(226,10,506,0,103,' This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(227,10,97,0,103,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(228,10,492,0,103,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(229,10,495,0,104,'B000NOGIKY'),(230,10,97,0,104,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(231,10,492,0,104,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(232,10,104,0,104,'Steven by Steve Madden Pryme Pump'),(233,10,506,0,104,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(234,10,495,0,105,'B000NOGIKY'),(235,10,97,0,105,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(236,10,492,0,105,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(237,10,104,0,105,'Steven by Steve Madden Pryme Pump'),(238,10,506,0,105,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(239,10,495,0,106,'B000NOGIKY'),(240,10,97,0,106,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(241,10,492,0,106,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(242,10,104,0,106,'Steven by Steve Madden Pryme Pump'),(243,10,506,0,106,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(244,10,495,0,107,'B000NOGIKY'),(245,10,97,0,107,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(246,10,492,0,107,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(247,10,104,0,107,'Steven by Steve Madden Pryme Pump'),(248,10,506,0,107,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(249,10,495,0,108,'B000LJQVF8'),(250,10,104,0,108,'Nine West, Women, Lucero, Pump'),(251,10,506,0,108,'This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(252,10,97,0,108,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(253,10,492,0,108,'The perfect pump will suit any ensemble. Leather upper. 3-3/4 inch stacked heel. Man-made sole. Imported. '),(254,10,495,0,109,'B000LJQVF8'),(255,10,97,0,109,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(256,10,492,0,109,'The perfect pump will suit any ensemble. Leather upper. 3-3/4 inch stacked heel. Man-made sole. Imported. '),(257,10,104,0,109,'Nine West Women\'s Lucero Pump '),(258,10,506,0,109,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(259,10,495,0,110,'B000LJQVF8'),(260,10,97,0,110,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(261,10,97,0,111,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp, leather linings, and a cushioned insole for long-wearing comfort. The stiletto heel radiates a subtle hint of sensuality, so sass up your jean and t-shirt look or nighttime attire with this hot pump and you\'ll be absolutely unforgettable.'),(262,10,506,0,111,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(263,10,495,0,112,'B000NPOA1M'),(264,10,104,0,112,'ECCO, Womens, Golf, Flexor, Shoe'),(265,10,506,0,112,'With a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(266,10,97,0,112,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(267,10,492,0,112,'<ul>\r\n<ul class=\"disc\">\r\n<li>Breathable mesh fabric lining<br></li>\r\n<li>Cushioned Comfort Fibre System(R) <br></li>\r\n<li>Moisture absorbent<br></li>\r\n<li>Anti-bacterial insole<br></li>\r\n</ul>'),(268,10,495,0,113,'B000NPOA1M'),(269,10,495,0,114,'B000NPOA1M'),(270,10,104,0,114,'ECCO Womens Golf Flexor Golf Shoe'),(271,10,506,0,114,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(272,10,495,0,115,'B000NPOA1M'),(273,10,97,0,115,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(274,10,492,0,115,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(275,10,104,0,115,'ECCO Womens Golf Flexor Golf Shoe'),(276,10,506,0,115,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(277,10,495,0,117,'Impatience'),(278,10,97,0,117,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(279,10,104,0,117,'Coalesce: Functioning On Impatience T-Shirt'),(280,10,506,0,117,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(281,10,495,0,118,'Impatience'),(282,10,97,0,118,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(283,10,104,0,118,'Coalesce: Functioning On Impatience T-Shirt'),(284,10,506,0,118,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(285,10,495,0,119,'Impatience'),(286,10,104,0,119,'Coalesce, T-Shirt'),(287,10,506,0,119,'<ul>\r\n<ul class=\"disc\">\r\n\r\n<li>6.1 oz. 100% preshrunk heavyweight cotton<br></li>\r\n<li>Shoulder-to-shoulder taping<br></li>\r\n<li>Double-needle sleeves and bottom hem<br></li>\r\n</ul>'),(288,10,97,0,119,'Comfortable preshrunk shirts.  Highest Quality Printing.<br><br>\r\n<ul>\r\n<ul class=\"disc\">\r\n<li>6.1 oz. 100% preshrunk heavyweight cotton<br></li>\r\n<li>Shoulder-to-shoulder taping<br></li>\r\n<li>Double-needle sleeves and bottom hem<br></li>'),(289,10,495,0,120,'Ink Eater:'),(290,10,104,0,120,'Ink Eater, Krylon, Bombear , Destroyed, Tee, t shirt'),(291,10,506,0,120,'Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(292,10,97,0,120,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(293,10,495,0,121,'Ink Eater:'),(294,10,97,0,121,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(295,10,104,0,121,'Ink Eater: Krylon Bombear Destroyed Tee'),(296,10,506,0,121,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(297,10,495,0,122,'Ink Eater:'),(298,10,97,0,122,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(299,10,104,0,122,'Ink Eater: Krylon Bombear Destroyed Tee'),(300,10,506,0,122,'We bought these with the intention of making shirts for our family reunion, only to come back the next day to find each and every one of them had been tagged by The Bear.  Oh well -- can\'t argue with art.  Now you can make your grandparents proud by wearing an original piece of graf work to YOUR family reunion!'),(301,10,495,0,123,'paisley'),(302,10,104,0,123,'The Only Children: Paisley T-Shirt'),(303,10,506,0,123,'Printed on American Apparel Classic style 5495 California cotton T shirt.   '),(304,10,97,0,123,'<ul>\r\n<ul class=\"disc\">\r\n<li>6.1 oz. 100% preshrunk heavyweight cotton <br></li>\r\n<li>Double-needle sleeves and bottom hem</li>\r\n</ul>'),(305,10,495,0,124,'The Only Children: Paisley T-Shirt'),(306,10,97,0,124,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Double-needle sleeves and bottom hem'),(307,10,104,0,124,'The Only Children: Paisley T-Shirt'),(308,10,506,0,124,'Printed on American Apparel Classic style 5495 California cotton T shirst.   '),(309,10,495,0,125,'The Only Children: Paisley T-Shirt'),(310,10,97,0,125,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Double-needle sleeves and bottom hem'),(311,10,104,0,125,'The Only Children: Paisley T-Shirt'),(312,10,506,0,125,'Printed on American Apparel Classic style 5495 California cotton T shirst.   '),(313,10,495,0,126,'zolof'),(314,10,104,0,126,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(315,10,506,0,126,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(316,10,97,0,126,'<ul>\r\n<ul class=\"disc\")\r\n<li> 6.1 oz. 100% preshrunk heavyweight cotton <br></li>\r\n<li> Shoulder-to-shoulder taping<br></li>\r\n<li>Double-needle sleeves and bottom hem<br></li>\r\n</ul>'),(317,10,104,0,127,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(318,10,104,0,128,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(319,10,506,0,128,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(320,10,495,0,129,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(321,10,97,0,129,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(322,10,104,0,129,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(323,10,506,0,129,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(324,10,495,0,130,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(325,10,97,0,130,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(326,10,104,0,130,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(327,10,506,0,130,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(328,10,495,0,131,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(329,10,97,0,131,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(330,10,97,0,133,'A stylish digital camera demands stylish protection. This leather carrying case will defend your camera from the dings and scratches of travel and everyday use while looking smart all the time.'),(331,10,97,0,134,'Features foldable Flat Pin for Easy Storage/ Slim/ Lightweight Design and Smart Charging LED Indicator.'),(332,10,506,0,134,'Features foldable Flat Pin for Easy Storage/ Slim/ Lightweight Design and Smart Charging LED Indicator.'),(333,10,495,0,135,'B000KJ43SG!'),(334,10,104,0,135,'womens, sandal, leather, anashria, '),(335,10,506,0,135,'Buckle embellished contrasting straps adorn both the heel and canvas covered wedge of this t-strap sandal to make it a truly unique addition to your wardrobe'),(336,10,97,0,135,'Smooth kidskin upper in a dress platform wedge t-strap sandal style, with a round open toe, front and ankle adjustable buckles and tonal stitching accents. Ankle buckle features elastic panel. Smooth faux leather lining, cushioning faux leather and fabric topped insole. 1 inch matching leather and fabric wrapped midsole.'),(337,10,492,0,135,'<ul>\r\n<ul class=\"disc\">\r\n<li>Womens Style <br></li>\r\n<li>Genuine Top Grain Premier Leather <br></li>\r\n<li>Rich Color Tones <br></li>\r\n<li>Straps lined with 2000 lb test nylon <br></li>\r\n<li>Guaranteed for the Life of the Sole - Non-slip sole<br></li>\r\n</ul>'),(338,10,495,0,137,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(339,10,97,0,137,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(340,10,104,0,137,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(341,10,506,0,137,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(342,10,531,0,28,''),(343,10,104,0,134,''),(344,10,531,0,51,''),(345,10,531,0,119,''),(346,10,531,0,126,''),(347,10,531,0,123,''),(348,10,531,0,120,''),(349,10,531,0,83,''),(350,10,531,0,44,''),(351,10,531,0,27,''),(352,10,531,0,39,''),(353,10,531,0,41,''),(354,10,531,0,42,''),(355,10,104,0,138,''),(356,10,531,0,138,''),(357,10,531,0,139,''),(358,10,104,0,140,''),(359,10,97,0,140,'Crucial 2GB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(360,10,506,0,140,'Crucial 2GB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(361,10,531,0,140,''),(362,10,104,0,141,''),(363,10,531,0,141,''),(364,10,531,0,142,''),(365,10,104,0,143,''),(366,10,97,0,143,'Crucial 512MB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(367,10,506,0,143,'Crucial 512MB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(368,10,531,0,143,''),(369,10,104,0,144,'2 Year Warranty - Parts and Labor'),(370,10,97,0,144,'2 Year Extended Warranty - Parts and Labor'),(371,10,506,0,144,'2 Year Extended Warranty - Parts and Labor'),(372,10,531,0,144,''),(373,10,104,0,145,''),(374,10,97,0,145,'Overclocker’s dream! Deliver more sophisticated solutions with the leading-edge technology of AMD Phenom™ 9000 Series processor. Built from the ground up for true quad-core performance, AMD Phenom 9000 Series processors incorporate a unified high-speed L3 cache and high-speed DDR2 memory. Speed through complex multitasking, critical business productivity, advanced visual design and modeling and visually stunning digital media and entertainment. Whether it\'s a single solution or an enterprise system, AMD Phenom processors have the power to perform.'),(375,10,531,0,145,''),(376,10,531,0,146,''),(377,10,500,0,147,'22\"'),(378,10,104,0,147,''),(379,10,97,0,147,'The wide, 16:10 format of SAMSUNG\'s 226BW digital/Analog widescreen LCD monitor gives you plenty of room for all your computer applications and multiple images. DC 3000:1 contrast ratio creates crisp, easy-to-view images and gaming graphics, without ghosting or blurring. Complete with Microsoft® Vista® Premium certification and advanced dual interface for both analog digital video signals, the 226BW monitor is future-ready.'),(380,10,506,0,147,'The wide, 16:10 format of SAMSUNG\'s 226BW digital/Analog widescreen LCD monitor gives you plenty of room for all your computer applications and multiple images. DC 3000:1 contrast ratio creates crisp, easy-to-view images and gaming graphics, without ghosting or blurring. Complete with Microsoft® Vista® Premium certification and advanced dual interface for both analog digital video signals, the 226BW monitor is future-ready.'),(381,10,531,0,147,''),(382,10,104,0,148,''),(383,10,97,0,148,'Frustrated by staring at the hourglass icon as soon as you try to work on more than three programs at once, especially when you’re working with digital media? Increase your performance with the AMD Athlon™ 64 X2 dual core processor. Work or play with multiple programs without any stalling or waiting. Dual-core technology is like having two processors, and two working together is better and faster than one working alone. Do more in less time with the AMD Athlon 64 X2 dual-core processor.'),(384,10,506,0,148,'AMD Athlon 64 X2 3800+ Processor ADO3800IAA5CZ - 2.0GHz, 2 x 512KB Cache, 1000MHz (2000 MT/s) FSB, Windsor, Dual Core, OEM, Socket AM2, Processor'),(385,10,531,0,148,''),(386,10,499,0,149,'1 TB'),(387,10,104,0,149,''),(388,10,97,0,149,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(389,10,506,0,149,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(390,10,531,0,149,''),(391,10,499,0,150,'500 GB'),(392,10,531,0,150,''),(393,10,506,0,151,'Intel® Core™2 Duo processor is the new brand name for our next-generation energy-efficient performance desktop and mobile processors.'),(394,10,531,0,151,''),(395,10,500,0,152,'24\"'),(396,10,104,0,152,''),(397,10,97,0,152,'With ultrafine 10,000:1 contrast and wide 170° viewing angles, this 24\" widescreen LCD monitor delivers crystal-clear high-definition visuals for gaming and work projects. The DVI-D input lets you connect a DVD player or other digital video device.\r\n\r\nProduct Features:\r\n    * Ultrafast 5 ms response time\r\n    * Digital Fine 10,000:1 contrast ratio; 400 cd/m² brightness\r\n    * 1920 x 1200 maximum resolution; wide 170° horizontal and vertical viewing angles\r\n'),(398,10,506,0,152,'5 ms response time; 10,000:1 contrast ratio; 400 cd/m² brightness; 1920 x 1200 maximum resolution; DVI-D and 15-pin D-sub inputs'),(399,10,506,0,153,'Intel Core 2 Extreme QX9775 Processor BX80574QX9775 - 45nm, 3.20GHz, 12MB Cache, 1600MHz FSB, Yorkfield XE, Quad-Core, Retail, Socket 771, Processor'),(400,10,104,0,154,''),(401,10,97,0,154,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(402,10,506,0,154,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(403,10,531,0,154,''),(404,10,499,0,155,'5400 rpm'),(405,10,104,0,155,''),(406,10,500,0,156,'19\"'),(407,10,506,0,156,'2 ms response time; 10,000:1 contrast ratio; 300 cd/m² brightness; 1440 x 900 maximum resolution; DVI-D and 15-pin D-sub inputs'),(408,10,531,0,156,''),(409,10,500,0,157,'30\"'),(410,10,104,0,157,''),(411,10,97,0,157,'    * Digital (DVI), USB 2.0 and FireWire 400 inputs\r\n    * Cinema HD delivers up to 16.7 million colors across a wide gamut for a breathtaking, vivid picture\r\n    * ColorSync technology lets you create a custom profile to maintain consistent colors on the screen and in print\r\n    * Single cable with breakout for DVI, USB and FireWire ports provides a tidy look while reducing clutter\r\n    * Built-in, 2-port USB 2.0 hub to easily connect peripheral devices\r\n    * User controls allow you to monitor display power, system sleep/wake, brightness and monitor tilt\r\n    * Antiglare, hard-coat screen treatment\r\n    * Wall-mountable with optional mounting kit (not included)\r\n    * ENERGY STAR compliance assures a high standard of energy efficiency\r\n'),(412,10,506,0,157,'Computer games, digital photo editing and graphic applications will astound you on this huge 30\" flat-panel monitor. Cinema HD and ColorSync technology let you enjoy 16.7 million breathtaking colors and custom profiling for color consistency.'),(413,10,97,0,158,' <ul>\r\n<ul class=\"disc\">\r\n<li>Processor: The Ultra Low Voltage Intel Core Solo U1500 processor offers a 1.33 GHz speed paired with a fast 533 MHz front-side bus and large 2 MB L2 cache. (An L2, or secondary, cache temporarily stores data; and a larger L2 cache can help speed up your system\'s performance. The FSB carries data between the CPU and RAM, and a faster front-side bus will deliver better overall performance.) The Core Solo processor delivers enhanced performance for today\'s demanding applications such as CAD tools, 3-D and 2-D modeling, video editing, digital music, digital photography and gaming. And Intel\'s Smart Cache technology enables smarter, more efficient cache and bus design for enhanced performance, responsiveness and power savings.</li>\r\n</ul>\r\n'),(414,10,97,0,159,'The most comfortable ergonomic keyboard on the market! We just made a great deal for this Microsoft Natural ergonomic keyboard. And we know you’re going to love it. This newest addition to the world’s best selling line of ergonomic keyboards features a natural wrist alignment that will make your day! Just one touch allows you to perform a wealth of common but important tasks such as opening documents and replying to e-mail. The Microsoft Natural Model 4000 ergonomic keyboard also features an improved number pad with easy-to-reach symbols such left and right, equal sign and back space placed just above the number pad. Easy-access to the Internet. Multimedia keys. Lockable F keys and much more (see complete list of additional features below). Don’t you think it’s time to go natural? Microsoft’s Natural Ergonomic Model 4000 Keyboard. Available right here, for the best price!'),(415,10,506,0,159,'The most comfortable ergonomic keyboard on the market! We just made a great deal for this Microsoft Natural ergonomic keyboard.'),(416,10,531,0,159,''),(417,10,104,0,160,''),(418,10,97,0,160,'Our most advanced trackball yet: a comfortable, cordless, finger-operated trackball that works where you need it. Save space and eliminate desktop clutter. Take advantage of extra buttons that help you navigate around Windows and the web more easily. And with Logitech\'s patented optical technology, you get virtually maintenance-free precision and smooth tracking.'),(419,10,506,0,160,'Our most advanced trackball yet. It\'s comfortable, cordless, finger-operated and works where you need it. Save space and eliminate desktop clutter.'),(420,10,531,0,160,''),(421,10,104,0,161,''),(422,10,97,0,161,'PerfectStroke key system for the ultimate keyboard feel. Bluetooth wireless and Li-Ion powered. Stylishly sleek with its elegant charging base and backlit controls, the diNovo Edge makes a bold statement.\r\n\r\nAn ideal partner for any high-end computer, the ultra-slim Logitech diNovo Edge delivers the ultimate in feel and response. The revolutionary TouchDisc with hyper-speed scrolling and pixel-perfect control makes trackpads obsolete. A slim recharging base doubles as a keyboard stand. Work longer thanks to the longer-lasting Li-Ion batteries, and more securely via Bluetooth wireless technology. Combine it with the world\'s most advanced mouse, the Logitech MX Revolution, for a premium desktop experience!'),(423,10,506,0,161,'PerfectStroke key system for the ultimate keyboard feel. Bluetooth wireless and Li-Ion powered.'),(424,10,531,0,161,''),(425,10,104,0,162,''),(426,10,97,0,162,'Experience smoother tracking and wireless freedom. Navigate with enhanced precision with this ergonomic High Definition Optical mouse. Easily enlarge and edit detail with the new Magnifier and enjoy more than six months of battery life. '),(427,10,506,0,162,'Experience smoother tracking and wireless freedom. Navigate with enhanced precision with this ergonomic High Definition Optical mouse.'),(428,10,531,0,162,''),(429,10,531,0,25,''),(430,10,104,0,163,''),(431,10,97,0,163,'Make a computer'),(432,10,506,0,163,'Make a computer'),(433,10,531,0,163,''),(434,10,104,0,164,''),(435,10,97,0,164,'Make a computer'),(436,10,506,0,164,'Make a computer'),(437,10,531,0,164,''),(438,10,104,0,165,''),(439,10,506,0,165,'test description'),(440,10,97,0,165,'test description'),(441,10,531,0,165,''),(442,10,495,0,166,'HTC Touch Diamond'),(443,10,104,0,166,''),(444,10,506,0,166,'Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.'),(445,10,97,0,166,'Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.\r\n\r\nFeaturing a sharp 2.8-inch touch screen housed within a stunning formation of brushed metal and flawless faceted edges, the HTC Touch Diamond is as beautiful to behold as it is to use.\r\n\r\nWith HTC’s vibrant touch-responsive user interface, TouchFLO™ 3D, and ultra-fast HSDPA internet connectivity… the HTC Touch Diamond offers a rich online experience to rival a notebook computer, allowing you to interact with Google, YouTube, and Wikipedia as freely as you would with a broadband connection.\r\n\r\nYour contacts, favourite music, videos and photos are no longer an uninspired line of text. With TouchFLO 3D, album artwork, video stills and snapshots of your friends’ and family’s faces are brought to life for you to interact, play and launch at your fingertips.\r\n\r\nA 3.2 megapixel auto-focus camera will help you capture the perfect moment in style and with a massive 4GB of internal storage you can keep all the files you need. The integrated ultra-sensitive GPS will help you find your destination as quickly and efficiently as a dedicated satellite navigation unit.\r\n\r\nStyle and substance in a phone are no longer mutually exclusive. The HTC Touch Diamond has arrived.'),(446,10,492,0,166,'Re-defining the perception of advanced mobile phones… the HTC Touch Diamond™ signals a giant leap forward in combining hi-tech prowess with intuitive usability and exhilarating design.\r\n\r\nFeaturing a sharp 2.8-inch touch screen housed within a stunning formation of brushed metal and flawless faceted edges, the HTC Touch Diamond is as beautiful to behold as it is to use.\r\n\r\nWith HTC’s vibrant touch-responsive user interface, TouchFLO™ 3D, and ultra-fast HSDPA internet connectivity… the HTC Touch Diamond offers a rich online experience to rival a notebook computer, allowing you to interact with Google, YouTube, and Wikipedia as freely as you would with a broadband connection.\r\n\r\nYour contacts, favourite music, videos and photos are no longer an uninspired line of text. With TouchFLO 3D, album artwork, video stills and snapshots of your friends’ and family’s faces are brought to life for you to interact, play and launch at your fingertips.\r\n\r\nA 3.2 megapixel auto-focus camera will help you capture the perfect moment in style and with a massive 4GB of internal storage you can keep all the files you need. The integrated ultra-sensitive GPS will help you find your destination as quickly and efficiently as a dedicated satellite navigation unit.\r\n\r\nStyle and substance in a phone are no longer mutually exclusive. The HTC Touch Diamond has arrived.'),(447,10,494,0,166,'102 mm (L) X 51 mm (W) X 11.35 mm (T)'),(448,10,496,0,166,''),(449,10,531,0,166,''),(450,10,531,0,108,''),(451,10,531,0,94,''),(452,10,531,0,30,''),(453,10,531,0,95,''),(454,10,531,0,96,''),(455,10,531,0,97,''),(456,10,531,0,93,''),(457,10,531,0,35,''),(458,10,531,0,117,''),(459,10,531,0,32,''),(460,10,531,0,110,''),(461,10,531,0,109,''),(462,10,531,0,111,''),(463,10,531,0,36,''),(464,10,531,0,137,''),(465,10,531,0,38,''),(466,10,531,0,128,''),(467,10,531,0,130,''),(468,10,531,0,127,''),(469,10,531,0,129,''),(470,10,531,0,131,''),(471,10,531,0,37,''),(472,10,531,0,124,''),(473,10,531,0,125,''),(474,10,531,0,122,''),(475,10,531,0,121,''),(476,10,531,0,29,''),(477,10,531,0,84,''),(478,10,531,0,86,''),(479,10,531,0,85,''),(480,10,531,0,87,''),(481,10,531,0,88,''),(482,10,531,0,89,''),(483,10,531,0,90,''),(484,10,531,0,91,''),(485,10,531,0,92,''),(486,10,531,0,100,''),(487,10,531,0,101,''),(488,10,531,0,102,''),(489,10,531,0,99,''),(490,10,531,0,34,''),(491,10,531,0,104,''),(492,10,531,0,31,''),(493,10,531,0,105,''),(494,10,531,0,106,''),(495,10,531,0,107,''),(496,10,531,0,113,''),(497,10,531,0,114,''),(498,10,531,0,115,''),(499,10,531,0,33,''),(500,10,531,0,74,''),(501,10,531,0,79,''),(502,10,531,0,75,''),(503,10,531,0,80,''),(504,10,531,0,81,''),(505,10,531,0,82,''),(506,10,531,0,49,''),(507,10,531,0,135,''),(508,10,531,0,112,''),(509,10,531,0,103,''),(510,10,531,0,98,''),(511,10,531,0,16,''),(512,10,531,0,17,''),(513,10,531,0,18,''),(514,10,531,0,19,''),(515,10,531,0,20,''),(516,10,531,0,45,''),(517,10,531,0,46,''),(518,10,531,0,47,''),(519,10,531,0,48,''),(520,10,494,0,52,''),(521,10,531,0,52,''),(522,10,494,0,53,''),(523,10,531,0,53,''),(524,10,494,0,54,''),(525,10,531,0,54,''),(526,10,104,0,132,''),(527,10,531,0,132,''),(528,10,492,0,30,'# I.G.S.?: Allows for natural foot movement from heel strike to toe-off\r\n# DuoMax? Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off\r\n# Space Trusstic System?: Allows for greater midsole deformation and more efficient foot function\r\n# GEL? Cushioning System: Provides maximum rearfoot/forefoot shock attenuation\r\n# Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation'),(529,10,104,0,30,'ASICS® Men\'s GEL-Kayano® XII '),(530,10,495,0,31,'B000NOGIKY'),(531,10,97,0,31,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe. It also features smooth linings, a fully cushioned insole, a sexy covered stiletto heel, and a lightly textured dress leather outsole. Any way you wear the Pryme, you\'re certain to catch a lot of attention.'),(532,10,492,0,31,'A prime example of chic style. Patent leather upper. Round toe. 3-1/2 inch covered heel. Flex leather sole. Imported. '),(533,10,104,0,31,'Steven by Steve Madden Pryme Pump'),(534,10,492,0,33,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(535,10,104,0,33,'ECCO Womens Golf Flexor Golf Shoe'),(536,10,495,0,34,'B000IKC6AY'),(537,10,97,0,34,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(538,10,492,0,34,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(539,10,104,0,34,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(540,10,495,0,37,'The Only Children: Paisley T-Shirt'),(541,10,97,0,37,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Double-needle sleeves and bottom hem'),(542,10,104,0,37,'The Only Children: Paisley T-Shirt'),(543,10,495,0,38,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(544,10,97,0,38,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(545,10,104,0,38,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(546,10,509,0,42,'Bamboo'),(547,10,97,0,42,'Entirely handcrafted of solid Bamboo. Designed for use with a mattress alone, it includes a sturdy, padded wood platform for comfort and proper mattress support.'),(548,10,104,0,42,'bamboo, barcelona, platform, bed'),(549,10,495,0,44,'Rebel XT '),(550,10,494,0,44,'5 x 3.7 x 2.5 inches'),(551,10,97,0,44,'The Canon EOS Digital Rebel camera now has a new, faster, even smaller big brother. Sibling rivalries aside, the 8.0-megapixel Canon EOS Digital Rebel XT SLR adds resolution, speed, extra creative control, and enhanced comfort in the hand to one of the smallest and lightest digital cameras in its class. Even with its advancements in ergonomic design and technology, this easy-to-use EOS digital camera is compatible with all of Canon\'s EF lenses, including the EF-S lenses.'),(552,10,506,0,33,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(553,10,506,0,32,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(554,10,506,0,31,'Nothing will turn his head faster than you wearing the sexy Pryme pump from Steven by Steve Madden. This daring pump has a pretty patent leather upper with light shirring, a double stitch detail surrounding the collar, and a vampy almond shaped toe'),(555,10,506,0,29,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(556,10,506,0,28,'Get the competitive edge with the Gateway M285-E. This widescreen Convertible Notebook functions as both a conventional notebook and a tablet.'),(557,10,506,0,27,'Take a load off your shoulders when you\'re racing for your plane with the sleekly designed and ultra-portable Sony Vaio VGN-TXN27N/B notebook PC.'),(558,10,506,0,26,'This exclusive edition is another striking symbol of cooperation between Acer and Ferrari -- two progressive companies with proud heritages built on passion, innovation, power and success'),(559,10,506,0,25,'You\'ve seen improvements in notebook performance before - but never on this scale. The Intel Core Duo powering MacBook Pro is actually two processors built into a single chip.'),(560,10,506,0,20,'The MM-A900m offers great-looking design with the ability to download a rich selection of content directly to the phone. '),(561,10,506,0,45,'The Argus QC-2185 Quick Click 5MP digital camera offers all the basic features you need in a compact and stylish digital camera. This unit is easy to use, and is perfect for those who want a completely portable option for taking good pictures, without having to empty their wallet.'),(562,10,506,0,46,'A technically sophisticated point-and-shoot camera offering a number of pioneering technologies such as Dual Image Stabilization, Bright Capture Technology, and TruePic Turbo, as well as a powerful 5x optical zoom.'),(563,10,506,0,47,'Replacing the highly popular PowerShot A620, the PowerShot A630 features a rotating 2.5-inch vari-angle LCD, 4x optical zoom lens, and a vast array of creative shooting modes.'),(564,10,506,0,48,'Small on size. Big on value. Kodak\'s newest C-Series digital camera, the C530, sports awesome features'),(565,10,506,0,49,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(566,10,506,0,51,'With durable solid wood framing, generous padding and plush stain-resistant microfiber upholstery.'),(567,10,506,0,52,'Combining a hint of nostalgia with the up-to-date sensibility and function of modern chairs. It is in soft, velvety microfiber.'),(568,10,506,0,53,'For a sleek, simple and stylish piece, look no further than the Magento sofa - or sofabed!'),(569,10,104,0,75,'womens, sandal, leather, anashria, '),(570,10,506,0,75,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(571,10,495,0,79,'B000KJ43SG'),(572,10,97,0,79,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(573,10,492,0,79,'Womens Premier Leather Single Layer Narrow Strap - '),(574,10,104,0,79,'womens, sandal, leather, anashria, '),(575,10,506,0,79,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(576,10,495,0,80,'B000KJ43SG'),(577,10,97,0,80,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(578,10,97,0,82,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(579,10,492,0,82,'Womens Premier Leather Single Layer Narrow Strap - '),(580,10,104,0,82,'womens, sandal, leather, anashria, '),(581,10,506,0,82,'Womens Premier Leather Single Layer Narrow Strap - NEW Colors Available - Womens Style - Genuine Top Grain Premier Leather - Rich Color Tones - Straps lined with 2000 lb test nylon - Guaranteed for the Life of the Sole - Non-slip sole - Note: Rainbow is in the process of unveiling a new toe post tag that is much smaller than the original tag.'),(582,10,495,0,83,'B000JI2N0I'),(583,10,104,0,83,'cn, clogs, outdoor, shoes, sandals, comfortable'),(584,10,506,0,83,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(585,10,97,0,83,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(586,10,492,0,83,'<ul>\r\n<ul class=\"disc\">\r\n<li>Made of EVA foam<br></li>\r\n<li>Heel strap keeps shoe on foot<br></li>\r\n<li>Non-marking, slip-resistant outsole<br></li>\r\n<li> Weigh just 6-10 ounces<br></li>\r\n'),(587,10,506,0,84,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(588,10,495,0,85,'B000JI2N0I'),(589,10,97,0,85,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(590,10,492,0,85,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(591,10,492,0,86,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(592,10,104,0,86,'CN Clogs Beach/Garden Clog '),(593,10,506,0,86,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(594,10,495,0,87,'B000JI2N0I'),(595,10,495,0,88,'B000JI2N0I'),(596,10,97,0,88,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(597,10,492,0,88,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(598,10,104,0,88,'CN Clogs Beach/Garden Clog '),(599,10,104,0,89,'CN Clogs Beach/Garden Clog '),(600,10,506,0,89,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(601,10,495,0,90,'B000JI2N0I'),(602,10,97,0,90,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(603,10,97,0,91,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear. Wear them either at the beach, in your garden, at the mall or just about anywhere you would want to be comfortable.'),(604,10,492,0,91,'    * Made of EVA foam\r\n    * Heel strap keeps shoe on foot\r\n    * Non-marking, slip-resistant outsole\r\n    * Weigh just 6-10 ounces\r\n\r\n'),(605,10,104,0,91,'CN Clogs Beach/Garden Clog '),(606,10,506,0,91,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(607,10,506,0,92,'Comfortable and fun to wear these clogs are the latest trend in fashion footwear'),(608,10,495,0,93,'B000CP1M00'),(609,10,104,0,93,'asics, gel, kayano'),(610,10,506,0,93,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. '),(611,10,97,0,94,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. Solyte midsole material is lighter than standard EVA and SpEVA® combined with improved cushioning and durability. Impact Guidance System (I.G.S.®) uses linked componentry to encourage optimal gait while allowing for natural foot movement from heel strike to toe off. DuoMax® support system helps ensure that the shoe maintains proper support for the foot during the critical transition from heel strike to toe off. Space Trusstic® System creates a pocket between the Trusstic® System device and the midsole, allowing for greater midsole deformation and more efficient foot function. GEL® Cushioning System provides maximum rearfoot and forefoot shock attenuation. Wt. 12.6 oz.'),(612,10,492,0,94,'# I.G.S.?: Allows for natural foot movement from heel strike to toe-off\r\n# DuoMax? Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off\r\n# Space Trusstic System?: Allows for greater midsole deformation and more efficient foot function\r\n# GEL? Cushioning System: Provides maximum rearfoot/forefoot shock attenuation\r\n# Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation'),(613,10,104,0,94,'ASICS® Men\'s GEL-Kayano® XII '),(614,10,492,0,95,'# I.G.S.?: Allows for natural foot movement from heel strike to toe-off\r\n# DuoMax? Support System: Maintains proper support for the foot during the critical transition from heel strike to toe-off\r\n# Space Trusstic System?: Allows for greater midsole deformation and more efficient foot function\r\n# GEL? Cushioning System: Provides maximum rearfoot/forefoot shock attenuation\r\n# Biomorphic Fit Upper: Provides enhanced upper fit and comfort while limiting irritation'),(615,10,104,0,95,'ASICS® Men\'s GEL-Kayano® XII '),(616,10,506,0,95,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(617,10,104,0,96,'ASICS® Men\'s GEL-Kayano® XII '),(618,10,506,0,96,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(619,10,495,0,97,'B000CP1M00'),(620,10,506,0,97,'The ASICS® GEL-Kayano® XII running shoe delivers the ultimate blend of cushioning and support. Biomorphic Fit™ upper offers enhanced upper fit and comfort while decreasing the potential for irritation. '),(621,10,495,0,98,'B000IKC6AY'),(622,10,104,0,98,'Kenneth Cole, New York, Men\'s, Con-verge, Slip-on'),(623,10,506,0,98,'Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe.'),(624,10,97,0,98,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(625,10,492,0,98,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(626,10,495,0,99,'B000IKC6AY'),(627,10,97,0,99,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(628,10,492,0,99,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(629,10,97,0,100,'High fashion and classic good looks converge in this suave slip on from Kenneth Cole. Smooth leather upper in a dress slip on style, with a stitched and covered seam moc-inspired square toe, quarter panel curved overlays and flared tongue with side elastic panels for a comfortable, secure fit. Smooth leather lining, cushioned leather topped insole. Dress midsole with a beveled edge, 1 inch capped dress heel. Flat traction outsole.'),(630,10,492,0,100,'The handsome style of the Con-Verge slip-on from Kenneth Cole New York is larger than life. This sharp shoe has a semi-polished smooth leather upper, a squared off stitched apron toe, and dual-goring for easy on/off accessibility. It also features soft leather linings, a cushioned insole, and a paneled rubber outsole for a sturdy step. The Con-Verge is a perfect companion to your business and special occasion wardrobes.'),(631,10,104,0,100,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(632,10,492,0,110,'The perfect pump will suit any ensemble. Leather upper. 3-3/4 inch stacked heel. Man-made sole. Imported. '),(633,10,104,0,110,'Nine West Women\'s Lucero Pump '),(634,10,506,0,110,'The Lucero pump from Nine West may just leave him at a loss for words. This flirty pump has a leather upper, a pretty almond-shaped toe with a slight V-cut vamp'),(635,10,495,0,111,'B000LJQVF8'),(636,10,492,0,111,'The perfect pump will suit any ensemble. Leather upper. 3-3/4 inch stacked heel. Man-made sole. Imported. '),(637,10,104,0,111,'Nine West Women\'s Lucero Pump '),(638,10,97,0,113,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(639,10,492,0,113,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(640,10,104,0,113,'ECCO Womens Golf Flexor Golf Shoe'),(641,10,506,0,113,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links.'),(642,10,97,0,114,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(643,10,492,0,114,'Featuring a wide toe box and delivering optimum support, the sporty Golf Flexor golf shoe is a stylish cleat that you\'ll love wearing on and off the links. The contrasting embossed snakeskin panels attract interest, while the laid back lace-up style keeps things simple. And thanks to the one-year waterproof guarantee, you can trust these shoes to keep you in the game, even when conditions are less than perfect.'),(644,10,495,0,127,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(645,10,97,0,127,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(646,10,506,0,127,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(647,10,495,0,128,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(648,10,97,0,128,'# 6.1 oz. 100% preshrunk heavyweight cotton \r\n# Shoulder-to-shoulder taping\r\n# Double-needle sleeves and bottom hem'),(649,10,104,0,131,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(650,10,506,0,131,'Printed on American Apparel Classic style 5495 California t-shirts.  '),(651,10,506,0,133,'A stylish digital camera demands stylish protection. This leather carrying case will defend your camera from the dings and scratches of travel and everyday use while looking smart all the time.'),(652,10,97,0,132,'Sturdy, lightweight tripods are designed to meet the needs of amateur and professional photographers and videographers.'),(653,10,506,0,132,'Sturdy, lightweight tripods are designed to meet the needs of amateur and professional photographers and videographers.'),(654,10,494,0,26,''),(655,10,531,0,26,''),(656,10,531,0,134,''),(657,10,531,0,118,''),(658,10,494,0,51,''),(659,10,97,0,138,'This superb, multi-functional Aspire X-Cruiser mid tower case is designed to follow Intel\'s recommendations to achieve the highest level of thermal performance. This gorgeous case outperforms most of the expensive chassis in the market, boasts an abundance of innovative features, yet carries a very affordable price tag. The Aspire X-Cruiser is fully loaded with everything you could possibly imagine that a great gaming case could have. With a built-in air duct on the side panel to funnel cool air towards the CPU, the fan-less X-Cruiser is specially designed to bring out the best performance in systems based on high-end processors.'),(660,10,506,0,138,'This magnificent new case features 2 x 80mm built-in fans with space for 2 optional fans. The Aspire X-Cruiser features front temperature gauge, front fan speed controller and gauge, and front volume controller and gauge. It also features USB2.0, Firewire and audio ports. The superior cooling solution that X-Cruiser delivers can only be found in very few of the expensive chassis in the market.'),(661,10,104,0,139,''),(662,10,97,0,139,'Introducing the next advancement in case design and technology, the Lexa. Designed from ground up to be symmetrical, the Lexa is representative of the modern lifestyle design cues of today. The Lexa\'s minimalist and classy design fits perfectly under the NZXT Classic Series line.'),(663,10,506,0,139,'The Lexa boasts a ridgid, but light weight aluminum chassis. The Lexa\'s high-air-flow design, while quiet, ensures cooling options for the more ambitious computing enthusiasts. Three thermal probes provide temperature readings to the illuminated LCD display for monitoring your systems core components. The Lexa ships with a rugged carrying strap with protective window cover for easy single-handed transportation.'),(664,10,97,0,141,'Crucial 1024MB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(665,10,506,0,141,'Crucial 1024MB PC4200 DDR2 533MHz Memory\r\nCrucial Technologies is part of Micron, the largest DRAM manufacturer in the U.S. and one of the largest in the world. Because they actually manufacture memory, they have unparalleled expertise in the upgrade industry. Crucial is the only consumer memory upgrade supplier that is part of a major DRAM manufacturer.\r\n\r\nEvery single Crucial memory module is tested before it goes out their doors. Crucial chips are individually tested under varying temperatures, voltages, and operational conditions for performance and functionality. '),(666,10,104,0,142,'1 Year Warranty - Parts and Labor'),(667,10,97,0,142,'1 Year Extended Warranty - Parts and Labor'),(668,10,506,0,142,'1 Year Extended Warranty - Parts and Labor'),(669,10,506,0,145,'Deliver more sophisticated solutions with the leading-edge technology of AMD Phenom™ 9000 Series processor.'),(670,10,104,0,146,'3 Year Warranty - Parts and Labor'),(671,10,97,0,146,'3 Year Extended Warranty - Parts and Labor'),(672,10,506,0,146,'3 Year Extended Warranty - Parts and Labor'),(673,10,104,0,150,''),(674,10,97,0,150,'500GB- 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(675,10,506,0,150,'500GB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(676,10,104,0,151,''),(677,10,97,0,151,'Intel® Core™2 Duo processor is the new brand name for our next-generation energy-efficient performance desktop and mobile processors. Formerly known by their codenames Conroe and Merom, the Intel® Core™2 processors for desktop and mobile computers are based on the Intel® Core™ microarchitecture, Intel\'s new industry-leading foundation for all mobile, desktop and server platforms moving forward.'),(678,10,531,0,152,''),(679,10,104,0,153,''),(680,10,97,0,153,'The new Intel® Core™2 Extreme processor QX9775 with hafnium-infused chip design delivers unrivaled gaming performance1 with four independent processing cores, 12 MB of cache, 1600 MHz Front Side Bus, and clock speeds of 3.2 GHz.The Intel® Core™2 Extreme processor is the world’s first quad core desktop processor, delivering the latest in cutting-edge processor technology and unprecedented performance across a wide range of applications and benchmarks. All Intel Core 2 Extreme processor QX9000 series are based on the industry-leading 45nm manufacturing technology, providing another giant leap forward on the road to multi-core and parallel computing.'),(681,10,531,0,153,''),(682,10,499,0,154,'5400 rpm'),(683,10,97,0,155,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(684,10,506,0,155,'1 TB - 7200RPM, SATA 3.0Gb/s, 32MB Cache'),(685,10,531,0,155,''),(686,10,104,0,156,''),(687,10,97,0,156,'Experience smooth gaming visuals and crystal-clear video with this 19\" flat-panel LCD monitor that features an ultrafast 2 ms response time and sharp 10,000:1 contrast. The DVI-D with HDCP input lets you connect a DVD player or other digital video device.\r\nProduct Features\r\n\r\n    * Ultrafast 2 ms response time\r\n    * Digital Fine 10,000:1 contrast ratio; 300 cd/m² brightness\r\n    * 1440 x 900 maximum resolution; wide 170° horizontal and vertical viewing angles\r\n'),(688,10,531,0,157,''),(689,10,104,0,158,'Sony, VAIO, VGN-TXN27N/B , Notebook, PC, Intel, 2 GB RAM, '),(690,10,506,0,158,'Weighing in at just an amazing 2.84 pounds and offering a sleek, durable carbon-fiber case in charcoal black. And with 4 to 10 hours of standard battery life, it has the stamina to power you through your most demanding applications. With the integrated wireless WAN, you can access the national Sprint Mobile Broadband service to extend your wireless coverage beyond LAN access networks and hotspots, giving you the freedom to go farther, do more, and stay connected.\r\n\r\n'),(691,10,531,0,158,''),(692,10,104,0,159,'');
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_tier_price`
--
DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `all_groups` tinyint(1) unsigned NOT NULL default '1',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '1.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_catalog_product_entity_tier_price_group` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_catalog_product_entity_tier_price_group` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_tier_price`
--
LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_tier_price` VALUES (1,44,1,0,'2.0000','449.0000',0),(2,123,1,0,'5.0000','90.0000',0),(3,123,1,0,'10.0000','80.0000',0),(4,123,1,0,'20.0000','70.0000',0),(5,120,1,0,'5.0000','21.0000',0),(6,120,1,0,'10.0000','20.0000',0),(7,120,1,0,'20.0000','18.0000',0),(8,126,1,0,'5.0000','12.5000',0),(9,126,1,0,'10.0000','11.5000',0),(10,126,1,0,'20.0000','9.5000',0);
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_entity_varchar`
--
DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` mediumint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1278 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_entity_varchar`
--
LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (1,10,96,0,16,'Nokia 2610 Phone'),(2,10,102,0,16,'20'),(3,10,481,0,16,'nokia-2610-phone'),(4,10,103,0,16,'Nokia 2610'),(5,10,105,0,16,'Offering advanced media and calling features without breaking the bank, The Nokia 2610 is an easy to use'),(6,10,106,0,16,'/n/o/nokia-2610-phone-2.jpg'),(7,10,109,0,16,'/n/o/nokia-2610-phone-2.jpg'),(8,10,493,0,16,'/n/o/nokia-2610-phone-2.jpg'),(9,10,96,0,17,'BlackBerry 8100 Pearl'),(10,10,102,0,17,'21'),(11,10,481,0,17,'blackberry-8100-pearl'),(12,10,103,0,17,'BlackBerry 8100 Pearl'),(13,10,105,0,17,'BlackBerry 8100 Pearl sports a large 240 x 260 screen that supports over 65,000 colors-- plenty of real estate to view your e-mails, Web browser content, messaging sessions, and attachments.'),(14,10,493,0,17,'/b/l/blackberry-8100-pearl-2.jpg'),(15,10,109,0,17,'/b/l/blackberry-8100-pearl-2.jpg'),(16,10,106,0,17,'/b/l/blackberry-8100-pearl-2.jpg'),(17,10,96,0,18,'Sony Ericsson W810i'),(18,10,102,0,18,'2'),(19,10,481,0,18,'sony-ericsson-w810i'),(20,10,103,0,18,'Sony Ericsson W810i'),(21,10,105,0,18,'The W810i follows a long tradition of beautifully designed and crafted phones from Sony Ericsson. The same candy-bar style that graced the W800 is here, as is the horizontally-oriented camera unit on the back of the phone, allowing you to hold the phone j'),(22,10,493,0,18,'/s/o/sony-ericsson-w810i-2.jpg'),(23,10,109,0,18,'/s/o/sony-ericsson-w810i-2.jpg'),(24,10,106,0,18,'/s/o/sony-ericsson-w810i-2.jpg'),(25,10,96,0,20,'Samsung MM-A900M Ace'),(26,10,102,0,20,'3'),(27,10,481,0,20,'samsung-mm-a900m-ace'),(28,10,103,0,20,'Samsung MM-A900M Ace Phone'),(29,10,105,0,20,'New services supported by both the MM-A900m include the newly announced Sprint Music StoreSM, which allows users to immediately buy and download complete songs directly to their phone'),(30,10,493,0,20,'/s/a/samsung-mm-a900m-ace.jpg'),(31,10,109,0,20,'/s/a/samsung-mm-a900m-ace.jpg'),(32,10,106,0,20,'/s/a/samsung-mm-a900m-ace.jpg'),(33,10,96,0,25,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC'),(34,10,481,0,25,'apple-macbook-pro-ma464ll-a-15-4-notebook-pc-2-0-ghz-intel-core-duo-1-gb-ram-100-gb-hard-drive-superdrive'),(35,10,103,0,25,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive)'),(36,10,105,0,25,'Apple MacBook Pro MA464LL/A 15.4\" Notebook PC (2.0 GHz Intel Core Duo, 1 GB RAM, 100 GB Hard Drive, SuperDrive)'),(37,10,493,0,25,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(38,10,109,0,25,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(39,10,106,0,25,'/a/p/apple-macbook-pro-ma464ll-a-15-4-notebook-pc.jpg'),(40,10,96,0,26,'Acer Ferrari 3200 Notebook Computer PC'),(41,10,481,0,26,'acer-ferrari-3200-notebook-computer-pc'),(42,10,103,0,26,'Acer Ferrari 3200 Notebook Computer PC'),(43,10,105,0,26,'Acer Ferrari 3200 Notebook Computer PC'),(44,10,493,0,26,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(45,10,109,0,26,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(46,10,106,0,26,'/a/c/acer-ferrari-3200-notebook-computer-pc.jpg'),(47,10,96,0,27,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC'),(48,10,481,0,27,'sony-vaio-vgn-txn27n-b-11-1-notebook-pc'),(49,10,103,0,27,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(50,10,105,0,27,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(51,10,493,0,27,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(52,10,109,0,27,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(53,10,106,0,27,'/s/o/sony-vaio-vgn-txn27n-b-11-1-notebook-pc.jpg'),(54,10,96,0,28,'Toshiba M285-E 14\"'),(55,10,481,0,28,'toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium'),(56,10,103,0,28,'Toshiba Satellite A135-S4527 155.4\" Notebook PC (Intel Pentium Dual Core Processor T2080, 1 GB RAM, 120 GB Hard Drive, SuperMulti DVD Drive, Vista Premium)'),(57,10,105,0,28,'Toshiba M285-E 14\" Convertible Notebook PC (Intel Core Duo Processor T2300E, 1 GB RAM, 60'),(58,10,493,0,28,'/t/o/toshiba-m285-e-14.jpg'),(59,10,109,0,28,'/t/o/toshiba-m285-e-14.jpg'),(60,10,106,0,28,'/t/o/toshiba-m285-e-14.jpg'),(61,10,96,0,29,'CN Clogs Beach/Garden Clog'),(62,10,481,0,29,'cn-clogs-beach-garden-clog-3'),(63,10,103,0,29,'CN Clogs Beach/Garden Clog'),(64,10,105,0,29,'CN Clogs Beach/Garden Clog'),(65,10,493,0,29,'/c/n/cn-clogs-beach-garden-clog-4.jpg'),(66,10,109,0,29,'/c/n/cn-clogs-beach-garden-clog-3.jpg'),(67,10,106,0,29,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(68,10,96,0,30,'ASICS® Men\'s GEL-Kayano® XII'),(69,10,481,0,30,'asics-men-s-gel-kayano-xii-8'),(70,10,103,0,30,'ASICS® Men\'s GEL-Kayano® XII'),(71,10,105,0,30,'ASICS® Men\'s GEL-Kayano® XII'),(72,10,493,0,30,'no_selection'),(73,10,109,0,30,'no_selection'),(74,10,106,0,30,'no_selection'),(75,10,96,0,31,'Steven by Steve Madden Pryme Pump'),(76,10,481,0,31,'steven-by-steve-madden-pryme-pump-4'),(77,10,103,0,31,'Steven by Steve Madden Pryme Pump'),(78,10,105,0,31,'Steven by Steve Madden Pryme Pump'),(79,10,493,0,31,'/s/t/steven-by-steve-madden-pryme-pump-4.jpg'),(80,10,109,0,31,'/s/t/steven-by-steve-madden-pryme-pump-3.jpg'),(81,10,106,0,31,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(82,10,96,0,32,'Nine West Women\'s Lucero Pump'),(83,10,481,0,32,'nine-west-women-s-lucero-pump-3'),(84,10,103,0,32,'Nine West Women\'s Lucero Pump'),(85,10,105,0,32,'Nine West Women\'s Lucero Pump'),(86,10,493,0,32,'no_selection'),(87,10,109,0,32,'no_selection'),(88,10,106,0,32,'no_selection'),(89,10,96,0,33,'ECCO Womens Golf Flexor Golf Shoe'),(90,10,481,0,33,'ecco-womens-golf-flexor-golf-shoe-3'),(91,10,103,0,33,'ECCO Womens Golf Flexor Golf Shoe'),(92,10,105,0,33,'ECCO Womens Golf Flexor Golf Shoe'),(93,10,493,0,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-4.jpg'),(94,10,109,0,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-3.jpg'),(95,10,106,0,33,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(96,10,96,0,34,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(97,10,481,0,34,'kenneth-cole-new-york-men-s-con-verge-slip-on-8'),(98,10,103,0,34,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(99,10,105,0,34,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(100,10,493,0,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-4.jpg'),(101,10,109,0,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-3.jpg'),(102,10,106,0,34,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(103,10,96,0,35,'Coalesce: Functioning On Impatience T-Shirt'),(104,10,481,0,35,'coalesce-functioning-on-impatience-t-shirt-small'),(105,10,103,0,35,'Coalesce: Functioning On Impatience T-Shirt'),(106,10,105,0,35,'Coalesce: Functioning On Impatience T-Shirt'),(107,10,493,0,35,'no_selection'),(108,10,109,0,35,'no_selection'),(109,10,106,0,35,'no_selection'),(110,10,96,0,36,'Ink Eater: Krylon Bombear Destroyed Tee'),(111,10,481,0,36,'ink-eater-krylon-bombear-destroyed-tee-sm'),(112,10,103,0,36,'Ink Eater: Krylon Bombear Destroyed Tee'),(113,10,105,0,36,'Ink Eater: Krylon Bombear Destroyed Tee'),(114,10,493,0,36,'no_selection'),(115,10,109,0,36,'no_selection'),(116,10,106,0,36,'no_selection'),(117,10,96,0,37,'The Only Children: Paisley T-Shirt'),(118,10,481,0,37,'the-only-children-paisley-t-shirt-sm'),(119,10,103,0,37,'The Only Children: Paisley T-Shirt'),(120,10,105,0,37,'The Only Children: Paisley T-Shirt'),(121,10,493,0,37,'/t/h/the-only-children-paisley-t-shirt-3.jpg'),(122,10,109,0,37,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(123,10,106,0,37,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(124,10,96,0,38,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(125,10,481,0,38,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-sm'),(126,10,103,0,38,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(127,10,105,0,38,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(128,10,493,0,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-3.jpg'),(129,10,109,0,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(130,10,106,0,38,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(131,10,96,0,19,'AT&T 8525 PDA'),(132,10,481,0,19,'atandt-8525-pda'),(133,10,103,0,19,'AT&T 8525 PDA Phone'),(134,10,105,0,19,'nder the hood, the 8525 features 128MB of embedded memory and 64MB RAM, running on a 400 MHz Samsung processor. Up front, the 240 x 320 LCD touch-screen supports over 65,000 colors, while the rear of the device houses a 2.0 megapixel camera. The design of'),(135,10,493,0,19,'/a/t/at-t-8525-pda-1.jpg'),(136,10,109,0,19,'/a/t/at-t-8525-pda-1.jpg'),(137,10,106,0,19,'/a/t/at-t-8525-pda-1.jpg'),(138,10,96,0,39,'The Get Up Kids: Band Camp Pullover Hoodie'),(139,10,481,0,39,'the-get-up-kids-band-camp-pullover-hoodie'),(140,10,103,0,39,'The Get Up Kids: Band Camp Pullover Hoodie'),(141,10,105,0,39,'The Get Up Kids: Band Camp Pullover Hoodie'),(142,10,493,0,39,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(143,10,109,0,39,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(144,10,106,0,39,'/t/h/the-get-up-kids-band-camp-pullover-hoodie-1.jpg'),(145,10,96,0,41,'Akio Dresser'),(146,10,481,0,41,'akio-dresser'),(147,10,103,0,41,'Akio Dresser'),(148,10,105,0,41,'Our Akio dresser has a solid hardwood frame.  Features include inset panel sides and for spacious drawers and two wicker baskets.'),(149,10,493,0,41,'/a/k/akio-dresser.jpg'),(150,10,109,0,41,'/a/k/akio-dresser.jpg'),(151,10,106,0,41,'/a/k/akio-dresser.jpg'),(152,10,96,0,42,'Barcelona Bamboo Platform Bed'),(153,10,481,0,42,'barcelona-bamboo-platform-bed'),(154,10,103,0,42,'Barcelona Bamboo Platform Bed'),(155,10,105,0,42,'Our Barcelona platform bed captures the spirit and drama of late 20th century design with a variety of subtle details.'),(156,10,493,0,42,'/b/a/barcelona-bamboo-platform-bed.jpg'),(157,10,109,0,42,'/b/a/barcelona-bamboo-platform-bed.jpg'),(158,10,106,0,42,'/b/a/barcelona-bamboo-platform-bed.jpg'),(159,10,102,0,30,'64'),(160,10,96,0,44,'Canon Digital Rebel XT 8MP Digital SLR Camera'),(161,10,102,0,44,'34'),(162,10,481,0,44,'canon-digital-rebel-xt-8mp-digital-slr-camera-with-ef-s-18-55mm-f3-5-5-6-lens-black'),(163,10,103,0,44,'Canon Digital Rebel XT 8MP Digital SLR Camera with EF-S 18-55mm f3.5-5.6 Lens (Black)'),(164,10,105,0,44,'Canon Digital Rebel XT 8MP Digital SLR Camera with EF-S 18-55mm f3.5-5.6 Lens (Black)'),(165,10,493,0,44,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(166,10,109,0,44,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(167,10,106,0,44,'/c/a/canon-digital-rebel-xt-8mp-digital-slr-camera-1.jpg'),(168,10,96,0,45,' Argus QC-2185 Quick Click 5MP Digital Camera'),(169,10,102,0,45,'32'),(170,10,481,0,45,'argus-qc-2185-quick-click-5mp-digital-camera'),(171,10,103,0,45,'Argus QC-2185 Quick Click 2MP Digital Camera'),(172,10,105,0,45,'Argus QC-2185 Quick Click 2MP Digital Camera'),(173,10,493,0,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(174,10,109,0,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(175,10,106,0,45,'/a/r/argus-qc-2185-quick-click-5mp-digital-camera-2.jpg'),(176,10,96,0,46,' Olympus Stylus 750 7.1MP Digital Camera'),(177,10,102,0,46,'33'),(178,10,481,0,46,'olympus-stylus-750-7-1mp-digital-camera'),(179,10,103,0,46,'Olympus Stylus 750 7.1MP Digital Camera with Digital Image Stabilized 5x Optical Zoom and CCD Shift Stabilization (Silver)'),(180,10,105,0,46,'Olympus Stylus 750 7.1MP Digital Camera with Digital Image Stabilized 5x Optical Zoom and CCD Shift Stabilization (Silver)'),(181,10,493,0,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(182,10,109,0,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(183,10,106,0,46,'/o/l/olympus-stylus-750-7-1mp-digital-camera-2.jpg'),(184,10,96,0,47,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(185,10,102,0,47,'34'),(186,10,481,0,47,'canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom'),(187,10,103,0,47,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(188,10,105,0,47,'Canon PowerShot A630 8MP Digital Camera with 4x Optical Zoom'),(189,10,493,0,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(190,10,109,0,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(191,10,106,0,47,'/c/a/canon-powershot-a630-8mp-digital-camera-with-4x-optical-zoom-2.jpg'),(192,10,96,0,48,'Kodak EasyShare C530 5MP Digital Camera'),(193,10,102,0,48,'31'),(194,10,481,0,48,'kodak-easyshare-c530-5mp-digital-camera'),(195,10,103,0,48,'Kodak EasyShare C530 5MP Digital Camera'),(196,10,105,0,48,'Kodak EasyShare C530 5MP Digital Camera'),(197,10,493,0,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(198,10,109,0,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(199,10,106,0,48,'/k/o/kodak-easyshare-c530-5mp-digital-camera-2.jpg'),(200,10,96,0,49,'Anashria Womens Premier Leather Sandal'),(201,10,481,0,49,'anashria-womens-premier-leather-sandal-9'),(202,10,103,0,49,'Anashria Womens Premier Leather Sandal'),(203,10,105,0,49,'Anashria Womens Premier Leather Sandal'),(204,10,493,0,49,'/a/n/anashria-womens-premier-leather-sandal-4.jpg'),(205,10,109,0,49,'/a/n/anashria-womens-premier-leather-sandal-3.jpg'),(206,10,106,0,49,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(207,10,96,0,51,'Ottoman'),(208,10,481,0,51,'ottoman'),(209,10,103,0,51,'Ottoman'),(210,10,105,0,51,'Ottoman'),(211,10,493,0,51,'/o/t/ottoman.jpg'),(212,10,109,0,51,'/o/t/ottoman.jpg'),(213,10,106,0,51,'/o/t/ottoman.jpg'),(214,10,96,0,52,'Chair'),(215,10,481,0,52,'chair'),(216,10,103,0,52,'Chair'),(217,10,105,0,52,'Chair'),(218,10,493,0,52,'/c/h/chair.jpg'),(219,10,109,0,52,'/c/h/chair.jpg'),(220,10,106,0,52,'/c/h/chair.jpg'),(221,10,96,0,53,'Couch'),(222,10,481,0,53,'couch'),(223,10,103,0,53,'Couch'),(224,10,105,0,53,'Couch'),(225,10,493,0,53,'/c/o/couch.jpg'),(226,10,109,0,53,'/c/o/couch.jpg'),(227,10,106,0,53,'/c/o/couch.jpg'),(228,10,96,0,54,'Magento Red Furniture Set'),(229,10,481,0,54,'magento-red-furniture-set'),(230,10,103,0,54,'Magento Red Furniture Set'),(231,10,105,0,54,'Magento Red Furniture Set'),(232,10,493,0,54,'/m/a/magento-red-furniture-set.jpg'),(233,10,109,0,54,'/m/a/magento-red-furniture-set.jpg'),(234,10,106,0,54,'/m/a/magento-red-furniture-set.jpg'),(235,10,102,0,19,'101'),(236,10,102,0,49,'102'),(237,10,102,0,34,'103'),(238,10,102,0,33,'104'),(239,10,102,0,31,'62'),(240,10,102,0,29,'63'),(241,10,96,0,74,'Anashria Womens Premier Leather Sandal'),(242,10,481,0,74,'anashria-womens-premier-leather-sandal-3'),(243,10,103,0,74,'Anashria Womens Premier Leather Sandal'),(244,10,105,0,74,'Anashria Womens Premier Leather Sandal'),(245,10,493,0,74,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(246,10,109,0,74,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(247,10,106,0,74,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(248,10,102,0,74,'102'),(249,10,96,0,75,'Anashria Womens Premier Leather Sandal'),(250,10,481,0,75,'anashria-womens-premier-leather-sandal-4'),(251,10,103,0,75,'Anashria Womens Premier Leather Sandal'),(252,10,105,0,75,'Anashria Womens Premier Leather Sandal'),(253,10,493,0,75,'/a/n/anashria-womens-premier-leather-sandal-4.jpg'),(254,10,109,0,75,'/a/n/anashria-womens-premier-leather-sandal-3.jpg'),(255,10,106,0,75,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(256,10,102,0,75,'102'),(257,10,96,0,79,'Anashria Womens Premier Leather Sandal'),(258,10,481,0,79,'anashria-womens-premier-leather-sandal-5'),(259,10,103,0,79,'Anashria Womens Premier Leather Sandal'),(260,10,105,0,79,'Anashria Womens Premier Leather Sandal'),(261,10,493,0,79,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(262,10,109,0,79,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(263,10,106,0,79,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(264,10,102,0,79,'102'),(265,10,96,0,80,'Anashria Womens Premier Leather Sandal'),(266,10,481,0,80,'anashria-womens-premier-leather-sandal-6'),(267,10,103,0,80,'Anashria Womens Premier Leather Sandal'),(268,10,105,0,80,'Anashria Womens Premier Leather Sandal'),(269,10,493,0,80,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(270,10,109,0,80,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(271,10,106,0,80,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(272,10,102,0,80,'102'),(273,10,96,0,81,'Anashria Womens Premier Leather Sandal'),(274,10,481,0,81,'anashria-womens-premier-leather-sandal-7'),(275,10,103,0,81,'Anashria Womens Premier Leather Sandal'),(276,10,105,0,81,'Anashria Womens Premier Leather Sandal'),(277,10,493,0,81,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(278,10,109,0,81,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(279,10,106,0,81,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(280,10,102,0,81,'102'),(281,10,96,0,82,'Anashria Womens Premier Leather Sandal'),(282,10,481,0,82,'anashria-womens-premier-leather-sandal-8'),(283,10,103,0,82,'Anashria Womens Premier Leather Sandal'),(284,10,105,0,82,'Anashria Womens Premier Leather Sandal'),(285,10,493,0,82,'/a/n/anashria-womens-premier-leather-sandal-2.jpg'),(286,10,109,0,82,'/a/n/anashria-womens-premier-leather-sandal-1.jpg'),(287,10,106,0,82,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(288,10,102,0,82,'102'),(289,10,96,0,83,'CN Clogs Beach/Garden Clog'),(290,10,481,0,83,'cn-clogs-beach-garden-clog'),(291,10,103,0,83,'CN Clogs Beach/Garden Clog'),(292,10,105,0,83,'CN Clogs Beach/Garden Clog'),(293,10,493,0,83,'/c/n/cn-clogs-beach-garden-clog.jpg'),(294,10,109,0,83,'/c/n/cn-clogs-beach-garden-clog.jpg'),(295,10,106,0,83,'/c/n/cn-clogs-beach-garden-clog.jpg'),(296,10,96,0,84,'CN Clogs Beach/Garden Clog'),(297,10,481,0,84,'cn-clogs-beach-garden-clog-4'),(298,10,103,0,84,'CN Clogs Beach/Garden Clog'),(299,10,105,0,84,'CN Clogs Beach/Garden Clog'),(300,10,493,0,84,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(301,10,109,0,84,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(302,10,106,0,84,'/c/n/cn-clogs-beach-garden-clog.jpg'),(303,10,102,0,84,'63'),(304,10,96,0,85,'CN Clogs Beach/Garden Clog'),(305,10,481,0,85,'cn-clogs-beach-garden-clog-5'),(306,10,103,0,85,'CN Clogs Beach/Garden Clog'),(307,10,105,0,85,'CN Clogs Beach/Garden Clog'),(308,10,493,0,85,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(309,10,109,0,85,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(310,10,106,0,85,'/c/n/cn-clogs-beach-garden-clog.jpg'),(311,10,102,0,85,'63'),(312,10,96,0,86,'CN Clogs Beach/Garden Clog'),(313,10,481,0,86,'cn-clogs-beach-garden-clog-6'),(314,10,103,0,86,'CN Clogs Beach/Garden Clog'),(315,10,105,0,86,'CN Clogs Beach/Garden Clog'),(316,10,493,0,86,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(317,10,109,0,86,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(318,10,106,0,86,'/c/n/cn-clogs-beach-garden-clog.jpg'),(319,10,102,0,86,'63'),(320,10,96,0,87,'CN Clogs Beach/Garden Clog'),(321,10,481,0,87,'cn-clogs-beach-garden-clog-7'),(322,10,103,0,87,'CN Clogs Beach/Garden Clog'),(323,10,105,0,87,'CN Clogs Beach/Garden Clog'),(324,10,493,0,87,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(325,10,109,0,87,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(326,10,106,0,87,'/c/n/cn-clogs-beach-garden-clog.jpg'),(327,10,102,0,87,'63'),(328,10,96,0,88,'CN Clogs Beach/Garden Clog'),(329,10,481,0,88,'cn-clogs-beach-garden-clog-8'),(330,10,103,0,88,'CN Clogs Beach/Garden Clog'),(331,10,105,0,88,'CN Clogs Beach/Garden Clog'),(332,10,493,0,88,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(333,10,109,0,88,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(334,10,106,0,88,'/c/n/cn-clogs-beach-garden-clog.jpg'),(335,10,102,0,88,'63'),(336,10,96,0,89,'CN Clogs Beach/Garden Clog'),(337,10,481,0,89,'cn-clogs-beach-garden-clog-9'),(338,10,103,0,89,'CN Clogs Beach/Garden Clog'),(339,10,105,0,89,'CN Clogs Beach/Garden Clog'),(340,10,493,0,89,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(341,10,109,0,89,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(342,10,106,0,89,'/c/n/cn-clogs-beach-garden-clog.jpg'),(343,10,102,0,89,'63'),(344,10,96,0,90,'CN Clogs Beach/Garden Clog'),(345,10,481,0,90,'cn-clogs-beach-garden-clog-10'),(346,10,103,0,90,'CN Clogs Beach/Garden Clog'),(347,10,105,0,90,'CN Clogs Beach/Garden Clog'),(348,10,493,0,90,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(349,10,109,0,90,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(350,10,106,0,90,'/c/n/cn-clogs-beach-garden-clog.jpg'),(351,10,102,0,90,'63'),(352,10,96,0,91,'CN Clogs Beach/Garden Clog'),(353,10,481,0,91,'cn-clogs-beach-garden-clog-11'),(354,10,103,0,91,'CN Clogs Beach/Garden Clog'),(355,10,105,0,91,'CN Clogs Beach/Garden Clog'),(356,10,493,0,91,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(357,10,109,0,91,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(358,10,106,0,91,'/c/n/cn-clogs-beach-garden-clog.jpg'),(359,10,102,0,91,'63'),(360,10,96,0,92,'CN Clogs Beach/Garden Clog'),(361,10,481,0,92,'cn-clogs-beach-garden-clog-12'),(362,10,103,0,92,'CN Clogs Beach/Garden Clog'),(363,10,105,0,92,'CN Clogs Beach/Garden Clog'),(364,10,493,0,92,'/c/n/cn-clogs-beach-garden-clog-2.jpg'),(365,10,109,0,92,'/c/n/cn-clogs-beach-garden-clog-1.jpg'),(366,10,106,0,92,'/c/n/cn-clogs-beach-garden-clog.jpg'),(367,10,102,0,92,'63'),(368,10,96,0,93,'ASICS® Men\'s GEL-Kayano® XII'),(369,10,481,0,93,'asics-men-s-gel-kayano-xii'),(370,10,103,0,93,'ASICS® Men\'s GEL-Kayano® XII'),(371,10,105,0,93,'ASICS® Men\'s GEL-Kayano® XII'),(372,10,493,0,93,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(373,10,109,0,93,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(374,10,106,0,93,'/a/s/asics-men-s-gel-kayano-xii-2.jpg'),(375,10,96,0,94,'ASICS® Men\'s GEL-Kayano® XII'),(376,10,481,0,94,'asics-men-s-gel-kayano-xii-9'),(377,10,103,0,94,'ASICS® Men\'s GEL-Kayano® XII'),(378,10,105,0,94,'ASICS® Men\'s GEL-Kayano® XII'),(379,10,493,0,94,'no_selection'),(380,10,109,0,94,'no_selection'),(381,10,106,0,94,'no_selection'),(382,10,102,0,94,'64'),(383,10,96,0,95,'ASICS® Men\'s GEL-Kayano® XII'),(384,10,481,0,95,'asics-men-s-gel-kayano-xii-10'),(385,10,103,0,95,'ASICS® Men\'s GEL-Kayano® XII'),(386,10,105,0,95,'ASICS® Men\'s GEL-Kayano® XII'),(387,10,493,0,95,'no_selection'),(388,10,109,0,95,'no_selection'),(389,10,106,0,95,'no_selection'),(390,10,102,0,95,'64'),(391,10,96,0,96,'ASICS® Men\'s GEL-Kayano® XII'),(392,10,481,0,96,'asics-men-s-gel-kayano-xii-11'),(393,10,103,0,96,'ASICS® Men\'s GEL-Kayano® XII'),(394,10,105,0,96,'ASICS® Men\'s GEL-Kayano® XII'),(395,10,493,0,96,'no_selection'),(396,10,109,0,96,'no_selection'),(397,10,106,0,96,'no_selection'),(398,10,102,0,96,'64'),(399,10,96,0,97,'ASICS® Men\'s GEL-Kayano® XII'),(400,10,481,0,97,'asics-men-s-gel-kayano-xii-12'),(401,10,103,0,97,'ASICS® Men\'s GEL-Kayano® XII'),(402,10,105,0,97,'ASICS® Men\'s GEL-Kayano® XII'),(403,10,493,0,97,'no_selection'),(404,10,109,0,97,'no_selection'),(405,10,106,0,97,'no_selection'),(406,10,102,0,97,'64'),(407,10,96,0,98,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(408,10,481,0,98,'kenneth-cole-new-york-men-s-con-verge-slip-on'),(409,10,103,0,98,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(410,10,105,0,98,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(411,10,493,0,98,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(412,10,109,0,98,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(413,10,106,0,98,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(414,10,96,0,99,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(415,10,481,0,99,'kenneth-cole-new-york-men-s-con-verge-slip-on-9'),(416,10,103,0,99,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(417,10,105,0,99,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(418,10,493,0,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(419,10,109,0,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(420,10,106,0,99,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(421,10,102,0,99,'103'),(422,10,96,0,100,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(423,10,481,0,100,'kenneth-cole-new-york-men-s-con-verge-slip-on-10'),(424,10,103,0,100,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(425,10,105,0,100,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(426,10,493,0,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(427,10,109,0,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(428,10,106,0,100,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(429,10,102,0,100,'103'),(430,10,96,0,101,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(431,10,481,0,101,'kenneth-cole-new-york-men-s-con-verge-slip-on-11'),(432,10,103,0,101,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(433,10,105,0,101,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(434,10,493,0,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(435,10,109,0,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(436,10,106,0,101,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(437,10,102,0,101,'103'),(438,10,96,0,102,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(439,10,481,0,102,'kenneth-cole-new-york-men-s-con-verge-slip-on-12'),(440,10,103,0,102,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(441,10,105,0,102,'Kenneth Cole New York Men\'s Con-verge Slip-on'),(442,10,493,0,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-2.jpg'),(443,10,109,0,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on-1.jpg'),(444,10,106,0,102,'/k/e/kenneth-cole-new-york-men-s-con-verge-slip-on.jpg'),(445,10,102,0,102,'103'),(446,10,96,0,103,'Steven by Steve Madden Pryme Pump'),(447,10,481,0,103,'steven-by-steve-madden-pryme-pump'),(448,10,103,0,103,'Steven by Steve Madden Pryme Pump'),(449,10,105,0,103,'Steven by Steve Madden Pryme Pump'),(450,10,493,0,103,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(451,10,109,0,103,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(452,10,106,0,103,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(453,10,96,0,104,'Steven by Steve Madden Pryme Pump'),(454,10,481,0,104,'steven-by-steve-madden-pryme-pump-5'),(455,10,103,0,104,'Steven by Steve Madden Pryme Pump'),(456,10,105,0,104,'Steven by Steve Madden Pryme Pump'),(457,10,493,0,104,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(458,10,109,0,104,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(459,10,106,0,104,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(460,10,102,0,104,'62'),(461,10,96,0,105,'Steven by Steve Madden Pryme Pump'),(462,10,481,0,105,'steven-by-steve-madden-pryme-pump-6'),(463,10,103,0,105,'Steven by Steve Madden Pryme Pump'),(464,10,105,0,105,'Steven by Steve Madden Pryme Pump'),(465,10,493,0,105,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(466,10,109,0,105,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(467,10,106,0,105,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(468,10,102,0,105,'62'),(469,10,96,0,106,'Steven by Steve Madden Pryme Pump'),(470,10,481,0,106,'steven-by-steve-madden-pryme-pump-7'),(471,10,103,0,106,'Steven by Steve Madden Pryme Pump'),(472,10,105,0,106,'Steven by Steve Madden Pryme Pump'),(473,10,493,0,106,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(474,10,109,0,106,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(475,10,106,0,106,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(476,10,102,0,106,'62'),(477,10,96,0,107,'Steven by Steve Madden Pryme Pump'),(478,10,481,0,107,'steven-by-steve-madden-pryme-pump-8'),(479,10,103,0,107,'Steven by Steve Madden Pryme Pump'),(480,10,105,0,107,'Steven by Steve Madden Pryme Pump'),(481,10,493,0,107,'/s/t/steven-by-steve-madden-pryme-pump-2.jpg'),(482,10,109,0,107,'/s/t/steven-by-steve-madden-pryme-pump-1.jpg'),(483,10,106,0,107,'/s/t/steven-by-steve-madden-pryme-pump.jpg'),(484,10,102,0,107,'62'),(485,10,96,0,108,'Nine West Women\'s Lucero Pump'),(486,10,481,0,108,'nine-west-women-s-lucero-pump'),(487,10,103,0,108,'Nine West Women\'s Lucero Pump'),(488,10,105,0,108,'Nine West Women\'s Lucero Pump'),(489,10,493,0,108,'/n/i/nine-west-women-s-lucero-pump.jpg'),(490,10,109,0,108,'/n/i/nine-west-women-s-lucero-pump.jpg'),(491,10,106,0,108,'/n/i/nine-west-women-s-lucero-pump.jpg'),(492,10,96,0,109,'Nine West Women\'s Lucero Pump'),(493,10,481,0,109,'nine-west-women-s-lucero-pump-4'),(494,10,103,0,109,'Nine West Women\'s Lucero Pump'),(495,10,105,0,109,'Nine West Women\'s Lucero Pump'),(496,10,493,0,109,'no_selection'),(497,10,109,0,109,'no_selection'),(498,10,106,0,109,'no_selection'),(499,10,102,0,109,'105'),(500,10,96,0,110,'Nine West Women\'s Lucero Pump'),(501,10,481,0,110,'nine-west-women-s-lucero-pump-5'),(502,10,103,0,110,'Nine West Women\'s Lucero Pump'),(503,10,105,0,110,'Nine West Women\'s Lucero Pump'),(504,10,493,0,110,'no_selection'),(505,10,109,0,110,'no_selection'),(506,10,106,0,110,'no_selection'),(507,10,102,0,110,'105'),(508,10,96,0,111,'Nine West Women\'s Lucero Pump'),(509,10,481,0,111,'nine-west-women-s-lucero-pump-6'),(510,10,103,0,111,'Nine West Women\'s Lucero Pump'),(511,10,105,0,111,'Nine West Women\'s Lucero Pump'),(512,10,493,0,111,'no_selection'),(513,10,109,0,111,'no_selection'),(514,10,106,0,111,'no_selection'),(515,10,102,0,111,'105'),(516,10,102,0,32,'105'),(517,10,102,0,108,'105'),(518,10,102,0,103,'62'),(519,10,102,0,98,'103'),(520,10,102,0,93,'64'),(521,10,102,0,83,'63'),(522,10,96,0,112,'ECCO Womens Golf Flexor Golf Shoe'),(523,10,102,0,112,'104'),(524,10,481,0,112,'ecco-womens-golf-flexor-golf-shoe'),(525,10,103,0,112,'ECCO Womens Golf Flexor Golf Shoe'),(526,10,105,0,112,'ECCO Womens Golf Flexor Golf Shoe'),(527,10,493,0,112,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(528,10,109,0,112,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(529,10,106,0,112,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(530,10,96,0,113,'ECCO Womens Golf Flexor Golf Shoe'),(531,10,481,0,113,'ecco-womens-golf-flexor-golf-shoe-4'),(532,10,103,0,113,'ECCO Womens Golf Flexor Golf Shoe'),(533,10,105,0,113,'ECCO Womens Golf Flexor Golf Shoe'),(534,10,493,0,113,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(535,10,109,0,113,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(536,10,106,0,113,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(537,10,102,0,113,'104'),(538,10,96,0,114,'ECCO Womens Golf Flexor Golf Shoe'),(539,10,481,0,114,'ecco-womens-golf-flexor-golf-shoe-5'),(540,10,103,0,114,'ECCO Womens Golf Flexor Golf Shoe'),(541,10,105,0,114,'ECCO Womens Golf Flexor Golf Shoe'),(542,10,493,0,114,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(543,10,109,0,114,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(544,10,106,0,114,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(545,10,102,0,114,'104'),(546,10,96,0,115,'ECCO Womens Golf Flexor Golf Shoe'),(547,10,481,0,115,'ecco-womens-golf-flexor-golf-shoe-6'),(548,10,103,0,115,'ECCO Womens Golf Flexor Golf Shoe'),(549,10,105,0,115,'ECCO Womens Golf Flexor Golf Shoe'),(550,10,493,0,115,'/e/c/ecco-womens-golf-flexor-golf-shoe-2.jpg'),(551,10,109,0,115,'/e/c/ecco-womens-golf-flexor-golf-shoe-1.jpg'),(552,10,106,0,115,'/e/c/ecco-womens-golf-flexor-golf-shoe.jpg'),(553,10,102,0,115,'104'),(554,10,96,0,117,'Coalesce: Functioning On Impatience T-Shirt'),(555,10,481,0,117,'coalesce-functioning-on-impatience-t-shirt-medium'),(556,10,103,0,117,'Coalesce: Functioning On Impatience T-Shirt'),(557,10,105,0,117,'Coalesce: Functioning On Impatience T-Shirt'),(558,10,493,0,117,'no_selection'),(559,10,109,0,117,'no_selection'),(560,10,106,0,117,'no_selection'),(561,10,96,0,118,'Coalesce: Functioning On Impatience T-Shirt'),(562,10,481,0,118,'coalesce-functioning-on-impatience-t-shirt-large'),(563,10,103,0,118,'Coalesce: Functioning On Impatience T-Shirt'),(564,10,105,0,118,'Coalesce: Functioning On Impatience T-Shirt'),(565,10,493,0,118,'no_selection'),(566,10,109,0,118,'no_selection'),(567,10,106,0,118,'no_selection'),(568,10,96,0,119,'Coalesce: Functioning On Impatience T-Shirt'),(569,10,481,0,119,'coalesce-functioning-on-impatience-t-shirt'),(570,10,103,0,119,'Coalesce: Functioning On Impatience T-Shirt'),(571,10,105,0,119,'Coalesce: Functioning On Impatience T-Shirt'),(572,10,493,0,119,'/c/o/coalesce-functioning-on-impatience-t-shirt-1.jpg'),(573,10,109,0,119,'/c/o/coalesce-functioning-on-impatience-t-shirt-1.jpg'),(574,10,106,0,119,'/c/o/coalesce-functioning-on-impatience-t-shirt-1.jpg'),(575,10,96,0,120,'Ink Eater: Krylon Bombear Destroyed Tee'),(576,10,481,0,120,'ink-eater-krylon-bombear-destroyed-tee'),(577,10,103,0,120,'Ink Eater: Krylon Bombear Destroyed Tee'),(578,10,105,0,120,'Ink Eater: Krylon Bombear Destroyed Tee'),(579,10,493,0,120,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(580,10,109,0,120,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(581,10,106,0,120,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(582,10,96,0,121,'Ink Eater: Krylon Bombear Destroyed Tee'),(583,10,481,0,121,'ink-eater-krylon-bombear-destroyed-tee-med'),(584,10,103,0,121,'Ink Eater: Krylon Bombear Destroyed Tee'),(585,10,105,0,121,'Ink Eater: Krylon Bombear Destroyed Tee'),(586,10,493,0,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee-2.jpg'),(587,10,109,0,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee-1.jpg'),(588,10,106,0,121,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(589,10,96,0,122,'Ink Eater: Krylon Bombear Destroyed Tee'),(590,10,481,0,122,'ink-eater-krylon-bombear-destroyed-tee-lrg'),(591,10,103,0,122,'Ink Eater: Krylon Bombear Destroyed Tee'),(592,10,105,0,122,'Ink Eater: Krylon Bombear Destroyed Tee'),(593,10,493,0,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee-2.jpg'),(594,10,109,0,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee-1.jpg'),(595,10,106,0,122,'/i/n/ink-eater-krylon-bombear-destroyed-tee.jpg'),(596,10,96,0,123,'The Only Children: Paisley T-Shirt'),(597,10,481,0,123,'the-only-children-paisley-t-shirt'),(598,10,103,0,123,'The Only Children: Paisley T-Shirt'),(599,10,105,0,123,'The Only Children: Paisley T-Shirt'),(600,10,493,0,123,'/t/h/the-only-children-paisley-t-shirt.jpg'),(601,10,109,0,123,'/t/h/the-only-children-paisley-t-shirt.jpg'),(602,10,106,0,123,'/t/h/the-only-children-paisley-t-shirt.jpg'),(603,10,96,0,124,'The Only Children: Paisley T-Shirt'),(604,10,481,0,124,'the-only-children-paisley-t-shirt-med'),(605,10,103,0,124,'The Only Children: Paisley T-Shirt'),(606,10,105,0,124,'The Only Children: Paisley T-Shirt'),(607,10,493,0,124,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(608,10,109,0,124,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(609,10,106,0,124,'/t/h/the-only-children-paisley-t-shirt.jpg'),(610,10,96,0,125,'The Only Children: Paisley T-Shirt'),(611,10,481,0,125,'the-only-children-paisley-t-shirt-lrg'),(612,10,103,0,125,'The Only Children: Paisley T-Shirt'),(613,10,105,0,125,'The Only Children: Paisley T-Shirt'),(614,10,493,0,125,'/t/h/the-only-children-paisley-t-shirt-2.jpg'),(615,10,109,0,125,'/t/h/the-only-children-paisley-t-shirt-1.jpg'),(616,10,106,0,125,'/t/h/the-only-children-paisley-t-shirt.jpg'),(617,10,96,0,126,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(618,10,481,0,126,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt'),(619,10,103,0,126,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(620,10,105,0,126,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(621,10,493,0,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(622,10,109,0,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(623,10,106,0,126,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(624,10,96,0,127,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(625,10,481,0,127,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-g-sm'),(626,10,103,0,127,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(627,10,105,0,127,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(628,10,493,0,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(629,10,109,0,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(630,10,106,0,127,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(631,10,96,0,128,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(632,10,481,0,128,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-med'),(633,10,103,0,128,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(634,10,105,0,128,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(635,10,493,0,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(636,10,109,0,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(637,10,106,0,128,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(638,10,96,0,129,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(639,10,481,0,129,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-g-med'),(640,10,103,0,129,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(641,10,105,0,129,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(642,10,493,0,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(643,10,109,0,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(644,10,106,0,129,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(645,10,96,0,130,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(646,10,481,0,130,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-r-lrg'),(647,10,103,0,130,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(648,10,105,0,130,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(649,10,493,0,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(650,10,109,0,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(651,10,106,0,130,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(652,10,96,0,131,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(653,10,481,0,131,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-g-lrg'),(654,10,103,0,131,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(655,10,105,0,131,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(656,10,493,0,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(657,10,109,0,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(658,10,106,0,131,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(659,10,96,0,133,'Universal Camera Case'),(660,10,481,0,133,'universal-camera-case'),(661,10,109,0,133,'/u/n/universal-camera-case-1.jpg'),(662,10,96,0,132,'SLR Camera Tripod'),(663,10,481,0,132,'slr-camera-tripod'),(664,10,109,0,132,'/s/l/slr-camera-tripod.jpg'),(665,10,96,0,134,'Universal Camera Charger'),(666,10,481,0,134,'universal-camera-charger'),(667,10,109,0,134,'/u/n/universal-camera-charger.jpg'),(668,10,493,0,134,'/u/n/universal-camera-charger.jpg'),(669,10,106,0,134,'/u/n/universal-camera-charger.jpg'),(670,10,493,0,133,'/u/n/universal-camera-case-2.jpg'),(671,10,106,0,133,'/u/n/universal-camera-case.jpg'),(672,10,493,0,132,'/s/l/slr-camera-tripod.jpg'),(673,10,106,0,132,'/s/l/slr-camera-tripod.jpg'),(674,10,96,0,135,'Anashria Womens Premier Leather Sandal'),(675,10,102,0,135,'102'),(676,10,481,0,135,'anashria-womens-premier-leather-sandal'),(677,10,103,0,135,'Anashria Womens Premier Leather Sandal'),(678,10,105,0,135,'Anashria Womens Premier Leather Sandal'),(679,10,493,0,135,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(680,10,109,0,135,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(681,10,106,0,135,'/a/n/anashria-womens-premier-leather-sandal.jpg'),(682,10,96,0,137,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(683,10,481,0,137,'zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-b-med'),(684,10,103,0,137,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(685,10,105,0,137,'Zolof The Rock And Roll Destroyer: LOL Cat T-shirt'),(686,10,493,0,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-2.jpg'),(687,10,109,0,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt-1.jpg'),(688,10,106,0,137,'/z/o/zolof-the-rock-and-roll-destroyer-lol-cat-t-shirt.jpg'),(689,10,562,0,28,'2'),(690,10,571,0,28,''),(691,10,562,0,26,'2'),(692,10,571,0,26,''),(693,10,562,0,134,'2'),(694,10,103,0,134,''),(695,10,105,0,134,''),(696,10,571,0,134,''),(697,10,562,0,118,'2'),(698,10,571,0,118,''),(699,10,562,0,51,'2'),(700,10,571,0,51,''),(701,10,562,0,119,'2'),(702,10,571,0,119,''),(703,10,562,0,126,'2'),(704,10,571,0,126,''),(705,10,562,0,123,'2'),(706,10,571,0,123,''),(707,10,562,0,120,'2'),(708,10,571,0,120,''),(709,10,562,0,83,'2'),(710,10,571,0,83,''),(711,10,562,0,44,'2'),(712,10,562,0,17,'2'),(713,10,562,0,18,'2'),(714,10,562,0,19,'2'),(715,10,562,0,20,'2'),(716,10,562,0,25,'2'),(717,10,562,0,27,'2'),(718,10,562,0,30,'2'),(719,10,562,0,32,'2'),(720,10,562,0,35,'2'),(721,10,562,0,36,'2'),(722,10,562,0,37,'2'),(723,10,562,0,38,'2'),(724,10,562,0,39,'2'),(725,10,562,0,41,'2'),(726,10,562,0,42,'2'),(727,10,562,0,46,'2'),(728,10,562,0,52,'2'),(729,10,562,0,53,'2'),(730,10,562,0,80,'2'),(731,10,562,0,96,'2'),(732,10,562,0,117,'2'),(733,10,562,0,128,'2'),(734,10,571,0,27,''),(735,10,562,0,16,'2'),(736,10,562,0,84,'2'),(737,10,562,0,124,'2'),(738,10,562,0,132,'2'),(739,10,571,0,44,''),(740,10,571,0,39,''),(741,10,562,0,122,'2'),(742,10,562,0,121,'2'),(743,10,571,0,41,''),(744,10,571,0,42,''),(745,10,562,0,137,'2'),(746,10,562,0,133,'2'),(747,10,836,0,16,'container2'),(748,10,836,0,17,'container2'),(749,10,836,0,18,'container2'),(750,10,836,0,19,'container2'),(751,10,836,0,20,'container2'),(752,10,836,0,25,'container1'),(753,10,836,0,26,'container2'),(754,10,836,0,27,'container2'),(755,10,836,0,28,'container2'),(756,10,836,0,29,'container2'),(757,10,836,0,30,'container2'),(758,10,836,0,31,'container2'),(759,10,836,0,32,'container2'),(760,10,836,0,33,'container2'),(761,10,836,0,34,'container2'),(762,10,836,0,35,'container2'),(763,10,836,0,36,'container2'),(764,10,836,0,37,'container2'),(765,10,836,0,38,'container2'),(766,10,836,0,39,'container2'),(767,10,836,0,41,'container2'),(768,10,836,0,42,'container2'),(769,10,836,0,44,'container2'),(770,10,836,0,45,'container2'),(771,10,836,0,46,'container2'),(772,10,836,0,47,'container2'),(773,10,836,0,48,'container2'),(774,10,836,0,49,'container2'),(775,10,836,0,51,'container2'),(776,10,836,0,52,'container2'),(777,10,836,0,53,'container2'),(778,10,836,0,54,'container2'),(779,10,836,0,74,'container2'),(780,10,836,0,75,'container2'),(781,10,836,0,79,'container2'),(782,10,836,0,80,'container2'),(783,10,836,0,81,'container2'),(784,10,836,0,82,'container2'),(785,10,836,0,83,'container1'),(786,10,836,0,84,'container2'),(787,10,836,0,85,'container2'),(788,10,836,0,86,'container2'),(789,10,836,0,87,'container2'),(790,10,836,0,88,'container2'),(791,10,836,0,89,'container2'),(792,10,836,0,90,'container2'),(793,10,836,0,91,'container2'),(794,10,836,0,92,'container2'),(795,10,836,0,93,'container1'),(796,10,836,0,94,'container2'),(797,10,836,0,95,'container2'),(798,10,836,0,96,'container2'),(799,10,836,0,97,'container2'),(800,10,836,0,98,'container1'),(801,10,836,0,99,'container2'),(802,10,836,0,100,'container2'),(803,10,836,0,101,'container2'),(804,10,836,0,102,'container2'),(805,10,836,0,103,'container1'),(806,10,836,0,104,'container2'),(807,10,836,0,105,'container2'),(808,10,836,0,106,'container2'),(809,10,836,0,107,'container2'),(810,10,836,0,108,'container1'),(811,10,836,0,109,'container2'),(812,10,836,0,110,'container2'),(813,10,836,0,111,'container2'),(814,10,836,0,112,'container1'),(815,10,836,0,113,'container2'),(816,10,836,0,114,'container2'),(817,10,836,0,115,'container2'),(818,10,836,0,117,'container2'),(819,10,836,0,118,'container2'),(820,10,836,0,119,'container1'),(821,10,836,0,120,'container1'),(822,10,836,0,121,'container2'),(823,10,836,0,122,'container2'),(824,10,836,0,123,'container1'),(825,10,836,0,124,'container2'),(826,10,836,0,125,'container2'),(827,10,836,0,126,'container1'),(828,10,836,0,127,'container2'),(829,10,836,0,128,'container2'),(830,10,836,0,129,'container2'),(831,10,836,0,130,'container2'),(832,10,836,0,131,'container2'),(833,10,836,0,132,'container2'),(834,10,836,0,133,'container2'),(835,10,836,0,134,'container2'),(836,10,836,0,135,'container1'),(837,10,836,0,137,'container2'),(838,10,96,0,138,'Apevia Black X-Cruiser Case ATX Mid-Tower Case (Default)'),(839,10,481,0,138,'apevia-black-x-cruiser-case-atx-mid-tower-case'),(840,10,562,0,138,'2'),(841,10,103,0,138,''),(842,10,105,0,138,''),(843,10,106,0,138,'/a/p/apevia-black-x-cruiser-case-atx-mid-tower-case-default.jpg'),(844,10,493,0,138,'/a/p/apevia-black-x-cruiser-case-atx-mid-tower-case-default.jpg'),(845,10,109,0,138,'/a/p/apevia-black-x-cruiser-case-atx-mid-tower-case-default.jpg'),(846,10,571,0,138,''),(847,10,836,0,138,'container2'),(848,10,96,0,139,'NZXT Lexa Silver Aluminum ATX Mid-Tower Case (Default)'),(849,10,481,0,139,'nzxt-lexa-silver-aluminum-atx-mid-tower-case'),(850,10,562,0,139,'2'),(851,10,103,0,139,''),(852,10,105,0,139,''),(853,10,493,0,139,'/n/z/nzxt-lexa-silver-aluminum-atx-mid-tower-case-default.jpg'),(854,10,109,0,139,'/n/z/nzxt-lexa-silver-aluminum-atx-mid-tower-case-default.jpg'),(855,10,106,0,139,'/n/z/nzxt-lexa-silver-aluminum-atx-mid-tower-case-default.jpg'),(856,10,571,0,139,''),(857,10,836,0,139,'container2'),(858,10,96,0,140,'Crucial 2GB PC4200 DDR2 533MHz Memory'),(859,10,481,0,140,'crucial-2gb-pc4200-ddr2-533mhz-memory'),(860,10,562,0,140,'2'),(861,10,874,0,140,'2GB'),(862,10,103,0,140,''),(863,10,105,0,140,''),(864,10,493,0,140,'/c/r/crucial-2gb-pc4200-ddr2-533mhz-memory.jpg'),(865,10,109,0,140,'/c/r/crucial-2gb-pc4200-ddr2-533mhz-memory.jpg'),(866,10,106,0,140,'/c/r/crucial-2gb-pc4200-ddr2-533mhz-memory.jpg'),(867,10,571,0,140,''),(868,10,836,0,140,'container2'),(869,10,96,0,141,'Crucial 1GB PC4200 DDR2 533MHz Memory'),(870,10,481,0,141,'crucial-1gb-pc4200-ddr2-533mhz-memory'),(871,10,562,0,141,'2'),(872,10,874,0,141,'1GB'),(873,10,103,0,141,''),(874,10,105,0,141,''),(875,10,493,0,141,'/c/r/crucial-1gb-pc4200-ddr2-533mhz-memory.jpg'),(876,10,109,0,141,'/c/r/crucial-1gb-pc4200-ddr2-533mhz-memory.jpg'),(877,10,106,0,141,'/c/r/crucial-1gb-pc4200-ddr2-533mhz-memory.jpg'),(878,10,571,0,141,''),(879,10,836,0,141,'container2'),(880,10,96,0,142,'One Year Extended Warranty - Parts and Labor'),(881,10,481,0,142,'1-year-extended-warranty-parts-and-labor'),(882,10,103,0,142,'1 Year Warranty - Parts and Labor'),(883,10,105,0,142,'1 Year Warranty - Parts and Labor'),(884,10,493,0,142,'no_selection'),(885,10,109,0,142,'no_selection'),(886,10,106,0,142,'no_selection'),(887,10,571,0,142,''),(888,10,836,0,142,'container2'),(889,10,96,0,143,'Crucial 512MB PC4200 DDR2 533MHz Memory'),(890,10,481,0,143,'crucial-512mb-pc4200-ddr2-533mhz-memory'),(891,10,562,0,143,'2'),(892,10,874,0,143,'512MB'),(893,10,103,0,143,''),(894,10,105,0,143,''),(895,10,493,0,143,'/c/r/crucial-512mb-pc4200-ddr2-533mhz-memory.jpg'),(896,10,109,0,143,'/c/r/crucial-512mb-pc4200-ddr2-533mhz-memory.jpg'),(897,10,106,0,143,'/c/r/crucial-512mb-pc4200-ddr2-533mhz-memory.jpg'),(898,10,571,0,143,''),(899,10,836,0,143,'container2'),(900,10,96,0,144,'Two Year Extended Warranty - Parts and Labor'),(901,10,481,0,144,'1-year-extended-warranty-parts-and-labor'),(902,10,103,0,144,'2 Year Warranty - Parts and Labor'),(903,10,105,0,144,'2 Year Warranty - Parts and Labor'),(904,10,493,0,144,'no_selection'),(905,10,109,0,144,'no_selection'),(906,10,106,0,144,'no_selection'),(907,10,571,0,144,''),(908,10,836,0,144,'container2'),(909,10,96,0,145,'AMD Phenom X4 9850 Black Ed. 2.50GHz Retail'),(910,10,481,0,145,'amd-phenom-x4-9850-black-ed-2-50ghz-retail'),(911,10,562,0,145,'2'),(912,10,103,0,145,''),(913,10,105,0,145,''),(914,10,493,0,145,'/a/m/amd-phenom-x4-9850-black-ed-2-50ghz-retail.jpg'),(915,10,109,0,145,'/a/m/amd-phenom-x4-9850-black-ed-2-50ghz-retail.jpg'),(916,10,106,0,145,'/a/m/amd-phenom-x4-9850-black-ed-2-50ghz-retail.jpg'),(917,10,571,0,145,''),(918,10,836,0,145,'container2'),(919,10,96,0,146,'Three Year Extended Warranty - Parts and Labor'),(920,10,481,0,146,'1-year-extended-warranty-parts-and-labor'),(921,10,103,0,146,'3 Year Warranty - Parts and Labor'),(922,10,105,0,146,'3 Year Warranty - Parts and Labor'),(923,10,493,0,146,'no_selection'),(924,10,109,0,146,'no_selection'),(925,10,106,0,146,'no_selection'),(926,10,571,0,146,''),(927,10,836,0,146,'container2'),(928,10,96,0,147,'22\" Syncmaster LCD Monitor'),(929,10,481,0,147,'22-syncmaster-lcd-monitor'),(930,10,562,0,147,'2'),(931,10,873,0,147,'1680 x 1050'),(932,10,876,0,147,'2ms'),(933,10,103,0,147,''),(934,10,105,0,147,''),(935,10,493,0,147,'/2/2/22-syncmaster-lcd-monitor.jpg'),(936,10,109,0,147,'/2/2/22-syncmaster-lcd-monitor.jpg'),(937,10,106,0,147,'/2/2/22-syncmaster-lcd-monitor.jpg'),(938,10,571,0,147,''),(939,10,836,0,147,'container2'),(940,10,96,0,148,'AMD A64 X2 3800+ 2.0GHz OEM'),(941,10,481,0,148,'amd-a64-x2-3800-2-0ghz-oem'),(942,10,562,0,148,'2'),(943,10,103,0,148,''),(944,10,105,0,148,''),(945,10,493,0,148,'/a/m/amd-a64-x2-3800-2-0ghz-oem.jpg'),(946,10,109,0,148,'/a/m/amd-a64-x2-3800-2-0ghz-oem.jpg'),(947,10,106,0,148,'/a/m/amd-a64-x2-3800-2-0ghz-oem.jpg'),(948,10,571,0,148,''),(949,10,836,0,148,'container2'),(950,10,96,0,149,'Western Digital - 1TB HD - 7200RPM'),(951,10,481,0,149,'1tb-7200rpm'),(952,10,562,0,149,'2'),(953,10,878,0,149,'7200 rpm'),(954,10,103,0,149,''),(955,10,105,0,149,''),(956,10,493,0,149,'/w/e/western-digital-1tb-hd-7200rpm.jpg'),(957,10,109,0,149,'/w/e/western-digital-1tb-hd-7200rpm.jpg'),(958,10,106,0,149,'/w/e/western-digital-1tb-hd-7200rpm.jpg'),(959,10,571,0,149,''),(960,10,836,0,149,'container2'),(961,10,96,0,150,'Western Digital 500GB HD - 7200RPM'),(962,10,481,0,150,'500gb-7200rpm'),(963,10,562,0,150,'2'),(964,10,878,0,150,'7200 rpm'),(965,10,103,0,150,''),(966,10,105,0,150,''),(967,10,493,0,150,'/w/e/western-digital-500gb-hd-7200rpm.jpg'),(968,10,109,0,150,'/w/e/western-digital-500gb-hd-7200rpm.jpg'),(969,10,106,0,150,'/w/e/western-digital-500gb-hd-7200rpm.jpg'),(970,10,571,0,150,''),(971,10,836,0,150,'container2'),(972,10,96,0,151,'Intel C2D E8400 3.0GHz Retail'),(973,10,481,0,151,'intel-c2d-e8400-3-0ghz-retail'),(974,10,562,0,151,'2'),(975,10,103,0,151,''),(976,10,105,0,151,''),(977,10,493,0,151,'/i/n/intel-c2d-e8400-3-0ghz-retail.jpg'),(978,10,109,0,151,'/i/n/intel-c2d-e8400-3-0ghz-retail.jpg'),(979,10,106,0,151,'/i/n/intel-c2d-e8400-3-0ghz-retail.jpg'),(980,10,571,0,151,''),(981,10,836,0,151,'container2'),(982,10,96,0,152,'24\" Widescreen Flat-Panel LCD Monitor'),(983,10,481,0,152,'24-widescreen-flat-panel-lcd-monitor'),(984,10,562,0,152,'2'),(985,10,873,0,152,'1920x1200'),(986,10,876,0,152,'5ms'),(987,10,103,0,152,''),(988,10,105,0,152,''),(989,10,493,0,152,'/2/4/24-widescreen-flat-panel-lcd-monitor.jpg'),(990,10,109,0,152,'/2/4/24-widescreen-flat-panel-lcd-monitor.jpg'),(991,10,106,0,152,'/2/4/24-widescreen-flat-panel-lcd-monitor.jpg'),(992,10,571,0,152,''),(993,10,836,0,152,'container2'),(994,10,96,0,153,'Intel Core 2 Extreme QX9775 3.20GHz Retail'),(995,10,481,0,153,'intel-core-2-extreme-qx9775-3-20ghz-retail'),(996,10,562,0,153,'2'),(997,10,103,0,153,''),(998,10,105,0,153,''),(999,10,493,0,153,'/i/n/intel-core-2-extreme-qx9775-3-20ghz-retail.jpg'),(1000,10,109,0,153,'/i/n/intel-core-2-extreme-qx9775-3-20ghz-retail.jpg'),(1001,10,106,0,153,'/i/n/intel-core-2-extreme-qx9775-3-20ghz-retail.jpg'),(1002,10,571,0,153,''),(1003,10,836,0,153,'container2'),(1004,10,96,0,154,'Seagate 500GB HD - 5400RPM'),(1005,10,481,0,154,'500gb-5400rpm'),(1006,10,562,0,154,'2'),(1007,10,878,0,154,'500 GB'),(1008,10,103,0,154,''),(1009,10,105,0,154,''),(1010,10,493,0,154,'/s/e/seagate-500gb-hd-5400rpm.jpg'),(1011,10,109,0,154,'/s/e/seagate-500gb-hd-5400rpm.jpg'),(1012,10,106,0,154,'/s/e/seagate-500gb-hd-5400rpm.jpg'),(1013,10,571,0,154,''),(1014,10,836,0,154,'container2'),(1015,10,96,0,155,'Seagate 250GB HD - 5400RPM'),(1016,10,481,0,155,'250gb-5400rpm'),(1017,10,562,0,155,'2'),(1018,10,878,0,155,'250 GB'),(1019,10,103,0,155,''),(1020,10,105,0,155,''),(1021,10,493,0,155,'/s/e/seagate-250gb-hd-5400rpm.jpg'),(1022,10,109,0,155,'/s/e/seagate-250gb-hd-5400rpm.jpg'),(1023,10,106,0,155,'/s/e/seagate-250gb-hd-5400rpm.jpg'),(1024,10,571,0,155,''),(1025,10,836,0,155,'container2'),(1026,10,96,0,156,'19\" Widescreen Flat-Panel LCD Monitor'),(1027,10,481,0,156,'19-widescreen-flat-panel-lcd-monitor'),(1028,10,562,0,156,'2'),(1029,10,873,0,156,'1440x900'),(1030,10,876,0,156,'2ms'),(1031,10,103,0,156,''),(1032,10,105,0,156,''),(1033,10,493,0,156,'/1/9/19-widescreen-flat-panel-lcd-monitor.jpg'),(1034,10,109,0,156,'/1/9/19-widescreen-flat-panel-lcd-monitor.jpg'),(1035,10,106,0,156,'/1/9/19-widescreen-flat-panel-lcd-monitor.jpg'),(1036,10,571,0,156,''),(1037,10,836,0,156,'container2'),(1038,10,96,0,157,'30\" Flat-Panel TFT-LCD Cinema HD Monitor'),(1039,10,481,0,157,'30-flat-panel-tft-lcd-cinema-hd-monitor'),(1040,10,562,0,157,'2'),(1041,10,873,0,157,'1920x1200'),(1042,10,876,0,157,'15ms'),(1043,10,103,0,157,''),(1044,10,105,0,157,''),(1045,10,493,0,157,'/3/0/30-flat-panel-tft-lcd-cinema-hd-monitor.jpg'),(1046,10,109,0,157,'/3/0/30-flat-panel-tft-lcd-cinema-hd-monitor.jpg'),(1047,10,106,0,157,'/3/0/30-flat-panel-tft-lcd-cinema-hd-monitor.jpg'),(1048,10,571,0,157,''),(1049,10,836,0,157,'container2'),(1050,10,96,0,158,'Sony VAIO 11.1\" Notebook PC'),(1051,10,481,0,158,'sony-vaio-vgn-txn27n-b-11-1-notebook-pc'),(1052,10,103,0,158,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(1053,10,105,0,158,'Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC (Intel Core Solo Processor U1500, 2 GB RAM, 100 GB Hard Drive, DVD±RW Drive, Vista Business) Charcoal Black'),(1054,10,493,0,158,'/s/o/sony-vaio-11-1-notebook-pc.jpg'),(1055,10,109,0,158,'/s/o/sony-vaio-11-1-notebook-pc.jpg'),(1056,10,106,0,158,'/s/o/sony-vaio-11-1-notebook-pc.jpg'),(1057,10,571,0,158,''),(1058,10,836,0,158,'container2'),(1059,10,837,0,158,'1'),(1060,10,96,0,159,'Microsoft Natural Ergonomic Keyboard 4000'),(1061,10,481,0,159,'microsoft-natural-ergonomic-keyboard-4000'),(1062,10,562,0,159,'2'),(1063,10,103,0,159,''),(1064,10,105,0,159,''),(1065,10,493,0,159,'/m/i/microsoft-natural-ergonomic-keyboard-4000.jpg'),(1066,10,109,0,159,'/m/i/microsoft-natural-ergonomic-keyboard-4000.jpg'),(1067,10,106,0,159,'/m/i/microsoft-natural-ergonomic-keyboard-4000.jpg'),(1068,10,571,0,159,''),(1069,10,836,0,159,'container2'),(1070,10,96,0,160,'Logitech Cordless Optical Trackman'),(1071,10,481,0,160,'microsoft-wireless-optical-mouse-5000'),(1072,10,562,0,160,'2'),(1073,10,103,0,160,''),(1074,10,105,0,160,''),(1075,10,493,0,160,'/l/o/logitech-cordless-optical-trackman.jpg'),(1076,10,109,0,160,'/l/o/logitech-cordless-optical-trackman.jpg'),(1077,10,106,0,160,'/l/o/logitech-cordless-optical-trackman.jpg'),(1078,10,571,0,160,''),(1079,10,836,0,160,'container2'),(1080,10,96,0,161,'Logitech diNovo Edge Keyboard'),(1081,10,481,0,161,'logitech-dinovo-edge-keyboard'),(1082,10,562,0,161,'2'),(1083,10,103,0,161,''),(1084,10,105,0,161,''),(1085,10,493,0,161,'/l/o/logitech-dinovo-edge-keyboard.jpg'),(1086,10,109,0,161,'/l/o/logitech-dinovo-edge-keyboard.jpg'),(1087,10,106,0,161,'/l/o/logitech-dinovo-edge-keyboard.jpg'),(1088,10,571,0,161,''),(1089,10,836,0,161,'container2'),(1090,10,96,0,162,'Microsoft Wireless Optical Mouse 5000'),(1091,10,481,0,162,'microsoft-wireless-optical-mouse-5000'),(1092,10,562,0,162,'2'),(1093,10,103,0,162,''),(1094,10,105,0,162,''),(1095,10,493,0,162,'/m/i/microsoft-wireless-optical-mouse-5000.jpg'),(1096,10,109,0,162,'/m/i/microsoft-wireless-optical-mouse-5000.jpg'),(1097,10,106,0,162,'/m/i/microsoft-wireless-optical-mouse-5000.jpg'),(1098,10,571,0,162,''),(1099,10,836,0,162,'container2'),(1100,10,571,0,25,''),(1101,10,96,0,163,'Computer'),(1102,10,481,0,163,'computer'),(1103,10,103,0,163,''),(1104,10,105,0,163,''),(1105,10,493,0,163,'/c/o/computer.jpg'),(1106,10,109,0,163,'/c/o/computer.jpg'),(1107,10,106,0,163,'/c/o/computer.jpg'),(1108,10,571,0,163,''),(1109,10,836,0,163,'container2'),(1110,10,837,0,163,'1'),(1111,10,96,0,164,'Gaming Computer'),(1112,10,481,0,164,'gaming-computer'),(1113,10,103,0,164,''),(1114,10,105,0,164,''),(1115,10,493,0,164,'/g/a/gaming-computer.jpg'),(1116,10,109,0,164,'/g/a/gaming-computer.jpg'),(1117,10,106,0,164,'/g/a/gaming-computer.jpg'),(1118,10,571,0,164,''),(1119,10,836,0,164,'container2'),(1120,10,837,0,164,'1'),(1121,10,96,0,165,'My Computer'),(1122,10,481,0,165,'my-computer'),(1123,10,103,0,165,''),(1124,10,105,0,165,''),(1125,10,493,0,165,'/m/y/my-computer.jpg'),(1126,10,109,0,165,'/m/y/my-computer.jpg'),(1127,10,106,0,165,'/m/y/my-computer.jpg'),(1128,10,571,0,165,''),(1129,10,836,0,165,'container2'),(1130,10,837,0,165,'1'),(1131,10,96,0,166,'HTC Touch Diamond'),(1132,10,481,0,166,'htc-touch-diamond'),(1133,10,562,0,166,'2'),(1134,10,103,0,166,''),(1135,10,105,0,166,''),(1136,10,493,0,166,'/h/t/htc-touch-diamond.jpg'),(1137,10,109,0,166,'/h/t/htc-touch-diamond.jpg'),(1138,10,106,0,166,'/h/t/htc-touch-diamond.jpg'),(1139,10,571,0,166,''),(1140,10,836,0,166,'container2'),(1141,10,562,0,45,'2'),(1142,10,562,0,112,'2'),(1143,10,562,0,164,'2'),(1144,10,562,0,108,'2'),(1145,10,571,0,108,''),(1146,10,837,0,108,'1'),(1147,10,562,0,94,'2'),(1148,10,571,0,94,''),(1149,10,571,0,30,''),(1150,10,562,0,95,'2'),(1151,10,571,0,95,''),(1152,10,571,0,96,''),(1153,10,562,0,97,'2'),(1154,10,571,0,97,''),(1155,10,562,0,93,'2'),(1156,10,571,0,93,''),(1157,10,837,0,93,'1'),(1158,10,571,0,35,''),(1159,10,571,0,117,''),(1160,10,837,0,119,'1'),(1161,10,571,0,32,''),(1162,10,562,0,110,'2'),(1163,10,571,0,110,''),(1164,10,562,0,109,'2'),(1165,10,571,0,109,''),(1166,10,562,0,111,'2'),(1167,10,571,0,111,''),(1168,10,562,0,135,'2'),(1169,10,837,0,83,'1'),(1170,10,571,0,36,''),(1171,10,571,0,137,''),(1172,10,571,0,38,''),(1173,10,571,0,128,''),(1174,10,562,0,130,'2'),(1175,10,571,0,130,''),(1176,10,562,0,127,'2'),(1177,10,571,0,127,''),(1178,10,562,0,129,'2'),(1179,10,571,0,129,''),(1180,10,562,0,131,'2'),(1181,10,571,0,131,''),(1182,10,837,0,126,'1'),(1183,10,571,0,37,''),(1184,10,571,0,124,''),(1185,10,562,0,125,'2'),(1186,10,571,0,125,''),(1187,10,571,0,122,''),(1188,10,571,0,121,''),(1189,10,562,0,29,'2'),(1190,10,571,0,29,''),(1191,10,571,0,84,''),(1192,10,562,0,86,'2'),(1193,10,571,0,86,''),(1194,10,562,0,85,'2'),(1195,10,571,0,85,''),(1196,10,562,0,87,'2'),(1197,10,571,0,87,''),(1198,10,562,0,88,'2'),(1199,10,571,0,88,''),(1200,10,562,0,89,'2'),(1201,10,571,0,89,''),(1202,10,562,0,90,'2'),(1203,10,571,0,90,''),(1204,10,562,0,91,'2'),(1205,10,571,0,91,''),(1206,10,562,0,92,'2'),(1207,10,571,0,92,''),(1208,10,562,0,100,'2'),(1209,10,571,0,100,''),(1210,10,562,0,101,'2'),(1211,10,571,0,101,''),(1212,10,562,0,102,'2'),(1213,10,571,0,102,''),(1214,10,562,0,99,'2'),(1215,10,571,0,99,''),(1216,10,562,0,34,'2'),(1217,10,571,0,34,''),(1218,10,562,0,104,'2'),(1219,10,571,0,104,''),(1220,10,562,0,31,'2'),(1221,10,571,0,31,''),(1222,10,562,0,105,'2'),(1223,10,571,0,105,''),(1224,10,562,0,106,'2'),(1225,10,571,0,106,''),(1226,10,562,0,107,'2'),(1227,10,571,0,107,''),(1228,10,562,0,113,'2'),(1229,10,571,0,113,''),(1230,10,562,0,114,'2'),(1231,10,571,0,114,''),(1232,10,562,0,115,'2'),(1233,10,571,0,115,''),(1234,10,562,0,33,'2'),(1235,10,571,0,33,''),(1236,10,562,0,74,'2'),(1237,10,571,0,74,''),(1238,10,562,0,79,'2'),(1239,10,571,0,79,''),(1240,10,562,0,75,'2'),(1241,10,571,0,75,''),(1242,10,571,0,80,''),(1243,10,562,0,81,'2'),(1244,10,571,0,81,''),(1245,10,562,0,82,'2'),(1246,10,571,0,82,''),(1247,10,562,0,49,'2'),(1248,10,571,0,49,''),(1249,10,571,0,135,''),(1250,10,837,0,135,'1'),(1251,10,571,0,112,''),(1252,10,837,0,112,'1'),(1253,10,837,0,120,'1'),(1254,10,562,0,103,'2'),(1255,10,571,0,103,''),(1256,10,837,0,103,'1'),(1257,10,562,0,98,'2'),(1258,10,571,0,98,''),(1259,10,837,0,98,'1'),(1260,10,571,0,16,''),(1261,10,571,0,17,''),(1262,10,571,0,18,''),(1263,10,571,0,19,''),(1264,10,571,0,20,''),(1265,10,571,0,45,''),(1266,10,571,0,46,''),(1267,10,562,0,47,'2'),(1268,10,571,0,47,''),(1269,10,562,0,48,'2'),(1270,10,571,0,48,''),(1271,10,571,0,52,''),(1272,10,571,0,53,''),(1273,10,562,0,54,'2'),(1274,10,571,0,54,''),(1275,10,103,0,132,''),(1276,10,105,0,132,''),(1277,10,571,0,132,'');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link`
--
DROP TABLE IF EXISTS `catalog_product_link`;
CREATE TABLE `catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `linked_product_id` int(10) unsigned NOT NULL default '0',
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2732 DEFAULT CHARSET=utf8 COMMENT='Related products';
--
-- Dumping data for table `catalog_product_link`
--
LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
INSERT INTO `catalog_product_link` VALUES (1,49,29,1),(2,49,32,1),(3,49,33,1),(4,49,44,1),(5,49,17,4),(6,49,25,4),(7,49,41,4),(8,49,28,5),(9,49,36,5),(10,49,47,5),(11,29,30,1),(12,29,33,1),(13,29,20,4),(14,29,41,4),(15,29,53,4),(16,29,25,5),(17,29,34,5),(18,29,36,5),(19,30,29,1),(20,30,31,1),(21,30,32,1),(22,30,35,4),(23,30,38,4),(24,30,27,5),(25,30,39,5),(26,34,29,1),(27,34,30,1),(28,34,42,4),(29,34,46,4),(30,34,25,5),(31,34,36,5),(32,34,41,5),(33,31,32,1),(34,31,29,4),(35,31,39,4),(36,31,25,5),(37,31,42,5),(38,32,31,1),(39,32,33,1),(40,32,36,4),(41,32,45,4),(42,32,53,4),(43,32,25,5),(44,32,38,5),(45,32,42,5),(46,33,29,1),(47,33,17,4),(48,33,44,4),(49,33,54,4),(50,33,25,5),(51,33,32,5),(52,33,42,5),(53,33,53,5),(54,35,36,1),(55,35,37,1),(56,35,39,1),(57,37,35,1),(58,37,36,1),(59,37,39,1),(60,37,29,4),(61,37,32,4),(62,38,36,1),(63,38,39,1),(64,38,25,4),(65,38,29,4),(66,98,93,4),(67,98,126,5),(68,98,123,5),(69,98,120,5),(70,98,119,5),(71,103,83,4),(72,103,108,4),(73,103,112,4),(74,103,123,5),(75,103,120,5),(76,103,119,5),(77,108,103,4),(78,108,135,4),(79,108,119,5),(80,53,51,1),(81,53,52,1),(82,53,54,4),(83,53,17,5),(84,53,34,5),(85,53,44,5),(86,52,53,1),(87,52,54,4),(88,52,41,5),(89,52,42,5),(90,54,41,5),(91,54,42,5),(92,54,51,3),(93,54,52,3),(94,54,53,3),(95,112,83,4),(96,112,103,4),(97,112,108,4),(98,48,132,1),(99,48,133,1),(100,48,134,1),(101,48,44,4),(102,48,45,4),(103,48,47,4),(104,48,16,5),(105,48,19,5),(106,48,26,5),(107,47,44,4),(108,47,46,4),(109,47,48,4),(110,47,16,5),(111,47,25,5),(112,47,28,5),(113,46,132,1),(114,46,133,1),(115,46,134,1),(116,46,44,4),(117,46,47,4),(118,46,48,4),(119,46,19,5),(120,46,20,5),(121,46,25,5),(122,46,28,5),(123,46,83,5),(124,45,132,1),(125,45,133,1),(126,45,134,1),(127,45,44,4),(128,45,47,4),(129,45,48,4),(130,45,16,5),(131,45,17,5),(132,45,19,5),(133,93,83,4),(134,93,98,4),(135,93,119,5),(136,93,120,5),(137,93,123,5),(138,18,16,1),(139,18,17,1),(140,18,19,1),(141,18,26,4),(142,18,44,4),(143,18,25,5),(144,18,42,5),(145,18,54,5),(146,17,16,1),(147,17,18,1),(148,17,19,1),(149,17,25,4),(150,17,44,4),(151,17,53,4),(152,17,126,4),(153,17,27,5),(154,17,28,5),(155,17,51,5),(156,16,17,1),(157,16,18,1),(158,16,19,1),(159,16,27,4),(160,16,34,4),(161,16,39,4),(162,16,26,5),(163,16,29,5),(164,16,38,5),(165,20,16,1),(166,20,17,1),(167,20,18,1),(168,20,31,4),(169,20,27,5),(170,20,33,5),(171,20,39,5),(172,135,83,4),(173,25,134,1),(174,25,26,4),(175,25,27,4),(176,25,28,4),(177,25,17,5),(178,25,44,5),(179,19,16,1),(180,19,17,1),(181,19,18,1),(182,19,41,4),(183,19,47,4),(184,19,93,4),(185,19,25,5),(186,19,38,5),(187,19,39,5),(188,19,52,5),(189,19,126,5),(190,28,134,1),(191,28,25,4),(192,28,26,4),(193,28,27,4),(194,28,17,5),(195,28,44,5),(196,28,133,5),(197,26,134,1),(198,26,25,4),(199,26,27,4),(200,26,28,4),(201,26,17,5),(202,26,47,5),(203,51,52,1),(204,51,54,4),(205,51,41,5),(206,51,42,5),(2647,44,132,1),(2648,44,133,1),(2649,44,134,1),(2650,44,46,4),(2651,44,47,4),(2652,44,48,4),(2653,44,17,5),(2654,44,20,5),(2655,44,28,5),(2659,123,119,4),(2660,123,120,4),(2661,123,126,4),(2662,83,135,4),(2663,83,119,5),(2664,83,120,5),(2665,83,123,5),(2666,120,126,4),(2667,120,119,4),(2668,120,39,4),(2669,120,83,5),(2670,126,39,4),(2671,126,119,4),(2672,126,120,4),(2673,126,123,4),(2674,126,83,5),(2675,27,134,1),(2676,27,25,4),(2677,27,26,4),(2678,27,28,4),(2679,27,44,5),(2680,27,46,5),(2681,27,132,5),(2700,39,35,1),(2701,39,36,1),(2702,39,37,1),(2703,39,25,4),(2704,39,41,4),(2705,39,29,4),(2706,39,54,5),(2707,39,38,5),(2708,39,32,5),(2720,41,42,5),(2721,41,52,5),(2722,41,53,5),(2723,41,54,5),(2725,42,41,5),(2726,42,52,5),(2727,42,53,5),(2728,42,54,5),(2729,158,28,4),(2730,158,26,4),(2731,158,25,4);
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link_attribute`
--
DROP TABLE IF EXISTS `catalog_product_link_attribute`;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL auto_increment,
  `link_type_id` tinyint(3) unsigned NOT NULL default '0',
  `product_link_attribute_code` varchar(32) NOT NULL default '',
  `data_type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Attributes for product link';
--
-- Dumping data for table `catalog_product_link_attribute`
--
LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` VALUES (1,2,'qty','decimal'),(2,1,'position','int'),(3,4,'position','int'),(4,5,'position','int'),(6,1,'qty','decimal'),(7,3,'position','int'),(8,3,'qty','decimal');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link_attribute_decimal`
--
DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`),
  CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values';
--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--
LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute_decimal` VALUES (1,6,2647,'0.0000'),(2,6,2648,'0.0000'),(3,6,2649,'0.0000'),(4,6,2675,'0.0000'),(5,6,2700,'0.0000'),(6,6,2701,'0.0000'),(7,6,2702,'0.0000');
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link_attribute_int`
--
DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned default NULL,
  `link_id` int(11) unsigned default NULL,
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`),
  CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_link_attribute_int`
--
LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute_int` VALUES (1,2,2647,0),(2,2,2648,0),(3,2,2649,0),(4,3,2650,0),(5,3,2651,0),(6,3,2652,0),(7,4,2653,0),(8,4,2654,0),(9,4,2655,0),(10,3,2659,0),(11,3,2660,0),(12,3,2661,0),(13,3,2662,0),(14,4,2663,0),(15,4,2664,0),(16,4,2665,0),(17,3,2666,0),(18,3,2667,0),(19,3,2668,0),(20,4,2669,0),(21,3,2670,0),(22,3,2671,0),(23,3,2672,0),(24,3,2673,0),(25,4,2674,0),(26,2,2675,0),(27,3,2676,0),(28,3,2677,0),(29,3,2678,0),(30,4,2679,0),(31,4,2680,0),(32,4,2681,0),(33,2,2700,0),(34,2,2701,0),(35,2,2702,0),(36,3,2703,0),(37,3,2704,0),(38,3,2705,0),(39,4,2706,0),(40,4,2707,0),(41,4,2708,0),(42,4,2720,0),(43,4,2721,0),(44,4,2722,0),(45,4,2723,0),(46,4,2725,0),(47,4,2726,0),(48,4,2727,0),(49,4,2728,0),(50,3,2729,0),(51,3,2730,0),(52,3,2731,0);
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link_attribute_varchar`
--
DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL auto_increment,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL default '0',
  `link_id` int(11) unsigned default NULL,
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`),
  CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values';
--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--
LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_link_type`
--
DROP TABLE IF EXISTS `catalog_product_link_type`;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)';
--
-- Dumping data for table `catalog_product_link_type`
--
LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` VALUES (1,'relation'),(2,'bundle'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option`
--
DROP TABLE IF EXISTS `catalog_product_option`;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `is_require` tinyint(1) NOT NULL default '1',
  `sku` varchar(64) NOT NULL default '',
  `max_characters` int(10) unsigned default NULL,
  `file_extension` varchar(50) default NULL,
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option`
--
LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
INSERT INTO `catalog_product_option` VALUES (1,25,'drop_down',0,'',NULL,NULL,0),(2,26,'radio',0,'',NULL,NULL,0);
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option_price`
--
DROP TABLE IF EXISTS `catalog_product_option_price`;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_price_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option_price`
--
LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option_title`
--
DROP TABLE IF EXISTS `catalog_product_option_title`;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_title_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option_title`
--
LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
INSERT INTO `catalog_product_option_title` VALUES (1,1,0,'Extended Warranty'),(2,2,0,'Extended Warranty');
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option_type_price`
--
DROP TABLE IF EXISTS `catalog_product_option_type_price`;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `price_type` enum('fixed','percent') NOT NULL default 'fixed',
  PRIMARY KEY  (`option_type_price_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option_type_price`
--
LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
INSERT INTO `catalog_product_option_type_price` VALUES (1,1,0,'150.0000','fixed'),(2,2,0,'250.0000','fixed'),(3,3,0,'325.0000','fixed'),(4,4,0,'150.0000','fixed'),(5,5,0,'250.0000','fixed'),(6,6,0,'325.0000','fixed');
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option_type_title`
--
DROP TABLE IF EXISTS `catalog_product_option_type_title`;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL auto_increment,
  `option_type_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`option_type_title_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option_type_title`
--
LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
INSERT INTO `catalog_product_option_type_title` VALUES (1,1,0,'1 Year - Parts and Labor'),(2,2,0,'2 Years - Parts and Labor'),(3,3,0,'3 Year - Parts and Labor'),(4,4,0,'1 Year - Parts and Labor'),(5,5,0,'2 Years - Parts and Labor'),(6,6,0,'3 Year - Parts and Labor');
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_option_type_value`
--
DROP TABLE IF EXISTS `catalog_product_option_type_value`;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `sku` varchar(64) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_option_type_value`
--
LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
INSERT INTO `catalog_product_option_type_value` VALUES (1,1,'1yr_p_l',10),(2,1,'2yr_p_l',20),(3,1,'3yr_p_l',30),(4,2,'1yr_p_l',10),(5,2,'2yr_p_l',20),(6,2,'3yr_p_l',0);
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_super_attribute`
--
DROP TABLE IF EXISTS `catalog_product_super_attribute`;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `position` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`product_super_attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_super_attribute`
--
LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_super_attribute` VALUES (1,83,501,0),(2,93,502,0),(3,83,502,1),(4,103,502,0),(5,108,502,0),(6,98,502,0),(7,119,525,0),(8,120,525,0),(9,112,502,0),(10,126,525,0),(11,135,502,0),(12,123,525,0),(13,126,272,1);
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_super_attribute_label`
--
DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  CONSTRAINT `catalog_product_super_attribute_label_ibfk_1` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- Dumping data for table `catalog_product_super_attribute_label`
--
LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
INSERT INTO `catalog_product_super_attribute_label` VALUES (1,3,0,'Shoe Size'),(2,1,0,'Gender'),(3,2,0,'Shoe Size'),(4,6,0,'Shoe Size'),(5,4,0,'Shoe Size'),(6,5,0,'Shoe Size'),(7,9,0,'Shoe Size'),(8,7,0,'Size'),(9,8,0,'Size'),(10,12,0,'Size'),(11,10,0,'Size'),(12,13,0,'Color'),(13,11,0,'Shoe Size');
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_super_attribute_pricing`
--
DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `product_super_attribute_id` int(10) unsigned NOT NULL default '0',
  `value_index` varchar(255) NOT NULL default '',
  `is_percent` tinyint(1) unsigned default '0',
  `pricing_value` decimal(10,4) default NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  CONSTRAINT `catalog_product_super_attribute_pricing_ibfk_1` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--
LOCK TABLES `catalog_product_super_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` DISABLE KEYS */;
INSERT INTO `catalog_product_super_attribute_pricing` VALUES (1,12,'100',0,'10.0000'),(2,12,'99',0,'20.0000'),(3,12,'98',0,'30.0000'),(4,3,'39',0,'1.0000'),(5,3,'38',0,'2.0000'),(6,3,'37',0,'3.0000'),(7,13,'22',0,'5.2500');
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_super_link`
--
DROP TABLE IF EXISTS `catalog_product_super_link`;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`link_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`),
  CONSTRAINT `catalog_product_super_link_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catalog_product_super_link_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalog_product_super_link`
--
LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
INSERT INTO `catalog_product_super_link` VALUES (118,37,123),(119,124,123),(120,125,123),(171,35,119),(172,117,119),(173,118,119),(318,94,98),(319,96,98),(320,95,98),(321,97,98),(322,30,98),(323,29,83),(324,84,83),(325,85,83),(326,86,83),(327,87,83),(328,88,83),(329,89,83),(330,90,83),(331,91,83),(332,92,83),(333,30,93),(334,97,93),(335,96,93),(336,95,93),(337,94,93),(338,31,103),(339,104,103),(340,105,103),(341,106,103),(342,107,103),(343,32,108),(344,109,108),(345,110,108),(346,111,108),(347,33,112),(348,113,112),(349,114,112),(350,115,112),(351,36,120),(352,121,120),(353,122,120),(354,38,126),(355,127,126),(356,128,126),(357,129,126),(358,130,126),(359,131,126),(360,49,135),(361,74,135),(362,75,135),(363,79,135),(364,80,135),(365,81,135),(366,82,135);
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalog_product_website`
--
DROP TABLE IF EXISTS `catalog_product_website`;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`product_id`,`website_id`),
  KEY `FK_CATAOLOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATAOLOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
--
-- Dumping data for table `catalog_product_website`
--
LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
INSERT INTO `catalog_product_website` VALUES (16,1),(17,1),(18,1),(19,1),(20,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(41,1),(42,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(51,1),(52,1),(53,1),(54,1),(74,1),(75,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1);
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_aggregation`
--
DROP TABLE IF EXISTS `catalogindex_aggregation`;
CREATE TABLE `catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) default NULL,
  `data` mediumtext,
  PRIMARY KEY  (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_aggregation`
--
LOCK TABLES `catalogindex_aggregation` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_aggregation_tag`
--
DROP TABLE IF EXISTS `catalogindex_aggregation_tag`;
CREATE TABLE `catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL auto_increment,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_aggregation_tag`
--
LOCK TABLES `catalogindex_aggregation_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_aggregation_to_tag`
--
DROP TABLE IF EXISTS `catalogindex_aggregation_to_tag`;
CREATE TABLE `catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_aggregation_to_tag`
--
LOCK TABLES `catalogindex_aggregation_to_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_eav`
--
DROP TABLE IF EXISTS `catalogindex_eav`;
CREATE TABLE `catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_eav`
--
LOCK TABLES `catalogindex_eav` WRITE;
/*!40000 ALTER TABLE `catalogindex_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_eav` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_minimal_price`
--
DROP TABLE IF EXISTS `catalogindex_minimal_price`;
CREATE TABLE `catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_minimal_price`
--
LOCK TABLES `catalogindex_minimal_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_minimal_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_minimal_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogindex_price`
--
DROP TABLE IF EXISTS `catalogindex_price`;
CREATE TABLE `catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(3) unsigned NOT NULL default '0',
  `qty` decimal(12,4) unsigned NOT NULL default '0.0000',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `tax_class_id` smallint(6) NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogindex_price`
--
LOCK TABLES `catalogindex_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cataloginventory_stock`
--
DROP TABLE IF EXISTS `cataloginventory_stock`;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL auto_increment,
  `stock_name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list';
--
-- Dumping data for table `cataloginventory_stock`
--
LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` VALUES (1,'Default');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cataloginventory_stock_item`
--
DROP TABLE IF EXISTS `cataloginventory_stock_item`;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `stock_id` smallint(4) unsigned NOT NULL default '0',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `min_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL default '0',
  `backorders` tinyint(3) unsigned NOT NULL default '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL default '1',
  `min_sale_qty` decimal(12,4) NOT NULL default '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `max_sale_qty` decimal(12,4) NOT NULL default '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL default '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL default '0',
  `low_stock_date` datetime default NULL,
  `notify_stock_qty` decimal(12,4) default NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL default '1',
  `manage_stock` tinyint(1) unsigned NOT NULL default '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL default '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='Invetory Stock Item Data';
--
-- Dumping data for table `cataloginventory_stock_item`
--
LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_item` VALUES (1,16,1,'996.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(2,17,1,'797.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(3,18,1,'989.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(4,19,1,'328.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(5,20,1,'361.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(6,25,1,'143.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(7,26,1,'11.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(8,27,1,'595.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(9,28,1,'681.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(10,29,1,'16.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(11,30,1,'719.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(12,31,1,'441.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(13,32,1,'805.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(14,33,1,'386.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(15,34,1,'718.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(16,35,1,'580.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(17,36,1,'79.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,0,'0000-00-00 00:00:00',NULL,1,0,1,0),(18,37,1,'722.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(19,38,1,'99.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(20,39,1,'234.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(21,41,1,'339.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(22,42,1,'994.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(23,44,1,'452.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(24,45,1,'120.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(25,46,1,'932.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(26,47,1,'673.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(27,48,1,'872.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(28,49,1,'456.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(29,51,1,'706.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(30,52,1,'724.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(31,53,1,'956.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(32,54,1,'960.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(33,74,1,'999.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(34,75,1,'617.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(35,79,1,'797.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(36,80,1,'856.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(37,81,1,'660.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(38,82,1,'321.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(39,83,1,'986.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(40,84,1,'859.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(41,85,1,'31.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(42,86,1,'303.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(43,87,1,'621.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(44,88,1,'191.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(45,89,1,'948.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(46,90,1,'533.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(47,91,1,'293.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(48,92,1,'563.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(49,93,1,'767.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(50,94,1,'480.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(51,95,1,'95.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(52,96,1,'202.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(53,97,1,'326.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(54,98,1,'114.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(55,99,1,'618.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(56,100,1,'820.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(57,101,1,'966.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(58,102,1,'898.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(59,103,1,'961.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(60,104,1,'641.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(61,105,1,'537.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(62,106,1,'808.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(63,107,1,'718.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(64,108,1,'384.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(65,109,1,'379.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(66,110,1,'312.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(67,111,1,'979.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(68,112,1,'264.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(69,113,1,'336.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(70,114,1,'374.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(71,115,1,'343.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(72,117,1,'998.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(73,118,1,'749.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(74,119,1,'466.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(75,120,1,'896.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(76,121,1,'812.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(77,122,1,'469.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(78,123,1,'555.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(79,124,1,'241.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(80,125,1,'422.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(81,126,1,'832.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(82,127,1,'113.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(83,128,1,'463.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(84,129,1,'45.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(85,130,1,'687.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(86,131,1,'105.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(87,132,1,'162.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(88,133,1,'398.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(89,134,1,'377.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(90,135,1,'998.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(91,137,1,'427.0000','0.0000',1,0,0,1,'1.0000',1,'100.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(92,138,1,'703.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(93,139,1,'743.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(94,140,1,'769.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(95,141,1,'853.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(96,142,1,'678.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(97,143,1,'133.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(98,144,1,'879.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(99,145,1,'539.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(100,146,1,'543.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(101,147,1,'385.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(102,148,1,'303.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(103,149,1,'74.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(104,150,1,'17.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(105,151,1,'846.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(106,152,1,'504.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(107,153,1,'549.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(108,154,1,'313.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(109,155,1,'363.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(110,156,1,'453.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(111,157,1,'563.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(112,158,1,'156.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(113,159,1,'275.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(114,160,1,'618.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(115,161,1,'209.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(116,162,1,'760.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(117,163,1,'426.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(118,164,1,'968.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(119,165,1,'79.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0),(120,166,1,'849.0000','0.0000',1,0,0,1,'1.0000',1,'0.0000',1,1,'0000-00-00 00:00:00',NULL,1,0,1,0);
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogrule`
--
DROP TABLE IF EXISTS `catalogrule`;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default NULL,
  `to_date` date default NULL,
  `customer_group_ids` varchar(255) NOT NULL default '',
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogrule`
--
LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
INSERT INTO `catalogrule` VALUES (1,'Sony Sale','20% discount on all Sony products.','2008-08-25','2009-01-31','0,1,2,3',1,'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:2:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:12:\"manufacturer\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";s:18:\"is_value_processed\";b:0;}i:1;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:5:\"price\";s:8:\"operator\";s:2:\"<=\";s:5:\"value\";d:100;s:18:\"is_value_processed\";b:0;}}}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',1,0,'by_percent','0.0000','1'),(3,'CODEDEMOSTORE','10% off all Toshiba laptops','2008-08-06','2009-08-23','0,1,2,4',1,'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:1:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:12:\"manufacturer\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";s:18:\"is_value_processed\";b:0;}}}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',0,0,'by_percent','0.0000','1'),(4,'Anashria 20 percent Off','','2008-08-27','2009-08-28','0,1,2,4',1,'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:1:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:3:\"sku\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:3:\"ana\";s:18:\"is_value_processed\";b:0;}}}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',1,0,'by_percent','0.0000','1'),(5,'20 percent off selected Furniture','','2008-08-24','2009-09-28','0,1,2,4',1,'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"any\";s:10:\"conditions\";a:3:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:3:\"sku\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"384822\";s:18:\"is_value_processed\";b:0;}i:1;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:3:\"sku\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"349838\";s:18:\"is_value_processed\";b:0;}i:2;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:3:\"sku\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"1112\";s:18:\"is_value_processed\";b:0;}}}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',1,0,'by_percent','0.0000','1'),(6,'20 percent off T shirts','','2008-08-28','2009-10-30','0,1,2',1,'a:7:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";s:10:\"conditions\";a:1:{i:0;a:5:{s:4:\"type\";s:34:\"catalogrule/rule_condition_product\";s:9:\"attribute\";s:16:\"attribute_set_id\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"41\";s:18:\"is_value_processed\";b:0;}}}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',0,0,'by_percent','0.0000','1'),(7,'Christmas Rule','','2008-12-21','2009-01-24','0,1,2,3,4',0,'a:6:{s:4:\"type\";s:34:\"catalogrule/rule_condition_combine\";s:9:\"attribute\";N;s:8:\"operator\";N;s:5:\"value\";s:1:\"1\";s:18:\"is_value_processed\";N;s:10:\"aggregator\";s:3:\"all\";}','a:4:{s:4:\"type\";s:34:\"catalogrule/rule_action_collection\";s:9:\"attribute\";N;s:8:\"operator\";s:1:\"=\";s:5:\"value\";N;}',0,0,'by_percent','10.0000','1');
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogrule_affected_product`
--
DROP TABLE IF EXISTS `catalogrule_affected_product`;
CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogrule_affected_product`
--
LOCK TABLES `catalogrule_affected_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_affected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_affected_product` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogrule_product`
--
DROP TABLE IF EXISTS `catalogrule_product`;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `from_time` int(10) unsigned NOT NULL default '0',
  `to_time` int(10) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL default 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL default '0.0000',
  `action_stop` tinyint(1) NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`rule_product_id`),
  UNIQUE KEY `sort_order` (`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogrule_product`
--
LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
INSERT INTO `catalogrule_product` VALUES (1,1,1219622400,1233446399,0,29,'by_percent','0.0000',1,0,1),(2,1,1219622400,1233446399,1,29,'by_percent','0.0000',1,0,1),(3,1,1219622400,1233446399,2,29,'by_percent','0.0000',1,0,1),(4,1,1219622400,1233446399,3,29,'by_percent','0.0000',1,0,1),(5,1,1219622400,1233446399,0,31,'by_percent','0.0000',1,0,1),(6,1,1219622400,1233446399,1,31,'by_percent','0.0000',1,0,1),(7,1,1219622400,1233446399,2,31,'by_percent','0.0000',1,0,1),(8,1,1219622400,1233446399,3,31,'by_percent','0.0000',1,0,1),(9,1,1219622400,1233446399,0,32,'by_percent','0.0000',1,0,1),(10,1,1219622400,1233446399,1,32,'by_percent','0.0000',1,0,1),(11,1,1219622400,1233446399,2,32,'by_percent','0.0000',1,0,1),(12,1,1219622400,1233446399,3,32,'by_percent','0.0000',1,0,1),(13,1,1219622400,1233446399,0,35,'by_percent','0.0000',1,0,1),(14,1,1219622400,1233446399,1,35,'by_percent','0.0000',1,0,1),(15,1,1219622400,1233446399,2,35,'by_percent','0.0000',1,0,1),(16,1,1219622400,1233446399,3,35,'by_percent','0.0000',1,0,1),(17,1,1219622400,1233446399,0,36,'by_percent','0.0000',1,0,1),(18,1,1219622400,1233446399,1,36,'by_percent','0.0000',1,0,1),(19,1,1219622400,1233446399,2,36,'by_percent','0.0000',1,0,1),(20,1,1219622400,1233446399,3,36,'by_percent','0.0000',1,0,1),(21,1,1219622400,1233446399,0,37,'by_percent','0.0000',1,0,1),(22,1,1219622400,1233446399,1,37,'by_percent','0.0000',1,0,1),(23,1,1219622400,1233446399,2,37,'by_percent','0.0000',1,0,1),(24,1,1219622400,1233446399,3,37,'by_percent','0.0000',1,0,1),(25,1,1219622400,1233446399,0,38,'by_percent','0.0000',1,0,1),(26,1,1219622400,1233446399,1,38,'by_percent','0.0000',1,0,1),(27,1,1219622400,1233446399,2,38,'by_percent','0.0000',1,0,1),(28,1,1219622400,1233446399,3,38,'by_percent','0.0000',1,0,1),(29,1,1219622400,1233446399,0,39,'by_percent','0.0000',1,0,1),(30,1,1219622400,1233446399,1,39,'by_percent','0.0000',1,0,1),(31,1,1219622400,1233446399,2,39,'by_percent','0.0000',1,0,1),(32,1,1219622400,1233446399,3,39,'by_percent','0.0000',1,0,1),(33,1,1219622400,1233446399,0,45,'by_percent','0.0000',1,0,1),(34,1,1219622400,1233446399,1,45,'by_percent','0.0000',1,0,1),(35,1,1219622400,1233446399,2,45,'by_percent','0.0000',1,0,1),(36,1,1219622400,1233446399,3,45,'by_percent','0.0000',1,0,1),(37,1,1219622400,1233446399,0,49,'by_percent','0.0000',1,0,1),(38,1,1219622400,1233446399,1,49,'by_percent','0.0000',1,0,1),(39,1,1219622400,1233446399,2,49,'by_percent','0.0000',1,0,1),(40,1,1219622400,1233446399,3,49,'by_percent','0.0000',1,0,1),(41,1,1219622400,1233446399,0,74,'by_percent','0.0000',1,0,1),(42,1,1219622400,1233446399,1,74,'by_percent','0.0000',1,0,1),(43,1,1219622400,1233446399,2,74,'by_percent','0.0000',1,0,1),(44,1,1219622400,1233446399,3,74,'by_percent','0.0000',1,0,1),(45,1,1219622400,1233446399,0,75,'by_percent','0.0000',1,0,1),(46,1,1219622400,1233446399,1,75,'by_percent','0.0000',1,0,1),(47,1,1219622400,1233446399,2,75,'by_percent','0.0000',1,0,1),(48,1,1219622400,1233446399,3,75,'by_percent','0.0000',1,0,1),(49,1,1219622400,1233446399,0,79,'by_percent','0.0000',1,0,1),(50,1,1219622400,1233446399,1,79,'by_percent','0.0000',1,0,1),(51,1,1219622400,1233446399,2,79,'by_percent','0.0000',1,0,1),(52,1,1219622400,1233446399,3,79,'by_percent','0.0000',1,0,1),(53,1,1219622400,1233446399,0,80,'by_percent','0.0000',1,0,1),(54,1,1219622400,1233446399,1,80,'by_percent','0.0000',1,0,1),(55,1,1219622400,1233446399,2,80,'by_percent','0.0000',1,0,1),(56,1,1219622400,1233446399,3,80,'by_percent','0.0000',1,0,1),(57,1,1219622400,1233446399,0,81,'by_percent','0.0000',1,0,1),(58,1,1219622400,1233446399,1,81,'by_percent','0.0000',1,0,1),(59,1,1219622400,1233446399,2,81,'by_percent','0.0000',1,0,1),(60,1,1219622400,1233446399,3,81,'by_percent','0.0000',1,0,1),(61,1,1219622400,1233446399,0,82,'by_percent','0.0000',1,0,1),(62,1,1219622400,1233446399,1,82,'by_percent','0.0000',1,0,1),(63,1,1219622400,1233446399,2,82,'by_percent','0.0000',1,0,1),(64,1,1219622400,1233446399,3,82,'by_percent','0.0000',1,0,1),(65,1,1219622400,1233446399,0,83,'by_percent','0.0000',1,0,1),(66,1,1219622400,1233446399,1,83,'by_percent','0.0000',1,0,1),(67,1,1219622400,1233446399,2,83,'by_percent','0.0000',1,0,1),(68,1,1219622400,1233446399,3,83,'by_percent','0.0000',1,0,1),(69,1,1219622400,1233446399,0,84,'by_percent','0.0000',1,0,1),(70,1,1219622400,1233446399,1,84,'by_percent','0.0000',1,0,1),(71,1,1219622400,1233446399,2,84,'by_percent','0.0000',1,0,1),(72,1,1219622400,1233446399,3,84,'by_percent','0.0000',1,0,1),(73,1,1219622400,1233446399,0,85,'by_percent','0.0000',1,0,1),(74,1,1219622400,1233446399,1,85,'by_percent','0.0000',1,0,1),(75,1,1219622400,1233446399,2,85,'by_percent','0.0000',1,0,1),(76,1,1219622400,1233446399,3,85,'by_percent','0.0000',1,0,1),(77,1,1219622400,1233446399,0,86,'by_percent','0.0000',1,0,1),(78,1,1219622400,1233446399,1,86,'by_percent','0.0000',1,0,1),(79,1,1219622400,1233446399,2,86,'by_percent','0.0000',1,0,1),(80,1,1219622400,1233446399,3,86,'by_percent','0.0000',1,0,1),(81,1,1219622400,1233446399,0,87,'by_percent','0.0000',1,0,1),(82,1,1219622400,1233446399,1,87,'by_percent','0.0000',1,0,1),(83,1,1219622400,1233446399,2,87,'by_percent','0.0000',1,0,1),(84,1,1219622400,1233446399,3,87,'by_percent','0.0000',1,0,1),(85,1,1219622400,1233446399,0,88,'by_percent','0.0000',1,0,1),(86,1,1219622400,1233446399,1,88,'by_percent','0.0000',1,0,1),(87,1,1219622400,1233446399,2,88,'by_percent','0.0000',1,0,1),(88,1,1219622400,1233446399,3,88,'by_percent','0.0000',1,0,1),(89,1,1219622400,1233446399,0,89,'by_percent','0.0000',1,0,1),(90,1,1219622400,1233446399,1,89,'by_percent','0.0000',1,0,1),(91,1,1219622400,1233446399,2,89,'by_percent','0.0000',1,0,1),(92,1,1219622400,1233446399,3,89,'by_percent','0.0000',1,0,1),(93,1,1219622400,1233446399,0,90,'by_percent','0.0000',1,0,1),(94,1,1219622400,1233446399,1,90,'by_percent','0.0000',1,0,1),(95,1,1219622400,1233446399,2,90,'by_percent','0.0000',1,0,1),(96,1,1219622400,1233446399,3,90,'by_percent','0.0000',1,0,1),(97,1,1219622400,1233446399,0,91,'by_percent','0.0000',1,0,1),(98,1,1219622400,1233446399,1,91,'by_percent','0.0000',1,0,1),(99,1,1219622400,1233446399,2,91,'by_percent','0.0000',1,0,1),(100,1,1219622400,1233446399,3,91,'by_percent','0.0000',1,0,1),(101,1,1219622400,1233446399,0,92,'by_percent','0.0000',1,0,1),(102,1,1219622400,1233446399,1,92,'by_percent','0.0000',1,0,1),(103,1,1219622400,1233446399,2,92,'by_percent','0.0000',1,0,1),(104,1,1219622400,1233446399,3,92,'by_percent','0.0000',1,0,1),(105,1,1219622400,1233446399,0,103,'by_percent','0.0000',1,0,1),(106,1,1219622400,1233446399,1,103,'by_percent','0.0000',1,0,1),(107,1,1219622400,1233446399,2,103,'by_percent','0.0000',1,0,1),(108,1,1219622400,1233446399,3,103,'by_percent','0.0000',1,0,1),(109,1,1219622400,1233446399,0,104,'by_percent','0.0000',1,0,1),(110,1,1219622400,1233446399,1,104,'by_percent','0.0000',1,0,1),(111,1,1219622400,1233446399,2,104,'by_percent','0.0000',1,0,1),(112,1,1219622400,1233446399,3,104,'by_percent','0.0000',1,0,1),(113,1,1219622400,1233446399,0,105,'by_percent','0.0000',1,0,1),(114,1,1219622400,1233446399,1,105,'by_percent','0.0000',1,0,1),(115,1,1219622400,1233446399,2,105,'by_percent','0.0000',1,0,1),(116,1,1219622400,1233446399,3,105,'by_percent','0.0000',1,0,1),(117,1,1219622400,1233446399,0,106,'by_percent','0.0000',1,0,1),(118,1,1219622400,1233446399,1,106,'by_percent','0.0000',1,0,1),(119,1,1219622400,1233446399,2,106,'by_percent','0.0000',1,0,1),(120,1,1219622400,1233446399,3,106,'by_percent','0.0000',1,0,1),(121,1,1219622400,1233446399,0,107,'by_percent','0.0000',1,0,1),(122,1,1219622400,1233446399,1,107,'by_percent','0.0000',1,0,1),(123,1,1219622400,1233446399,2,107,'by_percent','0.0000',1,0,1),(124,1,1219622400,1233446399,3,107,'by_percent','0.0000',1,0,1),(125,1,1219622400,1233446399,0,108,'by_percent','0.0000',1,0,1),(126,1,1219622400,1233446399,1,108,'by_percent','0.0000',1,0,1),(127,1,1219622400,1233446399,2,108,'by_percent','0.0000',1,0,1),(128,1,1219622400,1233446399,3,108,'by_percent','0.0000',1,0,1),(129,1,1219622400,1233446399,0,109,'by_percent','0.0000',1,0,1),(130,1,1219622400,1233446399,1,109,'by_percent','0.0000',1,0,1),(131,1,1219622400,1233446399,2,109,'by_percent','0.0000',1,0,1),(132,1,1219622400,1233446399,3,109,'by_percent','0.0000',1,0,1),(133,1,1219622400,1233446399,0,110,'by_percent','0.0000',1,0,1),(134,1,1219622400,1233446399,1,110,'by_percent','0.0000',1,0,1),(135,1,1219622400,1233446399,2,110,'by_percent','0.0000',1,0,1),(136,1,1219622400,1233446399,3,110,'by_percent','0.0000',1,0,1),(137,1,1219622400,1233446399,0,111,'by_percent','0.0000',1,0,1),(138,1,1219622400,1233446399,1,111,'by_percent','0.0000',1,0,1),(139,1,1219622400,1233446399,2,111,'by_percent','0.0000',1,0,1),(140,1,1219622400,1233446399,3,111,'by_percent','0.0000',1,0,1),(141,1,1219622400,1233446399,0,117,'by_percent','0.0000',1,0,1),(142,1,1219622400,1233446399,1,117,'by_percent','0.0000',1,0,1),(143,1,1219622400,1233446399,2,117,'by_percent','0.0000',1,0,1),(144,1,1219622400,1233446399,3,117,'by_percent','0.0000',1,0,1),(145,1,1219622400,1233446399,0,118,'by_percent','0.0000',1,0,1),(146,1,1219622400,1233446399,1,118,'by_percent','0.0000',1,0,1),(147,1,1219622400,1233446399,2,118,'by_percent','0.0000',1,0,1),(148,1,1219622400,1233446399,3,118,'by_percent','0.0000',1,0,1),(149,1,1219622400,1233446399,0,119,'by_percent','0.0000',1,0,1),(150,1,1219622400,1233446399,1,119,'by_percent','0.0000',1,0,1),(151,1,1219622400,1233446399,2,119,'by_percent','0.0000',1,0,1),(152,1,1219622400,1233446399,3,119,'by_percent','0.0000',1,0,1),(153,1,1219622400,1233446399,0,120,'by_percent','0.0000',1,0,1),(154,1,1219622400,1233446399,1,120,'by_percent','0.0000',1,0,1),(155,1,1219622400,1233446399,2,120,'by_percent','0.0000',1,0,1),(156,1,1219622400,1233446399,3,120,'by_percent','0.0000',1,0,1),(157,1,1219622400,1233446399,0,121,'by_percent','0.0000',1,0,1),(158,1,1219622400,1233446399,1,121,'by_percent','0.0000',1,0,1),(159,1,1219622400,1233446399,2,121,'by_percent','0.0000',1,0,1),(160,1,1219622400,1233446399,3,121,'by_percent','0.0000',1,0,1),(161,1,1219622400,1233446399,0,122,'by_percent','0.0000',1,0,1),(162,1,1219622400,1233446399,1,122,'by_percent','0.0000',1,0,1),(163,1,1219622400,1233446399,2,122,'by_percent','0.0000',1,0,1),(164,1,1219622400,1233446399,3,122,'by_percent','0.0000',1,0,1),(165,1,1219622400,1233446399,0,123,'by_percent','0.0000',1,0,1),(166,1,1219622400,1233446399,1,123,'by_percent','0.0000',1,0,1),(167,1,1219622400,1233446399,2,123,'by_percent','0.0000',1,0,1),(168,1,1219622400,1233446399,3,123,'by_percent','0.0000',1,0,1),(169,1,1219622400,1233446399,0,124,'by_percent','0.0000',1,0,1),(170,1,1219622400,1233446399,1,124,'by_percent','0.0000',1,0,1),(171,1,1219622400,1233446399,2,124,'by_percent','0.0000',1,0,1),(172,1,1219622400,1233446399,3,124,'by_percent','0.0000',1,0,1),(173,1,1219622400,1233446399,0,125,'by_percent','0.0000',1,0,1),(174,1,1219622400,1233446399,1,125,'by_percent','0.0000',1,0,1),(175,1,1219622400,1233446399,2,125,'by_percent','0.0000',1,0,1),(176,1,1219622400,1233446399,3,125,'by_percent','0.0000',1,0,1),(177,1,1219622400,1233446399,0,126,'by_percent','0.0000',1,0,1),(178,1,1219622400,1233446399,1,126,'by_percent','0.0000',1,0,1),(179,1,1219622400,1233446399,2,126,'by_percent','0.0000',1,0,1),(180,1,1219622400,1233446399,3,126,'by_percent','0.0000',1,0,1),(181,1,1219622400,1233446399,0,127,'by_percent','0.0000',1,0,1),(182,1,1219622400,1233446399,1,127,'by_percent','0.0000',1,0,1),(183,1,1219622400,1233446399,2,127,'by_percent','0.0000',1,0,1),(184,1,1219622400,1233446399,3,127,'by_percent','0.0000',1,0,1),(185,1,1219622400,1233446399,0,128,'by_percent','0.0000',1,0,1),(186,1,1219622400,1233446399,1,128,'by_percent','0.0000',1,0,1),(187,1,1219622400,1233446399,2,128,'by_percent','0.0000',1,0,1),(188,1,1219622400,1233446399,3,128,'by_percent','0.0000',1,0,1),(189,1,1219622400,1233446399,0,129,'by_percent','0.0000',1,0,1),(190,1,1219622400,1233446399,1,129,'by_percent','0.0000',1,0,1),(191,1,1219622400,1233446399,2,129,'by_percent','0.0000',1,0,1),(192,1,1219622400,1233446399,3,129,'by_percent','0.0000',1,0,1),(193,1,1219622400,1233446399,0,130,'by_percent','0.0000',1,0,1),(194,1,1219622400,1233446399,1,130,'by_percent','0.0000',1,0,1),(195,1,1219622400,1233446399,2,130,'by_percent','0.0000',1,0,1),(196,1,1219622400,1233446399,3,130,'by_percent','0.0000',1,0,1),(197,1,1219622400,1233446399,0,131,'by_percent','0.0000',1,0,1),(198,1,1219622400,1233446399,1,131,'by_percent','0.0000',1,0,1),(199,1,1219622400,1233446399,2,131,'by_percent','0.0000',1,0,1),(200,1,1219622400,1233446399,3,131,'by_percent','0.0000',1,0,1),(201,1,1219622400,1233446399,0,132,'by_percent','0.0000',1,0,1),(202,1,1219622400,1233446399,1,132,'by_percent','0.0000',1,0,1),(203,1,1219622400,1233446399,2,132,'by_percent','0.0000',1,0,1),(204,1,1219622400,1233446399,3,132,'by_percent','0.0000',1,0,1),(205,1,1219622400,1233446399,0,133,'by_percent','0.0000',1,0,1),(206,1,1219622400,1233446399,1,133,'by_percent','0.0000',1,0,1),(207,1,1219622400,1233446399,2,133,'by_percent','0.0000',1,0,1),(208,1,1219622400,1233446399,3,133,'by_percent','0.0000',1,0,1),(209,1,1219622400,1233446399,0,134,'by_percent','0.0000',1,0,1),(210,1,1219622400,1233446399,1,134,'by_percent','0.0000',1,0,1),(211,1,1219622400,1233446399,2,134,'by_percent','0.0000',1,0,1),(212,1,1219622400,1233446399,3,134,'by_percent','0.0000',1,0,1),(213,1,1219622400,1233446399,0,135,'by_percent','0.0000',1,0,1),(214,1,1219622400,1233446399,1,135,'by_percent','0.0000',1,0,1),(215,1,1219622400,1233446399,2,135,'by_percent','0.0000',1,0,1),(216,1,1219622400,1233446399,3,135,'by_percent','0.0000',1,0,1),(217,1,1219622400,1233446399,0,137,'by_percent','0.0000',1,0,1),(218,1,1219622400,1233446399,1,137,'by_percent','0.0000',1,0,1),(219,1,1219622400,1233446399,2,137,'by_percent','0.0000',1,0,1),(220,1,1219622400,1233446399,3,137,'by_percent','0.0000',1,0,1),(221,1,1219622400,1233446399,0,158,'by_percent','0.0000',1,0,1),(222,1,1219622400,1233446399,1,158,'by_percent','0.0000',1,0,1),(223,1,1219622400,1233446399,2,158,'by_percent','0.0000',1,0,1),(224,1,1219622400,1233446399,3,158,'by_percent','0.0000',1,0,1),(225,1,1219622400,1233446399,0,163,'by_percent','0.0000',1,0,1),(226,1,1219622400,1233446399,1,163,'by_percent','0.0000',1,0,1),(227,1,1219622400,1233446399,2,163,'by_percent','0.0000',1,0,1),(228,1,1219622400,1233446399,3,163,'by_percent','0.0000',1,0,1),(229,1,1219622400,1233446399,0,165,'by_percent','0.0000',1,0,1),(230,1,1219622400,1233446399,1,165,'by_percent','0.0000',1,0,1),(231,1,1219622400,1233446399,2,165,'by_percent','0.0000',1,0,1),(232,1,1219622400,1233446399,3,165,'by_percent','0.0000',1,0,1),(233,3,1217980800,1251071999,0,16,'by_percent','0.0000',0,0,1),(234,3,1217980800,1251071999,1,16,'by_percent','0.0000',0,0,1),(235,3,1217980800,1251071999,2,16,'by_percent','0.0000',0,0,1),(236,3,1217980800,1251071999,4,16,'by_percent','0.0000',0,0,1),(237,3,1217980800,1251071999,0,17,'by_percent','0.0000',0,0,1),(238,3,1217980800,1251071999,1,17,'by_percent','0.0000',0,0,1),(239,3,1217980800,1251071999,2,17,'by_percent','0.0000',0,0,1),(240,3,1217980800,1251071999,4,17,'by_percent','0.0000',0,0,1),(241,3,1217980800,1251071999,0,18,'by_percent','0.0000',0,0,1),(242,3,1217980800,1251071999,1,18,'by_percent','0.0000',0,0,1),(243,3,1217980800,1251071999,2,18,'by_percent','0.0000',0,0,1),(244,3,1217980800,1251071999,4,18,'by_percent','0.0000',0,0,1),(245,3,1217980800,1251071999,0,19,'by_percent','0.0000',0,0,1),(246,3,1217980800,1251071999,1,19,'by_percent','0.0000',0,0,1),(247,3,1217980800,1251071999,2,19,'by_percent','0.0000',0,0,1),(248,3,1217980800,1251071999,4,19,'by_percent','0.0000',0,0,1),(249,3,1217980800,1251071999,0,20,'by_percent','0.0000',0,0,1),(250,3,1217980800,1251071999,1,20,'by_percent','0.0000',0,0,1),(251,3,1217980800,1251071999,2,20,'by_percent','0.0000',0,0,1),(252,3,1217980800,1251071999,4,20,'by_percent','0.0000',0,0,1),(253,3,1217980800,1251071999,0,25,'by_percent','0.0000',0,0,1),(254,3,1217980800,1251071999,1,25,'by_percent','0.0000',0,0,1),(255,3,1217980800,1251071999,2,25,'by_percent','0.0000',0,0,1),(256,3,1217980800,1251071999,4,25,'by_percent','0.0000',0,0,1),(257,3,1217980800,1251071999,0,26,'by_percent','0.0000',0,0,1),(258,3,1217980800,1251071999,1,26,'by_percent','0.0000',0,0,1),(259,3,1217980800,1251071999,2,26,'by_percent','0.0000',0,0,1),(260,3,1217980800,1251071999,4,26,'by_percent','0.0000',0,0,1),(261,3,1217980800,1251071999,0,27,'by_percent','0.0000',0,0,1),(262,3,1217980800,1251071999,1,27,'by_percent','0.0000',0,0,1),(263,3,1217980800,1251071999,2,27,'by_percent','0.0000',0,0,1),(264,3,1217980800,1251071999,4,27,'by_percent','0.0000',0,0,1),(265,3,1217980800,1251071999,0,28,'by_percent','0.0000',0,0,1),(266,3,1217980800,1251071999,1,28,'by_percent','0.0000',0,0,1),(267,3,1217980800,1251071999,2,28,'by_percent','0.0000',0,0,1),(268,3,1217980800,1251071999,4,28,'by_percent','0.0000',0,0,1),(269,3,1217980800,1251071999,0,29,'by_percent','0.0000',0,0,1),(270,3,1217980800,1251071999,1,29,'by_percent','0.0000',0,0,1),(271,3,1217980800,1251071999,2,29,'by_percent','0.0000',0,0,1),(272,3,1217980800,1251071999,4,29,'by_percent','0.0000',0,0,1),(273,3,1217980800,1251071999,0,30,'by_percent','0.0000',0,0,1),(274,3,1217980800,1251071999,1,30,'by_percent','0.0000',0,0,1),(275,3,1217980800,1251071999,2,30,'by_percent','0.0000',0,0,1),(276,3,1217980800,1251071999,4,30,'by_percent','0.0000',0,0,1),(277,3,1217980800,1251071999,0,31,'by_percent','0.0000',0,0,1),(278,3,1217980800,1251071999,1,31,'by_percent','0.0000',0,0,1),(279,3,1217980800,1251071999,2,31,'by_percent','0.0000',0,0,1),(280,3,1217980800,1251071999,4,31,'by_percent','0.0000',0,0,1),(281,3,1217980800,1251071999,0,32,'by_percent','0.0000',0,0,1),(282,3,1217980800,1251071999,1,32,'by_percent','0.0000',0,0,1),(283,3,1217980800,1251071999,2,32,'by_percent','0.0000',0,0,1),(284,3,1217980800,1251071999,4,32,'by_percent','0.0000',0,0,1),(285,3,1217980800,1251071999,0,33,'by_percent','0.0000',0,0,1),(286,3,1217980800,1251071999,1,33,'by_percent','0.0000',0,0,1),(287,3,1217980800,1251071999,2,33,'by_percent','0.0000',0,0,1),(288,3,1217980800,1251071999,4,33,'by_percent','0.0000',0,0,1),(289,3,1217980800,1251071999,0,34,'by_percent','0.0000',0,0,1),(290,3,1217980800,1251071999,1,34,'by_percent','0.0000',0,0,1),(291,3,1217980800,1251071999,2,34,'by_percent','0.0000',0,0,1),(292,3,1217980800,1251071999,4,34,'by_percent','0.0000',0,0,1),(293,3,1217980800,1251071999,0,35,'by_percent','0.0000',0,0,1),(294,3,1217980800,1251071999,1,35,'by_percent','0.0000',0,0,1),(295,3,1217980800,1251071999,2,35,'by_percent','0.0000',0,0,1),(296,3,1217980800,1251071999,4,35,'by_percent','0.0000',0,0,1),(297,3,1217980800,1251071999,0,36,'by_percent','0.0000',0,0,1),(298,3,1217980800,1251071999,1,36,'by_percent','0.0000',0,0,1),(299,3,1217980800,1251071999,2,36,'by_percent','0.0000',0,0,1),(300,3,1217980800,1251071999,4,36,'by_percent','0.0000',0,0,1),(301,3,1217980800,1251071999,0,37,'by_percent','0.0000',0,0,1),(302,3,1217980800,1251071999,1,37,'by_percent','0.0000',0,0,1),(303,3,1217980800,1251071999,2,37,'by_percent','0.0000',0,0,1),(304,3,1217980800,1251071999,4,37,'by_percent','0.0000',0,0,1),(305,3,1217980800,1251071999,0,38,'by_percent','0.0000',0,0,1),(306,3,1217980800,1251071999,1,38,'by_percent','0.0000',0,0,1),(307,3,1217980800,1251071999,2,38,'by_percent','0.0000',0,0,1),(308,3,1217980800,1251071999,4,38,'by_percent','0.0000',0,0,1),(309,3,1217980800,1251071999,0,39,'by_percent','0.0000',0,0,1),(310,3,1217980800,1251071999,1,39,'by_percent','0.0000',0,0,1),(311,3,1217980800,1251071999,2,39,'by_percent','0.0000',0,0,1),(312,3,1217980800,1251071999,4,39,'by_percent','0.0000',0,0,1),(313,3,1217980800,1251071999,0,41,'by_percent','0.0000',0,0,1),(314,3,1217980800,1251071999,1,41,'by_percent','0.0000',0,0,1),(315,3,1217980800,1251071999,2,41,'by_percent','0.0000',0,0,1),(316,3,1217980800,1251071999,4,41,'by_percent','0.0000',0,0,1),(317,3,1217980800,1251071999,0,42,'by_percent','0.0000',0,0,1),(318,3,1217980800,1251071999,1,42,'by_percent','0.0000',0,0,1),(319,3,1217980800,1251071999,2,42,'by_percent','0.0000',0,0,1),(320,3,1217980800,1251071999,4,42,'by_percent','0.0000',0,0,1),(321,3,1217980800,1251071999,0,44,'by_percent','0.0000',0,0,1),(322,3,1217980800,1251071999,1,44,'by_percent','0.0000',0,0,1),(323,3,1217980800,1251071999,2,44,'by_percent','0.0000',0,0,1),(324,3,1217980800,1251071999,4,44,'by_percent','0.0000',0,0,1),(325,3,1217980800,1251071999,0,45,'by_percent','0.0000',0,0,1),(326,3,1217980800,1251071999,1,45,'by_percent','0.0000',0,0,1),(327,3,1217980800,1251071999,2,45,'by_percent','0.0000',0,0,1),(328,3,1217980800,1251071999,4,45,'by_percent','0.0000',0,0,1),(329,3,1217980800,1251071999,0,46,'by_percent','0.0000',0,0,1),(330,3,1217980800,1251071999,1,46,'by_percent','0.0000',0,0,1),(331,3,1217980800,1251071999,2,46,'by_percent','0.0000',0,0,1),(332,3,1217980800,1251071999,4,46,'by_percent','0.0000',0,0,1),(333,3,1217980800,1251071999,0,47,'by_percent','0.0000',0,0,1),(334,3,1217980800,1251071999,1,47,'by_percent','0.0000',0,0,1),(335,3,1217980800,1251071999,2,47,'by_percent','0.0000',0,0,1),(336,3,1217980800,1251071999,4,47,'by_percent','0.0000',0,0,1),(337,3,1217980800,1251071999,0,48,'by_percent','0.0000',0,0,1),(338,3,1217980800,1251071999,1,48,'by_percent','0.0000',0,0,1),(339,3,1217980800,1251071999,2,48,'by_percent','0.0000',0,0,1),(340,3,1217980800,1251071999,4,48,'by_percent','0.0000',0,0,1),(341,3,1217980800,1251071999,0,49,'by_percent','0.0000',0,0,1),(342,3,1217980800,1251071999,1,49,'by_percent','0.0000',0,0,1),(343,3,1217980800,1251071999,2,49,'by_percent','0.0000',0,0,1),(344,3,1217980800,1251071999,4,49,'by_percent','0.0000',0,0,1),(345,3,1217980800,1251071999,0,51,'by_percent','0.0000',0,0,1),(346,3,1217980800,1251071999,1,51,'by_percent','0.0000',0,0,1),(347,3,1217980800,1251071999,2,51,'by_percent','0.0000',0,0,1),(348,3,1217980800,1251071999,4,51,'by_percent','0.0000',0,0,1),(349,3,1217980800,1251071999,0,52,'by_percent','0.0000',0,0,1),(350,3,1217980800,1251071999,1,52,'by_percent','0.0000',0,0,1),(351,3,1217980800,1251071999,2,52,'by_percent','0.0000',0,0,1),(352,3,1217980800,1251071999,4,52,'by_percent','0.0000',0,0,1),(353,3,1217980800,1251071999,0,53,'by_percent','0.0000',0,0,1),(354,3,1217980800,1251071999,1,53,'by_percent','0.0000',0,0,1),(355,3,1217980800,1251071999,2,53,'by_percent','0.0000',0,0,1),(356,3,1217980800,1251071999,4,53,'by_percent','0.0000',0,0,1),(357,3,1217980800,1251071999,0,54,'by_percent','0.0000',0,0,1),(358,3,1217980800,1251071999,1,54,'by_percent','0.0000',0,0,1),(359,3,1217980800,1251071999,2,54,'by_percent','0.0000',0,0,1),(360,3,1217980800,1251071999,4,54,'by_percent','0.0000',0,0,1),(361,3,1217980800,1251071999,0,74,'by_percent','0.0000',0,0,1),(362,3,1217980800,1251071999,1,74,'by_percent','0.0000',0,0,1),(363,3,1217980800,1251071999,2,74,'by_percent','0.0000',0,0,1),(364,3,1217980800,1251071999,4,74,'by_percent','0.0000',0,0,1),(365,3,1217980800,1251071999,0,75,'by_percent','0.0000',0,0,1),(366,3,1217980800,1251071999,1,75,'by_percent','0.0000',0,0,1),(367,3,1217980800,1251071999,2,75,'by_percent','0.0000',0,0,1),(368,3,1217980800,1251071999,4,75,'by_percent','0.0000',0,0,1),(369,3,1217980800,1251071999,0,79,'by_percent','0.0000',0,0,1),(370,3,1217980800,1251071999,1,79,'by_percent','0.0000',0,0,1),(371,3,1217980800,1251071999,2,79,'by_percent','0.0000',0,0,1),(372,3,1217980800,1251071999,4,79,'by_percent','0.0000',0,0,1),(373,3,1217980800,1251071999,0,80,'by_percent','0.0000',0,0,1),(374,3,1217980800,1251071999,1,80,'by_percent','0.0000',0,0,1),(375,3,1217980800,1251071999,2,80,'by_percent','0.0000',0,0,1),(376,3,1217980800,1251071999,4,80,'by_percent','0.0000',0,0,1),(377,3,1217980800,1251071999,0,81,'by_percent','0.0000',0,0,1),(378,3,1217980800,1251071999,1,81,'by_percent','0.0000',0,0,1),(379,3,1217980800,1251071999,2,81,'by_percent','0.0000',0,0,1),(380,3,1217980800,1251071999,4,81,'by_percent','0.0000',0,0,1),(381,3,1217980800,1251071999,0,82,'by_percent','0.0000',0,0,1),(382,3,1217980800,1251071999,1,82,'by_percent','0.0000',0,0,1),(383,3,1217980800,1251071999,2,82,'by_percent','0.0000',0,0,1),(384,3,1217980800,1251071999,4,82,'by_percent','0.0000',0,0,1),(385,3,1217980800,1251071999,0,83,'by_percent','0.0000',0,0,1),(386,3,1217980800,1251071999,1,83,'by_percent','0.0000',0,0,1),(387,3,1217980800,1251071999,2,83,'by_percent','0.0000',0,0,1),(388,3,1217980800,1251071999,4,83,'by_percent','0.0000',0,0,1),(389,3,1217980800,1251071999,0,84,'by_percent','0.0000',0,0,1),(390,3,1217980800,1251071999,1,84,'by_percent','0.0000',0,0,1),(391,3,1217980800,1251071999,2,84,'by_percent','0.0000',0,0,1),(392,3,1217980800,1251071999,4,84,'by_percent','0.0000',0,0,1),(393,3,1217980800,1251071999,0,85,'by_percent','0.0000',0,0,1),(394,3,1217980800,1251071999,1,85,'by_percent','0.0000',0,0,1),(395,3,1217980800,1251071999,2,85,'by_percent','0.0000',0,0,1),(396,3,1217980800,1251071999,4,85,'by_percent','0.0000',0,0,1),(397,3,1217980800,1251071999,0,86,'by_percent','0.0000',0,0,1),(398,3,1217980800,1251071999,1,86,'by_percent','0.0000',0,0,1),(399,3,1217980800,1251071999,2,86,'by_percent','0.0000',0,0,1),(400,3,1217980800,1251071999,4,86,'by_percent','0.0000',0,0,1),(401,3,1217980800,1251071999,0,87,'by_percent','0.0000',0,0,1),(402,3,1217980800,1251071999,1,87,'by_percent','0.0000',0,0,1),(403,3,1217980800,1251071999,2,87,'by_percent','0.0000',0,0,1),(404,3,1217980800,1251071999,4,87,'by_percent','0.0000',0,0,1),(405,3,1217980800,1251071999,0,88,'by_percent','0.0000',0,0,1),(406,3,1217980800,1251071999,1,88,'by_percent','0.0000',0,0,1),(407,3,1217980800,1251071999,2,88,'by_percent','0.0000',0,0,1),(408,3,1217980800,1251071999,4,88,'by_percent','0.0000',0,0,1),(409,3,1217980800,1251071999,0,89,'by_percent','0.0000',0,0,1),(410,3,1217980800,1251071999,1,89,'by_percent','0.0000',0,0,1),(411,3,1217980800,1251071999,2,89,'by_percent','0.0000',0,0,1),(412,3,1217980800,1251071999,4,89,'by_percent','0.0000',0,0,1),(413,3,1217980800,1251071999,0,90,'by_percent','0.0000',0,0,1),(414,3,1217980800,1251071999,1,90,'by_percent','0.0000',0,0,1),(415,3,1217980800,1251071999,2,90,'by_percent','0.0000',0,0,1),(416,3,1217980800,1251071999,4,90,'by_percent','0.0000',0,0,1),(417,3,1217980800,1251071999,0,91,'by_percent','0.0000',0,0,1),(418,3,1217980800,1251071999,1,91,'by_percent','0.0000',0,0,1),(419,3,1217980800,1251071999,2,91,'by_percent','0.0000',0,0,1),(420,3,1217980800,1251071999,4,91,'by_percent','0.0000',0,0,1),(421,3,1217980800,1251071999,0,92,'by_percent','0.0000',0,0,1),(422,3,1217980800,1251071999,1,92,'by_percent','0.0000',0,0,1),(423,3,1217980800,1251071999,2,92,'by_percent','0.0000',0,0,1),(424,3,1217980800,1251071999,4,92,'by_percent','0.0000',0,0,1),(425,3,1217980800,1251071999,0,93,'by_percent','0.0000',0,0,1),(426,3,1217980800,1251071999,1,93,'by_percent','0.0000',0,0,1),(427,3,1217980800,1251071999,2,93,'by_percent','0.0000',0,0,1),(428,3,1217980800,1251071999,4,93,'by_percent','0.0000',0,0,1),(429,3,1217980800,1251071999,0,94,'by_percent','0.0000',0,0,1),(430,3,1217980800,1251071999,1,94,'by_percent','0.0000',0,0,1),(431,3,1217980800,1251071999,2,94,'by_percent','0.0000',0,0,1),(432,3,1217980800,1251071999,4,94,'by_percent','0.0000',0,0,1),(433,3,1217980800,1251071999,0,95,'by_percent','0.0000',0,0,1),(434,3,1217980800,1251071999,1,95,'by_percent','0.0000',0,0,1),(435,3,1217980800,1251071999,2,95,'by_percent','0.0000',0,0,1),(436,3,1217980800,1251071999,4,95,'by_percent','0.0000',0,0,1),(437,3,1217980800,1251071999,0,96,'by_percent','0.0000',0,0,1),(438,3,1217980800,1251071999,1,96,'by_percent','0.0000',0,0,1),(439,3,1217980800,1251071999,2,96,'by_percent','0.0000',0,0,1),(440,3,1217980800,1251071999,4,96,'by_percent','0.0000',0,0,1),(441,3,1217980800,1251071999,0,97,'by_percent','0.0000',0,0,1),(442,3,1217980800,1251071999,1,97,'by_percent','0.0000',0,0,1),(443,3,1217980800,1251071999,2,97,'by_percent','0.0000',0,0,1),(444,3,1217980800,1251071999,4,97,'by_percent','0.0000',0,0,1),(445,3,1217980800,1251071999,0,98,'by_percent','0.0000',0,0,1),(446,3,1217980800,1251071999,1,98,'by_percent','0.0000',0,0,1),(447,3,1217980800,1251071999,2,98,'by_percent','0.0000',0,0,1),(448,3,1217980800,1251071999,4,98,'by_percent','0.0000',0,0,1),(449,3,1217980800,1251071999,0,99,'by_percent','0.0000',0,0,1),(450,3,1217980800,1251071999,1,99,'by_percent','0.0000',0,0,1),(451,3,1217980800,1251071999,2,99,'by_percent','0.0000',0,0,1),(452,3,1217980800,1251071999,4,99,'by_percent','0.0000',0,0,1),(453,3,1217980800,1251071999,0,100,'by_percent','0.0000',0,0,1),(454,3,1217980800,1251071999,1,100,'by_percent','0.0000',0,0,1),(455,3,1217980800,1251071999,2,100,'by_percent','0.0000',0,0,1),(456,3,1217980800,1251071999,4,100,'by_percent','0.0000',0,0,1),(457,3,1217980800,1251071999,0,101,'by_percent','0.0000',0,0,1),(458,3,1217980800,1251071999,1,101,'by_percent','0.0000',0,0,1),(459,3,1217980800,1251071999,2,101,'by_percent','0.0000',0,0,1),(460,3,1217980800,1251071999,4,101,'by_percent','0.0000',0,0,1),(461,3,1217980800,1251071999,0,102,'by_percent','0.0000',0,0,1),(462,3,1217980800,1251071999,1,102,'by_percent','0.0000',0,0,1),(463,3,1217980800,1251071999,2,102,'by_percent','0.0000',0,0,1),(464,3,1217980800,1251071999,4,102,'by_percent','0.0000',0,0,1),(465,3,1217980800,1251071999,0,103,'by_percent','0.0000',0,0,1),(466,3,1217980800,1251071999,1,103,'by_percent','0.0000',0,0,1),(467,3,1217980800,1251071999,2,103,'by_percent','0.0000',0,0,1),(468,3,1217980800,1251071999,4,103,'by_percent','0.0000',0,0,1),(469,3,1217980800,1251071999,0,104,'by_percent','0.0000',0,0,1),(470,3,1217980800,1251071999,1,104,'by_percent','0.0000',0,0,1),(471,3,1217980800,1251071999,2,104,'by_percent','0.0000',0,0,1),(472,3,1217980800,1251071999,4,104,'by_percent','0.0000',0,0,1),(473,3,1217980800,1251071999,0,105,'by_percent','0.0000',0,0,1),(474,3,1217980800,1251071999,1,105,'by_percent','0.0000',0,0,1),(475,3,1217980800,1251071999,2,105,'by_percent','0.0000',0,0,1),(476,3,1217980800,1251071999,4,105,'by_percent','0.0000',0,0,1),(477,3,1217980800,1251071999,0,106,'by_percent','0.0000',0,0,1),(478,3,1217980800,1251071999,1,106,'by_percent','0.0000',0,0,1),(479,3,1217980800,1251071999,2,106,'by_percent','0.0000',0,0,1),(480,3,1217980800,1251071999,4,106,'by_percent','0.0000',0,0,1),(481,3,1217980800,1251071999,0,107,'by_percent','0.0000',0,0,1),(482,3,1217980800,1251071999,1,107,'by_percent','0.0000',0,0,1),(483,3,1217980800,1251071999,2,107,'by_percent','0.0000',0,0,1),(484,3,1217980800,1251071999,4,107,'by_percent','0.0000',0,0,1),(485,3,1217980800,1251071999,0,108,'by_percent','0.0000',0,0,1),(486,3,1217980800,1251071999,1,108,'by_percent','0.0000',0,0,1),(487,3,1217980800,1251071999,2,108,'by_percent','0.0000',0,0,1),(488,3,1217980800,1251071999,4,108,'by_percent','0.0000',0,0,1),(489,3,1217980800,1251071999,0,109,'by_percent','0.0000',0,0,1),(490,3,1217980800,1251071999,1,109,'by_percent','0.0000',0,0,1),(491,3,1217980800,1251071999,2,109,'by_percent','0.0000',0,0,1),(492,3,1217980800,1251071999,4,109,'by_percent','0.0000',0,0,1),(493,3,1217980800,1251071999,0,110,'by_percent','0.0000',0,0,1),(494,3,1217980800,1251071999,1,110,'by_percent','0.0000',0,0,1),(495,3,1217980800,1251071999,2,110,'by_percent','0.0000',0,0,1),(496,3,1217980800,1251071999,4,110,'by_percent','0.0000',0,0,1),(497,3,1217980800,1251071999,0,111,'by_percent','0.0000',0,0,1),(498,3,1217980800,1251071999,1,111,'by_percent','0.0000',0,0,1),(499,3,1217980800,1251071999,2,111,'by_percent','0.0000',0,0,1),(500,3,1217980800,1251071999,4,111,'by_percent','0.0000',0,0,1),(501,3,1217980800,1251071999,0,112,'by_percent','0.0000',0,0,1),(502,3,1217980800,1251071999,1,112,'by_percent','0.0000',0,0,1),(503,3,1217980800,1251071999,2,112,'by_percent','0.0000',0,0,1),(504,3,1217980800,1251071999,4,112,'by_percent','0.0000',0,0,1),(505,3,1217980800,1251071999,0,113,'by_percent','0.0000',0,0,1),(506,3,1217980800,1251071999,1,113,'by_percent','0.0000',0,0,1),(507,3,1217980800,1251071999,2,113,'by_percent','0.0000',0,0,1),(508,3,1217980800,1251071999,4,113,'by_percent','0.0000',0,0,1),(509,3,1217980800,1251071999,0,114,'by_percent','0.0000',0,0,1),(510,3,1217980800,1251071999,1,114,'by_percent','0.0000',0,0,1),(511,3,1217980800,1251071999,2,114,'by_percent','0.0000',0,0,1),(512,3,1217980800,1251071999,4,114,'by_percent','0.0000',0,0,1),(513,3,1217980800,1251071999,0,115,'by_percent','0.0000',0,0,1),(514,3,1217980800,1251071999,1,115,'by_percent','0.0000',0,0,1),(515,3,1217980800,1251071999,2,115,'by_percent','0.0000',0,0,1),(516,3,1217980800,1251071999,4,115,'by_percent','0.0000',0,0,1),(517,3,1217980800,1251071999,0,117,'by_percent','0.0000',0,0,1),(518,3,1217980800,1251071999,1,117,'by_percent','0.0000',0,0,1),(519,3,1217980800,1251071999,2,117,'by_percent','0.0000',0,0,1),(520,3,1217980800,1251071999,4,117,'by_percent','0.0000',0,0,1),(521,3,1217980800,1251071999,0,118,'by_percent','0.0000',0,0,1),(522,3,1217980800,1251071999,1,118,'by_percent','0.0000',0,0,1),(523,3,1217980800,1251071999,2,118,'by_percent','0.0000',0,0,1),(524,3,1217980800,1251071999,4,118,'by_percent','0.0000',0,0,1),(525,3,1217980800,1251071999,0,119,'by_percent','0.0000',0,0,1),(526,3,1217980800,1251071999,1,119,'by_percent','0.0000',0,0,1),(527,3,1217980800,1251071999,2,119,'by_percent','0.0000',0,0,1),(528,3,1217980800,1251071999,4,119,'by_percent','0.0000',0,0,1),(529,3,1217980800,1251071999,0,120,'by_percent','0.0000',0,0,1),(530,3,1217980800,1251071999,1,120,'by_percent','0.0000',0,0,1),(531,3,1217980800,1251071999,2,120,'by_percent','0.0000',0,0,1),(532,3,1217980800,1251071999,4,120,'by_percent','0.0000',0,0,1),(533,3,1217980800,1251071999,0,121,'by_percent','0.0000',0,0,1),(534,3,1217980800,1251071999,1,121,'by_percent','0.0000',0,0,1),(535,3,1217980800,1251071999,2,121,'by_percent','0.0000',0,0,1),(536,3,1217980800,1251071999,4,121,'by_percent','0.0000',0,0,1),(537,3,1217980800,1251071999,0,122,'by_percent','0.0000',0,0,1),(538,3,1217980800,1251071999,1,122,'by_percent','0.0000',0,0,1),(539,3,1217980800,1251071999,2,122,'by_percent','0.0000',0,0,1),(540,3,1217980800,1251071999,4,122,'by_percent','0.0000',0,0,1),(541,3,1217980800,1251071999,0,123,'by_percent','0.0000',0,0,1),(542,3,1217980800,1251071999,1,123,'by_percent','0.0000',0,0,1),(543,3,1217980800,1251071999,2,123,'by_percent','0.0000',0,0,1),(544,3,1217980800,1251071999,4,123,'by_percent','0.0000',0,0,1),(545,3,1217980800,1251071999,0,124,'by_percent','0.0000',0,0,1),(546,3,1217980800,1251071999,1,124,'by_percent','0.0000',0,0,1),(547,3,1217980800,1251071999,2,124,'by_percent','0.0000',0,0,1),(548,3,1217980800,1251071999,4,124,'by_percent','0.0000',0,0,1),(549,3,1217980800,1251071999,0,125,'by_percent','0.0000',0,0,1),(550,3,1217980800,1251071999,1,125,'by_percent','0.0000',0,0,1),(551,3,1217980800,1251071999,2,125,'by_percent','0.0000',0,0,1),(552,3,1217980800,1251071999,4,125,'by_percent','0.0000',0,0,1),(553,3,1217980800,1251071999,0,126,'by_percent','0.0000',0,0,1),(554,3,1217980800,1251071999,1,126,'by_percent','0.0000',0,0,1),(555,3,1217980800,1251071999,2,126,'by_percent','0.0000',0,0,1),(556,3,1217980800,1251071999,4,126,'by_percent','0.0000',0,0,1),(557,3,1217980800,1251071999,0,127,'by_percent','0.0000',0,0,1),(558,3,1217980800,1251071999,1,127,'by_percent','0.0000',0,0,1),(559,3,1217980800,1251071999,2,127,'by_percent','0.0000',0,0,1),(560,3,1217980800,1251071999,4,127,'by_percent','0.0000',0,0,1),(561,3,1217980800,1251071999,0,128,'by_percent','0.0000',0,0,1),(562,3,1217980800,1251071999,1,128,'by_percent','0.0000',0,0,1),(563,3,1217980800,1251071999,2,128,'by_percent','0.0000',0,0,1),(564,3,1217980800,1251071999,4,128,'by_percent','0.0000',0,0,1),(565,3,1217980800,1251071999,0,129,'by_percent','0.0000',0,0,1),(566,3,1217980800,1251071999,1,129,'by_percent','0.0000',0,0,1),(567,3,1217980800,1251071999,2,129,'by_percent','0.0000',0,0,1),(568,3,1217980800,1251071999,4,129,'by_percent','0.0000',0,0,1),(569,3,1217980800,1251071999,0,130,'by_percent','0.0000',0,0,1),(570,3,1217980800,1251071999,1,130,'by_percent','0.0000',0,0,1),(571,3,1217980800,1251071999,2,130,'by_percent','0.0000',0,0,1),(572,3,1217980800,1251071999,4,130,'by_percent','0.0000',0,0,1),(573,3,1217980800,1251071999,0,131,'by_percent','0.0000',0,0,1),(574,3,1217980800,1251071999,1,131,'by_percent','0.0000',0,0,1),(575,3,1217980800,1251071999,2,131,'by_percent','0.0000',0,0,1),(576,3,1217980800,1251071999,4,131,'by_percent','0.0000',0,0,1),(577,3,1217980800,1251071999,0,132,'by_percent','0.0000',0,0,1),(578,3,1217980800,1251071999,1,132,'by_percent','0.0000',0,0,1),(579,3,1217980800,1251071999,2,132,'by_percent','0.0000',0,0,1),(580,3,1217980800,1251071999,4,132,'by_percent','0.0000',0,0,1),(581,3,1217980800,1251071999,0,133,'by_percent','0.0000',0,0,1),(582,3,1217980800,1251071999,1,133,'by_percent','0.0000',0,0,1),(583,3,1217980800,1251071999,2,133,'by_percent','0.0000',0,0,1),(584,3,1217980800,1251071999,4,133,'by_percent','0.0000',0,0,1),(585,3,1217980800,1251071999,0,134,'by_percent','0.0000',0,0,1),(586,3,1217980800,1251071999,1,134,'by_percent','0.0000',0,0,1),(587,3,1217980800,1251071999,2,134,'by_percent','0.0000',0,0,1),(588,3,1217980800,1251071999,4,134,'by_percent','0.0000',0,0,1),(589,3,1217980800,1251071999,0,135,'by_percent','0.0000',0,0,1),(590,3,1217980800,1251071999,1,135,'by_percent','0.0000',0,0,1),(591,3,1217980800,1251071999,2,135,'by_percent','0.0000',0,0,1),(592,3,1217980800,1251071999,4,135,'by_percent','0.0000',0,0,1),(593,3,1217980800,1251071999,0,137,'by_percent','0.0000',0,0,1),(594,3,1217980800,1251071999,1,137,'by_percent','0.0000',0,0,1),(595,3,1217980800,1251071999,2,137,'by_percent','0.0000',0,0,1),(596,3,1217980800,1251071999,4,137,'by_percent','0.0000',0,0,1),(597,3,1217980800,1251071999,0,138,'by_percent','0.0000',0,0,1),(598,3,1217980800,1251071999,1,138,'by_percent','0.0000',0,0,1),(599,3,1217980800,1251071999,2,138,'by_percent','0.0000',0,0,1),(600,3,1217980800,1251071999,4,138,'by_percent','0.0000',0,0,1),(601,3,1217980800,1251071999,0,139,'by_percent','0.0000',0,0,1),(602,3,1217980800,1251071999,1,139,'by_percent','0.0000',0,0,1),(603,3,1217980800,1251071999,2,139,'by_percent','0.0000',0,0,1),(604,3,1217980800,1251071999,4,139,'by_percent','0.0000',0,0,1),(605,3,1217980800,1251071999,0,142,'by_percent','0.0000',0,0,1),(606,3,1217980800,1251071999,1,142,'by_percent','0.0000',0,0,1),(607,3,1217980800,1251071999,2,142,'by_percent','0.0000',0,0,1),(608,3,1217980800,1251071999,4,142,'by_percent','0.0000',0,0,1),(609,3,1217980800,1251071999,0,144,'by_percent','0.0000',0,0,1),(610,3,1217980800,1251071999,1,144,'by_percent','0.0000',0,0,1),(611,3,1217980800,1251071999,2,144,'by_percent','0.0000',0,0,1),(612,3,1217980800,1251071999,4,144,'by_percent','0.0000',0,0,1),(613,3,1217980800,1251071999,0,146,'by_percent','0.0000',0,0,1),(614,3,1217980800,1251071999,1,146,'by_percent','0.0000',0,0,1),(615,3,1217980800,1251071999,2,146,'by_percent','0.0000',0,0,1),(616,3,1217980800,1251071999,4,146,'by_percent','0.0000',0,0,1),(617,3,1217980800,1251071999,0,158,'by_percent','0.0000',0,0,1),(618,3,1217980800,1251071999,1,158,'by_percent','0.0000',0,0,1),(619,3,1217980800,1251071999,2,158,'by_percent','0.0000',0,0,1),(620,3,1217980800,1251071999,4,158,'by_percent','0.0000',0,0,1),(621,3,1217980800,1251071999,0,163,'by_percent','0.0000',0,0,1),(622,3,1217980800,1251071999,1,163,'by_percent','0.0000',0,0,1),(623,3,1217980800,1251071999,2,163,'by_percent','0.0000',0,0,1),(624,3,1217980800,1251071999,4,163,'by_percent','0.0000',0,0,1),(625,3,1217980800,1251071999,0,164,'by_percent','0.0000',0,0,1),(626,3,1217980800,1251071999,1,164,'by_percent','0.0000',0,0,1),(627,3,1217980800,1251071999,2,164,'by_percent','0.0000',0,0,1),(628,3,1217980800,1251071999,4,164,'by_percent','0.0000',0,0,1),(629,3,1217980800,1251071999,0,165,'by_percent','0.0000',0,0,1),(630,3,1217980800,1251071999,1,165,'by_percent','0.0000',0,0,1),(631,3,1217980800,1251071999,2,165,'by_percent','0.0000',0,0,1),(632,3,1217980800,1251071999,4,165,'by_percent','0.0000',0,0,1),(633,4,1219795200,1251503999,0,135,'by_percent','0.0000',1,0,1),(634,4,1219795200,1251503999,1,135,'by_percent','0.0000',1,0,1),(635,4,1219795200,1251503999,2,135,'by_percent','0.0000',1,0,1),(636,4,1219795200,1251503999,4,135,'by_percent','0.0000',1,0,1),(637,5,1219536000,1254182399,0,41,'by_percent','0.0000',1,0,1),(638,5,1219536000,1254182399,1,41,'by_percent','0.0000',1,0,1),(639,5,1219536000,1254182399,2,41,'by_percent','0.0000',1,0,1),(640,5,1219536000,1254182399,4,41,'by_percent','0.0000',1,0,1),(641,5,1219536000,1254182399,0,52,'by_percent','0.0000',1,0,1),(642,5,1219536000,1254182399,1,52,'by_percent','0.0000',1,0,1),(643,5,1219536000,1254182399,2,52,'by_percent','0.0000',1,0,1),(644,5,1219536000,1254182399,4,52,'by_percent','0.0000',1,0,1),(645,6,1219881600,1256947199,0,35,'by_percent','0.0000',0,0,1),(646,6,1219881600,1256947199,1,35,'by_percent','0.0000',0,0,1),(647,6,1219881600,1256947199,2,35,'by_percent','0.0000',0,0,1),(648,6,1219881600,1256947199,0,36,'by_percent','0.0000',0,0,1),(649,6,1219881600,1256947199,1,36,'by_percent','0.0000',0,0,1),(650,6,1219881600,1256947199,2,36,'by_percent','0.0000',0,0,1),(651,6,1219881600,1256947199,0,37,'by_percent','0.0000',0,0,1),(652,6,1219881600,1256947199,1,37,'by_percent','0.0000',0,0,1),(653,6,1219881600,1256947199,2,37,'by_percent','0.0000',0,0,1),(654,6,1219881600,1256947199,0,38,'by_percent','0.0000',0,0,1),(655,6,1219881600,1256947199,1,38,'by_percent','0.0000',0,0,1),(656,6,1219881600,1256947199,2,38,'by_percent','0.0000',0,0,1),(657,6,1219881600,1256947199,0,39,'by_percent','0.0000',0,0,1),(658,6,1219881600,1256947199,1,39,'by_percent','0.0000',0,0,1),(659,6,1219881600,1256947199,2,39,'by_percent','0.0000',0,0,1),(660,6,1219881600,1256947199,0,117,'by_percent','0.0000',0,0,1),(661,6,1219881600,1256947199,1,117,'by_percent','0.0000',0,0,1),(662,6,1219881600,1256947199,2,117,'by_percent','0.0000',0,0,1),(663,6,1219881600,1256947199,0,118,'by_percent','0.0000',0,0,1),(664,6,1219881600,1256947199,1,118,'by_percent','0.0000',0,0,1),(665,6,1219881600,1256947199,2,118,'by_percent','0.0000',0,0,1),(666,6,1219881600,1256947199,0,119,'by_percent','0.0000',0,0,1),(667,6,1219881600,1256947199,1,119,'by_percent','0.0000',0,0,1),(668,6,1219881600,1256947199,2,119,'by_percent','0.0000',0,0,1),(669,6,1219881600,1256947199,0,120,'by_percent','0.0000',0,0,1),(670,6,1219881600,1256947199,1,120,'by_percent','0.0000',0,0,1),(671,6,1219881600,1256947199,2,120,'by_percent','0.0000',0,0,1),(672,6,1219881600,1256947199,0,121,'by_percent','0.0000',0,0,1),(673,6,1219881600,1256947199,1,121,'by_percent','0.0000',0,0,1),(674,6,1219881600,1256947199,2,121,'by_percent','0.0000',0,0,1),(675,6,1219881600,1256947199,0,122,'by_percent','0.0000',0,0,1),(676,6,1219881600,1256947199,1,122,'by_percent','0.0000',0,0,1),(677,6,1219881600,1256947199,2,122,'by_percent','0.0000',0,0,1),(678,6,1219881600,1256947199,0,123,'by_percent','0.0000',0,0,1),(679,6,1219881600,1256947199,1,123,'by_percent','0.0000',0,0,1),(680,6,1219881600,1256947199,2,123,'by_percent','0.0000',0,0,1),(681,6,1219881600,1256947199,0,124,'by_percent','0.0000',0,0,1),(682,6,1219881600,1256947199,1,124,'by_percent','0.0000',0,0,1),(683,6,1219881600,1256947199,2,124,'by_percent','0.0000',0,0,1),(684,6,1219881600,1256947199,0,125,'by_percent','0.0000',0,0,1),(685,6,1219881600,1256947199,1,125,'by_percent','0.0000',0,0,1),(686,6,1219881600,1256947199,2,125,'by_percent','0.0000',0,0,1),(687,6,1219881600,1256947199,0,126,'by_percent','0.0000',0,0,1),(688,6,1219881600,1256947199,1,126,'by_percent','0.0000',0,0,1),(689,6,1219881600,1256947199,2,126,'by_percent','0.0000',0,0,1),(690,6,1219881600,1256947199,0,127,'by_percent','0.0000',0,0,1),(691,6,1219881600,1256947199,1,127,'by_percent','0.0000',0,0,1),(692,6,1219881600,1256947199,2,127,'by_percent','0.0000',0,0,1),(693,6,1219881600,1256947199,0,128,'by_percent','0.0000',0,0,1),(694,6,1219881600,1256947199,1,128,'by_percent','0.0000',0,0,1),(695,6,1219881600,1256947199,2,128,'by_percent','0.0000',0,0,1),(696,6,1219881600,1256947199,0,129,'by_percent','0.0000',0,0,1),(697,6,1219881600,1256947199,1,129,'by_percent','0.0000',0,0,1),(698,6,1219881600,1256947199,2,129,'by_percent','0.0000',0,0,1),(699,6,1219881600,1256947199,0,130,'by_percent','0.0000',0,0,1),(700,6,1219881600,1256947199,1,130,'by_percent','0.0000',0,0,1),(701,6,1219881600,1256947199,2,130,'by_percent','0.0000',0,0,1),(702,6,1219881600,1256947199,0,131,'by_percent','0.0000',0,0,1),(703,6,1219881600,1256947199,1,131,'by_percent','0.0000',0,0,1),(704,6,1219881600,1256947199,2,131,'by_percent','0.0000',0,0,1),(705,6,1219881600,1256947199,0,137,'by_percent','0.0000',0,0,1),(706,6,1219881600,1256947199,1,137,'by_percent','0.0000',0,0,1),(707,6,1219881600,1256947199,2,137,'by_percent','0.0000',0,0,1);
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogrule_product_price`
--
DROP TABLE IF EXISTS `catalogrule_product_price`;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL auto_increment,
  `rule_date` date NOT NULL default '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `rule_price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date default NULL,
  `earliest_end_date` date default NULL,
  PRIMARY KEY  (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7375 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogrule_product_price`
--
LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
INSERT INTO `catalogrule_product_price` VALUES (6034,'2008-12-26',0,16,'149.9900',1,'2008-08-06','2009-08-23'),(6035,'2008-12-27',0,16,'149.9900',1,'2008-08-06','2009-08-23'),(6036,'2008-12-28',0,16,'149.9900',1,'2008-08-06','2009-08-23'),(6037,'2008-12-26',0,17,'349.9900',1,'2008-08-06','2009-08-23'),(6038,'2008-12-27',0,17,'349.9900',1,'2008-08-06','2009-08-23'),(6039,'2008-12-28',0,17,'349.9900',1,'2008-08-06','2009-08-23'),(6040,'2008-12-26',0,18,'399.9900',1,'2008-08-06','2009-08-23'),(6041,'2008-12-27',0,18,'399.9900',1,'2008-08-06','2009-08-23'),(6042,'2008-12-28',0,18,'399.9900',1,'2008-08-06','2009-08-23'),(6043,'2008-12-26',0,19,'199.9900',1,'2008-08-06','2009-08-23'),(6044,'2008-12-27',0,19,'199.9900',1,'2008-08-06','2009-08-23'),(6045,'2008-12-28',0,19,'199.9900',1,'2008-08-06','2009-08-23'),(6046,'2008-12-26',0,20,'150.0000',1,'2008-08-06','2009-08-23'),(6047,'2008-12-27',0,20,'150.0000',1,'2008-08-06','2009-08-23'),(6048,'2008-12-28',0,20,'150.0000',1,'2008-08-06','2009-08-23'),(6049,'2008-12-26',0,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6050,'2008-12-27',0,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6051,'2008-12-28',0,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6052,'2008-12-26',0,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6053,'2008-12-27',0,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6054,'2008-12-28',0,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6055,'2008-12-26',0,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6056,'2008-12-27',0,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6057,'2008-12-28',0,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6058,'2008-12-26',0,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6059,'2008-12-27',0,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6060,'2008-12-28',0,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6061,'2008-12-26',0,29,'15.9900',1,'2008-08-25','2009-01-31'),(6062,'2008-12-27',0,29,'15.9900',1,'2008-08-25','2009-01-31'),(6063,'2008-12-28',0,29,'15.9900',1,'2008-08-25','2009-01-31'),(6064,'2008-12-26',0,30,'134.9900',1,'2008-08-06','2009-08-23'),(6065,'2008-12-27',0,30,'134.9900',1,'2008-08-06','2009-08-23'),(6066,'2008-12-28',0,30,'134.9900',1,'2008-08-06','2009-08-23'),(6067,'2008-12-26',0,31,'69.9900',1,'2008-08-25','2009-01-31'),(6068,'2008-12-27',0,31,'69.9900',1,'2008-08-25','2009-01-31'),(6069,'2008-12-28',0,31,'69.9900',1,'2008-08-25','2009-01-31'),(6070,'2008-12-26',0,32,'89.9900',1,'2008-08-25','2009-01-31'),(6071,'2008-12-27',0,32,'89.9900',1,'2008-08-25','2009-01-31'),(6072,'2008-12-28',0,32,'89.9900',1,'2008-08-25','2009-01-31'),(6073,'2008-12-26',0,33,'159.9900',1,'2008-08-06','2009-08-23'),(6074,'2008-12-27',0,33,'159.9900',1,'2008-08-06','2009-08-23'),(6075,'2008-12-28',0,33,'159.9900',1,'2008-08-06','2009-08-23'),(6076,'2008-12-26',0,34,'160.9900',1,'2008-08-06','2009-08-23'),(6077,'2008-12-27',0,34,'160.9900',1,'2008-08-06','2009-08-23'),(6078,'2008-12-28',0,34,'160.9900',1,'2008-08-06','2009-08-23'),(6079,'2008-12-26',0,35,'15.0000',1,'2008-08-28','2009-01-31'),(6080,'2008-12-27',0,35,'15.0000',1,'2008-08-28','2009-01-31'),(6081,'2008-12-28',0,35,'15.0000',1,'2008-08-28','2009-01-31'),(6082,'2008-12-26',0,36,'22.0000',1,'2008-08-28','2009-01-31'),(6083,'2008-12-27',0,36,'22.0000',1,'2008-08-28','2009-01-31'),(6084,'2008-12-28',0,36,'22.0000',1,'2008-08-28','2009-01-31'),(6085,'2008-12-26',0,37,'15.0000',1,'2008-08-28','2009-01-31'),(6086,'2008-12-27',0,37,'15.0000',1,'2008-08-28','2009-01-31'),(6087,'2008-12-28',0,37,'15.0000',1,'2008-08-28','2009-01-31'),(6088,'2008-12-26',0,38,'13.5000',1,'2008-08-25','2009-01-31'),(6089,'2008-12-27',0,38,'13.5000',1,'2008-08-25','2009-01-31'),(6090,'2008-12-28',0,38,'13.5000',1,'2008-08-25','2009-01-31'),(6091,'2008-12-26',0,39,'30.0000',1,'2008-08-28','2009-01-31'),(6092,'2008-12-27',0,39,'30.0000',1,'2008-08-28','2009-01-31'),(6093,'2008-12-28',0,39,'30.0000',1,'2008-08-28','2009-01-31'),(6094,'2008-12-26',0,41,'399.9900',1,'2008-08-24','2009-09-28'),(6095,'2008-12-27',0,41,'399.9900',1,'2008-08-24','2009-09-28'),(6096,'2008-12-28',0,41,'399.9900',1,'2008-08-24','2009-09-28'),(6097,'2008-12-26',0,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6098,'2008-12-27',0,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6099,'2008-12-28',0,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6100,'2008-12-26',0,44,'550.0000',1,'2008-08-06','2009-08-23'),(6101,'2008-12-27',0,44,'550.0000',1,'2008-08-06','2009-08-23'),(6102,'2008-12-28',0,44,'550.0000',1,'2008-08-06','2009-08-23'),(6103,'2008-12-26',0,45,'37.4900',1,'2008-08-25','2009-01-31'),(6104,'2008-12-27',0,45,'37.4900',1,'2008-08-25','2009-01-31'),(6105,'2008-12-28',0,45,'37.4900',1,'2008-08-25','2009-01-31'),(6106,'2008-12-26',0,46,'161.9400',1,'2008-08-06','2009-08-23'),(6107,'2008-12-27',0,46,'161.9400',1,'2008-08-06','2009-08-23'),(6108,'2008-12-28',0,46,'161.9400',1,'2008-08-06','2009-08-23'),(6109,'2008-12-26',0,47,'329.9900',1,'2008-08-06','2009-08-23'),(6110,'2008-12-27',0,47,'329.9900',1,'2008-08-06','2009-08-23'),(6111,'2008-12-28',0,47,'329.9900',1,'2008-08-06','2009-08-23'),(6112,'2008-12-26',0,48,'199.9900',1,'2008-08-06','2009-08-23'),(6113,'2008-12-27',0,48,'199.9900',1,'2008-08-06','2009-08-23'),(6114,'2008-12-28',0,48,'199.9900',1,'2008-08-06','2009-08-23'),(6115,'2008-12-26',0,49,'41.9500',1,'2008-08-25','2009-01-31'),(6116,'2008-12-27',0,49,'41.9500',1,'2008-08-25','2009-01-31'),(6117,'2008-12-28',0,49,'41.9500',1,'2008-08-25','2009-01-31'),(6118,'2008-12-26',0,51,'299.9900',1,'2008-08-06','2009-08-23'),(6119,'2008-12-27',0,51,'299.9900',1,'2008-08-06','2009-08-23'),(6120,'2008-12-28',0,51,'299.9900',1,'2008-08-06','2009-08-23'),(6121,'2008-12-26',0,52,'129.9900',1,'2008-08-24','2009-09-28'),(6122,'2008-12-27',0,52,'129.9900',1,'2008-08-24','2009-09-28'),(6123,'2008-12-28',0,52,'129.9900',1,'2008-08-24','2009-09-28'),(6124,'2008-12-26',0,53,'599.9900',1,'2008-08-06','2009-08-23'),(6125,'2008-12-27',0,53,'599.9900',1,'2008-08-06','2009-08-23'),(6126,'2008-12-28',0,53,'599.9900',1,'2008-08-06','2009-08-23'),(6127,'2008-12-26',0,54,'699.9900',1,'2008-08-06','2009-08-23'),(6128,'2008-12-27',0,54,'699.9900',1,'2008-08-06','2009-08-23'),(6129,'2008-12-28',0,54,'699.9900',1,'2008-08-06','2009-08-23'),(6130,'2008-12-26',0,74,'41.9500',1,'2008-08-25','2009-01-31'),(6131,'2008-12-27',0,74,'41.9500',1,'2008-08-25','2009-01-31'),(6132,'2008-12-28',0,74,'41.9500',1,'2008-08-25','2009-01-31'),(6136,'2008-12-26',0,75,'41.9500',1,'2008-08-25','2009-01-31'),(6137,'2008-12-27',0,75,'41.9500',1,'2008-08-25','2009-01-31'),(6138,'2008-12-28',0,75,'41.9500',1,'2008-08-25','2009-01-31'),(6139,'2008-12-26',0,79,'41.9500',1,'2008-08-25','2009-01-31'),(6140,'2008-12-27',0,79,'41.9500',1,'2008-08-25','2009-01-31'),(6141,'2008-12-28',0,79,'41.9500',1,'2008-08-25','2009-01-31'),(6142,'2008-12-26',0,80,'41.9500',1,'2008-08-25','2009-01-31'),(6143,'2008-12-27',0,80,'41.9500',1,'2008-08-25','2009-01-31'),(6144,'2008-12-28',0,80,'41.9500',1,'2008-08-25','2009-01-31'),(6145,'2008-12-26',0,81,'41.9500',1,'2008-08-25','2009-01-31'),(6146,'2008-12-27',0,81,'41.9500',1,'2008-08-25','2009-01-31'),(6147,'2008-12-28',0,81,'41.9500',1,'2008-08-25','2009-01-31'),(6148,'2008-12-26',0,82,'41.9500',1,'2008-08-25','2009-01-31'),(6149,'2008-12-27',0,82,'41.9500',1,'2008-08-25','2009-01-31'),(6150,'2008-12-28',0,82,'41.9500',1,'2008-08-25','2009-01-31'),(6151,'2008-12-26',0,83,'15.9900',1,'2008-08-25','2009-01-31'),(6152,'2008-12-27',0,83,'15.9900',1,'2008-08-25','2009-01-31'),(6153,'2008-12-28',0,83,'15.9900',1,'2008-08-25','2009-01-31'),(6154,'2008-12-26',0,84,'15.9900',1,'2008-08-25','2009-01-31'),(6155,'2008-12-27',0,84,'15.9900',1,'2008-08-25','2009-01-31'),(6156,'2008-12-28',0,84,'15.9900',1,'2008-08-25','2009-01-31'),(6157,'2008-12-26',0,85,'15.9900',1,'2008-08-25','2009-01-31'),(6158,'2008-12-27',0,85,'15.9900',1,'2008-08-25','2009-01-31'),(6159,'2008-12-28',0,85,'15.9900',1,'2008-08-25','2009-01-31'),(6160,'2008-12-26',0,86,'15.9900',1,'2008-08-25','2009-01-31'),(6161,'2008-12-27',0,86,'15.9900',1,'2008-08-25','2009-01-31'),(6162,'2008-12-28',0,86,'15.9900',1,'2008-08-25','2009-01-31'),(6163,'2008-12-26',0,87,'15.9900',1,'2008-08-25','2009-01-31'),(6164,'2008-12-27',0,87,'15.9900',1,'2008-08-25','2009-01-31'),(6165,'2008-12-28',0,87,'15.9900',1,'2008-08-25','2009-01-31'),(6166,'2008-12-26',0,88,'15.9900',1,'2008-08-25','2009-01-31'),(6167,'2008-12-27',0,88,'15.9900',1,'2008-08-25','2009-01-31'),(6168,'2008-12-28',0,88,'15.9900',1,'2008-08-25','2009-01-31'),(6169,'2008-12-26',0,89,'15.9900',1,'2008-08-25','2009-01-31'),(6170,'2008-12-27',0,89,'15.9900',1,'2008-08-25','2009-01-31'),(6171,'2008-12-28',0,89,'15.9900',1,'2008-08-25','2009-01-31'),(6172,'2008-12-26',0,90,'15.9900',1,'2008-08-25','2009-01-31'),(6173,'2008-12-27',0,90,'15.9900',1,'2008-08-25','2009-01-31'),(6174,'2008-12-28',0,90,'15.9900',1,'2008-08-25','2009-01-31'),(6175,'2008-12-26',0,91,'15.9900',1,'2008-08-25','2009-01-31'),(6176,'2008-12-27',0,91,'15.9900',1,'2008-08-25','2009-01-31'),(6177,'2008-12-28',0,91,'15.9900',1,'2008-08-25','2009-01-31'),(6178,'2008-12-26',0,92,'15.9900',1,'2008-08-25','2009-01-31'),(6179,'2008-12-27',0,92,'15.9900',1,'2008-08-25','2009-01-31'),(6180,'2008-12-28',0,92,'15.9900',1,'2008-08-25','2009-01-31'),(6181,'2008-12-26',0,93,'134.9900',1,'2008-08-06','2009-08-23'),(6182,'2008-12-27',0,93,'134.9900',1,'2008-08-06','2009-08-23'),(6183,'2008-12-28',0,93,'134.9900',1,'2008-08-06','2009-08-23'),(6184,'2008-12-26',0,94,'134.9900',1,'2008-08-06','2009-08-23'),(6185,'2008-12-27',0,94,'134.9900',1,'2008-08-06','2009-08-23'),(6186,'2008-12-28',0,94,'134.9900',1,'2008-08-06','2009-08-23'),(6187,'2008-12-26',0,95,'134.9900',1,'2008-08-06','2009-08-23'),(6188,'2008-12-27',0,95,'134.9900',1,'2008-08-06','2009-08-23'),(6189,'2008-12-28',0,95,'134.9900',1,'2008-08-06','2009-08-23'),(6190,'2008-12-26',0,96,'134.9900',1,'2008-08-06','2009-08-23'),(6191,'2008-12-27',0,96,'134.9900',1,'2008-08-06','2009-08-23'),(6192,'2008-12-28',0,96,'134.9900',1,'2008-08-06','2009-08-23'),(6193,'2008-12-26',0,97,'134.9900',1,'2008-08-06','2009-08-23'),(6194,'2008-12-27',0,97,'134.9900',1,'2008-08-06','2009-08-23'),(6195,'2008-12-28',0,97,'134.9900',1,'2008-08-06','2009-08-23'),(6196,'2008-12-26',0,98,'160.9900',1,'2008-08-06','2009-08-23'),(6197,'2008-12-27',0,98,'160.9900',1,'2008-08-06','2009-08-23'),(6198,'2008-12-28',0,98,'160.9900',1,'2008-08-06','2009-08-23'),(6199,'2008-12-26',0,99,'160.9900',1,'2008-08-06','2009-08-23'),(6200,'2008-12-27',0,99,'160.9900',1,'2008-08-06','2009-08-23'),(6201,'2008-12-28',0,99,'160.9900',1,'2008-08-06','2009-08-23'),(6202,'2008-12-26',0,100,'160.9900',1,'2008-08-06','2009-08-23'),(6203,'2008-12-27',0,100,'160.9900',1,'2008-08-06','2009-08-23'),(6204,'2008-12-28',0,100,'160.9900',1,'2008-08-06','2009-08-23'),(6205,'2008-12-26',0,101,'160.9900',1,'2008-08-06','2009-08-23'),(6206,'2008-12-27',0,101,'160.9900',1,'2008-08-06','2009-08-23'),(6207,'2008-12-28',0,101,'160.9900',1,'2008-08-06','2009-08-23'),(6208,'2008-12-26',0,102,'160.9900',1,'2008-08-06','2009-08-23'),(6209,'2008-12-27',0,102,'160.9900',1,'2008-08-06','2009-08-23'),(6210,'2008-12-28',0,102,'160.9900',1,'2008-08-06','2009-08-23'),(6211,'2008-12-26',0,103,'69.9900',1,'2008-08-25','2009-01-31'),(6212,'2008-12-27',0,103,'69.9900',1,'2008-08-25','2009-01-31'),(6213,'2008-12-28',0,103,'69.9900',1,'2008-08-25','2009-01-31'),(6214,'2008-12-26',0,104,'69.9900',1,'2008-08-25','2009-01-31'),(6215,'2008-12-27',0,104,'69.9900',1,'2008-08-25','2009-01-31'),(6216,'2008-12-28',0,104,'69.9900',1,'2008-08-25','2009-01-31'),(6217,'2008-12-26',0,105,'69.9900',1,'2008-08-25','2009-01-31'),(6218,'2008-12-27',0,105,'69.9900',1,'2008-08-25','2009-01-31'),(6219,'2008-12-28',0,105,'69.9900',1,'2008-08-25','2009-01-31'),(6220,'2008-12-26',0,106,'69.9900',1,'2008-08-25','2009-01-31'),(6221,'2008-12-27',0,106,'69.9900',1,'2008-08-25','2009-01-31'),(6222,'2008-12-28',0,106,'69.9900',1,'2008-08-25','2009-01-31'),(6223,'2008-12-26',0,107,'69.9900',1,'2008-08-25','2009-01-31'),(6224,'2008-12-27',0,107,'69.9900',1,'2008-08-25','2009-01-31'),(6225,'2008-12-28',0,107,'69.9900',1,'2008-08-25','2009-01-31'),(6226,'2008-12-26',0,108,'89.9900',1,'2008-08-25','2009-01-31'),(6227,'2008-12-27',0,108,'89.9900',1,'2008-08-25','2009-01-31'),(6228,'2008-12-28',0,108,'89.9900',1,'2008-08-25','2009-01-31'),(6229,'2008-12-26',0,109,'89.9900',1,'2008-08-25','2009-01-31'),(6230,'2008-12-27',0,109,'89.9900',1,'2008-08-25','2009-01-31'),(6231,'2008-12-28',0,109,'89.9900',1,'2008-08-25','2009-01-31'),(6232,'2008-12-26',0,110,'89.9900',1,'2008-08-25','2009-01-31'),(6233,'2008-12-27',0,110,'89.9900',1,'2008-08-25','2009-01-31'),(6234,'2008-12-28',0,110,'89.9900',1,'2008-08-25','2009-01-31'),(6238,'2008-12-26',0,111,'89.9900',1,'2008-08-25','2009-01-31'),(6239,'2008-12-27',0,111,'89.9900',1,'2008-08-25','2009-01-31'),(6240,'2008-12-28',0,111,'89.9900',1,'2008-08-25','2009-01-31'),(6241,'2008-12-26',0,112,'159.9900',1,'2008-08-06','2009-08-23'),(6242,'2008-12-27',0,112,'159.9900',1,'2008-08-06','2009-08-23'),(6243,'2008-12-28',0,112,'159.9900',1,'2008-08-06','2009-08-23'),(6244,'2008-12-26',0,113,'159.9900',1,'2008-08-06','2009-08-23'),(6245,'2008-12-27',0,113,'159.9900',1,'2008-08-06','2009-08-23'),(6246,'2008-12-28',0,113,'159.9900',1,'2008-08-06','2009-08-23'),(6247,'2008-12-26',0,114,'159.9900',1,'2008-08-06','2009-08-23'),(6248,'2008-12-27',0,114,'159.9900',1,'2008-08-06','2009-08-23'),(6249,'2008-12-28',0,114,'159.9900',1,'2008-08-06','2009-08-23'),(6250,'2008-12-26',0,115,'159.9900',1,'2008-08-06','2009-08-23'),(6251,'2008-12-27',0,115,'159.9900',1,'2008-08-06','2009-08-23'),(6252,'2008-12-28',0,115,'159.9900',1,'2008-08-06','2009-08-23'),(6253,'2008-12-26',0,117,'15.0000',1,'2008-08-28','2009-01-31'),(6254,'2008-12-27',0,117,'15.0000',1,'2008-08-28','2009-01-31'),(6255,'2008-12-28',0,117,'15.0000',1,'2008-08-28','2009-01-31'),(6256,'2008-12-26',0,118,'15.0000',1,'2008-08-25','2009-01-31'),(6257,'2008-12-27',0,118,'15.0000',1,'2008-08-25','2009-01-31'),(6258,'2008-12-28',0,118,'15.0000',1,'2008-08-25','2009-01-31'),(6259,'2008-12-26',0,119,'15.0000',1,'2008-08-28','2009-01-31'),(6260,'2008-12-27',0,119,'15.0000',1,'2008-08-28','2009-01-31'),(6261,'2008-12-28',0,119,'15.0000',1,'2008-08-28','2009-01-31'),(6262,'2008-12-26',0,120,'22.0000',1,'2008-08-25','2009-01-31'),(6263,'2008-12-27',0,120,'22.0000',1,'2008-08-25','2009-01-31'),(6264,'2008-12-28',0,120,'22.0000',1,'2008-08-25','2009-01-31'),(6265,'2008-12-26',0,121,'22.0000',1,'2008-08-28','2009-01-31'),(6266,'2008-12-27',0,121,'22.0000',1,'2008-08-28','2009-01-31'),(6267,'2008-12-28',0,121,'22.0000',1,'2008-08-28','2009-01-31'),(6268,'2008-12-26',0,122,'22.0000',1,'2008-08-28','2009-01-31'),(6269,'2008-12-27',0,122,'22.0000',1,'2008-08-28','2009-01-31'),(6270,'2008-12-28',0,122,'22.0000',1,'2008-08-28','2009-01-31'),(6271,'2008-12-26',0,123,'100.0000',1,'2008-08-25','2009-01-31'),(6272,'2008-12-27',0,123,'100.0000',1,'2008-08-25','2009-01-31'),(6273,'2008-12-28',0,123,'100.0000',1,'2008-08-25','2009-01-31'),(6274,'2008-12-26',0,124,'15.0000',1,'2008-08-28','2009-01-31'),(6275,'2008-12-27',0,124,'15.0000',1,'2008-08-28','2009-01-31'),(6276,'2008-12-28',0,124,'15.0000',1,'2008-08-28','2009-01-31'),(6277,'2008-12-26',0,125,'15.0000',1,'2008-08-25','2009-01-31'),(6278,'2008-12-27',0,125,'15.0000',1,'2008-08-25','2009-01-31'),(6279,'2008-12-28',0,125,'15.0000',1,'2008-08-25','2009-01-31'),(6280,'2008-12-26',0,126,'13.5000',1,'2008-08-28','2009-01-31'),(6281,'2008-12-27',0,126,'13.5000',1,'2008-08-28','2009-01-31'),(6282,'2008-12-28',0,126,'13.5000',1,'2008-08-28','2009-01-31'),(6283,'2008-12-26',0,127,'13.5000',1,'2008-08-28','2009-01-31'),(6284,'2008-12-27',0,127,'13.5000',1,'2008-08-28','2009-01-31'),(6285,'2008-12-28',0,127,'13.5000',1,'2008-08-28','2009-01-31'),(6286,'2008-12-26',0,128,'13.5000',1,'2008-08-28','2009-01-31'),(6287,'2008-12-27',0,128,'13.5000',1,'2008-08-28','2009-01-31'),(6288,'2008-12-28',0,128,'13.5000',1,'2008-08-28','2009-01-31'),(6289,'2008-12-26',0,129,'13.5000',1,'2008-08-28','2009-01-31'),(6290,'2008-12-27',0,129,'13.5000',1,'2008-08-28','2009-01-31'),(6291,'2008-12-28',0,129,'13.5000',1,'2008-08-28','2009-01-31'),(6292,'2008-12-26',0,130,'13.5000',1,'2008-08-25','2009-01-31'),(6293,'2008-12-27',0,130,'13.5000',1,'2008-08-25','2009-01-31'),(6294,'2008-12-28',0,130,'13.5000',1,'2008-08-25','2009-01-31'),(6295,'2008-12-26',0,131,'13.5000',1,'2008-08-28','2009-01-31'),(6296,'2008-12-27',0,131,'13.5000',1,'2008-08-28','2009-01-31'),(6297,'2008-12-28',0,131,'13.5000',1,'2008-08-28','2009-01-31'),(6298,'2008-12-26',0,132,'99.0000',1,'2008-08-25','2009-01-31'),(6299,'2008-12-27',0,132,'99.0000',1,'2008-08-25','2009-01-31'),(6300,'2008-12-28',0,132,'99.0000',1,'2008-08-25','2009-01-31'),(6301,'2008-12-26',0,133,'34.0000',1,'2008-08-25','2009-01-31'),(6302,'2008-12-27',0,133,'34.0000',1,'2008-08-25','2009-01-31'),(6303,'2008-12-28',0,133,'34.0000',1,'2008-08-25','2009-01-31'),(6304,'2008-12-26',0,134,'19.0000',1,'2008-08-25','2009-01-31'),(6305,'2008-12-27',0,134,'19.0000',1,'2008-08-25','2009-01-31'),(6306,'2008-12-28',0,134,'19.0000',1,'2008-08-25','2009-01-31'),(6307,'2008-12-26',0,135,'41.9500',1,'2008-08-25','2009-01-31'),(6308,'2008-12-27',0,135,'41.9500',1,'2008-08-25','2009-01-31'),(6309,'2008-12-28',0,135,'41.9500',1,'2008-08-25','2009-01-31'),(6310,'2008-12-26',0,137,'13.5000',1,'2008-08-28','2009-01-31'),(6311,'2008-12-27',0,137,'13.5000',1,'2008-08-28','2009-01-31'),(6312,'2008-12-28',0,137,'13.5000',1,'2008-08-28','2009-01-31'),(6313,'2008-12-26',0,138,'150.0000',1,'2008-08-06','2009-08-23'),(6314,'2008-12-27',0,138,'150.0000',1,'2008-08-06','2009-08-23'),(6315,'2008-12-28',0,138,'150.0000',1,'2008-08-06','2009-08-23'),(6316,'2008-12-26',0,139,'199.9900',1,'2008-08-06','2009-08-23'),(6317,'2008-12-27',0,139,'199.9900',1,'2008-08-06','2009-08-23'),(6318,'2008-12-28',0,139,'199.9900',1,'2008-08-06','2009-08-23'),(6319,'2008-12-26',0,142,'150.0000',1,'2008-08-06','2009-08-23'),(6320,'2008-12-27',0,142,'150.0000',1,'2008-08-06','2009-08-23'),(6321,'2008-12-28',0,142,'150.0000',1,'2008-08-06','2009-08-23'),(6322,'2008-12-26',0,144,'250.0000',1,'2008-08-06','2009-08-23'),(6323,'2008-12-27',0,144,'250.0000',1,'2008-08-06','2009-08-23'),(6324,'2008-12-28',0,144,'250.0000',1,'2008-08-06','2009-08-23'),(6325,'2008-12-26',0,146,'325.0000',1,'2008-08-06','2009-08-23'),(6326,'2008-12-27',0,146,'325.0000',1,'2008-08-06','2009-08-23'),(6327,'2008-12-28',0,146,'325.0000',1,'2008-08-06','2009-08-23'),(6328,'2008-12-26',0,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6329,'2008-12-27',0,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6330,'2008-12-28',0,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6331,'2008-12-26',1,16,'149.9900',1,'2008-08-06','2009-08-23'),(6332,'2008-12-27',1,16,'149.9900',1,'2008-08-06','2009-08-23'),(6333,'2008-12-28',1,16,'149.9900',1,'2008-08-06','2009-08-23'),(6334,'2008-12-26',1,17,'349.9900',1,'2008-08-06','2009-08-23'),(6335,'2008-12-27',1,17,'349.9900',1,'2008-08-06','2009-08-23'),(6336,'2008-12-28',1,17,'349.9900',1,'2008-08-06','2009-08-23'),(6337,'2008-12-26',1,18,'399.9900',1,'2008-08-06','2009-08-23'),(6338,'2008-12-27',1,18,'399.9900',1,'2008-08-06','2009-08-23'),(6339,'2008-12-28',1,18,'399.9900',1,'2008-08-06','2009-08-23'),(6340,'2008-12-26',1,19,'199.9900',1,'2008-08-06','2009-08-23'),(6341,'2008-12-27',1,19,'199.9900',1,'2008-08-06','2009-08-23'),(6342,'2008-12-28',1,19,'199.9900',1,'2008-08-06','2009-08-23'),(6343,'2008-12-26',1,20,'150.0000',1,'2008-08-06','2009-08-23'),(6344,'2008-12-27',1,20,'150.0000',1,'2008-08-06','2009-08-23'),(6345,'2008-12-28',1,20,'150.0000',1,'2008-08-06','2009-08-23'),(6346,'2008-12-26',1,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6347,'2008-12-27',1,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6348,'2008-12-28',1,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6349,'2008-12-26',1,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6350,'2008-12-27',1,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6351,'2008-12-28',1,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6352,'2008-12-26',1,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6353,'2008-12-27',1,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6354,'2008-12-28',1,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6355,'2008-12-26',1,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6356,'2008-12-27',1,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6357,'2008-12-28',1,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6358,'2008-12-26',1,29,'15.9900',1,'2008-08-25','2009-01-31'),(6359,'2008-12-27',1,29,'15.9900',1,'2008-08-25','2009-01-31'),(6360,'2008-12-28',1,29,'15.9900',1,'2008-08-25','2009-01-31'),(6361,'2008-12-26',1,30,'134.9900',1,'2008-08-06','2009-08-23'),(6362,'2008-12-27',1,30,'134.9900',1,'2008-08-06','2009-08-23'),(6363,'2008-12-28',1,30,'134.9900',1,'2008-08-06','2009-08-23'),(6364,'2008-12-26',1,31,'69.9900',1,'2008-08-25','2009-01-31'),(6365,'2008-12-27',1,31,'69.9900',1,'2008-08-25','2009-01-31'),(6366,'2008-12-28',1,31,'69.9900',1,'2008-08-25','2009-01-31'),(6367,'2008-12-26',1,32,'89.9900',1,'2008-08-25','2009-01-31'),(6368,'2008-12-27',1,32,'89.9900',1,'2008-08-25','2009-01-31'),(6369,'2008-12-28',1,32,'89.9900',1,'2008-08-25','2009-01-31'),(6370,'2008-12-26',1,33,'159.9900',1,'2008-08-06','2009-08-23'),(6371,'2008-12-27',1,33,'159.9900',1,'2008-08-06','2009-08-23'),(6372,'2008-12-28',1,33,'159.9900',1,'2008-08-06','2009-08-23'),(6373,'2008-12-26',1,34,'160.9900',1,'2008-08-06','2009-08-23'),(6374,'2008-12-27',1,34,'160.9900',1,'2008-08-06','2009-08-23'),(6375,'2008-12-28',1,34,'160.9900',1,'2008-08-06','2009-08-23'),(6376,'2008-12-26',1,35,'15.0000',1,'2008-08-25','2009-01-31'),(6377,'2008-12-27',1,35,'15.0000',1,'2008-08-25','2009-01-31'),(6378,'2008-12-28',1,35,'15.0000',1,'2008-08-25','2009-01-31'),(6379,'2008-12-26',1,36,'22.0000',1,'2008-08-28','2009-01-31'),(6380,'2008-12-27',1,36,'22.0000',1,'2008-08-28','2009-01-31'),(6381,'2008-12-28',1,36,'22.0000',1,'2008-08-28','2009-01-31'),(6382,'2008-12-26',1,37,'15.0000',1,'2008-08-28','2009-01-31'),(6383,'2008-12-27',1,37,'15.0000',1,'2008-08-28','2009-01-31'),(6384,'2008-12-28',1,37,'15.0000',1,'2008-08-28','2009-01-31'),(6385,'2008-12-26',1,38,'13.5000',1,'2008-08-28','2009-01-31'),(6386,'2008-12-27',1,38,'13.5000',1,'2008-08-28','2009-01-31'),(6387,'2008-12-28',1,38,'13.5000',1,'2008-08-28','2009-01-31'),(6388,'2008-12-26',1,39,'30.0000',1,'2008-08-28','2009-01-31'),(6389,'2008-12-27',1,39,'30.0000',1,'2008-08-28','2009-01-31'),(6390,'2008-12-28',1,39,'30.0000',1,'2008-08-28','2009-01-31'),(6391,'2008-12-26',1,41,'399.9900',1,'2008-08-24','2009-08-23'),(6392,'2008-12-27',1,41,'399.9900',1,'2008-08-24','2009-08-23'),(6393,'2008-12-28',1,41,'399.9900',1,'2008-08-24','2009-08-23'),(6394,'2008-12-26',1,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6395,'2008-12-27',1,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6396,'2008-12-28',1,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6397,'2008-12-26',1,44,'550.0000',1,'2008-08-06','2009-08-23'),(6398,'2008-12-27',1,44,'550.0000',1,'2008-08-06','2009-08-23'),(6399,'2008-12-28',1,44,'550.0000',1,'2008-08-06','2009-08-23'),(6400,'2008-12-26',1,45,'37.4900',1,'2008-08-25','2009-01-31'),(6401,'2008-12-27',1,45,'37.4900',1,'2008-08-25','2009-01-31'),(6402,'2008-12-28',1,45,'37.4900',1,'2008-08-25','2009-01-31'),(6403,'2008-12-26',1,46,'161.9400',1,'2008-08-06','2009-08-23'),(6404,'2008-12-27',1,46,'161.9400',1,'2008-08-06','2009-08-23'),(6405,'2008-12-28',1,46,'161.9400',1,'2008-08-06','2009-08-23'),(6406,'2008-12-26',1,47,'329.9900',1,'2008-08-06','2009-08-23'),(6407,'2008-12-27',1,47,'329.9900',1,'2008-08-06','2009-08-23'),(6408,'2008-12-28',1,47,'329.9900',1,'2008-08-06','2009-08-23'),(6409,'2008-12-26',1,48,'199.9900',1,'2008-08-06','2009-08-23'),(6410,'2008-12-27',1,48,'199.9900',1,'2008-08-06','2009-08-23'),(6411,'2008-12-28',1,48,'199.9900',1,'2008-08-06','2009-08-23'),(6412,'2008-12-26',1,49,'41.9500',1,'2008-08-25','2009-01-31'),(6413,'2008-12-27',1,49,'41.9500',1,'2008-08-25','2009-01-31'),(6414,'2008-12-28',1,49,'41.9500',1,'2008-08-25','2009-01-31'),(6415,'2008-12-26',1,51,'299.9900',1,'2008-08-06','2009-08-23'),(6416,'2008-12-27',1,51,'299.9900',1,'2008-08-06','2009-08-23'),(6417,'2008-12-28',1,51,'299.9900',1,'2008-08-06','2009-08-23'),(6418,'2008-12-26',1,52,'129.9900',1,'2008-08-24','2009-09-28'),(6419,'2008-12-27',1,52,'129.9900',1,'2008-08-24','2009-09-28'),(6420,'2008-12-28',1,52,'129.9900',1,'2008-08-24','2009-09-28'),(6421,'2008-12-26',1,53,'599.9900',1,'2008-08-06','2009-08-23'),(6422,'2008-12-27',1,53,'599.9900',1,'2008-08-06','2009-08-23'),(6423,'2008-12-28',1,53,'599.9900',1,'2008-08-06','2009-08-23'),(6424,'2008-12-26',1,54,'699.9900',1,'2008-08-06','2009-08-23'),(6425,'2008-12-27',1,54,'699.9900',1,'2008-08-06','2009-08-23'),(6426,'2008-12-28',1,54,'699.9900',1,'2008-08-06','2009-08-23'),(6427,'2008-12-26',1,74,'41.9500',1,'2008-08-25','2009-01-31'),(6428,'2008-12-27',1,74,'41.9500',1,'2008-08-25','2009-01-31'),(6429,'2008-12-28',1,74,'41.9500',1,'2008-08-25','2009-01-31'),(6430,'2008-12-26',1,75,'41.9500',1,'2008-08-25','2009-01-31'),(6431,'2008-12-27',1,75,'41.9500',1,'2008-08-25','2009-01-31'),(6432,'2008-12-28',1,75,'41.9500',1,'2008-08-25','2009-01-31'),(6433,'2008-12-26',1,79,'41.9500',1,'2008-08-25','2009-01-31'),(6434,'2008-12-27',1,79,'41.9500',1,'2008-08-25','2009-01-31'),(6435,'2008-12-28',1,79,'41.9500',1,'2008-08-25','2009-01-31'),(6436,'2008-12-26',1,80,'41.9500',1,'2008-08-25','2009-01-31'),(6437,'2008-12-27',1,80,'41.9500',1,'2008-08-25','2009-01-31'),(6438,'2008-12-28',1,80,'41.9500',1,'2008-08-25','2009-01-31'),(6439,'2008-12-26',1,81,'41.9500',1,'2008-08-25','2009-01-31'),(6440,'2008-12-27',1,81,'41.9500',1,'2008-08-25','2009-01-31'),(6441,'2008-12-28',1,81,'41.9500',1,'2008-08-25','2009-01-31'),(6442,'2008-12-26',1,82,'41.9500',1,'2008-08-25','2009-01-31'),(6443,'2008-12-27',1,82,'41.9500',1,'2008-08-25','2009-01-31'),(6444,'2008-12-28',1,82,'41.9500',1,'2008-08-25','2009-01-31'),(6445,'2008-12-26',1,83,'15.9900',1,'2008-08-25','2009-01-31'),(6446,'2008-12-27',1,83,'15.9900',1,'2008-08-25','2009-01-31'),(6447,'2008-12-28',1,83,'15.9900',1,'2008-08-25','2009-01-31'),(6448,'2008-12-26',1,84,'15.9900',1,'2008-08-25','2009-01-31'),(6449,'2008-12-27',1,84,'15.9900',1,'2008-08-25','2009-01-31'),(6450,'2008-12-28',1,84,'15.9900',1,'2008-08-25','2009-01-31'),(6451,'2008-12-26',1,85,'15.9900',1,'2008-08-25','2009-01-31'),(6452,'2008-12-27',1,85,'15.9900',1,'2008-08-25','2009-01-31'),(6453,'2008-12-28',1,85,'15.9900',1,'2008-08-25','2009-01-31'),(6454,'2008-12-26',1,86,'15.9900',1,'2008-08-25','2009-01-31'),(6455,'2008-12-27',1,86,'15.9900',1,'2008-08-25','2009-01-31'),(6456,'2008-12-28',1,86,'15.9900',1,'2008-08-25','2009-01-31'),(6457,'2008-12-26',1,87,'15.9900',1,'2008-08-25','2009-01-31'),(6458,'2008-12-27',1,87,'15.9900',1,'2008-08-25','2009-01-31'),(6459,'2008-12-28',1,87,'15.9900',1,'2008-08-25','2009-01-31'),(6460,'2008-12-26',1,88,'15.9900',1,'2008-08-25','2009-01-31'),(6461,'2008-12-27',1,88,'15.9900',1,'2008-08-25','2009-01-31'),(6462,'2008-12-28',1,88,'15.9900',1,'2008-08-25','2009-01-31'),(6463,'2008-12-26',1,89,'15.9900',1,'2008-08-25','2009-01-31'),(6464,'2008-12-27',1,89,'15.9900',1,'2008-08-25','2009-01-31'),(6465,'2008-12-28',1,89,'15.9900',1,'2008-08-25','2009-01-31'),(6466,'2008-12-26',1,90,'15.9900',1,'2008-08-25','2009-01-31'),(6467,'2008-12-27',1,90,'15.9900',1,'2008-08-25','2009-01-31'),(6468,'2008-12-28',1,90,'15.9900',1,'2008-08-25','2009-01-31'),(6469,'2008-12-26',1,91,'15.9900',1,'2008-08-25','2009-01-31'),(6470,'2008-12-27',1,91,'15.9900',1,'2008-08-25','2009-01-31'),(6471,'2008-12-28',1,91,'15.9900',1,'2008-08-25','2009-01-31'),(6472,'2008-12-26',1,92,'15.9900',1,'2008-08-25','2009-01-31'),(6473,'2008-12-27',1,92,'15.9900',1,'2008-08-25','2009-01-31'),(6474,'2008-12-28',1,92,'15.9900',1,'2008-08-25','2009-01-31'),(6475,'2008-12-26',1,93,'134.9900',1,'2008-08-06','2009-08-23'),(6476,'2008-12-27',1,93,'134.9900',1,'2008-08-06','2009-08-23'),(6477,'2008-12-28',1,93,'134.9900',1,'2008-08-06','2009-08-23'),(6478,'2008-12-26',1,94,'134.9900',1,'2008-08-06','2009-08-23'),(6479,'2008-12-27',1,94,'134.9900',1,'2008-08-06','2009-08-23'),(6480,'2008-12-28',1,94,'134.9900',1,'2008-08-06','2009-08-23'),(6481,'2008-12-26',1,95,'134.9900',1,'2008-08-06','2009-08-23'),(6482,'2008-12-27',1,95,'134.9900',1,'2008-08-06','2009-08-23'),(6483,'2008-12-28',1,95,'134.9900',1,'2008-08-06','2009-08-23'),(6484,'2008-12-26',1,96,'134.9900',1,'2008-08-06','2009-08-23'),(6485,'2008-12-27',1,96,'134.9900',1,'2008-08-06','2009-08-23'),(6486,'2008-12-28',1,96,'134.9900',1,'2008-08-06','2009-08-23'),(6487,'2008-12-26',1,97,'134.9900',1,'2008-08-06','2009-08-23'),(6488,'2008-12-27',1,97,'134.9900',1,'2008-08-06','2009-08-23'),(6489,'2008-12-28',1,97,'134.9900',1,'2008-08-06','2009-08-23'),(6490,'2008-12-26',1,98,'160.9900',1,'2008-08-06','2009-08-23'),(6491,'2008-12-27',1,98,'160.9900',1,'2008-08-06','2009-08-23'),(6492,'2008-12-28',1,98,'160.9900',1,'2008-08-06','2009-08-23'),(6493,'2008-12-26',1,99,'160.9900',1,'2008-08-06','2009-08-23'),(6494,'2008-12-27',1,99,'160.9900',1,'2008-08-06','2009-08-23'),(6495,'2008-12-28',1,99,'160.9900',1,'2008-08-06','2009-08-23'),(6496,'2008-12-26',1,100,'160.9900',1,'2008-08-06','2009-08-23'),(6497,'2008-12-27',1,100,'160.9900',1,'2008-08-06','2009-08-23'),(6498,'2008-12-28',1,100,'160.9900',1,'2008-08-06','2009-08-23'),(6499,'2008-12-26',1,101,'160.9900',1,'2008-08-06','2009-08-23'),(6500,'2008-12-27',1,101,'160.9900',1,'2008-08-06','2009-08-23'),(6501,'2008-12-28',1,101,'160.9900',1,'2008-08-06','2009-08-23'),(6502,'2008-12-26',1,102,'160.9900',1,'2008-08-06','2009-08-23'),(6503,'2008-12-27',1,102,'160.9900',1,'2008-08-06','2009-08-23'),(6504,'2008-12-28',1,102,'160.9900',1,'2008-08-06','2009-08-23'),(6505,'2008-12-26',1,103,'69.9900',1,'2008-08-25','2009-01-31'),(6506,'2008-12-27',1,103,'69.9900',1,'2008-08-25','2009-01-31'),(6507,'2008-12-28',1,103,'69.9900',1,'2008-08-25','2009-01-31'),(6508,'2008-12-26',1,104,'69.9900',1,'2008-08-25','2009-01-31'),(6509,'2008-12-27',1,104,'69.9900',1,'2008-08-25','2009-01-31'),(6510,'2008-12-28',1,104,'69.9900',1,'2008-08-25','2009-01-31'),(6511,'2008-12-26',1,105,'69.9900',1,'2008-08-25','2009-01-31'),(6512,'2008-12-27',1,105,'69.9900',1,'2008-08-25','2009-01-31'),(6513,'2008-12-28',1,105,'69.9900',1,'2008-08-25','2009-01-31'),(6514,'2008-12-26',1,106,'69.9900',1,'2008-08-25','2009-01-31'),(6515,'2008-12-27',1,106,'69.9900',1,'2008-08-25','2009-01-31'),(6516,'2008-12-28',1,106,'69.9900',1,'2008-08-25','2009-01-31'),(6517,'2008-12-26',1,107,'69.9900',1,'2008-08-25','2009-01-31'),(6518,'2008-12-27',1,107,'69.9900',1,'2008-08-25','2009-01-31'),(6519,'2008-12-28',1,107,'69.9900',1,'2008-08-25','2009-01-31'),(6520,'2008-12-26',1,108,'89.9900',1,'2008-08-25','2009-01-31'),(6521,'2008-12-27',1,108,'89.9900',1,'2008-08-25','2009-01-31'),(6522,'2008-12-28',1,108,'89.9900',1,'2008-08-25','2009-01-31'),(6523,'2008-12-26',1,109,'89.9900',1,'2008-08-25','2009-01-31'),(6524,'2008-12-27',1,109,'89.9900',1,'2008-08-25','2009-01-31'),(6525,'2008-12-28',1,109,'89.9900',1,'2008-08-25','2009-01-31'),(6526,'2008-12-26',1,110,'89.9900',1,'2008-08-25','2009-01-31'),(6527,'2008-12-27',1,110,'89.9900',1,'2008-08-25','2009-01-31'),(6528,'2008-12-28',1,110,'89.9900',1,'2008-08-25','2009-01-31'),(6529,'2008-12-26',1,111,'89.9900',1,'2008-08-25','2009-01-31'),(6530,'2008-12-27',1,111,'89.9900',1,'2008-08-25','2009-01-31'),(6531,'2008-12-28',1,111,'89.9900',1,'2008-08-25','2009-01-31'),(6532,'2008-12-26',1,112,'159.9900',1,'2008-08-06','2009-08-23'),(6533,'2008-12-27',1,112,'159.9900',1,'2008-08-06','2009-08-23'),(6534,'2008-12-28',1,112,'159.9900',1,'2008-08-06','2009-08-23'),(6535,'2008-12-26',1,113,'159.9900',1,'2008-08-06','2009-08-23'),(6536,'2008-12-27',1,113,'159.9900',1,'2008-08-06','2009-08-23'),(6537,'2008-12-28',1,113,'159.9900',1,'2008-08-06','2009-08-23'),(6538,'2008-12-26',1,114,'159.9900',1,'2008-08-06','2009-08-23'),(6539,'2008-12-27',1,114,'159.9900',1,'2008-08-06','2009-08-23'),(6540,'2008-12-28',1,114,'159.9900',1,'2008-08-06','2009-08-23'),(6541,'2008-12-26',1,115,'159.9900',1,'2008-08-06','2009-08-23'),(6542,'2008-12-27',1,115,'159.9900',1,'2008-08-06','2009-08-23'),(6543,'2008-12-28',1,115,'159.9900',1,'2008-08-06','2009-08-23'),(6544,'2008-12-26',1,117,'15.0000',1,'2008-08-25','2009-01-31'),(6545,'2008-12-27',1,117,'15.0000',1,'2008-08-25','2009-01-31'),(6546,'2008-12-28',1,117,'15.0000',1,'2008-08-25','2009-01-31'),(6547,'2008-12-26',1,118,'15.0000',1,'2008-08-28','2009-01-31'),(6548,'2008-12-27',1,118,'15.0000',1,'2008-08-28','2009-01-31'),(6549,'2008-12-28',1,118,'15.0000',1,'2008-08-28','2009-01-31'),(6550,'2008-12-26',1,119,'15.0000',1,'2008-08-28','2009-01-31'),(6551,'2008-12-27',1,119,'15.0000',1,'2008-08-28','2009-01-31'),(6552,'2008-12-28',1,119,'15.0000',1,'2008-08-28','2009-01-31'),(6553,'2008-12-26',1,120,'22.0000',1,'2008-08-25','2009-01-31'),(6554,'2008-12-27',1,120,'22.0000',1,'2008-08-25','2009-01-31'),(6555,'2008-12-28',1,120,'22.0000',1,'2008-08-25','2009-01-31'),(6556,'2008-12-26',1,121,'22.0000',1,'2008-08-28','2009-01-31'),(6557,'2008-12-27',1,121,'22.0000',1,'2008-08-28','2009-01-31'),(6558,'2008-12-28',1,121,'22.0000',1,'2008-08-28','2009-01-31'),(6559,'2008-12-26',1,122,'22.0000',1,'2008-08-25','2009-01-31'),(6560,'2008-12-27',1,122,'22.0000',1,'2008-08-25','2009-01-31'),(6561,'2008-12-28',1,122,'22.0000',1,'2008-08-25','2009-01-31'),(6562,'2008-12-26',1,123,'100.0000',1,'2008-08-28','2009-01-31'),(6563,'2008-12-27',1,123,'100.0000',1,'2008-08-28','2009-01-31'),(6564,'2008-12-28',1,123,'100.0000',1,'2008-08-28','2009-01-31'),(6565,'2008-12-26',1,124,'15.0000',1,'2008-08-28','2009-01-31'),(6566,'2008-12-27',1,124,'15.0000',1,'2008-08-28','2009-01-31'),(6567,'2008-12-28',1,124,'15.0000',1,'2008-08-28','2009-01-31'),(6568,'2008-12-26',1,125,'15.0000',1,'2008-08-28','2009-01-31'),(6569,'2008-12-27',1,125,'15.0000',1,'2008-08-28','2009-01-31'),(6570,'2008-12-28',1,125,'15.0000',1,'2008-08-28','2009-01-31'),(6571,'2008-12-26',1,126,'13.5000',1,'2008-08-28','2009-01-31'),(6572,'2008-12-27',1,126,'13.5000',1,'2008-08-28','2009-01-31'),(6573,'2008-12-28',1,126,'13.5000',1,'2008-08-28','2009-01-31'),(6574,'2008-12-26',1,127,'13.5000',1,'2008-08-25','2009-01-31'),(6575,'2008-12-27',1,127,'13.5000',1,'2008-08-25','2009-01-31'),(6576,'2008-12-28',1,127,'13.5000',1,'2008-08-25','2009-01-31'),(6577,'2008-12-26',1,128,'13.5000',1,'2008-08-28','2009-01-31'),(6578,'2008-12-27',1,128,'13.5000',1,'2008-08-28','2009-01-31'),(6579,'2008-12-28',1,128,'13.5000',1,'2008-08-28','2009-01-31'),(6580,'2008-12-26',1,129,'13.5000',1,'2008-08-28','2009-01-31'),(6581,'2008-12-27',1,129,'13.5000',1,'2008-08-28','2009-01-31'),(6582,'2008-12-28',1,129,'13.5000',1,'2008-08-28','2009-01-31'),(6583,'2008-12-26',1,130,'13.5000',1,'2008-08-28','2009-01-31'),(6584,'2008-12-27',1,130,'13.5000',1,'2008-08-28','2009-01-31'),(6585,'2008-12-28',1,130,'13.5000',1,'2008-08-28','2009-01-31'),(6586,'2008-12-26',1,131,'13.5000',1,'2008-08-28','2009-01-31'),(6587,'2008-12-27',1,131,'13.5000',1,'2008-08-28','2009-01-31'),(6588,'2008-12-28',1,131,'13.5000',1,'2008-08-28','2009-01-31'),(6589,'2008-12-26',1,132,'99.0000',1,'2008-08-25','2009-01-31'),(6590,'2008-12-27',1,132,'99.0000',1,'2008-08-25','2009-01-31'),(6591,'2008-12-28',1,132,'99.0000',1,'2008-08-25','2009-01-31'),(6592,'2008-12-26',1,133,'34.0000',1,'2008-08-25','2009-01-31'),(6593,'2008-12-27',1,133,'34.0000',1,'2008-08-25','2009-01-31'),(6594,'2008-12-28',1,133,'34.0000',1,'2008-08-25','2009-01-31'),(6595,'2008-12-26',1,134,'19.0000',1,'2008-08-25','2009-01-31'),(6596,'2008-12-27',1,134,'19.0000',1,'2008-08-25','2009-01-31'),(6597,'2008-12-28',1,134,'19.0000',1,'2008-08-25','2009-01-31'),(6598,'2008-12-26',1,135,'41.9500',1,'2008-08-27','2009-08-28'),(6599,'2008-12-27',1,135,'41.9500',1,'2008-08-27','2009-08-28'),(6600,'2008-12-28',1,135,'41.9500',1,'2008-08-27','2009-08-28'),(6601,'2008-12-26',1,137,'13.5000',1,'2008-08-28','2009-01-31'),(6602,'2008-12-27',1,137,'13.5000',1,'2008-08-28','2009-01-31'),(6603,'2008-12-28',1,137,'13.5000',1,'2008-08-28','2009-01-31'),(6604,'2008-12-26',1,138,'150.0000',1,'2008-08-06','2009-08-23'),(6605,'2008-12-27',1,138,'150.0000',1,'2008-08-06','2009-08-23'),(6606,'2008-12-28',1,138,'150.0000',1,'2008-08-06','2009-08-23'),(6607,'2008-12-26',1,139,'199.9900',1,'2008-08-06','2009-08-23'),(6608,'2008-12-27',1,139,'199.9900',1,'2008-08-06','2009-08-23'),(6609,'2008-12-28',1,139,'199.9900',1,'2008-08-06','2009-08-23'),(6610,'2008-12-26',1,142,'150.0000',1,'2008-08-06','2009-08-23'),(6611,'2008-12-27',1,142,'150.0000',1,'2008-08-06','2009-08-23'),(6612,'2008-12-28',1,142,'150.0000',1,'2008-08-06','2009-08-23'),(6613,'2008-12-26',1,144,'250.0000',1,'2008-08-06','2009-08-23'),(6614,'2008-12-27',1,144,'250.0000',1,'2008-08-06','2009-08-23'),(6615,'2008-12-28',1,144,'250.0000',1,'2008-08-06','2009-08-23'),(6616,'2008-12-26',1,146,'325.0000',1,'2008-08-06','2009-08-23'),(6617,'2008-12-27',1,146,'325.0000',1,'2008-08-06','2009-08-23'),(6618,'2008-12-28',1,146,'325.0000',1,'2008-08-06','2009-08-23'),(6619,'2008-12-26',1,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6620,'2008-12-27',1,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6621,'2008-12-28',1,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6622,'2008-12-26',2,16,'149.9900',1,'2008-08-06','2009-08-23'),(6623,'2008-12-27',2,16,'149.9900',1,'2008-08-06','2009-08-23'),(6624,'2008-12-28',2,16,'149.9900',1,'2008-08-06','2009-08-23'),(6625,'2008-12-26',2,17,'349.9900',1,'2008-08-06','2009-08-23'),(6626,'2008-12-27',2,17,'349.9900',1,'2008-08-06','2009-08-23'),(6627,'2008-12-28',2,17,'349.9900',1,'2008-08-06','2009-08-23'),(6628,'2008-12-26',2,18,'399.9900',1,'2008-08-06','2009-08-23'),(6629,'2008-12-27',2,18,'399.9900',1,'2008-08-06','2009-08-23'),(6630,'2008-12-28',2,18,'399.9900',1,'2008-08-06','2009-08-23'),(6631,'2008-12-26',2,19,'199.9900',1,'2008-08-06','2009-08-23'),(6632,'2008-12-27',2,19,'199.9900',1,'2008-08-06','2009-08-23'),(6633,'2008-12-28',2,19,'199.9900',1,'2008-08-06','2009-08-23'),(6634,'2008-12-26',2,20,'150.0000',1,'2008-08-06','2009-08-23'),(6635,'2008-12-27',2,20,'150.0000',1,'2008-08-06','2009-08-23'),(6636,'2008-12-28',2,20,'150.0000',1,'2008-08-06','2009-08-23'),(6637,'2008-12-26',2,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6638,'2008-12-27',2,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6639,'2008-12-28',2,25,'2299.9900',1,'2008-08-06','2009-08-23'),(6640,'2008-12-26',2,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6641,'2008-12-27',2,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6642,'2008-12-28',2,26,'1799.9900',1,'2008-08-06','2009-08-23'),(6643,'2008-12-26',2,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6644,'2008-12-27',2,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6645,'2008-12-28',2,27,'2699.9900',1,'2008-08-06','2009-08-23'),(6646,'2008-12-26',2,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6647,'2008-12-27',2,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6648,'2008-12-28',2,28,'1599.9900',1,'2008-08-06','2009-08-23'),(6649,'2008-12-26',2,29,'15.9900',1,'2008-08-25','2009-01-31'),(6650,'2008-12-27',2,29,'15.9900',1,'2008-08-25','2009-01-31'),(6651,'2008-12-28',2,29,'15.9900',1,'2008-08-25','2009-01-31'),(6652,'2008-12-26',2,30,'134.9900',1,'2008-08-06','2009-08-23'),(6653,'2008-12-27',2,30,'134.9900',1,'2008-08-06','2009-08-23'),(6654,'2008-12-28',2,30,'134.9900',1,'2008-08-06','2009-08-23'),(6655,'2008-12-26',2,31,'69.9900',1,'2008-08-25','2009-01-31'),(6656,'2008-12-27',2,31,'69.9900',1,'2008-08-25','2009-01-31'),(6657,'2008-12-28',2,31,'69.9900',1,'2008-08-25','2009-01-31'),(6658,'2008-12-26',2,32,'89.9900',1,'2008-08-25','2009-01-31'),(6659,'2008-12-27',2,32,'89.9900',1,'2008-08-25','2009-01-31'),(6660,'2008-12-28',2,32,'89.9900',1,'2008-08-25','2009-01-31'),(6661,'2008-12-26',2,33,'159.9900',1,'2008-08-06','2009-08-23'),(6662,'2008-12-27',2,33,'159.9900',1,'2008-08-06','2009-08-23'),(6663,'2008-12-28',2,33,'159.9900',1,'2008-08-06','2009-08-23'),(6664,'2008-12-26',2,34,'160.9900',1,'2008-08-06','2009-08-23'),(6665,'2008-12-27',2,34,'160.9900',1,'2008-08-06','2009-08-23'),(6666,'2008-12-28',2,34,'160.9900',1,'2008-08-06','2009-08-23'),(6667,'2008-12-26',2,35,'15.0000',1,'2008-08-28','2009-01-31'),(6668,'2008-12-27',2,35,'15.0000',1,'2008-08-28','2009-01-31'),(6669,'2008-12-28',2,35,'15.0000',1,'2008-08-28','2009-01-31'),(6670,'2008-12-26',2,36,'22.0000',1,'2008-08-28','2009-01-31'),(6671,'2008-12-27',2,36,'22.0000',1,'2008-08-28','2009-01-31'),(6672,'2008-12-28',2,36,'22.0000',1,'2008-08-28','2009-01-31'),(6673,'2008-12-26',2,37,'15.0000',1,'2008-08-25','2009-01-31'),(6674,'2008-12-27',2,37,'15.0000',1,'2008-08-25','2009-01-31'),(6675,'2008-12-28',2,37,'15.0000',1,'2008-08-25','2009-01-31'),(6676,'2008-12-26',2,38,'13.5000',1,'2008-08-28','2009-01-31'),(6677,'2008-12-27',2,38,'13.5000',1,'2008-08-28','2009-01-31'),(6678,'2008-12-28',2,38,'13.5000',1,'2008-08-28','2009-01-31'),(6679,'2008-12-26',2,39,'30.0000',1,'2008-08-28','2009-01-31'),(6680,'2008-12-27',2,39,'30.0000',1,'2008-08-28','2009-01-31'),(6681,'2008-12-28',2,39,'30.0000',1,'2008-08-28','2009-01-31'),(6682,'2008-12-26',2,41,'399.9900',1,'2008-08-24','2009-09-28'),(6683,'2008-12-27',2,41,'399.9900',1,'2008-08-24','2009-09-28'),(6684,'2008-12-28',2,41,'399.9900',1,'2008-08-24','2009-09-28'),(6685,'2008-12-26',2,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6686,'2008-12-27',2,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6687,'2008-12-28',2,42,'2299.0000',1,'2008-08-06','2009-08-23'),(6688,'2008-12-26',2,44,'550.0000',1,'2008-08-06','2009-08-23'),(6689,'2008-12-27',2,44,'550.0000',1,'2008-08-06','2009-08-23'),(6690,'2008-12-28',2,44,'550.0000',1,'2008-08-06','2009-08-23'),(6691,'2008-12-26',2,45,'37.4900',1,'2008-08-25','2009-01-31'),(6692,'2008-12-27',2,45,'37.4900',1,'2008-08-25','2009-01-31'),(6693,'2008-12-28',2,45,'37.4900',1,'2008-08-25','2009-01-31'),(6694,'2008-12-26',2,46,'161.9400',1,'2008-08-06','2009-08-23'),(6695,'2008-12-27',2,46,'161.9400',1,'2008-08-06','2009-08-23'),(6696,'2008-12-28',2,46,'161.9400',1,'2008-08-06','2009-08-23'),(6697,'2008-12-26',2,47,'329.9900',1,'2008-08-06','2009-08-23'),(6698,'2008-12-27',2,47,'329.9900',1,'2008-08-06','2009-08-23'),(6699,'2008-12-28',2,47,'329.9900',1,'2008-08-06','2009-08-23'),(6700,'2008-12-26',2,48,'199.9900',1,'2008-08-06','2009-08-23'),(6701,'2008-12-27',2,48,'199.9900',1,'2008-08-06','2009-08-23'),(6702,'2008-12-28',2,48,'199.9900',1,'2008-08-06','2009-08-23'),(6703,'2008-12-26',2,49,'41.9500',1,'2008-08-25','2009-01-31'),(6704,'2008-12-27',2,49,'41.9500',1,'2008-08-25','2009-01-31'),(6705,'2008-12-28',2,49,'41.9500',1,'2008-08-25','2009-01-31'),(6706,'2008-12-26',2,51,'299.9900',1,'2008-08-06','2009-08-23'),(6707,'2008-12-27',2,51,'299.9900',1,'2008-08-06','2009-08-23'),(6708,'2008-12-28',2,51,'299.9900',1,'2008-08-06','2009-08-23'),(6709,'2008-12-26',2,52,'129.9900',1,'2008-08-24','2009-09-28'),(6710,'2008-12-27',2,52,'129.9900',1,'2008-08-24','2009-09-28'),(6711,'2008-12-28',2,52,'129.9900',1,'2008-08-24','2009-09-28'),(6712,'2008-12-26',2,53,'599.9900',1,'2008-08-06','2009-08-23'),(6713,'2008-12-27',2,53,'599.9900',1,'2008-08-06','2009-08-23'),(6714,'2008-12-28',2,53,'599.9900',1,'2008-08-06','2009-08-23'),(6715,'2008-12-26',2,54,'699.9900',1,'2008-08-06','2009-08-23'),(6716,'2008-12-27',2,54,'699.9900',1,'2008-08-06','2009-08-23'),(6717,'2008-12-28',2,54,'699.9900',1,'2008-08-06','2009-08-23'),(6718,'2008-12-26',2,74,'41.9500',1,'2008-08-25','2009-01-31'),(6719,'2008-12-27',2,74,'41.9500',1,'2008-08-25','2009-01-31'),(6720,'2008-12-28',2,74,'41.9500',1,'2008-08-25','2009-01-31'),(6721,'2008-12-26',2,75,'41.9500',1,'2008-08-25','2009-01-31'),(6722,'2008-12-27',2,75,'41.9500',1,'2008-08-25','2009-01-31'),(6723,'2008-12-28',2,75,'41.9500',1,'2008-08-25','2009-01-31'),(6724,'2008-12-26',2,79,'41.9500',1,'2008-08-25','2009-01-31'),(6725,'2008-12-27',2,79,'41.9500',1,'2008-08-25','2009-01-31'),(6726,'2008-12-28',2,79,'41.9500',1,'2008-08-25','2009-01-31'),(6727,'2008-12-26',2,80,'41.9500',1,'2008-08-25','2009-01-31'),(6728,'2008-12-27',2,80,'41.9500',1,'2008-08-25','2009-01-31'),(6729,'2008-12-28',2,80,'41.9500',1,'2008-08-25','2009-01-31'),(6730,'2008-12-26',2,81,'41.9500',1,'2008-08-25','2009-01-31'),(6731,'2008-12-27',2,81,'41.9500',1,'2008-08-25','2009-01-31'),(6732,'2008-12-28',2,81,'41.9500',1,'2008-08-25','2009-01-31'),(6733,'2008-12-26',2,82,'41.9500',1,'2008-08-25','2009-01-31'),(6734,'2008-12-27',2,82,'41.9500',1,'2008-08-25','2009-01-31'),(6735,'2008-12-28',2,82,'41.9500',1,'2008-08-25','2009-01-31'),(6736,'2008-12-26',2,83,'15.9900',1,'2008-08-25','2009-01-31'),(6737,'2008-12-27',2,83,'15.9900',1,'2008-08-25','2009-01-31'),(6738,'2008-12-28',2,83,'15.9900',1,'2008-08-25','2009-01-31'),(6739,'2008-12-26',2,84,'15.9900',1,'2008-08-25','2009-01-31'),(6740,'2008-12-27',2,84,'15.9900',1,'2008-08-25','2009-01-31'),(6741,'2008-12-28',2,84,'15.9900',1,'2008-08-25','2009-01-31'),(6742,'2008-12-26',2,85,'15.9900',1,'2008-08-25','2009-01-31'),(6743,'2008-12-27',2,85,'15.9900',1,'2008-08-25','2009-01-31'),(6744,'2008-12-28',2,85,'15.9900',1,'2008-08-25','2009-01-31'),(6748,'2008-12-26',2,86,'15.9900',1,'2008-08-25','2009-01-31'),(6749,'2008-12-27',2,86,'15.9900',1,'2008-08-25','2009-01-31'),(6750,'2008-12-28',2,86,'15.9900',1,'2008-08-25','2009-01-31'),(6751,'2008-12-26',2,87,'15.9900',1,'2008-08-25','2009-01-31'),(6752,'2008-12-27',2,87,'15.9900',1,'2008-08-25','2009-01-31'),(6753,'2008-12-28',2,87,'15.9900',1,'2008-08-25','2009-01-31'),(6754,'2008-12-26',2,88,'15.9900',1,'2008-08-25','2009-01-31'),(6755,'2008-12-27',2,88,'15.9900',1,'2008-08-25','2009-01-31'),(6756,'2008-12-28',2,88,'15.9900',1,'2008-08-25','2009-01-31'),(6757,'2008-12-26',2,89,'15.9900',1,'2008-08-25','2009-01-31'),(6758,'2008-12-27',2,89,'15.9900',1,'2008-08-25','2009-01-31'),(6759,'2008-12-28',2,89,'15.9900',1,'2008-08-25','2009-01-31'),(6760,'2008-12-26',2,90,'15.9900',1,'2008-08-25','2009-01-31'),(6761,'2008-12-27',2,90,'15.9900',1,'2008-08-25','2009-01-31'),(6762,'2008-12-28',2,90,'15.9900',1,'2008-08-25','2009-01-31'),(6763,'2008-12-26',2,91,'15.9900',1,'2008-08-25','2009-01-31'),(6764,'2008-12-27',2,91,'15.9900',1,'2008-08-25','2009-01-31'),(6765,'2008-12-28',2,91,'15.9900',1,'2008-08-25','2009-01-31'),(6766,'2008-12-26',2,92,'15.9900',1,'2008-08-25','2009-01-31'),(6767,'2008-12-27',2,92,'15.9900',1,'2008-08-25','2009-01-31'),(6768,'2008-12-28',2,92,'15.9900',1,'2008-08-25','2009-01-31'),(6769,'2008-12-26',2,93,'134.9900',1,'2008-08-06','2009-08-23'),(6770,'2008-12-27',2,93,'134.9900',1,'2008-08-06','2009-08-23'),(6771,'2008-12-28',2,93,'134.9900',1,'2008-08-06','2009-08-23'),(6772,'2008-12-26',2,94,'134.9900',1,'2008-08-06','2009-08-23'),(6773,'2008-12-27',2,94,'134.9900',1,'2008-08-06','2009-08-23'),(6774,'2008-12-28',2,94,'134.9900',1,'2008-08-06','2009-08-23'),(6775,'2008-12-26',2,95,'134.9900',1,'2008-08-06','2009-08-23'),(6776,'2008-12-27',2,95,'134.9900',1,'2008-08-06','2009-08-23'),(6777,'2008-12-28',2,95,'134.9900',1,'2008-08-06','2009-08-23'),(6778,'2008-12-26',2,96,'134.9900',1,'2008-08-06','2009-08-23'),(6779,'2008-12-27',2,96,'134.9900',1,'2008-08-06','2009-08-23'),(6780,'2008-12-28',2,96,'134.9900',1,'2008-08-06','2009-08-23'),(6781,'2008-12-26',2,97,'134.9900',1,'2008-08-06','2009-08-23'),(6782,'2008-12-27',2,97,'134.9900',1,'2008-08-06','2009-08-23'),(6783,'2008-12-28',2,97,'134.9900',1,'2008-08-06','2009-08-23'),(6784,'2008-12-26',2,98,'160.9900',1,'2008-08-06','2009-08-23'),(6785,'2008-12-27',2,98,'160.9900',1,'2008-08-06','2009-08-23'),(6786,'2008-12-28',2,98,'160.9900',1,'2008-08-06','2009-08-23'),(6787,'2008-12-26',2,99,'160.9900',1,'2008-08-06','2009-08-23'),(6788,'2008-12-27',2,99,'160.9900',1,'2008-08-06','2009-08-23'),(6789,'2008-12-28',2,99,'160.9900',1,'2008-08-06','2009-08-23'),(6790,'2008-12-26',2,100,'160.9900',1,'2008-08-06','2009-08-23'),(6791,'2008-12-27',2,100,'160.9900',1,'2008-08-06','2009-08-23'),(6792,'2008-12-28',2,100,'160.9900',1,'2008-08-06','2009-08-23'),(6793,'2008-12-26',2,101,'160.9900',1,'2008-08-06','2009-08-23'),(6794,'2008-12-27',2,101,'160.9900',1,'2008-08-06','2009-08-23'),(6795,'2008-12-28',2,101,'160.9900',1,'2008-08-06','2009-08-23'),(6796,'2008-12-26',2,102,'160.9900',1,'2008-08-06','2009-08-23'),(6797,'2008-12-27',2,102,'160.9900',1,'2008-08-06','2009-08-23'),(6798,'2008-12-28',2,102,'160.9900',1,'2008-08-06','2009-08-23'),(6799,'2008-12-26',2,103,'69.9900',1,'2008-08-25','2009-01-31'),(6800,'2008-12-27',2,103,'69.9900',1,'2008-08-25','2009-01-31'),(6801,'2008-12-28',2,103,'69.9900',1,'2008-08-25','2009-01-31'),(6802,'2008-12-26',2,104,'69.9900',1,'2008-08-25','2009-01-31'),(6803,'2008-12-27',2,104,'69.9900',1,'2008-08-25','2009-01-31'),(6804,'2008-12-28',2,104,'69.9900',1,'2008-08-25','2009-01-31'),(6805,'2008-12-26',2,105,'69.9900',1,'2008-08-25','2009-01-31'),(6806,'2008-12-27',2,105,'69.9900',1,'2008-08-25','2009-01-31'),(6807,'2008-12-28',2,105,'69.9900',1,'2008-08-25','2009-01-31'),(6808,'2008-12-26',2,106,'69.9900',1,'2008-08-25','2009-01-31'),(6809,'2008-12-27',2,106,'69.9900',1,'2008-08-25','2009-01-31'),(6810,'2008-12-28',2,106,'69.9900',1,'2008-08-25','2009-01-31'),(6811,'2008-12-26',2,107,'69.9900',1,'2008-08-25','2009-01-31'),(6812,'2008-12-27',2,107,'69.9900',1,'2008-08-25','2009-01-31'),(6813,'2008-12-28',2,107,'69.9900',1,'2008-08-25','2009-01-31'),(6814,'2008-12-26',2,108,'89.9900',1,'2008-08-25','2009-01-31'),(6815,'2008-12-27',2,108,'89.9900',1,'2008-08-25','2009-01-31'),(6816,'2008-12-28',2,108,'89.9900',1,'2008-08-25','2009-01-31'),(6817,'2008-12-26',2,109,'89.9900',1,'2008-08-25','2009-01-31'),(6818,'2008-12-27',2,109,'89.9900',1,'2008-08-25','2009-01-31'),(6819,'2008-12-28',2,109,'89.9900',1,'2008-08-25','2009-01-31'),(6820,'2008-12-26',2,110,'89.9900',1,'2008-08-25','2009-01-31'),(6821,'2008-12-27',2,110,'89.9900',1,'2008-08-25','2009-01-31'),(6822,'2008-12-28',2,110,'89.9900',1,'2008-08-25','2009-01-31'),(6823,'2008-12-26',2,111,'89.9900',1,'2008-08-25','2009-01-31'),(6824,'2008-12-27',2,111,'89.9900',1,'2008-08-25','2009-01-31'),(6825,'2008-12-28',2,111,'89.9900',1,'2008-08-25','2009-01-31'),(6826,'2008-12-26',2,112,'159.9900',1,'2008-08-06','2009-08-23'),(6827,'2008-12-27',2,112,'159.9900',1,'2008-08-06','2009-08-23'),(6828,'2008-12-28',2,112,'159.9900',1,'2008-08-06','2009-08-23'),(6829,'2008-12-26',2,113,'159.9900',1,'2008-08-06','2009-08-23'),(6830,'2008-12-27',2,113,'159.9900',1,'2008-08-06','2009-08-23'),(6831,'2008-12-28',2,113,'159.9900',1,'2008-08-06','2009-08-23'),(6832,'2008-12-26',2,114,'159.9900',1,'2008-08-06','2009-08-23'),(6833,'2008-12-27',2,114,'159.9900',1,'2008-08-06','2009-08-23'),(6834,'2008-12-28',2,114,'159.9900',1,'2008-08-06','2009-08-23'),(6835,'2008-12-26',2,115,'159.9900',1,'2008-08-06','2009-08-23'),(6836,'2008-12-27',2,115,'159.9900',1,'2008-08-06','2009-08-23'),(6837,'2008-12-28',2,115,'159.9900',1,'2008-08-06','2009-08-23'),(6838,'2008-12-26',2,117,'15.0000',1,'2008-08-25','2009-01-31'),(6839,'2008-12-27',2,117,'15.0000',1,'2008-08-25','2009-01-31'),(6840,'2008-12-28',2,117,'15.0000',1,'2008-08-25','2009-01-31'),(6841,'2008-12-26',2,118,'15.0000',1,'2008-08-28','2009-01-31'),(6842,'2008-12-27',2,118,'15.0000',1,'2008-08-28','2009-01-31'),(6843,'2008-12-28',2,118,'15.0000',1,'2008-08-28','2009-01-31'),(6844,'2008-12-26',2,119,'15.0000',1,'2008-08-25','2009-01-31'),(6845,'2008-12-27',2,119,'15.0000',1,'2008-08-25','2009-01-31'),(6846,'2008-12-28',2,119,'15.0000',1,'2008-08-25','2009-01-31'),(6850,'2008-12-26',2,120,'22.0000',1,'2008-08-25','2009-01-31'),(6851,'2008-12-27',2,120,'22.0000',1,'2008-08-25','2009-01-31'),(6852,'2008-12-28',2,120,'22.0000',1,'2008-08-25','2009-01-31'),(6853,'2008-12-26',2,121,'22.0000',1,'2008-08-28','2009-01-31'),(6854,'2008-12-27',2,121,'22.0000',1,'2008-08-28','2009-01-31'),(6855,'2008-12-28',2,121,'22.0000',1,'2008-08-28','2009-01-31'),(6856,'2008-12-26',2,122,'22.0000',1,'2008-08-28','2009-01-31'),(6857,'2008-12-27',2,122,'22.0000',1,'2008-08-28','2009-01-31'),(6858,'2008-12-28',2,122,'22.0000',1,'2008-08-28','2009-01-31'),(6859,'2008-12-26',2,123,'100.0000',1,'2008-08-28','2009-01-31'),(6860,'2008-12-27',2,123,'100.0000',1,'2008-08-28','2009-01-31'),(6861,'2008-12-28',2,123,'100.0000',1,'2008-08-28','2009-01-31'),(6862,'2008-12-26',2,124,'15.0000',1,'2008-08-25','2009-01-31'),(6863,'2008-12-27',2,124,'15.0000',1,'2008-08-25','2009-01-31'),(6864,'2008-12-28',2,124,'15.0000',1,'2008-08-25','2009-01-31'),(6865,'2008-12-26',2,125,'15.0000',1,'2008-08-28','2009-01-31'),(6866,'2008-12-27',2,125,'15.0000',1,'2008-08-28','2009-01-31'),(6867,'2008-12-28',2,125,'15.0000',1,'2008-08-28','2009-01-31'),(6868,'2008-12-26',2,126,'13.5000',1,'2008-08-28','2009-01-31'),(6869,'2008-12-27',2,126,'13.5000',1,'2008-08-28','2009-01-31'),(6870,'2008-12-28',2,126,'13.5000',1,'2008-08-28','2009-01-31'),(6871,'2008-12-26',2,127,'13.5000',1,'2008-08-28','2009-01-31'),(6872,'2008-12-27',2,127,'13.5000',1,'2008-08-28','2009-01-31'),(6873,'2008-12-28',2,127,'13.5000',1,'2008-08-28','2009-01-31'),(6874,'2008-12-26',2,128,'13.5000',1,'2008-08-28','2009-01-31'),(6875,'2008-12-27',2,128,'13.5000',1,'2008-08-28','2009-01-31'),(6876,'2008-12-28',2,128,'13.5000',1,'2008-08-28','2009-01-31'),(6877,'2008-12-26',2,129,'13.5000',1,'2008-08-25','2009-01-31'),(6878,'2008-12-27',2,129,'13.5000',1,'2008-08-25','2009-01-31'),(6879,'2008-12-28',2,129,'13.5000',1,'2008-08-25','2009-01-31'),(6880,'2008-12-26',2,130,'13.5000',1,'2008-08-28','2009-01-31'),(6881,'2008-12-27',2,130,'13.5000',1,'2008-08-28','2009-01-31'),(6882,'2008-12-28',2,130,'13.5000',1,'2008-08-28','2009-01-31'),(6883,'2008-12-26',2,131,'13.5000',1,'2008-08-28','2009-01-31'),(6884,'2008-12-27',2,131,'13.5000',1,'2008-08-28','2009-01-31'),(6885,'2008-12-28',2,131,'13.5000',1,'2008-08-28','2009-01-31'),(6886,'2008-12-26',2,132,'99.0000',1,'2008-08-25','2009-01-31'),(6887,'2008-12-27',2,132,'99.0000',1,'2008-08-25','2009-01-31'),(6888,'2008-12-28',2,132,'99.0000',1,'2008-08-25','2009-01-31'),(6889,'2008-12-26',2,133,'34.0000',1,'2008-08-25','2009-01-31'),(6890,'2008-12-27',2,133,'34.0000',1,'2008-08-25','2009-01-31'),(6891,'2008-12-28',2,133,'34.0000',1,'2008-08-25','2009-01-31'),(6892,'2008-12-26',2,134,'19.0000',1,'2008-08-25','2009-01-31'),(6893,'2008-12-27',2,134,'19.0000',1,'2008-08-25','2009-01-31'),(6894,'2008-12-28',2,134,'19.0000',1,'2008-08-25','2009-01-31'),(6895,'2008-12-26',2,135,'41.9500',1,'2008-08-27','2009-08-28'),(6896,'2008-12-27',2,135,'41.9500',1,'2008-08-27','2009-08-28'),(6897,'2008-12-28',2,135,'41.9500',1,'2008-08-27','2009-08-28'),(6898,'2008-12-26',2,137,'13.5000',1,'2008-08-25','2009-01-31'),(6899,'2008-12-27',2,137,'13.5000',1,'2008-08-25','2009-01-31'),(6900,'2008-12-28',2,137,'13.5000',1,'2008-08-25','2009-01-31'),(6901,'2008-12-26',2,138,'150.0000',1,'2008-08-06','2009-08-23'),(6902,'2008-12-27',2,138,'150.0000',1,'2008-08-06','2009-08-23'),(6903,'2008-12-28',2,138,'150.0000',1,'2008-08-06','2009-08-23'),(6904,'2008-12-26',2,139,'199.9900',1,'2008-08-06','2009-08-23'),(6905,'2008-12-27',2,139,'199.9900',1,'2008-08-06','2009-08-23'),(6906,'2008-12-28',2,139,'199.9900',1,'2008-08-06','2009-08-23'),(6907,'2008-12-26',2,142,'150.0000',1,'2008-08-06','2009-08-23'),(6908,'2008-12-27',2,142,'150.0000',1,'2008-08-06','2009-08-23'),(6909,'2008-12-28',2,142,'150.0000',1,'2008-08-06','2009-08-23'),(6910,'2008-12-26',2,144,'250.0000',1,'2008-08-06','2009-08-23'),(6911,'2008-12-27',2,144,'250.0000',1,'2008-08-06','2009-08-23'),(6912,'2008-12-28',2,144,'250.0000',1,'2008-08-06','2009-08-23'),(6913,'2008-12-26',2,146,'325.0000',1,'2008-08-06','2009-08-23'),(6914,'2008-12-27',2,146,'325.0000',1,'2008-08-06','2009-08-23'),(6915,'2008-12-28',2,146,'325.0000',1,'2008-08-06','2009-08-23'),(6916,'2008-12-26',2,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6917,'2008-12-27',2,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6918,'2008-12-28',2,164,'4999.9500',1,'2008-08-06','2009-08-23'),(6919,'2008-12-26',3,29,'15.9900',1,'2008-08-25','2009-01-31'),(6920,'2008-12-27',3,29,'15.9900',1,'2008-08-25','2009-01-31'),(6921,'2008-12-28',3,29,'15.9900',1,'2008-08-25','2009-01-31'),(6922,'2008-12-26',3,31,'69.9900',1,'2008-08-25','2009-01-31'),(6923,'2008-12-27',3,31,'69.9900',1,'2008-08-25','2009-01-31'),(6924,'2008-12-28',3,31,'69.9900',1,'2008-08-25','2009-01-31'),(6925,'2008-12-26',3,32,'89.9900',1,'2008-08-25','2009-01-31'),(6926,'2008-12-27',3,32,'89.9900',1,'2008-08-25','2009-01-31'),(6927,'2008-12-28',3,32,'89.9900',1,'2008-08-25','2009-01-31'),(6928,'2008-12-26',3,35,'15.0000',1,'2008-08-25','2009-01-31'),(6929,'2008-12-27',3,35,'15.0000',1,'2008-08-25','2009-01-31'),(6930,'2008-12-28',3,35,'15.0000',1,'2008-08-25','2009-01-31'),(6931,'2008-12-26',3,36,'22.0000',1,'2008-08-25','2009-01-31'),(6932,'2008-12-27',3,36,'22.0000',1,'2008-08-25','2009-01-31'),(6933,'2008-12-28',3,36,'22.0000',1,'2008-08-25','2009-01-31'),(6934,'2008-12-26',3,37,'15.0000',1,'2008-08-25','2009-01-31'),(6935,'2008-12-27',3,37,'15.0000',1,'2008-08-25','2009-01-31'),(6936,'2008-12-28',3,37,'15.0000',1,'2008-08-25','2009-01-31'),(6937,'2008-12-26',3,38,'13.5000',1,'2008-08-25','2009-01-31'),(6938,'2008-12-27',3,38,'13.5000',1,'2008-08-25','2009-01-31'),(6939,'2008-12-28',3,38,'13.5000',1,'2008-08-25','2009-01-31'),(6940,'2008-12-26',3,39,'30.0000',1,'2008-08-25','2009-01-31'),(6941,'2008-12-27',3,39,'30.0000',1,'2008-08-25','2009-01-31'),(6942,'2008-12-28',3,39,'30.0000',1,'2008-08-25','2009-01-31'),(6943,'2008-12-26',3,45,'37.4900',1,'2008-08-25','2009-01-31'),(6944,'2008-12-27',3,45,'37.4900',1,'2008-08-25','2009-01-31'),(6945,'2008-12-28',3,45,'37.4900',1,'2008-08-25','2009-01-31'),(6946,'2008-12-26',3,49,'41.9500',1,'2008-08-25','2009-01-31'),(6947,'2008-12-27',3,49,'41.9500',1,'2008-08-25','2009-01-31'),(6948,'2008-12-28',3,49,'41.9500',1,'2008-08-25','2009-01-31'),(6949,'2008-12-26',3,74,'41.9500',1,'2008-08-25','2009-01-31'),(6950,'2008-12-27',3,74,'41.9500',1,'2008-08-25','2009-01-31'),(6951,'2008-12-28',3,74,'41.9500',1,'2008-08-25','2009-01-31'),(6952,'2008-12-26',3,75,'41.9500',1,'2008-08-25','2009-01-31'),(6953,'2008-12-27',3,75,'41.9500',1,'2008-08-25','2009-01-31'),(6954,'2008-12-28',3,75,'41.9500',1,'2008-08-25','2009-01-31'),(6955,'2008-12-26',3,79,'41.9500',1,'2008-08-25','2009-01-31'),(6956,'2008-12-27',3,79,'41.9500',1,'2008-08-25','2009-01-31'),(6957,'2008-12-28',3,79,'41.9500',1,'2008-08-25','2009-01-31'),(6958,'2008-12-26',3,80,'41.9500',1,'2008-08-25','2009-01-31'),(6959,'2008-12-27',3,80,'41.9500',1,'2008-08-25','2009-01-31'),(6960,'2008-12-28',3,80,'41.9500',1,'2008-08-25','2009-01-31'),(6961,'2008-12-26',3,81,'41.9500',1,'2008-08-25','2009-01-31'),(6962,'2008-12-27',3,81,'41.9500',1,'2008-08-25','2009-01-31'),(6963,'2008-12-28',3,81,'41.9500',1,'2008-08-25','2009-01-31'),(6964,'2008-12-26',3,82,'41.9500',1,'2008-08-25','2009-01-31'),(6965,'2008-12-27',3,82,'41.9500',1,'2008-08-25','2009-01-31'),(6966,'2008-12-28',3,82,'41.9500',1,'2008-08-25','2009-01-31'),(6967,'2008-12-26',3,83,'15.9900',1,'2008-08-25','2009-01-31'),(6968,'2008-12-27',3,83,'15.9900',1,'2008-08-25','2009-01-31'),(6969,'2008-12-28',3,83,'15.9900',1,'2008-08-25','2009-01-31'),(6970,'2008-12-26',3,84,'15.9900',1,'2008-08-25','2009-01-31'),(6971,'2008-12-27',3,84,'15.9900',1,'2008-08-25','2009-01-31'),(6972,'2008-12-28',3,84,'15.9900',1,'2008-08-25','2009-01-31'),(6973,'2008-12-26',3,85,'15.9900',1,'2008-08-25','2009-01-31'),(6974,'2008-12-27',3,85,'15.9900',1,'2008-08-25','2009-01-31'),(6975,'2008-12-28',3,85,'15.9900',1,'2008-08-25','2009-01-31'),(6976,'2008-12-26',3,86,'15.9900',1,'2008-08-25','2009-01-31'),(6977,'2008-12-27',3,86,'15.9900',1,'2008-08-25','2009-01-31'),(6978,'2008-12-28',3,86,'15.9900',1,'2008-08-25','2009-01-31'),(6979,'2008-12-26',3,87,'15.9900',1,'2008-08-25','2009-01-31'),(6980,'2008-12-27',3,87,'15.9900',1,'2008-08-25','2009-01-31'),(6981,'2008-12-28',3,87,'15.9900',1,'2008-08-25','2009-01-31'),(6982,'2008-12-26',3,88,'15.9900',1,'2008-08-25','2009-01-31'),(6983,'2008-12-27',3,88,'15.9900',1,'2008-08-25','2009-01-31'),(6984,'2008-12-28',3,88,'15.9900',1,'2008-08-25','2009-01-31'),(6985,'2008-12-26',3,89,'15.9900',1,'2008-08-25','2009-01-31'),(6986,'2008-12-27',3,89,'15.9900',1,'2008-08-25','2009-01-31'),(6987,'2008-12-28',3,89,'15.9900',1,'2008-08-25','2009-01-31'),(6988,'2008-12-26',3,90,'15.9900',1,'2008-08-25','2009-01-31'),(6989,'2008-12-27',3,90,'15.9900',1,'2008-08-25','2009-01-31'),(6990,'2008-12-28',3,90,'15.9900',1,'2008-08-25','2009-01-31'),(6991,'2008-12-26',3,91,'15.9900',1,'2008-08-25','2009-01-31'),(6992,'2008-12-27',3,91,'15.9900',1,'2008-08-25','2009-01-31'),(6993,'2008-12-28',3,91,'15.9900',1,'2008-08-25','2009-01-31'),(6994,'2008-12-26',3,92,'15.9900',1,'2008-08-25','2009-01-31'),(6995,'2008-12-27',3,92,'15.9900',1,'2008-08-25','2009-01-31'),(6996,'2008-12-28',3,92,'15.9900',1,'2008-08-25','2009-01-31'),(6997,'2008-12-26',3,103,'69.9900',1,'2008-08-25','2009-01-31'),(6998,'2008-12-27',3,103,'69.9900',1,'2008-08-25','2009-01-31'),(6999,'2008-12-28',3,103,'69.9900',1,'2008-08-25','2009-01-31'),(7000,'2008-12-26',3,104,'69.9900',1,'2008-08-25','2009-01-31'),(7001,'2008-12-27',3,104,'69.9900',1,'2008-08-25','2009-01-31'),(7002,'2008-12-28',3,104,'69.9900',1,'2008-08-25','2009-01-31'),(7003,'2008-12-26',3,105,'69.9900',1,'2008-08-25','2009-01-31'),(7004,'2008-12-27',3,105,'69.9900',1,'2008-08-25','2009-01-31'),(7005,'2008-12-28',3,105,'69.9900',1,'2008-08-25','2009-01-31'),(7006,'2008-12-26',3,106,'69.9900',1,'2008-08-25','2009-01-31'),(7007,'2008-12-27',3,106,'69.9900',1,'2008-08-25','2009-01-31'),(7008,'2008-12-28',3,106,'69.9900',1,'2008-08-25','2009-01-31'),(7009,'2008-12-26',3,107,'69.9900',1,'2008-08-25','2009-01-31'),(7010,'2008-12-27',3,107,'69.9900',1,'2008-08-25','2009-01-31'),(7011,'2008-12-28',3,107,'69.9900',1,'2008-08-25','2009-01-31'),(7012,'2008-12-26',3,108,'89.9900',1,'2008-08-25','2009-01-31'),(7013,'2008-12-27',3,108,'89.9900',1,'2008-08-25','2009-01-31'),(7014,'2008-12-28',3,108,'89.9900',1,'2008-08-25','2009-01-31'),(7015,'2008-12-26',3,109,'89.9900',1,'2008-08-25','2009-01-31'),(7016,'2008-12-27',3,109,'89.9900',1,'2008-08-25','2009-01-31'),(7017,'2008-12-28',3,109,'89.9900',1,'2008-08-25','2009-01-31'),(7018,'2008-12-26',3,110,'89.9900',1,'2008-08-25','2009-01-31'),(7019,'2008-12-27',3,110,'89.9900',1,'2008-08-25','2009-01-31'),(7020,'2008-12-28',3,110,'89.9900',1,'2008-08-25','2009-01-31'),(7021,'2008-12-26',3,111,'89.9900',1,'2008-08-25','2009-01-31'),(7022,'2008-12-27',3,111,'89.9900',1,'2008-08-25','2009-01-31'),(7023,'2008-12-28',3,111,'89.9900',1,'2008-08-25','2009-01-31'),(7024,'2008-12-26',3,117,'15.0000',1,'2008-08-25','2009-01-31'),(7025,'2008-12-27',3,117,'15.0000',1,'2008-08-25','2009-01-31'),(7026,'2008-12-28',3,117,'15.0000',1,'2008-08-25','2009-01-31'),(7027,'2008-12-26',3,118,'15.0000',1,'2008-08-25','2009-01-31'),(7028,'2008-12-27',3,118,'15.0000',1,'2008-08-25','2009-01-31'),(7029,'2008-12-28',3,118,'15.0000',1,'2008-08-25','2009-01-31'),(7030,'2008-12-26',3,119,'15.0000',1,'2008-08-25','2009-01-31'),(7031,'2008-12-27',3,119,'15.0000',1,'2008-08-25','2009-01-31'),(7032,'2008-12-28',3,119,'15.0000',1,'2008-08-25','2009-01-31'),(7033,'2008-12-26',3,120,'22.0000',1,'2008-08-25','2009-01-31'),(7034,'2008-12-27',3,120,'22.0000',1,'2008-08-25','2009-01-31'),(7035,'2008-12-28',3,120,'22.0000',1,'2008-08-25','2009-01-31'),(7036,'2008-12-26',3,121,'22.0000',1,'2008-08-25','2009-01-31'),(7037,'2008-12-27',3,121,'22.0000',1,'2008-08-25','2009-01-31'),(7038,'2008-12-28',3,121,'22.0000',1,'2008-08-25','2009-01-31'),(7039,'2008-12-26',3,122,'22.0000',1,'2008-08-25','2009-01-31'),(7040,'2008-12-27',3,122,'22.0000',1,'2008-08-25','2009-01-31'),(7041,'2008-12-28',3,122,'22.0000',1,'2008-08-25','2009-01-31'),(7042,'2008-12-26',3,123,'100.0000',1,'2008-08-25','2009-01-31'),(7043,'2008-12-27',3,123,'100.0000',1,'2008-08-25','2009-01-31'),(7044,'2008-12-28',3,123,'100.0000',1,'2008-08-25','2009-01-31'),(7045,'2008-12-26',3,124,'15.0000',1,'2008-08-25','2009-01-31'),(7046,'2008-12-27',3,124,'15.0000',1,'2008-08-25','2009-01-31'),(7047,'2008-12-28',3,124,'15.0000',1,'2008-08-25','2009-01-31'),(7048,'2008-12-26',3,125,'15.0000',1,'2008-08-25','2009-01-31'),(7049,'2008-12-27',3,125,'15.0000',1,'2008-08-25','2009-01-31'),(7050,'2008-12-28',3,125,'15.0000',1,'2008-08-25','2009-01-31'),(7051,'2008-12-26',3,126,'13.5000',1,'2008-08-25','2009-01-31'),(7052,'2008-12-27',3,126,'13.5000',1,'2008-08-25','2009-01-31'),(7053,'2008-12-28',3,126,'13.5000',1,'2008-08-25','2009-01-31'),(7054,'2008-12-26',3,127,'13.5000',1,'2008-08-25','2009-01-31'),(7055,'2008-12-27',3,127,'13.5000',1,'2008-08-25','2009-01-31'),(7056,'2008-12-28',3,127,'13.5000',1,'2008-08-25','2009-01-31'),(7057,'2008-12-26',3,128,'13.5000',1,'2008-08-25','2009-01-31'),(7058,'2008-12-27',3,128,'13.5000',1,'2008-08-25','2009-01-31'),(7059,'2008-12-28',3,128,'13.5000',1,'2008-08-25','2009-01-31'),(7060,'2008-12-26',3,129,'13.5000',1,'2008-08-25','2009-01-31'),(7061,'2008-12-27',3,129,'13.5000',1,'2008-08-25','2009-01-31'),(7062,'2008-12-28',3,129,'13.5000',1,'2008-08-25','2009-01-31'),(7063,'2008-12-26',3,130,'13.5000',1,'2008-08-25','2009-01-31'),(7064,'2008-12-27',3,130,'13.5000',1,'2008-08-25','2009-01-31'),(7065,'2008-12-28',3,130,'13.5000',1,'2008-08-25','2009-01-31'),(7066,'2008-12-26',3,131,'13.5000',1,'2008-08-25','2009-01-31'),(7067,'2008-12-27',3,131,'13.5000',1,'2008-08-25','2009-01-31'),(7068,'2008-12-28',3,131,'13.5000',1,'2008-08-25','2009-01-31'),(7069,'2008-12-26',3,132,'99.0000',1,'2008-08-25','2009-01-31'),(7070,'2008-12-27',3,132,'99.0000',1,'2008-08-25','2009-01-31'),(7071,'2008-12-28',3,132,'99.0000',1,'2008-08-25','2009-01-31'),(7072,'2008-12-26',3,133,'34.0000',1,'2008-08-25','2009-01-31'),(7073,'2008-12-27',3,133,'34.0000',1,'2008-08-25','2009-01-31'),(7074,'2008-12-28',3,133,'34.0000',1,'2008-08-25','2009-01-31'),(7075,'2008-12-26',3,134,'19.0000',1,'2008-08-25','2009-01-31'),(7076,'2008-12-27',3,134,'19.0000',1,'2008-08-25','2009-01-31'),(7077,'2008-12-28',3,134,'19.0000',1,'2008-08-25','2009-01-31'),(7078,'2008-12-26',3,135,'41.9500',1,'2008-08-25','2009-01-31'),(7079,'2008-12-27',3,135,'41.9500',1,'2008-08-25','2009-01-31'),(7080,'2008-12-28',3,135,'41.9500',1,'2008-08-25','2009-01-31'),(7081,'2008-12-26',3,137,'13.5000',1,'2008-08-25','2009-01-31'),(7082,'2008-12-27',3,137,'13.5000',1,'2008-08-25','2009-01-31'),(7083,'2008-12-28',3,137,'13.5000',1,'2008-08-25','2009-01-31'),(7084,'2008-12-26',4,16,'149.9900',1,'2008-08-06','2009-08-23'),(7085,'2008-12-27',4,16,'149.9900',1,'2008-08-06','2009-08-23'),(7086,'2008-12-28',4,16,'149.9900',1,'2008-08-06','2009-08-23'),(7087,'2008-12-26',4,17,'349.9900',1,'2008-08-06','2009-08-23'),(7088,'2008-12-27',4,17,'349.9900',1,'2008-08-06','2009-08-23'),(7089,'2008-12-28',4,17,'349.9900',1,'2008-08-06','2009-08-23'),(7090,'2008-12-26',4,18,'399.9900',1,'2008-08-06','2009-08-23'),(7091,'2008-12-27',4,18,'399.9900',1,'2008-08-06','2009-08-23'),(7092,'2008-12-28',4,18,'399.9900',1,'2008-08-06','2009-08-23'),(7093,'2008-12-26',4,19,'199.9900',1,'2008-08-06','2009-08-23'),(7094,'2008-12-27',4,19,'199.9900',1,'2008-08-06','2009-08-23'),(7095,'2008-12-28',4,19,'199.9900',1,'2008-08-06','2009-08-23'),(7096,'2008-12-26',4,20,'150.0000',1,'2008-08-06','2009-08-23'),(7097,'2008-12-27',4,20,'150.0000',1,'2008-08-06','2009-08-23'),(7098,'2008-12-28',4,20,'150.0000',1,'2008-08-06','2009-08-23'),(7099,'2008-12-26',4,25,'2299.9900',1,'2008-08-06','2009-08-23'),(7100,'2008-12-27',4,25,'2299.9900',1,'2008-08-06','2009-08-23'),(7101,'2008-12-28',4,25,'2299.9900',1,'2008-08-06','2009-08-23'),(7102,'2008-12-26',4,26,'1799.9900',1,'2008-08-06','2009-08-23'),(7103,'2008-12-27',4,26,'1799.9900',1,'2008-08-06','2009-08-23'),(7104,'2008-12-28',4,26,'1799.9900',1,'2008-08-06','2009-08-23'),(7105,'2008-12-26',4,27,'2699.9900',1,'2008-08-06','2009-08-23'),(7106,'2008-12-27',4,27,'2699.9900',1,'2008-08-06','2009-08-23'),(7107,'2008-12-28',4,27,'2699.9900',1,'2008-08-06','2009-08-23'),(7108,'2008-12-26',4,28,'1599.9900',1,'2008-08-06','2009-08-23'),(7109,'2008-12-27',4,28,'1599.9900',1,'2008-08-06','2009-08-23'),(7110,'2008-12-28',4,28,'1599.9900',1,'2008-08-06','2009-08-23'),(7111,'2008-12-26',4,29,'15.9900',1,'2008-08-06','2009-08-23'),(7112,'2008-12-27',4,29,'15.9900',1,'2008-08-06','2009-08-23'),(7113,'2008-12-28',4,29,'15.9900',1,'2008-08-06','2009-08-23'),(7114,'2008-12-26',4,30,'134.9900',1,'2008-08-06','2009-08-23'),(7115,'2008-12-27',4,30,'134.9900',1,'2008-08-06','2009-08-23'),(7116,'2008-12-28',4,30,'134.9900',1,'2008-08-06','2009-08-23'),(7117,'2008-12-26',4,31,'69.9900',1,'2008-08-06','2009-08-23'),(7118,'2008-12-27',4,31,'69.9900',1,'2008-08-06','2009-08-23'),(7119,'2008-12-28',4,31,'69.9900',1,'2008-08-06','2009-08-23'),(7120,'2008-12-26',4,32,'89.9900',1,'2008-08-06','2009-08-23'),(7121,'2008-12-27',4,32,'89.9900',1,'2008-08-06','2009-08-23'),(7122,'2008-12-28',4,32,'89.9900',1,'2008-08-06','2009-08-23'),(7123,'2008-12-26',4,33,'159.9900',1,'2008-08-06','2009-08-23'),(7124,'2008-12-27',4,33,'159.9900',1,'2008-08-06','2009-08-23'),(7125,'2008-12-28',4,33,'159.9900',1,'2008-08-06','2009-08-23'),(7126,'2008-12-26',4,34,'160.9900',1,'2008-08-06','2009-08-23'),(7127,'2008-12-27',4,34,'160.9900',1,'2008-08-06','2009-08-23'),(7128,'2008-12-28',4,34,'160.9900',1,'2008-08-06','2009-08-23'),(7129,'2008-12-26',4,35,'15.0000',1,'2008-08-06','2009-08-23'),(7130,'2008-12-27',4,35,'15.0000',1,'2008-08-06','2009-08-23'),(7131,'2008-12-28',4,35,'15.0000',1,'2008-08-06','2009-08-23'),(7132,'2008-12-26',4,36,'22.0000',1,'2008-08-06','2009-08-23'),(7133,'2008-12-27',4,36,'22.0000',1,'2008-08-06','2009-08-23'),(7134,'2008-12-28',4,36,'22.0000',1,'2008-08-06','2009-08-23'),(7135,'2008-12-26',4,37,'15.0000',1,'2008-08-06','2009-08-23'),(7136,'2008-12-27',4,37,'15.0000',1,'2008-08-06','2009-08-23'),(7137,'2008-12-28',4,37,'15.0000',1,'2008-08-06','2009-08-23'),(7138,'2008-12-26',4,38,'13.5000',1,'2008-08-06','2009-08-23'),(7139,'2008-12-27',4,38,'13.5000',1,'2008-08-06','2009-08-23'),(7140,'2008-12-28',4,38,'13.5000',1,'2008-08-06','2009-08-23'),(7141,'2008-12-26',4,39,'30.0000',1,'2008-08-06','2009-08-23'),(7142,'2008-12-27',4,39,'30.0000',1,'2008-08-06','2009-08-23'),(7143,'2008-12-28',4,39,'30.0000',1,'2008-08-06','2009-08-23'),(7144,'2008-12-26',4,41,'399.9900',1,'2008-08-24','2009-09-28'),(7145,'2008-12-27',4,41,'399.9900',1,'2008-08-24','2009-09-28'),(7146,'2008-12-28',4,41,'399.9900',1,'2008-08-24','2009-09-28'),(7147,'2008-12-26',4,42,'2299.0000',1,'2008-08-06','2009-08-23'),(7148,'2008-12-27',4,42,'2299.0000',1,'2008-08-06','2009-08-23'),(7149,'2008-12-28',4,42,'2299.0000',1,'2008-08-06','2009-08-23'),(7150,'2008-12-26',4,44,'550.0000',1,'2008-08-06','2009-08-23'),(7151,'2008-12-27',4,44,'550.0000',1,'2008-08-06','2009-08-23'),(7152,'2008-12-28',4,44,'550.0000',1,'2008-08-06','2009-08-23'),(7153,'2008-12-26',4,45,'37.4900',1,'2008-08-06','2009-08-23'),(7154,'2008-12-27',4,45,'37.4900',1,'2008-08-06','2009-08-23'),(7155,'2008-12-28',4,45,'37.4900',1,'2008-08-06','2009-08-23'),(7156,'2008-12-26',4,46,'161.9400',1,'2008-08-06','2009-08-23'),(7157,'2008-12-27',4,46,'161.9400',1,'2008-08-06','2009-08-23'),(7158,'2008-12-28',4,46,'161.9400',1,'2008-08-06','2009-08-23'),(7159,'2008-12-26',4,47,'329.9900',1,'2008-08-06','2009-08-23'),(7160,'2008-12-27',4,47,'329.9900',1,'2008-08-06','2009-08-23'),(7161,'2008-12-28',4,47,'329.9900',1,'2008-08-06','2009-08-23'),(7162,'2008-12-26',4,48,'199.9900',1,'2008-08-06','2009-08-23'),(7163,'2008-12-27',4,48,'199.9900',1,'2008-08-06','2009-08-23'),(7164,'2008-12-28',4,48,'199.9900',1,'2008-08-06','2009-08-23'),(7165,'2008-12-26',4,49,'41.9500',1,'2008-08-06','2009-08-23'),(7166,'2008-12-27',4,49,'41.9500',1,'2008-08-06','2009-08-23'),(7167,'2008-12-28',4,49,'41.9500',1,'2008-08-06','2009-08-23'),(7168,'2008-12-26',4,51,'299.9900',1,'2008-08-06','2009-08-23'),(7169,'2008-12-27',4,51,'299.9900',1,'2008-08-06','2009-08-23'),(7170,'2008-12-28',4,51,'299.9900',1,'2008-08-06','2009-08-23'),(7171,'2008-12-26',4,52,'129.9900',1,'2008-08-24','2009-09-28'),(7172,'2008-12-27',4,52,'129.9900',1,'2008-08-24','2009-09-28'),(7173,'2008-12-28',4,52,'129.9900',1,'2008-08-24','2009-09-28'),(7174,'2008-12-26',4,53,'599.9900',1,'2008-08-06','2009-08-23'),(7175,'2008-12-27',4,53,'599.9900',1,'2008-08-06','2009-08-23'),(7176,'2008-12-28',4,53,'599.9900',1,'2008-08-06','2009-08-23'),(7177,'2008-12-26',4,54,'699.9900',1,'2008-08-06','2009-08-23'),(7178,'2008-12-27',4,54,'699.9900',1,'2008-08-06','2009-08-23'),(7179,'2008-12-28',4,54,'699.9900',1,'2008-08-06','2009-08-23'),(7180,'2008-12-26',4,74,'41.9500',1,'2008-08-06','2009-08-23'),(7181,'2008-12-27',4,74,'41.9500',1,'2008-08-06','2009-08-23'),(7182,'2008-12-28',4,74,'41.9500',1,'2008-08-06','2009-08-23'),(7183,'2008-12-26',4,75,'41.9500',1,'2008-08-06','2009-08-23'),(7184,'2008-12-27',4,75,'41.9500',1,'2008-08-06','2009-08-23'),(7185,'2008-12-28',4,75,'41.9500',1,'2008-08-06','2009-08-23'),(7186,'2008-12-26',4,79,'41.9500',1,'2008-08-06','2009-08-23'),(7187,'2008-12-27',4,79,'41.9500',1,'2008-08-06','2009-08-23'),(7188,'2008-12-28',4,79,'41.9500',1,'2008-08-06','2009-08-23'),(7189,'2008-12-26',4,80,'41.9500',1,'2008-08-06','2009-08-23'),(7190,'2008-12-27',4,80,'41.9500',1,'2008-08-06','2009-08-23'),(7191,'2008-12-28',4,80,'41.9500',1,'2008-08-06','2009-08-23'),(7192,'2008-12-26',4,81,'41.9500',1,'2008-08-06','2009-08-23'),(7193,'2008-12-27',4,81,'41.9500',1,'2008-08-06','2009-08-23'),(7194,'2008-12-28',4,81,'41.9500',1,'2008-08-06','2009-08-23'),(7195,'2008-12-26',4,82,'41.9500',1,'2008-08-06','2009-08-23'),(7196,'2008-12-27',4,82,'41.9500',1,'2008-08-06','2009-08-23'),(7197,'2008-12-28',4,82,'41.9500',1,'2008-08-06','2009-08-23'),(7198,'2008-12-26',4,83,'15.9900',1,'2008-08-06','2009-08-23'),(7199,'2008-12-27',4,83,'15.9900',1,'2008-08-06','2009-08-23'),(7200,'2008-12-28',4,83,'15.9900',1,'2008-08-06','2009-08-23'),(7201,'2008-12-26',4,84,'15.9900',1,'2008-08-06','2009-08-23'),(7202,'2008-12-27',4,84,'15.9900',1,'2008-08-06','2009-08-23'),(7203,'2008-12-28',4,84,'15.9900',1,'2008-08-06','2009-08-23'),(7204,'2008-12-26',4,85,'15.9900',1,'2008-08-06','2009-08-23'),(7205,'2008-12-27',4,85,'15.9900',1,'2008-08-06','2009-08-23'),(7206,'2008-12-28',4,85,'15.9900',1,'2008-08-06','2009-08-23'),(7207,'2008-12-26',4,86,'15.9900',1,'2008-08-06','2009-08-23'),(7208,'2008-12-27',4,86,'15.9900',1,'2008-08-06','2009-08-23'),(7209,'2008-12-28',4,86,'15.9900',1,'2008-08-06','2009-08-23'),(7210,'2008-12-26',4,87,'15.9900',1,'2008-08-06','2009-08-23'),(7211,'2008-12-27',4,87,'15.9900',1,'2008-08-06','2009-08-23'),(7212,'2008-12-28',4,87,'15.9900',1,'2008-08-06','2009-08-23'),(7213,'2008-12-26',4,88,'15.9900',1,'2008-08-06','2009-08-23'),(7214,'2008-12-27',4,88,'15.9900',1,'2008-08-06','2009-08-23'),(7215,'2008-12-28',4,88,'15.9900',1,'2008-08-06','2009-08-23'),(7216,'2008-12-26',4,89,'15.9900',1,'2008-08-06','2009-08-23'),(7217,'2008-12-27',4,89,'15.9900',1,'2008-08-06','2009-08-23'),(7218,'2008-12-28',4,89,'15.9900',1,'2008-08-06','2009-08-23'),(7219,'2008-12-26',4,90,'15.9900',1,'2008-08-06','2009-08-23'),(7220,'2008-12-27',4,90,'15.9900',1,'2008-08-06','2009-08-23'),(7221,'2008-12-28',4,90,'15.9900',1,'2008-08-06','2009-08-23'),(7222,'2008-12-26',4,91,'15.9900',1,'2008-08-06','2009-08-23'),(7223,'2008-12-27',4,91,'15.9900',1,'2008-08-06','2009-08-23'),(7224,'2008-12-28',4,91,'15.9900',1,'2008-08-06','2009-08-23'),(7225,'2008-12-26',4,92,'15.9900',1,'2008-08-06','2009-08-23'),(7226,'2008-12-27',4,92,'15.9900',1,'2008-08-06','2009-08-23'),(7227,'2008-12-28',4,92,'15.9900',1,'2008-08-06','2009-08-23'),(7228,'2008-12-26',4,93,'134.9900',1,'2008-08-06','2009-08-23'),(7229,'2008-12-27',4,93,'134.9900',1,'2008-08-06','2009-08-23'),(7230,'2008-12-28',4,93,'134.9900',1,'2008-08-06','2009-08-23'),(7231,'2008-12-26',4,94,'134.9900',1,'2008-08-06','2009-08-23'),(7232,'2008-12-27',4,94,'134.9900',1,'2008-08-06','2009-08-23'),(7233,'2008-12-28',4,94,'134.9900',1,'2008-08-06','2009-08-23'),(7234,'2008-12-26',4,95,'134.9900',1,'2008-08-06','2009-08-23'),(7235,'2008-12-27',4,95,'134.9900',1,'2008-08-06','2009-08-23'),(7236,'2008-12-28',4,95,'134.9900',1,'2008-08-06','2009-08-23'),(7237,'2008-12-26',4,96,'134.9900',1,'2008-08-06','2009-08-23'),(7238,'2008-12-27',4,96,'134.9900',1,'2008-08-06','2009-08-23'),(7239,'2008-12-28',4,96,'134.9900',1,'2008-08-06','2009-08-23'),(7240,'2008-12-26',4,97,'134.9900',1,'2008-08-06','2009-08-23'),(7241,'2008-12-27',4,97,'134.9900',1,'2008-08-06','2009-08-23'),(7242,'2008-12-28',4,97,'134.9900',1,'2008-08-06','2009-08-23'),(7243,'2008-12-26',4,98,'160.9900',1,'2008-08-06','2009-08-23'),(7244,'2008-12-27',4,98,'160.9900',1,'2008-08-06','2009-08-23'),(7245,'2008-12-28',4,98,'160.9900',1,'2008-08-06','2009-08-23'),(7246,'2008-12-26',4,99,'160.9900',1,'2008-08-06','2009-08-23'),(7247,'2008-12-27',4,99,'160.9900',1,'2008-08-06','2009-08-23'),(7248,'2008-12-28',4,99,'160.9900',1,'2008-08-06','2009-08-23'),(7249,'2008-12-26',4,100,'160.9900',1,'2008-08-06','2009-08-23'),(7250,'2008-12-27',4,100,'160.9900',1,'2008-08-06','2009-08-23'),(7251,'2008-12-28',4,100,'160.9900',1,'2008-08-06','2009-08-23'),(7252,'2008-12-26',4,101,'160.9900',1,'2008-08-06','2009-08-23'),(7253,'2008-12-27',4,101,'160.9900',1,'2008-08-06','2009-08-23'),(7254,'2008-12-28',4,101,'160.9900',1,'2008-08-06','2009-08-23'),(7255,'2008-12-26',4,102,'160.9900',1,'2008-08-06','2009-08-23'),(7256,'2008-12-27',4,102,'160.9900',1,'2008-08-06','2009-08-23'),(7257,'2008-12-28',4,102,'160.9900',1,'2008-08-06','2009-08-23'),(7258,'2008-12-26',4,103,'69.9900',1,'2008-08-06','2009-08-23'),(7259,'2008-12-27',4,103,'69.9900',1,'2008-08-06','2009-08-23'),(7260,'2008-12-28',4,103,'69.9900',1,'2008-08-06','2009-08-23'),(7261,'2008-12-26',4,104,'69.9900',1,'2008-08-06','2009-08-23'),(7262,'2008-12-27',4,104,'69.9900',1,'2008-08-06','2009-08-23'),(7263,'2008-12-28',4,104,'69.9900',1,'2008-08-06','2009-08-23'),(7264,'2008-12-26',4,105,'69.9900',1,'2008-08-06','2009-08-23'),(7265,'2008-12-27',4,105,'69.9900',1,'2008-08-06','2009-08-23'),(7266,'2008-12-28',4,105,'69.9900',1,'2008-08-06','2009-08-23'),(7267,'2008-12-26',4,106,'69.9900',1,'2008-08-06','2009-08-23'),(7268,'2008-12-27',4,106,'69.9900',1,'2008-08-06','2009-08-23'),(7269,'2008-12-28',4,106,'69.9900',1,'2008-08-06','2009-08-23'),(7270,'2008-12-26',4,107,'69.9900',1,'2008-08-06','2009-08-23'),(7271,'2008-12-27',4,107,'69.9900',1,'2008-08-06','2009-08-23'),(7272,'2008-12-28',4,107,'69.9900',1,'2008-08-06','2009-08-23'),(7273,'2008-12-26',4,108,'89.9900',1,'2008-08-06','2009-08-23'),(7274,'2008-12-27',4,108,'89.9900',1,'2008-08-06','2009-08-23'),(7275,'2008-12-28',4,108,'89.9900',1,'2008-08-06','2009-08-23'),(7276,'2008-12-26',4,109,'89.9900',1,'2008-08-06','2009-08-23'),(7277,'2008-12-27',4,109,'89.9900',1,'2008-08-06','2009-08-23'),(7278,'2008-12-28',4,109,'89.9900',1,'2008-08-06','2009-08-23'),(7279,'2008-12-26',4,110,'89.9900',1,'2008-08-06','2009-08-23'),(7280,'2008-12-27',4,110,'89.9900',1,'2008-08-06','2009-08-23'),(7281,'2008-12-28',4,110,'89.9900',1,'2008-08-06','2009-08-23'),(7282,'2008-12-26',4,111,'89.9900',1,'2008-08-06','2009-08-23'),(7283,'2008-12-27',4,111,'89.9900',1,'2008-08-06','2009-08-23'),(7284,'2008-12-28',4,111,'89.9900',1,'2008-08-06','2009-08-23'),(7285,'2008-12-26',4,112,'159.9900',1,'2008-08-06','2009-08-23'),(7286,'2008-12-27',4,112,'159.9900',1,'2008-08-06','2009-08-23'),(7287,'2008-12-28',4,112,'159.9900',1,'2008-08-06','2009-08-23'),(7288,'2008-12-26',4,113,'159.9900',1,'2008-08-06','2009-08-23'),(7289,'2008-12-27',4,113,'159.9900',1,'2008-08-06','2009-08-23'),(7290,'2008-12-28',4,113,'159.9900',1,'2008-08-06','2009-08-23'),(7291,'2008-12-26',4,114,'159.9900',1,'2008-08-06','2009-08-23'),(7292,'2008-12-27',4,114,'159.9900',1,'2008-08-06','2009-08-23'),(7293,'2008-12-28',4,114,'159.9900',1,'2008-08-06','2009-08-23'),(7294,'2008-12-26',4,115,'159.9900',1,'2008-08-06','2009-08-23'),(7295,'2008-12-27',4,115,'159.9900',1,'2008-08-06','2009-08-23'),(7296,'2008-12-28',4,115,'159.9900',1,'2008-08-06','2009-08-23'),(7297,'2008-12-26',4,117,'15.0000',1,'2008-08-06','2009-08-23'),(7298,'2008-12-27',4,117,'15.0000',1,'2008-08-06','2009-08-23'),(7299,'2008-12-28',4,117,'15.0000',1,'2008-08-06','2009-08-23'),(7300,'2008-12-26',4,118,'15.0000',1,'2008-08-06','2009-08-23'),(7301,'2008-12-27',4,118,'15.0000',1,'2008-08-06','2009-08-23'),(7302,'2008-12-28',4,118,'15.0000',1,'2008-08-06','2009-08-23'),(7303,'2008-12-26',4,119,'15.0000',1,'2008-08-06','2009-08-23'),(7304,'2008-12-27',4,119,'15.0000',1,'2008-08-06','2009-08-23'),(7305,'2008-12-28',4,119,'15.0000',1,'2008-08-06','2009-08-23'),(7306,'2008-12-26',4,120,'22.0000',1,'2008-08-06','2009-08-23'),(7307,'2008-12-27',4,120,'22.0000',1,'2008-08-06','2009-08-23'),(7308,'2008-12-28',4,120,'22.0000',1,'2008-08-06','2009-08-23'),(7309,'2008-12-26',4,121,'22.0000',1,'2008-08-06','2009-08-23'),(7310,'2008-12-27',4,121,'22.0000',1,'2008-08-06','2009-08-23'),(7311,'2008-12-28',4,121,'22.0000',1,'2008-08-06','2009-08-23'),(7312,'2008-12-26',4,122,'22.0000',1,'2008-08-06','2009-08-23'),(7313,'2008-12-27',4,122,'22.0000',1,'2008-08-06','2009-08-23'),(7314,'2008-12-28',4,122,'22.0000',1,'2008-08-06','2009-08-23'),(7315,'2008-12-26',4,123,'100.0000',1,'2008-08-06','2009-08-23'),(7316,'2008-12-27',4,123,'100.0000',1,'2008-08-06','2009-08-23'),(7317,'2008-12-28',4,123,'100.0000',1,'2008-08-06','2009-08-23'),(7318,'2008-12-26',4,124,'15.0000',1,'2008-08-06','2009-08-23'),(7319,'2008-12-27',4,124,'15.0000',1,'2008-08-06','2009-08-23'),(7320,'2008-12-28',4,124,'15.0000',1,'2008-08-06','2009-08-23'),(7321,'2008-12-26',4,125,'15.0000',1,'2008-08-06','2009-08-23'),(7322,'2008-12-27',4,125,'15.0000',1,'2008-08-06','2009-08-23'),(7323,'2008-12-28',4,125,'15.0000',1,'2008-08-06','2009-08-23'),(7324,'2008-12-26',4,126,'13.5000',1,'2008-08-06','2009-08-23'),(7325,'2008-12-27',4,126,'13.5000',1,'2008-08-06','2009-08-23'),(7326,'2008-12-28',4,126,'13.5000',1,'2008-08-06','2009-08-23'),(7327,'2008-12-26',4,127,'13.5000',1,'2008-08-06','2009-08-23'),(7328,'2008-12-27',4,127,'13.5000',1,'2008-08-06','2009-08-23'),(7329,'2008-12-28',4,127,'13.5000',1,'2008-08-06','2009-08-23'),(7330,'2008-12-26',4,128,'13.5000',1,'2008-08-06','2009-08-23'),(7331,'2008-12-27',4,128,'13.5000',1,'2008-08-06','2009-08-23'),(7332,'2008-12-28',4,128,'13.5000',1,'2008-08-06','2009-08-23'),(7333,'2008-12-26',4,129,'13.5000',1,'2008-08-06','2009-08-23'),(7334,'2008-12-27',4,129,'13.5000',1,'2008-08-06','2009-08-23'),(7335,'2008-12-28',4,129,'13.5000',1,'2008-08-06','2009-08-23'),(7336,'2008-12-26',4,130,'13.5000',1,'2008-08-06','2009-08-23'),(7337,'2008-12-27',4,130,'13.5000',1,'2008-08-06','2009-08-23'),(7338,'2008-12-28',4,130,'13.5000',1,'2008-08-06','2009-08-23'),(7339,'2008-12-26',4,131,'13.5000',1,'2008-08-06','2009-08-23'),(7340,'2008-12-27',4,131,'13.5000',1,'2008-08-06','2009-08-23'),(7341,'2008-12-28',4,131,'13.5000',1,'2008-08-06','2009-08-23'),(7342,'2008-12-26',4,132,'99.0000',1,'2008-08-06','2009-08-23'),(7343,'2008-12-27',4,132,'99.0000',1,'2008-08-06','2009-08-23'),(7344,'2008-12-28',4,132,'99.0000',1,'2008-08-06','2009-08-23'),(7345,'2008-12-26',4,133,'34.0000',1,'2008-08-06','2009-08-23'),(7346,'2008-12-27',4,133,'34.0000',1,'2008-08-06','2009-08-23'),(7347,'2008-12-28',4,133,'34.0000',1,'2008-08-06','2009-08-23'),(7348,'2008-12-26',4,134,'19.0000',1,'2008-08-06','2009-08-23'),(7349,'2008-12-27',4,134,'19.0000',1,'2008-08-06','2009-08-23'),(7350,'2008-12-28',4,134,'19.0000',1,'2008-08-06','2009-08-23'),(7351,'2008-12-26',4,135,'41.9500',1,'2008-08-27','2009-08-28'),(7352,'2008-12-27',4,135,'41.9500',1,'2008-08-27','2009-08-28'),(7353,'2008-12-28',4,135,'41.9500',1,'2008-08-27','2009-08-28'),(7354,'2008-12-26',4,137,'13.5000',1,'2008-08-06','2009-08-23'),(7355,'2008-12-27',4,137,'13.5000',1,'2008-08-06','2009-08-23'),(7356,'2008-12-28',4,137,'13.5000',1,'2008-08-06','2009-08-23'),(7357,'2008-12-26',4,138,'150.0000',1,'2008-08-06','2009-08-23'),(7358,'2008-12-27',4,138,'150.0000',1,'2008-08-06','2009-08-23'),(7359,'2008-12-28',4,138,'150.0000',1,'2008-08-06','2009-08-23'),(7360,'2008-12-26',4,139,'199.9900',1,'2008-08-06','2009-08-23'),(7361,'2008-12-27',4,139,'199.9900',1,'2008-08-06','2009-08-23'),(7362,'2008-12-28',4,139,'199.9900',1,'2008-08-06','2009-08-23'),(7363,'2008-12-26',4,142,'150.0000',1,'2008-08-06','2009-08-23'),(7364,'2008-12-27',4,142,'150.0000',1,'2008-08-06','2009-08-23'),(7365,'2008-12-28',4,142,'150.0000',1,'2008-08-06','2009-08-23'),(7366,'2008-12-26',4,144,'250.0000',1,'2008-08-06','2009-08-23'),(7367,'2008-12-27',4,144,'250.0000',1,'2008-08-06','2009-08-23'),(7368,'2008-12-28',4,144,'250.0000',1,'2008-08-06','2009-08-23'),(7369,'2008-12-26',4,146,'325.0000',1,'2008-08-06','2009-08-23'),(7370,'2008-12-27',4,146,'325.0000',1,'2008-08-06','2009-08-23'),(7371,'2008-12-28',4,146,'325.0000',1,'2008-08-06','2009-08-23'),(7372,'2008-12-26',4,164,'4999.9500',1,'2008-08-06','2009-08-23'),(7373,'2008-12-27',4,164,'4999.9500',1,'2008-08-06','2009-08-23'),(7374,'2008-12-28',4,164,'4999.9500',1,'2008-08-06','2009-08-23');
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogsearch_fulltext`
--
DROP TABLE IF EXISTS `catalogsearch_fulltext`;
CREATE TABLE `catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogsearch_fulltext`
--
LOCK TABLES `catalogsearch_fulltext` WRITE;
/*!40000 ALTER TABLE `catalogsearch_fulltext` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_fulltext` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogsearch_query`
--
DROP TABLE IF EXISTS `catalogsearch_query`;
CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL auto_increment,
  `query_text` varchar(255) NOT NULL default '',
  `num_results` int(10) unsigned NOT NULL default '0',
  `popularity` int(10) unsigned NOT NULL default '0',
  `redirect` varchar(255) NOT NULL default '',
  `synonim_for` varchar(255) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `display_in_terms` tinyint(1) NOT NULL default '1',
  `is_active` tinyint(1) default '1',
  `is_processed` tinyint(1) default '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY  (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`),
  CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogsearch_query`
--
LOCK TABLES `catalogsearch_query` WRITE;
/*!40000 ALTER TABLE `catalogsearch_query` DISABLE KEYS */;
INSERT INTO `catalogsearch_query` VALUES (1,'Test',8,654,'','',1,1,1,0,'2008-08-05 22:33:02'),(2,'acer',1,394,'','',1,1,1,0,'2008-08-05 23:53:34'),(3,'couch',2,367,'','',1,1,1,0,'2008-08-05 13:05:23'),(4,'Shirts',3,410,'','',1,1,1,0,'2008-08-05 23:08:53'),(5,'APPLE',2,511,'','',1,1,1,0,'2008-08-05 23:54:26'),(6,'phone',6,462,'','',1,1,1,0,'2008-08-06 07:35:05'),(7,'Nokia',1,366,'','',1,1,1,0,'2008-08-05 17:59:32'),(8,'sony',3,1092,'','',1,1,1,0,'2008-08-06 08:06:44'),(9,'clogs',1,391,'http://demo.magentocommerce.com/cn-clogs-beach-garden-clog-1.html','',1,1,1,0,'2008-08-06 09:57:22'),(10,'canon',2,341,'','',1,1,1,0,'2008-08-05 14:22:37'),(11,'red',20,596,'','',1,1,1,0,'2008-08-05 21:01:37'),(12,'ferrari',1,284,'','',1,1,1,0,'2008-08-05 22:44:46'),(13,'shirt',5,444,'','',1,1,1,0,'2008-08-05 16:33:30'),(14,'computer',10,2032,'','',1,1,1,0,'2008-08-06 00:30:46'),(15,'samsung',3,381,'','',1,1,1,0,'2008-08-05 14:00:38'),(16,'ipod',1,435,'','',1,1,1,0,'2008-08-05 14:10:35'),(17,'Mac',2,381,'','',3,1,1,0,'2008-08-06 00:29:06'),(18,'rebel',1,280,'','',1,1,1,0,'2008-08-06 07:38:22'),(19,'camera',13,1322,'','',1,1,1,0,'2008-08-05 20:38:13'),(20,'Anashria Womens Premier Leather Sandal',1,332,'','',1,1,1,0,'2008-08-06 04:21:08'),(21,'west',6,395,'','',1,1,1,0,'2008-08-05 16:42:11'),(22,'mens',11,352,'','',1,1,1,0,'2008-08-04 02:37:27'),(23,'design',19,826,'','',1,1,1,0,'2008-08-05 10:18:45'),(24,'coalesce',1,385,'','',1,1,1,0,'2008-08-05 16:36:34'),(25,'nine west',1,22,'','',1,1,1,0,'2008-08-06 08:53:59'),(26,'Zolof The Rock And Roll Destroyer',1,22,'','',1,1,1,0,'2008-08-05 02:23:42'),(27,'T-Shirt',4,394,'','',1,1,1,0,'2008-08-05 18:10:27'),(28,'children',1,377,'','',1,1,1,0,'2008-08-04 00:23:21'),(29,'Cameras',1,453,'','',1,1,1,0,'2008-08-05 01:17:52'),(30,'Sony VAIO',2,458,'','',1,1,1,0,'2008-08-06 05:46:44'),(31,'camera case',1,443,'','',1,1,1,0,'2008-08-05 16:07:18'),(32,'lucero',1,269,'','',1,1,1,0,'2008-08-05 14:16:58'),(33,'clog',1,367,'','',1,1,1,0,'2008-08-05 08:12:31'),(34,'apparel',3,353,'','',1,1,1,0,'2008-08-01 10:36:56'),(35,'comp',23,36,'','',1,1,1,0,'2008-08-03 22:43:00'),(36,'black',11,21,'','',1,1,1,0,'2008-08-04 23:07:15'),(37,'laptop',6,300,'','notebook',1,1,1,0,'2008-08-05 23:41:19'),(38,'photo',11,44,'','',1,1,1,0,'2008-08-02 21:18:17'),(39,'ottoman',2,189,'','',1,1,1,0,'2008-08-05 04:38:40');
/*!40000 ALTER TABLE `catalogsearch_query` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catalogsearch_result`
--
DROP TABLE IF EXISTS `catalogsearch_result`;
CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`),
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `catalogsearch_result`
--
LOCK TABLES `catalogsearch_result` WRITE;
/*!40000 ALTER TABLE `catalogsearch_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_result` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `checkout_agreement`
--
DROP TABLE IF EXISTS `checkout_agreement`;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `content_height` varchar(25) default NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL default '0',
  `is_html` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `checkout_agreement`
--
LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `checkout_agreement_store`
--
DROP TABLE IF EXISTS `checkout_agreement_store`;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `checkout_agreement_store`
--
LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `chronopay_api_debug`
--
DROP TABLE IF EXISTS `chronopay_api_debug`;
CREATE TABLE `chronopay_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `chronopay_api_debug`
--
LOCK TABLES `chronopay_api_debug` WRITE;
/*!40000 ALTER TABLE `chronopay_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `chronopay_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cms_block`
--
DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `identifier` varchar(255) NOT NULL default '',
  `content` text,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS Blocks';
--
-- Dumping data for table `cms_block`
--
LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES (3,'Electronics Landing','electronics-landing','<div class=\"left\" style=\"width:284px; margin-right:25px;\">\r\n<h3 style=\"margin-bottom:0;\"><a href=\"{{store direct_url=\"electronics/cell-phones.html\"}}\"><img src=\"{{skin url=\'images/media/head_electronics_cellphones.gif}}\" alt=\"Cell Phones\" style=\"display:block; border:0;\"/></h3>\r\n<p><img src=\"{{skin url=\'images/media/electronics_cellphones.jpg}}\" alt=\"\" usemap=\"#Map\" border=\"0\"/></p>\r\n</div>\r\n<div class=\"left\" style=\"width:284px;\">\r\n<h3 style=\"margin-bottom:0;\"><a href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html\"}}\"><img src=\"{{skin url=\'images/media/head_electronics_digicamera.gif}}\" alt=\"Digital Cameras\" style=\"display:block; border:0;\"/></a></h3>\r\n<p><img src=\"{{skin url=\'images/media/electronics_digitalcameras.jpg}}\" alt=\"\" usemap=\"#Map2\" border=\"0\"/></p>\r\n</div>\r\n<div class=\"right\" style=\"width:284px;\">\r\n<h3 style=\"margin-bottom:0;\"><a href=\"{{store direct_url=\"electronics/computers/laptops.html\"}}\"><img src=\"{{skin url=\'images/media/head_electronics_laptops.gif}}\" alt=\"Laptops\" style=\"display:block; border:0;\"/></a></h3>\r\n<p><img src=\"{{skin url=\'images/media/electronics_laptops.jpg}}\" alt=\"\" usemap=\"#Map3\" border=\"0\"/></p>\r\n</div>\r\n<div class=\"clear\"></div>\r\n\r\n<map name=\"Map\">\r\n  <area shape=\"rect\" coords=\"14,154,78,182\" href=\"{{store direct_url=\"electronics/cell-phones.html?manufacturer=3\"}}\">\r\n  <area shape=\"rect\" coords=\"12,177,80,209\" href=\"{{store direct_url=\"electronics/cell-phones.html?manufacturer=20\"}}\">\r\n  <area shape=\"rect\" coords=\"104,158,167,181\" href=\"{{store direct_url=\"electronics/cell-phones.html?manufacturer=2\"}}\">\r\n  <area shape=\"rect\" coords=\"103,181,179,208\" href=\"{{store direct_url=\"electronics/cell-phones.html?manufacturer=101\"}}\">\r\n <area shape=\"rect\" coords=\"16,203,273,432\" href=\"{{store direct_url=\"electronics/cell-phones/blackberry-8100-pearl.html\"}}\">\r\n</map>\r\n\r\n<map name=\"Map2\">\r\n  <area shape=\"rect\" coords=\"14,152,75,179\" href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html?manufacturer=33\"}}\">\r\n  <area shape=\"rect\" coords=\"109,154,163,183\" href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html?manufacturer=31\"}}\">\r\n  <area shape=\"rect\" coords=\"14,177,73,208\" href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html?manufacturer=32\"}}\">\r\n  <area shape=\"rect\" coords=\"106,180,177,211\" href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html?manufacturer=34\"}}\">\r\n</map>\r\n\r\n\r\n<map name=\"Map3\">\r\n  <area shape=\"rect\" coords=\"15,155,58,179\" href=\"{{store direct_url=\"electronics/computers/laptops?computer_manufacturers=79\"}}\">\r\n  <area shape=\"rect\" coords=\"114,152,159,180\" href=\"{{store direct_url=\"electronics/computers/laptops?computer_manufacturers=76\"}}\">\r\n  <area shape=\"rect\" coords=\"13,178,67,205\" href=\"{{store direct_url=\"electronics/computers/laptops?computer_manufacturers=77\"}}\">\r\n  <area shape=\"rect\" coords=\"114,180,178,205\" href=\"{{store direct_url=\"electronics/computers/laptops?computer_manufacturers=74\"}}\">\r\n  <area shape=\"rect\" coords=\"13,310,154,434\" href=\"{{store direct_url=\"electronics/computers/laptops/acer-ferrari-3200-notebook-computer-pc.html\"}}\">\r\n  <area shape=\"rect\" coords=\"167,310,279,440\" href=\"{{store direct_url=\"electronics/computers/laptops/toshiba-satellite-a135-s4527-155-4-notebook-pc-intel-pentium-dual-core-processor-t2080-1-gb-ram-120-gb-hard-drive-supermulti-dvd-drive-vista-premium.html\"}}\">\r\n</map>','2007-08-28 14:33:10','2008-08-08 13:08:37',1),(4,'Cellphones Landing','cellphones-landing','<a href=\"{{store direct_url=\"electronics/cell-phones/sony-ericsson-w810i.html\"}}\"><img src=\"{{skin url=\'images/media/cell_phone_landing_banner1.jpg}}\" alt=\"\"/></a>','2007-08-28 14:59:44','2008-08-08 13:07:55',1),(5,'Footer Links','footer_links','<ul>\r\n<li><a href=\"{{store direct_url=\"about-magento-demo-store\"}}\">About Us</a></li>\r\n<li class=\"last\"><a href=\"{{store direct_url=\"customer-service\"}}\">Customer Service</a></li>\r\n</ul>','2007-08-30 14:01:52','2007-08-30 14:02:43',1);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cms_block_store`
--
DROP TABLE IF EXISTS `cms_block_store`;
CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';
--
-- Dumping data for table `cms_block_store`
--
LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
INSERT INTO `cms_block_store` VALUES (3,0),(4,0),(5,0);
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cms_page`
--
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `root_template` varchar(255) NOT NULL default '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL default '',
  `content` text,
  `creation_time` datetime default NULL,
  `update_time` datetime default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  `sort_order` tinyint(4) NOT NULL default '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) default NULL,
  `custom_theme_from` date default NULL,
  `custom_theme_to` date default NULL,
  PRIMARY KEY  (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS pages';
--
-- Dumping data for table `cms_page`
--
LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'404 Not Found 1','two_columns_right','Page keywords','Page description','no-route','<div class=\"page-head-alt\"><h3>Whoops, our bad...</h3></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<br/>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Demo Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1);\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br/><a href=\"{{store url=\"\"}}\">Store Home</a><br/><a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl><br/>\r\n<p><img src=\"{{skin url=\'images/media/404_callout1.jpg\'}}\" style=\"margin-right:15px;\"/><img src=\"{{skin url=\'images/media/404_callout2.jpg\'}}\" /></p>','2007-06-20 18:38:32','2007-08-26 19:11:13',1,0,NULL,NULL,NULL,NULL),(2,'Home page','two_columns_right','','','home','<div class=\"col-left side-col\">\r\n<p class=\"home-callout\">\r\n<a href=\"{{store direct_url=\"apparel/shoes/womens/anashria-womens-premier-leather-sandal.html\"}}\"><img src=\"{{skin url=\'images/ph_callout_left_top.gif\'}}\" border=\"0\" /></a>\r\n</p>\r\n<p class=\"home-callout\">\r\n<img src=\"{{skin url=\'images/ph_callout_left_rebel.jpg\'}}\" border=\"0\" />\r\n</p>\r\n{{block type=\"tag/popular\" template=\"tag/popular.phtml\"}}\r\n</div>\r\n<div class=\"home-spot\">\r\n<p class=\"home-callout\">\r\n<img src=\"{{skin url=\'images/home_main_callout.jpg\'}}\" border=\"0\" width=\"470\" />\r\n</p>\r\n<p class=\"home-callout\">\r\n<img src=\"{{skin url=\'images/free_shipping_callout.jpg\'}}\" border=\"0\" width=\"470\" />\r\n</p>\r\n<div class=\"box best-selling\">\r\n<h3>Best Selling Products</h3>\r\n<table border=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr class=\"odd\">\r\n			<td><a href=\"{{store direct_url=\"sony-vaio-vgn-txn27n-b-11-1-notebook-pc.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img01.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p><a href=\"{{store direct_url=\"sony-vaio-vgn-txn27n-b-11-1-notebook-pc.html\"}}\">Sony VAIO VGN-TXN27N/B 11.1\" Notebook PC</a></p>\r\n			<p>\r\n			See all <a href=\"{{store direct_url=\"electronics/computers/laptops.html\"}}\">Laptops</a>\r\n			</p>\r\n			</div>\r\n			</td>\r\n			<td><a href=\"{{store direct_url=\"nine-west-women-s-lucero-pump.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img02.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p><a href=\"{{store direct_url=\"nine-west-women-s-lucero-pump.html\"}}\">Nine West Women\'s Lucero Pump</a></p>\r\n			<p>\r\n			See all <a href=\"{{store direct_url=\"apparel/shoes.html\"}}\">Shoes</a>\r\n			</p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n		<tr class=\"even\">\r\n			<td><a href=\"{{store direct_url=\"olympus-stylus-750-7-1mp-digital-camera.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img03.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p>\r\n			<a href=\"{{store direct_url=\"olympus-stylus-750-7-1mp-digital-camera.html\"}}\">Olympus Stylus 750 7.1MP Digital Camera</a>\r\n			</p>\r\n			<p>\r\n			See all <a href=\"{{store direct_url=\"electronics/cameras/digital-cameras.html\"}}\">Digital Cameras</a>\r\n			</p>\r\n			</div>\r\n			</td>\r\n			<td><a href=\"{{store direct_url=\"acer-ferrari-3200-notebook-computer-pc.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img04.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p>\r\n			<a href=\"{{store direct_url=\"acer-ferrari-3200-notebook-computer-pc.html\"}}\">Acer Ferrari 3200 Notebook Computer PC</a>\r\n			</p>\r\n			<p>\r\n			See all <a href=\"{{store direct_url=\"electronics/computers/laptops.html\"}}\">Laptops</a>\r\n			</p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n		<tr class=\"odd\">\r\n			<td><a href=\"{{store direct_url=\"asics-men-s-gel-kayano-xii.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img05.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p><a href=\"{{store direct_url=\"asics-men-s-gel-kayano-xii.html\"}}\">ASICS&reg; Men\'s GEL-Kayano&reg; XII</a></p>\r\n			<p>See all <a href=\"{{store direct_url=\"apparel/shoes.html\"}}\">Shoes</a></p>\r\n			</div>\r\n			</td>\r\n			<td><a href=\"{{store direct_url=\"coalesce-functioning-on-impatience-t-shirt.html\"}}\"><img class=\"product-img\" src=\"{{skin url=\'images/media/best_selling_img06.jpg\'}}\" border=\"0\" width=\"95\" /></a>\r\n			<div class=\"product-description\">\r\n			<p>\r\n			<a href=\"{{store direct_url=\"coalesce-functioning-on-impatience-t-shirt.html\"}}\">Coalesce: Functioning On Impatience T-Shirt</a>\r\n			</p>\r\n			<p>\r\n			See all <a href=\"{{store direct_url=\"apparel/shirts.html\"}}\">Shirts</a>\r\n			</p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>','2007-08-23 10:03:25','2008-08-08 13:29:35',1,0,'<!--<reference name=\"content\">\r\n<block type=\"catalog/product_new\" name=\"home.catalog.product.new\" alias=\"product_new\" template=\"catalog/product/new.phtml\" after=\"cms_page\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type=\"reports/product_viewed\" name=\"home.reports.product.viewed\" alias=\"product_viewed\" template=\"reports/home_product_viewed.phtml\" after=\"product_new\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type=\"reports/product_compared\" name=\"home.reports.product.compared\" template=\"reports/home_product_compared.phtml\" after=\"product_viewed\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n</reference><reference name=\"right\">\r\n<action method=\"unsetChild\"><alias>right.reports.product.viewed</alias></action>\r\n<action method=\"unsetChild\"><alias>right.reports.product.compared</alias></action>\r\n</reference>-->','',NULL,NULL),(3,'About  Us','one_column','','','about-magento-demo-store','<div class=\"page-head\">\r\n<h3>About Magento  Demo Store</h3>\r\n</div>\r\n<div class=\"col3-set\">\r\n<div class=\"col-1\"><p><img src=\"http://var-dev.varien.com:81/dev/minu/magento/skin/frontend/default/default/images/media/about_us_img.jpg\" alt=\"Varien office pic\"/></p><p style=\"line-height:1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color:#888; font:1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class=\"col-2\">\r\n<p><strong style=\"color:#de036f;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class=\"col-3\">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style=\"color:#de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Demo Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height:1.2em;\"><strong style=\"font:italic 2em Georgia, serif;\">John Doe</strong><br/><small>Some important guy</small></p></div>\r\n</div>','2007-08-30 14:01:18','2007-08-30 14:01:18',1,0,NULL,NULL,NULL,NULL),(4,'Customer Service','three_columns','','','customer-service','<div class=\"page-head\">\r\n<h3>Customer Service</h3>\r\n</div>\r\n<ul class=\"disc\" style=\"margin-bottom:15px;\">\r\n<li><a href=\"#answer1\">Shipping & Delivery</a></li>\r\n<li><a href=\"#answer2\">Privacy & Security</a></li>\r\n<li><a href=\"#answer3\">Returns & Replacements</a></li>\r\n<li><a href=\"#answer4\">Ordering</a></li>\r\n<li><a href=\"#answer5\">Payment, Pricing & Promotions</a></li>\r\n<li><a href=\"#answer6\">Viewing Orders</a></li>\r\n<li><a href=\"#answer7\">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id=\"answer1\">Shipping & Delivery</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer2\">Privacy & Security</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer3\">Returns & Replacements</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer4\">Ordering</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer5\">Payment, Pricing & Promotions</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer6\">Viewing Orders</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer7\">Updating Account Information</dt>\r\n<dd style=\"margin-bottom:10px;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>','2007-08-30 14:02:20','2007-08-30 14:03:37',1,0,NULL,NULL,NULL,NULL),(5,'Home page','one_column','','','home','<!-- this homepage can be used for modern theme  -->\r\n{{block type=\"core/template\" template=\"sample/home.phtml\"}}','2008-04-16 14:51:52','2008-08-08 12:23:12',0,0,'<!--<reference name=\"content\">\r\n<block type=\"catalog/product_new\" name=\"home.catalog.product.new\" alias=\"product_new\" template=\"catalog/product/new.phtml\" after=\"cms_page\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type=\"reports/product_viewed\" name=\"home.reports.product.viewed\" alias=\"product_viewed\" template=\"reports/home_product_viewed.phtml\" after=\"product_new\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n<block type=\"reports/product_compared\" name=\"home.reports.product.compared\" template=\"reports/home_product_compared.phtml\" after=\"product_viewed\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\r\n</reference><reference name=\"right\">\r\n<action method=\"unsetChild\"><alias>right.reports.product.viewed</alias></action>\r\n<action method=\"unsetChild\"><alias>right.reports.product.compared</alias></action>\r\n</reference>-->','',NULL,NULL);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cms_page_store`
--
DROP TABLE IF EXISTS `cms_page_store`;
CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';
--
-- Dumping data for table `cms_page_store`
--
LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` VALUES (1,0),(3,0),(4,0),(5,0),(2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_config_data`
--
DROP TABLE IF EXISTS `core_config_data`;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL auto_increment,
  `scope` enum('default','websites','stores','config') NOT NULL default 'default',
  `scope_id` int(11) NOT NULL default '0',
  `path` varchar(255) NOT NULL default 'general',
  `value` text NOT NULL,
  PRIMARY KEY  (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_config_data`
--
LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_email_template`
--
DROP TABLE IF EXISTS `core_email_template`;
CREATE TABLE `core_email_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) default NULL,
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email templates';
--
-- Dumping data for table `core_email_template`
--
LOCK TABLES `core_email_template` WRITE;
/*!40000 ALTER TABLE `core_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_email_template` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_flag`
--
DROP TABLE IF EXISTS `core_flag`;
CREATE TABLE `core_flag` (
  `flag_id` smallint(5) unsigned NOT NULL auto_increment,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL default '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY  (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_flag`
--
LOCK TABLES `core_flag` WRITE;
/*!40000 ALTER TABLE `core_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_flag` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_layout_link`
--
DROP TABLE IF EXISTS `core_layout_link`;
CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `package` varchar(64) NOT NULL default '',
  `theme` varchar(64) NOT NULL default '',
  `layout_update_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`),
  CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_layout_link`
--
LOCK TABLES `core_layout_link` WRITE;
/*!40000 ALTER TABLE `core_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_layout_update`
--
DROP TABLE IF EXISTS `core_layout_update`;
CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL auto_increment,
  `handle` varchar(255) default NULL,
  `xml` text,
  PRIMARY KEY  (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_layout_update`
--
LOCK TABLES `core_layout_update` WRITE;
/*!40000 ALTER TABLE `core_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_update` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_resource`
--
DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL default '',
  `version` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';
--
-- Dumping data for table `core_resource`
--
LOCK TABLES `core_resource` WRITE;
/*!40000 ALTER TABLE `core_resource` DISABLE KEYS */;
INSERT INTO `core_resource` VALUES ('adminnotification_setup','1.0.0'),('admin_setup','0.7.1'),('api_setup','0.7.1'),('bundle_setup','0.1.4'),('catalogindex_setup','0.7.10'),('cataloginventory_setup','0.7.4'),('catalogrule_setup','0.7.5'),('catalogsearch_setup','0.7.6'),('catalog_setup','0.7.57'),('checkout_setup','0.9.3'),('chronopay_setup','0.1.0'),('cms_setup','0.7.6'),('contacts_setup','0.7.2'),('core_setup','0.8.12'),('cron_setup','0.7.1'),('customer_setup','0.8.9'),('cybermut_setup','0.1.0'),('cybersource_setup','0.7.0'),('dataflow_setup','0.7.4'),('directory_setup','0.8.3'),('downloadable_setup','0.1.12'),('eav_setup','0.7.11'),('eway_setup','0.1.0'),('flo2cash_setup','0.1.1'),('giftmessage_setup','0.7.2'),('googleanalytics_setup','0.1.0'),('googlebase_setup','0.1.0'),('googlecheckout_setup','0.7.1'),('googleoptimizer_setup','0.1.2'),('ideal_setup','0.1.0'),('log_setup','0.7.2'),('newsletter_setup','0.7.1'),('oscommerce_setup','0.8.10'),('paybox_setup','0.1.3'),('paygate_setup','0.1.0'),('payment_setup','0.1.1'),('paypaluk_setup','0.7.0'),('paypal_setup','0.1.3'),('poll_setup','0.7.2'),('productalert_setup','0.7.0'),('protx_setup','0.1.0'),('rating_setup','0.7.2'),('reports_setup','0.7.7'),('review_setup','0.7.3'),('salesrule_setup','0.7.7'),('sales_setup','0.9.29'),('sendfriend_setup','0.7.2'),('shipping_setup','0.2.1'),('sitemap_setup','0.7.2'),('strikeiron_setup','0.9.1'),('tag_setup','0.7.1'),('tax_setup','0.7.8'),('usa_setup','0.3.3'),('weee_setup','0.12'),('wishlist_setup','0.7.4');
/*!40000 ALTER TABLE `core_resource` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_session`
--
DROP TABLE IF EXISTS `core_session`;
CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL default '',
  `website_id` smallint(5) unsigned default NULL,
  `session_expires` int(10) unsigned NOT NULL default '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY  (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';
--
-- Dumping data for table `core_session`
--
LOCK TABLES `core_session` WRITE;
/*!40000 ALTER TABLE `core_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_session` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_store`
--
DROP TABLE IF EXISTS `core_store`;
CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `website_id` smallint(5) unsigned default '0',
  `group_id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `is_active` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`),
  CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores';
--
-- Dumping data for table `core_store`
--
LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'English',0,1),(2,'german',1,1,'German',0,1),(3,'french',1,1,'French',0,1);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_store_group`
--
DROP TABLE IF EXISTS `core_store_group`;
CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL default '0',
  `default_store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`),
  CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_store_group`
--
LOCK TABLES `core_store_group` WRITE;
/*!40000 ALTER TABLE `core_store_group` DISABLE KEYS */;
INSERT INTO `core_store_group` VALUES (0,0,'Default',0,0),(1,1,'Main Store',3,1);
/*!40000 ALTER TABLE `core_store_group` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_translate`
--
DROP TABLE IF EXISTS `core_translate`;
CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL auto_increment,
  `string` varchar(255) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `translate` varchar(255) NOT NULL default '',
  `locale` varchar(20) NOT NULL default 'en_US',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`),
  CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='Translation data';
--
-- Dumping data for table `core_translate`
--
LOCK TABLES `core_translate` WRITE;
/*!40000 ALTER TABLE `core_translate` DISABLE KEYS */;
INSERT INTO `core_translate` VALUES (1,'Size',0,'Size','en_US'),(2,'Color',0,'Color','en_US'),(3,'Thumbnail Image',0,'Thumbnail Image','en_US'),(4,'Med image',0,'Med image','en_US'),(5,'Large Image',0,'Large Image','en_US'),(6,'Medium Image',0,'Medium Image','en_US'),(7,'Main Image',0,'Main Image','en_US'),(8,'In Depth',0,'In Depth','en_US'),(9,'Small Image',0,'Small Image','en_US'),(10,'Manufacturer',0,'Manufacturer','en_US'),(11,'Dimensions',0,'Dimensions','en_US'),(12,'Model',0,'Model','en_US'),(13,'Activation Information',0,'Activation Information','en_US'),(14,'Thumbnail',0,'Thumbnail','en_US'),(15,'Description',0,'Description','en_US'),(16,'Weight',0,'Weight','en_US'),(17,'Processor',0,'Processor','en_US'),(18,'Memory',0,'Memory','en_US'),(19,'Hardrive',0,'Hardrive','en_US'),(20,'Screensize',0,'Screensize','en_US'),(21,'Gender',0,'Gender','en_US'),(22,'Shoe Size',0,'Shoe Size','en_US'),(23,'Shoe Type',0,'Shoe Type','en_US'),(24,'shape',0,'shape','en_US'),(25,'Short Description',0,'Short Description','en_US'),(26,'Country of Origin',0,'Country of Origin','en_US'),(27,'Room',0,'Room','en_US'),(28,'Finish',0,'Finish','en_US'),(29,'Manufacturer1',0,'Manufacturer1','en_US'),(30,'color-roy',0,'color-roy','en_US'),(31,'Megapixels',0,'Megapixels','en_US'),(32,'Shirt Size',0,'Shirt Size','en_US'),(33,'Visibility',0,'Visibility','en_US'),(34,'Tax Class',0,'Tax Class','en_US'),(35,'Status',0,'Status','en_US'),(36,'Price',0,'Price','en_US'),(37,'Tier Price',0,'Tier Price','en_US'),(38,'Special Price',0,'Special Price','en_US'),(39,'Meta Keywords',0,'Meta Keywords','en_US'),(40,'Max Resolution',0,'Max Resolution','en_US'),(41,'RAM SIze',0,'RAM SIze','en_US'),(42,'Contrast Ratio',0,'Contrast Ratio','en_US'),(43,'Response Time',0,'Response Time','en_US'),(44,'CPU Speed',0,'CPU Speed','en_US'),(45,'Disk Speed',0,'Disk Speed','en_US'),(46,'Brand',0,'Brand','en_US');
/*!40000 ALTER TABLE `core_translate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_url_rewrite`
--
DROP TABLE IF EXISTS `core_url_rewrite`;
CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `category_id` int(10) unsigned default NULL,
  `product_id` int(10) unsigned default NULL,
  `id_path` varchar(255) NOT NULL default '',
  `request_path` varchar(255) NOT NULL default '',
  `target_path` varchar(255) NOT NULL default '',
  `is_system` tinyint(1) unsigned default '1',
  `options` varchar(255) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`store_id`,`request_path`),
  UNIQUE KEY `UNQ_PATH` (`store_id`,`id_path`,`is_system`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_TARGET_PATH` (`store_id`,`target_path`),
  KEY `FK_CORE_URL_REWRITE_CATEGORY` (`category_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`),
  CONSTRAINT `core_url_rewrite_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `core_url_rewrite`
--
LOCK TABLES `core_url_rewrite` WRITE;
/*!40000 ALTER TABLE `core_url_rewrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `core_website`
--
DROP TABLE IF EXISTS `core_website`;
CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(32) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  `default_group_id` smallint(5) unsigned NOT NULL default '0',
  `is_default` tinyint(1) unsigned default '0',
  PRIMARY KEY  (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
--
-- Dumping data for table `core_website`
--
LOCK TABLES `core_website` WRITE;
/*!40000 ALTER TABLE `core_website` DISABLE KEYS */;
INSERT INTO `core_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `core_website` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cron_schedule`
--
DROP TABLE IF EXISTS `cron_schedule`;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL auto_increment,
  `job_code` varchar(255) NOT NULL default '0',
  `status` enum('pending','running','success','missed','error') NOT NULL default 'pending',
  `messages` text,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `cron_schedule`
--
LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity`
--
DROP TABLE IF EXISTS `customer_address_entity`;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entityies';
--
-- Dumping data for table `customer_address_entity`
--
LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity_datetime`
--
DROP TABLE IF EXISTS `customer_address_entity_datetime`;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_address_entity_datetime`
--
LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity_decimal`
--
DROP TABLE IF EXISTS `customer_address_entity_decimal`;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_address_entity_decimal`
--
LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity_int`
--
DROP TABLE IF EXISTS `customer_address_entity_int`;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_address_entity_int`
--
LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity_text`
--
DROP TABLE IF EXISTS `customer_address_entity_text`;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_address_entity_text`
--
LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_address_entity_varchar`
--
DROP TABLE IF EXISTS `customer_address_entity_varchar`;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_address_entity_varchar`
--
LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity`
--
DROP TABLE IF EXISTS `customer_entity`;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned default NULL,
  `email` varchar(255) NOT NULL,
  `group_id` smallint(3) unsigned NOT NULL,
  `increment_id` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Entityies';
--
-- Dumping data for table `customer_entity`
--
LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
INSERT INTO `customer_entity` VALUES (1,1,0,1,'john.doe@example.com',1,'000000001',1,'2007-08-30 23:23:13','2008-08-08 12:28:24',1);
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity_datetime`
--
DROP TABLE IF EXISTS `customer_entity_datetime`;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_entity_datetime`
--
LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity_decimal`
--
DROP TABLE IF EXISTS `customer_entity_decimal`;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_entity_decimal`
--
LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity_int`
--
DROP TABLE IF EXISTS `customer_entity_int`;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_entity_int`
--
LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
INSERT INTO `customer_entity_int` VALUES (1,1,7,1,274),(2,1,8,1,274),(3,1,532,1,1);
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity_text`
--
DROP TABLE IF EXISTS `customer_entity_text`;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_entity_text`
--
LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_entity_varchar`
--
DROP TABLE IF EXISTS `customer_entity_varchar`;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `customer_entity_varchar`
--
LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
INSERT INTO `customer_entity_varchar` VALUES (1,1,1,1,'John'),(2,1,2,1,'Doe'),(3,1,4,1,'2049484a4020ed15d0e4238db22977d5:eg'),(4,1,826,1,''),(5,1,827,1,''),(6,1,828,1,''),(7,1,830,1,'');
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `customer_group`
--
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL auto_increment,
  `customer_group_code` varchar(32) NOT NULL default '',
  `tax_class_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Customer groups';
--
-- Dumping data for table `customer_group`
--
LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3),(4,'QAAAA',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cybermut_api_debug`
--
DROP TABLE IF EXISTS `cybermut_api_debug`;
CREATE TABLE `cybermut_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `cybermut_api_debug`
--
LOCK TABLES `cybermut_api_debug` WRITE;
/*!40000 ALTER TABLE `cybermut_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `cybermut_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `cybersource_api_debug`
--
DROP TABLE IF EXISTS `cybersource_api_debug`;
CREATE TABLE `cybersource_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `action` varchar(255) default NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `cybersource_api_debug`
--
LOCK TABLES `cybersource_api_debug` WRITE;
/*!40000 ALTER TABLE `cybersource_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `cybersource_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_batch`
--
DROP TABLE IF EXISTS `dataflow_batch`;
CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `adapter` varchar(128) default NULL,
  `params` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_batch`
--
LOCK TABLES `dataflow_batch` WRITE;
/*!40000 ALTER TABLE `dataflow_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_batch_export`
--
DROP TABLE IF EXISTS `dataflow_batch_export`;
CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_batch_export`
--
LOCK TABLES `dataflow_batch_export` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_export` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_batch_import`
--
DROP TABLE IF EXISTS `dataflow_batch_import`;
CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL auto_increment,
  `batch_id` int(10) unsigned NOT NULL default '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_batch_import`
--
LOCK TABLES `dataflow_batch_import` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_import` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_import_data`
--
DROP TABLE IF EXISTS `dataflow_import_data`;
CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) default NULL,
  `serial_number` int(11) NOT NULL default '0',
  `value` text,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`),
  CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_import_data`
--
LOCK TABLES `dataflow_import_data` WRITE;
/*!40000 ALTER TABLE `dataflow_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_import_data` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_profile`
--
DROP TABLE IF EXISTS `dataflow_profile`;
CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') default NULL,
  `entity_type` varchar(64) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `data_transfer` enum('file','interactive') default NULL,
  PRIMARY KEY  (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_profile`
--
LOCK TABLES `dataflow_profile` WRITE;
/*!40000 ALTER TABLE `dataflow_profile` DISABLE KEYS */;
INSERT INTO `dataflow_profile` VALUES (1,'Export All Products','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(2,'Export Product Stocks','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n    <var name=\"map\">\r\n        <map name=\"store\"><![CDATA[store]]></map>\r\n        <map name=\"sku\"><![CDATA[sku]]></map>\r\n        <map name=\"qty\"><![CDATA[qty]]></map>\r\n        <map name=\"is_in_stock\"><![CDATA[is_in_stock]]></map>\r\n    </var>\r\n    <var name=\"_only_specified\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_product_stocks.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(3,'Import All Products','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(4,'Import Product Stocks','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(5,'Export Customers','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"customer/convert_adapter_customer\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\r\n</action>\r\n\r\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','customer',0,'file'),(6,'Import Customers','2008-03-31 01:32:54','2008-03-31 01:32:54','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','customer',0,'interactive');
/*!40000 ALTER TABLE `dataflow_profile` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_profile_history`
--
DROP TABLE IF EXISTS `dataflow_profile_history`;
CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL auto_increment,
  `profile_id` int(10) unsigned NOT NULL default '0',
  `action_code` varchar(64) default NULL,
  `user_id` int(10) unsigned NOT NULL default '0',
  `performed_at` datetime default NULL,
  PRIMARY KEY  (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`),
  CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_profile_history`
--
LOCK TABLES `dataflow_profile_history` WRITE;
/*!40000 ALTER TABLE `dataflow_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_profile_history` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dataflow_session`
--
DROP TABLE IF EXISTS `dataflow_session`;
CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `created_date` datetime default NULL,
  `file` varchar(255) default NULL,
  `type` varchar(32) default NULL,
  `direction` varchar(32) default NULL,
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `dataflow_session`
--
LOCK TABLES `dataflow_session` WRITE;
/*!40000 ALTER TABLE `dataflow_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_session` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `design_change`
--
DROP TABLE IF EXISTS `design_change`;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `design` varchar(255) NOT NULL,
  `date_from` date default NULL,
  `date_to` date default NULL,
  PRIMARY KEY  (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`),
  CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `design_change`
--
LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `directory_country`
--
DROP TABLE IF EXISTS `directory_country`;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL default '',
  `iso2_code` varchar(2) NOT NULL default '',
  `iso3_code` varchar(3) NOT NULL default '',
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';
--
-- Dumping data for table `directory_country`
--
LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CS','CS','SCG'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('FX','FX','FXX'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PR','PR','PRI'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROM'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `directory_country_format`
--
DROP TABLE IF EXISTS `directory_country_format`;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL auto_increment,
  `country_id` char(2) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `format` text NOT NULL,
  PRIMARY KEY  (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format';
--
-- Dumping data for table `directory_country_format`
--
LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `directory_country_region`
--
DROP TABLE IF EXISTS `directory_country_region`;
CREATE TABLE `directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL auto_increment,
  `country_id` varchar(4) NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `default_name` varchar(255) default NULL,
  PRIMARY KEY  (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='Country regions';
--
-- Dumping data for table `directory_country_region`
--
LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AF','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AC','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AM','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NF','Newfoundland'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Voralberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','JU','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','01','Ain'),(183,'FR','02','Aisne'),(184,'FR','03','Allier'),(185,'FR','04','Alpes-de-Haute-Provence'),(186,'FR','05','Hautes-Alpes'),(187,'FR','06','Alpes-Maritimes'),(188,'FR','07','Ardèche'),(189,'FR','08','Ardennes'),(190,'FR','09','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `directory_country_region_name`
--
DROP TABLE IF EXISTS `directory_country_region_name`;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL default '',
  `region_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`),
  CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';
--
-- Dumping data for table `directory_country_region_name`
--
LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Voralberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `directory_currency_rate`
--
DROP TABLE IF EXISTS `directory_currency_rate`;
CREATE TABLE `directory_currency_rate` (
  `currency_from` char(3) NOT NULL default '',
  `currency_to` char(3) NOT NULL default '',
  `rate` decimal(24,12) NOT NULL default '0.000000000000',
  PRIMARY KEY  (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `directory_currency_rate`
--
LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_link`
--
DROP TABLE IF EXISTS `downloadable_link`;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sort_order` int(10) unsigned NOT NULL default '0',
  `number_of_downloads` int(10) unsigned default NULL,
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(20) NOT NULL default '',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_link`
--
LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_link_price`
--
DROP TABLE IF EXISTS `downloadable_link_price`;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_link_price`
--
LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_link_purchased`
--
DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `order_increment_id` varchar(50) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_name` varchar(255) NOT NULL default '',
  `product_sku` varchar(255) NOT NULL default '',
  `link_section_title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_DOWNLOADABLE_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_link_purchased`
--
LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_link_purchased_item`
--
DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `purchased_id` int(10) unsigned NOT NULL default '0',
  `order_item_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned default '0',
  `number_of_downloads_bought` int(10) unsigned NOT NULL default '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL default '0',
  `link_id` int(20) unsigned NOT NULL default '0',
  `link_title` varchar(255) NOT NULL default '',
  `is_shareable` smallint(1) unsigned NOT NULL default '0',
  `link_url` varchar(255) NOT NULL default '',
  `link_file` varchar(255) NOT NULL default '',
  `link_type` varchar(255) NOT NULL default '',
  `status` varchar(50) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_ORDER_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_link_purchased_item`
--
LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_link_title`
--
DROP TABLE IF EXISTS `downloadable_link_title`;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `link_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_link_title`
--
LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_sample`
--
DROP TABLE IF EXISTS `downloadable_sample`;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL default '0',
  `sample_url` varchar(255) NOT NULL default '',
  `sample_file` varchar(255) NOT NULL default '',
  `sample_type` varchar(20) NOT NULL default '',
  `sort_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_sample`
--
LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `downloadable_sample_title`
--
DROP TABLE IF EXISTS `downloadable_sample_title`;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL auto_increment,
  `sample_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`title_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `downloadable_sample_title`
--
LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_attribute`
--
DROP TABLE IF EXISTS `eav_attribute`;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_code` varchar(255) NOT NULL default '',
  `attribute_model` varchar(255) default NULL,
  `backend_model` varchar(255) default NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL default 'static',
  `backend_table` varchar(255) default NULL,
  `frontend_model` varchar(255) default NULL,
  `frontend_input` varchar(50) default NULL,
  `frontend_label` varchar(255) default NULL,
  `frontend_class` varchar(255) default NULL,
  `source_model` varchar(255) default NULL,
  `is_global` tinyint(1) unsigned NOT NULL default '1',
  `is_visible` tinyint(1) unsigned NOT NULL default '1',
  `is_required` tinyint(1) unsigned NOT NULL default '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL default '0',
  `default_value` text,
  `is_searchable` tinyint(1) unsigned NOT NULL default '0',
  `is_filterable` tinyint(1) unsigned NOT NULL default '0',
  `is_comparable` tinyint(1) unsigned NOT NULL default '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL default '0',
  `is_unique` tinyint(1) unsigned NOT NULL default '0',
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL default '0',
  `is_configurable` tinyint(1) unsigned NOT NULL default '1',
  `apply_to` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL default '1',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=925 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_attribute`
--
LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'firstname',NULL,'','varchar','','','text','First Name','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(2,1,'lastname',NULL,'','varchar','','','text','Last Name','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(3,1,'email',NULL,'','static','','','text','Email','validate-email','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(4,1,'password_hash',NULL,'customer/customer_attribute_backend_password','varchar','','','hidden','','','',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(7,1,'default_billing',NULL,'customer/customer_attribute_backend_billing','int','','','text','','','',1,0,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(8,1,'default_shipping',NULL,'customer/customer_attribute_backend_shipping','int','','','text','','','',1,0,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(9,2,'firstname',NULL,'','varchar','','','text','First Name','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(10,2,'lastname',NULL,'','varchar','','','text','Last Name','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(11,2,'country_id',NULL,'','varchar','','','select','Country','countries input-text','customer_entity/address_attribute_source_country',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(12,2,'region',NULL,'customer_entity/address_attribute_backend_region','varchar','','','text','State/Province','regions','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(13,2,'region_id',NULL,'','int','','','hidden','','','customer_entity/address_attribute_source_region',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(14,2,'postcode',NULL,'','varchar','','','text','Zip/Postal Code','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(15,2,'city',NULL,'','varchar','','','text','City','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(16,2,'street',NULL,'customer_entity/address_attribute_backend_street','text','','','multiline','Street Address','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(17,2,'telephone',NULL,'','varchar','','','text','Telephone','','',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(18,2,'fax',NULL,'','varchar','','','text','Fax','','',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(19,3,'method_type',NULL,'','int','','','select','Payment Method','','',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(95,2,'company',NULL,'','varchar','','','text','Company',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(96,10,'name',NULL,'','varchar','','','text','Name',NULL,'',0,1,1,0,'',1,0,0,0,0,1,1,'',1,'',1,0),(97,10,'description',NULL,'','text','','','textarea','Description','','',0,1,1,0,'',1,0,1,0,0,1,1,'',1,'',1,0),(98,10,'sku',NULL,'','static','','','text','SKU',NULL,'',1,1,1,0,'',1,0,1,0,1,1,1,'',1,'',1,0),(99,10,'price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Price','','',2,1,1,0,'',1,1,0,0,0,1,1,'simple,configurable,virtual,bundle,downloadable',0,'',1,1),(100,10,'cost',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Cost',NULL,'',2,1,0,1,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(101,10,'weight',NULL,'','decimal','','','text','Weight','','',1,1,1,0,'',0,0,0,0,0,0,1,'simple,bundle',1,'',1,0),(102,10,'manufacturer',NULL,'','int','','','select','Manufacturer','','',1,1,0,1,'',1,1,1,0,0,0,1,'simple',1,'',1,1),(103,10,'meta_title',NULL,'','varchar','','','text','Meta Title',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(104,10,'meta_keyword',NULL,'','text','','','textarea','Meta Keywords','','',0,1,0,0,'',1,0,0,0,0,0,1,'',1,'',1,0),(105,10,'meta_description',NULL,'','varchar','','','textarea','Meta Description',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'Maximum 255 chars',1,0),(106,10,'image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Base Image','','',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(107,10,'shoe_type',NULL,NULL,'int',NULL,NULL,'select','Shoe Type','','eav/entity_attribute_source_table',1,1,0,1,NULL,1,1,1,0,0,0,1,'simple,grouped,configurable',1,'',1,1),(109,10,'small_image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Small Image','','',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(110,10,'old_id',NULL,'','int','','','','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(111,9,'name',NULL,'','varchar','','','text','Name',NULL,'',0,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(112,9,'description',NULL,'','text','','','textarea','Description',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(113,9,'image',NULL,'catalog/category_attribute_backend_image','varchar','','','image','Image',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(114,9,'meta_title',NULL,'','varchar','','','text','Page Title',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(115,9,'meta_keywords',NULL,'','text','','','textarea','Meta Keywords',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(116,9,'meta_description',NULL,'','text','','','textarea','Meta Description',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(117,9,'landing_page',NULL,'','int','','','select','CMS Block',NULL,'catalog/category_attribute_source_page',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(118,9,'display_mode',NULL,'','varchar','','','select','Display Mode',NULL,'catalog/category_attribute_source_mode',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(119,9,'is_active',NULL,'','int','','','select','Is Active',NULL,'eav/entity_attribute_source_boolean',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(120,9,'is_anchor',NULL,'','int','','','select','Is Anchor',NULL,'eav/entity_attribute_source_boolean',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(121,9,'all_children',NULL,'','text','','','','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(122,9,'path_in_store',NULL,'','text','','','','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(123,9,'children',NULL,'','text','','','','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(194,4,'grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(195,4,'currency_rate',NULL,NULL,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(196,4,'weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(197,4,'tax_percent',NULL,NULL,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(198,4,'subtotal',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(199,4,'discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(200,4,'tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(201,4,'shipping_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(202,4,'giftcert_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(203,4,'custbalance_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(204,4,'quote_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(205,4,'customer_id',NULL,'','static','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(207,4,'currency_base_id',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(208,4,'shipping_description',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(209,4,'real_order_id',NULL,NULL,'varchar',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(210,4,'remote_ip',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(211,4,'currency_code',NULL,NULL,'varchar',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(212,4,'coupon_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(213,4,'giftcert_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(214,4,'shipping_method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(215,4,'status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(216,4,'shipping_address_id',NULL,'sales_entity/order_attribute_backend_shipping','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(217,4,'billing_address_id',NULL,'sales_entity/order_attribute_backend_billing','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(218,6,'region_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(219,6,'country_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(220,6,'address_id',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(221,6,'customer_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(222,6,'street',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(223,6,'email',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(224,6,'firstname',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(225,6,'lastname',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(226,6,'company',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(227,6,'city',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(228,6,'region',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(229,6,'postcode',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(230,6,'telephone',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(231,6,'fax',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(232,6,'tax_id',NULL,NULL,'varchar',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(233,6,'address_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(234,7,'weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(235,7,'qty',NULL,NULL,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(236,7,'qty_backordered',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(237,7,'qty_canceled',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(238,7,'qty_shipped',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(239,7,'qty_returned',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(240,7,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(241,7,'tier_price',NULL,NULL,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(242,7,'cost',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(243,7,'discount_percent',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(244,7,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(245,7,'tax_percent',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(246,7,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(247,7,'row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(248,7,'row_weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(249,7,'product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(250,7,'image',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(251,7,'name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(252,7,'model',NULL,NULL,'varchar',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(253,8,'cc_exp_month',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(254,8,'cc_exp_year',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(255,8,'cc_raw_request',NULL,NULL,'text',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(256,8,'cc_raw_response',NULL,NULL,'text',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(257,8,'method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(258,8,'po_number',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(259,8,'cc_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(260,8,'cc_number_enc',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(261,8,'cc_last4',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(262,8,'cc_owner',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(263,8,'cc_trans_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(264,8,'cc_approval',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(265,8,'cc_avs_status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(266,8,'cc_cid_status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(267,5,'status',NULL,NULL,'varchar',NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(268,5,'comments',NULL,NULL,'text',NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,NULL,0,0,0,0,0,0,1,'',1,'',1,0),(270,10,'tier_price',NULL,'catalog/product_attribute_backend_tierprice','decimal','','','text','Tier Price','','',2,1,0,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',0,0),(271,10,'gallery',NULL,'','varchar','','','gallery','Image Gallery',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(272,10,'color',NULL,'','int','','','select','Color','','',1,1,0,1,'',1,1,1,0,0,1,1,'simple',1,'',1,1),(273,10,'status',NULL,'','int','','','select','Status','','catalog/product_status',2,1,1,0,'',1,0,0,0,0,0,1,'',1,'',1,0),(274,10,'tax_class_id',NULL,'','int','','','select','Tax Class','','tax/class_source_product',0,1,1,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(275,11,'entity_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(276,11,'is_active',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(277,11,'customer_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(278,11,'remote_ip',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(279,11,'checkout_method',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(280,11,'password_hash',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(281,11,'quote_status_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(282,11,'billing_address_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(283,11,'converted_at',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(284,11,'coupon_code',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(285,11,'giftcert_code',NULL,'','varchar','','','text','Gift certificate',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'simple,grouped,configurable',1,'',1,0),(286,11,'custbalance_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(287,11,'base_currency_code',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(288,11,'store_currency_code',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(289,11,'quote_currency_code',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(290,11,'store_to_base_rate',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(291,11,'store_to_quote_rate',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(292,11,'grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(293,11,'orig_order_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(294,11,'applied_rule_ids',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(295,11,'is_virtual',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(296,11,'is_multi_shipping',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(297,11,'is_multi_payment',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(298,12,'entity_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(299,12,'parent_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(300,12,'address_type',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(301,12,'customer_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(302,12,'customer_address_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(303,12,'email',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(304,12,'firstname',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(305,12,'lastname',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(306,12,'company',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(307,12,'street',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(308,12,'city',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(309,12,'region',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(310,12,'region_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(311,12,'postcode',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(312,12,'country_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(313,12,'telephone',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(314,12,'fax',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(315,12,'same_as_billing',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(316,12,'weight',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(317,12,'shipping_method',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(318,12,'shipping_description',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(319,12,'subtotal',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(320,12,'tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(321,12,'shipping_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(322,12,'discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(323,12,'custbalance_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(324,12,'grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(325,12,'customer_notes',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(326,13,'parent_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(327,13,'code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(328,13,'carrier',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(329,13,'carrier_title',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(330,13,'method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(331,13,'method_description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(332,13,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(333,13,'error_message',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(334,14,'parent_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(335,14,'quote_item_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(336,14,'qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(337,14,'discount_percent',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(338,14,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(339,14,'tax_percent',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(340,14,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(341,14,'row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(342,14,'row_weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(343,15,'parent_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(344,15,'product_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(345,15,'parent_product_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(346,15,'sku',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(347,15,'image',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'simple,grouped,configurable',1,'',1,0),(348,15,'name',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(349,15,'description',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(350,15,'weight',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(351,15,'qty',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(352,15,'price',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(353,15,'discount_percent',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(354,15,'discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(355,15,'tax_percent',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(356,15,'tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(357,15,'row_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(358,15,'row_weight',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(359,16,'parent_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(360,16,'customer_payment_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(361,16,'method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(362,16,'po_number',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(363,16,'cc_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(364,16,'cc_number_enc',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(365,16,'cc_last4',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(366,16,'cc_owner',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(367,16,'cc_exp_month',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(368,16,'cc_exp_year',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(369,16,'cc_cid_enc',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(370,4,'entity_id',NULL,'sales_entity/order_attribute_backend_parent','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(372,4,'quote_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(373,4,'base_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(374,4,'store_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(375,4,'order_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(376,4,'store_to_base_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(377,4,'store_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(378,4,'is_virtual',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(379,4,'is_multi_payment',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(380,4,'total_paid',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(381,4,'total_due',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(383,4,'total_qty_ordered',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(384,6,'parent_id',NULL,'sales_entity/order_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(385,6,'quote_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(386,6,'customer_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(387,7,'parent_id',NULL,'sales_entity/order_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(388,7,'quote_item_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(389,7,'sku',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(390,7,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(391,7,'qty_ordered',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(392,8,'parent_id',NULL,'sales_entity/order_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(393,8,'quote_payment_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(394,8,'customer_payment_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(395,8,'amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(396,8,'cc_status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(397,8,'cc_status_description',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(398,8,'cc_debug_request_body',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(399,8,'cc_debug_response_body',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(400,8,'cc_debug_response_serialized',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(401,8,'anet_trans_method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(402,8,'echeck_routing_number',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(403,8,'echeck_bank_name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(404,8,'echeck_account_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(405,8,'echeck_account_name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(406,8,'echeck_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(407,17,'parent_id',NULL,'sales_entity/order_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(410,17,'is_customer_notified',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(411,18,'entity_id',NULL,'sales_entity/order_invoice_attribute_backend_parent','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(412,18,'invoice_type',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(413,18,'customer_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(414,18,'order_id',NULL,'sales_entity/order_invoice_attribute_backend_order','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(415,18,'real_order_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(416,18,'invoice_status_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(417,18,'billing_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(418,18,'shipping_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(419,18,'base_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(420,18,'store_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(421,18,'order_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(422,18,'store_to_base_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(423,18,'store_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(424,18,'is_virtual',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(425,18,'subtotal',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(426,18,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(427,18,'shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(428,18,'grand_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(429,18,'total_paid',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(430,18,'total_due',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(431,18,'total_qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(432,19,'parent_id',NULL,'sales_entity/invoice_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(433,19,'order_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(434,19,'address_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(435,19,'customer_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(436,19,'customer_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(437,19,'email',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(438,19,'firstname',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(439,19,'lastname',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(440,19,'company',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(441,19,'street',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(442,19,'city',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(443,19,'region',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(444,19,'region_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(445,19,'postcode',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(446,19,'country_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(447,19,'telephone',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(448,19,'fax',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(449,20,'parent_id',NULL,'sales_entity/order_invoice_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(450,20,'order_item_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(451,20,'product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(452,20,'name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(453,20,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(454,20,'sku',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(455,20,'qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(456,20,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(457,20,'cost',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(458,20,'row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(459,20,'shipment_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(460,21,'parent_id',NULL,'sales_entity/invoice_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(461,21,'order_payment_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(462,21,'amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(463,21,'method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(464,21,'cc_trans_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(465,21,'cc_approval',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(466,21,'cc_debug_request',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(467,21,'cc_debug_response',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(468,22,'parent_id',NULL,'sales_entity/invoice_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(469,22,'order_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(470,22,'shipping_method',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(471,22,'tracking_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(472,22,'shipment_status_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(473,11,'customer_tax_class_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(474,15,'tax_class_id',NULL,'','int','','','select','Tax Class',NULL,'tax/class_source_product',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(475,14,'tax_class_id',NULL,'','int','','','select','Tax Class',NULL,'tax/class_source_product',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(476,10,'shape',NULL,NULL,'text',NULL,NULL,'text','shape','',NULL,0,1,0,1,'',1,1,1,1,0,0,1,'simple,grouped,configurable',1,'',1,1),(477,1,'created_in',NULL,'','varchar','','','text','Created From',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(478,1,'store_id',NULL,'customer/customer_attribute_backend_store','static','','','select','Create In',NULL,'customer/customer_attribute_source_store',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(479,9,'url_key',NULL,'catalog/category_attribute_backend_urlkey','varchar','','','text','URL key',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(481,10,'url_key',NULL,'catalog/product_attribute_backend_urlkey','varchar','','','text','URL key',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(482,15,'applied_rule_ids',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(483,7,'applied_rule_ids',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(488,12,'free_shipping',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(489,14,'free_shipping',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(490,15,'free_shipping',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(491,4,'applied_rule_ids',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(492,10,'in_depth',NULL,NULL,'text',NULL,NULL,'textarea','In Depth','','',0,1,1,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(493,10,'thumbnail',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Thumbnail','','',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(494,10,'dimension',NULL,NULL,'text',NULL,NULL,'textarea','Dimensions','','',1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(495,10,'model',NULL,NULL,'text',NULL,NULL,'text','Model','','',1,1,1,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(496,10,'activation_information',NULL,NULL,'text',NULL,NULL,'textarea','Activation Information','',NULL,1,1,0,1,NULL,0,0,0,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(497,10,'processor',NULL,NULL,'text',NULL,NULL,'text','Processor','',NULL,1,1,0,1,NULL,1,0,1,1,0,0,1,'simple',1,'',1,0),(498,10,'memory',NULL,NULL,'text',NULL,NULL,'text','Memory','','',1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(499,10,'hardrive',NULL,NULL,'text',NULL,NULL,'text','Hardrive','',NULL,1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(500,10,'screensize',NULL,NULL,'text',NULL,NULL,'text','Screensize','',NULL,1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(501,10,'gender',NULL,NULL,'int',NULL,NULL,'select','Gender','','eav/entity_attribute_source_table',1,1,1,1,NULL,1,0,0,0,0,1,1,'simple,grouped,configurable',1,'',1,0),(502,10,'shoe_size',NULL,NULL,'int',NULL,NULL,'select','Shoe Size','','eav/entity_attribute_source_table',1,1,1,1,NULL,1,0,0,0,0,0,1,'simple,grouped,configurable',1,'',1,0),(503,10,'minimal_price',NULL,'','decimal','','','price','Minimal Price',NULL,'',0,0,1,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(504,12,'collect_shipping_rates',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(505,15,'super_product_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(506,10,'short_description',NULL,'','text','','','textarea','Short Description','','',0,1,1,0,'',1,0,1,0,0,0,1,'',1,'',1,0),(507,10,'country_orgin',NULL,NULL,'text',NULL,NULL,'text','Country of Origin','',NULL,1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(508,10,'room',NULL,NULL,'int',NULL,NULL,'select','Room','','eav/entity_attribute_source_table',1,1,0,1,NULL,1,0,1,0,0,0,1,'simple,grouped,configurable',1,'',1,0),(509,10,'finish',NULL,NULL,'text',NULL,NULL,'text','Finish','','',1,1,0,1,NULL,1,0,1,1,0,0,1,'simple,grouped,configurable',1,'',1,0),(510,10,'computer_manufacturers',NULL,NULL,'int',NULL,NULL,'select','Brand','','eav/entity_attribute_source_table',1,1,0,1,'',1,2,1,1,0,1,1,'simple,grouped,configurable',1,'',1,1),(513,10,'megapixels',NULL,NULL,'int',NULL,NULL,'select','Megapixels','','',1,1,0,1,NULL,1,1,1,1,0,0,1,'simple,grouped,configurable',1,'',1,1),(514,9,'page_layout',NULL,'','varchar','','','select','Page Layout',NULL,'catalog/category_attribute_source_layout',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(515,14,'product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(516,14,'super_product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(517,14,'parent_product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(518,14,'sku',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(519,14,'image',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(520,14,'name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(521,14,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(522,14,'weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(523,14,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(524,14,'applied_rule_ids',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(525,10,'shirt_size',NULL,NULL,'int',NULL,NULL,'select','Shirt Size','','eav/entity_attribute_source_table',1,1,1,1,NULL,1,0,0,0,0,0,1,'simple,grouped,configurable',1,'',1,0),(526,10,'visibility',NULL,'','int','','','select','Visibility','','catalog/product_visibility',0,1,1,0,'4',0,0,0,0,0,0,1,'',1,'',1,0),(527,16,'paypal_payer_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(528,16,'paypal_payer_status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(529,16,'paypal_correlation_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(530,9,'custom_layout_update',NULL,'','text','','','textarea','Custom Layout Update',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(531,10,'custom_layout_update',NULL,'','text','','','textarea','Custom Layout Update',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(532,1,'group_id',NULL,'','static','','','select','Customer Group',NULL,'customer/customer_attribute_source_group',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(533,9,'url_path',NULL,'','varchar','','','','',NULL,'',0,0,0,0,'',0,0,0,0,1,0,1,'',1,'',1,0),(534,11,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(535,12,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(536,15,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(537,4,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(538,6,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(539,7,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(541,14,'gift_message_id',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(542,7,'gift_message_aviable',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(543,11,'customer_group_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(544,11,'customer_email',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(545,11,'customer_note',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(546,11,'customer_note_notify',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(547,4,'customer_group_id',NULL,'','int','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(548,4,'customer_email',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(549,4,'customer_note',NULL,'','text','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(550,4,'customer_note_notify',NULL,'','int','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(551,15,'custom_price',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(552,14,'custom_price',NULL,'','decimal','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(553,4,'state',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(554,4,'relation_parent_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(555,4,'relation_parent_real_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(556,4,'relation_child_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(557,4,'relation_child_real_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(558,4,'tracking_numbers',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(559,17,'status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(560,17,'comment',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(561,7,'gift_message_available',NULL,'','int','','','text','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(562,10,'gift_message_available',NULL,'giftmessage/entity_attribute_backend_boolean_config','varchar','','','select','Allow Gift Message',NULL,'giftmessage/entity_attribute_source_boolean_config',1,1,0,0,'2',0,0,0,0,0,0,0,'simple,grouped,configurable',1,'',1,0),(563,9,'custom_design',NULL,'','varchar','','','select','Custom Design',NULL,'core/design_source_design',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(564,9,'custom_design_apply',NULL,'','int','','','select','Apply To',NULL,'core/design_source_apply',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(565,9,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active From',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(566,9,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active To',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(567,10,'special_price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Special Price','','',2,1,0,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(568,10,'special_from_date',NULL,'catalog/product_attribute_backend_startdate','datetime','','','date','Special Price From Date',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(569,10,'special_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Special Price To Date',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',1,'',1,0),(570,10,'url_path',NULL,'','varchar','','','','',NULL,'',0,0,0,0,'',0,0,0,0,1,0,1,'',1,'',1,0),(571,10,'custom_design',NULL,'','varchar','','','select','Custom Design',NULL,'core/design_source_design',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(572,10,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active From',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(573,10,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active To',NULL,'',0,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(574,11,'customer_firstname',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(575,11,'customer_lastname',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(576,12,'subtotal_with_discount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(577,14,'no_discount',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(578,14,'row_total_with_discount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(579,15,'no_discount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(580,15,'row_total_with_discount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(581,16,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(582,4,'is_hold',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(583,4,'total_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(584,4,'customer_firstname',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(585,4,'customer_lastname',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(586,7,'super_product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(587,7,'parent_product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(588,7,'qty_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(589,7,'qty_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(590,7,'original_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(591,7,'discount_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(592,7,'tax_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(593,7,'row_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(594,7,'invoiced_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(595,7,'amount_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(596,8,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(597,8,'amount_ordered',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(598,8,'amount_authorized',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(599,8,'amount_paid',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(600,8,'amount_canceled',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(601,8,'amount_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(602,8,'shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(603,8,'shipping_captured',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(604,8,'shipping_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(605,18,'state',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(606,18,'transaction_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(607,18,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(608,18,'can_void_flag',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(609,20,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(610,20,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(611,23,'parent_id',NULL,'sales_entity/order_invoice_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(612,23,'comment',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(613,23,'is_customer_notified',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(614,24,'entity_id',NULL,'sales_entity/order_shipment_attribute_backend_parent','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(615,24,'customer_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(616,24,'order_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(617,24,'shipment_status',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(618,24,'billing_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(619,24,'shipping_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(620,24,'total_qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(621,24,'total_weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(622,25,'parent_id',NULL,'sales_entity/order_shipment_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(623,25,'order_item_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(624,25,'product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(625,25,'name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(626,25,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(627,25,'sku',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(628,25,'qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(629,25,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(630,25,'weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(631,25,'row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(632,26,'parent_id',NULL,'sales_entity/order_shipment_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(633,26,'comment',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(634,26,'is_customer_notified',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(635,27,'parent_id',NULL,'sales_entity/order_shipment_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(636,27,'order_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(637,27,'number',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(638,27,'carrier_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(639,27,'title',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(640,27,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(641,27,'qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(642,27,'weight',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(643,28,'entity_id',NULL,'sales_entity/order_creditmemo_attribute_backend_parent','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(644,28,'state',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(645,28,'transaction_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(646,28,'order_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(647,28,'creditmemo_status',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(648,28,'billing_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(649,28,'shipping_address_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(650,28,'base_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(651,28,'store_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(652,28,'order_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(653,28,'store_to_base_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(654,28,'store_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(655,28,'subtotal',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(656,28,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(657,28,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(658,28,'shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(659,28,'adjustment',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(660,28,'adjustment_positive',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(661,28,'adjustment_negative',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(662,28,'grand_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(663,29,'parent_id',NULL,'sales_entity/order_creditmemo_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(664,29,'order_item_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(665,29,'product_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(666,29,'name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(667,29,'description',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(668,29,'sku',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(669,29,'qty',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(670,29,'price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(671,29,'cost',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(672,29,'discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(673,29,'tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(674,29,'row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(675,30,'parent_id',NULL,'sales_entity/order_creditmemo_attribute_backend_child','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(676,30,'comment',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(677,30,'is_customer_notified',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(678,11,'store_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(679,11,'customer_is_guest',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(680,14,'is_qty_decimal',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(681,15,'is_qty_decimal',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(682,16,'cc_ss_issue',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(683,16,'cc_ss_start_month',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(684,16,'cc_ss_start_year',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(685,4,'store_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(686,4,'hold_before_status',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(687,4,'hold_before_state',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(688,4,'ext_order_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(689,4,'ext_customer_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(690,4,'total_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(691,4,'adjustment_positive',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(692,4,'adjustment_negative',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(693,4,'customer_is_guest',NULL,'','int','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(694,7,'is_qty_decimal',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(695,8,'cc_ss_issue',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(696,8,'cc_ss_start_month',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(697,8,'cc_ss_start_year',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(698,18,'is_used_for_refund',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(699,28,'invoice_id',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(700,1,'website_id',NULL,'customer/customer_attribute_backend_website','static','','','select','Associate to Website',NULL,'customer/customer_attribute_source_website',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(701,9,'path',NULL,'','static','','','','Path',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(702,9,'position',NULL,'','static','','','','Position',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(703,10,'media_gallery',NULL,'catalog/product_attribute_backend_media','varchar','','','gallery','Media Gallery',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(704,10,'news_from_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Set Product as New from Date',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(705,10,'news_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Set Product as New to Date',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(706,10,'category_ids',NULL,'','static','','','','',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(707,11,'base_grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(708,12,'base_subtotal',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(709,12,'base_subtotal_with_discount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(710,12,'base_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(711,12,'base_shipping_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(712,12,'base_discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(713,12,'base_custbalance_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(714,12,'base_grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(715,14,'base_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(716,14,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(717,14,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(718,14,'base_row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(719,14,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(720,15,'base_price',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(721,15,'base_discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(722,15,'base_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(723,15,'base_row_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(724,15,'additional_data',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(725,4,'store_name',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(726,4,'total_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(727,4,'total_online_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(728,4,'total_offline_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(729,4,'base_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(730,4,'base_shipping_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(731,4,'base_discount_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(732,4,'base_giftcert_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(733,4,'base_custbalance_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(734,4,'base_subtotal',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(735,4,'base_grand_total',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(736,4,'base_total_paid',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(737,4,'base_total_due',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(738,4,'base_total_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(739,4,'base_total_qty_ordered',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(740,4,'base_total_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(741,4,'base_total_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(742,4,'base_total_online_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(743,4,'base_total_offline_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(744,4,'base_adjustment_positive',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(745,4,'base_adjustment_negative',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(746,4,'email_sent',NULL,'','int','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(747,7,'base_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(748,7,'base_original_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(749,7,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(750,7,'base_discount_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(751,7,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(752,7,'base_tax_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(753,7,'base_row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(754,7,'base_row_invoiced',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(755,7,'base_invoiced_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(756,7,'base_amount_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(757,7,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(758,8,'base_amount_ordered',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(759,8,'base_amount_authorized',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(760,8,'base_amount_paid',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(761,8,'base_amount_canceled',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(762,8,'base_amount_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(763,8,'base_shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(764,8,'base_shipping_captured',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(765,8,'base_shipping_refunded',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(766,18,'base_subtotal',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(767,18,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(768,18,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(769,18,'base_shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(770,18,'base_grand_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(771,18,'email_sent',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(772,20,'base_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(773,20,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(774,20,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(775,20,'base_row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(776,20,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(777,24,'email_sent',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(778,25,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(779,28,'base_subtotal',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(780,28,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(781,28,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(782,28,'base_shipping_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(783,28,'base_adjustment',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(784,28,'base_adjustment_positive',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(785,28,'base_adjustment_negative',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(786,28,'base_grand_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(787,28,'email_sent',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(788,29,'base_price',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(789,29,'base_discount_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(790,29,'base_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(791,29,'base_row_total',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(792,29,'additional_data',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(793,11,'items_count',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(794,11,'items_qty',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(795,4,'edit_increment',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(796,4,'original_increment_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(797,4,'subtotal_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(798,4,'subtotal_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(799,4,'tax_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(800,4,'tax_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(801,4,'shipping_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(802,4,'shipping_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(803,4,'base_subtotal_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(804,4,'base_subtotal_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(805,4,'base_tax_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(806,4,'base_tax_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(807,4,'base_shipping_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(808,4,'base_shipping_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(809,4,'subtotal_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(810,4,'tax_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(811,4,'shipping_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(812,4,'base_subtotal_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(813,4,'base_tax_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(814,4,'base_shipping_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(815,12,'save_in_address_book',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(816,11,'reserved_order_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(817,8,'last_trans_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(818,12,'shipping_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(819,12,'base_shipping_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(820,4,'shipping_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(821,4,'base_shipping_tax_amount',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(822,18,'shipping_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(823,18,'base_shipping_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(824,28,'shipping_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(825,28,'base_shipping_tax_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(826,1,'prefix',NULL,'','varchar','','','text','Prefix',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(827,1,'middlename',NULL,'','varchar','','','text','Middle Name/Initial',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(828,1,'suffix',NULL,'','varchar','','','text','Suffix',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(829,1,'dob',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Date Of Birth',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(830,1,'taxvat',NULL,'','varchar','','','text','Tax/VAT number',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',1,'',1,0),(831,1,'confirmation',NULL,'','varchar','','','text','Is confirmed',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(832,2,'prefix',NULL,'','varchar','','','text','Prefix',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(833,2,'middlename',NULL,'','varchar','','','text','Middle Name/Initial',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(834,2,'suffix',NULL,'','varchar','','','text','Suffix',NULL,'',1,1,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(835,9,'level',NULL,'','static','','','','Level',NULL,'',1,0,0,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(836,10,'options_container',NULL,'','varchar','','','select','Display product options in',NULL,'catalog/entity_product_attribute_design_options_container',0,1,0,0,'container2',0,0,0,0,0,0,1,'',0,'',1,0),(837,10,'required_options',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(838,10,'has_options',NULL,'','static','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(839,4,'customer_prefix',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(840,4,'customer_middlename',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(841,4,'customer_suffix',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(842,6,'prefix',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(843,6,'middlename',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(844,6,'suffix',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(845,11,'customer_prefix',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(846,11,'customer_middlename',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(847,11,'customer_suffix',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(848,12,'prefix',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(849,12,'middlename',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(850,12,'suffix',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(851,11,'customer_dob',NULL,'eav/entity_attribute_backend_datetime','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(852,4,'customer_dob',NULL,'eav/entity_attribute_backend_datetime','datetime','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(853,7,'is_virtual',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(854,7,'product_type',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(855,18,'store_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(856,28,'store_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(857,24,'store_id',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(858,4,'customer_taxvat',NULL,'','varchar','','','text','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(859,10,'price_type',NULL,'','int','','','','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,0,'bundle',0,'',1,0),(860,10,'sku_type',NULL,'','int','','','','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,0,'bundle',0,'',1,0),(861,10,'weight_type',NULL,'','int','','','','',NULL,'',1,0,1,0,'',0,0,0,0,0,0,0,'bundle',0,'',1,0),(862,10,'price_view',NULL,'','int','','','select','Price View',NULL,'bundle/product_attribute_source_price_view',1,1,1,0,'',0,0,0,0,0,0,0,'bundle',0,'',1,0),(863,10,'shipment_type',NULL,'','int','','','','Shipment',NULL,'',1,0,1,0,'',0,0,0,0,0,0,0,'bundle',0,'',1,0),(864,8,'cybersource_token',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(865,18,'cybersource_token',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(866,28,'cybersource_token',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(867,8,'flo2cash_account_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(868,8,'ideal_issuer_id',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(869,8,'ideal_issuer_title',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(870,8,'ideal_transaction_checked',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(871,8,'paybox_request_number',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(872,8,'paybox_question_number',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,0),(873,10,'max_resolution',NULL,NULL,'varchar',NULL,NULL,'text','Max Resolution','',NULL,0,1,0,1,'',0,0,0,0,0,0,0,'',0,'',1,0),(874,10,'ram_size',NULL,NULL,'varchar',NULL,NULL,'text','RAM SIze','',NULL,0,1,0,1,'',0,0,0,0,0,0,0,'',0,'',1,0),(875,10,'contrast_ratio',NULL,NULL,'int',NULL,NULL,'select','Contrast Ratio','','eav/entity_attribute_source_table',0,1,0,1,'',0,1,1,1,0,0,0,'',0,'',1,1),(876,10,'response_time',NULL,NULL,'varchar',NULL,NULL,'text','Response Time','',NULL,0,1,0,1,'',0,0,0,1,0,0,0,'',0,'',1,0),(877,10,'cpu_speed',NULL,NULL,'int',NULL,NULL,'select','CPU Speed','','eav/entity_attribute_source_table',0,1,0,1,'',0,0,0,0,0,0,0,'',0,'',1,0),(878,10,'harddrive_speed',NULL,NULL,'varchar',NULL,NULL,'text','Disk Speed','',NULL,0,1,0,1,'',0,0,0,1,0,0,0,'',0,'',1,0),(879,10,'image_label',NULL,'','varchar','','','text','Image Label',NULL,'',0,0,0,0,'',0,0,0,0,0,0,0,'',0,'',1,1),(880,10,'small_image_label',NULL,'','varchar','','','text','Small Image Label',NULL,'',0,0,0,0,'',0,0,0,0,0,0,0,'',0,'',1,1),(881,10,'thumbnail_label',NULL,'','varchar','','','text','Thumbnail Label',NULL,'',0,0,0,0,'',0,0,0,0,0,0,0,'',0,'',1,1),(882,4,'can_ship_partially',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(883,4,'can_ship_partially_item',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(884,4,'payment_authorization_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(885,4,'payment_authorization_expiration',NULL,'','int','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(886,4,'shipping_tax_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(887,4,'base_shipping_tax_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(888,4,'global_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(889,4,'base_to_global_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(890,4,'base_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(891,18,'global_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(892,18,'base_to_global_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(893,18,'base_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(894,28,'global_currency_code',NULL,'','varchar','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(895,28,'base_to_global_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(896,28,'base_to_order_rate',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(897,4,'discount_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(898,4,'discount_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(899,4,'discount_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(900,4,'base_discount_refunded',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(901,4,'base_discount_canceled',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(902,4,'base_discount_invoiced',NULL,'','static','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(903,10,'disable_googlecheckout',NULL,'','int','','','select','Not available for purchase with Google Checkout',NULL,'eav/entity_attribute_source_boolean',1,1,0,0,'0',0,0,0,0,0,0,0,'',0,'',1,1),(904,10,'links_purchased_separately',NULL,'','int','','','','Links can be purchased separately',NULL,'',1,0,1,0,'',0,0,0,0,0,0,0,'downloadable',0,'',1,1),(905,10,'samples_title',NULL,'','varchar','','','','Samples title',NULL,'',0,0,1,0,'',0,0,0,0,0,0,0,'downloadable',0,'',1,1),(906,10,'links_title',NULL,'','varchar','','','','Links title',NULL,'',0,0,1,0,'',0,0,0,0,0,0,0,'downloadable',0,'',1,1),(907,29,'base_weee_tax_applied_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(908,29,'base_weee_tax_applied_row_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(909,29,'weee_tax_applied_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(910,29,'weee_tax_applied_row_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(911,20,'base_weee_tax_applied_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(912,20,'base_weee_tax_applied_row_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(913,20,'weee_tax_applied_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(914,20,'weee_tax_applied_row_amount',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(915,20,'weee_tax_applied',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(916,29,'weee_tax_applied',NULL,'','text','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(917,29,'weee_tax_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(918,29,'weee_tax_row_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(919,29,'base_weee_tax_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(920,29,'base_weee_tax_row_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(921,20,'weee_tax_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(922,20,'weee_tax_row_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(923,20,'base_weee_tax_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1),(924,20,'base_weee_tax_row_disposition',NULL,'','decimal','','','text','',NULL,'',1,1,1,0,'',0,0,0,0,0,0,1,'',0,'',1,1);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_attribute_group`
--
DROP TABLE IF EXISTS `eav_attribute_group`;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_name` varchar(255) NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  `default_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_attribute_group`
--
LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` VALUES (1,1,'General',4,1),(2,2,'General',4,1),(3,3,'General',4,1),(4,9,'General',1,1),(7,12,'General',3,1),(9,9,'Prices',2,0),(12,9,'Meta Information',3,0),(15,9,'Images',4,0),(17,23,'General',3,1),(18,24,'General',3,1),(19,25,'General',3,1),(20,26,'General',3,1),(21,27,'General',3,1),(22,28,'General',3,1),(23,18,'General',2,1),(24,20,'General',2,1),(25,21,'General',2,1),(26,22,'General',2,1),(27,29,'General',3,1),(28,30,'General',3,1),(29,31,'General',3,1),(30,32,'General',3,1),(31,33,'General',3,1),(32,34,'General',3,1),(47,38,'General',1,1),(48,38,'Meta Information',3,0),(49,38,'Prices',2,0),(50,38,'Images',5,0),(51,39,'General',43,1),(52,39,'Meta Information',45,0),(53,39,'Prices',44,0),(54,39,'Images',46,0),(55,40,'General',43,1),(56,40,'Meta Information',45,0),(57,40,'Prices',44,0),(58,40,'Images',46,0),(59,41,'General',1,1),(60,41,'Meta Information',3,0),(61,41,'Prices',2,0),(62,41,'Images',4,0),(63,42,'General',43,1),(64,42,'Meta Information',45,0),(65,42,'Images',46,0),(66,42,'Prices',44,0),(72,44,'General',7,1),(73,44,'Meta Information',2,0),(74,44,'Images',4,0),(75,44,'Prices',5,0),(76,39,'Computer Attributes',48,0),(77,39,'Descriptions',47,0),(78,44,'Descriptions',3,0),(79,44,'Camera Attributes',6,0),(80,45,'General',1,1),(81,45,'Meta Information',3,0),(82,45,'Images',4,0),(83,45,'Prices',2,0),(84,38,'Descriptions',4,0),(85,38,'Cell Phone Attributes',6,0),(87,40,'Descriptions',47,0),(88,40,'Shoe Attributes',48,0),(89,41,'Descriptions',5,0),(90,42,'Descriptions',47,0),(91,42,'Furniture Attributes',48,0),(92,45,'Description',5,0),(93,45,'Shirt Attributes',6,0),(94,41,'T-shirts Attributes',6,0),(95,9,'Description',5,0),(96,46,'General',1,1),(97,46,'Prices',2,0),(98,46,'Meta Information',3,0),(99,46,'Images',4,0),(100,46,'Description',5,0),(118,9,'Design',6,0),(119,44,'Design',8,0),(120,38,'Design',7,0),(121,39,'Design',49,0),(122,42,'Design',49,0),(123,45,'Design',7,0),(124,46,'Design',6,0),(125,40,'Design',49,0),(126,41,'Design',7,0),(128,50,'General',1,1),(129,51,'General',1,1),(130,52,'General',1,1),(131,53,'General',1,1),(132,54,'General',1,1),(133,55,'General',1,1),(134,56,'General',1,1),(135,57,'General',1,1),(136,58,'General',1,1),(137,58,'Prices',2,0),(138,58,'Meta Information',3,0),(139,58,'Images',4,0),(140,58,'Description',5,0),(141,58,'Design',6,0),(142,59,'General',1,1),(143,59,'Prices',2,0),(144,59,'Meta Information',3,0),(145,59,'Images',4,0),(146,59,'Description',5,0),(147,59,'Design',6,0),(148,60,'General',1,1),(149,60,'Prices',2,0),(150,60,'Meta Information',3,0),(151,60,'Images',4,0),(152,60,'Description',5,0),(153,60,'Design',6,0),(154,61,'General',43,1),(155,61,'Prices',44,0),(156,61,'Meta Information',45,0),(157,61,'Images',46,0),(158,61,'Description',47,0),(159,61,'Design',48,0),(160,62,'General',1,1),(161,62,'Prices',2,0),(162,62,'Meta Information',3,0),(163,62,'Images',4,0),(164,62,'Description',5,0),(165,62,'Design',6,0);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_attribute_option`
--
DROP TABLE IF EXISTS `eav_attribute_option`;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)';
--
-- Dumping data for table `eav_attribute_option`
--
LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,102,1),(2,102,2),(3,102,3),(4,102,4),(5,102,5),(6,102,6),(7,102,7),(8,102,8),(9,102,9),(10,102,10),(11,465,1),(12,465,2),(13,465,3),(20,102,12),(21,102,11),(22,272,0),(23,272,0),(24,272,0),(25,272,0),(26,272,0),(27,102,0),(28,102,0),(29,102,0),(30,102,0),(31,102,0),(32,102,0),(33,102,0),(34,102,0),(35,501,0),(36,501,0),(37,502,12),(38,502,11),(39,502,10),(40,502,9),(41,502,8),(42,502,7),(43,502,6),(44,502,5),(45,502,4),(46,502,3),(47,107,0),(48,107,0),(49,107,0),(51,107,0),(52,107,0),(53,107,0),(54,97,0),(55,97,0),(56,107,0),(57,272,0),(58,272,0),(59,272,0),(60,272,0),(61,272,0),(62,102,0),(63,102,0),(64,102,0),(65,501,0),(66,501,0),(67,508,0),(68,508,0),(69,508,0),(70,508,0),(71,508,0),(72,508,0),(73,510,0),(74,510,0),(75,510,0),(76,510,0),(77,510,0),(78,510,0),(79,510,0),(83,102,0),(88,513,9),(89,513,8),(90,513,7),(91,513,6),(92,513,5),(93,513,4),(94,513,3),(95,513,2),(96,513,1),(97,107,0),(98,525,3),(99,525,2),(100,525,1),(101,102,0),(102,102,0),(103,102,0),(104,102,0),(105,102,0),(106,875,0),(107,875,0),(108,875,0),(109,875,0),(110,875,0),(111,102,0),(112,877,0),(113,877,0),(114,877,0),(115,877,0),(116,102,0),(117,102,0),(118,102,0),(119,102,0),(120,102,0),(121,102,0),(122,102,0);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_attribute_option_value`
--
DROP TABLE IF EXISTS `eav_attribute_option_value`;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1460 DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store';
--
-- Dumping data for table `eav_attribute_option_value`
--
LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` VALUES (51,11,1,'Red'),(52,12,1,'Blue'),(53,13,1,'Yellow'),(54,11,0,'Red'),(55,12,0,'Blue'),(56,13,0,'Yellow'),(476,65,0,'Boys'),(477,66,0,'Girls'),(478,36,0,'Mens'),(479,35,0,'Womens'),(919,55,0,'Mens'),(920,54,0,'Womens'),(1110,61,0,'Gray'),(1111,23,0,'Silver'),(1112,23,1,'Silver'),(1113,24,0,'Black'),(1114,24,1,'Black'),(1115,25,0,'Blue'),(1116,25,1,'Blue'),(1117,26,0,'Red'),(1118,26,1,'Red'),(1119,57,0,'Pink'),(1120,58,0,'Magneta'),(1121,59,0,'Brown'),(1122,60,0,'White'),(1123,22,0,'Green'),(1124,22,1,'Green'),(1138,97,0,'Sandal'),(1139,56,0,'Misc'),(1140,53,0,'Tennis'),(1141,52,0,'Dress'),(1142,51,0,'High Heels'),(1143,49,0,'Running'),(1144,48,0,'Biking'),(1145,47,0,'Golf Shoes'),(1146,46,0,'3'),(1147,45,0,'4'),(1148,44,0,'5'),(1149,43,0,'6'),(1150,42,0,'7'),(1151,41,0,'8'),(1152,40,0,'9'),(1153,39,0,'10'),(1154,38,0,'11'),(1155,37,0,'12'),(1156,72,0,'Living Room'),(1157,71,0,'Bedroom'),(1158,70,0,'Dining Room'),(1159,69,0,'Kitchen'),(1160,68,0,'Kids Room'),(1161,67,0,'Bathroom'),(1162,96,0,'2'),(1163,95,0,'3'),(1164,94,0,'4'),(1165,93,0,'5'),(1166,92,0,'6'),(1167,91,0,'7'),(1168,90,0,'8'),(1169,89,0,'9'),(1170,88,0,'10'),(1171,100,0,'Small'),(1172,99,0,'Medium'),(1173,98,0,'Large'),(1215,106,0,'10000:1'),(1216,107,0,'1500:1'),(1217,108,0,'1000:1'),(1218,109,0,'2000:1'),(1219,110,0,'3000:1'),(1262,112,0,'3.0 GHz'),(1263,113,0,'2.5 GHz'),(1264,114,0,'3.2 GHz'),(1265,115,0,'2.0 GHz'),(1404,122,0,'HTC'),(1405,121,0,'Logitech'),(1406,63,0,'CN CLogs'),(1407,62,0,'Steve Madden'),(1408,34,0,'Canon'),(1409,33,0,'Olympus'),(1410,32,0,'Argus'),(1411,31,0,'Kodak'),(1412,30,0,'Dell'),(1413,29,0,'Apple'),(1414,28,0,'Acer'),(1415,27,0,'Gateway'),(1416,64,0,'Asics'),(1417,83,0,'Toshiba'),(1418,101,0,'At&t'),(1419,119,0,'Seagate'),(1420,118,0,'Western Digital'),(1421,117,0,'AMD'),(1422,116,0,'Intel'),(1423,111,0,'Crucial'),(1424,105,0,'Nine West'),(1425,104,0,'Ecco'),(1426,103,0,'Kenneth Cole'),(1427,102,0,'Anashria'),(1428,120,0,'Microsoft'),(1429,1,1,'LG'),(1430,1,0,'LG'),(1431,2,1,'Sony'),(1432,2,0,'Sony'),(1433,3,1,'Samsung'),(1434,3,0,'Samsung'),(1435,4,1,'HP'),(1436,4,0,'HP'),(1437,5,1,'JVC'),(1438,5,0,'JVC'),(1439,6,1,'Panasonic'),(1440,6,0,'Panasonic'),(1441,7,1,'Yamaha'),(1442,7,0,'Yamaha'),(1443,8,1,'Philips'),(1444,8,0,'Philips'),(1445,9,1,'Acco'),(1446,9,0,'Acco'),(1447,10,1,'Aiwa'),(1448,10,0,'Aiwa'),(1449,21,1,'BlackBerry'),(1450,21,0,'BlackBerry'),(1451,20,1,'Nokia'),(1452,20,0,'Nokia'),(1453,79,0,'Acer'),(1454,78,0,'IBM'),(1455,77,0,'Apple'),(1456,76,0,'Sony'),(1457,75,0,'Gateway'),(1458,74,0,'Toshiba'),(1459,73,0,'Dell');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_attribute_set`
--
DROP TABLE IF EXISTS `eav_attribute_set`;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_name` varchar(255) character set utf8 collate utf8_swedish_ci NOT NULL default '',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_attribute_set`
--
LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` VALUES (1,1,'Default',8),(2,2,'Default',8),(3,3,'Default',5),(9,10,'Default',16),(12,9,'Default',14),(18,4,'Default',33),(19,5,'Default',1),(20,6,'Default',34),(21,7,'Default',34),(22,8,'Default',34),(23,11,'Default',32),(24,12,'Default',33),(25,13,'Default',33),(26,14,'Default',33),(27,15,'Default',33),(28,16,'Default',34),(29,17,'Default',32),(30,18,'Default',32),(31,19,'Default',3),(32,20,'Default',32),(33,21,'Default',4),(34,22,'Default',3),(38,10,'Cell Phones',0),(39,10,'Computer',0),(40,10,'Shoes',0),(41,10,'Shirts T',0),(42,10,'Furniture',0),(44,10,'Cameras',0),(45,10,'Shirts Other',0),(46,10,'Shirts (General)',0),(50,23,'Default',29),(51,24,'Default',29),(52,25,'Default',29),(53,26,'Default',29),(54,27,'Default',29),(55,28,'Default',29),(56,29,'Default',29),(57,30,'Default',29),(58,10,'RAM',0),(59,10,'Warranties',0),(60,10,'CPU',0),(61,10,'Monitors',0),(62,10,'Hard Drive',0);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity`
--
DROP TABLE IF EXISTS `eav_entity`;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`),
  CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Entityies';
--
-- Dumping data for table `eav_entity`
--
LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
INSERT INTO `eav_entity` VALUES (1,1,0,'',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_attribute`
--
DROP TABLE IF EXISTS `eav_entity_attribute`;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_eav_entity_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_attribute_group` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_ATTRIVUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4555 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_entity_attribute`
--
LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (1,1,1,1,1,40),(2,1,1,1,2,50),(3,1,1,1,3,60),(4,1,1,1,4,4),(7,1,1,1,7,7),(8,1,1,1,8,8),(9,2,2,2,9,10),(10,2,2,2,10,20),(11,2,2,2,11,60),(12,2,2,2,12,70),(13,2,2,2,13,80),(14,2,2,2,14,90),(15,2,2,2,15,50),(16,2,2,2,16,40),(17,2,2,2,17,100),(18,2,2,2,18,110),(19,3,3,3,19,1),(95,2,2,2,95,30),(112,10,9,4,110,15),(194,8,1,1,256,0),(195,8,1,1,255,0),(196,8,1,1,254,0),(197,8,1,1,253,0),(198,7,1,1,252,0),(199,7,1,1,251,0),(200,7,1,1,250,0),(201,7,1,1,249,0),(202,7,1,1,248,0),(203,7,1,1,247,0),(204,7,1,1,246,0),(205,7,1,1,245,0),(206,7,1,1,244,0),(207,7,1,1,243,0),(208,7,1,1,242,0),(209,7,1,1,241,0),(210,7,1,1,240,0),(211,7,1,1,239,0),(212,7,1,1,238,0),(213,7,1,1,237,0),(214,7,1,1,236,0),(215,7,1,1,235,0),(216,7,1,1,234,0),(217,6,1,1,233,0),(218,6,1,1,232,0),(219,6,1,1,231,0),(220,6,1,1,230,0),(221,6,1,1,229,0),(222,6,1,1,228,0),(223,6,1,1,227,0),(224,6,1,1,226,0),(225,6,1,1,225,0),(226,6,1,1,223,0),(227,6,1,1,224,0),(228,6,1,1,222,0),(229,6,1,1,221,0),(230,6,1,1,220,0),(231,6,1,1,219,0),(232,6,1,1,218,0),(233,4,1,1,217,0),(234,4,1,1,216,0),(235,4,1,1,215,0),(236,4,1,1,214,0),(237,4,1,1,213,0),(238,4,1,1,212,0),(239,4,1,1,211,0),(240,4,1,1,210,0),(241,4,1,1,209,0),(242,4,1,1,208,0),(243,4,1,1,207,0),(245,4,1,1,205,0),(246,4,1,1,204,0),(247,4,1,1,203,0),(248,4,1,1,202,0),(249,4,1,1,201,0),(250,4,1,1,200,0),(251,4,1,1,199,0),(252,4,1,1,198,0),(253,4,1,1,197,0),(254,4,1,1,196,0),(255,4,1,1,195,0),(256,4,1,1,194,0),(257,8,1,1,257,0),(258,8,1,1,258,0),(259,8,1,1,259,0),(260,8,1,1,260,0),(261,8,1,1,261,0),(262,8,1,1,262,0),(263,8,1,1,263,0),(264,8,1,1,264,0),(265,8,1,1,265,0),(266,8,1,1,266,0),(267,5,1,1,267,0),(268,5,1,1,268,0),(271,9,12,7,111,1),(272,9,12,7,112,2),(273,9,12,7,113,3),(274,9,12,7,114,4),(275,9,12,7,115,5),(276,9,12,7,116,6),(277,9,12,7,117,7),(278,9,12,7,118,8),(279,9,12,7,119,9),(280,9,12,7,120,10),(281,9,12,7,121,11),(282,9,12,7,122,12),(283,9,12,7,123,13),(326,11,23,17,275,1),(327,11,23,17,276,2),(328,11,23,17,277,3),(329,11,23,17,278,4),(330,11,23,17,279,5),(331,11,23,17,280,6),(332,11,23,17,281,7),(333,11,23,17,282,8),(334,11,23,17,283,9),(335,11,23,17,284,10),(336,11,23,17,285,11),(337,11,23,17,286,12),(338,11,23,17,287,13),(339,11,23,17,288,14),(340,11,23,17,289,15),(341,11,23,17,290,16),(342,11,23,17,291,17),(343,11,23,17,292,18),(344,11,23,17,293,19),(345,11,23,17,294,20),(346,11,23,17,295,21),(347,11,23,17,296,22),(348,11,23,17,297,23),(349,12,24,18,298,1),(350,12,24,18,299,2),(351,12,24,18,300,3),(352,12,24,18,301,4),(353,12,24,18,302,5),(354,12,24,18,303,6),(355,12,24,18,304,7),(356,12,24,18,305,8),(357,12,24,18,306,9),(358,12,24,18,307,10),(359,12,24,18,308,11),(360,12,24,18,309,12),(361,12,24,18,310,13),(362,12,24,18,311,14),(363,12,24,18,312,15),(364,12,24,18,313,16),(365,12,24,18,314,17),(366,12,24,18,315,18),(367,12,24,18,316,19),(368,12,24,18,317,20),(369,12,24,18,318,21),(370,12,24,18,319,22),(371,12,24,18,320,23),(372,12,24,18,321,24),(373,12,24,18,322,25),(374,12,24,18,323,26),(375,12,24,18,324,27),(376,12,24,18,325,28),(377,13,25,19,326,1),(378,13,25,19,327,2),(379,13,25,19,328,3),(380,13,25,19,329,4),(381,13,25,19,330,5),(382,13,25,19,331,6),(383,13,25,19,332,7),(384,13,25,19,333,8),(385,14,26,20,334,1),(386,14,26,20,335,2),(387,14,26,20,336,3),(388,14,26,20,337,4),(389,14,26,20,338,5),(390,14,26,20,339,6),(391,14,26,20,340,7),(392,14,26,20,341,8),(393,14,26,20,342,9),(394,15,27,21,343,1),(395,15,27,21,344,2),(396,15,27,21,345,3),(397,15,27,21,346,4),(398,15,27,21,347,5),(399,15,27,21,348,6),(400,15,27,21,349,7),(401,15,27,21,350,8),(402,15,27,21,351,9),(403,15,27,21,352,10),(404,15,27,21,353,11),(405,15,27,21,354,12),(406,15,27,21,355,13),(407,15,27,21,356,14),(408,15,27,21,357,15),(409,15,27,21,358,16),(410,16,28,22,359,1),(411,16,28,22,360,2),(412,16,28,22,361,3),(413,16,28,22,362,4),(414,16,28,22,363,5),(415,16,28,22,364,6),(416,16,28,22,365,7),(417,16,28,22,366,8),(418,16,28,22,367,9),(419,16,28,22,368,10),(420,16,28,22,369,11),(421,4,18,23,370,1),(422,4,18,23,205,2),(423,4,18,23,210,3),(424,4,18,23,371,4),(425,4,18,23,204,5),(426,4,18,23,372,6),(427,4,18,23,217,7),(428,4,18,23,216,8),(429,4,18,23,212,9),(430,4,18,23,213,10),(431,4,18,23,373,11),(432,4,18,23,374,12),(433,4,18,23,375,13),(434,4,18,23,376,14),(435,4,18,23,377,15),(436,4,18,23,378,16),(437,4,18,23,379,17),(438,4,18,23,196,18),(439,4,18,23,214,19),(440,4,18,23,208,20),(441,4,18,23,198,21),(442,4,18,23,200,22),(443,4,18,23,201,23),(444,4,18,23,199,24),(445,4,18,23,202,25),(446,4,18,23,203,26),(447,4,18,23,194,27),(448,4,18,23,380,28),(449,4,18,23,381,29),(451,4,18,23,383,31),(452,6,20,24,384,1),(453,6,20,24,385,2),(454,6,20,24,233,3),(455,6,20,24,221,4),(456,6,20,24,386,5),(457,6,20,24,223,6),(458,6,20,24,224,7),(459,6,20,24,225,8),(460,6,20,24,226,9),(461,6,20,24,222,10),(462,6,20,24,227,11),(463,6,20,24,228,12),(464,6,20,24,218,13),(465,6,20,24,229,14),(466,6,20,24,219,15),(467,6,20,24,230,16),(468,6,20,24,231,17),(469,7,21,25,387,1),(470,7,21,25,388,2),(471,7,21,25,249,3),(472,7,21,25,389,4),(473,7,21,25,250,5),(474,7,21,25,251,6),(475,7,21,25,390,7),(476,7,21,25,391,8),(477,7,21,25,236,9),(478,7,21,25,237,10),(479,7,21,25,238,11),(480,7,21,25,239,12),(481,7,21,25,240,13),(482,7,21,25,242,14),(483,7,21,25,243,15),(484,7,21,25,244,16),(485,7,21,25,245,17),(486,7,21,25,246,18),(487,7,21,25,247,19),(488,7,21,25,248,20),(489,8,22,26,392,1),(490,8,22,26,393,2),(491,8,22,26,394,3),(492,8,22,26,395,4),(493,8,22,26,257,5),(494,8,22,26,258,6),(495,8,22,26,259,7),(496,8,22,26,260,8),(497,8,22,26,261,9),(498,8,22,26,262,10),(499,8,22,26,253,11),(500,8,22,26,254,12),(501,8,22,26,396,13),(502,8,22,26,397,14),(503,8,22,26,263,15),(504,8,22,26,264,16),(505,8,22,26,265,17),(506,8,22,26,266,18),(507,8,22,26,398,19),(508,8,22,26,399,20),(509,8,22,26,400,21),(510,8,22,26,401,22),(511,8,22,26,402,23),(512,8,22,26,403,24),(513,8,22,26,404,25),(514,8,22,26,405,26),(515,8,22,26,406,27),(516,17,29,27,407,1),(517,17,29,27,408,2),(518,17,29,27,409,3),(519,17,29,27,410,4),(520,18,30,28,411,1),(521,18,30,28,412,2),(522,18,30,28,413,3),(523,18,30,28,414,4),(524,18,30,28,415,5),(525,18,30,28,416,6),(526,18,30,28,417,7),(527,18,30,28,418,8),(528,18,30,28,419,9),(529,18,30,28,420,10),(530,18,30,28,421,11),(531,18,30,28,422,12),(532,18,30,28,423,13),(533,18,30,28,424,14),(534,18,30,28,425,15),(535,18,30,28,426,16),(536,18,30,28,427,17),(537,18,30,28,428,18),(538,18,30,28,429,19),(539,18,30,28,430,20),(540,18,30,28,431,21),(541,19,31,29,432,1),(542,19,31,29,433,2),(543,19,31,29,434,3),(544,19,31,29,435,4),(545,19,31,29,436,5),(546,19,31,29,437,6),(547,19,31,29,438,7),(548,19,31,29,439,8),(549,19,31,29,440,9),(550,19,31,29,441,10),(551,19,31,29,442,11),(552,19,31,29,443,12),(553,19,31,29,444,13),(554,19,31,29,445,14),(555,19,31,29,446,15),(556,19,31,29,447,16),(557,19,31,29,448,17),(558,20,32,30,449,1),(559,20,32,30,450,2),(560,20,32,30,451,3),(561,20,32,30,452,4),(562,20,32,30,453,5),(563,20,32,30,454,6),(564,20,32,30,455,7),(565,20,32,30,456,8),(566,20,32,30,457,9),(567,20,32,30,458,10),(568,20,32,30,459,11),(569,21,33,31,460,1),(570,21,33,31,461,2),(571,21,33,31,462,3),(572,21,33,31,463,4),(573,21,33,31,464,5),(574,21,33,31,465,6),(575,21,33,31,466,7),(576,21,33,31,467,8),(577,22,34,32,468,1),(578,22,34,32,469,2),(579,22,34,32,470,3),(580,22,34,32,471,4),(581,22,34,32,472,5),(582,11,23,17,473,24),(583,15,27,21,474,17),(584,14,26,20,475,10),(624,1,1,1,477,30),(625,1,1,1,478,20),(626,9,12,7,479,14),(633,15,27,21,482,18),(634,7,21,25,483,21),(825,10,38,47,110,6),(904,12,24,18,488,29),(905,14,26,20,489,11),(906,15,27,21,490,19),(907,4,18,23,491,32),(990,10,39,51,110,6),(1044,10,40,55,110,6),(1122,10,41,59,110,6),(1166,10,39,53,503,4),(1168,10,9,9,503,1),(1169,10,38,49,503,4),(1172,10,40,57,503,4),(1173,10,41,61,503,4),(1175,12,24,18,504,30),(1176,15,27,21,505,20),(1314,10,42,63,110,6),(1336,10,42,66,503,4),(1571,10,44,72,110,6),(1593,10,44,75,503,4),(1674,9,12,7,514,15),(1675,14,26,20,515,12),(1676,14,26,20,516,13),(1677,14,26,20,517,14),(1678,14,26,20,518,15),(1679,14,26,20,519,16),(1680,14,26,20,520,17),(1681,14,26,20,521,18),(1682,14,26,20,522,19),(1683,14,26,20,523,20),(1684,14,26,20,524,21),(1714,10,44,72,96,1),(1715,10,44,72,98,3),(1716,10,44,72,101,4),(1717,10,44,72,102,6),(1719,10,44,72,272,5),(1720,10,44,72,273,8),(1721,10,44,72,274,9),(1723,10,44,72,481,11),(1724,10,44,72,495,2),(1725,10,44,73,103,1),(1726,10,44,73,104,2),(1727,10,44,73,105,3),(1728,10,44,78,97,2),(1729,10,44,78,492,3),(1730,10,44,78,506,1),(1731,10,44,74,106,3),(1732,10,44,74,109,2),(1733,10,44,74,271,4),(1734,10,44,74,493,1),(1735,10,44,75,99,1),(1736,10,44,75,100,2),(1737,10,44,75,270,3),(1738,10,44,79,494,2),(1739,10,44,79,513,1),(1771,10,45,80,110,6),(1789,10,45,83,503,4),(1820,10,44,72,526,12),(2078,10,39,51,96,43),(2079,10,39,51,98,46),(2080,10,39,51,101,47),(2082,10,39,51,272,48),(2083,10,39,51,273,50),(2084,10,39,51,274,51),(2086,10,39,51,481,53),(2087,10,39,51,495,44),(2088,10,39,51,510,45),(2089,10,39,51,526,54),(2090,10,39,53,99,43),(2091,10,39,53,100,44),(2092,10,39,53,270,45),(2093,10,39,52,103,43),(2094,10,39,52,104,44),(2095,10,39,52,105,45),(2096,10,39,54,106,45),(2097,10,39,54,109,44),(2098,10,39,54,271,46),(2099,10,39,54,493,43),(2100,10,39,77,97,44),(2101,10,39,77,492,45),(2102,10,39,77,506,43),(2103,10,39,76,494,43),(2104,10,39,76,497,46),(2105,10,39,76,498,47),(2106,10,39,76,499,45),(2107,10,39,76,500,44),(2133,10,40,55,96,43),(2134,10,40,55,98,45),(2135,10,40,55,101,46),(2136,10,40,55,102,47),(2138,10,40,55,273,49),(2139,10,40,55,274,50),(2141,10,40,55,481,52),(2142,10,40,55,495,44),(2143,10,40,55,526,53),(2144,10,40,57,99,43),(2145,10,40,57,100,44),(2146,10,40,57,270,45),(2147,10,40,56,103,43),(2148,10,40,56,104,44),(2149,10,40,56,105,45),(2150,10,40,58,106,45),(2151,10,40,58,109,44),(2152,10,40,58,271,46),(2153,10,40,58,493,43),(2154,10,40,87,97,44),(2155,10,40,87,492,45),(2156,10,40,87,506,43),(2157,10,40,88,107,44),(2158,10,40,88,272,45),(2159,10,40,88,501,46),(2160,10,40,88,502,43),(2185,10,42,63,96,43),(2186,10,42,63,98,45),(2187,10,42,63,101,46),(2189,10,42,63,273,49),(2190,10,42,63,274,50),(2192,10,42,63,481,52),(2193,10,42,63,494,47),(2194,10,42,63,495,44),(2195,10,42,63,526,53),(2196,10,42,66,99,43),(2197,10,42,66,100,44),(2198,10,42,66,270,45),(2199,10,42,64,103,43),(2200,10,42,64,104,44),(2201,10,42,64,105,45),(2202,10,42,65,106,45),(2203,10,42,65,109,44),(2204,10,42,65,271,46),(2205,10,42,65,493,43),(2206,10,42,90,97,44),(2207,10,42,90,506,43),(2208,10,42,91,272,46),(2209,10,42,91,507,45),(2210,10,42,91,508,43),(2211,10,42,91,509,44),(2307,10,9,4,96,1),(2308,10,9,4,98,2),(2309,10,9,4,101,3),(2312,10,9,4,273,6),(2313,10,9,4,274,7),(2315,10,9,4,481,9),(2316,10,9,4,526,10),(2317,10,9,9,99,1),(2318,10,9,9,100,2),(2319,10,9,9,270,3),(2320,10,9,12,103,1),(2321,10,9,12,104,2),(2322,10,9,12,105,3),(2323,10,9,15,106,4),(2324,10,9,15,109,2),(2325,10,9,15,271,3),(2326,10,9,15,493,1),(2327,10,9,95,97,1),(2328,10,9,95,506,2),(2437,10,46,96,110,15),(2439,10,46,97,503,1),(2579,16,28,22,527,12),(2580,16,28,22,528,13),(2581,16,28,22,529,14),(2629,9,12,7,530,16),(2630,10,44,119,531,13),(2632,10,39,121,531,55),(2633,10,9,118,531,16),(2634,10,42,122,531,54),(2637,10,40,125,531,54),(2640,1,1,1,532,70),(2641,9,12,7,533,17),(2642,11,23,17,534,25),(2643,12,24,18,535,31),(2644,15,27,21,536,21),(2645,4,18,23,537,33),(2646,6,20,24,538,18),(2647,7,21,25,539,22),(2648,10,44,72,540,14),(2649,10,38,47,540,55),(2650,10,39,51,540,56),(2651,10,9,4,540,17),(2652,10,42,63,540,55),(2653,10,45,80,540,11),(2654,10,46,96,540,17),(2655,10,40,55,540,55),(2656,10,41,59,540,12),(2658,14,26,20,541,22),(2659,7,21,25,542,23),(2660,11,23,17,543,26),(2661,11,23,17,544,27),(2662,11,23,17,545,28),(2663,11,23,17,546,29),(2664,4,18,23,547,34),(2665,4,18,23,548,35),(2666,4,18,23,549,36),(2667,4,18,23,550,37),(2668,15,27,21,551,22),(2669,14,26,20,552,23),(2670,4,18,23,215,38),(2671,4,18,23,553,39),(2672,4,18,23,554,40),(2673,4,18,23,555,41),(2674,4,18,23,556,42),(2675,4,18,23,557,43),(2676,4,18,23,558,44),(2677,17,29,27,559,5),(2678,17,29,27,560,6),(2679,7,21,25,561,24),(2680,10,44,72,562,15),(2682,10,39,51,562,57),(2683,10,9,4,562,18),(2684,10,42,63,562,56),(2687,10,40,55,562,56),(2690,9,12,7,563,18),(2691,9,12,7,564,19),(2692,9,12,7,565,20),(2693,9,12,7,566,21),(2694,10,44,75,567,5),(2696,10,39,53,567,46),(2697,10,9,9,567,4),(2698,10,42,66,567,46),(2701,10,40,57,567,46),(2704,10,44,75,568,6),(2706,10,39,53,568,47),(2707,10,9,9,568,5),(2708,10,42,66,568,47),(2711,10,40,57,568,47),(2714,10,44,75,569,7),(2716,10,39,53,569,48),(2717,10,9,9,569,6),(2718,10,42,66,569,48),(2721,10,40,57,569,48),(2724,10,39,51,102,58),(2725,10,9,4,102,19),(2726,10,42,63,102,57),(2731,10,9,4,272,20),(2734,10,44,72,570,16),(2735,10,38,47,570,57),(2736,10,39,51,570,59),(2737,10,9,4,570,21),(2738,10,42,63,570,58),(2739,10,45,80,570,14),(2740,10,46,96,570,21),(2741,10,40,55,570,57),(2742,10,41,59,570,15),(2744,10,44,119,571,1),(2746,10,39,121,571,1),(2747,10,9,118,571,1),(2748,10,42,122,571,1),(2751,10,40,125,571,1),(2754,10,44,119,572,2),(2756,10,39,121,572,2),(2757,10,9,118,572,2),(2758,10,42,122,572,2),(2761,10,40,125,572,2),(2764,10,44,119,573,3),(2766,10,39,121,573,3),(2767,10,9,118,573,3),(2768,10,42,122,573,3),(2771,10,40,125,573,3),(2774,11,23,17,574,30),(2775,11,23,17,575,31),(2776,12,24,18,576,32),(2777,14,26,20,577,24),(2778,14,26,20,578,25),(2779,15,27,21,579,23),(2780,15,27,21,580,24),(2781,16,28,22,581,15),(2782,4,18,23,582,45),(2783,4,18,23,583,46),(2784,4,18,23,584,47),(2785,4,18,23,585,48),(2786,7,21,25,586,25),(2787,7,21,25,587,26),(2788,7,21,25,234,27),(2789,7,21,25,588,28),(2790,7,21,25,589,29),(2791,7,21,25,590,30),(2792,7,21,25,591,31),(2793,7,21,25,592,32),(2794,7,21,25,593,33),(2795,7,21,25,594,34),(2796,7,21,25,595,35),(2797,8,22,26,596,28),(2798,8,22,26,597,29),(2799,8,22,26,598,30),(2800,8,22,26,599,31),(2801,8,22,26,600,32),(2802,8,22,26,601,33),(2803,8,22,26,602,34),(2804,8,22,26,603,35),(2805,8,22,26,604,36),(2806,18,30,28,605,22),(2807,18,30,28,606,23),(2808,18,30,28,607,24),(2809,18,30,28,608,25),(2810,20,32,30,609,12),(2811,20,32,30,610,13),(2812,23,50,128,611,1),(2813,23,50,128,612,2),(2814,23,50,128,613,3),(2815,24,51,129,614,1),(2816,24,51,129,615,2),(2817,24,51,129,616,3),(2818,24,51,129,617,4),(2819,24,51,129,618,5),(2820,24,51,129,619,6),(2821,24,51,129,620,7),(2822,24,51,129,621,8),(2823,25,52,130,622,1),(2824,25,52,130,623,2),(2825,25,52,130,624,3),(2826,25,52,130,625,4),(2827,25,52,130,626,5),(2828,25,52,130,627,6),(2829,25,52,130,628,7),(2830,25,52,130,629,8),(2831,25,52,130,630,9),(2832,25,52,130,631,10),(2833,26,53,131,632,1),(2834,26,53,131,633,2),(2835,26,53,131,634,3),(2836,27,54,132,635,1),(2837,27,54,132,636,2),(2838,27,54,132,637,3),(2839,27,54,132,638,4),(2840,27,54,132,639,5),(2841,27,54,132,640,6),(2842,27,54,132,641,7),(2843,27,54,132,642,8),(2844,28,55,133,643,1),(2845,28,55,133,644,2),(2846,28,55,133,645,3),(2847,28,55,133,646,4),(2848,28,55,133,647,5),(2849,28,55,133,648,6),(2850,28,55,133,649,7),(2851,28,55,133,650,8),(2852,28,55,133,651,9),(2853,28,55,133,652,10),(2854,28,55,133,653,11),(2855,28,55,133,654,12),(2856,28,55,133,655,13),(2857,28,55,133,656,14),(2858,28,55,133,657,15),(2859,28,55,133,658,16),(2860,28,55,133,659,17),(2861,28,55,133,660,18),(2862,28,55,133,661,19),(2863,28,55,133,662,20),(2864,29,56,134,663,1),(2865,29,56,134,664,2),(2866,29,56,134,665,3),(2867,29,56,134,666,4),(2868,29,56,134,667,5),(2869,29,56,134,668,6),(2870,29,56,134,669,7),(2871,29,56,134,670,8),(2872,29,56,134,671,9),(2873,29,56,134,672,10),(2874,29,56,134,673,11),(2875,29,56,134,674,12),(2876,30,57,135,675,1),(2877,30,57,135,676,2),(2878,30,57,135,677,3),(2879,11,23,17,678,32),(2880,11,23,17,679,33),(2881,14,26,20,680,26),(2882,15,27,21,681,25),(2883,16,28,22,682,16),(2884,16,28,22,683,17),(2885,16,28,22,684,18),(2886,4,18,23,685,49),(2887,4,18,23,686,50),(2888,4,18,23,687,51),(2889,4,18,23,688,52),(2890,4,18,23,689,53),(2891,4,18,23,690,54),(2892,4,18,23,691,55),(2893,4,18,23,692,56),(2894,4,18,23,693,57),(2895,7,21,25,694,36),(2896,8,22,26,695,37),(2897,8,22,26,696,38),(2898,8,22,26,697,39),(2899,18,30,28,698,26),(2900,28,55,133,699,21),(2901,1,1,1,700,10),(2902,9,12,7,701,22),(2903,9,12,7,702,23),(2904,10,44,74,703,5),(2906,10,39,54,703,47),(2907,10,9,15,703,5),(2908,10,42,65,703,47),(2911,10,40,58,703,47),(2914,10,44,72,704,17),(2916,10,39,51,704,60),(2917,10,9,4,704,22),(2918,10,42,63,704,59),(2921,10,40,55,704,58),(2924,10,44,72,705,18),(2926,10,39,51,705,61),(2927,10,9,4,705,23),(2928,10,42,63,705,60),(2931,10,40,55,705,59),(2934,10,44,72,706,19),(2935,10,38,47,706,60),(2936,10,39,51,706,62),(2937,10,9,4,706,24),(2938,10,42,63,706,61),(2939,10,45,80,706,17),(2940,10,46,96,706,24),(2941,10,40,55,706,60),(2942,10,41,59,706,18),(2944,11,23,17,707,34),(2945,12,24,18,708,33),(2946,12,24,18,709,34),(2947,12,24,18,710,35),(2948,12,24,18,711,36),(2949,12,24,18,712,37),(2950,12,24,18,713,38),(2951,12,24,18,714,39),(2952,14,26,20,715,27),(2953,14,26,20,716,28),(2954,14,26,20,717,29),(2955,14,26,20,718,30),(2956,14,26,20,719,31),(2957,15,27,21,720,26),(2958,15,27,21,721,27),(2959,15,27,21,722,28),(2960,15,27,21,723,29),(2961,15,27,21,724,30),(2962,4,18,23,725,58),(2963,4,18,23,726,59),(2964,4,18,23,727,60),(2965,4,18,23,728,61),(2966,4,18,23,729,62),(2967,4,18,23,730,63),(2968,4,18,23,731,64),(2969,4,18,23,732,65),(2970,4,18,23,733,66),(2971,4,18,23,734,67),(2972,4,18,23,735,68),(2973,4,18,23,736,69),(2974,4,18,23,737,70),(2975,4,18,23,738,71),(2976,4,18,23,739,72),(2977,4,18,23,740,73),(2978,4,18,23,741,74),(2979,4,18,23,742,75),(2980,4,18,23,743,76),(2981,4,18,23,744,77),(2982,4,18,23,745,78),(2983,4,18,23,746,79),(2984,7,21,25,747,37),(2985,7,21,25,748,38),(2986,7,21,25,749,39),(2987,7,21,25,750,40),(2988,7,21,25,751,41),(2989,7,21,25,752,42),(2990,7,21,25,753,43),(2991,7,21,25,754,44),(2992,7,21,25,755,45),(2993,7,21,25,756,46),(2994,7,21,25,757,47),(2995,8,22,26,758,40),(2996,8,22,26,759,41),(2997,8,22,26,760,42),(2998,8,22,26,761,43),(2999,8,22,26,762,44),(3000,8,22,26,763,45),(3001,8,22,26,764,46),(3002,8,22,26,765,47),(3003,18,30,28,766,27),(3004,18,30,28,767,28),(3005,18,30,28,768,29),(3006,18,30,28,769,30),(3007,18,30,28,770,31),(3008,18,30,28,771,32),(3009,20,32,30,772,14),(3010,20,32,30,773,15),(3011,20,32,30,774,16),(3012,20,32,30,775,17),(3013,20,32,30,776,18),(3014,24,51,129,777,9),(3015,25,52,130,778,11),(3016,28,55,133,779,22),(3017,28,55,133,780,23),(3018,28,55,133,781,24),(3019,28,55,133,782,25),(3020,28,55,133,783,26),(3021,28,55,133,784,27),(3022,28,55,133,785,28),(3023,28,55,133,786,29),(3024,28,55,133,787,30),(3025,29,56,134,788,13),(3026,29,56,134,789,14),(3027,29,56,134,790,15),(3028,29,56,134,791,16),(3029,29,56,134,792,17),(3030,11,23,17,793,35),(3031,11,23,17,794,36),(3032,4,18,23,795,80),(3033,4,18,23,796,81),(3034,4,18,23,797,82),(3035,4,18,23,798,83),(3036,4,18,23,799,84),(3037,4,18,23,800,85),(3038,4,18,23,801,86),(3039,4,18,23,802,87),(3040,4,18,23,803,88),(3041,4,18,23,804,89),(3042,4,18,23,805,90),(3043,4,18,23,806,91),(3044,4,18,23,807,92),(3045,4,18,23,808,93),(3046,4,18,23,809,94),(3047,4,18,23,810,95),(3048,4,18,23,811,96),(3049,4,18,23,812,97),(3050,4,18,23,813,98),(3051,4,18,23,814,99),(3052,12,24,18,815,40),(3053,11,23,17,816,37),(3054,8,22,26,817,48),(3055,12,24,18,818,41),(3056,12,24,18,819,42),(3057,4,18,23,820,100),(3058,4,18,23,821,101),(3059,18,30,28,822,33),(3060,18,30,28,823,34),(3061,28,55,133,824,31),(3062,28,55,133,825,32),(3063,1,1,1,826,37),(3064,1,1,1,827,43),(3065,1,1,1,828,53),(3066,1,1,1,829,80),(3067,1,1,1,830,81),(3068,1,1,1,831,82),(3069,2,2,2,832,7),(3070,2,2,2,833,13),(3071,2,2,2,834,23),(3072,9,12,7,835,24),(3073,10,44,119,836,14),(3075,10,39,121,836,56),(3076,10,9,118,836,17),(3077,10,42,122,836,55),(3080,10,40,125,836,55),(3083,10,44,72,837,20),(3084,10,38,47,837,61),(3085,10,39,51,837,63),(3086,10,9,4,837,25),(3087,10,42,63,837,62),(3088,10,45,80,837,18),(3089,10,46,96,837,25),(3090,10,40,55,837,61),(3091,10,41,59,837,19),(3093,10,44,72,838,21),(3094,10,38,47,838,62),(3095,10,39,51,838,64),(3096,10,9,4,838,26),(3097,10,42,63,838,63),(3098,10,45,80,838,19),(3099,10,46,96,838,26),(3100,10,40,55,838,62),(3101,10,41,59,838,20),(3103,4,18,23,839,102),(3104,4,18,23,840,103),(3105,4,18,23,841,104),(3106,6,20,24,842,19),(3107,6,20,24,843,20),(3108,6,20,24,844,21),(3109,11,23,17,845,38),(3110,11,23,17,846,39),(3111,11,23,17,847,40),(3112,12,24,18,848,43),(3113,12,24,18,849,44),(3114,12,24,18,850,45),(3115,11,23,17,851,41),(3116,4,18,23,852,105),(3117,7,21,25,853,48),(3118,7,21,25,854,49),(3119,18,30,28,855,35),(3120,28,55,133,856,33),(3121,24,51,129,857,10),(3122,4,18,23,858,106),(3123,10,44,72,859,22),(3124,10,38,47,859,63),(3125,10,39,51,859,65),(3126,10,9,4,859,27),(3127,10,42,63,859,64),(3128,10,45,80,859,20),(3129,10,46,96,859,27),(3130,10,40,55,859,63),(3131,10,41,59,859,21),(3133,10,44,72,860,23),(3134,10,38,47,860,64),(3135,10,39,51,860,66),(3136,10,9,4,860,28),(3137,10,42,63,860,65),(3138,10,45,80,860,21),(3139,10,46,96,860,28),(3140,10,40,55,860,64),(3141,10,41,59,860,22),(3143,10,44,72,861,24),(3144,10,38,47,861,65),(3145,10,39,51,861,67),(3146,10,9,4,861,29),(3147,10,42,63,861,66),(3148,10,45,80,861,22),(3149,10,46,96,861,29),(3150,10,40,55,861,65),(3151,10,41,59,861,23),(3153,10,44,75,862,8),(3155,10,39,53,862,49),(3156,10,9,9,862,7),(3157,10,42,66,862,49),(3160,10,40,57,862,49),(3163,10,44,72,863,25),(3164,10,38,47,863,66),(3165,10,39,51,863,68),(3166,10,9,4,863,30),(3167,10,42,63,863,67),(3168,10,45,80,863,23),(3169,10,46,96,863,30),(3170,10,40,55,863,66),(3171,10,41,59,863,24),(3173,8,22,26,864,49),(3174,18,30,28,865,36),(3175,28,55,133,866,34),(3176,8,22,26,867,50),(3177,8,22,26,868,51),(3178,8,22,26,869,52),(3179,8,22,26,870,53),(3180,8,22,26,871,54),(3181,8,22,26,872,55),(3199,10,58,136,110,15),(3207,10,58,136,570,21),(3213,10,58,136,706,24),(3215,10,58,136,837,25),(3217,10,58,136,838,26),(3219,10,58,136,859,27),(3221,10,58,136,860,28),(3223,10,58,136,861,29),(3225,10,58,136,863,30),(3229,10,58,137,503,1),(3273,10,58,136,96,1),(3275,10,58,136,98,2),(3277,10,58,136,101,3),(3279,10,58,136,102,10),(3283,10,58,136,273,5),(3285,10,58,136,274,6),(3287,10,58,136,481,7),(3289,10,58,136,526,8),(3291,10,58,136,562,9),(3293,10,58,136,704,12),(3295,10,58,136,705,13),(3297,10,58,136,874,11),(3299,10,58,137,99,1),(3301,10,58,137,100,2),(3303,10,58,137,270,3),(3305,10,58,137,567,4),(3307,10,58,137,568,5),(3309,10,58,137,569,6),(3311,10,58,137,862,7),(3313,10,58,138,103,1),(3315,10,58,138,104,2),(3317,10,58,138,105,3),(3319,10,58,139,106,4),(3321,10,58,139,109,2),(3323,10,58,139,271,3),(3325,10,58,139,493,1),(3327,10,58,139,703,5),(3329,10,58,140,97,1),(3331,10,58,140,506,2),(3333,10,58,141,531,4),(3335,10,58,141,571,1),(3337,10,58,141,572,2),(3339,10,58,141,573,3),(3341,10,58,141,836,5),(3359,10,59,142,110,15),(3367,10,59,142,570,21),(3373,10,59,142,706,24),(3375,10,59,142,837,25),(3377,10,59,142,838,26),(3379,10,59,142,859,27),(3381,10,59,142,860,28),(3383,10,59,142,861,29),(3385,10,59,142,863,30),(3389,10,59,143,503,1),(3449,10,60,148,110,15),(3457,10,60,148,570,21),(3463,10,60,148,706,24),(3465,10,60,148,837,25),(3467,10,60,148,838,26),(3469,10,60,148,859,27),(3471,10,60,148,860,28),(3473,10,60,148,861,29),(3475,10,60,148,863,30),(3479,10,60,149,503,1),(3539,10,61,154,110,15),(3547,10,61,154,570,21),(3553,10,61,154,706,24),(3555,10,61,154,837,25),(3557,10,61,154,838,26),(3559,10,61,154,859,27),(3561,10,61,154,860,28),(3563,10,61,154,861,29),(3565,10,61,154,863,30),(3569,10,61,155,503,1),(3613,10,59,142,96,1),(3615,10,59,142,98,2),(3617,10,59,142,101,3),(3621,10,59,142,273,5),(3623,10,59,142,274,6),(3625,10,59,142,481,7),(3627,10,59,142,526,8),(3629,10,59,142,562,9),(3631,10,59,142,704,10),(3633,10,59,142,705,11),(3635,10,59,143,99,1),(3637,10,59,143,100,2),(3639,10,59,143,270,3),(3641,10,59,143,567,4),(3643,10,59,143,568,5),(3645,10,59,143,569,6),(3647,10,59,143,862,7),(3649,10,59,144,103,1),(3651,10,59,144,104,2),(3653,10,59,144,105,3),(3655,10,59,145,106,4),(3657,10,59,145,109,2),(3659,10,59,145,271,3),(3661,10,59,145,493,1),(3663,10,59,145,703,5),(3665,10,59,146,97,1),(3667,10,59,146,506,2),(3669,10,59,147,531,4),(3671,10,59,147,571,1),(3673,10,59,147,572,2),(3675,10,59,147,573,3),(3677,10,59,147,836,5),(3747,10,61,154,96,43),(3749,10,61,154,98,44),(3751,10,61,154,101,45),(3753,10,61,154,102,52),(3757,10,61,154,273,47),(3759,10,61,154,274,48),(3761,10,61,154,481,49),(3763,10,61,154,500,58),(3765,10,61,154,526,50),(3767,10,61,154,562,51),(3769,10,61,154,704,53),(3771,10,61,154,705,54),(3773,10,61,154,873,55),(3775,10,61,154,875,56),(3777,10,61,154,876,57),(3779,10,61,155,99,43),(3781,10,61,155,100,44),(3783,10,61,155,270,45),(3785,10,61,155,567,46),(3787,10,61,155,568,47),(3789,10,61,155,569,48),(3791,10,61,155,862,49),(3793,10,61,156,103,43),(3795,10,61,156,104,44),(3797,10,61,156,105,45),(3799,10,61,157,106,46),(3801,10,61,157,109,44),(3803,10,61,157,271,45),(3805,10,61,157,493,43),(3807,10,61,157,703,47),(3809,10,61,158,97,43),(3811,10,61,158,506,44),(3813,10,61,159,531,46),(3815,10,61,159,571,43),(3817,10,61,159,572,44),(3819,10,61,159,573,45),(3821,10,61,159,836,47),(3823,10,60,148,96,1),(3825,10,60,148,98,2),(3827,10,60,148,101,3),(3829,10,60,148,102,10),(3833,10,60,148,273,5),(3835,10,60,148,274,6),(3837,10,60,148,481,7),(3839,10,60,148,526,8),(3841,10,60,148,562,9),(3843,10,60,148,704,12),(3845,10,60,148,705,13),(3847,10,60,148,877,11),(3849,10,60,149,99,1),(3851,10,60,149,100,2),(3853,10,60,149,270,3),(3855,10,60,149,567,4),(3857,10,60,149,568,5),(3859,10,60,149,569,6),(3861,10,60,149,862,7),(3863,10,60,150,103,1),(3865,10,60,150,104,2),(3867,10,60,150,105,3),(3869,10,60,151,106,4),(3871,10,60,151,109,2),(3873,10,60,151,271,3),(3875,10,60,151,493,1),(3877,10,60,151,703,5),(3879,10,60,152,97,1),(3881,10,60,152,506,2),(3883,10,60,153,531,4),(3885,10,60,153,571,1),(3887,10,60,153,572,2),(3889,10,60,153,573,3),(3891,10,60,153,836,5),(3909,10,62,160,110,15),(3917,10,62,160,570,21),(3923,10,62,160,706,24),(3925,10,62,160,837,25),(3927,10,62,160,838,26),(3929,10,62,160,859,27),(3931,10,62,160,860,28),(3933,10,62,160,861,29),(3935,10,62,160,863,30),(3939,10,62,161,503,1),(3983,10,62,160,96,1),(3985,10,62,160,98,2),(3987,10,62,160,101,3),(3989,10,62,160,102,12),(3993,10,62,160,273,5),(3995,10,62,160,274,6),(3997,10,62,160,481,7),(3999,10,62,160,499,10),(4001,10,62,160,526,8),(4003,10,62,160,562,9),(4005,10,62,160,704,13),(4007,10,62,160,705,14),(4009,10,62,160,878,11),(4011,10,62,161,99,1),(4013,10,62,161,100,2),(4015,10,62,161,270,3),(4017,10,62,161,567,4),(4019,10,62,161,568,5),(4021,10,62,161,569,6),(4023,10,62,161,862,7),(4025,10,62,162,103,1),(4027,10,62,162,104,2),(4029,10,62,162,105,3),(4031,10,62,163,106,4),(4033,10,62,163,109,2),(4035,10,62,163,271,3),(4037,10,62,163,493,1),(4039,10,62,163,703,5),(4041,10,62,164,97,1),(4043,10,62,164,506,2),(4045,10,62,165,531,4),(4047,10,62,165,571,1),(4049,10,62,165,572,2),(4051,10,62,165,573,3),(4053,10,62,165,836,5),(4055,10,38,47,96,1),(4057,10,38,47,98,3),(4059,10,38,47,101,4),(4061,10,38,47,102,5),(4063,10,38,47,273,6),(4065,10,38,47,274,7),(4067,10,38,47,481,8),(4069,10,38,47,495,2),(4071,10,38,47,526,9),(4073,10,38,47,562,10),(4075,10,38,47,704,11),(4077,10,38,47,705,12),(4079,10,38,49,99,1),(4081,10,38,49,100,2),(4083,10,38,49,270,3),(4085,10,38,49,567,4),(4087,10,38,49,568,5),(4089,10,38,49,569,6),(4091,10,38,49,862,7),(4093,10,38,48,103,1),(4095,10,38,48,104,2),(4097,10,38,48,105,3),(4099,10,38,84,97,2),(4101,10,38,84,492,3),(4103,10,38,84,506,1),(4105,10,38,50,106,3),(4107,10,38,50,109,2),(4109,10,38,50,271,4),(4111,10,38,50,493,1),(4113,10,38,50,703,5),(4115,10,38,85,272,3),(4117,10,38,85,494,1),(4119,10,38,85,496,2),(4121,10,38,120,531,4),(4123,10,38,120,571,1),(4125,10,38,120,572,2),(4127,10,38,120,573,3),(4129,10,38,120,836,5),(4131,10,46,96,96,1),(4133,10,46,96,98,2),(4135,10,46,96,101,3),(4137,10,46,96,102,10),(4141,10,46,96,272,11),(4143,10,46,96,273,5),(4145,10,46,96,274,6),(4147,10,46,96,481,7),(4149,10,46,96,526,8),(4151,10,46,96,562,9),(4153,10,46,96,704,12),(4155,10,46,96,705,13),(4157,10,46,97,99,1),(4159,10,46,97,100,2),(4161,10,46,97,270,3),(4163,10,46,97,567,4),(4165,10,46,97,568,5),(4167,10,46,97,569,6),(4169,10,46,97,862,7),(4171,10,46,98,103,1),(4173,10,46,98,104,2),(4175,10,46,98,105,3),(4177,10,46,99,106,4),(4179,10,46,99,109,2),(4181,10,46,99,271,3),(4183,10,46,99,493,1),(4185,10,46,99,703,5),(4187,10,46,100,97,1),(4189,10,46,100,506,2),(4191,10,46,124,531,4),(4193,10,46,124,571,1),(4195,10,46,124,572,2),(4197,10,46,124,573,3),(4199,10,46,124,836,5),(4273,10,41,59,96,1),(4275,10,41,59,98,3),(4277,10,41,59,101,4),(4279,10,41,59,102,10),(4281,10,41,59,273,5),(4283,10,41,59,274,6),(4285,10,41,59,481,7),(4287,10,41,59,495,2),(4289,10,41,59,526,8),(4291,10,41,59,562,9),(4293,10,41,59,704,11),(4295,10,41,59,705,12),(4297,10,41,61,99,1),(4299,10,41,61,100,2),(4301,10,41,61,270,3),(4303,10,41,61,567,4),(4305,10,41,61,568,5),(4307,10,41,61,569,6),(4309,10,41,61,862,7),(4311,10,41,60,103,1),(4313,10,41,60,104,2),(4315,10,41,60,105,3),(4317,10,41,62,106,3),(4319,10,41,62,109,2),(4321,10,41,62,271,4),(4323,10,41,62,493,1),(4325,10,41,62,703,5),(4327,10,41,89,97,2),(4329,10,41,89,506,1),(4331,10,41,94,272,3),(4333,10,41,94,501,1),(4335,10,41,94,525,2),(4337,10,41,126,531,4),(4339,10,41,126,571,1),(4341,10,41,126,572,2),(4343,10,41,126,573,3),(4345,10,41,126,836,5),(4347,10,45,80,96,1),(4349,10,45,80,98,2),(4351,10,45,80,101,3),(4353,10,45,80,102,9),(4355,10,45,80,273,4),(4357,10,45,80,274,5),(4359,10,45,80,481,6),(4361,10,45,80,526,7),(4363,10,45,80,562,8),(4365,10,45,80,704,10),(4367,10,45,80,705,11),(4369,10,45,83,99,1),(4371,10,45,83,100,2),(4373,10,45,83,270,3),(4375,10,45,83,567,4),(4377,10,45,83,568,5),(4379,10,45,83,569,6),(4381,10,45,83,862,7),(4383,10,45,81,103,1),(4385,10,45,81,104,2),(4387,10,45,81,105,3),(4389,10,45,82,106,1),(4391,10,45,82,109,2),(4393,10,45,82,271,4),(4395,10,45,82,493,3),(4397,10,45,82,703,5),(4399,10,45,92,97,1),(4401,10,45,92,506,2),(4403,10,45,93,272,3),(4405,10,45,93,501,2),(4407,10,45,93,525,1),(4409,10,45,123,531,4),(4411,10,45,123,571,1),(4413,10,45,123,572,2),(4415,10,45,123,573,3),(4417,10,45,123,836,5),(4418,10,44,72,879,26),(4419,10,38,47,879,67),(4420,10,39,51,879,69),(4421,10,60,148,879,31),(4422,10,9,4,879,31),(4423,10,42,63,879,68),(4424,10,62,160,879,31),(4425,10,61,154,879,59),(4426,10,58,136,879,31),(4427,10,46,96,879,31),(4428,10,45,80,879,24),(4429,10,41,59,879,25),(4430,10,40,55,879,67),(4431,10,59,142,879,31),(4432,10,44,72,880,27),(4433,10,38,47,880,68),(4434,10,39,51,880,70),(4435,10,60,148,880,32),(4436,10,9,4,880,32),(4437,10,42,63,880,69),(4438,10,62,160,880,32),(4439,10,61,154,880,60),(4440,10,58,136,880,32),(4441,10,46,96,880,32),(4442,10,45,80,880,25),(4443,10,41,59,880,26),(4444,10,40,55,880,68),(4445,10,59,142,880,32),(4446,10,44,72,881,28),(4447,10,38,47,881,69),(4448,10,39,51,881,71),(4449,10,60,148,881,33),(4450,10,9,4,881,33),(4451,10,42,63,881,70),(4452,10,62,160,881,33),(4453,10,61,154,881,61),(4454,10,58,136,881,33),(4455,10,46,96,881,33),(4456,10,45,80,881,26),(4457,10,41,59,881,27),(4458,10,40,55,881,69),(4459,10,59,142,881,33),(4460,4,18,23,882,107),(4461,4,18,23,883,108),(4462,4,18,23,884,109),(4463,4,18,23,885,110),(4464,4,18,23,886,111),(4465,4,18,23,887,112),(4466,4,18,23,888,113),(4467,4,18,23,889,114),(4468,4,18,23,890,115),(4469,18,30,28,891,37),(4470,18,30,28,892,38),(4471,18,30,28,893,39),(4472,28,55,133,894,35),(4473,28,55,133,895,36),(4474,28,55,133,896,37),(4475,4,18,23,897,116),(4476,4,18,23,898,117),(4477,4,18,23,899,118),(4478,4,18,23,900,119),(4479,4,18,23,901,120),(4480,4,18,23,902,121),(4481,10,44,75,903,29),(4482,10,38,49,903,70),(4483,10,39,53,903,72),(4484,10,60,149,903,34),(4485,10,9,9,903,34),(4486,10,42,66,903,71),(4487,10,62,161,903,34),(4488,10,61,155,903,62),(4489,10,58,137,903,34),(4490,10,46,97,903,34),(4491,10,45,83,903,27),(4492,10,41,61,903,28),(4493,10,40,57,903,70),(4494,10,59,143,903,34),(4495,10,44,72,904,29),(4496,10,38,47,904,70),(4497,10,39,51,904,72),(4498,10,60,148,904,34),(4499,10,9,4,904,34),(4500,10,42,63,904,71),(4501,10,62,160,904,34),(4502,10,61,154,904,62),(4503,10,58,136,904,34),(4504,10,46,96,904,34),(4505,10,45,80,904,27),(4506,10,41,59,904,28),(4507,10,40,55,904,70),(4508,10,59,142,904,34),(4509,10,44,72,905,30),(4510,10,38,47,905,71),(4511,10,39,51,905,73),(4512,10,60,148,905,35),(4513,10,9,4,905,35),(4514,10,42,63,905,72),(4515,10,62,160,905,35),(4516,10,61,154,905,63),(4517,10,58,136,905,35),(4518,10,46,96,905,35),(4519,10,45,80,905,28),(4520,10,41,59,905,29),(4521,10,40,55,905,71),(4522,10,59,142,905,35),(4523,10,44,72,906,31),(4524,10,38,47,906,72),(4525,10,39,51,906,74),(4526,10,60,148,906,36),(4527,10,9,4,906,36),(4528,10,42,63,906,73),(4529,10,62,160,906,36),(4530,10,61,154,906,64),(4531,10,58,136,906,36),(4532,10,46,96,906,36),(4533,10,45,80,906,29),(4534,10,41,59,906,30),(4535,10,40,55,906,72),(4536,10,59,142,906,36),(4537,29,56,134,907,18),(4538,29,56,134,908,19),(4539,29,56,134,909,20),(4540,29,56,134,910,21),(4541,20,32,30,911,19),(4542,20,32,30,912,20),(4543,20,32,30,913,21),(4544,20,32,30,914,22),(4545,20,32,30,915,23),(4546,29,56,134,916,22),(4547,29,56,134,917,23),(4548,29,56,134,918,24),(4549,29,56,134,919,25),(4550,29,56,134,920,26),(4551,20,32,30,921,24),(4552,20,32,30,922,25),(4553,20,32,30,923,26),(4554,20,32,30,924,27);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_datetime`
--
DROP TABLE IF EXISTS `eav_entity_datetime`;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes';
--
-- Dumping data for table `eav_entity_datetime`
--
LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_decimal`
--
DROP TABLE IF EXISTS `eav_entity_decimal`;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes';
--
-- Dumping data for table `eav_entity_decimal`
--
LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_int`
--
DROP TABLE IF EXISTS `eav_entity_int`;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes';
--
-- Dumping data for table `eav_entity_int`
--
LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_store`
--
DROP TABLE IF EXISTS `eav_entity_store`;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `increment_prefix` varchar(20) NOT NULL default '',
  `increment_last_id` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`),
  CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_entity_store`
--
LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_text`
--
DROP TABLE IF EXISTS `eav_entity_text`;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes';
--
-- Dumping data for table `eav_entity_text`
--
LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_type`
--
DROP TABLE IF EXISTS `eav_entity_type`;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_type_code` varchar(50) NOT NULL default '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL default '',
  `value_table_prefix` varchar(255) NOT NULL default '',
  `entity_id_field` varchar(255) NOT NULL default '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL default '1',
  `data_sharing_key` varchar(100) default 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_model` varchar(255) NOT NULL default '',
  `increment_per_store` tinyint(1) unsigned NOT NULL default '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL default '8',
  `increment_pad_char` char(1) NOT NULL default '0',
  PRIMARY KEY  (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eav_entity_type`
--
LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','customer/customer','','customer/entity','','',1,'default',1,'eav/entity_increment_numeric',0,8,'0'),(2,'customer_address','customer/customer_address','','customer/address_entity','','',1,'default',2,'',0,8,'0'),(3,'customer_payment','','','customer/entity','','',1,'default',3,'',0,8,'0'),(4,'order','sales/order','','sales/order','','',1,'default',18,'eav/entity_increment_numeric',1,8,'0'),(5,'order_status','','','sales/order','','',1,'default',0,'',0,8,'0'),(6,'order_address','sales/order_address','','sales/order_entity','','',1,'default',20,'',0,8,'0'),(7,'order_item','sales/order_item','','sales/order_entity','','',1,'default',21,'',0,8,'0'),(8,'order_payment','sales/order_payment','','sales/order_entity','','',1,'default',22,'',0,8,'0'),(9,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category','','',0,'default',12,'',0,8,'0'),(10,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product','','',0,'default',9,'',0,8,'0'),(11,'quote','sales/quote','','sales/quote','','',1,'default',23,'',0,8,'0'),(12,'quote_address','sales/quote_address','','sales/quote_address','','',1,'default',24,'',0,8,'0'),(13,'quote_address_rate','sales/quote_address_rate','','sales/quote_entity','','',1,'default',25,'',0,8,'0'),(14,'quote_address_item','sales/quote_address_item','','sales/quote_entity','','',1,'default',26,'',0,8,'0'),(15,'quote_item','sales/quote_item','','sales/quote_item','','',1,'default',27,'',0,8,'0'),(16,'quote_payment','sales/quote_payment','','sales/quote_entity','','',1,'default',28,'',0,8,'0'),(17,'order_status_history','sales/order_status_history','','sales/order_entity','','',1,'default',29,'',0,8,'0'),(18,'invoice','sales/order_invoice','','sales/order_entity','','',1,'default',30,'eav/entity_increment_numeric',1,8,'0'),(20,'invoice_item','sales/order_invoice_item','','sales/order_entity','','',1,'default',32,'',0,8,'0'),(22,'invoice_shipment','','','sales/invoice','','',1,'default',34,'',0,8,'0'),(23,'invoice_comment','sales/order_invoice_comment','','sales/order_entity','','',1,'default',50,'',0,8,'0'),(24,'shipment','sales/order_shipment','','sales/order_entity','','',1,'default',51,'eav/entity_increment_numeric',1,8,'0'),(25,'shipment_item','sales/order_shipment_item','','sales/order_entity','','',1,'default',52,'',0,8,'0'),(26,'shipment_comment','sales/order_shipment_comment','','sales/order_entity','','',1,'default',53,'',0,8,'0'),(27,'shipment_track','sales/order_shipment_track','','sales/order_entity','','',1,'default',54,'',0,8,'0'),(28,'creditmemo','sales/order_creditmemo','','sales/order_entity','','',1,'default',55,'eav/entity_increment_numeric',1,8,'0'),(29,'creditmemo_item','sales/order_creditmemo_item','','sales/order_entity','','',1,'default',56,'',0,8,'0'),(30,'creditmemo_comment','sales/order_creditmemo_comment','','sales/order_entity','','',1,'default',57,'',0,8,'0');
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eav_entity_varchar`
--
DROP TABLE IF EXISTS `eav_entity_varchar`;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes';
--
-- Dumping data for table `eav_entity_varchar`
--
LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `eway_api_debug`
--
DROP TABLE IF EXISTS `eway_api_debug`;
CREATE TABLE `eway_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `eway_api_debug`
--
LOCK TABLES `eway_api_debug` WRITE;
/*!40000 ALTER TABLE `eway_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `eway_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `flo2cash_api_debug`
--
DROP TABLE IF EXISTS `flo2cash_api_debug`;
CREATE TABLE `flo2cash_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  `exception` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `flo2cash_api_debug`
--
LOCK TABLES `flo2cash_api_debug` WRITE;
/*!40000 ALTER TABLE `flo2cash_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `flo2cash_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `gift_message`
--
DROP TABLE IF EXISTS `gift_message`;
CREATE TABLE `gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL auto_increment,
  `customer_id` int(7) unsigned NOT NULL default '0',
  `sender` varchar(255) NOT NULL default '',
  `recipient` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `gift_message`
--
LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `googlebase_attributes`
--
DROP TABLE IF EXISTS `googlebase_attributes`;
CREATE TABLE `googlebase_attributes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`),
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googlebase_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes';
--
-- Dumping data for table `googlebase_attributes`
--
LOCK TABLES `googlebase_attributes` WRITE;
/*!40000 ALTER TABLE `googlebase_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_attributes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `googlebase_items`
--
DROP TABLE IF EXISTS `googlebase_items`;
CREATE TABLE `googlebase_items` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `type_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL default '0000-00-00 00:00:00',
  `expires` datetime NOT NULL default '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL default '0',
  `clicks` smallint(5) unsigned NOT NULL default '0',
  `views` smallint(5) unsigned NOT NULL default '0',
  `is_hidden` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`),
  CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products';
--
-- Dumping data for table `googlebase_items`
--
LOCK TABLES `googlebase_items` WRITE;
/*!40000 ALTER TABLE `googlebase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_items` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `googlebase_types`
--
DROP TABLE IF EXISTS `googlebase_types`;
CREATE TABLE `googlebase_types` (
  `type_id` int(10) unsigned NOT NULL auto_increment,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  PRIMARY KEY  (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets';
--
-- Dumping data for table `googlebase_types`
--
LOCK TABLES `googlebase_types` WRITE;
/*!40000 ALTER TABLE `googlebase_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_types` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `googlecheckout_api_debug`
--
DROP TABLE IF EXISTS `googlecheckout_api_debug`;
CREATE TABLE `googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `dir` enum('in','out') default NULL,
  `url` varchar(255) default NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `googlecheckout_api_debug`
--
LOCK TABLES `googlecheckout_api_debug` WRITE;
/*!40000 ALTER TABLE `googlecheckout_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `googleoptimizer_code`
--
DROP TABLE IF EXISTS `googleoptimizer_code`;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL auto_increment,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL default '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL default '',
  `additional_data` text,
  PRIMARY KEY  (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`),
  CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `googleoptimizer_code`
--
LOCK TABLES `googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `ideal_api_debug`
--
DROP TABLE IF EXISTS `ideal_api_debug`;
CREATE TABLE `ideal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `ideal_api_debug`
--
LOCK TABLES `ideal_api_debug` WRITE;
/*!40000 ALTER TABLE `ideal_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `ideal_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_customer`
--
DROP TABLE IF EXISTS `log_customer`;
CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `visitor_id` bigint(20) unsigned default NULL,
  `customer_id` int(11) NOT NULL default '0',
  `login_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `logout_at` datetime default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customers log information';
--
-- Dumping data for table `log_customer`
--
LOCK TABLES `log_customer` WRITE;
/*!40000 ALTER TABLE `log_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_customer` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_quote`
--
DROP TABLE IF EXISTS `log_quote`;
CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `deleted_at` datetime default NULL,
  PRIMARY KEY  (`quote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quote log data';
--
-- Dumping data for table `log_quote`
--
LOCK TABLES `log_quote` WRITE;
/*!40000 ALTER TABLE `log_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quote` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_summary`
--
DROP TABLE IF EXISTS `log_summary`;
CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned default NULL,
  `visitor_count` int(11) NOT NULL default '0',
  `customer_count` int(11) NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`summary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Summary log information';
--
-- Dumping data for table `log_summary`
--
LOCK TABLES `log_summary` WRITE;
/*!40000 ALTER TABLE `log_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_summary` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_summary_type`
--
DROP TABLE IF EXISTS `log_summary_type`;
CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL auto_increment,
  `type_code` varchar(64) NOT NULL default '',
  `period` smallint(5) unsigned NOT NULL default '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL default 'MINUTE',
  PRIMARY KEY  (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Type of summary information';
--
-- Dumping data for table `log_summary_type`
--
LOCK TABLES `log_summary_type` WRITE;
/*!40000 ALTER TABLE `log_summary_type` DISABLE KEYS */;
INSERT INTO `log_summary_type` VALUES (1,'hour',1,'HOUR'),(2,'day',1,'DAY');
/*!40000 ALTER TABLE `log_summary_type` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_url`
--
DROP TABLE IF EXISTS `log_url`;
CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL default '0',
  `visitor_id` bigint(20) unsigned default NULL,
  `visit_time` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='URL visiting history';
--
-- Dumping data for table `log_url`
--
LOCK TABLES `log_url` WRITE;
/*!40000 ALTER TABLE `log_url` DISABLE KEYS */;
INSERT INTO `log_url` VALUES (1,1,'2008-12-27 20:52:03');
/*!40000 ALTER TABLE `log_url` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_url_info`
--
DROP TABLE IF EXISTS `log_url_info`;
CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL auto_increment,
  `url` varchar(255) NOT NULL default '',
  `referer` varchar(255) default NULL,
  PRIMARY KEY  (`url_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit';
--
-- Dumping data for table `log_url_info`
--
LOCK TABLES `log_url_info` WRITE;
/*!40000 ALTER TABLE `log_url_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_url_info` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_visitor`
--
DROP TABLE IF EXISTS `log_visitor`;
CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL auto_increment,
  `session_id` char(64) NOT NULL default '',
  `first_visit_at` datetime default NULL,
  `last_visit_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='System visitors log';
--
-- Dumping data for table `log_visitor`
--
LOCK TABLES `log_visitor` WRITE;
/*!40000 ALTER TABLE `log_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `log_visitor_info`
--
DROP TABLE IF EXISTS `log_visitor_info`;
CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL default '0',
  `http_referer` varchar(255) default NULL,
  `http_user_agent` varchar(255) default NULL,
  `http_accept_charset` varchar(255) default NULL,
  `http_accept_language` varchar(255) default NULL,
  `server_addr` bigint(20) default NULL,
  `remote_addr` bigint(20) default NULL,
  PRIMARY KEY  (`visitor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';
--
-- Dumping data for table `log_visitor_info`
--
LOCK TABLES `log_visitor_info` WRITE;
/*!40000 ALTER TABLE `log_visitor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor_info` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_problem`
--
DROP TABLE IF EXISTS `newsletter_problem`;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL auto_increment,
  `subscriber_id` int(7) unsigned default NULL,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `problem_error_code` int(3) unsigned default '0',
  `problem_error_text` varchar(200) default NULL,
  PRIMARY KEY  (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems';
--
-- Dumping data for table `newsletter_problem`
--
LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_queue`
--
DROP TABLE IF EXISTS `newsletter_queue`;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL auto_increment,
  `template_id` int(7) unsigned NOT NULL default '0',
  `queue_status` int(3) unsigned NOT NULL default '0',
  `queue_start_at` datetime default NULL,
  `queue_finish_at` datetime default NULL,
  PRIMARY KEY  (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`),
  CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue';
--
-- Dumping data for table `newsletter_queue`
--
LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_queue_link`
--
DROP TABLE IF EXISTS `newsletter_queue_link`;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL auto_increment,
  `queue_id` int(7) unsigned NOT NULL default '0',
  `subscriber_id` int(7) unsigned NOT NULL default '0',
  `letter_sent_at` datetime default NULL,
  PRIMARY KEY  (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link';
--
-- Dumping data for table `newsletter_queue_link`
--
LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_queue_store_link`
--
DROP TABLE IF EXISTS `newsletter_queue_store_link`;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`),
  CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `newsletter_queue_store_link`
--
LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_subscriber`
--
DROP TABLE IF EXISTS `newsletter_subscriber`;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned default '0',
  `change_status_at` datetime default NULL,
  `customer_id` int(11) unsigned NOT NULL default '0',
  `subscriber_email` varchar(150) NOT NULL default '',
  `subscriber_status` int(3) NOT NULL default '0',
  `subscriber_confirm_code` varchar(32) default 'NULL',
  PRIMARY KEY  (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers';
--
-- Dumping data for table `newsletter_subscriber`
--
LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `newsletter_template`
--
DROP TABLE IF EXISTS `newsletter_template`;
CREATE TABLE `newsletter_template` (
  `template_id` int(7) unsigned NOT NULL auto_increment,
  `template_code` varchar(150) default NULL,
  `template_text` text,
  `template_text_preprocessed` text,
  `template_type` int(3) unsigned default NULL,
  `template_subject` varchar(200) default NULL,
  `template_sender_name` varchar(200) default NULL,
  `template_sender_email` varchar(200) default NULL,
  `template_actual` tinyint(1) unsigned default '1',
  `added_at` datetime default NULL,
  `modified_at` datetime default NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates';
--
-- Dumping data for table `newsletter_template`
--
LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_import`
--
DROP TABLE IF EXISTS `oscommerce_import`;
CREATE TABLE `oscommerce_import` (
  `import_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `host` varchar(255) NOT NULL,
  `port` int(5) NOT NULL,
  `db_name` varchar(255) default NULL,
  `db_user` varchar(255) default NULL,
  `db_password` varchar(255) default NULL,
  `db_type` varchar(32) default NULL,
  `table_prefix` varchar(32) default NULL,
  `send_subscription` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_import`
--
LOCK TABLES `oscommerce_import` WRITE;
/*!40000 ALTER TABLE `oscommerce_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_import` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_import_type`
--
DROP TABLE IF EXISTS `oscommerce_import_type`;
CREATE TABLE `oscommerce_import_type` (
  `type_id` int(2) unsigned NOT NULL auto_increment,
  `type_code` varchar(32) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_import_type`
--
LOCK TABLES `oscommerce_import_type` WRITE;
/*!40000 ALTER TABLE `oscommerce_import_type` DISABLE KEYS */;
INSERT INTO `oscommerce_import_type` VALUES (1,'website','Website'),(2,'store','Store'),(3,'category','Category'),(4,'product','Product'),(5,'customer','Customer'),(6,'order','Order'),(7,'group','Store Group'),(8,'taxclass','Product Tax Class'),(9,'root_category','Root Category');
/*!40000 ALTER TABLE `oscommerce_import_type` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_orders`
--
DROP TABLE IF EXISTS `oscommerce_orders`;
CREATE TABLE `oscommerce_orders` (
  `osc_magento_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL default '0',
  `magento_customers_id` int(11) NOT NULL default '0',
  `import_id` int(11) NOT NULL default '0',
  `website_id` int(11) NOT NULL default '0',
  `customers_name` varchar(64) NOT NULL default '',
  `customers_company` varchar(32) default NULL,
  `customers_street_address` varchar(64) NOT NULL default '',
  `customers_suburb` varchar(32) default NULL,
  `customers_city` varchar(32) NOT NULL default '',
  `customers_postcode` varchar(10) NOT NULL default '',
  `customers_state` varchar(32) default NULL,
  `customers_country` varchar(32) NOT NULL default '',
  `customers_telephone` varchar(32) NOT NULL default '',
  `customers_email_address` varchar(96) NOT NULL default '',
  `customers_address_format_id` int(5) NOT NULL default '0',
  `delivery_name` varchar(64) NOT NULL default '',
  `delivery_company` varchar(32) default NULL,
  `delivery_street_address` varchar(64) NOT NULL default '',
  `delivery_suburb` varchar(32) default NULL,
  `delivery_city` varchar(32) NOT NULL default '',
  `delivery_postcode` varchar(10) NOT NULL default '',
  `delivery_state` varchar(32) default NULL,
  `delivery_country` varchar(32) NOT NULL default '',
  `delivery_address_format_id` int(5) NOT NULL default '0',
  `billing_name` varchar(64) NOT NULL default '',
  `billing_company` varchar(32) default NULL,
  `billing_street_address` varchar(64) NOT NULL default '',
  `billing_suburb` varchar(32) default NULL,
  `billing_city` varchar(32) NOT NULL default '',
  `billing_postcode` varchar(10) NOT NULL default '',
  `billing_state` varchar(32) default NULL,
  `billing_country` varchar(32) NOT NULL default '',
  `billing_address_format_id` int(5) NOT NULL default '0',
  `payment_method` varchar(255) NOT NULL default '',
  `cc_type` varchar(20) default NULL,
  `cc_owner` varchar(64) default NULL,
  `cc_number` varchar(32) default NULL,
  `cc_expires` varchar(4) default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` varchar(32) default NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) default NULL,
  `currency_value` decimal(14,6) default NULL,
  `currency_symbol` char(3) default NULL,
  `orders_total` decimal(14,6) default NULL,
  PRIMARY KEY  (`osc_magento_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_orders`
--
LOCK TABLES `oscommerce_orders` WRITE;
/*!40000 ALTER TABLE `oscommerce_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_orders` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_orders_products`
--
DROP TABLE IF EXISTS `oscommerce_orders_products`;
CREATE TABLE `oscommerce_orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `products_id` int(11) NOT NULL default '0',
  `products_model` varchar(12) default NULL,
  `products_name` varchar(64) NOT NULL default '',
  `products_price` decimal(15,4) NOT NULL default '0.0000',
  `final_price` decimal(15,4) NOT NULL default '0.0000',
  `products_tax` decimal(7,4) NOT NULL default '0.0000',
  `products_quantity` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_id`),
  KEY `idx_orders_products_osc_magento_id` (`osc_magento_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_orders_products`
--
LOCK TABLES `oscommerce_orders_products` WRITE;
/*!40000 ALTER TABLE `oscommerce_orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_orders_products` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_orders_status_history`
--
DROP TABLE IF EXISTS `oscommerce_orders_status_history`;
CREATE TABLE `oscommerce_orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `orders_status_id` int(5) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_notified` int(1) default '0',
  `comments` mediumtext,
  `orders_status` varchar(32) default NULL,
  PRIMARY KEY  (`orders_status_history_id`),
  KEY `idx_orders_status_history_osc_magento_id` (`osc_magento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_orders_status_history`
--
LOCK TABLES `oscommerce_orders_status_history` WRITE;
/*!40000 ALTER TABLE `oscommerce_orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_orders_total`
--
DROP TABLE IF EXISTS `oscommerce_orders_total`;
CREATE TABLE `oscommerce_orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `osc_magento_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `text` varchar(255) NOT NULL default '',
  `value` decimal(15,4) NOT NULL default '0.0000',
  `class` varchar(32) NOT NULL default '',
  `sort_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_osc_magento_id` (`osc_magento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_orders_total`
--
LOCK TABLES `oscommerce_orders_total` WRITE;
/*!40000 ALTER TABLE `oscommerce_orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_orders_total` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `oscommerce_ref`
--
DROP TABLE IF EXISTS `oscommerce_ref`;
CREATE TABLE `oscommerce_ref` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `import_id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `value` int(10) NOT NULL,
  `ref_id` int(10) NOT NULL,
  `created_at` datetime default NULL,
  `user_id` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `oscommerce_ref`
--
LOCK TABLES `oscommerce_ref` WRITE;
/*!40000 ALTER TABLE `oscommerce_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscommerce_ref` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `paybox_api_debug`
--
DROP TABLE IF EXISTS `paybox_api_debug`;
CREATE TABLE `paybox_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `real_order_id` varchar(50) NOT NULL default '',
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `paybox_api_debug`
--
LOCK TABLES `paybox_api_debug` WRITE;
/*!40000 ALTER TABLE `paybox_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paybox_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `paybox_question_number`
--
DROP TABLE IF EXISTS `paybox_question_number`;
CREATE TABLE `paybox_question_number` (
  `account_id` int(10) unsigned NOT NULL auto_increment,
  `account_hash` varchar(50) NOT NULL default '',
  `increment_value` int(10) unsigned NOT NULL default '1',
  `reset_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `paybox_question_number`
--
LOCK TABLES `paybox_question_number` WRITE;
/*!40000 ALTER TABLE `paybox_question_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `paybox_question_number` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `paygate_authorizenet_debug`
--
DROP TABLE IF EXISTS `paygate_authorizenet_debug`;
CREATE TABLE `paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY  (`debug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `paygate_authorizenet_debug`
--
LOCK TABLES `paygate_authorizenet_debug` WRITE;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `paypal_api_debug`
--
DROP TABLE IF EXISTS `paypal_api_debug`;
CREATE TABLE `paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `paypal_api_debug`
--
LOCK TABLES `paypal_api_debug` WRITE;
/*!40000 ALTER TABLE `paypal_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `paypaluk_api_debug`
--
DROP TABLE IF EXISTS `paypaluk_api_debug`;
CREATE TABLE `paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `paypaluk_api_debug`
--
LOCK TABLES `paypaluk_api_debug` WRITE;
/*!40000 ALTER TABLE `paypaluk_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypaluk_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `poll`
--
DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL auto_increment,
  `poll_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `date_posted` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_closed` datetime default NULL,
  `active` smallint(6) NOT NULL default '1',
  `closed` tinyint(1) NOT NULL default '0',
  `answers_display` smallint(6) default NULL,
  PRIMARY KEY  (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `poll`
--
LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES (1,'What is your favorite color',7,1,'2007-06-15 19:17:49','2007-08-31 07:41:32',1,1,NULL),(2,'What is your favorite Magento feature?',4708,0,'2007-08-31 07:41:20',NULL,1,0,NULL);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `poll_answer`
--
DROP TABLE IF EXISTS `poll_answer`;
CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `answer_title` varchar(255) NOT NULL default '',
  `votes_count` int(10) unsigned NOT NULL default '0',
  `answer_order` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`),
  CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `poll_answer`
--
LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` VALUES (1,1,'Green',0,0),(2,1,'Red',0,0),(3,1,'Black',2,0),(4,1,'Magenta',5,0),(5,2,'Layered Navigation',1889,0),(6,2,'Price Rules',1340,0),(7,2,'Category Management',724,0),(8,2,'Compare Products',762,0);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `poll_store`
--
DROP TABLE IF EXISTS `poll_store`;
CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `poll_store`
--
LOCK TABLES `poll_store` WRITE;
/*!40000 ALTER TABLE `poll_store` DISABLE KEYS */;
INSERT INTO `poll_store` VALUES (2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `poll_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `poll_vote`
--
DROP TABLE IF EXISTS `poll_vote`;
CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL auto_increment,
  `poll_id` int(10) unsigned NOT NULL default '0',
  `poll_answer_id` int(10) unsigned NOT NULL default '0',
  `ip_address` bigint(20) default NULL,
  `customer_id` int(11) default NULL,
  `vote_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`),
  CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `poll_vote`
--
LOCK TABLES `poll_vote` WRITE;
/*!40000 ALTER TABLE `poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_vote` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `product_alert_price`
--
DROP TABLE IF EXISTS `product_alert_price`;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `product_alert_price`
--
LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `product_alert_stock`
--
DROP TABLE IF EXISTS `product_alert_stock`;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `add_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `send_date` datetime default NULL,
  `send_count` smallint(5) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Dumping data for table `product_alert_stock`
--
LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `protx_api_debug`
--
DROP TABLE IF EXISTS `protx_api_debug`;
CREATE TABLE `protx_api_debug` (
  `debug_id` int(10) unsigned NOT NULL auto_increment,
  `transaction_id` varchar(255) NOT NULL default '',
  `debug_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY  (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `protx_api_debug`
--
LOCK TABLES `protx_api_debug` WRITE;
/*!40000 ALTER TABLE `protx_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `protx_api_debug` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating`
--
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rating_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_id` smallint(6) unsigned NOT NULL default '0',
  `rating_code` varchar(64) NOT NULL default '',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`),
  CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ratings';
--
-- Dumping data for table `rating`
--
LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,'Quality',0),(2,1,'Value',0),(3,1,'Price',0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_entity`
--
DROP TABLE IF EXISTS `rating_entity`;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL auto_increment,
  `entity_code` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
--
-- Dumping data for table `rating_entity`
--
LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_option`
--
DROP TABLE IF EXISTS `rating_option`;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `code` varchar(32) NOT NULL default '',
  `value` tinyint(3) unsigned NOT NULL default '0',
  `position` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`),
  CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
--
-- Dumping data for table `rating_option`
--
LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_option_vote`
--
DROP TABLE IF EXISTS `rating_option_vote`;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL auto_increment,
  `option_id` int(10) unsigned NOT NULL default '0',
  `remote_ip` varchar(16) NOT NULL default '',
  `remote_ip_long` int(11) NOT NULL default '0',
  `customer_id` int(11) unsigned default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `review_id` bigint(20) unsigned default NULL,
  `percent` tinyint(3) NOT NULL default '0',
  `value` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COMMENT='Rating option values';
--
-- Dumping data for table `rating_option_vote`
--
LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
INSERT INTO `rating_option_vote` VALUES (1,4,'127.0.0.1',2130706433,NULL,51,1,47,80,0),(2,4,'127.0.0.1',2130706433,1,16,1,15,80,0),(3,4,'127.0.0.1',2130706433,1,17,1,11,80,0),(4,3,'127.0.0.1',2130706433,NULL,18,1,7,60,0),(5,3,'127.0.0.1',2130706433,NULL,18,1,8,60,0),(6,3,'127.0.0.1',2130706433,NULL,18,1,9,60,0),(7,3,'127.0.0.1',2130706433,1,19,1,2,60,0),(8,3,'127.0.0.1',2130706433,NULL,19,1,10,60,0),(9,3,'127.0.0.1',2130706433,1,20,1,5,60,0),(10,4,'127.0.0.1',2130706433,1,20,1,12,80,0),(11,4,'127.0.0.1',2130706433,1,20,1,13,80,0),(12,3,'127.0.0.1',2130706433,1,20,1,14,60,0),(13,5,'127.0.0.1',2130706433,1,25,1,16,100,0),(14,3,'127.0.0.1',2130706433,1,26,1,17,60,0),(15,3,'127.0.0.1',2130706433,1,26,1,18,60,0),(16,3,'127.0.0.1',2130706433,1,27,1,19,60,0),(17,3,'127.0.0.1',2130706433,1,27,1,20,60,0),(18,4,'127.0.0.1',2130706433,1,28,1,21,80,0),(19,3,'127.0.0.1',2130706433,1,29,1,28,60,0),(20,2,'127.0.0.1',2130706433,1,29,1,29,40,0),(21,3,'127.0.0.1',2130706433,NULL,30,1,6,60,0),(22,3,'127.0.0.1',2130706433,1,31,1,30,60,0),(23,3,'127.0.0.1',2130706433,1,31,1,31,60,0),(24,3,'127.0.0.1',2130706433,1,32,1,32,60,0),(25,3,'127.0.0.1',2130706433,1,33,1,33,60,0),(26,3,'127.0.0.1',2130706433,1,33,1,34,60,0),(27,3,'127.0.0.1',2130706433,1,33,1,35,60,0),(28,3,'127.0.0.1',2130706433,1,34,1,36,60,0),(29,4,'127.0.0.1',2130706433,1,34,1,37,80,0),(30,3,'127.0.0.1',2130706433,1,35,1,1,60,0),(31,3,'127.0.0.1',2130706433,1,35,1,4,60,0),(32,5,'127.0.0.1',2130706433,1,35,1,22,100,0),(33,3,'127.0.0.1',2130706433,1,36,1,3,60,0),(34,4,'127.0.0.1',2130706433,1,36,1,23,80,0),(35,4,'127.0.0.1',2130706433,1,37,1,24,80,0),(36,3,'127.0.0.1',2130706433,1,37,1,25,60,0),(37,3,'127.0.0.1',2130706433,1,37,1,26,60,0),(38,5,'127.0.0.1',2130706433,1,38,1,27,100,0),(39,5,'127.0.0.1',2130706433,1,39,1,38,100,0),(40,3,'127.0.0.1',2130706433,1,41,1,39,60,0),(41,4,'127.0.0.1',2130706433,1,41,1,40,80,0),(42,4,'127.0.0.1',2130706433,1,42,1,41,80,0),(43,5,'127.0.0.1',2130706433,1,42,1,42,100,0),(44,4,'127.0.0.1',2130706433,NULL,44,1,43,80,0),(45,5,'127.0.0.1',2130706433,NULL,44,1,44,100,0),(46,3,'127.0.0.1',2130706433,NULL,49,1,45,60,0),(47,5,'127.0.0.1',2130706433,NULL,49,1,46,100,0),(48,4,'127.0.0.1',2130706433,NULL,51,1,47,80,0),(49,4,'127.0.0.1',2130706433,1,16,2,15,80,0),(50,4,'127.0.0.1',2130706433,1,17,2,11,80,0),(51,3,'127.0.0.1',2130706433,NULL,18,2,7,60,0),(52,3,'127.0.0.1',2130706433,NULL,18,2,8,60,0),(53,4,'127.0.0.1',2130706433,NULL,18,2,9,80,0),(54,4,'127.0.0.1',2130706433,1,19,2,2,80,0),(55,3,'127.0.0.1',2130706433,NULL,19,2,10,60,0),(56,3,'127.0.0.1',2130706433,1,20,2,5,60,0),(57,4,'127.0.0.1',2130706433,1,20,2,12,80,0),(58,4,'127.0.0.1',2130706433,1,20,2,13,80,0),(59,3,'127.0.0.1',2130706433,1,20,2,14,60,0),(60,5,'127.0.0.1',2130706433,1,25,2,16,100,0),(61,3,'127.0.0.1',2130706433,1,26,2,17,60,0),(62,3,'127.0.0.1',2130706433,1,26,2,18,60,0),(63,3,'127.0.0.1',2130706433,1,27,2,19,60,0),(64,3,'127.0.0.1',2130706433,1,27,2,20,60,0),(65,4,'127.0.0.1',2130706433,1,28,2,21,80,0),(66,3,'127.0.0.1',2130706433,1,29,2,28,60,0),(67,4,'127.0.0.1',2130706433,1,29,2,29,80,0),(68,3,'127.0.0.1',2130706433,NULL,30,2,6,60,0),(69,3,'127.0.0.1',2130706433,1,31,2,30,60,0),(70,4,'127.0.0.1',2130706433,1,31,2,31,80,0),(71,3,'127.0.0.1',2130706433,1,32,2,32,60,0),(72,3,'127.0.0.1',2130706433,1,33,2,33,60,0),(73,3,'127.0.0.1',2130706433,1,33,2,34,60,0),(74,4,'127.0.0.1',2130706433,1,33,2,35,80,0),(75,3,'127.0.0.1',2130706433,1,34,2,36,60,0),(76,3,'127.0.0.1',2130706433,1,34,2,37,60,0),(77,3,'127.0.0.1',2130706433,1,35,2,1,60,0),(78,3,'127.0.0.1',2130706433,1,35,2,4,60,0),(79,4,'127.0.0.1',2130706433,1,35,2,22,80,0),(80,3,'127.0.0.1',2130706433,1,36,2,3,60,0),(81,4,'127.0.0.1',2130706433,1,36,2,23,80,0),(82,2,'127.0.0.1',2130706433,1,37,2,24,40,0),(83,3,'127.0.0.1',2130706433,1,37,2,25,60,0),(84,3,'127.0.0.1',2130706433,1,37,2,26,60,0),(85,2,'127.0.0.1',2130706433,1,38,2,27,40,0),(86,4,'127.0.0.1',2130706433,1,39,2,38,80,0),(87,3,'127.0.0.1',2130706433,1,41,2,39,60,0),(88,4,'127.0.0.1',2130706433,1,41,2,40,80,0),(89,3,'127.0.0.1',2130706433,1,42,2,41,60,0),(90,4,'127.0.0.1',2130706433,1,42,2,42,80,0),(91,3,'127.0.0.1',2130706433,NULL,44,2,43,60,0),(92,5,'127.0.0.1',2130706433,NULL,44,2,44,100,0),(93,3,'127.0.0.1',2130706433,NULL,49,2,45,60,0),(94,5,'127.0.0.1',2130706433,NULL,49,2,46,100,0),(95,4,'127.0.0.1',2130706433,NULL,51,2,47,80,0),(96,3,'127.0.0.1',2130706433,1,16,3,15,60,0),(97,3,'127.0.0.1',2130706433,1,17,3,11,60,0),(98,3,'127.0.0.1',2130706433,NULL,18,3,7,60,0),(99,3,'127.0.0.1',2130706433,NULL,18,3,8,60,0),(100,3,'127.0.0.1',2130706433,NULL,18,3,9,60,0),(101,3,'127.0.0.1',2130706433,1,19,3,2,60,0),(102,3,'127.0.0.1',2130706433,NULL,19,3,10,60,0),(103,3,'127.0.0.1',2130706433,1,20,3,5,60,0),(104,3,'127.0.0.1',2130706433,1,20,3,12,60,0),(105,3,'127.0.0.1',2130706433,1,20,3,13,60,0),(106,3,'127.0.0.1',2130706433,1,20,3,14,60,0),(107,3,'127.0.0.1',2130706433,1,25,3,16,60,0),(108,3,'127.0.0.1',2130706433,1,26,3,17,60,0),(109,3,'127.0.0.1',2130706433,1,26,3,18,60,0),(110,3,'127.0.0.1',2130706433,1,27,3,19,60,0),(111,3,'127.0.0.1',2130706433,1,27,3,20,60,0),(112,4,'127.0.0.1',2130706433,1,28,3,21,80,0),(113,3,'127.0.0.1',2130706433,1,29,3,28,60,0),(114,3,'127.0.0.1',2130706433,1,29,3,29,60,0),(115,3,'127.0.0.1',2130706433,NULL,30,3,6,60,0),(116,3,'127.0.0.1',2130706433,1,31,3,30,60,0),(117,4,'127.0.0.1',2130706433,1,31,3,31,80,0),(118,3,'127.0.0.1',2130706433,1,32,3,32,60,0),(119,3,'127.0.0.1',2130706433,1,33,3,33,60,0),(120,3,'127.0.0.1',2130706433,1,33,3,34,60,0),(121,3,'127.0.0.1',2130706433,1,33,3,35,60,0),(122,3,'127.0.0.1',2130706433,1,34,3,36,60,0),(123,3,'127.0.0.1',2130706433,1,34,3,37,60,0),(124,3,'127.0.0.1',2130706433,1,35,3,1,60,0),(125,3,'127.0.0.1',2130706433,1,35,3,4,60,0),(126,3,'127.0.0.1',2130706433,1,35,3,22,60,0),(127,3,'127.0.0.1',2130706433,1,36,3,3,60,0),(128,3,'127.0.0.1',2130706433,1,36,3,23,60,0),(129,3,'127.0.0.1',2130706433,1,37,3,24,60,0),(130,3,'127.0.0.1',2130706433,1,37,3,25,60,0),(131,3,'127.0.0.1',2130706433,1,37,3,26,60,0),(132,3,'127.0.0.1',2130706433,1,38,3,27,60,0),(133,3,'127.0.0.1',2130706433,1,39,3,38,60,0),(134,3,'127.0.0.1',2130706433,1,41,3,39,60,0),(135,3,'127.0.0.1',2130706433,1,41,3,40,60,0),(136,5,'127.0.0.1',2130706433,1,42,3,41,100,0),(137,3,'127.0.0.1',2130706433,1,42,3,42,60,0),(138,3,'127.0.0.1',2130706433,NULL,44,3,43,60,0),(139,5,'127.0.0.1',2130706433,NULL,44,3,44,100,0),(140,3,'127.0.0.1',2130706433,NULL,49,3,45,60,0),(141,5,'127.0.0.1',2130706433,NULL,49,3,46,100,0),(142,4,'127.0.0.1',2130706433,NULL,51,3,47,80,0),(143,5,'127.0.0.1',2130706433,NULL,25,1,48,100,0),(144,10,'127.0.0.1',2130706433,NULL,25,2,48,100,0),(145,14,'127.0.0.1',2130706433,NULL,25,3,48,80,0),(146,2,'127.0.0.1',2130706433,NULL,48,1,49,40,0),(147,9,'127.0.0.1',2130706433,NULL,48,2,49,80,0),(148,13,'127.0.0.1',2130706433,NULL,48,3,49,60,0),(149,5,'127.0.0.1',2130706433,NULL,47,1,50,100,0),(150,10,'127.0.0.1',2130706433,NULL,47,2,50,100,0),(151,14,'127.0.0.1',2130706433,NULL,47,3,50,80,0),(152,4,'127.0.0.1',2130706433,NULL,46,1,51,80,0),(153,10,'127.0.0.1',2130706433,NULL,46,2,51,100,0),(154,13,'127.0.0.1',2130706433,NULL,46,3,51,60,0),(155,4,'127.0.0.1',2130706433,NULL,53,1,52,80,0),(156,9,'127.0.0.1',2130706433,NULL,53,2,52,80,0),(157,13,'127.0.0.1',2130706433,NULL,53,3,52,60,0),(158,4,'127.0.0.1',2130706433,NULL,119,1,53,80,0),(159,8,'127.0.0.1',2130706433,NULL,119,2,53,60,0),(160,14,'127.0.0.1',2130706433,NULL,119,3,53,80,0),(161,4,'127.0.0.1',2130706433,NULL,120,1,54,80,0),(162,9,'127.0.0.1',2130706433,NULL,120,2,54,80,0),(163,14,'127.0.0.1',2130706433,NULL,120,3,54,80,0),(164,5,'127.0.0.1',2130706433,1,126,1,55,100,0),(165,10,'127.0.0.1',2130706433,1,126,2,55,100,0),(166,15,'127.0.0.1',2130706433,1,126,3,55,100,0),(167,4,'127.0.0.1',2130706433,1,83,1,56,80,0),(168,10,'127.0.0.1',2130706433,1,83,2,56,100,0),(169,13,'127.0.0.1',2130706433,1,83,3,56,60,0),(170,3,'127.0.0.1',2130706433,1,112,1,57,60,0),(171,9,'127.0.0.1',2130706433,1,112,2,57,80,0),(172,13,'127.0.0.1',2130706433,1,112,3,57,60,0),(173,4,'127.0.0.1',2130706433,1,98,1,58,80,0),(174,8,'127.0.0.1',2130706433,1,98,2,58,60,0),(175,13,'127.0.0.1',2130706433,1,98,3,58,60,0),(176,4,'127.0.0.1',2130706433,1,103,1,59,80,0),(177,9,'127.0.0.1',2130706433,1,103,2,59,80,0),(178,14,'127.0.0.1',2130706433,1,103,3,59,80,0),(179,3,'127.0.0.1',2130706433,1,111,1,60,60,0),(180,9,'127.0.0.1',2130706433,1,111,2,60,80,0),(181,15,'127.0.0.1',2130706433,1,111,3,60,100,0),(182,4,'127.0.0.1',2130706433,1,27,1,61,80,0),(183,9,'127.0.0.1',2130706433,1,27,2,61,80,0),(184,13,'127.0.0.1',2130706433,1,27,3,61,60,0),(185,5,'127.0.0.1',2130706433,1,26,1,62,100,0),(186,10,'127.0.0.1',2130706433,1,26,2,62,100,0),(187,15,'127.0.0.1',2130706433,1,26,3,62,100,0),(188,5,'127.0.0.1',2130706433,NULL,32,1,63,100,0),(189,9,'127.0.0.1',2130706433,NULL,32,2,63,80,0),(190,15,'127.0.0.1',2130706433,NULL,32,3,63,100,0),(191,3,'127.0.0.1',2130706433,NULL,98,1,64,60,0),(192,9,'127.0.0.1',2130706433,NULL,98,2,64,80,0),(193,13,'127.0.0.1',2130706433,NULL,98,3,64,60,0),(194,5,'127.0.0.1',2130706433,1,27,1,65,100,0),(195,8,'127.0.0.1',2130706433,1,27,2,65,60,0),(196,12,'127.0.0.1',2130706433,1,27,3,65,40,0),(197,4,'127.0.0.1',2130706433,NULL,27,1,66,80,0),(198,8,'127.0.0.1',2130706433,NULL,27,2,66,60,0),(199,13,'127.0.0.1',2130706433,NULL,27,3,66,60,0),(200,4,'127.0.0.1',2130706433,NULL,32,1,67,80,0),(201,9,'127.0.0.1',2130706433,NULL,32,2,67,80,0),(202,15,'127.0.0.1',2130706433,NULL,32,3,67,100,0),(203,5,'127.0.0.1',2130706433,NULL,41,1,68,100,0),(204,8,'127.0.0.1',2130706433,NULL,41,2,68,60,0),(205,11,'127.0.0.1',2130706433,NULL,41,3,68,20,0),(206,4,'127.0.0.1',2130706433,NULL,39,1,69,80,0),(207,7,'127.0.0.1',2130706433,NULL,39,2,69,40,0),(208,14,'127.0.0.1',2130706433,NULL,39,3,69,80,0),(209,5,'127.0.0.1',2130706433,1,54,1,70,100,0),(210,9,'127.0.0.1',2130706433,1,54,2,70,80,0),(211,14,'127.0.0.1',2130706433,1,54,3,70,80,0),(212,5,'127.0.0.1',2130706433,NULL,51,1,71,100,0),(213,10,'127.0.0.1',2130706433,NULL,51,2,71,100,0),(214,15,'127.0.0.1',2130706433,NULL,51,3,71,100,0),(215,4,'127.0.0.1',2130706433,NULL,35,1,72,80,0),(216,9,'127.0.0.1',2130706433,NULL,35,2,72,80,0),(217,15,'127.0.0.1',2130706433,NULL,35,3,72,100,0),(218,5,'127.0.0.1',2130706433,NULL,135,1,73,100,0),(219,10,'127.0.0.1',2130706433,NULL,135,2,73,100,0),(220,15,'127.0.0.1',2130706433,NULL,135,3,73,100,0),(221,5,'127.0.0.1',2130706433,NULL,119,1,74,100,0),(222,9,'127.0.0.1',2130706433,NULL,119,2,74,80,0),(223,14,'127.0.0.1',2130706433,NULL,119,3,74,80,0),(224,1,'127.0.0.1',2130706433,NULL,135,1,75,20,0),(225,6,'127.0.0.1',2130706433,NULL,135,2,75,20,0),(226,11,'127.0.0.1',2130706433,NULL,135,3,75,20,0),(227,5,'127.0.0.1',2130706433,NULL,27,1,76,100,0),(228,9,'127.0.0.1',2130706433,NULL,27,2,76,80,0),(229,13,'127.0.0.1',2130706433,NULL,27,3,76,60,0),(230,5,'127.0.0.1',2130706433,NULL,27,1,77,100,5),(231,14,'127.0.0.1',2130706433,NULL,27,3,77,80,4),(232,10,'127.0.0.1',2130706433,NULL,27,2,77,100,5),(233,5,'127.0.0.1',2130706433,1,135,1,78,100,5),(234,15,'127.0.0.1',2130706433,1,135,3,78,100,5),(235,10,'127.0.0.1',2130706433,1,135,2,78,100,5),(236,5,'127.0.0.1',2130706433,NULL,32,1,79,100,5),(237,15,'127.0.0.1',2130706433,NULL,32,3,79,100,5),(238,10,'127.0.0.1',2130706433,NULL,32,2,79,100,5),(239,4,'127.0.0.1',2130706433,NULL,112,1,80,80,4),(240,13,'127.0.0.1',2130706433,NULL,112,3,80,60,3),(241,10,'127.0.0.1',2130706433,NULL,112,2,80,100,5),(242,4,'127.0.0.1',2130706433,NULL,103,1,81,80,4),(243,15,'127.0.0.1',2130706433,NULL,103,3,81,100,5),(244,9,'127.0.0.1',2130706433,NULL,103,2,81,80,4),(245,5,'127.0.0.1',2130706433,NULL,35,1,82,100,5),(246,13,'127.0.0.1',2130706433,NULL,35,3,82,60,3),(247,10,'127.0.0.1',2130706433,NULL,35,2,82,100,5),(248,4,'127.0.0.1',2130706433,NULL,27,1,84,80,4),(249,13,'127.0.0.1',2130706433,NULL,27,3,84,60,3),(250,8,'127.0.0.1',2130706433,NULL,27,2,84,60,3),(251,3,'127.0.0.1',2130706433,NULL,135,1,85,60,3),(252,11,'127.0.0.1',2130706433,NULL,135,3,85,20,1),(253,6,'127.0.0.1',2130706433,NULL,135,2,85,20,1),(254,4,'127.0.0.1',2130706433,1,27,1,86,80,4),(255,14,'127.0.0.1',2130706433,1,27,3,86,80,4),(256,9,'127.0.0.1',2130706433,1,27,2,86,80,4),(257,5,'127.0.0.1',2130706433,NULL,27,1,87,100,5),(258,15,'127.0.0.1',2130706433,NULL,27,3,87,100,5),(259,10,'127.0.0.1',2130706433,NULL,27,2,87,100,5),(260,4,'127.0.0.1',2130706433,NULL,44,1,88,80,4),(261,12,'127.0.0.1',2130706433,NULL,44,3,88,40,2),(262,8,'127.0.0.1',2130706433,NULL,44,2,88,60,3),(263,2,'127.0.0.1',2130706433,NULL,28,1,89,40,2),(264,13,'127.0.0.1',2130706433,NULL,28,3,89,60,3),(265,9,'127.0.0.1',2130706433,NULL,28,2,89,80,4),(266,1,'127.0.0.1',2130706433,NULL,16,1,90,20,1),(267,11,'127.0.0.1',2130706433,NULL,16,3,90,20,1),(268,6,'127.0.0.1',2130706433,NULL,16,2,90,20,1),(269,5,'127.0.0.1',2130706433,1,20,1,91,100,5),(270,14,'127.0.0.1',2130706433,1,20,3,91,80,4),(271,9,'127.0.0.1',2130706433,1,20,2,91,80,4),(272,2,'127.0.0.1',2130706433,NULL,126,1,92,40,2),(273,11,'127.0.0.1',2130706433,NULL,126,3,92,20,1),(274,8,'127.0.0.1',2130706433,NULL,126,2,92,60,3),(275,1,'127.0.0.1',2130706433,NULL,103,1,93,20,1),(276,11,'127.0.0.1',2130706433,NULL,103,3,93,20,1),(277,6,'127.0.0.1',2130706433,NULL,103,2,93,20,1),(278,5,'127.0.0.1',2130706433,NULL,19,1,94,100,5),(279,14,'127.0.0.1',2130706433,NULL,19,3,94,80,4),(280,9,'127.0.0.1',2130706433,NULL,19,2,94,80,4),(281,5,'127.0.0.1',2130706433,NULL,27,1,95,100,5),(282,14,'127.0.0.1',2130706433,NULL,27,3,95,80,4),(283,9,'127.0.0.1',2130706433,NULL,27,2,95,80,4),(284,5,'127.0.0.1',2130706433,NULL,52,1,96,100,5),(285,15,'127.0.0.1',2130706433,NULL,52,3,96,100,5),(286,10,'127.0.0.1',2130706433,NULL,52,2,96,100,5),(287,2,'127.0.0.1',2130706433,NULL,83,1,98,40,2),(288,13,'127.0.0.1',2130706433,NULL,83,3,98,60,3),(289,7,'127.0.0.1',2130706433,NULL,83,2,98,40,2),(290,5,'127.0.0.1',2130706433,NULL,25,1,99,100,5),(291,13,'127.0.0.1',2130706433,NULL,25,3,99,60,3),(292,9,'127.0.0.1',2130706433,NULL,25,2,99,80,4),(293,1,'127.0.0.1',2130706433,1,51,1,100,20,1),(294,11,'127.0.0.1',2130706433,1,51,3,100,20,1),(295,6,'127.0.0.1',2130706433,1,51,2,100,20,1),(296,5,'127.0.0.1',2130706433,NULL,44,1,101,100,5),(297,14,'127.0.0.1',2130706433,NULL,44,3,101,80,4),(298,8,'127.0.0.1',2130706433,NULL,44,2,101,60,3),(299,4,'127.0.0.1',2130706433,NULL,132,1,102,80,4),(300,13,'127.0.0.1',2130706433,NULL,132,3,102,60,3),(301,9,'127.0.0.1',2130706433,NULL,132,2,102,80,4),(302,3,'127.0.0.1',2130706433,NULL,16,1,103,60,3),(303,13,'127.0.0.1',2130706433,NULL,16,3,103,60,3),(304,8,'127.0.0.1',2130706433,NULL,16,2,103,60,3),(305,2,'127.0.0.1',2130706433,NULL,18,1,104,40,2),(306,13,'127.0.0.1',2130706433,NULL,18,3,104,60,3),(307,8,'127.0.0.1',2130706433,NULL,18,2,104,60,3),(308,3,'127.0.0.1',2130706433,1,51,1,105,60,3),(309,14,'127.0.0.1',2130706433,1,51,3,105,80,4),(310,9,'127.0.0.1',2130706433,1,51,2,105,80,4),(311,3,'127.0.0.1',2130706433,NULL,27,1,106,60,3),(312,14,'127.0.0.1',2130706433,NULL,27,3,106,80,4),(313,10,'127.0.0.1',2130706433,NULL,27,2,106,100,5),(314,5,'127.0.0.1',2130706433,NULL,132,1,107,100,5),(315,13,'127.0.0.1',2130706433,NULL,132,3,107,60,3),(316,9,'127.0.0.1',2130706433,NULL,132,2,107,80,4),(317,5,'127.0.0.1',2130706433,NULL,26,1,108,100,5),(318,11,'127.0.0.1',2130706433,NULL,26,3,108,20,1),(319,8,'127.0.0.1',2130706433,NULL,26,2,108,60,3),(320,1,'127.0.0.1',2130706433,NULL,26,1,110,20,1),(321,12,'127.0.0.1',2130706433,NULL,26,3,110,40,2),(322,6,'127.0.0.1',2130706433,NULL,26,2,110,20,1),(323,3,'127.0.0.1',2130706433,NULL,45,1,111,60,3),(324,14,'127.0.0.1',2130706433,NULL,45,3,111,80,4),(325,8,'127.0.0.1',2130706433,NULL,45,2,111,60,3),(326,3,'127.0.0.1',2130706433,NULL,83,1,112,60,3),(327,13,'127.0.0.1',2130706433,NULL,83,3,112,60,3),(328,8,'127.0.0.1',2130706433,NULL,83,2,112,60,3),(329,3,'127.0.0.1',2130706433,NULL,26,1,113,60,3),(330,14,'127.0.0.1',2130706433,NULL,26,3,113,80,4),(331,10,'127.0.0.1',2130706433,NULL,26,2,113,100,5);
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_option_vote_aggregated`
--
DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL auto_increment,
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL default '0',
  `vote_count` int(10) unsigned NOT NULL default '0',
  `vote_value_sum` int(10) unsigned NOT NULL default '0',
  `percent` tinyint(3) NOT NULL default '0',
  `percent_approved` tinyint(3) default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `rating_option_vote_aggregated`
--
LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
INSERT INTO `rating_option_vote_aggregated` VALUES (1,1,51,2,4,40,40,0),(2,1,51,5,4,16,16,1),(3,1,16,2,4,40,40,0),(4,1,16,3,4,27,27,1),(5,1,17,1,0,0,0,1),(6,1,18,1,2,40,40,0),(7,1,18,3,0,0,0,1),(8,1,18,1,2,40,40,2),(9,1,19,1,5,100,100,0),(10,1,19,3,5,33,33,1),(11,1,20,1,5,100,100,0),(12,1,20,5,5,20,20,1),(13,1,25,1,5,100,100,0),(14,1,25,3,5,33,33,1),(15,1,26,3,9,60,60,0),(16,1,26,6,9,30,30,1),(17,1,27,6,26,87,87,0),(18,1,27,10,16,32,32,1),(19,1,27,1,5,100,100,2),(20,1,27,1,5,100,100,3),(21,1,28,1,2,40,40,0),(22,1,28,2,2,20,20,1),(23,1,29,2,0,0,0,1),(24,1,30,1,0,0,0,1),(25,1,31,2,0,0,0,1),(26,1,32,1,5,100,100,0),(27,1,32,4,5,25,25,1),(28,1,33,3,0,0,0,1),(29,1,34,2,0,0,0,1),(30,1,35,1,5,100,100,0),(31,1,35,5,5,20,20,1),(32,1,36,2,0,0,0,1),(33,1,37,3,0,0,0,1),(34,1,38,1,0,0,0,1),(35,1,39,2,0,0,0,1),(36,1,41,3,0,0,0,1),(37,1,42,2,0,0,0,1),(38,1,44,2,9,90,90,0),(39,1,44,4,9,45,45,1),(40,1,49,2,0,0,0,1),(41,2,16,2,4,40,40,0),(42,2,16,3,4,27,27,1),(43,2,17,1,0,0,0,1),(44,2,18,1,3,60,60,0),(45,2,18,3,0,0,0,1),(46,2,18,1,3,60,60,2),(47,2,19,1,4,80,80,0),(48,2,19,3,4,27,27,1),(49,2,20,1,4,80,80,0),(50,2,20,5,4,16,16,1),(51,2,25,1,4,80,80,0),(52,2,25,3,4,27,27,1),(53,2,26,3,9,60,60,0),(54,2,26,6,9,30,30,1),(55,2,27,6,26,87,87,0),(56,2,27,10,17,34,34,1),(57,2,27,1,5,100,100,2),(58,2,27,1,4,80,80,3),(59,2,28,1,4,80,80,0),(60,2,28,2,4,40,40,1),(61,2,29,2,0,0,0,1),(62,2,30,1,0,0,0,1),(63,2,31,2,0,0,0,1),(64,2,32,1,5,100,100,0),(65,2,32,4,5,25,25,1),(66,2,33,3,0,0,0,1),(67,2,34,2,0,0,0,1),(68,2,35,1,5,100,100,0),(69,2,35,5,5,20,20,1),(70,2,36,2,0,0,0,1),(71,2,37,3,0,0,0,1),(72,2,38,1,0,0,0,1),(73,2,39,2,0,0,0,1),(74,2,41,3,0,0,0,1),(75,2,42,2,0,0,0,1),(76,2,44,2,6,60,60,0),(77,2,44,4,6,30,30,1),(78,2,49,2,0,0,0,1),(79,2,51,2,5,50,50,0),(80,2,51,4,5,25,25,1),(81,3,16,2,4,40,40,0),(82,3,16,3,4,27,27,1),(83,3,17,1,0,0,0,1),(84,3,18,1,3,60,60,0),(85,3,18,3,0,0,0,1),(86,3,18,1,3,60,60,2),(87,3,19,1,4,80,80,0),(88,3,19,3,4,27,27,1),(89,3,20,1,4,80,80,0),(90,3,20,5,4,16,16,1),(91,3,25,1,3,60,60,0),(92,3,25,3,3,20,20,1),(93,3,26,3,7,47,47,0),(94,3,26,6,7,23,23,1),(95,3,27,6,24,80,80,0),(96,3,27,10,15,30,30,1),(97,3,27,1,5,100,100,2),(98,3,27,1,4,80,80,3),(99,3,28,1,3,60,60,0),(100,3,28,2,3,30,30,1),(101,3,29,2,0,0,0,1),(102,3,30,1,0,0,0,1),(103,3,31,2,0,0,0,1),(104,3,32,1,5,100,100,0),(105,3,32,4,5,25,25,1),(106,3,33,3,0,0,0,1),(107,3,34,2,0,0,0,1),(108,3,35,1,3,60,60,0),(109,3,35,5,3,12,12,1),(110,3,36,2,0,0,0,1),(111,3,37,3,0,0,0,1),(112,3,38,1,0,0,0,1),(113,3,39,2,0,0,0,1),(114,3,41,3,0,0,0,1),(115,3,42,2,0,0,0,1),(116,3,44,2,6,60,60,0),(117,3,44,4,6,30,30,1),(118,3,49,2,0,0,0,1),(119,3,51,2,5,50,50,0),(120,3,51,4,5,25,25,1),(121,1,48,1,0,0,0,1),(122,2,48,1,0,0,0,1),(123,3,48,1,0,0,0,1),(124,1,47,1,0,0,0,1),(125,2,47,1,0,0,0,1),(126,3,47,1,0,0,0,1),(127,1,46,1,0,0,0,1),(128,2,46,1,0,0,0,1),(129,3,46,1,0,0,0,1),(130,1,53,1,0,0,0,1),(131,2,53,1,0,0,0,1),(132,3,53,1,0,0,0,1),(133,1,119,2,0,0,0,1),(134,2,119,2,0,0,0,1),(135,3,119,2,0,0,0,1),(136,1,120,1,0,0,0,1),(137,2,120,1,0,0,0,1),(138,3,120,1,0,0,0,1),(139,1,126,1,2,40,40,0),(140,1,126,2,2,20,20,1),(141,2,126,1,3,60,60,0),(142,2,126,2,3,30,30,1),(143,3,126,1,1,20,20,0),(144,3,126,2,1,10,10,1),(145,1,83,2,5,50,50,0),(146,1,83,3,5,33,33,1),(147,2,83,2,5,50,50,0),(148,2,83,3,5,33,33,1),(149,3,83,2,6,60,60,0),(150,3,83,3,6,40,40,1),(151,1,112,1,4,80,80,0),(152,1,112,2,4,40,40,1),(153,2,112,1,5,100,100,0),(154,2,112,2,5,50,50,1),(155,3,112,1,3,60,60,0),(156,3,112,2,3,30,30,1),(157,1,98,2,0,0,0,1),(158,2,98,2,0,0,0,1),(159,3,98,2,0,0,0,1),(160,1,103,2,5,50,50,0),(161,1,103,3,5,33,33,1),(162,2,103,2,5,50,50,0),(163,2,103,3,5,33,33,1),(164,3,103,2,6,60,60,0),(165,3,103,3,6,40,40,1),(166,1,111,1,0,0,0,1),(167,2,111,1,0,0,0,1),(168,3,111,1,0,0,0,1),(169,1,54,1,0,0,0,1),(170,2,54,1,0,0,0,1),(171,3,54,1,0,0,0,1),(172,1,135,2,8,80,80,0),(173,1,135,4,8,40,40,1),(174,2,135,2,6,60,60,0),(175,2,135,4,6,30,30,1),(176,3,135,2,6,60,60,0),(177,3,135,4,6,30,30,1),(178,1,52,1,5,100,100,0),(179,1,52,1,5,100,100,1),(180,3,52,1,5,100,100,0),(181,3,52,1,5,100,100,1),(182,2,52,1,5,100,100,0),(183,2,52,1,5,100,100,1),(184,1,132,2,9,90,90,0),(185,1,132,1,4,80,80,1),(186,1,132,1,5,100,100,2),(187,3,132,2,6,60,60,0),(188,3,132,1,3,60,60,1),(189,3,132,1,3,60,60,2),(190,2,132,2,8,80,80,0),(191,2,132,1,4,80,80,1),(192,2,132,1,4,80,80,2),(193,1,45,1,3,60,60,0),(194,1,45,1,3,60,60,1),(195,3,45,1,4,80,80,0),(196,3,45,1,4,80,80,1),(197,2,45,1,3,60,60,0),(198,2,45,1,3,60,60,1);
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_store`
--
DROP TABLE IF EXISTS `rating_store`;
CREATE TABLE `rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `rating_store`
--
LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
INSERT INTO `rating_store` VALUES (1,0),(2,0),(3,0),(1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3);
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `rating_title`
--
DROP TABLE IF EXISTS `rating_title`;
CREATE TABLE `rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `rating_title`
--
LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `report_event`
--
DROP TABLE IF EXISTS `report_event`;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL auto_increment,
  `logged_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL default '0',
  `object_id` int(10) unsigned NOT NULL default '0',
  `subject_id` int(10) unsigned NOT NULL default '0',
  `subtype` tinyint(3) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`),
  CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `report_event`
--
LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `report_event_types`
--
DROP TABLE IF EXISTS `report_event_types`;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL auto_increment,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `report_event_types`
--
LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` VALUES (1,'catalog_product_view',1),(2,'sendfriend_product',1),(3,'catalog_product_compare_add_product',1),(4,'checkout_cart_add_product',1),(5,'wishlist_add_product',1),(6,'wishlist_share',1);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review`
--
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL default '0',
  `entity_pk_value` int(10) unsigned NOT NULL default '0',
  `status_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`),
  CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_PARENT_PRODUCT` FOREIGN KEY (`entity_pk_value`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='Review base information';
--
-- Dumping data for table `review`
--
LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'2007-08-25 11:39:12',1,35,1),(2,'2007-08-25 13:23:30',1,19,1),(3,'2007-08-25 15:33:22',1,36,1),(4,'2007-08-25 15:37:26',1,35,1),(5,'2007-08-25 15:43:42',1,20,1),(6,'2007-08-25 16:03:12',1,30,1),(7,'2007-08-26 15:29:23',1,18,1),(8,'2007-08-26 15:30:08',1,18,1),(9,'2007-08-26 15:30:33',1,18,1),(10,'2007-08-26 15:36:40',1,19,1),(11,'2007-08-26 15:49:19',1,17,1),(12,'2007-08-26 15:58:11',1,20,1),(13,'2007-08-26 15:58:40',1,20,1),(14,'2007-08-26 15:59:16',1,20,1),(15,'2007-08-26 16:02:56',1,16,1),(16,'2007-08-26 16:27:30',1,25,1),(17,'2007-08-26 16:37:51',1,26,1),(18,'2007-08-26 16:38:25',1,26,1),(19,'2007-08-26 16:41:21',1,27,1),(20,'2007-08-26 16:41:48',1,27,1),(21,'2007-08-26 16:44:43',1,28,1),(22,'2007-08-26 18:28:49',1,35,1),(23,'2007-08-27 16:50:11',1,36,1),(24,'2007-08-27 16:52:24',1,37,1),(25,'2007-08-27 16:55:51',1,37,1),(26,'2007-08-27 16:56:54',1,37,1),(27,'2007-08-27 17:00:12',1,38,1),(28,'2007-08-27 17:03:59',1,29,1),(29,'2007-08-27 17:05:03',1,29,1),(30,'2007-08-27 17:07:39',1,31,1),(31,'2007-08-27 17:08:21',1,31,1),(32,'2007-08-27 17:10:56',1,32,1),(33,'2007-08-27 17:12:27',1,33,1),(34,'2007-08-27 17:12:47',1,33,1),(35,'2007-08-27 17:13:22',1,33,1),(36,'2007-08-27 17:15:54',1,34,1),(37,'2007-08-27 17:16:21',1,34,1),(38,'2007-08-27 17:17:44',1,39,1),(39,'2007-08-27 17:31:53',1,41,1),(40,'2007-08-27 17:32:45',1,41,1),(41,'2007-08-27 17:35:48',1,42,1),(42,'2007-08-27 17:37:02',1,42,1),(43,'2007-08-28 13:09:40',1,44,1),(44,'2007-08-28 13:10:25',1,44,1),(45,'2007-08-28 15:15:01',1,49,1),(46,'2007-08-28 18:08:11',1,49,1),(47,'2007-08-28 18:37:23',1,51,1),(48,'2007-08-28 19:36:56',1,25,1),(49,'2007-08-28 19:58:35',1,48,1),(50,'2007-08-28 19:59:57',1,47,1),(51,'2007-08-28 20:01:42',1,46,1),(52,'2007-08-28 20:04:06',1,53,1),(53,'2007-08-29 16:07:46',1,119,1),(54,'2007-08-29 16:10:20',1,120,1),(55,'2007-08-29 16:14:17',1,126,1),(56,'2007-08-29 16:17:33',1,83,1),(57,'2007-08-29 16:22:24',1,112,1),(58,'2007-08-29 16:24:28',1,98,1),(59,'2007-08-29 16:27:44',1,103,1),(60,'2007-08-29 16:32:17',1,111,1),(61,'2007-08-31 06:09:21',1,27,1),(62,'2007-08-31 08:40:10',1,26,1),(63,'2007-08-31 08:59:09',1,32,1),(64,'2007-08-31 09:14:35',1,98,1),(65,'2007-08-31 09:36:10',1,27,1),(66,'2007-08-31 09:57:17',1,27,1),(67,'2007-08-31 09:58:56',1,32,1),(68,'2007-08-31 10:11:07',1,41,1),(69,'2007-08-31 10:37:13',1,39,1),(70,'2007-08-31 10:38:15',1,54,1),(71,'2007-08-31 10:41:44',1,51,1),(72,'2007-08-31 13:41:41',1,35,1),(73,'2007-08-31 22:26:36',1,135,1),(74,'2007-09-01 02:01:23',1,119,1),(75,'2007-09-01 09:24:58',1,135,1),(76,'2007-09-01 12:22:54',1,27,1),(77,'2008-03-18 20:10:18',1,27,1),(78,'2008-03-19 17:57:53',1,135,1),(79,'2008-03-21 14:03:56',1,32,1),(80,'2008-03-22 17:50:12',1,112,1),(81,'2008-03-23 12:01:37',1,103,1),(82,'2008-03-26 09:02:31',1,35,1),(83,'2008-03-27 14:35:22',1,135,1),(84,'2008-03-27 20:19:45',1,27,1),(85,'2008-03-28 00:03:06',1,135,1),(86,'2008-03-30 03:28:03',1,27,1),(87,'2008-03-30 15:44:06',1,27,1),(88,'2008-03-31 10:53:41',1,44,1),(89,'2008-03-31 13:14:39',1,28,1),(90,'2008-04-01 17:25:22',1,16,1),(91,'2008-04-02 05:48:33',1,20,1),(92,'2008-04-03 03:17:13',1,126,1),(93,'2008-04-03 20:19:19',1,103,1),(94,'2008-04-04 03:58:14',1,19,1),(95,'2008-04-04 17:20:44',1,27,1),(96,'2008-04-07 20:41:16',1,52,1),(97,'2008-04-10 20:44:14',1,32,1),(98,'2008-04-12 00:00:29',1,83,1),(99,'2008-04-13 11:07:39',1,25,1),(100,'2008-04-14 13:31:49',1,51,1),(101,'2008-04-14 17:20:43',1,44,1),(102,'2008-04-14 22:19:03',1,132,1),(103,'2008-04-14 23:35:03',1,16,1),(104,'2008-04-15 10:12:40',1,18,1),(105,'2008-04-15 20:42:49',1,51,1),(106,'2008-04-17 02:24:45',1,27,1),(107,'2008-04-17 12:56:09',1,132,1),(108,'2008-04-17 17:14:48',1,26,1),(109,'2008-04-17 17:27:16',1,18,1),(110,'2008-04-17 18:56:01',1,26,1),(111,'2008-04-18 00:40:58',1,45,1),(112,'2008-04-18 11:12:13',1,83,1),(113,'2008-04-18 17:26:56',1,26,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review_detail`
--
DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL auto_increment,
  `review_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL default '',
  `customer_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='Review detail information';
--
-- Dumping data for table `review_detail`
--
LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
INSERT INTO `review_detail` VALUES (1,1,1,'I love this shirt!','This shirts if really great. Especially with the spinal diagram, finally I can see myself for who I really am! ','Sandra Doe',1),(2,2,1,'I feel strange holding a television to my head','I feel strange holding a television to my head.  This product should come with free suspenders','Starbuck',1),(3,3,1,'Cute, but see through','Cute design, but material is too thin.','Natashenka',1),(4,4,1,'chics dig ribs','Ever since buying this shirt chics cant take their hands off me. I don\'t know what it is it must be sprayed with axe - the seductive body spray for men. I\'m the last one to believe commercials but I tell you you won\'t regret buying this shirt. I ordered it n every color.','udini',1),(5,5,1,'Not an i-phone','cest ci nest pas une i-phone.','Udini',1),(6,6,1,'It\'s a pitty they don\'t have large sizes','You wont believe it, my show size is 13 so it\'s impossible for me to get a new pa','Seba\'s',1),(7,7,1,'Great all around phone','Hello all. Just received my phone a few days ago, was super fast shipping using the 2 day shipping option (which by the way is free!! So make sure you select that, as the discount is only shown when you are about to place the final purchase). Luckily I ordered my phone right before the phone was about in low stock.\r\nPHONE: So can\'t really complain about much of anything. Phone has really intuitive interface, very easy to navigate as the arrow keys all function as shortcuts (to calls, file folders, aim, etc..). The walkman button is very convenient as it leads right to the music player. ','John Johnson',1),(8,8,1,'Awesome Phone','The phone is awesome. Fully Loaded & sounds really great, camera is also good.2MP.\r\nExcellent!!! ','Panda',1),(9,9,1,' Ultimate Cell Phone','Wow....What a great cell phone. I really like.....no no.....LOVE this Phone. The Functions and usability of this one are too cool. The MP3 Player palys nice with good user interface. The 2.0 MP Camera is very good, I have stopped taking my Digi Cam to my trips. I never have anytype of problem during the phone call. So considering the +ve points, I truly recommend it to any one.','Ananda',1),(10,10,1,'Worth the upgrade!!!','I\'ve had this phone now for 2 weeks and it has met all of my expectations and exceeded them even. I upgraded from the 8125 and just about everything is a huge improvement!\r\nThe 3G(UMTS) is very impressive with it\'s speed. I even use this phone as a modem on my home pc and it\'s nearly identical in speed as DSL when surfing the net or downloading file/music etc.\r\nCamera is very impressive with clear resolutions for a camera phone with the 2MP.\r\nI also use a bluetooth headset 2.0 with this and mine works wonderfully with sony erriccson; it\'s quite intuitive and picks up the signal instantly. The \'blackberry\' scroll wheel is a huge plus on this phone and I find myself using this feature more than any other buttons. ','Armstrong',1),(11,11,1,'Sweet!','What I love:\r\n============\r\n- Form factor: It is beautiful, it is cute and catchy! It turns heads. Enough said.\r\n- Size: Size is one of the strongest points considering all it does. It neatly slips into a shirt pocket or sits well on the belt.\r\n- Keys: Could be a bit small but I could use it pretty easily though my fingers are bordering on \'butterfingers\'.\r\n- Trackball: Awesome! Just don\'t press it too hard while using it. Just \'roll-it\'!. It is great while you have to move around the screen from control to control\r\n- Voice-dialing: Has worked for me very well the 10 or so times I have tried in my van on the road and off. You have to first choose the voice dialing option from the list of icons on the main menu. I read you can ','Ashwini',1),(12,12,1,'Fouch','I wouldn\'t normally write a review, but everyone is giving this phone a bad rap.. I think people that buy into those reviews are getting cheated out of an excellent phone. I\'ve know several people with Razors that ALL like this much much better. The battery life is absolutely fine, and my phone is on vibrate all day. Maybe other reviewers are on the phone constantly on full blast playing mp3s and shooting video.. I don\'t get it. I\'ve had this phone the better part of a year and never ran out of charge during the day. I plug it in at night. I work as an architect and am on the phone all day long and beat the living hell out of it.. which is another huge plus about this phone. It has a *sturdy* metal housing.. not thin toy crap a la razors or plastic like most phones. I don\'t do a lot of bluetooth, computer syncing, etc, just use the phone in a fairly conventional way, with regular camera use, and for that it is *easily* far and away the best phone I\'ve ever owned.','solid phone',1),(13,13,1,' A crippled cell phone','1, you can not synchronize the phonebook with your PC in a convenient way. I had to code a program to generate single vcard files and send them over bluetooth ONE BY ONE. There seems to be no way to do it without bluetooth.\r\n\r\n2, you can not apply mp3 files as ringtones. However you can download mp3/aac ringtones from sprint (for a fee). Oh the original ringtones that came with the phone? They are just awful.\r\n\r\n','bessel',1),(14,14,1,'MJS','Yeah it looks cool, but it\'s got terrible sound quality, even with an ear-piece. Additionally, they\'ve crammed a lot of stuff into the menus that would probably be desirable to some people, but if you don\'t want it, it\'s just more junk to have to navigate through.','Looks can be deceiving',1),(15,15,1,'Great phone - unless you are outside or in the car','I only needed a basic phone - no MP3, camera, or FM radio. This phone delivered with great reception, good sound quality, great battery life, and a very small size. Inside a building it works great. Why the low score? The tinted plastic over the display makes it impossible to see the display outdoors and in the car. If the sun is out, forget it! I even managed to figure out how to remove all of the wallpaper backgrounds and to maximize the contrast. Still, don\'t plan to use this outdoors. Nokia should recall this product to replace the tinted cover. Update: Yesterday this phone took was accidently dropped onto a very hard ceramic tile floor and it still works perfectly! A similar drop ended the life of my digital camera a few months ago. So, if I were to rate this cell phone now I would give it 3 stars, maybe even 4 stars. I like reliable, sturdy stuff and this cell seems to be unusually well made.','Sheridan',1),(16,16,1,' The Fastest Mac Notebook Ever','It\'s the most stunning idea, isn\'t it? This top of the line MacBook Pro is the fastest Mac Notebook ever, and probably one of the fastest Macs period.\r\n\r\nWhen Steve Jobs announced the new Macs, with Intel Core Duo processors I was almost certain I wanted to buy one. Why? Macs are well known for ease of use and capabilities, but they have managed all that for years, with processors that are not always top-notch. That all changed in January 2006.\r\n\r\n','Stephen',1),(17,17,1,'It\'s worked phenominally for me so far...','Fortunately, the computer worked and worked well from the start for me. The performance is phenomenal, the craftsmanship and style are only slightly short of amazing. (sturdy and stylish, but heavy and heats up quickly.) I hope I never have to deal with customer service but the product performs. The worse thing is that if you have it set to use full power all of the time you get maybe an hour and a half of battery time. Still like my PowerBook better though.','Next',1),(18,18,1,' Not happy at all','I purchased the Red Ferrari Laptop and had nothing but problems form the start. I was supposed to get a free matching mouse, when I received the mouse it looked two years old. When I got laptop working the wrist rest pad right next to the mouse pad was heating up to an uncomfortable level. When I notified PCmode, the supplier of the laptop, they agreed to replace it with another laptop. When I asked if it had the same problems, they told me it headed up as all laptops heat up. The agreed to replace the laptop with another laptop but with a 50% lesser value than the one I purchased.\r\n\r\nI will never buy from these people again... ','Cappello',1),(19,19,1,'Vision of Vaio...','If you\'re buying this laptop, it\'s undoubtedly partially for the design, style and lightweight features of the TX series. You can get cheaper, better performing options at about the same weight, but it won\'t have the \"wow\" factor of this TXN27N. That being said let\'s get right into the pros and cons.\r\n\r\nAs a side note, if you\'re wondering about differences between the 25,27, 29 TX models, it\'s pretty straightforward. The 25 has 1GB RAM and 80GB hard drive, the 27 has 2GB RAM, 100 GB hard drive, the 29 is the same as the 27 except it comes with a carrying case and the exterior has a sleek special shiny coating. IMO, the 27N is the best value among the 3 when you look at the price points.\r\n\r\n','Chen',1),(20,20,1,'Sleek compact design for business travelers on the go.','I waited to get this notebook loaded with Vista. I have mixed feelings. The notebook hardware design is quite sleek and handsome. I am not so impressed with Vista running on this machine though. It just feels that Vista is a resource hog and is constantly running the CPU at 100% which causes the fan to run endlessly. I think the issue is that Sony used the same hardware specs as the previous TX series just to get a Vista version out quickly, but it really is not equipped to handle the new Vista OS as well. So I was disappointed when I upgraded to this notebook thinking that it would run faster, but actually it runs slower than my previous Vaio running Win XP. Though there are some improvements with Vista over XP, Vista probably runs better on a Duo Intel chipset than the Solo that is used in this notebook. The poor notebook is contantly working overtime just to do very simple normal every day applications and it takes forever to start up or reboot. If you just base it on looks alone, then it gets a 4 start rating.','Steven',1),(21,21,1,'Solid and reliable','At first, I wasn\'t terribly impressed. I had been accustomed to working\r\nwith a Toshiba Protege M405 at home and when I purchased the Gateway for\r\nexclusive use at the office, my initial impression of the machine when\r\nI put it into action was noticeably lacking in enthusiasm or excitement.\r\n\r\nI\'ve since come to appreciate this notebook for something much more\r\nimpressive that I couldn\'t gauge out of the box, and that was its\r\namazing reliability and performance over time.\r\n\r\nThis machine is solid. It does not crash.\r\n\r\n','Mendez',1),(22,22,1,'Love it!!! get it!!!','You got to have one of these they come in green','yochan',1),(23,23,1,'Extremely Comfortable!!!','i love this T-shirt\r\nthe quality is nice\r\nand it\'s very soft without tag\r\n\r\ni bought the white one\r\nit can be see through just like other custom\'s review.\r\n\r\nalso i think their size small is a little bigger than other brand\r\nbut it\'s not a big deal though! ','Robin',1),(24,24,1,'excellent','The T-shirt is a very good one. its comfortable and easy to wash, doesn\'t even soften the cloth when washed daily. i love it and good stuff','A Review',1),(25,25,1,'Perfect Cotton Feel','My friend really liked the Tee shirt.he did\'nt think that I would be able to get it in his size but I was able to.I really made my friends day when I told him that I was able to find the tee shirt in the size he wanted.','Adam',1),(26,26,1,'Great, affordable product','These tee shirts are generously cut, hold their color, stand up to repeated washings and are very comfortable. In addition, they are comfortable, extremely affordable and maintain their shape. I highly recommend them.','Patrick',1),(27,27,1,' Well made, affordable. . .you can\'t go wrong!','I am very hard on my t-shirts, and therefore, I need the best quality t-shirt on the market. I\'ve tried them all (except Hanes).  Durable, strong, and surprisingly flattering to those of us lugging around a spare tire, if you get my drift.','Mike',1),(28,28,1,'Inexpensive and very light weight clog','This clog was inexpensive compared to crocs, but I found it did not fit my foot very well. It is, however, very light weight and would otherwise be comfortable. It is also not very attractive. I would not wear this one anywhere but my own yard for gardening, etc.','Loren',1),(29,29,1,' Beach Clogs,','I received these today in the mail and am pleased with the way these feel on my feet,they are so comfortable and so easy to slide on.','Laurie',1),(30,30,1,'Love the look and was comfy for heels!','Would give them 5 stars if not for the toe cleavage issue. Loved them enough to keep them though. Very cute!','Shoe Lover',1),(31,31,1,'Good, Sexy Shoe','These shoes are beautiful, the bright ruby red color complimented by outfit nicely. It did take some breaking in but after which they were as comfortable as pumps can get.','Shoes!!!',1),(32,32,1,'Classic and Cute','This shoe is comfortable and the way the front of the shoe is cut makes it a little more interesting.....','Vanessa',1),(33,33,1,' lite golf shoe','nice shoe. A little tight in the width','Tippy',1),(34,34,1,'Comfortable, good-looking','This is a sharp-looking shoe that is very comfortable for walking and provides a good alternative to the traditional, boring \"golf shoe.\"\r\n','Kathryn',1),(35,35,1,'womens golf shoes','These shoes are my first pair of golf shoes.I have bad feet and wear orthotics so I really wanted a pair of shoes that would feel great on my feet. These are really nice and are a great price for this brand.','Moqilka',1),(36,36,1,' Great Purchase. Best value and very comfortable,','I purchased a pair and have been using it everyday from the past six months. The shoes are very comfortable and look very professional. Love them.','Arun',1),(37,37,1,'Top leather scuffed on first wear','The shoes look and wear great. However, the leather is pretty weak. I think I must have kicked a table leg or something on my frist outing in them. Now the tip of my left shoe has a quarter-size scuff on it. I will have to try to cover it up by oiling it. Obviously I don\'t think this pair will last long at all.','Lian',1),(38,38,1,' !!!!!!','this is exactly what i wanted from a sweatshirt.\r\n\r\nit has a tight figure with a full sized hood\r\nand its really warm and comfortable. ','Sanchez',1),(39,39,1,'Pretty Nice','This is great looking and functional dresser.  I love it.','matt',1),(40,40,1,'Buy this now!!!','This is a beautiful dresser with a rustic feel','Juan',1),(41,41,1,' its a modern bed!','actually my bf and i we were looking for a king size bed..when i saw this bed it was beautiful and thats the color i like and also its a modern style....\r\n','Gertrude',1),(42,42,1,' Excellent!',' Excellent wood bed and drawer set.  Excellent value, fast shipping and a quality product. Awesome! ','David',1),(43,43,1,' Another stunning winner from the bright minds at Canon','I spent three hours yesterday playing with the brand-new Canon Digital Rebel XT digital SLR camera, and man, was I impressed.\r\n\r\nI hadn\'t been too impressed with the original Digital Rebel, except for its revolutionarily low price (for a d-SLR), because it was slow and felt slimsy. The new DR XT is quite different. Even though it\'s 3 ounces lighter than the original DR -- mostly due to the use of a smaller battery; see below -- its smaller form factor actually makes it feel more solid and \"real\". In other word, unlike the original DR, this one feels professional, not toy-like at all.\r\n\r\n\r\n','Mira',1),(44,44,1,' The best thing I\'ve ever bought','The XT is amazing. The battery comes partly charged so you can immedietly start using the camera (thank you Canon!) I\'ve already shot about 200 pictures with it and the battery hasn\'t died yet.\r\n\r\n\r\n\r\n\r\n','Al',1),(45,45,1,'great, comfy flip flops!','Very comfortable flip flops! I wear a size 10-11 and the \"extra-large\" was too small. Most stores don\'t carry the 10 or 11 (beyond extra-large) but I was able to find them on Amazon. Don\'t give up if you need a bigger size than the extra-large!','Erika',1),(46,46,1,'These are the best sandals!','They were delivered really quickly and are just what I was expecting. The are great quality and so comfortable!','Jenna',1),(47,47,1,'I love this Ottoman','Best Ottoman ever!!!!','Terry Ferguson',1),(48,48,1,'I can\'t believe they still make PC\'s....','These Mac\'s are so much better than PC\'s it\'s unbelievable!!!   Obviously designed for the user...  less clicks to get to everything.  amazing!!!','Terry Ferguson',1),(49,49,1,'great for everyday use','I purchased this camera a few months ago because I like to have a camera on hand always. My DSLR and 35 mm SLR cameras are too bulky for everyday. The price and MPs were right, as well as the small size which fits into the clean pockets of any of my purses- no need to worry about lens scratch. For those who don\'t carry a purse and are concerned about the lens, a very small case will do the trick. The images are clean although I\'ve only printed up to 8.5 X 11 so far.','Stull',1),(50,50,1,'Amazing camera value!','This is one of those nice cameras that\'s so well done, it\'s easier to talk about what the camera ISN\'T, rather than what it IS! This camera is not a small, shirt pocket camera, and might be a bit bigger than a woman would wish to carry in a purse. It\'s not a super-tele camera, but it does have a respectable, bit longer than average 4x optical zoom. ','Juan',1),(51,51,1,'Good Camera','    	\r\n77 of 82 people found the following review helpful:\r\nGood Camera, October 11, 2006\r\nBy 	Steve (FL) - See all my reviews\r\nGot it yesterday. In green. Actually it\'s a shiney yellowish-green. Nice feel. Fits well in shirt pocket. Very light; particullarly compared to my Pentax Optio 550. Good, nice size LCD. Easy to use yet with nice availability of choices for customization. Well written manual (you can find online thru google) and onboard help menu. Photos come out fairly nice. Tried indoors in low light with several scene settings, outdoors, macro, and supermacro. Colors look true, fairly sharp without noticable artifact. Used in South Florida morning daylight outside without any trouble with LCD viewing (camera has no classic viewfinder). Have read reviews of washout in bright sun: have not tried that yet. Overall, I\'m happy with the camera thus far. ','Jenella',1),(52,52,1,'Great inexpensive Couch','I love this couch...  extremely comfortable and easy to clean\r\n','Toish',1),(53,53,1,'Comfortable!!!','This is the most comfortable shirt I own...  I will buy many of these shirts','Essentl',1),(54,54,1,'A little see thru','The shirt is a little transparent but is extremely comfortable.\r\nOne of my favorite shirts!','Linda',1),(55,55,1,'Makes me relive my rocker days!!!','The cat kind of looks like me...  Great quality shirt at a good price...','Tetris',1),(56,56,1,'My Party Shoes','So comfortable i were them when I go out.  Whether your dancing or working in the garden, these are the perfect shoe!','J Mo',1),(57,57,1,'Great shoes, but a little expensive!','These are great...  very comfortable.  But a little expensive','Best Golfer Ever',1),(58,58,1,'All around comfort','these are great - whether in the office or a stroll to the store...  wear these everywhere','Bret',1),(59,59,1,'Sexy affordable shoes!','These a very sexy comfortable shoes...  buy them and go out dancing!','Lady Jazz',1),(60,60,0,'I wear these as I walk down the Boardwalk','Sexy shoes that always draw attention to my legs...  ','Fransisco',1),(61,61,1,'Light-weight small laptop','Sony VAIO TX serie is amazing light-weight laptop that I\'ve ever seen it. But TZ is lastest and lighter than TX series.','Tarzan',1),(62,62,1,'sounds great','what a great laptop!','Joe',1),(63,63,1,'These look great','I was the hottest drag model at the show','Johnny',NULL),(64,64,1,'Kenneth Cole Slip Ons are a good choice for Work','I dont like them personally\r\n','Zapateria',NULL),(65,65,2,'Solid Laptop','Expensive but solidly built laptop','Tommy',1),(66,66,1,'not bad','yeah it\'s alright I suppose','ryhrhrh',NULL),(67,67,1,'Top of the top','I\'ve been wearing these shoes since 1912 and believe me, they\'re hot !','Didier',NULL),(68,68,2,'nice deal','made my living room looks great again','lopsta.com',NULL),(69,69,1,'Nice','very coll design','dimsal',NULL),(70,70,1,'This ist great - Love the style','I`ve been looking for such a couch for months now I\'ve found it!','JBrunner',1),(71,71,1,'Looks Good','Looks good and nice. Highly recommended ;)','devx',NULL),(72,72,1,'Greattt','Very good product !','Moimeme',NULL),(73,73,1,'Good shoes','great look, solid design','Terry',NULL),(74,74,1,'Amazing','What a cool shirt, i wear it everyday','Me',NULL),(75,75,1,'very cool','I love these','ilja',NULL),(76,76,1,'Excellent quality','The Sony producs have alway had an excellent quality and value.','Dr. Gish',NULL),(77,77,1,'This notebook is great','This very high quality notebook great for office and business applications. ','tane',NULL),(78,78,1,'Mega shoes','I like it ...','Tester',1),(79,79,1,'Increased my profit margins by 15%','These shoes are great....I was in so much demand with my usal tricks...I could put my prices up by 15%... These shoes will definitely work wonders on your  Supply and Demand curve on your local turf :)','Lady of the night',NULL),(80,80,1,'These shoes rock','I was walking down the street one day, and I looked down at these shoes and thought, \"these are so great.\"','Joe',NULL),(81,81,1,'Nice','I particulary liked the stylish color/design implementation of these Pumps.\r\n\r\nI look forward to use them on the next Weekend Party!','Diane',NULL),(82,82,1,'Love the shirt and print - but a bit too pricey','I\'m a heavy spender of t-shirts and love the quality and prints offered, but the combinded price handling, shipping and item price is very high compared to desigener t-shirts','Dynamo',NULL),(83,83,NULL,'The best!','Wow!  Amazing shoes if I ever saw ones:  great for those cold, dreary winter months, keep your feet warm and dry!','Jane Austin',NULL),(84,84,1,'Cool application','This looks very nice I\'ll have to check out the back end','Nick',NULL),(85,85,1,'Look good but wow are they expensive for what they are!','These sandalls look good, very photogenenic, but would anybody seriously pay this price for them?','Pete',NULL),(86,86,1,'A typical Sony product','Review goes here...','chucker',1),(87,87,2,'i love this product','i love this product','german',NULL),(88,88,1,'A little expensive for what you get','To be honest, the quality of the pictures it takes is excellent. But there are other cameras out there that do just a good a job for $100 less.','JohnnyBoy',NULL),(89,89,1,'Not Bad','perhaps i should have bought six instead of sixty six','Burt',NULL),(90,90,1,'Sucks ','Sucks','Sucks',NULL),(91,91,1,'great','great phone\r\nwith rich features','ashwani',1),(92,92,1,'It sucks','Its too small.','Dramatic Goefer',NULL),(93,93,1,'They match my poodle\'s collar!','Now Sweetums and I are a perfect match!','Toodles',NULL),(94,94,1,'I got \'em','I got suspenders with mine','Mr Green Jeans',NULL),(95,95,3,'test','that\'s a very good product','swisswine',NULL),(96,96,1,'Amazing','Holy-Moly.','Crazy Pants',NULL),(97,97,NULL,'her the summary','that\'s my best review ;-)','lagad',1),(98,98,1,'nice','this is nice','mikey',NULL),(99,99,1,'Apple has done it again!','The MacBook Pro is Apple\'s latest notebook and their first with Intel\'s new attempt at notebook dominance, the Core Duo.  It represents the near peak of current notebook technology in terms of power, making only a few compromises for the sake of a slim profile and a better battery life.  I am a college student who has been lusting over notebooks for the past two years, but with so many choices and every promising notebook seemingly always lacking in an essential area I was paralyzed by indecision (and a lack of funds).  I will be attending Law School next fall and the time has finally come when owning a notebook is no longer an option. Luckily, notebook technology is better than ever, and I finally had some notebooks to choose from that represent nearly everything I have wanted since I first got the idea in my head that I needed one. I have simple needs: gaming capable graphics card, near desktop power, low weight, bright screen, decent battery life, and sweet looks (you know, the basics).\r\n\r\nOnce I saw the Core Duo I knew the day had arrived and that any laptop I bought was going to have it.  I have to have a laptop before August so that took out waiting for the 64bit Core Duo sequel that is coming out sometime later this year or early next year (Merom).\r\n\r\nThe notebooks I considered getting were the W3J, the Acer 8204, and the new MacBook Pro from Apple, all top of the line machines which had the Radeon X1600 and the new Core Duo.  The Apple wasn\'t really an option because the Law School I am attending requires a Windows machine.  The Acer just had too many complaints of a poor screen and other problems, although I know people who are enjoying the machine just fine.  I actually ordered the W3J last week but was dismayed to discover that my preorder wasn\'t made quite soon enough and I was going to have to wait even longer if I wanted that option.  My preorder was cancelled about 4 days after the announcement of Boot Camp, which was not just a hack, but the promise of an (in the future) officially supported dual boot program.  I\'m no fool, and I wasn\'t going to spit the notebook gods in the face.  I had been given a sign, and 24 hours later I picked up my (educationally discounted at $2,299) brand new MacBook Pro.  This is my first Apple ever, but with the safety net of Boot Camp, I figured the time to dive in was now.','Stephen Lee',NULL),(100,100,1,'Word ottoman ever','I know because I am king of the Ottoman Empire','Xerses',1),(101,101,1,'This is a great camera','This camera rocks,  Solid. beautiful pictures ','bob',NULL),(102,102,1,'can\'t do without','i can\'t take photos without this tripod now that i have one. great product!! ','gibbo',NULL),(103,103,1,'Meh','Not great, not awful.','Nick Name',NULL),(104,104,2,'Ist in Ordnung','ganz nette Funktionen','Müller',NULL),(105,105,1,'great website','great website','smerphy',1),(106,106,1,'Good choice','I think this is the best laptop i\'ve ever tried','Ata',NULL),(107,107,2,'Pretty darn good','this is an amazing product with great features and superbly priced - i like it a lot!!','Danners',NULL),(108,108,1,'Fantasticly Expensive','Great product, bit rip off','Joe Gimp',NULL),(109,109,NULL,'Loved It','Awesome Phone!','Phonelover',1),(110,110,1,'Awful Product','I have had nothing but problems with this product. When I received the computer the box was broken. I didn\'t think anything of it but when powered on the computer had a loud whirling sound. A few hours later it refused to turn on. It appears the cheap internal fan broke. I got a new one 2 weeks later. This time the optical drive broke 3 weeks later. I was beginning to become frustrated. After calling customer service they refused to give me a full refund because it had been over 60 days since I first bought it. I hesitantly accepted a third replacement. This one works but the shift button broke already and power cord no longer fits into the computer snugly. I ended up selling it to my cousin and buying a Mac.','SupaStar',NULL),(111,111,1,'good','oh yeah, so so cheesy','gib',NULL),(112,112,1,'perfect and cool','nice shoes, i recommend to y\'all.\r\n\r\n','turgen',NULL),(113,113,1,'el mejor prodducto por el mejor precio','el mejor prodducto por el mejor precio','will',NULL);
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review_entity`
--
DROP TABLE IF EXISTS `review_entity`;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL auto_increment,
  `entity_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
--
-- Dumping data for table `review_entity`
--
LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review_entity_summary`
--
DROP TABLE IF EXISTS `review_entity_summary`;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL auto_increment,
  `entity_pk_value` bigint(20) NOT NULL default '0',
  `entity_type` tinyint(4) NOT NULL default '0',
  `reviews_count` smallint(6) NOT NULL default '0',
  `rating_summary` tinyint(4) NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `review_entity_summary`
--
LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
INSERT INTO `review_entity_summary` VALUES (1,35,1,5,87,0),(2,35,1,5,75,1),(3,35,1,0,0,2),(4,35,1,0,0,3),(5,19,1,3,87,0),(6,19,1,3,71,1),(7,19,1,0,0,2),(8,19,1,0,0,3),(9,36,1,2,67,1),(10,36,1,0,0,2),(11,36,1,0,0,3),(12,20,1,5,87,0),(13,20,1,5,71,1),(14,20,1,0,0,2),(15,20,1,0,0,3),(16,30,1,1,60,1),(17,30,1,0,0,2),(18,30,1,0,0,3),(19,18,1,5,53,0),(20,18,1,3,62,1),(21,18,1,1,53,2),(22,18,1,0,0,3),(23,17,1,1,73,1),(24,17,1,0,0,2),(25,17,1,0,0,3),(26,16,1,3,40,0),(27,16,1,3,51,1),(28,16,1,0,0,2),(29,16,1,0,0,3),(30,25,1,3,80,0),(31,25,1,3,87,1),(32,25,1,0,0,2),(33,25,1,0,0,3),(34,26,1,6,56,0),(35,26,1,6,64,1),(36,26,1,0,0,2),(37,26,1,0,0,3),(38,27,1,12,84,0),(39,27,1,10,73,1),(40,27,1,1,100,2),(41,27,1,1,87,3),(42,28,1,2,60,0),(43,28,1,2,70,1),(44,28,1,0,0,2),(45,28,1,0,0,3),(46,37,1,3,60,1),(47,37,1,0,0,2),(48,37,1,0,0,3),(49,38,1,1,67,1),(50,38,1,0,0,2),(51,38,1,0,0,3),(52,29,1,2,60,1),(53,29,1,0,0,2),(54,29,1,0,0,3),(55,31,1,2,67,1),(56,31,1,0,0,2),(57,31,1,0,0,3),(58,32,1,5,100,0),(59,32,1,4,85,1),(60,32,1,0,0,2),(61,32,1,0,0,3),(62,33,1,3,62,1),(63,33,1,0,0,2),(64,33,1,0,0,3),(65,34,1,2,63,1),(66,34,1,0,0,2),(67,34,1,0,0,3),(68,39,1,2,73,1),(69,39,1,0,0,2),(70,39,1,0,0,3),(71,41,1,3,64,1),(72,41,1,0,0,2),(73,41,1,0,0,3),(74,42,1,2,80,1),(75,42,1,0,0,2),(76,42,1,0,0,3),(77,44,1,4,70,0),(78,44,1,4,77,1),(79,44,1,0,0,2),(80,44,1,0,0,3),(81,49,1,2,80,1),(82,49,1,0,0,2),(83,49,1,0,0,3),(84,51,1,4,47,0),(85,51,1,4,69,1),(86,51,1,0,0,2),(87,51,1,0,0,3),(88,48,1,1,60,1),(89,48,1,0,0,2),(90,48,1,0,0,3),(91,47,1,1,93,1),(92,47,1,0,0,2),(93,47,1,0,0,3),(94,46,1,1,80,1),(95,46,1,0,0,2),(96,46,1,0,0,3),(97,53,1,1,73,1),(98,53,1,0,0,2),(99,53,1,0,0,3),(100,119,1,2,80,1),(101,119,1,0,0,2),(102,119,1,0,0,3),(103,120,1,1,80,1),(104,120,1,0,0,2),(105,120,1,0,0,3),(106,126,1,2,40,0),(107,126,1,2,70,1),(108,126,1,0,0,2),(109,126,1,0,0,3),(110,83,1,3,53,0),(111,83,1,3,62,1),(112,83,1,0,0,2),(113,83,1,0,0,3),(114,112,1,2,80,0),(115,112,1,2,73,1),(116,112,1,0,0,2),(117,112,1,0,0,3),(118,98,1,2,67,1),(119,98,1,0,0,2),(120,98,1,0,0,3),(121,103,1,3,53,0),(122,103,1,3,62,1),(123,103,1,0,0,2),(124,103,1,0,0,3),(125,111,1,1,80,1),(126,111,1,0,0,2),(127,111,1,0,0,3),(128,54,1,1,87,1),(129,54,1,0,0,2),(130,54,1,0,0,3),(131,135,1,5,67,0),(132,135,1,4,63,1),(133,135,1,0,0,2),(134,135,1,0,0,3),(135,52,1,1,100,0),(136,52,1,1,100,1),(137,52,1,0,0,2),(138,52,1,0,0,3),(139,132,1,2,77,0),(140,132,1,1,73,1),(141,132,1,1,80,2),(142,132,1,0,0,3),(143,45,1,1,67,0),(144,45,1,1,67,1),(145,45,1,0,0,2),(146,45,1,0,0,3);
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review_status`
--
DROP TABLE IF EXISTS `review_status`;
CREATE TABLE `review_status` (
  `status_id` tinyint(3) unsigned NOT NULL auto_increment,
  `status_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
--
-- Dumping data for table `review_status`
--
LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `review_store`
--
DROP TABLE IF EXISTS `review_store`;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`),
  CONSTRAINT `review_store_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `review_store`
--
LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
INSERT INTO `review_store` VALUES (3,1),(4,1),(5,1),(7,1),(9,1),(10,1),(12,1),(15,1),(16,1),(17,1),(19,1),(21,1),(24,1),(26,1),(28,1),(29,1),(31,1),(32,1),(37,1),(38,1),(40,1),(46,1),(47,1),(48,1),(49,1),(51,1),(52,1),(53,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(64,1),(66,1),(70,1),(71,1),(72,1),(75,1),(77,1),(78,1),(79,1),(80,1),(84,1),(85,1),(86,1),(87,1),(88,1),(90,1),(92,1),(95,1),(97,1),(98,1),(101,1),(107,1),(108,1),(109,1),(112,1),(113,1),(1,2),(2,2),(6,2),(8,2),(9,2),(11,2),(13,2),(17,2),(18,2),(19,2),(20,2),(22,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(37,2),(39,2),(41,2),(42,2),(43,2),(44,2),(45,2),(47,2),(49,2),(56,2),(62,2),(63,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(80,2),(81,2),(83,2),(84,2),(85,2),(86,2),(87,2),(89,2),(91,2),(92,2),(93,2),(94,2),(96,2),(98,2),(99,2),(100,2),(101,2),(103,2),(105,2),(106,2),(107,2),(108,2),(110,2),(4,3),(5,3),(6,3),(11,3),(13,3),(14,3),(15,3),(17,3),(23,3),(25,3),(26,3),(29,3),(30,3),(31,3),(32,3),(35,3),(36,3),(38,3),(41,3),(42,3),(45,3),(50,3),(51,3),(53,3),(54,3),(55,3),(57,3),(58,3),(61,3),(62,3),(63,3),(64,3),(65,3),(66,3),(68,3),(69,3),(71,3),(74,3),(75,3),(76,3),(77,3),(79,3),(80,3),(82,3),(84,3),(85,3),(91,3),(94,3),(96,3),(97,3),(101,3),(102,3),(104,3),(106,3),(109,3),(110,3),(111,3),(112,3),(113,3);
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_order_item`
--
DROP TABLE IF EXISTS `sales_flat_order_item`;
CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL default '0',
  `parent_item_id` int(10) unsigned default NULL,
  `quote_item_id` int(10) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `product_type` varchar(255) default NULL,
  `product_options` text,
  `weight` decimal(12,4) default '0.0000',
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `qty_backordered` decimal(12,4) default '0.0000',
  `qty_canceled` decimal(12,4) default '0.0000',
  `qty_invoiced` decimal(12,4) default '0.0000',
  `qty_ordered` decimal(12,4) default '0.0000',
  `qty_refunded` decimal(12,4) default '0.0000',
  `qty_shipped` decimal(12,4) default '0.0000',
  `cost` decimal(12,4) default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `original_price` decimal(12,4) default NULL,
  `base_original_price` decimal(12,4) default NULL,
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `tax_invoiced` decimal(12,4) default '0.0000',
  `base_tax_invoiced` decimal(12,4) default '0.0000',
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `discount_invoiced` decimal(12,4) default '0.0000',
  `base_discount_invoiced` decimal(12,4) default '0.0000',
  `amount_refunded` decimal(12,4) default '0.0000',
  `base_amount_refunded` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `gift_message_id` int(10) default NULL,
  `gift_message_available` int(10) default NULL,
  `base_tax_before_discount` varchar(255) default NULL,
  `tax_before_discount` varchar(255) default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` varchar(255) default NULL,
  `weee_tax_applied_row_amount` varchar(255) default NULL,
  `base_weee_tax_applied_amount` varchar(255) default NULL,
  `base_weee_tax_applied_row_amount` varchar(255) default NULL,
  `weee_tax_disposition` varchar(255) default NULL,
  `weee_tax_row_disposition` varchar(255) default NULL,
  `base_weee_tax_disposition` varchar(255) default NULL,
  `base_weee_tax_row_disposition` varchar(255) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `IDX_ORDER` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_order_item`
--
LOCK TABLES `sales_flat_order_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote`
--
DROP TABLE IF EXISTS `sales_flat_quote`;
CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned default '1',
  `is_virtual` tinyint(1) unsigned default '0',
  `is_multi_shipping` tinyint(1) unsigned default '0',
  `items_count` int(10) unsigned default '0',
  `items_qty` decimal(12,4) default '0.0000',
  `orig_order_id` int(10) unsigned default '0',
  `store_to_base_rate` decimal(12,4) default '0.0000',
  `store_to_quote_rate` decimal(12,4) default '0.0000',
  `base_to_global_rate` decimal(12,4) default NULL,
  `base_to_quote_rate` decimal(12,4) default NULL,
  `global_currency_code` varchar(255) default NULL,
  `base_currency_code` varchar(255) default NULL,
  `store_currency_code` varchar(255) default NULL,
  `quote_currency_code` varchar(255) default NULL,
  `grand_total` decimal(12,4) default '0.0000',
  `base_grand_total` decimal(12,4) default '0.0000',
  `checkout_method` varchar(255) default NULL,
  `customer_id` int(10) unsigned default '0',
  `customer_tax_class_id` int(10) unsigned default '0',
  `customer_group_id` int(10) unsigned default '0',
  `customer_email` varchar(255) default NULL,
  `customer_prefix` varchar(40) default NULL,
  `customer_firstname` varchar(255) default NULL,
  `customer_middlename` varchar(40) default NULL,
  `customer_lastname` varchar(255) default NULL,
  `customer_suffix` varchar(40) default NULL,
  `customer_dob` datetime default NULL,
  `customer_note` varchar(255) default NULL,
  `customer_note_notify` tinyint(1) unsigned default '1',
  `customer_is_guest` tinyint(1) unsigned default '0',
  `customer_taxvat` varchar(255) default NULL,
  `remote_ip` varchar(32) default NULL,
  `applied_rule_ids` varchar(255) default NULL,
  `reserved_order_id` varchar(64) default '',
  `password_hash` varchar(255) default NULL,
  `coupon_code` varchar(255) default NULL,
  `subtotal` varchar(255) default NULL,
  `base_subtotal` varchar(255) default NULL,
  `subtotal_with_discount` varchar(255) default NULL,
  `base_subtotal_with_discount` varchar(255) default NULL,
  `gift_message_id` varchar(255) default NULL,
  `is_changed` varchar(255) default NULL,
  `trigger_recollect` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`),
  CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote`
--
LOCK TABLES `sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_address`
--
DROP TABLE IF EXISTS `sales_flat_quote_address`;
CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned default NULL,
  `save_in_address_book` tinyint(1) default '0',
  `customer_address_id` int(10) unsigned default NULL,
  `address_type` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `prefix` varchar(40) default NULL,
  `firstname` varchar(255) default NULL,
  `middlename` varchar(40) default NULL,
  `lastname` varchar(255) default NULL,
  `suffix` varchar(40) default NULL,
  `company` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `region_id` int(10) unsigned default NULL,
  `postcode` varchar(255) default NULL,
  `country_id` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL default '0',
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL default '0',
  `shipping_method` varchar(255) NOT NULL default '',
  `shipping_description` varchar(255) NOT NULL default '',
  `weight` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL default '0.0000',
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `gift_message_id` varchar(255) default NULL,
  PRIMARY KEY  (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote_address`
--
LOCK TABLES `sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_address_item`
--
DROP TABLE IF EXISTS `sales_flat_quote_address_item`;
CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL auto_increment,
  `parent_item_id` int(10) unsigned default NULL,
  `quote_address_id` int(10) unsigned NOT NULL default '0',
  `quote_item_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `gift_message_id` varchar(255) default NULL,
  PRIMARY KEY  (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` (`parent_item_id`),
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote_address_item`
--
LOCK TABLES `sales_flat_quote_address_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_item`
--
DROP TABLE IF EXISTS `sales_flat_quote_item`;
CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_id` int(10) unsigned default NULL,
  `parent_item_id` int(10) unsigned default NULL,
  `is_virtual` tinyint(1) unsigned default NULL,
  `sku` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `is_qty_decimal` tinyint(1) unsigned default NULL,
  `no_discount` tinyint(1) unsigned default '0',
  `weight` decimal(12,4) default '0.0000',
  `qty` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `base_price` decimal(12,4) NOT NULL default '0.0000',
  `custom_price` decimal(12,4) default NULL,
  `discount_percent` decimal(12,4) default '0.0000',
  `discount_amount` decimal(12,4) default '0.0000',
  `base_discount_amount` decimal(12,4) default '0.0000',
  `tax_percent` decimal(12,4) default '0.0000',
  `tax_amount` decimal(12,4) default '0.0000',
  `base_tax_amount` decimal(12,4) default '0.0000',
  `row_total` decimal(12,4) NOT NULL default '0.0000',
  `base_row_total` decimal(12,4) NOT NULL default '0.0000',
  `row_total_with_discount` decimal(12,4) default '0.0000',
  `row_weight` decimal(12,4) default '0.0000',
  `product_type` varchar(255) default NULL,
  `base_tax_before_discount` varchar(255) default NULL,
  `tax_before_discount` varchar(255) default NULL,
  `original_custom_price` varchar(255) default NULL,
  `gift_message_id` varchar(255) default NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` varchar(255) default NULL,
  `weee_tax_applied_row_amount` varchar(255) default NULL,
  `base_weee_tax_applied_amount` varchar(255) default NULL,
  `base_weee_tax_applied_row_amount` varchar(255) default NULL,
  `weee_tax_disposition` varchar(255) default NULL,
  `weee_tax_row_disposition` varchar(255) default NULL,
  `base_weee_tax_disposition` varchar(255) default NULL,
  `base_weee_tax_row_disposition` varchar(255) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote_item`
--
LOCK TABLES `sales_flat_quote_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_item_option`
--
DROP TABLE IF EXISTS `sales_flat_quote_item_option`;
CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item';
--
-- Dumping data for table `sales_flat_quote_item_option`
--
LOCK TABLES `sales_flat_quote_item_option` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_payment`
--
DROP TABLE IF EXISTS `sales_flat_quote_payment`;
CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `quote_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `method` varchar(255) default '',
  `cc_type` varchar(255) default '',
  `cc_number_enc` varchar(255) default '',
  `cc_last4` varchar(255) default '',
  `cc_cid_enc` varchar(255) default '',
  `cc_owner` varchar(255) default '',
  `cc_exp_month` tinyint(2) unsigned default '0',
  `cc_exp_year` smallint(4) unsigned default '0',
  `cc_ss_owner` varchar(255) default '',
  `cc_ss_start_month` tinyint(2) unsigned default '0',
  `cc_ss_start_year` smallint(4) unsigned default '0',
  `cybersource_token` varchar(255) default '',
  `paypal_correlation_id` varchar(255) default '',
  `paypal_payer_id` varchar(255) default '',
  `paypal_payer_status` varchar(255) default '',
  `po_number` varchar(255) default '',
  `ideal_issuer_id` varchar(255) default NULL,
  `ideal_issuer_list` varchar(255) default NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote_payment`
--
LOCK TABLES `sales_flat_quote_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_flat_quote_shipping_rate`
--
DROP TABLE IF EXISTS `sales_flat_quote_shipping_rate`;
CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL auto_increment,
  `address_id` int(10) unsigned NOT NULL default '0',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `carrier` varchar(255) default NULL,
  `carrier_title` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `method` varchar(255) default NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL default '0.0000',
  `method_title` varchar(255) default NULL,
  PRIMARY KEY  (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`),
  CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--
LOCK TABLES `sales_flat_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order`
--
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  `customer_id` int(11) default NULL,
  `tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `subtotal` decimal(12,4) NOT NULL default '0.0000',
  `grand_total` decimal(12,4) NOT NULL default '0.0000',
  `total_paid` decimal(12,4) NOT NULL default '0.0000',
  `total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL default '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL default '0.0000',
  `base_total_paid` decimal(12,4) NOT NULL default '0.0000',
  `base_total_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_qty_ordered` decimal(12,4) NOT NULL default '0.0000',
  `base_total_canceled` decimal(12,4) NOT NULL default '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL default '0.0000',
  `base_total_online_refunded` decimal(12,4) NOT NULL default '0.0000',
  `base_total_offline_refunded` decimal(12,4) NOT NULL default '0.0000',
  `subtotal_refunded` decimal(12,4) default NULL,
  `subtotal_canceled` decimal(12,4) default NULL,
  `discount_refunded` decimal(12,4) default NULL,
  `discount_canceled` decimal(12,4) default NULL,
  `discount_invoiced` decimal(12,4) default NULL,
  `tax_refunded` decimal(12,4) default NULL,
  `tax_canceled` decimal(12,4) default NULL,
  `shipping_refunded` decimal(12,4) default NULL,
  `shipping_canceled` decimal(12,4) default NULL,
  `base_subtotal_refunded` decimal(12,4) default NULL,
  `base_subtotal_canceled` decimal(12,4) default NULL,
  `base_discount_refunded` decimal(12,4) default NULL,
  `base_discount_canceled` decimal(12,4) default NULL,
  `base_discount_invoiced` decimal(12,4) default NULL,
  `base_tax_refunded` decimal(12,4) default NULL,
  `base_tax_canceled` decimal(12,4) default NULL,
  `base_shipping_refunded` decimal(12,4) default NULL,
  `base_shipping_canceled` decimal(12,4) default NULL,
  `subtotal_invoiced` decimal(12,4) default NULL,
  `tax_invoiced` decimal(12,4) default NULL,
  `shipping_invoiced` decimal(12,4) default NULL,
  `base_subtotal_invoiced` decimal(12,4) default NULL,
  `base_tax_invoiced` decimal(12,4) default NULL,
  `base_shipping_invoiced` decimal(12,4) default NULL,
  `shipping_tax_amount` decimal(12,4) default NULL,
  `base_shipping_tax_amount` decimal(12,4) default NULL,
  `shipping_tax_refunded` decimal(12,4) default NULL,
  `base_shipping_tax_refunded` decimal(12,4) default NULL,
  PRIMARY KEY  (`entity_id`),
  KEY `FK_sales_order_type` (`entity_type_id`),
  KEY `FK_sales_order_store` (`store_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  CONSTRAINT `FK_SALE_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALE_ORDER_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- Dumping data for table `sales_order`
--
LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_datetime`
--
DROP TABLE IF EXISTS `sales_order_datetime`;
CREATE TABLE `sales_order_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_datetime_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_datetime_attribute` (`attribute_id`),
  KEY `FK_sales_order_datetime` (`entity_id`),
  CONSTRAINT `FK_sales_order_datetime` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_datetime_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_datetime_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_datetime`
--
LOCK TABLES `sales_order_datetime` WRITE;
/*!40000 ALTER TABLE `sales_order_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_decimal`
--
DROP TABLE IF EXISTS `sales_order_decimal`;
CREATE TABLE `sales_order_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_decimal_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_decimal_attribute` (`attribute_id`),
  KEY `FK_sales_order_decimal` (`entity_id`),
  CONSTRAINT `FK_sales_order_decimal` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_decimal_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_decimal_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_decimal`
--
LOCK TABLES `sales_order_decimal` WRITE;
/*!40000 ALTER TABLE `sales_order_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity`
--
DROP TABLE IF EXISTS `sales_order_entity`;
CREATE TABLE `sales_order_entity` (
  `entity_id` int(10) unsigned NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL default '0',
  `increment_id` varchar(50) NOT NULL default '',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned default NULL,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entity_id`),
  KEY `FK_sales_order_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_store` (`store_id`),
  CONSTRAINT `FK_sales_order_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALE_ORDER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- Dumping data for table `sales_order_entity`
--
LOCK TABLES `sales_order_entity` WRITE;
/*!40000 ALTER TABLE `sales_order_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity_datetime`
--
DROP TABLE IF EXISTS `sales_order_entity_datetime`;
CREATE TABLE `sales_order_entity_datetime` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_entity_datetime_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_datetime_attribute` (`attribute_id`),
  KEY `FK_sales_order_entity_datetime` (`entity_id`),
  CONSTRAINT `FK_sales_order_entity_datetime` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_datetime_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_datetime_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_entity_datetime`
--
LOCK TABLES `sales_order_entity_datetime` WRITE;
/*!40000 ALTER TABLE `sales_order_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity_decimal`
--
DROP TABLE IF EXISTS `sales_order_entity_decimal`;
CREATE TABLE `sales_order_entity_decimal` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_entity_decimal_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_decimal_attribute` (`attribute_id`),
  KEY `FK_sales_order_entity_decimal` (`entity_id`),
  CONSTRAINT `FK_sales_order_entity_decimal` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_decimal_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_decimal_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_entity_decimal`
--
LOCK TABLES `sales_order_entity_decimal` WRITE;
/*!40000 ALTER TABLE `sales_order_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity_int`
--
DROP TABLE IF EXISTS `sales_order_entity_int`;
CREATE TABLE `sales_order_entity_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_entity_int_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_int_attribute` (`attribute_id`),
  KEY `FK_sales_order_entity_int` (`entity_id`),
  CONSTRAINT `FK_sales_order_entity_int` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_int_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_int_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_entity_int`
--
LOCK TABLES `sales_order_entity_int` WRITE;
/*!40000 ALTER TABLE `sales_order_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity_text`
--
DROP TABLE IF EXISTS `sales_order_entity_text`;
CREATE TABLE `sales_order_entity_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_entity_text_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_text_attribute` (`attribute_id`),
  KEY `FK_sales_order_entity_text` (`entity_id`),
  CONSTRAINT `FK_sales_order_entity_text` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_text_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_text_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_entity_text`
--
LOCK TABLES `sales_order_entity_text` WRITE;
/*!40000 ALTER TABLE `sales_order_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_entity_varchar`
--
DROP TABLE IF EXISTS `sales_order_entity_varchar`;
CREATE TABLE `sales_order_entity_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(8) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_entity_varchar_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_entity_varchar_attribute` (`attribute_id`),
  KEY `FK_sales_order_entity_varchar` (`entity_id`),
  CONSTRAINT `FK_sales_order_entity_varchar` FOREIGN KEY (`entity_id`) REFERENCES `sales_order_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_varchar_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_entity_varchar_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_entity_varchar`
--
LOCK TABLES `sales_order_entity_varchar` WRITE;
/*!40000 ALTER TABLE `sales_order_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_int`
--
DROP TABLE IF EXISTS `sales_order_int`;
CREATE TABLE `sales_order_int` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_int_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_int_attribute` (`attribute_id`),
  KEY `FK_sales_order_int` (`entity_id`),
  CONSTRAINT `FK_sales_order_int` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_int_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_int_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_int`
--
LOCK TABLES `sales_order_int` WRITE;
/*!40000 ALTER TABLE `sales_order_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_int` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_tax`
--
DROP TABLE IF EXISTS `sales_order_tax`;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`),
  CONSTRAINT `FK_SALES_ORDER_TAX_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_tax`
--
LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_text`
--
DROP TABLE IF EXISTS `sales_order_text`;
CREATE TABLE `sales_order_text` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` text NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_text_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_text_attribute` (`attribute_id`),
  KEY `FK_sales_order_text` (`entity_id`),
  CONSTRAINT `FK_sales_order_text` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_text_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_text_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_text`
--
LOCK TABLES `sales_order_text` WRITE;
/*!40000 ALTER TABLE `sales_order_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_text` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sales_order_varchar`
--
DROP TABLE IF EXISTS `sales_order_varchar`;
CREATE TABLE `sales_order_varchar` (
  `value_id` int(11) NOT NULL auto_increment,
  `entity_type_id` smallint(5) unsigned NOT NULL default '0',
  `attribute_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`),
  KEY `FK_sales_order_varchar_entity_type` (`entity_type_id`),
  KEY `FK_sales_order_varchar_attribute` (`attribute_id`),
  KEY `FK_sales_order_varchar` (`entity_id`),
  CONSTRAINT `FK_sales_order_varchar` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_varchar_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sales_order_varchar_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sales_order_varchar`
--
LOCK TABLES `sales_order_varchar` WRITE;
/*!40000 ALTER TABLE `sales_order_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_varchar` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `salesrule`
--
DROP TABLE IF EXISTS `salesrule`;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `from_date` date default '0000-00-00',
  `to_date` date default '0000-00-00',
  `coupon_code` varchar(255) default NULL,
  `uses_per_coupon` int(11) NOT NULL default '0',
  `uses_per_customer` int(11) NOT NULL default '0',
  `customer_group_ids` varchar(255) NOT NULL default '',
  `is_active` tinyint(1) NOT NULL default '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL default '1',
  `is_advanced` tinyint(3) unsigned NOT NULL default '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL default '0',
  `simple_action` varchar(32) NOT NULL default '',
  `discount_amount` decimal(12,4) NOT NULL default '0.0000',
  `discount_qty` decimal(12,4) unsigned default NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL default '0',
  `times_used` int(11) unsigned NOT NULL default '0',
  `is_rss` tinyint(4) NOT NULL default '0',
  `website_ids` text,
  PRIMARY KEY  (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `salesrule`
--
LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `salesrule_customer`
--
DROP TABLE IF EXISTS `salesrule_customer`;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL auto_increment,
  `rule_id` int(10) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `times_used` smallint(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `salesrule_customer`
--
LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sendfriend_log`
--
DROP TABLE IF EXISTS `sendfriend_log`;
CREATE TABLE `sendfriend_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `ip` int(11) unsigned NOT NULL default '0',
  `time` int(11) NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `ip` (`ip`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
--
-- Dumping data for table `sendfriend_log`
--
LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `shipping_tablerate`
--
DROP TABLE IF EXISTS `shipping_tablerate`;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL auto_increment,
  `website_id` int(11) NOT NULL default '0',
  `dest_country_id` varchar(4) NOT NULL default '0',
  `dest_region_id` int(10) NOT NULL default '0',
  `dest_zip` varchar(10) NOT NULL default '',
  `condition_name` varchar(20) NOT NULL default '',
  `condition_value` decimal(12,4) NOT NULL default '0.0000',
  `price` decimal(12,4) NOT NULL default '0.0000',
  `cost` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `shipping_tablerate`
--
LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sitemap`
--
DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE `sitemap` (
  `sitemap_id` int(11) NOT NULL auto_increment,
  `sitemap_type` varchar(32) default NULL,
  `sitemap_filename` varchar(32) default NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL default NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`),
  CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sitemap`
--
LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `strikeiron_tax_rate`
--
DROP TABLE IF EXISTS `strikeiron_tax_rate`;
CREATE TABLE `strikeiron_tax_rate` (
  `tax_rate_id` tinyint(4) NOT NULL auto_increment,
  `tax_country_id` varchar(6) default NULL,
  `tax_region_id` mediumint(9) unsigned default NULL,
  `tax_postcode` varchar(12) default NULL,
  `rate_value` decimal(12,4) NOT NULL default '0.0000',
  PRIMARY KEY  (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Strikeiron tax rates';
--
-- Dumping data for table `strikeiron_tax_rate`
--
LOCK TABLES `strikeiron_tax_rate` WRITE;
/*!40000 ALTER TABLE `strikeiron_tax_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `strikeiron_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tag`
--
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `status` smallint(6) NOT NULL default '0',
  PRIMARY KEY  USING BTREE (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- Dumping data for table `tag`
--
LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'bed',1),(2,'trendy',1),(3,'wood',1),(4,'young',1),(5,'hip',1),(6,'Excellent',1),(7,'Furniture',1),(8,'modern',1),(9,'pocket',1),(10,'clean',1),(11,'apple',1),(12,'cool',1),(13,'universal',1),(14,'clogs',1),(15,'outdoor',1),(16,'green',1),(17,'bones',1),(18,'pda',1),(19,'slider',1),(20,'mobile',1),(21,'joe',1),(22,'laces',1),(23,'Camera',1),(24,'charger',1),(25,'Geil',1),(26,'crackberry',1),(27,'SEXY',1),(28,'tight',1),(29,'Test',1),(30,'red',1),(31,'sandals',1),(32,'design',1),(33,'ugly',1),(34,'rubber',1),(35,'light',1),(36,'monikas',1),(37,'t-shirt',1),(38,'test,',1),(39,'Sportsshoes',1),(40,'very',1),(41,'good',1),(42,'phone',1),(43,'favorite',1),(44,'shoe',1),(45,'shirt',1),(46,'monkeybutt',1),(47,'pizzamonkey',1),(48,'silver',1),(49,'black',1),(50,'sony',1),(51,'laptop',1),(52,'compact',1),(53,'small screen',1),(54,'tee-shirt',1),(55,'computer',1),(56,'shoes',1),(57,'sandale',1),(58,'tina',1),(59,'brown',1),(60,'lova',1),(61,'Tag',1),(62,'toes',-1),(63,'mniam',1),(64,'couch',1),(65,'chair',1),(66,'sandals,',1),(67,'blue,',1),(68,'shoes,',1),(69,'small',1),(70,'nice',1),(71,'badassness',1),(72,'cellotastic',1),(73,'macbook',1),(74,'mac',1),(75,'thongs',1),(76,'bla',1),(77,'notebook',1),(78,'phonex',1),(79,'süper',1),(80,'testing',1),(81,'awesome',1),(82,'holeys',1),(83,'Innovate',1),(84,'buenisimo',1),(85,'laptopik',1),(86,'rouge',1),(87,'modern,',1),(88,'moderne',1),(89,'blue',1),(90,'sandally',1),(91,'zoom',1),(92,'amazing',1),(93,'acer',1),(94,'portable',1),(95,'nippley',1),(96,'headless',1),(97,'prettyboy',1),(98,'grey',1),(99,'pouffe',1),(100,'teste',1),(101,'photography',1),(102,'handy',1),(103,'strange',1),(104,'skeleton',1),(105,'terry\'s',1),(106,'green,',1),(107,'sexy,',1),(108,'hi',1),(109,'Hohoho',1),(110,'Image',1),(111,'canape',1),(112,'chic',1),(113,'dresser',1),(114,'lens',1),(115,'schoen',1),(116,'golf',1),(117,'philip',1),(118,'coconut',1),(119,'mytag',1),(120,'mesas',1),(121,'hideous',1),(122,'mystuff',1),(123,'user',1),(124,'shittt',1),(125,'sex',1),(126,'sucks',1),(127,'whynot',1),(128,'camera-photo',1),(129,'wow',1),(130,'kzyhu',1),(131,'badminded',1),(132,'noerd',1),(133,'square',1),(134,'beach',1),(135,'Core Duo',1),(136,'spray',1),(137,'paint',1),(138,'tempos',1),(139,'teacher',1),(140,'ATT',1),(141,'BlackBerry',1),(142,'gadget',1),(143,'pas',1),(144,'mal',1),(145,'SMUKKE',1),(146,'kurti',1),(147,'larum',1),(148,'try',1),(149,'WAAAAAOOO',1),(150,'portatil',1),(151,'CRAPOTO',1),(152,'Kamera,',1),(153,'Camera,',1),(154,'Olympus',1),(155,'Nine',1),(156,'West',1),(157,'Women\'s',1),(158,'Lucero',1),(159,'Pump',1),(160,'Web',1),(161,'browser',1),(162,'content,',1),(163,'messaging',1),(164,'sessions,',1),(165,'and',-1),(166,'attachments.',1),(167,'Anashria',1),(168,'Womens',1),(169,'Premier',1),(170,'Leather',1),(171,'Sandal',1),(172,'arbeit',-1),(173,'crap',1),(174,'Walkman',1),(175,'gift',1),(176,'for',-1),(177,'her',1),(178,'Hupe',1),(179,'sleek',-1),(180,'samsung',1),(181,'footrest',1),(182,'shit',1),(183,'jogging',1),(184,'cool t-shirt',1),(185,'must get',1),(186,'bright',1),(187,'cellphone',1),(188,'comfort',1),(189,'ferrari',1),(190,'shiny',1),(191,'toll',1),(192,'warm',1),(193,'SOFA',1),(194,'fast',1),(195,'emo',1),(196,'smart',1),(197,'Canon',1),(198,'appletoys',1);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tag_relation`
--
DROP TABLE IF EXISTS `tag_relation`;
CREATE TABLE `tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL auto_increment,
  `tag_id` int(11) unsigned NOT NULL default '0',
  `customer_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(6) unsigned NOT NULL default '1',
  `active` tinyint(1) unsigned NOT NULL default '1',
  `created_at` datetime default NULL,
  PRIMARY KEY  USING BTREE (`tag_relation_id`),
  KEY `FK_TAG_RELATION_TAG` (`tag_id`),
  KEY `FK_TAG_RELATION_CUSTOMER` (`customer_id`),
  KEY `FK_TAG_RELATION_PRODUCT` (`product_id`),
  KEY `FK_TAG_RELATION_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_relation_ibfk_4` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_relation_ibfk_5` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_relation_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tag_relation`
--
LOCK TABLES `tag_relation` WRITE;
/*!40000 ALTER TABLE `tag_relation` DISABLE KEYS */;
INSERT INTO `tag_relation` VALUES (1,1,1,42,1,1,'2007-08-31 05:29:32'),(2,2,1,42,1,1,'2007-08-31 05:29:32'),(3,3,1,42,1,1,'2007-08-31 05:29:32'),(4,4,1,120,1,1,'2007-08-31 05:29:48'),(5,5,1,120,1,1,'2007-08-31 05:29:48'),(6,4,1,119,1,1,'2007-08-31 05:29:59'),(7,5,1,119,1,1,'2007-08-31 05:29:59'),(8,6,1,30,1,1,'2007-08-31 05:30:14'),(9,7,1,51,1,1,'2007-08-31 05:30:30'),(10,8,1,51,1,1,'2007-08-31 05:30:30'),(11,9,1,46,1,1,'2007-08-31 05:30:50'),(12,10,1,46,1,1,'2007-08-31 05:30:50'),(13,2,1,46,1,1,'2007-08-31 05:30:50'),(14,11,1,25,1,1,'2007-08-31 05:31:29'),(15,12,1,25,1,1,'2007-08-31 05:31:29'),(16,13,1,134,1,1,'2007-08-31 05:31:56'),(17,14,1,83,1,1,'2007-08-31 05:32:51'),(18,15,1,132,1,1,'2007-08-31 05:33:41'),(19,16,1,119,1,1,'2007-08-31 05:41:08'),(20,17,1,119,1,1,'2007-08-31 05:41:21'),(21,18,1,19,1,1,'2007-08-31 05:52:35'),(22,19,1,20,1,1,'2007-08-31 05:53:49'),(23,12,1,20,1,1,'2007-08-31 05:53:49'),(24,20,1,26,1,1,'2007-08-31 05:55:32'),(25,20,1,18,1,1,'2007-08-31 05:56:51'),(26,20,1,17,1,1,'2007-08-31 05:57:03'),(27,12,1,17,1,1,'2007-08-31 05:57:13'),(28,11,1,25,1,1,'2007-08-31 06:36:37'),(29,21,1,53,1,1,'2007-08-31 08:35:38'),(30,22,1,93,1,1,'2007-08-31 08:49:08'),(31,13,1,134,2,1,'2007-08-31 09:34:10'),(32,23,1,134,2,1,'2007-08-31 09:34:10'),(33,24,1,134,2,1,'2007-08-31 09:34:10'),(34,25,1,119,2,1,'2007-08-31 09:42:57'),(35,26,1,17,1,1,'2007-08-31 10:31:44'),(36,27,1,119,1,1,'2007-08-31 11:38:34'),(37,28,1,119,1,1,'2007-08-31 12:49:37'),(38,29,1,27,1,1,'2007-08-31 14:45:29'),(39,30,1,52,1,1,'2007-08-31 16:10:03'),(40,30,1,53,1,1,'2007-08-31 18:20:17'),(41,31,1,135,1,1,'2007-08-31 23:12:13'),(42,32,1,18,1,1,'2007-09-01 00:32:23'),(43,33,1,135,1,1,'2007-09-01 03:51:29'),(44,34,1,135,1,1,'2007-09-01 03:51:29'),(45,14,1,135,1,1,'2007-09-01 03:51:29'),(46,35,1,135,1,1,'2007-09-01 05:32:10'),(47,36,1,27,1,1,'2007-09-01 12:50:14'),(48,29,1,134,1,1,'2007-09-03 02:06:31'),(49,37,1,119,1,1,'2007-09-03 04:28:30'),(50,38,1,98,1,1,'2007-09-03 04:31:18'),(51,39,1,93,1,1,'2007-09-04 07:19:57'),(52,40,1,45,1,1,'2007-09-04 08:28:36'),(53,41,1,45,1,1,'2007-09-04 08:28:36'),(54,42,1,18,1,1,'2007-09-04 11:05:12'),(55,43,1,45,1,1,'2007-09-04 13:49:19'),(56,11,1,25,1,1,'2007-09-04 16:06:17'),(57,44,1,32,1,1,'2007-09-04 23:12:57'),(58,2,1,25,1,1,'2007-09-05 11:01:30'),(59,45,1,35,1,1,'2007-09-05 13:21:44'),(60,46,1,42,1,1,'2007-09-05 16:24:59'),(61,47,1,42,1,1,'2007-09-05 16:25:14'),(62,11,1,27,1,1,'2007-09-09 03:25:18'),(63,48,1,27,1,1,'2007-09-10 00:23:01'),(64,49,1,27,1,1,'2007-09-10 00:23:01'),(65,50,1,27,1,1,'2007-09-10 00:23:01'),(66,51,1,27,1,1,'2007-09-10 00:23:01'),(67,52,1,27,1,1,'2007-09-10 00:23:01'),(68,35,1,27,1,1,'2007-09-10 00:23:01'),(69,53,1,27,1,1,'2007-09-10 00:23:01'),(70,54,1,35,1,1,'2007-09-27 09:59:54'),(71,29,1,20,1,1,'2007-09-27 14:57:37'),(72,12,1,120,1,1,'2007-10-02 10:55:26'),(73,55,1,25,1,1,'2007-10-10 12:34:43'),(74,30,1,32,1,1,'2007-10-11 14:08:30'),(75,56,1,32,1,1,'2007-10-11 14:08:30'),(76,57,1,135,1,1,'2007-10-12 03:06:35'),(77,58,1,126,1,1,'2007-10-19 01:45:12'),(78,29,1,27,2,1,'2007-10-21 12:35:17'),(79,59,1,135,1,1,'2007-10-21 18:45:13'),(80,60,1,52,1,1,'2007-10-23 19:59:37'),(81,41,1,120,1,1,'2007-10-25 10:54:34'),(82,61,1,26,1,1,'2007-10-27 01:15:06'),(83,62,1,135,1,1,'2007-10-31 06:41:34'),(84,63,1,32,1,1,'2007-11-03 08:21:10'),(85,64,1,51,1,1,'2007-11-11 17:32:19'),(86,7,1,51,1,1,'2007-11-11 17:32:19'),(87,8,1,51,1,1,'2007-11-11 17:32:19'),(88,65,1,52,1,1,'2007-11-11 17:33:21'),(89,7,1,52,1,1,'2007-11-11 17:33:21'),(90,8,1,52,1,1,'2007-11-11 17:33:21'),(91,29,1,27,1,1,'2007-11-14 23:10:01'),(92,66,1,83,1,1,'2007-11-15 21:08:47'),(93,67,1,83,1,1,'2007-11-15 21:08:47'),(94,68,1,83,1,1,'2007-11-15 21:08:47'),(95,69,1,83,1,1,'2007-11-15 21:08:47'),(96,70,1,44,1,1,'2007-11-16 04:23:18'),(97,12,1,126,1,1,'2007-11-18 18:57:35'),(98,16,1,126,2,1,'2007-11-19 22:10:44'),(99,71,1,83,1,1,'2007-11-20 02:06:27'),(100,70,1,119,1,1,'2007-11-22 13:40:17'),(101,29,1,27,1,1,'2007-11-22 13:40:25'),(102,27,1,17,1,1,'2007-11-23 01:18:36'),(103,72,1,54,1,1,'2007-11-23 01:19:35'),(104,17,1,119,1,1,'2007-11-23 05:04:04'),(105,12,1,25,1,1,'2007-11-23 08:28:32'),(106,11,1,25,1,1,'2007-11-23 08:28:33'),(107,51,1,25,1,1,'2007-11-23 08:28:33'),(108,73,1,25,1,1,'2007-11-23 08:28:33'),(109,74,1,25,1,1,'2007-11-23 08:28:33'),(110,48,1,25,1,1,'2007-11-23 08:28:33'),(111,75,1,135,1,1,'2007-11-24 11:13:39'),(112,76,1,20,3,1,'2007-11-26 15:33:10'),(113,77,1,27,2,1,'2007-11-30 22:36:43'),(114,42,1,19,1,1,'2007-12-01 01:51:25'),(115,78,1,19,1,1,'2007-12-01 01:51:41'),(116,79,1,32,1,1,'2007-12-02 00:01:50'),(117,80,1,19,1,1,'2007-12-03 01:06:47'),(118,81,1,44,1,1,'2007-12-04 09:11:43'),(119,82,1,83,1,1,'2007-12-06 02:09:24'),(120,27,1,32,1,1,'2007-12-06 13:32:55'),(121,29,1,27,1,1,'2007-12-08 17:21:40'),(122,11,1,27,2,1,'2007-12-11 15:07:55'),(123,12,1,27,2,1,'2007-12-11 15:07:55'),(124,65,1,52,1,1,'2007-12-13 09:04:44'),(125,83,1,20,1,1,'2007-12-16 22:32:32'),(126,84,1,45,1,1,'2007-12-19 07:51:26'),(127,85,1,27,1,1,'2007-12-21 12:21:34'),(128,86,1,52,1,1,'2007-12-26 19:36:22'),(129,30,1,52,1,1,'2007-12-26 19:36:37'),(130,8,1,52,1,1,'2007-12-26 19:36:52'),(131,87,1,52,1,1,'2007-12-26 19:37:07'),(132,88,1,52,1,1,'2007-12-26 19:37:20'),(133,89,1,119,1,1,'2007-12-28 08:06:23'),(134,51,1,26,1,1,'2007-12-28 19:17:07'),(135,90,1,135,1,1,'2008-01-03 21:55:11'),(136,77,1,26,1,1,'2008-01-05 08:03:06'),(137,91,1,46,1,1,'2008-01-05 09:12:43'),(138,35,1,30,1,1,'2008-01-05 10:45:10'),(139,92,1,26,1,1,'2008-01-05 11:23:44'),(140,51,1,26,1,1,'2008-01-06 08:19:12'),(141,93,1,26,1,1,'2008-01-06 08:37:36'),(142,94,1,27,1,1,'2008-01-06 16:53:18'),(143,95,1,35,1,1,'2008-01-07 05:45:10'),(144,96,1,35,1,1,'2008-01-07 06:09:52'),(145,97,1,35,1,1,'2008-01-07 06:10:12'),(146,45,1,35,1,1,'2008-01-07 06:10:54'),(147,42,1,17,1,1,'2008-01-07 10:01:54'),(148,69,1,48,1,1,'2008-01-08 01:41:47'),(149,98,1,46,1,1,'2008-01-08 09:13:14'),(150,23,1,32,1,1,'2008-01-09 12:17:18'),(151,80,1,27,1,1,'2008-01-09 13:35:20'),(152,29,1,134,1,1,'2008-01-09 13:36:03'),(153,99,1,51,1,1,'2008-01-10 10:26:30'),(154,29,1,27,1,1,'2008-01-11 00:02:51'),(155,100,1,135,1,1,'2008-01-11 12:52:20'),(156,101,1,132,1,1,'2008-01-13 14:15:05'),(157,55,1,28,2,1,'2008-01-14 17:48:12'),(158,102,1,18,2,1,'2008-01-14 19:09:54'),(159,103,1,35,2,1,'2008-01-16 06:40:21'),(160,104,1,35,2,1,'2008-01-16 06:41:39'),(161,17,1,35,1,1,'2008-01-17 11:44:08'),(162,105,1,135,1,1,'2008-01-18 21:48:37'),(163,43,1,135,1,1,'2008-01-18 21:48:37'),(164,106,1,39,1,1,'2008-01-18 22:16:26'),(165,107,1,39,1,1,'2008-01-18 22:16:26'),(166,12,1,39,1,1,'2008-01-18 22:16:26'),(167,23,1,46,1,1,'2008-01-18 22:57:29'),(168,108,1,28,1,1,'2008-01-19 08:43:26'),(169,55,1,27,1,1,'2008-01-19 19:53:04'),(170,109,1,27,2,1,'2008-01-19 20:47:47'),(171,70,1,35,1,1,'2008-01-21 21:33:44'),(172,110,1,35,1,1,'2008-01-21 21:33:44'),(173,51,1,28,2,1,'2008-01-23 11:42:59'),(174,50,1,27,1,1,'2008-01-23 17:24:33'),(175,51,1,27,1,1,'2008-01-23 17:24:47'),(176,111,1,51,1,1,'2008-01-23 23:53:24'),(177,112,1,51,1,1,'2008-01-23 23:53:24'),(178,79,1,16,3,1,'2008-01-24 08:59:20'),(179,113,1,41,1,1,'2008-01-24 19:27:16'),(180,29,1,27,1,1,'2008-01-25 05:38:46'),(181,30,1,51,1,1,'2008-01-27 00:16:53'),(182,114,1,46,1,1,'2008-01-28 16:28:06'),(183,115,1,30,1,1,'2008-01-29 08:32:00'),(184,94,1,27,1,1,'2008-01-30 19:04:03'),(185,116,1,112,1,1,'2008-01-31 14:11:14'),(186,29,1,25,3,1,'2008-01-31 14:42:40'),(187,117,1,27,1,1,'2008-02-01 08:23:09'),(188,118,1,27,1,1,'2008-02-04 23:24:16'),(189,119,1,18,1,1,'2008-02-06 17:40:14'),(190,120,1,41,1,1,'2008-02-08 09:10:19'),(191,121,1,135,1,1,'2008-02-08 22:50:39'),(192,77,1,27,1,1,'2008-02-10 17:37:40'),(193,37,1,35,3,1,'2008-02-11 09:40:17'),(194,122,1,26,1,1,'2008-02-11 15:51:08'),(195,123,1,27,1,1,'2008-02-13 15:21:18'),(196,124,1,27,1,1,'2008-02-13 17:25:45'),(197,125,1,46,1,0,'2008-02-13 18:03:01'),(198,126,1,27,1,1,'2008-02-13 18:04:22'),(199,27,1,25,1,1,'2008-02-13 19:00:08'),(200,127,1,30,3,1,'2008-02-14 16:30:29'),(201,128,1,46,3,1,'2008-02-14 16:33:02'),(202,129,1,25,1,1,'2008-02-14 18:58:50'),(203,130,1,20,1,1,'2008-02-16 07:52:20'),(204,70,1,39,1,1,'2008-02-19 08:25:22'),(205,131,1,32,2,1,'2008-02-19 21:26:51'),(206,132,1,126,2,1,'2008-02-19 21:27:51'),(207,133,1,25,1,1,'2008-02-21 02:57:32'),(208,134,1,83,1,1,'2008-02-21 19:11:41'),(209,135,1,28,1,1,'2008-02-23 23:10:34'),(210,136,1,120,1,1,'2008-02-25 00:09:58'),(211,137,1,120,1,1,'2008-02-25 00:09:58'),(212,138,1,27,1,1,'2008-02-27 09:41:38'),(213,139,1,119,1,1,'2008-02-28 05:05:02'),(214,140,1,19,1,1,'2008-02-28 15:30:14'),(215,141,1,17,1,1,'2008-03-01 16:01:27'),(216,142,1,18,1,1,'2008-03-04 23:12:47'),(217,70,1,42,2,1,'2008-03-06 10:20:07'),(218,143,1,119,3,1,'2008-03-06 22:59:49'),(219,144,1,119,3,1,'2008-03-06 22:59:49'),(220,76,1,45,1,1,'2008-03-07 03:22:17'),(221,145,1,119,1,1,'2008-03-10 11:33:45'),(222,30,1,54,1,1,'2008-03-10 21:10:17'),(223,146,1,27,1,1,'2008-03-10 22:53:31'),(224,147,1,25,1,1,'2008-03-11 15:06:18'),(225,56,1,83,1,1,'2008-03-16 00:54:08'),(226,149,1,134,1,1,'2008-03-17 00:29:05'),(227,150,1,26,1,1,'2008-03-17 19:12:59'),(228,151,1,26,3,1,'2008-03-18 13:05:03'),(229,77,1,27,1,1,'2008-03-18 14:19:30'),(230,152,1,46,2,1,'2008-03-18 17:58:42'),(231,153,1,46,2,1,'2008-03-18 17:58:42'),(232,154,1,46,2,1,'2008-03-18 17:58:42'),(233,155,1,108,1,1,'2008-03-19 17:36:51'),(234,156,1,108,1,1,'2008-03-19 17:36:51'),(235,157,1,108,1,1,'2008-03-19 17:36:51'),(236,158,1,108,1,1,'2008-03-19 17:36:51'),(237,159,1,108,1,1,'2008-03-19 17:36:52'),(238,160,1,17,1,1,'2008-03-19 17:37:56'),(239,161,1,17,1,1,'2008-03-19 17:37:57'),(240,162,1,17,1,1,'2008-03-19 17:37:57'),(241,163,1,17,1,1,'2008-03-19 17:37:57'),(242,164,1,17,1,1,'2008-03-19 17:37:57'),(243,165,1,17,1,1,'2008-03-19 17:37:57'),(244,166,1,17,1,1,'2008-03-19 17:37:57'),(245,167,1,135,1,1,'2008-03-19 17:54:39'),(246,168,1,135,1,1,'2008-03-19 17:54:39'),(247,169,1,135,1,1,'2008-03-19 17:54:39'),(248,170,1,135,1,1,'2008-03-19 17:54:39'),(249,171,1,135,1,1,'2008-03-19 17:54:39'),(250,109,1,119,1,1,'2008-03-19 18:22:27'),(251,172,1,25,2,1,'2008-03-21 14:03:29'),(252,173,1,93,1,1,'2008-03-22 03:39:48'),(253,174,1,18,1,1,'2008-03-22 23:32:31'),(254,175,1,32,1,1,'2008-03-24 20:53:08'),(255,176,1,32,1,1,'2008-03-24 20:53:08'),(256,177,1,32,1,1,'2008-03-24 20:53:08'),(257,178,1,119,1,1,'2008-03-27 09:21:02'),(258,179,1,42,1,1,'2008-03-27 15:55:49'),(259,180,1,20,1,1,'2008-03-27 17:35:23'),(260,181,1,51,1,1,'2008-03-27 21:57:38'),(261,52,1,46,1,1,'2008-03-29 12:07:20'),(262,77,1,27,1,1,'2008-03-30 03:26:33'),(263,183,1,93,1,1,'2008-03-30 10:55:22'),(264,4,1,119,1,1,'2008-03-31 06:08:44'),(265,5,1,119,1,1,'2008-03-31 06:08:44'),(266,16,1,119,1,1,'2008-03-31 06:08:44'),(267,17,1,119,1,1,'2008-03-31 06:08:44'),(268,27,1,119,1,1,'2008-03-31 06:08:44'),(269,28,1,119,1,1,'2008-03-31 06:08:44'),(270,184,1,119,1,1,'2008-03-31 06:08:44'),(271,109,1,119,1,1,'2008-03-31 06:08:44'),(272,4,1,119,1,1,'2008-03-31 06:08:44'),(273,5,1,119,1,1,'2008-03-31 06:08:44'),(274,16,1,119,1,1,'2008-03-31 06:08:44'),(275,17,1,119,1,1,'2008-03-31 06:08:44'),(276,27,1,119,1,1,'2008-03-31 06:08:44'),(277,4,1,120,1,1,'2008-03-31 06:09:09'),(278,5,1,120,1,1,'2008-03-31 06:09:09'),(279,16,1,120,1,1,'2008-03-31 06:09:09'),(280,17,1,120,1,1,'2008-03-31 06:09:09'),(281,27,1,120,1,1,'2008-03-31 06:09:09'),(282,28,1,120,1,1,'2008-03-31 06:09:09'),(283,184,1,120,1,1,'2008-03-31 06:09:09'),(284,109,1,120,1,1,'2008-03-31 06:09:09'),(285,4,1,126,1,1,'2008-03-31 06:09:27'),(286,5,1,126,1,1,'2008-03-31 06:09:27'),(287,16,1,126,1,1,'2008-03-31 06:09:27'),(288,17,1,126,1,1,'2008-03-31 06:09:27'),(289,27,1,126,1,1,'2008-03-31 06:09:27'),(290,28,1,126,1,1,'2008-03-31 06:09:28'),(291,184,1,126,1,1,'2008-03-31 06:09:28'),(292,109,1,126,1,1,'2008-03-31 06:09:28'),(293,4,1,123,1,1,'2008-03-31 06:09:48'),(294,5,1,123,1,1,'2008-03-31 06:09:48'),(295,16,1,123,1,1,'2008-03-31 06:09:48'),(296,17,1,123,1,1,'2008-03-31 06:09:48'),(297,27,1,123,1,1,'2008-03-31 06:09:48'),(298,28,1,123,1,1,'2008-03-31 06:09:48'),(299,184,1,123,1,1,'2008-03-31 06:09:48'),(300,109,1,123,1,1,'2008-03-31 06:09:48'),(301,185,1,133,1,1,'2008-03-31 07:38:37'),(302,102,1,133,1,1,'2008-03-31 07:38:37'),(303,59,1,42,2,1,'2008-04-01 15:52:04'),(304,186,1,42,2,1,'2008-04-01 15:52:22'),(305,23,1,45,1,1,'2008-04-01 20:35:26'),(306,187,1,20,1,1,'2008-04-02 05:46:21'),(307,86,1,51,3,1,'2008-04-04 07:50:11'),(308,188,1,51,3,1,'2008-04-04 07:50:11'),(309,189,1,26,1,1,'2008-04-04 18:45:46'),(310,77,1,26,1,1,'2008-04-04 18:45:46'),(311,61,1,134,1,1,'2008-04-05 14:06:09'),(312,190,1,27,1,1,'2008-04-09 12:56:39'),(313,27,1,35,1,1,'2008-04-09 15:56:02'),(314,27,1,26,1,1,'2008-04-09 19:01:06'),(315,77,1,26,1,1,'2008-04-09 19:01:06'),(316,191,1,46,1,1,'2008-04-10 10:10:16'),(317,192,1,39,1,1,'2008-04-10 17:21:56'),(318,77,1,25,1,1,'2008-04-11 02:00:07'),(319,93,1,25,1,1,'2008-04-11 02:00:07'),(320,41,1,25,1,1,'2008-04-11 02:00:07'),(321,129,1,42,1,1,'2008-04-12 05:37:31'),(322,193,1,53,1,1,'2008-04-12 07:33:10'),(323,194,1,25,1,1,'2008-04-12 19:44:54'),(324,195,1,35,1,1,'2008-04-14 12:36:23'),(325,195,1,119,1,1,'2008-04-14 12:37:20'),(326,23,1,132,1,1,'2008-04-14 13:06:10'),(327,2,1,46,1,1,'2008-04-14 18:18:02'),(328,173,1,48,1,1,'2008-04-15 14:34:55'),(329,182,1,48,1,1,'2008-04-15 14:35:08'),(330,196,1,27,1,1,'2008-04-16 15:39:34'),(331,30,1,51,2,1,'2008-04-22 13:02:52'),(332,173,1,120,1,1,'2008-04-22 20:38:04'),(333,55,1,27,1,1,'2008-04-22 23:58:59'),(334,61,1,52,2,1,'2008-05-05 22:11:43'),(335,64,1,54,1,1,'2008-05-08 15:09:38'),(336,125,1,20,1,1,'2008-05-08 22:37:04'),(337,29,1,51,1,1,'2008-05-19 16:05:25'),(338,3,1,51,1,1,'2008-05-19 16:57:23'),(339,27,1,27,1,1,'2008-05-23 10:55:31'),(340,81,1,16,1,1,'2008-05-23 18:54:37'),(341,61,1,27,3,1,'2008-05-27 10:47:48'),(342,197,1,44,3,1,'2008-05-27 14:11:25'),(343,37,1,120,1,1,'2008-05-28 15:45:26'),(344,41,1,119,1,1,'2008-06-02 12:08:51'),(345,23,1,18,1,1,'2008-06-06 05:51:16'),(346,12,1,25,1,1,'2008-06-06 19:55:02'),(347,42,1,16,1,1,'2008-06-13 16:16:15'),(348,27,1,17,1,1,'2008-06-14 04:05:38'),(349,42,1,17,1,1,'2008-06-14 04:05:38'),(350,42,1,16,1,1,'2008-06-18 04:31:20'),(351,198,1,25,1,1,'2008-06-19 10:52:08'),(352,89,1,93,1,1,'2008-06-21 17:15:45'),(353,30,1,103,1,1,'2008-06-22 05:23:21'),(354,23,1,16,1,1,'2008-06-22 23:38:55'),(355,153,1,46,1,1,'2008-06-22 23:57:37'),(356,91,1,46,1,1,'2008-06-22 23:57:37'),(357,173,1,25,1,1,'2008-06-25 01:45:06'),(358,32,1,16,3,1,'2008-06-25 06:51:51'),(359,27,1,19,1,1,'2008-06-27 13:12:23'),(360,12,1,25,1,1,'2008-07-02 15:31:00'),(361,31,1,135,1,1,'2008-07-09 12:13:41'),(362,45,1,18,2,1,'2008-07-11 00:06:55'),(363,197,1,44,1,1,'2008-07-18 13:15:35'),(364,29,1,119,1,1,'2008-07-21 19:01:07'),(365,56,1,32,3,1,'2008-07-24 21:54:16'),(366,100,1,27,1,1,'2008-07-25 23:13:50'),(367,44,1,108,1,1,'2008-07-29 17:16:09'),(368,61,1,163,1,1,'2008-08-01 21:01:53'),(369,29,1,163,1,1,'2008-08-01 21:01:53');
/*!40000 ALTER TABLE `tag_relation` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tag_summary`
--
DROP TABLE IF EXISTS `tag_summary`;
CREATE TABLE `tag_summary` (
  `tag_id` int(11) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL default '0',
  `customers` int(11) unsigned NOT NULL default '0',
  `products` int(11) unsigned NOT NULL default '0',
  `uses` int(11) unsigned NOT NULL default '0',
  `historical_uses` int(11) unsigned NOT NULL default '0',
  `popularity` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  CONSTRAINT `tag_summary_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tag_summary`
--
LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
INSERT INTO `tag_summary` VALUES (1,0,1,1,1,1,1),(1,1,1,1,1,1,1),(2,0,1,3,4,4,4),(2,1,1,3,4,4,4),(3,0,1,2,2,2,2),(3,1,1,2,2,2,2),(4,0,1,4,7,7,7),(4,1,1,4,7,7,7),(5,0,1,4,7,7,7),(5,1,1,4,7,7,7),(6,0,1,1,1,1,1),(6,1,1,1,1,1,1),(7,0,1,2,3,3,3),(7,1,1,2,3,3,3),(8,0,1,2,4,4,4),(8,1,1,2,4,4,4),(9,0,1,1,1,1,1),(9,1,1,1,1,1,1),(10,0,1,1,1,1,1),(10,1,1,1,1,1,1),(11,0,1,2,6,6,6),(11,1,1,2,5,5,5),(11,2,1,1,1,1,1),(12,0,1,7,10,10,10),(12,1,1,6,9,9,9),(12,2,1,1,1,1,1),(13,0,1,1,2,2,2),(13,1,1,1,1,1,1),(13,2,1,1,1,1,1),(14,0,1,2,2,2,2),(14,1,1,2,2,2,2),(15,0,1,1,1,1,1),(15,1,1,1,1,1,1),(16,0,1,4,7,7,7),(16,1,1,4,6,6,6),(16,2,1,1,1,1,1),(17,0,1,5,8,8,8),(17,1,1,5,8,8,8),(18,0,1,1,1,1,1),(18,1,1,1,1,1,1),(19,0,1,1,1,1,1),(19,1,1,1,1,1,1),(20,0,1,3,3,3,3),(20,1,1,3,3,3,3),(21,0,1,1,1,1,1),(21,1,1,1,1,1,1),(22,0,1,1,1,1,1),(22,1,1,1,1,1,1),(23,0,1,7,7,7,7),(23,1,1,6,6,6,6),(23,2,1,1,1,1,1),(24,0,1,1,1,1,1),(24,2,1,1,1,1,1),(25,0,1,1,1,1,1),(25,2,1,1,1,1,1),(26,0,1,1,1,1,1),(26,1,1,1,1,1,1),(27,0,1,11,14,14,14),(27,1,1,11,14,14,14),(28,0,1,4,5,5,5),(28,1,1,4,5,5,5),(29,0,1,7,14,14,14),(29,1,1,6,12,12,12),(29,2,1,1,1,1,1),(29,3,1,1,1,1,1),(30,0,1,6,8,8,8),(30,1,1,6,7,7,7),(30,2,1,1,1,1,1),(31,0,1,1,2,2,2),(31,1,1,1,2,2,2),(32,0,1,2,2,2,2),(32,1,1,1,1,1,1),(32,3,1,1,1,1,1),(33,0,1,1,1,1,1),(33,1,1,1,1,1,1),(34,0,1,1,1,1,1),(34,1,1,1,1,1,1),(35,0,1,3,3,3,3),(35,1,1,3,3,3,3),(36,0,1,1,1,1,1),(36,1,1,1,1,1,1),(37,0,1,3,3,3,3),(37,1,1,2,2,2,2),(37,3,1,1,1,1,1),(38,0,1,1,1,1,1),(38,1,1,1,1,1,1),(39,0,1,1,1,1,1),(39,1,1,1,1,1,1),(40,0,1,1,1,1,1),(40,1,1,1,1,1,1),(41,0,1,4,4,4,4),(41,1,1,4,4,4,4),(42,0,1,4,6,6,6),(42,1,1,4,6,6,6),(43,0,1,2,2,2,2),(43,1,1,2,2,2,2),(44,0,1,2,2,2,2),(44,1,1,2,2,2,2),(45,0,1,2,3,3,3),(45,1,1,1,2,2,2),(45,2,1,1,1,1,1),(46,0,1,1,1,1,1),(46,1,1,1,1,1,1),(47,0,1,1,1,1,1),(47,1,1,1,1,1,1),(48,0,1,2,2,2,2),(48,1,1,2,2,2,2),(49,0,1,1,1,1,1),(49,1,1,1,1,1,1),(50,0,1,1,2,2,2),(50,1,1,1,2,2,2),(51,0,1,4,6,6,6),(51,1,1,3,5,5,5),(51,2,1,1,1,1,1),(52,0,1,2,2,2,2),(52,1,1,2,2,2,2),(53,0,1,1,1,1,1),(53,1,1,1,1,1,1),(54,0,1,1,1,1,1),(54,1,1,1,1,1,1),(55,0,1,3,4,4,4),(55,1,1,2,3,3,3),(55,2,1,1,1,1,1),(56,0,1,2,3,3,3),(56,1,1,2,2,2,2),(56,3,1,1,1,1,1),(57,0,1,1,1,1,1),(57,1,1,1,1,1,1),(58,0,1,1,1,1,1),(58,1,1,1,1,1,1),(59,0,1,2,2,2,2),(59,1,1,1,1,1,1),(59,2,1,1,1,1,1),(60,0,1,1,1,1,1),(60,1,1,1,1,1,1),(61,0,1,5,5,5,5),(61,1,1,3,3,3,3),(61,2,1,1,1,1,1),(61,3,1,1,1,1,1),(62,0,1,1,1,1,1),(62,1,1,1,1,1,1),(63,0,1,1,1,1,1),(63,1,1,1,1,1,1),(64,0,1,2,2,2,2),(64,1,1,2,2,2,2),(65,0,1,1,2,2,2),(65,1,1,1,2,2,2),(66,0,1,1,1,1,1),(66,1,1,1,1,1,1),(67,0,1,1,1,1,1),(67,1,1,1,1,1,1),(68,0,1,1,1,1,1),(68,1,1,1,1,1,1),(69,0,1,2,2,2,2),(69,1,1,2,2,2,2),(70,0,1,5,5,5,5),(70,1,1,4,4,4,4),(70,2,1,1,1,1,1),(71,0,1,1,1,1,1),(71,1,1,1,1,1,1),(72,0,1,1,1,1,1),(72,1,1,1,1,1,1),(73,0,1,1,1,1,1),(73,1,1,1,1,1,1),(74,0,1,1,1,1,1),(74,1,1,1,1,1,1),(75,0,1,1,1,1,1),(75,1,1,1,1,1,1),(76,0,1,2,2,2,2),(76,1,1,1,1,1,1),(76,3,1,1,1,1,1),(77,0,1,3,8,8,8),(77,1,1,3,7,7,7),(77,2,1,1,1,1,1),(78,0,1,1,1,1,1),(78,1,1,1,1,1,1),(79,0,1,2,2,2,2),(79,1,1,1,1,1,1),(79,3,1,1,1,1,1),(80,0,1,2,2,2,2),(80,1,1,2,2,2,2),(81,0,1,2,2,2,2),(81,1,1,2,2,2,2),(82,0,1,1,1,1,1),(82,1,1,1,1,1,1),(83,0,1,1,1,1,1),(83,1,1,1,1,1,1),(84,0,1,1,1,1,1),(84,1,1,1,1,1,1),(85,0,1,1,1,1,1),(85,1,1,1,1,1,1),(86,0,1,2,2,2,2),(86,1,1,1,1,1,1),(86,3,1,1,1,1,1),(87,0,1,1,1,1,1),(87,1,1,1,1,1,1),(88,0,1,1,1,1,1),(88,1,1,1,1,1,1),(89,0,1,2,2,2,2),(89,1,1,2,2,2,2),(90,0,1,1,1,1,1),(90,1,1,1,1,1,1),(91,0,1,1,2,2,2),(91,1,1,1,2,2,2),(92,0,1,1,1,1,1),(92,1,1,1,1,1,1),(93,0,1,2,2,2,2),(93,1,1,2,2,2,2),(94,0,1,1,2,2,2),(94,1,1,1,2,2,2),(95,0,1,1,1,1,1),(95,1,1,1,1,1,1),(96,0,1,1,1,1,1),(96,1,1,1,1,1,1),(97,0,1,1,1,1,1),(97,1,1,1,1,1,1),(98,0,1,1,1,1,1),(98,1,1,1,1,1,1),(99,0,1,1,1,1,1),(99,1,1,1,1,1,1),(100,0,1,2,2,2,2),(100,1,1,2,2,2,2),(101,0,1,1,1,1,1),(101,1,1,1,1,1,1),(102,0,1,2,2,2,2),(102,1,1,1,1,1,1),(102,2,1,1,1,1,1),(103,0,1,1,1,1,1),(103,2,1,1,1,1,1),(104,0,1,1,1,1,1),(104,2,1,1,1,1,1),(105,0,1,1,1,1,1),(105,1,1,1,1,1,1),(106,0,1,1,1,1,1),(106,1,1,1,1,1,1),(107,0,1,1,1,1,1),(107,1,1,1,1,1,1),(108,0,1,1,1,1,1),(108,1,1,1,1,1,1),(109,0,1,5,6,6,6),(109,1,1,4,5,5,5),(109,2,1,1,1,1,1),(110,0,1,1,1,1,1),(110,1,1,1,1,1,1),(111,0,1,1,1,1,1),(111,1,1,1,1,1,1),(112,0,1,1,1,1,1),(112,1,1,1,1,1,1),(113,0,1,1,1,1,1),(113,1,1,1,1,1,1),(114,0,1,1,1,1,1),(114,1,1,1,1,1,1),(115,0,1,1,1,1,1),(115,1,1,1,1,1,1),(116,0,1,1,1,1,1),(116,1,1,1,1,1,1),(117,0,1,1,1,1,1),(117,1,1,1,1,1,1),(118,0,1,1,1,1,1),(118,1,1,1,1,1,1),(119,0,1,1,1,1,1),(119,1,1,1,1,1,1),(120,0,1,1,1,1,1),(120,1,1,1,1,1,1),(121,0,1,1,1,1,1),(121,1,1,1,1,1,1),(122,0,1,1,1,1,1),(122,1,1,1,1,1,1),(123,0,1,1,1,1,1),(123,1,1,1,1,1,1),(124,0,1,1,1,1,1),(124,1,1,1,1,1,1),(125,0,1,1,1,2,2),(125,1,1,1,1,2,2),(126,0,1,1,1,1,1),(126,1,1,1,1,1,1),(127,0,1,1,1,1,1),(127,3,1,1,1,1,1),(128,0,1,1,1,1,1),(128,3,1,1,1,1,1),(129,0,1,2,2,2,2),(129,1,1,2,2,2,2),(130,0,1,1,1,1,1),(130,1,1,1,1,1,1),(131,0,1,1,1,1,1),(131,2,1,1,1,1,1),(132,0,1,1,1,1,1),(132,2,1,1,1,1,1),(133,0,1,1,1,1,1),(133,1,1,1,1,1,1),(134,0,1,1,1,1,1),(134,1,1,1,1,1,1),(135,0,1,1,1,1,1),(135,1,1,1,1,1,1),(136,0,1,1,1,1,1),(136,1,1,1,1,1,1),(137,0,1,1,1,1,1),(137,1,1,1,1,1,1),(138,0,1,1,1,1,1),(138,1,1,1,1,1,1),(139,0,1,1,1,1,1),(139,1,1,1,1,1,1),(140,0,1,1,1,1,1),(140,1,1,1,1,1,1),(141,0,1,1,1,1,1),(141,1,1,1,1,1,1),(142,0,1,1,1,1,1),(142,1,1,1,1,1,1),(143,0,1,1,1,1,1),(143,3,1,1,1,1,1),(144,0,1,1,1,1,1),(144,3,1,1,1,1,1),(145,0,1,1,1,1,1),(145,1,1,1,1,1,1),(146,0,1,1,1,1,1),(146,1,1,1,1,1,1),(147,0,1,1,1,1,1),(147,1,1,1,1,1,1),(148,0,0,0,0,0,0),(149,0,1,1,1,1,1),(149,1,1,1,1,1,1),(150,0,1,1,1,1,1),(150,1,1,1,1,1,1),(151,0,1,1,1,1,1),(151,3,1,1,1,1,1),(152,0,1,1,1,1,1),(152,2,1,1,1,1,1),(153,0,1,1,2,2,2),(153,1,1,1,1,1,1),(153,2,1,1,1,1,1),(154,0,1,1,1,1,1),(154,2,1,1,1,1,1),(155,0,1,1,1,1,1),(155,1,1,1,1,1,1),(156,0,1,1,1,1,1),(156,1,1,1,1,1,1),(157,0,1,1,1,1,1),(157,1,1,1,1,1,1),(158,0,1,1,1,1,1),(158,1,1,1,1,1,1),(159,0,1,1,1,1,1),(159,1,1,1,1,1,1),(160,0,1,1,1,1,1),(160,1,1,1,1,1,1),(161,0,1,1,1,1,1),(161,1,1,1,1,1,1),(162,0,1,1,1,1,1),(162,1,1,1,1,1,1),(163,0,1,1,1,1,1),(163,1,1,1,1,1,1),(164,0,1,1,1,1,1),(164,1,1,1,1,1,1),(165,0,1,1,1,1,1),(165,1,1,1,1,1,1),(166,0,1,1,1,1,1),(166,1,1,1,1,1,1),(167,0,1,1,1,1,1),(167,1,1,1,1,1,1),(168,0,1,1,1,1,1),(168,1,1,1,1,1,1),(169,0,1,1,1,1,1),(169,1,1,1,1,1,1),(170,0,1,1,1,1,1),(170,1,1,1,1,1,1),(171,0,1,1,1,1,1),(171,1,1,1,1,1,1),(172,0,1,1,1,1,1),(172,2,1,1,1,1,1),(173,0,1,4,4,4,4),(173,1,1,4,4,4,4),(174,0,1,1,1,1,1),(174,1,1,1,1,1,1),(175,0,1,1,1,1,1),(175,1,1,1,1,1,1),(176,0,1,1,1,1,1),(176,1,1,1,1,1,1),(177,0,1,1,1,1,1),(177,1,1,1,1,1,1),(178,0,1,1,1,1,1),(178,1,1,1,1,1,1),(179,0,1,1,1,1,1),(179,1,1,1,1,1,1),(180,0,1,1,1,1,1),(180,1,1,1,1,1,1),(181,0,1,1,1,1,1),(181,1,1,1,1,1,1),(182,0,1,1,1,1,1),(182,1,1,1,1,1,1),(183,0,1,1,1,1,1),(183,1,1,1,1,1,1),(184,0,1,4,4,4,4),(184,1,1,4,4,4,4),(185,0,1,1,1,1,1),(185,1,1,1,1,1,1),(186,0,1,1,1,1,1),(186,2,1,1,1,1,1),(187,0,1,1,1,1,1),(187,1,1,1,1,1,1),(188,0,1,1,1,1,1),(188,3,1,1,1,1,1),(189,0,1,1,1,1,1),(189,1,1,1,1,1,1),(190,0,1,1,1,1,1),(190,1,1,1,1,1,1),(191,0,1,1,1,1,1),(191,1,1,1,1,1,1),(192,0,1,1,1,1,1),(192,1,1,1,1,1,1),(193,0,1,1,1,1,1),(193,1,1,1,1,1,1),(194,0,1,1,1,1,1),(194,1,1,1,1,1,1),(195,0,1,2,2,2,2),(195,1,1,2,2,2,2),(196,0,1,1,1,1,1),(196,1,1,1,1,1,1),(197,0,1,1,2,2,2),(197,1,1,1,1,1,1),(197,3,1,1,1,1,1),(198,0,1,1,1,1,1),(198,1,1,1,1,1,1);
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tax_calculation`
--
DROP TABLE IF EXISTS `tax_calculation`;
CREATE TABLE `tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tax_calculation`
--
LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
INSERT INTO `tax_calculation` VALUES (1,2,3,1),(2,2,3,1),(1,1,3,2),(2,1,3,2);
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tax_calculation_rate`
--
DROP TABLE IF EXISTS `tax_calculation_rate`;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL auto_increment,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(12) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tax_calculation_rate`
--
LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1','8.2500'),(2,'US',43,'*','US-NY-*-Rate 1','8.3750');
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tax_calculation_rate_title`
--
DROP TABLE IF EXISTS `tax_calculation_rate_title`;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL auto_increment,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tax_calculation_rate_title`
--
LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tax_calculation_rule`
--
DROP TABLE IF EXISTS `tax_calculation_rule`;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL auto_increment,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY  (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tax_calculation_rule`
--
LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
INSERT INTO `tax_calculation_rule` VALUES (1,'Retail Customer-Taxable Goods-Rate 1',1,1),(2,'Retail Customer-default-Rate 1',1,1);
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tax_class`
--
DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL auto_increment,
  `class_name` varchar(255) NOT NULL default '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL default 'CUSTOMER',
  PRIMARY KEY  (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
--
-- Dumping data for table `tax_class`
--
LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'default','PRODUCT'),(2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Shipping','PRODUCT');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `weee_discount`
--
DROP TABLE IF EXISTS `weee_discount`;
CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL default '0',
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL default '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `weee_discount`
--
LOCK TABLES `weee_discount` WRITE;
/*!40000 ALTER TABLE `weee_discount` DISABLE KEYS */;
INSERT INTO `weee_discount` VALUES (16,1,0,'100.0000'),(17,1,0,'100.0000'),(18,1,0,'100.0000'),(19,1,0,'100.0000'),(20,1,0,'100.0000'),(25,1,0,'100.0000'),(26,1,0,'100.0000'),(27,1,0,'100.0000'),(28,1,0,'100.0000'),(29,1,0,'100.0000'),(30,1,0,'100.0000'),(31,1,0,'100.0000'),(32,1,0,'100.0000'),(33,1,0,'100.0000'),(34,1,0,'100.0000'),(35,1,0,'100.0000'),(36,1,0,'100.0000'),(37,1,0,'100.0000'),(38,1,0,'100.0000'),(39,1,0,'100.0000'),(41,1,0,'100.0000'),(42,1,0,'100.0000'),(44,1,0,'100.0000'),(45,1,0,'100.0000'),(46,1,0,'100.0000'),(47,1,0,'100.0000'),(48,1,0,'100.0000'),(49,1,0,'100.0000'),(51,1,0,'100.0000'),(52,1,0,'100.0000'),(53,1,0,'100.0000'),(54,1,0,'100.0000'),(74,1,0,'100.0000'),(75,1,0,'100.0000'),(79,1,0,'100.0000'),(80,1,0,'100.0000'),(81,1,0,'100.0000'),(82,1,0,'100.0000'),(83,1,0,'100.0000'),(84,1,0,'100.0000'),(85,1,0,'100.0000'),(86,1,0,'100.0000'),(87,1,0,'100.0000'),(88,1,0,'100.0000'),(89,1,0,'100.0000'),(90,1,0,'100.0000'),(91,1,0,'100.0000'),(92,1,0,'100.0000'),(93,1,0,'100.0000'),(94,1,0,'100.0000'),(95,1,0,'100.0000'),(96,1,0,'100.0000'),(97,1,0,'100.0000'),(98,1,0,'100.0000'),(99,1,0,'100.0000'),(100,1,0,'100.0000'),(101,1,0,'100.0000'),(102,1,0,'100.0000'),(103,1,0,'100.0000'),(104,1,0,'100.0000'),(105,1,0,'100.0000'),(106,1,0,'100.0000'),(107,1,0,'100.0000'),(108,1,0,'100.0000'),(109,1,0,'100.0000'),(110,1,0,'100.0000'),(111,1,0,'100.0000'),(112,1,0,'100.0000'),(113,1,0,'100.0000'),(114,1,0,'100.0000'),(115,1,0,'100.0000'),(117,1,0,'100.0000'),(118,1,0,'100.0000'),(119,1,0,'100.0000'),(120,1,0,'100.0000'),(121,1,0,'100.0000'),(122,1,0,'100.0000'),(123,1,0,'100.0000'),(124,1,0,'100.0000'),(125,1,0,'100.0000'),(126,1,0,'100.0000'),(127,1,0,'100.0000'),(128,1,0,'100.0000'),(129,1,0,'100.0000'),(130,1,0,'100.0000'),(131,1,0,'100.0000'),(132,1,0,'100.0000'),(133,1,0,'100.0000'),(134,1,0,'100.0000'),(135,1,0,'100.0000'),(137,1,0,'100.0000'),(138,1,0,'100.0000'),(139,1,0,'100.0000'),(142,1,0,'100.0000'),(144,1,0,'100.0000'),(146,1,0,'100.0000'),(158,1,0,'100.0000'),(163,1,0,'100.0000'),(164,1,0,'100.0000'),(165,1,0,'100.0000'),(16,1,1,'100.0000'),(17,1,1,'100.0000'),(18,1,1,'100.0000'),(19,1,1,'100.0000'),(20,1,1,'100.0000'),(25,1,1,'100.0000'),(26,1,1,'100.0000'),(27,1,1,'100.0000'),(28,1,1,'100.0000'),(29,1,1,'100.0000'),(30,1,1,'100.0000'),(31,1,1,'100.0000'),(32,1,1,'100.0000'),(33,1,1,'100.0000'),(34,1,1,'100.0000'),(35,1,1,'100.0000'),(36,1,1,'100.0000'),(37,1,1,'100.0000'),(38,1,1,'100.0000'),(39,1,1,'100.0000'),(41,1,1,'100.0000'),(42,1,1,'100.0000'),(44,1,1,'100.0000'),(45,1,1,'100.0000'),(46,1,1,'100.0000'),(47,1,1,'100.0000'),(48,1,1,'100.0000'),(49,1,1,'100.0000'),(51,1,1,'100.0000'),(52,1,1,'100.0000'),(53,1,1,'100.0000'),(54,1,1,'100.0000'),(74,1,1,'100.0000'),(75,1,1,'100.0000'),(79,1,1,'100.0000'),(80,1,1,'100.0000'),(81,1,1,'100.0000'),(82,1,1,'100.0000'),(83,1,1,'100.0000'),(84,1,1,'100.0000'),(85,1,1,'100.0000'),(86,1,1,'100.0000'),(87,1,1,'100.0000'),(88,1,1,'100.0000'),(89,1,1,'100.0000'),(90,1,1,'100.0000'),(91,1,1,'100.0000'),(92,1,1,'100.0000'),(93,1,1,'100.0000'),(94,1,1,'100.0000'),(95,1,1,'100.0000'),(96,1,1,'100.0000'),(97,1,1,'100.0000'),(98,1,1,'100.0000'),(99,1,1,'100.0000'),(100,1,1,'100.0000'),(101,1,1,'100.0000'),(102,1,1,'100.0000'),(103,1,1,'100.0000'),(104,1,1,'100.0000'),(105,1,1,'100.0000'),(106,1,1,'100.0000'),(107,1,1,'100.0000'),(108,1,1,'100.0000'),(109,1,1,'100.0000'),(110,1,1,'100.0000'),(111,1,1,'100.0000'),(112,1,1,'100.0000'),(113,1,1,'100.0000'),(114,1,1,'100.0000'),(115,1,1,'100.0000'),(117,1,1,'100.0000'),(118,1,1,'100.0000'),(119,1,1,'100.0000'),(120,1,1,'100.0000'),(121,1,1,'100.0000'),(122,1,1,'100.0000'),(123,1,1,'100.0000'),(124,1,1,'100.0000'),(125,1,1,'100.0000'),(126,1,1,'100.0000'),(127,1,1,'100.0000'),(128,1,1,'100.0000'),(129,1,1,'100.0000'),(130,1,1,'100.0000'),(131,1,1,'100.0000'),(132,1,1,'100.0000'),(133,1,1,'100.0000'),(134,1,1,'100.0000'),(135,1,1,'100.0000'),(137,1,1,'100.0000'),(138,1,1,'100.0000'),(139,1,1,'100.0000'),(142,1,1,'100.0000'),(144,1,1,'100.0000'),(146,1,1,'100.0000'),(158,1,1,'100.0000'),(163,1,1,'100.0000'),(164,1,1,'100.0000'),(165,1,1,'100.0000'),(16,1,2,'100.0000'),(17,1,2,'100.0000'),(18,1,2,'100.0000'),(19,1,2,'100.0000'),(20,1,2,'100.0000'),(25,1,2,'100.0000'),(26,1,2,'100.0000'),(27,1,2,'100.0000'),(28,1,2,'100.0000'),(29,1,2,'100.0000'),(30,1,2,'100.0000'),(31,1,2,'100.0000'),(32,1,2,'100.0000'),(33,1,2,'100.0000'),(34,1,2,'100.0000'),(35,1,2,'100.0000'),(36,1,2,'100.0000'),(37,1,2,'100.0000'),(38,1,2,'100.0000'),(39,1,2,'100.0000'),(41,1,2,'100.0000'),(42,1,2,'100.0000'),(44,1,2,'100.0000'),(45,1,2,'100.0000'),(46,1,2,'100.0000'),(47,1,2,'100.0000'),(48,1,2,'100.0000'),(49,1,2,'100.0000'),(51,1,2,'100.0000'),(52,1,2,'100.0000'),(53,1,2,'100.0000'),(54,1,2,'100.0000'),(74,1,2,'100.0000'),(75,1,2,'100.0000'),(79,1,2,'100.0000'),(80,1,2,'100.0000'),(81,1,2,'100.0000'),(82,1,2,'100.0000'),(83,1,2,'100.0000'),(84,1,2,'100.0000'),(85,1,2,'100.0000'),(86,1,2,'100.0000'),(87,1,2,'100.0000'),(88,1,2,'100.0000'),(89,1,2,'100.0000'),(90,1,2,'100.0000'),(91,1,2,'100.0000'),(92,1,2,'100.0000'),(93,1,2,'100.0000'),(94,1,2,'100.0000'),(95,1,2,'100.0000'),(96,1,2,'100.0000'),(97,1,2,'100.0000'),(98,1,2,'100.0000'),(99,1,2,'100.0000'),(100,1,2,'100.0000'),(101,1,2,'100.0000'),(102,1,2,'100.0000'),(103,1,2,'100.0000'),(104,1,2,'100.0000'),(105,1,2,'100.0000'),(106,1,2,'100.0000'),(107,1,2,'100.0000'),(108,1,2,'100.0000'),(109,1,2,'100.0000'),(110,1,2,'100.0000'),(111,1,2,'100.0000'),(112,1,2,'100.0000'),(113,1,2,'100.0000'),(114,1,2,'100.0000'),(115,1,2,'100.0000'),(117,1,2,'100.0000'),(118,1,2,'100.0000'),(119,1,2,'100.0000'),(120,1,2,'100.0000'),(121,1,2,'100.0000'),(122,1,2,'100.0000'),(123,1,2,'100.0000'),(124,1,2,'100.0000'),(125,1,2,'100.0000'),(126,1,2,'100.0000'),(127,1,2,'100.0000'),(128,1,2,'100.0000'),(129,1,2,'100.0000'),(130,1,2,'100.0000'),(131,1,2,'100.0000'),(132,1,2,'100.0000'),(133,1,2,'100.0000'),(134,1,2,'100.0000'),(135,1,2,'100.0000'),(137,1,2,'100.0000'),(138,1,2,'100.0000'),(139,1,2,'100.0000'),(142,1,2,'100.0000'),(144,1,2,'100.0000'),(146,1,2,'100.0000'),(158,1,2,'100.0000'),(163,1,2,'100.0000'),(164,1,2,'100.0000'),(165,1,2,'100.0000'),(29,1,3,'100.0000'),(31,1,3,'100.0000'),(32,1,3,'100.0000'),(35,1,3,'100.0000'),(36,1,3,'100.0000'),(37,1,3,'100.0000'),(38,1,3,'100.0000'),(39,1,3,'100.0000'),(45,1,3,'100.0000'),(49,1,3,'100.0000'),(74,1,3,'100.0000'),(75,1,3,'100.0000'),(79,1,3,'100.0000'),(80,1,3,'100.0000'),(81,1,3,'100.0000'),(82,1,3,'100.0000'),(83,1,3,'100.0000'),(84,1,3,'100.0000'),(85,1,3,'100.0000'),(86,1,3,'100.0000'),(87,1,3,'100.0000'),(88,1,3,'100.0000'),(89,1,3,'100.0000'),(90,1,3,'100.0000'),(91,1,3,'100.0000'),(92,1,3,'100.0000'),(103,1,3,'100.0000'),(104,1,3,'100.0000'),(105,1,3,'100.0000'),(106,1,3,'100.0000'),(107,1,3,'100.0000'),(108,1,3,'100.0000'),(109,1,3,'100.0000'),(110,1,3,'100.0000'),(111,1,3,'100.0000'),(117,1,3,'100.0000'),(118,1,3,'100.0000'),(119,1,3,'100.0000'),(120,1,3,'100.0000'),(121,1,3,'100.0000'),(122,1,3,'100.0000'),(123,1,3,'100.0000'),(124,1,3,'100.0000'),(125,1,3,'100.0000'),(126,1,3,'100.0000'),(127,1,3,'100.0000'),(128,1,3,'100.0000'),(129,1,3,'100.0000'),(130,1,3,'100.0000'),(131,1,3,'100.0000'),(132,1,3,'100.0000'),(133,1,3,'100.0000'),(134,1,3,'100.0000'),(135,1,3,'100.0000'),(137,1,3,'100.0000'),(158,1,3,'100.0000'),(163,1,3,'100.0000'),(165,1,3,'100.0000'),(16,1,4,'100.0000'),(17,1,4,'100.0000'),(18,1,4,'100.0000'),(19,1,4,'100.0000'),(20,1,4,'100.0000'),(25,1,4,'100.0000'),(26,1,4,'100.0000'),(27,1,4,'100.0000'),(28,1,4,'100.0000'),(29,1,4,'100.0000'),(30,1,4,'100.0000'),(31,1,4,'100.0000'),(32,1,4,'100.0000'),(33,1,4,'100.0000'),(34,1,4,'100.0000'),(35,1,4,'100.0000'),(36,1,4,'100.0000'),(37,1,4,'100.0000'),(38,1,4,'100.0000'),(39,1,4,'100.0000'),(41,1,4,'100.0000'),(42,1,4,'100.0000'),(44,1,4,'100.0000'),(45,1,4,'100.0000'),(46,1,4,'100.0000'),(47,1,4,'100.0000'),(48,1,4,'100.0000'),(49,1,4,'100.0000'),(51,1,4,'100.0000'),(52,1,4,'100.0000'),(53,1,4,'100.0000'),(54,1,4,'100.0000'),(74,1,4,'100.0000'),(75,1,4,'100.0000'),(79,1,4,'100.0000'),(80,1,4,'100.0000'),(81,1,4,'100.0000'),(82,1,4,'100.0000'),(83,1,4,'100.0000'),(84,1,4,'100.0000'),(85,1,4,'100.0000'),(86,1,4,'100.0000'),(87,1,4,'100.0000'),(88,1,4,'100.0000'),(89,1,4,'100.0000'),(90,1,4,'100.0000'),(91,1,4,'100.0000'),(92,1,4,'100.0000'),(93,1,4,'100.0000'),(94,1,4,'100.0000'),(95,1,4,'100.0000'),(96,1,4,'100.0000'),(97,1,4,'100.0000'),(98,1,4,'100.0000'),(99,1,4,'100.0000'),(100,1,4,'100.0000'),(101,1,4,'100.0000'),(102,1,4,'100.0000'),(103,1,4,'100.0000'),(104,1,4,'100.0000'),(105,1,4,'100.0000'),(106,1,4,'100.0000'),(107,1,4,'100.0000'),(108,1,4,'100.0000'),(109,1,4,'100.0000'),(110,1,4,'100.0000'),(111,1,4,'100.0000'),(112,1,4,'100.0000'),(113,1,4,'100.0000'),(114,1,4,'100.0000'),(115,1,4,'100.0000'),(117,1,4,'100.0000'),(118,1,4,'100.0000'),(119,1,4,'100.0000'),(120,1,4,'100.0000'),(121,1,4,'100.0000'),(122,1,4,'100.0000'),(123,1,4,'100.0000'),(124,1,4,'100.0000'),(125,1,4,'100.0000'),(126,1,4,'100.0000'),(127,1,4,'100.0000'),(128,1,4,'100.0000'),(129,1,4,'100.0000'),(130,1,4,'100.0000'),(131,1,4,'100.0000'),(132,1,4,'100.0000'),(133,1,4,'100.0000'),(134,1,4,'100.0000'),(135,1,4,'100.0000'),(137,1,4,'100.0000'),(138,1,4,'100.0000'),(139,1,4,'100.0000'),(142,1,4,'100.0000'),(144,1,4,'100.0000'),(146,1,4,'100.0000'),(158,1,4,'100.0000'),(163,1,4,'100.0000'),(164,1,4,'100.0000'),(165,1,4,'100.0000');
/*!40000 ALTER TABLE `weee_discount` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `weee_tax`
--
DROP TABLE IF EXISTS `weee_tax`;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL auto_increment,
  `website_id` smallint(5) unsigned NOT NULL default '0',
  `entity_id` int(10) unsigned NOT NULL default '0',
  `country` varchar(2) NOT NULL default '',
  `value` decimal(12,4) NOT NULL default '0.0000',
  `state` varchar(255) NOT NULL default '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `weee_tax`
--
LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `wishlist`
--
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL auto_increment,
  `customer_id` int(10) unsigned NOT NULL default '0',
  `shared` tinyint(1) unsigned default '0',
  `sharing_code` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`wishlist_id`),
  UNIQUE KEY `FK_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main';
--
-- Dumping data for table `wishlist`
--
LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `wishlist_item`
--
DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL auto_increment,
  `wishlist_id` int(10) unsigned NOT NULL default '0',
  `product_id` int(10) unsigned NOT NULL default '0',
  `store_id` smallint(5) unsigned NOT NULL,
  `added_at` datetime default NULL,
  `description` text,
  PRIMARY KEY  (`wishlist_item_id`),
  KEY `FK_ITEM_WISHLIST` (`wishlist_id`),
  KEY `FK_WISHLIST_PRODUCT` (`product_id`),
  KEY `FK_WISHLIST_STORE` (`store_id`),
  CONSTRAINT `FK_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
--
-- Dumping data for table `wishlist_item`
--
LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
