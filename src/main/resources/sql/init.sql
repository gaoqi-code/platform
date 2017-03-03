/*
Navicat MySQL Data Transfer

Source Server         : fiona
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : peng_cms

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-12-26 15:32:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class_first`
-- ----------------------------
DROP TABLE IF EXISTS `class_first`;
CREATE TABLE `class_first` (
  `firstclass_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `firstclass_name` varchar(200) NOT NULL,
  `sequence` int(11) NOT NULL,
  `is_effective` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '1:有效 0:虚拟 -1:无效',
  `pic` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`firstclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COMMENT='一级分类';

-- ----------------------------
-- Records of class_first
-- ----------------------------
INSERT INTO `class_first` VALUES ('1', '电视剧', '1', '1', 'http://192.168.0.85/tvimg/channel/201312/1387506008627.jpg');
INSERT INTO `class_first` VALUES ('2', '栏目', '2', '1', 'http://192.168.0.85/tvimg/channel/201312/1387506030639.jpg');
INSERT INTO `class_first` VALUES ('3', '电影', '3', '1', 'http://192.168.0.85/tvimg/channel/201312/1387520048324.jpg');
INSERT INTO `class_first` VALUES ('4', '新闻', '4', '1', 'http://192.168.0.85/tvimg/channel/201312/1387519903829.jpg');
INSERT INTO `class_first` VALUES ('5', '直播', '5', '0', '');
INSERT INTO `class_first` VALUES ('6', '3D', '6', '1', '');
INSERT INTO `class_first` VALUES ('7', '今日头条', '7', '1', '');
INSERT INTO `class_first` VALUES ('8', '娱乐', '8', '1', '');
INSERT INTO `class_first` VALUES ('9', '动漫', '9', '1', '');
INSERT INTO `class_first` VALUES ('10', '财经', '10', '1', '');
INSERT INTO `class_first` VALUES ('11', '片花', '11', '1', 'http://124.207.119.78/tvimg/jstx0000/4c5c728a-b07b-49c2-a2d2-5f1780bb7735.jpg');
INSERT INTO `class_first` VALUES ('12', '音乐', '12', '1', '');
INSERT INTO `class_first` VALUES ('13', '体育', '13', '1', '');
INSERT INTO `class_first` VALUES ('14', '旅游', '14', '1', '');
INSERT INTO `class_first` VALUES ('15', '纪录片', '15', '1', '');
INSERT INTO `class_first` VALUES ('16', '蓝光极清', '18', '1', 'http://124.207.119.78/tvimg/jstx0000/dd86c1e0-fb32-47d8-85eb-c202f8b58bbd.jpg');
INSERT INTO `class_first` VALUES ('1001', '专题', '16', '1', '');
INSERT INTO `class_first` VALUES ('1002', '演职员', '17', '1', '');

-- ----------------------------
-- Table structure for `sys_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth`;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='系统权限信息';

-- ----------------------------
-- Records of sys_auth
-- ----------------------------
#2014-3-11 初始化权限管理表数据
insert  into `sys_auth`(`auth_id`,`auth_name`,`auth_action`,`auth_seq`,`pid`,`created_time`,`updated_time`,`is_effective`) values (1,'极清运营','','1',0,'2013-05-21 13:50:05','2014-03-04 16:08:38',1),(2,'内容运营','','2',0,'2013-05-21 13:52:10','2014-03-04 16:08:52',1),(3,'权限管理','','6',0,'2013-05-21 13:52:03','2013-12-03 10:57:18',1),(7,'应用管理','','4',0,'2013-05-21 13:58:50','2013-11-28 13:26:21',1),(8,'终端管理','','4',0,'2013-05-21 14:00:33','2013-11-28 17:23:21',1),(9,'版本管理','content/client/version_list','0',0,'2013-05-21 14:00:38','2013-11-26 09:39:07',0),(10,'生产商管理','cp/show.html','0',8,'2013-05-21 14:00:44','2014-02-25 10:33:46',1),(11,'视频管理','videoSet/show.html','0',2,'2013-05-21 14:00:47','2013-11-28 16:40:50',1),(12,'频道管理','classFirst/show.html','0',2,'2013-05-21 14:00:50','2013-05-21 14:00:59',1),(13,'应用列表','app/show.html','1',7,'2013-05-21 14:01:07','2013-12-04 09:53:30',1),(14,'开发商列表','appdeveloper/show.html','3',7,'2013-05-21 13:59:12','2013-12-03 10:11:47',1),(15,'热门搜索','searchvideoset/show.html','3',1,'2013-05-21 14:00:25','2013-12-03 10:59:03',1),(16,'用户管理','sysUser/show.html','0',3,'2013-05-21 14:00:19','2013-05-21 14:00:22',1),(17,'角色管理','sysRole/show.html','0',3,'2013-05-21 14:00:13','2013-05-21 14:00:16',1),(18,'权限管理','sysAuth/show.html','0',3,'2013-05-21 14:00:08','2013-05-21 14:00:10',1),(20,'版本管理','version/show.html','3',8,'2013-07-17 11:07:22','2014-02-27 11:48:05',1),(22,'天气列表','weatherIcon/show.html','2',7,'2013-07-31 17:12:32','2013-11-28 16:39:11',1),(25,'设备管理','device/show.html','4',8,'2013-08-01 16:12:29','2014-02-27 11:48:26',1),(26,'用户统计','content/stat/$statUser','0',6,'2013-08-06 15:10:40','2013-08-06 15:10:40',1),(30,'应用类型','apptag/show.html','4',7,'2013-10-23 14:27:24','2013-12-03 14:19:58',1),(31,'类别管理','content/app/tag/category_list','0',5,'2013-10-23 14:30:30','2013-10-23 14:37:54',1),(32,'焦点图管理','hdfocus/show.html','1',1,'2013-11-25 14:26:13','2013-12-03 10:59:57',1),(33,'专题管理','hdsubject/show.html','2',1,'2013-11-25 14:31:17','2013-12-03 10:59:44',1),(34,'演职员管理','cast/show.html','0',2,'2013-11-25 14:33:17','2013-11-25 14:33:19',1),(35,'2.0运营','','2',0,'2013-12-29 15:43:00','2014-03-04 16:09:07',1),(36,'焦点图管理','focus/show.html','1',35,'2013-12-29 15:44:26','2013-12-29 15:44:26',1),(37,'专题管理','subject/show.html','1',35,'2013-12-29 15:44:56','2013-12-29 15:45:24',1),(38,'影院推荐','videosetRecom/show.html','3',35,'2013-12-30 10:07:25','2014-01-02 10:32:25',1),(39,'首屏背景','moduleskin/show.html','4',35,'2014-01-01 13:16:56','2014-01-01 13:16:56',1),(40,'清理缓存','cacheurl/show.html','5',8,'2014-01-10 13:56:46','2014-02-27 11:48:35',1),(41,'应用/游戏榜单','apptop/show.html','1',7,'2014-02-11 16:29:04','2014-02-11 16:29:04',1),(42,'应用专题','appsubject/show.html','1',7,'2014-02-11 19:31:39','2014-02-14 18:03:41',1),(43,'应用推荐','appfocus/show.html','4',35,'2014-02-13 09:42:08','2014-02-13 09:42:08',1),(44,'应用热门搜索','searchapp/show.html','5',7,'2014-02-14 15:59:05','2014-02-14 15:59:05',1),(45,'操作日志','useract/show.html','4',3,'2014-02-21 10:31:39','2014-02-21 10:31:39',1),(46,'渠道管理','cpChannel/show.html','1',8,'2014-02-25 15:34:21','2014-02-25 15:34:21',1),(47,'硬件型号管理','hardware/show.html','2',8,'2014-02-27 11:46:17','2014-03-06 16:32:09',1),(48,'电视台管理','tv/show.html','4',8,'2014-03-06 18:43:22','2014-03-06 18:45:06',1);
-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `sys_role_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL COMMENT '角色名称',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint(64) DEFAULT '0' COMMENT '创建人id 0:系统默认创建',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人id',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`sys_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统角色信息';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '2013-12-03 14:17:21', null, '0', null, '1');
INSERT INTO `sys_role` VALUES ('2', '测试角色', '2013-12-03 15:38:55', '2013-12-03 15:38:55', null, null, '1');

-- ----------------------------
-- Table structure for `sys_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_auth`;
CREATE TABLE `sys_role_auth` (
  `role_auth` bigint(64) NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(64) DEFAULT NULL COMMENT '权限id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`role_auth`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of sys_role_auth
-- ----------------------------
#2014-3-11 初始化角色管理表数据
insert  into `sys_role_auth`(`role_auth`,`auth_id`,`role_id`) values (482,1,2),(483,15,2),(484,32,2),(485,33,2),(486,2,2),(487,11,2),(488,12,2),(489,34,2),(490,3,2),(491,16,2),(492,17,2),(493,18,2),(494,8,2),(495,10,2),(496,20,2),(497,25,2),(813,1,1),(814,15,1),(815,32,1),(816,33,1),(817,2,1),(818,11,1),(819,12,1),(820,34,1),(821,48,1),(822,3,1),(823,16,1),(824,17,1),(825,18,1),(826,45,1),(827,7,1),(828,13,1),(829,14,1),(830,22,1),(831,30,1),(832,41,1),(833,42,1),(834,44,1),(835,8,1),(836,10,1),(837,20,1),(838,25,1),(839,40,1),(840,46,1),(841,47,1),(842,26,1),(843,31,1),(844,35,1),(845,36,1),(846,37,1),(847,38,1),(848,39,1),(849,43,1);

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统用户信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '家视天下', 'c4ca4238a0b923820dcc509a6f75849b', 'admin@hiveview.com', '1', '2013-12-26 15:31:25', '0', '2013-12-26 15:31:25', '4', '1');

-- ----------------------------
-- Table structure for `sys_user_session`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_session`;
CREATE TABLE `sys_user_session` (
  `session_id` varchar(64) NOT NULL COMMENT 'SESSIONID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `last_login_ip` varchar(255) DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='session表';

-- ----------------------------
-- Records of sys_user_session
-- ----------------------------
INSERT INTO `sys_user_session` VALUES ('10aj0ict2g5dr1uns0rslqr29', '7', '127.0.0.1', '2013-11-27 14:19:43');
INSERT INTO `sys_user_session` VALUES ('aaa1RFOFaNsy3f0bADAju', '4', '127.0.0.1', '2013-11-15 14:32:52');
INSERT INTO `sys_user_session` VALUES ('aaaC49zehvp4_ajif1oku', '9', '127.0.0.1', '2013-11-25 18:35:50');
INSERT INTO `sys_user_session` VALUES ('aaacqFvQqjzeY4pnC5Agu', '3', '127.0.0.1', '2013-10-09 10:24:50');
INSERT INTO `sys_user_session` VALUES ('aaaPSDJJt8nt96GtQdcju', '8', '127.0.0.1', '2013-11-18 12:17:14');
INSERT INTO `sys_user_session` VALUES ('aaaVRwZkDLfldfBcFWHku', '1', '192.168.0.120', '2013-11-29 13:24:55');
INSERT INTO `sys_user_session` VALUES ('aaazvD4ASH18ac4_X2mku', '6', '127.0.0.1', '2013-11-25 09:24:01');
