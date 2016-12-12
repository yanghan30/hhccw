<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(97139915@qq.com)
// +----------------------------------------------------------------------

class uc_addressModule extends MainBaseModule
{

	public function index()
	{
		global_run();		
		init_app_page();
		
		$cart = intval($_REQUEST['cart']);
		$order_id = intval($_REQUEST['order_id']);
		if($cart)
		{
			if($order_id)
				es_session::set("wap_cart_set_address_url",wap_url("index","cart#order",array("id"=>$order_id)));
			else
				es_session::set("wap_cart_set_address_url",wap_url("index","cart#check"));
		}
		else
		{
			es_session::set("wap_cart_set_address_url","");
		}
		
		$param=array();		
		$data = request_api("uc_address","index",$param);
		
		if($data['user_login_status']!=LOGIN_STATUS_LOGINED){
			app_redirect(wap_url("index","user#login"));
		}
		
		foreach($data['consignee_list'] as $k=>$v){
			$data['consignee_list'][$k]['url']= wap_url("index","uc_address#add",array("id"=>$v['id']));
			$data['consignee_list'][$k]['del_url']=wap_url('index','uc_address#del',array('id'=>$v['id']));
			$data['consignee_list'][$k]['dfurl']=wap_url('index','uc_address#set_default',array('id'=>$v['id']));			
		}

		//print_r($data);exit;
		
		$GLOBALS['tmpl']->assign("data",$data);	
		$GLOBALS['tmpl']->display("uc_address_index.html");
	}
	
	public function add()
	{
		global_run();
		init_app_page();
		$cart = intval($_REQUEST['cart']);
		$order_id = intval($_REQUEST['order_id']);
		if($cart)
		{
			if($order_id)
				es_session::set("wap_cart_set_address_url",wap_url("index","cart#order",array("id"=>$order_id)));
			else
				es_session::set("wap_cart_set_address_url",wap_url("index","cart#check"));
		}
		else
		{
			es_session::set("wap_cart_set_address_url","");
		}
		
		$param=array();
		$param['id'] = intval($_REQUEST['id']);		
		$data = request_api("uc_address","add",$param);
		
		if($data['user_login_status']!=LOGIN_STATUS_LOGINED){
			app_redirect(wap_url("index","user#login"));
		}
		$GLOBALS['tmpl']->assign("data",$data);

		
		
		$GLOBALS['tmpl']->display("uc_address_add.html");	
	}
	

	public function save()
	{
		global_run();
		$param=array();
		$param['id'] = intval($_REQUEST['region_id']);
		$param['region_lv1'] = intval($_REQUEST['region_lv1']);
		$param['region_lv2'] = intval($_REQUEST['region_lv2']);
		$param['region_lv3'] = intval($_REQUEST['region_lv3']);
		$param['region_lv4'] = intval($_REQUEST['region_lv4']);
		$param['address'] = strim($_REQUEST['address']);
		$param['mobile'] = strim($_REQUEST['mobile']);
		$param['consignee'] = strim($_REQUEST['consignee']);
		$param['zip'] = strim($_REQUEST['zip']);
		$data = request_api("uc_address","save",$param);
// 		print_r($data);exit;
		if($data['user_login_status']!=LOGIN_STATUS_LOGINED){
			$result['info'] = "";
			$result['url'] = wap_url("index","user#login");
			ajax_return($result);
		}else{
			if($data['add_status']==0){
					$result['status'] = 0;
					$result['info']=$data['infos'];
					ajax_return($result);	
			}elseif($data['add_status']==1){
					$result['status'] = 1;
					$wap_cart_set_address_url = es_session::get("wap_cart_set_address_url","");
					if($wap_cart_set_address_url)
						$result['url'] = $wap_cart_set_address_url;
					else
						$result['url'] = wap_url("index","uc_address");
					ajax_return($result);					
			}
		}
		
		

	}

	public function del()
	{
			global_run();
			$param=array();
			$param['id'] = intval($_REQUEST['id']);
			$data = request_api("uc_address","del",$param);
			
			if($data['del_status']==1){
					$result['status'] = 1;
					$wap_cart_set_address_url = es_session::get("wap_cart_set_address_url","");
					if($wap_cart_set_address_url)
						$result['url'] = $wap_cart_set_address_url;
					else
						$result['url'] = wap_url("index","uc_address");				
					ajax_return($result);			
			}else{
					$result['status'] =0;					
					ajax_return($result);		
			}		
	
	}
	
	
	public function set_default()
	{
			global_run();
			$param=array();
			$param['id'] = intval($_REQUEST['id']);
			$data = request_api("uc_address","set_default",$param);
			
			if($data['set_status']==1){
					$result['status'] = 1;
					$wap_cart_set_address_url = es_session::get("wap_cart_set_address_url","");
					if($wap_cart_set_address_url)
						$result['url'] = $wap_cart_set_address_url;
					else
						$result['url'] = wap_url("index","uc_address");				
					ajax_return($result);			
			}else{
					$result['status'] =0;					
					ajax_return($result);		
			}		
	
	}
}
?>