<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/common_functions.php");
	$form="G.R.N.";
	$grn_id=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select grn.*,cust.company_name,branch.branch_name,po.purchaseorder_no from tbl_grn as grn 
		left join tbl_customer as cust on cust.cust_id=grn.vender_id
		left join branch_mst as branch on branch.branch_id=grn.branch_id
		left join tbl_purchaseorder as po on po.purchaseorder_id=grn.purchaseorder_id
		where grn.grn_id=$grn_id";
	$rel=mysqli_fetch_assoc($dbcon->query($query));		
	$ref_date='';
	if($rel['ref_date']!="1970-01-01" && $rel['ref_date']!="0000-00-00" && $rel['ref_date']!="") {
		$ref_date=date('d-m-Y',strtotime($rel['ref_date']));
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
<div class="row">
	<div class="col-lg-12">
		<!--breadcrumbs start -->
		<section class="panel">
			<header class="panel-heading">
				<span class="tools pull-right">
					<a href="<?=ROOT.'grn_list'?>"><button class="btn btn-danger btn-flat pull-right"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back To List</button></a>
				</span> 
				<h3>View <?=$mode.' '.$form?></h3>
			</header>
			<div class="">
				<ul class="breadcrumb">
					<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
					<li><a href="<?=ROOT.'grn_list'?>"><?=$form?> List</a></li>
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
				<?if($_SESSION['user_type'] == 2){?>
				<span class="tools pull-right">		
					<a href="javascript:;" onClick="tableToExcel('lead_grn_div', 'GRN Data')" ><button class="btn btn-primary btn-flat" >Export Excel</button></a>
				</span>
				<?}?>
			</header>	
			<div class="panel-body">
				<div class="row">
				<div class="col-md-12" id="lead_grn_div">
					<table class="display table table-bordered table-striped">
						<tr>
							<td colspan="2" class="text-left">G.R.N. No. : <strong><?=$rel['grn_no']?></strong></td>
							<td colspan="2" class="text-left">G.R.N. Date : <?=date('d-m-Y',strtotime($rel['grn_date']))?></td>
						</tr>
						<tr>
							<td colspan="2" class="text-left">Ref No. : <strong><?=$rel['ref_no']?></strong></td>
							<td colspan="2" class="text-left">Ref Date : <?=$ref_date?></td>
						</tr>
						<tr>
							<td colspan="4" class="text-left">Vendor : <?=$rel['company_name']?></td> 
						</tr>
						<tr>
							<td colspan="2" class="text-left">PO No. : <?=$rel['purchaseorder_no']?></td>
							<td colspan="2" class="text-left">Branch : <?=$rel['branch_name']?></td>
						</tr>
						<tr>
							<td colspan="4" class="text-left">Remark : <?=nl2br($rel['remark'])?></td> 
						</tr> 
					<?if($rel['grn_file']){?>
						<tr>
							<td colspan="4" class="text-left">Receipt : <a href="<?=ROOT.RECEIPT_FILE_VWING.$rel['grn_file']?>" class="btn btn-sm btn-primary" target="_blank"><i class="fa fa-eye"></i> View</a></td> 
						</tr>
					<?}?>
					</table>
					
				<h3 class="text-center" style="margin-top: 20px;">Product List</h3>
					
				<div class="col-md-12">
					<table class="display table table-bordered table-striped">
						<thead>
							<tr>
								<th class="text-center">PO</th>
								<th class="text-center">Product Detail</th>
								<th class="text-center">Mfg. Date</th>
								<th class="text-center">Exp. Date</th>
								<th class="text-center">Quantity</th>
								<th class="text-center">Per</th>
							</tr>
						</thead>
						<tbody>
				<?
					$grntrn_qry="select mst.*,pro.product_name,cat.unit_name from tbl_grn_trn as mst
						left join tbl_product as pro on pro.product_id=mst.product_id
						left join unit_mst as cat on cat.unitid=mst.unit_id  
						where grn_trn_status=0 and mst.grn_id=".$rel['grn_id'];
					$grntrn_rs=($dbcon->query($grntrn_qry));
					if(mysqli_num_rows($grntrn_rs)){
						$p=1;
						while($trn_rel=mysqli_fetch_assoc($grntrn_rs)){
							$pro_exp_date='';$pro_mfg_date='';
							if($trn_rel['pro_mfg_date']!="1970-01-01" && $trn_rel['pro_mfg_date']!="0000-00-00") {
								$pro_mfg_date=date('d-m-Y',strtotime($trn_rel['pro_mfg_date']));
							}
							if($trn_rel['pro_exp_date']!="1970-01-01" && $trn_rel['pro_exp_date']!="0000-00-00") {
								$pro_exp_date=date('d-m-Y',strtotime($trn_rel['pro_exp_date']));
							}
				?>
						<tr>
							<td class="text-center"><?=$p?></td>
							<td style="vertical-align:top;">
								<?=$trn_rel['product_name'].'
							'.(!empty($trn_rel['description'])?'<br/><strong>Desc.</strong> :'.nl2br($trn_rel['description']):'')?>
							</td>
							<td style="vertical-align:top;" class="text-center">
								<?=$pro_mfg_date?>
							</td>
							<td style="vertical-align:top;" class="text-center">
								<?=$pro_exp_date?>
							</td>
							<td style="vertical-align:top;" class="text-center">
								<?=$trn_rel['product_qty']?>
							</td>
							<td style="vertical-align:top" class="text-center">
								<?=$trn_rel['unit_name']?>
							</td>
						</tr>
				<?		
						$p++;
						}
					}
					else{
						echo "<tr><td colspan='2' class='text-center'>NO DATA FOUND</td></tr>";
					}
				?>
						</tbody>
					</table>
				</div>
				
					<input type="hidden" name="grn_no" id="grn_no" value="<?=$rel['grn_no']?>">
				</div><!--Vendor row end-->	
				<center><a href="<?=ROOT.'grn_list'?>" type="button" class="btn btn-danger ">Cancel</a></center>
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
<script src="<?=ROOT?>js/app/grn.js"></script>
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
	return function(table, name,id) {
		if (!table.nodeType) table = document.getElementById(table)
		var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
		//window.location.href = uri + base64(format(template, ctx))
	
	var lidviewid= $('#grn_no').val();
	var link = document.createElement("a");
    link.download = "GRNview-#"+lidviewid + ".xls";
    link.href = uri + base64(format(template, ctx));
    link.click();
	}
})()
</script> 
</body>
</html> 