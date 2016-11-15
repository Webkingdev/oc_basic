<div class="newslist panel panel-default">
	<!-- <link type="text/css" href="catalog/view/theme/default/stylesheet/news_list.css" rel="stylesheet" media="screen" /> -->
	<div class="panel-heading">
		<!-- <?php echo $heading_title; ?> -->
		Последные новости
		<a class="newslist__allnewsbtn" href="<?php echo $all_news_href; ?>">Все новости</a>
	</div>
	<div class="panel-body">
		<?php
			$sidebar_news = 1;
			$image_class = 'col-sm-3';
			$description_class = 'col-sm-9';
			if ($sidebar_news === 1){
				$image_class = 'col-sm-12';
				$description_class = 'col-sm-12';
			}
		?>
		<?php foreach ($all_news as $news) { ?>
			<div class="newslist__news product-thumb">
				<div class="<?php echo $image_class; ?>">
					<div class="image">
						<img class="newslist__news__image img-responsive" src="<?php echo $news['image']; ?>">
					</div>
				</div>
				<div class="<?php echo $description_class; ?>">
					<h4><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></h4>
					<p class="newslist__news_newdescr"><?php echo $news['description']; ?></p>
					<p><?php echo $news['date_added']; ?></p>
					<a class="newslist__news_readmorebtn btn btn-primary btn-lg btn-block" href="<?php echo $news['view']; ?>">Подробнее</a>
				</div>
			</div>
		<?php } ?>
	</div>
</div>
