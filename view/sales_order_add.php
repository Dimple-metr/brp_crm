<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Sales Order";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	if(strpos($_SERVER[REQUEST_URI], "sales_order_edit")==false) {
		$mode="Add";
		$sales_order_date=date('d-m-Y');
		$so_ref_date=date('d-m-Y');
		$cust_id='';
		//Delete temp DATA
		$deltempid=$dbcon->query("DELETE FROM tbl_sales_order_trn where so_trn_status=3 and user_id=".$_SESSION['user_id']);
	}
	else {
		$mode="Edit";
		$sales_order_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_sales_order where sales_order_id=$sales_order_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$sales_order_date=date('d-m-Y',strtotime($rel['sales_order_date']));
		$cust_id=$rel['cust_id'];
		$so_ref_date='';
		if($rel['so_ref_date']!='1970-01-01' && $rel['so_ref_date']!='0000-00-00'){
			$so_ref_date=date('d-m-Y',strtotime($rel['so_ref_date']));
		}
		
	}
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
	<h3><?=$mode.' '.$form?>
		<!--<a href="<?=ROOT.'import_product'?>" >
		<button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
	</h3>
</header>	
<div class="">
	<ul class="breadcrumb">
		<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
		<li class="active"><a href="<?=ROOT.'sales_order_list'?>"><?=$form?> List </a></li>
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
	<form class="form-horizontal" role="form" id="sales_order_add" action="javascript:;" method="post" name="sales_order_add">
		
		<div class="row">
			
				<div class="col-md-6">
					<div class="form-group">
						<label for="sales_order_no" class="col-md-4 control-label">Sales Order No.*</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="sales_order_no" name="sales_order_no" value="<?=$rel['sales_order_no']?>" readonly />
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="sales_order_date" class="col-md-4 control-label">Sales Order Date*</label>
						<div class="col-md-8">
							<input type="text" class="form-control default-date-picker reuired valid" id="sales_order_date" name="sales_order_date" value="<?=$sales_order_date?>" readonly>
						</div>
					</div>							 
				</div>
				<div class="clearfix"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="so_ref_no" class="col-md-4 control-label">Ref No.</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="so_ref_no" name="so_ref_no" placeholder="Ref No." value="<?=$rel['so_ref_no']?>" />
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="so_ref_date" class="col-md-4 control-label">Ref Date</label>
						<div class="col-md-8">
							<input type="text" class="form-control default-date-picker valid" id="so_ref_date" name="so_ref_date" placeholder="Ref Date" value="<?=$so_ref_date?>" >
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="cust_id" class="col-md-4 control-label">Customer*</label>
						<div class="col-md-8">
							<select class="select2" id="cust_id" name="cust_id" onchange="load_cust_quot(this.value);">
								<?=getcust($dbcon,$cust_id)?>
							</select>
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="quotation_id" class="col-md-4 control-label">Quotation*</label>
						<div class="col-md-8">
							<select class="select2" id="quotation_id" name="quotation_id" onchange="copy_quot_trn_data(this.value)">
								<?=get_custwise_quot($dbcon,$cust_id,$rel['quotation_id'],"Edit");?>
							</select>
						</div>
					</div>							 
				</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12" style="margin-top:15px;"></div>
			<div class="col-md-12">
				<div class="form-group" style="overflow-x:scroll;">
					<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr>
							<th width="25%" class="text-center">Product Details</th>
							<th width="" class="text-center">Quantity</th>
							<th width="" class="text-center">Rate</th>
							<th width="" class="text-center">Unit</th>
							<th width="" class="text-center">Discount</th>
							<th width="" class="text-center">Taxable Value</th>
							<th width="" class="text-center">Tax</th>
							<th width="" class="text-center">Amount</th>
							<th width="2%" class="text-center">Action</th>
						</tr>
						<tr>
							<td style="vertical-align:top;"> 
								<select class="select2" name="product_id" id="product_id">
									<?=getproduct_typewise($dbcon,"",'1,2,3,4,5');?>
								</select><br/><br/>
								<textarea class="form-control" id="product_desc" name="product_desc" placeholder="Enter Product Description" style="resize:both;"></textarea>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="product_qty" name="product_qty" onkeyup="get_amount();get_discount('per');" value="">
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="product_rate" name="product_rate" onkeyup="get_amount();get_discount('per');" value="">
							</td>
							<td style="vertical-align:top;"> 
								<select class="select2" name="unitid" id="unitid" title="Select Unit">
									<?=getunit($dbcon,0);?>
								</select>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" title="Enter Discount (In value)" min="0" id="product_discount" name="product_discount" onkeyup="get_discount('amt');" class="form-control" placeholder="in value"/>
								<br/>
								<input type="number"  title="Enter Discount (In %)" min="0" id="discount_per" name="discount_per" onkeyup="get_discount('per');" class="form-control" placeholder="in %" max="100"/>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="product_amount" name="product_amount" value="" readonly>
							</td>
							<td style="vertical-align:top;"> 
								<select class="form-control" name="formulaid" id="formulaid" onChange="get_amount();">
									<?=getformula($dbcon,'');?>
								</select>
							</td>
							<td style="vertical-align:top;"> 
								<input type="number" min="0" class="form-control" id="product_total" name="product_total" value="" readonly>
							</td>
							<td style="vertical-align:top;"> 
								<input type="button" name="addrow" id="addrow" onClick="return add_so_trn_data();" class="btn btn-primary" value="Add"/>
								<input type='hidden' name='edit_id' id='edit_id' value='' />
							</td>
						</tr>
					</table>		
				</div> 
				<div class="form-group">
					<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr>
							<th width="2%" class="text-center">Sr.<br/>No.</th>
							<th width="23%" class="text-center">Product Details</th>
							<th width="5%" class="text-center">Quantity</th>
							<th width="10%" class="text-center">Rate</th>
							<th width="8%" class="text-center">Discount</th>
							<th width="10%" class="text-center">Taxable Value</th>
							<th width="10%" class="text-center">Tax</th>
							<th width="12%" class="text-center">Amount</th>
							<th width="5%" class="text-center">Action</th>
						</tr>
						<tbody id="master_sotrn_tbody"></tbody>
					</table>	
				</div> 
			</div> 
			<div class="clearfix"></div>
			<div class="col-md-7">
<!--tab start--> 
	<div class="card">
		<ul class="nav nav-tabs" id="my_tab_id" role="tablist"> 
			<li role="presentation" id="tab1" class="active"><a href="#remark-section" aria-controls="remark-section" role="tab" data-toggle="tab">Remark</a></li>
			<li role="presentation" id="tab2"><a href="#attach-section" aria-controls="attach-section" role="tab" data-toggle="tab">Attachment</a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content"> 
			<!-- Remaks Tab Start -->
			<div role="tabpanel" class="tab-pane active" id="remark-section">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Description</label>
						<div class="col-md-12">
							<textarea id="so_remark" name="so_remark" class="form-control" rows="3" style="resize:both;"><?=$rel['so_remark']?></textarea> 
						</div>
					</div> 
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="attach-section">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Attachment</label>
						<div class="col-md-5">
							<input type="file" id="so_attach" name="so_attach" class="form-control" title="Upload Attachment">
						</div>
						<div class="col-md-2">
							<?if($rel['so_attach']){?>
								<a href="<?=ROOT.SO_ATTACH_VWING.$rel['so_attach']?>" class="btn btn-primary" target="_blank"><i class="fa fa-eye"></i> View</a>
							<?}?>
						</div>
					</div> 
				</div>
			</div>
		</div>
	</div>       		
<!--tabs end-->				
			</div>
			<div class="col-md-5">
				<div class="form-group">
					<label class="col-md-4 control-label">Grand Total</label>
					<div class="col-md-8">  
						<input type="number" min="0" id="g_total" name="g_total" class="form-control" value="<?=$rel['g_total']?>" readonly>
					</div>
				</div>	
			</div>
			
			
			<div class="clearfix" style="margin-bottom:10px;"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['sales_order_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Submit</button>
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'sales_order_list'?>">Cancel</a>
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
<script src="<?=ROOT?>js/app/sales_order.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
});
<?if($mode=='Add'){?>
	load_so_no();
<?}
else{?>
$('#cust_id').select2('readonly',true);
$('#quotation_id').select2('readonly',true);
<?}?>
</script>
</body>
</html>