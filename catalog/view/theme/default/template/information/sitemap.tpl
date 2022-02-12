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
          <div class="col-lg-12 col-md-12"><!--col-md-4-->
            <div class="sitemap">
              <ul>




                  <?php foreach ($categories as $category_1) { ?>
                  <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
                    <?php if ($category_1['children']) { ?>
                    <ul class="site-second">
                      <?php foreach ($category_1['children'] as $category_2) { ?>
                      <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>

                      </li>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  </li>
                  <?php } ?>




              </ul>
            </div>
          </div><!--col-md-4-->

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
      <div class="row">
        <div class="col-sm-6">
          <ul>
            <?php foreach ($categories as $category_1) { ?>
            <li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
              <?php if ($category_1['children']) { ?>
              <ul>
                <?php foreach ($category_1['children'] as $category_2) { ?>
                <li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                  <?php if ($category_2['children']) { ?>
                  <ul>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-sm-6">
          <ul>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
              <ul>
                <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                <li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
              </ul>
            </li>
            <li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
            <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            <li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
            <li><?php echo $text_information; ?>
              <ul>
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php }//if false ?>

<?php echo $footer; ?>