<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Forecast";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	if(strpos($_SERVER[REQUEST_URI], "forecast_edit")==false) {
		$mode="Add";
		$f_by_id='1';
		$f_target_period='1';
		$f_period_id='';
	}
	else {
		$mode="Edit";
		$forecast_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_forecast where forecast_id=$forecast_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$f_by_id=$rel['f_by_id'];
		$f_target_period=$rel['f_target_period'];
		$f_period_id=$rel['f_period_id'];
	}
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
	<h3><?=$mode.' '.$form?>
		<!--<a href="<?=ROOT.'import_product'?>" >
		<button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
	</h3>
</header>	
<div class="">
	<ul class="breadcrumb">
		<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
		<li class="active"><a href="<?=ROOT.'forecast_list'?>"><?=$form?> List </a></li>
	</ul>
</div>
</section>
<!--breadcrumbs end -->
</div>	
</div>
<!--Customer overview start-->

<div class="row">
<div class="col-sm-12">
<section class="panel">
<header class="panel-heading">
	New <?=$form?> 
	<span class="tools pull-right">
		<a href="javascript:;" class="fa fa-chevron-down"></a>
	</span>
	<?
		/*$s_year=2016;
		$e_year=date("Y");
		for($i=$e_year;$i>=$s_year;$i--){
			echo $i."<br/>";
		}*/
	?>
</header>	
<div class="panel-body">
	<form class="form-horizontal" role="form" id="forecast_add" action="javascript:;" method="post" name="forecast_add">
		
		<div class="col-md-12">
			
			<!--<div class="col-md-4">
				<div class="form-group">
					<label for="t_id" class="col-md-4 control-label">Territory*</label>
					<div class="col-md-8">
						<select class="select2" id="t_id" name="t_id" >
							<option value="0">India</option>
						</select>
					</div>
				</div>							 
			</div>-->
			<div class="col-md-6">
				<div class="form-group">
					<label for="f_by_id" class="col-md-4 control-label">Forecast By *</label>
					<div class="col-md-8">
						<select class="select2" id="f_by_id" name="f_by_id" onchange="load_f_by_year(this.value);load_f_period();">
							<?=get_for_cast_by($dbcon,$f_by_id);?>
						</select>
					</div>
				</div>							 
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="f_year" class="col-md-4 control-label">Year *</label>
					<div class="col-md-8">
						<select class="select2" id="f_year" name="f_year" >
							<?=load_f_by_year($f_by_id,$rel['f_year'])?>
						</select>
					</div>
				</div>							 
			</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label for="f_target_period" class="col-md-4 control-label">Forecast Target Period *</label>
				<div class="col-md-8">
					<select class="select2" id="f_target_period" name="f_target_period" onchange="load_f_period();">
						<?=get_for_target_p($dbcon,$f_target_period);?>
					</select>
				</div>
			</div>							 
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label for="f_period_id" class="col-md-4 control-label">Period Name *</label>
				<div class="col-md-8">
					<select class="select2" id="f_period_id" name="f_period_id" >
						<?=get_for_period($dbcon,$f_by_id,$f_target_period,$f_period_id);?>
					</select>
				</div>
			</div>							 
		</div>
	<div class="clearfix"></div>	
		<div class="col-md-6">
			<div class="form-group">
				<label for="f_target_amt" class="col-md-4 control-label">Target Amount *</label>
				<div class="col-md-8">
					<input type="number" min="0" class="form-control" id="f_target_amt" name="f_target_amt" value="<?=$rel['f_target_amt']?>">
				</div>
			</div>							 
		</div>	
		<div class="col-md-6">
			<div class="form-group">
				<label for="f_target_qty" class="col-md-4 control-label">Target Qty</label>
				<div class="col-md-8">
					<input type="number" min="0" class="form-control" id="f_target_qty" name="f_target_qty" value="<?=$rel['f_target_qty']?>">
				</div>
			</div>							 
		</div>
	
	<div class="clearfix"></div>	
	<!-- Accordian Start -->
<div class="col-md-12">
<div class="panel-group m-bot20" id="accordion1">
	<div class="panel panel-default">
		
		<div id="main_div1" style="border: 1px solid;">	
		  <div class="panel-heading" style="padding-bottom: 20px;">
			  <h3 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#divcnt1">
					Target For Territories <i class="fa fa-chevron-down"></i>
				</a>
			  </h3>
		  </div> 
		  <div id="divcnt1" class="panel-collapse collapse">
			  <div class="panel-body">
				<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
					<thead>
						<tr>
							<th width="40%">Territory</th>
							<th width="30%">Target Amount</th>
							<th width="30%">Target Qty.</th>
						</tr>
					</thead>
					<tbody>
			<?
				$k=1;
				$get_ter_qry="select ter.t_id,ter.t_name,trn.ter_target_amt,trn.ter_target_qty from territory_mst as ter
				left join tbl_f_ter_trn as trn on trn.t_id=ter.t_id and trn.f_ter_trn_status=0 and trn.forecast_id='".$rel['forecast_id']."'
				where t_status=0";
				$get_ter_qry_rs=$dbcon->query($get_ter_qry);
				while($get_ter_rel=mysqli_fetch_assoc($get_ter_qry_rs)){
			?>
			<tr>
				<td style="vertical-align: middle;text-align:left;"><?=$get_ter_rel['t_name']?>
					<input type="hidden" id="t_id<?=$k?>" name="t_id[]" value="<?=$get_ter_rel['t_id']?>">
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" class="form-control" min="0" id="ter_target_amt<?=$k?>" name="ter_target_amt[]" value="<?=$get_ter_rel['ter_target_amt']?>">
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" class="form-control" min="0" id="ter_target_qty<?=$k?>" name="ter_target_qty[]" value="<?=$get_ter_rel['ter_target_qty']?>">
				</td>
			</tr>
			<?
				$k++;
				}
			?>
					</tbody>
				</table>
				
			  </div>
		  </div>
		</div>
	
	</div>
</div>
</div>
<!-- Accordian End -->
<!-- Accordian Start -->
<div class="col-md-12">
<div class="panel-group m-bot20" id="accordion2">
	<div class="panel panel-default">
		
		<div id="main_div1" style="border: 1px solid;">	
		  <div class="panel-heading" style="padding-bottom: 20px;">
			  <h3 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#divcnt2">
					Target For Users <i class="fa fa-chevron-down"></i>
				</a>
			  </h3>
		  </div> 
		  <div id="divcnt2" class="panel-collapse collapse">
			  <div class="panel-body">
				<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
					<thead>
						<tr>
							<th width="35%">User</th>
							<th width="25%">Role</th>
							<th width="20%">Target Amount</th>
							<th width="20%">Target Qty.</th>
						</tr>
					</thead>
					<tbody>
			<?
				$k=1;
				$get_usr_qry="select usr.user_id,usr.user_mail,type.usertype_name,trn.usr_target_amt,trn.usr_target_qty from users as usr 
				left join tbl_usertype as type on type.usertype_id=usr.user_type
				left join tbl_f_user_trn as trn on trn.user_id=usr.user_id and trn.f_user_trn_status=0 and trn.forecast_id='".$rel['forecast_id']."'
				where usr.active=0 and usr.user_type!=1";
				$get_usr_qry_rs=$dbcon->query($get_usr_qry);
				while($get_usr_rel=mysqli_fetch_assoc($get_usr_qry_rs)){
			?>
			<tr>
				<td style="vertical-align: middle;text-align:left;"><?=$get_usr_rel['user_mail']?>
					<input type="hidden" id="user_id<?=$k?>" name="user_id[]" value="<?=$get_usr_rel['user_id']?>">
				</td>
				<td style="vertical-align: middle;text-align:left;"><?=$get_usr_rel['usertype_name']?>
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" min="0" class="form-control" id="usr_target_amt<?=$k?>" name="usr_target_amt[]" value="<?=$get_usr_rel['usr_target_amt']?>">
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" min="0" class="form-control" id="usr_target_qty<?=$k?>" name="usr_target_qty[]" value="<?=$get_usr_rel['usr_target_qty']?>">
				</td>
			</tr>
			<?
				$k++;
				}
			?>
					</tbody>
				</table>
				
			  </div>
		  </div>
		</div>
	
	</div>
</div>
</div>
<!-- Accordian End -->

<!-- Accordian Start -->
<div class="col-md-12">
<div class="panel-group m-bot20" id="accordion3">
	<div class="panel panel-default">
		
		<div id="main_div1" style="border: 1px solid;">	
		  <div class="panel-heading" style="padding-bottom: 20px;">
			  <h3 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#divcnt3">
					Target For Product Group <i class="fa fa-chevron-down"></i>
				</a>
			  </h3>
		  </div> 
		  <div id="divcnt3" class="panel-collapse collapse">
			  <div class="panel-body">
				<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
					<thead>
						<tr>
							<th width="40%">Product Group</th>
							<th width="30%">Target Amount</th>
							<th width="30%">Target Qty.</th>
						</tr>
					</thead>
					<tbody>
			<?
				$k=1;
				$get_grp_qry="select grp.pg_id,grp.pg_name,grp_trn.grp_target_amt,grp_trn.grp_target_qty from tbl_product_grp as grp 
				left join tbl_f_grp_trn as grp_trn on grp_trn.pg_id=grp.pg_id and grp_trn.f_grp_trn_status=0 and grp_trn.forecast_id='".$rel['forecast_id']."'
				where grp.pg_status=0";
				$get_grp_qry_rs=$dbcon->query($get_grp_qry);
				while($get_grp_rel=mysqli_fetch_assoc($get_grp_qry_rs)){
			?>
			<tr>
				<td style="vertical-align: middle;text-align:left;"><?=$get_grp_rel['pg_name']?>
					<input type="hidden" id="pg_id<?=$k?>" name="pg_id[]" value="<?=$get_grp_rel['pg_id']?>">
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" min="0" class="form-control" id="grp_target_amt<?=$k?>" name="grp_target_amt[]" value="<?=$get_grp_rel['grp_target_amt']?>">
				</td>
				<td style="vertical-align: middle;text-align:center;">
					<input type="number" min="0" class="form-control" id="grp_target_qty<?=$k?>" name="grp_target_qty[]" value="<?=$get_grp_rel['grp_target_qty']?>">
				</td>
			</tr>
			<?
				$k++;
				}
			?>
					</tbody>
				</table>
				
			  </div>
		  </div>
		</div>
	
	</div>
</div>
</div>
<!-- Accordian End -->
	<div class="clearfix"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['forecast_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Save</button>
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'forecast_list'?>">Cancel</a>
			</div>
		</div>
	</form>
	
</div>
</section>
</div>
</div>

<!--Customer overview end-->
</section>
</section>
<!--main content end-->
<!--footer start-->
<?php include_once('../include/footer.php');?>
<!--footer end-->
</section>
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/forecast.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
//load_f_by_year(<?=$f_by_id?>);
</script>
</body>
</html>