<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="BOM";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	$mode="Add";
	$bom_id=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select * from tbl_bom where bom_id=$bom_id";
	$rel=mysqli_fetch_assoc($dbcon->query($query));	
	$bom_date=date('d-m-Y',strtotime($rel['bom_date']));
	$sales_order_id=$rel['sales_order_id'];
	
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
	<h3><?=$mode.' '.$form?>
		<!--<a href="<?=ROOT.'import_product'?>" >
		<button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
	</h3>
</header>	
<div class="">
	<ul class="breadcrumb">
		<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
		<li class="active"><a href="<?=ROOT.'bom_list'?>"><?=$form?> List </a></li>
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
	<form class="form-horizontal" role="form" id="bom_req_add" action="javascript:;" method="post" name="bom_req_add">
		
		<div class="col-md-12">
			
				<div class="col-md-6">
					<div class="form-group">
						<label for="bom_no" class="col-md-4 control-label">BOM No.*</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="bom_no" name="bom_no" value="<?=$rel['bom_no']?>" readonly>
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="bom_date" class="col-md-4 control-label">BOM Date*</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="bom_date" name="bom_date" value="<?=$bom_date?>" readonly>
						</div>
					</div>							 
				</div>
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="sales_order_id" class="col-md-4 control-label">Sales Order*</label>
					<div class="col-md-8">
						<select class="select2" id="sales_order_id" name="sales_order_id" onchange="load_sales_order_data(this.value)">
							<?=get_sales_order($dbcon,$sales_order_id,'Edit');?>
						</select>
					</div>
				</div>							 
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="so_trn_id" class="col-md-4 control-label">Sales Product*</label>
					<div class="col-md-8">
						<select class="select2" id="so_trn_id" name="so_trn_id" onchange="load_sales_order_trn(this.value);">
							<?=get_sales_order_trn($dbcon,$rel['so_trn_id'],$sales_order_id);?>
						</select>
					</div>
				</div>							 
			</div>
	
	<div class="clearfix"></div>
	<div class="col-md-12" style="margin-top:15px;"></div>
	<div class="col-md-12">
		<div class="form-group">
			<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
				<tr>
					<th width="3%" class="text-center">Sr.<br/>No.</th>
					<th width="35%" class="text-center">Item Details</th>
					<th width="15%" class="text-center">Quantity</th>
					<th width="10%" class="text-center">Rate</th>
					<th width="10%" class="text-center">Amount</th>
					<th width="10%" class="text-center">Current Stock</th>
					<th width="10%" class="text-center">Out of Stock</th>
					<th width="7%" class="text-center">
						<input type="checkbox" id="all_chk_box" onclick="load_chk_box()" style="width: 23px;height: 23px;margin-top: 0px;">
						
						<button type="button" onclick="req_po_qty();" class="btn btn-primary" title="Request PO for Due Products">PO <i class="fa fa-send"></i></button> 
					</th>
				</tr>
				<tbody>
	<?
		/*$query="select trn.*,pro.product_name,unit.unit_name, (select sum(product_qty) from tbl_purchase_trn where purchase_trn_status=0 and product_id=trn.req_product_id) as pur_qty, (select sum(req_product_qty) from tbl_bom_trn where bom_trn_status=0 and req_product_id=trn.req_product_id) as bom_qty, (select sum(product_qty) from tbl_invoice_trn where invoice_trn_status=0 and product_id=trn.req_product_id) as inv_qty from tbl_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_trn_status=0 and trn.bom_id=".$rel['bom_id']." order by bom_trn_id DESC";*/
		$query="select trn.*,pro.product_name,unit.unit_name from tbl_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_trn_status=0 and trn.bom_id=".$rel['bom_id']." order by bom_trn_id DESC";
			
			$result=$dbcon->query($query);
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
	?>			
			<tr> 
				<td style="vertical-align:top;text-align:center;"><?=$i?></td>
				<td style="vertical-align:top;">
					<strong><?=$rel['product_name']?></strong><br/>
					<strong>Desc:</strong> <?=(nl2br($rel['req_product_desc']))?>
				</td>
				<td style="vertical-align:top;" class="text-center">
					<?=$rel['req_product_qty'].' '.$rel['unit_name']?>
				</td>
				<td style="vertical-align:top;" class="text-right">
					<?=$rel['req_product_rate']?>
				</td>
				<td style="vertical-align:top;" class="text-right">
					<?=$rel['req_product_amount']?>
					<input type="hidden" name="req_product_amount_ttl[]" value="<?=$rel['req_product_amount']?>">
				</td>
				<td style="vertical-align:top;" class="text-right">
					<?
$cur_stk=(get_product_stockqty($dbcon,$rel['req_product_id']));
	
					echo $cur_stk;
					?>
				</td>
				<td style="vertical-align:top;" class="text-right">
					<?
						$out_stk=($rel['req_product_qty'])-($cur_stk);
						if((($rel['req_product_qty'])-($cur_stk))<0){
							$out_stk=0;
						}
						echo $out_stk;
					?>
					<input type="hidden" id="out_stk<?=$i?>" name="out_stk[]" value="<?=$out_stk?>">
				</td>
				<td style="vertical-align:top"> 
					<?
						$req_status_disp="";$bom_trn_id_value=$rel['bom_trn_id'];
						if($rel['req_status']=='1'){
							$req_status_disp="display:none;";
							echo '<strong>Requestd</strong>';
							$bom_trn_id_value=0;
						}
						
						//Hide if not out of stock
						if(!$out_stk){
							$req_status_disp="display:none;";
							$bom_trn_id_value=0;
						}
					?>
					<input type="checkbox" class="form-control chk_box" id="trn_id<?=$rel['bom_trn_id']?>" name="bom_trn_id[]" value="<?=$bom_trn_id_value?>" style="<?=$req_status_disp?>">
				</td>	
				</tr>
	<?			
				$i++;
			}
		}
		else{
	?>	
			<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>
	<?	}
	?>
				</tbody>
			</table>	
		</div> 
	</div> 
			
	<div class="clearfix" style="margin-bottom:10px;"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['bom_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<!--<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Submit</button>-->
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'bom_list'?>">Cancel</a>
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
<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/bom.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
$('#sales_order_id').select2('readonly',true);
$('#so_trn_id').select2('readonly',true);

</script>
</body>
</html>