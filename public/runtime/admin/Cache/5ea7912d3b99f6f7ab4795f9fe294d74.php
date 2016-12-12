<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/style.css" />
<style type="text/css">
	
/**
 * 自定义的font-face
 */
@font-face {font-family: "diyfont";
  src: url('<?php echo APP_ROOT; ?>/public/iconfont/iconfont.eot?r=<?php echo time(); ?>'); /* IE9*/
  src: url('<?php echo APP_ROOT; ?>/public/iconfont/iconfont.eot?#iefix&r=<?php echo time(); ?>') format('embedded-opentype'), /* IE6-IE8 */
  url('<?php echo APP_ROOT; ?>/public/iconfont/iconfont.woff?r=<?php echo time(); ?>') format('woff'), /* chrome、firefox */
  url('<?php echo APP_ROOT; ?>/public/iconfont/iconfont.ttf?r=<?php echo time(); ?>') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
  url('<?php echo APP_ROOT; ?>/public/iconfont/iconfont.svg#iconfont&r=<?php echo time(); ?>') format('svg'); /* iOS 4.1- */}
.diyfont {
  font-family:"diyfont" !important;
  font-size:20px;
  font-style:normal;
  -webkit-font-smoothing: antialiased;
  -webkit-text-stroke-width: 0.2px;
  -moz-osx-font-smoothing: grayscale;
}

</style>
<script type="text/javascript">
 	var VAR_MODULE = "<?php echo conf("VAR_MODULE");?>";
	var VAR_ACTION = "<?php echo conf("VAR_ACTION");?>";
	var MODULE_NAME	=	'<?php echo MODULE_NAME; ?>';
	var ACTION_NAME	=	'<?php echo ACTION_NAME; ?>';
	var ROOT = '__APP__';
	var ROOT_PATH = '<?php echo APP_ROOT; ?>';
	var CURRENT_URL = '<?php echo btrim($_SERVER['REQUEST_URI']);?>';
	var INPUT_KEY_PLEASE = "<?php echo L("INPUT_KEY_PLEASE");?>";
	var TMPL = '__TMPL__';
	var APP_ROOT = '<?php echo APP_ROOT; ?>';
	
	//关于图片上传的定义
	var UPLOAD_SWF = '__TMPL__Common/js/Moxie.swf';
	var UPLOAD_XAP = '__TMPL__Common/js/Moxie.xap';
	var MAX_IMAGE_SIZE = '1000000';
	var ALLOW_IMAGE_EXT = 'zip';
	var UPLOAD_URL = '<?php echo u("File/do_upload_icon");?>';
	var ICON_FETCH_URL = '<?php echo u("File/fetch_icon");?>';
	var ofc_swf = '__TMPL__Common/js/open-flash-chart.swf';
	var SITE_URL = '<?php echo get_domain().APP_ROOT; ?>'+"/";
	var SITE_PATH = ROOT_PATH+'/';
</script>
<script type="text/javascript" src="__TMPL__Common/js/weixin/jquery.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.timer.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/plupload.full.min.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/ui_upload.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.bgiframe.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.weebox.js"></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/weebox.css" />
<script type="text/javascript" src="__TMPL__Common/js/swfobject.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/script.js"></script>

<script type="text/javascript" src="__ROOT__/public/runtime/admin/lang.js"></script>
<script type='text/javascript'  src='__ROOT__/admin/public/kindeditor/kindeditor.js'></script>
</head>
<body>
<div id="info"></div>

<script type="text/javascript" src="__TMPL__Common/js/weixin/nav_setting.js"></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/weixin/data.css" />
<script type="text/javascript">
	var navs = <?php echo ($navs_json); ?>;
	
	$(document).ready(function(){
		init_nav_row($("#nav_setting"));
	});
</script>
<div class="container-f">
	<div class="box-title clearfix">
		<div class="f_l">
			<h3>
				图文回复
			</h3>
		</div>
 	</div>
	<div class="box-content clearfix">
		<div class="row clearfix">
			<form action="<?php echo u("WeixinReply/save_news");?>" method="post" class="form-horizontal ajax_form">
				
				<div class="changeStepBox clearfix  cf">
					<div class="control-group-left clearfix cf f_l">
						<div class="control-group cf clearfix">
		                	<label class="control-label" for="weixin_account">
		                		关键词：
		                	</label>
							<div class="controls">
								<input type="text" name="keywords" id="keywords" class="input-xlarge ipt_require" value="<?php echo ($reply["keywords"]); ?>" />
								<span class="maroon">*</span>
								<span class="help-inline">用于配匹回复的关键词，多个关键词用空格分隔 </span>
							</div>
		                </div>
						<div class="control-group cf clearfix">
		                	<label class="control-label" for="match_type">
		                		全字匹配：
		                	</label>
							<div class="controls">
								<input type="checkbox" name="match_type" id="match_type" value="1" <?php if($reply["match_type"] == 1): ?>checked="checked"<?php endif; ?> />
								<span class="help-inline">选中则需要微信输入全部关键字才会显示此回复</span>
							</div>
		                </div>
						
						<div class="control-group cf clearfix">
		                	<label class="control-label" for="weixin_account">
		                		标题：
		                	</label>
							<div class="controls">
								<input type="text" name="reply_news_title" id="reply_news_title" class="textbox" value="<?php echo ($reply["reply_news_title"]); ?>" />
								<span class="maroon">*</span>
							</div>
		                </div>
		                
		                <div class="control-group cf clearfix">
		                	<label class="control-label" for="app_icon">
		                		图文封面图：
		                	</label>
							<div class="controls">
								
									<div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'reply_news_picurl';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='reply_news_picurl' name='reply_news_picurl' style='width:120px; height:25px;' ><?php echo ($reply["reply_news_picurl"]); ?></textarea> </div></div><input type='text' id='focus_reply_news_picurl' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='<?php if($reply["reply_news_picurl"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($reply["reply_news_picurl"]); ?><?php endif; ?>' <?php if($reply["reply_news_picurl"] != ''): ?>onclick='openimg("reply_news_picurl")'<?php endif; ?> style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_reply_news_picurl' /><img src='/admin/Tpl/default/Common/images/del.gif' style='<?php if($reply["reply_news_picurl"] == ''): ?>display:none;<?php else: ?>display:inline-block;<?php endif; ?> margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_reply_news_picurl' onclick='delimg("reply_news_picurl")' title='删除' />
									<span class="help-inline">建议大小:720*300px， 允许上传大小<?php echo intval(conf("MAX_IMAGE_SIZE")/1024);?>KB</span>
									
							</div>
		                </div>
						
						
						<div class="control-group cf clearfix">
		                	<label class="control-label" for="name">
		                		回复内容：
		                	</label>
							<div class="controls">
								<textarea  id="reply_news_description" name="reply_news_description" class="input-xlarge ipt_require" ><?php echo ($reply["reply_news_description"]); ?></textarea>
								<span class="maroon">*</span>
							</div>
		                </div>
						<script type="text/javascript">
var LOAD_REPLY_LIST_URL = "<?php echo u("WeixinReply/ajaxnews",array('main_id'=>$reply['id']));?>";
</script>
 <script type="text/javascript" src="__TMPL__Common/js/weixin/init_relate_reply.js"></script>
 <!-- 多图文 -->
<div class="control-group cf clearfix">
	<label class="control-label" > 多图文回复 </label>
	<div class="controls">
		<button type="button" class="btn" id="add_relate_reply">添加</button>
		<span class="help-inline">最多9个</span>
	</div>
</div>
<div class="control-group cf clearfix" id="relate_table_div" <?php if(!$relate_replys): ?>style="display:none;"<?php endif; ?> >
	<div class="controls" id="relate_reply_box">
 		<?php if($relate_replys): ?><table id="relate_table" class="dataTable">
			<tr>
				<th>操作</th>
				<th>回复内容</th>
			</tr>
 			<?php if(is_array($relate_replys)): foreach($relate_replys as $key=>$relate_reply): ?><tr>
				<td><a class="remove_relate" href="javascript:void(0);">删除</a></td>
				<td>
					<input type="hidden" value="<?php echo ($relate_reply["id"]); ?>" name="relate_reply_id[]" id="relate_reply_id_<?php echo ($relate_reply["id"]); ?>">
					<?php echo ($relate_reply["reply_news_description"]); ?>
				</td>
			</tr><?php endforeach; endif; ?>
		</table><?php endif; ?>
	</div>
</div>
<!-- 多图文 -->
						<div class="control-group cf clearfix" id="nav_setting">
		                	<label class="control-label" for="weixin_account">
		                		回复跳转链接：
		                	</label>
							<div class="controls">
		
							<select name="ctl" class="ctl">
									<?php if(is_array($navs)): foreach($navs as $key=>$nav_item): ?><option value="<?php echo ($key); ?>" <?php if($key == $reply['ctl']): ?>selected="selected"<?php endif; ?> ><?php echo ($nav_item["name"]); ?></option><?php endforeach; endif; ?>
							</select>										
							
							<span class="data" <?php if($reply['data'] == ''): ?>style="display:none;"<?php endif; ?>>				
								<span class="field_name"><?php echo ($reply["data_name"]); ?></span>&nbsp;&nbsp;<input type="text" class="textbox" name="data"  value="<?php echo ($reply["data"]); ?> "/>
							</span>
								
							</div>
		                </div>
 					</div>
 					<div class="cf clearfix"></div>
					<div class="form-actions">	                    
						<input type="hidden" name="id" value="<?php echo ($reply["id"]); ?>" />
	                    <input type="submit" class="btn btn-primary" value="保存" />
	                </div>
				</div>				
				
			
            </form>
		</div>
	</div>
</div>
 
</body>
</html>