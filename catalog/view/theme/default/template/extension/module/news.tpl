<div class="newslist panel panel-default">
	<!-- <link type="text/css" href="catalog/view/theme/default/stylesheet/news_list.css" rel="stylesheet" media="screen" /> -->
	<div class="panel-heading">
		<!-- <?php echo $heading_title; ?> -->
		Последные новости
		<a class="newslist__allnewsbtn" href="<?php echo $all_news_href; ?>">Все новости</a>
	</div>
	<div class="panel-body">
		<?php foreach ($all_news as $news) { ?>
			<div class="newslist__news product-thumb">
				<?php if ($show_image){ ?>
					<div class="col-sm-3 newslist__news__image_col">
						<div class="image">
							<img class="newslist__news__image img-responsive" src="<?php echo $news['image']; ?>">
						</div>
					</div>
				<?php } ?>
				<div class="col-sm-<?php echo $show_image?9:12;?> newslist__news__content_col">
					<h4><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></h4>
					<?php if($news['description'] !== ''){ ?>
						<p class="newslist__news_newdescr"><?php echo $news['description']; ?></p>
					<?php } ?>
					<p><?php echo $news['date_added']; ?></p>
					<a class="newslist__news_readmorebtn btn btn-primary btn-lg btn-block" href="<?php echo $news['view']; ?>">Подробнее</a>
				</div>
			</div>
		<?php } ?>
	</div>
</div>
