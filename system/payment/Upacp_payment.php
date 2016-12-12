<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(97139915@qq.com)
// +----------------------------------------------------------------------

$payment_lang = array(
	'name'	=>	'新银联支付',
	'upacp_mer_id'	=>	'商户号',
	'upacp_cert_pwd'	=>	'签名证书密码',

);
$config = array(
	'upacp_mer_id'	=>	array(
		'INPUT_TYPE'	=>	'0'
	), //商户代码: 
	'upacp_cert_pwd'	=>	array(
		'INPUT_TYPE'	=>	'0'
	), //校验码
);
/* 模块的基本信息 */
if (isset($read_modules) && $read_modules == true)
{
    $module['class_name']    = 'Upacp';

    /* 名称 */
    $module['name']    = $payment_lang['name'];


    /* 支付方式：1：在线支付；0：线下支付 */
    $module['online_pay'] = '1';

    /* 配送 */
    $module['config'] = $config;
    
    $module['lang'] = $payment_lang;
    $module['reg_url'] = 'https://open.unionpay.com/ajweb/product';
    return $module;
}

// 支付宝支付模型
require_once(APP_ROOT_PATH.'system/libs/payment.php');

require_once(APP_ROOT_PATH.'system/payment/upacp/common.php');
require_once(APP_ROOT_PATH.'system/payment/upacp/httpClient.php');
require_once(APP_ROOT_PATH.'system/payment/upacp/PublicEncrypte.php');
require_once(APP_ROOT_PATH.'system/payment/upacp/secureUtil.php');
require_once(APP_ROOT_PATH.'system/payment/upacp/log.class.php');
require_once(APP_ROOT_PATH.'system/payment/upacp/PinBlock.php');

// cvn2加密 1：加密 0:不加密
define('SDK_CVN2_ENC','0');
// 有效期加密 1:加密 0:不加密
define('SDK_DATE_ENC','0');
// 卡号加密 1：加密 0:不加密
define('SDK_PAN_ENC','0');
//日志级别
define('SDK_LOG_LEVEL','INFO');


// ######(以下配置为PM环境：入网测试环境用，生产环境配置见文档说明)#######
// 签名证书路径
define('SDK_SIGN_CERT_PATH',APP_ROOT_PATH.'system/payment/upacp/certs/sign_cert_acp.pfx');

// 密码加密证书（这条用不到的请随便配）
define('SDK_ENCRYPT_CERT_PATH', APP_ROOT_PATH.'system/payment/upacp/certs/verify_sign_acp.cer');

// 验签证书路径（请配到文件夹，不要配到具体文件）
define('SDK_VERIFY_CERT_DIR',APP_ROOT_PATH.'system/payment/upacp/certs');

define('SDK_FILE_DOWN_PATH',APP_ROOT_PATH.'system/payment/upacp/file');
//define('SDK_LOG_FILE_PATH',APP_ROOT_PATH.'system/payment/upacp/logs');



// 前台请求地址 正式
//define('SDK_FRONT_TRANS_URL','https://gateway.95516.com/gateway/api/frontTransReq.do');
//前台请求地址 测试
//define('SDK_FRONT_TRANS_URL','https://101.231.204.80:5000/gateway/api/frontTransReq.do');
/*
// 后台请求地址
define('SDK_BACK_TRANS_URL','https://101.231.204.80:5000/gateway/api/backTransReq.do');

// 批量交易
define('SDK_BATCH_TRANS_URL','https://101.231.204.80:5000/gateway/api/batchTrans.do');

//单笔查询请求地址
define('SDK_SINGLE_QUERY_URL','https://101.231.204.80:5000/gateway/api/queryTrans.do');

//文件传输请求地址
define('SDK_FILE_QUERY_URL','https://101.231.204.80:9080/');

//有卡交易地址
define('SDK_Card_Request_Url','https://101.231.204.80:5000/gateway/api/cardTransReq.do');

//App交易地址
define('SDK_App_Request_Url','https://101.231.204.80:5000/gateway/api/appTransReq.do');
*/




class Upacp_payment implements payment {

	public function get_payment_code($payment_notice_id)
	{
		$payment_notice = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment_notice where id = ".$payment_notice_id);
		$order_sn = $GLOBALS['db']->getOne("select order_sn from ".DB_PREFIX."deal_order where id = ".$payment_notice['order_id']);
		$money = round($payment_notice['money'],2);
		$payment_info = $GLOBALS['db']->getRow("select id,config,logo,name from ".DB_PREFIX."payment where id=".intval($payment_notice['payment_id']));
		$payment_info['config'] = unserialize($payment_info['config']);

		
		$data_return_url = SITE_DOMAIN.APP_ROOT.'/index.php?ctl=payment&act=response&class_name=Upacp';
		$data_notify_url = SITE_DOMAIN.APP_ROOT.'/index.php?ctl=payment&act=notify&class_name=Upacp';

		// 签名证书密码
		define('SDK_SIGN_CERT_PWD',$payment_info['config']['upacp_cert_pwd']);
		
		//print_r(getSignCertId ());exit;
		
		$params = array(
				'version' => '5.0.0',				//版本号
				'encoding' => 'utf-8',				//编码方式
				'certId' => getSignCertId (),			//证书ID
				'txnType' => '01',				//交易类型
				'txnSubType' => '01',				//交易子类
				'bizType' => '000201',				//业务类型
				'frontUrl' =>  $data_return_url,  		//前台通知地址
				'backUrl' => $data_notify_url,		//后台通知地址
				'signMethod' => '01',		//签名方法
				'channelType' => '07',		//渠道类型，07-PC，08-手机
				'accessType' => '0',		//接入类型
				'merId' => $payment_info['config']['upacp_mer_id'],		        //商户代码，请改自己的测试商户号
				'orderId' => $payment_notice['notice_sn'],	//商户订单号
				'txnTime' => to_date(get_gmtime(), 'YmdHis'),	//订单发送时间
				'txnAmt' => $money * 100,		//交易金额，单位分
				'currencyCode' => '156',	//交易币种
				'defaultPayType' => '0001',	//默认支付方式
				//'orderDesc' => '订单描述',  //订单描述，网关支付和wap支付暂时不起作用
				'reqReserved' =>$payment_notice_id, //请求方保留域，透传字段，查询、通知、对账文件中均会原样出现
		);
		
		//print_r($params);exit;
		
		sign ( $params );
		
		//$html = create_html ($params,SDK_FRONT_TRANS_URL );
		
		//print_r($html);exit;
		
	//	return $html;
		if ($payment_info['config']['upacp_mer_id'] == '700000000000001'){		
			//测试帐户
			$payLinks = '<form action="https://101.231.204.80:5000/gateway/api/frontTransReq.do" method="POST" target="_blank" >';
		}else{
			//正式帐户
			$payLinks = '<form action="https://gateway.95516.com/gateway/api/frontTransReq.do" method="POST" target="_blank" >';
		}
		
		foreach ( $params as $key => $value ) {
			$payLinks .= "    <input type=\"hidden\" name=\"{$key}\" id=\"{$key}\" value=\"{$value}\" />\n";
		}
		
		$payLinks .= '<button type="submit" class="ui-button paybutton" rel="blue">'.$payment_info['name'].'</button></form>';
		
		$code = '<div style="text-align:center">'.$payLinks.'</div>';
		$code.="<br /><div style='text-align:center' class='red'>".$GLOBALS['lang']['PAY_TOTAL_PRICE'].":".format_price($money)."</div>";
		return $code;
		
		
       /*
		$payLinks = '<form action="https://mapi.alipay.com/gateway.do?'.$param. '&sign='.$sign_md5.'&sign_type=MD5" method="POST" target="_blank" ><button type="submit" class="ui-button paybutton" rel="blue">前往支付宝在线支付</button></form>';


		
        $code = '<div style="text-align:center">'.$payLinks.'</div>';
		$code.="<br /><div style='text-align:center' class='red'>".$GLOBALS['lang']['PAY_TOTAL_PRICE'].":".format_price($money)."</div>";
        return $code;
        */
	}	

	public function response($request)
	{
        
		unset($request['city']);
		unset($request['ctl']);
		unset($request['act']);
		unset($request['class_name']);
		unset($_POST['city']);
		unset($_POST['ctl']);
		unset($_POST['act']);
		unset($_POST['class_name']);
				
		$return_res = array(
			'info'=>'',
			'status'=>false,
		);
		$payment = $GLOBALS['db']->getRow("select id,config from ".DB_PREFIX."payment where class_name='Upacp'");  
    	$payment['config'] = unserialize($payment['config']);
    	
    	if(!isset ( $_POST ['signature'] )){
    		showErr("签名为空");
    	}
    	elseif($_POST ['respCode']=="00" && verify ( $_POST )){
    		$payment_notice_sn = $_POST['orderId'];
    		$outer_notice_sn = $_POST['queryId'];
    		
			$payment_notice = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment_notice where notice_sn = '".$payment_notice_sn."'");
			$order_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id = ".$payment_notice['order_id']);
			require_once APP_ROOT_PATH."system/model/cart.php";
			
			$rs = payment_paid($payment_notice['id']);						
			if($rs)
			{
				$rs = order_paid($payment_notice['order_id']);				
				if($rs)
				{
					//开始更新相应的outer_notice_sn					
					$GLOBALS['db']->query("update ".DB_PREFIX."payment_notice set outer_notice_sn = '".$outer_notice_sn."' where id = ".$payment_notice['id']);
					if($order_info['type']==0)
					app_redirect(url("index","payment#done",array("id"=>$payment_notice['order_id']))); //支付成功
					else
					app_redirect(url("index","payment#incharge_done",array("id"=>$payment_notice['order_id']))); //支付成功
				}
				else 
				{
					if($order_info['pay_status'] == 2)
					{				
						if($order_info['type']==0)
						app_redirect(url("index","payment#done",array("id"=>$payment_notice['order_id']))); //支付成功
						else
						app_redirect(url("index","payment#incharge_done",array("id"=>$payment_notice['order_id']))); //支付成功
					}
					else
					app_redirect(url("index","payment#pay",array("id"=>$payment_notice['id']))); 
				}
			}
			else
			{
				app_redirect(url("index","payment#pay",array("id"=>$payment_notice['id']))); 
			}
		}else{
		    showErr($GLOBALS['payment_lang']["PAY_FAILED"]);
		}   
	}
	
	public function notify($request)
	{
		unset($request['city']);
		unset($request['ctl']);
		unset($request['act']);
		unset($request['class_name']);
		unset($_POST['city']);
		unset($_POST['ctl']);
		unset($_POST['act']);
		unset($_POST['class_name']);
				
		$return_res = array(
			'info'=>'',
			'status'=>false,
		);
		$payment = $GLOBALS['db']->getRow("select id,config from ".DB_PREFIX."payment where class_name='Upacp'");  
    	$payment['config'] = unserialize($payment['config']);
    	
    	if(!isset ( $_POST ['signature'] )){
    		showErr("签名为空");
    	}
    	elseif(verify ( $_POST )){
    		$payment_notice_sn = $_POST['orderId'];
    		$outer_notice_sn = $_POST['queryId'];
    		
			$payment_notice = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment_notice where notice_sn = '".$payment_notice_sn."'");
			$order_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id = ".$payment_notice['order_id']);
			require_once APP_ROOT_PATH."system/model/cart.php";
			$rs = payment_paid($payment_notice['id']);								
			if($rs)
			{			
				$GLOBALS['db']->query("update ".DB_PREFIX."payment_notice set outer_notice_sn = '".$outer_notice_sn."' where id = ".$payment_notice['id']);				
				order_paid($payment_notice['order_id']);	
				echo "success";
			}
			else
			{
				echo "fail";
			}
			
		}else{
		   echo "fail";
		}   
	}
	
	public function get_display_code()
	{
		$payment_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment where class_name='Upacp'");
		if($payment_item)
		{
			$html = "<label class='ui-radiobox' rel='payment_rdo'><input type='radio' name='payment' value='".$payment_item['id']."' />";
	
			if($payment_item['logo']!='')
			{
				$html .= "<img src='".APP_ROOT.$payment_item['logo']."' />";
			}
			else
			{
				$html .= $payment_item['name'];
			}
			$html.="</label>";
			return $html;
		}
		else
		{
			return '';
		}
	}

	

}
?>