<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Purchase Order";
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
	if(empty($_SESSION['start'])) {
		$start=date('1-m-Y');
		$end=date("d-m-Y");
	}
	else {
		$start=$_SESSION['start'];
		$end=$_SESSION['end'];
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
					<header class="panel-heading">
						<h3><?=$mode.' '.$form?> List</h3>
					</header>	
					<div class="">
						<ul class="breadcrumb">
							<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							<li class="active"><?=$form?> list</li> 
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
								<div class="col-md-8">
									<div class="input-group date form_datetime-component"> 
										<input type="hidden" id="from_date" value="<?=$start?>">
										<input type="hidden" id="to_date" value="<?=$end?>">
										<input type="text" id="rep_date" onChange="load_po_datatable();" class="form-control datepikerdemo" value="">
										<span class="input-group-btn">
											<button type="button" class="btn btn-danger date-set"><i class="fa fa-calendar"></i></button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<!--<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">Delivery Status</label>
								<div class="col-md-9">
									<div class="col-md-4">
										<label for="delivery_status_all" class='external-event label label-primary ui-draggable' style='position: relative;'>All</label>					
										<input id="delivery_status_all" name="delivery_status" type="radio" checked="checked" onClick="load_datatable();" title="All" value="">
									</div>
									<div class="col-md-4">
										<label for="delivery_status_done" class='external-event label label-success ui-draggable' style='position: relative;'>Delivered</label>				
										<input id="delivery_status_done" name="delivery_status" onClick="load_datatable();" type="radio" title="Done" value="1">
									</div>
									<div class="col-md-4">
										<label for="delivery_status_pending" class='external-event label label-warning ui-draggable' style='position: relative;'>Pending</label>
										<input id="delivery_status_pending" name="delivery_status" onClick="load_datatable();" type="radio" title="Pending" value="2">
									</div> 
								</div>
							</div>
						</div>-->
						
						<div class="clearfix"></div> 
						<span class="tools pull-right">
							<a href="<?=ROOT.'po'?>"><button class="btn btn-success btn-flat">Create <?=$form?></button></a> 
						</span>
						
					</header>	
					<div class="panel-body">
						
						<div class="adv-table">
							<table class="display table table-bordered table-striped" id="purchase-order-table">
								<thead>
									<tr>
										<th>PO No</th>
										<th>PO Date</th>
										<th>Vendor Name</th>
										<th>Grand Total</th>
										<th>Inspection Status</th>
										<th>PO Status</th>
										<th class="hidden-phone">Action</th> 
									</tr>
								</thead>
								<tbody>
								</tbody>				 
							</table>
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
	include_once('../include/preview_po_approval_hist.php');
	include_once('../include/send_email.php');
?>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="js/app/po.js?<?=time()?>"></script>

<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
function cb(start, end) {
	$('.datepikerdemo span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
}
cb(moment().subtract(29, 'days'), moment());
 
$('.datepikerdemo').daterangepicker({       
	locale: {
		format: 'DD-MM-YYYY'
	},
	"autoApply": true,	
	"startDate": $('#from_date').val(),
	"endDate": $('#to_date').val(),	
	ranges: {
		'Today': [moment(), moment()],
		'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		'Last 7 Days': [moment().subtract(6, 'days'), moment()],
		'Last 30 Days': [moment().subtract(29, 'days'), moment()],
		'This Month': [moment().startOf('month'), moment().endOf('month')],
		'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	}
}, cb);
$('.date-set').click(function(){
	$('.datepikerdemo').trigger('click')
}); 
CKEDITOR.replace( 'email_content', {
	enterMode: CKEDITOR.ENTER_BR
});
</script>
</body>
</html>
