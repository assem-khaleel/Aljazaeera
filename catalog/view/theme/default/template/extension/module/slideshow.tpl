<section class="banner"><!--banner-->
  <div class="banner-slide">
    <div id="owl-demo" class="owl-carousel">



      <?php foreach ($banners as $banner) { ?>





      <div class="item">
        <img src="image/<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" style="width:100%;">
        <div class="container">
          <div class="ic_caption">
            <h3><?php echo $banner['title']; ?></h3>
            <h4><?php echo $collections; ?></h4>
            <p class="ic_text"><?php echo $ic_text; ?></p>
            <a href="<?php echo $banner['link']; ?>"> <?php echo $see_all_collections ?> </a>
          </div>
        </div>
      </div>


      <?php } ?>



    </div>
  </div>
</section><!--banner-->





<?php if(false){ ?>
<img src="image/catalog/sliderTemp.png" style="width:100%; height:500px" >

<section class="banner"><!--banner-->
  <div class="banner-slide">
    <div id="owl-demo" class="owl-carousel owl-theme" >


      <div class="owl-wrapper-outer">
        <div class="owl-wrapper"  >








          <?php foreach ($banners as $banner) { ?>




          <div class="owl-item" ><div class="item">
              <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
              <div class="container">
                <div class="ic_caption">
                  <h3><?php echo $banner['title']; ?></h3>
                  <h4><?php echo $collections; ?></h4>
                  <p class="ic_text"><?php echo $ic_text; ?></p>
                  <?php if ($banner['link']) { ?>
                  <a href="<?php echo $banner['link']; ?>"><?php echo $see_all_collections ?></a>
                  <?php } ?>


                </div>
              </div>
            </div>
          </div>





          <?php } ?>






        </div>
      </div>


      <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div></div></div>
  </div>

</section>



<?php if(false){ ?>


<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>


<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
</script>

<?php } ?>

<?php }// if false ?>


<section class="welcome-section"><!--welcome section-->
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-6">
        <div class="welcome-img">
          <img src="image/catalog/welcome-img.jpg" alt="">
        </div>
      </div>
      <div class="col-lg-8 col-md-8 col-sm-6">
        <div class="welcome-text"> 
          <p><?php echo $welcome_text; ?></p>
          </div>
       
      </div>
    </div>
  </div>
</section>