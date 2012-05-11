<?php
$data = $this->form_validation->_field_data;
?>
<form id="mainform" action="" method="post">
  <div class="form <?php echo $this->system->is_required($data, 'links[title]'); ?>" title="<?php echo lang('Links Title Description'); ?>">
    <label><?php echo lang('Title'); ?>:</label><input type="text" class="inp-form" name="links[title]" value="<?php echo $title; ?>"/>
  </div>
  <div class="form <?php echo $this->system->is_required($data, 'links[description]'); ?>" title="<?php echo lang('Links Description Description'); ?>">
    <label><?php echo lang('Description'); ?>:</label><textarea name="links[description]" cols="50" class="form-textarea"><?php echo $description; ?></textarea>
  </div>
  <div class="submit">
    	<label></label><input type="submit" value="<?php echo lang('Submit');?>" class="form-submit" />
  </div>

</form>

<h3 class="title"><?php echo lang('List of links'); ?></h3><hr>
<h3 class="subtitle"><?php echo lang('How to edit links'); ?></h3>
<table border="0" cellpadding="0" cellspacing="0" class="style1">
<?php
$icons = array('aim', 'apple', 'blogger', 'delicious', 'digg', 'facebook', 'feedburner', 'flickr', 'friendfeed', 'google', 'hi5', 'identica', 'lastfm', 'linkedin', 'myspace', 'twitter', 'vimeo', 'wordpress', 'youtube', 'website');
$web = base_url() . 'application/views/social_icons/';
$mask = false;
foreach($links as $link){
?>

<tr>
	<td>
<?php
echo sprintf('<div id="%d-link" class="li"><a href="%s" class="show_hide" onclick="$(\'#%d-link\').slideUp(); $(\'#%d-link-form\').slideDown();return false;"><img src="%s" border="0" style="height:12px;" /> %s</a></div>', $link['id'], site_url('plugins/idslot_links/edit/' . $link['id']), $link['id'], $link['id'], $web . $link['icon'] . '.png', $link['name']);
echo form_open_multipart('plugins/idslot_links/edit/' . $link['id']); 
?>
  <div class="subfieldset LinksDiv" style="display:none;" id="<?php echo $link['id'] . '-link-form'; ?>">
	
	<h2 class="delete"><a href="#" onclick="$('#<?php echo $link['id'];?>-link-form').slideUp(); $('#<?php echo $link['id'];?>-link').slideDown(); return false;"></a></h2>
  <div class="form required" title="<?php echo lang('Links Link Title'); ?>">
    <label><?php echo lang('Title'); ?>:</label><input type="text" class="inp-form" name="name" value="<?php echo $link['name']; ?>"/>
  </div>
  <div class="form required" title="<?php echo lang('Links Link URL'); ?>">
    <label><?php echo lang('Url'); ?>:</label><input type="text" class="ltr inp-form" name="url" id="url" value="<?php echo $link['url']; ?>"/>
  </div>
  <div class="form">
        <label><?php echo lang('Icon'); ?>:</label>
		<ul class="icon-list">
		<?php
		foreach($icons as $icon){
			echo sprintf('<li><input type="radio" name="icon" value="%s" %s /><img onclick="change_icon(this)" src="%s" border="0" alt="%s" title="%s" class="%s"/></li>', $icon, $icon == $link['icon']?'checked="checked"':'', $web . $icon . '.png', $icon, $icon, $icon == $link['icon']?'icon-list-selected':'');
		}
		?>
		</ul>
	</div>
  <div>
		<label></label><a class="button form-delete" href="<?php echo site_url('plugins/idslot_links/remove/' . $link['id']) ?>" onclick="return confirm('<?php echo lang('Are you sure to delete this link?') ?>');"><?php echo lang('Delete'); ?></a><input type="submit" name="submit" value="<?php echo lang('Edit'); ?>" class="form-submit" />
  </div>
	
  </div>
</form>

</td>
</tr>
<?php
}
?>
</table>

<?php
echo form_open_multipart('plugins/idslot_links/add/' . $id); 
?>

<h3 class="title"><?php echo lang('Add a new link'); ?></h3><hr>
  <div class="form required" title="<?php echo lang('Links Link Title'); ?>">
    <label><?php echo lang('Title'); ?>:</label><input type="text" class="inp-form" name="name" value=""/>
  </div>
  <div class="form required" title="<?php echo lang('Links Link URL'); ?>">
    <label><?php echo lang('Url'); ?>:</label><input type="text" class="ltr inp-form" name="url" id="url" value="http://"/>
  </div>
  <div class="form">
        <label><?php echo lang('Icon'); ?>:</label>
	<script>
	function change_icon(el){
		var ul = el.parentNode.parentNode;
		var lis = ul.getElementsByTagName('li');
		for (var i = 0; i < lis.length; ++i) {
			var img = lis[i].getElementsByTagName('img');
			img[0].className='';
		}
		el.className='icon-list-selected';
		var input = el.parentNode.getElementsByTagName('input');
		input[0].checked = true;
	}
	</script>
	<div class="icon-list" title="<?php echo lang('Links Link Icon'); ?>">
		<ul>
		<?php
		foreach($icons as $icon){
		echo sprintf('<li><input type="radio" name="icon" value="%s" %s/><img onclick="change_icon(this)" src="%s" border="0" alt="%s" title="%s" class="%s"/></li>', $icon, $icon == 'website'?'checked="checked"':'' , $web . $icon . '.png', $icon, $icon, $icon == 'website'?'icon-list-selected':'');
		}
		?>
		</ul>
	</div>
  </div>
  <div class="submit">
    <label></label><input type="submit" name="submit" value="<?php echo lang('Add'); ?>" class="form-submit" />
  </div>

</form>