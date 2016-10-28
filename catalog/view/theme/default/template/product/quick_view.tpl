<div class="quick_view" >
	<div class="quick_view_background" onclick="quick_view.close();"></div>
	<?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div class="<?php echo $class; ?> container">
		<!-- <div class="<?php echo $class; ?>"> -->
			<button class="close_btn fa fa-close" type="button" data-toggle="tooltip" title="<?php echo $text_close; ?>" onclick="quick_view.close();"></button>
		<!-- </div> -->
		<div class="<?php echo $class; ?> content">
			<div class="row">
				<?php if ($column_left || $column_right) { ?>
				<?php $class = 'col-sm-6'; ?>
				<?php } else { ?>
				<?php $class = 'col-sm-8'; ?>
				<?php } ?>
				<div class="<?php echo $class; ?>">
					<?php if ($thumb || $images) { ?>
					<ul class="thumbnails">
					<?php if ($thumb) { ?>
					<li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
					<?php } ?>
					<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>
					<li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
					<?php } ?>
					<?php } ?>
					</ul>
					<?php } ?>
					<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
					<?php if ($attribute_groups) { ?>
					<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
					<?php } ?>
					<!-- <?php if ($review_status) { ?>
					<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
					<?php } ?> -->
					</ul>
					<div class="tab-content">
					<div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
					<?php if ($attribute_groups) { ?>
					<div class="tab-pane" id="tab-specification">
						<table class="table table-bordered">
						<?php foreach ($attribute_groups as $attribute_group) { ?>
						<thead>
							<tr>
							<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
							<td><?php echo $attribute['name']; ?></td>
							<td><?php echo $attribute['text']; ?></td>
							</tr>
							<?php } ?>
						</tbody>
						<?php } ?>
						</table>
					</div>
					<?php } ?>
					</div>
				</div>
				<?php if ($column_left || $column_right) { ?>
				<?php $class = 'col-sm-6'; ?>
				<?php } else { ?>
				<?php $class = 'col-sm-4'; ?>
				<?php } ?>
				<div class="<?php echo $class; ?>">
					<div class="btn-group">
					<button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
					<button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
					</div>
					<h1><?php echo $heading_title; ?></h1>
					<ul class="list-unstyled">
					<?php if ($manufacturer) { ?>
					<li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
					<?php } ?>
					<li><?php echo $text_model; ?> <?php echo $model; ?></li>
					<?php if ($reward) { ?>
					<li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
					<?php } ?>
					<li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
					</ul>
					<?php if ($price) { ?>
					<ul class="list-unstyled">
					<?php if (!$special) { ?>
					<li>
						<h2><?php echo $price; ?></h2>
					</li>
					<?php } else { ?>
					<li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
					<li>
						<h2><?php echo $special; ?></h2>
					</li>
					<?php } ?>
					<?php if ($tax) { ?>
					<li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
					<?php } ?>
					<?php if ($points) { ?>
					<li><?php echo $text_points; ?> <?php echo $points; ?></li>
					<?php } ?>
					<?php if ($discounts) { ?>
					<li>
						<hr>
					</li>
					<?php foreach ($discounts as $discount) { ?>
					<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
					<?php } ?>
					<?php } ?>
					</ul>
					<?php } ?>
					<div id="product">
						<div class="form-group">
							<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
							<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
							<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
							<br />
							<!-- <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button> -->
							<button type="button" onclick="cart.add('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');" class="btn btn-primary btn-lg btn-block">
								<i class="fa fa-shopping-cart"></i>
								<span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
							</button>
						</div>
						<?php if ($minimum > 1) { ?>
						<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
						<?php } ?>
					</div>
					<!-- <?php if ($review_status) { ?>
					<div class="rating">
						<p>
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($rating < $i) { ?>
							<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
							<?php } else { ?>
							<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
							<?php } ?>
							<?php } ?>
							<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
						<hr>
						AddThis Button BEGIN
						<div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
						<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
						AddThis Button END
					</div>
					<?php } ?> -->
				</div>
			</div>
			<?php if ($tags) { ?>
			<p><?php echo $text_tags; ?>
			<?php for ($i = 0; $i < count($tags); $i++) { ?>
			<?php if ($i < (count($tags) - 1)) { ?>
			<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
			<?php } else { ?>
			<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
			<?php } ?>
			<?php } ?>
			</p>
			<?php } ?>
		</div>
	</div>
</div>
