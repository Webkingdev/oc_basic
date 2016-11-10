<?php echo $header; ?>
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?> products_catalog">
            <div class="row">
                <?php foreach ($categories as $category) { ?>
                    <div class="col-sm-3">
                        <a class="category_item" href="<?php echo $category['href']; ?>">
                            <img src="<?php echo $category['thumb']; ?>">
                            <?php echo $category['name']; ?>
                        </a>
                    </div>
                <?php } ?>
            </div>
        </div>
        <?php echo $content_top; ?>
        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>