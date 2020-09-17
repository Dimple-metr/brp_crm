<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Task Activity Details By Owner Report";
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
	$start=date('1-m-Y');
	$end=date("d-m-Y");
	
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
<script>
function generate_report(){
	var date=$('#rep_date').val();
	var user_id=$('#user_id').val();
	var task_type_id=$('#task_type_id').val();
	var task_status=$('#task_status').val();
	var task_rel_id = $('input:checkbox:checked.fil_chk').map(function(){ return this.value; }).get().join(",");

	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/report_task_act_byowner/',
		data: { mode : "generate_report", date:date, user_id:user_id, task_type_id:task_type_id , task_status:task_status, task_rel_id:task_rel_id },
		success: function(response)
		{
			var resp=JSON.parse(response);
			$('#adv-table').html(resp.html_resp);
			Unloading();							
		}
	});	
}
</script>
<section id="main-content">
	
	<section class="wrapper">
		
		<div class="row">
			<div class="col-lg-12">
				<!--breadcrumbs start -->
				<section class="panel">
					<header class="panel-heading">
						<span class="tools pull-right">
							<a href="<?=ROOT.'report_list'?>"><button type="button" class="btn btn-info"><i class="fa fa-long-arrow-left" aria-hidden="true"></i> Report List</button></a>	
						</span>
						
						<h3 style=""><?=$form?> </h3>
					</header>	
					<div class="">
						<ul class="breadcrumb">
							<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							<li><?=$form?></li>
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
						<div class="col-md-5">
							<div class="form-group">
								<label class="control-label col-md-4">Choose Date</label>
								<div class="col-md-7">
									<div class="input-group date form_datetime-component">
										<input type="hidden" id="from_date" value="<?=$start?>">
										<input type="hidden" id="to_date" value="<?=$end?>">
										<input type="text" id="rep_date" onChange="generate_report();" class="form-control datepikerdemo" value="">
										<span class="input-group-btn">
											<button type="button" class="btn btn-danger date-set"><i class="fa fa-calendar"></i></button>
										</span>
									</div>
								</div>
							</div>
						</div>
							
						<span class="tools pull-right"> 
							<a href="javascript:;" onClick="tableToExcel('adv-table', '<?=$form?>')" ><button class="btn btn-primary btn-flat" >Export Excel</button></a>	
						</span> 
					<div class="clearfix"></div>
					<div class="col-md-12" style="padding-top:10px;"></div>
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label col-md-4">User</label>
							<div class="col-md-7">
								<select class="select2" id="user_id" name="user_id" onChange="generate_report()">
									<option value="">Choose User</option>
									<?=get_assign_users($dbcon,"","");?>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label col-md-4">Type</label>
							<div class="col-md-7">
								<select class="select2" id="task_type_id" name="task_type_id" onChange="generate_report()">
									<option value="">Choose Task Type</option>
									<?=get_master_category_dtl($dbcon,"",10);//10:Task?>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-12" style="padding-top:10px;"></div>
					<div class="col-md-12">
						<div class="form-group">
							<table class="display table table-bordered table-striped">
								<tr>
							<?
								$fil_qry="select * from task_rel_mst where task_rel_status=0";
								$fil_qry_rs=$dbcon->query($fil_qry);
								while($fil_rel=mysqli_fetch_assoc($fil_qry_rs)){
							?>
								<th><input type="checkbox" class="fil_chk" style="width: 16px;height: 16px;" id="task_rel_id<?=$fil_rel['task_rel_id']?>" name="task_rel_id[]" value="<?=$fil_rel['task_rel_id']?>" onchange="generate_report()"> <?=$fil_rel['task_rel_name']?></th>
							<?}?>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-md-12" style="padding-top:10px;"></div>
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label col-md-4">Report By </label>
							<div class="col-md-7">
								<select class="select2" id="task_status" name="task_status" onChange="generate_report()">
									<option value="0">Created Date</option>
									<option value="1">Completion Date</option>
								</select>
							</div>
						</div>
					</div>
					
					<div class="clearfix"></div>
					
					</header>	
					<div class="clearfix"></div>
					<div class="panel-body">
						<div class="adv-table" id="adv-table" style="overflow-x: scroll;">
							
						</div>
					</div>
				</section>
			</div>
		</div>	
		<!--state overview end-->
	</section>
</section>
<!--main content end-->
<!--footer start-->
<?php
	include_once('../include/footer.php');
?>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<?php include_once('../include/include_report_js_file.php');?>   


</body>
</html>
