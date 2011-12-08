# MySQL-Front 5.1  (Build 2.7)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: sitebuilde
# ------------------------------------------------------
# Server version 5.0.22-community-nt-log

DROP DATABASE IF EXISTS `sitebuilde`;
CREATE DATABASE `sitebuilde` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sitebuilde`;

#
# Source for table category
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(50) NOT NULL default '',
  `createdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `parentid` int(11) NOT NULL default '0',
  `description` varchar(255) default NULL COMMENT '简单描述',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table category
#
LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` VALUES (1,'总方案根','2011-12-05 16:51:30',0,NULL);
INSERT INTO `category` VALUES (2,'采集方案根','2011-12-05 16:51:30',0,NULL);
INSERT INTO `category` VALUES (3,'中间方案跟','2011-12-05 16:51:30',0,NULL);
INSERT INTO `category` VALUES (4,'发布方案根','2011-12-05 16:51:30',0,NULL);
INSERT INTO `category` VALUES (5,'我的博客','2011-12-05 16:51:30',1,NULL);
INSERT INTO `category` VALUES (6,'我的论坛','2011-12-05 16:51:30',1,NULL);
INSERT INTO `category` VALUES (7,'个人博客','2011-12-05 16:51:30',2,NULL);
INSERT INTO `category` VALUES (8,'门户博客','2011-12-05 16:51:30',2,NULL);
INSERT INTO `category` VALUES (9,'门户技术论坛','2011-12-05 16:51:30',2,NULL);
INSERT INTO `category` VALUES (10,'技术博客','2011-12-05 16:51:30',7,NULL);
INSERT INTO `category` VALUES (11,'商品博客','2011-12-05 16:51:30',7,NULL);
INSERT INTO `category` VALUES (12,'test1','2011-12-05 16:51:30',10,NULL);
INSERT INTO `category` VALUES (13,'1111111','2011-12-06 14:02:46',2,'');
INSERT INTO `category` VALUES (14,'hello world','2011-10-10',1,'');
INSERT INTO `category` VALUES (15,'新组名称','2011-10-10',1,'');
INSERT INTO `category` VALUES (16,'3333333','2011-12-06 17:00:35',2,'');
INSERT INTO `category` VALUES (17,'2222222','2011-12-06 17:01:18',2,'');
INSERT INTO `category` VALUES (18,'5555555','2011-12-06 17:16:51',2,'');
INSERT INTO `category` VALUES (19,'6666666','2011-12-06 17:17:00',2,'');
INSERT INTO `category` VALUES (20,'4444444','2011-12-06 17:17:06',2,'');
INSERT INTO `category` VALUES (21,'111','2011-12-06 17:19:28',7,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table plan
#

DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(50) NOT NULL default '' COMMENT '方案名称',
  `description` varchar(255) default NULL COMMENT '简单描述',
  `categoryid` int(11) default '0' COMMENT '分类id',
  `content` text NOT NULL COMMENT 'xml格式存储',
  `createdate` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table plan
#
LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;

INSERT INTO `plan` VALUES (1,'我们的加',NULL,10,'','0000-00-00 00:00:00');
INSERT INTO `plan` VALUES (2,'plan2',NULL,10,'','0000-00-00 00:00:00');
INSERT INTO `plan` VALUES (3,'plan3',NULL,12,'','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
