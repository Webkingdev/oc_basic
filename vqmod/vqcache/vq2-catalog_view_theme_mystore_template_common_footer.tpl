<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3 prava">
        <p class="big_text">&copy; 2016 Музыкальный арсенал</p>
        <a href="">Правила использования сайта</a>
        <ul class="list-unstyled">
          <!-- <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?> -->
          <p><a href="/">Разработка сайта</a> - klassman.ru</p>
          <p><a href="/">Дизайн сайта</a> - klassman.ru</p>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <a class="big_text" href="/">Магазин в Новосибирске</a>
        <ul class="list-unstyled contacts">
          <li><span class="glyphicon glyphicon-flag" aria-hidden="true"></span> ул. Октябрьская, 34</li>
          <li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 34 (383) 240-80-80</li>
          <li><span class="glyphicon glyphicon-time" aria-hidden="true"></span> Сегодня: с 10:00 до 19:00</li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>

				<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>