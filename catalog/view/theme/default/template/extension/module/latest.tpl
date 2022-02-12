


<section class="new-arrivals"><!--New Arrivals Section-->
  <div class="container"><!--container-->
    <h3><?php echo $heading_title; ?></h3>
    <div class="row">



      <?php foreach ($products as $product) { ?>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><!--col-md-3-->
        <div class="item"><!--item-->
          <img   src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
          <h4><?php echo $product['name']; ?> <br><?php /* echo $product['description'];*/ ?></h4>
          <h5>


            <?php if ($product['price']) { ?>

              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <?php echo $product['special']; ?>  <span><?php echo $product['price']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <?php /* echo $product['tax']; */?>

              <?php } ?>

            <?php } ?>

         </h5>
          <div class="item-more">
            <a href="javascript:void(0)" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="heart"><img src="image/catalog/best-seller-heart.png" alt=""></a>
            <a href="javascript:void(0)"  onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart"><img src="image/catalog/cart-icon.png" alt=""></a>
        </div>
          <div class="hover"><a href="<?php echo $product['href']; ?>"><img src="image/catalog/quick-view-img.png" alt=""> <?php echo $quick_view;  ?></a></div>
        </div><!--item-->
      </div><!--col-md-3-->
<?php } ?>










    </div>
    <div class="read-more"><a href="#"><?php echo $view_all_products; ?></a></div>
  </div><!--container-->
</section>














































<?php if(false){ ?>

<h3><?php echo $heading_title; ?></h3>

<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>


<?php } ?>