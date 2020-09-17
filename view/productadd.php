<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Product";
	if(strpos($_SERVER[REQUEST_URI], "productaddedit")==false)
	{
		$mode="Add";
	}
	else
	{
		$mode="Edit";
		$pid=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_product where product_id=$pid";
		$rel=mysqli_fetch_assoc($dbcon->query($query));		
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
			<? include_once('../include/equick_link.php');?>
    	
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
							  <li ><a href="<?=ROOT.'product_list'?>">Product List</a></li>
							  
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
	<form class="form-horizontal" role="form" id="product_add" action="javascript:;" method="post" name="product_add">
							<div class="row">
							<div class="col-md-10">
							<div class="form-group">
							  <label class="col-md-3 control-label">Product Name *</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Product Name" name="product_name" id="product_name"  value='<?=stripcslashes($rel['product_name'])?>'/>
								</div>
                             </div>						 
												 	
							<div class="form-group">
							 <label class="col-md-3 control-label">Product discription</label>
								<div class="col-md-6 col-xs-11">
									<textarea class="form-control" placeholder="Product Discription" name="product_des" id="product_des" ><?=$rel['product_des']?></textarea>
								</div>
							</div>	
								
							<div class="form-group">
							 <label class="col-md-3 control-label">Drg No</label>
								<div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Product Drg No" name="drg_no" id="drg_no"   value="<?=$rel['drg_no']?>"  />
								</div>
							</div>	
							
							<div class="form-group">
							 <label class="col-md-3 control-label">Hsn No</label>
								<div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Product Hsn No" name="hsn_no" id="hsn_no"   value="<?=$rel['hsn_no']?>"  />
								</div>
							</div>					 
							<button type="submit" class="btn btn-danger">Submit</button> &nbsp;
							<a href="<?=ROOT.'product_list'?>" type="button" class="btn btn-success">Cancle</a><div class="col-md-3"></div>					</div>
						</div><!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
							<input type='hidden' name='eid' id='eid' value='<?=$rel['product_id']?>' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
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
   <script src="<?=ROOT?>js/app/product.js"></script>
    <!--<script src="js/count.js"></script>-->
	

  </body>
</html>
