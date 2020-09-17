<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php"); 
	$form="Role";
	$countryid='101';
	$stateid='1';
	$cityid='1';
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
	//echo $_SESSION['branch_id'];
	//echo $_SESSION['company_id'];
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
//				include_once('../include/quick_link.php');
				?>
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
					<section class="panel">
						<header class="panel-heading">
						  <h3><?=$form?> List</h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'customer_list'?>"><?=$form?> list</a></li>
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
				 
					 <div class="panel-body">
					 
							
						<div class="col-md-12"  align="right">
							
							<a class="btn btn-success" href="<?=ROOT.'manage_role'?>">Add Role</a>
							
						</div>
			
						  <div class="adv-table" id="adv-table">
							  <table  class="display table table-bordered table-striped" id="dynamic-table">
							  <thead>
							  <tr>
								  <th>Sr. NO.</th>
								  <th>Role</th>
								   <th class="hidden-phone"> Action</th>					  
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
	include_once('../include/view_consignee.php');
	include_once('../include/add_consignee.php');
?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="js/app/roles.js"></script>
    <!--<script src="js/count.js"></script>-->
	<script>
$(".select2").select2({
		width: '100%'
});	

	</script>
  </body>
</html>
