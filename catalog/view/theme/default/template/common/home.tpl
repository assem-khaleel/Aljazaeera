<?php echo $header; ?>
<?php echo $content_top; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div  class="<?php echo $class; ?>"><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>





<script src="catalog/view/javascript/owl.carousel.js"></script>
<script>
  $(document).ready(function() {
    $("#owl-demo").owlCarousel({

      navigation : false,
      pager:true,
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem : true

      // "singleItem:true" is a shortcut for:
      // items : 1,
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false

    });
  });
</script>
<script>
  $(document).ready(function() {

    var owl = $("#owl-demo2");

    owl.owlCarousel({
      pagination:false,
      items : 4, //10 items above 1000px browser width
      itemsDesktop : [1000,4], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,2], // betweem 900px and 601px
      itemsTablet: [600,1], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
    });

    // Custom Navigation Events
    $(".next").click(function(){
      owl.trigger('owl.next');
    })
    $(".prev").click(function(){
      owl.trigger('owl.prev');
    })

  });


</script>
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











<?php echo $footer; ?>