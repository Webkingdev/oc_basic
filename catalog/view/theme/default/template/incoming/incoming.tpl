<?php echo $header; ?>
<div class="container">
	<div class="row">
		<?php echo $column_left; ?>
		
		<?php if ($column_left && $column_right) { ?>
			<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
			<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
		<?php } ?>

		<?php echo $content_top; ?>

		<div id="content" class="<?php echo $class; ?>">
			<h1>Incoming goods</h1>
		</div>
		
		<?php echo $content_bottom; ?>

		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>