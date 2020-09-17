<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php"); 
	include_once("../include/coman_function.php");
	include_once("../include/function_database_query.php");
	$form="G.R.N.";
	$countryid='101';
	$stateid='1';
	$cityid='1';
	if(strpos($_SERVER[REQUEST_URI], "grn_edit")==false){
		$mode="Add";
		$grn_date=date('d-m-Y'); 
		$deleteid=delete_record('tbl_grn_trn',"user_id=".$_SESSION['user_id']." and grn_trn_status=3", $dbcon);	
	}
	else{
		$mode="Edit";
		$grn_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_grn where grn_id=$grn_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$grn_date=date('d-m-Y',strtotime($rel['grn_date'])); 
		$ref_date='';
		if($rel['ref_date']!="1970-01-01" && $rel['ref_date']!="0000-00-00" && $rel['ref_date']!=""){
			$ref_date=date('d-m-Y',strtotime($rel['ref_date']));
		}
	}
	$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$set_head=mysqli_fetch_assoc($dbcon->query($set));
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
<? //include_once('../include/equick_link.php');?>
<div class="row">
	<div class="col-lg-12">
		<!--breadcrumbs start -->
		<section class="panel">
			<header class="panel-heading">
				<h3><?=$mode.' '.$form?></h3>
			</header>	
			<div class="">
				<ul class="breadcrumb">
					<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="<?=ROOT.'grn_list'?>"><?=$form?> List</a></li>
				</ul>
			</div>
		</section>
		<!--breadcrumbs end -->
	</div>	
</div>
<!--state overview start-->
<div class="row">			
	
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading">
				New <?=$form?>
			</header>	
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="grn_add" action="javascript:;" method="post" name="grn_add" enctype="multipart/form-data">
					<div class="row"> 
						<div class="col-md-12" style="margin-top:10px;">
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-4 control-label">G.R.N. No.*</label>
									<div class="col-md-6 col-xs-11">
										<input type="text" id="grn_no" name="grn_no" class="form-control" title="GRN No." value="<?=$rel['grn_no']?>" placeholder="GRN No" readonly>
									</div>
								</div>
							</div>	
							<div class="col-md-6">  	
								<div class="form-group">  	
									<label class="col-md-3 control-label">G.R.N. Date*</label>
									<div class="col-md-5 col-xs-11">
										<input type="text" id="grn_date" name="grn_date" class="form-control default-date-picker" title="Date" value="<?=$grn_date?>" placeholder="Purchase Date">
									</div>
								</div>	
							</div>	
						</div>	
						<div class="col-md-12" style="margin-top:10px;">
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-4 control-label">Ref No.</label>
									<div class="col-md-6 col-xs-11">
										<input type="text" id="ref_no" name="ref_no" class="form-control" title="Ref No." value="<?=$rel['ref_no']?>" placeholder="Ref No" autocomplete="off">
									</div>
								</div>
							</div>	
							<div class="col-md-6">  	
								<div class="form-group">  	
									<label class="col-md-3 control-label">Ref Date</label>
									<div class="col-md-5 col-xs-11">
										<input type="text" id="ref_date" name="ref_date" class="form-control default-date-picker" title="Date" value="<?=$ref_date?>" placeholder="Ref Date" autocomplete="off">
									</div>
								</div>	
							</div>	
						</div>	
						<div class="col-md-12" style="margin-top:10px;">
						
						<div class="col-md-6">
							<label class="col-md-4 control-label" style="">Select Vendor*</label>
							<div class="col-md-8" style="padding-left: 9px;">
								<select class="select2" name="cust_id" id="cust_id" title="Select Vendor" onChange="load_po_ven_wise(this.value);" required>
									<?getvender($dbcon,$rel['cust_id']);?>	
								</select>
							</div>  
						</div>	
	
	</div>	
	
	<div class="col-md-12" style="margin-top:10px;"></div>	
	<div class="col-md-6">
		<label class="col-md-4 control-label" style="">Choose Purchase Order*</label>
		<div class="col-md-6">
			<select class="select2" name="purchaseorder_id" id="purchaseorder_id" onChange="load_purhcase_order_data(this.value);">
				<?=get_po_for_grn($dbcon,$rel['purchaseorder_id'],$rel['cust_id'],'Edit');?>
			</select>
		</div>
	</div>
	<div class="col-md-12" style="margin-top:10px;"></div>	
 
						<div class="col-md-12">
							
							<div class="form-group">
								<div class="col-md-12">
						<table cellspacing="10" style=" border-spacing:10px;" class="display table table-bordered table-striped">
							<tr id="field">
								<th width="30%" class="text-center">Product Detail</th>
								<th width="10%" class="text-center">Quantity</th>
								<th width="5%" class="text-center">Per</th>
								<th width="5%" class="text-center"></th>
							</tr>
							<tr id="field1"> 
								<td style="vertical-align:top;"> 
									<select class="select2" title="Select product" name="product_id" id="product_id" onChange="load_productdetail(this.value);">
										<!--<option value="">Choose Product</option>-->
										<?=get_po_for_grn_trn($dbcon,$rel['purchaseorder_id'],'','Add');?>
									</select>
									<br/><br/>
									<textarea id="product_des" name="product_des" class="form-control" ></textarea>
								</td>
								<td style="vertical-align:top;">
									<input type="number" min="0" id="product_qty" name="product_qty" class="form-control" autocomplete="off" />
								</td>
								<td style="vertical-align:top;">
									<select class="select2" name="unitid" id="unitid" title="Select Unit">
										<?=getunit($dbcon,0);?>
									</select>
									
									<input type="hidden" id="product_rate" name="product_rate" value="0"/>
									<input type="hidden" id="taxable_value" name="taxable_value" value="0"/>
									<input type="hidden" id="formulaid" name="formulaid" value="0"/>
									<input type="hidden" id="product_amount" name="product_amount" value="0"/>
		
								</td>
								<td width="5%">
									<input type="button" name="addrow" id="addrow" onClick="return add_field();"  class="btn btn-primary" value="Add"/>
								</td>
								<input type='hidden' name='edit_id' id='edit_id' value='' />
							</tr>
						</table>
								</div>
							</div>
							<div class="form-group">
							<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
								<thead>
								<tr>
									<th width="1%" class="text-center">Sr No.</th>
									<th width="30%" class="text-center">Product Detail</th>
									<th width="10%" class="text-center">Quantity</th>
									<th width="5%" class="text-center">Per</th>
									<th width="5%" class="text-center">Action</th>
								</tr>
								</thead>
								<tbody id="sale_productdata"></tbody>
							</table>
							</div>	
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-md-3 control-label">Remarks </label>
									<div class="col-md-9 col-xs-11">
										<textarea id="remark" name="remark" class="form-control" rows="3"><?=$rel['remark']?></textarea> 
									</div>
								</div> 
							</div>
							<!--<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-3 control-label">Upload Receipt</label>
									<div class="col-md-7">
										<input type="file" class="form-control" id="grn_file" name="grn_file[]" multiple="multiple" />
									</div>
									<div class="col-md-2">
									<?/* if($mode=='Edit'){
										$get_attch_qry="select * from tbl_grn_attch where grn_attch_status=0 and grn_id=".$rel['grn_id'];
										$attch_rs=$dbcon->query($get_attch_qry);
										while($attch_rel=mysqli_fetch_assoc($attch_rs)){
									?>
										<a href="<?=ROOT.RECEIPT_FILE_VWING.$attch_rel['grn_file']?>" class="btn btn-xs btn-primary" target="_blank" style="margin-bottom: 2px;"><i class="fa fa-eye"></i>  </a> 
										<button type="button" onClick="delete_attch(<?=$attch_rel['grn_attch_id']?>)" class="btn btn-xs btn-danger" target="_blank" style="margin-bottom: 2px;"><i class="fa fa-trash-o"></i></button>
										<br/>
									<?} }*/?>
									</div>
								</div> 
							</div>-->
							<div class="clearfix"></div>	
						</div>
						
						<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
						<input type='hidden' name='eid' id='eid' value='<?=$rel['grn_id']?>' />
						<div class="clearfix"></div>	
						<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
						<a href="<?=ROOT.'grn_list'?>" type="button" class="btn btn-danger">Cancel</a>
						<div class="col-md-4"></div>					
					</div>
					<!--Vendor row end-->				  
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
<!-- JS placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/grn.js?<?=time()?>"></script>

<script>
//$('#container').addClass('sidebar-closed');
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
$(".form_datetime").datetimepicker({
	format: 'dd-mm-yyyy hh:ii',
	autoclose: true,
	todayBtn: true,
	pickerPosition: "bottom-left"
});  
<?if($mode=='Edit'){?>
$('#cust_id').select2('readonly',true);
$('#purchaseorder_id').select2('readonly',true);
<?}?>
<?if($mode=='Add'){?>
load_grn_no();
<?}?>
</script> 
</body>
</html>