<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(97139915@qq.com)
// +----------------------------------------------------------------------


class youhuisModule extends MainBaseModule
{
	
	/**
	 * 优惠券列表接口
	 * 输入：
	 * cate_id: int 大分类ID
	 * tid: int 小分类ID
	 * page:int 当前的页数
	 * keyword: string 关键词
	 * qid: int 商圈ID
	 * order_type: string 排序类型(default(默认)/avg_point(评价倒序)/newest(时间倒序)/buy_count(销量倒序))
	 * 
	 * latitude_top:float 最上边纬线值 ypoint
	 * latitude_bottom:float 最下边纬线值 ypoint
	 * longitude_left:float 最左边经度值  xpoint
	 * longitude_right:float 最右边经度值 xpoint
	 * 
	 * 
	 * 
	 * 输出：
	 * city_id:int 当前城市ID
	 * area_id:int 当前大区ID
	 * quan_id:int 当前商圈ID
	 * cate_id:int 当前大分类ID
	 * page_title:string 页面标题
	 * page:array 分页信息 array("page"=>当前页数,"page_total"=>总页数,"page_size"=>分页量,"data_total"=>数据总量);
	 * item:array:array 优惠券列表，结构如下
	 *  Array
        (
            [0] => Array
                (
                    [id] => 21 [int] 优惠券ID
                    [distance] => 0 [float] 与当前位置的距离 (米)
                    [name] => 盛世经典牛排50元代金券 [string] 优惠券名称
                    [list_brief] => 盛世经典牛排50元代金券 [string] 优惠券列表介绍
                    [icon] => http://localhost/o2onew/public/attachment/201502/26/10/54ee8ae7cb6a2_140x85.jpg [string] 优惠券图片
                    [down_count] => 0 [int] 下载量
                    [youhui_type] => 0 [int] 0:满立减 1:折扣券
                    [begin_time] => 2015-02-01至2021-02-26 [string] 时间
                    [xpoint] => [float] 所在经度
                    [ypoint] => [float] 所在纬度
                )
         )
	 * bcate_list:array 大类列表
	 * 结构如下
	 * Array(
	 * 		Array
	        (
	            [id] => 0 [int]分类ID
	            [name] => 全部分类 [string] 分类名
	            [icon_img] => [string] app端使用的分类图标
	            [iconfont]=> [string] wap端使用的iconfont代码
	            [iconcolor]=> #f0f0f0 [string] 颜色配置 16进度
	            [bcate_type] => Array
	                (
	                    [0] => Array
	                        (
	                            [id] => 0 [int]小分类ID
	                            [cate_id] => 0 [int]父分类ID
	                            [name] => 全部分类 [string] 分类名称
	                        )
	
	                )
	
	        )
	 )
	 * quan_list:array 商圈列表
	 * 结构如下
	 * Array(
	 * 		Array
	        (
	            [id] => 0 [int] 大区ID
	            [name] => 全城 [string] 大区名称
	            [quan_sub] => Array
	                (
	                    [0] => Array
	                        (
	                            [id] => 0 [int] 小区ID
	                            [pid] => 0 [int] 大区ID
	                            [name] => 全城 [string] 商圈名称
	                        )
	
	                )
	
	        )
	 * )
	 * navs:array 排序菜单 
	 * 固定数据如下
	 * array(
			array("name"=>"默认","code"=>"default"),
			array("name"=>"好评","code"=>"avg_point"),
			array("name"=>"最新","code"=>"newest"),
			array("name"=>"销量","code"=>"buy_count"),
		);
	 * 
	 */
	public function index()
	{
		//缓存下来的地区配置
		$area_data = load_auto_cache("cache_area",array("city_id"=>$GLOBALS['city']['id']));
		
		$root = array();
		$catalog_id = intval($GLOBALS['request']['cate_id']);//商品分类ID
		$cata_type_id=intval($GLOBALS['request']['tid']);//商品二级分类
		$city_id = intval($GLOBALS['city']['id']);//城市分类ID			
		$page = intval($GLOBALS['request']['page']); //分页
		$keyword = strim($GLOBALS['request']['keyword']);
		$page=$page==0?1:$page;
		$quan_id = intval($GLOBALS['request']['qid']); //商圈id	
		$area_id = intval($area_data[$quan_id]['pid']); //大区id
		$order_type=strim($GLOBALS['request']['order_type']);


		$ytop = $latitude_top = floatval($GLOBALS['request']['latitude_top']);//最上边纬线值 ypoint
		$ybottom = $latitude_bottom = floatval($GLOBALS['request']['latitude_bottom']);//最下边纬线值 ypoint
		$xleft = $longitude_left = floatval($GLOBALS['request']['longitude_left']);//最左边经度值  xpoint
		$xright = $longitude_right = floatval($GLOBALS['request']['longitude_right']);//最右边经度值 xpoint
		$ypoint =  $m_latitude = $GLOBALS['geo']['ypoint'];  //ypoint 
		$xpoint = $m_longitude = $GLOBALS['geo']['xpoint'];  //xpoint
		
		
		/*输出分类*/
		$bcate_list = getCateList();
		
		/*输出商圈*/
		$quan_list=getQuanList($city_id);
		
		
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;
	

		if($keyword)
		{
			$ext_condition ="  y.name like '%".$keyword."%' ";
		}
		
		if($xpoint>0)/* 排序（$order_type）  default 智能（默认），nearby  离我最近*/
		{		
			$pi = PI;  //圆周率
			$r = EARTH_R;  //地球平均半径(米)
			$field_append = ", (ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((y.ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((y.ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (y.xpoint * $pi) / 180 ) ) * $r) as distance ";
			
			if($ybottom!=0&&$ytop!=0&&$xleft!=0&&$xright!=0)
			{
				if($ext_condition!="")
				$ext_condition.=" and ";
				$ext_condition.= " y.ypoint > $ybottom and y.ypoint < $ytop and y.xpoint > $xleft and y.xpoint < $xright ";
				
				$limit = 300;
			}
			$order = " distance asc ";
		}
		else
			$order = "";

		/*排序  
		 智能排序和 离我最的 是一样的 都以距离来升序来排序，只有这两种情况有传经纬度过来，就没有把 这两种情况写在 下面的判断里，写在上面了。
		default 智能（默认），nearby  离我，avg_point 评价，newest 最新，buy_count 人气，price_asc 价低，price_desc 价高 */
		if($order_type=='avg_point')/*评价*/
			$order= " y.avg_point desc  ";
		elseif($order_type=='newest')/*最新*/
			$order= " y.create_time desc  ";
		elseif($order_type=='buy_count')/*销量*/
			$order= " y.user_count desc  ";
			
			

		$condition_param = array("cid"=>$catalog_id,"tid"=>$cata_type_id,"aid"=>$area_id,"qid"=>$quan_id,"city_id"=>intval($GLOBALS['city']['id']));
		require_once APP_ROOT_PATH."system/model/youhui.php";
		$deal_result  = get_youhui_list($limit,array(YOUHUI_NOTICE,YOUHUI_ONLINE),$condition_param,"",$ext_condition,$order,$field_append);
		
		$list = $deal_result['list'];
		$count= $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."youhui as y where ".$deal_result['condition']);
		
		$page_total = ceil($count/$page_size);
		
		$root = array();

		$goodses = array();
		foreach($list as $k=>$v)
		{
			$goodses[$k] = format_youhui_list_item($v);
		}
		
		$root['city_id']= $city_id;
		$root['area_id']= $area_id;
		$root['quan_id']= $quan_id;
		$root['cate_id']=$catalog_id;
	
		$root['page_title'] = $GLOBALS['m_config']['program_title']?$GLOBALS['m_config']['program_title']." - ":"";
		$root['page_title'].="优惠券列表";
		
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size,"data_total"=>$count);
		
		$root['item'] = $goodses?$goodses:array();
		$root['bcate_list'] = $bcate_list?$bcate_list:array();
		$root['quan_list'] = $quan_list?$quan_list:array();
		
		//排序类型(default(默认)/avg_point(评价倒序)/newest(时间倒序)/buy_count(销量倒序)/price_asc(价格升序)/price_desc(价格降序))
		$root['navs'] = array(
			array("name"=>"默认","code"=>"default"),
			array("name"=>"好评","code"=>"avg_point"),
			array("name"=>"最新","code"=>"newest"),
			array("name"=>"下载量","code"=>"buy_count")
		);
		
		output($root);
	}
	
}
?>