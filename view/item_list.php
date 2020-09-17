<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
</head>
<body>
  <section id="container" >
      <?php include_once('../include/include_top_menu.php');?>
      <!--sidebar start-->
      <?php include_once('../include/left_menu.php');?>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
				  <section class="panel">
					  <header class="panel-heading">
						  <h3>New Item</h3>
						</header>	
						<div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li class="active">Item </li>
						  </ul>
						 </div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
             </div>
              <!--Customer overview start-->
		<?php include_once('../include/country_Customer_po.php');?>
		  <div class="row">
			<div class="col-sm-3">
				<section class="panel">
				  <header class="panel-heading">
					  New Item 
					  </header>	
					<div class="panel-body">
						<form role="form" id="item_add" action="javascript:;" method="post" name="item_add">
							  
							  <div class="form-group">
								  <label for="item Type">Item Name *</label>
								  <input type="text"  class="form-control" id="item_name" name="item_name" placeholder="Item Name" />
							  </div>
							  <div class="form-group">
								  <label for="item Type">Item Code</label>
								  <input type="text" class="form-control" id="item_code" name="item_code" placeholder="item Code" />
							  </div>
							  <div class="form-group">
								  <label for="item Type">Opening Stock *</label>
								  <input type="number" min="0"  class="form-control" id="item_stock" name="item_stock" placeholder="Opening Stock" />
							  </div>							  
								<input type='hidden' name='mode' id='mode' value='add' />
							  	<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							  <button type="submit" class="btn btn-info">Submit</button>
						  </form>

					</div>
				</section>
			</div>
			<div class="col-sm-9">
			<section class="panel">
				  <header class="panel-heading">
					  Item List
				 <span class="tools pull-right">
					<a href="javascript:;" class="fa fa-chevron-down"></a>
					<a href="javascript:;" class="fa fa-times"></a>
				 </span>
				  </header>
				  <div class="panel-body">
				  <div class="adv-table">
				  <table  class="display table table-bordered table-striped" id="dynamic-table">
				  <thead>
				  <tr>
					  <th>Sr. NO.</th>
					  <th>Item Name</th>
					  <th>Item Code</th>
					  <th>Opening Stock</th>
					  <th class="hidden-phone">Action</th>					  
				  </tr>
				  </thead>
				  <tbody>
				  </tbody>				 
				  </table>
				  </div>
				  </div>
				  </section>
			</div>
		  </div>
		  
		  <!--Customer overview end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
<!-- Modal -->
<div class="modal colored-header info" id="ModalEditAccount" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Edit item</h3>				
			</div>
			<div class="modal-body form">
			<form id="FormEdititem" role="form" method="post" novalidate>				
				<div class="form-group">
				  <label for="item Type">Item Name</label>
				  <input type="text" class="form-control" id="edit_item_name" name="edit_item_name" placeholder="item Name" />
			  </div>
			  <div class="form-group">
				 <label for="item Type">Item Code</label>
				 <input type="text" class="form-control" id="edit_item_code" name="edit_item_code" placeholder="item Code" />
			  </div>
			  
			  <div class="form-group">
				 <label for="item Type">Opening Stock</label>
				 <input type="number" min='0' class="form-control" id="edit_item_stock" name="edit_item_stock" placeholder="Opening Stock" />
			  </div>							  
														  
											
			</div>
			<div class="modal-footer">
				<input type="hidden" name="token" id="edit_token" value="<?php echo $token; ?>" />
				<input type="hidden" name="edit_id" id="edit_id" value="" />
				<button type="button" class="btn btn-default btn-flat md-close" data-dismiss="modal">Cancel</button>
				<button class="btn btn-info btn-flat" type="submit">Update</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/item_mst.js"></script>
<script>
$(".select2").select2({
		width: '100%'
	});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
        });
</script>
  </body>
</html>
