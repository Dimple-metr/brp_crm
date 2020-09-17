<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="BOM";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	if(strpos($_SERVER[REQUEST_URI], "bom_edit")==false) {
		$mode="Add";
		$bom_date=date('d-m-Y');
		$sales_order_id=$dbcon->real_escape_string($_REQUEST['id']);
	}
	else {
		$mode="Edit";
		$bom_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_bom where bom_id=$bom_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$bom_date=date('d-m-Y',strtotime($rel['bom_date']));
		$sales_order_id=$rel['sales_order_id'];
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
		<li class="active"><a href="<?=ROOT.'bom_list'?>"><?=$form?> List </a></li>
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
	<form class="form-horizontal" role="form" id="bom_add" action="javascript:;" method="post" name="bom_add">
		
		<div class="col-md-12">
			
				<div class="col-md-6">
					<div class="form-group">
						<label for="bom_no" class="col-md-4 control-label">BOM No.*</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="bom_no" name="bom_no" value="<?=$rel['bom_no']?>">
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="bom_date" class="col-md-4 control-label">BOM Date*</label>
						<div class="col-md-8">
							<input type="text" class="form-control default-date-picker required valid" id="bom_date" name="bom_date" value="<?=$bom_date?>">
						</div>
					</div>							 
				</div>
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="sales_order_id" class="col-md-4 control-label">Sales Order*</label>
					<div class="col-md-8">
						<select class="select2" id="sales_order_id" name="sales_order_id" onchange="load_sales_order_data(this.value)">
							<?=get_sales_order($dbcon,$sales_order_id,$mode);?>
						</select>
					</div>
				</div>							 
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="so_trn_id" class="col-md-4 control-label">Sales Product*</label>
					<div class="col-md-8">
						<select class="select2" id="so_trn_id" name="so_trn_id" onchange="load_sales_order_trn(this.value);">
							<?=get_sales_order_trn($dbcon,$rel['so_trn_id'],$sales_order_id);?>
						</select>
					</div>
				</div>							 
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12" style="margin-top:15px;"></div>
			<div class="col-md-12">
				<div class="form-group">
					<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr>
							<th width="25%" class="text-center">Item Details</th>
							<th width="" class="text-center">Quantity</th>
							<th width="" class="text-center">Rate</th>
							<th width="" class="text-center">Unit</th>
							<th width="" class="text-center">Amount</th>
							<th width="5%" class="text-center">Action</th>
						</tr>
						<tr>
							<td style="vertical-align:top;"> 
								<select class="select2" name="req_product_id" id="req_product_id" onchange="load_product_dtls(this.value);">
									<?=getproduct_typewise($dbcon,"",'2,3,4,5');?>
								</select><br/><br/>
								<textarea class="form-control" id="req_product_desc" name="req_product_desc" placeholder="Enter Item Description" style="resize:both;"></textarea>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" class="form-control" id="req_product_qty" name="req_product_qty" placeholder="Required Qty" onkeyup="get_bom_amount();" value="">
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="req_product_rate" name="req_product_rate" onkeyup="get_bom_amount();" value="">
							</td>
							<td style="vertical-align:top;">  
								<select class="select2" name="req_unitid" id="req_unitid" title="Select Unit">
									<?=getunit($dbcon,0);?>
								</select>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="req_product_amount" name="req_product_amount" value="" readonly>
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
							<th width="3%" class="text-center">Sr.<br/>No.</th>
							<th width="50%" class="text-center">Item Details</th>
							<th width="20%" class="text-center">Quantity</th>
							<th width="10%" class="text-center">Rate</th>
							<th width="10%" class="text-center">Amount</th>
							<th width="7%" class="text-center">Action</th>
						</tr>
						<tbody id="master_bomtrn_tbody"></tbody>
					</table>	
				</div> 
			</div> 
			
			
	<div class="clearfix" style="margin-bottom:10px;"></div>	
		<div class="col-md-6"></div>	
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-4 control-label">Total</label>
				<div class="col-md-8"> 
					<input type="text" id="bom_trn_ttl" name="bom_trn_ttl" class="form-control" value="<?=$rel['bom_trn_ttl']?>" readonly >
				</div>
			</div>	
		</div>
	<div class="clearfix" style="margin-bottom:10px;"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['bom_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Submit</button>
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'bom_list'?>">Cancel</a>
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
<script src="<?=ROOT?>js/app/bom.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
<?if($mode=='Add'){?>
	load_bom_no();
<?}
else{?>
$('#sales_order_id').select2('readonly',true);
$('#so_trn_id').select2('readonly',true);
<?}?>
</script>
</body>
</html>