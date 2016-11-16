<?php echo $header; ?>
<div class="container">
	<!-- <link type="text/css" href="catalog/view/theme/default/stylesheet/news_list.css" rel="stylesheet" media="screen" /> -->
	<ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div id="content" class="newslist <?php echo $class; ?>">
		<?php echo $content_top; ?>
		<h1>
			<?php echo $heading_title; ?>
		</h1>
		<div class="col-sm-12">
			<div class="row">
				<?php foreach ($all_news as $news) { ?>
					<div class="newslist__news product-thumb">
						<div class="col-sm-3">
							<div class="image newslist__news__image">
								<img class="img-responsive" src="<?php echo $news['image']; ?>">
							</div>
						</div>
						<div class="col-sm-9">
							<h4><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></h4>
							<p class="newslist__news_newdescr"><?php echo $news['description']; ?></p>
							<p><?php echo $news['date_added']; ?></p>
							<a class="newslist__news_readmorebtn btn btn-primary btn-lg btn-block" href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>