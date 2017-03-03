### video_set表添加新字段
alter table video_set add column score VARCHAR(100) default NULL COMMENT '评分';
alter table video_set add column play_count int(11) default NULL COMMENT '播放次数';
alter table video_set add column is3D TINYINT(3) default 0 COMMENT '0:非3D,1:3D';
alter table video_set add column isSeries TINYINT(3) default 0 COMMENT '0:单集,1:多集';
alter table video_set add column videoset_update int(5) default 0 COMMENT '当前更新到的集数';

### 01月08日 video表添加播放时长字段
alter table video add column play_length BIGINT(10) default 60 COMMENT '时长';

### 01月10日 video表里面添加字段 
alter table video add column cp_videoset_id VARCHAR(255) default NULL COMMENT '';

### 01月13日video_set表里添加字段 
alter table video_set add column videoset_tv_img VARCHAR(255) default NULL COMMENT '竖图';

### 2014年02月08日 app表里添加字段 
alter table app add column latest_version varchar(30) default '' COMMENT '应用的最新版本';
alter table app add column py_name varchar(30) default '' COMMENT '应用的拼音名称';
alter table app add column is_pay tinyint(2) default 0 COMMENT '是否需要付费 0.免费，1.收费';
alter table app add column category_id bigint(64) default null ;

### 2014年02月10日 app表里添加字段
alter table app add column `usb_device` varchar(255) DEFAULT '' COMMENT '外接设备';
  

CREATE TABLE `app_version_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seq` tinyint(4) DEFAULT '0' COMMENT '顺序',
  `app_id` int(11) NOT NULL COMMENT '应用ID',
  `app_version_id` int(11) NOT NULL COMMENT '应用版本ID',
  `img_url` varchar(255) NOT NULL COMMENT '截图URL',
  `img_size` varchar(255) NOT NULL COMMENT '截图尺寸',
  `img_desc` varchar(255) NOT NULL COMMENT '截图描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用版本对应的截图';

CREATE TABLE `search_app` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sequence` tinyint(3) NOT NULL DEFAULT '0',
  `app_id` int(11) NOT NULL COMMENT 'id',
  `bundle_id` varchar(300) NOT NULL DEFAULT '' COMMENT '应用的标识(唯一)',
  `app_type` tinyint(2) NOT NULL COMMENT '0:系统应用 1:安装应用',
  `app_icon` varchar(300) DEFAULT NULL COMMENT '应用图标',
  `app_name` varchar(300) DEFAULT NULL COMMENT '应用名称',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_effective` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0、下线 1上线 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用热门搜索';

CREATE TABLE `app_subject` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用专题';

CREATE TABLE `app_subject_content` (
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `subject_id` bigint(64) NOT NULL COMMENT '专题ID',
  `app_id` bigint(64) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`subject_id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用专题内容';

CREATE TABLE `app_top` (
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `app_id` int(11) NOT NULL COMMENT '应用ID',
  `top_type` int(11) NOT NULL COMMENT '榜单类型：1付费榜 2热销榜 3免费榜',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`app_id`,`top_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用榜单';


CREATE TABLE `app_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` tinyint(3) DEFAULT NULL,
  `navigation_id` tinyint(3) DEFAULT 1 COMMENT '导航栏位置 1游戏 5应用 ',
  `seq` tinyint(3) NOT NULL COMMENT '顺序',
  `content_type` int(3) NOT NULL COMMENT '内容类型:应用 or 应用专题',
  `content_id` bigint(64) DEFAULT NULL COMMENT '应用ID or 应用专题ID', 
  `content_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `focus_large_img` varchar(255) DEFAULT '' COMMENT '大图',
  `focus_thumb_img` varchar(255) DEFAULT '' COMMENT '缩略图',
  `content_name` varchar(255) DEFAULT NULL COMMENT '内容信息',  
  `interval_time` int(11) DEFAULT NULL COMMENT '轮循间隔时间',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='应用首屏焦点图';




#索引 2014-02-13
ALTER TABLE video_set ADD INDEX idx_videoset_type (`videoset_type`);
ALTER TABLE video_set ADD INDEX idx_tag_search (`tag_search`);
ALTER TABLE video_set ADD INDEX idx_videoset_name (`videoset_name`);
ALTER TABLE video_set ADD INDEX idx_py_name (`py_name`);
ALTER TABLE cast  add INDEX `idx_cast_pyname` (`cast_pyname`);
ALTER TABLE video  add INDEX `idx_videoset_id` (`videoset_id`);
ALTER TABLE device  add INDEX `idx_cp_channel_id` (`cp_channel_id`);
ALTER TABLE device  add INDEX `idx_device_mac` (`device_mac`);

#索引 2014-02-25
ALTER TABLE video_set add column `data_rate` varchar(255) DEFAULT '' COMMENT '视频码流';

#状态 2014-02-25
ALTER TABLE sys_version add column `state` int(2) DEFAULT 0 COMMENT '版本状态：0,预发布;1：正式';

#device新增四个字段 2014-02-25
ALTER TABLE device add column `cp_id` int(4) NOT NULL COMMENT '生产商id';
ALTER TABLE device add column `device_sn` varchar(100) NOT NULL COMMENT '设备序列号';
ALTER TABLE device add column `rom_version` varchar(50)  COMMENT 'rom版本号';
ALTER TABLE device ADD COLUMN `hardware_id` BIGINT(64)  COMMENT '硬件型号id';

#新增运营图
ALTER TABLE class_first add column `icon` varchar(300)  COMMENT '运营图';

#系统版本和渠道关联表
CREATE TABLE `sys_version_channel`(
	`cvid` INT(11) NOT NULL COMMENT '版本id',   
	`cp_channel_id` INT(11) NOT NULL COMMENT '渠道id',    
	`version` VARCHAR(50) COMMENT '版本',   
	 PRIMARY KEY (`cvid`, `cp_channel_id`)  
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统版本和渠道关联表';

#2014-3-4 新增硬件型号表
CREATE TABLE `hardware` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `cp_id` bigint(64) NOT NULL COMMENT '生产商',
  `hardware_no` varchar(50) DEFAULT NULL COMMENT '硬件型号',
  `is_effective` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='硬件型号表';

#2014-3-4 新增设备记录
CREATE TABLE `device_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL,
  `device_sn` varchar(100) NOT NULL COMMENT '设备序列号',
  `device_mac` varchar(255) NOT NULL DEFAULT '' COMMENT 'mac地址 ',
  `device_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 未激活:0 已激活:1',
  `device_version` varchar(20) DEFAULT '' COMMENT '当前版本',
  `cp_id` bigint(64) DEFAULT NULL COMMENT '生产商id',
  `cp_name` varchar(100) DEFAULT NULL COMMENT '生产商',
  `hardware_id` bigint(64) DEFAULT NULL COMMENT '硬件型号id',
  `hardware_no` varchar(50) DEFAULT NULL COMMENT '硬件型号',
  `cp_channel_id` bigint(64) DEFAULT NULL COMMENT '所处渠道id',
  `cp_channel_name` varchar(100) DEFAULT NULL COMMENT '所处渠道',
  `rom_version` varchar(50) DEFAULT NULL COMMENT 'rom版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备记录';


#2014-03-06 创建 分公司_电视台关联表
CREATE TABLE `cp_channel_tv` (
   `cp_channel_id` int(11) NOT NULL DEFAULT '0' COMMENT '分公司id',
   `tv_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tv主键',
   `is_effective` tinyint(1) DEFAULT NULL COMMENT '状态',
   PRIMARY KEY (`cp_channel_id`,`tv_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分公司_电视台关联表';

#2014-03-06 增加分公司logo
ALTER TABLE `cp_channel` ADD COLUMN `cp_channel_logo` VARCHAR(100) NULL COMMENT '分公司logo' ;

#2014-03-07 新增系统版本更新表
CREATE TABLE `sys_version_update` (
   `id` int(11) NOT NULL COMMENT '主键',
   `cvid` int(11) NOT NULL COMMENT '版本id',
   `cp_id` int(11) NOT NULL COMMENT '厂商id',
   `cp_channel_id` int(11) NOT NULL COMMENT '渠道id',
   `version` varchar(50) DEFAULT NULL COMMENT '版本',
   `hardware_id` varchar(50) NOT NULL COMMENT '硬件型号',
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统版本更新表';

#2014-03-11 新增用户操作记录表
CREATE TABLE `user_act` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户',
  `action` varchar(255) DEFAULT NULL COMMENT '模块',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作',
  `info` varchar(255) DEFAULT NULL COMMENT '操作信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `detail_info` text COMMENT '具体信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作记录表';

#2014-03-11 新增电视台信息表
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

#2014-03-12 修改tv_epg表
ALTER TABLE `tv_epg`     ADD COLUMN `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键' FIRST,    ADD PRIMARY KEY(`id`);
ALTER TABLE `tv_epg`     CHANGE `tvid` `tv_id` INT(11) NOT NULL COMMENT '对应tv表主键';
ALTER TABLE `tv`     CHANGE `tvid` `tvno` VARCHAR(200)  NOT NULL COMMENT '电视台ID';

#2014-03-19 更新极清专辑码流
update video_set set data_rate = 20000 where videoset_type =16;
