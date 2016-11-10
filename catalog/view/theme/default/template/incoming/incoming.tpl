<?php echo $header; ?>
<div class="container categories_page">
	<?php echo $content_top; ?>
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>">
			<ul>
			<?php foreach ($all_categories as $category) { ?>
				<li class="col-lg-3 col-md-4 col-sm-4 col-xs-6">
					<a href="<?php echo $category['href']; ?>">
						<span class="img_wrap">
							<img src="<?php echo $category['image']?>" alt="">
						</span><br>
						<span class="title_wrap">
							<?php echo $category['name']; ?>
						</span>
					</a>
				</li>
			<?php } ?>
			</ul>
		</div>
		<?php echo $column_right; ?>
	</div>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>