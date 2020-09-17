<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	include_once("../include/function_database_query.php");
	$form="Purchase";
	if(strpos($_SERVER[REQUEST_URI], "purchase_edit")==true){
		$mode="Edit";
		$purchase_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_purchase where purchase_id=$purchase_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$purchase_date=date('d-m-Y',strtotime($rel['purchase_date']));
		$ref_date='';
		if($rel['ref_date']!="1970-01-01" && $rel['ref_date']!="0000-00-00") {
			$ref_date=date('d-m-Y',strtotime($rel['ref_date']));
		}
	}
	else{
		$mode="Add";
		$purchase_date=date('d-m-Y');
		$ref_date='';
		$deleteid=delete_record('tbl_purchase_trn',"user_id=".$_SESSION['user_id']." and purchase_trn_status=3", $dbcon);	
	}
$set_query="select * from tbl_company where company_id=".$_SESSION['company_id'];
$set_head=mysqli_fetch_assoc($dbcon->query($set_query));
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
							<h3><?=$mode.' '.$form?></h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'purchase_list'?>"><?=$form?> List</a></li>
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
				<form class="form-horizontal" role="form" id="purchase_add" action="javascript:;" method="post" name="purchase_add">
						<div class="row">
					 		
				<div class="col-md-12" >
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label">Purchase No </label>
							<div class="col-md-6 col-xs-11">
								<input id="purchase_no" name="purchase_no" type="text" class="form-control" title="Date" value="<?=$rel['purchase_no']?>" placeholder="Purchase Order No" readonly >
							</div>
						</div>	
					</div>	
					<div class="col-md-6">
					 <div class="form-group">  	
					  <label class="col-md-3 control-label" >Purchase date </label>
						<div class="col-md-5 col-xs-11">
							<input id="purchase_date" name="purchase_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$purchase_date?>" placeholder="Purchase Order Date" autocomplete="off">
						</div>
					 </div>	
					</div>
				</div>		
				<div class="col-md-12" >
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label">Ref No </label>
							<div class="col-md-6 col-xs-11">
								<input id="ref_no" name="ref_no" type="text" class="form-control" title="Ref No" value="<?=$rel['ref_no']?>" placeholder="Ref No">
							</div>
						</div>	
					</div>	
					<div class="col-md-6">
						<div class="form-group">  	
							<label class="col-md-3 control-label" >Ref date </label>
							<div class="col-md-5 col-xs-11">
								<input id="ref_date" name="ref_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$ref_date?>" placeholder="Ref Date" autocomplete="off">
							</div>
						</div>	
					</div>
				</div>	
				
				<div class="col-md-12" style="margin-top:10px;">
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-4 control-label">Select Vendor*</label>
						<div class="col-md-6 col-xs-11">
							<select class="select2" name="cust_id" id="cust_id" required title="Select Vender" onChange="load_pro();load_purchase_order(this.value);" >
								<?=getcust($dbcon,$rel['cust_id']);?>	
							</select>
						</div>	
						<?/*if($mode=="Add"){ ?>
							<input type="button"  name="addcust" id="addcust" data-toggle="modal" data-target="#bs-example-modal-lg" class="btn btn-primary" value="+"/>
						<? }*/ ?>
						<!--<button type="button" name="viewcust" id="viewcust" class="btn btn-primary" onclick="view_cust_info()" title="View Customer Detail"><i class="fa fa-eye"></i></button>-->
					 </div>	
					</div>
					<div class="col-md-6">
						<div class="form-group" id="purchase_order_div" style="">
							<label class="col-md-4 control-label">Choose Purchase Order</label>
							<div class="col-md-6 col-xs-11">
								<select class="select2" name="purchaseorder_id" id="purchaseorder_id" onChange="load_purhcase_order_data(this.value)" >
									<option value="">Choose Purchase Order</option>
									<?=get_purchase_order($dbcon,$rel['cust_id'],$rel['purchaseorder_id'],"Edit");?>
								</select>
							</div>
						</div>	
					</div>
				</div>	
						 	
				<div class="col-md-12" style="margin-top:10px;">
							 				 	
				<div class="form-group">
					<div class="col-md-12 col-xs-11">
						<table cellspacing="10" style=" border-spacing:10px;" class="display table table-bordered table-striped" id="product_list">
						<tr id="field" >
							<th width="25%" class="text-center">Product Detail</th> 
							<th width="7%" class="text-center">Quantity</th>
							<th width="7%" class="text-center">Rate</th>
							<th width="7%" class="text-center">Per</th>
							<th width="6%">Discount</th>
							<th width="9%">Taxable Value</th>
							<th width="15%">Tax</th>
							<th width="9%" class="text-center">Amount</th>
							<th width="5%" class="text-center"></th>
						</tr>
					<input type="hidden" value="1" name="fieldcnt" id="fieldcnt"/>
					<tr id="field1"> 
						<td style="vertical-align:top;">
							<select class="select2" title="Select product" name="product_id" id="product_id" onChange="load_productdetail(this.value);">
								<?=getproduct($dbcon,0,'')?>
							</select>
							<br><br>
							<textarea id="product_des" name="product_des" class="form-control"></textarea>
						</td>	 
						<td style="vertical-align:top;">
							<input type="number" min="0" id="product_qty" name="product_qty"  class="form-control" onkeyup="get_amount();" autocomplete="off"/>
						</td> 
						<td style="vertical-align:top;">
							<input type="number" title="Enter Rate" min="0" id="product_rate" name="product_rate" onkeyup="get_amount();" class="form-control"/>
						</td>
						<td style="vertical-align:top;">
							<select class="select2"  name="unitid" id="unitid"  title="Select Unit">
								<?=getunit($dbcon,0);?>
							</select>
						</td>
						<td style="vertical-align:top;">
							<input type="number" title="Enter Discount" min="0" id="product_discount" name="product_discount" onkeyup="get_discount('amt');" class="form-control" placeholder="in Rs."/><br/>
							<input type="number" title="Enter Discount Percentage" min="0" id="discount_per" name="discount_per" onkeyup="get_discount('per');" class="form-control" placeholder="in %" max="100"/>
						</td>
						<td style="vertical-align:top;">
							<input type="number" title="Taxable Value" min="0" id="taxable_value" name="taxable_value" class="form-control" readonly />
						</td>
						<td style="vertical-align:top;">
							<select class="form-control" name="formulaid" id="formulaid" onChange="get_amount();">
								<?
									echo getformula($dbcon,'');
								?>
							</select>
						</td>
						<td style="vertical-align:top;"> 
							<input type="number"  min="0" id="product_amount" readonly="readonly" name="product_amount" class="form-control" onmouseover="this.title=this.value"/>
						</td>
						<td width="5%">
							<input type="button"  name="addrow" id="addrow" onClick="return add_field();" class="btn btn-primary" value="Add"/>
						</td>
							<input type='hidden' name='edit_id' id='edit_id' value='' />
					
						</tr>
					</table>
						</div>
                             </div>
	<div id="sale_productdata"></div>	
	
<div class="col-md-6">		
	<div class="form-group">
		<label class="col-md-3 control-label">Remarks </label>
		<div class="col-md-9 col-xs-11">
			<textarea id="remark" name="remark" class="form-control" rows="3"><?=$rel['remark']?></textarea> 
		</div>
	</div> 
</div>
					 <div class="col-md-6">
						<div class="form-group">
							<label class="col-md-6 control-label">Total *</label>
							<div class="col-md-4 col-xs-11">
								<input type="text" id="total" name="total" readonly="readonly" class="form-control" title="dispatch_no" value="0" placeholder="total"> 
							</div>
						</div>	
						<div class="form-group">
							<label class="col-md-6 control-label">Round Off</label>
							<div class="col-md-4 col-xs-11">
								<input id="round_off" name="round_off" type="number" class="form-control" title="Round Off" value="<? if($mode=="Add"){echo 0;}else if($mode=="Edit"){echo $rel['round_off'];}?>" onKeyUp="get_amount();" placeholder="Round Off">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-6 control-label">Grand Total *</label>
							<div class="col-md-4 col-xs-11">
								<input id="g_total" name="g_total" type="text" class="form-control" title="total" value="0" placeholder="total" readonly="readonly">
							</div>
						</div>
							
							</div>	
					</div>
					
			<div class="col-md-12 text-center">
				<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
				<a href="<?=ROOT.'purchase_list'?>" type="button" class="btn btn-danger">Cancel</a>
			</div>					
	</div>
			<!--Vendor row end-->	
			<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
			<input type='hidden' name='eid' id='eid' value='<?=$rel['purchase_id']?>' />				  
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
	
	<?php include_once('../include/add_cust.php');?>
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
	<!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/purchase.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
	
<script>
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
</script>
<? 
if($mode=="Add") {
	echo "<script>load_purchase_no();</script>";
}
else{
	echo "<script>$('#cust_id').select2('readonly',true);$('#purchaseorder_id').select2('readonly',true); </script>";
}
?>
<script>
$(function(){
	setTimeout(function(){  $('#sidebar > ul').hide(); }, 1000);
});
</script>
</body>
</html>