-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:24
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 4


DROP TABLE IF EXISTS `%DB_PREFIX%medal`;
CREATE TABLE `%DB_PREFIX%medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '勋章接口名',
  `name` varchar(255) NOT NULL COMMENT '显示名称',
  `description` text NOT NULL COMMENT '勋章的描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `config` text NOT NULL COMMENT '不同勋章接口功能的配置信息',
  `icon` varchar(255) NOT NULL COMMENT '勋章图片',
  `image` varchar(255) NOT NULL COMMENT '备用',
  `route` text NOT NULL COMMENT '勋章获取规则的描述文字',
  `allow_check` tinyint(1) NOT NULL COMMENT '是否会被系统回收 0:不会 1:会',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统内勋章体系配置表';
INSERT INTO `%DB_PREFIX%medal` VALUES ('1','Groupuser','组长勋章','点亮表示您为组长','1','N;','./public/attachment/201203/17/15/4f6438e27aa65.png','','申请成为小组组长即可点亮该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('2','Keepsign','忠实网友勋章','点亮为忠实的网友会员','1','a:1:{s:9:\"day_count\";s:2:\"10\";}','./public/attachment/201203/17/15/4f6438f0af2c6.png','','连续签到10天以上将获得该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('3','Newuser','新手勋章','点亮您为新手，让更多的朋友找到你','1','N;','./public/attachment/201203/17/15/4f643902cd067.png','','完善用户的所有资料，即可获取该勋章','1');
INSERT INTO `%DB_PREFIX%medal` VALUES ('4','Sinabind','新浪微博勋章','新浪微博认证勋章，点亮为新浪微博用户','1','N;','./public/attachment/201203/17/15/4f64391478be2.png','','绑定新浪微博即可获得该勋章','0');
INSERT INTO `%DB_PREFIX%medal` VALUES ('5','Tencentbind','腾讯微博勋章','腾讯微博认证勋章，点亮为腾讯微博用户','1','N;','./public/attachment/201203/17/15/4f6439210f17b.png','','绑定腾讯微博即可获得该勋章','0');
DROP TABLE IF EXISTS `%DB_PREFIX%message`;
CREATE TABLE `%DB_PREFIX%message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '留言标题',
  `content` text NOT NULL COMMENT '留言内容',
  `create_time` int(11) NOT NULL COMMENT '留言时间',
  `update_time` int(11) NOT NULL COMMENT '回复时间',
  `admin_reply` text NOT NULL COMMENT '管理员回复内容',
  `admin_id` int(11) NOT NULL COMMENT '回复管理员ID',
  `rel_table` varchar(255) NOT NULL COMMENT '相关的数据表/模块（如活动留言event，商品留言deal）',
  `rel_id` int(11) NOT NULL COMMENT '相关留言的数据ID',
  `user_id` int(11) NOT NULL COMMENT '留言会员ID',
  `pid` int(11) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识（自动生效的留言自动为1），审核生效的留言为0',
  `city_id` int(11) NOT NULL COMMENT '提交商务合作留言的城市ID（基本弃用，商务合作由商家入驻取代）',
  `is_buy` tinyint(1) NOT NULL COMMENT '是否为消费后留言（即点评） ',
  `contact_name` varchar(255) NOT NULL COMMENT '商务合作提交时的联系人姓名',
  `contact` varchar(255) NOT NULL COMMENT '商务合作提交时的联系方式',
  `point` int(11) NOT NULL COMMENT '部份留言功能需要的评分',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:商家未阅读;1:商家已阅读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='留言表';
INSERT INTO `%DB_PREFIX%message` VALUES ('98','退款申请','退款申请：不合适要求退款','1424891043','0','','0','deal_order','27','71','0','0','0','0','','','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%message_type`;
CREATE TABLE `%DB_PREFIX%message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '预设的代码用于留言表中的rel_table',
  `is_fix` tinyint(1) NOT NULL COMMENT '系统内置类型，1:不可删除该类型 0:可删除',
  `show_name` varchar(255) NOT NULL COMMENT '类型显示名称 主要在留言板页面显示',
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='留言类型';
INSERT INTO `%DB_PREFIX%message_type` VALUES ('1','deal','1','商品评论','1','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('2','deal_order','1','订单留言','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('3','feedback','1','意见反馈','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('4','seller','1','商务合作','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('6','tx','1','提现申请','0','0');
INSERT INTO `%DB_PREFIX%message_type` VALUES ('10','faq','1','问题答疑','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%mobile_list`;
CREATE TABLE `%DB_PREFIX%mobile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `city_id` int(11) NOT NULL COMMENT '订阅城市ID（按地区群发时匹配）',
  `verify_code` varchar(255) NOT NULL COMMENT '验证码',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  PRIMARY KEY (`id`),
  KEY `mobile_idx` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='手机订阅表';
DROP TABLE IF EXISTS `%DB_PREFIX%msg_box`;
CREATE TABLE `%DB_PREFIX%msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `user_id` int(11) NOT NULL COMMENT '消息所属的会员',
  `create_time` int(11) NOT NULL COMMENT '发信时间',
  `is_read` tinyint(1) NOT NULL COMMENT '是否已读 0:未读 1:已读',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否被用户删除',
  `type` varchar(200) NOT NULL COMMENT '消息接口类型:SystemMsg/OrderMsg等，实现来源于接口调用',
  `data` text NOT NULL COMMENT '消息相关数据集，序列化后用于接口调用',
  `data_id` int(11) NOT NULL COMMENT '相关数据的ID,可为0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_read` (`is_read`),
  KEY `is_delete` (`is_delete`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='新的会员站内信表';
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('29','恭喜您，您已经成为幼儿园。','71','1424821575','1','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('30','成功充值&yen;10000','71','1424886396','1','0','notify','','25');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('31','订单2015022610000323付款成功','71','1424887216','1','0','orderitem','','79');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('37','很好分享被置顶+10经验','71','1424907966','0','0','topic','','221');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('32','订单2015022610592583付款成功','71','1424890765','1','0','orderitem','','80');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('33','消费券验证成功','71','1424890988','1','0','orderitem','','79');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('34','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]退款成功 &yen;69 ','71','1424891134','1','0','orderitem','','80');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('35','仅售24.8元！价值168元的超人新款静音理发器1个，超静音，不夹发，儿童成人皆可用！买就送4个定位梳+润滑油+清洁刷！发货了，发货单号：556644525','71','1424893196','1','0','orderitem','','81');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('36','恭喜您，您已经成为幼儿园。','72','1424906529','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('38','分享被推荐+10经验','71','1424908015','0','0','topic','','216');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('39','您的新手勋章已过期了，被系统回收','71','1427481377','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('40','消费券验证成功','0','1434416612','0','0','orderitem','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('41','订单2015061605081890付款成功','71','1434416898','0','0','orderitem','','82');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('60','订单经管理员审核，确认收货','82','1437540278','0','0','orderitem','','84');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('58','恭喜您，您已经成为幼儿园。','83','1437172358','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('42','订单2015061605120933付款成功','71','1434417129','0','0','orderitem','','83');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('59','仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫等发货了，发货单号：0','82','1437461495','0','0','orderitem','','84');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('63','恭喜您，您已经成为幼儿园。','85','1437904158','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('57','仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫等发货了，发货单号：23456789','82','1437092792','0','0','orderitem','','84');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('43','消费券验证成功','71','1434417199','0','0','orderitem','','83');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('44','恭喜您，您已经成为幼儿园。','73','1434934329','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('45','恭喜您，您已经成为幼儿园。','74','1435135035','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('46','恭喜您，您已经成为幼儿园。','75','1435178537','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('47','恭喜您，您已经成为普通会员。','76','1435306431','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('48','恭喜您，您已经成为幼儿园。','76','1435306431','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('49','恭喜您，您已经成为幼儿园。','77','1435352093','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('50','恭喜您，您已经成为幼儿园。','78','1435606091','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('51','恭喜您，您已经成为普通会员。','79','1435791574','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('52','恭喜您，您已经成为幼儿园。','79','1435791574','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('53','恭喜您，您已经成为幼儿园。','80','1435801063','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('54','恭喜您，您已经成为幼儿园。','81','1436243642','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('55','恭喜您，您已经成为幼儿园。','82','1437092555','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('56','订单2015071704240230付款成功','82','1437092642','0','0','orderitem','','84');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('61','恭喜您，您已经成为幼儿园。','84','1437867491','0','0','notify','','0');
INSERT INTO `%DB_PREFIX%msg_box` VALUES ('62','订单2015072603384997付款成功','84','1437867529','0','0','orderitem','','85');
DROP TABLE IF EXISTS `%DB_PREFIX%msg_system`;
CREATE TABLE `%DB_PREFIX%msg_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发放时间点',
  `user_names` text NOT NULL COMMENT '群发的用户名列表，逗号分隔(为空表示发给所有人)',
  `user_ids` text NOT NULL COMMENT 'user_id的全文索引',
  `end_time` int(11) NOT NULL COMMENT '过期时间点',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `user_ids` (`user_ids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内信群发数据表';
DROP TABLE IF EXISTS `%DB_PREFIX%msg_template`;
CREATE TABLE `%DB_PREFIX%msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称标识',
  `content` text NOT NULL COMMENT '模板内容',
  `type` tinyint(1) NOT NULL COMMENT '类型 0:短信 1:邮件',
  `is_html` tinyint(1) NOT NULL COMMENT '针对邮件设置的是否超文本标识',
  `is_allow_app` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不允许发给app;1:允许发给app',
  `is_allow_wx` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不允许发给wx;1:允许发给wx',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='系统邮件、短信模板';
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('1','TPL_MAIL_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_name}已购买成功，团购券序列号{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('2','TPL_SMS_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}已购买成功，团购券序列号{$coupon.password},有效期为{$coupon.begin_time_format}到{$coupon.end_time_format}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('3','TPL_MAIL_USER_VERIFY','{$user.user_name}你好，请点击以下链接验证你的会员身份\r\n</p>\r\n<a href=\'{$user.verify_url}\'>{$user.verify_url}</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('4','TPL_MAIL_USER_PASSWORD','{$user.user_name}你好，请点击以下链接修改您的密码\r\n</p>\r\n<a href=\'{$user.password_url}\'>{$user.password_url}</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('5','TPL_SMS_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('6','TPL_MAIL_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('7','TPL_SMS_DELIVERY','{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('8','TPL_MAIL_DELIVERY','{$delivery_notice.user_name}你好,你所下订单{$delivery_notice.order_sn}的商品{$delivery_notice.deal_names}于{$delivery_notice.delivery_time_format}发货成功,发货单号{$delivery_notice.notice_sn}','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('9','TPL_SMS_VERIFY_CODE','你的手机号为{$verify.mobile},验证码为{$verify.code}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('10','TPL_DEAL_NOTICE_SMS','{$notice.site_name}又有新团购啦!{$notice.deal_name},欢迎来抢团{$notice.site_url}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('11','TPL_MAIL_UNSUBSCRIBE','您好，您确定要退订{$mail.mail_address}吗？要退订请点击<a href=\"{$mail.url}\">完成退订</a>','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('12','TPL_SMS_USE_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_sub_name}，团购券{$coupon.password}，已于{$coupon.confirm_time_format}使用','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('13','TPL_MAIL_USE_COUPON','{$coupon.user_name}你好! 你购买的{$coupon.deal_name}，团购券{$coupon.password}，已于{$coupon.confirm_time_format}使用','1','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('14','TPL_SMS_LOTTERY','{$lottery.user_name}你好! 你参加的{$lottery.deal_sub_name}，抽奖号为{$lottery.lottery_sn}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('15','TPL_SMS_SCORE','{$username}你好! 你支付的订单{$order_sn}{$score_value}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('16','TPL_MAIL_SCORE','{$username}你好! 你支付的订单{$order_sn}{$score_value}','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('17','TPL_SMS_EVENT_SN','{$event.user_name}你好! 你报名的{$event.name}已确认，序列号{$event.sn},有效期为{$event.begin_time_format}到{$event.end_time_format}','0','0','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('18','TPL_MAIL_EVENT_SN','{$event.user_name}你好! 你报名的{$event.name}已确认，序列号{$event.sn},有效期为{$event.begin_time_format}到{$event.end_time_format}','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('19','TPL_SMS_SUPPLIER_ORDER','{$supplier_name}，您有一笔新的订单{$order_sn}，请及时处理。','0','0','1','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('20','TPL_USER_WITHDRAW_SMS','{$user_name}您好，你的提现申请已通过，{$money_format}已经转入您指定账户。','0','0','1','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('21','TPL_USER_WITHDRAW_MAIL','{$user_name}您好，你的提现申请已通过，{$money_format}已经转入您指定账户。','1','1','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('22','TPL_SUPPLIER_WITHDRAW_SMS','{$supplier_name}您好，{$money_format}已经转入您指定账户。','0','0','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%nav`;
CREATE TABLE `%DB_PREFIX%nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '跳转的外链URL',
  `blank` tinyint(1) NOT NULL COMMENT '是否在新窗口打开',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `u_module` varchar(255) NOT NULL COMMENT '指向的前台module',
  `u_action` varchar(255) NOT NULL COMMENT '指向的前台action',
  `u_id` int(11) NOT NULL COMMENT '弃用',
  `u_param` varchar(255) NOT NULL COMMENT 'url的参数，以原始的url传参方式填入 如：id=1&cid=2&pid=3',
  `is_shop` tinyint(1) NOT NULL COMMENT '菜单显示的频道 0:全部显示 1:团购频道 2:商城频道 3:优惠券频道',
  `app_index` varchar(255) NOT NULL COMMENT '指向的前台app应用入口',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单配置表';
INSERT INTO `%DB_PREFIX%nav` VALUES ('32','团购','','0','0','1','tuan','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('20','首页','','0','5','1','mall','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('31','商城','','0','0','1','mall','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('33','活动','','0','0','1','events','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('34','商家','','0','0','1','stores','index','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('35','达人秀','','0','0','1','daren','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('36','小组','','0','0','1','group','index','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('37','发现','','0','0','1','discover','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('39','优惠券','','0','0','1','youhuis','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('42','积分商城','','0','0','1','scores','','0','','0','index');
INSERT INTO `%DB_PREFIX%nav` VALUES ('43','身边团购','','1','0','1','position','','0','','0','index');
DROP TABLE IF EXISTS `%DB_PREFIX%payment`;
CREATE TABLE `%DB_PREFIX%payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '支付接口类名',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `online_pay` tinyint(1) NOT NULL COMMENT '是否为在线支付的接口',
  `fee_amount` double(20,4) NOT NULL COMMENT '手续费用的计费值',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `total_amount` double(20,4) NOT NULL,
  `config` text NOT NULL COMMENT '相关的配置信息',
  `logo` varchar(255) NOT NULL COMMENT '显示的图标',
  `sort` int(11) NOT NULL,
  `fee_type` tinyint(1) NOT NULL COMMENT '手续费的计费标准 0:定额 1:支付总额的比率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='支付接口表';
INSERT INTO `%DB_PREFIX%payment` VALUES ('17','Account','1','1','0.0000','余额支付','','355.8000','N;','','1','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('18','AlipayBank','1','1','0.0000','支付宝银行直连支付','','10113.0000','a:4:{s:14:\"alipay_partner\";s:0:\"\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_gateway\";a:17:{s:7:\"ICBCB2C\";s:1:\"1\";s:3:\"CMB\";s:1:\"1\";s:3:\"CCB\";s:1:\"1\";s:3:\"ABC\";s:1:\"1\";s:4:\"SPDB\";s:1:\"1\";s:3:\"SDB\";s:1:\"1\";s:3:\"CIB\";s:1:\"1\";s:6:\"BJBANK\";s:1:\"1\";s:7:\"CEBBANK\";s:1:\"1\";s:4:\"CMBC\";s:1:\"1\";s:5:\"CITIC\";s:1:\"1\";s:3:\"GDB\";s:1:\"1\";s:7:\"SPABANK\";s:1:\"1\";s:6:\"BOCB2C\";s:1:\"1\";s:4:\"COMM\";s:1:\"1\";s:7:\"ICBCBTB\";s:1:\"1\";s:10:\"PSBC-DEBIT\";s:1:\"1\";}}','','2','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('19','Voucher','1','1','0.0000','代金券支付','','0.0000','N;','','3','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('20','Walipay','1','4','0.0600','支付宝手机支付(WAP版本)','','0.0000','a:3:{s:14:\"alipay_partner\";s:9:\"111111111\";s:14:\"alipay_account\";s:10:\"1111111111\";s:10:\"alipay_key\";s:11:\"11111111111\";}','','4','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('21','Wwxjspay','1','2','0.0000','微信支付(WAP版本)','','0.0000','a:4:{s:5:\"appid\";s:0:\"\";s:9:\"appsecret\";s:0:\"\";s:5:\"mchid\";s:0:\"\";s:3:\"key\";s:0:\"\";}','','5','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('22','Alipay','1','1','5.0000','支付宝支付','','0.0000','a:4:{s:14:\"alipay_partner\";s:0:\"\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";s:14:\"alipay_service\";s:1:\"0\";}','','6','0');
DROP TABLE IF EXISTS `%DB_PREFIX%payment_notice`;
CREATE TABLE `%DB_PREFIX%payment_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL COMMENT '支付单号',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `pay_time` int(11) NOT NULL COMMENT '付款时间',
  `order_id` int(11) NOT NULL COMMENT '关联的订单号ID',
  `is_paid` tinyint(1) NOT NULL COMMENT '是否已支付',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `payment_id` int(11) NOT NULL COMMENT '支付接口ID',
  `memo` text NOT NULL COMMENT '付款单备注',
  `money` decimal(20,4) NOT NULL COMMENT '应付金额',
  `outer_notice_sn` varchar(255) NOT NULL COMMENT '第三方支付平台的对帐号',
  `ecv_id` int(11) NOT NULL COMMENT '代金券ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_sn_unk` (`notice_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='支付单表';
INSERT INTO `%DB_PREFIX%payment_notice` VALUES ('99','2015061605081838','1434416898','1434416898','28','1','71','17','','108.0000','','0');
INSERT INTO `%DB_PREFIX%payment_notice` VALUES ('100','2015061605120942','1434417129','1434417129','29','1','71','17','','113.0000','','0');
INSERT INTO `%DB_PREFIX%payment_notice` VALUES ('101','2015071704240212','1437092642','1437092642','30','1','82','17','','39.0000','','0');
INSERT INTO `%DB_PREFIX%payment_notice` VALUES ('102','2015072603400795','1437867607','0','32','0','84','18','','1.0000','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group`;
CREATE TABLE `%DB_PREFIX%point_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='点评评分分组配置表';
INSERT INTO `%DB_PREFIX%point_group` VALUES ('3','口味','100');
INSERT INTO `%DB_PREFIX%point_group` VALUES ('4','服务','100');
INSERT INTO `%DB_PREFIX%point_group` VALUES ('5','质量','100');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_elink`;
CREATE TABLE `%DB_PREFIX%point_group_elink` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与活动大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('3','3');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','1');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','2');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','3');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','4');
INSERT INTO `%DB_PREFIX%point_group_elink` VALUES ('4','5');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_link`;
CREATE TABLE `%DB_PREFIX%point_group_link` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与生活分服大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('3','8');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','17');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','16');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','15');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','14');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','13');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','11');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','10');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','9');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('4','8');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_slink`;
CREATE TABLE `%DB_PREFIX%point_group_slink` (
  `point_group_id` int(11) NOT NULL COMMENT '评分分组ID',
  `category_id` int(11) NOT NULL COMMENT '生活服务大分类ID',
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点评评分分组与商城大分类的关联表';
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','29');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','28');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','27');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','26');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','25');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','24');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','30');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','31');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','32');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','33');
INSERT INTO `%DB_PREFIX%point_group_slink` VALUES ('5','35');
DROP TABLE IF EXISTS `%DB_PREFIX%promote`;
CREATE TABLE `%DB_PREFIX%promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '促销活动接口类名',
  `sort` int(11) NOT NULL COMMENT '促销活动的优先级 小到大(多个促销活动生效时，由排序较小的先开始计算，优先生效)',
  `config` text NOT NULL COMMENT '促销活动的配置信息',
  `description` text NOT NULL COMMENT '活动描述（用于订单中记录当前所享受的促销优惠的描述）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='促销活动接口安装表';
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg`;
CREATE TABLE `%DB_PREFIX%promote_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '群发推广信息类型(0:短信 1:邮件)',
  `title` varchar(255) NOT NULL COMMENT '群发信息（邮件标题）',
  `content` text NOT NULL COMMENT '群发的内容',
  `send_time` int(11) NOT NULL COMMENT '设置的自动发送的时间',
  `send_status` tinyint(1) NOT NULL COMMENT '发送状态 0:未发送 1:发送中 2:已发送',
  `deal_id` int(11) NOT NULL COMMENT '针对某个商品发送的推广信息',
  `send_type` tinyint(1) NOT NULL COMMENT '发送方式（0:按会员组 1:按订阅地区发送 2:自定义发送，即指定邮箱、手机发送）',
  `send_type_id` int(11) NOT NULL COMMENT '发送类型为按会员组时：会员组ID，发送类型为按地区时：城市ID',
  `send_define_data` text NOT NULL COMMENT '自定义发送时存放指定的邮箱地址、手机号，用半角逗号分隔',
  `is_html` tinyint(1) NOT NULL COMMENT '群发为邮件时的邮件类型，是否为超文本邮件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='群发推广信息';
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg_list`;
CREATE TABLE `%DB_PREFIX%promote_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL COMMENT '发送的目标(邮件地址/手机号)',
  `send_type` tinyint(1) NOT NULL COMMENT '发送类型 0:短信 1:邮件',
  `content` text NOT NULL COMMENT '信息内容',
  `title` varchar(255) NOT NULL COMMENT '邮件的标题',
  `send_time` int(11) NOT NULL COMMENT '发送的时间',
  `is_send` tinyint(1) NOT NULL COMMENT '是否已发送 0:否 1:等待队列发送',
  `create_time` int(11) NOT NULL COMMENT '生成的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `result` text NOT NULL COMMENT '发送结果（如出错存放服务器或接口返回的错误信息）',
  `is_success` tinyint(1) NOT NULL COMMENT '是否发送成功',
  `is_html` tinyint(1) NOT NULL COMMENT '只针对邮件使用，是否为超文本邮件 0:否 1:是',
  `msg_id` int(11) NOT NULL COMMENT '群发信息的原消息ID promote_msg表的数据ID',
  PRIMARY KEY (`id`),
  KEY `dest_idx` (`dest`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推广群发的发送队列表';
DROP TABLE IF EXISTS `%DB_PREFIX%referrals`;
CREATE TABLE `%DB_PREFIX%referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '邀请人ID（即需要返利的会员ID）',
  `rel_user_id` int(11) NOT NULL COMMENT '被邀请人ID',
  `money` double(20,4) NOT NULL COMMENT '返利的现金',
  `create_time` int(11) NOT NULL COMMENT '返利生成的时间',
  `pay_time` int(11) NOT NULL COMMENT '返利发放的时间',
  `order_id` int(11) NOT NULL COMMENT '关联的订单ID',
  `score` int(11) NOT NULL COMMENT '返利的积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='邀请返利记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%region_conf`;
CREATE TABLE `%DB_PREFIX%region_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级地区ID',
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '2:省 3:市(县)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3401 DEFAULT CHARSET=utf8 COMMENT='地区信息表（会员资料修改中用到的地区信息）';
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3','1','安徽','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('4','1','福建','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('5','1','甘肃','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('6','1','广东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('7','1','广西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('8','1','贵州','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('9','1','海南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('10','1','河北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('11','1','河南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('12','1','黑龙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('13','1','湖北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('14','1','湖南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('15','1','吉林','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('16','1','江苏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('17','1','江西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('18','1','辽宁','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('19','1','内蒙古','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('20','1','宁夏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('21','1','青海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('22','1','山东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('23','1','山西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('24','1','陕西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('26','1','四川','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('28','1','西藏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('29','1','新疆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('30','1','云南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('31','1','浙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('36','3','安庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('37','3','蚌埠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('38','3','巢湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('39','3','池州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('40','3','滁州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('41','3','阜阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('42','3','淮北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('43','3','淮南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('44','3','黄山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('45','3','六安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('46','3','马鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('47','3','宿州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('48','3','铜陵','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('49','3','芜湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('50','3','宣城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('51','3','亳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('52','2','北京','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('53','4','福州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('54','4','龙岩','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('55','4','南平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('56','4','宁德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('57','4','莆田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('58','4','泉州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('59','4','三明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('60','4','厦门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('61','4','漳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('62','5','兰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('63','5','白银','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('64','5','定西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('65','5','甘南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('66','5','嘉峪关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('67','5','金昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('68','5','酒泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('69','5','临夏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('70','5','陇南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('71','5','平凉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('72','5','庆阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('73','5','天水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('74','5','武威','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('75','5','张掖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('76','6','广州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('77','6','深圳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('78','6','潮州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('79','6','东莞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('80','6','佛山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('81','6','河源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('82','6','惠州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('83','6','江门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('84','6','揭阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('85','6','茂名','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('86','6','梅州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('87','6','清远','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('88','6','汕头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('89','6','汕尾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('90','6','韶关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('91','6','阳江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('92','6','云浮','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('93','6','湛江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('94','6','肇庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('95','6','中山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('96','6','珠海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('97','7','南宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('98','7','桂林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('99','7','百色','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('100','7','北海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('101','7','崇左','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('102','7','防城港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('103','7','贵港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('104','7','河池','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('105','7','贺州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('106','7','来宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('107','7','柳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('108','7','钦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('109','7','梧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('110','7','玉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('111','8','贵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('112','8','安顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('113','8','毕节','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('114','8','六盘水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('115','8','黔东南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('116','8','黔南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('117','8','黔西南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('118','8','铜仁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('119','8','遵义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('120','9','海口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('121','9','三亚','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('122','9','白沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('123','9','保亭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('124','9','昌江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('125','9','澄迈县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('126','9','定安县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('127','9','东方','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('128','9','乐东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('129','9','临高县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('130','9','陵水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('131','9','琼海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('132','9','琼中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('133','9','屯昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('134','9','万宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('135','9','文昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('136','9','五指山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('137','9','儋州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('138','10','石家庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('139','10','保定','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('140','10','沧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('141','10','承德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('142','10','邯郸','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('143','10','衡水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('144','10','廊坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('145','10','秦皇岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('146','10','唐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('147','10','邢台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('148','10','张家口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('149','11','郑州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('150','11','洛阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('151','11','开封','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('152','11','安阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('153','11','鹤壁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('154','11','济源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('155','11','焦作','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('156','11','南阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('157','11','平顶山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('158','11','三门峡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('159','11','商丘','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('160','11','新乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('161','11','信阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('162','11','许昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('163','11','周口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('164','11','驻马店','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('165','11','漯河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('166','11','濮阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('167','12','哈尔滨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('168','12','大庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('169','12','大兴安岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('170','12','鹤岗','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('171','12','黑河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('172','12','鸡西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('173','12','佳木斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('174','12','牡丹江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('175','12','七台河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('176','12','齐齐哈尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('177','12','双鸭山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('178','12','绥化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('179','12','伊春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('180','13','武汉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('181','13','仙桃','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('182','13','鄂州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('183','13','黄冈','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('184','13','黄石','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('185','13','荆门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('186','13','荆州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('187','13','潜江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('188','13','神农架林区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('189','13','十堰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('190','13','随州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('191','13','天门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('192','13','咸宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('193','13','襄樊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('194','13','孝感','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('195','13','宜昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('196','13','恩施','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('197','14','长沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('198','14','张家界','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('199','14','常德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('200','14','郴州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('201','14','衡阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('202','14','怀化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('203','14','娄底','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('204','14','邵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('205','14','湘潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('206','14','湘西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('207','14','益阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('208','14','永州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('209','14','岳阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('210','14','株洲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('211','15','长春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('212','15','吉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('213','15','白城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('214','15','白山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('215','15','辽源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('216','15','四平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('217','15','松原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('218','15','通化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('219','15','延边','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('220','16','南京','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('221','16','苏州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('222','16','无锡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('223','16','常州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('224','16','淮安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('225','16','连云港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('226','16','南通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('227','16','宿迁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('228','16','泰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('229','16','徐州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('230','16','盐城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('231','16','扬州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('232','16','镇江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('233','17','南昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('234','17','抚州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('235','17','赣州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('236','17','吉安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('237','17','景德镇','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('238','17','九江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('239','17','萍乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('240','17','上饶','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('241','17','新余','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('242','17','宜春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('243','17','鹰潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('244','18','沈阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('245','18','大连','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('246','18','鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('247','18','本溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('248','18','朝阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('249','18','丹东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('250','18','抚顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('251','18','阜新','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('252','18','葫芦岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('253','18','锦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('254','18','辽阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('255','18','盘锦','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('256','18','铁岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('257','18','营口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('258','19','呼和浩特','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('259','19','阿拉善盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('260','19','巴彦淖尔盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('261','19','包头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('262','19','赤峰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('263','19','鄂尔多斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('264','19','呼伦贝尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('265','19','通辽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('266','19','乌海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('267','19','乌兰察布市','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('268','19','锡林郭勒盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('269','19','兴安盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('270','20','银川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('271','20','固原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('272','20','石嘴山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('273','20','吴忠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('274','20','中卫','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('275','21','西宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('276','21','果洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('277','21','海北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('278','21','海东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('279','21','海南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('280','21','海西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('281','21','黄南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('282','21','玉树','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('283','22','济南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('284','22','青岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('285','22','滨州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('286','22','德州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('287','22','东营','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('288','22','菏泽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('289','22','济宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('290','22','莱芜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('291','22','聊城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('292','22','临沂','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('293','22','日照','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('294','22','泰安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('295','22','威海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('296','22','潍坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('297','22','烟台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('298','22','枣庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('299','22','淄博','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('300','23','太原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('301','23','长治','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('302','23','大同','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('303','23','晋城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('304','23','晋中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('305','23','临汾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('306','23','吕梁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('307','23','朔州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('308','23','忻州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('309','23','阳泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('310','23','运城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('311','24','西安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('312','24','安康','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('313','24','宝鸡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('314','24','汉中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('315','24','商洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('316','24','铜川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('317','24','渭南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('318','24','咸阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('319','24','延安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('320','24','榆林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('321','25','上海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('322','26','成都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('323','26','绵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('324','26','阿坝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('325','26','巴中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('326','26','达州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('327','26','德阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('328','26','甘孜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('329','26','广安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('330','26','广元','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('331','26','乐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('332','26','凉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('333','26','眉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('334','26','南充','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('335','26','内江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('336','26','攀枝花','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('337','26','遂宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('338','26','雅安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('339','26','宜宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('340','26','资阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('341','26','自贡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('342','26','泸州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('343','27','天津','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('344','28','拉萨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('345','28','阿里','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('346','28','昌都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('347','28','林芝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('348','28','那曲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('349','28','日喀则','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('350','28','山南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('351','29','乌鲁木齐','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('352','29','阿克苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('353','29','阿拉尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('354','29','巴音郭楞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('355','29','博尔塔拉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('356','29','昌吉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('357','29','哈密','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('358','29','和田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('359','29','喀什','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('360','29','克拉玛依','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('361','29','克孜勒苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('362','29','石河子','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('363','29','图木舒克','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('364','29','吐鲁番','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('365','29','五家渠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('366','29','伊犁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('367','30','昆明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('368','30','怒江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('369','30','普洱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('370','30','丽江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('371','30','保山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('372','30','楚雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('373','30','大理','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('374','30','德宏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('375','30','迪庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('376','30','红河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('377','30','临沧','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('378','30','曲靖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('379','30','文山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('380','30','西双版纳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('381','30','玉溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('382','30','昭通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('383','31','杭州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('384','31','湖州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('385','31','嘉兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('386','31','金华','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('387','31','丽水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('388','31','宁波','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('389','31','绍兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('390','31','台州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('391','31','温州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('392','31','舟山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('393','31','衢州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('394','32','重庆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('395','33','香港','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('396','34','澳门','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('397','35','台湾','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('500','52','东城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('501','52','西城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('502','52','海淀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('503','52','朝阳区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('504','52','崇文区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('505','52','宣武区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('506','52','丰台区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('507','52','石景山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('508','52','房山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('509','52','门头沟区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('510','52','通州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('511','52','顺义区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('512','52','昌平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('513','52','怀柔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('514','52','平谷区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('515','52','大兴区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('516','52','密云县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('517','52','延庆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2703','321','长宁区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2704','321','闸北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2705','321','闵行区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2706','321','徐汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2707','321','浦东新区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2708','321','杨浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2709','321','普陀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2710','321','静安区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2711','321','卢湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2712','321','虹口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2713','321','黄浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2714','321','南汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2715','321','松江区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2716','321','嘉定区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2717','321','宝山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2718','321','青浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2719','321','金山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2720','321','奉贤区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2721','321','崇明县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2912','343','和平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2913','343','河西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2914','343','南开区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2915','343','河北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2916','343','河东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2917','343','红桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2918','343','东丽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2919','343','津南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2920','343','西青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2921','343','北辰区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2922','343','塘沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2923','343','汉沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2924','343','大港区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2925','343','武清区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2926','343','宝坻区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2927','343','经济开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2928','343','宁河县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2929','343','静海县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2930','343','蓟县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3325','394','合川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3326','394','江津区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3327','394','南川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3328','394','永川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3329','394','南岸区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3330','394','渝北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3331','394','万盛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3332','394','大渡口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3333','394','万州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3334','394','北碚区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3335','394','沙坪坝区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3336','394','巴南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3337','394','涪陵区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3338','394','江北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3339','394','九龙坡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3340','394','渝中区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3341','394','黔江开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3342','394','长寿区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3343','394','双桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3344','394','綦江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3345','394','潼南县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3346','394','铜梁县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3347','394','大足县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3348','394','荣昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3349','394','璧山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3350','394','垫江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3351','394','武隆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3352','394','丰都县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3353','394','城口县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3354','394','梁平县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3355','394','开县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3356','394','巫溪县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3357','394','巫山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3358','394','奉节县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3359','394','云阳县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3360','394','忠县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3361','394','石柱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3362','394','彭水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3363','394','酉阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3364','394','秀山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3365','395','沙田区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3366','395','东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3367','395','观塘区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3368','395','黄大仙区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3369','395','九龙城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3370','395','屯门区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3371','395','葵青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3372','395','元朗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3373','395','深水埗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3374','395','西贡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3375','395','大埔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3376','395','湾仔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3377','395','油尖旺区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3378','395','北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3379','395','南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3380','395','荃湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3381','395','中西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3382','395','离岛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3383','396','澳门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3384','397','台北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3385','397','高雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3386','397','基隆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3387','397','台中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3388','397','台南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3389','397','新竹','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3390','397','嘉义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3391','397','宜兰县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3392','397','桃园县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3393','397','苗栗县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3394','397','彰化县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3395','397','南投县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3396','397','云林县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3397','397','屏东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3398','397','台东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3399','397','花莲县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3400','397','澎湖县','3');
DROP TABLE IF EXISTS `%DB_PREFIX%remind_count`;
CREATE TABLE `%DB_PREFIX%remind_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_count` int(11) NOT NULL COMMENT '分享统计',
  `topic_count_time` int(11) NOT NULL COMMENT '最后一次分享统计的时间',
  `dp_count` int(11) NOT NULL COMMENT '点评统计',
  `dp_count_time` int(11) NOT NULL COMMENT '最后一次点评统计的时间',
  `msg_count` int(11) NOT NULL COMMENT '留言统计',
  `msg_count_time` int(11) NOT NULL COMMENT '最后一次留言统计的时间',
  `buy_msg_count` int(11) NOT NULL COMMENT '购物点评统计',
  `buy_msg_count_time` int(11) NOT NULL COMMENT '最后一次购物点评统计的时间',
  `order_count` int(11) NOT NULL COMMENT '订单统计',
  `order_count_time` int(11) NOT NULL COMMENT '最后一次订单统计的时间',
  `refund_count` int(11) NOT NULL COMMENT '退款统计',
  `refund_count_time` int(11) NOT NULL COMMENT '最后一次退款统计的时间',
  `retake_count` int(11) NOT NULL COMMENT '弃用',
  `retake_count_time` int(11) NOT NULL COMMENT '弃用',
  `incharge_count` int(11) NOT NULL COMMENT '充值统计',
  `incharge_count_time` int(11) NOT NULL COMMENT '最后一次充值统计的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台首页新进数据统计的记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%role`;
CREATE TABLE `%DB_PREFIX%role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';
INSERT INTO `%DB_PREFIX%role` VALUES ('6','分站长','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%role_access`;
CREATE TABLE `%DB_PREFIX%role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `node` varchar(255) NOT NULL COMMENT '节点action名',
  `module` varchar(255) NOT NULL COMMENT '模块名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='后台角色权限配置表';
DROP TABLE IF EXISTS `%DB_PREFIX%session`;
CREATE TABLE `%DB_PREFIX%session` (
  `session_id` varchar(255) NOT NULL,
  `session_data` text NOT NULL,
  `session_time` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%shop_cate`;
CREATE TABLE `%DB_PREFIX%shop_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `brief` text NOT NULL COMMENT '分类描述',
  `pid` int(11) NOT NULL COMMENT '所属父类ID',
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `uname` varchar(255) NOT NULL COMMENT 'url别名',
  `recommend` tinyint(1) NOT NULL COMMENT '是否将该分类推荐为商城首页的分类产品模块 0:否 1:是',
  `iconfont` varchar(15) NOT NULL,
  `iconcolor` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='商城分类表';
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('24','服装','','0','0','1','1','cloth','1','','#438ccb');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('25','鞋帽','','0','0','1','14','','0','&#58892;','#00736a');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('26','手表眼镜','','0','0','1','13','','0','&#58884;','#a1410d');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('27','家居日用','','0','0','1','12','','0','','#37b44a');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('28','居家生活','','0','0','1','17','','1','&#58882;','#855fa8');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('29','母婴用品','','0','0','1','6','','1','','#f16522');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('30','女装','','24','0','1','7','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('31','男装','','24','0','1','8','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('32','家居服','','24','0','1','9','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('33','毛衣','','24','0','1','10','','0','','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('35','数码电器','','0','0','1','11','','0','&#58898;','');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('36','书包','','29','0','1','15','','0','&#58891;','#790000');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('37','玩具','','29','0','1','16','','0','&#58896;','#acd372');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('38','手机','','35','0','1','18','','0','&#58887;','#7ca6d8');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('39','小家电','','35','0','1','19','','0','&#58883;','#6ccff7');
INSERT INTO `%DB_PREFIX%shop_cate` VALUES ('40','特色小吃','','0','0','1','20','','1','','');
DROP TABLE IF EXISTS `%DB_PREFIX%sms`;
CREATE TABLE `%DB_PREFIX%sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '短信接口显示名称',
  `description` text NOT NULL COMMENT '描述',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `server_url` text NOT NULL COMMENT '接口的服务器通讯地址',
  `user_name` varchar(255) NOT NULL COMMENT '接口商验证用用户名',
  `password` varchar(255) NOT NULL COMMENT '接口商验证用密码',
  `config` text NOT NULL COMMENT '额外的配置信息',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='短信接口配置表';
INSERT INTO `%DB_PREFIX%sms` VALUES ('12','短信宝 (<a href=\'http://www.smsbao.com/reg?r=10021\' target=\'_blank\'><font color=\'red\'>还没账号？点击这免费注册</font></a>)','','smsbao','http://www.smsbao.com/sms','221115','221115','N;','1');
DROP TABLE IF EXISTS `%DB_PREFIX%sms_mobile_verify`;
CREATE TABLE `%DB_PREFIX%sms_mobile_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_phone` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `ip` varchar(100) NOT NULL COMMENT '发送短信人的IP',
  `send_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%statements`;
CREATE TABLE `%DB_PREFIX%statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income_money` decimal(20,4) NOT NULL COMMENT '收入',
  `income_order` decimal(20,4) NOT NULL COMMENT '收入中用于订单支付',
  `income_incharge` decimal(20,4) NOT NULL COMMENT '收入用于会员充值(含超额充值)',
  `out_money` decimal(20,4) NOT NULL COMMENT '支出',
  `out_uwd_money` decimal(20,4) NOT NULL COMMENT '会员提现支出',
  `out_swd_money` decimal(20,4) NOT NULL COMMENT '商户提现支出',
  `refund_money` decimal(20,4) NOT NULL COMMENT '退款金额',
  `refund_cost_money` decimal(20,4) NOT NULL,
  `sale_money` decimal(20,4) NOT NULL COMMENT '销售额,所有支付成功的订单面额(不含在线充值)',
  `sale_cost_money` decimal(20,4) NOT NULL COMMENT '销售额中成本(即将结算给商家的部份)',
  `balance_money` decimal(20,4) NOT NULL COMMENT '商家结算额',
  `verify_money` decimal(20,4) NOT NULL COMMENT '消费的数量',
  `verify_cost_money` decimal(20,4) NOT NULL COMMENT '消费额中的成本',
  `stat_time` date NOT NULL COMMENT '日报时间',
  `stat_month` varchar(10) NOT NULL COMMENT '月份',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_time` (`stat_time`) USING BTREE,
  KEY `stat_month` (`stat_month`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='平台财务日报表\r\n';
INSERT INTO `%DB_PREFIX%statements` VALUES ('1','10208.8000','208.8000','10000.0000','0.0000','0.0000','0.0000','69.0000','50.0000','208.8000','132.0000','62.0000','113.0000','62.0000','2015-02-26','2015-02');
INSERT INTO `%DB_PREFIX%statements` VALUES ('2','221.0000','221.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','221.0000','122.0000','62.0000','113.0000','62.0000','2015-06-16','2015-06');
INSERT INTO `%DB_PREFIX%statements` VALUES ('3','0.0000','0.0000','0.0000','124.0000','0.0000','124.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','2015-06-30','2015-06');
INSERT INTO `%DB_PREFIX%statements` VALUES ('4','39.0000','39.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','39.0000','30.0000','0.0000','0.0000','0.0000','2015-07-17','2015-07');
INSERT INTO `%DB_PREFIX%statements` VALUES ('5','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','30.0000','39.0000','30.0000','2015-07-22','2015-07');
INSERT INTO `%DB_PREFIX%statements` VALUES ('6','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','2015-07-26','2015-07');
DROP TABLE IF EXISTS `%DB_PREFIX%statements_log`;
CREATE TABLE `%DB_PREFIX%statements_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0.收入 1.订单支付收入 2.会员充值收入 3.支出 4.会员提现支出 5.商户提现支出 6.退款金额 7.退款中的成本 8.销售额,所有支付成功的订单面额(不含在线充值) 9.销售额中成本(即将结算给商家的部份) 10.商家结算额 11.消费额 12.消费额中的成本',
  `money` decimal(20,4) NOT NULL,
  `log_info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='财务报表日志';
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('1','1424886396','0','10000.0000','20150226094620767订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('2','1424886396','1','10000.0000','20150226094620767订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('3','1424886396','1','-10000.0000','20150226094620767会员充值');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('4','1424886396','2','10000.0000','20150226094620767会员充值，含手续费');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('5','1424887216','0','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('6','1424887216','1','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('7','1424887216','8','113.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('8','1424887216','9','62.0000','2015022610000323订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('9','1424890765','0','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('10','1424890765','1','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('11','1424890765','8','95.8000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('12','1424890765','9','70.0000','2015022610592583订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('13','1424890988','10','62.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('14','1424890988','11','113.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('15','1424890988','12','62.0000','订单号2015022610000323 61323563消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('16','1424891134','6','69.0000','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('17','1424891134','7','50.0000','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]用户退款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('18','1434416612','11','0.0000','32316437消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('19','1434416898','0','108.0000','2015061605081890订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('20','1434416898','1','108.0000','2015061605081890订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('21','1434416898','8','108.0000','2015061605081890订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('22','1434416898','9','60.0000','2015061605081890订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('23','1434417129','0','113.0000','2015061605120933订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('24','1434417129','1','113.0000','2015061605120933订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('25','1434417129','8','113.0000','2015061605120933订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('26','1434417129','9','62.0000','2015061605120933订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('27','1434417199','10','62.0000','订单号2015061605120933 63636236消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('28','1434417199','11','113.0000','订单号2015061605120933 63636236消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('29','1434417199','12','62.0000','订单号2015061605120933 63636236消费券验证成功');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('30','1435621484','3','124.0000','成功打款给小灰灰测试&yen;124元。');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('31','1435621484','5','124.0000','成功打款给小灰灰测试&yen;124元。');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('32','1437092642','0','39.0000','2015071704240230订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('33','1437092642','1','39.0000','2015071704240230订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('34','1437092642','8','39.0000','2015071704240230订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('35','1437092642','9','30.0000','2015071704240230订单成功付款');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('36','1437540278','10','30.0000','2015071704240230订单已收货');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('37','1437540278','11','39.0000','2015071704240230订单已收货');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('38','1437540278','12','30.0000','2015071704240230订单已收货');
INSERT INTO `%DB_PREFIX%statements_log` VALUES ('39','1437867529','0','0.0000','2015072603384997订单成功付款');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier`;
CREATE TABLE `%DB_PREFIX%supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商户名称',
  `preview` varchar(255) NOT NULL COMMENT '商家logo',
  `content` text NOT NULL COMMENT '商家描述信息',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL COMMENT '所属城市',
  `name_match` text NOT NULL COMMENT '名称的全文索引unicode',
  `name_match_row` text NOT NULL COMMENT '名称全文索引查询用',
  `bank_info` text NOT NULL COMMENT '提现银行帐号',
  `money` decimal(20,4) NOT NULL COMMENT '商户余额(可提现余额,已结算金额，结算后，待结算减少，已结算增加)',
  `sale_money` decimal(20,4) NOT NULL COMMENT '销售总额',
  `lock_money` decimal(20,4) NOT NULL COMMENT '冻结资金(即已销售，未验证，未收货的金额)',
  `balance_money` decimal(20,4) NOT NULL COMMENT '待结算金额（即每验证，收货一个，增加此金额，同时扣除冻结金额）',
  `refund_money` decimal(20,4) NOT NULL COMMENT '已退款金额（退款后增加此金额，同时减少lock_money冻结金额）',
  `wd_money` decimal(20,4) NOT NULL COMMENT '已提现金额：（已提走的金额,提现成功后，增加，同时减少money）',
  `bank_name` varchar(255) NOT NULL COMMENT '提现的开户行名称',
  `bank_user` varchar(255) NOT NULL COMMENT '提现的开户行户名',
  `dp_count_1` int(11) NOT NULL,
  `dp_count_2` int(11) NOT NULL,
  `dp_count_3` int(11) NOT NULL,
  `dp_count_4` int(11) NOT NULL,
  `dp_count_5` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `total_point` int(11) NOT NULL,
  `total_point_1` int(11) NOT NULL,
  `avg_point_1` float(14,4) NOT NULL,
  `total_point_2` int(11) NOT NULL,
  `avg_point_2` float(14,4) NOT NULL,
  `total_point_3` int(11) NOT NULL,
  `avg_point_3` float(14,4) NOT NULL,
  `total_point_4` int(11) NOT NULL,
  `avg_point_4` float(14,4) NOT NULL,
  `total_point_5` int(11) NOT NULL,
  `avg_point_5` float(14,4) NOT NULL,
  `h_name` varchar(255) NOT NULL COMMENT '公司名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人名称',
  `h_tel` varchar(255) NOT NULL COMMENT '法人联系电话',
  `allow_refund` tinyint(1) NOT NULL COMMENT '是否支持退款审核',
  `allow_publish_verify` tinyint(1) NOT NULL COMMENT '是否支持自动发布',
  `publish_verify_balance` decimal(20,4) NOT NULL COMMENT '自动审核时的结算费用率',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `is_effect` (`is_effect`),
  KEY `sort` (`sort`),
  KEY `city_id` (`city_id`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='商户表';
INSERT INTO `%DB_PREFIX%supplier` VALUES ('23','小灰灰测试','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','','0','0','0','ux28784ux28784,ux27979ux35797,ux23567ux28784ux28784ux27979ux35797','灰灰,测试,小灰灰测试','622255554444771','0.0000','184.0000','60.0000','0.0000','0.0000','124.0000','中国建设银行福建省分行','张三','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','桥亭活鱼小镇','张三','0591-88558855','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('24','福州肯德基','./public/attachment/201502/25/14/54ed6b92110bc.jpg','','0','0','0','ux32943ux24503ux22522,ux31119ux24030,ux31119ux24030ux32943ux24503ux22522','肯德基,福州,福州肯德基','622255554444761','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','福州肯德基','王五','0591-88558856','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('25','盛世经典牛排','./public/attachment/201502/25/14/54ed6f616ffc5.jpg','','0','0','0','ux29275ux25490,ux30427ux19990,ux32463ux20856,ux30427ux19990ux32463ux20856ux29275ux25490','牛排,盛世,经典,盛世经典牛排','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','','','','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('26','百度烤肉','./public/attachment/201502/25/14/e7742d7b2aa5e3477382608672802f2614.jpg','','0','0','0','ux28900ux32905,ux30334ux24230,ux30334ux24230ux28900ux32905','烤肉,百度,百度烤肉','5566998785158446562','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国工商银行福州市分行','王一','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','百度烧烤','王一','0591-88558855','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('27','韩悦风尚烤肉','./public/attachment/201502/25/14/54ed724a9d6b5.jpg','','0','0','0','ux28900ux32905,ux39118ux23578,ux38889ux24742,ux38889ux24742ux39118ux23578ux28900ux32905','烤肉,风尚,韩悦,韩悦风尚烤肉','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','韩悦风尚烤肉','张三','0591-88558855','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('28','石山水美式餐厅','./public/attachment/201502/25/15/54ed765bb0d9b.jpg','','0','0','0','ux32654ux24335,ux23665ux27700,ux39184ux21381,ux30707ux23665ux27700ux32654ux24335ux39184ux21381','美式,山水,餐厅,石山水美式餐厅','622255554444771','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','石山水美式餐厅','王五','0591-88558856','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('29','agogo量贩KTV','./public/attachment/201502/25/15/54ed7b363e1e0.jpg','','0','0','0','ux37327ux36137,ux97ux103ux111ux103ux111,ux75ux84ux86,ux97ux103ux111ux103ux111ux37327ux36137ux75ux84ux86','量贩,agogo,KTV,agogo量贩KTV','622255554444761','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','agogo量贩KTV','王五','0591-88558855','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('30','贵安温泉','./public/attachment/201502/25/15/54ed7dcce36b1.jpg','','0','0','0','ux28201ux27849,ux36149ux23433ux28201ux27849','温泉,贵安温泉','6228480063042965416','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','福州上海新村支行 ','农业银行','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','贵安温泉','小贵安','13422200993','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('31','国际旅行社','./public/attachment/201502/25/15/54ed80bf64ba6.jpg','','0','0','0','ux26053ux34892ux31038,ux22269ux38469,ux22269ux38469ux26053ux34892ux31038','旅行社,国际,国际旅行社','6228 4800 6304 2965 416','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','农业银行福州分行','陈福权','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','国际旅行社','陈福权','0591-88600831','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('32','龙中龙','./public/attachment/201502/25/16/54ed82ca42ddd.jpg','','0','0','0','ux20013ux40857,ux40857ux20013ux40857','中龙,龙中龙','622255554444771','0.0000','50.0000','0.0000','0.0000','50.0000','0.0000','中国建设银行福建省分行','张五','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','龙中龙','王五','0591-88558855','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('33','爱丁堡尊贵养生会所','','','0','0','0','ux29233ux19969ux22561,ux20250ux25152,ux23562ux36149,ux20859ux29983,ux29233ux19969ux22561ux23562ux36149ux20859ux29983ux20250ux25152','爱丁堡,会所,尊贵,养生,爱丁堡尊贵养生会所','6228 4800 6304 2965 416','30.0000','50.0000','20.0000','0.0000','0.0000','0.0000','中国银行福州分行','爱丁堡','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','爱丁堡尊贵养生会所','爱丁堡','13478790998','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('36','明视眼镜','./public/attachment/201502/25/17/54ed9b8e44904.jpg','','0','0','0','ux26126ux35270,ux30524ux38236,ux26126ux35270ux30524ux38236','明视,眼镜,明视眼镜','6222 6007 2000 7040 794','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','招商银行福州分行','小明','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','明视眼镜','小明','0591-789665767','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('35','美丽人生摄影工作室','./public/attachment/201502/25/17/54ed9486611f6.jpg','','0','0','0','ux32654ux20029ux20154ux29983,ux24037ux20316ux23460,ux25668ux24433,ux32654ux20029ux20154ux29983ux25668ux24433ux24037ux20316ux23460','美丽人生,工作室,摄影,美丽人生摄影工作室','6222 6007 2000 7040 794','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','工商银行福州分行','张美丽','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','美丽人生摄影工作室','张美丽','0591-88977601','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('38','1111','./public/attachment/201506/26/11/6546935053e846f0041f7d25e5206d4374.jpg','','0','0','0','ux49ux49ux49ux49','1111','111','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','11','11','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','12222','2222','111','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('37','江津','','','0','0','0','ux27743ux27941','江津','1212122121121212','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','2223254212121212','jjsl','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','江津','江津','0234756211','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('39','test','./public/attachment/201507/16/16/70f61b00354e8882a84326dc550f878049.jpg','','0','0','0','ux116ux101ux115ux116','test','123123123123123','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','123123123123123','123123123123123','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','qweqwasdaawe','qweqwe','12312312','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('40','大灰狼','','','0','0','0','ux22823ux28784ux29436','大灰狼','','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','','','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','','','','0','0','0.0000');
INSERT INTO `%DB_PREFIX%supplier` VALUES ('41','小灰灰','./public/attachment/201508/06/15/f79c2910530bb982e273b4bd54a0c23452.jpg','','0','0','0','ux28784ux28784,ux23567ux28784ux28784','灰灰,小灰灰','111','0.0000','0.0000','0.0000','0.0000','0.0000','0.0000','111','111','0','0','0','0','0','0','0.0000','0','0','0.0000','0','0.0000','0','0.0000','0','0.0000','0','0.0000','重庆市黔江区','慧慧','13355555555','0','0','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%supplier_account`;
CREATE TABLE `%DB_PREFIX%supplier_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL COMMENT '商家帐号名',
  `account_password` varchar(255) NOT NULL COMMENT '商家帐号密码',
  `supplier_id` int(11) NOT NULL COMMENT '所属商家ID',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `description` text NOT NULL COMMENT '帐号说明（管理员备注用）',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `update_time` int(11) NOT NULL COMMENT '最后更新时间',
  `allow_delivery` tinyint(1) NOT NULL COMMENT '是否允许对订单进行发货操作',
  `allow_charge` tinyint(1) NOT NULL COMMENT '是否允许提现',
  `is_main` tinyint(1) NOT NULL COMMENT '是否为默认总管理员',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `dev_type` varchar(20) DEFAULT 'android' COMMENT 'android,ios 客户手机类型,一个客户只绑定一个最新的手机',
  `device_token` varchar(255) DEFAULT NULL COMMENT '推送device_token一个客户只绑定一个最新的手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_account_name` (`account_name`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `is_main` (`is_main`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商家帐号表';
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('8','fanwe','e10adc3949ba59abbe56e057f20f883e','23','1','0','','117.140.181.121','1437301160','0','0','0','1','13344455555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('9','fanwek','96e79218965eb72c92a549dd5a330112','24','1','0','','171.113.241.213','1436145468','0','0','0','1','13355566666','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('10','fanwes','4192eb75e54d4f51267e42106f0afcc2','25','1','0','','127.0.0.1','1424885838','0','0','0','1','15555544444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('11','fanwebaidu','96e79218965eb72c92a549dd5a330112','26','1','0','百度烧烤 法人：王一 电话：0591-88558855','182.139.182.231','1438710799','1424818410','1','1','1','13955599999','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('12','fanwekr','9566ad968383b14b6b529ae6ea8bb377','27','1','0','','','0','0','0','0','1','16655555444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('13','fanwesss','fdfa2e513b7b4fe69bde4ddc5ad4b923','28','1','0','','','0','0','0','0','1','16655544444','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('14','fanweagg','b8193ee030cd0dea479994c20f6b5814','29','1','0','','','0','0','0','0','1','15555555555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('15','guian','98886e110d9d8f6bbeac35163d6788cd','30','1','0','','','0','0','0','0','1','13600920332','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('16','guoji','dab8c15b54ef06ce6eb222b5ae209a26','31','1','0','','','0','0','0','0','1','13809098876','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('17','fanwelzl','468fe920c5c2583b079c5913ca472361','32','1','0','','127.0.0.1','1424911104','0','0','0','1','15566655555','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('18','aidingbao','a58e71be843e7cd399b3d7a54b2b964b','33','1','0','','127.0.0.1','1424892920','0','0','0','1','13457890066','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('19','meilirensheng','18602086be1f03dd9e1f3e980e4b24be','35','1','0','','','0','0','0','0','1','13677890998','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('20','mingshi','4870999e94b519b179eaa8387b712931','36','1','0','','','0','0','0','0','1','1345567788','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('21','zschool','44dbe7760c7e242f377b4b2105a30fbf','37','1','0','江津 法人：江津 电话：0234756211','','0','1435102964','1','1','1','15125366566','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('22','221115','646541234d1ed75e577a38c85f64ae12','38','1','0','12222 法人：2222 电话：111','182.148.75.52','1435261053','1435260918','1','1','1','13355892255','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('23','test','26e5e1a64584095860b5dea5fedcd382','39','1','0','qweqwasdaawe 法人：qweqwe 电话：12312312','218.14.182.247','1437903002','1437005854','1','1','1','13000000000','android','');
INSERT INTO `%DB_PREFIX%supplier_account` VALUES ('24','小灰灰','e10adc3949ba59abbe56e057f20f883e','41','1','0','重庆市黔江区 法人：慧慧 电话：13355555555','27.13.154.121','1438817159','1438816932','1','1','1','13355555555','android','');
