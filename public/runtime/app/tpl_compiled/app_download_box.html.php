
<div class="download">
	<div class="left_panel f_l">
		<div class="qrcode_bg">
			<div class="qrcode"><img src="<?php 
$k = array (
  'name' => 'gen_qrcode',
  'v' => $this->_var['qrcode_url'],
  's' => $this->_var['qrcode_size'],
);
echo $k['name']($k['v'],$k['s']);
?>" /></div>
		</div>
		
	</div>

	<div class="right_panel f_l">
		<div class="app_view">
			<p style="font-size: 14px">电脑直接下载</p>
			<div class="down_btn">
				<?php if ($this->_var['type'] == 'android'): ?>
				<a href="<?php echo $this->_var['app_url']; ?>" ><i class="iconfont">&#xe613;</i><span>&nbsp;Android下载</span></a>
				<?php elseif ($this->_var['type'] == 'ios'): ?>
				<a href="<?php echo $this->_var['app_url']; ?>" ><i class="iconfont" >&#xe614;</i><span style="font-size: 22px;">&nbsp;IPhone下载</span></a>
				<?php endif; ?>
				<div class="clear"></div>
			</div>
			
		</div>
		
		<p style="font-size: 14px">手机扫描二维码下载</p>
	</div>	
	<div class="clear"></div>
</div>












