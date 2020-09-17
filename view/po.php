<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Purchase Order";
	$countryid='101';
	$stateid='1';
	$cityid='1';
	echo $_SESSION['user_id'];
	if(strpos($_SERVER[REQUEST_URI], "poedit")==true){
		$mode="Edit";
		$purchaseorder_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_purchaseorder where purchaseorder_id=$purchaseorder_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$delivery_date=date('d-m-Y',strtotime($rel['delivery_date']));
		$po_terms_cond=$rel['po_terms_cond'];
		$purchaseorder_no= $rel['purchaseorder_no'];
		$mode_of_dispatch=$rel['mode_of_dispatch'];
		$payment_terms=$rel['payment_terms'];
		$cust_id=$rel['cust_id'];
		$start_id=$rel['start_id'];
		$purchaseorderid=$rel['purchaseorder_id'];
	}
	else if (strpos($_SERVER[REQUEST_URI], "po_revise")==true){
		$mode="RewiseAdd";
		$prev_purchaseorder_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_purchaseorder where purchaseorder_id=$prev_purchaseorder_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$delivery_date=date('d-m-Y',strtotime($rel['delivery_date']));
		$po_terms_cond=$rel['po_terms_cond'];
		
		$queryre="select purchaseorder_no,count(purchaseorder_id) as reno from  tbl_purchaseorder where status!=2 and start_id=".$rel['start_id']." ";
		$prelre=mysqli_fetch_assoc($dbcon->query($queryre)); 
		$purchaseorder_no= $prelre['purchaseorder_no'].'/R-'.($prelre['reno']);
		$mode_of_dispatch=$rel['mode_of_dispatch'];
		$payment_terms=$rel['payment_terms'];
		$cust_id=$rel['cust_id'];
		$start_id=$rel['start_id'];
		$main_id=$rel['purchaseorder_id'];
		$date=date('d-m-Y');
		
		//Delete Temp Data
		$deltrmid=$dbcon->query('DELETE FROM tbl_purchaseordertrn where purchaseordertrn_status=3 and user_id='.$_SESSION['user_id']);
		
		//Copy temp Data
		$copy_qry="Insert into tbl_purchaseordertrn (product_id,description,product_qty,unit_id,product_rate,product_discount,discount_per,product_amount,formulaid,tax_name1,tax_amount1,tax_name2,tax_amount2,tax_name3,tax_amount3,product_total,purchaseordertrn_status,user_id)
		select product_id,description,product_qty,unit_id,product_rate,product_discount,discount_per,product_amount,formulaid,tax_name1,tax_amount1,tax_name2,tax_amount2,tax_name3,tax_amount3,product_total,3,".$_SESSION['user_id']." from tbl_purchaseordertrn where purchaseordertrn_status=0 and purchaseorder_id=".$main_id;
		$copy_qry_rs=$dbcon->query($copy_qry);
	}
	else{
		$mode="Add";
		$date=date('d-m-Y');
		$delivery_date=date('d-m-Y');
		$set_query="select * from tbl_company where company_id=".$_SESSION['company_id'];
		$set_head=mysqli_fetch_assoc($dbcon->query($set_query));
		$po_terms_cond=$set_head['po_terms_content'];
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
							<h3><?=$mode.' '.$form?></h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'po_list'?>"><?=$form?> List</a></li>
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
				<form class="form-horizontal" role="form" id="purchaseorder_add" action="javascript:;" method="post" name="purchaseorder_add">
						<div class="row">
					 		
				<div class="col-md-12" >
						<div class="col-md-6">
						 <div class="form-group">
						  <label class="col-md-4 control-label">Purchase Order No </label>
						  <div class="col-md-6 col-xs-11">
							<input id="purchaseorder_no" name="purchaseorder_no" type="text" class="form-control" title="Date" value="<?=$purchaseorder_no?>" placeholder="Purchase Order No" readonly >
							</div>
						 </div>	
						</div>	
						<div class="col-md-6">
						 <div class="form-group">  	
						  <label class="col-md-3 control-label" >Purchase Order date </label>
							<div class="col-md-5 col-xs-11">
								<input id="purchaseorder_date" name="purchaseorder_date" type="text" class="form-control default-date-picker" title="Date" value="<? if($mode=='Add' || $mode=='RewiseAdd'){ echo $date;}else if($mode=='Edit'){ echo date('d-m-Y',strtotime($rel['purchaseorder_date']));}?>" placeholder="Purchase Order Date" autocomplete="off">
							</div>
						 </div>	
						</div>
				</div>
				<div class="col-md-12">	
					<div class="col-md-6">
						<div class="form-group">  	
							<label class="col-md-4 control-label">Quot. Ref No.</label>
							<div class="col-md-6 col-xs-11">
								<input type="text" id="po_ref_no" name="po_ref_no" class="form-control" title="Ref No." value="<?=$rel['po_ref_no']?>" placeholder="Quot. Ref No.">
							</div>
						</div>	
					</div>
					<div class="col-md-6">
						<div class="form-group">  	
							<label class="col-md-3 control-label">Ref Date</label>
							<div class="col-md-5 col-xs-11">
								<input id="po_ref_date" name="po_ref_date" type="text" class="form-control default-date-picker" title="Date" value="<? if($mode=='Add' || $mode=='RewiseAdd'){ echo $date;}else if($mode=='Edit'){ echo date('d-m-Y',strtotime($rel['po_ref_date']));}?>" placeholder="Ref Date" autocomplete="off">
							</div>
						</div>	
					</div>
				</div>
				<!--<div class="col-md-12">	
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-4 control-label" >Payment Terms</label>
						<div class="col-md-6 col-xs-11">
							<input type="text" id="payment_terms" name="payment_terms" class="form-control" title="Payment Terms" value="<?=$rel['payment_terms']?>" placeholder="Payment Terms">
						</div>
					 </div>	
					</div>
				</div>-->	
				
				<div class="col-md-12" style="margin-top:10px;">
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-4 control-label">Select Vendor*</label>
						<div class="col-md-6">
							<select class="select2" name="cust_id" id="cust_id" required title="Select Vender" onChange="load_pro();" >
								<?=getvender($dbcon,$cust_id)?>
							</select>
						</div>	
						<?if($mode=="Add"){ ?>
							<input type="button"  name="addcust" id="addcust" data-toggle="modal" data-target="#bs-example-modal-lg" class="btn btn-primary" value="+"/>
						<? } ?>
						<!--<button type="button" name="viewcust" id="viewcust" class="btn btn-primary" onclick="view_cust_info()" title="View Customer Detail"><i class="fa fa-eye"></i></button>-->
					 </div>	
					</div>
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-3 control-label">Vendor Address</label>
						<div class="col-md-5">
							<textarea class="form-control" id="po_ven_address" name="po_ven_address" placeholder="Vendor Address"><?=$rel['po_ven_address']?></textarea>
						</div>	
						<button type="button" class="btn btn-primary" onclick="view_cust_address()">View Address</button>
					 </div>	
					</div>
					
				</div>	
				<div class="col-md-12" style="margin-top:10px;">
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-4 control-label">Select PRF</label>
						<div class="col-md-6">
							<select class="select2" name="prf_entry_id" id="prf_entry_id" onChange="load_prf_det(this.value);" >
								<?=load_po_prf_no($dbcon,$rel['prf_entry_id'],$mode,$_SESSION['user_id'])?>
							</select>
						</div>	
					 </div>	
					</div>
				</div>	
						 	
				<div class="col-md-12" style="margin-top:10px;">
							 				 	
				<div class="form-group">
					<div class="col-md-12">
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped" id="product_list">
						<tr id="field">
							<th width="25%" class="text-center">Product Detail
								<!--<input type="button" name="addproduct" id="addproduct" data-toggle="modal" data-target="#bs-example-modal-addproduct" style="float:right;" class="btn btn-primary" value="+"/>-->
							</th>
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
								<?=getproduct($dbcon,"");?>
							</select>
							<br><br>
							<textarea id="product_des" name="product_des" class="form-control"></textarea>
						</td>	 
						<td style="vertical-align:top;">
							<input type="number"  title="Enter Qty" min="0" id="product_qty" name="product_qty"  class="form-control" onkeyup="get_amount();"/>
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
									echo getformula($dbcon,$rel['formulaid']);
								?>
							</select>
						</td>
						
						<td style="vertical-align:top;"> 
							<input type="number"  min="0" id="product_amount" readonly="readonly" name="product_amount" class="form-control" onmouseover="this.title=this.value"/>
						</td>
						<td width="5%">
							<input type="button"  name="addrow" id="addrow" onClick="return add_field();"  class="btn btn-primary" value="Add"/>
						</td>
							<input type='hidden' name='edit_id' id='edit_id' value='' />
					
						</tr>
					</table>
						</div>
                             </div>
	<div id="sale_productdata"></div>	
 <div class="col-md-9">
		<!--tab start-->  
		<div class="card">
			<ul class="nav nav-tabs" id="my_tab_id" role="tablist"> 
				<li role="presentation" id="tab1"><a href="#terms-section" aria-controls="terms-section" role="tab" data-toggle="tab">Terms And Condition</a></li>
				<li role="presentation" id="tab2" class="active"><a href="#remark-section" aria-controls="remark-section" role="tab" data-toggle="tab">Remark</a></li>
				<li role="presentation" id="tab3"><a href="#attach-section" aria-controls="attach-section" role="tab" data-toggle="tab">Attachment</a></li>
			</ul> 
			<!-- Tab panes -->
			<div class="tab-content"> 
				<!-- Terms Tab Start -->
				<div role="tabpanel" class="tab-pane" id="terms-section">
					<div class="col-md-12">
						<div class="form-group" style="margin-top:20px;" id="po_terms_cond_div">
							<!--<label class="col-md-12 text-left" style="font-weight:bold;">Terms And Condition</label>
							<div class="col-md-12">
								<textarea class="form-control" name="po_terms_cond" id="po_terms_cond"><?=$po_terms_cond?></textarea>
							</div>-->
						</div>
					</div> 
				</div>
				<!-- Terms Tab End -->
				<!-- Remaks Tab Start -->
				<div role="tabpanel" class="tab-pane active" id="remark-section">
					<div class="form-group" style="margin-top: 20px;">
						<label class="col-md-3 control-label">Remarks </label>
						<div class="col-md-9 col-xs-11">
							<textarea id="remark" name="remark" class="form-control" rows="3"><?=$rel['remark']?></textarea> 
						</div>
					</div> 
				</div>   
				<div role="tabpanel" class="tab-pane" id="attach-section">
					<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Attachment</label>
						<div class="col-md-5">
							<input type="file" id="po_attach" name="po_attach" class="form-control" title="Upload Attachment">
						</div>
						<div class="col-md-2">
							<?if($rel['po_attach']){?>
								<a href="<?=ROOT.SO_ATTACH_VWING.$rel['po_attach']?>" class="btn btn-primary" target="_blank"><i class="fa fa-eye"></i> View</a>
							<?}?>
						</div>
					</div> 
				</div>
				</div>           
		</div>
	</div>      		
	<!--tabs end-->	
		
</div>
					 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-5 control-label">Total *</label>
								<div class="col-md-7">
									<input id="total" name="total" type="text" readonly="readonly" class="form-control" title="dispatch_no" value="0" placeholder="total"> 
								</div>
							</div>	
		
							<div class="form-group">
								<label class="col-md-5 control-label">Round Off</label>
								<div class="col-md-7">
									<input id="round_off" name="round_off" type="number" class="form-control" title="Round Off" value="<? if($mode=="Add"){echo 0;}else if($mode=="Edit" || $mode=="RewiseAdd"){echo $rel['round_off'];}?>" onKeyUp="get_amount();" placeholder="Round Off">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-5 control-label">Grand Total *</label>
								<div class="col-md-7">
								
								<input id="g_total" name="g_total" type="text"  class="form-control" title="total" value="<? if($mode=="Add"){echo '0';}else if($mode=='Edit' || $mode=="RewiseAdd"){ echo $rel['g_total'];}?>" placeholder="total"readonly="readonly">
							
								</div>
							</div>	
				
						</div>	
					</div>
			<div class="col-md-12 text-center">	
				<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
				<a href="<?=ROOT.'po_list'?>" type="button" class="btn btn-danger">Cancel</a>
			</div>
	</div>
			<!--Vendor row end-->	
			<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
			<input type='hidden' name='eid' id='eid' value='<?=$purchaseorderid?>' />				  
			<input type='hidden' name='start_id' id='start_id' value='<?=$start_id?>' />				  
			<input type='hidden' name='main_id' id='main_id' value='<?=$main_id?>' />				  
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
	<?php include_once('../include/preview_cust_address.php');?>
	<?php include_once('../include/view_ven_rate_rmrk.php');?>
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
	<!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/po.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});  
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
}); 
/*CKEDITOR.replace( 'po_terms_cond', {
	enterMode: CKEDITOR.ENTER_BR
});*/
$(".form_datetime").datetimepicker({
    format: 'dd-mm-yyyy hh:ii',
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left"
}); 

load_typeswise_terms(0,<?=$purchaseorderid?>);
</script>
<? 
if($mode=="Add") {
	echo "<script>load_pono();</script>";
}
else{
	echo "<script>$('#cust_id').select2('readonly',true);$('#prf_entry_id').select2('readonly',true); </script>";
}
?>

<script>
$(function(){
	setTimeout(function(){  $('#sidebar > ul').hide(); }, 1000);
	$('#party_type_cust_div').hide();
});
</script>
</body>
</html>