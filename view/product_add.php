<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Product";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));	
	
	if(strpos($_SERVER[REQUEST_URI], "product_edit")==false) {
		$mode="Add";
	
	}
	else {
		$mode="Edit";
		$pro_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_product where product_id=$pro_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		
		//print_r($check_array_setting);

	}
	//echo $_SESSION['branch_id'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container" class="sidebar-closed">
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
						  <h3>New <?=$form?>
						  <!--<a href="<?=ROOT.'import_product'?>" >
						  <button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
						  </h3>
						</header>	
						<div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li class="active"><a href="<?=ROOT.'product_list'?>"><?=$form?> List </a></li>
						  </ul>
						</div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
             </div>
              <!--Customer overview start-->
		
		  <div class="row">
			<div class="col-sm-12">
				<section class="panel">
					<header class="panel-heading">
					  New <?=$form?> 
						<span class="tools pull-right">
							<a href="javascript:;" class="fa fa-chevron-down"></a>
						</span>
					</header>	
					<div class="panel-body">
						<form role="form" id="product_add" action="javascript:;" method="post" name="product_add">
						
							<header class="panel-heading breadcrumb text-center">
							   <h3>Product Details</h3>
							</header>
							
					<div class="col-md-12" style="padding-top: 25px;">
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Product Name*</label>
								  <div class="col-md-8 col-xs-11">
								  <input type="text"  class="form-control" id="product_name" name="product_name" placeholder="Product Name" value="<?=$rel['product_name'];?>" />
								  </div>
							  </div>							 
							</div>
					
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Item Code</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="item_code" name="item_code" placeholder="Item Code"  value="<?=$rel['item_code'];?>" />
								  </div>
							  </div>
							</div>
							
						</div> 
						
						<div class="col-md-12" style="margin-top:5px">
							 
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Product Category*</label>
								  <div class="col-md-7">
								  <select class="select2" id="product_cat" name="product_cat">
									  <option>--Select Product Category--</option>
										<?=get_product_category($dbcon,$rel['product_cat']); ?>
								  </select>
								  </div>
								  <div class="col-md-1">
										<button type="button" id="product_cat_btn" data-toggle="modal" data-target="#bs-product-category-modal"  class="btn btn-primary"><i class="fa fa-plus"></i></button>
								  </div>
							  </div>							 
							</div>
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Product Group*</label>
								  <div class="col-md-7">
								  <select class="select2" id="product_group" name="product_group">
										<?=get_product_group($dbcon,$rel['product_group']); ?>
								  </select>
								  </div>
								  <div class="col-md-1">
										<button type="button" id="product_grp_btn" data-toggle="modal" data-target="#bs-product-group-modal"  class="btn btn-primary"><i class="fa fa-plus"></i></button>
								  </div>
							  </div>							 
							</div>
							 
						</div>
						
						<div class="col-md-12" style="margin-top:5px">
						
							 <div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Product Brand*</label>
								  <div class="col-md-7">
								  <select class="select2" id="product_brand" name="product_brand">
										<option>--Select Product Brand--</option>
										<?=get_product_brand($dbcon,$rel['product_brand']); ?>
								  </select>
								  </div>
								  <div class="col-md-1">
										<button type="button" id="product_brand_btn" data-toggle="modal" data-target="#bs-product-brand-modal"  class="btn btn-primary"><i class="fa fa-plus"></i></button>
								  </div>
							  </div>							 
							</div>
							  	
							 <div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Product Type*</label>
								  <div class="col-md-8 col-xs-11">
								  <select class="select2" id="product_type" name="product_type">
										<option value="">--Select Product Type--</option>
										<?=get_product_type($dbcon,$rel['product_type'])?>
								  </select>
								  </div>
							  </div>							 
							</div>
							
						
						</div>
							
						<div class="col-md-12" style="margin-top:5px;">
							 <div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">HSN Code</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" id="product_hsn" name="product_hsn" placeholder="HSN Code" value="<?=$rel['product_hsn']?>" />
									  </div>
								  </div>
							  </div>
							  
							  <div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Description" class="col-md-4 control-label">Description</label>
									  <div class="col-md-8 col-xs-11">
										<textarea class="form-control" id="product_desc" name="product_desc" placeholder="Enter Product Description"><?=$rel['product_desc']?></textarea>
									  </div>
								  </div>
							  </div>
						</div>
						
						<div class="col-md-12" style="margin-top:5px;">
							 <div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Part No</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" id="product_part" name="product_part" placeholder="Product Part No" value="<?=$rel['product_part']?>" />
									  </div>
								  </div>
							  </div>
							  
							  <div class="col-md-6">
								 <div class="form-group">
									  <label class="col-md-4 control-label">Product Photo</label>
									  <div class="col-md-8 col-xs-11">
										<input type="file" class="form-control" placeholder="Logo" name="file" id="file"  title="product photo" />
										
										</div>
										<div class="col-md-3">
										<?	$p_photo=ROOT.'view/upload/product_image/'.$rel['p_photo'];
											if($rel['p_photo']){
										?>
											<a href="<?=$p_photo?>" target="_blank" class="btn btn-primary">View</a>
										<?	} ?>
										</div>
										<span id="uploaded_image"></span>
									</div>
							  </div>
						</div>
						
						<div class="col-md-6" style="margin-top:25px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Product Serial No</h3>
							</header>
							
							<div class="col-md-9 col-md-offset-1">
								<table class="table table-bordered">
								
									<thead>
										<tr>
											<th>Serial No</th>
											<th></th>
										</tr>
										
										<tr>
											<th width="70%"><input type="text" class="form-control" name="p_serial" id="p_serial" /></th>
											<td width="1%"><input type="button" class="btn btn-success" id="ad_serial_btn" value="ADD" onclick="add_serial()" /></td>
											<input type="hidden" id="edit_id_serial" name="edit_id_serial" value="" />
										</tr>
									</thead>
								</table>
								
								<table class="table table-bordered" id="serial_table" >
									
									
									
								</table>
							</div>
						</div>
						<div class="col-md-6" style="margin-top:25px;"> 
							<header class="panel-heading breadcrumb text-center">
							   <h3>Stock Details</h3>
							</header>
							<div class="col-md-9 col-md-offset-1">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-md-4 control-label">Opening Stock</label>
										<div class="col-md-8">
											<input type="number" min="0" class="form-control" placeholder="Opening Stock" name="opening_stock" id="opening_stock" value="<?=$rel['opening_stock']?>"/>
										</div>
									</div>
								</div>
								<div class="col-md-12" style="margin-top:10px;">
									<div class="form-group">
										<label class="col-md-4 control-label">Minimum Stock</label>
										<div class="col-md-8">
											<input type="number" min="0" class="form-control" placeholder="Minimum Stock" name="minimum_stock" id="minimum_stock" value="<?=$rel['minimum_stock']?>"/>
										</div>
									</div>
								</div>	
							</div>
						</div>
						
						<div class="col-md-12" style="margin-top:25px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Product Model No</h3>
							</header>
							
							<div class="col-md-9 col-md-offset-1">
								<table class="table table-bordered">
								
									<thead>
										<tr>
											<th>Model No</th>
											<th></th>
										</tr>
										
										<tr>
											<th width="70%"><input type="text" class="form-control" name="p_model" id="p_model" /></th>
											<td width="1%"><input type="button" class="btn btn-success" value="ADD" id="ad_model_btn" onclick="add_model();" /></td>
											<input type="hidden" id="edit_id_model" name="edit_id_model" value="" />
										</tr>
									</thead>
									
								</table>
								
								<table class="table table-bordered" id="model_table" >
									
									
									
								</table>
							</div>
						</div>
						
						<div class="col-md-12" style="margin-top:25px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Price Information</h3>
							</header>
							
							<div class="col-md-4">
								<div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Sale Price</label>
									  <div class="col-md-8">
									  <input type="number" min="0" class="form-control" id="product_mst_rate" name="product_mst_rate" placeholder="Product Sale Rate" value="<?=$rel['product_mst_rate']?>" onkeypress="return isNumberKey(event)"  />
									  </div>
								</div>
							</div>
							
							<div class="col-md-4">
							  <div class="form-group">
									<label for="Product Type" class="col-md-4 control-label"> Unit Of Measurement</label>
									<div class="col-md-8">
									<select class="select2" name="product_mst_unitid" id="product_mst_unitid"  title="Select Unit" onchange="get_product_unit(this.value)">
										<?php if($mode=='Edit') { echo getunit($dbcon,$rel['product_mst_unitid']); } else { echo getunit($dbcon,0); } ?>
									</select>
									</div>
							  </div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="product_purchase_mst_rate" class="col-md-4 control-label">Purchase Rate</label>
									<div class="col-md-8">
										<input type="number" min="0" class="form-control" id="product_purchase_mst_rate" name="product_purchase_mst_rate" placeholder="Product Purchase Rate" value="<?=$rel['product_purchase_mst_rate']?>" />
									</div>
								</div>
							</div>
							  
							  
						</div>
						
						<div class="col-md-12" style="margin-top:25px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Technical Specification</h3>
							</header>
							
							<div class="col-md-12">
								<table class="table table-bordered">
								
									<thead>
										<tr>
											<th>Priority</th>
											<th>Header</th>
											<th>Specification</th>
											<th>Value</th>
											<th></th>
										</tr>
										
										<tr>
											<th><input type="text" class="form-control" name="p_priority" id="p_priority" /></th>
											<th><input type="text" class="form-control" name="p_header" id="p_header" /></th>
											<th><input type="text" class="form-control" name="p_spec" id="p_spec" /></th>
											<th><input type="text" class="form-control" name="p_value" id="p_value" /></th>
											<td><input type="button" class="btn btn-success" value="ADD" id="add_spec_btn"  onclick="add_product_spec();"/></td>
											<input type="hidden" id="edit_id_spec" name="edit_id_spec" value="" />
										</tr>
									</thead>
								</table>
								
								<table class="table table-bordered">
									<tbody id="specs_table">
										
									</tbody>
								</table>
							</div>
						</div>
							
						<div class="clearfix" style="margin-bottom:10px;"></div>
						
						<div class="col-md-12" style="margin-top:25px;"> 
							<header class="panel-heading breadcrumb text-center">
							   <h3>Vendor History</h3>
							</header>
							<div class="col-md-12">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Vendor Name</th>
											<th>Rate</th>
											<th>Remark</th>
											<th>Action</th>
										</tr>
									</thead>
									<tr>
										<td>
											<select class="select2" name="cust_id" id="cust_id" title="Select Vendor" >
												<?=getvender($dbcon,'')?>
											</select>
										</td>
										<td>
											<input type="number" min="0" class="form-control" id="ven_rate" name="ven_rate"  placeholder="Rate" value="" >
										</td>
										<td>
											<textarea class="form-control" id="ven_rmrk" name="ven_rmrk" placeholder="Remark"  style="resize:both;"></textarea>
										</td>
										<td><input type="button" class="btn btn-primary" value="ADD" id="add_ven_btn"  onclick="add_ven_hist();"/></td>
										<input type="hidden" id="edit_id_ven" name="edit_id_ven" value="" />
									</tr>
								</table>
								
								<div id="ven_dtl_table">
								</div>
								
							</div>
						</div>
						<div class="clearfix" style="margin-bottom:10px;"></div>	
						
						<div class="col-md-5"></div>
						<div class="col-md-4">	
						<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
						<input type='hidden' name='eid' id='eid' value='<?php if($mode=='Edit'){ echo $pro_id; } else { echo "0"; } ?>' />				  
						<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
						<button type="submit" class="btn btn-shadow btn-success" >Submit</button> 
						<a href="<?=ROOT.'product_list'?>" type="button" class="btn btn-shadow btn-danger">Cancel</a>
						</div>
						</div>
					</form>

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
<?php include_once('../include/add_product_cat.php');?>  
<?php include_once('../include/add_product_grp.php');?>  
<?php include_once('../include/add_product_brand.php');?>  
      <!--footer end-->
  </section>
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php //include_once('../include/add_productinpro.php');?>  
    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/product_mst.js?<?=time()?>"></script>
	<script src="<?=ROOT?>js/app/category_mst.js?<?=time()?>"></script>
	<script src="<?=ROOT?>js/app/product_group.js?<?=time()?>"></script>
	<script src="<?=ROOT?>js/app/product_brand.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
 var tableToExcel = (function() {
 var uri = 'data:application/vnd.ms-excel;base64,'
   , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head></head><body><table>{table}</table></body></html>'
   , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
   , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
 return function(table, name) {
   if (!table.nodeType) table = document.getElementById(table)
   var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
   window.location.href = uri + base64(format(template, ctx))
 }
})();
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
});
</script>
</body>
</html>