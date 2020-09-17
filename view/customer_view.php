<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Company";
	$cust_id=$dbcon->real_escape_string($_REQUEST['id']);
	
        $cust_query = "SELECT cust.*,address.*, country.country_name, state.state_name, city.city_name
            FROM tbl_customer as cust
            LEFT JOIN tbl_cust_address as address ON address.cust_id = cust.cust_id
            LEFT JOIN country_mst as country ON country.countryid = address.c_add_country
            LEFT JOIN state_mst as state ON state.stateid = address.c_add_state
            LEFT JOIN city_mst as city ON city.cityid = address.c_add_city
            WHERE cust.cust_id = $cust_id
            ";
        
	$rel=mysqli_fetch_assoc($dbcon->query($cust_query));	
        //echo '<pre>';        print_r($rel); //exit;
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
			  <h3>View <?=$mode.' '.$form?>
				<a href="<?=ROOT.'customer_list'?>"><button class="btn btn-info btn-flat pull-right"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back To List</button></a>
			  </h3>
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
        <section class="panel">
            <header class="panel-heading">
                    View <?=$form?>
                    <span class="tools pull-right">		
                            <a href="javascript:;" onClick="tableToExcel('cust_view_div', 'Customer Collection')" ><button class="btn btn-primary btn-flat" >Export Excel</button></a>
                    </span>
            </header>	
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12" id="cust_view_div">
			<table class="display table table-bordered table-striped">
                            <tr>
                                    <td colspan="2" class="text-left">Company Name : <strong><?=$rel['cust_name']?></strong></td> 
                                    
                                    <?php
                                    if($rel['party_type']=='0'){
                                            $party_type='Both';
                                    }
                                    else if($rel['party_type']=='1'){
                                            $party_type='Customer';
                                    }
                                    else if($rel['party_type']=='2'){
                                            $party_type='Vendor';
                                    }
                                    else {
                                            $party_type='';
                                    }
                                    //echo $party_type; ?>
                                    <td colspan="2" class="text-left">Company Type : <?= $party_type ?></td>
<!--                                    <td class="text-left">Business : 
                                        <?php
                                                /*if($rel['business_type']=='1'){
                                                        $business_type='B2B';
                                                }
                                                else if($rel['business_type']=='2'){
                                                        $business_type='B2C';
                                                }
                                                else if($rel['business_type']=='3'){
                                                        $business_type='E-commerce';
                                                } 
                                                else {
                                                        $business_type='';
                                                }
                                        echo $business_type; */
                                        ?>
                                    </td>-->
                                    <?php $address = $rel['c_add_street'].','.$rel['c_add_location']; ?>
                                    </tr>
                                    <tr>
                                            <td colspan="2" class="text-left">Address : <?= $address ?></td>
                                            <td colspan="2" class="text-left">Contact Person Name : <?=($rel['cust_name'])?></td>
                                    </tr>
                                    <tr>
                                            <td class="text-left">City : <?= $rel['city_name']?></td>
                                            <td class="text-left">Pin code : <?= $rel['c_add_zip']?></td>
                                            <td class="text-left">State : <?= $rel['state_name']?></td>
                                            <td class="text-left">Country : <?= $rel['country_name']?></td>
                                            
                                    </tr> 
                                    <tr>
                                            <td colspan="2" class="text-left">Mobile No. : <?=$rel['cust_mobile']?></td> 
                                            <td colspan="2" class="text-left">Email : <?=$rel['cust_email']?></td>
                                    </tr> 
                                    <tr>
                                            <td colspan="2" class="text-left">GST No. : <?=$rel['gst_no']?></td>
                                            <td colspan="2" class="text-left">PAN No. : <?=$rel['pan_no']?></td>
<!--                                            <td class="text-left">Opening Balance : <?=$rel['opening_balance'].' '.$rel['shor_name']?></td>-->
                                    </tr>
                                </table>
			
				
				<center><a href="<?=ROOT.'customer_list'?>" type="button" class="btn btn-danger ">Cancel</a></center>
				</div><!--Vendor row end-->	
				</div><!--Vendor row end-->	
			</div>	
		</section>
	
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
<script src="<?=ROOT?>js/app/customer.js"></script>
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
