<?php
// +----------------------------------------------------------------------
// | Fanweo2o商业系统 最新版V3.03.3285  。
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | 淘宝购买地址：http://cnlichuan.taobao.com
// +----------------------------------------------------------------------

class noticesModule extends MainBaseModule
{

	public function index()
	{
		global_run();		
		init_app_page();
		
		$cache_id  = md5(MODULE_NAME.ACTION_NAME.intval($_REQUEST['page']));		
		if (!$GLOBALS['tmpl']->is_cached('notice_index.html', $cache_id)){
				$param=array();
				$param['page'] = intval($_REQUEST['page']);
				$data = request_api("notice","index",$param);
				foreach($data['list'] as $k=>$v){
					$data['list'][$k]['url']=wap_url("index","notice",array("data_id"=>$v['id']));
				}
				//print_r($data);exit;
				
				if(isset($data['page']) && is_array($data['page'])){			
					$page = new Page($data['page']['data_total'],$data['page']['page_size']);   //初始化分页对象			
					$p  =  $page->show();					
					$GLOBALS['tmpl']->assign('pages',$p);
				}
				
				$GLOBALS['tmpl']->assign("data",$data);		
			
		}
		


		$GLOBALS['tmpl']->display("notice_index.html",$cache_id);
	}

	
}
?>