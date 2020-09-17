<?php 

	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	if(strpos($_SERVER[REQUEST_URI], "setting")==false)
	{
		$mode="Add";
	}
	else
	{
		$mode="Edit";
		$eid=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_company where company_id=$eid";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		
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
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
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
						  <h3><?=$mode?> Billing Content
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
				
				  <header class="panel-heading">
					  Edit Billing Content
					</header>	
					<div class="panel-body ">
						<form class="form-horizontal" role="form" id="a_add" action="javascript:;" method="post" name="a_add">
							<div class="row">
							<div class="col-md-10">
							<div class="form-group">
							  <label class="col-md-3 control-label">Company Name *</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Company Name" name="company_name" id="company_name"  value="<?=$rel['company_name']?>" required title="Enter Company Name" /> 
								</div>
                             </div>						 
							 <div class="form-group">
								<label class="col-md-3 control-label">Address *</label>
								<div class="col-md-9 col-xs-11">
									<textarea id="address" name="address" class="form-control" rows="10"><?=stripslashes($rel['address'])?></textarea> 
								</div>
                             </div>
							 <div class="form-group">
								<label class="col-md-3 control-label">Logo Content</label>
								<div class="col-md-9 col-xs-11">
									<textarea id="logo_content" name="logo_content" class="form-control" rows="10"><?=stripslashes($rel['logo_content'])?></textarea> 
								</div>
                             </div>
							 <div class="form-group">
								<label class="col-md-3 control-label">State</label>
								<div class="col-md-6 col-xs-11">
									<select class="select2" name="stateid" id="stateid">
										<?=getstate($dbcon,$rel['stateid'])?>				
									</select>
								</div>
                             </div>
							
							<div class="form-group">
							  <label class="col-md-3 control-label">Mobile No.</label>
									<div class="col-md-6 col-xs-11">
									<input type="text" id="contact_no" name="contact_no" placeholder="Mobile No." class="form-control" value="<?=$rel['contact_no']?>" />
								</div>
                             </div>		
							 <div class="form-group">
							  <label class="col-md-3 control-label">Email</label>
									<div class="col-md-6 col-xs-11">
									<input type="text" id="website" name="website" placeholder="Email" class="form-control" value="<?=$rel['website']?>" />
								</div>
                             </div>	
							 <div class="form-group">
							  <label class="col-md-3 control-label">Website</label>
									<div class="col-md-6 col-xs-11">
									<input type="text" id="company_website" name="company_website" placeholder="Website" class="form-control" value="<?=$rel['company_website']?>" />
								</div>
                             </div>	
							<div class="form-group">
							  <label class="col-md-3 control-label">Head Logo</label>
							  <div class="col-md-6 col-xs-11">
							  	<input type="file" class="form-control" placeholder="Logo" name="logo" id="logo" accept="image/*" <? if($mode=="Add") { echo 'required';}?> title="logo" />
								
								</div>
								<div class="col-md-3 col-xs-11">
								<?
									if($mode=="Edit")
									{
										echo '<img src="'.ROOT.LOGO.$rel['logo'].'" style="width:120px"/>';
									}
								?>
								</div>
							</div>
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
				
							  <div class="form-group">
							  <label class="col-md-3 control-label">Bank Name</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Bank Name" name="bank_name" id="bank_name"  value="<?=$rel['bank_name']?>" />
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">A/c No</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="A/c No" name="ac_no" id="ac_no"  value="<?=$rel['ac_no']?>" />
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">IFCS </label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="IFCS" name="ifcs" id="ifcs"  value="<?=$rel['ifcs']?>" />
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">Branch Name</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Branch Name" name="branch_name" id="branch_name"  value="<?=$rel['branch_name']?>" />
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">GSTIN</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="GSTIN" name="gstno" id="gstno"  value="<?=$rel['vatno']?>" />
								</div>
                             </div> 
							 <div class="form-group">
							  <label class="col-md-3 control-label">PAN No</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="PAN Card No." name="pan_no" id="pan_no"  value="<?=$rel['pan_no']?>" />
								</div>
                             </div> 
							 <!--<div class="form-group">
							  <label class="col-md-3 control-label">VAT/TIN Date </label>
							  <div class="col-md-6 col-xs-11">
								<input id="vat_date" name="vat_date" type="text" class="form-control default-date-picker valid" title="Date" value="<?=$vat_date?>"  placeholder="Vat Date">
								</div>
                             </div>						
							<div class="form-group">
							  <label class="col-md-3 control-label">CST/TIN NO</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Cst No" name="cstno" id="cstno"   value="<?=$rel['cstno']?>" />
								</div>
                             </div>
							
							<div class="form-group">
							  <label class="col-md-3 control-label">CST/TIN Date </label>
							  <div class="col-md-6 col-xs-11">
								<input id="cst_date" name="cst_date" type="text" class="form-control default-date-picker valid" title="Date" value="<?=$cst_date?>"  placeholder="CST Date">
								</div>
                             </div>-->
							<!--<div class="form-group">
							  <label class="col-md-3 control-label">Ser.Tax NO</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Ser.Tax NO" name="serno" id="serno"  value="<?=$rel['serno']?>" />
								</div>
                             </div>
							 
							<div class="form-group">
							  <label class="col-md-3 control-label">Ser. Tax Date </label>
							  <div class="col-md-6 col-xs-11">
								<input id="ser_date" name="ser_date" type="text" class="form-control default-date-picker valid" title="Date" value="<?=$ser_date?>"  placeholder="Ser. Tax Date">
								</div>
                             </div>

							  <div class="form-group">
							  <label class="col-md-3 control-label">Pan Card No</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Pan Card No" name="pan_no" id="pan_no"  value="<?=$rel['pan_no']?>" />
								</div>
                             </div>-->
							 <div class="form-group">
							  <label class="col-md-3 control-label">Invoice Condition Content</label>
							  <div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="Invoice Condition" name="condition" id="condition" ><?=$rel['conditions']?></textarea>
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">Challan Condition Content</label>
							  <div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="Challan Condition" name="challan_condition" id="challan_condition" ><?=$rel['challan_condition']?></textarea>
								</div>
                             </div>
							 <div class="form-group">
								<label class="col-md-3 control-label">PO Condition Content</label>
								<div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="PO Condition" name="po_condition" id="po_condition" ><?=$rel['po_condition']?></textarea>
								</div>
                             </div>
							<div class="form-group">
							  <label class="col-md-3 control-label">Quotation Condition Content</label>
							  <div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="Quotation Condition" name="quot_condition" id="quot_condition" ><?=$rel['quot_condition']?></textarea>
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">Dispatch Heading Content</label>
							  <div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="Dispatch Heading Content" name="dispatch_head_content" id="dispatch_head_content" ><?=$rel['dispatch_head_content']?></textarea>
								</div>
                             </div>
							 <div class="form-group">
							  <label class="col-md-3 control-label">Dispatch Footer Content</label>
							  <div class="col-md-9 col-xs-11">
									<textarea class="form-control" placeholder="Dispatch Footer Content" name="dispatch_footer_content" id="dispatch_footer_content" ><?=$rel['dispatch_footer_content']?></textarea>
								</div>
                             </div>
							 <div class="col-md-3"></div>
							 <button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<div class="col-md-3"></div>					 						 	
							</div>
						</div><!--Vendor row end-->	
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
CKEDITOR.replace( 'address', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'condition', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'challan_condition', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'quot_condition', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'logo_content', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'po_condition', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'dispatch_head_content', {
	enterMode: CKEDITOR.ENTER_BR
});
CKEDITOR.replace( 'dispatch_footer_content', {
	enterMode: CKEDITOR.ENTER_BR
});

</script>
  </body>
</html>