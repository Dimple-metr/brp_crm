<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php"); 
	$form="Company";
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
                                    <header class="panel-heading">
                                        <div class="col-md-12">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-4 control-label">Company Type*</label>
                                                    <div class="col-md-8"> 
                                                        <label class="col-md-4 col-sm-6 " style="font-weight:bold;">
                                                            <input type="radio" class="form-control" id="party_type_both" name="party_type" value="0" onchange="load_cust_datatable()" checked style="width: 15px;height: 15px;"> ALL 
                                                        </label>
                                                        <label class="col-md-4 col-sm-6" style="font-weight:bold;">
                                                            <input type="radio" class="form-control" id="party_type_cust" name="party_type" value="1" onchange="load_cust_datatable()" style="width: 15px;height: 15px;"> Customer
                                                        </label>
                                                        <label class="col-md-4 col-sm-6" style="font-weight:bold;">
                                                            <input type="radio" class="form-control" id="party_type_ven" name="party_type" value="2" onchange="load_cust_datatable()" style="width: 15px;height: 15px;"> Vendor
                                                        </label>
                                                    </div>
                                                </div>	
                                            </div>
                                        </div>
			
			<div class="clearfix"></div>
			<span class="tools pull-right">
				<a href="<?=ROOT.'customer'?>" ><button class="btn btn-success btn-flat" >Add <?=$form?></button></a>	
				<a href="<?=ROOT.'customer_import'?>"  ><button class="btn btn-primary btn-flat" >Import <?=$form?></button></a>
				<a href="javascript:;" onClick="tableToExcel('dynamic-table', 'Party Data')" ><button class="btn btn-info btn-flat" >Export Excel</button></a>
			</span>
				
				 
					</header>	
					 <div class="panel-body">
				  <div class="adv-table" id="adv-table">
				  <table  class="display table table-bordered table-striped" id="dynamic-table">
				  <thead>
				  <tr>
						<th>Sr.</th>
						<th>Type</th>
						<th>Company Name</th>
						<th>E-mail</th>
						<th>Mobile</th>
						<th>GST No.</th>
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
	//include_once('../include/view_consignee.php');
	//include_once('../include/add_consignee.php');
?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="js/app/customer.js"></script>
   <!--<script src="js/app/invoice_consignee.js"></script>-->
<script>
$(".select2").select2({
	width: '100%'
});	

//load_state(<?=$countryid?>,'con_stateid',<?=$stateid?>)	
//load_city(<?=$stateid?>,'con_cityid',<?=$cityid?>);	

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
