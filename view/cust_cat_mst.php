<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename']; 
	$form="Party Category";
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
						<form role="form" id="cust_cat_mst_add" action="javascript:;" method="post" name="cust_cat_mst_add">
							<div class="form-group">
								<label>Party Category Name</label>
								<input class="form-control" type='text' name='cc_name' id='cc_name' placeholder="Party Category Name" value='' />
							</div>
							
							<input type='hidden' name='mode' id='mode' value='add' />				  
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
				  <table  class="display table table-bordered table-striped" id="dynamic-table">
				  <thead>
				  <tr>
						<th>Sr. NO.</th>
						<th>Party Category Name</th>
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
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
<!-- Modal -->
<div class="modal colored-header info" id="ModalEditCustCat" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Edit <?=$form?></h3>
			</div>
			<div class="modal-body form">
			<form id="FormEditCustCat" role="form" method="post" novalidate>
			
				<div class="form-group">
				  <label for="edit_cc_name">Party Category Name</label>
				   <input class="form-control" type='text' name='edit_cc_name' id='edit_cc_name' value='' />
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
	<script src="<?=ROOT?>js/app/cust_cat_mst.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
</script>
</body>
</html>