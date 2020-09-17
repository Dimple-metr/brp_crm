<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Quotation Budget";
	$quot_trn_id=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select trn.* from tbl_quotation_trn as trn
	where trn.quot_trn_id=$quot_trn_id";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	
$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
$set_head=mysqli_fetch_assoc($dbcon->query($set));
//Get Back Link
$back_link=$_SERVER['HTTP_REFERER'];

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
			<h3><?=$form?></h3>
			
		</header>	
		<div class="">
			<ul class="breadcrumb">
			
				<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="<?=$back_link?>"><?=$form?> List</a></li>
			</ul>
		</div>
	</section>
	<!--breadcrumbs end -->
</div>	
</div>
<!--state overview start-->
<div class="row">			
<div class="col-md-12">
<section class="panel">
<header class="panel-heading">
	New <?=$form?>
</header>	
<div class="panel-body">
	<form class="form-horizontal" role="form" id="quotation_budget_add" action="javascript:;" method="post" name="quotation_budget_add">
		<div class="row">
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="col-md-3 control-label">Product</label>
					<div class="col-md-6">
						<select class="select2" name="product_id" id="product_id">
							<?=getproduct_typewise($dbcon,$rel['product_id'],'1,2,3,4,5');?>
						</select>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="col-md-3 control-label">Quantity</label>
					<div class="col-md-6"> 
						<input type="text" id="product_qty" name="product_qty" class="form-control" placeholder="Product Quantity" value="<?=$rel['product_qty']?>" readonly >
					</div>
				</div>	
			</div>
			<div class="col-md-12 text-center">
				<div class="form-group">
					<div class="col-md-12"> 
						<button type="button" class="btn btn-primary" onClick="copy_master_bom_data()"><i class="fa fa-clipboard" aria-hidden="true"></i> Copy Master BOM</button>
					</div>
				</div>	
			</div>
	<div class="clearfix"></div>
	<hr/>
	<div class="col-md-12">
		<div class="form-group">
			<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
				<tr>
					<th width="25%" class="text-center">Item Details</th>
					<th width="" class="text-center">Quantity</th>
					<th width="" class="text-center">Rate</th>
					<th width="" class="text-center">Unit</th>
					<th width="" class="text-center">Amount</th>
					<th width="2%" class="text-center">Action</th>
				</tr>
				<tr>
					<td style="vertical-align:top;"> 
						<select class="select2" name="req_product_id" id="req_product_id" onchange="load_item_det(this.value);">
							<?=getproduct_typewise($dbcon,"",'2,3,4,5');?>
						</select><br/><br/>
						<textarea class="form-control" id="req_product_desc" name="req_product_desc" placeholder="Enter Item Description" style="resize:both;"></textarea>
					</td>
					<td style="vertical-align:top;"> 
						<input type="number" min="0" class="form-control" id="req_product_qty" name="req_product_qty" onkeyup="get_budget_amount();" value="">
					</td>
					<td style="vertical-align:top;"> 
						<input type="number" min="0" class="form-control" id="req_product_rate" name="req_product_rate" onkeyup="get_budget_amount();" value="">
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
						<input type="button" name="addbudgetrow" id="addbudgetrow" onClick="return add_budget_trn_data();" class="btn btn-primary" value="Add"/>
						<input type='hidden' name='budget_trn_edit_id' id='budget_trn_edit_id' value='' />
					</td>
				</tr>
			</table>	
		</div>	
		<div class="form-group" id="quot_budget_trn_div"></div>	
		
	</div>	
	<div class="clearfix"></div>
	<div class="col-md-6"></div>	
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-4 control-label">Total</label>
			<div class="col-md-8"> 
				<input type="text" id="budget_trn_ttl" name="budget_trn_ttl" class="form-control" value="<?=$rel['budget_trn_ttl']?>" readonly >
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label">Margin</label>
			<div class="col-md-2" style="padding-right: 5px;"> 
				<input type="number" min="0" max="100" id="budget_margin_per" name="budget_margin_per" class="form-control" value="<?=$rel['budget_margin_per']?>" placeholder="in %" title="Margin in %" onkeyup="get_budget_margin('per');">
			</div>
			<div class="col-md-1" style="padding:0;"><strong>%</strong></div>
			<div class="col-md-5"> 
				<input type="number" min="0" id="budget_margin_amt" name="budget_margin_amt" class="form-control" value="<?=$rel['budget_margin_amt']?>" placeholder="in Amount" title="Margin in Amount" onkeyup="get_budget_margin('amt');">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label">Grand Total</label>
			<div class="col-md-8"> 
				<input type="text" id="budget_trn_g_total" name="budget_trn_g_total" class="form-control" value="<?=$rel['budget_trn_g_total']?>" readonly >
			</div>
		</div>	
	</div>	
	
	<div class="clearfix"></div>
	</div>
		<div class="clearfix"></div>
		<div class="col-md-12 text-center">
			<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
			<a href="<?=$back_link?>" type="button" class="btn btn-danger">Cancel</a>	
		</div>
	</div>
</div><!--Vendor row end-->	
<input type='hidden' name='mode' id='mode' value='get_budget'/>
<input type='hidden' name='quot_trn_id' id='quot_trn_id' value='<?=$quot_trn_id?>' />

</form>
</div>	
</section>
</div>
</div>
<!--state overview end-->
</section>
</section>
<!--main content end-->
<!--footer start-->

	<?php include_once('../include/footer.php');?>
	<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script>
var formSubmitting = false;
var setFormSubmitting = function() { formSubmitting = true; };
window.onload = function() {
    window.addEventListener("beforeunload", function (e) {
        if (formSubmitting) {
            return undefined;
        }

        var confirmationMessage = 'You sure you want to leave? ';

        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
        return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
    });
};
</script>
<script src="<?=ROOT?>js/app/quotation.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
$('#product_id').select2("readonly",true);
$(document).ready(function() {
	//setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
	show_budget_trn_data();
});
</script>
</body>
</html>