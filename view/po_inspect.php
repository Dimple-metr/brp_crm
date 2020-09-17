<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Purchase Order";
	$countryid='101';
	$stateid='1';
	$cityid='1';
	if(strpos($_SERVER[REQUEST_URI], "po_inspect")==true){
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
								<input id="purchaseorder_date" name="purchaseorder_date" type="text" class="form-control" title="Date" value="<? if($mode=='Add' || $mode=='RewiseAdd'){ echo $date;}else if($mode=='Edit'){ echo date('d-m-Y',strtotime($rel['purchaseorder_date']));}?>" placeholder="Purchase Order Date" autocomplete="off" readonly>
							</div>
						 </div>	
						</div>
				</div>
				<div class="col-md-12">	
					<div class="col-md-6">
						<div class="form-group">  	
							<label class="col-md-4 control-label">Ref No.</label>
							<div class="col-md-6 col-xs-11">
								<input type="text" id="po_ref_no" name="po_ref_no" class="form-control" title="Ref No." value="<?=$rel['po_ref_no']?>" placeholder="Ref No." readonly>
							</div>
						</div>	
					</div>
					<div class="col-md-6">
						<div class="form-group">  	
							<label class="col-md-3 control-label">Ref Date</label>
							<div class="col-md-5 col-xs-11">
								<input id="po_ref_date" name="po_ref_date" type="text" class="form-control" title="Date" value="<? if($mode=='Add' || $mode=='RewiseAdd'){ echo $date;}else if($mode=='Edit'){ echo date('d-m-Y',strtotime($rel['po_ref_date']));}?>" placeholder="Ref Date" autocomplete="off" readonly>
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
								<?=getcust($dbcon,$cust_id)?>
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
							<textarea class="form-control" id="po_ven_address" name="po_ven_address" placeholder="Vendor Address" readonly><?=$rel['po_ven_address']?></textarea>
						</div>	
					 </div>	
					</div>
					
				</div>	
						 	
				<div class="col-md-12" style="margin-top:10px;">
								
<div class="form-group" id="show_inspect_data_div"></div>	

<div class="clearfix"></div>
 <div class="col-md-9">
		<!--tab start-->  
		<div class="card">
			<ul class="nav nav-tabs" id="my_tab_id" role="tablist"> 
				<li role="presentation" id="tab1"><a href="#terms-section" aria-controls="terms-section" role="tab" data-toggle="tab">Terms And Condition</a></li>
				<li role="presentation" id="tab2" class="active"><a href="#remark-section" aria-controls="remark-section" role="tab" data-toggle="tab">Remark</a></li>
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
							<textarea id="remark" name="remark" class="form-control" rows="3" readonly><?=$rel['remark']?></textarea> 
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
									<input id="total" name="total" type="text" readonly="readonly" class="form-control" title="dispatch_no" value="0" placeholder="total" > 
								</div>
							</div>	
		
							<div class="form-group">
								<label class="col-md-5 control-label">Round Off</label>
								<div class="col-md-7">
									<input id="round_off" name="round_off" type="number" class="form-control" title="Round Off" value="<? if($mode=="Add"){echo 0;}else if($mode=="Edit" || $mode=="RewiseAdd"){echo $rel['round_off'];}?>" onKeyUp="get_amount();" placeholder="Round Off" readonly>
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
				<!--<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>-->
				<a href="<?=ROOT.'po_list'?>" type="button" class="btn btn-danger">Back to List</a>
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
	<?php //include_once('../include/preview_cust_address.php');?>
<div class="modal colored-header info " id="preview_approval_hist_modal" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">Close &times;</button>
				<h3>Approval : <span id="apprv_ref_no"></span></h3>
			</div>
			<div class="modal-body form">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<table class="display table table-bordered table-striped">
								<tr>
									<th width="30%">Status</th>
									<th width="65%">Remark</th>
									<th width="5%">Action</th>
								</tr>
								<tr>
									<td>
										<select class="select2" id="approve_status" name="approve_status">
											<option value="0">Pending</option>
											<option value="1">Approve</option>
											<option value="2">Reject</option>
										</select>
									</td>
									<td>
										<textarea class="form-control" id="approve_remark" name="approve_remark" placeholder="Remark"></textarea>
									</td>
									<td>
										<input type="button" class="btn btn-primary" id="apprv_btn" onclick="add_apprv_hist()" value="Add">
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="col-md-12">
						<div class="form-group">
						<div class="adv-table">
							<table class="display table table-bordered table-striped" id="sales-order-history-datatable">
								<thead>
									<tr>
										<th>Sr. No.</th>
										<th>Status</th>
										<th>Remark</th>
										<th>Date</th>	
										<th>User</th>				  
									</tr>
								</thead>
								<tbody>
								</tbody>				 
							</table>
						</div>
						</div>
					</div>
					
					
				</div>
			</div>	
		</div>
		<input type="hidden" id="ref_purchaseordertrn_id" name="ref_purchaseordertrn_id" value="">
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->	
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

echo "<script>$('#cust_id').select2('readonly',true); </script>";
	
?>

<script>
$(function(){
	setTimeout(function(){  $('#sidebar > ul').hide(); }, 1000);
	show_inspect_data();
});
</script>
</body>
</html>