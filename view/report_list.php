<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Report List";		
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php'); ?>
</head>
<body>
<section id="container">
  <?php include_once('../include/include_top_menu.php'); ?>
      <!--sidebar start-->
      <?php include_once('../include/left_menu.php'); ?>
      <!--sidebar end-->
      <!--main content start-->
	   <section id="main-content">
          <section class="wrapper">
		            
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
					<section class="panel">
						<header class="panel-heading">
						  <h3><?=$form?></h3>
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
						<?=$form?>
					</header>	
	
				<div class="panel-body">
					<div class="row">
					<?
						$menu_qry="select * from tbl_menu as menu inner join tbl_permission as per on per.menu_id=menu.menu_id inner join tbl_usertype as type on type.usertype_id=per.usertype_id where menu.status=0 and pid=7 and per.usertype_id=".$_SESSION['user_type']." order by menuorder";
						$menu_rs=$dbcon->query($menu_qry);
						while($menu_rel=mysqli_fetch_assoc($menu_rs)){
					?>
					
					<div class="col-md-6 report-section">
						<ul class="nav"> 
							<li> 
							<a href="<?=$menu_rel['page_name']?>"><i class="fa fa-angle-right" aria-hidden="true"></i> <?=$menu_rel['menu_name']?></a> 
							</li> 
						</ul>
					</div>
					<? } ?>	
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
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>  
    <!--<script src="js/count.js"></script>-->
</body>
</html>