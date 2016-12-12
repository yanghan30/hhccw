-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:31
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 7


DROP TABLE IF EXISTS `%DB_PREFIX%withdraw`;
CREATE TABLE `%DB_PREFIX%withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `money` decimal(20,4) NOT NULL COMMENT '提现金额',
  `create_time` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL COMMENT '是否已确认',
  `pay_time` int(11) NOT NULL COMMENT '确认支付时间',
  `bank_name` varchar(255) NOT NULL COMMENT '开户行名称',
  `bank_account` varchar(255) NOT NULL COMMENT '开户行账号',
  `bank_user` varchar(255) NOT NULL COMMENT '开户行会员名',
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%youhui`;
CREATE TABLE `%DB_PREFIX%youhui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `icon` varchar(255) NOT NULL COMMENT '列表展示用图',
  `image` varchar(255) NOT NULL COMMENT '大图',
  `deal_cate_id` int(11) NOT NULL COMMENT '所属的生活服务大分类ID',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `expire_day` int(11) NOT NULL COMMENT '领取后的过期时间(0表示以优惠券结束时间为依据)，如优惠券结束时间也为0则不过期',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `send_type` tinyint(1) NOT NULL COMMENT '弃用',
  `total_num` int(11) NOT NULL COMMENT '总条数(限制下载用（针对验证类型的优惠券）)',
  `sms_count` int(11) NOT NULL COMMENT '弃用',
  `print_count` int(11) NOT NULL COMMENT '弃用',
  `view_count` int(11) NOT NULL COMMENT '弃用',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sms_content` varchar(255) NOT NULL COMMENT '短信下载优惠券的短信内容',
  `is_sms` tinyint(1) NOT NULL COMMENT '是否支持短信下载',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '弃用',
  `brief` text NOT NULL COMMENT '内容、条款',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL COMMENT '消费的总金额（由商家验证时填写累加）',
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引',
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引',
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '名称的全文索引',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `brand_id` int(11) NOT NULL COMMENT '弃用',
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐',
  `list_brief` text NOT NULL COMMENT '优惠券列表简介',
  `description` text NOT NULL COMMENT '详情描述',
  `index_img` varchar(255) NOT NULL COMMENT '弃用',
  `image_3` varchar(255) NOT NULL COMMENT '手机端用图',
  `image_3_w` int(11) NOT NULL COMMENT '手机端用图宽',
  `image_3_h` int(11) NOT NULL COMMENT '手机端用图高',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `publish_wait` tinyint(1) NOT NULL COMMENT '0:待审核  1:已审核 ',
  `return_money` decimal(11,4) NOT NULL COMMENT '备用',
  `return_score` int(11) NOT NULL COMMENT '备用',
  `return_point` int(11) NOT NULL COMMENT '备用',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `use_notice` text NOT NULL COMMENT '使用需知',
  `user_count` int(11) NOT NULL COMMENT '总下载次数',
  `user_limit` int(11) NOT NULL COMMENT '每个会员的下载限制',
  `score_limit` int(11) NOT NULL COMMENT '下载优惠券所消耗的积分',
  `point_limit` int(11) NOT NULL COMMENT '下载优惠券所需的经验，不扣除',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`) USING BTREE,
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='优惠券表';
INSERT INTO `%DB_PREFIX%youhui` VALUES ('20','肯德基10元汉堡','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','8','1422726137','1614274939','10','15','1','100','0','1','0','1','1','肯德基10元汉堡','1','0','','1','0','餐饮美食,面包,烧烤,西餐','ux39184ux39278ux32654ux39135,ux38754ux21253,ux28903ux28900,ux35199ux39184','福建,福州,鼓楼区,八一七北路,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','汉堡,肯德基,肯德基10元汉堡','ux27721ux22561,ux32943ux24503ux22522,ux32943ux24503ux22522ux49ux48ux20803ux27721ux22561','119.304968','26.093466','0','24','1424886275','0','0','1','','<div align=\"center\"><p><br />\r\n</p>\r\n<p><img src=\"./public/attachment/201502/25/14/54ed6e8ca0d12.jpg\" alt=\"\" border=\"0\" /></p>\r\n</div>\r\n','','./public/attachment/201502/26/09/54ee79ed82c2b.jpg','702','487','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','10','100','0','0','0','0','0','0','0.0000','0','','1','1','5','0');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('21','盛世经典牛排50元代金券','./public/attachment/201502/26/10/54ee8ae7cb6a2.jpg','./public/attachment/201502/26/10/54ee8aee438cc.jpg','8','1422730490','1614279292','10','15','1','500','0','0','0','2','1','盛世经典牛排50元代金券','1','0','','1','0','餐饮美食,甜点,西餐','ux39184ux39278ux32654ux39135,ux29980ux28857,ux35199ux39184','福建,福州,台江区,宝龙,东区,店面,广场,工业,城市,193,149,台江区工业路193号宝龙城市广场东区1楼149号店面,宝龙城市广场','ux31119ux24314,ux31119ux24030,ux21488ux27743ux21306,ux23453ux40857,ux19996ux21306,ux24215ux38754,ux24191ux22330,ux24037ux19994,ux22478ux24066,ux49ux57ux51,ux49ux52ux57,ux21488ux27743ux21306ux24037ux19994ux36335ux49ux57ux51ux21495ux23453ux40857ux22478ux24066ux24191ux22330ux19996ux21306ux49ux27004ux49ux52ux57ux21495ux24215ux38754,ux23453ux40857ux22478ux24066ux24191ux22330','元代,牛排,盛世,经典,金券,盛世经典牛排50元代金券','ux20803ux20195,ux29275ux25490,ux30427ux19990,ux32463ux20856,ux37329ux21048,ux30427ux19990ux32463ux20856ux29275ux25490ux53ux48ux20803ux20195ux37329ux21048','119.299095','26.068075','0','25','1424890637','0','0','1','盛世经典牛排50元代金券','<div align=\"center\"><p><img src=\"./public/attachment/201502/26/10/54ee8aee438cc.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p><img src=\"./public/attachment/201502/26/10/54ee8b6215a0c.jpg\" alt=\"\" border=\"0\" /></p>\r\n<p><img src=\"./public/attachment/201502/26/10/54ee8b6d37663.jpg\" alt=\"\" border=\"0\" /><br />\r\n</p>\r\n</div>\r\n','','./public/attachment/201502/26/10/54ee8aee438cc.jpg','640','427','台江区工业路193号宝龙城市广场东区1楼149号店面','0','1.0000','10','100','0','0','0','0','0','0','0.0000','0','每名消费者每天只能使用一张','0','2','5','1000');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('22','一元吃肯德基','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','8','0','0','30','18','1','0','0','0','0','3','1','一元吃肯德基','1','0','','0','0','餐饮美食,西餐','ux39184ux39278ux32654ux39135,ux35199ux39184','北京,鼓楼区,八一七北路,福建,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux21271ux20140,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux31119ux24314,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','肯德基,一元,一元吃肯德基','ux32943ux24503ux22522,ux19968ux20803,ux19968ux20803ux21507ux32943ux24503ux22522','119.304968','26.093466','0','24','1424891541','0','0','1','一元吃肯德基','<img src=\"./public/attachment/201502/26/11/54ee8f12288b3.jpg\" alt=\"\" border=\"0\" />','','./public/attachment/201502/26/11/54ee8eb6c0e75.jpg','0','0','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','0','0','0','0','0','0','0','0','0.0000','0','','0','5','0','0');
INSERT INTO `%DB_PREFIX%youhui` VALUES ('23','华莱士30元抵用券','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','8','1422731727','1582658131','50','15','1','30','0','1','0','4','1','','0','0','','0','0','餐饮美食,西餐','ux39184ux39278ux32654ux39135,ux35199ux39184','福建,福州,鼓楼区,八一七北路,供销,二楼,大厦,鼓楼区八一七北路68号福建供销大厦二楼,东街口,台江区,万象,工业,378,台江区工业路378号万象城1楼,宝龙城市广场,万象城','ux31119ux24314,ux31119ux24030,ux40723ux27004ux21306,ux20843ux19968ux19971ux21271ux36335,ux20379ux38144,ux20108ux27004,ux22823ux21414,ux40723ux27004ux21306ux20843ux19968ux19971ux21271ux36335ux54ux56ux21495ux31119ux24314ux20379ux38144ux22823ux21414ux20108ux27004,ux19996ux34903ux21475,ux21488ux27743ux21306,ux19975ux35937,ux24037ux19994,ux51ux55ux56,ux21488ux27743ux21306ux24037ux19994ux36335ux51ux55ux56ux21495ux19975ux35937ux22478ux49ux27004,ux23453ux40857ux22478ux24066ux24191ux22330,ux19975ux35937ux22478','华莱士,华莱士30元抵用券','ux21326ux33713ux22763,ux21326ux33713ux22763ux51ux48ux20803ux25269ux29992ux21048','119.304968','26.093466','0','24','1424891792','0','0','1','华莱士30元抵用券','','','./public/attachment/201502/26/11/54ee8fc5497f9.jpg','460','279','鼓楼区八一七北路68号福建供销大厦二楼','0','0.0000','10','100','0','0','0','0','0','0','0.0000','0','','2','1','5','0');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_biz_submit`;
CREATE TABLE `%DB_PREFIX%youhui_biz_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `icon` varchar(255) NOT NULL COMMENT '列表展示用图',
  `image` varchar(255) NOT NULL COMMENT '大图',
  `deal_cate_id` int(11) NOT NULL COMMENT '所属的生活服务大分类ID',
  `begin_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `expire_day` int(11) NOT NULL COMMENT '领取后的过期时间(0表示以优惠券结束时间为依据)，如优惠券结束时间也为0则不过期',
  `city_id` int(11) NOT NULL COMMENT '所属城市ID',
  `send_type` tinyint(1) NOT NULL COMMENT '弃用',
  `total_num` int(11) NOT NULL COMMENT '总条数(限制下载用（针对验证类型的优惠券）)',
  `sms_count` int(11) NOT NULL COMMENT '弃用',
  `print_count` int(11) NOT NULL COMMENT '弃用',
  `view_count` int(11) NOT NULL COMMENT '弃用',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sms_content` varchar(255) NOT NULL COMMENT '短信下载优惠券的短信内容',
  `is_sms` tinyint(1) NOT NULL COMMENT '是否支持短信下载',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '弃用',
  `brief` text NOT NULL COMMENT '内容、条款',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL COMMENT '消费的总金额（由商家验证时填写累加）',
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL COMMENT '分类的全文索引',
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL COMMENT '地区信息的全文索引',
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL COMMENT '名称的全文索引',
  `xpoint` varchar(255) NOT NULL COMMENT '经度',
  `ypoint` varchar(255) NOT NULL COMMENT '纬度',
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `brand_id` int(11) NOT NULL COMMENT '弃用',
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐',
  `list_brief` text NOT NULL COMMENT '优惠券列表简介',
  `description` text NOT NULL COMMENT '详情描述',
  `index_img` varchar(255) NOT NULL COMMENT '弃用',
  `image_3` varchar(255) NOT NULL COMMENT '手机端用图',
  `image_3_w` int(11) NOT NULL COMMENT '手机端用图宽',
  `image_3_h` int(11) NOT NULL COMMENT '手机端用图高',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `publish_wait` tinyint(1) NOT NULL COMMENT '0:待审核  1:已审核 ',
  `return_money` decimal(11,4) NOT NULL COMMENT '备用',
  `return_score` int(11) NOT NULL COMMENT '备用',
  `return_point` int(11) NOT NULL COMMENT '备用',
  `dp_count_1` int(11) NOT NULL COMMENT '一星点评数',
  `dp_count_2` int(11) NOT NULL COMMENT '2星点评数',
  `dp_count_3` int(11) NOT NULL COMMENT '3星点评数',
  `dp_count_4` int(11) NOT NULL COMMENT '4星点评数',
  `dp_count_5` int(11) NOT NULL COMMENT '5星点评数',
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `use_notice` text NOT NULL COMMENT '使用需知',
  `user_count` int(11) NOT NULL COMMENT '总下载次数',
  `user_limit` int(11) NOT NULL COMMENT '每个会员的下载限制',
  `score_limit` int(11) NOT NULL COMMENT '下载优惠券所消耗的积分',
  `point_limit` int(11) NOT NULL COMMENT '下载优惠券所需的经验，不扣除',
  `cache_deal_cate_type_youhui_link` text NOT NULL COMMENT '序列化子分类列表',
  `cache_youhui_location_link` text NOT NULL COMMENT '序列化支持的门店',
  `account_id` int(11) NOT NULL COMMENT '提交数据的商户帐号关联ID',
  `youhui_id` int(11) NOT NULL COMMENT '关联优惠主表的数据ID',
  `biz_apply_status` tinyint(1) NOT NULL COMMENT '商户申请状态 1.新品上架申请 2:修改 3:下架',
  `admin_check_status` tinyint(1) NOT NULL COMMENT '管理员审核状态 0 待审核 1 通过 2 拒绝',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`),
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商户中心发布优惠券临时表';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_dp_point_result`;
CREATE TABLE `%DB_PREFIX%youhui_dp_point_result` (
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `point` int(11) NOT NULL COMMENT '分数',
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  `dp_id` int(11) NOT NULL COMMENT '点评ID',
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `youhui_id` (`youhui_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每个优惠券，每条点评针对每个评分分组的点评评分';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_dp_tag_result`;
CREATE TABLE `%DB_PREFIX%youhui_dp_tag_result` (
  `tags` varchar(255) NOT NULL COMMENT '标签列表 空格分隔',
  `dp_id` int(11) NOT NULL COMMENT '关联的点评ID',
  `group_id` int(11) NOT NULL COMMENT '标签分组ID',
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  KEY `dp_id` (`dp_id`),
  KEY `group_id` (`group_id`),
  KEY `youhui_id` (`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券按预定义的分组打标签的结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_location_link`;
CREATE TABLE `%DB_PREFIX%youhui_location_link` (
  `youhui_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`youhui_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券支持的门店关联表';
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('20','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('20','24');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('21','25');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('22','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('22','24');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('23','23');
INSERT INTO `%DB_PREFIX%youhui_location_link` VALUES ('23','24');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_log`;
CREATE TABLE `%DB_PREFIX%youhui_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youhui_id` int(11) NOT NULL COMMENT '优惠券ID',
  `youhui_sn` varchar(255) NOT NULL COMMENT '短信生成的优惠券序列号',
  `user_id` int(11) NOT NULL COMMENT '下载的会员ID',
  `order_count` int(5) NOT NULL COMMENT '订餐人数',
  `is_private_room` tinyint(1) NOT NULL COMMENT '是否包间',
  `mobile` varchar(255) NOT NULL COMMENT '下载的手机号',
  `date_time` int(11) NOT NULL COMMENT '预订时间',
  `confirm_id` int(11) NOT NULL COMMENT '确认使用的商家ID',
  `total_fee` int(11) NOT NULL COMMENT '消费金额',
  `create_time` int(11) NOT NULL COMMENT '下载时间',
  `confirm_time` int(11) NOT NULL COMMENT '确认时间',
  `dp_id` int(11) NOT NULL COMMENT '为优惠券点评的ID',
  `location_id` int(11) NOT NULL COMMENT '优惠券消费门店ID',
  `return_money` decimal(20,4) NOT NULL COMMENT '验证返现',
  `return_score` int(11) NOT NULL COMMENT '验证返积分',
  `return_point` int(11) NOT NULL COMMENT '验证返经验',
  `expire_time` int(11) NOT NULL COMMENT '优惠券验证的过期时间0为无限期',
  `sms_count` int(11) NOT NULL COMMENT '短信通知的次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`youhui_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='优惠券短信下载记录';
INSERT INTO `%DB_PREFIX%youhui_log` VALUES ('52','20','32320441','71','0','0','13333333333','0','0','0','1424886836','0','0','0','0.0000','10','100','1425750836','0');
INSERT INTO `%DB_PREFIX%youhui_log` VALUES ('53','23','91723490','71','0','0','13333333333','0','0','0','1424891808','0','0','0','0.0000','10','100','1429211808','0');
INSERT INTO `%DB_PREFIX%youhui_log` VALUES ('54','23','53323736','74','0','0','','0','0','0','1435135046','0','0','0','0.0000','10','100','1439455046','0');
DROP TABLE IF EXISTS `%DB_PREFIX%youhui_sc`;
CREATE TABLE `%DB_PREFIX%youhui_sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端优惠券收藏表';
