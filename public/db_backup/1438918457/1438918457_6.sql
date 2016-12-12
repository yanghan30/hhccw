-- fanwe SQL Dump Program
-- Microsoft-IIS/6.0
-- 
-- DATE : 2015-08-07 19:34:29
-- MYSQL SERVER VERSION : 5.1.61-community
-- PHP VERSION : isapi
-- Vol : 6


DROP TABLE IF EXISTS `%DB_PREFIX%topic_image`;
CREATE TABLE `%DB_PREFIX%topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL COMMENT '主题ID',
  `name` varchar(255) NOT NULL COMMENT '文件名',
  `filesize` int(11) NOT NULL COMMENT '文件大小',
  `create_time` int(11) NOT NULL COMMENT '上传时间',
  `user_id` int(11) NOT NULL COMMENT '所属会员ID',
  `user_name` varchar(255) NOT NULL COMMENT '所属会员名',
  `path` varchar(255) NOT NULL COMMENT '小图路径',
  `topic_table` varchar(255) NOT NULL COMMENT '主题表名',
  `o_path` varchar(255) NOT NULL COMMENT '原图路径',
  `width` int(11) NOT NULL COMMENT '图片宽px',
  `height` int(11) NOT NULL COMMENT '图片高px',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COMMENT='分享主题的相关图片数据表';
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('144','203','a09bc02d6b7e791f31c69b78b337abba33.jpg','40230','1424825537','0','','./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33_100x100.jpg','topic','./public/comment/201502/25/16/a09bc02d6b7e791f31c69b78b337abba33.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('145','204','35d92374d0e80b9e1cd01242fa2741f228.jpg','35946','1424825598','0','','./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228_100x100.jpg','topic','./public/comment/201502/25/16/35d92374d0e80b9e1cd01242fa2741f228.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('153','206','2bb1fba7bd9e10b01fea8a248d15129213.jpg','246083','1424831448','71','fanwe','./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817_50x50.jpg','topic','./public/comment/201502/25/18/c9c184e590089b18cee06977cf38e13817.jpg','600','891');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('154','206','4c5971b0370e739c71ea9d0f5e2e35e257.jpg','561576','1424831448','71','fanwe','./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563_50x50.jpg','topic','./public/comment/201502/25/18/dfdde78028577bf9a9fc6a8438e9451563.jpg','1280','852');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('155','206','52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg','117505','1424831449','71','fanwe','./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768_50x50.jpg','topic','./public/comment/201502/25/18/24136132fab0f60ad883c0e6066f987768.jpg','600','251');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('156','207','a69a84427dd071df105eeb4bdf3f537a69.jpg','373531','1424831504','71','fanwe','./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242_50x50.jpg','topic','./public/comment/201502/25/18/abd33ebcfd9132ee3bfc6acc886fc9c242.jpg','600','885');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('157','208','347ba3d76c8cd114c26edd0097f657f168.jpg','173458','1424831584','71','fanwe','./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93_50x50.jpg','topic','./public/comment/201502/25/18/096dedfab7a181903581a4ecadafd21b93.jpg','600','400');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('158','209','__49606066__3081862.jpg','338630','1424891241','71','fanwe','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162_50x50.jpg','topic','./public/comment/201502/26/11/2176783820631ba9cd211b01773359d162.jpg','640','961');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('159','209','__49606066__3756642.jpg','143773','1424891242','71','fanwe','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018_50x50.jpg','topic','./public/comment/201502/26/11/04a55a6987125ffbe6eb0599853ed9e018.jpg','640','426');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('160','209','__49606321__2635650.jpg','136851','1424891242','71','fanwe','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257_50x50.jpg','topic','./public/comment/201502/26/11/b7762b555cb851c67bd164b8479982f257.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('161','209','88元桥亭活鱼小镇代金券','69825','1424891284','71','fanwe','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','topic','./public/attachment/201502/25/14/54ed67b2cd14b.jpg','460','279');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('162','214','TB2mq1oaFXXXXXhXpXXXXXXXXXX_!!1795832420.jpg','254235','1424906747','72','fz云淡风轻','./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81_50x50.jpg','topic','./public/comment/201502/26/15/c67a4c53163163669c93e7ddc9316bec81.jpg','700','379');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('163','214','TB23jGwaFXXXXabXXXXXXXXXXXX_!!1795832420.jpg','255807','1424906748','72','fz云淡风轻','./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62_50x50.jpg','topic','./public/comment/201502/26/15/8816e67103a1f9f2026c0e1b0882811a62.jpg','700','405');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('164','214','TB23zijaFXXXXbvXpXXXXXXXXXX_!!1795832420.jpg','245411','1424906748','72','fz云淡风轻','./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539_50x50.jpg','topic','./public/comment/201502/26/15/fbcfd84ce82d27669cd36be0910adde539.jpg','700','398');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('165','215','29b1OOOPIC90.jpg','235449','1424906933','72','fz云淡风轻','./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32_50x50.jpg','topic','./public/comment/201502/26/15/7050c8ea918c8b3bbc8dd945e68ccbec32.jpg','650','487');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('166','215','12116408_1340605908112.jpg','1059675','1424906933','72','fz云淡风轻','./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968_50x50.jpg','topic','./public/comment/201502/26/15/4c1173bccb5b8f178dfd516b91782ac968.jpg','2560','1600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('167','215','201292116218453.jpg','1441146','1424906934','72','fz云淡风轻','./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85_50x50.jpg','topic','./public/comment/201502/26/15/0a030e04ff47c09b3df9dcf83be8103e85.jpg','2560','1600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('168','216','f45930c0226d0d1380b1e408db196a02.jpg','1015409','1424907074','71','fanwe','./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42_50x50.jpg','topic','./public/comment/201502/26/15/681ae32726d14d9c6791499b2273ffff42.jpg','1600','1200');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('169','216','userid220060time20130305031808.jpg','371459','1424907075','71','fanwe','./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231_50x50.jpg','topic','./public/comment/201502/26/15/83aa4a0e634e963fc72a91139c4fcd2231.jpg','1000','667');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('170','216','userid329500time20120523234840.jpg','1050840','1424907075','71','fanwe','./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15_50x50.jpg','topic','./public/comment/201502/26/15/1d94317f94b889ffca14644ab04d4aec15.jpg','2126','1253');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('171','217','90b11_ieydanbrmi3geylemmytambqgyyde_640x960.jpg_468x468.jpg','193548','1424907160','71','fanwe','./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24_50x50.jpg','topic','./public/comment/201502/26/15/fb67897bf33dca0cab5c6f6f94ce258d24.jpg','468','702');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('172','218','by27i_ieydenrqgaywemtdmqytambqmmyde_550x620.jpg','176713','1424907233','71','fanwe','./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771_50x50.jpg','topic','./public/comment/201502/26/15/1ab3868a2ad19c86ce8271173c68bc1771.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('173','219','151lem_ieydkmrxgm4dcnjvmqytambqmeyde_550x620.jpg','144253','1424907348','71','fanwe','./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739_50x50.jpg','topic','./public/comment/201502/26/15/c8630af41e58299ab78763b3abb459f739.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('174','220','medish.jpg','248795','1424907440','71','fanwe','./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161_50x50.jpg','topic','./public/comment/201502/26/15/4d94cd0c148dff877ff61856437b285161.jpg','416','600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('175','221','a41fbe2f275be88es.jpg','253182','1424907518','71','fanwe','./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259_50x50.jpg','topic','./public/comment/201502/26/15/18d7e7299e1e89e94814a9ce052d1a6259.jpg','411','600');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('176','222','20120411165042_8jJYr.thumb.600_0.jpg','177713','1424908944','71','fanwe','./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677_50x50.jpg','topic','./public/comment/201502/26/16/193c44dd10937e27ea816805e86de61677.jpg','580','870');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('177','223','Penguins.jpg','615655','1424909032','71','fanwe','./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31_50x50.jpg','topic','./public/comment/201502/26/16/8a26ab000e48307b7063f90e183adbfc31.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('178','224','Jellyfish.jpg','548678','1424909045','71','fanwe','./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797_50x50.jpg','topic','./public/comment/201502/26/16/19bf15376fa41ab96ac0b6953a3f671797.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('179','225','1cikuu_ieydszrxgjrdozjxmmytambqgiyde_550x620.jpg','159140','1424909131','71','fanwe','./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13_50x50.jpg','topic','./public/comment/201502/26/16/f293d32988646c70bf8c8fc53c65158d13.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('180','226','151lem_ieydozbxhbrwiztdmmytambqmeyde_550x620.jpg','145478','1424909175','71','fanwe','./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450_50x50.jpg','topic','./public/comment/201502/26/16/2beb3bdd1805fdc8cec3230f6f942a0450.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('181','227','151lem_ieydimjshftgmnrymmytambqmeyde_550x620.jpg','189511','1424909206','71','fanwe','./public/comment/201502/26/16/f71f019325289d8e091671964724687a67_50x50.jpg','topic','./public/comment/201502/26/16/f71f019325289d8e091671964724687a67.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('182','228','151zqx_ieygcolbha3demzwmmytambqgyyde_550x620.jpg','188072','1424909239','71','fanwe','./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43_50x50.jpg','topic','./public/comment/201502/26/16/015b3856a9b4e05fd4a177e869bbae0d43.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('183','229','Desert.jpg','671434','1424909580','72','fz云淡风轻','./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979_50x50.jpg','topic','./public/comment/201502/26/16/fbeac19ee91e70d5177f16550c90505979.jpg','1024','768');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('184','231','__36578586__4587290.jpg','159074','1424910173','71','fanwe','./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86_50x50.jpg','topic','./public/comment/201502/26/16/9c7ca4e816516046af26436e1546915c86.jpg','640','427');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('185','232','1a24yv_ieydkzbsmzsgiyjvmmytambqgiyde_550x620.jpg','151552','1424910314','71','fanwe','./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260_50x50.jpg','topic','./public/comment/201502/26/16/376000da2e6bece72225f54464bda27260.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('186','233','18eokr_ieydgmdemi4gkojtmmytambqmmyde_550x620.jpg','164670','1424910372','71','fanwe','./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613_50x50.jpg','topic','./public/comment/201502/26/16/972209e97878ffb17bc6c3d60346d6a613.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('187','234','1a24yv_ieygiyrsgi2tsyrtmmytambqgyyde_550x620.jpg','132373','1424910834','71','fanwe','./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142_50x50.jpg','topic','./public/comment/201502/26/16/4e5b2271b63633712f6258d79af37b1142.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('188','235','1cikuv_ieydcobzha2genbtmmytambqgiyde_550x620.jpg','220495','1424911376','71','fanwe','./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291_50x50.jpg','topic','./public/comment/201502/26/16/6d320acf22518f42f170825de5d508a291.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('189','236','1cikuv_ieydozdfgy4genbtmmytambqgyyde_550x620.jpg','203149','1424911472','71','fanwe','./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367_50x50.jpg','topic','./public/comment/201502/26/16/bde02140cd60fc5f41f19407917d8d2367.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('190','237','151lem_ieydaojqgm3wmzbvmmytambqgyyde_550x620.jpg','181753','1424911629','71','fanwe','./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771_50x50.jpg','topic','./public/comment/201502/26/16/fada3b55799ed290fcc7640cee4dbfa771.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('191','238','1527j2_ieydcztega2ggzrsmmytambqmmyde_550x620.jpg','145127','1424912284','71','fanwe','./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45_50x50.jpg','topic','./public/comment/201502/26/16/9af737b72be14a62b995956be2a67aed45.jpg','550','620');
INSERT INTO `%DB_PREFIX%topic_image` VALUES ('192','239','1527j2_ieygeztfgyygezrsmmytambqhayde_550x620.jpg','172187','1424912307','71','fanwe','./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19_50x50.jpg','topic','./public/comment/201502/26/16/af49a05fe471fc8dc5afc7e6d43f9dff19.jpg','550','620');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_reply`;
CREATE TABLE `%DB_PREFIX%topic_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL COMMENT '主题ID',
  `content` text NOT NULL COMMENT '回复内容',
  `user_id` int(11) NOT NULL COMMENT '回复人ID',
  `user_name` varchar(255) NOT NULL COMMENT '回复人用户名',
  `reply_id` int(11) NOT NULL COMMENT '被回应的回复的ID',
  `reply_user_id` int(11) NOT NULL COMMENT '被回应的回复的用户ID',
  `reply_user_name` varchar(255) NOT NULL COMMENT '被回应的回复的用户名',
  `create_time` int(11) NOT NULL COMMENT '回复时间',
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='主题回复表';
INSERT INTO `%DB_PREFIX%topic_reply` VALUES ('42','208','很不错啊。','71','fanwe','0','0','','1424892621','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag`;
CREATE TABLE `%DB_PREFIX%topic_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐, 标为推荐将默认显示在发现栏目的全部分类的标签中',
  `count` int(11) NOT NULL COMMENT '与该标签相关的分享主题数',
  `is_preset` tinyint(1) NOT NULL COMMENT '是否为预设标签(预选标签在会员中心发分享时可提供给用户选取)',
  `color` varchar(10) NOT NULL COMMENT '发现栏目显示标签的颜色',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='主题检索用的标签集';
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('1','电影','1','2','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('2','自助游','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('3','闽菜','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('4','川菜','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('5','咖啡','1','0','0','#fff100','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('6','牛排','1','0','0','#a1410d','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('7','包包','1','0','0','#ed008c','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('8','复古','1','0','0','#a36209','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('9','甜美','1','0','0','','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('10','韩系','1','0','0','#a4d49d','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('11','欧美','1','0','0','#ee1d24','0');
INSERT INTO `%DB_PREFIX%topic_tag` VALUES ('12','美食','1','0','0','#a1410d','1');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag_cate`;
CREATE TABLE `%DB_PREFIX%topic_tag_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名',
  `sub_name` varchar(255) NOT NULL COMMENT '附标题(手机端使用)',
  `mobile_title_bg` varchar(255) NOT NULL COMMENT '手机分类背景图',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `showin_mobile` tinyint(1) NOT NULL COMMENT '是否显示在网站',
  `showin_web` tinyint(1) NOT NULL COMMENT '是否显示在手机端',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分享标签的分类表';
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('1','休闲娱乐','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('2','乐享美食','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('3','旅游酒店','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('4','都市购物','','','0','1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('5','幸福居家','','','1','0','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('6','浪漫婚恋','','','2','0','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate` VALUES ('7','玩乐帮派','','','3','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_tag_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_tag_cate_link` (
  `cate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类与预设标签的关联表，主题的自动分类依据该表';
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','8');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','10');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('1','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('2','12');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('3','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','8');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','10');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('4','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('5','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('6','11');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','1');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','2');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','3');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','4');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','5');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','6');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','7');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','9');
INSERT INTO `%DB_PREFIX%topic_tag_cate_link` VALUES ('7','11');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_title`;
CREATE TABLE `%DB_PREFIX%topic_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '话题名称',
  `type` tinyint(1) NOT NULL COMMENT '0:主题1:活动',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否为推荐',
  `count` int(11) NOT NULL COMMENT '话题中的主题数量',
  `color` varchar(10) NOT NULL COMMENT '显示的颜色',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分享主题的话题列表';
INSERT INTO `%DB_PREFIX%topic_title` VALUES ('4','报名参加了玛格利塔新店开业试吃','0','0','1','','0');
INSERT INTO `%DB_PREFIX%topic_title` VALUES ('5','发布标题！','0','0','1','','0');
DROP TABLE IF EXISTS `%DB_PREFIX%topic_title_cate_link`;
CREATE TABLE `%DB_PREFIX%topic_title_cate_link` (
  `title_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`title_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题与分类的关联表，也用于分享的自动分类用';
DROP TABLE IF EXISTS `%DB_PREFIX%topic_vote_log`;
CREATE TABLE `%DB_PREFIX%topic_vote_log` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分享的投票表';
DROP TABLE IF EXISTS `%DB_PREFIX%urls`;
CREATE TABLE `%DB_PREFIX%urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL COMMENT '外链的url',
  `count` int(11) NOT NULL COMMENT '该链接被点击的次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='分享中关于外链的加密存储表';
INSERT INTO `%DB_PREFIX%urls` VALUES ('8','http://www.fanwe.com','1');
DROP TABLE IF EXISTS `%DB_PREFIX%user`;
CREATE TABLE `%DB_PREFIX%user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '会员名',
  `user_pwd` varchar(255) NOT NULL COMMENT '会员密码',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  `group_id` int(11) NOT NULL COMMENT '会员组ID',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否被禁用（未验证）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除',
  `email` varchar(255) DEFAULT NULL COMMENT '会员邮件',
  `mobile` varchar(255) DEFAULT NULL COMMENT '会员手机号',
  `score` int(11) NOT NULL COMMENT '会员积分',
  `total_score` int(11) NOT NULL COMMENT '累积积分：用于会员组升级',
  `money` double(20,4) NOT NULL COMMENT '会员余额',
  `verify` varchar(255) NOT NULL COMMENT '验证注册生效时生成的验证码',
  `code` varchar(255) NOT NULL COMMENT '登录用的标识码(md5加密前缀)',
  `pid` int(11) NOT NULL COMMENT '推荐人ID',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `referral_count` int(11) NOT NULL COMMENT '返利数量',
  `password_verify` varchar(255) NOT NULL COMMENT '取回密码的验证码',
  `integrate_id` int(11) NOT NULL COMMENT '会员整合的用户ID（如uc中的会员ID）',
  `sina_id` varchar(255) NOT NULL COMMENT '新浪同步的会员ID',
  `renren_id` varchar(255) NOT NULL COMMENT '预留',
  `kaixin_id` varchar(255) NOT NULL COMMENT '预留',
  `sohu_id` varchar(255) NOT NULL COMMENT '预留',
  `lottery_mobile` varchar(255) NOT NULL COMMENT '抽奖时用的手机号',
  `lottery_verify` varchar(255) NOT NULL COMMENT '抽奖手机的验证码',
  `verify_create_time` int(11) NOT NULL COMMENT '抽奖手机验证码生成时间',
  `tencent_id` varchar(255) NOT NULL COMMENT '腾讯微博ID',
  `referer` varchar(255) NOT NULL COMMENT '会员来路',
  `login_pay_time` int(11) NOT NULL COMMENT '弃用',
  `focus_count` int(11) NOT NULL COMMENT '关注别人的数量',
  `focused_count` int(11) NOT NULL COMMENT '粉丝数',
  `province_id` int(11) NOT NULL COMMENT '所属省份ID',
  `city_id` int(11) NOT NULL COMMENT '所属城市 ID',
  `sex` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '性别',
  `my_intro` varchar(255) NOT NULL COMMENT '个人简介',
  `is_merchant` tinyint(1) NOT NULL COMMENT '是否绑定商家',
  `merchant_name` varchar(255) NOT NULL COMMENT '商家帐号名',
  `is_daren` tinyint(1) NOT NULL COMMENT '达人标识 ',
  `daren_title` varchar(255) NOT NULL COMMENT '达人称号',
  `step` tinyint(1) NOT NULL COMMENT '新手已完成步骤',
  `byear` int(4) NOT NULL COMMENT '生日年',
  `bmonth` int(2) NOT NULL COMMENT '生日月',
  `bday` int(2) NOT NULL COMMENT '生日日',
  `locate_time` int(11) DEFAULT '0' COMMENT '用户最后登陆时间',
  `xpoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆x座标',
  `ypoint` float(10,6) DEFAULT '0.000000' COMMENT '用户最后登陆y座标',
  `topic_count` int(11) NOT NULL COMMENT '主题数',
  `fav_count` int(11) NOT NULL COMMENT '喜欢数',
  `faved_count` int(11) NOT NULL COMMENT '被喜欢数',
  `dp_count` int(11) NOT NULL COMMENT '点评总数',
  `insite_count` int(11) NOT NULL COMMENT '站点分享数总（本站的商品等数据）',
  `outsite_count` int(11) NOT NULL COMMENT '外站的分享数（如有实现的淘宝分享等）',
  `level_id` int(11) NOT NULL COMMENT '等级ID',
  `point` int(11) NOT NULL COMMENT '经验值',
  `sina_app_key` varchar(255) NOT NULL COMMENT '新浪的同步验证key',
  `sina_app_secret` varchar(255) NOT NULL COMMENT '新浪的同步验证密码',
  `is_syn_sina` tinyint(1) NOT NULL COMMENT '是否同步发微博到新浪',
  `tencent_app_key` varchar(255) NOT NULL COMMENT '腾讯的同步验证key',
  `tencent_app_secret` varchar(255) NOT NULL COMMENT '腾讯的同步验证密码',
  `is_syn_tencent` tinyint(1) NOT NULL COMMENT '是否同步发微博到腾讯',
  `sina_token` varchar(255) NOT NULL COMMENT '新浪的授权码',
  `t_access_token` varchar(255) NOT NULL COMMENT '腾讯微博授权码',
  `t_openkey` varchar(255) NOT NULL COMMENT '腾讯微博的openkey',
  `t_openid` varchar(255) NOT NULL COMMENT '腾讯微博OPENID',
  `avatar` varchar(255) NOT NULL DEFAULT './public/avatar/noavatar.gif',
  `is_tmp` tinyint(1) NOT NULL COMMENT '表示是否为临时用户（如手机注册）',
  `qqv2_id` varchar(255) NOT NULL,
  `qq_token` varchar(255) NOT NULL,
  `t_name` varchar(255) NOT NULL,
  `dev_type` varchar(20) DEFAULT 'android' COMMENT 'android,ios 客户手机类型,一个客户只绑定一个最新的手机',
  `device_token` varchar(255) DEFAULT NULL COMMENT '推送device_token一个客户只绑定一个最新的手机',
  `wx_openid` varchar(255) NOT NULL COMMENT '微信OPENID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_user_name` (`user_name`),
  UNIQUE KEY `unk_email` (`email`),
  UNIQUE KEY `unk_mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='会员表';
INSERT INTO `%DB_PREFIX%user` VALUES ('71','fanwe','6714ccb93be0fda4e51f206b91b46358','1435813866','1435813866','114.215.200.216','1','1','0','fanwe@fanwe.com','13333333333','100','120','9752.2000','','','0','1435813874','0','','0','','','','','','','0','','','0','0','1','4','53','1','','0','','1','方维o2o达人','0','1970','1','1','0','0.000000','0.000000','33','1','0','1','2','0','1','450','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('72','fz云淡风轻','6714ccb93be0fda4e51f206b91b46358','1424909518','1424909518','127.0.0.1','1','1','0','fanwe1@fanwe.com','','100','100','0.0000','','','71','1424909561','0','','0','','','','','','','0','','','0','1','0','0','0','-1','','0','','1','分享达人','0','0','0','0','0','0.000000','0.000000','4','0','1','0','0','0','1','180','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('73','221115','646541234d1ed75e577a38c85f64ae12','1434934329','1434934329','27.13.154.121','1','1','0','330686020@qq.com','','100','100','0.0000','','','0','1438817443','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','1','0','0','0','0','0','1','140','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('74','inwater','f7f5b6085a014612fd54525479802408','1435135035','1435135035','114.215.200.216','1','1','0','inwater@126.com','','95','100','0.0000','','','0','1435135035','0','','0','','','','','','','0','','wap','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('75','有图网','96e79218965eb72c92a549dd5a330112','1435178537','1435178537','221.182.106.10','1','1','0','80417633@qq.com','','100','100','0.0000','','','0','1435178568','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('76','游客_76','646541234d1ed75e577a38c85f64ae12','1435306431','1435306431','114.215.200.216','1','1','0','','18580986869','110','110','0.0000','','','0','1435801461','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','250','','','0','','','0','','','','','./public/avatar/noavatar.gif','1','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('77','sosowo','fa06d84233169d6346587875205cceab','1435352093','1435352093','183.68.171.212','1','1','0','81510184@qq.com','','100','100','0.0000','','','0','1435384559','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('78','samfeng','0c78bddaea88bf5564e9a31b73d2e700','1435606091','1435606091','182.139.182.231','1','1','0','3225810@qq.com','','100','100','0.0000','','','0','1435606091','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('79','游客_79','e10adc3949ba59abbe56e057f20f883e','1435791574','1435791574','123.114.43.181','1','1','0','','17888832633','100','100','0.0000','','','0','1435791574','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','1','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('80','zhtyuan99','195d91be1e3ba6f1c857d46f24c5a454','1435801063','1435801063','114.215.200.216','1','1','0','zhtyuan99@qq.com','13520168600','100','100','0.0000','','','0','1435801138','0','','0','','','','','','','0','','wap','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('81','一米','4297f44b13955235245b2497399d7a93','1437040424','1437040424','123.112.249.16','1','1','0','Lcc1969@163.com','','100','100','0.0000','','','0','1437040438','0','','0','','','','','','','0','','wap','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','130','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('82','pzlc','fa6f1a7fb44be69034825349167ec2a2','1437092555','1437092555','171.221.24.165','1','1','0','pzlc@pzlc.com','13888888888','100','100','961.0000','','','0','1437269311','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','120','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('83','离开','e10adc3949ba59abbe56e057f20f883e','1437172358','1437172358','114.215.200.216','1','1','0','123456@qq.com','','100','100','0.0000','','','0','1437172358','0','','0','','','','','','','0','','wap','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('84','111111','96e79218965eb72c92a549dd5a330112','1437867491','1437867491','222.219.222.31','1','1','0','123363916@qq.com','18087686464','100','100','0.0000','','','0','1437867491','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
INSERT INTO `%DB_PREFIX%user` VALUES ('85','dillon','26e5e1a64584095860b5dea5fedcd382','1437904158','1437904158','218.14.182.247','1','1','0','hyw21@126.com','','100','100','0.0000','','','0','1437904158','0','','0','','','','','','','0','','','0','0','0','0','0','-1','','0','','0','','0','0','0','0','0','0.000000','0.000000','0','0','0','0','0','0','1','110','','','0','','','0','','','','','./public/avatar/noavatar.gif','0','','','','android','','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_active_log`;
CREATE TABLE `%DB_PREFIX%user_active_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '发生时间',
  `point` int(11) NOT NULL COMMENT '经验',
  `score` int(11) NOT NULL COMMENT '积分',
  `money` double(11,4) NOT NULL COMMENT '钱',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='关于会员活跃度的帐号变更日志';
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('34','71','1424825541','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('35','71','1424825604','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('36','71','1424831278','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('37','71','1424831452','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('38','71','1424831511','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('39','71','1424831593','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('40','71','1424891284','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('41','71','1424892621','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('42','71','1424893353','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('43','71','1424893442','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('44','72','1424906566','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('45','72','1424906767','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('46','72','1424906940','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('47','71','1424907077','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('48','71','1424907181','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('49','71','1424907246','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('50','71','1424907366','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('51','71','1424907447','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('52','71','1424907522','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('53','72','1424909588','10','0','0.0000');
INSERT INTO `%DB_PREFIX%user_active_log` VALUES ('54','73','1434934373','10','0','0.0000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_auth`;
CREATE TABLE `%DB_PREFIX%user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='会员前台操作权限的配置表';
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('135','71','group','setmemo','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('134','71','group','setbest','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('130','71','group','setmemo','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('129','71','group','setbest','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('128','71','group','settop','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('127','71','group','replydel','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('126','71','group','del','3');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('133','71','group','settop','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('132','71','group','replydel','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('131','71','group','del','4');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('116','71','group','del','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('119','71','group','setbest','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('118','71','group','settop','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('115','71','group','setmemo','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('112','71','group','replydel','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('113','71','group','settop','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('117','71','group','replydel','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('114','71','group','setbest','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('111','71','group','del','6');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('120','71','group','setmemo','5');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('136','78','group','del','7');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('137','78','group','replydel','7');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('138','78','group','settop','7');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('139','78','group','setbest','7');
INSERT INTO `%DB_PREFIX%user_auth` VALUES ('140','78','group','setmemo','7');
DROP TABLE IF EXISTS `%DB_PREFIX%user_cate_link`;
CREATE TABLE `%DB_PREFIX%user_cate_link` (
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='达人会员所属的分类';
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','1');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','2');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','3');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','4');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','5');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','6');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('71','7');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','1');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','2');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','3');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','4');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','5');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','6');
INSERT INTO `%DB_PREFIX%user_cate_link` VALUES ('72','7');
DROP TABLE IF EXISTS `%DB_PREFIX%user_consignee`;
CREATE TABLE `%DB_PREFIX%user_consignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `region_lv1` int(11) NOT NULL COMMENT '国',
  `region_lv2` int(11) NOT NULL COMMENT '省',
  `region_lv3` int(11) NOT NULL COMMENT '市',
  `region_lv4` int(11) NOT NULL COMMENT '地区',
  `address` text NOT NULL COMMENT '地址',
  `mobile` varchar(255) NOT NULL COMMENT '手机',
  `zip` varchar(255) NOT NULL COMMENT '邮编',
  `consignee` varchar(255) NOT NULL COMMENT '收货人',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认配送地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='会员的收货地址';
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('19','71','1','4','53','519','群升国际','13555566666','350001','李四','1');
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('20','71','1','4','53','519','宝龙万象','15544433333','350000','张三','0');
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('21','76','1','3','38','416','22','13355892255','22','1222','1');
INSERT INTO `%DB_PREFIX%user_consignee` VALUES ('22','82','1','5','64','619','fdcvd','13888888888','cdcd','test','1');
DROP TABLE IF EXISTS `%DB_PREFIX%user_extend`;
CREATE TABLE `%DB_PREFIX%user_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '扩展字段ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `value` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='会员扩展字段的资料';
DROP TABLE IF EXISTS `%DB_PREFIX%user_field`;
CREATE TABLE `%DB_PREFIX%user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL COMMENT '字段名（代码）',
  `field_show_name` varchar(255) NOT NULL COMMENT '字段显示用的名称',
  `input_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1：预选下拉',
  `value_scope` text NOT NULL COMMENT '预选下拉的预选值,以逗号分隔',
  `is_must` tinyint(1) NOT NULL COMMENT '是否必填',
  `sort` int(11) NOT NULL COMMENT '排序大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_field_name` (`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员的扩展字段';
DROP TABLE IF EXISTS `%DB_PREFIX%user_focus`;
CREATE TABLE `%DB_PREFIX%user_focus` (
  `focus_user_id` int(11) NOT NULL COMMENT '关注人ID',
  `focused_user_id` int(11) NOT NULL COMMENT '被关注人ID',
  `focus_user_name` varchar(255) NOT NULL COMMENT '关注人用户名',
  `focused_user_name` varchar(255) NOT NULL COMMENT '被关注人用户名',
  `to_focus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`focus_user_id`,`focused_user_id`),
  KEY `focus_user_id` (`focus_user_id`),
  KEY `focused_user_id` (`focused_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员关注、被关注表';
INSERT INTO `%DB_PREFIX%user_focus` VALUES ('72','71','fz云淡风轻','fanwe','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_frequented`;
CREATE TABLE `%DB_PREFIX%user_frequented` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '员会ID',
  `title` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `xpoint` float(12,6) DEFAULT '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) DEFAULT '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) DEFAULT NULL,
  `latitude_bottom` float(12,6) DEFAULT NULL,
  `longitude_left` float(12,6) DEFAULT NULL,
  `longitude_right` float(12,6) DEFAULT NULL,
  `zoom_level` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端附近会员的记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%user_group`;
CREATE TABLE `%DB_PREFIX%user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '会员组名',
  `score` int(11) NOT NULL COMMENT '所需积分',
  `discount` double(20,4) NOT NULL COMMENT '享受的折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员组配置表';
INSERT INTO `%DB_PREFIX%user_group` VALUES ('1','普通会员','0','1.0000');
INSERT INTO `%DB_PREFIX%user_group` VALUES ('2','VIP会员','8888','0.8000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_level`;
CREATE TABLE `%DB_PREFIX%user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '等级名称',
  `point` int(11) NOT NULL COMMENT '所需经验值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`point`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员等级表';
INSERT INTO `%DB_PREFIX%user_level` VALUES ('1','幼儿园','0');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('2','小学生','1000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('3','中学生','2000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('4','大学生','5000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('5','研究生','10000');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('6','博士生','50000');
DROP TABLE IF EXISTS `%DB_PREFIX%user_log`;
CREATE TABLE `%DB_PREFIX%user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin_id` int(11) NOT NULL COMMENT '操作管理员的ID',
  `log_user_id` int(11) NOT NULL COMMENT '操作的前台会员ID',
  `money` double(20,4) NOT NULL COMMENT '相关的钱',
  `score` int(11) NOT NULL COMMENT '相关的积分',
  `point` int(11) NOT NULL COMMENT '相关的经验',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='会员的资金、积分、经验日志';
INSERT INTO `%DB_PREFIX%user_log` VALUES ('109','在2015-02-25 15:46:15注册成功','1424821575','1','0','0.0000','100','100','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('110','您在2015-02-25 15:46:15签到成功','1424821575','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('111','发表了一则分享','1424825541','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('112','发表了一则分享','1424825604','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('113','转载了一则分享','1424831278','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('114','发表了一则分享','1424831452','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('115','发表了一则分享','1424831511','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('116','发表了一则分享','1424831593','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('117','您在2015-02-26 09:46:03签到成功','1424886363','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('139','发表了一则分享','1424907366','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('119','充值单20150226094620767支付成功','1424886396','1','0','10000.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('120','下载优惠券肯德基10元汉堡','1424886836','1','0','0.0000','-5','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('122','2015022610592583订单付款,付款单号2015022610592524','1424890765','1','0','-95.8000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('123','订单号2015022610000323 61323563消费券验证成功','1424890988','1','0','0.0000','10','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('124','仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。 [黑色,小码]退款成功','1424891134','1','0','69.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('125','发表了一则点评','1424891284','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('126','下载优惠券华莱士30元抵用券','1424891808','1','0','0.0000','-5','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('127','回应了一则分享','1424892621','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('128','发表了一则分享','1424893353','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('129','发表了一则分享','1424893442','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('130','活动报名：玛格利塔新店开业试吃','1424894336','1','0','0.0000','-10','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('131','在2015-02-26 15:22:09注册成功','1424906529','1','0','0.0000','100','100','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('132','您在2015-02-26 15:22:09签到成功','1424906529','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('133','转载了一则分享','1424906566','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('134','发表了一则分享','1424906767','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('135','发表了一则分享','1424906940','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('136','发表了一则分享','1424907077','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('137','发表了一则分享','1424907181','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('138','发表了一则分享','1424907246','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('140','发表了一则分享','1424907447','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('141','发表了一则分享','1424907522','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('142','很好分享被置顶','1424907966','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('143','分享被推荐','1424908015','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('144','管理员操作推荐','1424908239','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('145','管理员操作推荐','1424908284','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('146','管理员操作推荐','1424908286','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('147','管理员操作推荐','1424908700','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('148','管理员操作推荐','1424908703','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('149','管理员操作推荐','1424908703','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('150','管理员操作推荐','1424908706','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('151','管理员操作推荐','1424908710','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('152','管理员操作推荐','1424908712','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('153','管理员操作取消推荐','1424908714','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('154','管理员操作取消推荐','1424908715','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('155','管理员操作取消推荐','1424908719','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('156','管理员操作推荐','1424908720','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('157','管理员操作推荐','1424908722','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('158','管理员操作取消推荐','1424908860','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('159','管理员操作取消推荐','1424908861','1','0','0.0000','0','-10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('160','管理员操作推荐','1424908960','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('161','管理员操作推荐','1424909060','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('162','管理员操作推荐','1424909061','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('163','管理员操作推荐','1424909153','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('164','管理员操作推荐','1424909247','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('165','管理员操作推荐','1424909248','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('166','管理员操作推荐','1424909249','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('167','发表了一则分享','1424909588','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('168','管理员操作推荐','1424909609','1','0','0.0000','0','10','72');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('169','您在2015-03-28 10:36:17签到成功','1427481377','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('170','您在2015-06-16 17:01:03签到成功','1434416463','0','71','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('171','2015061605081890订单付款,付款单号2015061605081838','1434416898','1','0','-108.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('172','2015061605120933订单付款,付款单号2015061605120942','1434417129','1','0','-113.0000','0','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('173','订单号2015061605120933 63636236消费券验证成功','1434417199','0','71','0.0000','10','0','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('174','在2015-06-22 16:52:09注册成功','1434934329','1','0','0.0000','100','100','73');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('175','您在2015-06-22 16:52:09签到成功','1434934329','1','0','0.0000','0','10','73');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('176','发表了一则分享','1434934373','1','0','0.0000','0','10','73');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('177','您在2015-06-23 13:10:29签到成功','1435007429','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('178','在2015-06-25 00:37:15注册成功','1435135035','0','74','0.0000','100','100','74');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('179','您在2015-06-25 00:37:15签到成功','1435135035','0','74','0.0000','0','10','74');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('180','下载优惠券华莱士30元抵用券','1435135046','0','74','0.0000','-5','0','74');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('181','在2015-06-25 12:42:17注册成功','1435178537','0','75','0.0000','100','100','75');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('182','您在2015-06-25 12:42:17签到成功','1435178537','0','75','0.0000','0','10','75');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('183','在2015-06-27 00:13:51注册成功','1435306431','1','0','0.0000','100','100','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('184','您在2015-06-27 00:13:51签到成功','1435306431','1','0','0.0000','0','10','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('185','在2015-06-27 12:54:53注册成功','1435352093','0','77','0.0000','100','100','77');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('186','您在2015-06-27 12:54:53签到成功','1435352093','0','77','0.0000','0','10','77');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('187','您在2015-06-27 13:27:08签到成功','1435354028','0','73','0.0000','0','10','73');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('188','您在2015-06-28 16:40:51签到成功','1435452051','0','76','0.0000','0','10','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('189','您在2015-06-29 19:05:02签到成功','1435547102','0','76','0.0000','0','10','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('190','您在2015-06-29 19:05:02签到成功','1435547102','0','76','0.0000','0','10','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('191','您在2015-06-30 07:14:02签到成功','1435590842','0','76','0.0000','5','50','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('192','您在2015-06-30 07:14:02签到成功','1435590842','0','76','0.0000','5','50','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('193','在2015-06-30 11:28:11注册成功','1435606091','1','0','0.0000','100','100','78');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('194','您在2015-06-30 11:28:11签到成功','1435606091','1','0','0.0000','0','10','78');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('195','在2015-07-02 14:59:34注册成功','1435791574','1','0','0.0000','100','100','79');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('196','您在2015-07-02 14:59:34签到成功','1435791574','1','0','0.0000','0','10','79');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('197','在2015-07-02 17:37:43注册成功','1435801063','0','80','0.0000','100','100','80');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('198','您在2015-07-02 17:37:43签到成功','1435801063','0','80','0.0000','0','10','80');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('199','您在2015-07-02 17:44:21签到成功','1435801461','0','76','0.0000','0','10','76');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('200','您在2015-07-02 21:11:14签到成功','1435813874','1','0','0.0000','0','10','71');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('201','在2015-07-07 20:34:02注册成功','1436243642','0','81','0.0000','100','100','81');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('202','您在2015-07-07 20:34:02签到成功','1436243642','0','81','0.0000','0','10','81');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('203','您在2015-07-08 17:36:53签到成功','1436319413','1','0','0.0000','0','10','81');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('204','您在2015-07-17 01:53:58签到成功','1437040438','1','0','0.0000','0','10','81');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('205','在2015-07-17 16:22:35注册成功','1437092555','1','0','0.0000','100','100','82');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('206','管理员编辑帐户','1437092571','1','0','1000.0000','0','0','82');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('207','您在2015-07-17 16:23:24签到成功','1437092604','1','0','0.0000','0','10','82');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('208','2015071704240230订单付款,付款单号2015071704240212','1437092642','1','0','-39.0000','0','0','82');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('209','在2015-07-18 14:32:38注册成功','1437172358','0','83','0.0000','100','100','83');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('210','您在2015-07-18 14:32:38签到成功','1437172358','0','83','0.0000','0','10','83');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('211','您在2015-07-19 17:28:31签到成功','1437269311','0','82','0.0000','0','10','82');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('212','在2015-07-26 15:38:11注册成功','1437867491','0','84','0.0000','100','100','84');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('213','您在2015-07-26 15:38:11签到成功','1437867491','0','84','0.0000','0','10','84');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('214','在2015-07-27 01:49:18注册成功','1437904158','1','0','0.0000','100','100','85');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('215','您在2015-07-27 01:49:18签到成功','1437904158','1','0','0.0000','0','10','85');
INSERT INTO `%DB_PREFIX%user_log` VALUES ('216','您在2015-08-06 15:30:43签到成功','1438817443','1','0','0.0000','0','10','73');
DROP TABLE IF EXISTS `%DB_PREFIX%user_medal`;
CREATE TABLE `%DB_PREFIX%user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `medal_id` int(11) NOT NULL COMMENT '勋章ID',
  `name` varchar(255) NOT NULL COMMENT '勋章名称',
  `create_time` int(11) NOT NULL COMMENT '获取时间',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否被删除',
  `icon` varchar(255) NOT NULL COMMENT '勋章图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员勋章表';
INSERT INTO `%DB_PREFIX%user_medal` VALUES ('2','71','3','新手勋章','1424821804','1','./public/attachment/201203/17/15/4f643902cd067.png');
DROP TABLE IF EXISTS `%DB_PREFIX%user_sign_log`;
CREATE TABLE `%DB_PREFIX%user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `sign_date` int(11) NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='会员签到日志';
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('24','71','1435813874');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('5','72','1424906529');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('33','73','1438817443');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('10','74','1435135035');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('11','75','1435178537');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('32','85','1437904158');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('13','77','1435352093');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('31','84','1437867491');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('29','83','1437172358');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('30','82','1437269311');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('27','81','1437040438');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('23','76','1435801461');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('20','78','1435606091');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('21','79','1435791574');
INSERT INTO `%DB_PREFIX%user_sign_log` VALUES ('22','80','1435801063');
DROP TABLE IF EXISTS `%DB_PREFIX%user_topic_group`;
CREATE TABLE `%DB_PREFIX%user_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '加入小组的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '加入的时间',
  `type` tinyint(1) NOT NULL COMMENT '0:普通组员 1:管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`group_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员加入的小组表';
INSERT INTO `%DB_PREFIX%user_topic_group` VALUES ('3','5','72','1424906623','0');
INSERT INTO `%DB_PREFIX%user_topic_group` VALUES ('4','4','72','1424906823','0');
INSERT INTO `%DB_PREFIX%user_topic_group` VALUES ('5','5','73','1434934357','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_x_y_point`;
CREATE TABLE `%DB_PREFIX%user_x_y_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `xpoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `ypoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `locate_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员手机端地理定位记录';
DROP TABLE IF EXISTS `%DB_PREFIX%vote`;
CREATE TABLE `%DB_PREFIX%vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '调查的项目名称',
  `begin_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sort` int(11) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='在线调查表';
DROP TABLE IF EXISTS `%DB_PREFIX%vote_ask`;
CREATE TABLE `%DB_PREFIX%vote_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票项名称',
  `type` tinyint(1) NOT NULL COMMENT '投票类型，单选多选/自定义可叠加 1:单选 2:多选 3:自定义',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `vote_id` int(11) NOT NULL COMMENT '调查ID',
  `val_scope` text NOT NULL COMMENT '预选范围 逗号分开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='在线调查投票项设置';
DROP TABLE IF EXISTS `%DB_PREFIX%vote_result`;
CREATE TABLE `%DB_PREFIX%vote_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票的名称',
  `count` int(11) NOT NULL COMMENT '计数',
  `vote_id` int(11) NOT NULL COMMENT '调查项ID',
  `vote_ask_id` int(11) NOT NULL COMMENT '投票项（问题）ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='投票结果表';
DROP TABLE IF EXISTS `%DB_PREFIX%weight_unit`;
CREATE TABLE `%DB_PREFIX%weight_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '重量名称',
  `rate` decimal(20,4) NOT NULL COMMENT '换算比率(标准为1)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='重量单位配置表';
INSERT INTO `%DB_PREFIX%weight_unit` VALUES ('1','克','1.0000');
