<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Conversion Rate";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));	
	
	$mode="Add";
	
	
	$c_sel=$dbcon->query("select c.*,cu.currency_name from tbl_company as c inner join tbl_currency as cu on c.comp_per_currency=cu.currency_id where company_id='$_SESSION[company_id]'");

	$row_sel=mysqli_fetch_array($c_sel);
	
	//echo $_SESSION['branch_id'];
	
	$sel_curren=$dbcon->query("select * from tbl_conv_rate where company_id='$_SESSION[company_id]'");
	if(mysqli_num_rows($sel_curren)>0)
	{
		$r_curren=mysqli_fetch_array($sel_curren);
		$date=date("d/m/Y",strtotime($r_curren['conv_st_date']));
		
	}
	else
	{	
		$date="";
	}
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
							  <li class="active"><a href="#"><?=$form?> List </a></li>
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
						<form role="form" id="conv_add" action="javascript:;" method="post" name="conv_add">
						
					<div class="col-md-12 row_margin" style="padding-top: 25px;">
						
						<div class="col-md-12">
						
							<div class="col-md-6">
							  <div class="form-group">
								  <label for="Product Type" class="col-md-4 control-label">Effective Start Date*</label>
								  <div class="col-md-8 col-xs-11">
								  <input type="text"  class="form-control default-date-picker valid required" id="conv_st_date" name="conv_st_date" placeholder="" value="<?=$date;?>" />
								  </div>
							  </div>							 
							</div>
					
							
						</div> 
						
						<div class="col-md-12  row_margin" style="margin-top:5px">
							
							<table class="table table-bordered">
								
								<tr>
									<th>#</th>
									<th>Base Currency</th>
									<th>To Currency</th>
									<th>Currency Rate</th>
								</tr>
							<?php 
								$cnt=1;
								$sel1=$dbcon->query("select o.*,c.currency_name from tbl_org_currency as o left join tbl_currency as c on c.currency_id=o.curren_id"); 
								while($row1=mysqli_fetch_assoc($sel1))
								{
									$sel_curren1=$dbcon->query("select * from tbl_conv_rate where company_id='$_SESSION[company_id]' and loop_count='$cnt'");
									if(mysqli_num_rows($sel_curren1)>0)
									{
										$r_curren1=mysqli_fetch_array($sel_curren1);
										$current_currency=$r_curren1['conv_currency'];
										$conv_rate=$r_curren1['conv_rate'];
									}
							?>
								<tr>
									<th><?php echo $cnt; ?></th>
									<th>
										<input type="hidden" name="conv_base[]"  id="conv_base<?php echo $cnt; ?>" value="<?php echo $row_sel['comp_per_currency']; ?>" required />
										<?php echo $row_sel['currency_name']; ?>
									</th>
									<th>
										<select class="select2" name="conv_currency[]" class="conv_currency" id="conv_currency<?php echo $cnt; ?>">
											<option value="">--Select Currency--</option>
											<?=get_currency($dbcon,$current_currency);?>
										</select>
									</th>
									<th><input type="text" class="form-control" name="c_rate[]" id="c_rate<?php echo $cnt; ?>" value="<?php echo $conv_rate; ?>" required /></th>
								</tr>
								
							<?php $cnt++; } ?>
							
							</table>
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
	<script src="<?=ROOT?>js/app/conv_mst.js"></script>
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
   , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
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