<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

  <script src="catalog/view/javascript/icheck.js"></script>


<!--  <?php if ($direction == 'rtl') { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap-a.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet-a.css" rel="stylesheet">
<?php } else { ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php } ?>
-->

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>


  <?php if ($direction == 'rtl') { ?>

  <link href="catalog/view/theme/default/stylesheet/rtl/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap -->
  <link href="catalog/view/theme/default/stylesheet/rtl/custom-style.css" rel="stylesheet"><!--custom-style-->
  <link href="catalog/view/theme/default/stylesheet/rtl/owl.carousel.css" rel="stylesheet"><!--owl.carousel-->
  <link href="catalog/view/theme/default/stylesheet/rtl/owl.theme.css" rel="stylesheet"><!--owl.theme-->
  <link href="catalog/view/theme/default/stylesheet/rtl/red.css" rel="stylesheet">

  <?php }else { ?>


  <link href="catalog/view/theme/default/stylesheet/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap -->
  <link href="catalog/view/theme/default/stylesheet/custom-style.css" rel="stylesheet"><!--custom-style-->
  <link href="catalog/view/theme/default/stylesheet/owl.carousel.css" rel="stylesheet"><!--owl.carousel-->
  <link href="catalog/view/theme/default/stylesheet/owl.theme.css" rel="stylesheet"><!--owl.theme-->
  <link href="catalog/view/theme/default/stylesheet/red.css" rel="stylesheet">

  <?php } ?>

</head>
<body class="<?php echo $class; ?>">






<header>


<div class="top-nav"><!--top-nav-->
  <div class="container"><!--container-->
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
        <div class="top-left"><!--top-left-->
          <p> <?php echo $welcome_store; ?></p>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-xs-6">
        <div class="top-right"><!--top-right-->
          <div class="top-right-nav">
            <ul>


              <?php if ($logged) { ?>
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
              <?php } else { ?>


              <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>

              <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>

              <?php } ?>


              <li id="style-language">

                <?php echo $language; ?>

              </li>
              
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div><!--container-->
</div>



<div class="mid-nav"><!--Mid Nav-->
  <div class="container">
    <div class="logo"><!--logo-->
      <a href=""><img  src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" ></a>
    </div><!--logo-->

      <?php echo $search; ?>


    <div class="mid-nav-cart">
     
      <ul>
        <li><a href="<?php echo $wishlistLink; ?> "><img src="image/catalog/wishlist-icon.png" alt=""><?php echo $text_wishlist; ?></a></li>

        <?php echo $cart;?>
      </ul>
      
    </div>
  </div>

  <div style="clear:both; height:30px;"></div>


</div>



  <div class="main-nav"><!--Main Nave-->
    <div class="container"><!--container-->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">







              <?php if ( $categories) { ?>



                      <?php foreach ($categories as $category) { ?>
                      <?php if ($category['children']) { ?>
              <li class="dropdown">
                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  <?php echo $category['name']; ?><span class="caret"></span></a>
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <ul class="dropdown-menu">
                 <!--  <li><a href="boutiques.html" class="active">Qatar</a></li>-->
                  <?php foreach ($children as $child) { ?>
                  <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                  <?php } ?>
                </ul>
                <?php } ?>
              </li>


                      <?php } else { ?>

              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>  </a></li>
                      <?php } ?>
                      <?php } ?>


              <?php } ?>








            </ul>


          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
    </div><!--container-->
  </div>





</header>



<div style="clear:both"></div>



<script>

  $(document).ready(function(e) {
    $('.cart').click(function(e) {
      e.preventDefault();
      $('.cart-popup').toggle();
      e.stopPropagation();

    });

    $(document).click(function(e){
      //e.preventDefault();
      $('.cart-popup').hide();
      e.stopPropagation();
    });
  });

</script>






<?php if(false){ ?>




<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-reply"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ( $categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>



<?php } ?>