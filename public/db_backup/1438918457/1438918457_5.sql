-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:27
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 5


DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account_auth`;
CREATE TABLE `%DB_PREFIX%supplier_account_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_account_id` int(11) NOT NULL COMMENT '管理员帐号ID',
  `module` varchar(20) NOT NULL COMMENT '授权模块',
  `node` varchar(20) NOT NULL COMMENT '授权节点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk` (`supplier_account_id`,`module`,`node`),
  KEY `supplier_account_id` (`supplier_account_id`),
  KEY `module` (`module`),
  KEY `node` (`node`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家账号的授权表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account_location_link`;
CREATE TABLE `%DB_PREFIX%supplier_account_location_link` (
  `account_id` int(11) NOT NULL COMMENT '帐号ID',
  `location_id` int(11) NOT NULL COMMENT '门店ID',
  PRIMARY KEY (`account_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帐号可管理的门店';
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('11','26');
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('21','36');
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('22','37');
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('23','38');
INSERT INTO `%DB_PREFIX%supplier_account_location_link` VALUES ('24','40');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_dy`;
CREATE TABLE `%DB_PREFIX%supplier_dy` (
  `uid` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端商家订阅功能';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location`;
CREATE TABLE `%DB_PREFIX%supplier_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '门店名称',
  `route` text NOT NULL COMMENT '公交线路',
  `address` text NOT NULL COMMENT '门店地址',
  `tel` varchar(255) NOT NULL COMMENT '门店电话',
  `contact` varchar(255) NOT NULL COMMENT '联系人',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `brief` text NOT NULL COMMENT '商家简介',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认门店(总店)',
  `api_address` text NOT NULL COMMENT '用于地图定位的地址',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `deal_cate_match` text NOT NULL COMMENT '生活服务分类全文索引',
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地址全文索引',
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '门店名称全文索引',
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL COMMENT '所属生活服务大分类ID',
  `preview` varchar(255) NOT NULL COMMENT '列表图',
  `is_recommend` tinyint(1) NOT NULL COMMENT '标识为推荐门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL COMMENT '标签列表 多个标签以空格分隔',
  `tags_match` text NOT NULL COMMENT '标签的全文索引',
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL COMMENT '总评平均分，后台可操作更改',
  `good_dp_count` int(11) NOT NULL COMMENT '好评数',
  `bad_dp_count` int(11) NOT NULL COMMENT '差评数',
  `common_dp_count` int(11) NOT NULL COMMENT '中评数',
  `total_point` int(11) NOT NULL COMMENT '点评总分',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `image_count` int(11) NOT NULL COMMENT '门店图片数',
  `ref_avg_price` float(14,4) NOT NULL COMMENT '人均消费',
  `good_rate` float(14,4) NOT NULL COMMENT '好评率',
  `common_rate` float(14,4) NOT NULL COMMENT '中评率',
  `sms_content` varchar(255) NOT NULL DEFAULT '' COMMENT '用户短信下载的商家信息',
  `index_img` varchar(255) NOT NULL DEFAULT '' COMMENT '首页用图',
  `tuan_count` int(11) NOT NULL COMMENT '团购数',
  `event_count` int(11) NOT NULL COMMENT '活动数',
  `youhui_count` int(11) NOT NULL COMMENT '优惠券数',
  `daijin_count` int(11) NOT NULL COMMENT '代金券数',
  `seo_title` text NOT NULL COMMENT '自定义门店页的seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义门店页的seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义门店页的seo描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `biz_license` varchar(255) NOT NULL COMMENT '商家营业执照',
  `biz_other_license` varchar(255) NOT NULL COMMENT '商家的其他资质',
  `new_dp_count` int(11) NOT NULL COMMENT '最新点评数量',
  `new_dp_count_time` int(11) NOT NULL COMMENT '最新点评的更新时间',
  `shop_count` int(11) NOT NULL COMMENT '商品数量',
  `mobile_brief` text NOT NULL COMMENT '手机端列表简介',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `dp_group_point` text NOT NULL COMMENT '门店的分组点评数据的平均分',
  `tuan_youhui_cache` text NOT NULL COMMENT '商家列表页团购与优惠券第一条的展示',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `adv_img_1` text NOT NULL COMMENT '门店顶部广告位',
  `adv_img_2` text NOT NULL COMMENT '门店侧边广告位',
  `location_qq` varchar(20) NOT NULL COMMENT '门店客服QQ',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`) USING BTREE,
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`) USING BTREE,
  KEY `search_idx3` (`supplier_id`,`is_main`) USING BTREE,
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`) USING BTREE,
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`) USING BTREE,
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`) USING BTREE,
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`) USING BTREE,
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='商家门店表';
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('21','桥亭活鱼小镇（万象城店）','','台江区宝龙万象城4楼391号','059188855588','李四','119.296641','26.070661','23','9:00-22:00','<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><img src=\"./public/attachment/201502/25/14/54ed69afb8e5a.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><strong>桥亭泡菜鱼（大份）</strong></p>\r\n<p align=\"center\"><br />\r\n</p>\r\n<p align=\"center\"><strong><img src=\"./public/attachment/201502/25/14/54ed69bd31679.jpg\" alt=\"\" border=\"0\" /><br />\r\n</strong></p>\r\n','0','','15','ux39184ux39278ux32654ux39135,ux38397ux33756,ux24029ux33756','餐饮美食,闽菜,川菜','ux21488ux27743ux21306,ux23453ux40857,ux19975ux35937,ux51ux57ux49,ux21488ux27743ux21306ux23453ux40857ux19975ux35937ux22478ux52ux27004ux51ux57ux49ux21495,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478,ux26725ux20141','台江区,宝龙,万象,391,台江区宝龙万象城4楼391号,宝龙城市广场,万象城,桥亭','ux26725ux20141,ux19975ux35937,ux23567ux38215,ux26725ux20141ux27963ux40060ux23567ux38215ux65288ux19975ux35937ux22478ux24215ux65289','桥亭,万象,小镇,桥亭活鱼小镇（万象城店）','8','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','0','水煮活鱼 火锅 川菜','ux27700ux29038ux27963ux40060,ux28779ux38149,ux24029ux33756,ux21619ux36947ux24456ux22909,ux24615ux20215ux27604ux39640,ux19978ux33756ux24930','水煮活鱼,火锅,川菜,味道很好,性价比高,上菜慢','5.0000','1','0','0','5','1','5','113.0000','1.0000','0.0000','','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','1','0','0','','','','1','','','0','1436663216','0','','0','','','0','0','0','0','1','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('22','桥亭活鱼小镇（泰禾广场店）','','晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）','059188855588','李四','119.3323','26.144803','23','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux38754ux21253,ux28903ux28900','餐饮美食,面包,烧烤','ux26187ux23433ux21306,ux20845ux27004,ux26032ux24215ux38215,ux20013ux24433,ux24433ux38498,ux26049ux36793,ux24191ux22330,ux30334ux24230,ux38899ux20048,ux75ux84ux86,ux26187ux23433ux21306ux26032ux24215ux38215ux20116ux22235ux21271ux27888ux31166ux24191ux22330ux20845ux27004ux65288ux20013ux24433ux24433ux38498ux26049ux65292ux38899ux20048ux45ux30334ux24230ux75ux84ux86ux26049ux36793ux65289,ux40723ux27004ux21306,ux30465ux20307ux32946ux20013ux24515','晋安区,六楼,新店镇,中影,影院,旁边,广场,百度,音乐,KTV,晋安区新店镇五四北泰禾广场六楼（中影影院旁，音乐-百度KTV旁边）,鼓楼区,省体育中心','ux26725ux20141,ux23567ux38215,ux24191ux22330,ux26725ux20141ux27963ux40060ux23567ux38215ux65288ux27888ux31166ux24191ux22330ux24215ux65289','桥亭,小镇,广场,桥亭活鱼小镇（泰禾广场店）','8','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','0','0','水煮活鱼 火锅 川菜','ux27700ux29038ux27963ux40060,ux28779ux38149,ux24029ux33756','水煮活鱼,火锅,川菜','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','1','1','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('23','肯德基（省府店）','','鼓楼区八一七北路68号福建供销大厦二楼','059188855566','李四','119.304968','26.093466','24','9:00-22:00','','0','鼓楼区八一七北路68号福建供销大厦二楼','15','ux39184ux39278ux32654ux39135,ux38754ux21253','餐饮美食,面包','ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux31119ux24314,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475','鼓楼区,八一七北路,福建,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口','ux32943ux24503ux22522,ux30465ux24220,ux32943ux24503ux22522ux65288ux30465ux24220ux24215ux65289','肯德基,省府,肯德基（省府店）','8','./public/attachment/201502/25/14/54ed6b92110bc.jpg','1','0','汉堡 炸鸡 快餐 肯德基 KFC','ux27721ux22561,ux28856ux40481,ux24555ux39184,ux32943ux24503ux22522,ux75ux70ux67,ux21619ux36947ux24456ux22909','汉堡,炸鸡,快餐,肯德基,KFC,味道很好','4.0000','0','0','0','0','0','0','0.0000','0.9000','0.0000','','./public/attachment/201502/25/14/54ed6b92110bc.jpg','0','0','3','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('24','肯德基（万象店）','','台江区工业路378号万象城1楼','','','119.296591','26.070573','24','','','1','台江区工业路378号万象城1楼','15','ux39184ux39278ux32654ux39135,ux38754ux21253','餐饮美食,面包','ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux19975ux35937,ux32943ux24503ux22522,ux32943ux24503ux22522ux65288ux19975ux35937ux24215ux65289','万象,肯德基,肯德基（万象店）','8','./public/attachment/201502/25/14/54ed6e8ca0d12.jpg','0','0','汉堡 炸鸡 快餐 肯德基 KFC','ux27721ux22561,ux28856ux40481,ux24555ux39184,ux32943ux24503ux22522,ux75ux70ux67','汉堡,炸鸡,快餐,肯德基,KFC','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed6e8ca0d12.jpg','0','0','3','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('25','盛世经典牛排（宝龙店）','','台江区工业路193号宝龙城市广场东区1楼149号店面','059188855566','李四','119.299095','26.068075','25','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux26412ux24110ux33756,ux29980ux28857,ux38754ux21253,ux28903ux28900','餐饮美食,本帮菜,甜点,面包,烧烤','ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','ux23453ux40857,ux29275ux25490,ux30427ux19990,ux32463ux20856,ux30427ux19990ux32463ux20856ux29275ux25490ux65288ux23453ux40857ux24215ux65289','宝龙,牛排,盛世,经典,盛世经典牛排（宝龙店）','8','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','1','0','牛排','ux29275ux25490','牛排','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','1','0','1','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('26','百度烤肉','','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','059188855588','','119.296641','26.070661','26','9:00-22:00','','1','','15','ux39184ux39278ux32654ux39135,ux28903ux28900','餐饮美食,烧烤','ux21488ux27743ux21306,ux19975ux35937,ux35266ux20809ux30005ux26799,ux65ux71ux79ux71ux79ux75ux84ux86,ux27004ux65288,ux21488ux27743ux21306ux19975ux35937ux22478ux53ux27004ux65288ux35266ux20809ux30005ux26799ux30452ux19978ux53ux27004ux65ux71ux79ux71ux79ux75ux84ux86ux26049ux65289,ux23453ux40857ux22478ux24066ux24191ux22330,ux21338ux32654ux35799ux37030','台江区,万象,观光电梯,AGOGOKTV,楼（,台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）,宝龙城市广场,博美诗邦','ux28900ux32905,ux30334ux24230,ux30334ux24230ux28900ux32905','烤肉,百度,百度烤肉','8','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','1','1','烧烤','ux28903ux28900','烧烤','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','./public/attachment/201502/25/14/13abf2842afa3e34a15c71b58a02d10858.jpg','./public/attachment/201502/25/14/aefbd6725f2bed28e9cc252d7bcd02fc52.jpg','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('27','韩悦风尚烤肉（浦江大道店）','','仓山区浦上大道276号仓山万达广场3楼','059188855588','李四','119.28142','26.042355','27','9:00-22:00','','1','仓山区浦上大道276号仓山万达广场3楼','15','ux39184ux39278ux32654ux39135,ux28903ux28900','餐饮美食,烧烤','ux20179ux23665,ux20179ux23665ux21306,ux19975ux36798,ux22823ux36947,ux24191ux22330,ux28006ux19978,ux50ux55ux54,ux20179ux23665ux21306ux28006ux19978ux22823ux36947ux50ux55ux54ux21495ux20179ux23665ux19975ux36798ux24191ux22330ux51ux27004,ux19977ux21449ux34903ux26032ux26449,ux19977ux39640ux36335','仓山,仓山区,万达,大道,广场,浦上,276,仓山区浦上大道276号仓山万达广场3楼,三叉街新村,三高路','ux28006ux27743,ux28900ux32905,ux39118ux23578,ux22823ux36947,ux38889ux24742,ux38889ux24742ux39118ux23578ux28900ux32905ux65288ux28006ux27743ux22823ux36947ux24215ux65289','浦江,烤肉,风尚,大道,韩悦,韩悦风尚烤肉（浦江大道店）','8','./public/attachment/201502/25/14/54ed724a9d6b5.jpg','1','1','烧烤','ux28903ux28900','烧烤','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('28','石山水美式餐厅（东街店）','','鼓楼区东街14号闽辉大厦1楼（近海峡影城）','059188855588','李四','119.307134','26.092442','28','9:00-22:00','','1','鼓楼区东街14号闽辉大厦1楼（近海峡影城）','15','ux39184ux39278ux32654ux39135,ux21654ux21857','餐饮美食,咖啡','ux40723ux27004ux21306,ux19996ux34903,ux24433ux22478,ux28023ux23777,ux22823ux21414,ux27004ux65288,ux40723ux27004ux21306ux19996ux34903ux49ux52ux21495ux38397ux36745ux22823ux21414ux49ux27004ux65288ux36817ux28023ux23777ux24433ux22478ux65289,ux20116ux19968ux24191ux22330,ux19996ux34903ux21475','鼓楼区,东街,影城,海峡,大厦,楼（,鼓楼区东街14号闽辉大厦1楼（近海峡影城）,五一广场,东街口','ux34903ux24215,ux32654ux24335,ux23665ux27700,ux39184ux21381,ux30707ux23665ux27700ux32654ux24335ux39184ux21381ux65288ux19996ux34903ux24215ux65289','街店,美式,山水,餐厅,石山水美式餐厅（东街店）','8','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','1','1','牛排 西餐','ux29275ux25490,ux35199ux39184','牛排,西餐','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('29',' 【万象城/宝龙广场】 agogo量贩KTV','','台江区工业路193号宝龙城市广场四楼','059188855588','李四','119.298093','26.068768','29','9:00-22:00','','1','台江区工业路193号宝龙城市广场四楼','15','ux20241ux38386ux23089ux20048,ux75ux84ux86','休闲娱乐,KTV','ux21488ux27743ux21306,ux23453ux40857,ux22235ux27004,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux22235ux27004,ux23453ux40857ux22478ux24066ux24191ux22330','台江区,宝龙,四楼,广场,工业,城市,193,台江区工业路193号宝龙城市广场四楼,宝龙城市广场','ux23453ux40857,ux19975ux35937,ux37327ux36137,ux24191ux22330,ux97ux103ux111ux103ux111,ux75ux84ux86,ux12304ux19975ux35937ux22478ux47ux23453ux40857ux24191ux22330ux12305ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','宝龙,万象,量贩,广场,agogo,KTV,【万象城/宝龙广场】 agogo量贩KTV','9','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('30','贵安温泉','直通车时间：冬季10.1-5.31福州发车：早上9：30 下午15：00，贵安发车：下午14：00 晚上20：30，夏季6.1-9.31福州发车：福州早上9：30 下午17：00 贵安发车：下午14：00 晚上22：30，车位33座，先到先得','连江县连江潘渡乡贵安村贵洋路','0591-26298388','小贵安','119.416354','26.227042','30','09:00-24:00','<span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:12px/18px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">贵安温泉项目包括精品温泉酒店、天趣温泉乐园、香屿温泉花田、西溪森林公园。建有各式客房165间、各种规格的会议厅7间、水岸七星温泉别墅7栋（含有温馨浪漫的木制汤屋30套）、各具特色的温泉泡池80多个、花浴组合泉、药浴组合泉、情侣泉、儿童泡泡泉、溶洞泉、四季泉、鱼疗、高空三彩滑梯、人造冲浪池、人造冷热瀑布、石板保健理疗、香薰蒸气理疗生机盎然的果园花田100多亩、还配套中餐厅、西餐厅、美容、足浴、湖畔烧烤、高尔夫练习场、露天游泳池、网球场、羽毛球场，台球室，棋牌室等康体健身设施。最高水温达82℃，最低水温63℃，现日合理开采温泉量可达6700吨，居全国前五名。度假村的各个温泉池水都是直接取自泉眼的原脉温泉，并且采用的是非稀释的降温方式，可以让您感受到原脉温泉，是福州少有的综合型温泉度假村，也是距离福建省会城市最近的度假村，度假村同山结盟，与溪为邻，水木清华，碧翠嫣然，宁静悠远，犹如人间仙境</span>','1','连江县连江潘渡乡贵安村贵洋路','15','ux37202ux24215ux26053ux28216,ux21608ux36793ux28216','酒店旅游,周边游','ux36830ux27743ux21439,ux28504ux28193,ux36830ux27743,ux23433ux26449,ux36830ux27743ux21439ux36830ux27743ux28504ux28193ux20065ux36149ux23433ux26449ux36149ux27915ux36335,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330','连江县,潘渡,连江,安村,连江县连江潘渡乡贵安村贵洋路,鼓楼区,五一广场','ux28201ux27849,ux36149ux23433ux28201ux27849','温泉,贵安温泉','11','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','1','1','温泉 贵安 ','ux28201ux27849,ux36149ux23433','温泉,贵安','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','1','2','0','0','','','','1','','','0','0','0','贵安温泉项目包括精品温泉酒店、天趣温泉乐园、香屿温泉花田、西溪森林公园。建有各式客房165间、各种规格的会议厅7间、水岸七星温泉别墅7栋（含有温馨浪漫的木制汤屋30套）、各具特色的温泉泡池80多个、花浴组合泉、药浴组合泉、情侣泉、儿童泡泡泉、溶洞泉、四季泉、鱼疗、高空三彩滑梯、人造冲浪池、人造冷热瀑布、石板保健理疗、香薰蒸气理疗生机盎然的果园花田100多亩、还配套中餐厅、西餐厅、美容、足浴、湖畔烧烤、高尔夫练习场、露天游泳池、网球场、羽毛球场，台球室，棋牌室等康体健身设施。最高水温达82℃，最低水温63℃，现日合理开采温泉量可达6700吨，居全国前五名。度假村的各个温泉池水都是直接取自泉眼的原脉温泉，并且采用的是非稀释的降温方式，可以让您感受到原脉温泉，是福州少有的综合型温泉度假村，也是距离福建省会城市最近的度假村，度假村同山结盟，与溪为邻，水木清华，碧翠嫣然，宁静悠远，犹如人间仙境','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('31','国际旅游社','','鼓楼区五一中路18号正大广场御景台1623','0591-88592106/88592109','小陈','119.317071','26.081434','31','24小时在线','<span style=\"white-space:pre-wrap;word-spacing:0px;text-transform:none;float:none;color:#666666;text-align:left;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\"><span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:14px/24px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">广东省广弘中旅国际旅行社是省政府三大国有资产经营公司之一，全国500强企业。拥有资产近亿元，净资产5000万元，注册资金3000万元（广州注册资金最雄厚的旅行社）。属下的全资、控股企业有：广东广弘中旅酒店管理公司、珠海华侨宾馆、广东省拱北口岸中国旅行社有限公司（全国双百强旅行社）、清远市 中旅国际旅行社有限公司（出国游组团社）、四会市中国旅行社有限公司。目前在仍保持旅游部门投诉率最低记录，具有极高品牌美誉度。</span></span>','1','鼓楼区五一中路18号正大广场御景台1623','15','ux37202ux24215ux26053ux28216,ux22269ux20869ux28216','酒店旅游,国内游','ux40723ux27004ux21306,ux27491ux22823,ux20013ux36335,ux24191ux22330,ux49ux54ux50ux51,ux40723ux27004ux21306ux20116ux19968ux20013ux36335ux49ux56ux21495ux27491ux22823ux24191ux22330ux24481ux26223ux21488ux49ux54ux50ux51,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','鼓楼区,正大,中路,广场,1623,鼓楼区五一中路18号正大广场御景台1623,台江区,六一中路,晋安区,王庄新村','ux22269ux38469ux26053ux28216,ux22269ux38469ux26053ux28216ux31038','国际旅游,国际旅游社','11','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','1','1','旅游 国际 省内','ux26053ux28216,ux22269ux38469,ux30465ux20869','旅游,国际,省内','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','3','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('32','爱丁堡尊贵养生会所（福祥店)','','晋安区国货东路298号','13899087678','爱丁堡','119.339719','26.071564','33','9:00-23:00','<span style=\"white-space:normal;word-spacing:0px;text-transform:none;float:none;color:#666666;font:12px/18px \'hiragino sans gb\', \'wenquanyi micro hei\', tahoma, sans-serif;display:inline !important;letter-spacing:normal;background-color:#ffffff;text-indent:0px;-webkit-text-stroke-width:0px;\">爱丁堡尊贵养生会所是一家全国性连锁企业，地处黄金地段。会所为独幢楼层，有45个豪华包间，共3000平米，拥有300多个停车泊位。会所内部装饰格调以西欧风格为主，集保健、休闲、餐饮为一体，独树一旗，别具一格。</span>','1','晋安区国货东路298号','15','ux20241ux38386ux23089ux20048,ux36275ux30103ux25353ux25705','休闲娱乐,足疗按摩','ux26187ux23433ux21306,ux19996ux36335,ux22269ux36135,ux50ux57ux56,ux26187ux23433ux21306ux22269ux36135ux19996ux36335ux50ux57ux56ux21495,ux21488ux27743ux21306,ux40857ux21326ux22823ux21414,ux29579ux24196ux26032ux26449','晋安区,东路,国货,298,晋安区国货东路298号,台江区,龙华大厦,王庄新村','ux29233ux19969ux22561,ux20250ux25152,ux23562ux36149,ux20859ux29983,ux31119ux31077ux24215,ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152ux65288ux31119ux31077ux24215ux41','爱丁堡,会所,尊贵,养生,福祥店,爱丁堡尊贵养生会所（福祥店)','9','./public/attachment/201502/25/16/54ed864826695.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','3','0','0','0','','','','1','','','0','0','12','爱丁堡尊贵养生会所是一家全国性连锁企业，地处黄金地段。会所为独幢楼层，有45个豪华包间，共3000平米，拥有300多个停车泊位。会所内部装饰格调以西欧风格为主，集保健、休闲、餐饮为一体，独树一旗，别具一格。','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('33','龙中龙','','','','','','','32','','','1','','15','','','ux40723ux27004ux21306,ux31119ux24030ux24191ux22330','鼓楼区,福州广场','ux20013ux40857,ux40857ux20013ux40857','中龙,龙中龙','0','','0','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','','','0','0','1','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('34','美丽人生摄影工作室','','鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）','0591-88699440','张美丽','119.300928','26.091942','35','10:00-22:00','','1','鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）','15','ux29983ux27963ux26381ux21153,ux23130ux32433ux25668ux24433,ux20010ux24615ux20889ux30495','生活服务,婚纱摄影,个性写真','ux26472ux26725,ux40723ux27004ux21306,ux19996ux34903ux21475,ux20132ux27719ux22788,ux20803ux24069,ux24448ux22238,ux20844ux36710,ux36335ux21475,ux32593ux21543,ux19996ux26041,ux40723ux27004ux21306ux19996ux34903ux21475ux26472ux26725ux36335ux19982ux20803ux24069ux36335ux36335ux21475ux20132ux27719ux22788ux50ux27004ux65288ux20844ux36710ux20392ux38596ux31449ux19979ux24448ux22238ux36208ux19996ux26041ux32593ux21543ux19978ux50ux27004ux65289,ux21488ux27743ux21306,ux20013ux20141ux34903,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449','杨桥,鼓楼区,东街口,交汇处,元帅,往回,公车,路口,网吧,东方,鼓楼区东街口杨桥路与元帅路路口交汇处2楼（公车侨雄站下往回走东方网吧上2楼）,台江区,中亭街,晋安区,王庄新村','ux32654ux20029ux20154ux29983,ux24037ux20316ux23460,ux25668ux24433,ux32654ux20029ux20154ux29983ux25668ux24433ux24037ux20316ux23460','美丽人生,工作室,摄影,美丽人生摄影工作室','10','./public/attachment/201502/25/17/54ed9486611f6.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','2','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('35','明视眼镜（台江万达店）','','台江区鳌江路8号金融街万达广场一层B区37号','0591-89800987','小明','119.350423','26.058986','36','10:00-23:00','','1','','15','ux29983ux27963ux26381ux21153,ux22521ux35757ux35838ux31243','生活服务,培训课程','ux27743ux36335,ux21488ux27743ux21306,ux19975ux36798,ux37329ux34701ux34903,ux24191ux22330,ux21488ux27743ux21306ux40140ux27743ux36335ux56ux21495ux37329ux34701ux34903ux19975ux36798ux24191ux22330ux19968ux23618ux66ux21306ux51ux55ux21495,ux23453ux40857ux22478ux24066ux24191ux22330','江路,台江区,万达,金融街,广场,台江区鳌江路8号金融街万达广场一层B区37号,宝龙城市广场','ux21488ux27743,ux19975ux36798,ux26126ux35270,ux30524ux38236,ux26126ux35270ux30524ux38236ux65288ux21488ux27743ux19975ux36798ux24215ux65289','台江,万达,明视,眼镜,明视眼镜（台江万达店）','10','./public/attachment/201502/25/17/54ed9b8e44904.jpg','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','2','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','<img src=\"./public/attachment/201506/23/22/55896832e53ab.jpg\" alt=\"\" border=\"0\" />','<img src=\"./public/attachment/201506/23/22/558968241520d.jpg\" alt=\"\" border=\"0\" />','115269');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('36','江津','','江津','023-5888888','','0','0','37','','','1','','18','ux20241ux38386ux23089ux20048,ux27700ux19978ux19990ux30028','休闲娱乐,水上世界','ux27743ux27941','江津','ux27743ux27941','江津','9','','0','0','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','./public/attachment/201506/24/15/1fadd1acba76329bee33e5d8ee4c6a8b24.jpg','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('37','1111','','1111','111','','0','0','38','111','','1','','19','ux21307ux30103ux20581ux24247,ux20799ux31185','医疗健康,儿科','ux49ux49ux49ux49','1111','ux49ux49ux49ux49','1111','16','./public/attachment/201506/26/11/aa7d3921405a26140a8b2d03394b805627.jpg','0','0','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','./public/attachment/201506/26/11/5b5cc4a018cf6e5ae3d1f4ba657c8c0c95.jpg','./public/attachment/201506/26/11/7c9c0bfae5e60d2ee36138f1ae89ef8752.jpg','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('38','test','','北京','123123123','','0','0','39','10:00-19:00','','1','','18','','','ux21271ux20140','北京','ux116ux101ux115ux116','test','0','./public/attachment/201507/16/16/bdba08cdb3c9c7f53ac90017fa310f2d63.jpg','0','0','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','./public/attachment/201507/16/16/574d50797163b80c9182051920fe3f1c52.jpg','./public/attachment/201507/16/16/0ec0646bf852c54b71203a8ef5ba203052.jpg','0','0','2','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('39','大灰狼','','','','','','','40','','','1','','18','ux39184ux39278ux32654ux39135,ux24029ux33756','餐饮美食,川菜','','','ux22823ux28784ux29436','大灰狼','8','','1','1','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','','','0','0','0','','0','','','0','0','0','0','0','','','');
INSERT INTO `%DB_PREFIX%supplier_location` VALUES ('40','小灰灰','','重庆市','13355555555','','116.416662','39.912258','41','9:00-12:00','','1','','18','ux27597ux23156ux20146ux23376','母婴亲子','ux37325ux24198ux24066','重庆市','ux28784ux28784,ux23567ux28784ux28784','灰灰,小灰灰','17','./public/attachment/201508/06/15/7d937686e1b93a174b02ab78c736087c11.jpg','1','0','','','','0.0000','0','0','0','0','0','0','0.0000','0.0000','0.0000','','','0','0','0','0','','','','1','./public/attachment/201508/06/15/9978af15cda459ba3635c85a45f75d8316.jpg','./public/attachment/201508/06/15/cb11cb45452a0ce2ca2c8f9fade7c35788.jpg','0','0','0','','0','','','0','0','0','0','0','','','');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_area_link`;
CREATE TABLE `%DB_PREFIX%supplier_location_area_link` (
  `location_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店的商圈关联表';
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','27');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('21','28');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('22','16');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('23','14');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('24','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('24','27');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('25','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','10');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('26','33');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('27','35');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('27','39');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','8');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','13');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('28','14');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('29','26');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('30','13');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('31','22');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('31','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('32','23');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('32','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('33','15');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('34','21');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('34','43');
INSERT INTO `%DB_PREFIX%supplier_location_area_link` VALUES ('35','26');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_biz_submit`;
CREATE TABLE `%DB_PREFIX%supplier_location_biz_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '门店名称',
  `route` text NOT NULL COMMENT '公交线路',
  `address` text NOT NULL COMMENT '门店地址',
  `tel` varchar(255) NOT NULL COMMENT '门店电话',
  `contact` varchar(255) NOT NULL COMMENT '联系人',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `brief` text NOT NULL COMMENT '商家简介',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认门店(总店)',
  `api_address` text NOT NULL COMMENT '用于地图定位的地址',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `deal_cate_match` text NOT NULL COMMENT '生活服务分类全文索引',
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地址全文索引',
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '门店名称全文索引',
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL COMMENT '所属生活服务大分类ID',
  `preview` varchar(255) NOT NULL COMMENT '列表图',
  `is_recommend` tinyint(1) NOT NULL COMMENT '标识为推荐门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL COMMENT '标签列表 多个标签以空格分隔',
  `tags_match` text NOT NULL COMMENT '标签的全文索引',
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL COMMENT '总评平均分，后台可操作更改',
  `good_dp_count` int(11) NOT NULL COMMENT '好评数',
  `bad_dp_count` int(11) NOT NULL COMMENT '差评数',
  `common_dp_count` int(11) NOT NULL COMMENT '中评数',
  `total_point` int(11) NOT NULL COMMENT '点评总分',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `image_count` int(11) NOT NULL COMMENT '门店图片数',
  `ref_avg_price` float(14,4) NOT NULL COMMENT '真实的总评分的平均分',
  `good_rate` float(14,4) NOT NULL COMMENT '好评率',
  `common_rate` float(14,4) NOT NULL COMMENT '中评率',
  `sms_content` varchar(255) NOT NULL DEFAULT '' COMMENT '用户短信下载的商家信息',
  `index_img` varchar(255) NOT NULL DEFAULT '' COMMENT '首页用图',
  `tuan_count` int(11) NOT NULL COMMENT '团购数',
  `event_count` int(11) NOT NULL COMMENT '活动数',
  `youhui_count` int(11) NOT NULL COMMENT '优惠券数',
  `daijin_count` int(11) NOT NULL COMMENT '代金券数',
  `seo_title` text NOT NULL COMMENT '自定义门店页的seo标题',
  `seo_keyword` text NOT NULL COMMENT '自定义门店页的seo关键词',
  `seo_description` text NOT NULL COMMENT '自定义门店页的seo描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `biz_license` varchar(255) NOT NULL COMMENT '商家营业执照',
  `biz_other_license` varchar(255) NOT NULL COMMENT '商家的其他资质',
  `new_dp_count` int(11) NOT NULL COMMENT '最新点评数量',
  `new_dp_count_time` int(11) NOT NULL COMMENT '最新点评的更新时间',
  `shop_count` int(11) NOT NULL COMMENT '商品数量',
  `mobile_brief` text NOT NULL COMMENT '手机端列表简介',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `dp_group_point` text NOT NULL COMMENT '门店的分组点评数据的平均分',
  `tuan_youhui_cache` text NOT NULL COMMENT '商家列表页团购与优惠券第一条的展示',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `account_id` int(11) NOT NULL COMMENT '提交数据的商户帐号关联ID',
  `location_id` int(11) NOT NULL COMMENT '关联活动主表的数据ID',
  `cache_supplier_location_area_link` text NOT NULL COMMENT '序列化地区列表配置',
  `cache_deal_cate_type_location_link` text NOT NULL COMMENT '序列化子分类列表配置',
  `cache_supplier_tag` text NOT NULL COMMENT '序列化子商户标签设置配置',
  `cache_supplier_location_images` text NOT NULL COMMENT '门店图库序列化缓存',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0 待审核 1 通过 2 拒绝',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`),
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`),
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`),
  KEY `search_idx3` (`supplier_id`,`is_main`),
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`),
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`),
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`),
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`),
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商户平台提交商家门店临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_brand_link`;
CREATE TABLE `%DB_PREFIX%supplier_location_brand_link` (
  `brand_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店的品牌关联表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '点评时间',
  `point` int(11) NOT NULL COMMENT '评分',
  `user_id` int(11) NOT NULL COMMENT '点评会员ID',
  `is_img` tinyint(1) NOT NULL COMMENT '弃用',
  `is_content` tinyint(1) NOT NULL COMMENT '是否有内容',
  `is_best` tinyint(1) NOT NULL COMMENT '推荐点评',
  `is_top` tinyint(1) NOT NULL COMMENT '弃用',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:无效 1:有效',
  `good_count` int(11) NOT NULL COMMENT '有用数',
  `bad_count` int(11) NOT NULL COMMENT '没用数',
  `reply_count` int(11) NOT NULL COMMENT '回复数',
  `supplier_location_id` int(11) NOT NULL COMMENT '点评的门店ID',
  `avg_price` float(14,4) NOT NULL COMMENT '平均价',
  `kb_user_id` varchar(50) NOT NULL COMMENT '弃用',
  `kb_create_time` varchar(20) DEFAULT '' COMMENT '弃用',
  `kb_tags` varchar(255) DEFAULT '' COMMENT '弃用',
  `is_index` tinyint(1) NOT NULL COMMENT '是否置顶',
  `is_buy` tinyint(1) NOT NULL COMMENT '弃用',
  `from_data` varchar(255) NOT NULL COMMENT '弃用',
  `rel_app_index` varchar(255) NOT NULL COMMENT '弃用',
  `rel_route` varchar(255) NOT NULL COMMENT '弃用',
  `rel_param` varchar(255) NOT NULL COMMENT '弃用',
  `message_id` int(11) NOT NULL COMMENT '弃用',
  `deal_id` int(11) NOT NULL COMMENT '关联到的商品ID，对商品的点评',
  `youhui_id` int(11) NOT NULL COMMENT '关联的优惠券ID',
  `reply_content` text NOT NULL COMMENT '管理员或商家回复',
  `reply_supplier_account_id` int(11) NOT NULL COMMENT '商家回复的帐号',
  `reply_time` int(11) NOT NULL COMMENT '回复时间',
  `images_cache` text NOT NULL COMMENT '点评图片的冗余',
  `supplier_id` int(11) NOT NULL COMMENT '点评所针对的商家ID',
  `event_id` int(11) NOT NULL COMMENT '活动ID',
  `dp_type` tinyint(1) NOT NULL COMMENT '已弃用',
  `tags_match` text NOT NULL,
  `tags_match_row` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `is_img` (`is_img`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `good_count` (`good_count`) USING BTREE,
  KEY `bad_count` (`bad_count`) USING BTREE,
  KEY `reply_count` (`reply_count`) USING BTREE,
  KEY `avg_price` (`avg_price`) USING BTREE,
  KEY `deal_id` (`deal_id`),
  KEY `youhui_id` (`youhui_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `dp_type` (`dp_type`),
  KEY `is_content` (`is_content`),
  FULLTEXT KEY `tags_match` (`tags_match`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商家门店点评数据表';
INSERT INTO `%DB_PREFIX%supplier_location_dp` VALUES ('4','','上菜太慢，其他的都很好。','1424891284','5','71','1','1','0','0','1','0','0','0','21','113.0000','','','','0','0','','','','','0','57','0','','0','0','a:3:{i:0;s:68:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg\";i:1;s:68:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg\";i:2;s:68:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg\";}','23','0','0','ux19978ux33756ux24930','上菜慢');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_images`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL COMMENT '图片地址',
  `dp_id` int(11) NOT NULL COMMENT '所属的点评ID',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dp_id` (`dp_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='点评图库';
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('1','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg','4','23','1424891284','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('2','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg','4','23','1424891284','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_images` VALUES ('3','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg','4','23','1424891284','21');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_point_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个门店，每条点评针对每个评分分组的点评评分';
INSERT INTO `%DB_PREFIX%supplier_location_dp_point_result` VALUES ('3','5','21','4');
INSERT INTO `%DB_PREFIX%supplier_location_dp_point_result` VALUES ('4','4','21','4');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_reply`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  `content` text NOT NULL COMMENT '回应内容',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '回应时间',
  `parent_id` int(11) NOT NULL COMMENT '弃用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评数据的回应表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `supplier_location_id` (`supplier_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家门店按预定义的分组打标签的结果表';
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('上菜慢','4','6','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('上菜慢','4','6','21');
INSERT INTO `%DB_PREFIX%supplier_location_dp_tag_result` VALUES ('上菜慢','4','6','21');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_images`;
CREATE TABLE `%DB_PREFIX%supplier_location_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID(关联的商家会员ID)',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `dp_id` int(11) NOT NULL COMMENT '弃用',
  `good_count` int(11) NOT NULL COMMENT '弃用',
  `bad_count` int(11) NOT NULL COMMENT '弃用',
  `brief` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:未审核  1:已审核 ',
  `click_count` int(11) NOT NULL COMMENT '浏览数',
  `images_group_id` int(11) NOT NULL COMMENT '图片的分组ID',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='门店图集表';
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('1','./public/attachment/201502/25/14/54ed6a9a856ba.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('2','./public/attachment/201502/25/14/54ed6a9aa2fe0.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('3','./public/attachment/201502/25/14/54ed6a9ab8e58.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('4','./public/attachment/201502/25/14/54ed6a9acf0d1.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
INSERT INTO `%DB_PREFIX%supplier_location_images` VALUES ('5','./public/attachment/201502/25/14/54ed6a9ae65a6.jpg','100','1424816666','0','21','0','0','0','','1','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_point_result`;
CREATE TABLE `%DB_PREFIX%supplier_location_point_result` (
  `group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `avg_point` float(14,4) NOT NULL COMMENT '平均分',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `total_point` int(11) NOT NULL COMMENT '总分',
  PRIMARY KEY (`group_id`,`supplier_location_id`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `dp_id` (`total_point`) USING BTREE,
  KEY `avg_point` (`avg_point`) USING BTREE,
  KEY `total_point` (`total_point`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店的分组评分的评分结果';
INSERT INTO `%DB_PREFIX%supplier_location_point_result` VALUES ('3','5.0000','21','5');
INSERT INTO `%DB_PREFIX%supplier_location_point_result` VALUES ('4','4.0000','21','4');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_location_sign_log`;
CREATE TABLE `%DB_PREFIX%supplier_location_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `location_id` int(11) NOT NULL COMMENT '门店ID',
  `sign_time` int(11) NOT NULL COMMENT '签到时间',
  `point` int(11) NOT NULL COMMENT '签到打分',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `sign_time` (`sign_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店签到数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_money_log`;
CREATE TABLE `%DB_PREFIX%supplier_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '资金变更记录',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL COMMENT '变更时间',
  `money` decimal(20,4) NOT NULL COMMENT '资金变更数额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:销售额增加 1:资金冻结 2.待结算增加 3.已结算增加 4.退款增加 5.提现增加',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商家财务明细表';
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('1','ID:57 88元桥亭活鱼小镇代金券 订单：2015022610000323','23','1424887216','62.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('2','ID:57 88元桥亭活鱼小镇代金券 订单：2015022610000323','23','1424887216','62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('3','ID:64 龙中龙男士棉服 订单：2015022610592583','32','1424890765','50.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('4','ID:64 龙中龙男士棉服 订单：2015022610592583','32','1424890765','50.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('5','ID:76 超人新款静音理发器 订单：2015022610592583','33','1424890765','20.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('6','ID:76 超人新款静音理发器 订单：2015022610592583','33','1424890765','20.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('7','订单号2015022610000323 61323563消费券验证成功','23','1424890988','-62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('8','订单号2015022610000323 61323563消费券验证成功','23','1424890988','62.0000','3');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('9','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款','32','1424891134','-50.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('10','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款','32','1424891134','50.0000','4');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('11','32316437消费券验证成功','23','1434416612','0.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('12','32316437消费券验证成功','23','1434416612','0.0000','3');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('13','ID:57 88元桥亭活鱼小镇代金券 订单：2015061605081890','23','1434416898','60.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('14','ID:57 88元桥亭活鱼小镇代金券 订单：2015061605081890','23','1434416898','60.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('15','ID:57 88元桥亭活鱼小镇代金券 订单：2015061605120933','23','1434417129','62.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('16','ID:57 88元桥亭活鱼小镇代金券 订单：2015061605120933','23','1434417129','62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('17','订单号2015061605120933 63636236消费券验证成功','23','1434417199','-62.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('18','订单号2015061605120933 63636236消费券验证成功','23','1434417199','62.0000','3');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('19','成功打款给小灰灰测试&yen;124元。','23','1435621484','124.0000','5');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('20','成功打款给小灰灰测试&yen;124元。','23','1435621484','-124.0000','3');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('21','ID:81 魅货莫代尔不规则衫 订单：2015071704240230','33','1437092642','30.0000','0');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('22','ID:81 魅货莫代尔不规则衫 订单：2015071704240230','33','1437092642','30.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('23','2015071704240230订单已收货','33','1437540278','-30.0000','1');
INSERT INTO `%DB_PREFIX%supplier_money_log` VALUES ('24','2015071704240230订单已收货','33','1437540278','30.0000','3');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_money_submit`;
CREATE TABLE `%DB_PREFIX%supplier_money_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,4) NOT NULL COMMENT '提现金额',
  `supplier_id` int(11) NOT NULL COMMENT '商家ID',
  `create_time` int(11) NOT NULL COMMENT '提现申请时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 0:待审核 1:已确认提现',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家提现表';
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_statements`;
CREATE TABLE `%DB_PREFIX%supplier_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL COMMENT '本日消费（提现不减）',
  `sale_money` decimal(20,4) NOT NULL COMMENT '本日销售额',
  `refund_money` decimal(20,4) NOT NULL COMMENT '本日退款',
  `wd_money` decimal(20,4) NOT NULL COMMENT '本日提现',
  `stat_time` date NOT NULL COMMENT '报表日期',
  `stat_month` varchar(10) NOT NULL COMMENT '月份',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `stat_time` (`stat_time`),
  KEY `stat_month` (`stat_month`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商家日报表';
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('4','23','62.0000','62.0000','0.0000','0.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('5','32','0.0000','50.0000','50.0000','0.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('6','33','0.0000','20.0000','0.0000','0.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('7','23','62.0000','122.0000','0.0000','0.0000','2015-06-16','2015-06');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('8','23','0.0000','0.0000','0.0000','124.0000','2015-06-30','2015-06');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('9','33','0.0000','30.0000','0.0000','0.0000','2015-07-17','2015-07');
INSERT INTO `%DB_PREFIX%supplier_statements` VALUES ('10','33','30.0000','0.0000','0.0000','0.0000','2015-07-22','2015-07');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_submit`;
CREATE TABLE `%DB_PREFIX%supplier_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商家名称',
  `cate_config` text NOT NULL COMMENT '所属分类配置',
  `location_config` text NOT NULL COMMENT '所属地区商券配置',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel` varchar(255) NOT NULL COMMENT '电话',
  `open_time` varchar(255) NOT NULL COMMENT '营业时间',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `location_id` int(11) NOT NULL COMMENT '认领的门店ID',
  `is_publish` tinyint(1) NOT NULL COMMENT '0:未审核 1:已审核',
  `user_id` int(1) NOT NULL COMMENT '入驻申请的会员ID',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `h_name` varchar(255) NOT NULL COMMENT '企业名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人',
  `h_license` varchar(255) NOT NULL COMMENT '营业执照',
  `h_other_license` varchar(255) NOT NULL COMMENT '其他资质上传',
  `h_user_name` varchar(255) NOT NULL COMMENT '店铺管理员姓名',
  `h_tel` varchar(255) NOT NULL COMMENT '存档的联系人电话',
  `h_supplier_logo` varchar(255) NOT NULL COMMENT '商户商标图',
  `h_supplier_image` varchar(255) NOT NULL COMMENT '门店图片',
  `city_id` int(11) NOT NULL COMMENT '所在城市',
  `h_bank_info` text NOT NULL COMMENT '提现银行帐号',
  `h_bank_user` varchar(255) NOT NULL COMMENT '提现银行户名',
  `h_bank_name` varchar(255) NOT NULL COMMENT '提现银行名称',
  `account_name` varchar(255) NOT NULL COMMENT '商户登录账户',
  `account_password` varchar(255) NOT NULL COMMENT '登录密码',
  `account_mobile` varchar(255) DEFAULT NULL COMMENT '账户绑定手机号，用于验证，提现等功能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商家入驻申请表';
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('1','百度烤肉','a:2:{s:12:\"deal_cate_id\";i:8;s:17:\"deal_cate_type_id\";a:1:{i:0;i:30;}}','a:3:{i:0;i:10;i:1;i:33;i:2;i:26;}','台江区万象城5楼（观光电梯直上5楼AGOGOKTV旁）','059188855588','9:00-22:00','119.296641','26.070661','0','1','0','1424818382','百度烧烤','王一','./public/attachment/201502/25/14/13abf2842afa3e34a15c71b58a02d10858.jpg','./public/attachment/201502/25/14/aefbd6725f2bed28e9cc252d7bcd02fc52.jpg','','0591-88558855','./public/attachment/201502/25/14/e7742d7b2aa5e3477382608672802f2614.jpg','./public/attachment/201502/25/14/3636edc71744aa2820a9598cb15a3d0098.jpg','15','5566998785158446562','王一','中国工商银行福州市分行','fanwebaidu','27cb989dfaec51641a0f3b0064808419','13955599999');
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('2','江津','a:2:{s:12:\"deal_cate_id\";i:9;s:17:\"deal_cate_type_id\";a:1:{i:0;i:32;}}','N;','江津','023-5888888','','0','0','0','1','0','1435102949','江津','江津','./public/attachment/201506/24/15/1fadd1acba76329bee33e5d8ee4c6a8b24.jpg','','','0234756211','','','18','1212122121121212','jjsl','2223254212121212','zschool','44dbe7760c7e242f377b4b2105a30fbf','15125366566');
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('3','1111','a:2:{s:12:\"deal_cate_id\";i:16;s:17:\"deal_cate_type_id\";a:1:{i:0;i:20;}}','N;','1111','111','111','0','0','0','1','0','1435260872','12222','2222','./public/attachment/201506/26/11/5b5cc4a018cf6e5ae3d1f4ba657c8c0c95.jpg','./public/attachment/201506/26/11/7c9c0bfae5e60d2ee36138f1ae89ef8752.jpg','','111','./public/attachment/201506/26/11/6546935053e846f0041f7d25e5206d4374.jpg','./public/attachment/201506/26/11/aa7d3921405a26140a8b2d03394b805627.jpg','19','111','11','11','221115','646541234d1ed75e577a38c85f64ae12','13355892255');
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('4','test','a:2:{s:12:\"deal_cate_id\";i:0;s:17:\"deal_cate_type_id\";N;}','N;','北京','123123123','10:00-19:00','0','0','0','1','0','1437005842','qweqwasdaawe','qweqwe','./public/attachment/201507/16/16/574d50797163b80c9182051920fe3f1c52.jpg','./public/attachment/201507/16/16/0ec0646bf852c54b71203a8ef5ba203052.jpg','','12312312','./public/attachment/201507/16/16/70f61b00354e8882a84326dc550f878049.jpg','./public/attachment/201507/16/16/bdba08cdb3c9c7f53ac90017fa310f2d63.jpg','18','123123123123123','123123123123123','123123123123123','test','5d93ceb70e2bf5daa84ec3d0cd2c731a','13000000000');
INSERT INTO `%DB_PREFIX%supplier_submit` VALUES ('5','小灰灰','a:2:{s:12:\"deal_cate_id\";i:17;s:17:\"deal_cate_type_id\";N;}','N;','重庆市','13355555555','9:00-12:00','116.416662','39.912258','0','1','0','1438816907','重庆市黔江区','慧慧','./public/attachment/201508/06/15/9978af15cda459ba3635c85a45f75d8316.jpg','./public/attachment/201508/06/15/cb11cb45452a0ce2ca2c8f9fade7c35788.jpg','','13355555555','./public/attachment/201508/06/15/f79c2910530bb982e273b4bd54a0c23452.jpg','./public/attachment/201508/06/15/7d937686e1b93a174b02ab78c736087c11.jpg','18','111','111','111','小灰灰','e10adc3949ba59abbe56e057f20f883e','13355555555');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_tag`;
CREATE TABLE `%DB_PREFIX%supplier_tag` (
  `tag_name` varchar(255) NOT NULL COMMENT '标签',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `group_id` int(11) NOT NULL COMMENT '关联商户子类标签分组的ID(可为前台会员点评的分组标签，也可为后台管理员编辑的分组标签), 为0时为主显标签',
  `total_count` int(11) NOT NULL COMMENT '同商户，同类分组提交的次数。 用于表示该标签的热门度',
  KEY `merchant_id` (`supplier_location_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店分组标签的点评数据统计表';
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('味道很好','23','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('味道很好','21','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('性价比高','21','6','1');
INSERT INTO `%DB_PREFIX%supplier_tag` VALUES ('上菜慢','21','6','1');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_tag_group_preset`;
CREATE TABLE `%DB_PREFIX%supplier_tag_group_preset` (
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `supplier_location_id` int(11) NOT NULL COMMENT '门店ID',
  `preset` text NOT NULL COMMENT '预选标签 空格分开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店分组点评标签的预选标签配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group`;
CREATE TABLE `%DB_PREFIX%tag_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `preset` text NOT NULL COMMENT '公用的预设标签，如门店没有单独配置预选标签，以此为准',
  `sort` int(11) NOT NULL COMMENT '排序 小到大',
  `memo` varchar(255) NOT NULL COMMENT '弃用',
  `tags` text NOT NULL COMMENT '弃用',
  `allow_dp` tinyint(1) NOT NULL COMMENT '该分组标签是否可用于用户自主填写（0:否 1:是）',
  `allow_search` tinyint(1) NOT NULL COMMENT '该分组内的标签是否用于商家搜索使用',
  `allow_vote` tinyint(1) NOT NULL COMMENT '是否允许对标签进行直接投票点评(0:否 1:是)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='供门店点评的标签分组配置';
INSERT INTO `%DB_PREFIX%tag_group` VALUES ('6','口碑','味道很好 环境不错 性价比高 服务很周到 上菜快','100','餐饮口碑','','0','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_elink`;
CREATE TABLE `%DB_PREFIX%tag_group_elink` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与活动大分类关联表';
INSERT INTO `%DB_PREFIX%tag_group_elink` VALUES ('6','3');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_link`;
CREATE TABLE `%DB_PREFIX%tag_group_link` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与生活服务大分类关联表';
INSERT INTO `%DB_PREFIX%tag_group_link` VALUES ('6','8');
DROP TABLE IF EXISTS `%DB_PREFIX%tag_group_slink`;
CREATE TABLE `%DB_PREFIX%tag_group_slink` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签分组与商城大分类关联表';
DROP TABLE IF EXISTS `%DB_PREFIX%tag_user_vote`;
CREATE TABLE `%DB_PREFIX%tag_user_vote` (
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `tag_name` varchar(255) NOT NULL COMMENT '投票的标签',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `location_id` int(11) NOT NULL COMMENT '所属门店ID',
  PRIMARY KEY (`user_id`,`tag_name`,`group_id`,`location_id`),
  KEY `user_id` (`user_id`),
  KEY `tag_name` (`tag_name`),
  KEY `location_id` (`location_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用于投票的标签的投票结果';
DROP TABLE IF EXISTS `%DB_PREFIX%topic`;
CREATE TABLE `%DB_PREFIX%topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `forum_title` varchar(255) NOT NULL COMMENT '来源于小组的分享的贴子标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发表时间',
  `type` varchar(255) NOT NULL COMMENT 'share 分享\r\ndealcomment 商品点评	\r\nyouhuicomment 优惠券购物点评\r\neventcomment 活动点评\r\nslocationcomment  门店点评\r\neventsubmit  活动报名	\r\nsharedeal  分享商品\r\nshareyouhui 分享优惠券	\r\nshareevent分享活劝',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `user_name` varchar(255) NOT NULL COMMENT '会员名',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除标识',
  `relay_id` int(11) NOT NULL COMMENT '0:原创 1:转发来源的贴子ID',
  `origin_id` int(11) NOT NULL COMMENT '原创贴子ID',
  `reply_count` int(11) NOT NULL COMMENT '回复数',
  `relay_count` int(11) NOT NULL COMMENT '转发数',
  `good_count` int(11) NOT NULL COMMENT '弃用',
  `bad_count` int(11) NOT NULL COMMENT '弃用',
  `click_count` int(11) NOT NULL COMMENT '查看数量',
  `rel_app_index` varchar(255) NOT NULL COMMENT '相关链接的app名',
  `rel_route` varchar(255) NOT NULL COMMENT '相关链接的url的route名',
  `rel_param` varchar(255) NOT NULL COMMENT '相关链接的url参数',
  `message_id` int(11) NOT NULL COMMENT '弃用',
  `topic_group` varchar(255) NOT NULL DEFAULT 'share' COMMENT '一键分享的插件名称（默认为share）',
  `fav_id` int(11) NOT NULL COMMENT '喜欢XX分享的分享ID',
  `fav_count` int(11) NOT NULL COMMENT '被喜欢的数量',
  `user_name_match` text NOT NULL COMMENT '用于全文索引的用户名(名括@会员的相关名称)',
  `user_name_match_row` text NOT NULL,
  `keyword_match` text NOT NULL COMMENT '分词后与标签的相关关键词全文索引',
  `keyword_match_row` text NOT NULL,
  `xpoint` varchar(255) NOT NULL COMMENT '手机发表的经度',
  `ypoint` varchar(255) NOT NULL COMMENT '手机发表的纬度',
  `tags` text NOT NULL COMMENT '标签，空格分开',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐到达人秀页面',
  `has_image` tinyint(1) NOT NULL COMMENT '是否含图',
  `source_type` tinyint(1) NOT NULL COMMENT '0:本站 1:外站',
  `source_name` varchar(255) NOT NULL COMMENT '发表的来源（如网站/手机端）',
  `source_url` varchar(255) NOT NULL,
  `group_data` text NOT NULL COMMENT 'group插件采集同步的序列化数据',
  `daren_page` varchar(255) NOT NULL COMMENT '达人秀页面的专用图',
  `group_id` int(11) NOT NULL COMMENT '小组ID',
  `is_top` tinyint(1) NOT NULL COMMENT '置顶',
  `is_best` tinyint(1) NOT NULL COMMENT '精华',
  `op_memo` text NOT NULL COMMENT '前台操作员操作日志',
  `last_time` int(11) NOT NULL COMMENT '最后操作时间',
  `last_user_id` int(11) NOT NULL COMMENT '最后操作人ID',
  `cate_match` text NOT NULL COMMENT '所属的主题分类的全文索引(分类可由后台分配，也可由分类预设标签自动匹配)',
  `cate_match_row` text NOT NULL,
  `origin_topic_data` text NOT NULL COMMENT '原贴数据缓存',
  `images_count` int(11) NOT NULL COMMENT '图片数',
  `image_list` text NOT NULL COMMENT '图片列表缓存',
  `is_cached` tinyint(1) NOT NULL COMMENT '标识相关的数据是否已缓存（包括原贴数据，图片集，小组数据等）',
  `topic_group_data` text NOT NULL COMMENT '小组数据缓存',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `group_id` (`group_id`),
  KEY `is_top` (`is_top`),
  KEY `is_best` (`is_best`),
  KEY `has_image` (`has_image`),
  KEY `fav_id` (`fav_id`),
  KEY `relay_id` (`relay_id`),
  KEY `origin_id` (`origin_id`),
  KEY `type` (`type`),
  KEY `is_effect` (`is_effect`),
  KEY `is_delete` (`is_delete`),
  KEY `click_count` (`click_count`),
  KEY `last_time` (`last_time`),
  KEY `ordery_sort` (`create_time`,`is_top`),
  KEY `last_time_sort` (`last_time`,`is_top`),
  KEY `multi_key` (`is_effect`,`is_delete`,`last_time`,`is_recommend`,`group_id`,`is_top`,`is_best`,`create_time`),
  FULLTEXT KEY `user_name_match` (`user_name_match`),
  FULLTEXT KEY `keyword_match` (`keyword_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`keyword_match`,`cate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='会员分享数据表';
INSERT INTO `%DB_PREFIX%topic` VALUES ('203','','','团购推荐：泰宁大金湖[【福州】泰宁大金湖]','1424825541','sharedeal','71','fanwe','1','0','0','203','0','1','0','0','0','index','deal#65','','0','Fanwe','0','0','','','ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux31119ux24030,ux22242ux36141,ux25512ux33616','泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,福州,团购,推荐','','','泰宁 玉华 金湖 尚书第 二日 福建 大峡谷 仅售 春秋 旅行社','0','1','0','网站','','YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY1IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTI6e3M6MjoiaWQiO3M6MjoiNjUiO3M6NDoibmFtZSI7czoxNjg6IuS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czo4OiJzdWJfbmFtZSI7czoxNToi5rOw5a6B5aSn6YeR5rmWIjtzOjc6ImNhdGVfaWQiO3M6MjoiMTEiO3M6MTE6InN1cHBsaWVyX2lkIjtzOjI6IjMxIjtzOjM6ImltZyI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDg0MDg3NTA3Yy5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjYzNDg6IjxwIGFsaWduPSJjZW50ZXIiPjxpbWcgYm9yZGVyPSIwIiBhbHQ9IiIgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQwODc1MDdjLmpwZyIgLz48L3A+DQo8dWwgaWQ9Inl1aV8zXzE2XzBfMV8xNDI0ODUxOTA5OTgzXzEzNjUiIGNsYXNzPSJsaXN0IiBzdHlsZT0id2hpdGUtc3BhY2U6bm9ybWFsO3dvcmQtc3BhY2luZzowcHg7dGV4dC10cmFuc2Zvcm06bm9uZTtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7Zm9udDoxNHB4LzIxcHggJ2hpcmFnaW5vIHNhbnMgZ2InLCAnd2VucXVhbnlpIG1pY3JvIGhlaScsIHRhaG9tYSwgc2Fucy1zZXJpZjtwYWRkaW5nLWxlZnQ6MThweDttYXJnaW46MTBweCAwcHggMTVweDtsZXR0ZXItc3BhY2luZzpub3JtYWw7cGFkZGluZy1yaWdodDowcHg7YmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO3RleHQtaW5kZW50OjBweDstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOjBweDsiPjxsaSBpZD0ieXVpXzNfMTZfMF8xXzE0MjQ4NTE5MDk5ODNfMTM2NCIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5Y+R5Zui5pe26Ze077ya6K+m6K+i5ZWG5a6277yb6aKE57qm5Ye65Zui5Lq65pWw77ya5LiN6ZmQPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7lt7LljIXlkKvlr7zmuLjotLnvvJvljIXlkKvml6nppJAx5qyhK+WNiOmkkDHmrKEr5pma6aSQMeasoTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5YyF5ZCr5YWl5L2P6YWS5bqXMeaZmu+8m+aWueahiOW3suWMheWQq+W+gOi/lOi9pui0uTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpub25lO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+6KGM56iL5a6J5o6S77yaPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7pm4blkIjml7bpl7TvvJowN++8mjAw77yb6ZuG5ZCI5Zyw54K577ya56aP5bee54Gr6L2m56uZPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48Yj7lpKfph5HmuZbvvIjnrKzkuIDlpKnvvIk8L2I+PGJyIC8+DQrkuqTpgJrmlrnlvI/vvJrliqjovabvvJvmuLjnjqnml7bplb/vvJox5aSpPGJyIC8+DQrku4vnu43vvJrlj4LogIPovabmrKHvvJrnpo/lt57nq5lEMjI0Mu+8iDA377yaMDAvMDjvvJo0M++8iSBENjUwMu+8iDA477yaMzAvMTDvvJoyMO+8iSBEMjIyNu+8iDA477yaNDIvMTDvvJozOe+8iSDml6nliqjovabnq5npm4bkuK3lkI7vvIzlrqLkurroh6rooYzliY3lvoDms7DlroHliqjovabnq5nvvIzlr7zmuLjms7DlroHnq5nmjqXlm6LpgIHjgJDms7DlroHlj6Tln47jgJHvvIzlj4Lop4LnirblhYPmlofljJbkuLvpopjpk5zpm5XnvqTvvIzpoobnlaXms7DlroHlj6Tln47nmoTljoblj7Llj5jov4HvvIzmhJ/lj5figJzmsYnllJDlj6TplYfjgIHkuKTlrovlkI3ln47igJ3kuYvpo47pn7XjgILop6bmkbgyMjAw5bm055qE6aOO6Zuo5rKn5qGR77yM6L+Y5Y+v5Lul5Zyo57qi5Yab6KGX5LiK6L+95b+G5bel5Yac57qi5Yab5LiJ6L+b5LiJ5Ye655qE54O954Gr5bKB5pyI77yM5Y+v5Lul5Y+C6KeC5piO5pyd5YW16YOo5bCa5Lmm5p2O5pil54Oo55qE5rex5a6F5aSn6Zmi5Lit5ZOB5ZGz4oCc5rGf5Y2X56ys5LiA5rCR5bGF4oCc44CQ5bCa5Lmm56ys44CR44CC5LiL5Y2I6YCC5pe26LW05Zu95a62NUHnuqfmma/ljLrjgIHkuJbnlYzoh6rnhLbpgZfkuqfnmoTmoLjlv4Plk4HniYzigJTigJTjgJDlpKfph5HmuZbmma/ljLrjgJHvvIjooYznqIvnuqYyMOWIhumSn++8jOa4uOiniOe6pjTlsI/ml7bvvInvvIznmbvlsrjmuLjop4jigJzph47otqPlm63msLTpmYXngJHluIPigJ3jgIHkuIDmn7Hmj5LlnLDkuI3lgYfniYfnk6bnmoTljZfmlrnmgqznqbrlr7rigJznlJjpnLLlr7rigJ3jgIHpmYblnLDkuIDnur/lpKnvvJvoiLnmuLjph5HmuZbop4LlpKfotaTlo4HjgIHigJzku5nigJ3igJzlr7/igJ3lkYjnpaXlpKnkuabnnJ/ov7njgILmuLjop4jnu5PmnZ/lkI7lr7zmuLjlsIbmuLjlrqLpgIHov5TphZLlupfjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjxiPuWvqOS4i+Wkp+WzoeiwtyAr546J5Y2O5rSe77yI56ys5LqM5aSp77yJPC9iPjxiciAvPg0K5Lqk6YCa5pa55byP77ya5Yqo6L2m77yb5ri4546p5pe26ZW/77yaMeWkqTxiciAvPg0K5LuL57uN77ya5Y+C6ICD6L2m5qyh77ya5bCG5LmQ56uZRDY1MDnvvIgxNu+8mjQ0LzE477yaMjfvvIlEMjIyNe+8iDIw77yaNDMvMjLvvJoyOe+8iSDml6nppJDlkI7muLjop4jkuJbnlYzlnLDotKjlhazlm63nmoTmoLfmnb/mma/ljLotLeOAkOWvqOS4i+Wkp+WzoeiwtzYy44CRKOa4uOiniOaXtumXtDIuNeWwj+aXtuW3puWPs++8ie+8iOaCrOWkqeWzoeOAgemAmuWkqeWzoeOAgeWAmuWkqeWzoeOAgeWkqeepueWyqeOAgemXruWkqeWyqeOAgeWxseW0qeWcsOijguOAgeWgsOWhnua5lu+8iei/meaYr+S4h+iwt+W9kuS4gOeahOWcsOaWue+8jOWPr+S7peavq+S4jeWkuOW8oOWcsOivtO+8muWvqOS4i+W9kuadpeS4jeeci+iwt+OAguiBlOWQiOWbveaVmeenkeaWh+e7hOe7h+S4k+WutuivhOS7t+WFtuS4uuS4lueVjOWcsOi0qOWFrOWbreeahOagt+adv+aZr+WMuuOAguS4remkkOWQjuWbveWutumHjeeCuemjjuaZr+WQjeiDnOWMuuS4reWbveWbm+Wkp+WQjea0nuS5i+S4gC0t44CQ546J5Y2O5rSeMTA144CRKOa4uOiniOaXtumXtDLlsI/ml7blt6blj7PvvInvvIzoqonnp7DlvaLog5znlLLpl73lsbHvvIzkurrpl7TnkbbmsaDmma/jgILlm6DmtJ7lhoXlsqnnn7PmtIHnmb3lpoLnjonvvIzljY7lhYnlm5vlsITogIzlvpflkI0u5L2T6aqM6aOO5aOw5LiN5q2i55qEMeaJh+mjju+8jOinguS7meS6uueUsO+8jOehleaenOe0r+e0r++8jOaTjuWkqeafse+8jOm4oeWGoOefs++8jOS4h+WutueBr+eBq++8jOS6lOabtOWkqeetieaZr+eCueOAguWQjiDlsIbkuZDov5Tlm57ms7DlroHmiJbogIXkuInmmI7ljJfnq5nov5Tlm57vvIzlkI7nu5PmnZ/mhInlv6vnmoTooYznqIvjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuivt+aPkOWJjeeUteivneWVhuWutjA1OTEtODc4NzE1NjfjgIE4ODk5OTg4MOmihOe6puaIluWPkemihOe6puefreS/oeKAnOWnk+WQjSvmiYvmnLrlj7fkurrmlbAr5ri4546p5pel5pyfK+e+juWboumqjOivgeeggeKAnee7meWuouacjeeUteivnTEzNTU5MTk1NTM3PC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuOAkOacjeWKoeagh+WHhuOAkTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+MeOAgeS9j+Wuv++8muWutuW6remFkuW6l+agh+WHhuWPjOagh+mXtO+8iOWPguiAg+mFkuW6l++8mueIseW/g+WuvummhuOAgeaWsOWMl+a0suWuvummhuOAgeS4i+WdiuS4gOacn++8jOS4i+WdiuS4ieacn++8jOWNl+iwtyDlt7fjgIHph5Hls7Dlt7fvvIk8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjLjgIHpl6jnpajvvJrooYznqIvmiYDliJfmma/ngrnlpKfpl6jnpajlj4roiLnnpajvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjPjgIHkuqTpgJrvvJrnpo/lt57nq5noh7Pms7DlroHjgIHlsIbkuZDnq5nlvoDov5TliqjovabkuoznrYnluqfnpajvvIzmma/ljLrpl7Tlvqrnjq/nlKjovabvvIjlpZfovabvvIzmjInkurrmlbDmjpLovabvvIzkuI3mj5Dkvpvnq5nluqfvvIzpnIDnrYnlvoU0MOWIhumSn+KAlDHlsI/ml7bvvInvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjTjgIHppJDppa7vvJrlhajnqIvlkKvkuIDml6nkuozmraPvvIjmraPppJAyMOWFg+i1t++8jOWFq+iPnOS6jOaxpO+8jOWNgeS6uuS4gOahjO+8jOS6uuaVsOWHj+Wwke+8jOiPnOmHj+ebuOWvueWHj+Wwke+8iTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NeOAgeWvvOa4uO+8muazsOWugeW9k+WcsOaMgeivgeWvvOa4uOacjeWKoe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NuOAgeS/nemZqe+8muWQq+W9k+WcsOaXheihjOekvui0o+S7u+mZqeOAgeivt+e7hOWbouekvuW4ruWuouS6uuS5sOWlveaXhea4uOaEj+WklumZqe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+N+OAgeWEv+erpeaVo+aLvOaKpeS7t++8mjEuNE3ku6XkuIvvvIzlkKvovabkvY3jgIHppJDjgIHlr7zmnI3jgIHkv53pmanvvIzkuI3ljaDluorjgIHkuI3lkKvpl6jnpajjgIHliqjovabnpajotoXpq5joh6rnkIbvvIk8L2xpPg0KPC91bD4NCiI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTA6Im1pbl9ib3VnaHQiO3M6MToiMCI7czoxMDoibWF4X2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21pbl9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9tYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTI6Im9yaWdpbl9wcmljZSI7czo4OiI4MzguMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI3NTguMDAwMCI7czo3OiJjaXR5X2lkIjtzOjI6IjE1IjtzOjk6ImlzX2NvdXBvbiI7czoxOiIxIjtzOjExOiJpc19kZWxpdmVyeSI7czoxOiIwIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjk6ImlzX2RlbGV0ZSI7czoxOiIwIjtzOjEwOiJ1c2VyX2NvdW50IjtzOjE6IjAiO3M6OToiYnV5X2NvdW50IjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtpOjE7czoxMDoiYnV5X3N0YXR1cyI7aToxO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6Mjc6IuOAkOemj+W3nuOAkeazsOWugeWkp+mHkea5liI7czo0OiJzb3J0IjtzOjE6IjciO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTY6ImNvdXBvbl90aW1lX3R5cGUiO3M6MToiMCI7czoxMDoiY291cG9uX2RheSI7czoxOiIwIjtzOjE3OiJjb3Vwb25fYmVnaW5fdGltZSI7czoxOiIwIjtzOjE1OiJjb3Vwb25fZW5kX3RpbWUiO3M6MToiMCI7czo0OiJjb2RlIjtzOjA6IiI7czo2OiJ3ZWlnaHQiO3M6NjoiMC4wMDAwIjtzOjk6IndlaWdodF9pZCI7czoxOiIwIjtzOjExOiJpc19yZWZlcnJhbCI7czoxOiIwIjtzOjg6ImJ1eV90eXBlIjtzOjE6IjAiO3M6ODoiZGlzY291bnQiO2Q6OTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4NDA4NzUwN2MuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MToiMCI7czo3OiJpc19zaG9wIjtzOjE6IjAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6OToiYXZnX3BvaW50IjtzOjY6IjAuMDAwMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMjgxIjtzOjEwOiJuYW1lX21hdGNoIjtzOjU3ODoidXgyNzg4OHV4MjM0MjUsdXgyOTU3N3V4MjEzMjYsdXgzNzMyOXV4MjgyNDYsdXgyMzU3OHV4MjAwNzB1eDMxNTMyLHV4MjAxMDh1eDI2MDg1LHV4MzExMTl1eDI0MzE0LHV4MjI4MjN1eDIzNzc3dXgzNTg5NSx1eDIwMTY1dXgyMTgwNix1eDI2MTQ5dXgzMTE3OSx1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMDE2NXV4MjE4MDZ1eDU1dXg1M3V4NTZ1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1NnV4NTF1eDU2dXgyMDgwM3V4MzAzNDB1eDMxMTE5dXgyNDMxNHV4MjYxNDl1eDMxMTc5dXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzh1eDI1NTUydXgyMDM3OXV4MzAzNDB1eDI3ODg4dXgyMzQyNXV4MjI4MjN1eDM3MzI5dXgyODI0NnV4NDN1eDIzNTI4dXgxOTk3OXV4MjI4MjN1eDIzNzc3dXgzNTg5NXV4NDN1eDI5NTc3dXgyMTMyNnV4Mjc5MzR1eDQzdXgyMzU3OHV4MjAwNzB1eDMxNTMydXgyMTQ1MnV4MjExNjB1eDIwMTA4dXgyNjA4NXV4MjgyMTZ1eDY1MjkydXgzNTgxNHV4MzU4MTB1eDIxODMwdXgyMzQ3OHV4NjUyOTJ1eDE5OTgxdXgzODQ4MHV4MjA5ODZ1eDIyMjQydXgyMDE1NHV4MjU5NjgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjI0Nzoi5rOw5a6BLOeOieWNjizph5HmuZYs5bCa5Lmm56ysLOS6jOaXpSznpo/lu7os5aSn5bOh6LC3LOS7heWUrizmmKXnp4ss5peF6KGM56S+LOS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjcyOiJ1eDM3MjAydXgyNDIxNXV4MjYwNTN1eDI4MjE2LHV4MzMyNTh1eDIxMTYxdXgyODIxNix1eDIxNjA4dXgzNjc5M3V4MjgyMTYiO3M6MTk6ImRlYWxfY2F0ZV9tYXRjaF9yb3ciO3M6MzI6IumFkuW6l+aXhea4uCzoh6rliqnmuLgs5ZGo6L655ri4IjtzOjE1OiJzaG9wX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJzaG9wX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxMjoibG9jYXRlX21hdGNoIjtzOjM0NToidXgzMTExOXV4MjQzMTQsdXgzMTExOXV4MjQwMzAsdXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4Mjc0OTF1eDIyODIzLHV4MjAwMTN1eDM2MzM1LHV4MjQxOTF1eDIyMzMwLHV4NDl1eDU0dXg1MHV4NTEsdXg0MDcyM3V4MjcwMDR1eDIxMzA2dXgyMDExNnV4MTk5Njh1eDIwMDEzdXgzNjMzNXV4NDl1eDU2dXgyMTQ5NXV4Mjc0OTF1eDIyODIzdXgyNDE5MXV4MjIzMzB1eDI0NDgxdXgyNjIyM3V4MjE0ODh1eDQ5dXg1NHV4NTB1eDUxLHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE0Nzoi56aP5bu6LOemj+W3nizpvJPmpbzljLos5q2j5aSnLOS4rei3ryzlub/lnLosMTYyMyzpvJPmpbzljLrkupTkuIDkuK3ot68xOOWPt+ato+Wkp+W5v+WcuuW+oeaZr+WPsDE2MjMs5Y+w5rGf5Yy6LOWFreS4gOS4rei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjMxNzA3MSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDgxNDM0IjtzOjg6ImJyYW5kX2lkIjtzOjE6IjAiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6ODoiNzAwLjAwMDAiO3M6OToiaXNfcmVmdW5kIjtzOjE6IjEiO3M6MTA6ImF1dG9fb3JkZXIiO3M6MToiMCI7czoxMzoiZXhwaXJlX3JlZnVuZCI7czoxOiIxIjtzOjEwOiJhbnlfcmVmdW5kIjtzOjE6IjEiO3M6MTA6Im11bHRpX2F0dHIiO3M6MToiMCI7czo4OiJkZWFsX3RhZyI7czoyOiI5NiI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjU6Im5vdGVzIjtzOjI1NToiPGR0IGlkPSJ5dWlfM18xNl8wXzFfMTQyNDg1MTkwOTk4M18xMzkwIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQ7Ym9yZGVyLXRvcDojZWVlZWVlIDFweCBzb2xpZDt3aWR0aDoxNDBweDt3aGl0ZS1zcGFjZTpwcmUtd3JhcDt3b3JkLXNwYWNpbmc6MHB4O3RleHQtdHJhbnNmb3JtOm5vbmU7d29yZC1icmVhazpicmVhay1hbGw7ZmxvYXQ6bGVmdDtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjhweDt0ZXh0LWFsaWduOmxlZnQ7cGFkZGluIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NSI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzgzOCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjs3NTgiO3M6MTk6InN1Y2Nlc3NfdGltZV9mb3JtYXQiO3M6MTk6IjIwMTUtMDItMjUgMTY6MTQ6NDEiO3M6MTA6InNhdmVfcHJpY2UiO2Q6ODA7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs4MCI7czoxNjoiZGVhbF9zdWNjZXNzX251bSI7czozMDoiPHN0cm9uZz4wPC9zdHJvbmc+5Lq65bey6LSt5LmwIjtzOjE0OiJjdXJyZW50X2JvdWdodCI7czoxOiIwIjtzOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMxIjtzOjQ6Im5hbWUiO3M6MTU6IuWbvemZheaXheihjOekviI7czo3OiJwcmV2aWV3IjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNS81NGVkODBiZjY0YmE2LmpwZyI7czo3OiJjb250ZW50IjtzOjA6IiI7czo0OiJzb3J0IjtzOjE6IjAiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjAiO3M6NzoiY2l0eV9pZCI7czoxOiIwIjtzOjEwOiJuYW1lX21hdGNoIjtzOjcyOiJ1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMjI2OXV4Mzg0NjksdXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjMyOiLml4XooYznpL4s5Zu96ZmFLOWbvemZheaXheihjOekviI7czo5OiJiYW5rX2luZm8iO3M6MjM6IjYyMjggNDgwMCA2MzA0IDI5NjUgNDE2IjtzOjU6Im1vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoic2FsZV9tb25leSI7czo2OiIwLjAwMDAiO3M6MTA6ImxvY2tfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEzOiJiYWxhbmNlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmVmdW5kX21vbmV5IjtzOjY6IjAuMDAwMCI7czo4OiJ3ZF9tb25leSI7czo2OiIwLjAwMDAiO3M6OToiYmFua19uYW1lIjtzOjI0OiLlhpzkuJrpk7booYznpo/lt57liIbooYwiO3M6OToiYmFua191c2VyIjtzOjk6IumZiOemj+adgyI7czoxMDoiZHBfY291bnRfMSI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF8yIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzMiO3M6MToiMCI7czoxMDoiZHBfY291bnRfNCI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF81IjtzOjE6IjAiO3M6ODoiZHBfY291bnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6NjoiMC4wMDAwIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjEzOiJ0b3RhbF9wb2ludF8xIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8xIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMiI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMiI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzMiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzMiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF80IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF80IjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfNSI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfNSI7czo2OiIwLjAwMDAiO3M6NjoiaF9uYW1lIjtzOjE1OiLlm73pmYXml4XooYznpL4iO3M6NzoiaF9mYXJlbiI7czo5OiLpmYjnpo/mnYMiO3M6NToiaF90ZWwiO3M6MTM6IjA1OTEtODg2MDA4MzEiO31zOjIzOiJzdXBwbGllcl9sb2NhdGlvbl9jb3VudCI7czoxOiIxIjtzOjk6ImRlYWxfYXR0ciI7YTowOnt9czoyMDoiZGVhbF9hdHRyX3N0b2NrX2pzb24iO3M6MjoiW10iO3M6OToic2hhcmVfdXJsIjtzOjU3OiJodHRwOi8vd3d3LmZhbndldG91ci5jb20vbzJvbmV3L2luZGV4LnBocD9jdGw9ZGVhbCZhY3Q9NjUiO3M6OToiZGVhbF90YWdzIjthOjI6e2k6MDtpOjU7aToxO2k6Njt9fX0=','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('204','','','商品推荐：龙中龙男士棉服[仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。]','1424825604','sharedeal','71','fanwe','1','0','0','204','0','0','0','0','0','index','deal#64','','0','Fanwe','0','0','','','ux20013ux40857,ux33073ux21368,ux26825ux26381,ux21152ux21402,ux26825ux34915,ux20445ux26262,ux20165ux21806,ux22806ux22871,ux30007ux22763,ux20215ux20540','中龙,脱卸,棉服,加厚,棉衣,保暖,仅售,外套,男士,价值','','','中龙 脱卸 棉服 加厚 棉衣 保暖 仅售 外套 男士 价值','0','1','0','网站','','YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY0IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTQ6e3M6MjoiaWQiO3M6MjoiNjQiO3M6NDoibmFtZSI7czoxMTE6IuS7heWUrjY55YWD77yB5Lu35YC8Mzk45YWD55qE6b6Z5Lit6b6Z55S35aOr5qOJ5pyNMeS7tu+8jOWPr+iEseWNuOW4veS/neaaluWKoOWOmuajieiho++8jOmdkuW5tOS8kemXsuWkluWll+OAgiI7czo4OiJzdWJfbmFtZSI7czoyMToi6b6Z5Lit6b6Z55S35aOr5qOJ5pyNIjtzOjc6ImNhdGVfaWQiO3M6MToiMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMzIiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODJjYTQyZGRkLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6Mjk3OiI8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzMzY2ZTgyNC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQo8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzNDIzNjU3MC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQo8cD48aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDgzNGEwYTgyYy5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+PGJyIC8+DQo8L3A+DQoiO3M6MTA6ImJlZ2luX3RpbWUiO3M6MToiMCI7czo4OiJlbmRfdGltZSI7czoxOiIwIjtzOjEwOiJtaW5fYm91Z2h0IjtzOjE6IjAiO3M6MTA6Im1heF9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9taW5fYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWF4X2JvdWdodCI7czoxOiIwIjtzOjEyOiJvcmlnaW5fcHJpY2UiO3M6ODoiMzk4LjAwMDAiO3M6MTM6ImN1cnJlbnRfcHJpY2UiO3M6NzoiNjkuMDAwMCI7czo3OiJjaXR5X2lkIjtzOjE6IjAiO3M6OToiaXNfY291cG9uIjtzOjE6IjAiO3M6MTE6ImlzX2RlbGl2ZXJ5IjtzOjE6IjEiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjEiO3M6OToiaXNfZGVsZXRlIjtzOjE6IjAiO3M6MTA6InVzZXJfY291bnQiO3M6MToiMCI7czo5OiJidXlfY291bnQiO3M6MToiMCI7czoxMToidGltZV9zdGF0dXMiO2k6MTtzOjEwOiJidXlfc3RhdHVzIjtpOjE7czo5OiJkZWFsX3R5cGUiO3M6MToiMCI7czoxMzoiYWxsb3dfcHJvbW90ZSI7czoxOiIwIjtzOjEyOiJyZXR1cm5fbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEyOiJyZXR1cm5fc2NvcmUiO3M6MToiMCI7czo1OiJicmllZiI7czoxMTE6IuS7heWUrjY55YWD77yB5Lu35YC8Mzk45YWD55qE6b6Z5Lit6b6Z55S35aOr5qOJ5pyNMeS7tu+8jOWPr+iEseWNuOW4veS/neaaluWKoOWOmuajieiho++8jOmdkuW5tOS8kemXsuWkluWll+OAgiI7czo0OiJzb3J0IjtzOjE6IjYiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoyOiIxMSI7czoxMjoic3VjY2Vzc190aW1lIjtzOjEwOiIxNDI0ODIzMDk2IjtzOjE2OiJjb3Vwb25fdGltZV90eXBlIjtzOjE6IjAiO3M6MTA6ImNvdXBvbl9kYXkiO3M6MToiMCI7czoxNzoiY291cG9uX2JlZ2luX3RpbWUiO3M6MToiMCI7czoxNToiY291cG9uX2VuZF90aW1lIjtzOjE6IjAiO3M6NDoiY29kZSI7czowOiIiO3M6Njoid2VpZ2h0IjtzOjY6IjAuMDAwMCI7czo5OiJ3ZWlnaHRfaWQiO3M6MToiMSI7czoxMToiaXNfcmVmZXJyYWwiO3M6MToiMCI7czo4OiJidXlfdHlwZSI7czoxOiIwIjtzOjg6ImRpc2NvdW50IjtkOjEuNjk5OTk5OTk5OTk5OTk5OTU1NTkxMDc5MDE0OTkzNzM4MzgzMDU0NzMzMjc2MzY3MTg3NTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MjoiMzEiO3M6NzoiaXNfc2hvcCI7czoxOiIxIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjk6ImF2Z19wb2ludCI7czo2OiIwLjAwMDAiO3M6MTE6ImNyZWF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMDk2IjtzOjExOiJ1cGRhdGVfdGltZSI7czoxMDoiMTQyNDgyNDQxMSI7czoxMDoibmFtZV9tYXRjaCI7czo0NDE6InV4MjAwMTN1eDQwODU3LHV4MzMwNzN1eDIxMzY4LHV4MjY4MjV1eDI2MzgxLHV4MjExNTJ1eDIxNDAyLHV4MjY4MjV1eDM0OTE1LHV4MjA0NDV1eDI2MjYyLHV4MjAxNjV1eDIxODA2LHV4MjI4MDZ1eDIyODcxLHV4MzAwMDd1eDIyNzYzLHV4MjAyMTV1eDIwNTQwLHV4MjAxNjV1eDIxODA2dXg1NHV4NTd1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1MXV4NTd1eDU2dXgyMDgwM3V4MzAzNDB1eDQwODU3dXgyMDAxM3V4NDA4NTd1eDMwMDA3dXgyMjc2M3V4MjY4MjV1eDI2MzgxdXg0OXV4MjAyMTR1eDY1MjkydXgyMTQ4N3V4MzMwNzN1eDIxMzY4dXgyNDEyNXV4MjA0NDV1eDI2MjYydXgyMTE1MnV4MjE0MDJ1eDI2ODI1dXgzNDkxNXV4NjUyOTJ1eDM4NzM4dXgyNDE4MHV4MjAyNDF1eDM4Mzg2dXgyMjgwNnV4MjI4NzF1eDEyMjkwLHV4NDA4NTd1eDIwMDEzdXg0MDg1NyI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTkxOiLkuK3pvpks6ISx5Y24LOajieacjSzliqDljpos5qOJ6KGjLOS/neaalizku4XllK4s5aSW5aWXLOeUt+Wjqyzku7flgLws5LuF5ZSuNjnlhYPvvIHku7flgLwzOTjlhYPnmoTpvpnkuK3pvpnnlLflo6vmo4nmnI0x5Lu277yM5Y+v6ISx5Y245bi95L+d5pqW5Yqg5Y6a5qOJ6KGj77yM6Z2S5bm05LyR6Zey5aSW5aWX44CCLOm+meS4rem+mSI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjA6IiI7czoxOToiZGVhbF9jYXRlX21hdGNoX3JvdyI7czowOiIiO3M6MTU6InNob3BfY2F0ZV9tYXRjaCI7czoyOToidXgyNjM4MXV4MzUwMTMsdXgzMDAwN3V4MzUwMTMiO3M6MTk6InNob3BfY2F0ZV9tYXRjaF9yb3ciO3M6MTM6IuacjeijhSznlLfoo4UiO3M6MTI6ImxvY2F0ZV9tYXRjaCI7czo1MDoidXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4MzExMTl1eDI0MDMwdXgyNDE5MXV4MjIzMzAiO3M6MTY6ImxvY2F0ZV9tYXRjaF9yb3ciO3M6MjI6Ium8k+alvOWMuiznpo/lt57lub/lnLoiO3M6OToidGFnX21hdGNoIjtzOjc0OiJ1eDQwNjU3dXgzMzM5NCx1eDI2ODM3dXgzMzM5NCx1eDIzNTY3dXgzMDcyMSx1eDIyODIzdXgzMDcyMSx1eDIyMzQzdXgzMDcyMSI7czoxMzoidGFnX21hdGNoX3JvdyI7czozNDoi6buR6ImyLOajleiJsizlsI/noIEs5aSn56CBLOWdh+eggSI7czo2OiJ4cG9pbnQiO3M6MDoiIjtzOjY6Inlwb2ludCI7czowOiIiO3M6ODoiYnJhbmRfaWQiO3M6MjoiMTYiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6NzoiNTAuMDAwMCI7czo5OiJpc19yZWZ1bmQiO3M6MToiMSI7czoxMDoiYXV0b19vcmRlciI7czoxOiIwIjtzOjEzOiJleHBpcmVfcmVmdW5kIjtzOjE6IjAiO3M6MTA6ImFueV9yZWZ1bmQiO3M6MToiMCI7czoxMDoibXVsdGlfYXR0ciI7czoxOiIxIjtzOjg6ImRlYWxfdGFnIjtzOjI6IjY0IjtzOjg6ImRwX2NvdW50IjtzOjE6IjAiO3M6NToibm90ZXMiO3M6MDoiIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NCI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzM5OCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs2OSI7czoxOToic3VjY2Vzc190aW1lX2Zvcm1hdCI7czoxOToiMjAxNS0wMi0yNSAxNjoxMTozNiI7czoxMDoic2F2ZV9wcmljZSI7ZDozMjk7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjszMjkiO3M6MTY6ImRlYWxfc3VjY2Vzc19udW0iO3M6MzA6IjxzdHJvbmc+MDwvc3Ryb25nPuS6uuW3sui0reS5sCI7czoxNDoiY3VycmVudF9ib3VnaHQiO3M6MToiMCI7czoxMDoiaW1hZ2VfbGlzdCI7YToyOntpOjA7YTo1OntzOjI6ImlkIjtzOjM6IjY4OSI7czozOiJpbWciO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjc6ImRlYWxfaWQiO3M6MjoiNjQiO3M6NDoic29ydCI7czoxOiIwIjtzOjc6ImN1cnJlbnQiO2k6MTt9aToxO2E6NDp7czoyOiJpZCI7czozOiI2OTAiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQzOTU0NTJkLmpwZyI7czo3OiJkZWFsX2lkIjtzOjI6IjY0IjtzOjQ6InNvcnQiO3M6MToiMSI7fX1zOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMyIjtzOjQ6Im5hbWUiO3M6OToi6b6Z5Lit6b6ZIjtzOjc6InByZXZpZXciO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4MmNhNDJkZGQuanBnIjtzOjc6ImNvbnRlbnQiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MToiMCI7czo5OiJpc19lZmZlY3QiO3M6MToiMCI7czo3OiJjaXR5X2lkIjtzOjE6IjAiO3M6MTA6Im5hbWVfbWF0Y2giO3M6MzY6InV4MjAwMTN1eDQwODU3LHV4NDA4NTd1eDIwMDEzdXg0MDg1NyI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTY6IuS4rem+mSzpvpnkuK3pvpkiO3M6OToiYmFua19pbmZvIjtzOjE1OiI2MjIyNTU1NTQ0NDQ3NzEiO3M6NToibW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEwOiJzYWxlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoibG9ja19tb25leSI7czo2OiIwLjAwMDAiO3M6MTM6ImJhbGFuY2VfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEyOiJyZWZ1bmRfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjg6IndkX21vbmV5IjtzOjY6IjAuMDAwMCI7czo5OiJiYW5rX25hbWUiO3M6MzM6IuS4reWbveW7uuiuvumTtuihjOemj+W7uuecgeWIhuihjCI7czo5OiJiYW5rX3VzZXIiO3M6Njoi5byg5LqUIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjk6ImF2Z19wb2ludCI7czo2OiIwLjAwMDAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6MTM6InRvdGFsX3BvaW50XzEiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzEiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF8yIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8yIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMyI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMyI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzQiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzQiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF81IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF81IjtzOjY6IjAuMDAwMCI7czo2OiJoX25hbWUiO3M6OToi6b6Z5Lit6b6ZIjtzOjc6ImhfZmFyZW4iO3M6Njoi546L5LqUIjtzOjU6ImhfdGVsIjtzOjEzOiIwNTkxLTg4NTU4ODU1Ijt9czoyMzoic3VwcGxpZXJfbG9jYXRpb25fY291bnQiO3M6MToiMSI7czoxMDoiYnJhbmRfaW5mbyI7YToxNjp7czoyOiJpZCI7czoyOiIxNiI7czo0OiJuYW1lIjtzOjk6Ium+meS4rem+mSI7czo0OiJsb2dvIjtzOjA6IiI7czoxODoiYnJhbmRfcHJvbW90ZV9sb2dvIjtzOjA6IiI7czo1OiJicmllZiI7czowOiIiO3M6NDoic29ydCI7czoxOiI0IjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MjoiMzEiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtzOjE6IjAiO3M6ODoiZHlfY291bnQiO3M6MToiMCI7czozOiJ0YWciO3M6MTM6IueUt+ijhSDmnI3oo4UiO3M6OToidGFnX21hdGNoIjtzOjI5OiJ1eDMwMDA3dXgzNTAxMyx1eDI2MzgxdXgzNTAxMyI7czoxMzoidGFnX21hdGNoX3JvdyI7czoxMzoi55S36KOFLOacjeijhSI7czozOiJ1cmwiO3M6MzQ6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1icmFuZCZhY3Q9MTYiO31zOjk6ImRlYWxfYXR0ciI7YToyOntpOjA7YTozOntzOjI6ImlkIjtzOjI6IjE5IjtzOjQ6Im5hbWUiO3M6Njoi6aKc6ImyIjtzOjk6ImF0dHJfbGlzdCI7YToyOntpOjA7YTozOntzOjI6ImlkIjtzOjM6IjI3MCI7czo0OiJuYW1lIjtzOjY6Ium7keiJsiI7czo1OiJwcmljZSI7czo2OiIwLjAwMDAiO31pOjE7YTozOntzOjI6ImlkIjtzOjM6IjI2OSI7czo0OiJuYW1lIjtzOjY6IuajleiJsiI7czo1OiJwcmljZSI7czo2OiIwLjAwMDAiO319fWk6MTthOjM6e3M6MjoiaWQiO3M6MjoiMjAiO3M6NDoibmFtZSI7czo2OiLlsLrnoIEiO3M6OToiYXR0cl9saXN0IjthOjM6e2k6MDthOjM6e3M6MjoiaWQiO3M6MzoiMjczIjtzOjQ6Im5hbWUiO3M6Njoi5bCP56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fWk6MTthOjM6e3M6MjoiaWQiO3M6MzoiMjcyIjtzOjQ6Im5hbWUiO3M6Njoi5aSn56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fWk6MjthOjM6e3M6MjoiaWQiO3M6MzoiMjcxIjtzOjQ6Im5hbWUiO3M6Njoi5Z2H56CBIjtzOjU6InByaWNlIjtzOjY6IjAuMDAwMCI7fX19fXM6MjA6ImRlYWxfYXR0cl9zdG9ja19qc29uIjtzOjExMDM6InsiMjcwXzI3MyI6eyJpZCI6IjEzOSIsImRlYWxfaWQiOiI2NCIsImF0dHJfY2ZnIjp7IjE5IjoiXHU5ZWQxXHU4MjcyIiwiMjAiOiJcdTVjMGZcdTc4MDEifSwic3RvY2tfY2ZnIjoiNTAwIiwiYXR0cl9zdHIiOiJcdTllZDFcdTgyNzJcdTVjMGZcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNzBfMjczIn0sIjI3MF8yNzIiOnsiaWQiOiIxMzgiLCJkZWFsX2lkIjoiNjQiLCJhdHRyX2NmZyI6eyIxOSI6Ilx1OWVkMVx1ODI3MiIsIjIwIjoiXHU1OTI3XHU3ODAxIn0sInN0b2NrX2NmZyI6IjQwMCIsImF0dHJfc3RyIjoiXHU5ZWQxXHU4MjcyXHU1OTI3XHU3ODAxIiwiYnV5X2NvdW50IjoiMCIsImF0dHJfa2V5IjoiMjcwXzI3MiJ9LCIyNzBfMjcxIjp7ImlkIjoiMTM3IiwiZGVhbF9pZCI6IjY0IiwiYXR0cl9jZmciOnsiMTkiOiJcdTllZDFcdTgyNzIiLCIyMCI6Ilx1NTc0N1x1NzgwMSJ9LCJzdG9ja19jZmciOiIzMDAiLCJhdHRyX3N0ciI6Ilx1OWVkMVx1ODI3Mlx1NTc0N1x1NzgwMSIsImJ1eV9jb3VudCI6IjAiLCJhdHRyX2tleSI6IjI3MF8yNzEifSwiMjY5XzI3MyI6eyJpZCI6IjEzNiIsImRlYWxfaWQiOiI2NCIsImF0dHJfY2ZnIjp7IjE5IjoiXHU2OGQ1XHU4MjcyIiwiMjAiOiJcdTVjMGZcdTc4MDEifSwic3RvY2tfY2ZnIjoiMjAwIiwiYXR0cl9zdHIiOiJcdTY4ZDVcdTgyNzJcdTVjMGZcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNjlfMjczIn0sIjI2OV8yNzEiOnsiaWQiOiIxMzQiLCJkZWFsX2lkIjoiNjQiLCJhdHRyX2NmZyI6eyIxOSI6Ilx1NjhkNVx1ODI3MiIsIjIwIjoiXHU1NzQ3XHU3ODAxIn0sInN0b2NrX2NmZyI6IjEwMCIsImF0dHJfc3RyIjoiXHU2OGQ1XHU4MjcyXHU1NzQ3XHU3ODAxIiwiYnV5X2NvdW50IjoiMCIsImF0dHJfa2V5IjoiMjY5XzI3MSJ9LCIyNjlfMjcyIjp7ImlkIjoiMTM1IiwiZGVhbF9pZCI6IjY0IiwiYXR0cl9jZmciOnsiMTkiOiJcdTY4ZDVcdTgyNzIiLCIyMCI6Ilx1NTkyN1x1NzgwMSJ9LCJzdG9ja19jZmciOiIwIiwiYXR0cl9zdHIiOiJcdTY4ZDVcdTgyNzJcdTU5MjdcdTc4MDEiLCJidXlfY291bnQiOiIwIiwiYXR0cl9rZXkiOiIyNjlfMjcyIn19IjtzOjk6InNoYXJlX3VybCI7czo1NzoiaHR0cDovL3d3dy5mYW53ZXRvdXIuY29tL28yb25ldy9pbmRleC5waHA/Y3RsPWRlYWwmYWN0PTY0IjtzOjk6ImRlYWxfdGFncyI7YToxOntpOjA7aTo2O319fQ==','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"145\";s:4:\"name\";s:38:\"35d92374d0e80b9e1cd01242fa2741f228.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('205','','','','1424831278','share','71','fanwe','1','0','203','203','0','0','0','0','0','','','','0','share','0','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','a:52:{s:2:\"id\";s:3:\"203\";s:5:\"title\";s:0:\"\";s:11:\"forum_title\";s:0:\"\";s:7:\"content\";s:59:\"团购推荐：泰宁大金湖[【福州】泰宁大金湖]\";s:11:\"create_time\";s:10:\"1424825541\";s:4:\"type\";s:9:\"sharedeal\";s:7:\"user_id\";s:2:\"71\";s:9:\"user_name\";s:5:\"fanwe\";s:9:\"is_effect\";s:1:\"1\";s:9:\"is_delete\";s:1:\"0\";s:8:\"relay_id\";s:1:\"0\";s:9:\"origin_id\";s:3:\"203\";s:11:\"reply_count\";s:1:\"0\";s:11:\"relay_count\";s:1:\"1\";s:10:\"good_count\";s:1:\"0\";s:9:\"bad_count\";s:1:\"0\";s:11:\"click_count\";s:1:\"0\";s:13:\"rel_app_index\";s:5:\"index\";s:9:\"rel_route\";s:7:\"deal#65\";s:9:\"rel_param\";s:0:\"\";s:10:\"message_id\";s:1:\"0\";s:11:\"topic_group\";s:5:\"Fanwe\";s:6:\"fav_id\";s:1:\"0\";s:9:\"fav_count\";s:1:\"0\";s:15:\"user_name_match\";s:0:\"\";s:19:\"user_name_match_row\";s:0:\"\";s:13:\"keyword_match\";s:215:\"ux27888ux23425,ux29577ux21326,ux37329ux28246,ux23578ux20070ux31532,ux20108ux26085,ux31119ux24314,ux22823ux23777ux35895,ux20165ux21806,ux26149ux31179,ux26053ux34892ux31038,ux31119ux24030,ux22242ux36141,ux25512ux33616\";s:17:\"keyword_match_row\";s:99:\"泰宁,玉华,金湖,尚书第,二日,福建,大峡谷,仅售,春秋,旅行社,福州,团购,推荐\";s:6:\"xpoint\";s:0:\"\";s:6:\"ypoint\";s:0:\"\";s:4:\"tags\";s:78:\"泰宁 玉华 金湖 尚书第 二日 福建 大峡谷 仅售 春秋 旅行社\";s:12:\"is_recommend\";s:1:\"0\";s:9:\"has_image\";s:1:\"1\";s:11:\"source_type\";s:1:\"0\";s:11:\"source_name\";s:6:\"网站\";s:10:\"source_url\";s:0:\"\";s:10:\"group_data\";s:17276:\"YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo1OiJpbmRleCI7czo1OiJyb3V0ZSI7czo3OiJkZWFsIzY1IjtzOjU6InBhcmFtIjtzOjA6IiI7fXM6NDoiZGF0YSI7YToxMTI6e3M6MjoiaWQiO3M6MjoiNjUiO3M6NDoibmFtZSI7czoxNjg6IuS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czo4OiJzdWJfbmFtZSI7czoxNToi5rOw5a6B5aSn6YeR5rmWIjtzOjc6ImNhdGVfaWQiO3M6MjoiMTEiO3M6MTE6InN1cHBsaWVyX2lkIjtzOjI6IjMxIjtzOjM6ImltZyI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDE1MDIvMjUvMTYvNTRlZDg0MDg3NTA3Yy5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjYzNDg6IjxwIGFsaWduPSJjZW50ZXIiPjxpbWcgYm9yZGVyPSIwIiBhbHQ9IiIgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNi81NGVkODQwODc1MDdjLmpwZyIgLz48L3A+DQo8dWwgaWQ9Inl1aV8zXzE2XzBfMV8xNDI0ODUxOTA5OTgzXzEzNjUiIGNsYXNzPSJsaXN0IiBzdHlsZT0id2hpdGUtc3BhY2U6bm9ybWFsO3dvcmQtc3BhY2luZzowcHg7dGV4dC10cmFuc2Zvcm06bm9uZTtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7Zm9udDoxNHB4LzIxcHggJ2hpcmFnaW5vIHNhbnMgZ2InLCAnd2VucXVhbnlpIG1pY3JvIGhlaScsIHRhaG9tYSwgc2Fucy1zZXJpZjtwYWRkaW5nLWxlZnQ6MThweDttYXJnaW46MTBweCAwcHggMTVweDtsZXR0ZXItc3BhY2luZzpub3JtYWw7cGFkZGluZy1yaWdodDowcHg7YmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO3RleHQtaW5kZW50OjBweDstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOjBweDsiPjxsaSBpZD0ieXVpXzNfMTZfMF8xXzE0MjQ4NTE5MDk5ODNfMTM2NCIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5Y+R5Zui5pe26Ze077ya6K+m6K+i5ZWG5a6277yb6aKE57qm5Ye65Zui5Lq65pWw77ya5LiN6ZmQPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7lt7LljIXlkKvlr7zmuLjotLnvvJvljIXlkKvml6nppJAx5qyhK+WNiOmkkDHmrKEr5pma6aSQMeasoTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+5YyF5ZCr5YWl5L2P6YWS5bqXMeaZmu+8m+aWueahiOW3suWMheWQq+W+gOi/lOi9pui0uTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpub25lO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+6KGM56iL5a6J5o6S77yaPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij7pm4blkIjml7bpl7TvvJowN++8mjAw77yb6ZuG5ZCI5Zyw54K577ya56aP5bee54Gr6L2m56uZPC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48Yj7lpKfph5HmuZbvvIjnrKzkuIDlpKnvvIk8L2I+PGJyIC8+DQrkuqTpgJrmlrnlvI/vvJrliqjovabvvJvmuLjnjqnml7bplb/vvJox5aSpPGJyIC8+DQrku4vnu43vvJrlj4LogIPovabmrKHvvJrnpo/lt57nq5lEMjI0Mu+8iDA377yaMDAvMDjvvJo0M++8iSBENjUwMu+8iDA477yaMzAvMTDvvJoyMO+8iSBEMjIyNu+8iDA477yaNDIvMTDvvJozOe+8iSDml6nliqjovabnq5npm4bkuK3lkI7vvIzlrqLkurroh6rooYzliY3lvoDms7DlroHliqjovabnq5nvvIzlr7zmuLjms7DlroHnq5nmjqXlm6LpgIHjgJDms7DlroHlj6Tln47jgJHvvIzlj4Lop4LnirblhYPmlofljJbkuLvpopjpk5zpm5XnvqTvvIzpoobnlaXms7DlroHlj6Tln47nmoTljoblj7Llj5jov4HvvIzmhJ/lj5figJzmsYnllJDlj6TplYfjgIHkuKTlrovlkI3ln47igJ3kuYvpo47pn7XjgILop6bmkbgyMjAw5bm055qE6aOO6Zuo5rKn5qGR77yM6L+Y5Y+v5Lul5Zyo57qi5Yab6KGX5LiK6L+95b+G5bel5Yac57qi5Yab5LiJ6L+b5LiJ5Ye655qE54O954Gr5bKB5pyI77yM5Y+v5Lul5Y+C6KeC5piO5pyd5YW16YOo5bCa5Lmm5p2O5pil54Oo55qE5rex5a6F5aSn6Zmi5Lit5ZOB5ZGz4oCc5rGf5Y2X56ys5LiA5rCR5bGF4oCc44CQ5bCa5Lmm56ys44CR44CC5LiL5Y2I6YCC5pe26LW05Zu95a62NUHnuqfmma/ljLrjgIHkuJbnlYzoh6rnhLbpgZfkuqfnmoTmoLjlv4Plk4HniYzigJTigJTjgJDlpKfph5HmuZbmma/ljLrjgJHvvIjooYznqIvnuqYyMOWIhumSn++8jOa4uOiniOe6pjTlsI/ml7bvvInvvIznmbvlsrjmuLjop4jigJzph47otqPlm63msLTpmYXngJHluIPigJ3jgIHkuIDmn7Hmj5LlnLDkuI3lgYfniYfnk6bnmoTljZfmlrnmgqznqbrlr7rigJznlJjpnLLlr7rigJ3jgIHpmYblnLDkuIDnur/lpKnvvJvoiLnmuLjph5HmuZbop4LlpKfotaTlo4HjgIHigJzku5nigJ3igJzlr7/igJ3lkYjnpaXlpKnkuabnnJ/ov7njgILmuLjop4jnu5PmnZ/lkI7lr7zmuLjlsIbmuLjlrqLpgIHov5TphZLlupfjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjxiPuWvqOS4i+Wkp+WzoeiwtyAr546J5Y2O5rSe77yI56ys5LqM5aSp77yJPC9iPjxiciAvPg0K5Lqk6YCa5pa55byP77ya5Yqo6L2m77yb5ri4546p5pe26ZW/77yaMeWkqTxiciAvPg0K5LuL57uN77ya5Y+C6ICD6L2m5qyh77ya5bCG5LmQ56uZRDY1MDnvvIgxNu+8mjQ0LzE477yaMjfvvIlEMjIyNe+8iDIw77yaNDMvMjLvvJoyOe+8iSDml6nppJDlkI7muLjop4jkuJbnlYzlnLDotKjlhazlm63nmoTmoLfmnb/mma/ljLotLeOAkOWvqOS4i+Wkp+WzoeiwtzYy44CRKOa4uOiniOaXtumXtDIuNeWwj+aXtuW3puWPs++8ie+8iOaCrOWkqeWzoeOAgemAmuWkqeWzoeOAgeWAmuWkqeWzoeOAgeWkqeepueWyqeOAgemXruWkqeWyqeOAgeWxseW0qeWcsOijguOAgeWgsOWhnua5lu+8iei/meaYr+S4h+iwt+W9kuS4gOeahOWcsOaWue+8jOWPr+S7peavq+S4jeWkuOW8oOWcsOivtO+8muWvqOS4i+W9kuadpeS4jeeci+iwt+OAguiBlOWQiOWbveaVmeenkeaWh+e7hOe7h+S4k+WutuivhOS7t+WFtuS4uuS4lueVjOWcsOi0qOWFrOWbreeahOagt+adv+aZr+WMuuOAguS4remkkOWQjuWbveWutumHjeeCuemjjuaZr+WQjeiDnOWMuuS4reWbveWbm+Wkp+WQjea0nuS5i+S4gC0t44CQ546J5Y2O5rSeMTA144CRKOa4uOiniOaXtumXtDLlsI/ml7blt6blj7PvvInvvIzoqonnp7DlvaLog5znlLLpl73lsbHvvIzkurrpl7TnkbbmsaDmma/jgILlm6DmtJ7lhoXlsqnnn7PmtIHnmb3lpoLnjonvvIzljY7lhYnlm5vlsITogIzlvpflkI0u5L2T6aqM6aOO5aOw5LiN5q2i55qEMeaJh+mjju+8jOinguS7meS6uueUsO+8jOehleaenOe0r+e0r++8jOaTjuWkqeafse+8jOm4oeWGoOefs++8jOS4h+WutueBr+eBq++8jOS6lOabtOWkqeetieaZr+eCueOAguWQjiDlsIbkuZDov5Tlm57ms7DlroHmiJbogIXkuInmmI7ljJfnq5nov5Tlm57vvIzlkI7nu5PmnZ/mhInlv6vnmoTooYznqIvjgII8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuivt+aPkOWJjeeUteivneWVhuWutjA1OTEtODc4NzE1NjfjgIE4ODk5OTg4MOmihOe6puaIluWPkemihOe6puefreS/oeKAnOWnk+WQjSvmiYvmnLrlj7fkurrmlbAr5ri4546p5pel5pyfK+e+juWboumqjOivgeeggeKAnee7meWuouacjeeUteivnTEzNTU5MTk1NTM3PC9saT4NCjxsaSBzdHlsZT0ibGlzdC1zdHlsZS10eXBlOmRpc2M7bGlzdC1zdHlsZS1wb3NpdGlvbjpvdXRzaWRlO3BhZGRpbmctYm90dG9tOjBweDtwYWRkaW5nLXRvcDowcHg7cGFkZGluZy1sZWZ0OjBweDttYXJnaW46MHB4IDBweCA1cHg7cGFkZGluZy1yaWdodDowcHg7Ij48L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPuOAkOacjeWKoeagh+WHhuOAkTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+MeOAgeS9j+Wuv++8muWutuW6remFkuW6l+agh+WHhuWPjOagh+mXtO+8iOWPguiAg+mFkuW6l++8mueIseW/g+WuvummhuOAgeaWsOWMl+a0suWuvummhuOAgeS4i+WdiuS4gOacn++8jOS4i+WdiuS4ieacn++8jOWNl+iwtyDlt7fjgIHph5Hls7Dlt7fvvIk8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjLjgIHpl6jnpajvvJrooYznqIvmiYDliJfmma/ngrnlpKfpl6jnpajlj4roiLnnpajvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjPjgIHkuqTpgJrvvJrnpo/lt57nq5noh7Pms7DlroHjgIHlsIbkuZDnq5nlvoDov5TliqjovabkuoznrYnluqfnpajvvIzmma/ljLrpl7Tlvqrnjq/nlKjovabvvIjlpZfovabvvIzmjInkurrmlbDmjpLovabvvIzkuI3mj5Dkvpvnq5nluqfvvIzpnIDnrYnlvoU0MOWIhumSn+KAlDHlsI/ml7bvvInvvJs8L2xpPg0KPGxpIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGlzYztsaXN0LXN0eWxlLXBvc2l0aW9uOm91dHNpZGU7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctdG9wOjBweDtwYWRkaW5nLWxlZnQ6MHB4O21hcmdpbjowcHggMHB4IDVweDtwYWRkaW5nLXJpZ2h0OjBweDsiPjTjgIHppJDppa7vvJrlhajnqIvlkKvkuIDml6nkuozmraPvvIjmraPppJAyMOWFg+i1t++8jOWFq+iPnOS6jOaxpO+8jOWNgeS6uuS4gOahjO+8jOS6uuaVsOWHj+Wwke+8jOiPnOmHj+ebuOWvueWHj+Wwke+8iTwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NeOAgeWvvOa4uO+8muazsOWugeW9k+WcsOaMgeivgeWvvOa4uOacjeWKoe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+NuOAgeS/nemZqe+8muWQq+W9k+WcsOaXheihjOekvui0o+S7u+mZqeOAgeivt+e7hOWbouekvuW4ruWuouS6uuS5sOWlveaXhea4uOaEj+WklumZqe+8mzwvbGk+DQo8bGkgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTpkaXNjO2xpc3Qtc3R5bGUtcG9zaXRpb246b3V0c2lkZTtwYWRkaW5nLWJvdHRvbTowcHg7cGFkZGluZy10b3A6MHB4O3BhZGRpbmctbGVmdDowcHg7bWFyZ2luOjBweCAwcHggNXB4O3BhZGRpbmctcmlnaHQ6MHB4OyI+N+OAgeWEv+erpeaVo+aLvOaKpeS7t++8mjEuNE3ku6XkuIvvvIzlkKvovabkvY3jgIHppJDjgIHlr7zmnI3jgIHkv53pmanvvIzkuI3ljaDluorjgIHkuI3lkKvpl6jnpajjgIHliqjovabnpajotoXpq5joh6rnkIbvvIk8L2xpPg0KPC91bD4NCiI7czoxMDoiYmVnaW5fdGltZSI7czoxOiIwIjtzOjg6ImVuZF90aW1lIjtzOjE6IjAiO3M6MTA6Im1pbl9ib3VnaHQiO3M6MToiMCI7czoxMDoibWF4X2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21pbl9ib3VnaHQiO3M6MToiMCI7czoxNToidXNlcl9tYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTI6Im9yaWdpbl9wcmljZSI7czo4OiI4MzguMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI3NTguMDAwMCI7czo3OiJjaXR5X2lkIjtzOjI6IjE1IjtzOjk6ImlzX2NvdXBvbiI7czoxOiIxIjtzOjExOiJpc19kZWxpdmVyeSI7czoxOiIwIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjk6ImlzX2RlbGV0ZSI7czoxOiIwIjtzOjEwOiJ1c2VyX2NvdW50IjtzOjE6IjAiO3M6OToiYnV5X2NvdW50IjtzOjE6IjAiO3M6MTE6InRpbWVfc3RhdHVzIjtpOjE7czoxMDoiYnV5X3N0YXR1cyI7aToxO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6Mjc6IuOAkOemj+W3nuOAkeazsOWugeWkp+mHkea5liI7czo0OiJzb3J0IjtzOjE6IjciO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTY6ImNvdXBvbl90aW1lX3R5cGUiO3M6MToiMCI7czoxMDoiY291cG9uX2RheSI7czoxOiIwIjtzOjE3OiJjb3Vwb25fYmVnaW5fdGltZSI7czoxOiIwIjtzOjE1OiJjb3Vwb25fZW5kX3RpbWUiO3M6MToiMCI7czo0OiJjb2RlIjtzOjA6IiI7czo2OiJ3ZWlnaHQiO3M6NjoiMC4wMDAwIjtzOjk6IndlaWdodF9pZCI7czoxOiIwIjtzOjExOiJpc19yZWZlcnJhbCI7czoxOiIwIjtzOjg6ImJ1eV90eXBlIjtzOjE6IjAiO3M6ODoiZGlzY291bnQiO2Q6OTtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxNTAyLzI1LzE2LzU0ZWQ4NDA4NzUwN2MuanBnIjtzOjY6Im5vdGljZSI7czoxOiIwIjtzOjEzOiJmcmVlX2RlbGl2ZXJ5IjtzOjE6IjAiO3M6MTQ6ImRlZmluZV9wYXltZW50IjtzOjE6IjAiO3M6OToic2VvX3RpdGxlIjtzOjA6IiI7czoxMToic2VvX2tleXdvcmQiO3M6MDoiIjtzOjE1OiJzZW9fZGVzY3JpcHRpb24iO3M6MDoiIjtzOjY6ImlzX2hvdCI7czoxOiIwIjtzOjY6ImlzX25ldyI7czoxOiIwIjtzOjc6ImlzX2Jlc3QiO3M6MToiMCI7czoxMDoiaXNfbG90dGVyeSI7czoxOiIwIjtzOjY6InJlb3BlbiI7czoxOiIwIjtzOjU6InVuYW1lIjtzOjA6IiI7czoxMDoiZm9yYmlkX3NtcyI7czoxOiIwIjtzOjk6ImNhcnRfdHlwZSI7czoxOiIwIjtzOjEyOiJzaG9wX2NhdGVfaWQiO3M6MToiMCI7czo3OiJpc19zaG9wIjtzOjE6IjAiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjAiO3M6OToiYXZnX3BvaW50IjtzOjY6IjAuMDAwMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjE0MjQ4MjMyODEiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxNDI0ODIzMjgxIjtzOjEwOiJuYW1lX21hdGNoIjtzOjU3ODoidXgyNzg4OHV4MjM0MjUsdXgyOTU3N3V4MjEzMjYsdXgzNzMyOXV4MjgyNDYsdXgyMzU3OHV4MjAwNzB1eDMxNTMyLHV4MjAxMDh1eDI2MDg1LHV4MzExMTl1eDI0MzE0LHV4MjI4MjN1eDIzNzc3dXgzNTg5NSx1eDIwMTY1dXgyMTgwNix1eDI2MTQ5dXgzMTE3OSx1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMDE2NXV4MjE4MDZ1eDU1dXg1M3V4NTZ1eDIwODAzdXg2NTI4MXV4MjAyMTV1eDIwNTQwdXg1NnV4NTF1eDU2dXgyMDgwM3V4MzAzNDB1eDMxMTE5dXgyNDMxNHV4MjYxNDl1eDMxMTc5dXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzh1eDI1NTUydXgyMDM3OXV4MzAzNDB1eDI3ODg4dXgyMzQyNXV4MjI4MjN1eDM3MzI5dXgyODI0NnV4NDN1eDIzNTI4dXgxOTk3OXV4MjI4MjN1eDIzNzc3dXgzNTg5NXV4NDN1eDI5NTc3dXgyMTMyNnV4Mjc5MzR1eDQzdXgyMzU3OHV4MjAwNzB1eDMxNTMydXgyMTQ1MnV4MjExNjB1eDIwMTA4dXgyNjA4NXV4MjgyMTZ1eDY1MjkydXgzNTgxNHV4MzU4MTB1eDIxODMwdXgyMzQ3OHV4NjUyOTJ1eDE5OTgxdXgzODQ4MHV4MjA5ODZ1eDIyMjQydXgyMDE1NHV4MjU5NjgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjI0Nzoi5rOw5a6BLOeOieWNjizph5HmuZYs5bCa5Lmm56ysLOS6jOaXpSznpo/lu7os5aSn5bOh6LC3LOS7heWUrizmmKXnp4ss5peF6KGM56S+LOS7heWUrjc1OOWFg++8geS7t+WAvDgzOOWFg+eahOemj+W7uuaYpeeni+WbvemZheaXheihjOekvuaPkOS+m+eahOazsOWugeWkp+mHkea5livlr6jkuIvlpKfls6HosLcr546J5Y2O5rSeK+WwmuS5puesrOWPjOWKqOS6jOaXpea4uO+8jOivpuivouWVhuWutu+8jOS4jemZkOWHuuWbouS6uuaVsCI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjcyOiJ1eDM3MjAydXgyNDIxNXV4MjYwNTN1eDI4MjE2LHV4MzMyNTh1eDIxMTYxdXgyODIxNix1eDIxNjA4dXgzNjc5M3V4MjgyMTYiO3M6MTk6ImRlYWxfY2F0ZV9tYXRjaF9yb3ciO3M6MzI6IumFkuW6l+aXhea4uCzoh6rliqnmuLgs5ZGo6L655ri4IjtzOjE1OiJzaG9wX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJzaG9wX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxMjoibG9jYXRlX21hdGNoIjtzOjM0NToidXgzMTExOXV4MjQzMTQsdXgzMTExOXV4MjQwMzAsdXg0MDcyM3V4MjcwMDR1eDIxMzA2LHV4Mjc0OTF1eDIyODIzLHV4MjAwMTN1eDM2MzM1LHV4MjQxOTF1eDIyMzMwLHV4NDl1eDU0dXg1MHV4NTEsdXg0MDcyM3V4MjcwMDR1eDIxMzA2dXgyMDExNnV4MTk5Njh1eDIwMDEzdXgzNjMzNXV4NDl1eDU2dXgyMTQ5NXV4Mjc0OTF1eDIyODIzdXgyNDE5MXV4MjIzMzB1eDI0NDgxdXgyNjIyM3V4MjE0ODh1eDQ5dXg1NHV4NTB1eDUxLHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE0Nzoi56aP5bu6LOemj+W3nizpvJPmpbzljLos5q2j5aSnLOS4rei3ryzlub/lnLosMTYyMyzpvJPmpbzljLrkupTkuIDkuK3ot68xOOWPt+ato+Wkp+W5v+WcuuW+oeaZr+WPsDE2MjMs5Y+w5rGf5Yy6LOWFreS4gOS4rei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjMxNzA3MSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDgxNDM0IjtzOjg6ImJyYW5kX2lkIjtzOjE6IjAiO3M6MTM6ImJyYW5kX3Byb21vdGUiO3M6MToiMCI7czoxMjoicHVibGlzaF93YWl0IjtzOjE6IjAiO3M6MTA6ImFjY291bnRfaWQiO3M6MToiMCI7czoxMjoiaXNfcmVjb21tZW5kIjtzOjE6IjEiO3M6MTM6ImJhbGFuY2VfcHJpY2UiO3M6ODoiNzAwLjAwMDAiO3M6OToiaXNfcmVmdW5kIjtzOjE6IjEiO3M6MTA6ImF1dG9fb3JkZXIiO3M6MToiMCI7czoxMzoiZXhwaXJlX3JlZnVuZCI7czoxOiIxIjtzOjEwOiJhbnlfcmVmdW5kIjtzOjE6IjEiO3M6MTA6Im11bHRpX2F0dHIiO3M6MToiMCI7czo4OiJkZWFsX3RhZyI7czoyOiI5NiI7czo4OiJkcF9jb3VudCI7czoxOiIwIjtzOjU6Im5vdGVzIjtzOjI1NToiPGR0IGlkPSJ5dWlfM18xNl8wXzFfMTQyNDg1MTkwOTk4M18xMzkwIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQ7Ym9yZGVyLXRvcDojZWVlZWVlIDFweCBzb2xpZDt3aWR0aDoxNDBweDt3aGl0ZS1zcGFjZTpwcmUtd3JhcDt3b3JkLXNwYWNpbmc6MHB4O3RleHQtdHJhbnNmb3JtOm5vbmU7d29yZC1icmVhazpicmVhay1hbGw7ZmxvYXQ6bGVmdDtjb2xvcjojNjY2NjY2O3BhZGRpbmctYm90dG9tOjhweDt0ZXh0LWFsaWduOmxlZnQ7cGFkZGluIjtzOjEwOiJkcF9jb3VudF8xIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzIiO3M6MToiMCI7czoxMDoiZHBfY291bnRfMyI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF80IjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzUiO3M6MToiMCI7czozOiJ1cmwiO3M6MzM6Ii9vMm9uZXcvaW5kZXgucGhwP2N0bD1kZWFsJmFjdD02NSI7czoxNzoiYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjE1OiJlbmRfdGltZV9mb3JtYXQiO3M6MDoiIjtzOjI0OiJjb3Vwb25fYmVnaW5fdGltZV9mb3JtYXQiO3M6MDoiIjtzOjIyOiJjb3Vwb25fZW5kX3RpbWVfZm9ybWF0IjtzOjA6IiI7czoxOToib3JpZ2luX3ByaWNlX2Zvcm1hdCI7czo4OiImeWVuOzgzOCI7czoyMDoiY3VycmVudF9wcmljZV9mb3JtYXQiO3M6ODoiJnllbjs3NTgiO3M6MTk6InN1Y2Nlc3NfdGltZV9mb3JtYXQiO3M6MTk6IjIwMTUtMDItMjUgMTY6MTQ6NDEiO3M6MTA6InNhdmVfcHJpY2UiO2Q6ODA7czoxNzoic2F2ZV9wcmljZV9mb3JtYXQiO3M6NzoiJnllbjs4MCI7czoxNjoiZGVhbF9zdWNjZXNzX251bSI7czozMDoiPHN0cm9uZz4wPC9zdHJvbmc+5Lq65bey6LSt5LmwIjtzOjE0OiJjdXJyZW50X2JvdWdodCI7czoxOiIwIjtzOjEzOiJzdXBwbGllcl9pbmZvIjthOjM5OntzOjI6ImlkIjtzOjI6IjMxIjtzOjQ6Im5hbWUiO3M6MTU6IuWbvemZheaXheihjOekviI7czo3OiJwcmV2aWV3IjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTUwMi8yNS8xNS81NGVkODBiZjY0YmE2LmpwZyI7czo3OiJjb250ZW50IjtzOjA6IiI7czo0OiJzb3J0IjtzOjE6IjAiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjAiO3M6NzoiY2l0eV9pZCI7czoxOiIwIjtzOjEwOiJuYW1lX21hdGNoIjtzOjcyOiJ1eDI2MDUzdXgzNDg5MnV4MzEwMzgsdXgyMjI2OXV4Mzg0NjksdXgyMjI2OXV4Mzg0Njl1eDI2MDUzdXgzNDg5MnV4MzEwMzgiO3M6MTQ6Im5hbWVfbWF0Y2hfcm93IjtzOjMyOiLml4XooYznpL4s5Zu96ZmFLOWbvemZheaXheihjOekviI7czo5OiJiYW5rX2luZm8iO3M6MjM6IjYyMjggNDgwMCA2MzA0IDI5NjUgNDE2IjtzOjU6Im1vbmV5IjtzOjY6IjAuMDAwMCI7czoxMDoic2FsZV9tb25leSI7czo2OiIwLjAwMDAiO3M6MTA6ImxvY2tfbW9uZXkiO3M6NjoiMC4wMDAwIjtzOjEzOiJiYWxhbmNlX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmVmdW5kX21vbmV5IjtzOjY6IjAuMDAwMCI7czo4OiJ3ZF9tb25leSI7czo2OiIwLjAwMDAiO3M6OToiYmFua19uYW1lIjtzOjI0OiLlhpzkuJrpk7booYznpo/lt57liIbooYwiO3M6OToiYmFua191c2VyIjtzOjk6IumZiOemj+adgyI7czoxMDoiZHBfY291bnRfMSI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF8yIjtzOjE6IjAiO3M6MTA6ImRwX2NvdW50XzMiO3M6MToiMCI7czoxMDoiZHBfY291bnRfNCI7czoxOiIwIjtzOjEwOiJkcF9jb3VudF81IjtzOjE6IjAiO3M6ODoiZHBfY291bnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6NjoiMC4wMDAwIjtzOjExOiJ0b3RhbF9wb2ludCI7czoxOiIwIjtzOjEzOiJ0b3RhbF9wb2ludF8xIjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF8xIjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfMiI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfMiI7czo2OiIwLjAwMDAiO3M6MTM6InRvdGFsX3BvaW50XzMiO3M6MToiMCI7czoxMToiYXZnX3BvaW50XzMiO3M6NjoiMC4wMDAwIjtzOjEzOiJ0b3RhbF9wb2ludF80IjtzOjE6IjAiO3M6MTE6ImF2Z19wb2ludF80IjtzOjY6IjAuMDAwMCI7czoxMzoidG90YWxfcG9pbnRfNSI7czoxOiIwIjtzOjExOiJhdmdfcG9pbnRfNSI7czo2OiIwLjAwMDAiO3M6NjoiaF9uYW1lIjtzOjE1OiLlm73pmYXml4XooYznpL4iO3M6NzoiaF9mYXJlbiI7czo5OiLpmYjnpo/mnYMiO3M6NToiaF90ZWwiO3M6MTM6IjA1OTEtODg2MDA4MzEiO31zOjIzOiJzdXBwbGllcl9sb2NhdGlvbl9jb3VudCI7czoxOiIxIjtzOjk6ImRlYWxfYXR0ciI7YTowOnt9czoyMDoiZGVhbF9hdHRyX3N0b2NrX2pzb24iO3M6MjoiW10iO3M6OToic2hhcmVfdXJsIjtzOjU3OiJodHRwOi8vd3d3LmZhbndldG91ci5jb20vbzJvbmV3L2luZGV4LnBocD9jdGw9ZGVhbCZhY3Q9NjUiO3M6OToiZGVhbF90YWdzIjthOjI6e2k6MDtpOjU7aToxO2k6Njt9fX0=\";s:10:\"daren_page\";s:0:\"\";s:8:\"group_id\";s:1:\"0\";s:6:\"is_top\";s:1:\"0\";s:7:\"is_best\";s:1:\"0\";s:7:\"op_memo\";s:0:\"\";s:9:\"last_time\";s:1:\"0\";s:12:\"last_user_id\";s:1:\"0\";s:10:\"cate_match\";s:0:\"\";s:14:\"cate_match_row\";s:0:\"\";s:17:\"origin_topic_data\";s:0:\"\";s:12:\"images_count\";s:1:\"1\";s:10:\"image_list\";s:321:\"a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}\";s:9:\"is_cached\";s:1:\"0\";s:16:\"topic_group_data\";s:4:\"b:0;\";s:6:\"images\";a:1:{i:0;a:6:{s:4:\"path\";s:76:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"144\";s:4:\"name\";s:38:\"a09bc02d6b7e791f31c69b78b337abba33.jpg\";}}}','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('206','','','【经典回顾】：奇幻精灵历险记','1424831452','share','71','fanwe','1','0','0','206','0','0','0','0','0','','','','0','share','0','0','','','ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789','经典回顾,历险记,奇幻,精灵','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"251\";s:2:\"id\";s:3:\"155\";s:4:\"name\";s:38:\"52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563.jpg\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:3:\"852\";s:2:\"id\";s:3:\"154\";s:4:\"name\";s:38:\"4c5971b0370e739c71ea9d0f5e2e35e257.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"891\";s:2:\"id\";s:3:\"153\";s:4:\"name\";s:38:\"2bb1fba7bd9e10b01fea8a248d15129213.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('207','','','【经典回顾】：电影星尘','1424831511','share','71','fanwe','1','0','0','207','0','0','0','0','0','','','','0','share','0','0','','','ux32463ux20856ux22238ux39038,ux24433ux26143','经典回顾,影星','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"885\";s:2:\"id\";s:3:\"156\";s:4:\"name\";s:38:\"a69a84427dd071df105eeb4bdf3f537a69.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('208','','','电影-奇幻精灵历险记','1424831593','share','71','fanwe','1','0','0','208','1','1','0','0','0','','','','0','share','0','0','','','ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789,ux30005ux24433','历险记,奇幻,精灵,电影','','','','0','1','0','网站','','','','0','0','0','','1424892621','71','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('209','','','上菜太慢，其他的都很好。','1424891284','dealcomment','71','fanwe','1','0','0','209','0','0','0','0','0','index','deal#57','','0','share','0','0','','','ux19978ux33756,ux20854ux20182','上菜,其他','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','4','a:4:{i:0;a:6:{s:4:\"path\";s:50:\"./public/attachment/201502/25/14/54ed67b2cd14b.jpg\";s:6:\"o_path\";s:50:\"./public/attachment/201502/25/14/54ed67b2cd14b.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"161\";s:4:\"name\";s:32:\"88元桥亭活鱼小镇代金券\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg\";s:5:\"width\";s:3:\"460\";s:6:\"height\";s:3:\"279\";s:2:\"id\";s:3:\"160\";s:4:\"name\";s:23:\"__49606321__2635650.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"426\";s:2:\"id\";s:3:\"159\";s:4:\"name\";s:23:\"__49606066__3756642.jpg\";}i:3;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"961\";s:2:\"id\";s:3:\"158\";s:4:\"name\";s:23:\"__49606066__3081862.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('210','','边境牧羊幼犬寻找主人','小狗照.jpg 边境牧羊幼犬寻找主人  本窝出于2014年12月27号出生，现剩1母接受预定，小狗带出生纸，支持淘宝交易。小狗妈妈：蓝妹妹（父系：兰登为金牧阳光犬业的当家种公，体内含有丰富的颜色基因，曾繁殖出黄白，丁香，蓝白等颜色。曾在幼年时期获BBIS4 ，成年后获得 NGKC 最佳公犬 的赏励；蓝妹妹母亲：Quintina（丁香色）系出名门，为美国、墨西哥，两国登陆冠军 至尊红魔直女，其外公为美国登陆冠军陨石神话。Quintina NGKC南宁站--后备最佳母犬。） 狗爸爸：盖德 （泰戈儿子）广东省潮州市龙翔犬舍 ：专注边境牧羊犬繁殖 ， 所售幼犬都已注射疫苗，经过驱虫处理，保证小狗健康成长。欢迎周边朋友实地看狗，交流心得。','1424893353','share','71','fanwe','1','0','0','210','0','0','0','0','0','','','','0','share','0','0','','','ux29287ux32650,ux36793ux22659,ux20027ux20154,ux23547ux25214,ux36793ux22659ux29287ux32650ux24188ux29356ux23547ux25214ux20027ux20154,ux23567ux29399,ux21335ux23425ux31449,ux20848ux30331,ux32654ux22269,ux32321ux27542,ux34013ux30333,ux40857ux32724,ux19969ux39321,ux28526ux24030ux24066','牧羊,边境,主人,寻找,边境牧羊幼犬寻找主人,小狗,南宁站,兰登,美国,繁殖,蓝白,龙翔,丁香,潮州市','','','牧羊 边境 主人 寻找 边境牧羊幼犬寻找主人','1','0','0','网站','','','','3','0','0','','0','0','','','','0','a:0:{}','0','a:12:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:12:\"跳蚤市场\";s:4:\"memo\";s:54:\"有钱的，没钱的，路过，瞧一瞧，看一看\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893197\";s:7:\"cate_id\";s:1:\"6\";s:10:\"user_count\";s:1:\"1\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('211','','搬家空调转手','因为年后要搬家，原来的租的房间没有装空调，空调用了2个夏天还很新，没有故障维修过，发票保修卡等证件都在，小天鹅的老牌子，单冷1.25匹，对于十来平的房间非常好用，晚上也没有噪音，但是拆装费需要自理，特价转手，有意者请联系我，最低价格议价勿扰，谢谢。','1424893442','share','71','fanwe','1','0','0','211','0','0','0','0','0','','','','0','share','0','0','','','ux36716ux25163,ux25644ux23478,ux31354ux35843,ux25644ux23478ux31354ux35843ux36716ux25163,ux27809ux26377,ux23567ux22825ux40517,ux21333ux20919,ux21313ux26469,ux32769ux29260ux23376,ux25151ux38388,ux22909ux29992,ux20445ux20462ux21345,ux35758ux20215','转手,搬家,空调,搬家空调转手,没有,小天鹅,单冷,十来,老牌子,房间,好用,保修卡,议价','','','转手 搬家 空调 搬家空调转手','1','0','0','网站','','','','3','0','0','','0','0','','','','0','a:0:{}','0','a:12:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:12:\"跳蚤市场\";s:4:\"memo\";s:54:\"有钱的，没钱的，路过，瞧一瞧，看一看\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893197\";s:7:\"cate_id\";s:1:\"6\";s:10:\"user_count\";s:1:\"1\";s:11:\"topic_count\";s:1:\"2\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('212','报名参加了玛格利塔新店开业试吃','','报名参加了玛格利塔新店开业试吃 - 玛格利塔新店开业试吃','1424894337','eventsubmit','71','fanwe','1','0','0','212','0','0','0','0','0','index','event#2','','0','share','0','0','','','ux21033ux22612,ux26032ux24215,ux29595ux26684,ux24320ux19994,ux21442ux21152,ux25253ux21517,ux25253ux21517ux21442ux21152ux20102ux29595ux26684ux21033ux22612ux26032ux24215ux24320ux19994ux35797ux21507','利塔,新店,玛格,开业,参加,报名,报名参加了玛格利塔新店开业试吃','','','','0','0','0','网站','','','','0','0','0','','0','0','','','','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('213','','','','1424906566','share','72','fz云淡风轻','1','0','208','208','0','0','0','0','0','','','','0','share','0','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','a:52:{s:2:\"id\";s:3:\"208\";s:5:\"title\";s:0:\"\";s:11:\"forum_title\";s:0:\"\";s:7:\"content\";s:28:\"电影-奇幻精灵历险记\";s:11:\"create_time\";s:10:\"1424831593\";s:4:\"type\";s:5:\"share\";s:7:\"user_id\";s:2:\"71\";s:9:\"user_name\";s:5:\"fanwe\";s:9:\"is_effect\";s:1:\"1\";s:9:\"is_delete\";s:1:\"0\";s:8:\"relay_id\";s:1:\"0\";s:9:\"origin_id\";s:3:\"208\";s:11:\"reply_count\";s:1:\"1\";s:11:\"relay_count\";s:1:\"1\";s:10:\"good_count\";s:1:\"0\";s:9:\"bad_count\";s:1:\"0\";s:11:\"click_count\";s:1:\"0\";s:13:\"rel_app_index\";s:0:\"\";s:9:\"rel_route\";s:0:\"\";s:9:\"rel_param\";s:0:\"\";s:10:\"message_id\";s:1:\"0\";s:11:\"topic_group\";s:5:\"share\";s:6:\"fav_id\";s:1:\"0\";s:9:\"fav_count\";s:1:\"0\";s:15:\"user_name_match\";s:0:\"\";s:19:\"user_name_match_row\";s:0:\"\";s:13:\"keyword_match\";s:66:\"ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789,ux30005ux24433\";s:17:\"keyword_match_row\";s:30:\"历险记,奇幻,精灵,电影\";s:6:\"xpoint\";s:0:\"\";s:6:\"ypoint\";s:0:\"\";s:4:\"tags\";s:0:\"\";s:12:\"is_recommend\";s:1:\"0\";s:9:\"has_image\";s:1:\"1\";s:11:\"source_type\";s:1:\"0\";s:11:\"source_name\";s:6:\"网站\";s:10:\"source_url\";s:0:\"\";s:10:\"group_data\";s:0:\"\";s:10:\"daren_page\";s:0:\"\";s:8:\"group_id\";s:1:\"0\";s:6:\"is_top\";s:1:\"0\";s:7:\"is_best\";s:1:\"0\";s:7:\"op_memo\";s:0:\"\";s:9:\"last_time\";s:10:\"1424892621\";s:12:\"last_user_id\";s:2:\"71\";s:10:\"cate_match\";s:0:\"\";s:14:\"cate_match_row\";s:0:\"\";s:17:\"origin_topic_data\";s:0:\"\";s:12:\"images_count\";s:1:\"1\";s:10:\"image_list\";s:319:\"a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}\";s:9:\"is_cached\";s:1:\"1\";s:16:\"topic_group_data\";s:4:\"b:0;\";s:6:\"images\";a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"400\";s:2:\"id\";s:3:\"157\";s:4:\"name\";s:38:\"347ba3d76c8cd114c26edd0097f657f168.jpg\";}}}','0','a:0:{}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('214','','恶犬BRONSON复刻L2B空军飞行员夹克MA1男士军款短装休闲夹克L-2B','[url]8[/url]','1424906767','share','72','fz云淡风轻','1','0','0','214','0','0','0','0','0','','','','0','share','0','0','','','ux22841ux20811,ux30701ux35013,ux39134ux34892ux21592,ux31354ux20891,ux117ux114ux108','夹克,短装,飞行员,空军,url','','','夹克 短装 飞行员 空军','1','1','0','网站','','','','5','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"398\";s:2:\"id\";s:3:\"164\";s:4:\"name\";s:44:\"TB23zijaFXXXXbvXpXXXXXXXXXX_!!1795832420.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"405\";s:2:\"id\";s:3:\"163\";s:4:\"name\";s:44:\"TB23jGwaFXXXXabXXXXXXXXXXXX_!!1795832420.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81.jpg\";s:5:\"width\";s:3:\"700\";s:6:\"height\";s:3:\"379\";s:2:\"id\";s:3:\"162\";s:4:\"name\";s:44:\"TB2mq1oaFXXXXXhXpXXXXXXXXXX_!!1795832420.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('215','','风光无限好','[哈哈]','1424906940','share','72','fz云淡风轻','1','0','0','215','0','0','0','0','0','','','','0','share','0','0','','','ux39118ux20809ux26080ux38480,ux39118ux20809ux26080ux38480ux22909,ux21704ux21704','风光无限,风光无限好,哈哈','','','风光无限 风光无限好','1','1','0','网站','','','','4','0','0','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85.jpg\";s:5:\"width\";s:4:\"2560\";s:6:\"height\";s:4:\"1600\";s:2:\"id\";s:3:\"167\";s:4:\"name\";s:19:\"201292116218453.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968.jpg\";s:5:\"width\";s:4:\"2560\";s:6:\"height\";s:4:\"1600\";s:2:\"id\";s:3:\"166\";s:4:\"name\";s:26:\"12116408_1340605908112.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32.jpg\";s:5:\"width\";s:3:\"650\";s:6:\"height\";s:3:\"487\";s:2:\"id\";s:3:\"165\";s:4:\"name\";s:16:\"29b1OOOPIC90.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('216','','黄山行','自助游-黄山','1424907077','share','71','fanwe','1','0','0','216','0','0','0','0','0','','','','0','share','0','0','','','ux23665ux34892,ux40644ux23665ux34892,ux40644ux23665,ux33258ux21161ux28216','山行,黄山行,黄山,自助游','','','山行 黄山行','1','1','0','网站','','','','4','0','1','','0','0','','','','3','a:3:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15.jpg\";s:5:\"width\";s:4:\"2126\";s:6:\"height\";s:4:\"1253\";s:2:\"id\";s:3:\"170\";s:4:\"name\";s:34:\"userid329500time20120523234840.jpg\";}i:1;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231.jpg\";s:5:\"width\";s:4:\"1000\";s:6:\"height\";s:3:\"667\";s:2:\"id\";s:3:\"169\";s:4:\"name\";s:34:\"userid220060time20130305031808.jpg\";}i:2;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42.jpg\";s:5:\"width\";s:4:\"1600\";s:6:\"height\";s:4:\"1200\";s:2:\"id\";s:3:\"168\";s:4:\"name\";s:36:\"f45930c0226d0d1380b1e408db196a02.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('217','','','范冰冰同款黑色大檐羊毛礼帽','1424907181','share','71','fanwe','1','0','0','217','0','0','0','0','0','','','','0','share','0','0','','','ux31036ux24125,ux32650ux27611,ux33539ux20912ux20912,ux40657ux33394','礼帽,羊毛,范冰冰,黑色','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24.jpg\";s:5:\"width\";s:3:\"468\";s:6:\"height\";s:3:\"702\";s:2:\"id\";s:3:\"171\";s:4:\"name\";s:59:\"90b11_ieydanbrmi3geylemmytambqgyyde_640x960.jpg_468x468.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('218','','','韩系浅浅的马卡龙色系搭配赫本感的半身裙，怎么穿都很经典','1424907247','share','71','fanwe','1','0','0','218','0','0','0','0','0','','','','0','share','0','0','','','ux33394ux31995,ux21322ux36523,ux27973ux27973,ux25645ux37197,ux32463ux20856,ux24590ux20040,ux39532ux21345ux40857,ux36203ux26412ux24863,ux38889ux31995','色系,半身,浅浅,搭配,经典,怎么,马卡龙,赫本感,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"172\";s:4:\"name\";s:47:\"by27i_ieydenrqgaywemtdmqytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('219','','','韩系牛仔衣，包包鞋子也是打造帅气的必备单品哦','1424907366','share','71','fanwe','1','0','0','219','0','0','0','0','0','','','','0','share','0','0','','','ux21253ux21253,ux24069ux27668,ux38795ux23376,ux24517ux22791,ux29275ux20180,ux25171ux36896,ux38889ux31995','包包,帅气,鞋子,必备,牛仔,打造,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"173\";s:4:\"name\";s:48:\"151lem_ieydkmrxgm4dcnjvmqytambqmeyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('220','','','电影-博物馆奇妙夜3','1424907447','share','71','fanwe','1','0','0','220','0','0','0','0','0','','','','0','share','0','0','','','ux21338ux29289ux39302,ux22855ux22937,ux30005ux24433','博物馆,奇妙,电影','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161.jpg\";s:5:\"width\";s:3:\"416\";s:6:\"height\";s:3:\"600\";s:2:\"id\";s:3:\"174\";s:4:\"name\";s:10:\"medish.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('221','','2015年杨子姗陈柏霖爱情电影《重返20岁》','2015年杨子姗陈柏霖爱情电影《重返20岁》','1424907522','share','71','fanwe','1','0','0','221','0','0','0','0','0','','','','0','share','0','0','','','ux26472ux23376,ux38472ux26575,ux37325ux36820,ux29233ux24773,ux30005ux24433,ux50ux48ux49ux53','杨子,陈柏,重返,爱情,电影,2015','','','杨子 陈柏 重返 爱情','1','1','0','网站','','','','5','1','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259.jpg\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"600\";s:2:\"id\";s:3:\"175\";s:4:\"name\";s:21:\"a41fbe2f275be88es.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('222','','摄影作品分享','摄影作品分享','1424908951','share','71','fanwe','1','0','0','222','0','0','0','0','0','','','','0','share','0','0','','','ux25668ux24433ux20316ux21697,ux20998ux20139,ux25668ux24433ux20316ux21697ux20998ux20139','摄影作品,分享,摄影作品分享','','','摄影作品 分享 摄影作品分享','1','1','0','网站','','','','5','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677.jpg\";s:5:\"width\";s:3:\"580\";s:6:\"height\";s:3:\"870\";s:2:\"id\";s:3:\"176\";s:4:\"name\";s:36:\"20120411165042_8jJYr.thumb.600_0.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('223','','摄影作品分享','摄影作品分享','1424909033','share','71','fanwe','1','0','0','223','0','0','0','0','0','','','','0','share','0','0','','','ux25668ux24433ux20316ux21697,ux20998ux20139,ux25668ux24433ux20316ux21697ux20998ux20139','摄影作品,分享,摄影作品分享','','','摄影作品 分享 摄影作品分享','1','1','0','网站','','','','4','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"177\";s:4:\"name\";s:12:\"Penguins.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('224','','水母','水母','1424909053','share','71','fanwe','1','0','0','224','0','0','0','0','0','','','','0','share','0','0','','','ux27700ux27597','水母','','','水母 水母','1','1','0','网站','','','','4','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"178\";s:4:\"name\";s:13:\"Jellyfish.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('225','','清新文艺范格子来袭，一款百搭甜美的长袖连衣裙，清新的格子元素，素雅干净。单穿打底都适合','清新文艺范格子来袭，一款百搭甜美的长袖连衣裙，清新的格子元素，素雅干净。单穿打底都适合','1424909140','share','71','fanwe','1','0','0','225','0','0','0','0','0','','','','0','share','0','0','','','ux23376ux26469,ux28165ux26032,ux25171ux24213,ux32654ux30340,ux32032ux38597,ux36830ux34915ux35033,ux38271ux34966,ux26684ux23376,ux25991ux33402,ux20803ux32032','子来,清新,打底,美的,素雅,连衣裙,长袖,格子,文艺,元素','','','子来 清新 打底 美的','1','1','0','网站','','','','5','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"179\";s:4:\"name\";s:48:\"1cikuu_ieydszrxgjrdozjxmmytambqgiyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('226','','格子总能体现复古情怀，姜黄色外套和橘红的帽子呼应了整体的温暖大地色调～','格子总能体现复古情怀，姜黄色外套和橘红的帽子呼应了整体的温暖大地色调～','1424909177','share','71','fanwe','1','0','0','226','0','0','0','0','0','','','','0','share','0','0','','','ux27224ux32418,ux21628ux24212,ux26684ux23376,ux33394ux35843,ux22797ux21476,ux22806ux22871,ux24635ux33021,ux24125ux23376,ux24773ux24576,ux40644ux33394','橘红,呼应,格子,色调,复古,外套,总能,帽子,情怀,黄色','','','橘红 呼应 格子 色调','1','1','0','网站','','','','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"180\";s:4:\"name\";s:48:\"151lem_ieydozbxhbrwiztdmmytambqmeyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('227','','撞色撞出鲜亮活泼style～','撞色撞出鲜亮活泼style～','1424909207','share','71','fanwe','1','0','0','227','0','0','0','0','0','','','','0','share','0','0','','','ux40092ux20142,ux27963ux27900,ux115ux116ux121ux108ux101,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374,ux25758ux33394ux25758ux20986ux40092ux20142ux27963ux27900ux115ux116ux121ux108ux101ux65374','鲜亮,活泼,style,撞色撞出鲜亮活泼style～,撞色撞出鲜亮活泼style～,撞色撞出鲜亮活泼style～','','','鲜亮 活泼 style 撞色撞出鲜亮活泼style～','1','1','0','网站','','','./public/attachment/201502/26/16/54eed629217dc.jpg','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/f71f019325289d8e091671964724687a67_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/f71f019325289d8e091671964724687a67.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"181\";s:4:\"name\";s:48:\"151lem_ieydimjshftgmnrymmytambqmeyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('228','','经典的黑白条纹套装，搭配出都市上班族的利落来吧','经典的黑白条纹套装，搭配出都市上班族的利落来吧','1424909240','share','71','fanwe','1','0','0','228','0','0','0','0','0','','','','0','share','0','0','','','ux21033ux33853,ux26465ux32441,ux19978ux29677ux26063,ux26469ux21543,ux22871ux35013,ux40657ux30333,ux25645ux37197,ux32463ux20856,ux37117ux24066','利落,条纹,上班族,来吧,套装,黑白,搭配,经典,都市','','','利落 条纹 上班族 来吧','1','1','0','网站','','','','5','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"182\";s:4:\"name\";s:48:\"151zqx_ieygcolbha3demzwmmytambqgyyde_550x620.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('229','','沙漠风光','沙漠风光','1424909588','share','72','fz云淡风轻','1','0','0','229','0','0','0','0','0','','','','0','share','0','1','','','ux27801ux28448,ux39118ux20809,ux27801ux28448ux39118ux20809','沙漠,风光,沙漠风光','','','沙漠 风光 沙漠风光','1','1','0','网站','','','','4','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979.jpg\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";s:2:\"id\";s:3:\"183\";s:4:\"name\";s:10:\"Desert.jpg\";}}','0','a:12:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:15:\"摄影爱好者\";s:4:\"memo\";s:33:\"切磋摄影技巧，晒晒片子\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893817\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"2\";s:11:\"topic_count\";s:1:\"5\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
INSERT INTO `%DB_PREFIX%topic` VALUES ('230','','','','1424909630','share','71','fanwe','1','0','0','229','0','0','0','0','0','','','','0','share','229','0','','','','','','','','0','0','0','网站','','','','0','0','0','','0','0','','','','0','','0','');
INSERT INTO `%DB_PREFIX%topic` VALUES ('231','','','美食-牛排','1424910181','share','71','fanwe','1','0','0','231','0','0','0','0','0','','','','0','share','0','0','','','ux29275ux25490,ux32654ux39135','牛排,美食','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86.jpg\";s:5:\"width\";s:3:\"640\";s:6:\"height\";s:3:\"427\";s:2:\"id\";s:3:\"184\";s:4:\"name\";s:23:\"__36578586__4587290.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('232','','','格纹韩系连衣裙＋气质毛呢外套，优雅复古不言而喻','1424910321','share','71','fanwe','1','0','0','232','0','0','0','0','0','','','','0','share','0','0','','','ux27611ux21602,ux19981ux35328ux32780ux21947,ux36830ux34915ux35033,ux22797ux21476,ux22806ux22871,ux20248ux38597,ux27668ux36136,ux38889ux31995','毛呢,不言而喻,连衣裙,复古,外套,优雅,气质,韩系','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"185\";s:4:\"name\";s:48:\"1a24yv_ieydkzbsmzsgiyjvmmytambqgiyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('233','','','韩系-运动风也能很Chic！运动卫衣搭配波点包裙，谁说不能有小小女人味呢~','1424910378','share','71','fanwe','1','0','0','233','0','0','0','0','0','','','','0','share','0','0','','','ux22899ux20154ux21619,ux36816ux21160,ux25645ux37197,ux23567ux23567,ux19981ux33021,ux21253ux35033ux65292,ux21355ux34915,ux38889ux31995,ux67ux104ux105ux99','女人味,运动,搭配,小小,不能,包裙，,卫衣,韩系,Chic','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"186\";s:4:\"name\";s:48:\"18eokr_ieydgmdemi4gkojtmmytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('234','','','韩系-宝蓝色的欧美简约风衣＋千鸟格打底裤，很率性的一套搭配。','1424910847','share','71','fanwe','1','0','0','234','0','0','0','0','0','','','','0','share','0','0','','','ux23453ux34013ux33394,ux25171ux24213,ux29575ux24615,ux39118ux34915,ux31616ux32422,ux25645ux37197,ux27431ux32654,ux38889ux31995','宝蓝色,打底,率性,风衣,简约,搭配,欧美,韩系','','','宝蓝色 打底 率性 风衣','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"187\";s:4:\"name\";s:48:\"1a24yv_ieygiyrsgi2tsyrtmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('235','','','韩系看似old-fashioned的【背带裤】，在初秋又成为流行单品。轻松打造出或犀利叛逆或随性自由的街头形象，充满了年轻和浪漫的情致。','1424911387','share','71','fanwe','1','0','0','235','0','0','0','0','0','','','','0','share','0','0','','','ux32972ux24102ux35044,ux24773ux33268,ux21021ux31179,ux29312ux21033,ux21467ux36870,ux102ux97ux115ux104ux105ux111ux110ux101ux100,ux30475ux20284,ux20805ux28385,ux34903ux22836,ux24418ux35937','背带裤,情致,初秋,犀利,叛逆,fashioned,看似,充满,街头,形象','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"188\";s:4:\"name\";s:48:\"1cikuv_ieydcobzha2genbtmmytambqgiyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('236','','','韩系-卖萌减龄背带裤，甜美有范半身牛仔裙，个性十足牛仔裤，帅气百搭牛仔外套，应有尽有，简单又不失潮范儿，总有一款适合菇凉你','1424911476','share','71','fanwe','1','0','0','236','0','0','0','0','0','','','','0','share','0','0','','','ux32972ux24102ux35044,ux29275ux20180ux35033,ux24212ux26377ux23613ux26377,ux21322ux36523,ux29275ux20180ux35044,ux19981ux22833,ux24069ux27668,ux22806ux22871,ux29980ux32654,ux29275ux20180','背带裤,牛仔裙,应有尽有,半身,牛仔裤,不失,帅气,外套,甜美,牛仔','','','','0','1','0','网站','','','','0','0','0','','0','0','ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966','休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"189\";s:4:\"name\";s:48:\"1cikuv_ieydozdfgy4genbtmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('237','','','清新文艺复古范儿，秋款连衣裙搭配短靴就可以了','1424911632','share','71','fanwe','1','0','0','237','0','0','0','0','0','','','','0','share','0','0','','','ux30701ux38772,ux36830ux34915ux35033,ux22797ux21476,ux25991ux33402,ux28165ux26032,ux25645ux37197,ux21487ux20197,ux33539ux20799ux65292','短靴,连衣裙,复古,文艺,清新,搭配,可以,范儿，','','','','0','1','0','网站','','','','0','0','0','','0','0','ux20241ux38386ux23089ux20048,ux37117ux24066ux36141ux29289','休闲娱乐,都市购物','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"190\";s:4:\"name\";s:48:\"151lem_ieydaojqgm3wmzbvmmytambqgyyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('238','','','独特的纯色设计风衣，低调内涵，是今秋流行款。','1424912286','share','71','fanwe','1','0','0','238','0','0','0','0','0','','','','0','share','0','0','','','ux20170ux31179,ux32431ux33394,ux39118ux34915,ux20302ux35843,ux20869ux28085,ux29420ux29305,ux27969ux34892,ux35774ux35745','今秋,纯色,风衣,低调,内涵,独特,流行,设计','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"191\";s:4:\"name\";s:48:\"1527j2_ieydcztega2ggzrsmmytambqmmyde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('239','','','水蓝×暖橘，绚丽的配色绝对吸引人们的眼球，却显得不落俗套很有品。','1424912308','share','71','fanwe','1','0','0','239','0','0','0','0','0','','','','0','share','0','0','','','ux19981ux33853ux20439ux22871,ux37197ux33394,ux30524ux29699,ux32474ux20029,ux26174ux24471,ux20154ux20204,ux21560ux24341,ux32477ux23545,ux34013ux215ux26262','不落俗套,配色,眼球,绚丽,显得,人们,吸引,绝对,蓝×暖','','','','0','1','0','网站','','','','0','0','0','','0','0','','','','1','a:1:{i:0;a:6:{s:4:\"path\";s:74:\"./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19_50x50.jpg\";s:6:\"o_path\";s:68:\"./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19.jpg\";s:5:\"width\";s:3:\"550\";s:6:\"height\";s:3:\"620\";s:2:\"id\";s:3:\"192\";s:4:\"name\";s:48:\"1527j2_ieygeztfgyygezrsmmytambqhayde_550x620.jpg\";}}','0','b:0;');
INSERT INTO `%DB_PREFIX%topic` VALUES ('240','发布标题！','发布标题！','发布标题！','1434934373','share','73','221115','1','0','0','240','0','0','0','0','0','','','','0','share','0','0','','','ux26631ux39064,ux21457ux24067,ux21457ux24067ux26631ux39064ux65281','标题,发布,发布标题！','','','标题 发布 发布标题！','0','0','0','网站','','','','5','0','0','','0','0','','','','0','a:0:{}','0','a:12:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"时尚消费\";s:4:\"memo\";s:78:\"分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得\";s:4:\"sort\";s:1:\"0\";s:11:\"create_time\";s:10:\"1424893958\";s:7:\"cate_id\";s:1:\"7\";s:10:\"user_count\";s:1:\"3\";s:11:\"topic_count\";s:1:\"8\";s:4:\"icon\";s:71:\"./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg\";s:5:\"image\";s:50:\"./public/attachment/201502/26/15/54eec4ce331f0.png\";s:9:\"is_effect\";s:1:\"1\";s:7:\"user_id\";s:2:\"71\";}');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_cate_link` (
  `topic_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享与分享分类的关联表';
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('226','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('227','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('228','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('229','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','2');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','3');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','4');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','5');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','6');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('236','7');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('237','1');
INSERT INTO `%DB_PREFIX%topic_cate_link` VALUES ('237','4');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_group`;
CREATE TABLE `%DB_PREFIX%topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '小组名称',
  `memo` text NOT NULL COMMENT '小组说明',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `cate_id` int(11) NOT NULL COMMENT '所属小组分类ID',
  `user_count` int(11) NOT NULL COMMENT '组员数量',
  `topic_count` int(11) NOT NULL COMMENT '贴子总数',
  `icon` varchar(255) NOT NULL COMMENT '小组图标',
  `image` varchar(255) NOT NULL COMMENT '小组大图',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否验证通过',
  `user_id` int(11) NOT NULL COMMENT '组长ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='小组（论坛）版块表';
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('3','跳蚤市场','有钱的，没钱的，路过，瞧一瞧，看一看','0','1424893197','6','1','2','./public/attachment/201502/26/11/d57ae1aedaf872522f76516c339d6f2665.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('4','摄影爱好者','切磋摄影技巧，晒晒片子','0','1424893817','7','2','5','./public/attachment/201502/26/11/48c8553ba63755cbd8f5e10ff740dd0637.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('5','时尚消费','分享购物经验，晒晒战利品，交流服饰搭配、美颜美体心得','0','1424893958','7','3','8','./public/attachment/201502/26/11/48c92af8c49ca841b77055931beb7eff50.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('6','求职招聘','免费、可靠的招聘求职论坛','0','1424894081','6','1','0','./public/attachment/201502/26/11/c578ea62933a6016a3ce05fd576715f570.jpg','./public/attachment/201502/26/15/54eec4ce331f0.png','1','71');
INSERT INTO `%DB_PREFIX%topic_group` VALUES ('7','水果帮','水果帮','0','1435606148','6','0','0','./public/attachment/201506/30/11/4be713dc62b874a4d41ed60e9bd00c5826.jpg','./public/attachment/201506/30/11/0770a93d4f069538fb3c7a2c01856ac930.jpg','1','78');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_group_cate`;
CREATE TABLE `%DB_PREFIX%topic_group_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL COMMENT '排序大到小',
  `icon` varchar(255) NOT NULL COMMENT '弃用',
  `group_count` int(11) NOT NULL COMMENT '分类下的小组量数',
  `is_effect` tinyint(1) NOT NULL COMMENT '分类是否显示 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='小组分类表';
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('4','跳蚤市场','1','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('5','摄影','2','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('6','推荐小组','3','','0','1');
INSERT INTO `%DB_PREFIX%topic_group_cate` VALUES ('7','热门小组','4','','0','1');
