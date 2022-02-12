<?php echo $header; ?>





<section class="inner-banner"><!--Inner banner-->
  <img src="image/catalog/inner-banner1.jpg" alt="">
  <div class="container">
    <h2><?php echo $breadcrumbs[count($breadcrumbs)- 1 ]['text'];?></h2>
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
      <h2><?php echo $boutiques;?></h2>
      <div class="account-dashboard"><!--account-dashboard-->
        <div class="row">
          <div class="col-lg-4 col-md-4"><!--col-md-4-->
            <div class="side-nav-wrapper">
              <div class="side-nav">
                <ul>
                  <?php foreach($branchCountry as $oneCountry=>$name) { ?>
                  <li><a href="?route=product/branch&country=<?php echo $oneCountry;?>" <?php if($oneCountry == $country){ echo ' class="active" '; } ?> ><?php echo $name;?></a></li>
                  <?php } ?>

                </ul>
              </div>
            </div>
          </div><!--col-md-4-->
          <div class="col-lg-8 col-md-8"><!--col-md-8-->
            <div class="boutiques-right">
              <ul>
                <?php foreach($branchList as $oneBranch) { ?>
                <li class="col-md-6">
                  <div class="boutiques-container">
                    <img src="image/<?php echo $oneBranch['image']; ?>">
                    <div class="boutiques-text-outer">
                      <div class="boutiques-text">
                        <span class="palec"><?php echo $oneBranch['name']; ?></span>
                        <span class="number"><?php echo $oneBranch['phone']; ?></span>
                      </div>
                    </div>
                  </div>
                </li>
                <?php } ?>
              </ul>

            </div>
          </div><!--col-md-8-->
        </div><!--row-->
      </div><!--account-dashboard-->

    </div>
  </div>
</section>










<?php if(false){ ?>

<div class="container">

  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($categories) { ?>
      <p><strong><?php echo $text_index; ?></strong>
        <?php foreach ($categories as $category) { ?>
        &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/branch#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
      </p>
      <?php foreach ($categories as $category) { ?>
      <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
      <?php if ($category['branch']) { ?>
      <?php foreach (array_chunk($category['branch'], 4) as $branchs) { ?>
      <div class="row">
        <?php foreach ($branchs as $branch) { ?>
        <div class="col-sm-3"><a href="<?php echo $branch['href']; ?>"><?php echo $branch['name']; ?></a></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php }//if false ?>















<?php echo $footer; ?>