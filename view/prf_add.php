<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="PRF Entry";
	if(strpos($_SERVER[REQUEST_URI], "prf_edit")==true){
		$mode="Edit";
		$prf_entry_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_prf_entry where prf_entry_id=$prf_entry_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$prf_entry_date=date('d-m-Y',strtotime($rel['prf_entry_date']));
		$prf_approve_status = $rel['prf_approve_status'];
	}
	else{
		$mode="Add";
		$prf_entry_date=date('d-m-Y');
		$prf_approve_status = 0;
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
							<h3><?=$mode.' '.$form?></h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'prf_list'?>"><?=$form?> List</a></li>
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
				<form class="form-horizontal" role="form" id="prf_entry_add" action="javascript:;" method="post" name="prf_entry_add">
			<div class="row">
					 		
				<div class="col-md-12" >
					<div class="col-md-6" style="display:none;">
						<div class="form-group">
							<label class="col-md-4 control-label">PRF Entry No*</label>
							<div class="col-md-6 col-xs-11">
								<input id="prf_entry_no" name="prf_entry_no" type="text" class="form-control" title="Date" value="<?=$rel['prf_entry_no']?>" placeholder="PRF Entry No" readonly >
							</div>
						</div>	
					</div>	
					<div class="col-md-6">
					 <div class="form-group">  	
					  <label class="col-md-3 control-label">PRF Entry Date*</label>
						<div class="col-md-5 col-xs-11">
							<input id="prf_entry_date" name="prf_entry_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$prf_entry_date?>" placeholder="PRF Entry Date" autocomplete="off">
						</div>
					 </div>	
					</div>
				</div>			
			<!--
				<div class="col-md-12">
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label">Choose Product</label>
							<div class="col-md-6 col-xs-11">
								<select class="select2" title="Select product" name="product_id" id="product_id" onchange="load_productdetail(this.value);show_ven_hist(this.value);">
									<?//=getproduct($dbcon,$rel['product_id'],'')?>
								</select>
							</div>
						</div>	
					</div>	
					<div class="col-md-6">
					 <div class="form-group">  	
						<label class="col-md-3 control-label">Product Description</label>
						<div class="col-md-6">
							<textarea id="product_des" name="product_des" class="form-control" style="resize:both;"><?=$rel['product_des']?></textarea>
						</div>
					 </div>	
					</div>
				</div>		
		
				<div class="clearfix"></div>		
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-12"><strong>Vendor History</strong></label>
						<div class="col-md-12" id="pro_ven_hist"></div>
					</div>
				</div>
			-->	
				<div class="clearfix"></div>		
				<div class="col-md-12">
					<div class="form-group">
						<!--<label class="col-md-12"><strong>New Vendor Details</strong></label>-->
						<div class="col-md-12">
							<table class="display table table-bordered table-striped">
							  <thead>
								<tr>
									<th width="40%" class="text-center">Product Details
									<button type="button" class="btn btn-primary" title="View Vendor History" onclick="chk_open_ven_rate_hist()"><i class="fa fa-eye"></i></button>
									</th>
									<th width="10%" class="text-center">Qty</th>
									<th width="40%" class="text-center">Vendor Details</th>
									<th width="10%" class="text-center">Action</th>
								</tr>
							  </thead>
							  <tbody>
								<tr>
									<td>
										<select class="select2" title="Select product" name="product_id" id="product_id" onchange="load_productdetail(this.value);">
											<?=getproduct($dbcon,'','')?>
										</select>
										<br/><br/>
										<textarea id="product_des" name="product_des" class="form-control" placeholder="Product Description" style="resize:both;"><?=$rel['product_des']?></textarea>
									</td>
									<td>
									<input type="text" class="form-control" id="prf_qty" name="prf_qty" value="" placeholder="PRF Qty" /><br/>
									</td>
									<td>
										<input type="text" class="form-control" id="new_ven_name" name="new_ven_name" value="" placeholder="Vendor Name" /><br/>
										<textarea class="form-control" id="new_ven_rmrk" name="new_ven_rmrk" placeholder="Vendor Remarks" style="resize:both;"></textarea>
									</td>
									<td style="vertical-align:middle;">
										<input type="hidden" id="edit_rmrk_id" name="edit_rmrk_id" value="">
										<button type="button" class="btn btn-primary" id="add_rmrk_btn" onclick="add_ven_rmrk_field()">Add</button>
									</td>
								</tr>
							  </tbody>
							</table>
						</div>
						<div class="col-md-12" id="new_ven_rmrk_div"></div>
					</div>
				</div>
				<div class="clearfix"></div>		
				
				<div class="col-md-12">		
				<div class="col-md-6">		
					<div class="form-group">
						<label class="col-md-3 control-label">Remarks*</label>
						<div class="col-md-9 col-xs-11">
							<textarea id="remark" name="remark" class="form-control" rows="3" style="resize:both;"><?=$rel['remark']?></textarea> 
						</div>
					</div> 
				</div>
				</div>
	
			<div class="col-md-12 text-center">
				<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
				<a href="<?=ROOT.'prf_list'?>" type="button" class="btn btn-danger">Cancel</a>
			</div>					
		</div>
			<!--Vendor row end-->	
			<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
			<input type='hidden' name='eid' id='eid' value='<?=$rel['prf_entry_id']?>' />	
			<input type='text' name='prf_approve_status' id='prf_approve_status' value='<?=$prf_approve_status ?>' />			
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
	
	<?php include_once('../include/view_ven_rate_rmrk.php');?>
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
	<!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/prf.js?<?=time()?>"></script>
	
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
<?/*if($mode=="Edit"){?>
	show_ven_hist(<?=$rel['product_id']?>);
<?}*/?>	
</script>
<? 
if($mode=="Add") {
	//echo "<script>load_prf_entry_no();</script>";
}
?>
</body>
</html>