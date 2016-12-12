<?php
/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: tools.php 111 2013-03-18 02:43:43Z xujiakun $
 */

/**
 * ����Ҫ��1��������ֻ�ܰ�����д��ĸ��Сд��ĸ������
 *           2�����볤�ȴ���6
 * �޸������ $password = ''���������а�������Ҫ��д��������룬���� $password = 'DiscuzX3' ��ע�⣺�벻Ҫ���������ó� DiscuzX3�����ⱻ�˻�֪��
 */
$tpassword = 'Huhui221115';

/*************************************���²���Ϊtools������ĺ��Ĵ��룬�벻Ҫ�����޸� 09-27 Tuesday**************************************/

error_reporting(0);
define('TMAGIC_QUOTES_GPC', function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc());

define('TOOLS_ROOT', dirname(__FILE__).'/');
define('DISCUZ_VERSION', '3.1');
define('TOOLS_DISCUZ_VERSION', 'Discuz! X'.DISCUZ_VERSION);
define('TOOLS_VERSION', 'Tools '.DISCUZ_VERSION);

$tools_versions = TOOLS_VERSION;
$tools_discuz_version = TOOLS_DISCUZ_VERSION;

if(!TMAGIC_QUOTES_GPC) {
	$_GET = taddslashes($_GET);
	$_POST = taddslashes($_POST);
	$_COOKIE = taddslashes($_COOKIE);
}

if (isset($_GET['GLOBALS']) || isset($_POST['GLOBALS']) ||  isset($_COOKIE['GLOBALS']) || isset($_FILES['GLOBALS'])) {
	show_msg('����ǰ�ķ��������к��зǷ��ַ����Ѿ���ϵͳ�ܾ�');
}

if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST)) {
	$_GET = array_merge($_GET, $_POST);
}

$actionarray = array('index', 'setadmin', 'closesite', 'closeplugin', 'repairdb', 'reinstall' , 'restoredb', 'updatecache', 'login', 'logout');
$_GET['action'] = htmlspecialchars($_GET['action']);
$action = in_array($_GET['action'], $actionarray) ? $_GET['action'] : 'index';

if(!is_login()) {
	login_page();
	exit;
}

$t = new T();
$t->init();
$config = $t->config;

if($action == 'index') {
    // TODO: ��ҳ
	show_header();
	print<<<END
	<p>��ӭʹ�� Tools ֮ Discuz! �����书�ܣ�����������Ϊ����� Discuz! վ��Ľ������ϣ���ӭ��λվ��������ʹ�á�</p>
	<tr><td>
	<h5>���ð汾��</h5>
	<ul>
		<li>{$tools_discuz_version}</li>
	</ul>
	<h5>��Ҫ���ܣ�</h5>
	<ul>
		<li>���ù���Ա�˺ţ�������ָ���Ļ�Ա����Ϊ����Ա</li>
		<li>�����ر�վ�㣺  �˴����Խ���վ�㡰�ر�/�򿪡��Ĳ���</li>
		<li>һ���رղ����  һ���ر�Ӧ�����Ŀ��������в��</li>
		<li>�޸����ݿ⣺    ���������ݱ���м���޸�����</li>
		<li>�ָ����ݿ⣺    һ���Ե�����̳���ݱ���</li>
		<li>���»��棺      һ��������̳�����ݻ�����ģ�建��</li>
	</ul>
	<h5>���ⷴ����</h5>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;�й� Tools ������Ľ�������⣬�뷴���� Discuz! �ٷ���̳��װʹ������<a href="http://www.discuz.net/forum-2-1.html" target="_blank">http://www.discuz.net/forum-2-1.html</a>�������ǻ������������д����ύ����ʱ����ע��������Դ�� Discuz! �����䡣</p>
END;
	show_footer();

}elseif($action == 'reinstall') {
    // TODO: ��װdiscuz x
    
    function fun_reinstall($type,$path = false){
        $action = $_GET['action'];
        if($type === 'two'){
            if(is_file('./data/install.lock'))
            @unlink('./data/install.lock');
            if(is_file('./data/sendmail.lock'))
            @unlink('./data/sendmail.lock');
            if(is_dir('./install/'))
            show_msg('���ΰ�װ���̼�����ʼ....', 'install/', 2000);  
            show_msg('�Ҳ�������Ҫ�İ�װĿ¼install, �����޷���װ', 'tools.php?action='.$action, 2000); 
        }else{
           $back_dir = './backs_'.date('Y-m-d-H').'/';
           if(!is_dir($back_dir = $back_dir.ltrim($path,'./'))){
                mkdir($back_dir);
           }
           $list = scandir($path);
           foreach($list AS $val){
                if($val == '.' || $val == '..' || $val === 'tools.php' || strpos($val,'backs_') !== false)
                    continue;
                
                if(is_dir($path.$val.'/')){
                    fun_reinstall($type, $path.$val.'/');
                }else{
                    copy($path.$val, $back_dir.$val);
                    @unlink($path.$val);
                }
           }
           if($path != './')
           @rmdir($path);
        }
    }
    if(!$_POST)
	show_header();
    $downlink = 'http://download.comsenz.com/DiscuzX/'.DISCUZ_VERSION.'/';
    $cachepath = is_dir('./data/')?'./data/':'./';
    # post ����
    if($_POST){
        $chfile = $_POST['chfile'];
        define('YESINSTALL', $_POST['yesinstall']+0);
        if(!$chfile)
           show_msg('������ѡ��һ��!', 'tools.php?action='.$action, 2000);  
        
        if(!in_array($chfile, array('two','clear'))){
            $link = $downlink.$chfile;
            set_time_limit(0);
            
            if(!YESINSTALL){
                $olddir = scandir('./');
                if(count($olddir) >= 20){
                    show_msg('��Ŀ¼�Ѿ�����discuz�ļ�, ��ȷ�ϲ��ҹ�ѡǿ�Ƹ����ļ�, ����һ��!', 'tools.php?action='.$action, 2000);
                }
            }
            
            $fwint = file_put_contents($cachepath.$chfile, curl_getdata($link));
            $zip = new zip();
            $b = $zip->Extract($cachepath.$chfile,'./');
            $oldfile = sfopen(true);
            
            @unlink($cachepath.$chfile);
            if(count($oldfile[1]) > 1000){
                if(is_file('./data/install.lock'))
                @unlink('./data/install.lock');
                if(is_file('./data/sendmail.lock'))
                @unlink('./data/sendmail.lock');
                show_msg('���ΰ�װ���̼�����ʼ....', 'install/', 2000);
            }
            
            show_msg('�������Ҫȫ�°�װ����, �������Ŀ¼!'.count($oldfile[1]), 'tools.php?action='.$action, 2000);  
        }else{
            fun_reinstall($_POST['chfile'],'./');
            if($_POST['chfile'] !== 'two'){
                show_msg('����discuzĿ¼�Ѿ��������', 'tools.php?action='.$action, 2000);  
            }
        }
        exit();
    }
    
    if(!$filelist = curl_getdata($downlink))
    if(!$filelist = curl_getdata($downlink))
        echo '��ȷ����������Ƿ�ͨ��!';
    
    if($filelist){
        preg_match_all('#<a href="([^"]*).zip">([^"]*).zip</a>.*([0-9]*-[0-9]*-[0-9]* [0-9]*\:[0-9]*).*([0-9.]*)M#isU', $filelist, $regfile);
        if(!$regfile[1])
        preg_match_all('#<a href="([^"]*).zip">([^"]*).zip</a>#isU', $filelist, $regfile);
        
        foreach($regfile[1] AS $key => $val){
            if($regfile[4][$key])
                $regfile[4][$key] .= 'M';
            $val .= '.zip';
            $data .= '<p><input name="chfile" type="radio" value="'.$val.'" /> '.$val.'���� '.$regfile[3][$key].'���� '.$regfile[4][$key].'</p>';
        }
    }
		echo "<h3 style=\"color: green; font-weight: bolder; margin: 6px;  padding: 0;\">ȫ�°�װ: ".TOOLS_DISCUZ_VERSION."</h3>";
		print<<<END
		<form action="?action={$action}" method="post">
    		<table id="setadmin">
    			<tr><td>{$data}
                <input name="yesinstall" type="checkbox" value="1" /> <span style="color:red">ǿ�Ƹ��������ļ����Ұ�װ!</span>
                </td></tr>
    		</table>
			<input type="submit" onclick="this.style.display='none'" name="setadminsubmit" value="�� &nbsp; ��">
		</form>
        <br />
        <h3 style="color: green; font-weight: bolder; margin: 6px;  padding: 0;">���ΰ�װ</h3>
        <form action="?action={$action}" method="post">
    		<table id="setadmin">
    			<tr><td> <input name="chfile" type="radio" value="two" />ȷ�ϰ�װ (<span style="color:red">���Ѿ�֪��������װ�ķ���,������ȷ�˲���!</span>)</td></tr>
                <tr><td> <input name="chfile" type="radio" value="clear" />����Ŀ¼ (<span style="color:red">���ܽ�����discuzĿ¼��������</span>)</td></tr>
    		</table>
			<input type="submit" onclick="this.style.display='none'" name="setadminsubmit" value="�� &nbsp; ��">
		</form>
END;

if(!$_POST)
show_footer();
}elseif($action == 'setadmin') {
    // TODO: �һع���Ա
	$t->connect_db();
	$founders = @explode(',',$t->config['admincp']['founder']);
	$foundernames = array();
	foreach($founders as $userid) {
		$sql = "SELECT username FROM ".$t->dbconfig['tablepre']."common_member WHERE `uid`='$userid'";
		$foundernames[] = mysql_result(mysql_query($sql, $t->db), 0);
	}
	$foundernames = implode($foundernames, ',');
	$sql = "SELECT username FROM ".$t->dbconfig['tablepre']."common_member WHERE `adminid`='1'";
	$query = mysql_query($sql, $t->db) or dir(mysql_error());
	$adminnames = array();
	while($row = mysql_fetch_row($query)) {
		$adminnames[] = $row[0];
	}
	$adminnames = implode($adminnames, ',');
	
	if(!empty($_POST['setadminsubmit'])) {
		if($_GET['username'] == NULL) {
			show_msg('�������û���', 'tools.php?action='.$action, 2000);
		}
		
		if($_GET['loginfield'] == 'username') {
			$_GET['username'] = addslashes($_GET['username']);
			$sql = "SELECT uid FROM ".$t->dbconfig['tablepre']."common_member WHERE `username`='".$_GET['username']."'";
			$uid = mysql_result(mysql_query($sql, $t->db), 0);
			$username = $_GET['username'];
		} elseif($_GET['loginfield'] == 'uid') {
			$_GET['username'] = addslashes($_GET['username']);
			$uid = 	$_GET['username'];
			$sql = "SELECT username FROM ".$t->dbconfig['tablepre']."common_member WHERE `uid`='".$_GET['username']."'";
			$username = mysql_result(mysql_query($sql, $t->db), 0);
		}
		
		if($uid && $username) {
			$sql = "UPDATE ".$t->dbconfig['tablepre']."common_member SET `groupid`='1', `adminid`='1' WHERE `uid`='$uid'";
			@mysql_query($sql, $t->db);
			if(!in_array($uid,$founders)) {
				$sql = "REPLACE INTO ".$t->dbconfig['tablepre']. "common_admincp_member (`uid`, `cpgroupid`, `customperm`) VALUES ('$uid', '0', '')";
				@mysql_query($sql, $t->db);
			}
		} else {
			show_msg('û������û�', 'tools.php?action='.$action, 2000);
		}
		
		$t->connect_db('ucdb');
		if($_GET['password'] != NULL) {
			$sql = "SELECT salt FROM ".$t->ucdbconfig['tablepre']."members WHERE `uid`='$uid'";
			$salt = mysql_result(mysql_query($sql, $t->db), 0);
			$newpassword = md5(md5(trim($_GET['password'])).$salt);
			$sql = "UPDATE ".$t->ucdbconfig['tablepre']."members SET `password`='$newpassword' WHERE `uid`='$uid'";
			mysql_query($sql, $t->db);
		}
		if($_GET['issecques'] == 1) {
			$sql = "UPDATE ".$t->ucdbconfig['tablepre']."members SET `secques`='' WHERE `uid`='$uid'";
			mysql_query($sql, $t->db);
		}
		$t->close_db();
		show_msg('����Ա�һسɹ���', 'tools.php?action='.$action, 2000);
		
	} else {
		show_header();
		echo "<p>���д�ʼ�ˣ�$foundernames</p>";
		echo "<p>���й���Ա��$adminnames</p>";
		print<<<END
		<form action="?action={$action}" method="post">
		<h5>{$info}</h5>
		<table id="setadmin">
			<tr><th width="30%"><input class="radio" type="radio" name="loginfield" value="username" checked class="radio">�û���<input class="radio" type="radio" name="loginfield" value="uid" class="radio">UID</th><td width="70%"><input class="textinput" type="text" name="username" size="25" maxlength="40"></td></tr>
			<tr><th width="30%">����������</th><td width="70%"><input class="textinput" type="text" name="password" size="25"></td></tr>
			<tr><th width="30%">�Ƿ������ȫ����</th><td width="70%">
			<input class="radio" type="radio" name="issecques" value="1">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="radio" type="radio" name="issecques" value="0" class="radio" checked>��</td></tr>
		</table>
			<input type="submit" name="setadminsubmit" value="�� &nbsp; ��">
		</form>
END;
		print<<<END
		<br/>
		�ָ�����: 
		���ù���Ա<br/>
		<ul>
		<li>ѡ���û�������UID��</li>
		<li>�����û�������UID��</li>
		<li>�����Ҫ�������룬�������롣</li>
		<li>�����Ҫ�����ȫ���ʣ������Ƿ������ȫ���ʴ�ѡ���ǡ�</li>
		</ul>
		<br/>
		���ô�ʼ��<br/>
		<ul>
		<li>�����û�Ϊ��ʼ�ˡ�</li>
		<li>�޸�config_global.php �� \$_config['admincp']['founder'] = '����Ա��ID'������԰�Ƕ��ŷָ</li>
		</ul>
END;
		show_footer();
	}

}elseif($action == 'closesite') {
//һ������վ��
	$t->connect_db();
	$sql = "SELECT svalue FROM ".$t->dbconfig['tablepre']."common_setting WHERE skey='bbclosed'";
	$bbclosed = mysql_result(mysql_query($sql, $t->db), 0);

	if(empty($bbclosed)) {
		$closed = '';
		$opened = 'checked';
	} else {
		$closed = 'checked';
		$opened = '';
	}
	$sql = "SELECT svalue FROM ".$t->dbconfig['tablepre']."common_setting WHERE `skey`='closedreason'";
	$closedreason = mysql_result(mysql_query($sql, $t->db), 0);
	if(!empty($_GET['closesitesubmit'])) {
		if($_GET['close'] == 1) {
			$sql = "UPDATE ".$t->dbconfig['tablepre']."common_setting SET `svalue`='1' WHERE `skey`='bbclosed'";
			mysql_query($sql, $t->db);
			$sql = "UPDATE ".$t->dbconfig['tablepre']."common_setting SET `svalue`='tools.php closed' WHERE `skey`='closedreason'";
			mysql_query($sql, $t->db);
		} else {
			$sql = "UPDATE ".$t->dbconfig['tablepre']."common_setting SET `svalue`='0' WHERE `skey`='bbclosed'";
			mysql_query($sql, $t->db);
			$sql = "UPDATE ".$t->dbconfig['tablepre']."common_setting SET `svalue`='' WHERE `skey`='closedreason'";
			mysql_query($sql, $t->db);
		}
		show_msg('�ر�/��վ������ɹ������ڸ��»���...', 'tools.php?action=updatecache',2000);
	} else {
		show_header();
		print<<<END
		<h4>�ر�/��վ��</h4>
		�˴����Խ���վ�㡰�ر�/�򿪡��Ĳ�����
		<p>
		<form action="?action=closesite" method="post">
		վ�㵱ǰ״̬
		<input class="radio" type="radio" name="close" value="0" {$opened} class="radio">��
		<input class="radio" type="radio" name="close" value="1" {$closed} class="radio">�ر�
		</p>
		<p>
		<input type="submit" name="closesitesubmit" value="�� &nbsp; ��">
		</p>
		</form>
END;
		show_footer();
	}

}elseif($action == 'closeplugin') {
    // TODO: һ���رղ��
	include_once(TOOLS_ROOT.'source/class/class_core.php');
	include_once(TOOLS_ROOT.'source/function/function_core.php');

	$cachelist = array();
	$discuz = & discuz_core::instance();
	$discuz->cachelist = $cachelist;
	$discuz->init_cron = false;
	$discuz->init_setting = false;
	$discuz->init_user = false;
	$discuz->init_session = false;
	$discuz->init_misc = false;
	
	$discuz->init();
	require_once libfile('function/plugin');
	require_once libfile('function/cache');
	DB::query("UPDATE ".DB::table('common_plugin')." SET available='0'");
	updatecache(array('plugin', 'setting', 'styles'));
	cleartemplatecache();
    
	show_msg('�ɹ��ر����в��', 'tools.php?action=index',2000);

}elseif($action == 'repairdb') {
    // TODO: �޸����ݿ�
	show_header();
	$t->connect_db();
	$typearray = array('index', 'repair', 'repairtables', 'allrepair', 'check', 'detail');
	$type = in_array($_GET['type'], $typearray) ? $_GET['type'] : 'index';
	
	if($type == 'index') {
	print<<<END
	<div class=\"bm\">
		<table id="menu">
		<tr>
			<!--<td><a href="?action=repairdb&type=allcheck">һ�����</a></td>--!>
			<td><a href="?action=repairdb&type=allrepair">һ���޸�</a></td>
			<td><a href="?action=repairdb&type=detail">������ϸҳ������޸�</a></td>
		</tr>
		</table>
		˵�� & ��ʾ: 
		<ul>
			<!--<li>һ�����: �����ݿ������б���� CHECK TABLE �������г��𻵵����ݱ�</li>--!>
			<li>һ���޸�: ��ִ�� CHECK TABLE ������Ȼ���ռ��Ľ�����д�������ݱ�ִ��REPAIR TABLE ������</li>
			<li>������ϸҳ������޸�: �г���ϸ���Ե�����м����޸���</li>
			<li><span style="color:red">��ʾ1�����ݱ�Ƚϴ������£�mysql���ܻỨ�ѱȽϳ���ʱ����м����޸�������</span></li>
			<li><span style="color:red">��ʾ2��REPAIR TABLE ���������޸��������������޸��������ݱ����¼������ʹ��myisamchk�������ݱ��޸���</span></li>
		</ul>
	</div>
END;
	} elseif ($type == 'allrepair' || $type == 'allcheck' || $type == 'detail' || $type == 'check' || $type == 'repair' || $type == 'repairtables') {
		$sql = "SHOW TABLE STATUS";
		$tablelist = mysql_query($sql, $t->db);
		while($list = mysql_fetch_array($tablelist, MYSQL_ASSOC)) {
			if($type == 'allcheck' || $type == 'allrepair') {
				if($list['Engine'] != 'MEMORY' && $list['Engine'] != 'HEAP') {
					$sql = 'CHECK TABLE '.$list['Name'];
					$query = mysql_query($sql, $t->db);
					$checkresult = mysql_fetch_array($query, MYSQL_ASSOC);
					
					if( $checkresult['Msg_text'] != 'OK') {
						$tablelists[$list['Name']]['statu'] = $checkresult['Msg_text'];
						$tablelists[$list['Name']]['size'] = round(($list['Data_length'] + $list['Index_length'])/1024,2);
					}
				}
			} else {
				$tablelists[$list['Name']]['size'] = round(($list['Data_length'] + $list['Index_length'])/1024,2);
			}
		}
		if($type == 'allrepair') {
			foreach($tablelists as $table => $value) {
				$sql = "REPAIR TABLE `".$table."`";
				$query = mysql_query($sql, $t->db);
				$repairresult = mysql_fetch_array($query, MYSQL_ASSOC);
				$resulttable[$table]['statu'] = $repairresult['Msg_text'];
				$resulttable[$table]['size'] = 'δ���';
			}
			$tablelists = $resulttable;
		}

		if($type == 'check') {
			$_GET['table'] = addslashes($_GET['table']);
			$sql = 'CHECK TABLE '.$_GET['table'];
			$query = mysql_query($sql, $t->db);
			$checkresult = mysql_fetch_array($query, MYSQL_ASSOC);
			$tablelists[$_GET['table']]['statu'] = $checkresult['Msg_text'];
		}
		if($type == 'repair') {
			$_GET['table'] = addslashes($_GET['table']);
			$sql = "REPAIR TABLE `".$_GET['table']."`";
			$query = mysql_query($sql, $t->db);
			$repairresult = mysql_fetch_array($query, MYSQL_ASSOC);
			echo '<div style="background:red">';
			show_msg_body('�޸��� '.$_GET['table'].' �����'.$repairresult['Msg_text'], "tools.php?action=$action&type=detail", 3000);
			echo '</div>';
		}
		if($type == 'repairtables') {
			if($_POST['optimizesubmit']){
				$repairtables = addslashes($_POST['repairtables']);
				foreach ($repairtables as $value) {
					$sql = "REPAIR TABLE `".$value."`";
					$query = mysql_query($sql, $t->db);
					$repairresult = mysql_fetch_array($query, MYSQL_ASSOC);
					echo '<div style="background:red">';
					show_msg_body('�޸��� '.$value.' �����'.$repairresult['Msg_text'], '', 3000);
					echo '</div>';
				}
				echo '<div style="background:red">';
				show_msg_body('��ѡ�޸������', "tools.php?action=$action&type=detail", 3000);
				echo '</div>';
			}
		}
			echo '
			<script type="text/javascript">
				var BROWSER = {};
				var USERAGENT = navigator.userAgent.toLowerCase();
				browserVersion({\'ie\':\'msie\',\'firefox\':\'\',\'chrome\':\'\',\'opera\':\'\',\'safari\':\'\',\'mozilla\':\'\',\'webkit\':\'\',\'maxthon\':\'\',\'qq\':\'qqbrowser\'});
				function browserVersion(types) {
					var other = 1;
					for(i in types) {
						var v = types[i] ? types[i] : i;
						if(USERAGENT.indexOf(v) != -1) {
							var re = new RegExp(v + \'(\\/|\\s)([\\d\\.]+)\', \'ig\');
							var matches = re.exec(USERAGENT);
							var ver = matches != null ? matches[2] : 0;
							other = ver !== 0 && v != \'mozilla\' ? 0 : other;
						} else {
							var ver = 0;
						}
						eval(\'BROWSER.\' + i + \'= ver\');
						}
					BROWSER.other = other;
				}
				function jumpurl(url,nw) {
					if(BROWSER.ie) url += (url.indexOf(\'?\') != -1 ?  \'&\' : \'?\') + \'referer=\' + escape(location.href);
					if(nw == 1) {
						window.open(url);	
					} else {
						location.href = url;
					}
					return false;
				}
				</script>';
				echo '
				<script type="text/javascript">
				function checkAll(type, form, value, checkall, changestyle) {
					var checkall = checkall ? checkall : \'chkall\';
					for(var i = 0; i < form.elements.length; i++) {
						var e = form.elements[i];
						if(type == \'option\' && e.type == \'radio\' && e.value == value && e.disabled != true) {
							e.checked = true;
						} else if(type == \'value\' && e.type == \'checkbox\' && e.getAttribute(\'chkvalue\') == value) {
							e.checked = form.elements[checkall].checked;
							if(changestyle) {
								multiupdate(e);
							}
						} else if(type == \'prefix\' && e.name && e.name != checkall && (!value || (value && e.name.match(value)))) {
							e.checked = form.elements[checkall].checked;
							if(changestyle) {
								if(e.parentNode && e.parentNode.tagName.toLowerCase() == \'li\') {
									e.parentNode.className = e.checked ? \'checked\' : \'\';
								}
								if(e.parentNode.parentNode && e.parentNode.parentNode.tagName.toLowerCase() == \'div\') {
									e.parentNode.parentNode.className = e.checked ? \'item checked\' : \'item\';
								}
							}
						}
					}
				}
			</script>';
			print<<<END
			<div class=\"bm\">
				<table class=\"tb\">
					<tbody>
					<form name="cpform" method="post" autocomplete="on" action="tools.php?action=repairdb&type=repairtables" id="cpform">
					<tr>
						<th></th>
						<th width="350px">����</th>
						<th width="80px">��С</th>
						<th></th>
						<th width="80px"></th>
					</tr>
END;
			foreach($tablelists as $name => $value) {
				if($value['size'] < 1024) {
					echo '<tr><th><input class="checkbox" type="checkbox" name="repairtables[]" value="'.$name.'"></th><th>'.$name.'</th><td style="text-align:right;color:#339900"">'.$value['size'] .'KB</td><td>';
				} elseif(1024 < $value['size'] && $value['size']< 1048576 ) {
					echo '<tr><th><input class="checkbox" type="checkbox" name="repairtables[]" value="'.$name.'"></th><th>'.$name.'</th><td style="text-align:right;color:#3333FF">'.round($value['size']/1024,1) .'MB</td><td>';
				} elseif(1048576 < $value['size']){
					echo '<tr><th><input class="checkbox" type="checkbox" name="repairtables[]" value="'.$name.'"></th><th>'.$name.'</th><td style="text-align:right;color:#FF0000"">'.round($value['size']/1048576,1) .'GB</td><td>';
				}

				if(!isset($value['statu'])) {
					echo "<button type=\"button\" class=\"pn vm\" onclick=\"jumpurl('tools.php?action=repairdb&type=check&table=".$name."')\"><strong>���</button>";
				} elseif($value['statu']!='OK') {
					echo '<span class=\"red\">'.$value['statu'].'</span>';
				} else {
					echo $value['statu'];
				}

				echo '</td><td>';
				if($value['statu']!='OK' && $value['statu']!='Not Support CHECK') {
					echo "<button type=\"button\" class=\"pn vm\" onclick=\"jumpurl('tools.php?action=repairdb&type=repair&table=".$name."')\"><strong>�޸�</button></strong>";
				}
				echo '</td></tr>';
				}
				
			echo "<tr><th><input name=\"chkall\" id=\"chkall\" class=\"checkbox\" onclick=\"checkAll('prefix', this.form)\" type=\"checkbox\"></th><th><input type=\"submit\" class=\"btn\" id=\"submit_optimizesubmit\" name=\"optimizesubmit\" title=\"��ѡ�޸�\" value=\"��ѡ�޸�\"></th><td></td><td></td><td></td></form>";
			echo '</tbody></table></div>';
			if( count($tablelists) == 0) {
				echo '<div style="background:#00cc66;">û����Ҫ�޸��ı�</div>';
			}
	} elseif ($type == 'allrepair') {
		show_msg("�����ɹ�", "tools.php?action=$action");
	}
	show_footer();

}elseif($action == 'restoredb') {
//�ָ�����
	$backfiledir = TOOLS_ROOT.'data/';
	$detailarray = array();
	$t->connect_db();

	if(!mysql_select_db($t->dbconfig['name'], $t->db)) {
		$dbname = $t->dbconfig['name'];
		mysql_query("CREATE DATABASE $dbname");
	}

	if(!$_GET['importbak'] && !$_GET['nextfile']) {
		//����Ƿ�ر�վ��
		$sql = "SELECT svalue FROM ".$t->dbconfig['tablepre']."common_setting WHERE skey='bbclosed'";
		$closed = mysql_result(mysql_query($sql, $t->db), 0);
		if($closed != '1') {
			show_msg('�ָ�����ǰ�����ȹر�վ��!', 'tools.php?action=closesite', 3000);
		}
		$exportlog = array();
		$dir = dir($backfiledir);
		while($entry = $dir->read()) {
			$entry = $backfiledir."/$entry";
			$num = 0;
			if(is_dir($entry) && preg_match("/backup\_/i", $entry)) {
				$bakdir = dir($entry);
				while($bakentry = $bakdir->read()) {
					$bakentry = "$entry/$bakentry";
					if(is_file($bakentry) && preg_match("/(.*)\-(\d)\.sql/i", $bakentry,$match)) {
						if($_GET['detail']) {
							$detailarray[] = $match['1'];
						}
						$num++;	
					}
					if(is_file($bakentry) && preg_match("/\-1\.sql/i", $bakentry)) {
						$fp = fopen($bakentry, 'rb');
						$bakidentify = explode(',', base64_decode(preg_replace("/^# Identify:\s*(\w+).*/s", "\\1", fgets($fp, 256))));
						fclose ($fp);
						
						if(preg_match("/\-1\.sql/i", $bakentry) || $bakidentify[3] == 'shell') {
							$identify['bakentry'] = $bakentry;
						}
					}
				}
				$detailarray = array_reverse(array_unique($detailarray));
				
				if($num != 0) {
					$exportlog[$entry] = array(	
								'dateline' => date('Y-m-d H:i:s',$bakidentify[0]),
								'version' => $bakidentify[1],
								'type' => $bakidentify[2],
								'method' => $bakidentify[3],
								'volume' => $num,
								'bakentry' => $identify['bakentry'],
								'filename' => str_replace($backfiledir.'/','',$entry));
				}
			}
		}
	}else{
		$bakfile = $_GET['nextfile'] ? $_GET['nextfile'] : $_GET['importbak'];
		if(!file_exists($bakfile)) {
			if($_GET['nextfile']) {
				$tpl = dir(TOOLS_ROOT.'data/template');
				while($entry = $tpl->read()) {
					if(preg_match("/\.tpl\.php$/", $entry)) {
						@unlink(TOOLS_ROOT.'data/template/'.$entry);
					}
				}
				$tpl->close();
				show_msg('�ָ����ݳɹ�����鿴��̳��������ݲ�ͬ�����������ݿ�ǰ׺�����ڸ��»���...', 'tools.php?action=updatecache',2000);
			}
			show_msg('�����ļ������ڡ�');
		}
		if(!is_readable($bakfile)) {
			show_msg('�����ļ����ɶ�ȡ��');
		} else {
			@$fp = fopen($bakfile, "r");
			@flock($fp, 3);
			$sqldump = @fread($fp, filesize($bakfile));
			@fclose($fp);
		}
		@$bakidentify = explode(',', base64_decode(preg_replace("/^# Identify:\s*(\w+).*/s", "\\1", substr($sqldump, 0, 256))));
		if(!defined('IN_DISCUZ')) {
			define('IN_DISCUZ', TRUE);
		}
		include_once(TOOLS_ROOT.'source/discuz_version.php');
		if($bakidentify[1] != DISCUZ_VERSION) {
			show_msg('�����ļ��汾���󣬲��ָܻ���');		
		}
		$vol = $bakidentify[4];
		
		$nextfile = taddslashes(str_replace("-$vol.sql","-".($vol+1).'.sql',$bakfile));
		$result = $t->db_runquery($sqldump);
		if($result) {
			show_msg('���ڻָ��־�'.$vol,"tools.php?action=$action&nextfile=$nextfile", 2000);	
		}
	}
	$t->close_db();
	show_header();
	print<<<END
	<div class="bm">
	<form action="tools.php?action={$action}" method="post">
	<table class="tdat"><tbody>
	<tr class=\'alt h\'><th>������Ŀ</th><th>�汾</th><th>ʱ��</th><th>����</th><th>�ļ�����</th><th>����</th></tr>
END;
	foreach( $exportlog  as $value) {
		echo '<tr><td>'.$value['filename'].'</td><td>'.$value['version'].'</td><td>'.$value['dateline'].'</td><td>'.$value['method'].'</td><td>'.$value['volume'].'</td><td><a href="tools.php?action='.$action.'&detail='.$value['filename'].'"><font color="blue">��</font></a></td></tr>';
	}
	if (count($detailarray)>0) {
		foreach($detailarray as $value) {
			echo '<tr><td colspan="5">'.$value.'</td><td><a href="tools.php?action='.$action.'&importbak='.$value.'-1.sql"><font color="blue">����</font></a></td></tr>';
		}
	}
	echo '</tbody></table></form></div>';
	show_footer();

}elseif($action == 'updatecache') {
//���»���
	include_once(TOOLS_ROOT.'source/class/class_core.php');
	include_once(TOOLS_ROOT.'source/function/function_core.php');

	$cachelist = array();
	$discuz = & discuz_core::instance();
	$discuz->cachelist = $cachelist;
	$discuz->init_cron = false;
	$discuz->init_setting = false;
	$discuz->init_user = false;
	$discuz->init_session = false;
	$discuz->init_misc = false;
	
	$discuz->init();

	require_once libfile('function/cache');
	updatecache();
	include_once libfile('function/block');
	blockclass_cache();
	//note ���Ⱥ�黺��
	require_once libfile('function/group');
	$groupindex['randgroupdata'] = $randgroupdata = grouplist('lastupdate', array('ff.membernum', 'ff.icon'), 80);
	$groupindex['topgrouplist'] = $topgrouplist = grouplist('activity', array('f.commoncredits', 'ff.membernum', 'ff.icon'), 10);
	$groupindex['updateline'] = TIMESTAMP;
	$groupdata = DB::fetch_first("SELECT SUM(todayposts) AS todayposts, COUNT(fid) AS groupnum FROM ".DB::table('forum_forum')." WHERE status='3' AND type='sub'");
	$groupindex['todayposts'] = $groupdata['todayposts'];
	$groupindex['groupnum'] = $groupdata['groupnum'];
	save_syscache('groupindex', $groupindex);
	DB::query("TRUNCATE ".DB::table('forum_groupfield'));

	$tpl = dir(DISCUZ_ROOT.'./data/template');
	while($entry = $tpl->read()) {
		if(preg_match("/\.tpl\.php$/", $entry)) {
			@unlink(DISCUZ_ROOT.'./data/template/'.$entry);
		}
	}
	$tpl->close();
	show_msg('�������ݻ���ģ�建��ɹ���', 'tools.php?action=index', 2000);

}elseif($action == 'logout') {
    // TODO: �˳�ϵͳ.
	tsetcookie('toolsauth', '', -1);
	@header('Location: tools.php');

}else{
	
}
 //��ķ�֧ ����

/**********************************************************************************
 *
 *	tools.php ͨ�ú�������
 *
 *
 **********************************************************************************/
 
/*
	checkpassword ����
	�ж�����ǿ�ȣ���Сд��ĸ�����֣����ȴ���6λ��
	return flase ���� errormsg
 */
function checkpassword($password){
	$errormsg = array(	
		0 => '�����õ�����ֻ��ʹ�����ֺʹ�Сд��ĸ��ɣ����޸ģ�',
		1 => 'tools.php��������6λ���������޸�tools.php�����롣',
		2 => '�����б��뺬�����֣��������޸�tools.php�����롣',	
		3 => '�����б��뺬����ĸ���������޸�tools.php�����롣',
		4 => '�����б��뺬�д�д��ĸ���������޸�tools.php�����롣',
		5 => '�����б��뺬��Сд��ĸ���������޸�tools.php�����롣',
		6 => 'û���������룬��ʹ��FTP����ֱ�ӱ༭��̳��Ŀ¼�µ� tools.php �ļ����������ļ��е�˵����������',
		7 => '����ʹ������ʾ���еĵ� DiscuzX3 Ϊ����',
	);
	if(empty($password))
		return $errormsg[6];
	if(!ctype_alnum($password))
		return $errormsg[0];
	if(strlen($password) < 6)
		return $errormsg[1];
	if($password === 'DiscuzX3'){
		return $errormsg[7];
	}
	$pw_array = str_split($password);

	$is_upper = false;
	$is_lower = false;
	$is_char = false;
	$is_digit = false;
	foreach( $pw_array as $a) {
		if(ctype_digit($a)) {
			$is_digit = true;
		} else {
			$is_char = true;
			if(ctype_lower($a))
				$is_lower = true;
			if(ctype_upper($a))
				$is_upper = true;
		}
	}

	if(!$is_digit)
		return $errormsg[2];

	if(!$is_char)
		return $errormsg[3];

	if(!$is_upper)
		return $errormsg[4];

	if(!$is_lower)
		return $errormsg[5];
	return false;
}

//ȥ��slassh
function tstripslashes($string) {
	if(empty($string)) return $string;
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = tstripslashes($val);
		}
	} else {
		$string = stripslashes($string);
	}
	return $string;
}

function thash() {
	return substr(md5(substr(time(), 0, -4).TOOLS_ROOT), 16);
}

function taddslashes($string, $force = 1) {
	if(is_array($string)) {
		foreach($string as $key => $val) {
			$string[$key] = taddslashes($val, $force);
		}
	} else {
		$string = addslashes($string);
	}
	return $string;
}

//��ʾ
function show_msg($message, $url_forward='', $time = 1, $noexit = 0) {
	show_header();
	show_msg_body($message, $url_forward, $time, $noexit);
	show_footer();
	!$noexit && exit();
}

function show_msg_body($message, $url_forward='', $time = 1, $noexit = 0) {
	if($url_forward) {
		$url_forward = $_GET['from'] ? $url_forward.'&from='.rawurlencode($_GET['from']) : $url_forward;
		$message = "<a href=\"$url_forward\">$message (��ת��...)</a><script>setTimeout(\"window.location.href ='$url_forward';\", $time);</script>";
	}else{
		$message = "<a href=\"$url_forward\">$message </a>";
	}
	print<<<END
	<table>
	<tr><td>$message</td></tr>
	</table>
END;
}

function login_page() {
	show_header();
	$formhash = thash();
	print<<<END
		<span>�������¼</span>
		<form action="tools.php?action=login" method="post">
			<table class="specialtable">
			<tr>
				<td width="20%"><input class="textinput" type="password" name="toolpassword"></input></td>
				<td><input class="specialsubmit" type="submit" value="�� ¼"></input></td>
			</tr>
			</table>
			<input type="hidden" name="action" value="login">
			<input type="hidden" name="formhash" value="{$formhash}">
		</form>
END;
	show_footer();
}

function show_header() {
	$_GET['action'] = htmlspecialchars($_GET['action']);
	$nowarr = array($_GET['action'] => ' class="current"');
    
    $charset = HTML_CHARSET;
    if(!defined('HTML_CHARSET'))
        $charset = 'gbk';
    
	print<<<END
	<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$charset}" />
	<title>Discuz! X3 ������</title>
	<style type="text/css">
     input{vertical-align: middle;}
    a:visited,a:link{color: #575757;}
	* {font-size:12px; color: #575757; font-family: Verdana, Arial, Helvetica, sans-serif; line-height: 1.5em; word-break: break-all; }
	body { text-align:center; margin: 0; padding: 0; background: #F5FBFF; }
	.bodydiv { margin: 40px auto 0; width:820px; text-align:left; border: solid #86B9D6; border-width: 5px 1px 1px; background: #FFF; }
	h1 { font-size: 18px; margin: 1px 0 0; line-height: 50px; height: 50px; background: #E8F7FC; color: #5086A5; padding-left: 10px; }
	#menu {width: 100%; margin: 10px auto; text-align: center; }
	#menu td { height: 30px; line-height: 30px; color: #999; border-bottom: 3px solid #EEE; }
	.current { font-weight: bold; color: #090 !important; border-bottom-color: #F90 !important; }
	input { border: 1px solid #B2C9D3; padding: 5px; background: #F5FCFF; }
	#footer { font-size: 10px; line-height: 40px; background: #E8F7FC; text-align: center; height: 38px; overflow: hidden; color: #5086A5; margin-top: 20px; }
	table {width:100%;font-size:12px;margin-top:5px;}
		table.specialtable,table.specialtable td {border:0;}
		td,th {padding:5px;text-align:left;}
		caption {font-weight:bold;padding:8px 0;color:#3544FF;text-align:left;}
		th {background:#E8F7FC;font-weight:600;}
		td.specialtd {text-align:left;}
	#setadmin {margin: 0px;}
	.textarea {height: 80px;width: 400px;padding: 3px;margin: 5px;}
	</style>
	</head>
	<body>
	<div class="bodydiv">
	<h1>Discuz! X3 ������</h1><br/>
	<div style="width:90%;margin:0 auto;">
	<table id="menu">
	<tr>
	<td{$nowarr[index]}><a href="?action=index">��ҳ</a></td>
    <td{$nowarr[reinstall]}><a href="?action=reinstall">��װdiscuzx</a></td>
	<td{$nowarr[setadmin]}><a href="?action=setadmin">���ù���Ա�ʺ�</a></td>
	<td{$nowarr[closesite]}><a href="?action=closesite">�����ر�վ��</a></td>
	<td{$nowarr[closeplugin]}><a href="?action=closeplugin">һ���رղ��</a></td>
	<td{$nowarr[repairdb]}><a href="?action=repairdb">�޸����ݿ�</a></td>
	<td{$nowarr[restoredb]}><a href="?action=restoredb">�ָ����ݿ�</a></td>
	<td{$nowarr[updatecache]}><a href="?action=updatecache">���»���</a></td>
	<td{$nowarr[logout]}><a href="?action=logout">�˳�</a></td>
	</tr>
	</table>
	<br>
END;
}

//ҳ�涥��
function show_footer() {
	global $tools_versions;
	print<<<END
	</div>
	<div id="footer">Powered by {$tools_versions} &copy; Comsenz Inc. 2001-2013 <a href="http://www.comsenz.com" target="_blank">http://www.comsenz.com</a></div>
	</div>
	<br>
	</body>
	</html>
END;
}

//��¼�жϺ���
function is_login() {
	$error = false;
	$errormsg = array();
	global $tpassword;

	if($errormsg = checkpassword($tpassword)) {
		show_msg($errormsg);
	}

	if(isset($_COOKIE['toolsauth'])) {
		if($_COOKIE['toolsauth'] === md5($tpassword.thash())) {
			return TRUE;
		}
	}
	
	$lockfile = TOOLS_ROOT.'data/tools.lock';
	if(@file_exists($lockfile)) {
		$errormsg = "�������Ѿ������������ȵ�¼������ftp���ֹ�ɾ�� ./data/tools.lock �ļ����ٴ�����ʹ�ü����䡣";
		show_msg($errormsg);
	}

	if ( $_GET['action'] === 'login') {
		$formhash = $_GET['formhash'];
		if($formhash !== thash()) {
			show_msg('����������·���������������볬ʱ����ˢ��ҳ�������������ȷ���룡');
		}
		$toolsmd5 = md5($tpassword.thash());
		if(md5($_GET['toolpassword'].thash()) == $toolsmd5) {
			tsetcookie('toolsauth', $toolsmd5, time()+'3600', '', false, '','');
			$lockfile = TOOLS_ROOT.'data/tools.lock';
			if(@$fp = fopen($lockfile, 'w')) {
				fwrite($fp, ' ');
				fclose($fp);
			}
			show_msg('��½�ɹ���', 'tools.php?action=index', 2000);
		} else {
			show_msg( '����������벻��ȷ��������������ȷ���룡', 'tools.php', 2000);
		}
	} else {
		return FALSE;
	}
}

//��¼�ɹ�����cookie
function tsetcookie($var, $value = '', $life = 0, $prefix = '', $httponly = false, $cookiepath, $cookiedomain) {
	$var = (empty($prefix) ? '' : $prefix).$var;
	$_COOKIE[$var] = $value;
	
	if($value == '' || $life < 0) {
		$value = '';
		$life = -1;
	}
	$path = $httponly && PHP_VERSION < '5.2.0' ? $cookiepath.'; HttpOnly' : $cookiepath;
	$secure = $_SERVER['SERVER_PORT'] == 443 ? 1 : 0;

	if(PHP_VERSION < '5.2.0') {
		$r = setcookie($var, $value, $life);
	} else {
		$r = setcookie($var, $value, $life);
	}
}

/* 
	T �� 
	tools.php ��Ҫ��
*/
class T{
	var $dbconfig = null;
	var $ucdbconfig = null;
	var $db = null;
	var $ucdb = null;
	// �Ƿ��Ѿ���ʼ��
	var $initated = false;

	public function init() {
		if(!$this->initated) {
			$this->_init_config();
			$this->_init_db();
		}
		$this->initated = true;
	}

	public function db_runquery($sql) {
		$tablepre = $this->dbconfig['tablepre'];
		$dbcharset = $this->dbconfig['charset'];

		if(!isset($sql) || empty($sql)) return;

		$sql = str_replace("\r", "\n", str_replace(array(' {tablepre}', ' cdb_', ' `cdb_', ' pre_', ' `pre_'), array(' '.$tablepre, ' '.$tablepre, ' `'.$tablepre, ' '.$tablepre, ' `'.$tablepre), $sql));

		$ret = array();
		$num = 0;
		foreach(explode(";\n", trim($sql)) as $query) {
			$ret[$num] = '';
			$queries = explode("\n", trim($query));
			foreach($queries as $query) {
				$ret[$num] .= (isset($query[0]) && $query[0] == '#') || (isset($query[1]) && isset($query[1]) && $query[0].$query[1] == '--') ? '' : $query;
			}
			$num++;
		}
		unset($sql);
		$this->connect_db();
		foreach($ret as $query) {
			$query = trim($query);
			if($query) {
				if(substr($query, 0, 12) == 'CREATE TABLE') {
					$name = preg_replace("/CREATE TABLE ([a-z0-9_]+) .*/is", "\\1", $query);
					mysql_query($this->db_createtable($query, $dbcharset), $this->db);
				} else {
					mysql_query($query, $this->db);
				}
			}
		}
		return 1;
	}

	public function db_createtable($sql, $dbcharset) {
		$type = strtoupper(preg_replace("/^\s*CREATE TABLE\s+.+\s+\(.+?\).*(ENGINE|TYPE)\s*=\s*([a-z]+?).*$/isU", "\\2", $sql));
		$type = in_array($type, array('MYISAM', 'HEAP')) ? $type : 'MYISAM';
		return preg_replace("/^\s*(CREATE TABLE\s+.+\s+\(.+?\)).*$/isU", "\\1", $sql).(mysql_get_server_info() > '4.1' ? " ENGINE=$type DEFAULT CHARSET=$dbcharset" : " TYPE=$type");
	}
	
	public function connect_db($type = 'db') {
		if($type == 'db') {
			$dbhost = $this->dbconfig['host'];
			$dbuser = $this->dbconfig['user'];
			$dbpw = $this->dbconfig['pw'];
			$dbname = $this->dbconfig['name'];
			$dbcharset = $this->dbconfig['charset'];
		} else {
			$dbhost = $this->ucdbconfig['host'];
			$dbuser = $this->ucdbconfig['user'];
			$dbpw = $this->ucdbconfig['pw'];
			$dbname = $this->ucdbconfig['name'];
			$dbcharset = $this->ucdbconfig['charset'];
		}	
		if($dbhost && $dbuser && $dbpw && !$this->db = mysql_connect($dbhost, $dbuser, $dbpw, 1))
			show_msg('Discuz! X���ݿ����ӳ�������config_global.php�����ݿ������Ϣ�Ƿ���ȷ�������ݿ���������������Ƿ�����');
   
		$dbversion = mysql_get_server_info($this->db);
		if($dbversion > '4.1') {
			if($dbcharset) {
				mysql_query("SET character_set_connection=".$dbcharset.", character_set_results=".$dbcharset.", character_set_client=binary", $this->db);
			}
			if($dbversion > '5.0.1') {
				mysql_query("SET sql_mode=''", $this->db);
			}
		}
		@mysql_select_db($dbname, $this->db);
	}

	public function close_db() {
		mysql_close($this->db);
	}

	private function _init_config() {
		$error = false;
		$_config = array();
		define('HTML_CHARSET', 'gbk');
		global $tpassword;
		if($errormsg = checkpassword($tpassword)) {
			$error = true;
		}

		@include TOOLS_ROOT.'config/config_global.php';
		if(empty($_config)) {
			$error = true;
			$errormsg = 'û���ҵ�config�ļ������� /config/config_global.php �Ƿ���ڻ��ж�Ȩ�ޣ�';
		}
		
		$uc_config_file = TOOLS_ROOT.'config/config_ucenter.php';
		if(!@file_exists($uc_config_file)) {
			$error = true;
			$errormsg = 'û���ҵ�uc config�ļ������� /config/config_ucenter.php �Ƿ���ڻ��ж�Ȩ�ޣ�';
		}
        
		@include $uc_config_file;
		
        !$_GET['action'] && $_GET['action'] = 'index';
        
		if($error && !in_array($_GET['action'], array('index','reinstall','logout'))) {
			show_msg($errormsg);
		}
		
		$this->config = & $_config;
		$this->config['dbcharset'] = $_config['db']['1']['dbcharset'];
		$this->config['charset'] = $_config['output']['charset'];
	}

	private function _init_db() {
		$this->dbconfig['host'] = $this->config['db']['1']['dbhost'];
		$this->dbconfig['user'] = $this->config['db']['1']['dbuser'];
		$this->dbconfig['pw'] = $this->config['db']['1']['dbpw'];
		$this->dbconfig['name'] = $this->config['db']['1']['dbname'];
		$this->dbconfig['charset'] = $this->config['db']['1']['dbcharset'];
		$this->dbconfig['tablepre'] = $this->config['db']['1']['tablepre'];

		$this->ucdbconfig['host'] = UC_DBHOST;
		$this->ucdbconfig['user'] = UC_DBUSER;
		$this->ucdbconfig['pw'] = UC_DBPW;
		$this->ucdbconfig['name'] = UC_DBNAME;
		$this->ucdbconfig['charset'] = UC_DBCHARSET;
		$this->ucdbconfig['tablepre'] = UC_DBTABLEPRE;
		
		$this->connect_db();
		$sql = "SHOW FULL PROCESSLIST";
		$query = mysql_query($sql, $this->db);
		$waiting = false;
		$waiting_msg = '';
		while($l = mysql_fetch_array($query, MYSQL_ASSOC)) {
			if($l['State'] == 'Checking table') {
				$this->close_db();
				$waiting = true;
				$waiting_msg = '���ڼ������Ժ�...';
			} elseif($l['State'] == 'Repair by sorting') {
				$this->close_db();
				$waiting = true;
				$waiting_msg = '�����޸������Ժ�...';
			}
		}
		if($waiting) {
			show_msg($waiting_msg, 'tools.php?action=repairdb', 3000);
		}
	}
}

//T class ����
/**
* End of the tools.php
*/

class zip{
 public $total_files = 0;
 public $total_folders = 0; 
 function Extract( $zn, $to, $index = Array(-1) ){
   $ok = 0; $zip = @fopen($zn,'rb');
   if(!$zip) return(-1);
   $cdir = $this->ReadCentralDir($zip,$zn);
   $pos_entry = $cdir['offset'];

   if(!is_array($index)){ $index = array($index);  }
   for($i=0; $index[$i];$i++){
   		if(intval($index[$i])!=$index[$i]||$index[$i]>$cdir['entries'])
		return(-1);
   }
   for ($i=0; $i<$cdir['entries']; $i++)
   {
     @fseek($zip, $pos_entry);
     $header = $this->ReadCentralFileHeaders($zip);
     $header['index'] = $i; $pos_entry = ftell($zip);
     @rewind($zip); fseek($zip, $header['offset']);
     if(in_array("-1",$index)||in_array($i,$index))
     	$stat[$header['filename']]=$this->ExtractFile($header, $to, $zip);
   }
   fclose($zip);
   return $stat;
 }

  function ReadFileHeader($zip){
    $binary_data = fread($zip, 30);
    $data = unpack('vchk/vid/vversion/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len', $binary_data);

    $header['filename'] = fread($zip, $data['filename_len']);
    if ($data['extra_len'] != 0) {
      $header['extra'] = fread($zip, $data['extra_len']);
    } else { $header['extra'] = ''; }

    $header['compression'] = $data['compression'];$header['size'] = $data['size'];
    $header['compressed_size'] = $data['compressed_size'];
    $header['crc'] = $data['crc']; $header['flag'] = $data['flag'];
    $header['mdate'] = $data['mdate'];$header['mtime'] = $data['mtime'];

    if ($header['mdate'] && $header['mtime']){
     $hour=($header['mtime']&0xF800)>>11;$minute=($header['mtime']&0x07E0)>>5;
     $seconde=($header['mtime']&0x001F)*2;$year=(($header['mdate']&0xFE00)>>9)+1980;
     $month=($header['mdate']&0x01E0)>>5;$day=$header['mdate']&0x001F;
     $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
    }else{$header['mtime'] = time();}

    $header['stored_filename'] = $header['filename'];
    $header['status'] = "ok";
    return $header;
  }

 function ReadCentralFileHeaders($zip){
    $binary_data = fread($zip, 46);
    $header = unpack('vchkid/vid/vversion/vversion_extracted/vflag/vcompression/vmtime/vmdate/Vcrc/Vcompressed_size/Vsize/vfilename_len/vextra_len/vcomment_len/vdisk/vinternal/Vexternal/Voffset', $binary_data);

    if ($header['filename_len'] != 0)
      $header['filename'] = fread($zip,$header['filename_len']);
    else $header['filename'] = '';

    if ($header['extra_len'] != 0)
      $header['extra'] = fread($zip, $header['extra_len']);
    else $header['extra'] = '';

    if ($header['comment_len'] != 0)
      $header['comment'] = fread($zip, $header['comment_len']);
    else $header['comment'] = '';

    if ($header['mdate'] && $header['mtime'])
    {
      $hour = ($header['mtime'] & 0xF800) >> 11;
      $minute = ($header['mtime'] & 0x07E0) >> 5;
      $seconde = ($header['mtime'] & 0x001F)*2;
      $year = (($header['mdate'] & 0xFE00) >> 9) + 1980;
      $month = ($header['mdate'] & 0x01E0) >> 5;
      $day = $header['mdate'] & 0x001F;
      $header['mtime'] = mktime($hour, $minute, $seconde, $month, $day, $year);
    } else {
      $header['mtime'] = time();
    }
    $header['stored_filename'] = $header['filename'];
    $header['status'] = 'ok';
    if (substr($header['filename'], -1) == '/')
      $header['external'] = 0x41FF0010;
    return $header;
 }

 function ReadCentralDir($zip,$zip_name){
	$size = filesize($zip_name);

	if ($size < 277) $maximum_size = $size;
	else $maximum_size=277;
	
	@fseek($zip, $size-$maximum_size);
	$pos = ftell($zip); $bytes = 0x00000000;
	
	while ($pos < $size){
		$byte = @fread($zip, 1); $bytes=($bytes << 8) | ord($byte);
		if ($bytes == 0x504b0506 or $bytes == 0x2e706870504b0506){ $pos++;break;} $pos++;
	}
	
	$fdata=fread($zip,18);
	
	$data=@unpack('vdisk/vdisk_start/vdisk_entries/ventries/Vsize/Voffset/vcomment_size',$fdata);
	
	if ($data['comment_size'] != 0) $centd['comment'] = fread($zip, $data['comment_size']);
	else $centd['comment'] = ''; $centd['entries'] = $data['entries'];
	$centd['disk_entries'] = $data['disk_entries'];
	$centd['offset'] = $data['offset'];$centd['disk_start'] = $data['disk_start'];
	$centd['size'] = $data['size'];  $centd['disk'] = $data['disk'];
	return $centd;
  }

 function ExtractFile($header,$to,$zip){
	$header = $this->readfileheader($zip);
	if(substr($to,-1)!="/") $to.="/";
	if($to=='./') $to = '';
    $header['filename'] = ltrim(strtr('./'.$header['filename'],array('./upload/'=>'./')),'./');
	$pth = explode("/",$to.$header['filename']);
	$mydir = './';

    if('./utility/' === './'.$pth[0].'/' || './readme/' === './'.$pth[0].'/')
            return true;
    
	for($i=0;$i<count($pth)-1;$i++){
		if(!$pth[$i]) continue;
		$mydir .= $pth[$i]."/";
		if((!is_dir($mydir) && @mkdir($mydir,0777)) || (($mydir==$to.$header['filename'] || ($mydir==$to && $this->total_folders==0)) && is_dir($mydir)) ){
			@chmod($mydir,0777);
			$this->total_folders ++;
		}
	}
    
	if(strrchr($header['filename'],'/')=='/') return;	
	if (!($header['external']==0x41FF0010)&&!($header['external']==16)){
		if ($header['compression']==0){
            if($to.$header['filename'])
			$fp = @sfopen($to.$header['filename'], 'wb');
			if(!$fp) return(-1);
			$size = $header['compressed_size'];
			while ($size != 0){
				$read_size = ($size < 2048 ? $size : 2048);
				$buffer = fread($zip, $read_size);
				$binary_data = pack('a'.$read_size, $buffer);
				@fwrite($fp, $binary_data, $read_size);
				$size -= $read_size;
			}
			fclose($fp);
			touch($to.$header['filename'], $header['mtime']);
		}else{
			$fp = @fopen($to.$header['filename'].'.gz','wb');
			if(!$fp) return(-1);
			$binary_data = pack('va1a1Va1a1', 0x8b1f, Chr($header['compression']),
			Chr(0x00), time(), Chr(0x00), Chr(3));
			fwrite($fp, $binary_data, 10);
			$size = $header['compressed_size'];
			while ($size != 0){
				$read_size = ($size < 1024 ? $size : 1024);
				$buffer = fread($zip, $read_size);
				$binary_data = pack('a'.$read_size, $buffer);
				@fwrite($fp, $binary_data, $read_size);
				$size -= $read_size;
			}
		
			$binary_data = pack('VV', $header['crc'], $header['size']);
			fwrite($fp, $binary_data,8); fclose($fp);
            
			$fp = @sfopen($to.$header['filename'],'wb');
			if(!$fp) return(-1);
            $gzp = @gzopen($to.$header['filename'].'.gz','rb');
			if(!$gzp) return(-2);
			$size = $header['size'];
            
			while ($size != 0){
				$read_size = ($size < 2048 ? $size : 2048);
				$buffer = gzread($gzp, $read_size);
				$binary_data = pack('a'.$read_size, $buffer);
				@fwrite($fp, $binary_data, $read_size);
				$size -= $read_size;
			}
			fclose($fp); gzclose($gzp);
		
			touch($to.$header['filename'], $header['mtime']);
			@unlink($to.$header['filename'].'.gz');
		}
	}
    
	$this->total_files ++;
	return true;
 }
}

function sfopen($path, $type='wb'){
    global $gzp;
    static $oldfile = array();    
    if($path === true)
        return $oldfile;
    if(is_file($path) && !YESINSTALL){
        if(is_file($path.'.gz')){
            @gzclose($gzp);
            if(!@unlink($path.'.gz'))
            if(!@unlink($path.'.gz'))
            if(!@unlink($path.'.gz'))
            if(!@unlink($path.'.gz'))
            if(!@unlink($path.'.gz'))
                exit('unlink err:'. $path.'.gz');
        }
        $oldfile[0][] = $path;
        return false;
    }
    
    $oldfile[1][] = $path;
    return @fopen($path,$type);
    
}

function curl_getdata($url) {
    if(!function_exists('curl_init')){
        $opts = array(
             'http'=>array(
             'method'=>"GET",
             'timeout'=>600,
             )
        );    
     $context = stream_context_create($opts);
     $html =file_get_contents($url, false, $context); 
     return $html;
    }
	$curl = curl_init();
	curl_setopt( $curl, CURLOPT_URL, $url ); // Ҫ���ʵĵ�ַ
	curl_setopt( $curl, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322)"); // ģ���û�ʹ�õ������
	curl_setopt( $curl, CURLOPT_FOLLOWLOCATION, 3); // ʹ���Զ���ת
	curl_setopt( $curl, CURLOPT_REFERER, 'http://www.discuz.net/forum-2-1.html'); // �Զ�����Referer
	curl_setopt( $curl, CURLOPT_HTTPGET, 1 ); // ����һ�������Post����
	curl_setopt( $curl, CURLOPT_TIMEOUT, 600); // ���ó�ʱ���Ʒ�ֹ��ѭ��
	curl_setopt( $curl, CURLOPT_HEADER, 0 ); // ��ʾ���ص�Header��������
	curl_setopt( $curl, CURLOPT_RETURNTRANSFER, 1 ); // ��ȡ����Ϣ���ļ�������ʽ����
	$tmpInfo = curl_exec( $curl ); // ִ�в���
	curl_close( $curl ); // �ر�CURL�Ự
	return $tmpInfo; // ��������
}

