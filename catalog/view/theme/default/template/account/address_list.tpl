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
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
                  <li><a href="<?php echo $editLink;?>"><?php echo $account_information; ?></a></li>
                  <li><a href="<?php echo $addressLink;?>" class="active"><?php echo $text_address_book; ?></a></li>
                  <li><a href="<?php echo $orderLink;?>"><?php echo $your_order; ?></a></li>
                  <li><a href="<?php echo $passwordLink;?>"><?php echo $change_password; ?></a></li>
                </ul>
              </div>
            </div>
          </div><!--col-md-4-->









            <div class="col-lg-8 col-md-8"><!--col-md-8-->
              <div class="dashboard-right">


                <?php $j=0; foreach ($addresses as $result) { $j++; ?>

                <form action="<?php echo $result['editAction']; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <div class="delivery-address"><!--Delivery Address-->
                  <h3><?php echo $delivery_address; ?> <?php echo $j; ?></h3>
                  <div class="form-group">
                    <div class="row">



                      <?php $i=0; foreach ($custom_fields as $custom_field) { $i++; ?>

                      <?php if ($custom_field['location'] == 'address') { ?>

                      <?php if ($custom_field['type'] == 'text') { ?>

                      <div class="<?php if($i <= 2 ){ ?> col-xs-12  col-md-6 <?php }else{ ?>  col-xs-12  col-md-3 <?php } ?>">
                        <label  for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($result['custom_field'][$custom_field['custom_field_id']]) ? $result['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" >
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                        <?php } ?>
                      </div>


                      <?php   }//if type text
                    }//if address custom field
                    }//for each custom field ?>


                    </div>
                  </div>

                  <div class="form-group checkbox-section">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="checkbox-container">
                          <input name="select_address_id" value="<?php echo $result['address_id']; ?>" type="checkbox">
                          <label><?php echo $select_check; ?></label>
                        </div>
                      </div>




                      <div class="col-md-3">
                        <div class="checkbox-container">
                          <input type="checkbox"   name="default" value="1"   <?php if ($result['default']) { ?> checked <?php } ?> >
                          <label><?php echo $entry_default; ?></label>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <button class="can_btn"><?php echo $button_edit;?></button>
                      </div>













                    </div>
                  </div>
                  
                  
                </div><!--Delivery Address-->
                </form>

                <?php }//end foreach addressses ?>




                <div class="full-width address-btn">
                  <button class="can_btn" type="button" onclick="deleteSelectedAddress();"><?php echo $deleted_selected;?></button>

                  <button onclick="window.location.href='<?php echo $add;?>';" class="reg_btn"><?php echo $button_new_address;?> </button>
                </div>
              </div>
            </div><!--col-md-8-->









        </div><!--row-->
      </div><!--account-dashboard-->

    </div>
  </div>
</section><!--Inner Content section-->





<script>
  $(document).ready(function(){
    $('input').iCheck({
      checkboxClass: 'icheckbox_flat-red',
      radioClass: 'iradio_flat-red'
    });
  });

  function deleteSelectedAddress(){
    if(!confirm('are you sure you want to delete selected addresses? ')){
      return false;
    }

    var address_id_array=[];

    $('.checked input[name="select_address_id"]').each(function(){
      address_id_array.push('address_id[]='+$(this).attr('value'));
    });
    window.location.href='?route=account/address/delete&'+address_id_array.join('&');
  }
</script>



<script>
  $(document).ready(function(e) {
    $('.cart').click(function(e) {
      e.preventDefault();
      $('.cart-popup').toggle();
      e.stopPropagation();

    });

    $(document).click(function(e){
      // e.preventDefault();
      $('.cart-popup').hide();
      e.stopPropagation();
    });
  });
</script>
















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
<script type="text/javascript"><!--
  $('select[name=\'country_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=account/account/country&country_id=' + this.value,
      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');
  //--></script>



























<?php if(false){ ?>


<div class="container inner-content-wrapper" style="color:#ffffff;padding:30px 10%;">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <h2><?php echo $text_address_book; ?></h2>
      <?php if ($addresses) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <?php foreach ($addresses as $result) { ?>
          <tr>
            <td class="text-left"><?php echo $result['address']; ?></td>
            <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
          </tr>
          <tr>





            <?php foreach ($custom_fields as $custom_field) { ?>

            <?php if ($custom_field['location'] == 'address') { ?>

            <?php if ($custom_field['type'] == 'text') { ?>

            <div class="col-md-6">
              <label  for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($result['custom_field'][$custom_field['custom_field_id']]) ? $result['custom_field'][$custom_field['custom_field_id']] : ''); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" >
              <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
              <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
              <?php } ?>
            </div>


            <?php   }//if type text
                    }//if address custom field
                    }//for each custom field ?>









          </tr>
          <?php } ?>
        </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php }//if false ?>


<?php echo $footer; ?>