<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Master BOM";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	if(strpos($_SERVER[REQUEST_URI], "master_bom_edit")==false) {
		$mode="Add";
	}
	else {
		$mode="Edit";
		$bom_mst_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_master_bom where bom_mst_id=$bom_mst_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container">
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
	<h3><?=$mode.' '.$form?>
		<!--<a href="<?=ROOT.'import_product'?>" >
		<button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
	</h3>
</header>	
<div class="">
	<ul class="breadcrumb">
		<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
		<li class="active"><a href="<?=ROOT.'master_bom_list'?>"><?=$form?> List </a></li>
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
	<form role="form" id="master_bom_add" action="javascript:;" method="post" name="master_bom_add">
		
		<div class="col-md-12">
			
				<div class="col-md-6">
					<div class="form-group">
						<label for="Product Type" class="col-md-4 control-label">Finish Product*</label>
						<div class="col-md-8">
							<select class="select2" id="product_id" name="product_id" onchange="chk_exist_bom(this.value)">
								<?=getproduct_typewise($dbcon,$rel['product_id'],'1');?>
							</select>
							<label class="error" id="chk_exist_bom_err" style="display:none;">Product BOM Already Exist!!!</label>
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="Product Type" class="col-md-4 control-label">Product Qty*</label>
						<div class="col-md-8">
							<input type="number" class="form-control" id="finish_pro_qty" name="finish_pro_qty" placeholder="Product Qty" value="<?=$rel['finish_pro_qty']?>">
						</div>
					</div>							 
				</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12" style="margin-top:15px;"></div>
			<div class="col-md-8 col-md-offset-2">
				<div class="form-group">
					<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr>
							<th width="50%" class="text-center">Item Details</th>
							<th width="30%" class="text-center">Required Qty</th>
							<th width="10%" class="text-center">Unit</th>
							<th width="10%" class="text-center">Action</th>
						</tr>
						<tr>
							<td style="vertical-align:top;"> 
								<select class="select2" name="req_product_id" id="req_product_id" onchange="load_product_dtls(this.value);">
									<?=getproduct_typewise($dbcon,"",'2,3,4,5');?>
								</select><br/><br/>
								<textarea class="form-control" id="req_product_desc" name="req_product_desc" placeholder="Enter Item Description" style="resize:both;"></textarea>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" class="form-control" id="req_product_qty" name="req_product_qty" placeholder="Required Qty">
							</td>
							<td style="vertical-align:top;">  
								<select class="select2" name="req_unitid" id="req_unitid" title="Select Unit">
									<?=getunit($dbcon,0);?>
								</select>
							</td>
							<td style="vertical-align:top;"> 
								<input type="button" name="addrow" id="addrow" onClick="return add_bom_trn_data();" class="btn btn-primary" value="Add"/>
								<input type='hidden' name='edit_id' id='edit_id' value='' />
							</td>
						</tr>
					</table>		
				</div> 
				<div class="form-group">
					<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr>
							<th width="5%" class="text-center">Sr.<br/>No.</th>
							<th width="55%" class="text-center">Item Details</th>
							<th width="30%" class="text-center">Required Qty</th>
							<th width="10%" class="text-center">Action</th>
						</tr>
						<tbody id="master_bomtrn_tbody"></tbody>
					</table>	
				</div> 
			</div> 
			
			
			<div class="clearfix" style="margin-bottom:10px;"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['bom_mst_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Submit</button>
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'master_bom_list'?>">Cancel</a>
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
<!--footer end-->
</section>
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/master_bom.js"></script>
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