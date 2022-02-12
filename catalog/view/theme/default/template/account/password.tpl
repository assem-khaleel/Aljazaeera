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



<section class="inner-content-wrapper"><!--Inner Content section-->
  <div class="container">
    <div class="inner-content-container contact">
      <h2><?php echo $heading_title; ?></h2>
      <div class="account-dashboard"><!--account-dashboard-->
        <div class="row">
          <div class="col-lg-4 col-md-4"><!--col-md-4-->
            <div class="side-nav-wrapper">
              <div class="side-nav">
                <ul>
                  <li><a href="<?php echo $editLink;?>"><?php echo $account_information;?></a></li>
                  <li><a href="<?php echo $addressLink;?>"><?php echo $address_book;?></a></li>
                  <li><a href="<?php echo $orderLink;?>"><?php echo $your_order;?></a></li>
                  <li><a href="<?php echo $passwordLink;?>" class="active"><?php echo $change_password;?></a></li>
                </ul>
              </div>
            </div>
          </div><!--col-md-4-->
          <div class="col-lg-8 col-md-8"><!--col-md-8-->

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <div class="dashboard-right">
              <div class="delivery-address"><!--Delivery Address-->
                <div class="form-group" style="display: none;">
                  <div class="row">
                    <div class="col-md-6">
                      <label>Current Password</label>
                      <input type="password" placeholder="">
                    </div>

                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label><?php echo $entry_password; ?></label>
                      <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password"  />
                      <?php if ($error_password) { ?>
                      <div class="text-danger"><?php echo $error_password; ?></div>
                      <?php } ?>
                    </div>
                    <div class="col-md-6">
                      <label><?php echo $entry_confirm; ?></label>
                      <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" />
                      <?php if ($error_confirm) { ?>
                      <div class="text-danger"><?php echo $error_confirm; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>

                <div class="form-group checkbox-section">
                  <div class="row">
                    <div class="col-md-6">

                      <button type="submit" value="<?php echo $button_continue; ?>" class="can_btn" ><?php echo $button_continue; ?></button>
                    </div>

                  </div>
                </div>
              </div><!--Delivery Address-->


            </div>

              </form>
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php }// end if ?>
<?php echo $footer; ?>