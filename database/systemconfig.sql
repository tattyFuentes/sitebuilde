# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: sitebuilde
# ------------------------------------------------------
# Server version 5.0.86-community-nt

#
# Source for table systemconfig
#

DROP TABLE IF EXISTS `systemconfig`;
CREATE TABLE `systemconfig` (
  `name` char(30) NOT NULL default '',
  `value` text,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table systemconfig
#

LOCK TABLES `systemconfig` WRITE;
/*!40000 ALTER TABLE `systemconfig` DISABLE KEYS */;
INSERT INTO `systemconfig` VALUES ('ARRANGEROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"数据整理\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"文章标题伪原创\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\"},\"row2\":{\"name\":\"文章内容伪原创\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\"},\"row3\":{\"name\":\"文章摘要伪原创\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\"},\"row4\":{\"name\":\"文章标题整理\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row5\":{\"name\":\"文章正文整理\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row6\":{\"name\":\"文章摘要整理\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row7\":{\"name\":\"文章分类整理\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row8\":{\"name\":\"文章作者整理\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}');
INSERT INTO `systemconfig` VALUES ('ARTICLEPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"文章分析\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"文章网址\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row2\":{\"name\":\"启用内容文件下载\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\",\"childs\":{\"row0\":{\"name\":\"内容文件HTML属性名\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row1\":{\"name\":\"内容文件扩展名\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row2\":{\"name\":\"下载特定网址文件\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row3\":{\"name\":\"不下载特定网址文件\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}}}');
INSERT INTO `systemconfig` VALUES ('ARTICLESPLITPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"正文分页\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"使用逻辑方式\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\",\"childs\":{\"row0\":{\"name\":\"分页网址\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row1\":{\"name\":\"起始分页\",\"value\":\"2\",\"classname\":\"TdxInspectorTextRow\"},\"row2\":{\"name\":\"结束分页\",\"value\":\"\",\"classname\":\"TdxInspectorTextRow\"},\"row3\":{\"name\":\"分页步长\",\"value\":\"1\",\"classname\":\"TdxInspectorTextRow\"},\"row4\":{\"name\":\"有效分页特征码\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}},\"row2\":{\"name\":\"使用采集方式\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\",\"childs\":{\"row0\":{\"name\":\"分页区域范围\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row1\":{\"name\":\"分页链接规则\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row2\":{\"name\":\"分页网址合成\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}}}');
INSERT INTO `systemconfig` VALUES ('CATCHITEMSPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"采集数据项\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"文章标题\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row2\":{\"name\":\"文章缩略图\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row3\":{\"name\":\"文章网址\",\"value\":\"采集\",\"classname\":\"TdxInspectorTextPickRow\",\"items\":{\"item0\":\"采集\",\"item1\":\"不采集\"}},\"row4\":{\"name\":\"文章摘要\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row5\":{\"name\":\"文章正文\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row6\":{\"name\":\"文章关键字\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row7\":{\"name\":\"文章作者\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row8\":{\"name\":\"文章分类\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row9\":{\"name\":\"文件下载\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}');
INSERT INTO `systemconfig` VALUES ('CATCHPLANPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"采集规则\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"网址需要HTTP编码\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\"},\"row2\":{\"name\":\"采集网页为压缩格式\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\"},\"row3\":{\"name\":\"网页编码\",\"value\":\"自动识别\",\"classname\":\"TdxInspectorTextPickRow\",\"items\":{\"item0\":\"自动识别\",\"item1\":\"UTF8\",\"item2\":\"非UTF8\"}},\"row4\":{\"name\":\"采集顺序\",\"value\":\"自上而下\",\"classname\":\"TdxInspectorTextPickRow\",\"items\":{\"item0\":\"自上而下\",\"item1\":\"自下而上\"}},\"row5\":{\"name\":\"访问延时\",\"value\":\"0\",\"classname\":\"TdxInspectorTextRow\"},\"row6\":{\"name\":\"采集全部\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\",\"childs\":{\"row0\":{\"name\":\"采集数量\",\"value\":\"\",\"classname\":\"TdxInspectorTextRow\"}}},\"row7\":{\"name\":\"登录Cookies设置\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}');
INSERT INTO `systemconfig` VALUES ('LIMITPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"限制条件\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"文章标题最短\",\"value\":\"3\",\"classname\":\"TdxInspectorTextRow\"},\"row2\":{\"name\":\"文章标题最长\",\"value\":\"200\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row3\":{\"name\":\"文章标题包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row4\":{\"name\":\"文章标题不包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row5\":{\"name\":\"文章正文包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row6\":{\"name\":\"文章正文不包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row7\":{\"name\":\"文章作者包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row8\":{\"name\":\"文章分类包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row9\":{\"name\":\"文章分类不包含字符\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}');
INSERT INTO `systemconfig` VALUES ('LISTPROPERTY','{\"rows\":{\"row0\":{\"name\":\"名称\",\"value\":\"列表分析\",\"classname\":\"TdxInspectorTextRow\"},\"row1\":{\"name\":\"列表网址\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row2\":{\"name\":\"启用自动列表\",\"value\":\"False\",\"classname\":\"TdxInspectorTextCheckRow\",\"childs\":{\"row0\":{\"name\":\"自动列表网址\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row1\":{\"name\":\"自动列表起始页\",\"value\":\"1\",\"classname\":\"TdxInspectorTextRow\"},\"row2\":{\"name\":\"自动列表终止页\",\"value\":\"10\",\"classname\":\"TdxInspectorTextRow\"},\"row3\":{\"name\":\"自动列表步长\",\"value\":\"1\",\"classname\":\"TdxInspectorTextRow\"}}},\"row3\":{\"name\":\"列表区域范围\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"},\"row4\":{\"name\":\"文章地址分析\",\"value\":\"\",\"classname\":\"TdxInspectorTextButtonRow\"}}}');
/*!40000 ALTER TABLE `systemconfig` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
