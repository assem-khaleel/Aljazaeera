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

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div class="inner-content-container contact">
      <div class="row">
        <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12 for-small">
          <h2><?php echo $submit_feedback;?></h2>
          <div class="full-width relative">
            <label><?php echo $entry_name;?></label>

            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="common_input" />
            <?php if ($error_name) { ?>
            <div class="text-danger"><?php echo $error_name; ?></div>
            <?php } ?>

          </div><!-- /.full-width -->

          <div class="full-width relative">
            <label><?php echo $text_telephone; ?></label>
            <div class="full-width custom_width">

              <select name="phone_ext">
                <?php

 $countryCallingCodes = array
(

     "93"=>"+93",
                "355"=>"+355",
                "213"=>"+213",
                "1"=>"+1",
                "376"=>"+376",
                "244"=>"+244",
                "54"=>"+54",
                "374"=>"+374",
                "297"=>"+297",
                "247"=>"+247",
                "61"=>"+61",
                "43"=>"+43",
                "994"=>"+994",
                "973"=>"+973",
                "880"=>"+880",
                "375"=>"+375",
                "32"=>"+32",
                "501"=>"+501",
                "229"=>"+229",
                "975"=>"+975",
                "591"=>"+591",
                "387"=>"+387",
                "267"=>"+267",
                "55"=>"+55",
                "673"=>"+673",
                "359"=>"+359",
                "226"=>"+226",
                "257"=>"+257",
                "855"=>"+855",
                "237"=>"+237",
                "238"=>"+238",
                "236"=>"+236",
                "235"=>"+235",
                "56"=>"+56",
                "86"=>"+86",
                "57"=>"+57",
                "269"=>"+269",
                "242"=>"+242",
                "682"=>"+682",
                "506"=>"+506",
                "385"=>"+385",
                "53"=>"+53",
                "357"=>"+357",
                "420"=>"+420",
                "243"=>"+243",
                "45"=>"+45",
                "246"=>"+246",
                "253"=>"+253",
                "670"=>"+670",
                "593"=>"+593",
                "20"=>"+20",
                "503"=>"+503",
                "240"=>"+240",
                "291"=>"+291",
                "372"=>"+372",
                "251"=>"+251",
                "500"=>"+500",
                "298"=>"+298",
                "679"=>"+679",
                "358"=>"+358",
                "33"=>"+33",
                "594"=>"+594",
                "689"=>"+689",
                "241"=>"+241",
                "220"=>"+220",
                "995"=>"+995",
                "49"=>"+49",
                "233"=>"+233",
                "350"=>"+350",
                "30"=>"+30",
                "299"=>"+299",
                "590"=>"+590",
                "502"=>"+502",
                "224"=>"+224",
                "245"=>"+245",
                "592"=>"+592",
                "509"=>"+509",
                "504"=>"+504",
                "852"=>"+852",
                "36"=>"+36",
                "354"=>"+354",
                "91"=>"+91",
                "62"=>"+62",
                "870"=>"+870",
                "98"=>"+98",
                "964"=>"+964",
                "353"=>"+353",
                "972"=>"+972",
                "39"=>"+39",
                "225"=>"+225",
                "81"=>"+81",
                "962"=>"+962",
                "7"=>"+7",
                "254"=>"+254",
                "686"=>"+686",
                "965"=>"+965",
                "996"=>"+996",
                "856"=>"+856",
                "371"=>"+371",
                "961"=>"+961",
                "266"=>"+266",
                "231"=>"+231",
                "218"=>"+218",
                "423"=>"+423",
                "370"=>"+370",
                "352"=>"+352",
                "853"=>"+853",
                "389"=>"+389",
                "261"=>"+261",
                "265"=>"+265",
                "60"=>"+60",
                "960"=>"+960",
                "223"=>"+223",
                "356"=>"+356",
                "692"=>"+692",
                "596"=>"+596",
                "222"=>"+222",
                "230"=>"+230",
                "262"=>"+262",
                "52"=>"+52",
                "691"=>"+691",
                "373"=>"+373",
                "377"=>"+377",
                "976"=>"+976",
                "382"=>"+382",
                "212"=>"+212",
                "258"=>"+258",
                "95"=>"+95",
                "264"=>"+264",
                "674"=>"+674",
                "977"=>"+977",
                "31"=>"+31",
                "599"=>"+599",
                "687"=>"+687",
                "64"=>"+64",
                "505"=>"+505",
                "227"=>"+227",
                "234"=>"+234",
                "683"=>"+683",
                "850"=>"+850",
                "47"=>"+47",
                "968"=>"+968",
                "92"=>"+92",
                "680"=>"+680",
                "507"=>"+507",
                "675"=>"+675",
                "595"=>"+595",
                "51"=>"+51",
                "63"=>"+63",
                "48"=>"+48",
                "351"=>"+351",
                "974"=>"+974",
                "40"=>"+40",
                "250"=>"+250",
                "290"=>"+290",
                "508"=>"+508",
                "685"=>"+685",
                "378"=>"+378",
                "239"=>"+239",
                "966"=>"+966",
                "221"=>"+221",
                "381"=>"+381",
                "248"=>"+248",
                "232"=>"+232",
                "65"=>"+65",
                "421"=>"+421",
                "386"=>"+386",
                "677"=>"+677",
                "252"=>"+252",
                "27"=>"+27",
                "82"=>"+82",
                "34"=>"+34",
                "94"=>"+94",
                "249"=>"+249",
                "597"=>"+597",
                "268"=>"+268",
                "46"=>"+46",
                "41"=>"+41",
                "963"=>"+963",
                "886"=>"+886",
                "992"=>"+992",
                "255"=>"+255",
                "66"=>"+66",
                "228"=>"+228",
                "690"=>"+690",
                "216"=>"+216",
                "90"=>"+90",
                "993"=>"+993",
                "688"=>"+688",
                "256"=>"+256",
                "380"=>"+380",
                "971"=>"+971",
                "44"=>"+44",
                "598"=>"+598",
                "998"=>"+998",
                "678"=>"+678",
                "379"=>"+379",
                "58"=>"+58",
                "84"=>"+84",
                "681"=>"+681",
                "967"=>"+967",
                "260"=>"+260",
                "263"=>"+263",

                );
                foreach($countryCallingCodes as $withoutPlus=> $withPlus){
                echo '<option '.(($phone_ext==$withPlus)? 'selected':'').'>'.$withPlus.'</option>';
                }
                ?>

                <option>+965</option>
              </select>
              <input type="text" placeholder="xx xxx xxx" class="common_input" value="<?php echo $mobile;?>">
            </div><!-- /.d_flex -->
          </div><!-- /.full-width -->

          <div class="full-width relative">
            <label><?php echo $entry_email;?></label>
            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="common_input" />
            <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_email; ?></div>
            <?php } ?>
          </div><!-- /.full-width -->

          <div class="full-width relative">
            <label><?php echo $entry_enquiry;?></label>
            <textarea name="enquiry" rows="10" id="input-enquiry" class=""><?php echo $enquiry; ?></textarea>
            <?php if ($error_enquiry) { ?>
            <div class="text-danger"><?php echo $error_enquiry; ?></div>
            <?php } ?>


          </div><!-- /.full-width -->
        </div><!-- /.col-lg-5 -->

        <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12 col-lg-offset-2 for-small">
          <h2><?php echo $text_address; ?></h2>
          <div class="full-width address">

            <?php echo $address; ?><br>

            <span><i><?php echo $entry_email; ?></i><a href="mailto:info@aljazeera.com">info@aljazeera.com</a></span><br>


            <span><i> <?php echo $text_telephone; ?></i><a href="tel: <?php echo $telephone; ?>"> <?php echo $telephone; ?></a></span><br>


            <?php if ($open) { ?>
            <span><i><?php echo $text_open; ?></i><?php echo $open; ?></span><br>
            <?php } ?>

            <?php if ($comment) { ?>
            <span><i><?php echo $text_comment; ?></i><?php echo $comment; ?></span><br>
            <?php } ?>

            <?php if ($fax) { ?>
            <span><i><?php echo $text_fax; ?></i><?php echo $fax; ?></span><br><br>
            <?php } ?>

            <span class="tollfree"><i><?php echo $toll_free; ?></i><a href="tel:800800800">800 800 800</a></span>
          </div>
        </div><!-- /.col-lg-5 -->

      </div>	<!-- /.row -->
      <div class="full-width">

        <button  class="reg_btn" type="submit"  value="<?php echo $button_submit; ?>"  ><?php echo $button_submit; ?> </button>
        <button class="can_btn" type="reset"><?php echo $cancel; ?></button>
      </div>
    </div>
      </form>
  </div>
</section>





<?php echo $footer; ?>































<?php if(false){ ?>


<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
      <h3><?php echo $text_location; ?></h3>
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <?php if ($image) { ?>
            <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3"><strong><?php echo $store; ?></strong><br />
              <address>
              <?php echo $address; ?>
              </address>
              <?php if ($geocode) { ?>
              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
              <?php } ?>
            </div>
            <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
              <?php echo $telephone; ?><br />
              <br />
              <?php if ($fax) { ?>
              <strong><?php echo $text_fax; ?></strong><br>
              <?php echo $fax; ?>
              <?php } ?>
            </div>
            <div class="col-sm-3">
              <?php if ($open) { ?>
              <strong><?php echo $text_open; ?></strong><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_contact; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php }//end if false ?>
