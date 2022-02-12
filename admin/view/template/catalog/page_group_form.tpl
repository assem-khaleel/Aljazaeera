<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-page_group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-page_group" class="form-horizontal">



          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-page_name"><?php echo $entry_page_name; ?></label>
            <div class="col-sm-10">

              <select type="text" name="page_name" id="input-page_name" class="form-control" >
                <?php
                $page_name_array=['Media Center'];

                foreach($page_name_array as $onePageName){
                echo '<option value="'.$onePageName.'" '. (($onePageName == $page_name )? 'selected':'').'>'.$onePageName.'</option>';
                }

                ?>
              </select>
              <?php if ($error_page_name) { ?>
              <div class="text-danger"><?php echo $error_page_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-tab_name"><?php echo $entry_tab_name; ?></label>
            <div class="col-sm-10">


              <select type="text" name="tab_name" id="input-tab_name" class="form-control" >
                <?php
                $tab_name_array=['News','Events','Photo Gallery','Video Gallery'];

                foreach($tab_name_array as $oneTabName){
                echo '<option value="'.$oneTabName.'" '. (($oneTabName == $tab_name )? 'selected':'').'>'.$oneTabName.'</option>';
                }

                ?>
              </select>

              <?php if (isset($error_tab_name)) { ?>
              <div class="text-danger"><?php echo $error_tab_name; ?></div>
              <?php } ?>
            </div>
          </div>



          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-headline"><?php echo $entry_headline; ?></label>
            <div class="col-sm-10">
              <input type="text" name="headline" value="<?php echo $headline; ?>" placeholder="<?php echo $entry_headline; ?>" id="input-headline" class="form-control" />
            </div>
          </div>



          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $page_group_store)) { ?>
                    <input type="checkbox" name="page_group_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="page_group_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $page_group_store)) { ?>
                    <input type="checkbox" name="page_group_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="page_group_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
              <?php if ($error_keyword) { ?>
              <div class="text-danger"><?php echo $error_keyword; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="media" value="<?php echo $media; ?>" id="input-image" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>




          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
            <div class="col-sm-10">
              <input type="text" name="type" value="<?php echo $type; ?>" placeholder="<?php echo $entry_type; ?>" id="input-type" class="form-control" />
            </div>
          </div>



          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-detail"><?php echo $entry_detail; ?></label>
            <div class="col-sm-10">
              <input type="text" name="detail" value="<?php echo $detail; ?>" placeholder="<?php echo $entry_detail; ?>" id="input-detail" class="form-control" />
            </div>
          </div>



          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom[link]" value="<?php echo $link; ?>" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom[phone]" value="<?php echo $phone; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-phone" class="form-control" />
            </div>
          </div>


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom[address]" value="<?php echo $address; ?>" placeholder="<?php echo $entry_address; ?>" id="input-address" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom[date]" value="<?php echo $date; ?>" placeholder="<?php echo $entry_address; ?>" id="input-address" class="form-control" />
            </div>
          </div>




        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>