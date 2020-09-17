<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Planning";
	$com="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$comty=mysqli_fetch_assoc($dbcon->query($com));

	if(strpos($_SERVER[REQUEST_URI], "planning_edit")==false) {
		$mode="Add";
		$planning_date=date('d-m-Y');
		$phase1_start_date=date('d-m-Y');
		$phase1_end_date=date('d-m-Y');
		$phase2_start_date=date('d-m-Y');
		$phase2_end_date=date('d-m-Y');
		$phase3_start_date=date('d-m-Y');
		$phase3_end_date=date('d-m-Y');
		$phase4_start_date=date('d-m-Y');
		$phase4_end_date=date('d-m-Y');
		$sales_order_id="";
	}
	else {
		$mode="Edit";
		$planning_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_planning where planning_id=$planning_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$planning_date=date('d-m-Y',strtotime($rel['planning_date']));
		$phase1_start_date=date('d-m-Y',strtotime($rel['phase1_start_date']));
		$phase1_end_date=date('d-m-Y',strtotime($rel['phase1_end_date']));
		$phase2_start_date=date('d-m-Y',strtotime($rel['phase2_start_date']));
		$phase2_end_date=date('d-m-Y',strtotime($rel['phase2_end_date']));
		$phase3_start_date=date('d-m-Y',strtotime($rel['phase3_start_date']));
		$phase3_end_date=date('d-m-Y',strtotime($rel['phase3_end_date']));
		$phase4_start_date=date('d-m-Y',strtotime($rel['phase4_start_date']));
		$phase4_end_date=date('d-m-Y',strtotime($rel['phase4_end_date']));
		$sales_order_id=$rel['sales_order_id'];
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
<style>
input[type=radio]{
	width: 16px;
    height: 16px;
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
	<h3><?=$mode.' '.$form?>
		<!--<a href="<?=ROOT.'import_product'?>" >
		<button class="btn btn-primary btn-flat pull-right">Import <?=$form?></button></a>-->
	</h3>
</header>	
<div class="">
	<ul class="breadcrumb">
		<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
		<li class="active"><a href="<?=ROOT.'planning_list'?>"><?=$form?> List </a></li>
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
	<form class="form-horizontal" role="form" id="planning_add" action="javascript:;" method="post" name="planning_add">
		
		<div class="col-md-12">
			
				<div class="col-md-6">
					<div class="form-group">
						<label for="planning_no" class="col-md-4 control-label">Planning No.*</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="planning_no" name="planning_no" value="<?=$rel['planning_no']?>">
						</div>
					</div>							 
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="planning_date" class="col-md-4 control-label">Planning Date*</label>
						<div class="col-md-8">
							<input type="text" class="form-control default-date-picker required valid" id="planning_date" name="planning_date" value="<?=$planning_date?>">
						</div>
					</div>							 
				</div>
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="sales_order_id" class="col-md-4 control-label">Sales Order*</label>
					<div class="col-md-8">
						<select class="select2" id="sales_order_id" name="sales_order_id" onchange="load_quot_name(this.value)">
							<?=get_sales_order_plan($dbcon,$sales_order_id,$mode);?>
						</select>
						
					</div>
				</div>							 
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="planning_name" class="col-md-4 control-label">Project Name*</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="planning_name" name="planning_name" placeholder="Project Name" value="<?=$rel['planning_name']?>">
					</div>
				</div>							 
			</div>
	<div class="clearfix"></div>
	
	<div class="col-md-12">
		<header class="panel-heading breadcrumb text-center">
		   <h3>Phase - 1</h3>
		</header>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-1 control-label" style="font-weight:bold;">Start Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase1_start_date" name="phase1_start_date" title="Choose Start Date" value="<?=$phase1_start_date?>">
				</div>
				<label class="col-md-1 control-label" style="font-weight:bold;">End Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase1_end_date" name="phase1_end_date" title="Choose End Date" value="<?=$phase1_end_date?>">
				</div>
				<label class="col-md-2 control-label" style="font-weight:bold;">Status</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase1_status_yes" name="phase1_status" value="1" <?=($rel['phase1_status']=='1')?'checked':''?>> Done</label>
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase1_status_no" name="phase1_status" value="0" <?=($rel['phase1_status']!='1')?'checked':''?>> Pending</label>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Operational Sheet</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="op_sheet_yes" name="op_sheet" value="1" <?=($rel['op_sheet']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="op_sheet_no" name="op_sheet" value="0" <?=($rel['op_sheet']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="op_sheet_attch" name="op_sheet_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['op_sheet_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['op_sheet_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="op_sheet_remark" name="op_sheet_remark" placeholder="Remark" style="resize:both;"><?=$rel['op_sheet_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Proforma Invoice-1</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="pfi_inv1_yes" name="pfi_inv1" value="1" <?=($rel['pfi_inv1']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="pfi_inv1_no" name="pfi_inv1" value="0" <?=($rel['pfi_inv1']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="pfi_inv1_attch" name="pfi_inv1_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['pfi_inv1_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['pfi_inv1_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="pfi_inv1_remark" name="pfi_inv1_remark" placeholder="Remark" style="resize:both;"><?=$rel['pfi_inv1_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Proforma Invoice-2</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="pfi_inv2_yes" name="pfi_inv2" value="1" <?=($rel['pfi_inv2']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="pfi_inv2_no" name="pfi_inv2" value="0" <?=($rel['pfi_inv2']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="pfi_inv2_attch" name="pfi_inv2_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['pfi_inv2_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['pfi_inv2_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="pfi_inv2_remark" name="pfi_inv2_remark" placeholder="Remark" style="resize:both;"><?=$rel['pfi_inv2_remark']?></textarea>
				</div>
			</div>							 
		</div>
		
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Proforma Invoice-3</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="budget_sheet_yes" name="budget_sheet" value="1" <?=($rel['budget_sheet']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="budget_sheet_no" name="budget_sheet" value="0" <?=($rel['budget_sheet']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="budget_sheet_attch" name="budget_sheet_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['budget_sheet_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['budget_sheet_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="budget_sheet_attch_remark" name="budget_sheet_attch_remark" placeholder="Remark" style="resize:both;"><?=$rel['budget_sheet_attch_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Process Flow Diagram</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="process_flow_dg_yes" name="process_flow_dg" value="1" <?=($rel['process_flow_dg']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="process_flow_dg_no" name="process_flow_dg" value="0" <?=($rel['process_flow_dg']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="process_flow_dg_attch" name="process_flow_dg_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['process_flow_dg_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['process_flow_dg_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="process_flow_dg_remark" name="process_flow_dg_remark" placeholder="Remark" style="resize:both;"><?=$rel['process_flow_dg_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Civil G A Layout</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="civil_layout_yes" name="civil_layout" value="1" <?=($rel['civil_layout']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="civil_layout_no" name="civil_layout" value="0" <?=($rel['civil_layout']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="civil_layout_attch" name="civil_layout_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['civil_layout_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['civil_layout_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="civil_layout_remark" name="civil_layout_remark" placeholder="Remark" style="resize:both;"><?=$rel['civil_layout_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Section Drawing</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="section_drawing_yes" name="section_drawing" value="1" <?=($rel['section_drawing']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="section_drawing_no" name="section_drawing" value="0" <?=($rel['section_drawing']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="section_drawing_attch" name="section_drawing_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['section_drawing_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['section_drawing_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="section_drawing_remark" name="section_drawing_remark" placeholder="Remark" style="resize:both;"><?=$rel['section_drawing_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Fabrication drawing</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="fab_drawing_yes" name="fab_drawing" value="1" <?=($rel['fab_drawing']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="fab_drawing_no" name="fab_drawing" value="0" <?=($rel['fab_drawing']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="fab_drawing_attch" name="fab_drawing_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['fab_drawing_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['fab_drawing_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="fab_drawing_remark" name="fab_drawing_remark" placeholder="Remark" style="resize:both;"><?=$rel['fab_drawing_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">P & ID</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="p_and_id_yes" name="p_and_id" value="1" <?=($rel['p_and_id']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="p_and_id_no" name="p_and_id" value="0" <?=($rel['p_and_id']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="p_and_id_attch" name="p_and_id_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['p_and_id_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['p_and_id_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="p_and_id_remark" name="p_and_id_remark" placeholder="Remark" style="resize:both;"><?=$rel['p_and_id_remark']?></textarea>
				</div>
			</div>							 
		</div>
		
		
	</div>
	<div class="col-md-12">
		<header class="panel-heading breadcrumb text-center">
		   <h3>Phase - 2</h3>
		</header>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-1 control-label" style="font-weight:bold;">Start Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase2_start_date" name="phase2_start_date" title="Choose Start Date" value="<?=$phase2_start_date?>">
				</div>
				<label class="col-md-1 control-label" style="font-weight:bold;">End Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase2_end_date" name="phase2_end_date" title="Choose End Date" value="<?=$phase2_end_date?>">
				</div>
				<label class="col-md-2 control-label" style="font-weight:bold;">Status</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase2_status_yes" name="phase2_status" value="1" <?=($rel['phase2_status']=='1')?'checked':''?>> Done</label>
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase2_status_no" name="phase2_status" value="0" <?=($rel['phase2_status']!='1')?'checked':''?>> Pending</label>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Purchase</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="purchase_bill_yes" name="purchase_bill" value="1" <?=($rel['purchase_bill']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="purchase_bill_no" name="purchase_bill" value="0" <?=($rel['purchase_bill']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="purchase_bill_attch" name="purchase_bill_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['purchase_bill_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['purchase_bill_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="purchase_bill_remark" name="purchase_bill_remark" placeholder="Remark" style="resize:both;"><?=$rel['purchase_bill_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Inspection Status</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="inspection_status_yes" name="inspection_status" value="1" <?=($rel['inspection_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="inspection_status_no" name="inspection_status" value="0" <?=($rel['inspection_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="inspection_attch" name="inspection_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['inspection_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['inspection_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="inspection_remark" name="inspection_remark" placeholder="Remark" style="resize:both;"><?=$rel['inspection_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
<!-- Accordian Start -->			
<div class="panel-group m-bot20" id="accordion2">
	<div class="panel panel-default">
		
		<div id="main_div1" style="border: 1px solid;">	
		  <div class="panel-heading" style="padding-bottom: 20px;">
			  <h3 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#divcnt2">
					BOM Product Planning <i class="fa fa-chevron-down"></i>
				</a>
			  </h3>
		  </div> 
		  <div id="divcnt2" class="panel-collapse collapse">
			  <div class="panel-body">
				<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
					<thead>
						<tr>
							<th width="45%">Item Details</th>
							<th width="15%">Quantity</th>
							<th width="15%">Start Date</th>
							<th width="15%">End Date</th>
							<th width="10%">Status</th>
						</tr>
					</thead>
					<tbody>
			<?
				$k=1;
				 $bom_query="select trn.*,pro.product_name,unit.unit_name from tbl_bom_trn as trn
					left join tbl_product as pro on pro.product_id=trn.req_product_id 
					left join unit_mst as unit on unit.unitid=trn.req_unitid
					where bom_trn_status=0 and trn.bom_id=(select bom_id from tbl_bom where bom_status=0 and sales_order_id='".$rel['sales_order_id']."') order by bom_trn_id DESC";
				$bom_query_rs=$dbcon->query($bom_query);
				while($bom_rel=mysqli_fetch_assoc($bom_query_rs)){
					$plantrn_start_date='';$plantrn_end_date='';
					if($bom_rel['plantrn_start_date']!="1970-01-01" && $bom_rel['plantrn_start_date']!="0000-00-00"){
						$plantrn_start_date=date('d-m-Y',strtotime($bom_rel['plantrn_start_date']));
					}
					if($bom_rel['plantrn_end_date']!="1970-01-01" && $bom_rel['plantrn_end_date']!="0000-00-00"){
						$plantrn_end_date=date('d-m-Y',strtotime($bom_rel['plantrn_end_date']));
					}
				
			?>
			<tr>
				<td style="vertical-align: center;text-align:left;"><strong><?=$bom_rel['product_name']?></strong>
				<br/><?=nl2br($bom_rel['req_product_desc'])?>
					<input type="hidden" id="bom_trn_id<?=$k?>" name="bom_trn_id[]" value="<?=$bom_rel['bom_trn_id']?>">
				</td>
				<td style="vertical-align: center;text-align:left;"><?=$bom_rel['req_product_qty'].' '.$bom_rel['unit_name']?></td>
				<td style="vertical-align: center;text-align:left;">
					<input type="text" class="form-control default-date-picker valid" id="plantrn_start_date<?=$k?>" name="plantrn_start_date[]" title="Choose Start Date" value="<?=$plantrn_start_date?>">
				</td>
				<td style="vertical-align: center;text-align:left;">
					<input type="text" class="form-control default-date-picker valid" id="plantrn_end_date<?=$k?>" name="plantrn_end_date[]" title="Choose End Date" value="<?=$plantrn_end_date?>">
				</td>
				<td style="vertical-align: center;text-align:center;">
					<select class="select2" id="plantrn_status<?=$k?>" name="plantrn_status[]">
						<option value="0" <?=($bom_rel['plantrn_status']!='1')?'selected':''?>>Pending</option>
						<option value="1" <?=($bom_rel['plantrn_status']=='1')?'selected':''?>>Received</option>
					</select>
				</td>
			</tr>
			<?
				$k++;
				}
			?>
					</tbody>
				</table>
				
			  </div>
		  </div>
		</div>
	
	</div>
</div>
<!-- Accordian End -->
			</div>							 
		</div>
		
	</div>
	
	<div class="col-md-12">
		<header class="panel-heading breadcrumb text-center">
		   <h3>Phase - 3</h3>
		</header>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-1 control-label" style="font-weight:bold;">Start Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase3_start_date" name="phase3_start_date" title="Choose Start Date" value="<?=$phase3_start_date?>">
				</div>
				<label class="col-md-1 control-label" style="font-weight:bold;">End Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase3_end_date" name="phase3_end_date" title="Choose End Date" value="<?=$phase3_end_date?>">
				</div>
				<label class="col-md-2 control-label" style="font-weight:bold;">Status</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase3_status_yes" name="phase3_status" value="1" <?=($rel['phase3_status']=='1')?'checked':''?>> Done</label>
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase3_status_no" name="phase3_status" value="0" <?=($rel['phase3_status']!='1')?'checked':''?>> Pending</label>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Dispatch</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="dispatch_status_yes" name="dispatch_status" value="1" <?=($rel['dispatch_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="dispatch_status_no" name="dispatch_status" value="0" <?=($rel['dispatch_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="dispatch_status_attch" name="dispatch_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['dispatch_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['dispatch_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="dispatch_status_remark" name="dispatch_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['dispatch_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Transportation</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="transport_status_yes" name="transport_status" value="1" <?=($rel['transport_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="transport_status_no" name="transport_status" value="0" <?=($rel['transport_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="transport_status_attch" name="transport_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['transport_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['transport_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="transport_status_remark" name="transport_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['transport_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Tax Invoice</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="tax_inv_status_yes" name="tax_inv_status" value="1" <?=($rel['tax_inv_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="tax_inv_status_no" name="tax_inv_status" value="0" <?=($rel['tax_inv_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="tax_inv_status_attch" name="tax_inv_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['tax_inv_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['tax_inv_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="tax_inv_status_remark" name="tax_inv_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['tax_inv_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Sales Delivery Challan</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="del_challan_status_yes" name="del_challan_status" value="1" <?=($rel['del_challan_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="del_challan_status_no" name="del_challan_status" value="0" <?=($rel['del_challan_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="del_challan_status_attch" name="del_challan_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['del_challan_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['del_challan_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="del_challan_status_remark" name="del_challan_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['del_challan_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">E Way Bill</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="eway_bill_status_yes" name="eway_bill_status" value="1" <?=($rel['eway_bill_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="eway_bill_status_no" name="eway_bill_status" value="0" <?=($rel['eway_bill_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="eway_bill_status_attch" name="eway_bill_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['eway_bill_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['eway_bill_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="eway_bill_status_remark" name="eway_bill_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['eway_bill_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		
	</div>
	
	<div class="col-md-12">
		<header class="panel-heading breadcrumb text-center">
		   <h3>Phase - 4</h3>
		</header>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-1 control-label" style="font-weight:bold;">Start Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase4_start_date" name="phase4_start_date" title="Choose Start Date" value="<?=$phase4_start_date?>">
				</div>
				<label class="col-md-1 control-label" style="font-weight:bold;">End Date*</label>
				<div class="col-md-2">
					<input type="text" class="form-control default-date-picker required valid" id="phase4_end_date" name="phase4_end_date" title="Choose End Date" value="<?=$phase4_end_date?>">
				</div>
				<label class="col-md-2 control-label" style="font-weight:bold;">Status</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase4_status_yes" name="phase4_status" value="1" <?=($rel['phase4_status']=='1')?'checked':''?>> Done</label>
					<label style="font-weight:bold;font-size:20px;"><input type="radio" id="phase4_status_no" name="phase4_status" value="0" <?=($rel['phase4_status']!='1')?'checked':''?>> Pending</label>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Installation</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="install_status_yes" name="install_status" value="1" <?=($rel['install_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="install_status_no" name="install_status" value="0" <?=($rel['install_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="install_status_attch" name="install_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['install_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['install_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="install_status_remark" name="install_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['install_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Commissioning</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="commission_status_yes" name="commission_status" value="1" <?=($rel['commission_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="commission_status_no" name="commission_status" value="0" <?=($rel['commission_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="commission_status_attch" name="commission_status_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['commission_status_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['commission_status_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="commission_status_remark" name="commission_status_remark" placeholder="Remark" style="resize:both;"><?=$rel['commission_status_remark']?></textarea>
				</div>
			</div>							 
		</div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label" style="font-weight:bold;">Plant Hand Over</label>
				<div class="col-md-2 text-center">
					<label style="font-weight:bold;"><input type="radio" id="plant_handover_status_yes" name="plant_handover_status" value="1" <?=($rel['plant_handover_status']=='1')?'checked':''?>> Yes</label>
					<label style="font-weight:bold;"><input type="radio" id="plant_handover_status_no" name="plant_handover_status" value="0" <?=($rel['plant_handover_status']!='1')?'checked':''?>> No</label>
				</div>
				<div class="col-md-2">
					<input type="file" class="form-control" id="plant_handover_attch" name="plant_handover_attch">
				</div>
				<div class="col-md-1">
					<?if($rel['plant_handover_attch']){?>
						<a href="<?=ROOT.PLAN_ATTACH_VWING.$rel['plant_handover_attch']?>" class="btn btn-primary" title="View Attachment" target="_blank"><i class="fa fa-eye"></i></a>
					<?}?>
				</div>
				<div class="col-md-5">
					<textarea class="form-control" id="plant_handover_remark" name="plant_handover_remark" placeholder="Remark" style="resize:both;"><?=$rel['plant_handover_remark']?></textarea>
				</div>
			</div>							 
		</div>
		
	</div>
	
	
	<div class="clearfix"></div>	
	
	
	<div class="clearfix" style="margin-bottom:10px;"></div>	
			
			<div class="col-md-12 text-center">					  
				<input type='hidden' name='eid' id='eid' value='<?=$rel['planning_id']?>' />				  
				<input type='hidden' name='mode' id='mode' value='<?php echo $mode; ?>' />				  
				<button type="submit" id="submit_btn" class="btn btn-shadow btn-success">Submit</button>
				<a class="btn btn-shadow btn-danger" href="<?=ROOT.'planning_list'?>">Cancel</a>
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
<script src="<?=ROOT?>js/app/planning.js"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
<?if($mode=='Add'){?>
	load_planning_no();
<?}
else{?>
	$('#sales_order_id').select2("readonly",true);
<?}?>
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
});
</script>
</body>
</html>