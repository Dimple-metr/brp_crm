<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Customer Contact";
	if(strpos($_SERVER[REQUEST_URI], "customeraddedit")==false)
	{
		$mode="Add";
		//$countryid="101";
		$stateid="1";
		$cityid="1";
	}
	else
	{
		$mode="Edit";
		$custid=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_customer where cust_id=$custid";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$cst_date='';$st_date='';
		if($rel['cst_date']!="1970-01-01" && $rel['cst_date']!="0000-00-00")
		{
			$cst_date=date('d-m-Y',strtotime($rel['cst_date']));
		}
		if($rel['st_date']!="1970-01-01" && $rel['st_date']!="0000-00-00")
		{
			$st_date=date('d-m-Y',strtotime($rel['st_date']));
		}
		
		$ass_array=explode(",",$rel['cust_assign_user']);
	
	}
	
	$com_sel=$dbcon->query("select * from tbl_company where company_id='$_SESSION[company_id]'");
	$r_sel=mysqli_fetch_array($com_sel);

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
		<?php 
			//include_once('../include/quick_link.php');
		?>
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
							  <li><a href="<?=ROOT.'customer_contact_list'?>"><?=$form?> List</a></li>
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
					<div class="panel-body ">
					<form class="form-horizontal" role="form" id="cust_add" action="javascript:;" method="post" name="cust_add">
						<div class="row">
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Creator*</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_creator" name="cust_creator" placeholder="Item Code"  value="<?=$r_sel['company_name'];?>" readonly />
								  </div>
							  </div>							 
							</div>
					
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Customer</label>
								  <div class="col-md-8 col-xs-11">
									<select class="select2" name="cust_id" id="cust_id">
										<?=getcust($dbcon,0)?>
									</select>
								  </div>
							  </div>
							</div>
							
						</div> 
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">First Name *</label>
								  <div class="col-md-2 col-xs-11">
									<select class="form-control" name="cust_title" id="cust_title">
										<option value="">Title</option>
										<option value="dr">Dr.</option>
										<option value="mr">Mr.</option>
										<option value="ms">Ms</option>
										<option value="mrs">Mrs.</option>
										<option value="pro">Pro.</option>
									</select>
								  </div>
								  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" name="cust_fname" id="cust_fname" />
								  </div>
							  </div>							 
							</div>
					
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Last Name</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_lname" name="cust_lname" placeholder=""  value="<?=$rel['cust_lname'];?>" />
								  </div>
							  </div>
							</div>
							
						</div> 
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Email 1*</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_email1" name="cust_email1" placeholder=""  value="<?=$rel['cust_email1'];?>" />
								  </div>
							  </div>							 
							</div>
					
							
							 <div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Mobile 1*</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_mobile1" name="cust_mobile1" placeholder=""  value="<?=$rel['cust_mobile1'];?>" />
								  </div>
							  </div>							 
							</div>
							
						</div> 
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Email 2*</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_email2" name="cust_email2" placeholder=""  value="<?=$rel['cust_email2'];?>" />
								  </div>
							  </div>							 
							</div>
					
							
							 <div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Mobile 2*</label>
								  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" id="cust_mobile2" name="cust_mobile2" placeholder=""  value="<?=$rel['cust_mobile2'];?>" />
								  </div>
							  </div>							 
							</div>
							
						</div> 
						
						
						<div class="col-md-12" style="margin-top:5px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Contact Information</h3>
							</header>
							
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Job Title *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="cust_ind" id="cust_ind">
											<option value="">--Select Customer Industry--</option>
											<?=get_customer_industries($dbcon,$rel['cust_ind']);?>
										</select>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Department *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="cust_dept" id="cust_dept">
											<option value="">--Select Department Type--</option>
											<?=get_customer_type($dbcon,$rel['cust_type']);?>
										</select>
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Phone *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" id="cust_phone" name="cust_phone" placeholder=""  value="<?=$rel['cust_phone'];?>" />
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Website *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_web" id="cust_web" value="<?=$rel['cust_web']?>" />
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Communication Preference *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="cust_comm" id="cust_comm">
											<option value="">--Select communication--</option>
											<?=get_customer_type($dbcon,$rel['cust_type']);?>
										</select>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Skype ID *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_skype" id="cust_skype" value="<?=$rel['cust_skype']?>" />
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-12">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-2 control-label">Linkedin Profile (URL/ Details) *</label>
									  <div class="col-md-10 col-xs-11">
										<input type="text" class="form-control" name="cust_linkedin" id="cust_linkedin" value="<?=$rel['cust_linkedin']?>" />	
									  </div>
								  </div>							 
								</div>
								
							</div>
							
							
						</div>
						
						
						<div class="col-md-12" style="margin-top:5px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Shipping Address Informations</h3>
							</header>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Street *</label>
									  <div class="col-md-8 col-xs-11">
										<textarea class="form-control" name="cust_ship_street" id="cust_ship_street"></textarea>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Country *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_ship_country" id="c_ship_country" onChange="load_state(this.value,'c_ship_state','')">
												<?=get_country($dbcon,$countryid)?>				
										</select>
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">State *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_ship_state" id="c_ship_state" onChange="load_city(this.value,'c_ship_city','')">
												<option value="">Select State</option>	
												<?//=getstate($dbcon,$rel['stateid'])?>				
											</select>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">City *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_ship_city" id="c_ship_city">
											<option value="">Select City</option>	
										</select>
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Zip *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_ship_zip" id="cust_ship_zip" />
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Location *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_ship_location" id="cust_ship_location" />
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							
						</div>
						
						<div class="col-md-12" style="margin-top:5px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Billing Address Informations</h3>
							</header>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Street *</label>
									  <div class="col-md-8 col-xs-11">
										<textarea class="form-control" name="cust_street" id="cust_street"></textarea>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Country *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_add_country" id="c_add_country" onChange="load_state(this.value,'c_add_state','')">
												<?=get_country($dbcon,$countryid)?>				
										</select>
									  </div>
								  </div>							 
								</div>
						
							</div>
						
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">State *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_add_state" id="c_add_state" onChange="load_city(this.value,'c_add_city','')">
												<option value="">Select State</option>	
												<?//=getstate($dbcon,$rel['stateid'])?>				
											</select>
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">City *</label>
									  <div class="col-md-8 col-xs-11">
										<select class="select2" name="c_add_city" id="c_add_city">
											<option value="">Select City</option>	
										</select>
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Zip *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_zip" id="cust_zip" />
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Location *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_location" id="cust_location" />
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							
						</div>
					
					
						<div class="col-md-12" style="margin-top:5px;"> 
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Additional Informations</h3>
							</header>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Date Of Birth *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control default-date-picker" name="cust_dob" id="cust_dob" />
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Fax *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_fax" id="cust_fax" />
									  </div>
								  </div>							 
								</div>
						
							</div>
							
							<div class="col-md-12">
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Home Phone *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_hp" id="cust_hp" />
									  </div>
								  </div>							 
								</div>
								
								
								<div class="col-md-6">
								  <div class="form-group">
									  <label for="Product Type" class="col-md-4 control-label">Other Phone *</label>
									  <div class="col-md-8 col-xs-11">
										<input type="text" class="form-control" name="cust_op" id="cust_op" />
									  </div>
								  </div>							 
								</div>
						
							</div>
						</div>
					
						</div><!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
							<input type='hidden' name='eid' id='eid' value='<?php if($mode=='Edit'){ echo $rel['c_con_id']; } else { echo "0"; }?>' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
							<div class="col-md-12">
							
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<a href="<?=ROOT.'customer_contact_list'?>" type="button" class="btn btn-danger">Cancel</a><div class="col-md-3"></div>					
							
						</div>
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
	<?php include_once('../include/add_city.php');?>
	<?php include_once('../include/add_state.php');?>
	
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="<?=ROOT?>js/app/customer_contact.js"></script>
   <script src="<?=ROOT?>js/app/state_mst.js"></script>
   <script src="<?=ROOT?>js/app/city_mst.js"></script>
<script>
$(".select2").select2({
		width: '100%'
});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
});</script>
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
