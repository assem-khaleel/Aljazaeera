<div style="clear:both;" ></div>
<section class="advertisements"><!--Advertisements Section-->
  <div class="container"><!--container-->
    <div class="row">
      <div class="col-md-4">
        <div class="adds">
          <img src="image/catalog/add-img1.jpg" alt="">
          <div class="add-text">
            <h4><span class="text-yellow"><?php echo $hot_collections; ?></span> </h4>
            <a href="<?php echo $collectionLink; ?>"><?php echo $shop_now; ?></a>
          </div>
        </div>
      </div>
      
      <div class="col-md-4">
        <div class="adds">
          <img src="image/catalog/add-img2.jpg" alt="">
          <div class="add-text">
            <h4><span class="text-orng"><?php echo $new_fragrance; ?></span> </h4>
            <a href="<?php echo $fragranceLink; ?>"><?php echo $shop_now; ?></a>
          </div>
        </div>
      </div>
      
      <div class="col-md-4">
        <div class="adds">
          <img src="image/catalog/add-img3.jpg" alt="">
          <div class="add-text">
            <h4><span class="text-red"><?php echo $sale; ?></span> </h4>
            <a href="<?php echo $saleLink; ?>"><?php echo $shop_now; ?></a>
          </div>
        </div>
      </div>
      
    </div>
  </div><!--container-->
</section>










<section class="footer-top"><!--footer-top-->
  <div class="container">
    <ul class="payment-cards">
      <li><a href="#"><img src="image/catalog/knet.jpg" alt=""></a></li>
      <li><a href="#"><img src="image/catalog/visa.jpg" alt=""></a></li>
      <li><a href="#"><img src="image/catalog/master.jpg" alt=""></a></li>
      <li><a href="#"><img src="image/catalog/cashon.jpg" alt=""></a></li>
    </ul>
  </div>
</section>








<section class="main-footer"><!--main-footer-->
  <div class="footer-links"><!--Links-->
    <div class="container">
      <div class="information"><!--Information-->
        <h4><?php echo $text_information; ?></h4>
        <ul class="footer-nav">
          <li><a href="<?php echo $aboutUsLink; ?>"><?php echo $about_us; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $careersLink; ?>"><?php echo $careers; ?></a></li>
          <li><a href="<?php echo $faqLink; ?>"><?php echo $faq; ?></a></li>
        </ul>
      </div><!--Information-->
      <div class="myaccount"><!--My Account-->
        <h4><?php echo $text_account; ?></h4>
        <ul class="footer-nav">

          <li><a href="<?php echo $loginLink; ?>"><?php echo $login; ?></a></li>

          <li><a href="<?php echo $registerLink; ?>"><?php echo $register; ?></a></li>
          <li><a href="<?php echo $cartLink; ?>"><?php echo $cart; ?> </a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
        </ul>
      </div><!--My Account-->
      <div class="newsletter"><!--Newsletter-->
        <form action="<?php echo $newsletterLink;?>" method="post">
        <h4><?php echo $text_newsletter; ?></h4>
        <input type="text" name="email" placeholder="<?php echo $placeholder_your_emails; ?>">
        <button type="submit"><?php echo $submit; ?></button>
        </form>
      </div><!--Newsletter-->
      <div class="followus"><!--Followus-->
        <h4><?php echo $follow_us; ?></h4>
        <ul class="social-media">
          <li><a href="https://web.facebook.com/aljazeeraperfumes?_rdc=1&_rdr"><img src="image/catalog/fb.png" alt=""></a></li>
          <li><a href="https://twitter.com/aljazeeraperfum"><img src="image/catalog/twit.png" alt=""></a></li>
          <li><a href="https://instagram.com/aljazeeraperfumes/"><img src="image/catalog/in.png" alt=""></a></li>
          <li><a href="https://www.youtube.com/user/aljazeeraperfumes"><img src="image/catalog/youtub.png" alt=""></a></li>
        </ul>
      </div><!--Followus-->
    </div>
  </div><!--Links-->
  <div class="copyright"><!--copyright-->
    <div class="container">
      <div class="row">
        <div class="col-md-5">
          <p><?php echo $copy_right; ?> </p>
        </div>
        <div class="col-md-5">
          <ul class="copy-links">
            <li><a href="<?php echo $policyLink;?>"><?php echo $privacy_policy; ?> </a></li>
            <li>|</li>
            <li><a href="<?php echo $termsLink;?>"><?php echo $terms_conditions; ?>  </a></li>
            <li>|</li>
            <li><a href="<?php echo $sitemap;?>"><?php echo $text_sitemap; ?> </a></li>
          </ul>
        </div>
        <div class="col-md-2">
          <div class="powered"><?php echo $text_powered;?>
            
          </div>
        </div>
      </div>
    </div>
  </div><!--copyright-->
</section>










<footer style="display:None;">
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

