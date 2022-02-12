<?php echo $header; ?>


<section class="inner-banner"><!--Inner banner-->
  <img src="image/catalog/inner-banner1.jpg" alt="">
  <div class="container">
    <h2><?php echo $breadcrumbs[count($breadcrumbs) - 1 ]['text'];?></h2>
  </div>
  <div class="breadcrumb"><!--breadcrumb-->
    <div class="container">

      <ul>

        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li id="arrow"><img src="image/catalog/breadcrumb-arrow.png" alt=""></li>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>


      </ul>
    </div>
  </div><!--breadcrumb-->
</section>


<?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>


<section class="inner-content-wrapper"><!--Inner Content section-->
  <div class="container">
    <div class="inner-content-container">
      <div class="sopping-cart"><!--Sopping Cart-->

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="listForm">
        <div class="cart-list"><!--List-->
         
         
          <ul>


            <?php foreach ($products as $product) { ?>
            <li>
              <div class=" row">
                <div class="col-md-3">
                  <div class="cart-left">

                    <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                    </a>
                    <?php } ?>

                  </div>
                </div>
                <div class="col-md-9">
                  <div class="cart-right">
                    <h3><?php echo $product['name']; ?>
                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                    </h3>
                    <h4> <?php echo $column_price; ?> &nbsp;<span class="price"><?php echo $product['price']; ?></span> </h4>

                    <div class="quantity">
                      <label><?php echo $column_quantity; ?> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -</label>
                      <select  name="quantity[<?php echo $product['cart_id']; ?>]" onchange="$('#listForm').submit();" >

                        <?php for($i=1;$i<11;$i++){

                         echo '<option '.(($product['quantity']==$i)? 'selected':'').'>'.$i.'</option>';
                         } ?>
                      </select>
                    </div>
                    
                    <div class="product-btns">
                      <div class="row">
                        <div class="col-md-6">
                          <a href="#"  onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                            <img src="image/catalog/delete.jpg"/>
                            <span><?php echo $button_remove; ?></span>
                          </a>
                        </div>
                        <div class="col-md-6">
                          <div class="cart-total"><?php echo $column_total_unit; ?>&nbsp;<span><?php echo $product['total']; ?></span></div>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <?php } ?>


          </ul>
          
          
          

        </div><!--List-->
</form>




        <div class="cart-grand-total">

          <?php foreach ($totals as $total) { ?>
          <h4><?php echo $total['title']; ?> : <?php echo $total['text']; ?></h4>

          <?php } ?>
          <div class="choose-payment"><!--CHOOSE PAYMENT METHOD:-->
            <p><?php echo $choose_payment_method; ?></p>
            <ul>
              <li>
                <input type="radio" id="radio1" name="iCheck" checked>
                <label for="radio1"><img src="image/catalog/choose-knet.jpg"/></label>
              </li>
              <li>
                <input type="radio" id="radio2" name="iCheck" >
                <label for="radio2"><img src="image/catalog/choose-visa.jpg"/></label>
              </li>
              <li>
                <input type="radio" id="radio3" name="iCheck" >
                <label for="radio3"><img src="image/catalog/choose-master.jpg"/></label>
              </li>
              <li>
                <input type="radio" id="radio4" name="iCheck" >
                <label for="radio4"><img src="image/catalog/choose-cashon.jpg"/></label>
              </li>
            </ul>


          </div><!--CHOOSE PAYMENT METHOD:-->
          <a href="<?php echo $checkout; ?>"><?php echo $button_checkout; ?></a>


        </div>
      </div><!--Sopping Cart-->



    </div>
  </div>
</section><!--Inner Content section-->










<?php if(false){ ?>

<div class="container inner-content-wrapper" style="color:#ffffff;padding:30px 10%;">

  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($modules) { ?>
      <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>
      <div class="panel-group" id="accordion">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <br />
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php }//if false ?>
<?php echo $footer; ?>



























