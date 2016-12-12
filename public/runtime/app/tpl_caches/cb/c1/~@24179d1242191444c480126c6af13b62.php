<?php
//000000000600s:44769:"<?php exit;?>a:3:{s:8:"template";a:4:{i:0;s:72:"/Users/yanghan/Documents/Develop/www/hhccw/app/Tpl/main/fanwe/index.html";i:1;s:77:"/Users/yanghan/Documents/Develop/www/hhccw/app/Tpl/main/fanwe/inc/header.html";i:2;s:80:"/Users/yanghan/Documents/Develop/www/hhccw/app/Tpl/main/fanwe/inc/cate_tree.html";i:3;s:77:"/Users/yanghan/Documents/Develop/www/hhccw/app/Tpl/main/fanwe/inc/footer.html";}s:7:"expires";i:1481226024;s:8:"maketime";i:1481225424;}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>方维o2o商业系统 - 方维o2o商业系统,国内最优秀的PHP开源o2o系统</title>
<meta name="keywords" content=" 方维o2o商业系统关键词" />
<meta name="description" content=" 方维o2o商业系统描述" />
<script type="text/javascript">
var APP_ROOT = '';
var CART_URL = '/index.php?ctl=cart';
var CART_CHECK_URL = '/index.php?ctl=cart&act=check';
var send_span = 2000;
var IS_RUN_CRON = 1;
var DEAL_MSG_URL = '/index.php?ctl=cron&act=deal_msg_list';
var AJAX_LOGIN_URL	= '/index.php?ctl=user&act=ajax_login';
var AJAX_URL	= '/index.php?ctl=ajax';
var CITY_COUNT	= 4;
//关于图片上传的定义
var LOADER_IMG = 'http://wap.hhccw.local/app/Tpl/main/fanwe/images/loader_img.gif';
var UPLOAD_SWF = 'http://wap.hhccw.local/app/Tpl/main/fanwe/js/utils/Moxie.swf';
var UPLOAD_XAP = 'http://wap.hhccw.local/app/Tpl/main/fanwe/js/utils/Moxie.xap';
var MAX_IMAGE_SIZE = '3000000';
var ALLOW_IMAGE_EXT = 'jpg,gif,png,jpeg';
var UPLOAD_URL = '/index.php?ctl=file&act=upload';
var QRCODE_ON = '0';
</script>
<script type="text/javascript" src="/public/runtime/app/lang.js"></script>
<link rel="stylesheet" type="text/css" href="http://wap.hhccw.local/public/runtime/statics/697ccabf2b55017c97437815da4e322f.css?v=3.07.4782" />
<script type="text/javascript" src="http://wap.hhccw.local/public/runtime/statics/3ae75fcd8026f9627dd868347ba89e89.js?v=3.07.4782"></script>
</head>
<body>
<img src="http://wap.hhccw.local/app/Tpl/main/fanwe/images/loader_img.gif" style="display:none;" /><!--延时加载的替代图片生成-->
<div class="city_list">
	<div class="city_list_box">
				<a href="/index.php?city=beijing" class="city_item" >北京</a>
				<a href="/index.php?city=fuzhou" class="city_item" >福州</a>
				<a href="/index.php?city=shanghai" class="city_item" >上海</a>
				<a href="/index.php?city=xiamen" class="city_item" >厦门</a>
			</div>
</div>
<div class="top_nav">
	<div class="wrap_full_w main_layout">
		<span class="f_l">欢迎来到方维o2o商业系统</span>	
		<span class="f_r">
			<ul class="head_tip">
				<li class="user_tip"><a href="/biz.php" target="_blank">商户中心</a></li>
				<li class="cart_tip" id="cart_tip">554fcae493e564ee0dc75bdf2ebf94caload_cart_count|YToxOntzOjQ6Im5hbWUiO3M6MTU6ImxvYWRfY2FydF9jb3VudCI7fQ==554fcae493e564ee0dc75bdf2ebf94ca</li>
				<li class="user_tip" id="history_tip">554fcae493e564ee0dc75bdf2ebf94caload_head_history|YToxOntzOjQ6Im5hbWUiO3M6MTc6ImxvYWRfaGVhZF9oaXN0b3J5Ijt9554fcae493e564ee0dc75bdf2ebf94ca</li>
				<li class="user_tip" id="head_user_tip">554fcae493e564ee0dc75bdf2ebf94caload_user_tip|YToxOntzOjQ6Im5hbWUiO3M6MTM6ImxvYWRfdXNlcl90aXAiO30=554fcae493e564ee0dc75bdf2ebf94ca</li>
			</ul>
		</span>
	</div>
</div><!--顶部横栏-->
<div class="blank15"></div>
<div class="wrap_full_w main_layout head_main">
	<div class="logo f_l">
	<a class="link" href="/">
				<span style='display:inline-block; width:191px; height:60px; background:url(http://wap.hhccw.local/public/attachment/201011/4cdd501dc023b.png) no-repeat; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=http://wap.hhccw.local/public/attachment/201011/4cdd501dc023b.png, sizingMethod=scale);_background-image:none;'></span>	</a>
	</div>
	<div class="city f_l">
				<a class="city_name" href="javascript:void(0);"  jump="/index.php?ctl=city">554fcae493e564ee0dc75bdf2ebf94caload_city_name|YToxOntzOjQ6Im5hbWUiO3M6MTQ6ImxvYWRfY2l0eV9uYW1lIjt9554fcae493e564ee0dc75bdf2ebf94ca&nbsp;<i></i></a>
		<a href="javascript:void(0);"  jump="/index.php?ctl=city" class="city_switch f_l">切换城市</a>
			</div>
	<div class="search f_r">
		<div class="top_search">
			<form action="/index.php?ctl=search" name="search_form" method=post >
			<select name="search_type" class="ui-select search_type f_l">
				<option value="1" >搜团购</option>
				<option value="2" >搜优惠</option>
				<option value="3" >搜活动</option>
				<option value="4" >搜商家</option>				
				<option value="5" >搜商品</option>
				<option value="6" >搜分享</option>
			</select>
			<input type="text" name="search_keyword" class="ui-textbox search_keyword f_l" holder="请输入您要搜索的关键词" value="" />
			<button class="ui-button f_l" rel="search_btn" type="submit">搜索</button>
			</form>
		</div>
		<ul class="search_hot_keyword">
						<li><a href="/index.php?ctl=search&act=jump"></a></li>
					</ul>
	</div>
</div><!--logo与头部搜索-->
<div class="blank15"></div>
<div class="nav_bar">
	<div class="wrap_full_w main_layout">
				<div class="drop_nav" id="drop_nav" ref="no_drop">
			<span class="drop_title">全部分类<i></i></span>
			<div class="drop_box">
				<div class="cate_tree">
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=8"><i class="diyfont">&#58896;</i>&nbsp;餐饮美食</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=1" class="heavy" >咖啡</a></li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=2" class="heavy" >闽菜</a></li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=3"  >东北菜</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=8">餐饮美食</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=1" class="heavy">咖啡</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=2" class="heavy">闽菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=3" >东北菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=4" class="heavy">川菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=26" >日本料理</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=27" class="heavy">本帮菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=28" >甜点</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=29" >面包</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=30" class="heavy">烧烤</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=38" >西餐</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=9"><i class="diyfont">&#58894;</i>&nbsp;休闲娱乐</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=1" class="heavy" >咖啡</a></li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=5"  >KTV</a></li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=6" class="heavy" >自助游</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=9">休闲娱乐</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=1" class="heavy">咖啡</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=5" >KTV</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=6" class="heavy">自助游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=31" >足疗按摩</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=32" >水上世界</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=33" >运动健身</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=34" >采摘/农家乐</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=10"><i class="diyfont">&#58880;</i>&nbsp;生活服务</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=35"  >婚纱摄影</a></li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=36"  >个性写真</a></li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=37"  >培训课程</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=10">生活服务</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=35" >婚纱摄影</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=36" >个性写真</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=37" >培训课程</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=39" >配镜</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=11"><i class="diyfont">&#58889;</i>&nbsp;酒店旅游</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=6" class="heavy" >自助游</a></li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=7"  >周边游</a></li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=8" class="heavy" >国内游</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=11">酒店旅游</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=6" class="heavy">自助游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=7" >周边游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=8" class="heavy">国内游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=9" >海外游</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=13"><i class="diyfont">&#58883;</i>&nbsp;爱车学车</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=10" class="heavy" >洗车</a></li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=11" class="heavy" >汽车保养</a></li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=12"  >驾校</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=13">爱车学车</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=10" class="heavy">洗车</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=11" class="heavy">汽车保养</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=12" >驾校</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=13" class="heavy">4S店</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=14" >音响</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=15" class="heavy">车载导航</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=16" class="heavy">真皮座椅</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=17" class="heavy">打蜡</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=14"><i class="diyfont">&#58888;</i>&nbsp;都市丽人</a></dt>
		</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=15"><i class="diyfont">&#58895;</i>&nbsp;我要结婚</a></dt>
		</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=16"><i class="diyfont">&#58881;</i>&nbsp;医疗健康</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=18"  >男科</a></li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=19"  >妇科</a></li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=20"  >儿科</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=16">医疗健康</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=18" >男科</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=19" >妇科</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=20" >儿科</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=21" class="heavy">口腔科</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=22" >眼科</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=23" class="heavy">体检中心</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=24" >心理诊所</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=16&tid=25" class="heavy">疗养院</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="no_border">
	<dt><a href="/index.php?ctl=tuan&cid=17"><i class="diyfont">&#58887;</i>&nbsp;母婴亲子</a></dt>
		</dl>
</div>			</div>
		</div><!--下拉菜单-->
				<div class="main_nav">
			<ul>
								<li class="current"><a href="/index.php" >首页</a></li>
								<li ><a href="/index.php?ctl=tuan" >团购</a></li>
								<li ><a href="/index.php?ctl=mall" >商城</a></li>
								<li ><a href="/index.php?ctl=events" >活动</a></li>
								<li ><a href="/index.php?ctl=stores" >商家</a></li>
								<li ><a href="/index.php?ctl=daren" >达人秀</a></li>
								<li ><a href="/index.php?ctl=group" >小组</a></li>
								<li ><a href="/index.php?ctl=discover" >发现</a></li>
								<li ><a href="/index.php?ctl=youhuis" >优惠券</a></li>
								<li ><a href="/index.php?ctl=scores" >积分商城</a></li>
								<li ><a href="/index.php?ctl=dc" >外卖</a></li>
								
			</ul>
		</div>
	</div>
</div>	
<div class="wrap_full_w main_layout" id="flow_cate_outer">
<div id="flow_cate">
		<ul>
																								<li rel="index_mall_cate_24" bg="#438ccb">
								<i class="diyfont"></i>
								<font>服装</font>
			</li>
												<li rel="index_mall_cate_29" bg="#f16522">
								<i class="diyfont"></i>
								<font>母婴用品</font>
			</li>
								</ul>
</div>
</div>
<div class="wrap_full_w main_layout  clearfix">
	<div class="fix_cate_tree " >
			<div class="cate_tree">
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=8"><i class="diyfont">&#58896;</i>&nbsp;餐饮美食</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=1" class="heavy" >咖啡</a></li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=2" class="heavy" >闽菜</a></li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=3"  >东北菜</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=8">餐饮美食</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=1" class="heavy">咖啡</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=2" class="heavy">闽菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=3" >东北菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=4" class="heavy">川菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=26" >日本料理</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=27" class="heavy">本帮菜</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=28" >甜点</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=29" >面包</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=30" class="heavy">烧烤</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=8&tid=38" >西餐</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=9"><i class="diyfont">&#58894;</i>&nbsp;休闲娱乐</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=1" class="heavy" >咖啡</a></li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=5"  >KTV</a></li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=6" class="heavy" >自助游</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=9">休闲娱乐</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=1" class="heavy">咖啡</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=5" >KTV</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=6" class="heavy">自助游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=31" >足疗按摩</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=32" >水上世界</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=33" >运动健身</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=9&tid=34" >采摘/农家乐</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=10"><i class="diyfont">&#58880;</i>&nbsp;生活服务</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=35"  >婚纱摄影</a></li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=36"  >个性写真</a></li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=37"  >培训课程</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=10">生活服务</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=35" >婚纱摄影</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=36" >个性写真</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=37" >培训课程</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=10&tid=39" >配镜</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=11"><i class="diyfont">&#58889;</i>&nbsp;酒店旅游</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=6" class="heavy" >自助游</a></li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=7"  >周边游</a></li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=8" class="heavy" >国内游</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=11">酒店旅游</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=6" class="heavy">自助游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=7" >周边游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=8" class="heavy">国内游</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=11&tid=9" >海外游</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="">
	<dt><a href="/index.php?ctl=tuan&cid=13"><i class="diyfont">&#58883;</i>&nbsp;爱车学车</a></dt>
		<dd class="sub_nav ">
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=10" class="heavy" >洗车</a></li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=11" class="heavy" >汽车保养</a></li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=12"  >驾校</a></li>
					</ul>
	</dd>
			<dd class="pop_nav">
		<span><a href="/index.php?ctl=tuan&cid=13">爱车学车</a></span>
		<ul>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=10" class="heavy">洗车</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=11" class="heavy">汽车保养</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=12" >驾校</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=13" class="heavy">4S店</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=14" >音响</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=15" class="heavy">车载导航</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=16" class="heavy">真皮座椅</a>&nbsp;&nbsp;|</li>
						<li><a href="/index.php?ctl=tuan&cid=13&tid=17" class="heavy">打蜡</a>&nbsp;&nbsp;|</li>
					</ul>
	</dd>
	</dl>
<dl class="no_border">
	<dt><a href="/index.php?ctl=tuan&cid=14"><i class="diyfont">&#58888;</i>&nbsp;都市丽人</a></dt>
		</dl>
</div>	</div>
	
	<div class="main_screen">
		<div class="blank"></div>
		<div class="main_roll f_l" id="main_roll">
		<ul class="roll">
		<li><img src="http://wap.hhccw.local/public/attachment/201502/25/11/54ed41c0e3216.png" alt="" border="0" /></li>
		<li><img src="http://wap.hhccw.local/public/attachment/201502/25/11/54ed41b6bfeec.png" alt="" border="0" /><br />
</li>		
		</ul>
		
		</div>
		<div class="side_roll f_l" id="side_roll">
			<i class="t_left"></i>
			<i class="t_right"></i>
			<ul class="roll">
			<li><img src="http://wap.hhccw.local/public/attachment/201502/25/12/54ed559176fa9.jpg" alt="" border="0" /></li>
			<li><img src="http://wap.hhccw.local/public/attachment/201502/25/12/54ed559ba1dc1.jpg" alt="" border="0" /></li>
			</ul>
		</div>
		<div class="blank"></div>
		<div class="index_pick f_l  ">
			<span class="tuan_cate">
				<div class="tag_list">
				<h1><i class="iconfont">&#xe609;</i>&nbsp;热门团购</h1>
					<ul>
												<li><a href="/index.php?ctl=tuan&cid=8" class="heavy" >餐饮美食</a></li>
												<li><a href="/index.php?ctl=tuan&cid=9"  >休闲娱乐</a></li>
												<li><a href="/index.php?ctl=tuan&cid=10" class="heavy" >生活服务</a></li>
												<li><a href="/index.php?ctl=tuan&cid=11"  >酒店旅游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=13"  >爱车学车</a></li>
												<li><a href="/index.php?ctl=tuan&cid=14"  >都市丽人</a></li>
												<li><a href="/index.php?ctl=tuan&cid=15"  >我要结婚</a></li>
												<li><a href="/index.php?ctl=tuan&cid=16"  >医疗健康</a></li>
												<li><a href="/index.php?ctl=tuan&cid=17"  >母婴亲子</a></li>
											
					</ul>
				
				</div>
			</span>
			
			<span class="tuan_tag no_border">
				<div class="tag_list">
				<h1><i class="iconfont">&#xe611;</i>&nbsp;热门标签</h1>
				
					<ul>
												<li><a href="/index.php?ctl=tuan&cid=13&tid=16" class="heavy" >真皮座椅</a></li>
												<li><a href="/index.php?ctl=tuan&cid=9&tid=1" class="heavy" >咖啡</a></li>
												<li><a href="/index.php?ctl=tuan&cid=11&tid=6" class="heavy" >自助游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=8&tid=1" class="heavy" >咖啡</a></li>
												<li><a href="/index.php?ctl=tuan&cid=13&tid=17" class="heavy" >打蜡</a></li>
												<li><a href="/index.php?ctl=tuan&cid=9&tid=5"  >KTV</a></li>
												<li><a href="/index.php?ctl=tuan&cid=11&tid=7"  >周边游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=8&tid=2" class="heavy" >闽菜</a></li>
												<li><a href="/index.php?ctl=tuan&cid=16&tid=18"  >男科</a></li>
												<li><a href="/index.php?ctl=tuan&cid=9&tid=6" class="heavy" >自助游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=11&tid=8" class="heavy" >国内游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=8&tid=3"  >东北菜</a></li>
												<li><a href="/index.php?ctl=tuan&cid=16&tid=19"  >妇科</a></li>
												<li><a href="/index.php?ctl=tuan&cid=11&tid=9"  >海外游</a></li>
												<li><a href="/index.php?ctl=tuan&cid=8&tid=4" class="heavy" >川菜</a></li>
											</ul>
				
				</div>
			</span>
			<span class="tuan_area">
				<div class="tag_list">
				<h1><i class="iconfont">&#xe615;</i>&nbsp;全部区域</h1>
				
					<ul>
												
					</ul>
				
				</div>
				
				<a href="javascript:void(0);" class="more">更多</a>
			</span>
		</div>
		<div class="index_mobile f_l">
			<ul>
				<li class="ios"><a href="javascript:void(0);"  down_url="/index.php?ctl=ajax&act=app_download&t=ios" ><i class="iconfont">&#xe614;</i>&nbsp;<em>IPhone</em> 下载</a></li>
				<li class="android"><a href="javascript:void(0);" down_url="/index.php?ctl=ajax&act=app_download&t=android"><i class="iconfont">&#xe613;</i>&nbsp;<em>Android</em> 下载</a></li>
				
			</ul>
		</div>
	</div>
</div>	
<div class="notice_row wrap_full_w main_layout">
	<div class="wrap_full_w main_layout">
			<div class="notice_board">
				<i class="iconfont f_l">&#xe618;</i>
				<ul>
					
					<li><a href="/index.php?ctl=deal&act=65">泰宁大金湖</a></li>									
					
					<li><a href="/index.php?ctl=deal&act=70">百度烤肉</a></li>									
					
				</ul>
				<a href="/index.php?ctl=news" class="more f_l news_more">更多</a>
			</div>
	</div>	
</div>
<div class="blank"></div>
<div class="wrap_full_w main_layout">
<div class="f_l wrap_full">
		</div><!--index_rec_layout_left-->
<div class="f_r wrap_s">
	<img src="http://wap.hhccw.local/public/attachment/201502/26/17/54eee2d489343.jpg" alt="" border="0" />
	<div class="blank"></div>
	<img src="http://wap.hhccw.local/public/attachment/201502/26/17/54eee2f10078a.jpg" alt="" border="0" />
</div><!--index_rec_layout_right-->
</div>
<div class="blank"></div>
<!--推荐的团购分类-->
<div class="wrap_full_w main_layout">
	
					
	
			<div class="index_cate" rel="index_mall_cate_24">
		<div class="title_row">
			<div class="title"><i class="diyfont"></i>&nbsp;&nbsp;服装</div>
			<ul>
								<li><a href="/index.php?ctl=cate&cid=30">
女装</a> | </li>
								<li><a href="/index.php?ctl=cate&cid=31">
男装</a> | </li>
								<li><a href="/index.php?ctl=cate&cid=32">
家居服</a> | </li>
								<li><a href="/index.php?ctl=cate&cid=33">
毛衣</a></li>
				
			</ul>
			<a href="/index.php?ctl=cate&cid=24" class="more">更多</a>
		</div>
		<div class="content_row clearfix">
			<ul class="tuan_list">
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=81" 
title="仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/c2/2f8b881be2ef3428bb63116d9abc8982.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag7"></h2>
											
							<h2 class="tag8"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=81" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/11/54ee8c68e932a_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=81" class="quan">
								【包邮】魅货莫代尔不规则衫							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=81">魅货莫代尔不规则衫</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=81">
							仅售39元！价值99元的魅货莫代尔不规则衫1件，魅货莫代尔不规则开衫
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>39</span>
							<span class="origin_price">门店价：&yen;99</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=80" 
title="仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/cb/dff9b6af46bef36e6cae3c6e651b8732.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag6"></h2>
											
							<h2 class="tag8"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=80" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/10/54ee8c072cb42_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=80" class="quan">
								【包邮】冰爱长袖针织披肩							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=80">冰爱长袖针织披肩</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=80">
							仅售125元！价值698元的冰爱长袖针织披肩1件，冰爱长袖针织披肩10-披肩
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>126</span>
							<span class="origin_price">门店价：&yen;698</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=79" 
title="仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/c3/f67ba6402f75a1d9c4d41c60736a7c4e.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag7"></h2>
											
							<h2 class="tag8"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=79" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/10/54ee8b9b7587f_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=79" class="quan">
								【包邮】梦舒纷高领打底衫							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=79">梦舒纷高领打底衫</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=79">
							仅售39元！价值69元的梦舒纷高领打底衫1件，2014年新款简约大方，高端定制面料 ，百搭款式，秋冬美女必备打底衫，成就自己的美丽，就从这开始....
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>39</span>
							<span class="origin_price">门店价：&yen;69</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=64" 
title="仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/c8/c3ea8f980c3b62d0fa7d0993232a8557.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag6"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=64" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/25/16/54ed82ca42ddd_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=64" class="quan">
								仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=64">龙中龙男士棉服</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=64">
							仅售69元！价值398元的龙中龙男士棉服1件，可脱卸帽保暖加厚棉衣，青年休闲外套。
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>69</span>
							<span class="origin_price">门店价：&yen;398</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>1</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
								
			</ul>
			<div class="clear">     </div>
		</div>
	</div>
				<div class="index_cate" rel="index_mall_cate_29">
		<div class="title_row">
			<div class="title"><i class="diyfont"></i>&nbsp;&nbsp;母婴用品</div>
			<ul>
								<li><a href="/index.php?ctl=cate&cid=36">
书包</a> | </li>
								<li><a href="/index.php?ctl=cate&cid=37">
玩具</a></li>
				
			</ul>
			<a href="/index.php?ctl=cate&cid=29" class="more">更多</a>
		</div>
		<div class="content_row clearfix">
			<ul class="tuan_list">
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=85" 
title="仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/cc/11633e206018d83eeebf0022a88f7082.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag6"></h2>
											
							<h2 class="tag7"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=85" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/11/54ee8ea70c607_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=85" class="quan">
								【包邮】励高早教胎教故事机							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=85">励高早教胎教故事机</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=85">
							仅售68元！价值298元的励高早教胎教故事机1个，内置高清丰富早教资源内容，可插卡扩充内存容量，充电抗摔，明灯安抚，高保真HIFI喇叭，聚合物电池，使用时间长，加上超萌造型，让孩子们爱不释手。芭比妈咪们赶快把她带到宝宝身边吧！
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>69</span>
							<span class="origin_price">门店价：&yen;268</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=84" 
title="仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/c1/04e0406e5703e58fe88e84fc6efd2ba1.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag6"></h2>
											
							<h2 class="tag7"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=84" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/11/54ee8e5a53e8a_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=84" class="quan">
								【包邮】奥兰奇儿童动物书包							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=84">奥兰奇儿童动物书包</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=84">
							仅售19.9元！价值99元的奥兰奇儿童动物书包1个，可爱卡通书包，让宝宝爱上学习！
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>189.9</span>
							<span class="origin_price">门店价：&yen;99</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=83" 
title="仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/c1/7b1e532f8fe39ebc9acbe4ca98c815ec.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag7"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=83" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/11/54ee8e0243272_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=83" class="quan">
								【2件包邮】骥龙免洗宝宝饭兜							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=83">骥龙免洗宝宝饭兜</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=83">
							仅售9.9元！价值59元的骥龙免洗宝宝饭兜1件，加厚设计 防止食物吐出掉落 材质安全柔软 贴心舒适人性化弧度 让宝宝感受不到束缚 耐用易清洁 是宝宝吃饭喝汤的好帮手 3色可选 购买4只送1只 赠品颜色随机
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>9.9</span>
							<span class="origin_price">门店价：&yen;59</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
				
				
				<li>
					<div class="tuan_item tuan_item_border">
						
						<div rel="qrcode" class="scanbox_deal_list">
						<a class="scan_outter" href="/index.php?ctl=deal&act=82" 
title="仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图">
							<table><tr><td><img src="http://wap.hhccw.local/public/images/qrcode/cc/bb2b39f8e429dadb3e503c9a9906036c.png" /> </td></tr></table>
							<div></div>
						</a>
						</div>
						<div class="tuan_img">
							<div class="tags">	
											
							<h2 class="tag9"></h2>
																					</div>	
							<a href="/index.php?ctl=deal&act=82" class="img"><img lazy="true" data-src="http://wap.hhccw.local/public/attachment/201502/26/11/54ee8d61e43bd_275x200.jpg" />
</a>
							
							<a href="/index.php?ctl=deal&act=82" class="quan">
								【包邮】影响孩子的四大名著							</a>
							
						</div>
						<div class="tuan_name">
							<a href="/index.php?ctl=deal&act=82">影响孩子的四大名著</a>
						</div>
						<div class="tuan_brief">
							<a href="/index.php?ctl=deal&act=82">
							仅售59.8元！价值103.2元的影响孩子的四大名著1套，影响孩子的四大名著4册1套、每册155页、16开、每页都有彩图
							</a>
						</div>
						<div class="tuan_price">
							<span class="current_price"><i>&yen;</i>59.8</span>
							<span class="origin_price">门店价：&yen;103.2</span>
						</div>
						<div class="tuan_extra">
							<div class="sale_count">
								已售<span>0</span>
							</div>
							<div class="sale_review">							
					        	<span>
					        	<input class="ui-starbar" value="0.0000" disabled="true"  />
								</span>
								</span>
								<span class="review_count"><i>0</i>人点评</span>						
							</div>
						</div>
					</div>   <!--end tuan_item-->
				</li>
				
								
			</ul>
			<div class="clear">     </div>
		</div>
	</div>
		
	
</div>
<!--end 推荐团购分类-->
<div class="footer_box">
<div class="footer_inner_box">
<div class="wrap_full_w main_layout clearfix">
	<div class="help_row f_l">
				<span>
		<dl>
			<dt><i class="diyfont">&#58899;</i>&nbsp;公司信息</dt>
			<dd>
				<ul>
										<li><b></b><a href="/index.php?ctl=help&act=31">公司简介</a></li>
										<li><b></b><a href="/index.php?ctl=help&act=30">联系我们</a></li>
										<li><b></b><a href="/index.php?ctl=help&act=20">关于我们</a></li>
										<li><b></b><a href="/index.php?ctl=user&act=register">加入我们</a></li>
									</ul>
			</dd>
		</dl>
		</span>
				<span>
		<dl>
			<dt><i class="diyfont">&#58898;</i>&nbsp;获取更新</dt>
			<dd>
				<ul>
										<li><b></b><a href="/index.php?ctl=rss">RSS订阅</a></li>
									</ul>
			</dd>
		</dl>
		</span>
				<span>
		<dl>
			<dt><i class="diyfont">&#58891;</i>&nbsp;商务合作</dt>
			<dd>
				<ul>
										<li><b></b><a href="/index.php?ctl=help&act=29">咨询热点</a></li>
										<li><b></b><a href="/index.php?ctl=link">友情链接</a></li>
									</ul>
			</dd>
		</dl>
		</span>
				<span>
		<dl>
			<dt><i class="diyfont">&#58897;</i>&nbsp;用户帮助</dt>
			<dd>
				<ul>
										<li><b></b><a href="/index.php?ctl=help&act=28">隐私保护</a></li>
										<li><b></b><a href="/index.php?ctl=help&act=5">如何抽奖</a></li>
									</ul>
			</dd>
		</dl>
		</span>
				
	</div>
	<div class="foot_logo f_r">
		<a class="link" href="/">
				<span style='display:inline-block; width:200px; height:44px; background:url(http://wap.hhccw.local/public/attachment/201011/4cdd50ed013ec.png) no-repeat; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=http://wap.hhccw.local/public/attachment/201011/4cdd50ed013ec.png, sizingMethod=scale);_background-image:none;'></span>		</a>
	</div>
	<div class="blank"></div>
		<div class="friend_link">
		<ul>
						<li><a href="http://www.fanwe.com" target="_blank" title="方维o2o商业系统">方维o2o商业系统</a></li>
					</ul>
	</div><!--friend_link-->
	<div class="blank"></div>
		<div class="foot_info">
						电话：400-800-8888 周一至周六 9:00-18:00  
				&nbsp;&nbsp;
								
				&nbsp;&nbsp;
								<div style="text-align:center;">[方维o2o商业系统] <a target="_blank" href="http://www.fanwe.com">http://www.fanwe.com</a><br />
</div>
 			
								<div class="qq_div">
					<div class="qq_div_in">
																		<a class="qq_bg" href="http://wpa.qq.com/msgrd?v=3&uin=88888888&site=qq&menu=yes" target=_blank></a>
																								<a class="qq_bg" href="http://wpa.qq.com/msgrd?v=3&uin=9999999&site=qq&menu=yes" target=_blank></a>
																	
					</div>					
				</div>		
				<div class="blank"></div>
					</div>
	
</div><!--end foot_wrap-->
		
</div>
</div>
<div class="blank"></div>
<a id="go_top" href="javascript:void(0);"></a>
</body>
</html>";
?>