<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/common_functions.php");
	$form="Expense";
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
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
						<h3>New <?=$form?></h3>
					</header>	
					<div class="">
						<ul class="breadcrumb">
							<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							<li class="active"><?=$form?> List</li>
						</ul>
					</div>
				</section>
				<!--breadcrumbs end -->
			</div>	
		</div>
		<!--unit overview start-->
		<div class="row">
			<div class="col-sm-3">
				<section class="panel">
					<header class="panel-heading">
						New <?=$form?>
					</header>	
					<div class="panel-body">
						<form role="form" id="expense_add" action="javascript:;" method="post" name="expense_add">
							<div class="form-group">
								<label>Expense Group*</label>
								<input type="button" name="addExpHead" id="addExpHead" style="float:right;margin-bottom: 5px;" title="Add Expense Head" data-toggle="modal" data-target="#add_expense_head_modal" class="btn btn-primary" value="+"/>
								<select class="select2" name="expense_head_id" id="expense_head_id">
									<?=get_all_group($dbcon,$rel['cust_group']);?>
								</select>
							</div>
							<div class="form-group">
								<label>Expense Name *</label>
								<input class="form-control" type="text" name="expense_name" id="expense_name" placeholder="Expense Name" value="" />
							</div>			  
							<button type="submit" class="btn btn-success">Submit</button>
						</form> 
					</div>
				</section>
			</div>
			<div class="col-sm-9">
				<section class="panel">
					<header class="panel-heading">
						<?=$form?> List
						<span class="tools pull-right">
							<a href="javascript:;" class="fa fa-chevron-down"></a>
						</span>
					</header>
					<div class="panel-body">
						<div class="adv-table">
							<table class="display table table-bordered table-striped" id="expense-table">
								<thead>
									<tr>
										<th>Sr. NO.</th>
										<th>Expense Head Name</th> 
										<th>Expense Name</th> 
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
		
		<!--unit overview end-->
	</section>
</section>
<!--main content end-->
<!--footer start-->
<?php include_once('../include/add_expense_head.php');?>
<?php include_once('../include/footer.php');?>
<!--footer end-->
</section>
<!-- Modal -->
<div class="modal colored-header info" id="ModalEditExp" role="dialog" data-keyboard="false" data-backdrop="static">
<div class="modal-dialog custom-width">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">Close &times;</button>
			<h3>Edit <?=$form?></h3> 
		</div>
		<div class="modal-body form">
		<form id="FormEditExp" role="form" method="post" novalidate>
			<div class="form-group">
				<label>Expense Head*</label>
				<select class="select2" name="edit_expense_head_id" id="edit_expense_head_id">
					<?=get_all_group($dbcon,'');?>
				</select>
			</div>
			<div class="form-group">
				<label for="edit_expense_name">Expense Name</label>
				<input class="form-control" type="text" name='edit_expense_name' id='edit_expense_name' value="" />
			</div>
			
			</div>
			<div class="modal-footer">
				<input type="hidden" name="edit_id" id="edit_id" value="" />
				<button type="button" class="btn btn-default btn-flat md-close" data-dismiss="modal">Cancel</button>
				<button class="btn btn-success btn-flat" type="submit">Update</button>
			</div>
		</form>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>
<script src="<?=ROOT?>js/app/expense_mst.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/expense_head_mst.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/group_mst.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
</script>
</body>
</html>
