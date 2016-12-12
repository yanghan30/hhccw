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

<?php function get_handle($id)
	{
		return "<a href='javascript:del_lottery(".$id.");'>".l("DEL")."</a>";
	}
	function get_deal_name($deal_id)
	{
		$name = M("Deal")->where("id=".$deal_id)->getField("name");
		return "<span title='".$name."'>".msubstr($name)."</span>";
	} ?>
<script type="text/javascript">
	function del_lottery(id)
	{
		if(!id)
		{
			idBox = $(".key:checked");
			if(idBox.length == 0)
			{
				alert(LANG['DELETE_EMPTY_WARNING']);
				return;
			}
			idArray = new Array();
			$.each( idBox, function(i, n){
				idArray.push($(n).val());
			});
			id = idArray.join(",");
		}
		if(confirm(LANG['CONFIRM_DELETE']))
		$.ajax({ 
				url: ROOT+"?"+VAR_MODULE+"=DealOrder&"+VAR_ACTION+"=del_lottery&id="+id, 
				data: "ajax=1",
				dataType: "json",
				success: function(obj){
					$("#info").html(obj.info);
					if(obj.status==1)
					location.href=location.href;
				}
		});
	}
</script>
<div class="main">
<div class="main_title"><?php echo L("DEAL_LOTTERY");?></div>
<div class="blank5"></div>
<form name="search" action="__APP__" method="get">	

<div class="search_row">

		<?php echo L("DEAL_ID");?>：<input type="text" class="textbox" name="deal_id" value="<?php echo strim($_REQUEST['deal_id']);?>" style="width:30px;" />
		<?php echo L("USER_NAME_S");?>：<input type="text" class="textbox" name="user_name" value="<?php echo strim($_REQUEST['user_name']);?>" style="width:100px;" />
		<?php echo L("LOTTERY_SN");?>：<input type="text" class="textbox" name="lottery_sn" value="<?php echo strim($_REQUEST['lottery_sn']);?>" style="width:100px;" />

		
		<input type="hidden" value="DealOrder" name="m" />
		<input type="hidden" value="lottery_index" name="a" />
		<input type="submit" class="button" value="<?php echo L("SEARCH");?>" />
		<input type="button" class="button" value="<?php echo L("DEL");?>" onclick="del_lottery();" />

</div>
</form>
<div class="blank5"></div>
<!-- Think 系统列表组件开始 -->
<table id="dataTable" class="dataTable" cellpadding=0 cellspacing=0 ><tr><td colspan="7" class="topTd" >&nbsp; </td></tr><tr class="row" ><th width="8"><input type="checkbox" id="check" onclick="CheckAll('dataTable')"></th><th width="50px    "><a href="javascript:sortBy('id','<?php echo ($sort); ?>','DealOrder','lottery_index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('lottery_sn','<?php echo ($sort); ?>','DealOrder','lottery_index')" title="按照<?php echo L("LOTTERY_SN");?>    <?php echo ($sortType); ?> "><?php echo L("LOTTERY_SN");?>    <?php if(($order)  ==  "lottery_sn"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('user_id','<?php echo ($sort); ?>','DealOrder','lottery_index')" title="按照<?php echo L("LOTTERY_USER");?>    <?php echo ($sortType); ?> "><?php echo L("LOTTERY_USER");?>    <?php if(($order)  ==  "user_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('buyer_id','<?php echo ($sort); ?>','DealOrder','lottery_index')" title="按照<?php echo L("LOTTERY_BUYER");?>    <?php echo ($sortType); ?> "><?php echo L("LOTTERY_BUYER");?>    <?php if(($order)  ==  "buyer_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('deal_id','<?php echo ($sort); ?>','DealOrder','lottery_index')" title="按照<?php echo L("LOTTERY_DEAL");?><?php echo ($sortType); ?> "><?php echo L("LOTTERY_DEAL");?><?php if(($order)  ==  "deal_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th >操作</th></tr><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$deal_order): ++$i;$mod = ($i % 2 )?><tr class="row" ><td><input type="checkbox" name="key" class="key" value="<?php echo ($deal_order["id"]); ?>"></td><td>&nbsp;<?php echo ($deal_order["id"]); ?></td><td>&nbsp;<?php echo ($deal_order["lottery_sn"]); ?></td><td>&nbsp;<?php echo (get_user_name($deal_order["user_id"])); ?></td><td>&nbsp;<?php echo (get_user_name($deal_order["buyer_id"])); ?></td><td>&nbsp;<?php echo (get_deal_name($deal_order["deal_id"])); ?></td><td> <?php echo (get_handle($deal_order["id"])); ?>&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?><tr><td colspan="7" class="bottomTd"> &nbsp;</td></tr></table>
<!-- Think 系统列表组件结束 -->
 

<div class="blank5"></div>
<div class="page"><?php echo ($page); ?></div>
</div>
</body>
</html>