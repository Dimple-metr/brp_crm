<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="User";
	if(strpos($_SERVER[REQUEST_URI], "useredit")==false){
		$mode="Add";
	}
	else{
		$mode="Edit";
		$custid=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from users where user_id=$custid";
		$rel=mysqli_fetch_assoc($dbcon->query($query));		
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
	 <meta name="keywords" charset="UTF-8" content="Meta Tags, Metadata" /> 
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
						<header class="panel-heading">
						  <h3><?=$mode.' '.$form?></h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'user_list'?>">User List</a></li>
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
	<form class="form-horizontal" role="form" id="user_add" action="javascript:;" method="post" name="user_add">
							<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Basic Information</h3>
							</header>	
							
							<div class="col-md-12">
								
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">User Name *</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" placeholder="User Name" name="user_name" id="user_name" value="<?=$rel['user_name']?>"/>
										</div>
									 </div>
								</div>
								
								
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">User Email *</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" placeholder="User Email" name="user_email" id="user_email"  value="<?=$rel['user_mail']?>"/>
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									 <div class="form-group">
									  <label class="col-md-3 control-label">Password *</label>
									  <div class="col-md-6 col-xs-11">
											<input type="password" class="form-control" placeholder="Password" name="password" id="password" value="" <? if($mode=="Add"){ echo 'required';}?>  />
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">Address *</label>
											<div class="col-md-6 col-xs-11">
											<textarea id="user_address" name="user_address" class="form-control"><?=$rel['user_address']?></textarea> 
										</div>
									 </div>
								</div>
							 	
								<div class="col-md-6">
									 <div class="form-group">
										<label class="col-md-3 control-label">Select State *</label>
										<div class="col-md-6 col-xs-11">
										
										<select class="select2" name="stateid" id="stateid" onChange="load_city(this.value,'cityid','0')">
											
										</select>
										</div>
									 </div>	
								</div>
								
								<div class="col-md-6">
									 <div class="form-group">
										<label class="col-md-3 control-label">Select City *</label>
										<div class="col-md-6 col-xs-11">
										<select class="select2" name="cityid" id="cityid"  onChange="">
											
										</select>
										</div>
									 </div>	
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Mobile no *</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" placeholder="Customer Mobile" name="user_mobile" id="user_mobile"   value="<?=$rel['user_phone']?>"  />
										</div>	
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">User Type *</label>
										<div class="col-md-6 col-xs-11">
											<select class="form-control" id="usertype_id" name="usertype_id">
												<option value="">--select User Type--</option>
												<?=getusertype($dbcon,$rel['user_type']," and usertype_id!=1")?>
											</select>
										</div>	
									</div>
								</div>
								<!--
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">First Name *</label>
											<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" name="user_fname" id="user_fname" value="<?=$rel['user_fname']?>" /> 
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">Last Name *</label>
											<div class="col-md-6 col-xs-11">
											<input type="text" class="form-control" name="user_lname" id="user_lname" value="<?=$rel['user_lname']?>" />
										</div>
									 </div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Role *</label>
										<div class="col-md-6 col-xs-11">
											<select class="form-control" id="roletype_id" name="roletype_id">
											<option value="">--Select Role--</option>
											<?=get_all_role($dbcon,$rel['roletype_id'])?>
										  </select>
										</div>	
									</div>
								</div>
								-->
								
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-3 control-label">Signature</label>
									  <div class="col-md-6 col-xs-11">
										<input type="file" class="form-control" placeholder="Logo" name="h_sign" id="h_sign" accept="image/*" title="logo" />
										
										</div>
										<div class="col-md-3 col-xs-11">
										<?
											if($mode=="Edit")
											{
												echo '<img src="'.USER_SIGN.$rel['h_sign'].'" style="width:120px"/>';
											}
										?>
										</div>
									</div>
								</div>
								
						</div>
						</div><!--Vendor row end-->
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Reports To</h3>
							</header>	
							
							<div class="col-md-12">
								<table class="table table-bordered">
									
								<?php 
									
									if($mode=='Edit')
									{
										 $qry="select * from users where active=0 and user_id!='$custid'";
										$user_report_arr=explode(",",$rel['user_report']);
										//print_r($user_report_arr);
									}
									else
									{
										 $qry="select * from users where active=0";
									}
									$rs_state=$dbcon->query($qry);		
									while($row=mysqli_fetch_array($rs_state))
									{
								?>
									<tr>
										<td>
											<input type="checkbox" class="" name="user_report[]" value="<?php echo $row['user_id']; ?>" <?php if(in_array($row['user_id'],$user_report_arr)){ echo "checked"; }; ?> /> <?php echo $row['user_name']; ?>
										</td>
									</tr>
								<?php } ?>
								</table>
							</div>
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Access Information</h3>
							</header>	
							
							<div class="col-md-12">
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">From Date *</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="usertype_form_date" class="form-control default-date-picker" value="<?php if($mode=='Edit') { echo date("d-m-Y",strtotime($rel['usertype_form_date'])); } else { echo date("d-m-Y"); } ?>" />
										  </select>
										</div>	
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Expiry Date *</label>
										<div class="col-md-6 col-xs-11">
											<input type="text" name="usertype_expiry_date" class="form-control default-date-picker" value="<?php if($mode=='Edit') { echo date("d-m-Y",strtotime($rel['usertype_expiry_date'])); } else { echo date("d-m-Y"); } ?>" />
										</div>	
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Timezone *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" id="usertype_timezone" name="usertype_timezone">
											<option value="">--Select Timezone--</option>
											<?=get_time_zone($dbcon,$rel['usertype_timezone']) ?>
										  </select>
										</div>	
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Currency *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" id="usertype_currency" name="usertype_currency">
												<option value="">--Select Currency--</option>
												<?=get_org_currency($dbcon,$rel['usertype_currency']) ?>
											</select>
										</div>	
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<div class="col-md-6 col-xs-11">
											<input type="checkbox" name="is_admin" value="1" <?php if($mode=='Edit'){ if($rel['is_admin']=='1'){ echo "checked"; } } ?> /> Is Admin
										</div>	
									</div>
								</div>
								
							</div>
							
						</div>
						
						<div class="row">
							
							<header class="panel-heading breadcrumb text-center">
							   <h3>Territory Information</h3>
							</header>	
							
							<div class="col-md-12">
								<div class="col-md-6">
									<div class="form-group">
									 <label class="col-md-3 control-label">Territories *</label>
										<div class="col-md-6 col-xs-11">
											<select class="select2" id="usertype_terr" name="usertype_terr[]" multiple>
											<?=get_all_territory($dbcon,$rel['usertype_terr'])?>
										  </select>
										</div>	
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="row">
							
							<div class="col-md-12">
						
								<button type="submit" class="btn btn-success">Save</button> &nbsp;
								<a href="<?=ROOT.'user_list'?>" type="button" class="btn btn-danger">Cancel</a>
						
							</div>
						
						</div>
						
			<input type="hidden" name="mode" id="mode" value="<?=$mode?>" />
			<input type="hidden" name="eid" id="eid" value="<?=$rel['user_id']?>" />
			<input type="hidden" name="company_id" id="company_id" value="<?=$rel['company_id']?>" />
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
   <script src="<?=ROOT?>js/app/user.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
</script>
	
<?php
	if($mode=="Edit"){
		echo "<script>load_state('stateid',".$rel['user_stat'].")</script>";
		echo "<script>load_city(".$rel['user_stat'].",'cityid',".$rel['user_city'].")</script>";
	}
	if($mode=="Add"){
		echo "<script>load_state('stateid',1);</script>";
		echo "<script>load_city(1,'cityid',1)</script>";
	}
?>
</body>
</html>