<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Terms & Condition";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));	
	
	if(strpos($_SERVER[REQUEST_URI], "terms_edit")==false) {
		$mode="Add";
	
	}
	else {
		$mode="Edit";
		$pro_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_terms_condition where tc_id=$pro_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		
		$for_arr=explode(",",$rel['tc_for']);
		//print_r($check_array_setting);
	}
	
	//echo $_SESSION['branch_id'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
	
	<style>
		
		.row_margin{
			
			margin-top:15px !important;
		}
		.check_span
		{
			margin:10px;
		}
	</style>
</head>
<body>
<section id="container" class="sidebar-closed">
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
						  <h3>New <?=$form?>
						  <!--<a href="<?=ROOT.'import_product'?>" >
						  <button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
						  </h3>
						</header>	
						<div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li class="active"><a href="<?=ROOT.'terms_list'?>"><?=$form?> List </a></li>
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
					</header>	
					<div class="panel-body">
						<form role="form" id="terms_add" action="javascript:;" method="post" name="terms_add">
						
					<div class="col-md-12 row_margin" style="padding-top: 25px;">
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Term Name*</label>
								  <div class="col-md-8 col-xs-11">
								  <input type="text"  class="form-control" id="term_name" name="term_name" placeholder="Term Name" value="<?=$rel['tc_name'];?>" />
								  </div>
							  </div>							 
							</div>
					
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Priority *</label>
								  <div class="col-md-8 col-xs-11">
								 <input type="text" class="form-control" name="term_priority" id="term_priority" value="<?=$rel['tc_priority'];?>" />
								  </div>
							  </div>							 
							</div>
							
						</div> 
						
						<div class="col-md-12  row_margin" style="margin-top:5px">
						
							 <div class="col-md-12">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-2 control-label">Details *</label>
								  <div class="col-md-10 col-xs-11">
									<textarea class="form-control" name="terms_details" id="terms_details" rows="5"><?=$rel['tc_details'];?></textarea>
								  </div>
							  </div>							 
							</div>
							  	
							
						</div>
						
						<div class="col-md-12  row_margin" style="margin-top:5px">
						
							 <div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Category *</label>
								  <div class="col-md-8 col-xs-11">
								  <select class="select2" id="term_category" name="term_category">
										<option value="">--Select Category--</option>
										<?=get_terms_category($dbcon,$rel['tc_category']); ?>
								  </select>
								  </div>
							  </div>							 
							</div>
							  	
							
						</div>
						
						<div class="col-md-12  row_margin" style="margin-top:5px">
							 
							
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">For</label>
								  <div class="col-md-8 col-xs-11">
									<input type="checkbox" name="term_for[]" value="0" <?php if(in_array('0',$for_arr)){ echo "checked"; } ?>  /> <span class="check_span">Domestic</span>
									
									<input type="checkbox" name="term_for[]" value="1" <?php if(in_array('1',$for_arr)){ echo "checked"; } ?>  /> <span  class="check_span">Export</span>
								  </div>
							  </div>
							</div>
							
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Allow To Change *</label>
								  <div class="col-md-8 col-xs-11">
								  <input type="checkbox" name="allow_change" value="1" <?php if($rel['tc_allow']=='1'){ echo "checked"; } ?>  /> <span  class="check_span">Allow To Change </span> 
								  </div>
							  </div>							 
							</div>
							 
						</div>
						
						
						<div class="clearfix" style="margin-bottom:10px;">		
						</div>	
						
						<div class="col-md-5"></div>
						<div class="col-md-4">	
						<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
						<input type='hidden' name='eid' id='eid' value='<?php if($mode=='Edit'){ echo $pro_id; } else { echo "0"; } ?>' />				  
						<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
						<button type="submit" class="btn btn-shadow btn-success" style="box-shadow: 3px 3px #61a642;">Submit</button>
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
<?php include_once('../include/add_productinpro.php');?>  
    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/terms_mst.js"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
 var tableToExcel = (function() {
 var uri = 'data:application/vnd.ms-excel;base64,'
   , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head></head><body><table>{table}</table></body></html>'
   , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
   , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
 return function(table, name) {
   if (!table.nodeType) table = document.getElementById(table)
   var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
   window.location.href = uri + base64(format(template, ctx))
 }
})()
</script>
</body>
</html>