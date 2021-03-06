<li><a href="#" class="cart"><img src="image/catalog/cart-icon.png" alt=""><?php echo $text_cart; ?> <span><?php echo count($products);?></span></a></li>
<div class="cart-popup" style="display: none;">
  <div class="top_aroww"><img src="image/catalog/arrow-top.png" alt=""></div>
  <div class="select-result">






    <?php foreach ($products as $product) { ?>

    <div class="pro_listing" onclick="window.location.href='<?php echo $product['href']; ?>'" style="cursor:pointer;">
      <?php if ($product['thumb']) { ?>
      <div class="pro-image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" ></div>
      <?php } ?>
      <div class="pro_exdt">
        <h3><?php echo $product['name']; ?></h3>
        <h4><?php echo $product['total']; ?> <span></span></h4>
        <h5>Qty : <?php echo $product['quantity']; ?></h5>

      </div>
      <a href="#" class="close_btn"></a>
    </div>
<?php }//foreach products ?>

    <?php foreach ($totals as $total) { ?>


    <div class="sub-total"><h2><?php echo $total['title']; ?> <span><?php echo $total['text']; ?></span></h2></div>
    <?php } ?>


    <div class="chk-buttons">


      <a href="<?php echo $checkout; ?>" class="chkout"><?php echo $text_checkout; ?></a>
      <a href="<?php echo $cart; ?>" class="viwcart"><?php echo $text_cart; ?></a>
    </div>
  </div>
</div>




<?php if(false){ ?>

<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right">
          <a href="<?php echo $cart; ?>">
            <strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong>
          </a>
          &nbsp;&nbsp;&nbsp;
          <a href="<?php echo $checkout; ?>"><strong><i class="fa fa-reply"></i> <?php echo $text_checkout; ?></strong></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>


<?php } //if false ?>