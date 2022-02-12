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



 <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>




<section class="inner-content-wrapper"><!--Inner Content section-->
  <div class="container">
    <div class="inner-content-container contact">
      <h2><?php echo $heading_title; ?></h2>
      <div class="account-dashboard"><!--account-dashboard-->
        <div class="row">

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
                        <label><?php echo $text_your_email; ?></label>
                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email"/>

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


<?php echo $footer; ?>
























<?php if(false){ ?>
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_email; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_your_email; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
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
<?php echo $footer; ?>

<?php } //if false ?>