<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Inquiry By Date Report";
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
	var t_id=$('#t_id').val();
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/report_inq_bydate/',
		data: { mode : "generate_report", date:date, t_id:t_id },
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
							<label class="control-label col-md-4">Territory</label>
							<div class="col-md-7">
								<select class="select2" id="t_id" name="t_id" onChange="generate_report()">
									<option value="">Choose Territory</option>
									<?=get_all_territory($dbcon,"");?>
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
