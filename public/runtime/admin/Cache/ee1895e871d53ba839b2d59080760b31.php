<?php if (!defined('THINK_PATH')) exit();?><?php if(is_array($supplier_location_list)): foreach($supplier_location_list as $key=>$location): ?><label><?php echo ($location["name"]); ?><input type="checkbox" name="location_id[]" value="<?php echo ($location["id"]); ?>" <?php if($location['checked']): ?>checked="checked"<?php endif; ?> /> </label><?php endforeach; endif; ?>