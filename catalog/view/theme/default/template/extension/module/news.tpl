<div class="newslist panel panel-default">
	<div class="panel-heading">
		<!-- <?php echo $heading_title; ?> -->
		<?php echo $name; ?>
		<?php if ($show_all_news){ ?>
			<a class="newslist__allnewsbtn" href="<?php echo $all_news_href; ?>"><?php echo $text_allnews; ?></a>
		<?php } ?>
	</div>
	<div class="panel-body">
		<?php foreach ($all_news as $news) { ?>
			<div class="newslist__news product-thumb">
				<?php if ($show_image){ ?>
					<div class="col-sm-<?php echo $format?3:12;?>">
						<div class="image">
							<img class="newslist__news__image img-responsive" src="<?php echo $news['image']; ?>">
						</div>
					</div>
				<?php } ?>
				<div class="col-sm-<?php echo $show_image?($format?9:12):12;?>">
					<h4><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></h4>
					<?php if($news['description'] !== ''){ ?>
						<p class="newslist__news_newdescr"><?php echo $news['description']; ?></p>
					<?php } ?>
					<p><?php echo $news['date_added']; ?></p>
					<a class="newslist__news_readmorebtn btn btn-primary btn-lg btn-block" href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a>
				</div>
			</div>
		<?php } ?>
	</div>
</div>
