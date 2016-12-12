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
</script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.js"></script>
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

<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.php?lang=zh-cn" ></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/js/calendar/calendar.css" />
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/brand.js"></script>
<div class="main">
<div class="main_title"><?php echo L("EDIT");?> <a href="<?php echo u("Brand/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("BRAND_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="name" value="<?php echo ($vo["name"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SHOP_CATE_TREE");?>:</td>
		<td class="item_input">
		<select name="shop_cate_id">
			<option value="0">==<?php echo L("NO_SELECT_CATE");?>==</option>
			<?php if(is_array($cate_tree)): foreach($cate_tree as $key=>$cate_item): ?><option value="<?php echo ($cate_item["id"]); ?>" <?php if($vo['shop_cate_id'] == $cate_item['id']): ?>selected="selected"<?php endif; ?>><?php echo ($cate_item["title_show"]); ?></option><?php endforeach; endif; ?>
		</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">所属分类名称:</td>
		<td class="item_input"><input type="text" class="textbox" name="tag" value='<?php echo ($vo["tag"]); ?>' /></td>
	</tr>
	<!-- 
	<tr>
		<td class="item_title"><?php echo L("BRAND_LOGO");?>:</td>
		<td class="item_input"><div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'logo';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='logo' name='logo' style='width:120px; height:25px;' ><?php echo ($vo["logo"]); ?></textarea> </div></div><input type='text' id='focus_logo' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='<?php if($vo["logo"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($vo["logo"]); ?><?php endif; ?>' <?php if($vo["logo"] != ''): ?>onclick='openimg("logo")'<?php endif; ?> style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_logo' /><img src='/admin/Tpl/default/Common/images/del.gif' style='<?php if($vo["logo"] == ''): ?>display:none;<?php else: ?>display:inline-block;<?php endif; ?> margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_logo' onclick='delimg("logo")' title='删除' /></td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("BRAND_PROMOTE");?>:</td>
		<td class="item_input">
			<select name="brand_promote">
				<option value="0" <?php if($vo['brand_promote'] == 0): ?>selected="selected"<?php endif; ?>><?php echo L("NO");?></option>
				<option value="1" <?php if($vo['brand_promote'] == 1): ?>selected="selected"<?php endif; ?>><?php echo L("YES");?></option>
			</select>
		</td>
	</tr>
	
	<tr class="brand_promote">
		<td class="item_title"><?php echo L("BRAND_PROMOTE_LOGO");?>:</td>
		<td class="item_input"><div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'brand_promote_logo';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='brand_promote_logo' name='brand_promote_logo' style='width:120px; height:25px;' ><?php echo ($vo["brand_promote_logo"]); ?></textarea> </div></div><input type='text' id='focus_brand_promote_logo' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='<?php if($vo["brand_promote_logo"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($vo["brand_promote_logo"]); ?><?php endif; ?>' <?php if($vo["brand_promote_logo"] != ''): ?>onclick='openimg("brand_promote_logo")'<?php endif; ?> style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_brand_promote_logo' /><img src='/admin/Tpl/default/Common/images/del.gif' style='<?php if($vo["brand_promote_logo"] == ''): ?>display:none;<?php else: ?>display:inline-block;<?php endif; ?> margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_brand_promote_logo' onclick='delimg("brand_promote_logo")' title='删除' /></td>
	</tr>
	
	<tr class="brand_promote">
		<td class="item_title"><?php echo L("BEGIN_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="begin_time" id="begin_time" value="<?php echo ($vo["begin_time"]); ?>" onfocus="this.blur(); return showCalendar('begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_begin_time');" />
			<input type="button" class="button" id="btn_begin_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_begin_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#begin_time').val('');" />	
		</td>
	</tr>
	<tr class="brand_promote">
		<td class="item_title"><?php echo L("END_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="end_time" id="end_time" value="<?php echo ($vo["end_time"]); ?>" onfocus="this.blur(); return showCalendar('end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_end_time');" />
			<input type="button" class="button" id="btn_end_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_end_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#end_time').val('');" />
		</td>
	</tr>

	<tr>
		<td class="item_title"><?php echo L("BRAND_BRIEF");?>:</td>
		<td class="item_input">
			 <script type='text/javascript'> var eid = 'editor';KE.show({id : eid,skinType: 'tinymce',allowFileManager : true,resizeMode : 0,items : [
							'source','fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
							'plainpaste', 'wordpaste', 'justifyleft', 'justifycenter', 'justifyright',
							'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
							'superscript', 'selectall', '-',
							'title', 'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold',
							'italic', 'underline', 'strikethrough', 'removeformat', 'image',
							'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink'
						]});</script><div  style='margin-bottom:5px; '><textarea id='editor' name='brief' style='width:750px; height:350px;' ><?php echo ($vo["brief"]); ?></textarea> </div>
		</td>
	</tr>
	-->	
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="sort" value="<?php echo ($vo["sort"]); ?>" />
		</td>
	</tr>	
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Brand" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="update" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("EDIT");?>" />
			<input type="reset" class="button" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>	 
</form>
</div>
</body>
</html>