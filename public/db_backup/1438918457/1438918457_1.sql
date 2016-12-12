-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:18
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 1


DROP TABLE IF EXISTS `%DB_PREFIX%admin`;
CREATE TABLE `%DB_PREFIX%admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_name` varchar(255) NOT NULL COMMENT '管理员用户名',
  `adm_password` varchar(255) NOT NULL COMMENT '管理员密码',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性控制',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `role_id` int(11) NOT NULL COMMENT '角色ID(权限控制用)',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_adm_name` (`adm_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';
INSERT INTO `%DB_PREFIX%admin` VALUES ('1','admin','21232f297a57a5a743894a0e4a801fc3','1','0','4','1438915717','118.119.235.36');
DROP TABLE IF EXISTS `%DB_PREFIX%adv`;
CREATE TABLE `%DB_PREFIX%adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl` varchar(255) NOT NULL COMMENT '前台使用模板名称',
  `adv_id` varchar(255) NOT NULL COMMENT '定义在模板文件里的广告位的ID名称，用于动态在模板上调用相应的广告位内容',
  `code` text NOT NULL COMMENT '用于前台展示显示的html广告内容',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性控制标识',
  `name` varchar(255) NOT NULL COMMENT '广告位名称，用于后台管理查询用',
  `city_ids` varchar(255) NOT NULL COMMENT '用于控制广告显示在哪些城市，填入城市ID,用半角逗号分隔',
  `rel_id` int(11) NOT NULL COMMENT '用于动态关联的广告定义，例如首页显示多个商品分类模块，每个分类模块下需要定义一个独立的广告，这种广告一般在商品分类，生活服务分类中单独设置，这里的rel_id指向相关的分类ID',
  `rel_table` varchar(255) NOT NULL COMMENT '同rel_id，这里填的是相关的表名，例如商城分类的推荐广告，这里填入shop_cate',
  PRIMARY KEY (`id`),
  KEY `tmpl` (`tmpl`),
  KEY `adv_id` (`adv_id`),
  KEY `city_ids` (`city_ids`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_table` (`rel_table`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='广告位表';
INSERT INTO `%DB_PREFIX%adv` VALUES ('51','fanwe','名店右侧广告','<img src=\"./public/attachment/201502/26/17/54eee2d489343.jpg\" alt=\"\" border=\"0\" />','1','首页名店右侧广告','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('50','fanwe','商城首页轮播广告2','<img src=\"./public/attachment/201502/25/11/54ed40ac7cb3a.png\" alt=\"\" border=\"0\" />','1','商城首页轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('46','fanwe','首页小轮播广告2','<img src=\"./public/attachment/201502/25/12/54ed559ba1dc1.jpg\" alt=\"\" border=\"0\" />','1','首页小轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('45','fanwe','首页小轮播广告1','<img src=\"./public/attachment/201502/25/12/54ed559176fa9.jpg\" alt=\"\" border=\"0\" />','1','首页小轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('44','fanwe','首页轮播广告2','<img src=\"./public/attachment/201502/25/11/54ed41c0e3216.png\" alt=\"\" border=\"0\" />','1','首页轮播广告2','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('49','fanwe','商城首页轮播广告1','<img src=\"./public/attachment/201502/25/11/54ed406379285.png\" alt=\"\" border=\"0\" />','1','商城首页轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('43','fanwe','首页轮播广告1','<img src=\"./public/attachment/201502/25/11/54ed41b6bfeec.png\" alt=\"\" border=\"0\" /><br />\r\n','1','首页轮播广告1','','0','');
INSERT INTO `%DB_PREFIX%adv` VALUES ('52','fanwe','优惠右侧广告','<img src=\"./public/attachment/201502/26/17/54eee2f10078a.jpg\" alt=\"\" border=\"0\" />','1','首页优惠右侧广告','','0','');
DROP TABLE IF EXISTS `%DB_PREFIX%api_log`;
CREATE TABLE `%DB_PREFIX%api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(30) NOT NULL,
  `api` text NOT NULL,
  `param_json` text NOT NULL,
  `param_array` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='移动端的调试日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%api_login`;
CREATE TABLE `%DB_PREFIX%api_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '第三方登录名称',
  `config` text NOT NULL COMMENT '序列化后的配置信息',
  `class_name` varchar(255) NOT NULL COMMENT '接口类名',
  `icon` varchar(255) NOT NULL COMMENT '登录用小图标显示',
  `is_weibo` tinyint(1) NOT NULL COMMENT '是否微博接口，该接口标识可以同步信息到第三方的微博平台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='第三方登录接口的安装表(新浪微博，QQ微博等)';
INSERT INTO `%DB_PREFIX%api_login` VALUES ('11','新浪微博api登录接口','a:3:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";s:7:\"app_url\";s:0:\"\";}','Sina','./public/attachment/201502/26/15/54eec93746fa2.gif','1');
INSERT INTO `%DB_PREFIX%api_login` VALUES ('12','QQv2登录插件','a:2:{s:7:\"app_key\";s:8:\"11111111\";s:10:\"app_secret\";s:12:\"111111111111\";}','Qqv2','./public/attachment/201502/26/15/54eec928c2e12.gif','0');
INSERT INTO `%DB_PREFIX%api_login` VALUES ('13','腾讯微博登录插件','a:3:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";s:7:\"app_url\";s:0:\"\";}','Tencent','./public/attachment/201502/26/15/54eec93f862a1.gif','1');
DROP TABLE IF EXISTS `%DB_PREFIX%apns_device_history`;
CREATE TABLE `%DB_PREFIX%apns_device_history` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `archived` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `appname` (`appname`),
  KEY `appversion` (`appversion`),
  KEY `deviceuid` (`deviceuid`),
  KEY `archived` (`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='弃用';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_devices`;
CREATE TABLE `%DB_PREFIX%apns_devices` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `appname` (`appname`,`appversion`,`deviceuid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ios推送设备列表';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_logs`;
CREATE TABLE `%DB_PREFIX%apns_logs` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` varchar(64) NOT NULL COMMENT '客户ID(会员ID)可为0(未登录的手机端用户)',
  `fk_device` int(9) unsigned NOT NULL COMMENT '客户端信息',
  `message` varchar(255) NOT NULL COMMENT '内容',
  `delivery` datetime NOT NULL COMMENT '返回的发送时间',
  `status` enum('queued','delivered','failed') CHARACTER SET latin1 NOT NULL DEFAULT 'queued' COMMENT '是否已发送',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT '系统内生成的发送时间',
  `modified` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `message_id` int(11) NOT NULL COMMENT '消息ID',
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `fk_device` (`fk_device`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`),
  KEY `message` (`message`),
  KEY `delivery` (`delivery`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='APN推送日志表';
DROP TABLE IF EXISTS `%DB_PREFIX%apns_messages`;
CREATE TABLE `%DB_PREFIX%apns_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '群发内容',
  `send_time` int(11) NOT NULL COMMENT '预设发送时间',
  `user_names` text NOT NULL COMMENT '用户名(用于配匹设备号，逗号分开，如填写的用户未用ios设备登录过，无法发出，不填写为全部发送)',
  `status` tinyint(1) NOT NULL COMMENT '0:未发送 1:发送中 2:已发送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ANPS群发推送消息';
DROP TABLE IF EXISTS `%DB_PREFIX%area`;
CREATE TABLE `%DB_PREFIX%area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `city_id` int(11) NOT NULL COMMENT '所属的城市 ',
  `sort` int(11) NOT NULL COMMENT '排序，前台展示的排序，由大到小',
  `pid` int(11) NOT NULL COMMENT '有pid表示为一级地区（行政区），有值为商圈（二级地区）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='地区商圈表';
INSERT INTO `%DB_PREFIX%area` VALUES ('8','鼓楼区','15','1','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('9','晋安区','15','2','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('10','台江区','15','3','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('11','仓山区','15','4','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('12','马尾区','15','5','0');
INSERT INTO `%DB_PREFIX%area` VALUES ('13','五一广场','15','6','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('14','东街口','15','7','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('15','福州广场','15','8','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('16','省体育中心','15','9','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('17','西禅寺','15','10','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('18','社会主义学院','15','11','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('19','西洪路','15','12','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('20','屏山','15','13','8');
INSERT INTO `%DB_PREFIX%area` VALUES ('21','中亭街','15','14','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('22','六一中路','15','15','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('23','龙华大厦','15','16','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('24','时代名城','15','17','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('25','台江路','15','18','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('26','宝龙城市广场','15','19','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('27','万象城','15','20','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('28','桥亭','15','21','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('29','小桥头','15','22','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('30','交通路','15','23','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('31','中亭街','15','24','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('32','白马河','15','25','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('33','博美诗邦','15','26','10');
INSERT INTO `%DB_PREFIX%area` VALUES ('34','观海路','15','27','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('35','三叉街新村','15','28','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('36','北京金山','15','29','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('37','仓山镇','15','30','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('38','螺洲','15','31','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('39','三高路','15','32','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('40','下渡','15','33','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('41','工农路','15','34','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('42','首山路','15','35','11');
INSERT INTO `%DB_PREFIX%area` VALUES ('43','王庄新村','15','36','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('44','岳峰路','15','37','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('45','融侨东区','15','38','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('46','五里亭','15','39','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('47','五一新村','15','40','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('48','福光路','15','41','9');
INSERT INTO `%DB_PREFIX%area` VALUES ('49','五里亭','15','42','9');
DROP TABLE IF EXISTS `%DB_PREFIX%article`;
CREATE TABLE `%DB_PREFIX%article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `cate_id` int(11) NOT NULL COMMENT '文章分类ID',
  `create_time` int(11) NOT NULL COMMENT '发表时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `add_admin_id` int(11) NOT NULL COMMENT '发布人(管理员ID)',
  `is_effect` tinyint(4) NOT NULL COMMENT '有效性标识',
  `rel_url` varchar(255) NOT NULL COMMENT '自动跳转的外链',
  `update_admin_id` int(11) NOT NULL COMMENT '更新人(管理员ID)',
  `is_delete` tinyint(4) NOT NULL COMMENT '删除标识',
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `sort` int(11) NOT NULL COMMENT '排序 由大到小',
  `seo_title` text NOT NULL COMMENT '自定义seo页面标题',
  `seo_keyword` text NOT NULL COMMENT '自定义seo页面keyword',
  `seo_description` text NOT NULL COMMENT '自定义seo页面标述',
  `uname` varchar(255) NOT NULL,
  `notice_page` tinyint(1) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `click_count` (`click_count`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='文章展示';
INSERT INTO `%DB_PREFIX%article` VALUES ('20','关于我们','关于我们','11','0','1305160934','0','1','','0','0','18','11','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('46','泰宁大金湖','','22','1424828134','1424828158','0','1','u:index|deal|act=65','0','0','0','25','','','','','1','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('47','男士棉服','<img border=\"0\" alt=\"\" src=\"./public/attachment/201507/21/02/55ad40e39982b.jpg\" /><img border=\"0\" alt=\"\" src=\"./public/attachment/201507/21/02/55ad3c6914c28.jpg\" />','18','1424828200','1437388904','0','1','u:index|deal|act=64','0','0','0','26','','','','','2','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('27','免责条款','免责条款','19','1305160898','1305160898','0','1','','0','0','3','18','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('28','隐私保护','隐私保护','7','1305160911','1424803882','0','1','','0','0','4','19','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('29','咨询热点','咨询热点','10','1305160923','1424803868','0','1','','0','0','2','20','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('30','联系我们','联系我们','11','1305160934','1424803859','0','1','','0','0','30','21','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('31','公司简介','公司简介','11','1305160946','1424803850','0','1','','0','0','92','22','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('5','如何抽奖','如何抽奖','7','0','1424803982','0','1','','0','0','3','0','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('6','加入我们','加入我们','11','0','1324319464','0','1','u:index|user#register','0','0','22','2','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('44','RSS订阅','','9','1424804133','1424804133','0','1','u:index|rss','0','0','0','23','','','','','0','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('45','百度烤肉','','22','1424825968','1424828086','0','1','u:index|deal|act=70','0','0','0','24','','','','','1','','');
INSERT INTO `%DB_PREFIX%article` VALUES ('10','友情链接','','10','0','1424804032','0','1','u:index|link','0','0','0','6','','','','','0','','');
DROP TABLE IF EXISTS `%DB_PREFIX%article_cate`;
CREATE TABLE `%DB_PREFIX%article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` varchar(255) NOT NULL COMMENT '分类简介(备用字段)',
  `pid` int(11) NOT NULL COMMENT '父ID，程序分类可分二级',
  `is_effect` tinyint(4) NOT NULL COMMENT '有效性标识',
  `is_delete` tinyint(4) NOT NULL COMMENT '删除标识',
  `type_id` tinyint(1) NOT NULL COMMENT '类型\r\n0:普通文章（可通前台分类列表查找到）\r\n1.帮助文章（用于前台页面底部的站点帮助）\r\n2.公告文章（用于前台页面公告模块的调用）\r\n3.系统文章（自定义的一些文章，需要前台自定义一些入口链接到该文章）\r\n所属该分类的所有文章类型与分类一致',
  `sort` int(11) NOT NULL,
  `iconfont` varchar(15) NOT NULL COMMENT '针对帮助文档分类的图标',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type_id` (`type_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('11','公司信息','','0','1','0','1','4','&#58899;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('10','商务合作','','0','1','0','1','2','&#58891;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('9','获取更新','','0','1','0','1','3','&#58898;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('7','用户帮助','','0','1','0','1','1','&#58897;');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('18','商城公告','','0','1','0','2','5','');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('19','系统文章','','0','1','0','3','6','');
INSERT INTO `%DB_PREFIX%article_cate` VALUES ('22','热门推荐','','0','1','0','2','7','');
DROP TABLE IF EXISTS `%DB_PREFIX%attr_stock`;
CREATE TABLE `%DB_PREFIX%attr_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `attr_cfg` text NOT NULL COMMENT '序列化的多维属性配置数据（包含属性ID，属性值）',
  `stock_cfg` int(11) NOT NULL COMMENT '该属性组合的库存数',
  `attr_str` text NOT NULL COMMENT '字符串展示的属性组合',
  `buy_count` int(11) NOT NULL COMMENT '当前属性组合的已卖的量，用于库存验证',
  `attr_key` varchar(100) NOT NULL COMMENT '属性ID以下划线从小到大排序的key',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='规格属性库存表，用于多属性，多套餐商品的多库存定义';
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('121','57','a:2:{i:17;s:11:\"18点以后\";i:18;s:12:\"2-5人套餐\";}','2','18点以后2-5人套餐','2','256_258');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('139','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"小码\";}','500','黑色小码','1','270_273');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('138','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"大码\";}','400','黑色大码','0','270_272');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('137','64','a:2:{i:19;s:6:\"黑色\";i:20;s:6:\"均码\";}','300','黑色均码','0','270_271');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('136','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"小码\";}','200','棕色小码','0','269_273');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('134','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"均码\";}','100','棕色均码','0','269_271');
INSERT INTO `%DB_PREFIX%attr_stock` VALUES ('135','64','a:2:{i:19;s:6:\"棕色\";i:20;s:6:\"大码\";}','0','棕色大码','0','269_272');
DROP TABLE IF EXISTS `%DB_PREFIX%auto_cache`;
CREATE TABLE `%DB_PREFIX%auto_cache` (
  `cache_key` varchar(100) NOT NULL COMMENT '程序中识别的缓存唯一ID',
  `cache_type` varchar(100) NOT NULL COMMENT '缓存接口类型',
  `cache_data` text NOT NULL COMMENT '缓存值',
  `cache_time` int(11) NOT NULL COMMENT '缓存时间',
  PRIMARY KEY (`cache_key`,`cache_type`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_key` (`cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='程序内置自动缓存引擎的配套数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%brand`;
CREATE TABLE `%DB_PREFIX%brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '品牌名称',
  `logo` varchar(255) NOT NULL COMMENT '品牌logo',
  `brand_promote_logo` varchar(255) NOT NULL COMMENT '用于限时促销模块展示的品牌促销图片',
  `brief` text NOT NULL COMMENT '品牌简介',
  `sort` int(11) NOT NULL COMMENT '排序(由大到小)',
  `shop_cate_id` int(11) NOT NULL COMMENT '所属的商品分类，用于前台分类展示用',
  `brand_promote` tinyint(1) NOT NULL COMMENT '是否参与品牌限时促销的标识',
  `begin_time` int(11) NOT NULL COMMENT '限时促销开始时间',
  `end_time` int(11) NOT NULL COMMENT '限时促销结束时间',
  `time_status` tinyint(1) NOT NULL COMMENT '0:已上线 1:未上线 2:已过期',
  `dy_count` int(11) DEFAULT '0' COMMENT '品牌订阅数量',
  `tag` text NOT NULL COMMENT '检索标签',
  `tag_match` text NOT NULL,
  `tag_match_row` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cate_id` (`shop_cate_id`),
  FULLTEXT KEY `tag_match` (`tag_match`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品品牌配置表';
INSERT INTO `%DB_PREFIX%brand` VALUES ('13','七匹狼','','','','1','31','0','0','0','0','0','男装 服装','ux30007ux35013,ux26381ux35013','男装,服装');
INSERT INTO `%DB_PREFIX%brand` VALUES ('14','耐克','','','','2','25','0','0','0','0','0','男装 鞋帽','ux30007ux35013,ux38795ux24125','男装,鞋帽');
INSERT INTO `%DB_PREFIX%brand` VALUES ('15','阿迪达斯','','','','3','24','0','0','0','0','0','服装 男装 女装 鞋帽','ux26381ux35013,ux30007ux35013,ux22899ux35013,ux38795ux24125,ux23478ux23621ux26381,ux27611ux34915','服装,男装,女装,鞋帽,家居服,毛衣');
INSERT INTO `%DB_PREFIX%brand` VALUES ('16','龙中龙','','','','4','31','0','0','0','0','0','男装 服装','ux30007ux35013,ux26381ux35013','男装,服装');
DROP TABLE IF EXISTS `%DB_PREFIX%brand_dy`;
CREATE TABLE `%DB_PREFIX%brand_dy` (
  `uid` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='移动端品牌订阅功能的数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%conf`;
CREATE TABLE `%DB_PREFIX%conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `input_type` tinyint(1) NOT NULL COMMENT '配置输入的类型 0:文本输入 1:下拉框输入 2:图片上传 3:编辑器',
  `value_scope` text NOT NULL COMMENT '取值范围',
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '是否可配置 0: 可配置  1:不可配置',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='系统配置表';
INSERT INTO `%DB_PREFIX%conf` VALUES ('1','DEFAULT_ADMIN','admin','1','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('2','URL_MODEL','0','1','1','0,1','1','1','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('4','TIME_ZONE','8','1','1','0,8','1','1','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('5','ADMIN_LOG','1','1','1','0,1','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('6','DB_VERSION','3.05','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('7','DB_VOL_MAXSIZE','8000000','1','0','','1','1','11');
INSERT INTO `%DB_PREFIX%conf` VALUES ('8','WATER_MARK','./public/attachment/201011/4cdde85a27105.gif','2','2','','1','1','48');
INSERT INTO `%DB_PREFIX%conf` VALUES ('24','CURRENCY_UNIT','&yen;','3','0','','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('10','BIG_WIDTH','500','2','0','','0','0','49');
INSERT INTO `%DB_PREFIX%conf` VALUES ('11','BIG_HEIGHT','500','2','0','','0','0','50');
INSERT INTO `%DB_PREFIX%conf` VALUES ('12','SMALL_WIDTH','200','2','0','','0','0','51');
INSERT INTO `%DB_PREFIX%conf` VALUES ('13','SMALL_HEIGHT','200','2','0','','0','0','52');
INSERT INTO `%DB_PREFIX%conf` VALUES ('14','WATER_ALPHA','75','2','0','','1','1','53');
INSERT INTO `%DB_PREFIX%conf` VALUES ('15','WATER_POSITION','4','2','1','1,2,3,4,5','1','1','54');
INSERT INTO `%DB_PREFIX%conf` VALUES ('16','MAX_IMAGE_SIZE','3000000','2','0','','1','1','55');
INSERT INTO `%DB_PREFIX%conf` VALUES ('18','MAX_FILE_SIZE','1','1','0','','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('19','ALLOW_FILE_EXT','1','1','0','','0','1','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('20','BG_COLOR','#ffffff','2','0','','0','0','57');
INSERT INTO `%DB_PREFIX%conf` VALUES ('21','IS_WATER_MARK','1','2','1','0,1','1','1','58');
INSERT INTO `%DB_PREFIX%conf` VALUES ('22','TEMPLATE','fanwe','3','0','','1','1','17');
INSERT INTO `%DB_PREFIX%conf` VALUES ('126','YOUHUI_SEND_LIMIT','5','5','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('25','SCORE_UNIT','积分','3','0','','1','0','22');
INSERT INTO `%DB_PREFIX%conf` VALUES ('26','USER_VERIFY','1','4','1','0,1','1','0','63');
INSERT INTO `%DB_PREFIX%conf` VALUES ('27','SHOP_LOGO','./public/attachment/201011/4cdd501dc023b.png','3','2','','1','1','19');
INSERT INTO `%DB_PREFIX%conf` VALUES ('28','SHOP_LANG','zh-cn','3','1','zh-cn','1','0','18');
INSERT INTO `%DB_PREFIX%conf` VALUES ('29','SHOP_TITLE','o2o商业系统3.05.4116','3','0','','1','1','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('30','SHOP_KEYWORD','方维o2o商业系统关键词','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('31','SHOP_DESCRIPTION','方维o2o商业系统描述','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('32','SHOP_TEL','400-800-8888','3','0','','1','1','23');
INSERT INTO `%DB_PREFIX%conf` VALUES ('33','SIDE_DEAL_COUNT','3','3','0','','1','1','29');
INSERT INTO `%DB_PREFIX%conf` VALUES ('34','SIDE_MESSAGE_COUNT','3','3','0','','1','0','30');
INSERT INTO `%DB_PREFIX%conf` VALUES ('35','INVITE_REFERRALS','20','4','0','','1','1','67');
INSERT INTO `%DB_PREFIX%conf` VALUES ('36','INVITE_REFERRALS_TYPE','0','4','1','0,1','1','1','68');
INSERT INTO `%DB_PREFIX%conf` VALUES ('38','ONLINE_QQ','88888888|9999999','3','0','','1','1','25');
INSERT INTO `%DB_PREFIX%conf` VALUES ('39','ONLINE_TIME','周一至周六 9:00-18:00','3','0','','1','1','26');
INSERT INTO `%DB_PREFIX%conf` VALUES ('40','DEAL_PAGE_SIZE','12','3','0','','1','1','31');
INSERT INTO `%DB_PREFIX%conf` VALUES ('41','PAGE_SIZE','24','3','0','','1','1','32');
INSERT INTO `%DB_PREFIX%conf` VALUES ('42','HELP_CATE_LIMIT','4','3','0','','1','1','34');
INSERT INTO `%DB_PREFIX%conf` VALUES ('43','HELP_ITEM_LIMIT','4','3','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('44','SHOP_FOOTER','<div style=\"text-align:center;\">[方维o2o商业系统] <a href=\"http://www.fanwe.com/\" target=\"_blank\">http://www.fanwe.com</a><br />\r\n</div>','3','3','','1','1','37');
INSERT INTO `%DB_PREFIX%conf` VALUES ('45','USER_MESSAGE_AUTO_EFFECT','1','4','1','0,1','1','0','64');
INSERT INTO `%DB_PREFIX%conf` VALUES ('48','MAIL_SEND_COUPON','0','5','1','0,1','1','1','73');
INSERT INTO `%DB_PREFIX%conf` VALUES ('49','SMS_SEND_COUPON','0','5','1','0,1','1','1','79');
INSERT INTO `%DB_PREFIX%conf` VALUES ('50','MAIL_SEND_PAYMENT','0','5','1','0,1','1','1','75');
INSERT INTO `%DB_PREFIX%conf` VALUES ('51','SMS_SEND_PAYMENT','0','5','1','0,1','1','1','81');
INSERT INTO `%DB_PREFIX%conf` VALUES ('62','REPLY_ADDRESS','info@fanwe.com','5','0','','1','1','77');
INSERT INTO `%DB_PREFIX%conf` VALUES ('54','MAIL_SEND_DELIVERY','0','5','1','0,1','1','1','76');
INSERT INTO `%DB_PREFIX%conf` VALUES ('55','SMS_SEND_DELIVERY','0','5','1','0,1','1','1','82');
INSERT INTO `%DB_PREFIX%conf` VALUES ('56','MAIL_ON','1','5','1','0,1','1','1','72');
INSERT INTO `%DB_PREFIX%conf` VALUES ('57','SMS_ON','0','5','1','0,1','1','1','78');
INSERT INTO `%DB_PREFIX%conf` VALUES ('58','REFERRAL_LIMIT','1','4','0','','1','1','69');
INSERT INTO `%DB_PREFIX%conf` VALUES ('59','SMS_COUPON_LIMIT','3','5','0','','1','1','80');
INSERT INTO `%DB_PREFIX%conf` VALUES ('60','MAIL_COUPON_LIMIT','3','5','0','','1','1','74');
INSERT INTO `%DB_PREFIX%conf` VALUES ('61','COUPON_NAME','方维券','3','0','','1','1','16');
INSERT INTO `%DB_PREFIX%conf` VALUES ('63','BATCH_PAGE_SIZE','500','3','0','','1','0','33');
INSERT INTO `%DB_PREFIX%conf` VALUES ('64','COUPON_PRINT_TPL','<div style=\"border:1px solid #000000;padding:10px;margin:0px auto;width:600px;font-size:14px;\"><table class=\"dataEdit\" cellpadding=\"0\" cellspacing=\"0\">	<tbody><tr>    <td width=\"400\">    	<img src=\"./public/attachment/201011/4cdd505195d40.gif\" alt=\"\" border=\"0\" />     </td>\r\n  <td style=\"font-weight:bolder;font-size:22px;font-family:verdana;\" width=\"43%\">    序列号：{$bond.sn}<br />\r\n    密码：{$bond.password}    </td>\r\n</tr>\r\n<tr><td colspan=\"2\" height=\"1\">  <div style=\"width:100%;border-bottom:1px solid #000000;\">&nbsp;</div>\r\n  </td>\r\n</tr>\r\n<tr><td colspan=\"2\" height=\"8\"><br />\r\n</td>\r\n</tr>\r\n<tr><td style=\"font-weight:bolder;font-size:28px;height:50px;padding:5px;font-family:微软雅黑;\" colspan=\"2\">{$bond.name}</td>\r\n</tr>\r\n<tr><td style=\"line-height:22px;padding-right:20px;\" width=\"400\">{$bond.user_name}<br />\r\n  生效时间:{$bond.begin_time_format}<br />\r\n  过期时间:{$bond.end_time_format}<br />\r\n  商家电话：<br />\r\n  {$bond.tel}<br />\r\n  商家地址:<br />\r\n  {$bond.address}<br />\r\n  交通路线:<br />\r\n  {$bond.route}<br />\r\n  营业时间：<br />\r\n  {$bond.open_time}<br />\r\n  </td>\r\n  <td><div id=\"map_canvas\" style=\"width:255px;height:255px;\"></div>\r\n  <br />\r\n  </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n','3','3','','1','0','40');
INSERT INTO `%DB_PREFIX%conf` VALUES ('65','PUBLIC_DOMAIN_ROOT','','2','0','','1','0','59');
INSERT INTO `%DB_PREFIX%conf` VALUES ('66','SHOW_DEAL_CATE','1','3','1','0,1','1','0','41');
INSERT INTO `%DB_PREFIX%conf` VALUES ('67','REFERRAL_IP_LIMIT','0','4','1','0,1','1','1','71');
INSERT INTO `%DB_PREFIX%conf` VALUES ('69','CART_ON','1','3','1','0,1','1','1','42');
INSERT INTO `%DB_PREFIX%conf` VALUES ('70','REFERRALS_DELAY','1','4','0','','1','1','70');
INSERT INTO `%DB_PREFIX%conf` VALUES ('71','SUBMIT_DELAY','5','1','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('72','APP_MSG_SENDER_OPEN','1','1','1','0,1','1','1','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('73','ADMIN_MSG_SENDER_OPEN','1','1','1','0,1','1','1','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('74','SHOP_OPEN','1','3','1','0,1','1','1','46');
INSERT INTO `%DB_PREFIX%conf` VALUES ('75','SHOP_CLOSE_HTML','','3','3','','1','1','47');
INSERT INTO `%DB_PREFIX%conf` VALUES ('76','FOOTER_LOGO','./public/attachment/201011/4cdd50ed013ec.png','3','2','','1','1','20');
INSERT INTO `%DB_PREFIX%conf` VALUES ('77','GZIP_ON','0','1','1','0,1','1','1','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('78','INTEGRATE_CODE','','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('79','INTEGRATE_CFG','','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('80','SHOP_SEO_TITLE','方维o2o商业系统,国内最优秀的PHP开源o2o系统','3','0','','1','1','14');
INSERT INTO `%DB_PREFIX%conf` VALUES ('81','CACHE_ON','1','1','1','0,1','1','0','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('82','EXPIRED_TIME','0','1','0','','1','0','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('120','FILTER_WORD','','1','0','','1','1','100');
INSERT INTO `%DB_PREFIX%conf` VALUES ('84','STYLE_OPEN','0','3','1','0,1','0','0','44');
INSERT INTO `%DB_PREFIX%conf` VALUES ('85','STYLE_DEFAULT','1','3','1','0,1','0','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('86','TMPL_DOMAIN_ROOT','','2','0','0','0','0','62');
INSERT INTO `%DB_PREFIX%conf` VALUES ('94','ICP_LICENSE','','3','0','','1','1','27');
INSERT INTO `%DB_PREFIX%conf` VALUES ('95','COUNT_CODE','','3','0','','1','1','28');
INSERT INTO `%DB_PREFIX%conf` VALUES ('96','DEAL_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('97','PROMOTE_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('98','LIST_TYPE','1','3','1','0,1','1','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('100','SUPPLIER_DETAIL','1','3','1','0,1','1','0','45');
INSERT INTO `%DB_PREFIX%conf` VALUES ('101','KUAIDI_APP_KEY','','1','0','','1','1','83');
INSERT INTO `%DB_PREFIX%conf` VALUES ('102','KUAIDI_TYPE','2','1','1','1,2,3','1','1','84');
INSERT INTO `%DB_PREFIX%conf` VALUES ('103','SEND_SPAN','2','1','0','','1','1','85');
INSERT INTO `%DB_PREFIX%conf` VALUES ('104','MAIL_USE_COUPON','0','5','1','0,1','1','1','77');
INSERT INTO `%DB_PREFIX%conf` VALUES ('105','SMS_USE_COUPON','0','5','1','0,1','1','1','83');
INSERT INTO `%DB_PREFIX%conf` VALUES ('106','LOTTERY_SMS_VERIFY','0','5','1','0,1','1','1','84');
INSERT INTO `%DB_PREFIX%conf` VALUES ('107','LOTTERY_SN_SMS','0','5','1','0,1','1','1','85');
INSERT INTO `%DB_PREFIX%conf` VALUES ('108','EDM_ON','0','5','1','0,1','1','0','86');
INSERT INTO `%DB_PREFIX%conf` VALUES ('109','EDM_USERNAME','','5','0','','1','0','87');
INSERT INTO `%DB_PREFIX%conf` VALUES ('110','EDM_PASSWORD','','5','4','','1','0','88');
INSERT INTO `%DB_PREFIX%conf` VALUES ('111','SHOP_SEARCH_KEYWORD','','3','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('112','REC_HOT_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('113','REC_NEW_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('180','BAIDU_MAP_APPKEY','14zHmdr6t7Uj8TxQ1BXrGzLc','1','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('115','REC_CATE_GOODS_LIMIT','4','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('116','SALE_LIST','5','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('117','INDEX_NOTICE_COUNT','8','3','0','','1','1','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('118','RELATE_GOODS_LIMIT','5','3','0','','1','0','35');
INSERT INTO `%DB_PREFIX%conf` VALUES ('119','TMPL_CACHE_ON','1','1','1','0,1','1','0','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('121','USER_LOGIN_SCORE','0','6','0','','1','1','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('122','USER_LOGIN_MONEY','0','6','0','','1','1','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('123','USER_REGISTER_SCORE','100','6','0','','1','1','8');
INSERT INTO `%DB_PREFIX%conf` VALUES ('124','USER_REGISTER_MONEY','0','6','0','','1','1','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('125','DOMAIN_ROOT','','1','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('128','VERIFY_IMAGE','0','1','1','0,1','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('129','TUAN_SHOP_TITLE','方维团购','3','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('130','MALL_SHOP_TITLE','方维商城','3','0','','1','0','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('131','APNS_MSG_LOCK','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('132','PROMOTE_MSG_PAGE','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('133','APNS_MSG_PAGE','0','0','0','','0','0','0');
INSERT INTO `%DB_PREFIX%conf` VALUES ('134','STORE_SEND_LIMIT','5','5','0','','1','0','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('135','USER_LOGIN_POINT','10','6','0','','1','1','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('136','USER_REGISTER_POINT','100','6','0','','1','1','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('137','USER_LOGIN_KEEP_MONEY','0','6','0','','1','1','4');
INSERT INTO `%DB_PREFIX%conf` VALUES ('138','USER_LOGIN_KEEP_SCORE','5','6','0','','1','1','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('139','USER_LOGIN_KEEP_POINT','50','6','0','','1','1','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('140','USER_ACTIVE_MONEY','0','6','0','','1','1','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('141','USER_ACTIVE_SCORE','0','6','0','','1','1','11');
INSERT INTO `%DB_PREFIX%conf` VALUES ('142','USER_ACTIVE_POINT','10','6','0','','1','1','12');
INSERT INTO `%DB_PREFIX%conf` VALUES ('143','USER_ACTIVE_MONEY_MAX','0','6','0','','1','1','13');
INSERT INTO `%DB_PREFIX%conf` VALUES ('144','USER_ACTIVE_SCORE_MAX','0','6','0','','1','1','14');
INSERT INTO `%DB_PREFIX%conf` VALUES ('145','USER_ACTIVE_POINT_MAX','100','6','0','','1','1','15');
INSERT INTO `%DB_PREFIX%conf` VALUES ('146','USER_DELETE_MONEY','0','6','0','','1','1','16');
INSERT INTO `%DB_PREFIX%conf` VALUES ('148','USER_DELETE_POINT','-10','6','0','','1','1','18');
INSERT INTO `%DB_PREFIX%conf` VALUES ('149','USER_ADD_MONEY','0','6','0','','1','1','19');
INSERT INTO `%DB_PREFIX%conf` VALUES ('150','USER_ADD_SCORE','0','6','0','','1','1','20');
INSERT INTO `%DB_PREFIX%conf` VALUES ('151','USER_ADD_POINT','10','6','0','','1','1','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('147','USER_DELETE_SCORE','0','6','0','','1','1','17');
INSERT INTO `%DB_PREFIX%conf` VALUES ('152','BIZ_AGREEMENT','<ul><li>&nbsp;&nbsp;&nbsp;&nbsp;您确认，在开始\"实名认证\"前，您已详细阅读了本协议所有内容，一旦您开始认证流程，即表示您充分理解并同意接受本协议的全部内容。 </li>\r\n<li>&nbsp;&nbsp;&nbsp;&nbsp;为了提高服务的安全性和我们的商户身份的可信度，我们向您提供认证服务。在您申请认证前，您必须先注册成为用户。商户认证成功后，我们将给予每个商户一个认证标识。本公司有权采取各种其认为必要手段对商户的身份进行识别。但是，作为普通的网络服务提供商，本公司所能采取的方法有限，而且在网络上进行商户身份识别也存在一定的困难，因此，本公司对完成认证的商户身份的准确性和绝对真实性不做任何保证。 </li>\r\n<li>&nbsp;&nbsp;&nbsp;&nbsp;本公司有权记录并保存您提供给本公司的信息和本公司获取的结果信息，亦有权根据本协议的约定向您或第三方提供您是否通过认证的结论以及您的身份信息。 </li>\r\n<li><h3>一、关于认证服务的理解与认同</h3>\r\n<ol class=\"decimal\"><li>认证服务是由本公司提供的一项身份识别服务。除非本协议另有约定，一旦您的账户完成了认证，相应的身份信息和认证结果将不因任何原因被修改或取消；如果您的身份信息在完成认证后发生了变更，您应向本公司提供相应有权部门出具的凭证，由本公司协助您变更账户的对应认证信息。</li>\r\n<li>本公司有权单方随时修改或变更本协议内容，并通过网站公告变更后的协议文本，无需单独通知您。本协议进行任何修改或变更后，您还继续使用我们的服务和/或认证服务的，即代表您已阅读、了解并同意接受变更后的协议内容；您如果不同意变更后的协议内容，应立即停用我们的服务和认证服务。</li>\r\n</ol>\r\n</li>\r\n<li><h3>二、实名认证</h3>\r\n<ol class=\"decimal\"><li>个体工商户类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的个体工商户营业执照或者其他身份证明文件。</li>\r\n<li>企业类商户向本公司申请认证服务时，应向本公司提供以下资料：中华人民共和国工商登记机关颁发的企业营业执照或者其他身份证明文件。</li>\r\n<li>其他类商户向本公司申请认证服务时，应向本公司提供以下资料：能够证明商户合法身份的证明文件，或者其他本公司认为必要的身份证明文件。 </li>\r\n<li>如商户在认证后变更任何身份信息，则应在变更发生后三个工作日内书面通知本公司变更认证，否则本公司有权随时单方终止提供服务，且因此造成的全部后果，由商户自行承担。 </li>\r\n<li>通过实名认证的商户不能自行修改已经认证的信息，包括但不限于企业名称、姓名以及身份证件号码等。 </li>\r\n</ol>\r\n</li>\r\n<li><h3>三、特别声明</h3>\r\n<ol class=\"decimal\"><li>认证信息共享：<br />\r\n为了使您享有便捷的服务，您经由其它网站向本公司提交认证申请即表示您同意本公司为您核对所提交的全部认证信息，并同意本公司将是否通过认证的结果及相关认证信息提供给该网站。</li>\r\n<li>认证资料的管理：<br />\r\n您在认证时提交给本公司的认证资料，即不可撤销的授权由本公司保留。本公司承诺除法定或约定的事由外，不公开或编辑或透露您的认证资料及保存在本公司的非公开内容用于商业目的，但本条第1项规定以及以下情形除外： <ol class=\"lower-roman\"><li>您授权本公司透露的相关信息；</li>\r\n<li>本公司向国家司法及行政机关提供；</li>\r\n<li>本公司向本公司关联企业提供；</li>\r\n<li>第三方和本公司一起为商户提供服务时，该第三方向您提供服务所需的相关信息；</li>\r\n<li>基于解决您与第三方民事纠纷的需要，本公司有权向该第三方提供您的身份信息。</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n</li>\r\n<li><h3>四、第三方网站的链接</h3>\r\n</li>\r\n<li>&nbsp;&nbsp;&nbsp;&nbsp;为实现认证信息审查，我们网站上可能包含了指向第三方网站的链接（以下简称\"链接网站\"）。\"链接网站\"非由本公司控制，对于任何\"链接网站\"的内容，包含但不限于\"链接网站\"内含的任何链接，或\"链接网站\"的任何改变或更新，本公司均不予负责。自\"链接网站\"接收的网络传播或其它形式之传送，本公司不予负责。</li>\r\n<li><h3>五、不得为非法或禁止的使用</h3>\r\n</li>\r\n<li>&nbsp;&nbsp;&nbsp;&nbsp;接受本协议全部的说明、条款、条件是您申请认证的先决条件。您声明并保证，您不得为任何非法或为本协议、条件及须知所禁止之目的进行认证申请。您不得以任何可能损害、使瘫痪、使过度负荷或损害网站或其他网站的服务、或干扰本公司或他人对于认证申请的使用等方式使用认证服务。您不得经由非本公司许可提供的任何方式取得或试图取得任何资料或信息。 </li>\r\n<li><h3>六、有关免责</h3>\r\n</li>\r\n<li>&nbsp;&nbsp;&nbsp;&nbsp;下列情况时本公司无需承担任何责任： </li>\r\n<li><ol class=\"decimal\"><li>由于您将账户密码告知他人或未保管好自己的密码或与他人共享账户或任何其他非本公司的过错，导致您的个人资料泄露。</li>\r\n<li>任何由于黑客攻击、计算机病毒侵入或发作、电信部门技术调整导致之影响、因政府管制而造成的暂时性关闭、由于第三方原因(包括不可抗力，例如国际出口的主干线路及国际出口电信提供商一方出现故障、火灾、水灾、雷击、地震、洪水、台风、龙卷风、火山爆发、瘟疫和传染病流行、罢工、战争或暴力行为或类似事件等)及其他非因本公司过错而造成的认证信息泄露、丢失、被盗用或被篡改等。 </li>\r\n<li>由于与本公司链接的其它网站所造成的商户身份信息泄露及由此而导致的任何法律争议和后果。</li>\r\n<li>任何商户向本公司提供错误、不完整、不实信息等造成不能通过认证或遭受任何其他损失，概与本公司无关。</li>\r\n</ol>\r\n</li>\r\n</ul>','3','3',' ','1','1','100');
INSERT INTO `%DB_PREFIX%conf` VALUES ('182','QRCODE_ON','0','3','1','0,1','1','1','41');
INSERT INTO `%DB_PREFIX%conf` VALUES ('153','INDEX_LEFT_STORE','1','3','0',' ','1','0','1');
INSERT INTO `%DB_PREFIX%conf` VALUES ('154','INDEX_LEFT_TUAN','1','3','0',' ','1','0','2');
INSERT INTO `%DB_PREFIX%conf` VALUES ('155','INDEX_LEFT_YOUHUI','1','3','0',' ','1','0','3');
INSERT INTO `%DB_PREFIX%conf` VALUES ('156','INDEX_LEFT_DAIJIN','1','3','0',' ','1','0','4');
INSERT INTO `%DB_PREFIX%conf` VALUES ('157','INDEX_LEFT_EVENT','1','3','0',' ','1','0','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('158','INDEX_RIGHT_STORE','1','3','0',' ','1','0','6');
INSERT INTO `%DB_PREFIX%conf` VALUES ('159','INDEX_RIGHT_TUAN','1','3','0',' ','1','0','7');
INSERT INTO `%DB_PREFIX%conf` VALUES ('160','INDEX_RIGHT_YOUHUI','1','3','0',' ','1','0','8');
INSERT INTO `%DB_PREFIX%conf` VALUES ('161','INDEX_RIGHT_DAIJIN','1','3','0',' ','1','0','9');
INSERT INTO `%DB_PREFIX%conf` VALUES ('162','INDEX_RIGHT_EVENT','1','3','0',' ','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('163','USER_YOUHUI_DOWN_MONEY','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('164','USER_YOUHUI_DOWN_SCORE','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('165','USER_YOUHUI_DOWN_POINT','0','6','0',' ','1','0','21');
INSERT INTO `%DB_PREFIX%conf` VALUES ('167','APPLE_PATH','ios','3','0',' ','1','0','101');
INSERT INTO `%DB_PREFIX%conf` VALUES ('168','ANDROID_PATH','android','3','0',' ','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('171','QRCODE_SIZE','5','3','1','1,3,5','1','1','103');
INSERT INTO `%DB_PREFIX%conf` VALUES ('169','SEND_SCORE_SMS','0','5','1','0,1','1','1','82');
INSERT INTO `%DB_PREFIX%conf` VALUES ('170','SEND_SCORE_MAIL','0','5','1','0,1','1','1','76');
INSERT INTO `%DB_PREFIX%conf` VALUES ('172','YOUHUI_SEND_TEL_LIMIT','2','5','0','','1','0','10');
INSERT INTO `%DB_PREFIX%conf` VALUES ('173','IP_LIMIT_NUM','0','1','0','','1','1','5');
INSERT INTO `%DB_PREFIX%conf` VALUES ('174','INDEX_SUPPLIER_COUNT','8','3','0','','1','1','28');
INSERT INTO `%DB_PREFIX%conf` VALUES ('179','SUPPLIER_ORDER_NOTIFY','0','5','1','0,1','1','1','50');
INSERT INTO `%DB_PREFIX%conf` VALUES ('175','BIZ_APPLE_PATH','','3','0','','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('176','BIZ_ANDROID_PATH','','3','0','','1','0','102');
INSERT INTO `%DB_PREFIX%conf` VALUES ('181','BIZ_REGISTER_SMS','0','5','1','0,1','1','1','100');
DROP TABLE IF EXISTS `%DB_PREFIX%coupon_log`;
CREATE TABLE `%DB_PREFIX%coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_sn` varchar(255) NOT NULL COMMENT '团购券序列号',
  `create_time` int(11) NOT NULL COMMENT '请求时间',
  `msg` text NOT NULL COMMENT '请求信息（如短信为上行的短信内容）',
  `query_id` varchar(255) NOT NULL COMMENT '第三方验证通道的请求唯一ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方团购券验证(短信上行验证，电话验证)的第三方请求回调日志';
DROP TABLE IF EXISTS `%DB_PREFIX%daren_submit`;
CREATE TABLE `%DB_PREFIX%daren_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '申请达人的会员ID',
  `is_publish` tinyint(1) NOT NULL COMMENT '是否通过标识0:否 1:是',
  `create_time` int(11) NOT NULL COMMENT '提交申请时间',
  `reason` text NOT NULL COMMENT '用户提交的申请理由',
  `daren_title` varchar(255) NOT NULL COMMENT '达人专用名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='达人申请表';
DROP TABLE IF EXISTS `%DB_PREFIX%deal`;
CREATE TABLE `%DB_PREFIX%deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '商品名称',
  `sub_name` varchar(255) NOT NULL COMMENT '短名称，用于短信，邮件等需要节约字符数的地方显示名称用',
  `cate_id` int(11) NOT NULL COMMENT '生活服务分类ID',
  `supplier_id` int(11) NOT NULL COMMENT '所属的商户ID',
  `img` varchar(255) NOT NULL COMMENT '主图',
  `description` text NOT NULL COMMENT '信息描述详情',
  `begin_time` int(11) NOT NULL COMMENT '上线开始时间，可为0为不限时',
  `end_time` int(11) NOT NULL COMMENT '下架时间，可为0为不限时',
  `min_bought` int(11) NOT NULL COMMENT '最小购买量，用于团购产品的成团判断',
  `max_bought` int(11) NOT NULL COMMENT '最大量，即库存上限(如有属性规格的库存，该值不生效，见attr_stock表)',
  `user_min_bought` int(11) NOT NULL COMMENT '会员下单的最小量',
  `user_max_bought` int(11) NOT NULL COMMENT '每个会员购买的上限',
  `origin_price` decimal(20,4) NOT NULL COMMENT '原价',
  `current_price` decimal(20,4) NOT NULL COMMENT '当前销售价',
  `city_id` int(11) NOT NULL COMMENT '所属的城市',
  `is_coupon` tinyint(1) NOT NULL COMMENT '是否发放团购券',
  `is_delivery` tinyint(1) NOT NULL COMMENT '是否需要配送（实体商品），需要配送的产品前台会出现配送方式的选项，并计算相应运费',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `user_count` int(11) NOT NULL COMMENT '下单量（按单计算,每组商品多件购买算一笔）',
  `buy_count` int(11) NOT NULL COMMENT '销量（购买的件数）',
  `time_status` tinyint(1) NOT NULL COMMENT '时间状态0:未开始1:进行中2:已过期(不上架销售，可以往团购券中查到)',
  `buy_status` tinyint(1) NOT NULL COMMENT '销售状态 0:未成团 1:已成团 2:成团并卖光\r\n0:未成团，购买的用户生成团购券，但不发券\r\n1:成团，购买发券\r\n2:卖光商品不再开放购买，但不下架',
  `deal_type` tinyint(1) NOT NULL COMMENT '发券方式 0:按件发送 1:按单发券(同类商品买多件只发放一张团购券,用于一次性验证)',
  `allow_promote` tinyint(1) NOT NULL COMMENT '是否允许参与促销（系统内安装并配置的促销接口）',
  `return_money` decimal(20,4) NOT NULL COMMENT '购买即返现的金额(该项可填负数，也可作为额外消费的金额)',
  `return_score` int(11) NOT NULL COMMENT '购买返积分(也可以为负数，表示商品购买的积分限制，积分商品的积分也为该项，因此必需为负数)',
  `brief` text NOT NULL COMMENT '商品简介',
  `sort` int(11) NOT NULL COMMENT '前台展示排序 由大到小',
  `deal_goods_type` int(11) NOT NULL COMMENT '商品类型（用于生成相应类型的属性规格配置项）',
  `success_time` int(11) NOT NULL COMMENT '成团时间',
  `coupon_time_type` tinyint(1) NOT NULL COMMENT '0：指定时间过期 1:按下单日起xx天过期',
  `coupon_day` int(11) NOT NULL COMMENT '下单后xx天内失效',
  `coupon_begin_time` int(11) NOT NULL COMMENT '发放团购券的生效时间',
  `coupon_end_time` int(11) NOT NULL COMMENT '发放的团购券的过期时间',
  `code` varchar(255) NOT NULL COMMENT '标识码,可自定义一个标识用于团购券的前缀（用于电话验证的商品只能填数字）',
  `weight` decimal(20,4) NOT NULL COMMENT '商品重量，实体商品填写，用于运费计算',
  `weight_id` int(11) NOT NULL COMMENT '重量单位的配置ID',
  `is_referral` tinyint(1) NOT NULL COMMENT '是否允许购买返利给邀请人',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购商品的类型0：普通 2:订购 3秒杀 (该值仅作为前台展示以及归类用，功能上与团购商品相同) ',
  `discount` decimal(20,4) NOT NULL COMMENT '商品的现价与原价的折扣数，通常会自动生成，在线订购类商品因为付的是订金，该项手动计算原价与卖价的折扣比',
  `icon` varchar(255) NOT NULL COMMENT '小图',
  `notice` tinyint(1) NOT NULL COMMENT '是否参与预告（未到上线期的商品，默认不展示在前台，该项为1表示可以上线展示预告）',
  `free_delivery` tinyint(1) NOT NULL COMMENT '是否开启免运费，可以单独配置针对某个配送方式的免运费规则',
  `define_payment` tinyint(1) NOT NULL COMMENT '是否自定义禁用哪些支付方式',
  `seo_title` text NOT NULL COMMENT '自定义的页面seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义的页面seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义的页面seo描述',
  `is_hot` tinyint(1) NOT NULL COMMENT '商城商品的热卖标识',
  `is_new` tinyint(1) NOT NULL COMMENT '商城商品的新品标识',
  `is_best` tinyint(1) NOT NULL COMMENT '商城商品的精品标识',
  `is_lottery` tinyint(1) NOT NULL COMMENT '是否参与抽奖，为1则生成抽奖号，用于运营中制定相应的抽奖规则',
  `reopen` int(11) NOT NULL COMMENT '重开团的申请，往期团购前台可以申请重新开团，该项用于计数',
  `uname` varchar(255) NOT NULL COMMENT 'url别名，用于重写与seo收录的优化',
  `forbid_sms` tinyint(1) NOT NULL COMMENT '是否禁用短信发送功能，禁用短信则该商品的购物不会短信发券',
  `cart_type` tinyint(1) NOT NULL COMMENT '购物车规则\r\n0:启用购物车(每次可以买多款)\r\n1按商品(同款商品可买多款属性)\r\n2按商家(同个商家可买多款商品)\r\n3禁用购物车(每次只能买一款)',
  `shop_cate_id` int(11) NOT NULL COMMENT '商城商品的分类ID',
  `is_shop` tinyint(1) NOT NULL COMMENT '标识是否为商城商品 0:否 1:是',
  `total_point` int(11) NOT NULL COMMENT '用户评分的总分',
  `avg_point` float(14,4) NOT NULL COMMENT '用户评分的平均分',
  `create_time` int(11) NOT NULL COMMENT '管理员发布时间',
  `update_time` int(11) NOT NULL COMMENT '管理员更新时间',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode编码',
  `name_match_row` text NOT NULL COMMENT '名称的全文索引查询栏',
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引unicode',
  `deal_cate_match_row` text NOT NULL COMMENT '分类的全文索引查询栏',
  `shop_cate_match` text NOT NULL COMMENT '商品分类的全文索引unicode',
  `shop_cate_match_row` text NOT NULL COMMENT '商品分类的全文索引查询栏',
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引unicode',
  `locate_match_row` text NOT NULL COMMENT '地区信息的全文索引查询栏',
  `tag_match` text NOT NULL COMMENT '标签全文索引unicode',
  `tag_match_row` text NOT NULL COMMENT '标签全文索引查询栏',
  `xpoint` varchar(255) NOT NULL COMMENT '经度（第一个分店的经度）',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度（第一个分店的纬度）',
  `brand_id` int(11) NOT NULL COMMENT '所归属的品牌',
  `brand_promote` tinyint(1) NOT NULL COMMENT '是否参与品牌促销，该项与brand表的该项同步',
  `publish_wait` tinyint(1) NOT NULL COMMENT '商家提交的产品 0:已审核 1:等待审核',
  `account_id` int(11) NOT NULL COMMENT '商家提交的商家帐号ID',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到首页展示',
  `balance_price` decimal(20,4) NOT NULL COMMENT '与商家的结算价（即商价提供给平台商的成本价）',
  `is_refund` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可退款',
  `auto_order` tinyint(1) NOT NULL COMMENT '是否打上免预约标识 0:否 1:是',
  `expire_refund` tinyint(1) NOT NULL COMMENT '是否支持过期退款( 过期未消费用户即可提交退款)',
  `any_refund` tinyint(1) NOT NULL COMMENT '是否支持随时退款（未消费用户即可提交退款申请）',
  `multi_attr` tinyint(1) NOT NULL COMMENT '多套餐（自动判断是否有属性规格配置，有则打上该标签）',
  `deal_tag` int(10) NOT NULL COMMENT '商品标签\r\n2^(1-10)\r\n1.0元抽奖\r\n2.免预约\r\n3.多套餐\r\n4.可订座\r\n5.代金券\r\n6.过期退\r\n7.随时退\r\n8.七天退\r\n9.免运费\r\n10.满立减',
  `dp_count` int(11) NOT NULL COMMENT '总参与的点评人数',
  `notes` text NOT NULL COMMENT '购买需知',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `buyin_app` tinyint(1) NOT NULL COMMENT '是否仅展示在app端0否 1是',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `begin_time` (`begin_time`),
  KEY `end_time` (`end_time`),
  KEY `current_price` (`current_price`),
  KEY `city_id` (`city_id`),
  KEY `buy_count` (`buy_count`),
  KEY `sort` (`sort`),
  KEY `buy_type` (`buy_type`),
  KEY `shop_cate_id` (`shop_cate_id`),
  KEY `is_shop` (`is_shop`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `buyin_app` (`buyin_app`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `tag_match` (`tag_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `all_match` (`name_match`,`deal_cate_match`,`locate_match`,`tag_match`,`shop_cate_match`),
  FULLTEXT KEY `shop_cate_match` (`shop_cate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='产生支付行为的商品、团购、代金券数据表';
INSERT INTO `%DB_PREFIX%deal` VALUES ('57','桥亭活鱼小镇 仅售88元！价值100元的代金券1张','88元桥亭活鱼小镇代金券','8','23','','<div align=\"center\"><p><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/14/54ed69afb8e5a.jpg\" alt=\"\" border=\"0\" /></p>\r\n</div>\r\n','1422745375','1590361380','0','0','0','2','150.0000','88.0000','15','1','0','1','0','3','3','1','1','0','0','0.0000','10','仅售88元！价值100元的代金券1张，除店内活动时的特价菜外全场通用，可叠加使用，可免费使用包间，提供免费WiFi。健康活鱼入馔，美味丝丝入扣，妙法烹佳肴，鲜满乾坤！。','1','10','1424819057','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','5','5.0000','1424819057','1424820337','ux26725ux20141,ux20195ux37329ux21048,ux20165ux21806,ux23567ux38215,ux20215ux20540,ux49ux48ux48,ux26725ux20141ux27963ux40060ux23567ux38215ux20165ux21806ux56ux56ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux20195ux37329ux21048ux49ux24352','桥亭,代金券,仅售,小镇,价值,100,桥亭活鱼小镇 仅售88元！价值100元的代金券1张','ux39184ux39278ux32654ux39135,ux19996ux21271ux33756,ux24029ux33756,ux26085ux26412ux26009ux29702,ux28903ux28900','餐饮美食,东北菜,川菜,日本料理,烧烤','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19975ux35937,ux51ux57ux49,ux21488ux27743ux21306ux23453ux40857ux19975ux35937ux22478ux52ux27004ux51ux57ux49ux21495,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141,ux26187ux23433ux21306,ux20845ux27004,ux26032ux24215ux38215,ux20013ux24433,ux24433ux38498,ux26049ux36793,ux24191ux22330,ux30334ux24230,ux38899ux20048,ux75ux84ux86,ux26187ux23433ux21306ux26032ux24215ux38215ux20116ux22235ux21271ux27888ux31166ux24191ux22330ux20845ux27004ux65288ux20013ux24433ux24433ux38498ux26049ux65292ux38899ux20048ux45ux30334ux24230ux75ux84ux86ux26049ux36793ux65289,ux40723ux27004ux21306,ux30465ux20307ux32946ux20013ux24515','福建,福州,台江区,宝龙,万象,391,台江区宝龙万象城4楼391号,宝龙城市广场,万象城,桥亭,晋安区,六楼,新店镇,中影,影院,旁边,广场,百度,音乐,KTV,晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）,鼓楼区,省体育中心','ux50ux45ux53ux20154ux22871ux39184,ux24773ux20387ux22871ux39184,ux49ux56ux28857ux20197ux21518,ux57ux28857ux33267ux49ux56ux28857','2-5人套餐,情侣套餐,18点以后,9点至18点','119.3323','26.144803','0','0','0','0','1','50.0000','1','0','0','1','1','80','1','<br />\r\n<br />\r\n亲爱的用户，本次团购有效期延长至2015年03月06日，感谢您的支持，祝消费愉快~<br />\r\n<br />\r\n【2月13日更新】【新增不可用日期】商家2015年2月18日至2月20日，厦门乐都汇店、罗宾森店、五缘湾店、漳州龙海店周六、周日、国庆10.1-10.7不可使用美团券无法接待美团用户，给您带来不便，深表歉意。<br />\r\n<br />\r\n','0','0','0','0','1','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('58','石山水代金券 仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','石山水代金券','8','28','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','<p>石山水美式餐厅是隶属于双福集团旗下的一个全球连锁餐饮品牌，源自于1909年美国加利福尼亚州落杉矶西部小镇的一个阳光乡村牛排馆。他们以连锁经营为拓展模式，从自1998年福州五一广场双福楼门店开业以来，在新老客户的支持下，石山水美式餐厅已在福州繁华的各大商圈拥有六家直营连锁店，同时在宁德、泉州晋江和江苏盐城等相继开出连锁加盟店。秉着铸造美式西餐行业品牌的宏伟目标，石山水坚持将美式西餐的概念融入东方餐饮文化，在东西方的融合中，形成了崭新的适合中国人的西餐，开辟出一片新的天地。&nbsp;</p>\r\n<p><br />\r\n</p>\r\n<p align=\"center\"><img src=\"./public/attachment/201502/25/15/54ed773aeab64.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n','1422746309','1582240711','0','5000','0','0','100.0000','80.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','5','仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','2','0','1424819941','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','0','0','0','','','','0','0','0','0','0','shiss','0','0','0','0','0','0.0000','1424819941','1424829820','ux20195ux37329ux21048,ux21472ux21152,ux20165ux21806,ux20840ux22330,ux23665ux27700,ux36890ux29992,ux20215ux20540,ux20351ux29992,ux25552ux20379,ux20813ux36153,ux30707ux23665ux27700ux20195ux37329ux21048ux20165ux21806ux56ux48ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux20195ux37329ux21048ux49ux24352ux65292ux20840ux22330ux36890ux29992ux65292ux21487ux21472ux21152ux20351ux29992ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','代金券,叠加,仅售,全场,山水,通用,价值,使用,提供,免费,石山水代金券 仅售80元！价值100元的代金券1张，全场通用，可叠加使用，提供免费WiFi。','ux39184ux39278ux32654ux39135,ux21654ux21857','餐饮美食,咖啡','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux19996ux34903,ux24433ux22478,ux28023ux23777,ux22823ux21414,ux27004ux65288,ux40723ux27004ux21306ux19996ux34903ux49ux52ux21495ux38397ux36745ux22823ux21414ux49ux27004ux65288ux36817ux28023ux23777ux24433ux22478ux65289,ux20116ux19968ux24191ux22330,ux19996ux34903ux21475','福建,福州,鼓楼区,东街,影城,海峡,大厦,楼（,鼓楼区东街14号闽辉大厦1楼（近海峡影城）,五一广场,东街口','','','119.307134','26.092442','0','0','0','0','1','50.0000','0','0','0','0','0','16','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('59',' 【万象城/宝龙广场】agogo量贩KTV','agogo量贩KTV','9','29','','<div align=\"center\"><img src=\"./public/attachment/201502/25/15/54ed7b363e1e0.jpg\" alt=\"\" border=\"0\" /></div>\r\n','1422747641','1582587643','0','0','0','0','336.0000','45.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','5',' 【万象城/宝龙广场】agogo量贩KTV','3','0','1424821293','1','7','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424821293','1424821293','ux23453ux40857,ux19975ux35937,ux37327ux36137,ux24191ux22330,ux97ux103ux111ux103ux111,ux75ux84ux86,ux12304ux19975ux35937ux22478ux47ux23453ux40857ux24191ux22330ux12305ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','宝龙,万象,量贩,广场,agogo,KTV,【万象城/宝龙广场】agogo量贩KTV','ux20241ux38386ux23089ux20048,ux75ux84ux86','休闲娱乐,KTV','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux22235ux27004,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux22235ux27004,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,台江区,宝龙,四楼,广场,工业,城市,193,台江区工业路193号宝龙城市广场四楼,宝龙城市广场','','','119.298093','26.068768','0','0','0','0','1','40.0000','1','0','1','0','0','32','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('61','仅售128元！最高价值392元的贵安温泉休闲一日游套餐，山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','贵安温泉','11','30','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/15/54ed7dcce36b1.jpg\" /></p>\r\n<p align=\"center\">&nbsp;</p>\r\n<ul id=\"yui_3_16_0_1_1424850233122_1924\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424850233122_1923\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>浸香</b><br />\r\n<p style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">泡温泉是个慢功夫，浸水也要慢。先用温水淋洗暖身，然后慢慢浸入池中，待泉水到达胸口处时停住，静待3~5分钟，等身体全部暖和起来之后，再泡到肩膀处。浸泡过程中，可尽量呼吸泉水蒸汽（硫磺泉不适用），搭配水果或玫瑰花茶，边喝边泡，让泉水和茶香内外交融渗透，滋养肌肤。</p>\r\n</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>敷面</b><br />\r\n<p style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">泡温泉时是护肤的最佳时间，这时的皮肤受热，毛孔张开，最利于养分的吸收，因此泡温泉时携带面膜敷面，可达到事半功倍的美肤效果。面膜功效最好为保湿型，因美白型面膜含酸性成分，使用后可能会造成皮肤泛红。</p>\r\n</li>\r\n<li id=\"yui_3_16_0_1_1424850233122_1930\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>清洁</b><br />\r\n<p id=\"yui_3_16_0_1_1424850233122_1929\" style=\"color:#666666;padding-bottom:0px;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:0px;margin:10px 0px;padding-right:0px;\">温泉清洁包括浸泡前和浸泡后两部分。浸泡前的清洁属于礼貌公德，可以为你的优雅加分；浸泡后的清洁则是由于温泉本身有一定的浓度，如果不及时清洗干净，温泉水会在身上形成结晶，刺激皮肤。</p>\r\n</li>\r\n</ul>\r\n','1424822094','1551052496','0','0','0','0','392.0000','128.0000','15','1','0','1','0','0','0','1','1','1','1','10.0000','10','山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','4','0','1424822160','0','0','0','0','','0.0000','0','1','0','0.0000','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822160','1424822160','ux28201ux27849,ux24609ux24773,ux19968ux26085ux28216,ux20165ux21806,ux22871ux39184,ux23665ux27700,ux19981ux21464,ux23395ux33410,ux28201ux26262,ux26368ux39640,ux20165ux21806ux49ux50ux56ux20803ux65281ux26368ux39640ux20215ux20540ux51ux57ux50ux20803ux30340ux36149ux23433ux28201ux27849ux20241ux38386ux19968ux26085ux28216ux22871ux39184ux65292ux23665ux27700ux24609ux24773ux65292ux28201ux27849ux24609ux36523ux65292ux23395ux33410ux22312ux21464ux65292ux28201ux27849ux32473ux20320ux30340ux28201ux26262ux19981ux21464','温泉,怡情,一日游,仅售,套餐,山水,不变,季节,温暖,最高,仅售128元！最高价值392元的贵安温泉休闲一日游套餐，山水怡情，温泉怡身，季节在变，温泉给你的温暖不变','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','','','ux31119ux24314,ux31119ux24030,ux36830ux27743ux21439,ux28504ux28193,ux36830ux27743,ux23433ux26449,ux36830ux27743ux21439ux36830ux27743ux28504ux28193ux20065ux36149ux23433ux26449ux36149ux27915ux36335,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330','福建,福州,连江县,潘渡,连江,安村,连江县连江潘渡乡贵安村贵洋路,鼓楼区,五一广场','','','119.416354','26.227042','0','0','0','0','1','100.0000','1','1','1','1','0','98','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('62','仅售590元！价值748元的国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游，每日发团，不限出团人数。福州国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游！','厦门、永定土楼二日游','11','31','./public/attachment/201502/25/16/54ed832bd819e.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed832bd819e.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424851034114_1516\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424851034114_1515\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">发团时间：每日发团；预约出团人数：不限</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">已包含导游费；包含早餐1次+午餐2次，不包含晚餐</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">包含入住酒店1晚；方案已包含往返车费</li>\r\n<li style=\"list-style-type:none;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">行程安排：</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">集合时间：早上7：10；集合地点：福州火车站（北站）一楼广场大钟下</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>南普陀寺</b><br />\r\n交通方式：步行；游玩时长：50分钟<br />\r\n介绍：参观天王殿、钟鼓楼、大雄宝殿、大悲殿等</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>鼓浪屿</b><br />\r\n交通方式：步行；游玩时长：1.5小时<br />\r\n介绍：步行平等路，欣赏万国建筑博览群</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>菽庄花园</b><br />\r\n交通方式：步行；游玩时长：70分钟<br />\r\n介绍：游览内设中国唯一钢琴博物馆的菽庄花园，园内分为补山园和藏海园两部分，造景有十二洞天、四十四桥、听涛轩等</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>承启楼</b><br />\r\n交通方式：步行；游玩时长：1小时<br />\r\n介绍：该楼于2010年6月12日入选世界吉尼斯记录——世界上环数最多的土楼，其规模宏大，造型奇特，于1981年被收入《中华名胜词典》，同年被列入《世界建筑史》，1986年，国家邮电部发行的一组中国民居系列邮票，其中福建土楼民居邮票就是以承启楼为图案的，该邮票在日本被评为当年最佳邮票</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>侨福楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时<br />\r\n介绍：又名博士楼</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>五云楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时<br />\r\n介绍：俗称不倒楼，特点是没有石砌墙基</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>世泽楼</b><br />\r\n交通方式：步行；游玩时长：0.5小时</li>\r\n</ul>\r\n','1424822690','1519517091','0','0','0','0','748.0000','590.0000','15','1','0','1','0','0','0','1','1','0','0','10.0000','10','【福州】厦门、永定土楼二日游','5','0','1424822751','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed832bd819e.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822751','1424822994','ux21271ux26449,ux40723ux28010ux23679,ux27704ux23450,ux20108ux26085,ux22303ux27004,ux21414ux38376,ux26053ux34892ux31038,ux25552ux20379,ux22269ux38469,ux31119ux24030,ux20165ux21806ux53ux57ux48ux20803ux65281ux20215ux20540ux55ux52ux56ux20803ux30340ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux21414ux38376ux65288ux40723ux28010ux23679ux65289ux12289ux27704ux23450ux65288ux39640ux21271ux26449ux65289ux22303ux27004ux21452ux21160ux20108ux26085ux28216ux65292ux27599ux26085ux21457ux22242ux65292ux19981ux38480ux20986ux22242ux20154ux25968ux12290ux31119ux24030ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux21414ux38376ux65288ux40723ux28010ux23679ux65289ux12289ux27704ux23450ux65288ux39640ux21271ux26449ux65289ux22303ux27004ux21452ux21160ux20108ux26085ux28216ux65281','北村,鼓浪屿,永定,二日,土楼,厦门,旅行社,提供,国际,福州,仅售590元！价值748元的国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游，每日发团，不限出团人数。福州国际旅行社提供的厦门（鼓浪屿）、永定（高北村）土楼双动二日游！','ux37202ux24215ux26053ux28216,ux22269ux20869ux28216','酒店旅游,国内游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','400.0000','1','1','1','0','0','546','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('63','仅售180元！价值308元的国际旅行社提供的天门山度假村漂流一日游（含往返大巴接送），每日发团，不限出团人数。','天门山度假村漂流一日游','11','31','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','<p><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/15/54ed80bf64ba6.jpg\" /></p>\r\n<p style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><p id=\"yui_3_16_0_1_1424851111192_1395\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">&nbsp;</p>\r\n','0','0','0','0','0','0','308.0000','180.0000','15','1','0','1','0','0','0','1','1','0','0','10.0000','10','【福州】天门山度假村漂流一日游','6','0','1424822930','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424822930','1424827187','ux22825ux38376,ux24230ux20551ux26449,ux25509ux36865,ux22823ux24052,ux19968ux26085ux28216,ux20165ux21806,ux24448ux36820,ux28418ux27969,ux26053ux34892ux31038,ux20154ux25968,ux20165ux21806ux49ux56ux48ux20803ux65281ux20215ux20540ux51ux48ux56ux20803ux30340ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux22825ux38376ux23665ux24230ux20551ux26449ux28418ux27969ux19968ux26085ux28216ux65288ux21547ux24448ux36820ux22823ux24052ux25509ux36865ux65289ux65292ux27599ux26085ux21457ux22242ux65292ux19981ux38480ux20986ux22242ux20154ux25968ux12290','天门,度假村,接送,大巴,一日游,仅售,往返,漂流,旅行社,人数,仅售180元！价值308元的国际旅行社提供的天门山度假村漂流一日游（含往返大巴接送），每日发团，不限出团人数。','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','150.0000','1','1','1','1','0','98','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('71','仅售1元！价值399元的异域风情，提供免费WiFi。','美丽人生','10','35','./public/attachment/201502/25/17/54ed9486611f6.jpg','<p><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed9486611f6.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424856148625_1680\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424856148625_1683\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄类型：</b>个人写真</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄背景：</b>纯内景2组（拍摄地点：店内影棚，拍摄时长：3小时）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服装造型：</b>提供服装2套/人，指定部分可选，可选范围：异域风情（美人图 无双艳后）+时尚装，最多可自带服装1套/人，自带服装计入总数内</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>化妆造型：</b>提供整体妆面1次/人，造型2组/人</li>\r\n<li id=\"yui_3_16_0_1_1424856148625_1686\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b id=\"yui_3_16_0_1_1424856148625_1685\">造型用品：</b>免费提供假睫毛1对；不免费提供精华素，如需，店内收费88元/瓶，可自带，不收取服务费；不免费提供隐形内衣，如需，店内收费128元/件，可自带</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服务人员：</b>摄影师1名+化妆师1名</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄精修：</b>拍摄至少40张，精修3张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>底片赠送：</b>不赠送原始底片；赠送至少3张精修底片；赠送方式：美团会员自带U盘拷走</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>其余底片：</b>赠送张数之外如需购买，原始底片20元/张，精修底片30元/张，入册40元/张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>赠品：</b><br />\r\n7寸韩国水晶摆台1个<br />\r\n36寸海报1张</li>\r\n</ul>\r\n','0','0','0','0','0','0','399.0000','1.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【东街口】美丽人生摄影工作室','13','0','1424827956','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9486611f6.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424827956','1424827986','ux24322ux22495ux39118ux24773,ux20165ux21806,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux51ux57ux57,ux20165ux21806ux49ux20803ux65281ux20215ux20540ux51ux57ux57ux20803ux30340ux24322ux22495ux39118ux24773ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','异域风情,仅售,价值,提供,免费,WiFi,399,仅售1元！价值399元的异域风情，提供免费WiFi。','ux29983ux27963ux26381ux21153,ux20010ux24615ux20889ux30495','生活服务,个性写真','','','ux31119ux24314,ux31119ux24030,ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','','','119.300928','26.091942','0','0','0','0','1','10.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('64','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。','龙中龙男士棉服','0','32','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','<p><img src=\"./public/attachment/201502/25/16/54ed83366e824.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/16/54ed834236570.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/16/54ed834a0a82c.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n','0','0','0','0','0','0','398.0000','69.0000','0','0','1','1','0','1','1','1','1','0','0','0.0000','0','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。','6','11','1424823096','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','0','0','0','','','','0','0','0','0','0','','0','0','31','1','0','0.0000','1424823096','1424824411','ux20013ux40857,ux33073ux21368,ux26825ux26381,ux21152ux21402,ux26825ux34915,ux20445ux26262,ux20165ux21806,ux22806ux22871,ux30007ux22763,ux20215ux20540,ux20165ux21806ux54ux57ux20803ux65281ux20215ux20540ux51ux57ux56ux20803ux30340ux40857ux20013ux40857ux30007ux22763ux26825ux26381ux49ux20214ux65292ux21487ux33073ux21368ux24125ux20445ux26262ux21152ux21402ux26825ux34915ux65292ux38738ux24180ux20241ux38386ux22806ux22871ux12290,ux40857ux20013ux40857','中龙,脱卸,棉服,加厚,棉衣,保暖,仅售,外套,男士,价值,仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。,龙中龙','','','ux26381ux35013,ux30007ux35013','服装,男装','ux40723ux27004ux21306,ux31119ux24030ux24191ux22330','鼓楼区,福州广场','ux40657ux33394,ux26837ux33394,ux23567ux30721,ux22823ux30721,ux22343ux30721','黑色,棕色,小码,大码,均码','','','16','0','0','0','1','50.0000','1','0','0','0','1','64','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('65','仅售758元！价值838元的福建春秋国际旅行社提供的泰宁大金湖+寨下大峡谷+玉华洞+尚书第双动二日游，详询商家，不限出团人数','泰宁大金湖','11','31','./public/attachment/201502/25/16/54ed84087507c.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed84087507c.jpg\" /></p>\r\n<p style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\" align=\"left\"><br />\r\n介绍：参考车次：福州站D2242（07：00/08：43） D6502（08：30/10：20） D2226（08：42/10：39） 早动车站集中后，客人自行前往泰宁动车站，导游泰宁站接团送【泰宁古城】，参观状元文化主题铜雕群，领略泰宁古城的历史变迁，感受“汉唐古镇、两宋名城”之风韵。触摸2200年的风雨沧桑，还可以在红军街上追忆工农红军三进三出的烽火岁月，可以参观明朝兵部尚书李春烨的深宅大院中品味“江南第一民居“【尚书第】。下午适时赴国家5A级景区、世界自然遗产的核心品牌——【大金湖景区】（行程约20分钟，游览约4小时），登岸游览“野趣园水际瀑布”、一柱插地不假片瓦的南方悬空寺“甘露寺”、陆地一线天；船游金湖观大赤壁、“仙”“寿”呈祥天书真迹。游览结束后导游将游客送返酒店。<br />\r\n寨下大峡谷 +玉华洞（第二天）<br />\r\n交通方式：动车；游玩时长：1天<br />\r\n介绍：参考车次：将乐站D6509（16：44/18：27）D2225（20：43/22：29） 早餐后游览世界地质公园的样板景区--【寨下大峡谷62】(游览时间2.5小时左右）（悬天峡、通天峡、倚天峡、天穹岩、问天岩、山崩地裂、堰塞湖）这是万谷归一的地方，可以毫不夸张地说：寨下归来不看谷。联合国教科文组织专家评价其为世界地质公园的样板景区。中餐后国家重点风景名胜区中国四大名洞之一--【玉华洞105】(游览时间2小时左右），誉称形胜甲闽山，人间瑶池景。因洞内岩石洁白如玉，华光四射而得名.体验风声不止的1扇风，观仙人田，硕果累累，擎天柱，鸡冠石，万家灯火，五更天等景点。后 将乐返回泰宁或者三明北站返回，后结束愉快的行程。<br />\r\n请提前电话商家0591-87871567、88999880预约或发预约短信“姓名+手机号人数+游玩日期+验证码”给客服电话13559195537</p>\r\n','0','0','0','0','0','0','838.0000','758.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【福州】泰宁大金湖','7','0','1424823281','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed84087507c.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424823281','1424826895','ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux20165ux21806ux55ux53ux56ux20803ux65281ux20215ux20540ux56ux51ux56ux20803ux30340ux31119ux24314ux26149ux31179ux22269ux38469ux26053ux34892ux31038ux25552ux20379ux30340ux27888ux23425ux22823ux37329ux28246ux43ux23528ux19979ux22823ux23777ux35895ux43ux29577ux21326ux27934ux43ux23578ux20070ux31532ux21452ux21160ux20108ux26085ux28216ux65292ux35814ux35810ux21830ux23478ux65292ux19981ux38480ux20986ux22242ux20154ux25968','泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,仅售758元！价值838元的福建春秋国际旅行社提供的泰宁大金湖+寨下大峡谷+玉华洞+尚书第双动二日游，详询商家，不限出团人数','ux37202ux24215ux26053ux28216,ux33258ux21161ux28216,ux21608ux36793ux28216','酒店旅游,自助游,周边游','','','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','','','119.317071','26.081434','0','0','0','0','1','700.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('72','仅售1元！价值499元的古装婚纱，提供免费WiFi。','古装婚纱','10','35','./public/attachment/201502/25/17/54ed98ce465fa.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed98ce465fa.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424857065793_1468\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li id=\"yui_3_16_0_1_1424857065793_1467\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄类型：</b>婚纱摄影/古装婚纱摄影</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄背景：</b>纯内景1组（拍摄地点：店内，拍摄时长：约1-2小时）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服装造型：</b>提供服装1套/人，指定部分可选，可选范围：古装任选，最多可自带服装1套/人，自带服装计入总数内</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>化妆造型：</b>提供整体妆面1次/人，造型1组/人</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>造型用品：</b>免费提供假睫毛1对；无精华素服务；无隐形内衣服务</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>服务人员：</b>摄影师1名+化妆师1名</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄精修：</b>拍摄至少30张，精修2张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>底片赠送：</b>不赠送原始底片；不赠送精修底片；赠送方式：方维会员自带U盘拷走</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>其余底片：</b>赠送张数之外如需购买，原始底片48元/张，精修底片48元/张，入册58元/张</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>拍摄成品：</b><br />\r\n3寸精美卡片2张<br />\r\n<font color=\"gray\">※以上成品照片均选自精修</font></li>\r\n</ul>\r\n','1424828591','1488246187','0','0','0','0','499.0000','1.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【建新镇】经典唐韵','14','0','1424828535','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed98ce465fa.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424828535','1424828633','ux21476ux35013,ux20165ux21806,ux23130ux32433,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux52ux57ux57,ux20165ux21806ux49ux20803ux65281ux20215ux20540ux52ux57ux57ux20803ux30340ux21476ux35013ux23130ux32433ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','古装,仅售,婚纱,价值,提供,免费,WiFi,499,仅售1元！价值499元的古装婚纱，提供免费WiFi。','ux29983ux27963ux26381ux21153,ux23130ux32433ux25668ux24433','生活服务,婚纱摄影','','','ux31119ux24314,ux31119ux24030,ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','福建,福州,杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','','','119.300928','26.091942','0','0','0','0','1','10.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('66','仅售98元！价值236元的爱丁堡尊贵养生会所单人养生保健套餐，提供免费自助餐+免费上网，男女皆享，节假日通用。','爱丁堡尊贵养生会所','9','33','./public/attachment/201502/25/16/54ed864826695.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed864826695.jpg\" /></p>\r\n','0','0','0','0','0','0','236.0000','98.0000','15','1','0','1','0','0','0','1','1','0','0','9.0000','9','【紫阳/象园】爱丁堡尊贵养生会所','8','0','1424824020','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed864826695.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824020','1424824051','ux29233ux19969ux22561,ux20813ux36153ux19978ux32593,ux20859ux29983ux20445ux20581,ux33258ux21161ux39184,ux33410ux20551ux26085,ux21333ux20154,ux20165ux21806,ux20250ux25152,ux23562ux36149,ux22871ux39184,ux20165ux21806ux57ux56ux20803ux65281ux20215ux20540ux50ux51ux54ux20803ux30340ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152ux21333ux20154ux20859ux29983ux20445ux20581ux22871ux39184ux65292ux25552ux20379ux20813ux36153ux33258ux21161ux39184ux43ux20813ux36153ux19978ux32593ux65292ux30007ux22899ux30342ux20139ux65292ux33410ux20551ux26085ux36890ux29992ux12290','爱丁堡,免费上网,养生保健,自助餐,节假日,单人,仅售,会所,尊贵,套餐,仅售98元！价值236元的爱丁堡尊贵养生会所单人养生保健套餐，提供免费自助餐+免费上网，男女皆享，节假日通用。','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','90.0000','0','1','0','0','0','2','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('67','仅售158元！价值236元的精油开背套餐，男女不限，提供免费WiFi。','精油开背套餐','9','33','./public/attachment/201502/25/16/54ed8ec119a62.jpg','<table id=\"yui_3_16_0_1_1424852915047_1346\" class=\"deal-menu\" style=\"border-top:medium none;border-right:medium none;width:702px;white-space:normal;word-spacing:0px;border-collapse:collapse;border-bottom:medium none;text-transform:none;color:#222222;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;border-spacing:0px;border-left:medium none;margin-top:0px;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><tbody id=\"yui_3_16_0_1_1424852915047_1345\"><tr id=\"yui_3_16_0_1_1424852915047_1344\"><th id=\"yui_3_16_0_1_1424852915047_1343\" class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#f0f0f0;\" colspan=\"2\">套餐内容</th>\r\n<th class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">单价</th>\r\n<th class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">数量/规格</th>\r\n<th class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px solid;word-break:break-all;font-weight:bold;color:#333333;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#f0f0f0;\">小计</th>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\" colspan=\"2\">精油开背</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥198</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥198</td>\r\n</tr>\r\n<tr><td class=\"subline subline-left\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px dotted;width:134px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;font-weight:700;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\" rowspan=\"4\"><span class=\"title\" style=\"font-weight:bold;padding-bottom:0px;padding-top:0px;padding-left:0px;padding-right:10px;\">4选1</span></td>\r\n<td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">修脚</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">刮痧</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">拔罐</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n<tr><td class=\"name\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:auto;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;padding-left:10px;margin:0px;border-left-style:none;padding-right:10px;background-color:#ffffff;\">采耳</td>\r\n<td class=\"price\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n<td class=\"amount\" style=\"border-top-style:none;word-wrap:break-word;border-right:#e8e8e8 1px;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:center;padding-top:8px;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">1次</td>\r\n<td class=\"subtotal\" style=\"border-top-style:none;word-wrap:break-word;font-family:arial, sans-serif;width:85px;border-bottom:#e8e8e8 1px dotted;word-break:break-all;color:#666666;padding-bottom:8px;text-align:right;padding-top:8px;border-right-style:none;padding-left:10px;margin:0px;border-left:#e8e8e8 1px;padding-right:10px;background-color:#ffffff;\">¥38</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"deal-menu-summary\" style=\"white-space:normal;word-spacing:0px;border-bottom:#e8e8e8 1px solid;text-transform:none;color:#666666;padding-bottom:10px;text-align:right;padding-top:0px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:10px 0px;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">价值:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;text-align:left;display:inline-block;padding-right:20px;\">¥236</span>美团价:<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"inline-block worth price\" style=\"word-wrap:normal;font-family:arial, sans-serif;min-width:10px;word-break:normal;zoom:1;font-weight:bold;color:#ea4f01;text-align:left;display:inline-block;padding-right:0px;\">¥158</span></p>\r\n<ul class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">服务流程/时长：精油开背（约70分钟）→修脚/刮痧/拔罐/采耳（4选1）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">提供免费自助餐+免费上网，23:00后过夜需到店另付35元</li>\r\n</ul>\r\n','0','0','0','0','0','0','236.0000','158.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【五一广场】爱丁堡尊贵养生会所','9','0','1424824226','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed8ed63ee25.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824226','1424825975','ux31934ux27833,ux20165ux21806,ux22871ux39184,ux30007ux22899,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux50ux51ux54,ux49ux53ux56,ux20165ux21806ux49ux53ux56ux20803ux65281ux20215ux20540ux50ux51ux54ux20803ux30340ux31934ux27833ux24320ux32972ux22871ux39184ux65292ux30007ux22899ux19981ux38480ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','精油,仅售,套餐,男女,价值,提供,免费,WiFi,236,158,仅售158元！价值236元的精油开背套餐，男女不限，提供免费WiFi。','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','100.0000','0','0','0','0','0','4','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('68','仅售228元！最高价值446元的希腊之旅套餐A/希腊之旅套餐B2选1，男女不限，提供免费WiFi。','爱丁堡尊贵养生会所','9','33','./public/attachment/201502/25/16/54ed8e6b70b46.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/16/54ed864826695.jpg\" /></p>\r\n<br />\r\n<ul class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">希腊之旅套餐B服务流程/时长：全身油推（约100分钟）→修脚/刮痧/拔罐/采耳（4选1）</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">提供免费自助餐+免费上网，23:00后过夜需到店另付35元</li>\r\n</ul>\r\n','0','0','0','0','0','0','446.0000','228.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【五一广场】爱丁堡尊贵养生会所-希腊之旅套餐','10','0','1424824429','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/16/54ed8e6b70b46.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824429','1424825871','ux24076ux33098,ux22871ux39184,ux20043ux26053,ux20165ux21806,ux30007ux22899,ux26368ux39640,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux20165ux21806ux50ux50ux56ux20803ux65281ux26368ux39640ux20215ux20540ux52ux52ux54ux20803ux30340ux24076ux33098ux20043ux26053ux22871ux39184ux65ux47ux24076ux33098ux20043ux26053ux22871ux39184ux66ux50ux36873ux49ux65292ux30007ux22899ux19981ux38480ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','希腊,套餐,之旅,仅售,男女,最高,价值,提供,免费,WiFi,仅售228元！最高价值446元的希腊之旅套餐A/希腊之旅套餐B2选1，男女不限，提供免费WiFi。','ux20241ux38386ux23089ux20048,ux21654ux21857,ux36275ux30103ux25353ux25705','休闲娱乐,咖啡,足疗按摩','','','ux31119ux24314,ux31119ux24030,ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','福建,福州,晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','200.0000','0','0','0','0','0','4','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('76','仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！','超人新款静音理发器','0','33','./public/attachment/201502/26/10/54ee7f7135221.jpg','<p align=\"center\">&nbsp;</p>\r\n<dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">&nbsp;</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">产品咨询</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">商家电话：15922439667；联系时间：09:00-18:00</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送范围</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">全国（除除港澳台、新疆、青海、西藏及偏远地区除外及港澳台地区外）均可配送</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">快递公司</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单使用<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.800bestex.com//\" target=\"_blank\"><b>汇通快运</b></a>（400-956-5656）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.zto.cn/\" target=\"_blank\"><b>中通快递</b></a>（400-827-0270）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.yundaex.com/\" target=\"_blank\"><b>韵达快递</b></a>（400-821-6789）</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送费用</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单包邮，配送范围内无需再额外支付邮费</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送时间</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">2月10日-25日购买的团购商品会尽全力在3月2日前发出</dd><p align=\"center\"><img alt=\"\" src=\"./public/attachment/201502/26/10/54ee7f7135221.jpg\" border=\"0\" /></p>\r\n','0','0','0','0','0','0','168.0000','24.8000','0','0','1','1','0','1','1','1','1','0','0','0.0000','0','【包邮】超人新款静音理发器','18','0','1424887626','0','0','0','0','','35.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee7f7135221.jpg','0','1','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424887626','1424893166','ux29702ux21457ux22120,ux38745ux38899,ux28165ux27905ux21047,ux20080ux23601ux36865,ux20165ux21806,ux28070ux28369ux27833,ux36229ux20154,ux26032ux27454,ux21487ux29992,ux25104ux20154,ux20165ux21806ux50ux52ux46ux56ux20803ux65281ux20215ux20540ux49ux54ux56ux20803ux30340ux36229ux20154ux26032ux27454ux38745ux38899ux29702ux21457ux22120ux49ux20010ux65292ux36229ux38745ux38899ux65292ux19981ux22841ux21457ux65292ux20799ux31461ux25104ux20154ux30342ux21487ux29992ux65281ux20080ux23601ux36865ux52ux20010ux23450ux20301ux26803ux43ux28070ux28369ux27833ux43ux28165ux27905ux21047ux65281','理发器,静音,清洁刷,买就送,仅售,润滑油,超人,新款,可用,成人,仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！','','','ux25968ux30721ux30005ux22120','数码电器','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','20.0000','1','0','0','0','0','256','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('77','仅售79元！价值299元的大显时尚老人手机1台，钢琴烤漆 锌合金边框 超强震动 3D大喇叭 MP3 收音机 语音王 大字大键大声','大显时尚老人手机','0','33','./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg\" /></p>\r\n','0','0','0','0','0','0','299.0000','79.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【快递】大显时尚老人手机','19','0','1424890408','0','0','0','0','','1000.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8a2ed3c4f.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424890408','1424890408','ux22823ux26174,ux22823ux38190,ux28900ux28422,ux38156ux21512ux37329,ux36793ux26694,ux22823ux23383,ux20165ux21806,ux25910ux38899ux26426,ux38663ux21160,ux21895ux21485,ux20165ux21806ux55ux57ux20803ux65281ux20215ux20540ux50ux57ux57ux20803ux30340ux22823ux26174ux26102ux23578ux32769ux20154ux25163ux26426ux49ux21488ux65292ux38050ux29748ux28900ux28422ux38156ux21512ux37329ux36793ux26694ux36229ux24378ux38663ux21160ux51ux68ux22823ux21895ux21485ux77ux80ux51ux25910ux38899ux26426ux35821ux38899ux29579ux22823ux23383ux22823ux38190ux22823ux22768','大显,大键,烤漆,锌合金,边框,大字,仅售,收音机,震动,喇叭,仅售79元！价值299元的大显时尚老人手机1台，钢琴烤漆 锌合金边框 超强震动 3D大喇叭 MP3 收音机 语音王 大字大键大声','','','ux25968ux30721ux30005ux22120','数码电器','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','50.0000','1','0','0','0','0','128','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('69','仅售102元！价值125元的双人套餐，提供免费WiFi。','双人套餐','8','25','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/14/54ed6f616ffc5.jpg\" /></p>\r\n','1424824851','1488242447','0','0','0','0','125.0000','102.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【28店通用】盛世经典牛排','11','0','1424824857','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424824857','1424826479','ux21452ux20154,ux20165ux21806,ux22871ux39184,ux20215ux20540,ux25552ux20379,ux20813ux36153,ux87ux105ux70ux105,ux49ux48ux50,ux49ux50ux53,ux20165ux21806ux49ux48ux50ux20803ux65281ux20215ux20540ux49ux50ux53ux20803ux30340ux21452ux20154ux22871ux39184ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290','双人,仅售,套餐,价值,提供,免费,WiFi,102,125,仅售102元！价值125元的双人套餐，提供免费WiFi。','ux39184ux39278ux32654ux39135,ux29980ux28857','餐饮美食,甜点','','','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','','','119.299095','26.068075','0','0','0','0','1','90.0000','1','0','1','1','0','96','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('73','仅售388元！价值899元的福州明视眼镜单人配镜套餐，含全场599元以内镜框1次+全场300元以内镜片1次。','明视眼镜','10','36','./public/attachment/201502/25/17/54ed9b8e44904.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/25/17/54ed9b8e44904.jpg\" /></p>\r\n<ul id=\"yui_3_16_0_1_1424857966175_1421\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">配镜服务包含：镜架/镜片</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">镜架品牌：多品牌；型号：多款；材质：板材等</li>\r\n<li id=\"yui_3_16_0_1_1424857966175_1420\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">镜片品牌：多品牌；型号：多款；材质：树脂；非球面</li>\r\n<li id=\"yui_3_16_0_1_1424857966175_1424\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">适用度数范围：近视800度以内、散光200度以内，不支持老花</li>\r\n</ul>\r\n','1424829400','1519782997','0','0','0','0','899.0000','388.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【37店通用】明视眼镜','15','0','1424829412','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9b8e44904.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424829412','1424829463','ux20197ux20869,ux20840ux22330,ux26126ux35270,ux37197ux38236,ux38236ux26694,ux31119ux24030,ux38236ux29255,ux21333ux20154,ux20165ux21806,ux22871ux39184,ux20165ux21806ux51ux56ux56ux20803ux65281ux20215ux20540ux56ux57ux57ux20803ux30340ux31119ux24030ux26126ux35270ux30524ux38236ux21333ux20154ux37197ux38236ux22871ux39184ux65292ux21547ux20840ux22330ux53ux57ux57ux20803ux20197ux20869ux38236ux26694ux49ux27425ux43ux20840ux22330ux51ux48ux48ux20803ux20197ux20869ux38236ux29255ux49ux27425ux12290','以内,全场,明视,配镜,镜框,福州,镜片,单人,仅售,套餐,仅售388元！价值899元的福州明视眼镜单人配镜套餐，含全场599元以内镜框1次+全场300元以内镜片1次。','ux29983ux27963ux26381ux21153,ux37197ux38236','生活服务,配镜','','','ux31119ux24314,ux31119ux24030,ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','','','119.350423','26.058986','0','0','0','0','1','350.0000','1','0','0','1','0','324','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('74','仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。','小灰灰博客测试','10','36','./public/attachment/201502/25/17/54ed9d05a1020.jpg','<ul id=\"yui_3_16_0_1_1424858312999_1303\" class=\"list\" style=\"white-space:normal;word-spacing:0px;text-transform:none;color:#666666;padding-bottom:0px;padding-top:0px;font:14px/21px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:18px;margin:10px 0px 15px;letter-spacing:normal;padding-right:0px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>店内人均消费参考价</b>：200元</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>适用范围</b>：仅适用于镜片</li>\r\n<li style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\"><b>店内部分服务价格参考</b>：<br />\r\n品牌镜片（300元/对）</li>\r\n<li id=\"yui_3_16_0_1_1424858312999_1302\" style=\"list-style-type:disc;list-style-position:outside;padding-bottom:0px;padding-top:0px;padding-left:0px;margin:0px 0px 5px;padding-right:0px;\">不限制度数范围</li>\r\n</ul>','1424829610','1488247208','0','0','0','0','100.0000','75.0000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【36店通用】明视眼镜','16','0','1424829616','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/17/54ed9d05a1020.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424829616','1435596770','ux38236ux29255,ux20195ux37329ux21048,ux21472ux21152,ux20165ux21806,ux29992ux20110,ux20215ux20540,ux20351ux29992,ux24352ux65292ux20165,ux49ux48ux48,ux20165ux21806ux55ux53ux20803ux65281ux20215ux20540ux49ux48ux48ux20803ux30340ux38236ux29255ux20195ux37329ux21048ux49ux24352ux65292ux20165ux36866ux29992ux20110ux38236ux29255ux65292ux21487ux21472ux21152ux20351ux29992ux12290','镜片,代金券,叠加,仅售,用于,价值,使用,张，仅,100,仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。','ux29983ux27963ux26381ux21153,ux37197ux38236','生活服务,配镜','','','ux31119ux24314,ux31119ux24030,ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','福建,福州,江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','','','119.350423','26.058986','0','0','0','0','1','70.0000','0','1','0','0','0','18','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('75','仅售8.8元！价值38元的色格安卓数据充电线1件，色格 安卓数据充电线 适用于三星等安卓手机！','安卓数据充电线','0','33','./public/attachment/201502/26/09/54ee7e065be04.jpg','<p align=\"center\">&nbsp;</p>\r\n<p align=\"center\">&nbsp;</p>\r\n<dt id=\"yui_3_16_0_1_1424915842939_1873\" style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">商家QQ</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><a title=\"点击这里给我发消息\" style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://wpa.qq.com/msgrd?v=3&amp;uin=915627711&amp;site=qq&amp;menu=yes\" target=\"_blank\">915627711<img style=\"max-width:702px;border-top:0px;border-right:0px;border-bottom:0px;border-left:0px;\" border=\"0\" alt=\"点击这里给我发消息\" src=\"http://wpa.qq.com/pa?p=1:915627711:42\" /></a></dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">产品咨询</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">商家电话：0755-88865446；联系时间：09:00-18:00</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送范围</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">全国（除新疆西藏及港澳台地区外）均可配送</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">快递公司</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单使用<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.sto.cn/\" target=\"_blank\"><b>申通快递</b></a>（400-889-5543）、<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.yto.net.cn/cn/index/index.html\" target=\"_blank\"><b>圆通快递</b></a>（95554/021-69777888）</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送费用</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">本单邮费5元，购买2件及以上包邮</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">配送时间</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">2月10日-25日购买的团购商品会尽全力在3月2日前发出</dd><dt style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;width:140px;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;float:left;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:700 14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px;min-height:24px;letter-spacing:normal;padding-right:10px;text-indent:0px;-webkit-font-smoothing:antialiased;-webkit-text-stroke-width:0px;\">售后保障</dt><dd style=\"word-wrap:break-word;border-top:#eeeeee 1px solid;white-space:pre-wrap;word-spacing:0px;text-transform:none;word-break:break-all;color:#666666;padding-bottom:8px;text-align:left;padding-top:8px;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;padding-left:10px;margin:0px 0px 0px 160px;min-height:24px;border-left:#eeeeee 1px solid;letter-spacing:normal;padding-right:10px;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">如需退换货，请进入<a style=\"text-decoration:none;color:#2bb8aa;\" href=\"http://www.meituan.com/orders\" target=\"_blank\">我的订单</a></dd><p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/09/54ee7e065be04.jpg\" /></p>\r\n','0','0','0','100','0','0','38.0000','8.8000','0','0','1','1','0','0','0','1','1','0','1','0.0000','0','【2件包邮】色格安卓数据充电线','17','0','1424887336','0','0','0','0','','20.0000','1','1','0','0.0000','./public/attachment/201502/26/09/54ee7e065be04.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424887336','1424887410','ux23433ux21331,ux30005ux32447,ux26143ux31561,ux25968ux25454,ux20165ux21806,ux29992ux20110,ux20215ux20540,ux25163ux26426,ux56ux46ux56,ux20165ux21806ux56ux46ux56ux20803ux65281ux20215ux20540ux51ux56ux20803ux30340ux33394ux26684ux23433ux21331ux25968ux25454ux20805ux30005ux32447ux49ux20214ux65292ux33394ux26684ux23433ux21331ux25968ux25454ux20805ux30005ux32447ux36866ux29992ux20110ux19977ux26143ux31561ux23433ux21331ux25163ux26426ux65281','安卓,电线,星等,数据,仅售,用于,价值,手机,8.8,仅售8.8元！价值38元的色格安卓数据充电线1件，色格 安卓数据充电线 适用于三星等安卓手机！','','','ux25968ux30721ux30005ux22120','数码电器','','','','','119.339719','26.071564','0','0','0','0','1','5.0000','1','0','0','0','0','256','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('70','仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中','百度烤肉','8','26','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"http://test3.5maiche.cn/public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg\" /><table style=\" border-top:medium none; border-right:medium none; width:702px; border-collapse:collapse; border-bottom:medium none; color:#222222; border-spacing:0px; border-left:medium none; margin-top:0px; background-color:#ffffff; \"><tbody><tr><th style=\" border-top-style:none; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px solid; font-weight:bold; color:#333333; text-align:left; border-left-style:none; background-color:#f0f0f0; \" colspan=\"2\">套餐内容</th>\r\n<th style=\" border-top-style:none; font-family:arial, sans-serif; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px solid; font-weight:bold; color:#333333; text-align:center; border-left:#e8e8e8 1px; background-color:#f0f0f0; \">单价</th>\r\n<th style=\" border-top-style:none; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px solid; font-weight:bold; color:#333333; text-align:center; border-left:#e8e8e8 1px; background-color:#f0f0f0; \">数量/规格</th>\r\n<th style=\" border-top-style:none; font-family:arial, sans-serif; border-bottom:#e8e8e8 1px solid; font-weight:bold; color:#333333; text-align:right; border-right-style:none; border-left:#e8e8e8 1px; background-color:#f0f0f0; \">小计</th>\r\n</tr>\r\n<tr><td style=\" border-top-style:none; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px dotted; color:#666666; text-align:left; border-left-style:none; background-color:#ffffff; \" colspan=\"2\">百度烤肉单人自助午餐</td>\r\n<td style=\" border-top-style:none; font-family:arial, sans-serif; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px dotted; color:#666666; text-align:center; border-left:#e8e8e8 1px; background-color:#ffffff; \">¥59</td>\r\n<td style=\" border-top-style:none; border-right:#e8e8e8 1px; border-bottom:#e8e8e8 1px dotted; color:#666666; text-align:center; border-left:#e8e8e8 1px; background-color:#ffffff; \">1位</td>\r\n<td style=\" border-top-style:none; font-family:arial, sans-serif; border-bottom:#e8e8e8 1px dotted; color:#666666; text-align:right; border-right-style:none; border-left:#e8e8e8 1px; background-color:#ffffff; \">¥59</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</p>\r\n<p style=\" color:#666666; text-align:right; background-color:#ffffff; text-indent:0px; \">价值:<span> </span><span style=\" font-family:arial, sans-serif; \">¥59</span>方维价:<span> </span><span style=\" font-family:arial, sans-serif; color:#ea4f01; \">¥49.9</span></p>\r\n<ul style=\" color:#666666; background-color:#ffffff; text-indent:0px; \"><li>百度烤肉单人自助午餐：11:00-14:00</li>\r\n<li>最多可用餐1.5小时</li>\r\n<li>周六周日需到店另付五元才可使用美团券</li>\r\n<li>法定节假日到店另付5元</li>\r\n</ul>\r\n<p align=\"center\"> </p>\r\n<p align=\"center\"> </p>','1424824980','1519778580','0','0','0','0','59.0000','49.9000','15','1','0','1','0','0','0','1','1','0','0','0.0000','0','【万象城/宝龙广场】百度烤肉','41','13','1424825016','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1424825016','1437594311','ux28900ux32905,ux25250ux36141,ux21333ux20154,ux20165ux21806,ux21320ux39184,ux30427ux22823,ux24320ux19994,ux28779ux29190,ux29305ux20215,ux33258ux21161,ux20165ux21806ux52ux57ux46ux57ux48ux20803ux65281ux20215ux20540ux53ux57ux20803ux30340ux30334ux24230ux28900ux32905ux21333ux20154ux33258ux21161ux21320ux39184ux65292ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux12290ux20840ux26032ux21319ux32423ux65292ux30427ux22823ux24320ux19994ux65292ux29305ux20215ux20248ux24800ux28779ux29190ux25250ux36141ux20013','烤肉,抢购,单人,仅售,午餐,盛大,开业,火爆,特价,自助,仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中','ux39184ux39278ux32654ux39135','餐饮美食','','','ux31119ux24314,ux31119ux24030','福建,福州','','','119.296641','26.070661','0','0','0','0','1','40.0000','0','1','0','0','0','6','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('99','5454545454','65454','0','39','./public/attachment/201507/27/01/f7700b7037d936d0caac6139fe94c71175.jpg','34434343<img src=\"./public/attachment/201507/27/01/0acb8f7d5b41808e50e097bdf1d0eb7441.jpg\" alt=\"\" />','0','0','0','0','0','0','100.0000','200.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','','42','10','1437903471','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201507/27/01/3e1e95d340d98678fa23a99a976d3f2938.jpg','0','0','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1437903471','1437903471','ux53ux52ux53ux52ux53ux52ux53ux52ux53ux52,ux19971ux21305ux29436','5454545454,七匹狼','','','ux26381ux35013,ux22899ux35013','服装,女装','ux21271ux20140','北京','','','0','0','13','0','0','0','0','300.0000','1','0','0','0','1','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('78','仅售299元！价值499元的奥克斯5Ｌ开水瓶1台，奥克斯 HX-8063电热水瓶不锈钢六段保温5l开水瓶','奥克斯5Ｌ开水瓶','0','33','./public/attachment/201502/26/10/54ee8af92fc7a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8af92fc7a.jpg\" /></p>\r\n','0','0','0','0','0','0','499.0000','299.0000','0','0','0','1','0','0','0','1','1','0','0','0.0000','0','【包邮】奥克斯5Ｌ开水瓶','20','0','1424890516','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8af92fc7a.jpg','0','0','0','','','','0','0','0','0','0','','0','0','35','1','0','0.0000','1424890516','1424890533','ux24320ux27700ux29942,ux22885ux20811ux26031,ux20845ux27573,ux28909ux27700ux29942,ux20165ux21806,ux20445ux28201,ux19981ux38152ux38050,ux20215ux20540,ux56ux48ux54ux51,ux50ux57ux57,ux20165ux21806ux50ux57ux57ux20803ux65281ux20215ux20540ux52ux57ux57ux20803ux30340ux22885ux20811ux26031ux53ux65324ux24320ux27700ux29942ux49ux21488ux65292ux22885ux20811ux26031ux72ux88ux45ux56ux48ux54ux51ux30005ux28909ux27700ux29942ux19981ux38152ux38050ux20845ux27573ux20445ux28201ux53ux108ux24320ux27700ux29942','开水瓶,奥克斯,六段,热水瓶,仅售,保温,不锈钢,价值,8063,299,仅售299元！价值499元的奥克斯5Ｌ开水瓶1台，奥克斯 HX-8063电热水瓶不锈钢六段保温5l开水瓶','','','ux25968ux30721ux30005ux22120','数码电器','','','','','119.339719','26.071564','0','0','0','0','1','250.0000','1','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('79','仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....','梦舒纷高领打底衫','0','33','./public/attachment/201502/26/10/54ee8b9b7587f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8b9b7587f.jpg\" /></p>\r\n','0','0','0','0','0','0','69.0000','39.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】梦舒纷高领打底衫','21','0','1424890686','0','0','0','0','','500.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8b9b7587f.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890686','1424890686','ux25171ux24213,ux39640ux39046,ux20165ux21806,ux31616ux32422,ux31179ux20908,ux38754ux26009,ux39640ux31471,ux27454ux24335,ux23450ux21046,ux26032ux27454,ux20165ux21806ux51ux57ux20803ux65281ux20215ux20540ux54ux57ux20803ux30340ux26790ux33298ux32439ux39640ux39046ux25171ux24213ux34923ux49ux20214ux65292ux50ux48ux49ux52ux24180ux26032ux27454ux31616ux32422ux22823ux26041ux65292ux39640ux31471ux23450ux21046ux38754ux26009ux65292ux30334ux25645ux27454ux24335ux65292ux31179ux20908ux32654ux22899ux24517ux22791ux25171ux24213ux34923ux65292ux25104ux23601ux33258ux24049ux30340ux32654ux20029ux65292ux23601ux20174ux36825ux24320ux22987ux46ux46ux46ux46','打底,高领,仅售,简约,秋冬,面料,高端,款式,定制,新款,仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','30.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('80','仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩','冰爱长袖针织披肩','0','33','./public/attachment/201502/26/10/54ee8c072cb42.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/10/54ee8c072cb42.jpg\" /></p>\r\n','0','0','0','0','0','0','698.0000','126.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】冰爱长袖针织披肩','22','0','1424890798','0','0','0','0','','250.0000','1','0','0','0.0000','./public/attachment/201502/26/10/54ee8c072cb42.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890798','1424890798','ux25259ux32937,ux38271ux34966,ux38024ux32455,ux20165ux21806,ux20215ux20540,ux54ux57ux56,ux49ux50ux53,ux49ux48,ux20165ux21806ux49ux50ux53ux20803ux65281ux20215ux20540ux54ux57ux56ux20803ux30340ux20912ux29233ux38271ux34966ux38024ux32455ux25259ux32937ux49ux20214ux65292ux20912ux29233ux38271ux34966ux38024ux32455ux25259ux32937ux49ux48ux45ux25259ux32937','披肩,长袖,针织,仅售,价值,698,125,10,仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','100.0000','1','0','0','0','0','320','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('81','仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫','魅货莫代尔不规则衫','0','33','./public/attachment/201502/26/11/54ee8c68e932a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8c68e932a.jpg\" /></p>\r\n','0','0','0','0','0','0','99.0000','39.0000','0','0','1','1','0','1','1','1','1','0','0','0.0000','0','【包邮】魅货莫代尔不规则衫','23','0','1424890893','0','0','0','0','','190.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8c68e932a.jpg','0','1','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1424890893','1424890893','ux19981ux35268ux21017,ux24320ux34923,ux33707ux20195ux23572,ux20165ux21806,ux20215ux20540,ux20165ux21806ux51ux57ux20803ux65281ux20215ux20540ux57ux57ux20803ux30340ux39749ux36135ux33707ux20195ux23572ux19981ux35268ux21017ux34923ux49ux20214ux65292ux39749ux36135ux33707ux20195ux23572ux19981ux35268ux21017ux24320ux34923','不规则,开衫,莫代尔,仅售,价值,仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫','','','ux26381ux35013,ux22899ux35013','服装,女装','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','30.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('82','仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图','影响孩子的四大名著','0','33','./public/attachment/201502/26/11/54ee8d61e43bd.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8d61e43bd.jpg\" /></p>\r\n','0','0','0','0','0','0','103.2000','59.8000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】影响孩子的四大名著','24','0','1424891147','0','0','0','0','','180.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8d61e43bd.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891147','1424891147','ux22235ux22823ux21517ux33879,ux23401ux23376,ux24433ux21709,ux24425ux22270,ux20165ux21806,ux20215ux20540,ux49ux48ux51ux46ux50,ux53ux57ux46ux56,ux49ux53ux53,ux20165ux21806ux53ux57ux46ux56ux20803ux65281ux20215ux20540ux49ux48ux51ux46ux50ux20803ux30340ux24433ux21709ux23401ux23376ux30340ux22235ux22823ux21517ux33879ux49ux22871ux65292ux24433ux21709ux23401ux23376ux30340ux22235ux22823ux21517ux33879ux52ux20876ux49ux22871ux12289ux27599ux20876ux49ux53ux53ux39029ux12289ux49ux54ux24320ux12289ux27599ux39029ux37117ux26377ux24425ux22270','四大名著,孩子,影响,彩图,仅售,价值,103.2,59.8,155,仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','50.0000','1','0','0','0','0','512','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('83','仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机','骥龙免洗宝宝饭兜','0','33','./public/attachment/201502/26/11/54ee8e0243272.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8e0243272.jpg\" /></p>\r\n','0','0','0','0','0','0','59.0000','9.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】骥龙免洗宝宝饭兜','25','0','1424891298','0','0','0','0','','200.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8e0243272.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891298','1424891298','ux23453ux23453,ux21152ux21402,ux24359ux24230,ux25481ux33853,ux32784ux29992,ux36192ux21697,ux20165ux21806,ux24110ux25163,ux20154ux24615ux21270,ux36148ux24515,ux20165ux21806ux57ux46ux57ux20803ux65281ux20215ux20540ux53ux57ux20803ux30340ux39589ux40857ux20813ux27927ux23453ux23453ux39277ux20828ux49ux20214ux65292ux21152ux21402ux35774ux35745ux38450ux27490ux39135ux29289ux21520ux20986ux25481ux33853ux26448ux36136ux23433ux20840ux26580ux36719ux36148ux24515ux33298ux36866ux20154ux24615ux21270ux24359ux24230ux35753ux23453ux23453ux24863ux21463ux19981ux21040ux26463ux32538ux32784ux29992ux26131ux28165ux27905ux26159ux23453ux23453ux21507ux39277ux21917ux27748ux30340ux22909ux24110ux25163ux51ux33394ux21487ux36873ux36141ux20080ux52ux21482ux36865ux49ux21482ux36192ux21697ux39068ux33394ux38543ux26426','宝宝,加厚,弧度,掉落,耐用,赠品,仅售,帮手,人性化,贴心,仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','9.0000','1','0','0','0','0','128','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('84','仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！','奥兰奇儿童动物书包','0','33','./public/attachment/201502/26/11/54ee8e5a53e8a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8e5a53e8a.jpg\" /></p>\r\n','0','0','0','0','0','0','99.0000','189.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】奥兰奇儿童动物书包','26','0','1424891383','0','0','0','0','','350.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8e5a53e8a.jpg','0','0','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891383','1424891383','ux21345ux36890ux20070,ux20165ux21806,ux20070ux21253,ux21160ux29289,ux29233ux19978,ux20215ux20540,ux21487ux29233,ux23453ux23453,ux20799ux31461,ux23398ux20064,ux20165ux21806ux49ux57ux46ux57ux20803ux65281ux20215ux20540ux57ux57ux20803ux30340ux22885ux20848ux22855ux20799ux31461ux21160ux29289ux20070ux21253ux49ux20010ux65292ux21487ux29233ux21345ux36890ux20070ux21253ux65292ux35753ux23453ux23453ux29233ux19978ux23398ux20064ux65281','卡通书,仅售,书包,动物,爱上,价值,可爱,宝宝,儿童,学习,仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','15.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('85','仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！','励高早教胎教故事机','0','33','./public/attachment/201502/26/11/54ee8ea70c607.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee8ea70c607.jpg\" /></p>\r\n','0','0','0','0','0','0','268.0000','69.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】励高早教胎教故事机','27','0','1424891461','0','0','0','0','','700.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee8ea70c607.jpg','0','1','0','','','','0','0','0','0','0','','0','0','29','1','0','0.0000','1424891461','1424891461','ux23453ux36523,ux26089ux25945,ux33453ux27604,ux30005ux25239,ux25554ux21345,ux39640ux20445ux30495,ux32974ux25945,ux26126ux28783,ux32858ux21512ux29289,ux29233ux19981ux37322ux25163,ux20165ux21806ux54ux56ux20803ux65281ux20215ux20540ux50ux57ux56ux20803ux30340ux21169ux39640ux26089ux25945ux32974ux25945ux25925ux20107ux26426ux49ux20010ux65292ux20869ux32622ux39640ux28165ux20016ux23500ux26089ux25945ux36164ux28304ux20869ux23481ux65292ux21487ux25554ux21345ux25193ux20805ux20869ux23384ux23481ux37327ux65292ux20805ux30005ux25239ux25684ux65292ux26126ux28783ux23433ux25242ux65292ux39640ux20445ux30495ux72ux73ux70ux73ux21895ux21485ux65292ux32858ux21512ux29289ux30005ux27744ux65292ux20351ux29992ux26102ux38388ux38271ux65292ux21152ux19978ux36229ux33804ux36896ux22411ux65292ux35753ux23401ux23376ux20204ux29233ux19981ux37322ux25163ux12290ux33453ux27604ux22920ux21674ux20204ux36214ux24555ux25226ux22905ux24102ux21040ux23453ux23453ux36523ux36793ux21543ux65281','宝身,早教,芭比,电抗,插卡,高保真,胎教,明灯,聚合物,爱不释手,仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！','','','ux27597ux23156ux29992ux21697','母婴用品','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','60.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('86','仅售8.9元！价值39元的下曹吸盘收纳置物架1个，双吸盘设计，瓷砖.不锈钢等光滑平整表面都可放置，可挂浴室墙上，也可挂水槽上','下曹吸盘收纳置物架','0','33','./public/attachment/201502/26/11/54ee903778026.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee903778026.jpg\" /></p>\r\n','0','0','0','0','0','0','39.0000','8.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】下曹吸盘收纳置物架','28','0','1424891867','0','0','0','0','','100.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee903778026.jpg','0','0','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424891867','1424891867','ux21560ux30424,ux32622ux29289ux26550,ux27700ux27133,ux25910ux32435,ux24179ux25972,ux29943ux30742,ux20165ux21806,ux20809ux28369,ux25918ux32622,ux28020ux23460,ux20165ux21806ux56ux46ux57ux20803ux65281ux20215ux20540ux51ux57ux20803ux30340ux19979ux26361ux21560ux30424ux25910ux32435ux32622ux29289ux26550ux49ux20010ux65292ux21452ux21560ux30424ux35774ux35745ux65292ux29943ux30742ux46ux19981ux38152ux38050ux31561ux20809ux28369ux24179ux25972ux34920ux38754ux37117ux21487ux25918ux32622ux65292ux21487ux25346ux28020ux23460ux22681ux19978ux65292ux20063ux21487ux25346ux27700ux27133ux19978','吸盘,置物架,水槽,收纳,平整,瓷砖,仅售,光滑,放置,浴室,仅售8.9元！价值39元的下曹吸盘收纳置物架1个，双吸盘设计，瓷砖.不锈钢等光滑平整表面都可放置，可挂浴室墙上，也可挂水槽上','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','8.0000','1','0','0','0','0','192','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('87','仅售14.9元！价值66元的雨含浴室防滑垫1张，透明材质，环保无毒，两色可选，带吸盘，选择它给您的家人多一份关爱','雨含浴室防滑垫','0','33','./public/attachment/201502/26/11/54ee909199d43.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee909199d43.jpg\" /></p>\r\n','0','0','0','0','0','0','66.0000','14.9000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【2件包邮】雨含浴室防滑垫','29','0','1424891954','0','0','0','0','','259.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee909199d43.jpg','0','1','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424891954','1424891954','ux20154ux22810,ux38450ux28369ux22443,ux21560ux30424,ux20165ux21806,ux26080ux27602,ux28020ux23460,ux26448ux36136,ux20851ux29233,ux36879ux26126,ux20215ux20540,ux20165ux21806ux49ux52ux46ux57ux20803ux65281ux20215ux20540ux54ux54ux20803ux30340ux38632ux21547ux28020ux23460ux38450ux28369ux22443ux49ux24352ux65292ux36879ux26126ux26448ux36136ux65292ux29615ux20445ux26080ux27602ux65292ux20004ux33394ux21487ux36873ux65292ux24102ux21560ux30424ux65292ux36873ux25321ux23427ux32473ux24744ux30340ux23478ux20154ux22810ux19968ux20221ux20851ux29233','人多,防滑垫,吸盘,仅售,无毒,浴室,材质,关爱,透明,价值,仅售14.9元！价值66元的雨含浴室防滑垫1张，透明材质，环保无毒，两色可选，带吸盘，选择它给您的家人多一份关爱','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','10.0000','1','0','0','0','0','64','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('88','仅售65元！价值168元的克欧克切菜器刨丝器1套，专注于现代高品质厨房家居用品，爱自己，爱家人，爱厨房','克欧克切菜器刨丝器','0','33','./public/attachment/201502/26/11/54ee90ddeed8a.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/11/54ee90ddeed8a.jpg\" /></p>\r\n','0','0','0','0','0','0','168.0000','65.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','【包邮】克欧克切菜器刨丝器','30','0','1424892028','0','0','0','0','','360.0000','1','0','0','0.0000','./public/attachment/201502/26/11/54ee90ddeed8a.jpg','0','1','0','','','','0','0','0','0','0','','0','0','27','1','0','0.0000','1424892028','1424892028','ux27431ux20811,ux21416ux25151,ux20165ux21806,ux39640ux21697ux36136,ux19987ux27880,ux23478ux23621ux29992ux21697,ux23478ux20154,ux20215ux20540,ux33258ux24049,ux29616ux20195,ux20165ux21806ux54ux53ux20803ux65281ux20215ux20540ux49ux54ux56ux20803ux30340ux20811ux27431ux20811ux20999ux33756ux22120ux21032ux19997ux22120ux49ux22871ux65292ux19987ux27880ux20110ux29616ux20195ux39640ux21697ux36136ux21416ux25151ux23478ux23621ux29992ux21697ux65292ux29233ux33258ux24049ux65292ux29233ux23478ux20154ux65292ux29233ux21416ux25151','欧克,厨房,仅售,高品质,专注,家居用品,家人,价值,自己,现代,仅售65元！价值168元的克欧克切菜器刨丝器1套，专注于现代高品质厨房家居用品，爱自己，爱家人，爱厨房','','','ux23478ux23621ux26085ux29992','家居日用','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','','','119.339719','26.071564','0','0','0','0','1','60.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('89','128积分即可兑换价值128元的熙悦益智早教卡通狗1个，可爱的卡通小狗 颜色粉嫩又晶莹剔透，宝宝和妈妈一定会一见钟情的！ 装上电池后，启动开关，美妙的音乐响起，小狗的就会闪光，然后开始摇头晃脑的走路，尾巴摇摇，偶尔还会“旺旺”~~非常非常可爱哦，宝贝肯定超喜欢~','熙悦益智早教卡通狗','0','0','./public/attachment/201502/26/14/54eeb7fc4f10f.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb7fc4f10f.jpg\" /></p>\r\n','0','0','0','100','1','1','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-128','【包邮】熙悦益智早教卡通狗','31','0','1424902051','0','0','0','0','','450.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb7fc4f10f.jpg','0','1','0','','','','0','0','0','0','0','','0','3','29','1','0','0.0000','1424902051','1424902051','ux23567ux29399,ux21345ux36890,ux38750ux24120,ux26106ux26106,ux21487ux29233,ux19978ux30005,ux25671ux22836ux26179ux33041,ux31881ux23273,ux26089ux25945,ux26230ux33721ux21076ux36879,ux49ux50ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux49ux50ux56ux20803ux30340ux29081ux24742ux30410ux26234ux26089ux25945ux21345ux36890ux29399ux49ux20010ux65292ux21487ux29233ux30340ux21345ux36890ux23567ux29399ux39068ux33394ux31881ux23273ux21448ux26230ux33721ux21076ux36879ux65292ux23453ux23453ux21644ux22920ux22920ux19968ux23450ux20250ux19968ux35265ux38047ux24773ux30340ux65281ux35013ux19978ux30005ux27744ux21518ux65292ux21551ux21160ux24320ux20851ux65292ux32654ux22937ux30340ux38899ux20048ux21709ux36215ux65292ux23567ux29399ux30340ux23601ux20250ux38378ux20809ux65292ux28982ux21518ux24320ux22987ux25671ux22836ux26179ux33041ux30340ux36208ux36335ux65292ux23614ux24052ux25671ux25671ux65292ux20598ux23572ux36824ux20250ux8220ux26106ux26106ux8221ux126ux126ux38750ux24120ux38750ux24120ux21487ux29233ux21734ux65292ux23453ux36125ux32943ux23450ux36229ux21916ux27426ux126','小狗,卡通,非常,旺旺,可爱,上电,摇头晃脑,粉嫩,早教,晶莹剔透,128积分即可兑换价值128元的熙悦益智早教卡通狗1个，可爱的卡通小狗 颜色粉嫩又晶莹剔透，宝宝和妈妈一定会一见钟情的！ 装上电池后，启动开关，美妙的音乐响起，小狗的就会闪光，然后开始摇头晃脑的走路，尾巴摇摇，偶尔还会“旺旺”~~非常非常可爱哦，宝贝肯定超喜欢~','','','ux27597ux23156ux29992ux21697','母婴用品','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('90','45积分即可兑换价值199元的韩熙贞气垫BB霜1件，新品首发，裸妆之王，一步到位！1秒定妆，30秒完妆。买一送一（替换装）。','韩熙贞气垫BB霜','0','0','./public/attachment/201502/26/14/54eeb89a12e13.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb89a12e13.jpg\" /></p>\r\n','0','0','0','100','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-45','【包邮】韩熙贞气垫BB霜','32','0','1424902213','0','0','0','0','','350.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb89a12e13.jpg','0','0','0','','','','0','0','0','0','0','','0','3','27','1','0','0.0000','1424902213','1424902213','ux23450ux22918,ux27668ux22443,ux19968ux27493ux21040ux20301,ux25442ux35013,ux20817ux25442,ux39318ux21457,ux26032ux21697,ux21363ux21487,ux31215ux20998,ux20215ux20540,ux52ux53ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux49ux57ux57ux20803ux30340ux38889ux29081ux36126ux27668ux22443ux66ux66ux38684ux49ux20214ux65292ux26032ux21697ux39318ux21457ux65292ux35064ux22918ux20043ux29579ux65292ux19968ux27493ux21040ux20301ux65281ux49ux31186ux23450ux22918ux65292ux51ux48ux31186ux23436ux22918ux12290ux20080ux19968ux36865ux19968ux65288ux26367ux25442ux35013ux65289ux12290','定妆,气垫,一步到位,换装,兑换,首发,新品,即可,积分,价值,45积分即可兑换价值199元的韩熙贞气垫BB霜1件，新品首发，裸妆之王，一步到位！1秒定妆，30秒完妆。买一送一（替换装）。','','','ux23478ux23621ux26085ux29992','家居日用','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('91','19积分即可对话价值19元的媚西蜗牛精华面膜1片，买30片送蜗牛霜1盒！','媚西蜗牛精华面膜','0','0','./public/attachment/201502/26/14/54eeb904b45f9.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb904b45f9.jpg\" /></p>\r\n','0','0','0','100','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-19','【15件包邮】媚西蜗牛精华面膜','33','0','1424902308','0','0','0','0','','10.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb904b45f9.jpg','0','1','0','','','','0','0','0','0','0','','0','3','28','1','0','0.0000','1424902308','1424902308','ux34583ux29275,ux38754ux33180,ux21363ux21487,ux23545ux35805,ux31215ux20998,ux20215ux20540,ux31934ux21326,ux49ux57ux31215ux20998ux21363ux21487ux23545ux35805ux20215ux20540ux49ux57ux20803ux30340ux23194ux35199ux34583ux29275ux31934ux21326ux38754ux33180ux49ux29255ux65292ux20080ux51ux48ux29255ux36865ux34583ux29275ux38684ux49ux30418ux65281','蜗牛,面膜,即可,对话,积分,价值,精华,19积分即可对话价值19元的媚西蜗牛精华面膜1片，买30片送蜗牛霜1盒！','','','ux23621ux23478ux29983ux27963','居家生活','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('92','98积分即可兑换价值519元的如熙甜美蝴蝶结女鞋1双，2色可选！全国包邮！','如熙甜美蝴蝶结女鞋','0','0','./public/attachment/201502/26/14/54eeb973e9527.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb973e9527.jpg\" /></p>\r\n','0','0','0','0','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-98','【包邮】如熙甜美蝴蝶结女鞋','34','0','1424902413','0','0','0','0','','500.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb973e9527.jpg','0','0','0','','','','0','0','0','0','0','','0','3','25','1','0','0.0000','1424902413','1424902413','ux22899ux38795,ux34676ux34678ux32467,ux20817ux25442,ux29980ux32654,ux21363ux21487,ux31215ux20998,ux20215ux20540,ux20840ux22269,ux21253ux37038ux65281,ux53ux49ux57,ux57ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux53ux49ux57ux20803ux30340ux22914ux29081ux29980ux32654ux34676ux34678ux32467ux22899ux38795ux49ux21452ux65292ux50ux33394ux21487ux36873ux65281ux20840ux22269ux21253ux37038ux65281','女鞋,蝴蝶结,兑换,甜美,即可,积分,价值,全国,包邮！,519,98积分即可兑换价值519元的如熙甜美蝴蝶结女鞋1双，2色可选！全国包邮！','','','ux38795ux24125','鞋帽','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('93','仅598积分即可兑换价值598元的亿巢家纺磨毛四件套1套，精选活性磨毛面料，17款可选。工厂直供，全活性印染无甲醛 ，不起球、不掉色、不缩水！只买对的不买贵的，好品质，不用等待！换个床品过新年吧。','亿巢家纺磨毛四件套','0','0','./public/attachment/201502/26/14/54eeb9e475950.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeb9e475950.jpg\" /></p>\r\n','0','0','0','0','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-598','【包邮】亿巢家纺磨毛四件套','35','0','1424902542','0','0','0','0','','1000.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeb9e475950.jpg','0','0','0','','','','0','0','0','0','0','','0','3','27','1','0','0.0000','1424902542','1424902542','ux30952ux27611,ux27963ux24615,ux26080ux30002ux37275,ux36215ux29699,ux25481ux33394,ux23478ux32442,ux32553ux27700,ux20214ux22871,ux20817ux25442,ux21360ux26579,ux20165ux53ux57ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux53ux57ux56ux20803ux30340ux20159ux24034ux23478ux32442ux30952ux27611ux22235ux20214ux22871ux49ux22871ux65292ux31934ux36873ux27963ux24615ux30952ux27611ux38754ux26009ux65292ux49ux55ux27454ux21487ux36873ux12290ux24037ux21378ux30452ux20379ux65292ux20840ux27963ux24615ux21360ux26579ux26080ux30002ux37275ux65292ux19981ux36215ux29699ux12289ux19981ux25481ux33394ux12289ux19981ux32553ux27700ux65281ux21482ux20080ux23545ux30340ux19981ux20080ux36149ux30340ux65292ux22909ux21697ux36136ux65292ux19981ux29992ux31561ux24453ux65281ux25442ux20010ux24202ux21697ux36807ux26032ux24180ux21543ux12290','磨毛,活性,无甲醛,起球,掉色,家纺,缩水,件套,兑换,印染,仅598积分即可兑换价值598元的亿巢家纺磨毛四件套1套，精选活性磨毛面料，17款可选。工厂直供，全活性印染无甲醛 ，不起球、不掉色、不缩水！只买对的不买贵的，好品质，不用等待！换个床品过新年吧。','','','ux23478ux23621ux26085ux29992','家居日用','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('94','仅38积分即可兑换价值38元的灵夕韩版时尚发饰1个，三件起全国包邮！款式大方百搭。送自己送姐妹，时尚百搭，人手必备！','灵夕韩版时尚发饰','0','0','./public/attachment/201502/26/14/54eeba57b9e80.jpg','<p align=\"center\"><img border=\"0\" alt=\"\" src=\"./public/attachment/201502/26/14/54eeba57b9e80.jpg\" /></p>\r\n','0','0','0','0','0','0','0.0000','0.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','-38','【3件包邮】灵夕韩版时尚发饰','36','0','1424902656','0','0','0','0','','200.0000','1','0','1','0.0000','./public/attachment/201502/26/14/54eeba57b9e80.jpg','0','0','0','','','','0','0','0','0','0','','0','3','25','1','0','0.0000','1424902656','1424902656','ux26102ux23578,ux21457ux39280,ux20154ux25163,ux20817ux25442,ux27454ux24335,ux24517ux22791,ux22823ux26041,ux21363ux21487,ux22992ux22969,ux31215ux20998,ux20165ux51ux56ux31215ux20998ux21363ux21487ux20817ux25442ux20215ux20540ux51ux56ux20803ux30340ux28789ux22805ux38889ux29256ux26102ux23578ux21457ux39280ux49ux20010ux65292ux19977ux20214ux36215ux20840ux22269ux21253ux37038ux65281ux27454ux24335ux22823ux26041ux30334ux25645ux12290ux36865ux33258ux24049ux36865ux22992ux22969ux65292ux26102ux23578ux30334ux25645ux65292ux20154ux25163ux24517ux22791ux65281','时尚,发饰,人手,兑换,款式,必备,大方,即可,姐妹,积分,仅38积分即可兑换价值38元的灵夕韩版时尚发饰1个，三件起全国包邮！款式大方百搭。送自己送姐妹，时尚百搭，人手必备！','','','ux38795ux24125','鞋帽','','','','','','','0','0','0','0','0','0.0000','0','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('95','testtest','test','0','39','./public/attachment/201507/16/16/f3bd2d08b19a2a67ed9c2625188098cf25.jpg','sdfsdfqwedcsdf<img src=\"./public/attachment/201507/16/16/91f75f0f88e42a98698775b00e3174bc13.jpg\" alt=\"\" /><img src=\"./public/attachment/201507/16/16/638713868c905f5fbcc031be3d3a181051.jpg\" alt=\"\" />','1437006000','1439684400','0','111','1','2','111.0000','99.0000','0','0','1','1','0','0','0','1','1','0','0','0.0000','0','123123qweasd','37','0','1437006160','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201507/16/16/ae458d331451de5bdd87427901a9206e51.jpg','0','0','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1437006160','1437006160','ux116ux101ux115ux116ux116ux101ux115ux116,ux19971ux21305ux29436','testtest,七匹狼','','','ux26381ux35013,ux22899ux35013','服装,女装','ux21271ux20140','北京','','','0','0','13','0','0','0','0','88.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('96','testtest','test','0','39','./public/attachment/201507/16/16/f3bd2d08b19a2a67ed9c2625188098cf25.jpg','sdfsdfqwedcsdf<img src=\"./public/attachment/201507/16/16/91f75f0f88e42a98698775b00e3174bc13.jpg\" alt=\"\" /><img src=\"./public/attachment/201507/16/16/638713868c905f5fbcc031be3d3a181051.jpg\" alt=\"\" />','1437006000','1439684400','0','111','1','2','111.0000','99.0000','0','0','1','1','1','0','0','1','1','0','0','0.0000','0','123123qweasd','37','0','1437006161','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201507/16/16/ae458d331451de5bdd87427901a9206e51.jpg','0','0','0','','','','0','0','0','0','0','','0','0','30','1','0','0.0000','1437006161','1437006161','ux116ux101ux115ux116ux116ux101ux115ux116,ux19971ux21305ux29436','testtest,七匹狼','','','ux26381ux35013,ux22899ux35013','服装,女装','ux21271ux20140','北京','','','0','0','13','0','0','0','0','88.0000','1','0','0','0','0','384','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('97','123','123','0','0','./public/attachment/201507/21/22/55ae5a32b39f4.jpg','<img src=\"./public/attachment/201507/21/22/55ae5aea1b3ae.jpg\" title=\"军队巨蟹座逻辑教豁然开朗了好咯我来咯哦抗日战争告诉我IPO了佛陀莫拉她很弱啦估摸膜拜咯哦加剧阔步高速路熬','0','0','0','0','0','0','0.0000','0.0000','0','0','0','1','0','0','0','1','1','0','0','0.0000','0','露馅库巴恶ｌｏ喔路途','38','0','1437461113','0','0','0','0','','0.0000','1','0','0','0.0000','./public/attachment/201507/21/22/55ae59e4ce813.jpg','0','0','0','','','','0','0','0','0','0','','0','0','24','1','0','0.0000','1437461113','1437461113','ux49ux50ux51,ux19971ux21305ux29436','123,七匹狼','','','ux26381ux35013','服装','','','','','','','13','0','0','0','0','0.0000','1','0','0','0','0','0','0','','0','0','0','0','0','0');
INSERT INTO `%DB_PREFIX%deal` VALUES ('98','仅售76.4元，价值110元美味套餐！节假日通用！请提前1小时预约！提供免费WiFi！','59元烤鱼套餐','8','0','','<span style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\">金牌沸腾水煮鱼:</span><br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<p class=\"wrap-img\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:0px;vertical-align:baseline;line-height:0;color:#666666;\"><img src=\"http://e.hiphotos.baidu.com/bainuo/crop%3D0%2C0%2C577%2C358%3Bw%3D470%3Bq%3D90%3Bc%3Dnuomi%2C95%2C95/sign=873158effeedab64603d1780ca0683f3/6c224f4a20a446232ac983469d22720e0cf3d796.jpg\" title=\"图片\" style=\"border:0px;padding:0px;margin:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;float:none;\" /></p>\r\n<br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<span style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\">油炸花生米:</span><br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<p class=\"wrap-img\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:0px;vertical-align:baseline;line-height:0;color:#666666;\"><img src=\"http://e.hiphotos.baidu.com/bainuo/crop%3D0%2C0%2C614%2C415%3Bw%3D470%3Bq%3D89%3Bc%3Dnuomi%2C95%2C95/sign=ce9f67e487025aafc77d248bc6dd8754/54fbb2fb43166d2250c634b0432309f79052d264.jpg\" title=\"图片\" style=\"border:0px;padding:0px;margin:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;float:none;\" /></p>\r\n<br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<span style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\">拍黄瓜:</span><br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<p class=\"wrap-img\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:0px;vertical-align:baseline;line-height:0;color:#666666;\"><img src=\"http://e.hiphotos.baidu.com/bainuo/crop%3D0%2C0%2C581%2C382%3Bw%3D470%3Bq%3D90%3Bc%3Dnuomi%2C95%2C95/sign=c6ac80ded4c8a786aa65104e5a39e50d/0b55b319ebc4b745a01a9732cafc1e178a821503.jpg\" title=\"图片\" style=\"border:0px;padding:0px;margin:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;float:none;\" /></p>\r\n<br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<span style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\">大可乐:</span><br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<p class=\"wrap-img\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:0px;vertical-align:baseline;line-height:0;color:#666666;\"><img src=\"http://e.hiphotos.baidu.com/bainuo/crop%3D0%2C0%2C618%2C382%3Bw%3D470%3Bq%3D90%3Bc%3Dnuomi%2C95%2C95/sign=c538900c337adab4299f4103b6e49f2c/023b5bb5c9ea15ce0bf2c32db3003af33a87b2f1.jpg\" title=\"图片\" style=\"border:0px;padding:0px;margin:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;float:none;\" /></p>\r\n<br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<span style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\">米饭:</span><br style=\"color:#666666;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:14px;line-height:25px;\" />\r\n<p class=\"wrap-img\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:0px;vertical-align:baseline;line-height:0;color:#666666;\"><img src=\"http://e.hiphotos.baidu.com/bainuo/crop%3D0%2C0%2C687%2C410%3Bw%3D470%3Bq%3D90%3Bc%3Dnuomi%2C95%2C95/sign=25462ae01ed5ad6ebeb63eaabcfb15eb/a8014c086e061d95fd26261c7ef40ad162d9cab6.jpg\" title=\"图片\" style=\"border:0px;padding:0px;margin:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;float:none;\" /></p>','0','0','0','0','0','0','0.0000','0.0000','18','1','0','1','0','1','1','1','1','0','0','0.0000','0','仅售76.4元，价值110元美味套餐！节假日通用！请提前1小时预约！提供免费WiFi！','39','0','1437533135','0','0','0','0','','0.0000','0','0','0','0.0000','./public/attachment/201507/22/18/55af742895e8a.jpg','0','0','0','','','','0','0','0','0','0','','0','0','0','0','0','0.0000','1437533135','1437533135','ux33410ux20551ux26085,ux20165ux21806,ux39044ux32422,ux22871ux39184,ux32654ux21619,ux25552ux21069,ux36890ux29992,ux23567ux26102,ux20215ux20540,ux25552ux20379,ux20165ux21806ux55ux54ux46ux52ux20803ux65292ux20215ux20540ux49ux49ux48ux20803ux32654ux21619ux22871ux39184ux65281ux33410ux20551ux26085ux36890ux29992ux65281ux35831ux25552ux21069ux49ux23567ux26102ux39044ux32422ux65281ux25552ux20379ux20813ux36153ux87ux105ux70ux105ux65281','节假日,仅售,预约,套餐,美味,提前,通用,小时,价值,提供,仅售76.4元，价值110元美味套餐！节假日通用！请提前1小时预约！提供免费WiFi！','ux39184ux39278ux32654ux39135,ux24029ux33756','餐饮美食,川菜','','','ux21271ux20140','北京','','','','','0','0','0','0','1','0.0000','0','0','0','0','0','4','0','<table class=\"consume\" style=\"border-spacing:0px;padding:0px;margin:0px;border:0px;outline:0px;font-family:\'hiragino sans gb\', arial, verdana, tahoma, 宋体, sans-serif;font-size:12px;vertical-align:middle;color:#666666;line-height:14.399999618530273px;\"><tbody style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><tr style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><th valign=\"top\" style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-weight:bolder;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;text-align:center;background:#f5f5f5;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 10px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:116px;text-align:left;line-height:24px;\">有效期</div>\r\n</th>\r\n<td style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;color:#585858;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 15px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:550px;line-height:24px;\">2015年04月25日至2016年04月29日<br />\r\n</div>\r\n</td>\r\n</tr>\r\n<tr style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><th valign=\"top\" style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-weight:bolder;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;text-align:center;background:#f5f5f5;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 10px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:116px;text-align:left;line-height:24px;\">可用时间</div>\r\n</th>\r\n<td style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;color:#585858;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 15px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:550px;line-height:24px;\">周末法定节假日通用<br />\r\n10:00 - 20:30<br />\r\n</div>\r\n</td>\r\n</tr>\r\n<tr style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><th valign=\"top\" style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-weight:bolder;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;text-align:center;background:#f5f5f5;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 10px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:116px;text-align:left;line-height:24px;\">预约提示</div>\r\n</th>\r\n<td style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;color:#585858;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 15px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:550px;line-height:24px;\">请至少提前1小时预约<br />\r\n预约逾期保留30分钟<br />\r\n</div>\r\n</td>\r\n</tr>\r\n<tr style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><th valign=\"top\" style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-weight:bolder;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;text-align:center;background:#f5f5f5;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 10px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:116px;text-align:left;line-height:24px;\">使用规则</div>\r\n</th>\r\n<td style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;color:#585858;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 15px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:550px;line-height:24px;\"><ul style=\"margin:0px;padding:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\"><li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">团购用户暂不享受店内其他优惠</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">每张糯米券限4人使用，超出收费标准：另购买糯米券</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">每次消费不限使用糯米券张数，可叠加使用</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">仅限大厅使用，无包间</li>\r\n</ul>\r\n</div>\r\n</td>\r\n</tr>\r\n<tr style=\"padding:0px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;\"><th valign=\"top\" style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-weight:bolder;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;text-align:center;background:#f5f5f5;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 10px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:116px;text-align:left;line-height:24px;\">温馨提示</div>\r\n</th>\r\n<td style=\"padding:0px;margin:0px;border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:#f0f0f0;outline:0px;font-style:inherit;font-family:songti;font-size:14px;vertical-align:middle;color:#585858;\"><div class=\"multi-lines\" style=\"padding:10px 0px 10px 15px;margin:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;width:550px;line-height:24px;\"><ul style=\"margin:0px;padding:0px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:none;\"><li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">无停车位</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">提供免费WiFi</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">本单仅限堂食，不可外带</li>\r\n<li style=\"padding:0px;margin:0px 0px 0px 15px;border:0px;outline:0px;font-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:baseline;list-style:square outside none;\">商家不提供餐后打包服务</li>\r\n</ul>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>','0','0','0','0','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_attr`;
CREATE TABLE `%DB_PREFIX%deal_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品属性名称',
  `goods_type_attr_id` int(11) NOT NULL COMMENT '商品类型ID',
  `price` decimal(20,4) NOT NULL COMMENT '属性增加的额外价格',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `is_checked` tinyint(1) NOT NULL COMMENT '是否配置过该属性的库存',
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_type_attr_id` (`goods_type_attr_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 COMMENT='商品属性配置表';
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('258','2-5人套餐','18','20.0000','57','1','10.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('257','情侣套餐','18','0.0000','57','0','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('256','18点以后','17','5.0000','57','1','2.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('255','9点至18点','17','0.0000','57','0','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('273','小码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('272','大码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('271','均码','20','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('270','黑色','19','0.0000','64','1','0.0000');
INSERT INTO `%DB_PREFIX%deal_attr` VALUES ('269','棕色','19','0.0000','64','1','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cart`;
CREATE TABLE `%DB_PREFIX%deal_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL COMMENT '当前用户的sessionID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `deal_id` int(11) NOT NULL COMMENT '产品ID',
  `name` text NOT NULL COMMENT '购买的产品显示名称(包含购买的规格)',
  `attr` varchar(255) NOT NULL COMMENT '购买的相关属性的ID，用半角逗号分隔',
  `unit_price` decimal(20,4) NOT NULL COMMENT '单价',
  `number` int(11) NOT NULL COMMENT '数量',
  `total_price` decimal(20,4) NOT NULL COMMENT '总价',
  `verify_code` varchar(255) NOT NULL COMMENT '验证唯一的标识码（由商品ID与属性ID组合加密生成）',
  `create_time` int(11) NOT NULL COMMENT '加入购物车的时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `return_money` decimal(20,4) NOT NULL COMMENT '返现金的单价',
  `return_total_money` decimal(20,4) NOT NULL COMMENT '返现金的总价',
  `return_score` int(11) NOT NULL COMMENT '返积分的单价',
  `return_total_score` int(11) NOT NULL COMMENT '返积分的总价',
  `buy_type` tinyint(1) NOT NULL COMMENT '团购产品的类型（同deal表中的该字段）',
  `sub_name` varchar(255) NOT NULL COMMENT '简短名称',
  `supplier_id` int(11) NOT NULL COMMENT '产品所属的商家ID',
  `attr_str` text NOT NULL COMMENT '属性组合的显示名称',
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 COMMENT='购物车表';
INSERT INTO `%DB_PREFIX%deal_cart` VALUES ('508','4jjca81i8tg2ghuiehsu0ts844','0','85','仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！','0','69.0000','1','69.0000','9bd2e57000ecfb7e65e949bc630fb59e','1438916442','1438916442','0.0000','0.0000','0','0','0','励高早教胎教故事机','33','','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate`;
CREATE TABLE `%DB_PREFIX%deal_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` text NOT NULL COMMENT '分类简介',
  `pid` int(11) NOT NULL COMMENT '父ID，已弃用',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `sort` int(11) NOT NULL COMMENT '排序 由大到小',
  `uname` varchar(255) NOT NULL COMMENT 'url 别名',
  `recommend` tinyint(1) NOT NULL COMMENT '推荐到首页',
  `icon` varchar(255) DEFAULT '' COMMENT '弃用',
  `rec_youhui` tinyint(1) NOT NULL COMMENT '推荐到优惠券首页',
  `rec_daijin` tinyint(1) NOT NULL COMMENT '推荐到代金券首页',
  `iconfont` varchar(15) NOT NULL COMMENT '图标',
  `iconcolor` varchar(15) NOT NULL COMMENT '图标，分类的颜色',
  `icon_img` varchar(255) NOT NULL COMMENT '手机端的分类小图',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='生活服务分类表';
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('8','餐饮美食','','0','0','1','1','','1','','1','1','&#58896;','#a1410d','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('9','休闲娱乐','','0','0','1','2','','0','','1','1','&#58894;','#8fc63d','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('10','生活服务','','0','0','1','3','','1','','0','1','&#58880;','#f7941d','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('11','酒店旅游','','0','0','1','4','','0','','0','1','&#58889;','#00aeef','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('13','爱车学车','','0','0','1','6','','0','','0','1','&#58883;','#004a80','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('14','都市丽人','','0','0','1','7','','0','','0','1','&#58888;','#a763a9','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('15','我要结婚','','0','0','1','8','','0','','0','1','&#58895;','#9d0a0f','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('16','医疗健康','','0','0','1','9','','1','','0','1','','#3e6617','');
INSERT INTO `%DB_PREFIX%deal_cate` VALUES ('17','母婴亲子','','0','0','1','10','','0','','0','1','&#58887;','#f16522','');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type`;
CREATE TABLE `%DB_PREFIX%deal_cate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '小分类名称',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐标识，推荐到代金券，优惠券首页的相应大分类栏目中',
  `sort` int(11) NOT NULL COMMENT '排序（由大到小）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='生活服务分类子类';
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('1','咖啡','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('2','闽菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('3','东北菜','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('4','川菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('5','KTV','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('6','自助游','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('7','周边游','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('8','国内游','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('9','海外游','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('10','洗车','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('11','汽车保养','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('12','驾校','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('13','4S店','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('14','音响','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('15','车载导航','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('16','真皮座椅','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('17','打蜡','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('18','男科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('19','妇科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('20','儿科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('21','口腔科','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('22','眼科','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('23','体检中心','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('24','心理诊所','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('25','疗养院','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('26','日本料理','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('27','本帮菜','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('28','甜点','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('29','面包','0','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('30','烧烤','1','0');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('31','足疗按摩','0','1');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('32','水上世界','0','2');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('33','运动健身','0','3');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('34','采摘/农家乐','0','4');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('35','婚纱摄影','0','5');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('36','个性写真','0','6');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('37','培训课程','0','7');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('38','西餐','0','8');
INSERT INTO `%DB_PREFIX%deal_cate_type` VALUES ('39','配镜','0','9');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_deal_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_deal_link` (
  `deal_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品与生活服务子类的N-N关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('37','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('37','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('38','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('39','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('39','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('49','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('50','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('51','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('53','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('55','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('55','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','26');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('57','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('58','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('59','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('61','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('62','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('63','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('65','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('65','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('66','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('67','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('68','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('68','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('69','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('71','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('72','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('73','39');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('74','39');
INSERT INTO `%DB_PREFIX%deal_cate_type_deal_link` VALUES ('98','4');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_link` (
  `cate_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生活服务大分类与小分类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','3');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','26');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','27');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('8','38');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','32');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','33');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('9','34');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','37');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('10','39');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','6');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('11','9');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','10');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','11');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','12');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','13');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','14');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','15');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','16');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('13','17');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','18');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','19');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','22');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','23');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','24');
INSERT INTO `%DB_PREFIX%deal_cate_type_link` VALUES ('16','25');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_location_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_location_link` (
  `location_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户门店分属哪些生活服务子分类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('21','2');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('21','4');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('22','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('22','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('23','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('24','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','27');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','28');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','29');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('25','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('26','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('27','30');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('28','1');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('29','5');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('30','7');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('31','8');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('32','31');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('34','35');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('34','36');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('35','37');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('36','32');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('37','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_location_link` VALUES ('39','4');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_cate_type_youhui_link`;
CREATE TABLE `%DB_PREFIX%deal_cate_type_youhui_link` (
  `deal_cate_type_id` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_cate_type_id`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券与生活服务子类的关联表';
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('28','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('29','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('30','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','20');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','21');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','22');
INSERT INTO `%DB_PREFIX%deal_cate_type_youhui_link` VALUES ('38','23');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_city`;
CREATE TABLE `%DB_PREFIX%deal_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '城市中文名',
  `uname` varchar(255) NOT NULL COMMENT '英文名（用于URL显示）与二级域名显示',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '父ID，只能指向全国',
  `is_open` tinyint(1) NOT NULL COMMENT '弃用',
  `is_default` tinyint(1) NOT NULL COMMENT '默认城市（当IP定位不到时默认显示的城市）',
  `description` text NOT NULL COMMENT '弃用',
  `notice` text NOT NULL COMMENT '弃用',
  `seo_title` text NOT NULL COMMENT '针对城市定义的城市子站的seo标题前缀',
  `seo_keyword` text NOT NULL COMMENT '针对城市定义的城市子站的seo关键词前缀',
  `seo_description` text NOT NULL COMMENT '针对城市定义的城市子站的seo描述前缀',
  `sort` int(11) NOT NULL COMMENT '显示的排序',
  `is_hot` tinyint(1) NOT NULL COMMENT '热门城市',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='城市表';
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('1','福建','fujianp','1','0','0','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('18','北京','beijing','1','0','16','1','0','','','','','','4','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('24','成都','CD','1','0','23','1','1','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('20','厦门','xiamen','1','0','1','1','0','','','','','','6','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('15','福州','fuzhou','1','0','1','1','0','','','','','','1','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('16','北京','beijingp','1','0','0','1','0','','','','','','2','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('23','四川','SC','1','0','0','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('25','安徽','安徽','1','0','0','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('26','宿州','sz','1','0','25','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('27','重庆','chongq','1','0','0','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('28','黔江','qianjiang','1','0','27','1','0','','','黔江','黔江','黔江','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('29','彭水','pengshui','1','0','27','1','0','','','','','','0','0');
INSERT INTO `%DB_PREFIX%deal_city` VALUES ('31','陕西','shannxi','1','0','0','1','0','','','','','','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_collect`;
CREATE TABLE `%DB_PREFIX%deal_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品收藏表';
INSERT INTO `%DB_PREFIX%deal_collect` VALUES ('15','88','83','1437173792');
DROP TABLE IF EXISTS `%DB_PREFIX%deal_coupon`;
CREATE TABLE `%DB_PREFIX%deal_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL COMMENT ' 团购券序列号',
  `password` varchar(255) NOT NULL COMMENT ' 团购券密码',
  `begin_time` int(11) NOT NULL COMMENT ' 团购券生效时间',
  `end_time` int(11) NOT NULL COMMENT ' 团购券过期时间',
  `is_valid` tinyint(1) NOT NULL COMMENT ' 有效性 0:生成未发放给用户(已下单未成团) 1:已发放给用户 2：退款被禁用',
  `user_id` int(11) NOT NULL COMMENT ' 会员ID',
  `deal_id` int(11) NOT NULL COMMENT ' 商品ID',
  `order_id` int(11) NOT NULL COMMENT ' 订单ID ',
  `order_deal_id` int(11) NOT NULL COMMENT ' 订单商品ID',
  `is_new` tinyint(1) NOT NULL COMMENT ' 新券标识 0:未被会员查看 1：已查看',
  `supplier_id` int(11) NOT NULL COMMENT ' 商户ID',
  `confirm_account` int(11) NOT NULL COMMENT ' 验证团购券的商家帐号ID',
  `location_id` int(11) NOT NULL COMMENT '消费的门店',
  `is_delete` tinyint(1) NOT NULL COMMENT ' 删除标识',
  `confirm_time` int(11) NOT NULL COMMENT ' 验证消费的时间',
  `mail_count` int(11) NOT NULL COMMENT ' 会员手动重发团购券邮件的次数，用于限制恶意重发',
  `sms_count` int(11) NOT NULL COMMENT ' 会员手动重发团购券短信的次数，用于限制恶意重发',
  `is_balance` tinyint(1) NOT NULL COMMENT ' 0:未结算 1:待结算 2:已结算',
  `balance_memo` text NOT NULL COMMENT ' 管理员结算的备注',
  `balance_price` decimal(20,4) NOT NULL COMMENT ' 生成团购券时由商品表中同步生成该值：结算单价',
  `balance_time` int(11) NOT NULL COMMENT ' 结算时间',
  `refund_status` tinyint(1) NOT NULL COMMENT ' 退款状态 0:无 1:用户申请退款 2:已确认 3:拒绝退款',
  `expire_refund` tinyint(1) NOT NULL COMMENT ' 是否支持过期退 0:否 1:是',
  `any_refund` tinyint(1) NOT NULL COMMENT ' 是否支持随时退 0:否 1:是',
  `coupon_price` decimal(20,4) NOT NULL COMMENT ' 团购券的价格，用于退款时的计算，按件为单件价，按单为总价',
  `coupon_score` int(11) NOT NULL COMMENT ' 团购券所产生给用户的积分，用于退款时的计算，按件为单件价，按单为总价',
  `deal_type` tinyint(1) NOT NULL COMMENT ' 团购券的生成方式 0:按件生成 1:按单生成',
  `coupon_money` decimal(20,4) NOT NULL COMMENT ' 团购券所产生给用户的金额（如购买返现之类的），用于退款时的计算，按件为单件价，按单为总价',
  `add_balance_price` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`) USING BTREE,
  UNIQUE KEY `unk_pw` (`password`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT=' 团购券表';
INSERT INTO `%DB_PREFIX%deal_coupon` VALUES ('23','61323563','61323563','1424887216','1427392800','1','71','57','26','79','0','23','8','21','0','1424890988','0','0','1','','50.0000','0','0','0','1','113.0000','10','0','0.0000','12.0000');
INSERT INTO `%DB_PREFIX%deal_coupon` VALUES ('24','57959790','32316437','1434416585','1435021385','2','71','57','28','82','0','23','8','22','0','1434416612','0','0','1','','50.0000','0','0','0','1','108.0000','10','0','0.0000','10.0000');
INSERT INTO `%DB_PREFIX%deal_coupon` VALUES ('25','57445657','63636236','1434417129','1435021929','2','71','57','29','83','0','23','8','21','0','1434417199','0','0','1','','50.0000','0','0','0','1','113.0000','10','0','0.0000','12.0000');
INSERT INTO `%DB_PREFIX%deal_coupon` VALUES ('26','98879260','37663466','0','0','1','84','98','31','85','0','0','0','0','0','0','0','0','0','','0.0000','0','0','0','0','0.0000','0','0','0.0000','0.0000');
