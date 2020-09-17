<?php 

	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$eid=$_SESSION['company_id'];
	
	$mode="Edit";
//	$eid=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select * from tbl_company where company_id=$eid";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	//echo $query;
	$vat_date=date('d-m-Y',strtotime($rel['vat_date']));
	$cst_date=date('d-m-Y',strtotime($rel['cst_date']));
	$ser_date=date('d-m-Y',strtotime($rel['ser_date']));
	if($rel['vat_date']=="1970-01-01")
	{
		$vat_date='';
	}
	if($rel['cst_date']=="1970-01-01")
	{
		$cst_date='';
	}
	if($rel['ser_date']=="1970-01-01")
	{
		$ser_date='';
	}		
	
	$countryid="101";
	$stateid="1";
	$cityid="1";
	//echo $eid;
	//echo $rel['comp_per_currency'];
	
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>

<style>
	.margin_top_row{
		margin-top:2%;
	}
</style>
</head>
<body>
<section id="container" >
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
					  <header class="panel-heading" style="padding-bottom: 20px;">
						  <h3>Manage Company
						 <!-- <a href="<?=ROOT.'company_pref'?>" >
						  <button class="btn btn-info btn-shadow pull-right"><i class="fa fa-cogs"></i> Company Preference</button></a>-->
						  </h3>
						</header>
						
						<div class="">
						  <ul class="breadcrumb no_padding">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="javascript:;">Setting</a></li>
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
				
					<header class="panel-heading breadcrumb text-center">
					   <h3>Manage Company</h3>
					</header>	
					<div class="panel-body ">
						<form class="form-horizontal" role="form" id="a_add" action="javascript:;" method="post" name="a_add">
							<div class="row">
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-6 control-label">Company Name *</label>
									  <div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" placeholder="Company Name" name="company_name" id="company_name"  value="<?=$rel['company_name']?>" required title="Enter Company Name" /> 
										</div>
									 </div>						 
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Alias</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" placeholder="" name="company_alias" id="company_alias"  value="<?=$rel['company_alias']?>" title="Enter Company Alias" />  
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Address 1 *</label>
										<div class="col-md-6 col-xs-11">
											<textarea class="form-control" name="comp_add1" id="comp_add1"><?=$rel['comp_add1']?></textarea>  
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Address 2 </label>
										<div class="col-md-6 col-xs-11">
											<textarea class="form-control" name="comp_add2" id="comp_add2"><?=$rel['comp_add2']?></textarea>    
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Address 3 </label>
										<div class="col-md-6 col-xs-11">
											<textarea class="form-control" name="comp_add3" id="comp_add3"><?=$rel['comp_add3']?></textarea>    
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Country *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" name="countryid" id="countryid" onChange="load_state(this.value,'stateid','')">
												<?=get_country($dbcon,$rel['countryid'])?>				
											</select>  
										</div>
									 </div>
								</div>
							
							</div>
							
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									 <div class="form-group">
										<label class="col-md-6 control-label">State *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" name="stateid" id="stateid" onChange="load_city(this.value,'cityid','')">
												<?=getstate($dbcon,$rel['stateid'])?>				
											</select>
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Select City *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" name="cityid" id="cityid">
												<option value="">Select City</option>
												<?=getcity($dbcon,$rel['stateid'],$rel['cityid'])?>
											</select>
										</div>
										
									</div>	
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Pincode</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_pincode" id="comp_pincode" class="form-control" value="<?=$rel['comp_pincode']?>" />  
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Email </label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_email" id="comp_email" class="form-control" value="<?=$rel['comp_email']?>" />    
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Website</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_web" id="comp_web" class="form-control" value="<?=$rel['comp_web']?>" />  
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Mobile </label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_mobile" id="comp_mobile" class="form-control" value="<?=$rel['comp_mobile']?>" />    
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Toll Free No</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_toll" id="comp_toll" class="form-control" value="<?=$rel['comp_toll']?>" />  
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">GST No </label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_gst" id="comp_gst" class="form-control" value="<?=$rel['comp_gst']?>" />    
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">CIN No</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_cin" id="comp_cin" class="form-control" value="<?=$rel['comp_cin']?>" />  
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">PAN No </label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="comp_pan" id="comp_pan" class="form-control" value="<?=$rel['comp_pan']?>" />    
										</div>
									 </div>
								</div>
							
							</div>
							
							<div class="col-md-12">
							
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-6 control-label">Reporting Year</label>
										<div class="col-md-6 col-xs-11">
											<input type="radio" name="comp_ryear" id="" value="calendar" <?php if($rel['comp_ryear']=='calendar'){ echo "checked"; } ?> /> Calender 
											<input type="radio" name="comp_ryear" id="" value="financial" <?php if($rel['comp_ryear']=='financial'){ echo "checked"; } ?> />Financial
										</div>
									 </div>
								</div>
								
							</div>
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Manage Currency</h3>
							</header>
							
							<div class="col-md-12">
								<div class="col-md-6">
									<h3 class="panel-heading breadcrumb text-center">Personal Currency</h3>
									
									<select class="select2" name="comp_per_currency" id="comp_per_currency">
										<?php echo get_currency($dbcon,$rel['comp_per_currency']); ?>
									</select>
								</div>
								
								<div class="col-md-6">
									<h3 class="panel-heading breadcrumb text-center">Organization Currency</h3>
										
									<div class="col-md-9">
										
										<select class="select2" name="comp_org_currency" id="comp_org_currency">
											<?php echo get_currency($dbcon,''); ?>
										</select>
									</div>
									<div class="col-md-3">
										<input type="button" name="" value="ADD" class="btn btn-success" onclick="add_currency()" /> 
									</div>
								</div>
							</div>
							
							<div class="col-md-12 margin_top_row" id="show_currency_table">
								
							</div>
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Manage Logo</h3>
							</header>
							
							<div class="col-md-12">
								
								<div class="form-group">
								  <label class="col-md-3 control-label">Head Logo</label>
								  <div class="col-md-6 col-xs-11">
									<input type="file" class="form-control" placeholder="Logo" name="h_logo" id="h_logo" accept="image/*" <? if($mode=="Add") { echo 'required';}?> title="logo" />
									
									</div>
									<div class="col-md-3 col-xs-11">
									<?
										if($mode=="Edit")
										{
											echo '<img src="'.ROOT.LOGO.$rel['h_logo'].'" style="width:120px"/>';
										}
									?>
									</div>
								</div>
								</div>
							
							<div class="col-md-12">
								<div class="form-group">
								  <label class="col-md-3 control-label">Footer Logo</label>
									<div class="col-md-6 col-xs-11">
										<input type="file" class="form-control" placeholder="Logo" name="f_logo" id="f_logo" accept="image/*" <? if($mode=="Add") { echo 'required';}?> title="Footer Logo" />
									</div>
									<div class="col-md-3 col-xs-11">
										<?  if($mode=="Edit")
											{
												echo '<img src="'.ROOT.LOGO.$rel['f_logo'].'" style="width:120px"/>';
											}
										?>
									</div>
								</div>
							</div>
							
							
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Manage Certificate</h3>
							</header>
							
							<div class="col-md-5">
								
								<div class="form-group">
								  <label class="col-md-6 control-label">Certi. Name</label>
									<div class="col-md-6 col-xs-11">
										<input type="text" value="" id="certi_name" name="certi_name" class="form-control" />
									</div>
									
								</div>
							</div>
							
							<div class="col-md-5">
								<div class="form-group">
								  <label class="col-md-6 control-label">Ceri.Image</label>
									<div class="col-md-6 col-xs-11">
										<input type="file" class="form-control" placeholder="Logo" name="f_logo1" id="f_logo1" accept="image/*" <? if($mode=="Add") { echo 'required';}?> title="Footer Logo" />
										
										<input type="hidden" name="img_mode" id="img_mode" value="add_product_image_temp" />
									</div>
									
								</div>
							</div>
							
							<div class="col-md-2">
								<input type="button" value="ADD" class="btn btn-success" onclick="add_certi()" />
							</div>
							
							<div class="col-md-12" id="certi_table">
								
								
							</div>
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Manage Bank Details</h3>
							</header>
														
							<div class="col-md-12">
								
								<table class="table table-bordered table-hover">
									<tr>
										<th>Bank Name</th>
										<th>Branch Name</th>
										<th>IFSC</th>
										<th>Account No</th>
										<th></th>
									</tr>
									
									<tr>
										<td><input type="text" class="form-control" name="c_b_name" id="c_b_name" /></td>
										<td><input type="text" class="form-control" name="c_b_branch" id="c_b_branch" /></td>
										<td><input type="text" class="form-control" name="c_b_ifsc" id="c_b_ifsc" /></td>
										<td><input type="text" class="form-control" name="c_b_acno" id="c_b_acno" /></td>
										<td><input type="button" class="btn btn-success" name="" id="add_bank_bt" value="ADD" onclick="add_bank();" />
										<input type="hidden" id="edit_id" value=""  />
										</td>
										
									</tr>
								</table>
								
								<table class="table table-bordered" id="table_bank_details">
									<tr>
										<th>#</th>
										<th>Bank Name</th>
										<th>Branch Name</th>
										<th>IFSC</th>
										<th>Account No</th>
										<th>Action</th>
									</tr>
								</table>
							</div>
							
						</div>
						<div class="row">
							<header class="panel-heading breadcrumb text-center">
							   <h3>Email Contents</h3>
							</header>
							<div class="col-md-12" style="padding-top:10px;">
								<label class="col-md-12 text-center"><strong>Inquiry Email Content</strong></label>
								<div class="col-md-12">
									<textarea class="form-control" id="inq_email_content" name="inq_email_content" ><?=$rel['inq_email_content']?></textarea>
								</div>
							</div>
							<div class="col-md-12" style="padding-top:10px;">
								<label class="col-md-12 text-center"><strong>Quotation Email Content</strong></label>
								<div class="col-md-12">
									<textarea class="form-control" id="quot_email_content" name="quot_email_content" ><?=$rel['quot_email_content']?></textarea>
								</div>
							</div>
							<div class="col-md-12" style="padding-top:10px;">
								<label class="col-md-12 text-center"><strong>PO Email Content</strong></label>
								<div class="col-md-12">
									<textarea class="form-control" id="po_email_content" name="po_email_content" ><?=$rel['po_email_content']?></textarea>
								</div>
							</div>
						</div>
						<!--<div class="row">
							<header class="panel-heading breadcrumb text-center">
							   <h3>Terms & Conditions</h3>
							</header>
							<div class="col-md-12">
								<label class="col-md-12 text-center"><strong>Inquiry Email Content</strong></label>
								<div class="col-md-12">
									<textarea class="form-control" id="inq_email_content" name="inq_email_content" ><?=$rel['inq_email_content']?></textarea>
								</div>
							</div>
						</div>-->
						
						<div class="row" style="margin-top:5%;">
							<div class="col-md-12">
								<div class="col-md-3"></div>
								<button type="submit" class="btn btn-success">Save</button> &nbsp;
								<div class="col-md-3"></div>	
							</div>
						</div>
						
							<input type='hidden' name='mode' id='mode' value='edit' />
							<input type='hidden' name='eid' id='eid' value='<?=$rel['company_id']?>' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
						  </form>
					</div>
				</section>
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
	<script src="<?=ROOT?>js/app/setting.js?<?=time()?>"></script>
	   <script src="<?=ROOT?>js/app/state_mst.js"></script>
   <script src="<?=ROOT?>js/app/city_mst.js"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
function trancate_tables(val)
{
	var r= confirm(" Are you want to Remove Data ?");
	if(r) 
	{
	Loading(true);	
	
	window.location=root_domain+'backup/'+val;
	}
}

CKEDITOR.replace( 'inq_email_content', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'quot_email_content', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'po_email_content', {
	enterMode: CKEDITOR.ENTER_BR
});
</script>
<?php
	if($mode=="Edit"){
		echo "<script>load_state(".$countryid.",'stateid',".$stateid.")</script>";
		echo "<script>load_city(".$stateid.",'cityid',".$cityid.")</script>";
	}
	else{
		echo "<script>load_state(".$countryid.",'stateid',".$stateid.")</script>";
		echo "<script>load_city(".$stateid.",'cityid',".$cityid.")</script>";
	}
	?>

  </body>
</html>