-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:22
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 3


DROP TABLE IF EXISTS `%DB_PREFIX%event_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%event_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `event_id` int(11) NOT NULL COMMENT '活动ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `youhui_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动按预定义的分组打标签的结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%event_field`;
CREATE TABLE `%DB_PREFIX%event_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `field_show_name` varchar(255) NOT NULL COMMENT '报名选项显示名称',
  `field_type` tinyint(1) NOT NULL COMMENT '报名项报名方式 0:手动输入 1:预选下拉',
  `value_scope` varchar(255) NOT NULL COMMENT '下拉的预选范围 用空格分隔',
  `sort` int(11) NOT NULL COMMENT '排序 由小到大，自动生成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='活动报名选项';
INSERT INTO `%DB_PREFIX%event_field` VALUES ('9','2','姓名','0','','0');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('10','2','手机号','0','','1');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('11','2','性别','1','男 女','2');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('12','2','年龄','1','18岁以下 18岁-30岁 30岁-40岁 40岁以上','3');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('13','3','联系人','0','','0');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('14','3','报名人数','0','','1');
INSERT INTO `%DB_PREFIX%event_field` VALUES ('15','4','手机号','0','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%event_location_link`;
CREATE TABLE `%DB_PREFIX%event_location_link` (
  `event_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动支持的门店关联表';
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('2','21');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('2','22');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('3','30');
INSERT INTO `%DB_PREFIX%event_location_link` VALUES ('4','30');
DROP TABLE IF EXISTS `%DB_PREFIX%event_sc`;
CREATE TABLE `%DB_PREFIX%event_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动收藏';
INSERT INTO `%DB_PREFIX%event_sc` VALUES ('1','71','3','1424894966');
DROP TABLE IF EXISTS `%DB_PREFIX%event_submit`;
CREATE TABLE `%DB_PREFIX%event_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `event_begin_time` int(11) NOT NULL COMMENT '活动开始时间，报名时同步自event表。',
  `event_end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `dp_id` int(11) NOT NULL COMMENT '为已报名的活动点评的ID',
  `sn` varchar(255) DEFAULT NULL,
  `location_id` int(11) NOT NULL COMMENT '验证的门店ID',
  `confirm_id` int(11) NOT NULL COMMENT '操作的商家账户ID',
  `confirm_time` int(11) NOT NULL,
  `is_verify` tinyint(1) NOT NULL COMMENT '是否已审核，已审核才扣名额',
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  `sms_count` int(11) NOT NULL COMMENT '报名结果短信发送次数',
  `mail_count` int(11) NOT NULL COMMENT '报名结果邮件发送次数',
  `return_money` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动报名表';
INSERT INTO `%DB_PREFIX%event_submit` VALUES ('2','71','1424894336','2','1422734147','1614282900','0','284220','0','0','0','1','10','100','0','0','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%event_submit_field`;
CREATE TABLE `%DB_PREFIX%event_submit_field` (
  `submit_id` int(11) NOT NULL COMMENT '报名的主表ID',
  `field_id` int(11) NOT NULL COMMENT '选项ID',
  `result` varchar(255) NOT NULL COMMENT '报名结果',
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`submit_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动报名，自定义报名项的报名结果';
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','9','张三','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','10','13566677777','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','11','男','2');
INSERT INTO `%DB_PREFIX%event_submit_field` VALUES ('2','12','30岁-40岁','2');
DROP TABLE IF EXISTS `%DB_PREFIX%express`;
CREATE TABLE `%DB_PREFIX%express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '快递接口类名',
  `name` varchar(255) NOT NULL COMMENT '快递接口名称',
  `print_tmpl` text NOT NULL COMMENT '快递单打印模板',
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL COMMENT '相关的配置(序列化的结果)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='快递接口配置表';
INSERT INTO `%DB_PREFIX%express` VALUES ('3','Ems','EMS','<table width=\"1024px\" background=\"system/express/images/Ems_express.jpg\" height=\"566px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:566px;\"><div style=\"position:absolute;left:153px;top:140px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:90px;top:182px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:93px;top:224px;width:438px;height:68px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:334px;top:141px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:88px;top:366px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:334px;top:371px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:181px;top:452px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:380px;top:278px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:307px;top:99px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:362px;top:100px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:399px;top:99px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:432px;top:97px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:770px;top:133px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:571px;top:133px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:792px;top:279px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:562px;top:284px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:509px;top:222px;width:423px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:6:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:8:\"app_code\";s:3:\"ems\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('4','Fedex','联邦快递','<table width=\"1024px\" background=\"system/express/images/Fedex_express.jpg\" height=\"568px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:568px;\"><div style=\"position:absolute;left:155px;top:108px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:329px;top:110px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_account\">%SENDER_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:149px;top:172px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:141px;top:197px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:138px;top:141px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:346px;top:223px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:152px;top:483px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:577px;top:431px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:135px;top:301px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:167px;top:274px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:343px;top:385px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:141px;top:358px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:9:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:14:\"sender_account\";s:0:\"\";s:8:\"app_code\";s:5:\"fedex\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('5','Sf','顺丰快递','<table width=\"1024px\" background=\"system/express/images/Sf_express.jpg\" height=\"670px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:670px;\"><div style=\"position:absolute;left:725px;top:148px;width:35px;height:35px;line-height:35px;text-align:left;\" id=\"payment_method\">√</div>\r\n<div style=\"position:absolute;left:720px;top:270px;width:135px;height:35px;line-height:35px;text-align:left;letter-spacing:15px;\" id=\"payment_account\">%PAYMENT_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:366px;top:146px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:122px;top:149px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:112px;top:185px;width:438px;height:68px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:280px;top:265px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:66px;top:545px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:376px;top:548px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:803px;top:394px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:744px;top:443px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:803px;top:444px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:852px;top:445px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:278px;top:467px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:360px;top:311px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:714px;top:90px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:67px;top:382px;width:423px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:6:{s:11:\"sender_name\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:15:\"payment_account\";s:0:\"\";s:8:\"app_code\";s:8:\"shunfeng\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('6','Sto','申通快递','<table width=\"1349px\" background=\"system/express/images/Sto_express.jpg\" height=\"743px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1349px;height:743px;\"><div style=\"position:absolute;left:202px;top:165px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:424px;top:168px;width:193px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:182px;top:225px;width:437px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:187px;top:275px;width:438px;height:93px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:226px;top:379px;width:253px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:91px;top:538px;width:336px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:432px;top:538px;width:194px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:208px;top:579px;width:153px;height:48px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:115px;top:620px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:189px;top:621px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:245px;top:621px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:288px;top:622px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_h\">%T%</div>\r\n<div style=\"position:absolute;left:996px;top:171px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:758px;top:171px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:747px;top:226px;width:423px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_company\"></div>\r\n<div style=\"position:absolute;left:744px;top:277px;width:423px;height:94px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:787px;top:381px;width:390px;height:34px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:7:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:8:\"app_code\";s:8:\"shentong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('7','Ttkd','天天快递','<table width=\"1024px\" background=\"system/express/images/Ttkd_express.jpg\" height=\"572px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:572px;\"><div style=\"position:absolute;left:360px;top:250px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:341px;top:106px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:136px;top:104px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_account\">%SENDER_ACCOUNT%</div>\r\n<div style=\"position:absolute;left:139px;top:141px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:141px;top:181px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:182px;top:246px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:76px;top:367px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:333px;top:367px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:160px;top:435px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:134px;top:467px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:180px;top:468px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:225px;top:466px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:94px;top:468px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:618px;top:250px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:559px;top:124px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:746px;top:123px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:567px;top:185px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:9:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:14:\"sender_account\";s:0:\"\";s:8:\"app_code\";s:8:\"tiantian\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('8','Yto','圆通快递','<table width=\"1024px\" background=\"system/express/images/Yto_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div id=\"sender_name\" style=\"position:absolute;left:112px;top:122px;width:156px;height:35px;line-height:35px;text-align:left;\">%SENDER_NAME%</div>\r\n<div id=\"sender_from\" style=\"position:absolute;left:273px;top:125px;width:156px;height:35px;line-height:35px;text-align:left;\">%SENDER_FROM%</div>\r\n<div id=\"sender_company\" style=\"position:absolute;left:80px;top:289px;width:300px;height:23px;line-height:35px;text-align:left;\">%SENDER_COMPANY%</div>\r\n<div id=\"sender_address\" style=\"position:absolute;left:81px;top:222px;width:300px;height:24px;line-height:35px;text-align:left;\">%SENDER_ADDRESS%</div>\r\n<div id=\"sender_tel\" style=\"position:absolute;left:102px;top:334px;width:253px;height:28px;line-height:35px;text-align:left;\">%SENDER_TEL%</div>\r\n<div id=\"sender_y\" style=\"position:absolute;left:256px;top:439px;width:60px;height:25px;line-height:35px;text-align:left;\">%Y%</div>\r\n<div id=\"sender_m\" style=\"position:absolute;left:313px;top:439px;width:28px;height:25px;line-height:35px;text-align:left;\">%M%</div>\r\n<div id=\"sender_d\" style=\"position:absolute;left:352px;top:441px;width:28px;height:25px;line-height:35px;text-align:left;\">%D%</div>\r\n<div id=\"sender_sign\" style=\"position:absolute;left:158px;top:436px;width:160px;height:25px;line-height:35px;text-align:left;\">%SENDER_SIGN%</div>\r\n<div id=\"reciever_tel\" style=\"position:absolute;left:421px;top:396px;width:156px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_TEL%</div>\r\n<div id=\"reciever_name\" style=\"position:absolute;left:398px;top:181px;width:156px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_NAME%</div>\r\n<div id=\"reciever_to\" style=\"position:absolute;left:725px;top:93px;width:223px;height:35px;line-height:35px;text-align:left;\">%RECIEVER_TO%</div>\r\n<div id=\"reciever_address\" style=\"position:absolute;left:396px;top:271px;width:300px;height:58px;line-height:35px;text-align:left;\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:7:{s:11:\"sender_name\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:8:\"yuantong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('9','Yunda','韵达快递','<table width=\"1024px\" background=\"system/express/images/Yunda_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div style=\"position:absolute;left:161px;top:120px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:355px;top:118px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:185px;top:158px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:145px;top:192px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:219px;top:306px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:398px;top:305px;width:153px;height:28px;line-height:35px;text-align:left;letter-spacing:14px;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:92px;top:409px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:316px;top:411px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:96px;top:485px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:96px;top:514px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:144px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:185px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:213px;top:513px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:885px;top:123px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:618px;top:295px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:881px;top:304px;width:156px;height:35px;line-height:35px;text-align:left;letter-spacing:14px;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:610px;top:121px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:609px;top:193px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:5:\"yunda\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('10','Zjs','宅急送快递','<table width=\"1024px\" background=\"system/express/images/Zjs_express.jpg\" height=\"619px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:619px;\"><div style=\"position:absolute;left:149px;top:144px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:320px;top:142px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:127px;top:251px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:123px;top:186px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:124px;top:285px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:104px;top:319px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:114px;top:350px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:84px;top:457px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:109px;top:526px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:151px;top:527px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:180px;top:527px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:547px;top:285px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:574px;top:145px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:749px;top:144px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:553px;top:184px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:10:\"zhaijisong\";}');
INSERT INTO `%DB_PREFIX%express` VALUES ('11','Zto','中通快递','<table width=\"1024px\" background=\"system/express/images/Zto_express.jpg\" height=\"574px\"><tbody><tr><td><div style=\"position:relative;font-size:18px;width:1024px;height:574px;\"><div style=\"position:absolute;left:161px;top:120px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_name\">%SENDER_NAME%</div>\r\n<div style=\"position:absolute;left:332px;top:119px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"sender_from\">%SENDER_FROM%</div>\r\n<div style=\"position:absolute;left:143px;top:235px;width:300px;height:23px;line-height:35px;text-align:left;\" id=\"sender_company\">%SENDER_COMPANY%</div>\r\n<div style=\"position:absolute;left:164px;top:163px;width:300px;height:24px;line-height:35px;text-align:left;\" id=\"sender_address\">%SENDER_ADDRESS%</div>\r\n<div style=\"position:absolute;left:157px;top:285px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_tel\">%SENDER_TEL%</div>\r\n<div style=\"position:absolute;left:352px;top:282px;width:153px;height:28px;line-height:35px;text-align:left;letter-spacing:9px;\" id=\"sender_zip\">%SENDER_ZIP%</div>\r\n<div style=\"position:absolute;left:276px;top:355px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_goods\">%SENDER_GOODS%</div>\r\n<div style=\"position:absolute;left:648px;top:326px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_number\">%SENDER_NUMBER%</div>\r\n<div style=\"position:absolute;left:153px;top:393px;width:153px;height:28px;line-height:35px;text-align:left;\" id=\"sender_sign\">%SENDER_SIGN%</div>\r\n<div style=\"position:absolute;left:100px;top:444px;width:60px;height:25px;line-height:35px;text-align:left;\" id=\"sender_y\">%Y%</div>\r\n<div style=\"position:absolute;left:154px;top:436px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_m\">%M%</div>\r\n<div style=\"position:absolute;left:193px;top:435px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_d\">%D%</div>\r\n<div style=\"position:absolute;left:227px;top:434px;width:28px;height:25px;line-height:35px;text-align:left;\" id=\"sender_t\">%T%</div>\r\n<div style=\"position:absolute;left:560px;top:278px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_tel\">%RECIEVER_TEL%</div>\r\n<div style=\"position:absolute;left:566px;top:123px;width:156px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_name\">%RECIEVER_NAME%</div>\r\n<div style=\"position:absolute;left:765px;top:279px;width:156px;height:35px;line-height:35px;text-align:left;letter-spacing:9px;\" id=\"reciever_zip\">%RECIEVER_ZIP%</div>\r\n<div style=\"position:absolute;left:748px;top:121px;width:223px;height:35px;line-height:35px;text-align:left;\" id=\"reciever_to\">%RECIEVER_TO%</div>\r\n<div style=\"position:absolute;left:570px;top:164px;width:300px;height:58px;line-height:35px;text-align:left;\" id=\"reciever_address\">%RECIEVER_ADDRESS%</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n','1','a:8:{s:11:\"sender_name\";s:0:\"\";s:10:\"sender_zip\";s:0:\"\";s:11:\"sender_from\";s:0:\"\";s:14:\"sender_company\";s:0:\"\";s:14:\"sender_address\";s:0:\"\";s:10:\"sender_tel\";s:0:\"\";s:11:\"sender_sign\";s:0:\"\";s:8:\"app_code\";s:9:\"zhongtong\";}');
DROP TABLE IF EXISTS `%DB_PREFIX%expression`;
CREATE TABLE `%DB_PREFIX%expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'tusiji',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='表情配置表';
INSERT INTO `%DB_PREFIX%expression` VALUES ('19','傲慢','qq','[傲慢]','aoman.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('20','白眼','qq','[白眼]','baiyan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('21','鄙视','qq','[鄙视]','bishi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('22','闭嘴','qq','[闭嘴]','bizui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('23','擦汗','qq','[擦汗]','cahan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('24','菜刀','qq','[菜刀]','caidao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('25','差劲','qq','[差劲]','chajin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('26','欢庆','qq','[欢庆]','cheer.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('27','虫子','qq','[虫子]','chong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('28','呲牙','qq','[呲牙]','ciya.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('29','捶打','qq','[捶打]','da.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('30','大便','qq','[大便]','dabian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('31','大兵','qq','[大兵]','dabing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('32','大叫','qq','[大叫]','dajiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('33','大哭','qq','[大哭]','daku.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('34','蛋糕','qq','[蛋糕]','dangao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('35','发怒','qq','[发怒]','fanu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('36','刀','qq','[刀]','dao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('37','得意','qq','[得意]','deyi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('38','凋谢','qq','[凋谢]','diaoxie.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('39','饿','qq','[饿]','er.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('40','发呆','qq','[发呆]','fadai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('41','发抖','qq','[发抖]','fadou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('42','饭','qq','[饭]','fan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('43','飞吻','qq','[飞吻]','feiwen.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('44','奋斗','qq','[奋斗]','fendou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('45','尴尬','qq','[尴尬]','gangga.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('46','给力','qq','[给力]','geili.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('47','勾引','qq','[勾引]','gouyin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('48','鼓掌','qq','[鼓掌]','guzhang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('49','哈哈','qq','[哈哈]','haha.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('50','害羞','qq','[害羞]','haixiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('51','哈欠','qq','[哈欠]','haqian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('52','花','qq','[花]','hua.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('53','坏笑','qq','[坏笑]','huaixiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('54','挥手','qq','[挥手]','huishou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('55','回头','qq','[回头]','huitou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('56','激动','qq','[激动]','jidong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('57','惊恐','qq','[惊恐]','jingkong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('58','惊讶','qq','[惊讶]','jingya.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('59','咖啡','qq','[咖啡]','kafei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('60','可爱','qq','[可爱]','keai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('61','可怜','qq','[可怜]','kelian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('62','磕头','qq','[磕头]','ketou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('63','示爱','qq','[示爱]','kiss.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('64','酷','qq','[酷]','ku.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('65','难过','qq','[难过]','kuaikule.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('66','骷髅','qq','[骷髅]','kulou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('67','困','qq','[困]','kun.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('68','篮球','qq','[篮球]','lanqiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('69','冷汗','qq','[冷汗]','lenghan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('70','流汗','qq','[流汗]','liuhan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('71','流泪','qq','[流泪]','liulei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('72','礼物','qq','[礼物]','liwu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('73','爱心','qq','[爱心]','love.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('74','骂人','qq','[骂人]','ma.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('75','不开心','qq','[不开心]','nanguo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('76','不好','qq','[不好]','no.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('77','很好','qq','[很好]','ok.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('78','佩服','qq','[佩服]','peifu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('79','啤酒','qq','[啤酒]','pijiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('80','乒乓','qq','[乒乓]','pingpang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('81','撇嘴','qq','[撇嘴]','pizui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('82','强','qq','[强]','qiang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('83','亲亲','qq','[亲亲]','qinqin.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('84','出丑','qq','[出丑]','qioudale.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('85','足球','qq','[足球]','qiu.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('86','拳头','qq','[拳头]','quantou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('87','弱','qq','[弱]','ruo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('88','色','qq','[色]','se.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('89','闪电','qq','[闪电]','shandian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('90','胜利','qq','[胜利]','shengli.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('91','衰','qq','[衰]','shuai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('92','睡觉','qq','[睡觉]','shuijiao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('93','太阳','qq','[太阳]','taiyang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('96','啊','tusiji','[啊]','aa.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('97','暗爽','tusiji','[暗爽]','anshuang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('98','byebye','tusiji','[byebye]','baibai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('99','不行','tusiji','[不行]','buxing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('100','戳眼','tusiji','[戳眼]','chuoyan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('101','很得意','tusiji','[很得意]','deyi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('102','顶','tusiji','[顶]','ding.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('103','抖抖','tusiji','[抖抖]','douxiong.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('104','哼','tusiji','[哼]','heng.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('105','挥汗','tusiji','[挥汗]','huihan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('106','昏迷','tusiji','[昏迷]','hunmi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('107','互拍','tusiji','[互拍]','hupai.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('108','瞌睡','tusiji','[瞌睡]','keshui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('109','笼子','tusiji','[笼子]','longzi.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('110','听歌','tusiji','[听歌]','music.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('111','奶瓶','tusiji','[奶瓶]','naiping.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('112','扭背','tusiji','[扭背]','niubei.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('113','拍砖','tusiji','[拍砖]','paizhuan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('114','飘过','tusiji','[飘过]','piaoguo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('115','揉脸','tusiji','[揉脸]','roulian.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('116','闪闪','tusiji','[闪闪]','shanshan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('117','生日','tusiji','[生日]','shengri.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('118','摊手','tusiji','[摊手]','tanshou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('119','躺坐','tusiji','[躺坐]','tanzuo.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('120','歪头','tusiji','[歪头]','waitou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('121','我踢','tusiji','[我踢]','woti.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('122','无聊','tusiji','[无聊]','wuliao.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('123','醒醒','tusiji','[醒醒]','xingxing.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('124','睡了','tusiji','[睡了]','xixishui.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('125','旋转','tusiji','[旋转]','xuanzhuan.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('126','摇晃','tusiji','[摇晃]','yaohuang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('127','耶','tusiji','[耶]','yeah.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('128','郁闷','tusiji','[郁闷]','yumen.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('129','晕厥','tusiji','[晕厥]','yunjue.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('130','砸','tusiji','[砸]','za.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('131','震荡','tusiji','[震荡]','zhendang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('132','撞墙','tusiji','[撞墙]','zhuangqiang.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('133','转头','tusiji','[转头]','zhuantou.gif');
INSERT INTO `%DB_PREFIX%expression` VALUES ('134','抓墙','tusiji','[抓墙]','zhuaqiang.gif');
DROP TABLE IF EXISTS `%DB_PREFIX%fetch_topic`;
CREATE TABLE `%DB_PREFIX%fetch_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '接口名称',
  `show_name` varchar(255) NOT NULL COMMENT '接口显示的名称',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `config` text NOT NULL COMMENT '配置信息',
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分享采集接口配置表';
INSERT INTO `%DB_PREFIX%fetch_topic` VALUES ('1','方维oso内部数据分享接口','站内分享','Fanwe','','N;','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%filter`;
CREATE TABLE `%DB_PREFIX%filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '关键词',
  `filter_group_id` int(11) NOT NULL COMMENT '商城商品筛选分组ID',
  PRIMARY KEY (`id`),
  KEY `filter_name_idx` (`name`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='商品筛选关键词表';
INSERT INTO `%DB_PREFIX%filter` VALUES ('38','棕色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('39','蓝色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('40','黑色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('41','红色','10');
INSERT INTO `%DB_PREFIX%filter` VALUES ('42','紫色','10');
DROP TABLE IF EXISTS `%DB_PREFIX%filter_group`;
CREATE TABLE `%DB_PREFIX%filter_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '筛选分组名称',
  `cate_id` int(11) NOT NULL COMMENT '所属商城分类ID',
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL COMMENT '是否生效用于检索分组显示于分类页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商城商品筛选分组配置表';
INSERT INTO `%DB_PREFIX%filter_group` VALUES ('10','颜色','31','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%flower_log`;
CREATE TABLE `%DB_PREFIX%flower_log` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` enum('good_count','bad_count') NOT NULL COMMENT 'good_count表示鲜花',
  `rec_id` int(11) NOT NULL COMMENT '相关的ID，如点评的ID，图片ID',
  `rec_module` enum('image','dp') NOT NULL,
  `memo` varchar(20) NOT NULL COMMENT '投票的文字显示',
  `create_time` int(11) NOT NULL COMMENT '投票的时间',
  PRIMARY KEY (`user_id`,`rec_id`,`rec_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评的鲜花投标记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%free_delivery`;
CREATE TABLE `%DB_PREFIX%free_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL COMMENT '配送方式ID',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `free_count` int(11) NOT NULL COMMENT '免运费的件数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='每个商品针对每个配置方式设置的免运费规则表';
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('25','8','76','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('19','8','79','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('20','8','80','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('21','8','81','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('22','8','85','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('23','8','87','2');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('24','8','88','2');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('26','8','89','1');
INSERT INTO `%DB_PREFIX%free_delivery` VALUES ('27','8','91','15');
DROP TABLE IF EXISTS `%DB_PREFIX%goods_type`;
CREATE TABLE `%DB_PREFIX%goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='商品的类型(属性规格的分组标准)';
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('10','餐饮套餐','0');
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('11','特色小吃','0');
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('13','菜品','26');
INSERT INTO `%DB_PREFIX%goods_type` VALUES ('14','DWSF EW','0');
DROP TABLE IF EXISTS `%DB_PREFIX%goods_type_attr`;
CREATE TABLE `%DB_PREFIX%goods_type_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '属性名称',
  `input_type` tinyint(1) NOT NULL COMMENT '输入的方式 0手动输入 1预选下拉',
  `preset_value` text NOT NULL COMMENT '预选下拉时的预设值，半角逗号分隔',
  `goods_type_id` int(11) NOT NULL COMMENT '商品类型ID',
  `supplier_id` int(11) NOT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='每个商品类型的属性预设表';
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('17','时段','0','','10','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('18','人数','0','','10','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('19','颜色','0','','11','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('20','尺码','0','','11','0');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('21','肉','0','','13','26');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('22','蔬菜','0','','13','26');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('23','海鲜','0','','13','26');
INSERT INTO `%DB_PREFIX%goods_type_attr` VALUES ('24','BFBRT','0','','14','0');
DROP TABLE IF EXISTS `%DB_PREFIX%images_group`;
CREATE TABLE `%DB_PREFIX%images_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商家图片分组表';
DROP TABLE IF EXISTS `%DB_PREFIX%images_group_link`;
CREATE TABLE `%DB_PREFIX%images_group_link` (
  `images_group_id` int(11) NOT NULL COMMENT '图片分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `images_group_id` (`images_group_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家图片分组与生活服务分类的关联表(属于某个分类的商家图片拥有哪些图片分组的配置)';
DROP TABLE IF EXISTS `%DB_PREFIX%link`;
CREATE TABLE `%DB_PREFIX%link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接显示名称',
  `group_id` int(11) NOT NULL COMMENT '友情链接分组ID',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `img` varchar(255) NOT NULL COMMENT '链接图片',
  `description` text NOT NULL COMMENT '描述说明',
  `count` int(11) NOT NULL COMMENT '点击量',
  `show_index` tinyint(1) NOT NULL COMMENT '是否显示到首页底部 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='友情链接表';
INSERT INTO `%DB_PREFIX%link` VALUES ('3','方维o2o商业系统','6','http://www.fanwe.com','1','1','','方维o2o商业系统','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%link_group`;
CREATE TABLE `%DB_PREFIX%link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接分组名称',
  `sort` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='友情链接分组表';
INSERT INTO `%DB_PREFIX%link_group` VALUES ('6','友情链接','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%log`;
CREATE TABLE `%DB_PREFIX%log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志描述内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin` int(11) NOT NULL COMMENT '操作的管理员ID',
  `log_ip` varchar(255) NOT NULL COMMENT '操作者IP',
  `log_status` tinyint(1) NOT NULL COMMENT '操作结果 1:操作成功 0:操作失败',
  `module` varchar(255) NOT NULL COMMENT '操作的模块module',
  `action` varchar(255) NOT NULL COMMENT '操作的命令action',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3125 DEFAULT CHARSET=utf8 COMMENT='后台操作日志表';
INSERT INTO `%DB_PREFIX%log` VALUES ('2651','admin登录成功','1431141363','1','192.168.1.41','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2652','admin登录成功','1434228364','1','27.13.152.48','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2653','更新系统配置','1434237147','1','27.13.152.48','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2654','admin登录成功','1434243398','1','183.46.10.54','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2655','admin登录成功','1434257021','1','211.161.249.135','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2656','admin登录成功','1434263202','1','27.13.152.48','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2657','admin管理员密码错误','1434263534','0','171.213.97.251','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2658','admin登录成功','1434263543','1','171.213.97.251','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2659','admin登录成功','1434263583','1','171.213.97.251','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2660','admin登录成功','1434263659','1','171.213.97.251','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2661','admin登录成功','1434293800','1','171.213.97.251','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2662','积分商城更新成功','1434293932','1','171.213.97.251','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2663','商城更新成功','1434293948','1','171.213.97.251','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2664','达人秀更新成功','1434293964','1','171.213.97.251','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2665','小组更新成功','1434293974','1','171.213.97.251','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2666','发现更新成功','1434294047','1','171.213.97.251','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2667','彻底删除成功','1434294354','1','171.213.97.251','1','MIndex','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2668','彻底删除成功','1434294405','1','171.213.97.251','1','MIndex','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2669','彻底删除成功','1434294413','1','171.213.97.251','1','MIndex','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2670','抢好礼添加成功','1434294546','1','171.213.97.251','1','MIndex','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2671','抢好礼更新成功','1434294626','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2672','扫一扫更新成功','1434294667','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2673','扫一扫更新成功','1434294698','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2674','扫一扫更新成功','1434294718','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2675','扫一扫更新成功','1434294737','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2676','活动更新成功','1434294794','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2677','活动更新成功','1434295397','1','171.213.97.251','1','MIndex','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2678','admin登录成功','1434307690','1','219.152.163.171','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2679','admin登录成功','1434311529','1','182.40.87.208','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2680','admin登录成功','1434337580','1','223.244.2.74','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2681','admi管理员帐号错误','1434410698','0','113.121.112.52','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2682','admin登录成功','1434416111','1','113.121.112.52','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2683','更新成功','1434416561','1','113.121.112.52','1','DealCoupon','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2684','添加成功','1434416585','1','113.121.112.52','1','DealCoupon','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2685','admin登录成功','1434431888','1','106.117.79.134','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2686','admin登录成功','1434480710','1','42.243.187.44','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2687','admin登录成功','1434496805','1','117.141.112.80','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2688','admin登录成功','1434510654','1','211.149.83.28','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2689','admin登录成功','1434514547','1','113.89.183.91','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2690','admin登录成功','1434560634','1','111.161.162.25','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2691','admin登录成功','1434591808','1','120.236.141.13','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2692','admin登录成功','1434602834','1','42.49.78.185','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2693','admin登录成功','1434608181','1','125.65.69.226','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2694','admin登录成功','1434664636','1','139.205.104.143','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2695','admin登录成功','1434675448','1','106.68.126.4','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2696','admin登录成功','1434675949','1','113.200.242.114','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2697','admin登录成功','1434679638','1','182.137.14.199','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2698','admin登录成功','1434685714','1','106.8.114.219','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2699','admin登录成功','1434699460','1','58.16.206.189','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2700','admin登录成功','1434702476','1','219.148.28.103','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2701','admin登录成功','1434742842','1','112.5.236.159','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2702','admin登录成功','1434749094','1','14.205.155.130','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2703','admin登录成功','1434765582','1','42.247.7.154','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2704','admin登录成功','1434785026','1','113.64.228.73','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2705','admin登录成功','1434815479','1','110.182.224.117','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2706','admin登录成功','1434832810','1','106.68.10.238','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2707','admin登录成功','1434832987','1','219.139.49.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2708','admin登录成功','1434867057','1','218.76.17.159','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2709','admin登录成功','1434873365','1','120.33.144.179','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2710','admin登录成功','1434922182','1','60.222.126.155','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2711','admin管理员密码错误','1434932907','0','27.13.29.124','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2712','admin登录成功','1434932914','1','27.13.29.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2713','培训课程更新成功','1434933017','1','27.13.29.124','1','DealCateType','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2714','商城更新成功','1434933087','1','27.13.29.124','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2715','达人秀更新成功','1434933099','1','27.13.29.124','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2716','小组更新成功','1434933108','1','27.13.29.124','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2717','发现更新成功','1434933115','1','27.13.29.124','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2718','发现更新成功','1434933119','1','27.13.29.124','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2719','admin登录成功','1434957555','1','116.112.213.42','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2720','admin登录成功','1434960567','1','106.68.10.238','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2721','admin登录成功','1434970334','1','119.85.117.186','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2722','admin登录成功','1435006002','1','119.131.134.139','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2723','积分商城更新成功','1435007026','1','119.131.134.139','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2724','fanwe更新成功','1435007277','1','119.131.134.139','1','User','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2725','fanwe更新成功','1435007414','1','119.131.134.139','1','User','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2726','admin登录成功','1435019898','1','106.113.235.75','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2727','admin登录成功','1435024735','1','27.13.29.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2728','admin登录成功','1435025177','1','14.147.203.155','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2729','admin登录成功','1435039596','1','110.252.198.148','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2730','明视眼镜（台江万达店）更新成功','1435039674','1','110.252.198.148','1','SupplierLocation','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2731','admin登录成功','1435040992','1','175.43.161.186','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2732','admin登录成功','1435041920','1','115.120.1.33','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2733','admin登录成功','1435081274','1','1.204.2.59','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2734','admin登录成功','1435083438','1','221.219.180.161','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2735','admin登录成功','1435086269','1','121.18.38.150','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2736','admin登录成功','1435090962','1','121.18.38.150','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2737','更新系统配置','1435091001','1','121.18.38.150','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2738','更新系统配置','1435091023','1','121.18.38.150','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2739','admin登录成功','1435095697','1','223.86.22.185','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2740','admin登录成功','1435102505','1','222.179.153.202','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2741','江津审核成功','1435102964','1','222.179.153.202','1','SupplierSubmit','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2742','admin登录成功','1435109044','1','222.162.24.228','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2743','云南添加成功','1435109328','1','222.162.24.228','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2744','云南彻底删除成功','1435109364','1','222.162.24.228','1','DealCity','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2745','admin登录成功','1435116691','1','144.52.13.153','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2746','admin登录成功','1435118378','1','27.13.29.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2747','admin登录成功','1435120702','1','110.182.224.175','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2748','admin登录成功','1435126628','1','110.82.93.115','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2749','admin登录成功','1435126939','1','59.38.137.82','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2750','admin登录成功','1435127529','1','101.245.21.250','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2751','admin登录成功','1435135117','1','175.43.161.186','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2752','admin登录成功','1435135460','1','123.14.249.196','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2753','admin登录成功','1435161613','1','182.148.75.52','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2754','admin登录成功','1435169761','1','114.247.244.114','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2755','admin登录成功','1435217277','1','113.201.84.152','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2756','admin登录成功','1435260885','1','27.13.153.194','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2757','1111审核成功','1435260918','1','27.13.153.194','1','SupplierSubmit','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2758','admin登录成功','1435266692','1','219.148.28.82','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2759','admin登录成功','1435276911','1','222.243.13.93','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2760','admin登录成功','1435277708','1','183.68.169.128','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2761','admin登录成功','1435294406','1','171.121.94.37','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2762','分站长添加成功','1435294586','1','171.121.94.37','1','Role','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2763','admin登录成功','1435306174','1','27.13.153.194','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2764','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)安装成功','1435306210','1','27.13.153.194','1','Sms','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2765','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)启用成功','1435306214','1','27.13.153.194','1','Sms','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2766','admin登录成功','1435348661','1','222.50.102.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2767','admin登录成功','1435349520','1','110.182.250.57','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2768','admin登录成功','1435351898','1','183.68.171.212','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2769','admin登录成功','1435353335','1','27.13.153.194','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2770','桥亭活鱼小镇更新成功','1435353944','1','27.13.153.194','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2771','仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。更新成功','1435355509','1','27.13.153.194','1','Deal','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2772','更新系统配置','1435355551','1','27.13.153.194','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2773','要APP狂点这里！添加成功','1435355639','1','27.13.153.194','1','Nav','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2774','身边团购更新成功','1435355665','1','27.13.153.194','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2775','要APP狂点这里！彻底删除成功','1435356760','1','27.13.153.194','1','Nav','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2776','更新系统配置','1435356775','1','27.13.153.194','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2777','admin登录成功','1435356957','1','171.9.9.91','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2778','admin登录成功','1435357437','1','222.50.102.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2779','admin登录成功','1435360025','1','222.170.67.250','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2780','admin登录成功','1435360328','1','113.68.39.189','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2781','admin登录成功','1435367908','1','112.81.210.112','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2782','admin登录成功','1435380400','1','117.82.21.133','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2783','admin登录成功','1435409880','1','2.225.175.181','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2784','admin登录成功','1435428003','1','180.89.194.116','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2785','admin登录成功','1435439239','1','27.13.24.69','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2786','smsbao卸载成功','1435439601','1','27.13.24.69','1','Sms','uninstall');
INSERT INTO `%DB_PREFIX%log` VALUES ('2787','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)安装成功','1435439613','1','27.13.24.69','1','Sms','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2788','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)启用成功','1435439616','1','27.13.24.69','1','Sms','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2789','更新系统配置','1435439699','1','27.13.24.69','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2790','admin登录成功','1435439815','1','223.158.57.247','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2791','更新系统配置','1435439850','1','223.158.57.247','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2792','smsbao卸载成功','1435440969','1','27.13.24.69','1','Sms','uninstall');
INSERT INTO `%DB_PREFIX%log` VALUES ('2793','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)安装成功','1435440980','1','27.13.24.69','1','Sms','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2794','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)启用成功','1435440983','1','27.13.24.69','1','Sms','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2795','admin登录成功','1435442789','1','61.140.55.119','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2796','更新系统配置','1435448357','1','27.13.24.69','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2797','更新系统配置','1435448447','1','27.13.24.69','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2798','admin登录成功','1435450129','1','61.163.122.110','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2799','smsbao卸载成功','1435450788','1','27.13.24.69','1','Sms','uninstall');
INSERT INTO `%DB_PREFIX%log` VALUES ('2800','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)安装成功','1435450930','1','27.13.24.69','1','Sms','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2801','短信宝增值平台 (<a href=\'http://www.smsbao.com/reg?r=5001\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)启用成功','1435450933','1','27.13.24.69','1','Sms','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2802','smsbao卸载成功','1435451474','1','27.13.24.69','1','Sms','uninstall');
INSERT INTO `%DB_PREFIX%log` VALUES ('2803','短信宝 (<a href=\'http://www.smsbao.com/reg?r=10021\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)安装成功','1435451614','1','27.13.24.69','1','Sms','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2804','短信宝 (<a href=\'http://www.smsbao.com/reg?r=10021\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)启用成功','1435451617','1','27.13.24.69','1','Sms','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2805','admin登录成功','1435460038','1','27.13.29.232','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2806','更新系统配置','1435460066','1','27.13.29.232','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2807','admin登录成功','1435460645','1','175.154.121.193','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2808','admin登录成功','1435464647','1','1.193.56.116','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2809','admin登录成功','1435472343','1','101.126.181.81','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2810','长沙添加成功','1435472741','1','101.126.181.81','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2811','服装更新成功','1435472953','1','101.126.181.81','1','GoodsType','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2812','特色小吃添加成功','1435473032','1','101.126.181.81','1','ShopCate','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2813','更新成功','1435473044','1','101.126.181.81','1','ShopCate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2814','更新成功','1435473084','1','101.126.181.81','1','ShopCate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2815','上海设为默认城市','1435473260','1','101.126.181.81','1','DealCity','set_default');
INSERT INTO `%DB_PREFIX%log` VALUES ('2816','北京设为默认城市','1435473265','1','101.126.181.81','1','DealCity','set_default');
INSERT INTO `%DB_PREFIX%log` VALUES ('2817','admin登录成功','1435525055','1','32.60.39.52','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2818','admin登录成功','1435527127','1','27.208.50.186','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2819','admin登录成功','1435536903','1','171.221.168.112','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2820','admin登录成功','1435552427','1','14.152.69.245','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2821','admin登录成功','1435561536','1','123.151.42.46','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2822','admin登录成功','1435563335','1','115.172.244.164','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2823','admin登录成功','1435565265','1','111.30.132.212','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2824','admin登录成功','1435565526','1','175.12.170.65','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2825','更新成功','1435565544','1','111.30.132.212','1','ShopCate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2826','admin登录成功','1435589432','1','222.69.138.63','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2827','身边团购更新成功','1435589579','1','222.69.138.63','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2828','admin登录成功','1435596034','1','223.72.67.117','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2829','仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。禁用成功','1435596767','1','223.72.67.117','1','Deal','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2830','仅售75元！价值100元的镜片代金券1张，仅适用于镜片，可叠加使用。启用成功','1435596770','1','223.72.67.117','1','Deal','set_effect');
INSERT INTO `%DB_PREFIX%log` VALUES ('2831','admin登录成功','1435597028','1','125.70.124.103','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2832','长沙彻底删除成功','1435597080','1','125.70.124.103','1','DealCity','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2833','上海彻底删除成功','1435597087','1','125.70.124.103','1','DealCity','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2834','上海彻底删除成功','1435597090','1','125.70.124.103','1','DealCity','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2835','四川添加成功','1435597108','1','125.70.124.103','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2836','成都添加成功','1435597123','1','125.70.124.103','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2837','四川更新成功','1435597133','1','125.70.124.103','1','DealCity','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2838','成都设为默认城市','1435597139','1','125.70.124.103','1','DealCity','set_default');
INSERT INTO `%DB_PREFIX%log` VALUES ('2839','更新成功','1435597239','1','125.70.124.103','1','DealCate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2840','小灰灰测试更新成功','1435597442','1','125.70.124.103','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2841','admin登录成功','1435603495','1','49.81.121.182','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2842','admin登录成功','1435605864','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2843','水果帮已审核通过','1435606177','1','182.139.182.231','1','TopicGroup','apply_pass');
INSERT INTO `%DB_PREFIX%log` VALUES ('2844','admin登录成功','1435607436','1','60.223.235.108','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2845','admin登录成功','1435608161','1','110.77.92.81','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2846','admin登录成功','1435620899','1','183.204.160.104','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2847','成功打款给小灰灰测试&yen;124元。','1435621484','1','183.204.160.104','1','Supplier','docharge');
INSERT INTO `%DB_PREFIX%log` VALUES ('2848','admin登录成功','1435624646','1','183.186.87.152','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2849','admin登录成功','1435638224','1','112.226.113.179','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2850','admin登录成功','1435646505','1','119.147.225.33','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2851','admin登录成功','1435651405','1','110.245.189.25','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2852','admin登录成功','1435652121','1','101.22.18.230','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2853','admin登录成功','1435686562','1','27.19.176.133','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2854','admin登录成功','1435691374','1','175.12.183.2','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2855','更新系统配置','1435691702','1','175.12.183.2','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2856','admin登录成功','1435692710','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2857','admin登录成功','1435693589','1','223.246.23.135','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2858','安徽添加成功','1435693785','1','223.246.23.135','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2859','宿州添加成功','1435693798','1','223.246.23.135','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2860','宿州设为默认城市','1435693802','1','223.246.23.135','1','DealCity','set_default');
INSERT INTO `%DB_PREFIX%log` VALUES ('2861','admin登录成功','1435720463','1','183.33.155.190','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2862','admin登录成功','1435721735','1','117.151.57.110','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2863','admin登录成功','1435727864','1','110.254.27.89','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2864','admin登录成功','1435771557','1','60.213.47.147','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2865','admin登录成功','1435773624','1','124.134.195.55','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2866','admin登录成功','1435775773','1','101.126.215.177','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2867','admin登录成功','1435775833','1','175.188.144.121','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2868','admin管理员密码错误','1435778465','0','120.42.251.94','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2869','admin登录成功','1435778474','1','120.42.251.94','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2870','admin登录成功','1435780113','1','115.120.63.74','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2871','admin登录成功','1435780602','1','123.53.70.193','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2872','admin登录成功','1435791434','1','123.114.43.181','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2873','admin登录成功','1435794959','1','123.114.43.181','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2874','admin登录成功','1435797888','1','60.171.46.38','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2875','admin登录成功','1435798713','1','183.67.115.179','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2876','admin登录成功','1435801300','1','27.13.27.184','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2877','支付宝手机支付(WAP版本)安装成功','1435801363','1','27.13.27.184','1','Payment','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2878','admin登录成功','1435802353','1','153.35.243.90','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2879','admin登录成功','1435813843','1','119.79.32.215','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2880','fanwe更新成功','1435813866','1','119.79.32.215','1','User','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2881','admin登录成功','1435814576','1','14.212.242.251','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2882','admin管理员密码错误','1435816611','0','27.208.50.186','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2883','admin登录成功','1435816625','1','27.208.50.186','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2884','admin登录成功','1435819531','1','27.13.27.184','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2885','admin登录成功','1435824347','1','124.134.52.31','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2886','admin登录成功','1435831967','1','27.189.54.127','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2887','admin登录成功','1435876229','1','14.147.146.171','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2888','admin登录成功','1435885758','1','60.2.67.14','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2889','admin登录成功','1435888160','1','1.198.160.252','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2890','admin登录成功','1435889516','1','112.115.12.48','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2891','admin登录成功','1435904957','1','219.128.12.3','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2892','admin登录成功','1435917316','1','110.205.237.182','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2893','admin登录成功','1435951335','1','101.44.66.2','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2894','admin登录成功','1435995806','1','183.92.87.205','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2895','admin登录成功','1436000073','1','140.75.104.131','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2896','admin登录成功','1436040877','1','60.215.230.166','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2897','admin登录成功','1436042649','1','175.154.83.91','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2898','admin登录成功','1436044692','1','49.77.136.104','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2899','admin登录成功','1436048309','1','27.189.54.127','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2900','admin登录成功','1436068940','1','122.71.144.69','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2901','admin登录成功','1436079408','1','59.174.162.2','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2902','admin登录成功','1436085157','1','171.83.142.27','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2903','admin登录成功','1436131292','1','171.221.128.155','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2904','admin登录成功','1436135550','1','112.244.235.183','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2905','admin登录成功','1436142039','1','183.160.179.241','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2906','admin登录成功','1436142233','1','183.160.179.241','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2907','admin登录成功','1436145306','1','171.113.241.213','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2908','福州肯德基更新成功','1436145434','1','171.113.241.213','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2909','admin登录成功','1436148687','1','115.120.15.57','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2910','admin登录成功','1436237100','1','27.13.155.138','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2911','admin登录成功','1436237140','1','123.114.36.50','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2912','admin登录成功','1436239690','1','123.114.36.50','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2913','admin登录成功','1436243335','1','119.55.47.190','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2914','admin登录成功','1436285309','1','183.92.64.81','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2915','admin登录成功','1436296126','1','218.200.187.245','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2916','admin登录成功','1436300915','1','183.92.64.81','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2917','admin登录成功','1436315713','1','175.191.107.132','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2931','admin登录成功','1436413604','1','221.6.210.90','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2930','admin登录成功','1436404789','1','221.213.193.146','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2929','admin登录成功','1436385406','1','124.152.7.106','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2928','admin登录成功','1436372125','1','111.122.182.17','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2927','admin登录成功','1436369864','1','223.12.134.228','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2926','admin登录成功','1436326871','1','1.88.235.103','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2925','admin管理员密码错误','1436323663','0','49.221.62.182','0','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2932','admin登录成功','1436423209','1','112.0.88.174','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2933','admin登录成功','1436432137','1','118.119.232.89','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2934','admin登录成功','1436471137','1','210.21.47.85','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2935','admin登录成功','1436478930','1','115.60.93.200','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2936','admin登录成功','1436480480','1','183.27.28.134','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2937','admin登录成功','1436502399','1','1.83.243.69','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2938','admin登录成功','1436559236','1','27.13.25.179','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2939','admin登录成功','1436582281','1','119.176.203.91','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2940','admin登录成功','1436595382','1','111.37.17.175','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2941','首页更新成功','1436596381','1','111.37.17.175','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2942','首页更新成功','1436596402','1','111.37.17.175','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2943','更新成功','1436596547','1','111.37.17.175','1','ShopCate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2944','admin登录成功','1436645480','1','119.120.235.59','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2945','admin登录成功','1436646265','1','123.160.193.200','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2946','admin登录成功','1436663073','1','218.15.250.180','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2947','admin登录成功','1436667295','1','113.47.52.18','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2948','admin登录成功','1436918104','1','220.200.25.244','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2949','admin登录成功','1436919227','1','27.13.26.205','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2950','admin登录成功','1436919245','1','101.40.249.172','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2951','重庆添加成功','1436919299','1','27.13.26.205','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2952','黔江添加成功','1436919316','1','27.13.26.205','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2953','彭水添加成功','1436919369','1','27.13.26.205','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2954','admin登录成功','1436919479','1','49.80.200.105','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2955','admin登录成功','1436921574','1','36.63.116.18','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2956','admin登录成功','1436937382','1','125.86.90.51','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2957','admin登录成功','1436940721','1','113.214.202.229','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2958','admin登录成功','1436955144','1','1.50.159.84','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2959','admin登录成功','1436981479','1','183.23.136.88','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2960','admin登录成功','1436990146','1','222.42.44.68','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2961','湖北添加成功','1436990204','1','222.42.44.68','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2962','湖北更新成功','1436990232','1','222.42.44.68','1','DealCity','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2963','湖北彻底删除成功','1436990410','1','222.42.44.68','1','DealCity','foreverdelete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2964','admin登录成功','1437004962','1','123.187.28.151','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2965','test审核成功','1437005854','1','123.187.28.151','1','SupplierSubmit','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2966','testtest添加成功','1437006160','1','123.187.28.151','1','Deal','shop_insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2967','testtest添加成功','1437006161','1','123.187.28.151','1','Deal','shop_insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2968','testtest删除成功','1437006572','1','123.187.28.151','1','Deal','delete');
INSERT INTO `%DB_PREFIX%log` VALUES ('2969','admin登录成功','1437009228','1','171.120.31.86','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2970','admin登录成功','1437015457','1','122.195.85.240','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2971','admin登录成功','1437021810','1','114.225.54.190','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2972','admin登录成功','1437040243','1','123.112.249.16','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2973','一米更新成功','1437040424','1','123.112.249.16','1','User','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2974','admin登录成功','1437070441','1','123.246.135.58','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2975','admin登录成功','1437074009','1','14.16.184.241','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2976','admin登录成功','1437087042','1','171.118.191.45','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2977','admin登录成功','1437092527','1','125.71.121.46','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2978','pzlc添加成功','1437092555','1','125.71.121.46','1','User','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('2979','管理员编辑帐户','1437092571','1','125.71.121.46','1','User','modify_account');
INSERT INTO `%DB_PREFIX%log` VALUES ('2980','更新系统配置','1437092615','1','125.71.121.46','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('2981','admin登录成功','1437096517','1','182.247.207.5','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2982','admin登录成功','1437096844','1','119.1.220.157','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2983','admin登录成功','1437114506','1','1.196.228.95','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2984','admin登录成功','1437114744','1','117.186.56.253','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2985','admin登录成功','1437157341','1','110.88.126.92','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2986','admin登录成功','1437165315','1','222.162.234.35','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2987','admin登录成功','1437169125','1','223.73.18.165','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2988','admin登录成功','1437174727','1','42.239.226.203','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2989','admin登录成功','1437181329','1','124.72.57.217','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2990','admin登录成功','1437181918','1','180.88.6.237','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2991','admin登录成功','1437184319','1','183.160.2.106','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2992','admin登录成功','1437185017','1','111.201.227.162','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2993','admin登录成功','1437186763','1','120.71.122.41','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2994','admin登录成功','1437190845','1','112.224.17.215','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2995','admin登录成功','1437201432','1','223.73.18.165','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2996','admin登录成功','1437267772','1','182.45.24.59','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2997','admin登录成功','1437275554','1','116.27.0.183','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2998','admin登录成功','1437300601','1','117.140.181.121','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('2999','小灰灰测试更新成功','1437301154','1','117.140.181.121','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3000','admin登录成功','1437343491','1','118.119.224.90','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3001','admin登录成功','1437346785','1','218.59.183.174','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3002','admin登录成功','1437347351','1','118.196.228.6','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3003','admin登录成功','1437351222','1','115.50.115.203','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3004','admin登录成功','1437353561','1','60.23.213.162','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3005','大灰狼添加成功','1437353691','1','60.23.213.162','1','Supplier','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3006','admin登录成功','1437356322','1','220.114.232.38','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3007','admin登录成功','1437356345','1','175.17.83.198','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3008','admin登录成功','1437366711','1','117.140.181.18','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3009','admin登录成功','1437380014','1','119.183.233.87','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3010','成都设为默认城市','1437380081','1','119.183.233.87','1','DealCity','set_default');
INSERT INTO `%DB_PREFIX%log` VALUES ('3011','admin登录成功','1437385293','1','117.140.181.18','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3012','男士棉服更新成功','1437387756','1','117.140.181.18','1','Article','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3013','男士棉服更新成功','1437388904','1','117.140.181.18','1','Article','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3014','admin登录成功','1437408915','1','219.157.65.208','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3015','admin登录成功','1437420240','1','222.87.55.168','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3016','admin登录成功','1437431445','1','113.232.179.211','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3017','admin登录成功','1437433229','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3018','admin登录成功','1437438878','1','112.91.241.118','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3019','admin登录成功','1437441054','1','218.23.148.157','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3020','admin登录成功','1437447245','1','221.178.182.200','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3021','admin登录成功','1437460059','1','182.118.220.244','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3022','admin登录成功','1437460636','1','101.226.125.121','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3023','admin登录成功','1437460776','1','180.77.116.216','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3024','123添加成功','1437461113','1','101.226.125.121','1','Deal','shop_insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3025','admin登录成功','1437502289','1','112.82.40.38','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3026','admin登录成功','1437512926','1','183.239.133.122','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3027','admin登录成功','1437518746','1','222.220.73.250','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3028','admin登录成功','1437530954','1','125.122.210.250','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3029','admin登录成功','1437532770','1','122.70.41.51','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3030','仅售76.4元，价值110元美味套餐！节假日通用！请提前1小时预约！提供免费WiFi！添加成功','1437533135','1','122.70.41.51','1','Deal','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3031','admin登录成功','1437540201','1','117.131.103.252','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3032','admin登录成功','1437545883','1','123.151.12.154','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3033','admin登录成功','1437546441','1','219.143.143.4','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3034','更新系统配置','1437547422','1','219.143.143.4','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3035','更新系统配置','1437547436','1','219.143.143.4','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3036','admin登录成功','1437551557','1','118.199.192.197','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3037','admin登录成功','1437555805','1','59.175.38.211','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3038','admin登录成功','1437586601','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3039','百度烤肉更新成功','1437586706','1','182.139.182.231','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3040','admin登录成功','1437586942','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3041','仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中更新成功','1437587049','1','182.139.182.231','1','Deal','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3042','admin登录成功','1437588893','1','219.142.224.130','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3043','首页更新成功','1437588959','1','219.142.224.130','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3044','大灰狼更新成功','1437592143','1','219.142.224.130','1','SupplierLocation','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3045','大灰狼更新成功','1437592152','1','219.142.224.130','1','SupplierLocation','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3046','仅售49.90元！价值59元的百度烤肉单人自助午餐，提供免费WiFi。全新升级，盛大开业，特价优惠火爆抢购中更新成功','1437594311','1','182.139.182.231','1','Deal','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3047','39_is_effect启用成功','1437595994','1','122.70.41.51','1','SupplierLocation','toogle_status');
INSERT INTO `%DB_PREFIX%log` VALUES ('3048','39_is_verify启用成功','1437595999','1','122.70.41.51','1','SupplierLocation','toogle_status');
INSERT INTO `%DB_PREFIX%log` VALUES ('3049','一元吃肯德基更新成功','1437596066','1','122.70.41.51','1','Youhui','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3050','admin登录成功','1437626733','1','117.186.242.210','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3051','admin登录成功','1437626999','1','183.224.162.102','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3052','admin登录成功','1437631015','1','122.70.41.51','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3053','admin登录成功','1437638559','1','221.131.70.169','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3054','admin登录成功','1437672701','1','113.109.86.212','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3055','Array更新成功','1437672733','1','113.109.86.212','1','SupplierLocationDp','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3056','admin登录成功','1437698018','1','14.197.144.45','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3057','admin登录成功','1437704953','1','27.30.129.93','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3058','admin登录成功','1437727313','1','27.30.129.93','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3059','admin登录成功','1437855926','1','222.178.152.74','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3060','admin登录成功','1437874285','1','116.209.220.21','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3061','admin登录成功','1437876004','1','115.34.54.45','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3062','admin登录成功','1437876208','1','27.13.25.169','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3063','QQv2登录插件更新成功','1437876242','1','27.13.25.169','1','ApiLogin','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3064','admin登录成功','1437882664','1','218.14.182.247','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3065','admin登录成功','1437888892','1','183.224.162.102','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3066','admin登录成功','1437889550','1','218.14.182.247','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3067','test更新成功','1437902979','1','218.14.182.247','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3068','5454545454添加成功','1437903471','1','218.14.182.247','1','Deal','shop_insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3069','微信支付(WAP版本)安装成功','1437904281','1','218.14.182.247','1','Payment','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3070','支付宝支付安装成功','1437904310','1','218.14.182.247','1','Payment','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3071','admin登录成功','1437915651','1','49.76.131.161','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3072','admin登录成功','1437929708','1','222.173.216.38','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3073','admin登录成功','1437930363','1','60.222.132.175','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3074','admin登录成功','1437934270','1','220.200.25.166','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3075','admin登录成功','1437936912','1','60.222.132.175','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3076','admin登录成功','1437938626','1','171.8.234.1','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3077','admin登录成功','1437952136','1','110.19.159.199','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3078','admin登录成功','1437959459','1','222.170.1.205','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3079','admin登录成功','1437959852','1','123.131.223.229','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3080','admin登录成功','1437962534','1','171.39.210.99','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3081','admin登录成功','1438364606','1','117.36.131.89','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3082','陕西添加成功','1438364759','1','117.36.131.89','1','DealCity','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3083','admin登录成功','1438456996','1','183.224.200.4','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3084','admin登录成功','1438498841','1','120.241.207.147','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3085','admin登录成功','1438547486','1','180.141.9.13','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3086','admin登录成功','1438556231','1','111.22.7.238','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3087','admin登录成功','1438585339','1','180.130.2.75','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3088','admin登录成功','1438588226','1','106.40.170.31','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3089','admin登录成功','1438588807','1','180.130.2.75','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3090','admin登录成功','1438590164','1','182.245.18.237','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3091','admin登录成功','1438661040','1','60.255.43.28','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3092','admin登录成功','1438661119','1','120.241.233.59','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3093','admin登录成功','1438674509','1','183.248.1.152','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3094','爱丁堡尊贵养生会所更新成功','1438674691','1','183.248.1.152','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3095','餐饮套餐更新成功','1438674804','1','183.248.1.152','1','GoodsType','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3096','颜色更新成功','1438675791','1','183.248.1.152','1','FilterGroup','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3097','DWSF EW添加成功','1438675880','1','183.248.1.152','1','GoodsType','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3098','BFBRT添加成功','1438675895','1','183.248.1.152','1','GoodsTypeAttr','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3099','admin登录成功','1438710738','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3100','百度烤肉更新成功','1438710776','1','182.139.182.231','1','Supplier','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3101','admin登录成功','1438716878','1','182.139.182.231','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3102','admin登录成功','1438719971','1','163.177.136.129','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3103','admin登录成功','1438726009','1','219.138.246.67','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3104','admin登录成功','1438737640','1','175.153.247.42','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3105','admin登录成功','1438772330','1','121.56.10.136','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3106','首页更新成功','1438772606','1','121.56.10.136','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3107','首页更新成功','1438772695','1','121.56.10.136','1','Nav','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3108','TPL_SMS_VERIFY_CODE更新成功','1438773041','1','121.56.10.136','1','MsgTemplate','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3109','admin登录成功','1438806287','1','27.13.154.121','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3110','更新系统配置','1438806634','1','27.13.154.121','1','Conf','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3111','admin登录成功','1438810479','1','125.84.160.124','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3112','admin登录成功','1438814526','1','121.205.3.249','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3113','admin登录成功','1438815156','1','121.56.10.136','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3114','小灰灰审核成功','1438816932','1','27.13.154.121','1','SupplierSubmit','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3115','admin登录成功','1438818345','1','27.208.59.71','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3116','admin登录成功','1438818694','1','223.104.9.205','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3117','admin登录成功','1438824436','1','219.145.120.252','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3118','admin登录成功','1438835065','1','112.20.190.48','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3119','admin登录成功','1438838596','1','112.11.79.38','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3120','admin登录成功','1438852016','1','27.224.154.137','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3121','admin登录成功','1438915717','1','118.119.235.36','1','Public','do_login');
INSERT INTO `%DB_PREFIX%log` VALUES ('3122','小灰灰更新成功','1438917513','1','118.119.235.36','1','SupplierLocation','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3123','首页优惠右侧广告更新成功','1438918381','1','118.119.235.36','1','Adv','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('3124','首页优惠右侧广告更新成功','1438918421','1','118.119.235.36','1','Adv','update');
DROP TABLE IF EXISTS `%DB_PREFIX%lottery`;
CREATE TABLE `%DB_PREFIX%lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_sn` varchar(255) NOT NULL COMMENT '抽奖券序列号（顺序生成）',
  `deal_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '抽奖券所属会员ID',
  `mobile` varchar(255) NOT NULL COMMENT '参与抽奖的手机号',
  `create_time` int(11) NOT NULL COMMENT '抽奖时间',
  `buyer_id` int(11) NOT NULL COMMENT '购买人ID(产生抽奖行为的会员ID，当抽奖券由被推荐人购买时该 ID与user_id不相等)',
  `sms_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='抽奖券表';
DROP TABLE IF EXISTS `%DB_PREFIX%m_adv`;
CREATE TABLE `%DB_PREFIX%m_adv` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '广告名称',
  `img` varchar(255) DEFAULT '' COMMENT '广告图片',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `type` tinyint(1) DEFAULT '0' COMMENT '1分类标签广告\r\n2URL广告\r\n3分类排行\r\n4达人页\r\n5搜索页\r\n6拍照\r\n7热门\r\n8分享详细\r\n9团购列表\r\n10商品列表\r\n11活动列表\r\n12优惠列表\r\n13代金券列表\r\n14团购明细\r\n15商品明细\r\n16活动明细\r\n17优惠明细\r\n18代金券明细\r\n19关于我们\r\n20优惠券主页面\r\n21公告列表			',
  `position` tinyint(1) NOT NULL COMMENT '显示的位置 0:首页 1:启动页 2:专题位',
  `data` text COMMENT '配置的序列化数据（根据不同的type存放不同的结果）',
  `sort` smallint(5) DEFAULT '10' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0:无效1:有效',
  `city_id` int(11) DEFAULT '0' COMMENT '所属城市',
  `ctl` varchar(255) DEFAULT NULL,
  `zt_id` int(11) NOT NULL COMMENT '手机端专题组的ID',
  `zt_position` varchar(255) NOT NULL COMMENT '专题模板的位置显示(广告位ID)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='手机端广告配置表';
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('10','支付宝广告','./public/attachment/sjmapi/4f5176077b5e6.jpg','0','0','0','a:1:{s:3:\"url\";s:37:\"http://bizpartner.alipay.com/fangwei/\";}','3','1','0','url','0','');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('12','方维o2o','./public/attachment/sjmapi/4f2ce3d1827e4.jpg','0','0','0','a:1:{s:3:\"url\";s:20:\"http://www.fanwe.com\";}','5','1','0','url','0','');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('20','方维o2o','./public/attachment/sjmapi/4f2ce3d1827e4.jpg','1','0','0','a:1:{s:3:\"url\";s:20:\"http://www.fanwe.com\";}','9','1','0','url','0','');
INSERT INTO `%DB_PREFIX%m_adv` VALUES ('19','支付宝','./public/attachment/sjmapi/5451eb7862ae7.jpg','1','0','0','a:1:{s:3:\"url\";s:37:\"http://bizpartner.alipay.com/fangwei/\";}','8','1','0','url','0','');
DROP TABLE IF EXISTS `%DB_PREFIX%m_config`;
CREATE TABLE `%DB_PREFIX%m_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `val` text,
  `type` tinyint(1) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '基础配置' COMMENT '分组显示',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='手机端的后台配置表';
INSERT INTO `%DB_PREFIX%m_config` VALUES ('19','index_logo','首页logo','./public/attachment/201202/04/16/4f2ce8336d784.png','2','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('3','has_ecv','有优惠券','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('6','has_message','有留言框','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('7','has_region','有配送地区选择项','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('8','region_version','配送地区版本','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('9','only_one_delivery','只有一个配送地区','1','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('10','kf_phone','客服电话','133-5589-2255','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('11','kf_email','客服邮箱','330686020@qq.com','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('16','page_size','分页大小','10','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('18','program_title','程序标题名称','小灰灰博客O2O','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('22','sina_app_key','新浪App Key','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('23','sina_app_secret','新浪App Secret','','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('24','sina_bind_url','新浪回调地址','http://sns.whalecloud.com/sina2/callback','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('68','wx_app_secret','微信(开放)appSecret','','0','基础配置','19');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('67','wx_app_key','微信(开放)AppID','','0','基础配置','18');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('61','ios_biz_forced_upgrade','商家ios是否强制升级(0:否;1:是)','0','0','商家手机端升级设置','12');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('62','android_biz_version','商家android版本号(yyyymmddnn)','','0','商家手机端升级设置','13');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('63','android_biz_filename','商家android下载包名','http://baocms.5maiche.cn/o2ofanwe_app.RSO.apk','0','商家手机端升级设置','14');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('65','android_biz_forced_upgrade','商家android是否强制升级(0:否;1:是)','0','0','商家手机端升级设置','16');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('64','android_biz_upgrade','商家android版本升级内容','请大家下载安卓客户端吧！','3','商家手机端升级设置','15');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('50','ios_version','ios版本号(yyyymmddnn)','','0','手机端升级设置','1');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('51','ios_down_url','ios下载地址(appstore连接地址)','http://o2o.fanwe.net/o2ofanwe_app.ipa','0','手机端升级设置','2');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('52','ios_upgrade','ios版本升级内容','ios升级测试','3','手机端升级设置','3');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('53','ios_forced_upgrade','ios是否强制升级(0:否;1:是)','0','0','手机端升级设置','4');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('54','android_version','android版本号(yyyymmddnn)','2015021001','0','手机端升级设置','5');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('55','android_filename','android下载包名','http://o2o.fanwe.net/o2ofanwe_app.apk','0','手机端升级设置','6');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('56','android_upgrade','android版本升级内容','android升级测试','3','手机端升级设置','7');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('57','android_forced_upgrade','android是否强制升级(0:否;1:是)','0','0','手机端升级设置','8');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('58','ios_biz_version','商家ios版本号(yyyymmddnn)','','0','商家手机端升级设置','9');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('59','ios_biz_down_url','商家ios下载地址(appstore连接地址)','h','0','商家手机端升级设置','10');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('60','ios_biz_upgrade','商家ios版本升级内容','商家ios升级测试','3','商家手机端升级设置','11');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('29','qq_app_secret','腾讯开放平台APP KEY','vbnvbnvbnvbn','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('28','qq_app_key','腾讯开放平台APP ID','bvhgbnn','0','基础配置','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('69','about_info','关于我们(文章ID)','','0','基础配置','20');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('72','wx_appid','微信(公众)APPID','222','0','基础配置','67');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('73','wx_secrit','微信(公众)SECRIT','222','0','基础配置','68');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('74','android_biz_master_secret','商家android推送友盟AppMasterSecret','','0','手机推送配置','18');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('75','android_biz_app_key','商家android推送友盟AppKey','','0','手机推送配置','17');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('76','ios_biz_app_key','商家ios推送友盟AppKey','','0','手机推送配置','19');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('77','ios_biz_master_secret','商家ios推送友盟AppMasterSecret','','0','手机推送配置','20');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('78','android_master_secret','android推送友盟AppMasterSecret','','0','手机推送配置','24');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('79','android_app_key','android推送友盟AppKey','','0','手机推送配置','23');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('80','ios_app_key','ios推送友盟AppKey','','0','手机推送配置','25');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('81','ios_master_secret','ios推送友盟AppMasterSecret','','0','手机推送配置','26');
DROP TABLE IF EXISTS `%DB_PREFIX%m_config_list`;
CREATE TABLE `%DB_PREFIX%m_config_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) DEFAULT NULL,
  `group` int(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `has_calc` int(1) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `is_verify` int(1) DEFAULT '0' COMMENT '0:无效；1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='手机端支付时用到一些额外配置，包括支付接口等';
DROP TABLE IF EXISTS `%DB_PREFIX%m_index`;
CREATE TABLE `%DB_PREFIX%m_index` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `vice_name` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `ctl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%m_index` VALUES ('85','公告','&#58891;','#005824','','17','a:1:{s:0:\"\";N;}','14','1','0','0','0','1','notices');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('84','公告','','','./public/attachment/sjmapi/5461d5d7a6e54.png','17','a:1:{s:0:\"\";N;}','13','1','0','0','0','0','notices');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('82','积分商城','','','./public/attachment/sjmapi/544753bc5bd98.png','13','a:1:{s:7:\"cate_id\";s:0:\"\";}','11','1','0','0','0','0','scores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('81','活动','','#91278f','','14','a:1:{s:7:\"cate_id\";s:0:\"\";}','10','1','0','0','0','1','events');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('79','优惠券','&#58899;','#a36209','','15','a:1:{s:7:\"cate_id\";s:0:\"\";}','8','1','0','0','0','1','youhuis');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('80','活动','','','./public/attachment/sjmapi/546c644653000.png','14','a:1:{s:7:\"cate_id\";s:0:\"\";}','9','1','0','0','0','0','events');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('78','优惠券','','','./public/attachment/sjmapi/546c651d83c20.png','15','a:1:{s:7:\"cate_id\";s:0:\"\";}','7','1','0','0','0','0','youhuis');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('77','商家','&#58898;','#9d0a0f','','16','a:1:{s:7:\"cate_id\";s:0:\"\";}','6','1','0','0','0','1','stores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('76','商家','','','./public/attachment/sjmapi/546c65928f3fd.png','16','a:1:{s:7:\"cate_id\";s:0:\"\";}','5','1','0','0','0','0','stores');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('74','亲子母婴','','','./public/attachment/sjmapi/54475407206cd.png','12','a:1:{s:7:\"cate_id\";s:2:\"29\";}','3','1','0','0','0','0','goods');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('87','抢好礼','','#9d0a0f','','11','a:1:{s:7:\"cate_id\";s:0:\"\";}','16','1','0','0','0','1','tuan');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('72','餐饮美食','','','./public/attachment/sjmapi/546c651d83c20.png','11','a:1:{s:7:\"cate_id\";s:1:\"8\";}','1','1','0','0','0','0','tuan');
INSERT INTO `%DB_PREFIX%m_index` VALUES ('86','扫一扫','','#0054a5','./public/attachment/sjmapi/544753eebe38c.png','0','a:1:{s:3:\"url\";s:0:\"\";}','15','1','0','0','0','1','url');
DROP TABLE IF EXISTS `%DB_PREFIX%m_notice`;
CREATE TABLE `%DB_PREFIX%m_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '文章内容',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='手机端公告列表';
INSERT INTO `%DB_PREFIX%m_notice` VALUES ('1','方维o2o_V3.0新版发布','方维o2o_V3.0新版发布','1431285171','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%m_zt`;
CREATE TABLE `%DB_PREFIX%m_zt` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  `mobile_type` tinyint(1) DEFAULT '0' COMMENT '手机类型0:ios/android; 1:wap',
  `type` tinyint(1) DEFAULT '0' COMMENT '1分类标签广告\r\n2URL广告\r\n3分类排行\r\n4达人页\r\n5搜索页\r\n6拍照\r\n7热门\r\n8分享详细\r\n9团购列表\r\n10商品列表\r\n11活动列表\r\n12优惠列表\r\n13代金券列表\r\n14团购明细\r\n15商品明细\r\n16活动明细\r\n17优惠明细\r\n18代金券明细\r\n19关于我们\r\n20优惠券主页面\r\n21公告列表			',
  `data` text COMMENT '配置的序列化数据（根据不同的type存放不同的结果）',
  `sort` smallint(5) DEFAULT '10' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0:无效1:有效',
  `city_id` int(11) DEFAULT '0' COMMENT '所属城市',
  `ctl` varchar(255) DEFAULT NULL,
  `zt_moban` varchar(255) NOT NULL COMMENT '专题模板文件路径',
  `zt_title` varchar(255) NOT NULL COMMENT '专题显示的标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='手机端首页专题位';
DROP TABLE IF EXISTS `%DB_PREFIX%mail_list`;
CREATE TABLE `%DB_PREFIX%mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_address` varchar(255) NOT NULL COMMENT '邮件的地址',
  `city_id` int(11) NOT NULL COMMENT '订阅的城市ID，用于按地区群发时匹配',
  `code` varchar(255) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_address_idx` (`mail_address`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='邮件订阅表';
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('20','fanwe@fanwe.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('21','fanwe1@fanwe.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('22','330686020@qq.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('23','inwater@126.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('24','80417633@qq.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('25','81510184@qq.com','15','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('26','3225810@qq.com','24','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('27','zhtyuan99@qq.com','26','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('28','Lcc1969@163.com','26','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('29','123456@qq.com','26','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('30','123363916@qq.com','18','','1');
INSERT INTO `%DB_PREFIX%mail_list` VALUES ('31','hyw21@126.com','24','','1');
DROP TABLE IF EXISTS `%DB_PREFIX%mail_server`;
CREATE TABLE `%DB_PREFIX%mail_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(255) NOT NULL COMMENT 'smtp服务器地址IP或域名',
  `smtp_name` varchar(255) NOT NULL COMMENT 'smtp发件帐号名',
  `smtp_pwd` varchar(255) NOT NULL COMMENT 'smtp密码',
  `is_ssl` tinyint(1) NOT NULL COMMENT '是否ssl加密连接（参考具体smtp服务商的要求，如gmail要求ssl连接）',
  `smtp_port` varchar(255) NOT NULL COMMENT 'smtp端口',
  `use_limit` int(11) NOT NULL COMMENT '可用次数为0时表示无限次数使用, 次数满后轮到下一个配置的邮件服务器发件，直到没有可发的邮件服务器为止',
  `is_reset` tinyint(1) NOT NULL COMMENT '是否自动清零，1:次数达到上限后自动清零，等待下一个轮回继续使用该邮箱发送',
  `is_effect` tinyint(1) NOT NULL,
  `total_use` int(11) NOT NULL COMMENT '当前已用次数',
  `is_verify` tinyint(1) NOT NULL COMMENT '是否需要身份验证,通常为1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='发件用邮件服务器列表';
