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
    <div class="inner-content-container orders">
      <div class="row">
        <div class="col-md-8 col-sm-6">
          <h2><?php echo $text_user_dashboard;?></h2>
        </div>
        <div class="col-md-4 col-sm-6">
          <div class="list-filter">
            <label><?php echo $sort_by;?></label>
            <select>
              <option>status: in process</option>
              <option>status: in process</option>
            </select>
          </div>
        </div>
      </div>
      <div class="account-dashboard"><!--account-dashboard-->
        <div class="row">
         
          <div class="col-lg-4 col-md-4"><!--col-md-4-->
            <div class="side-nav-wrapper">
              <div class="side-nav">
                <ul>
                  <li><a href="<?php echo $editLink;?>"><?php echo $account_information;?></a></li>
                  <li><a href="<?php echo $addressLink;?>"><?php echo $address_book;?></a></li>
                  <li><a href="<?php echo $orderLink;?>" class="active"><?php echo $your_order;?></a></li>
                  <li><a href="<?php echo $passwordLink;?>"><?php echo $change_password;?></a></li>
                </ul>
              </div>
            </div>
          </div><!--col-md-4-->
          
          <div class="col-lg-8 col-md-8"><!--col-md-8-->
            <div class="dashboard-right">
              <div class="order-content">
               
                <ul>





                  <?php foreach ($orders as $order) { ?>
                  <li><!--List-->
                    <div class="process">
                      <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-6">
                          <h3><?php echo $column_order_id; ?> : #<?php echo $order['order_id']; ?></h3>
                          <h4><?php echo $column_date_added; ?> : <span><?php echo $order['date_added']; ?></span></h4>
                          <h5><?php echo $column_status; ?> : <span><?php echo $order['status']; ?></span></h5>
                        </div>


                        <?php if(true){ ?>
                        <div class="col-md-8 col-sm-8 col-xs-6">
                          <p><?php echo $order['total']; ?></p>
                          <a href="<?php echo $order['view']; ?>" title="<?php echo $button_view; ?>">CONFIRM</a>
                        </div>
                        <?php }else{ ?>


                        <div class="col-md-8 col-sm-8 col-xs-6">
                          <p>kd100.000</p>
                          <div class="row comments">
                            <div class="col-md-3 col-sm-3 col-xs-12 rate">
                              <label><?php echo $order['total']; ?></label>
                              <select >
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                              </select>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                              <textarea placeholder="write your review.."></textarea>
                            </div>
                          </div>
                        </div>
                        <?php } ?>



                      </div>
                    </div>
                  </li><!--List-->
                  <?php } ?>






                </ul>
              </div>


            </div>
          </div><!--col-md-8-->
        </div><!--row-->
      </div><!--account-dashboard-->

    </div>
  </div>
</section><!--Inner Content section-->






<?php if(false){ ?>



<div class="container inner-content-wrapper" style="color:#ffffff;padding:30px 10%;">

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($orders) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right">#<?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['name']; ?></td>
              <td class="text-right"><?php echo $order['products']; ?></td>
              <td class="text-left"><?php echo $order['status']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
              <td class="text-left"><?php echo $order['date_added']; ?></td>
              <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php }//if false ?>
<?php echo $footer; ?>
