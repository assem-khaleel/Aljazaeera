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
      <h2><?php echo $user_dashboard; ?></h2>
      <div class="account-dashboard"><!--account-dashboard-->
        <div class="row">
          <div class="col-lg-4 col-md-4"><!--col-md-4-->
            <div class="side-nav-wrapper">
              <div class="side-nav">
                <ul>
                  <li><a href="<?php echo $editLink;?>" class="active"><?php echo $account_information; ?></a></li>
                  <li><a href="<?php echo $addressLink;?>"><?php echo $address_book; ?> </a></li>
                  <li><a href="<?php echo $orderLink;?>"><?php echo $your_order; ?></a></li>
                  <li><a href="<?php echo $passwordLink;?>"><?php echo $change_password; ?></a></li>
                </ul>
              </div>
            </div>
          </div><!--col-md-4-->
          <div class="col-lg-8 col-md-8"><!--col-md-8-->
            <div class="dashboard-right">




              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <div class="delivery-address"><!--Delivery Address-->
                <h3><?php echo $text_your_details; ?></h3>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label><?php echo $entry_firstname; ?> </label>
                      <input type="text"  name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" >
                      <?php if ($error_firstname) { ?>
                      <div class="text-danger"><?php echo $error_firstname; ?></div>
                      <?php } ?>
                    </div>


                    <div class="col-md-6">
                      <label><?php echo $entry_lastname; ?> </label>
                      <input type="text"  name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" >
                      <?php if ($error_lastname) { ?>
                      <div class="text-danger"><?php echo $error_lastname; ?></div>
                      <?php } ?>
                    </div>




                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6 custom_width">
                      <label><?php echo $entry_telephone; ?></label>
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
                      <input type="text"name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="inputtelephone"class="common_input" />
                      <?php if ($error_telephone) { ?>
                      <div class="text-danger"><?php echo $error_telephone; ?></div>
                      <?php } ?>
                    </div>
                    <div class="col-md-6">
                      <label><?php echo $entry_email; ?></label>
                      <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email">
                      <?php if ($error_email) { ?>
                      <div class="text-danger"><?php echo $error_email; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                </div>

                <div class="form-group checkbox-section">
                  <div class="row">
                    <div class="col-md-3 pull-right">
                      <button type="submit" class="can_btn"><?php echo $edit_info; ?></button>
                    </div>

                  </div>
                </div>
              </div><!--account info -->
              </form>




              <div class="delivery-address" style="display:none;"><!--Delivery Address-->
                <h3>default delivery address</h3>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label>Address Name</label>
                      <input type="text" placeholder="My Home ">
                    </div>
                    <div class="col-md-6">
                      <label>Area</label>
                      <input type="text" placeholder="Abu Halifa ">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-3">
                      <label>Governorate</label>
                      <input type="text" placeholder="Jahra ">
                    </div>
                    <div class="col-md-3">
                      <label>Block</label>
                      <input type="text" placeholder="21 ">
                    </div>
                    <div class="col-md-3">
                      <label>Street</label>
                      <input type="text" placeholder="5th Ring Road">
                    </div>
                    <div class="col-md-3">
                      <label>Avenue</label>
                      <input type="text" placeholder="4">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-3">
                      <label>Building No.</label>
                      <input type="text" placeholder="3145 ">
                    </div>
                    <div class="col-md-3">
                      <label>Floor No.</label>
                      <input type="text" placeholder="11 ">
                    </div>
                    <div class="col-md-3">
                      <label>Flat No.</label>
                      <input type="text" placeholder="1105">
                    </div>

                  </div>
                </div>
                <div class="form-group checkbox-section">
                  <div class="row">
                    <div class="col-md-3 pull-right">
                      <button class="can_btn">EDIT INFO</button>
                    </div>

                  </div>
                </div>
              </div><!--Delivery Address-->

            </div>
          </div><!--col-md-8-->
        </div><!--row-->
      </div><!--account-dashboard-->

    </div>
  </div>
</section><!--Inner Content section-->













































<?php if(false){ ?>


<div class="container inner-content-wrapper" style="color:#ffffff;padding:30px 10%;">
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_your_details; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
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

<?php }//end if false ?>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
<?php echo $footer; ?>
