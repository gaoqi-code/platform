-- MySQL dump 10.13  Distrib 5.5.20, for Win64 (x86)
--
-- Host: localhost    Database: hive_tv2
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `seq` int(11) NOT NULL DEFAULT '0',
  `bundle_id` varchar(300) NOT NULL DEFAULT '' COMMENT '应用的标识(唯一)',
  `app_name` varchar(255) NOT NULL,
  `app_icon` varchar(255) NOT NULL,
  `app_type` tinyint(2) NOT NULL COMMENT '0:系统应用 1:安装应用',
  `tag_name` varchar(255) NOT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:有效，0:无效',
  `developer` varchar(200) DEFAULT '',
  `developer_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `app_describe` text,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_category` (
  `category_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `seq` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_developer`
--

DROP TABLE IF EXISTS `app_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_name` varchar(255) NOT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:有效 0:无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用的开发者信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_developer`
--

LOCK TABLES `app_developer` WRITE;
/*!40000 ALTER TABLE `app_developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_operate_history`
--

DROP TABLE IF EXISTS `app_operate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_operate_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_type` tinyint(4) NOT NULL,
  `operate_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account` varchar(255) DEFAULT NULL COMMENT '操作人员的帐号',
  `app_id` int(11) NOT NULL COMMENT '操作的应用',
  `operate_record` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用操作历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_operate_history`
--

LOCK TABLES `app_operate_history` WRITE;
/*!40000 ALTER TABLE `app_operate_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_operate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_tag`
--

DROP TABLE IF EXISTS `app_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_tag` (
  `tag_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `seq` int(11) NOT NULL DEFAULT '0',
  `category_id` bigint(64) NOT NULL,
  `tag_name` varchar(64) DEFAULT NULL COMMENT '标签名称',
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:有效，0:无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用分类标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tag`
--

LOCK TABLES `app_tag` WRITE;
/*!40000 ALTER TABLE `app_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_tag_relate`
--

DROP TABLE IF EXISTS `app_tag_relate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_tag_relate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tag_relate`
--

LOCK TABLES `app_tag_relate` WRITE;
/*!40000 ALTER TABLE `app_tag_relate` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_tag_relate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `version_no` varchar(200) NOT NULL DEFAULT '',
  `app_size` varchar(500) DEFAULT NULL,
  `version_describe` text COMMENT '版本描述',
  `state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:有效 0:无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `version_url` varchar(400) DEFAULT '' COMMENT '当前版本应用的下载地址',
  `size` bigint(20) DEFAULT NULL,
  `MD5` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用的版本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_city`
--

DROP TABLE IF EXISTS `area_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_city` (
  `city_name` varchar(32) NOT NULL DEFAULT '' COMMENT '城市名称',
  `city_no` varchar(32) NOT NULL DEFAULT '' COMMENT '城市编号',
  `pro_no` varchar(32) NOT NULL DEFAULT '' COMMENT '所属省份编号',
  PRIMARY KEY (`city_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_city`
--

LOCK TABLES `area_city` WRITE;
/*!40000 ALTER TABLE `area_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_hsien`
--

DROP TABLE IF EXISTS `area_hsien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_hsien` (
  `hsien_name` varchar(32) NOT NULL DEFAULT '' COMMENT '县或区名称',
  `hsien_no` varchar(32) NOT NULL DEFAULT '' COMMENT '县或区编号',
  `city_no` varchar(32) NOT NULL DEFAULT '' COMMENT '所属城市编号',
  `pro_no` varchar(32) NOT NULL DEFAULT '' COMMENT '所属省份编号',
  PRIMARY KEY (`hsien_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_hsien`
--

LOCK TABLES `area_hsien` WRITE;
/*!40000 ALTER TABLE `area_hsien` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_hsien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_province`
--

DROP TABLE IF EXISTS `area_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_province` (
  `pro_name` varchar(32) NOT NULL DEFAULT '' COMMENT '省份名称',
  `pro_no` varchar(32) NOT NULL DEFAULT '' COMMENT '省份编号',
  PRIMARY KEY (`pro_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_province`
--

LOCK TABLES `area_province` WRITE;
/*!40000 ALTER TABLE `area_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `cast_name` varchar(100) NOT NULL,
  `cast_type` tinyint(3) NOT NULL COMMENT '1,导演;2,制片;3,主演/演唱者/主持人/配音;4,演员/MV演员/嘉宾/配音 角色;5,作词;6,作曲;7,主持人;8,嘉宾;9, 配音;10,名星;11,出品人;12,编剧',
  `cast_desc` text COMMENT '人物简介',
  `cast_picture` varchar(300) DEFAULT NULL COMMENT '人物头像',
  `cast_pyname` varchar(100) DEFAULT NULL COMMENT '人物拼音名称',
  PRIMARY KEY (`cast_id`,`cast_type`),
  KEY `cast_name_index` (`cast_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演职员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_photos`
--

DROP TABLE IF EXISTS `cast_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_desc` varchar(500) NOT NULL,
  `cast_type` tinyint(3) NOT NULL,
  `cast_id` int(11) NOT NULL,
  `photo_url` varchar(500) DEFAULT NULL COMMENT '路径',
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='演职员相册';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_photos`
--

LOCK TABLES `cast_photos` WRITE;
/*!40000 ALTER TABLE `cast_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cast_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_first`
--

DROP TABLE IF EXISTS `class_first`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_first` (
  `firstclass_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `firstclass_name` varchar(200) NOT NULL,
  `sequence` int(11) NOT NULL,
  `is_effective` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '1:有效 0:虚拟 -1:无效',
  `pic` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`firstclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一级分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_first`
--

LOCK TABLES `class_first` WRITE;
/*!40000 ALTER TABLE `class_first` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_first` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_second`
--

DROP TABLE IF EXISTS `class_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_second` (
  `secondclass_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `secondclass_name` varchar(200) NOT NULL,
  `sequence` int(11) NOT NULL,
  `firstclass_id` bigint(64) NOT NULL,
  `is_effective` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '1:有效 0:虚拟 -1:无效',
  PRIMARY KEY (`secondclass_id`,`firstclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='二级分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_second`
--

LOCK TABLES `class_second` WRITE;
/*!40000 ALTER TABLE `class_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_third`
--

DROP TABLE IF EXISTS `class_third`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_third` (
  `firstclass_id` bigint(64) NOT NULL,
  `secondclass_id` bigint(64) NOT NULL,
  `thirdclass_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `thirdclass_name` varchar(200) NOT NULL,
  `sequence` int(11) NOT NULL,
  `is_effective` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '1:有效 0:虚拟 -1:无效',
  PRIMARY KEY (`thirdclass_id`,`firstclass_id`,`secondclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三级分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_third`
--

LOCK TABLES `class_third` WRITE;
/*!40000 ALTER TABLE `class_third` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_third` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_version`
--

DROP TABLE IF EXISTS `client_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_version` (
  `cvid` bigint(64) NOT NULL AUTO_INCREMENT,
  `version` varchar(200) NOT NULL COMMENT '版本号：ep：1.0.1',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，单位是s',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '升级类型：0，部省级；1，可选升级；2，强制升级',
  `features` text NOT NULL COMMENT '版本特性描述',
  `url` varchar(400) NOT NULL COMMENT '升级地址',
  `is_effective` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用这个版本',
  `cp_channel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端版本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_version`
--

LOCK TABLES `client_version` WRITE;
/*!40000 ALTER TABLE `client_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columns`
--

DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns` (
  `column_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(300) DEFAULT '' COMMENT '名称',
  `focus` text COMMENT '一句话看点',
  `brief` text COMMENT '简介',
  `type` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总集数',
  `img` varchar(500) DEFAULT NULL COMMENT '缩略图',
  `keyword` varchar(300) DEFAULT '' COMMENT '关键字',
  `is_suetime` varchar(20) DEFAULT '' COMMENT '上映时间',
  `director` varchar(400) DEFAULT '' COMMENT '导演',
  `actors` varchar(400) DEFAULT '' COMMENT '主演、主持',
  `tag` varchar(300) DEFAULT '' COMMENT '标签 ep:综艺',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0、已下线 1 已上线 ',
  `py_name` varchar(500) DEFAULT '' COMMENT '拼音名称',
  `years` varchar(200) DEFAULT '',
  `cp` int(11) NOT NULL,
  `str_id` varchar(64) DEFAULT NULL COMMENT '专辑ID',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns`
--

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cp`
--

DROP TABLE IF EXISTS `cp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cp` (
  `cp_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `cp_name` varchar(32) DEFAULT NULL COMMENT '访问密钥',
  `cp_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'mac地址 ',
  `cp_state` tinyint(1) DEFAULT '0' COMMENT '状态 无效:0 有效:1',
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='厂商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cp`
--

LOCK TABLES `cp` WRITE;
/*!40000 ALTER TABLE `cp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cp_channel`
--

DROP TABLE IF EXISTS `cp_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cp_channel` (
  `cp_channel_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `cp_id` bigint(64) NOT NULL COMMENT '所属厂商',
  `cp_channel_name` varchar(32) DEFAULT NULL COMMENT '渠道名称',
  `cp_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'mac地址 ',
  `cp_channel_state` tinyint(1) DEFAULT '0' COMMENT '状态 无效:0 有效:1',
  `secret_key` varchar(255) NOT NULL DEFAULT '' COMMENT '密钥',
  `max_size` bigint(11) NOT NULL DEFAULT '0' COMMENT '最大数量',
  `is_check_mac` tinyint(2) NOT NULL COMMENT '是否验证mac',
  PRIMARY KEY (`cp_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cp_channel`
--

LOCK TABLES `cp_channel` WRITE;
/*!40000 ALTER TABLE `cp_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cp_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL,
  `device_mac` varchar(255) NOT NULL DEFAULT '' COMMENT 'mac地址 ',
  `device_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 无效:0 有效:1',
  `device_version` varchar(20) NOT NULL DEFAULT '' COMMENT '当前版本',
  `device_create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `device_last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登陆时间',
  `device_last_ip` varchar(100) DEFAULT '' COMMENT '最后登陆id地址',
  `cp_channel_id` bigint(64) NOT NULL COMMENT '所处渠道',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hd_focus`
--

DROP TABLE IF EXISTS `hd_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hd_focus` (
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `content_type` int(3) NOT NULL COMMENT '内容类型',
  `content_id` bigint(64) NOT NULL COMMENT '内容ID',
  `content_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `focus_large_img` varchar(255) DEFAULT '' COMMENT '大图',
  `focus_thumb_img` varchar(255) DEFAULT '' COMMENT '缩略图',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  `content_name` varchar(255) DEFAULT NULL COMMENT '内容信息',
  PRIMARY KEY (`content_type`,`content_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蓝光极清焦点图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hd_focus`
--

LOCK TABLES `hd_focus` WRITE;
/*!40000 ALTER TABLE `hd_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `hd_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hd_subject`
--

DROP TABLE IF EXISTS `hd_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hd_subject` (
  `subject_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `subject_name` varchar(200) NOT NULL COMMENT '专题名称',
  `subject_pic` varchar(255) NOT NULL COMMENT '缩略图',
  `subject_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `subject_bg_img` varchar(255) DEFAULT '' COMMENT '专题背景',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蓝光极清专题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hd_subject`
--

LOCK TABLES `hd_subject` WRITE;
/*!40000 ALTER TABLE `hd_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `hd_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hd_subject_content`
--

DROP TABLE IF EXISTS `hd_subject_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hd_subject_content` (
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `subject_id` bigint(64) NOT NULL COMMENT '专题ID',
  `content_id` bigint(64) NOT NULL,
  `content_name` varchar(200) NOT NULL COMMENT '专题名称',
  `content_img` varchar(500) DEFAULT NULL COMMENT '缩略图',
  `content_type` int(11) NOT NULL COMMENT '频道ID',
  `content_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`subject_id`,`content_id`,`content_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蓝光极清专题内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hd_subject_content`
--

LOCK TABLES `hd_subject_content` WRITE;
/*!40000 ALTER TABLE `hd_subject_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `hd_subject_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_recom`
--

DROP TABLE IF EXISTS `home_recom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_recom` (
  `position` tinyint(1) NOT NULL COMMENT '位置1:中间轮播 2:右上 3:右下左 4右下右',
  `sequence` tinyint(2) NOT NULL COMMENT ' 顺序',
  `content_id` varchar(64) NOT NULL DEFAULT '' COMMENT '内容id',
  `content_type` tinyint(1) NOT NULL COMMENT '1、电视剧 2、栏目 3、电影 4、新闻 5、直播',
  `content_focus` varchar(200) DEFAULT '' COMMENT '一句话看点',
  `img_url` varchar(500) DEFAULT '' COMMENT '图片地址',
  `version` varchar(30) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `epg_date` varchar(30) DEFAULT NULL COMMENT '直播时间点',
  PRIMARY KEY (`position`,`sequence`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首屏推荐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_recom`
--

LOCK TABLES `home_recom` WRITE;
/*!40000 ALTER TABLE `home_recom` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_recom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_videoset`
--

DROP TABLE IF EXISTS `search_videoset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_videoset` (
  `sequence` int(11) NOT NULL DEFAULT '0',
  `videoset_id` bigint(64) NOT NULL COMMENT 'id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0、已下线 1 已上线 ',
  `videoset_type` bigint(64) NOT NULL COMMENT '类型',
  `videoset_img` varchar(500) DEFAULT NULL COMMENT '缩略图地址',
  `videoset_name` varchar(300) DEFAULT NULL COMMENT '专辑名称',
  PRIMARY KEY (`videoset_id`,`videoset_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索推荐视频集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_videoset`
--

LOCK TABLES `search_videoset` WRITE;
/*!40000 ALTER TABLE `search_videoset` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_videoset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serch_videoset`
--

DROP TABLE IF EXISTS `serch_videoset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serch_videoset` (
  `sequence` int(11) NOT NULL DEFAULT '0',
  `videoset_id` bigint(64) NOT NULL COMMENT 'id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0、已下线 1 已上线 ',
  `videoset_type` bigint(64) NOT NULL COMMENT '类型',
  PRIMARY KEY (`videoset_id`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索推荐视频集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serch_videoset`
--

LOCK TABLES `serch_videoset` WRITE;
/*!40000 ALTER TABLE `serch_videoset` DISABLE KEYS */;
/*!40000 ALTER TABLE `serch_videoset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_collect_record`
--

DROP TABLE IF EXISTS `stat_collect_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_collect_record` (
  `videoset_id` bigint(64) NOT NULL COMMENT '视频集id',
  `videoset_type` bigint(1) NOT NULL COMMENT '所属频道',
  `mac` varchar(200) NOT NULL DEFAULT '' COMMENT 'mac地址',
  `device_id` varchar(200) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`videoset_id`,`device_id`,`update_time`,`mac`),
  KEY `deviece_id_index` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_collect_record`
--

LOCK TABLES `stat_collect_record` WRITE;
/*!40000 ALTER TABLE `stat_collect_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_collect_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_like_tv`
--

DROP TABLE IF EXISTS `stat_like_tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_like_tv` (
  `tv_id` varchar(200) NOT NULL COMMENT 'tvid',
  `count` bigint(64) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `device_id` varchar(255) NOT NULL DEFAULT '',
  `cp_channel_id` bigint(64) NOT NULL,
  `cp_id` bigint(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最多观看的tv统计结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_like_tv`
--

LOCK TABLES `stat_like_tv` WRITE;
/*!40000 ALTER TABLE `stat_like_tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_like_tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_play_record`
--

DROP TABLE IF EXISTS `stat_play_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_play_record` (
  `video_id` bigint(64) NOT NULL COMMENT '视频id',
  `videoset_id` bigint(64) NOT NULL COMMENT '视频集id',
  `videoset_type` int(11) NOT NULL,
  `device_id` varchar(64) NOT NULL,
  `mac` varchar(64) NOT NULL,
  `time_play` varchar(20) NOT NULL COMMENT '已看时间',
  `time_remain` varchar(20) NOT NULL COMMENT '剩余时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  `point` varchar(20) DEFAULT NULL COMMENT '时间点',
  PRIMARY KEY (`video_id`,`device_id`,`mac`),
  KEY `device_id_index` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='播放记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_play_record`
--

LOCK TABLES `stat_play_record` WRITE;
/*!40000 ALTER TABLE `stat_play_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_play_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_startup`
--

DROP TABLE IF EXISTS `stat_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_startup` (
  `device_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `version` varchar(30) NOT NULL COMMENT '版本号',
  `userlivetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户报活时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '客户端IP地址',
  `cp_channel_id` bigint(64) NOT NULL,
  `cp_id` bigint(64) NOT NULL,
  KEY `INDEX_CLIENTID_DEVICEID_USERLIVETIME` (`device_id`,`version`,`userlivetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端启动报活';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_startup`
--

LOCK TABLES `stat_startup` WRITE;
/*!40000 ALTER TABLE `stat_startup` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_user`
--

DROP TABLE IF EXISTS `stat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) NOT NULL,
  `cpId` tinyint(4) NOT NULL DEFAULT '1',
  `content` varchar(255) NOT NULL COMMENT '所有要统计的信息',
  `amount` bigint(64) DEFAULT NULL COMMENT '厂商总用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_user`
--

LOCK TABLES `stat_user` WRITE;
/*!40000 ALTER TABLE `stat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_user_month`
--

DROP TABLE IF EXISTS `stat_user_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_user_month` (
  `id` bigint(64) NOT NULL,
  `time` varchar(255) NOT NULL,
  `cpId` bigint(64) NOT NULL,
  `content` text NOT NULL,
  `amount` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_user_month`
--

LOCK TABLES `stat_user_month` WRITE;
/*!40000 ALTER TABLE `stat_user_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_user_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_video`
--

DROP TABLE IF EXISTS `sync_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_video` (
  `sequence` int(11) DEFAULT NULL,
  `video_id` varchar(250) NOT NULL COMMENT 'id',
  `videoset_id` varchar(250) NOT NULL DEFAULT '' COMMENT '父id',
  `video_name` varchar(300) DEFAULT '' COMMENT '名称',
  `video_img` varchar(500) DEFAULT NULL,
  `video_focus` varchar(300) DEFAULT '' COMMENT '一句话看点',
  `video_brief` varchar(400) DEFAULT NULL,
  `keyword` varchar(300) DEFAULT '' COMMENT '一句话看点',
  `ver_id` varchar(64) DEFAULT NULL COMMENT '码流',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  `video_type` int(11) NOT NULL,
  `cp` int(11) DEFAULT NULL,
  `phase` varchar(200) NOT NULL DEFAULT '' COMMENT '期（综艺）',
  `season` varchar(200) NOT NULL DEFAULT '' COMMENT '季（综艺）',
  `content_type` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `column_id` bigint(32) DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`video_id`,`videoset_id`),
  KEY `index_name` (`videoset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='剧集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_video`
--

LOCK TABLES `sync_video` WRITE;
/*!40000 ALTER TABLE `sync_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_video_set`
--

DROP TABLE IF EXISTS `sync_video_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_video_set` (
  `videoset_id` varchar(250) NOT NULL DEFAULT '' COMMENT '专辑ID',
  `videoset_name` varchar(300) DEFAULT '' COMMENT '名称',
  `videoset_focus` varchar(300) DEFAULT '' COMMENT '一句话看点',
  `videoset_brief` varchar(300) DEFAULT '' COMMENT '简介',
  `videoset_type` int(11) NOT NULL,
  `videoset_total` int(11) NOT NULL DEFAULT '0' COMMENT '总集数',
  `videoset_img` varchar(500) DEFAULT '' COMMENT '缩略图',
  `keyword` varchar(300) DEFAULT '' COMMENT '关键字',
  `is_suetime` varchar(20) DEFAULT '' COMMENT '上映时间',
  `director` varchar(255) DEFAULT '' COMMENT '导演',
  `actors` varchar(255) DEFAULT '' COMMENT '主演',
  `tag` varchar(300) DEFAULT '' COMMENT '标签 ep:综艺',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:待上线  1:已上线  2:待更新',
  `videosetid_source` varchar(100) DEFAULT '' COMMENT '源id',
  `py_name` varchar(500) DEFAULT '' COMMENT '拼音名称',
  `cp` int(3) DEFAULT '0' COMMENT '1:cntv 2:qiyi',
  `years` varchar(255) DEFAULT '',
  `column_id` bigint(32) DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`videoset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_video_set`
--

LOCK TABLES `sync_video_set` WRITE;
/*!40000 ALTER TABLE `sync_video_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_video_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_video_url`
--

DROP TABLE IF EXISTS `sync_video_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_video_url` (
  `video_id` varchar(250) NOT NULL COMMENT 'id',
  `video_type` int(11) NOT NULL,
  `m3u8` text,
  `mp4` text,
  `start_time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  `vid` int(11) NOT NULL DEFAULT '0' COMMENT '码流 1:300 2:600 3:800 4:1000 5:720p 6:1080P 7:极速码流',
  `cp` tinyint(4) NOT NULL,
  `column_id` bigint(32) DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`video_type`,`video_id`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频播放地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_video_url`
--

LOCK TABLES `sync_video_url` WRITE;
/*!40000 ALTER TABLE `sync_video_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_video_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth`
--

DROP TABLE IF EXISTS `sys_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_auth` (
  `auth_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(45) DEFAULT NULL COMMENT '权限名称',
  `auth_action` varchar(120) DEFAULT NULL COMMENT '权限地址',
  `auth_seq` varchar(45) DEFAULT '0' COMMENT '权限序号',
  `pid` bigint(20) DEFAULT '0',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth`
--

LOCK TABLES `sys_auth` WRITE;
/*!40000 ALTER TABLE `sys_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `sys_role_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL COMMENT '角色名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(64) DEFAULT '0' COMMENT '创建人id 0:系统默认创建',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人id',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`sys_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_auth`
--

DROP TABLE IF EXISTS `sys_role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_auth` (
  `role_auth` bigint(64) NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(64) DEFAULT NULL COMMENT '权限id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`role_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_auth`
--

LOCK TABLES `sys_role_auth` WRITE;
/*!40000 ALTER TABLE `sys_role_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `sys_user_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `user_pwd` varchar(65) DEFAULT NULL COMMENT '密码',
  `user_mail` varchar(45) DEFAULT NULL COMMENT '账号（邮箱）',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` bigint(64) DEFAULT '0' COMMENT '创建人id',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint(64) DEFAULT '0' COMMENT '更新人id',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_session`
--

DROP TABLE IF EXISTS `sys_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_session` (
  `session_id` varchar(64) NOT NULL COMMENT 'SESSIONID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `last_login_ip` varchar(255) DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_session`
--

LOCK TABLES `sys_user_session` WRITE;
/*!40000 ALTER TABLE `sys_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_version`
--

DROP TABLE IF EXISTS `sys_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_version` (
  `cvid` bigint(64) NOT NULL AUTO_INCREMENT,
  `version` varchar(200) NOT NULL COMMENT '版本号：ep：1.0.1',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，单位是s',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '升级类型：0，部省级；1，可选升级；2，强制升级',
  `features` text NOT NULL COMMENT '版本特性描述',
  `url` varchar(400) NOT NULL COMMENT '升级地址',
  `is_effective` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用这个版本',
  `cp_channel_id` bigint(20) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `MD5` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端版本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_version`
--

LOCK TABLES `sys_version` WRITE;
/*!40000 ALTER TABLE `sys_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv`
--

DROP TABLE IF EXISTS `tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `tvid` varchar(200) NOT NULL COMMENT '电视台ID',
  `tvname` varchar(200) NOT NULL DEFAULT '' COMMENT '电视台名称',
  `tvlogo` varchar(500) NOT NULL DEFAULT '' COMMENT '电视台图标地址',
  `sequence` tinyint(20) NOT NULL DEFAULT '0' COMMENT '展现的次序',
  `area_limit` tinyint(2) NOT NULL DEFAULT '1' COMMENT '地域控制：1，全部地区；2，仅大陆',
  `epg_address` varchar(500) NOT NULL DEFAULT '' COMMENT '节目单接口地址',
  `mediatype` varchar(10) NOT NULL DEFAULT '' COMMENT '电视台所属分类：1：中央电视台 2：地方卫视 3：城市电视台',
  `liveurl` varchar(500) NOT NULL DEFAULT '' COMMENT '直播的M3U8地址，类似：http://t.live.cntv.cn/20110928/tianjintv.m3u8',
  `viewback` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会看状态：1，允许回看；0，禁止回看',
  `updatedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发布状态：1，发布；0，待发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电视台信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv`
--

LOCK TABLES `tv` WRITE;
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_epg`
--

DROP TABLE IF EXISTS `tv_epg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv_epg` (
  `tvid` varchar(200) NOT NULL DEFAULT '' COMMENT '对应tv的id',
  `epg_date` varchar(200) NOT NULL DEFAULT '' COMMENT '节目单的时间2013-03-18',
  `showtime` varchar(200) NOT NULL COMMENT '显示播放时间',
  `starttime` bigint(64) NOT NULL COMMENT '回看开始时间',
  `endtime` bigint(64) NOT NULL COMMENT '回看结束时间，单位是s',
  `duration` bigint(20) DEFAULT '0' COMMENT '节目持续时长，单位是s',
  `title` varchar(300) DEFAULT '' COMMENT '节目标题',
  `columnid` varchar(200) DEFAULT '' COMMENT '栏目ID',
  `playback` varchar(400) DEFAULT '' COMMENT '直播回看地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电子节目单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_epg`
--

LOCK TABLES `tv_epg` WRITE;
/*!40000 ALTER TABLE `tv_epg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_epg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `sequence` int(11) NOT NULL DEFAULT '0',
  `video_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '剧集ID',
  `videoset_id` bigint(64) DEFAULT NULL COMMENT '专辑ID',
  `video_name` varchar(300) DEFAULT '' COMMENT '剧集名称',
  `video_img` varchar(500) DEFAULT NULL COMMENT '剧集图片',
  `video_focus` varchar(300) DEFAULT '' COMMENT '看点',
  `video_brief` varchar(400) DEFAULT NULL COMMENT '剧集描述',
  `year` int(4) DEFAULT NULL COMMENT '年份',
  `keyword` varchar(300) DEFAULT '' COMMENT '关键字',
  `ver_id` varchar(255) DEFAULT NULL,
  `video_type` int(11) NOT NULL COMMENT '所属频道',
  `phase` varchar(200) NOT NULL DEFAULT '' COMMENT '期（综艺）',
  `season` varchar(200) NOT NULL DEFAULT '' COMMENT '季（综艺）',
  `content_type` int(11) NOT NULL DEFAULT '1',
  `cp` int(11) NOT NULL DEFAULT '0' COMMENT '自有内容',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  `column_id` bigint(32) DEFAULT NULL,
  `videoid_source` varchar(100) DEFAULT '',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='剧集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_set`
--

DROP TABLE IF EXISTS `video_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_set` (
  `seq` int(11) DEFAULT '-1' COMMENT '排序',
  `time_length` int(11) DEFAULT NULL COMMENT '时长',
  `videoset_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `videoset_name` varchar(300) DEFAULT '' COMMENT '名称',
  `videoset_focus` text COMMENT '一句话看点',
  `videoset_brief` text COMMENT '简介',
  `videoset_type` int(11) NOT NULL COMMENT '频道',
  `videoset_total` int(11) NOT NULL COMMENT '总集数',
  `videoset_img` varchar(500) DEFAULT '' COMMENT '缩略图',
  `keyword` varchar(300) DEFAULT '' COMMENT '关键字',
  `is_suetime` varchar(20) DEFAULT '' COMMENT '上映时间',
  `years` varchar(200) DEFAULT '' COMMENT '年份',
  `director` varchar(400) DEFAULT '' COMMENT '导演',
  `actors` varchar(400) DEFAULT '' COMMENT '主演、主持',
  `tag` varchar(300) DEFAULT '' COMMENT '标签 ep:综艺',
  `tag_search` varchar(300) DEFAULT NULL,
  `py_name` varchar(500) DEFAULT '' COMMENT '拼音名称',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0、已下线 1 已上线 ',
  `cp` int(11) NOT NULL DEFAULT '0' COMMENT '0:自有内容 ',
  `videosetid_source` varchar(100) DEFAULT NULL COMMENT '源id',
  `column_id` bigint(32) DEFAULT NULL,
  `twodim_code` varchar(200) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`videoset_id`),
  KEY `videoset_name_index` (`videoset_name`(255)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频集';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_set`
--

LOCK TABLES `video_set` WRITE;
/*!40000 ALTER TABLE `video_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_url`
--

DROP TABLE IF EXISTS `video_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_url` (
  `video_id` int(11) NOT NULL COMMENT 'id',
  `video_type` int(11) NOT NULL COMMENT '所属频道',
  `m3u8` varchar(500) NOT NULL DEFAULT '',
  `mp4` varchar(500) NOT NULL DEFAULT '',
  `start_time` varchar(255) NOT NULL DEFAULT '' COMMENT '开始时间',
  `end_time` varchar(255) NOT NULL DEFAULT '' COMMENT '结束时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1',
  `vid` int(11) NOT NULL DEFAULT '0' COMMENT '码流 1:300 2:600 3:800 4:1000 5:720p 6:1080P 7:极速码流',
  `cp` int(11) NOT NULL DEFAULT '0' COMMENT '0：自有内容',
  `source_id` varchar(255) DEFAULT '',
  `column_id` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`video_type`,`video_id`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频播放地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_url`
--

LOCK TABLES `video_url` WRITE;
/*!40000 ALTER TABLE `video_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoset_cast`
--

DROP TABLE IF EXISTS `videoset_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoset_cast` (
  `cast_id` int(11) NOT NULL,
  `cast_type` tinyint(3) NOT NULL,
  `videoset_id` int(11) NOT NULL,
  `cast_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cast_id`,`cast_type`,`videoset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑关联演职员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoset_cast`
--

LOCK TABLES `videoset_cast` WRITE;
/*!40000 ALTER TABLE `videoset_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoset_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoset_class`
--

DROP TABLE IF EXISTS `videoset_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoset_class` (
  `sequence` int(11) NOT NULL,
  `firstclass_id` bigint(64) NOT NULL,
  `secondclass_id` bigint(64) NOT NULL,
  `thirdclass_id` bigint(64) NOT NULL,
  `videoset_id` bigint(64) NOT NULL,
  `videoset_type` int(11) NOT NULL,
  PRIMARY KEY (`sequence`,`thirdclass_id`,`videoset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频集所属分类关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoset_class`
--

LOCK TABLES `videoset_class` WRITE;
/*!40000 ALTER TABLE `videoset_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoset_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoset_recom`
--

DROP TABLE IF EXISTS `videoset_recom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoset_recom` (
  `position` int(3) NOT NULL DEFAULT '0' COMMENT '位置1:上左 2:下左 3:上右 4下右',
  `content_id` bigint(64) NOT NULL COMMENT '内容id',
  `content_type` int(11) NOT NULL,
  `content_focus` varchar(200) DEFAULT '' COMMENT '一句话看点',
  `img_url` varchar(500) NOT NULL COMMENT '图片地址',
  `version` varchar(30) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`content_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影视推荐图位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoset_recom`
--

LOCK TABLES `videoset_recom` WRITE;
/*!40000 ALTER TABLE `videoset_recom` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoset_recom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoset_related`
--

DROP TABLE IF EXISTS `videoset_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoset_related` (
  `sequence` int(11) NOT NULL COMMENT '列表中内容排序',
  `videoset_id` bigint(64) NOT NULL COMMENT '专辑ID',
  `videoset_type` bigint(64) NOT NULL DEFAULT '0' COMMENT '所属频道',
  `related_content_id` bigint(64) NOT NULL COMMENT '关联专辑ID',
  `related_content_type` bigint(64) NOT NULL DEFAULT '0' COMMENT '关联专辑频道',
  `related_type` tinyint(2) NOT NULL COMMENT '1:关联系列片 2:关联片花',
  PRIMARY KEY (`videoset_id`,`related_content_id`,`related_type`,`videoset_type`,`related_content_type`),
  KEY `sequence_index` (`sequence`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑推荐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoset_related`
--

LOCK TABLES `videoset_related` WRITE;
/*!40000 ALTER TABLE `videoset_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoset_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_icon`
--

DROP TABLE IF EXISTS `weather_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_icon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '天气名称',
  `day_icon` varchar(200) NOT NULL DEFAULT '' COMMENT '白天天气图片路径',
  `night_icon` varchar(200) NOT NULL DEFAULT '' COMMENT '晚上天气图片路径',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_icon`
--

LOCK TABLES `weather_icon` WRITE;
/*!40000 ALTER TABLE `weather_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_info`
--

DROP TABLE IF EXISTS `weather_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_info` (
  `hsien_no` varchar(32) NOT NULL DEFAULT '' COMMENT '城市（区县）编码(对应drp_city c_number 或 drp_hsien h_number)',
  `date` varchar(32) NOT NULL DEFAULT '' COMMENT '日期',
  `week_day` varchar(32) DEFAULT '' COMMENT '星期几',
  `weather` varchar(32) DEFAULT '' COMMENT '天气',
  `weather_icon_id` bigint(32) NOT NULL DEFAULT '0' COMMENT '对应天气图标ID',
  `temperature` varchar(32) DEFAULT '' COMMENT '温度',
  `wind_dir` varchar(32) DEFAULT '' COMMENT '风向',
  `wind` varchar(32) DEFAULT '' COMMENT '风力',
  `type` tinyint(4) NOT NULL COMMENT '1:白天,2:晚上',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`hsien_no`,`date`,`weather_icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_info`
--

LOCK TABLES `weather_info` WRITE;
/*!40000 ALTER TABLE `weather_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_wallpaper`
--

DROP TABLE IF EXISTS `weather_wallpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_wallpaper` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `weather_icon_id` bigint(32) NOT NULL,
  `day_wallpaper` text NOT NULL COMMENT '白天背景图片路径',
  `night_wallpaper` text NOT NULL COMMENT '晚上背景图片路径',
  `wallpaper_state` tinyint(1) NOT NULL COMMENT '状态:1有效 0无效',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `weather_icon_id` (`weather_icon_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_wallpaper`
--

LOCK TABLES `weather_wallpaper` WRITE;
/*!40000 ALTER TABLE `weather_wallpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_wallpaper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-26 10:39:10


DROP TABLE IF EXISTS `focus`;

CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:左边焦点图，2:上左，3:上右，4:中,5:下左，6:下右',
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `content_type` int(3) NOT NULL COMMENT '内容类型',
  `content_id` bigint(64) NOT NULL COMMENT '内容ID',
  `content_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `focus_large_img` varchar(255) DEFAULT '' COMMENT '大图',
  `focus_thumb_img` varchar(255) DEFAULT '' COMMENT '缩略图',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  `content_name` varchar(255) DEFAULT NULL COMMENT '内容信息',
  `cp` tinyint(4) DEFAULT NULL COMMENT '接入方',
  `cp_videoset_id` varchar(255) DEFAULT NULL COMMENT 'cp专辑ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蓝光极清焦点图';


DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `subject_name` varchar(200) NOT NULL COMMENT '专题名称',
  `subject_pic` varchar(255) NOT NULL COMMENT '缩略图',
  `subject_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `subject_bg_img` varchar(255) DEFAULT '' COMMENT '专题背景',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `img_size` varchar(255) DEFAULT '',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='蜂巢专题';

DROP TABLE IF EXISTS `subject_content`;

CREATE TABLE `subject_content` (
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `subject_id` bigint(64) NOT NULL COMMENT '专题ID',
  `content_id` bigint(64) NOT NULL,
  `content_name` varchar(200) NOT NULL COMMENT '专题名称',
  `content_img` varchar(500) DEFAULT NULL COMMENT '缩略图',
  `content_type` int(11) NOT NULL COMMENT '频道ID',
  `content_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`subject_id`,`content_id`,`content_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蜂巢专题内容';
