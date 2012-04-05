# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: webshuba
# ------------------------------------------------------
# Server version 5.0.86-community-nt

DROP DATABASE IF EXISTS `webshuba`;
CREATE DATABASE `webshuba` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webshuba`;

#
# Table structure for table book
#

CREATE TABLE `book` (
  `bid` int(11) NOT NULL default '0',
  `categoryid` int(11) NOT NULL default '0',
  `name` char(200) NOT NULL default '',
  `author` char(50) default NULL,
  `description` mediumtext,
  `last_modify_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `language` char(50) default NULL,
  `kindof` char(30) default NULL,
  `privacy` char(20) default NULL,
  `size` int(11) NOT NULL default '0',
  `commendclass` char(20) default NULL,
  `faceimage` varchar(254) default NULL,
  `downurl` varchar(255) default '',
  `downcount` int(11) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  KEY `index_cateid_date` (`categoryid`,`last_modify_date`),
  KEY `index_category_downcount` (`categoryid`,`downcount`),
  KEY `index_downcount` (`downcount`),
  KEY `index_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `book` VALUES (1,1,'abcd','david','然后','2009-10-01 00:02:00','中文',NULL,NULL,0,'5',NULL,'http://www.163.com',1000);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table category
#

CREATE TABLE `category` (
  `cid` int(11) NOT NULL default '0',
  `name` char(30) NOT NULL default '',
  `orders` int(11) NOT NULL default '0',
  `bookcount` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `index_orders` (`orders`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `category` VALUES (1,'穿越',11,7);
INSERT INTO `category` VALUES (2,'官场都市',2,2);
INSERT INTO `category` VALUES (3,'古典名著',3,23);
INSERT INTO `category` VALUES (4,'惊悚悬疑',4,4);
INSERT INTO `category` VALUES (5,'科幻小说',5,4);
INSERT INTO `category` VALUES (6,'历史军事',6,5);
INSERT INTO `category` VALUES (7,'名人传记',7,5);
INSERT INTO `category` VALUES (8,'武侠',8,5);
INSERT INTO `category` VALUES (9,'玄幻',9,6);
INSERT INTO `category` VALUES (10,'言情小说',1,10);
INSERT INTO `category` VALUES (11,'影视游戏',10,6);
INSERT INTO `category` VALUES (13,'西曼',12,7);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table tagbooklink
#

CREATE TABLE `tagbooklink` (
  `bid` int(11) NOT NULL default '0',
  `tid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40000 ALTER TABLE `tagbooklink` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table tags
#

CREATE TABLE `tags` (
  `tid` int(11) NOT NULL auto_increment,
  `name` char(50) NOT NULL default '',
  `bookcount` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  UNIQUE KEY `index_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
