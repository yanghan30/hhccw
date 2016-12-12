3.07;
ALTER TABLE `%DB_PREFIX%supplier`
ADD COLUMN `weishop_name`  varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '微店店名',
ADD COLUMN `weishop_logo`  varchar(255) NOT NULL COMMENT '微店logo' AFTER `weishop_name`,
ADD COLUMN `weishop_banner`  text NOT NULL COMMENT '微店banner位(多个)' AFTER `weishop_logo`;

CREATE TABLE IF NOT EXISTS `%DB_PREFIX%relate_goods` (
  `good_id` int(11) NOT NULL COMMENT '商品/团购id',
  `relate_ids` text NOT NULL COMMENT '关联的商品/团购id',
  `is_shop` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=团购、1=商品'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品关联购买';

ALTER TABLE `%DB_PREFIX%relate_goods` ADD UNIQUE KEY `good_id` (`good_id`);

ALTER TABLE `%DB_PREFIX%supplier_money_submit`
MODIFY COLUMN `status`  tinyint(1) NOT NULL COMMENT '状态 0:待审核 1:已确认提现 2:拒绝' AFTER `create_time`,
ADD COLUMN `reason`  text NOT NULL COMMENT '拒绝的理由' AFTER `status`;

ALTER TABLE `%DB_PREFIX%deal_submit`
ADD COLUMN `cache_relate`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联商品缓存' AFTER `cache_deal_filter`;

INSERT INTO `%DB_PREFIX%m_config` (`id`, `code`, `title`, `val`, `type`, `sort`) VALUES ('82', 'close_index_tuan', '是否关闭首页团购', '0', '4', '101');
INSERT INTO `%DB_PREFIX%m_config` (`id`, `code`, `title`, `val`, `type`, `sort`) VALUES ('83', 'close_index_shop', '是否关闭首页商品', '0', '4', '102');
INSERT INTO `%DB_PREFIX%m_config` (`id`, `code`, `title`, `val`, `type`, `sort`) VALUES ('84', 'close_index_youhui', '是否关闭首页优惠', '0', '4', '103');
INSERT INTO `%DB_PREFIX%m_config` (`id`, `code`, `title`, `val`, `type`, `sort`) VALUES ('85', 'close_index_event', '是否关闭首页活动', '0', '4', '104');
INSERT INTO `%DB_PREFIX%m_config` (`id`, `code`, `title`, `val`, `type`, `sort`) VALUES ('86', 'close_index_supplier', '是否关闭首页商户', '0', '4', '105');


CREATE TABLE `%DB_PREFIX%weixin_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '配置输入的类型 0:文本输入 1:下拉框输入 2:图片上传 3:编辑器',
  `value_scope` text NOT NULL COMMENT '取值范围',
  `is_require` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '是否可配置 0: 可配置  1:不可配置',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='微信配置选项';

INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('1', '第三方平台appid', 'platform_appid', '', '0', '0', '', '0', '1', '1', '1');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('2', '公众号消息校验Token', 'platform_token', '', '0', '0', '', '0', '1', '1', '2');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('3', '公众号消息加解密Key', 'platform_encodingAesKey', '', '0', '0', '', '0', '1', '1', '3');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('4', '是否开启第三方平台', 'platform_status', '0', '0', '4', '0,1', '0', '1', '1', '4');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('5', '第三方平台AppSecret', 'platform_appsecret', '', '0', '0', '', '0', '1', '1', '1');

INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('6', 'component_verify_ticket', 'platform_component_verify_ticket', '0', '0', '0', '', '0', '1', '0', '6');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('7', '第三方平台access_token', 'platform_component_access_token', '0', '0', '0', '', '0', '1', '0', '7');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('8', '第三方平台预授权码', 'platform_pre_auth_code', '0', '0', '0', '', '0', '1', '0', '8');

INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('9', '第三方平台access_token有效期', 'platform_component_access_token_expire', '0', '0', '0', '', '0', '1', '0', '9');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('10', '第三方平台预授权码有效期', 'platform_pre_auth_code_expire', '0', '0', '0', '', '0', '1', '0', '10');
INSERT INTO `%DB_PREFIX%weixin_conf` VALUES ('11', '是否已全网发布', 'platform_all_publish', '0', '0', '4', '0,1', '0', '1', '1', '11');


CREATE TABLE `%DB_PREFIX%weixin_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) NOT NULL COMMENT 'AppID(应用ID)-第三方平台指 授权方appid',
  `appsecret` varchar(255) NOT NULL COMMENT 'AppSecret(应用密钥)-第三方平台无用',
  `app_url` varchar(255) NOT NULL COMMENT 'URL(服务器地址)-第三方平台无用',
  `app_token` varchar(255) NOT NULL COMMENT 'Token(令牌)-第三方平台无用',
  `app_encodingAESKey` varchar(255) NOT NULL COMMENT 'EncodingAESKey(消息加解密密钥)-第三方平台无用',
  `authorizer_appid` varchar(255) NOT NULL COMMENT '授权方appid',
  `authorizer_access_token` varchar(255) NOT NULL COMMENT '授权方令牌-第三方平台无用',
  `expires_in` int(11) NOT NULL COMMENT '授权方令牌 有效时间-第三方平台无用',
  `authorizer_refresh_token` varchar(255) NOT NULL COMMENT '刷新令牌-第三方平台',
  `func_info` text NOT NULL COMMENT '公众号授权给开发者的权限集列表',
  `verify_type_info` tinyint(1) NOT NULL COMMENT '授权方认证类型，-1代表未认证，0代表微信认证，1代表新浪微博认证，2代表腾讯微博认证，3代表已资质认证通过但还未通过名称认证，4代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证，5代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证',
  `service_type_info` tinyint(1) NOT NULL COMMENT '授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号',
  `nick_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT '授权方公众号的原始ID',
  `authorizer_info` varchar(255) NOT NULL COMMENT '授权方昵称',
  `head_img` varchar(255) NOT NULL COMMENT '授权方头像',
  `alias` varchar(255) NOT NULL COMMENT '授权方公众号所设置的微信号，可能为空',
  `qrcode_url` varchar(255) NOT NULL COMMENT '二维码图片的URL，开发者最好自行也进行保存',
  `location_report` tinyint(1) NOT NULL COMMENT '地理位置上报选项 0 无上报 1 进入会话时上报 2 每5s上报',
  `voice_recognize` tinyint(1) NOT NULL COMMENT '语音识别开关选项 0 关闭语音识别 1 开启语音识别',
  `customer_service` tinyint(1) NOT NULL COMMENT '客服开关选项 0 关闭多客服 1 开启多客服',
  `is_authorized` tinyint(1) NOT NULL DEFAULT '0' COMMENT '授权方是否取消授权 0表示取消授权 1表示授权',
  `user_id` int(11) NOT NULL COMMENT '商户ID ，诺type为1，user_id 为空',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 表示前台商户会员 1 表示后台管理员',
  `industry_1` int(11) NOT NULL,
  `industry_1_status` tinyint(1) NOT NULL,
  `industry_2` int(11) NOT NULL,
  `industry_2_status` tinyint(1) NOT NULL,
  `test_user` varchar(255) DEFAULT NULL COMMENT '测试微信号',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='//微信公众号列表';


CREATE TABLE `%DB_PREFIX%weixin_api_get_record` (
  `openid` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`openid`),
  KEY `account_id` (`account_id`),
  KEY `idx_0` (`account_id`,`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='请求的用户记录';

CREATE TABLE `%DB_PREFIX%weixin_nav` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default '' COMMENT '菜单名称',
  `sort` int(11) default '0' COMMENT '菜单排序 大->小',
  `event_type` enum('click') default 'click' COMMENT '按钮的事件，目前微信只支持click',
  `account_id` int(11) default '0' COMMENT '商户ID,0表示平台',
  `status` tinyint(1) default '0' COMMENT '是否已推送到微信(0:未推送或失败 1:成功)，该列同一个商家全部相同，菜单为一次性推送,对菜单本地修改时，批量更新该值为0',
  `pid` int(11) default '0',
  `ctl` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sort` (`sort`),
  KEY `event_type` (`event_type`),
  KEY `account_id` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='为微信自定义的菜单设置';



ALTER TABLE `%DB_PREFIX%weixin_account`
ADD UNIQUE INDEX `authorizer_appid` (`authorizer_appid`) ,
ADD INDEX `appid` (`appid`) ,
ADD UNIQUE INDEX `user_id` (`user_id`) ;

CREATE TABLE `%DB_PREFIX%weixin_reply` (
  `id` int(11) NOT NULL auto_increment,
  `i_msg_type` enum('event','link','location','image','text') default 'text' COMMENT '接收到的微信的推送到本系统api中的MsgType',
  `o_msg_type` enum('news','music','text') default 'text' COMMENT '用于响应并回复给微信推送的消息类型 news:图文 music:音乐 text:纯文本',
  `keywords` varchar(300) default NULL COMMENT '用于响应文本(i_msg_type:text或者i_event:click时对key的响应)类型的回复时进行匹配的关键词',
  `keywords_match` text COMMENT 'keywords的全文索引列',
  `keywords_match_row` text COMMENT 'keywords全文索引的未作unicode编码的原文，用于开发者查看',
  `address` text COMMENT '用于显示的地理地址',
  `api_address` text COMMENT '用于地理定位的API地址',
  `x_point` varchar(100) default '' COMMENT '用于lbs消息,i_msg_type:location 匹配的经度',
  `y_point` varchar(100) default '' COMMENT '用于lbs消息,i_msg_type:location 匹配的纬度',
  `scale_meter` int(11) default '0' COMMENT '用于lbs消息,i_msg_type:location 匹配的距离范围(米)',
  `i_event` enum('subscribe','unsubscribe','click','empty') default 'empty' COMMENT '用于响应i_msg_type为event时的对应事件',
  `reply_content` text COMMENT '回复的文本消息',
  `reply_music` varchar(255) default '' COMMENT '回复的音乐链接',
  `reply_news_title` text COMMENT '图文回复的标题',
  `reply_news_description` text COMMENT '图文回复的描述',
  `reply_news_picurl` varchar(255) default '' COMMENT '图文回复的图片链接',
  `reply_news_url` varchar(255) default '' COMMENT '图文回复的跳转链接',
  `reply_news_content` text,
  `type` tinyint(1) default '0' COMMENT '回复归类 \r\n0:普通的回复 \r\n1:默认回复(只能一条文本或图文) \r\n4.关注时回复(只能有一条文本或图文) ',
  `account_id` int(11) default '0' COMMENT '所属的商家ID',
  `default_close` tinyint(1) default '1' COMMENT '默认回复是否关闭 0：关闭 1：开启',
  `match_type` tinyint(1) NOT NULL default '0',
  `ctl` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `i_msg_type` (`i_msg_type`),
  KEY `o_msg_type` (`o_msg_type`),
  KEY `i_event` (`i_event`),
  KEY `type` (`type`),
  KEY `account_id` (`account_id`),
  KEY `match_type` (`account_id`,`match_type`,`keywords`),
  FULLTEXT KEY `keywords_match` (`keywords_match`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商家回复设置表';




CREATE TABLE `%DB_PREFIX%weixin_reply_relate` (
  `main_reply_id` int(11) DEFAULT '0' COMMENT '主回复ID',
  `relate_reply_id` int(11) DEFAULT '0' COMMENT '关联的多图文用的子回复ID',
  `sort` tinyint(1) DEFAULT '0',
  KEY `main_reply_id` (`main_reply_id`) ,
  KEY `relate_reply_id` (`relate_reply_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多图文回复的关联配置';

ALTER TABLE `%DB_PREFIX%supplier`
ADD COLUMN `platform_status` tinyint(1) NOT NULL default '1' COMMENT '是否支持公众平台功能 0否 1是';


CREATE TABLE `%DB_PREFIX%weixin_user` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `account_id` int(11) NOT NULL COMMENT '商家ID,平台级为0',
  `subscribe` tinyint(1) NOT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
  `openid` varchar(255) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(255) NOT NULL,
  `sex` tinyint(1) NOT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(255) NOT NULL,
  `country` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `language` varchar(20) default NULL,
  `headimgurl` varchar(255) default NULL,
  `subscribe_time` varchar(255) default NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unionid` varchar(255) default NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
  `remark` varchar(255) default NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(11) default NULL COMMENT '用户所在的分组ID',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='//微信公众号会员列表';




CREATE TABLE `%DB_PREFIX%weixin_tmpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '模板名称',
  `msg` text COMMENT '模板内容',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `template_id_short` varchar(255) DEFAULT NULL COMMENT '模板编号',
  `account_id` int(11) DEFAULT '0' COMMENT '所属的商家ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='微信模板';

INSERT INTO `%DB_PREFIX%conf` VALUES (0,'TENCENT_MAP_APPKEY','','1','0','','1','1','35');

update %DB_PREFIX%deal set max_bought = -1 where max_bought = 0;
update %DB_PREFIX%attr_stock set stock_cfg = -1 where stock_cfg = 0;
update %DB_PREFIX%attr_stock set stock_cfg = stock_cfg - buy_count where stock_cfg >= 0;
update %DB_PREFIX%deal set max_bought = max_bought - buy_count where max_bought >= 0;

ALTER TABLE `%DB_PREFIX%deal`
MODIFY COLUMN `max_bought`  int(11) NOT NULL DEFAULT '-1' COMMENT '最大量，即库存上限(如有属性规格的库存，该值不生效，见attr_stock表)' AFTER `min_bought`;

ALTER TABLE `%DB_PREFIX%attr_stock`
MODIFY COLUMN `stock_cfg`  int(11) NOT NULL DEFAULT '-1' COMMENT '该属性组合的库存数' AFTER `attr_cfg`;

/*韩文林*/
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3401','3','合肥','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3401','3','合肥','3');

INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3402','3401','瑶海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3402','3401','瑶海','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3403','3401','庐阳','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3403','3401','庐阳','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3404','3401','蜀山','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3404','3401','蜀山','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3405','3401','包河','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3405','3401','包河','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3406','3401','长丰','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3406','3401','长丰','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3407','3401','肥东','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3407','3401','肥东','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3408','3401','肥西','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3408','3401','肥西','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3409','3401','巢湖','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3409','3401','巢湖','3');
INSERT INTO `%DB_PREFIX%delivery_region` VALUES ('3410','3401','庐江','4');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3410','3401','庐江','3');

UPDATE `%DB_PREFIX%conf` set `value` = '3.07' where name = 'DB_VERSION';