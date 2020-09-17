<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Party";

	$mode="Import";
	$user_name=$_SESSION['user_name'];
	
	
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
			<div class="row">
			  <div class="col-md-12">
				  <!--breadcrumbs start -->
					<section class="panel">
						<header class="panel-heading">
						  <h3><?=$mode.' '.$form?></h3>
						  <div class="text-center">Owner : <strong><?=$user_name?></strong></div>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'customer_list'?>"><?=$form?> List</a></li>
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
					<form class="form-horizontal" role="form" id="cust_imp_add" action="javascript:;" method="post" name="cust_imp_add">
						<div class="row">
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label class="col-md-4 control-label">Party Type*</label>
									<div class="col-md-8">
										<div class="col-md-3">
											<label>
												<input type="radio" class="form-control" id="party_type_both" name="party_type" value="0" checked> Both
											</label>
										</div>
										<div class="col-md-3">
											<label>
												<input type="radio" class="form-control" id="party_type_cust" name="party_type" value="1"> Customer
											</label>
										</div>
										<div class="col-md-3">
											<label>
												<input type="radio" class="form-control" id="party_type_ven" name="party_type" value="2"> Vendor
											</label>
										</div>
									</div>
							  </div>							 
							</div>
							<div class="clearfix"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-md-4 control-label">Import CSV File</label>
									<div class="col-md-8">
										<input type="file" class="form-control" id="import_file" name="import_file" onchange="trigger_csv_Validation(this)" accept=".csv" required>
									</div>								
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<a href="<?=ROOT.CUSTOMER_VWING.'demo_cust_import.csv'?>" class="btn btn-info " target="_blank"> <i class="fa fa-download" aria-hidden="true"></i> Download Sample Format</a>
								</div>
							</div>
						</div> 
			 
						</div><!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='check_import' />			  
							
						<div class="col-md-12 text-center">
							<button type="button" id="check_btn" class="btn btn-primary" onclick="check_csv_data()">Next</button>
							<button type="submit" id="submit_btn" style="display:none;" class="btn btn-success">Import</button>
							<a href="<?=ROOT.'customer_list'?>" type="button" class="btn btn-danger">Cancel</a>
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
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
<script>
var regex = new RegExp("(.*?)\.(csv)$");

function trigger_csv_Validation(el) {
  if (!(regex.test(el.value.toLowerCase()))) {
    el.value = '';
    alert('Please select CSV file format!!!');
  }
}

$(".select2").select2({
	width: '100%'
});
</script>
</body>
</html>