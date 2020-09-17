<?php

session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");

//print_r($_POST);
if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}
	
	if(strtolower($POST['mode']) == "fetch") {
		
		$edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);
		$delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);
		
		$s_date=explode(' - ',$POST['date']);
		$_SESSION['start']=$s_date[0];
		$_SESSION['end']=$s_date[1];
		
		$where='';
		$where.="  and plan.planning_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND plan.planning_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('plan.planning_id', 'plan.planning_no', 'plan.planning_date', 'plan.planning_name', 'so.sales_order_no', 'plan.plan_per', 'plan.cdate','plan.planning_status','plan.user_id','plan.sales_order_id');
		$sIndexColumn = "plan.planning_id";
		$isWhere = array("plan.planning_status=0 ".$where." and plan.company_id in (0,$_SESSION[company_id])");
		$sTable = "tbl_planning as plan";
		$isJOIN = array('left join tbl_sales_order as so on so.sales_order_id=plan.sales_order_id');
		$hOrder = "plan.planning_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['planning_no'];
			$row_data[] = date('d M, Y',strtotime($row['planning_date']));
			$row_data[] = $row['planning_name'];
			$row_data[] = $row['sales_order_no'];
			$row_data[] = $row['plan_per'].' %';
			
			$edit_btn='';$delete_btn='';
			if($edit_btn_per){
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'planning_edit/'.$row['planning_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_planning('.$row['planning_id'].','.$row['sales_order_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$row_data[] = $edit_btn.' '.$delete_btn; 
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$info['planning_no']			= load_planning_no($dbcon);
		//Update Start series of No
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE status=0 and type_id=5 and company_id=".$_SESSION['company_id']);
		
		$info['planning_date']		= date("Y-m-d",strtotime($POST['planning_date']));
		$info['sales_order_id']		= $POST['sales_order_id'];
		$info['planning_name']		= $_POST['planning_name'];
		
		$info['phase1_start_date']	= date("Y-m-d",strtotime($POST['phase1_start_date']));
		$info['phase1_end_date']	= date("Y-m-d",strtotime($POST['phase1_end_date']));
		$info['phase1_status']		= $POST['phase1_status'];
		$info['op_sheet']			= $POST['op_sheet'];
		if(!empty($_FILES['op_sheet_attch']['tmp_name'])) {
			$info['op_sheet_attch'] = upload_plan_attch($_FILES['op_sheet_attch']);
		}
		$info['op_sheet_remark']	= $_POST['op_sheet_remark'];
		$info['budget_sheet']		= $POST['budget_sheet'];
		if(!empty($_FILES['budget_sheet_attch']['tmp_name'])) {
			$info['budget_sheet_attch'] = upload_plan_attch($_FILES['budget_sheet_attch']);
		}
		$info['budget_sheet_attch_remark']	= $_POST['budget_sheet_attch_remark'];
		$info['pfi_inv1']		= $POST['pfi_inv1'];
		if(!empty($_FILES['pfi_inv1_attch']['tmp_name'])) {
			$info['pfi_inv1_attch'] = upload_plan_attch($_FILES['pfi_inv1_attch']);
		}
		$info['pfi_inv1_remark']	= $_POST['pfi_inv1_remark'];
		$info['pfi_inv2']		= $POST['pfi_inv2'];
		if(!empty($_FILES['pfi_inv2_attch']['tmp_name'])) {
			$info['pfi_inv2_attch'] = upload_plan_attch($_FILES['pfi_inv2_attch']);
		}
		$info['pfi_inv2_remark']	= $_POST['pfi_inv2_remark'];
		$info['process_flow_dg']		= $POST['process_flow_dg'];
		if(!empty($_FILES['process_flow_dg_attch']['tmp_name'])) {
			$info['process_flow_dg_attch'] = upload_plan_attch($_FILES['process_flow_dg_attch']);
		}
		$info['process_flow_dg_remark']	= $_POST['process_flow_dg_remark'];
		$info['civil_layout']		= $POST['civil_layout'];
		if(!empty($_FILES['civil_layout_attch']['tmp_name'])) {
			$info['civil_layout_attch'] = upload_plan_attch($_FILES['civil_layout_attch']);
		}
		$info['civil_layout_remark']	= $_POST['civil_layout_remark'];
		$info['section_drawing']		= $POST['section_drawing'];
		if(!empty($_FILES['section_drawing_attch']['tmp_name'])) {
			$info['section_drawing_attch'] = upload_plan_attch($_FILES['section_drawing_attch']);
		}
		$info['section_drawing_remark']	= $_POST['section_drawing_remark'];
		$info['fab_drawing']		= $POST['fab_drawing'];
		if(!empty($_FILES['fab_drawing_attch']['tmp_name'])) {
			$info['fab_drawing_attch'] = upload_plan_attch($_FILES['fab_drawing_attch']);
		}
		$info['fab_drawing_remark']	= $_POST['fab_drawing_remark'];
		$info['p_and_id']		= $POST['p_and_id'];
		if(!empty($_FILES['p_and_id_attch']['tmp_name'])) {
			$info['p_and_id_attch'] = upload_plan_attch($_FILES['p_and_id_attch']);
		}
		$info['p_and_id_remark']	= $_POST['p_and_id_remark'];
		
		$info['phase2_start_date']	= date("Y-m-d",strtotime($POST['phase2_start_date']));
		$info['phase2_end_date']	= date("Y-m-d",strtotime($POST['phase2_end_date']));
		$info['phase2_status']		= $POST['phase2_status'];
		$info['purchase_bill']		= $POST['purchase_bill'];
		if(!empty($_FILES['purchase_bill_attch']['tmp_name'])) {
			$info['purchase_bill_attch'] = upload_plan_attch($_FILES['purchase_bill_attch']);
		}
		$info['purchase_bill_remark']	= $_POST['purchase_bill_remark'];
		$info['inspection_status']		= $POST['inspection_status'];
		if(!empty($_FILES['inspection_attch']['tmp_name'])) {
			$info['inspection_attch'] = upload_plan_attch($_FILES['inspection_attch']);
		}
		$info['inspection_remark']	= $_POST['inspection_remark'];
		
		$info['phase3_start_date']	= date("Y-m-d",strtotime($POST['phase3_start_date']));
		$info['phase3_end_date']	= date("Y-m-d",strtotime($POST['phase3_end_date']));
		$info['phase3_status']		= $POST['phase3_status'];
		$info['dispatch_status']		= $POST['dispatch_status'];
		if(!empty($_FILES['dispatch_status_attch']['tmp_name'])) {
			$info['dispatch_status_attch'] = upload_plan_attch($_FILES['dispatch_status_attch']);
		}
		$info['dispatch_status_remark']	= $_POST['dispatch_status_remark'];
		$info['transport_status']		= $POST['transport_status'];
		if(!empty($_FILES['transport_status_attch']['tmp_name'])) {
			$info['transport_status_attch'] = upload_plan_attch($_FILES['transport_status_attch']);
		}
		$info['transport_status_remark']	= $_POST['transport_status_remark'];
		$info['tax_inv_status']		= $POST['tax_inv_status'];
		if(!empty($_FILES['tax_inv_status_attch']['tmp_name'])) {
			$info['tax_inv_status_attch'] = upload_plan_attch($_FILES['tax_inv_status_attch']);
		}
		$info['tax_inv_status_remark']	= $_POST['tax_inv_status_remark'];
		$info['del_challan_status']		= $POST['del_challan_status'];
		if(!empty($_FILES['del_challan_status_attch']['tmp_name'])) {
			$info['del_challan_status_attch'] = upload_plan_attch($_FILES['del_challan_status_attch']);
		}
		$info['del_challan_status_remark']	= $_POST['del_challan_status_remark'];
		$info['eway_bill_status']		= $POST['eway_bill_status'];
		if(!empty($_FILES['eway_bill_status_attch']['tmp_name'])) {
			$info['eway_bill_status_attch'] = upload_plan_attch($_FILES['eway_bill_status_attch']);
		}
		$info['eway_bill_status_remark']	= $_POST['eway_bill_status_remark'];
		
		$info['phase4_start_date']	= date("Y-m-d",strtotime($POST['phase4_start_date']));
		$info['phase4_end_date']	= date("Y-m-d",strtotime($POST['phase4_end_date']));
		$info['phase4_status']		= $POST['phase4_status'];
		$info['install_status']		= $POST['install_status'];
		if(!empty($_FILES['install_status_attch']['tmp_name'])) {
			$info['install_status_attch'] = upload_plan_attch($_FILES['install_status_attch']);
		}
		$info['install_status_remark']	= $_POST['install_status_remark'];
		$info['commission_status']		= $POST['commission_status'];
		if(!empty($_FILES['commission_status_attch']['tmp_name'])) {
			$info['commission_status_attch'] = upload_plan_attch($_FILES['commission_status_attch']);
		}
		$info['commission_status_remark']	= $_POST['commission_status_remark'];
		$info['plant_handover_status']		= $POST['plant_handover_status'];
		if(!empty($_FILES['plant_handover_attch']['tmp_name'])) {
			$info['plant_handover_attch'] = upload_plan_attch($_FILES['plant_handover_attch']);
		}
		$info['plant_handover_remark']	= $_POST['plant_handover_remark'];
		
		//Get Percentage of overall Plan
		$phs_cnt=floatval($POST['phase1_status'])+floatval($POST['phase2_status'])+floatval($POST['phase3_status'])+floatval($POST['phase4_status']);
		$phs_per=floatval($phs_cnt/4)*100;
		$info['plan_per']	= $phs_per;
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		$inserid=add_record('tbl_planning', $info, $dbcon);
		
		//Changes SO Plan Done Status
		$so_plan_qry="Update tbl_sales_order set plan_done_status=1 where sales_order_id=".$POST['sales_order_id'];
		$so_plan_qry_rs=$dbcon->query($so_plan_qry);
		
		
		if($inserid){
			$resp['msg']='1';
		}
		else{
			$resp['msg']='0';
		}
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['planning_no']		= $_POST['planning_no'];
		$info['planning_date']		= date("Y-m-d",strtotime($POST['planning_date']));
		$info['sales_order_id']		= $POST['sales_order_id'];
		$info['planning_name']		= $_POST['planning_name'];
		
		$info['phase1_start_date']	= date("Y-m-d",strtotime($POST['phase1_start_date']));
		$info['phase1_end_date']	= date("Y-m-d",strtotime($POST['phase1_end_date']));
		$info['phase1_status']		= $POST['phase1_status'];
		$info['op_sheet']			= $POST['op_sheet'];
		if(!empty($_FILES['op_sheet_attch']['tmp_name'])) {
			$info['op_sheet_attch'] = upload_plan_attch($_FILES['op_sheet_attch']);
		}
		$info['op_sheet_remark']	= $_POST['op_sheet_remark'];
		$info['budget_sheet']		= $POST['budget_sheet'];
		if(!empty($_FILES['budget_sheet_attch']['tmp_name'])) {
			$info['budget_sheet_attch'] = upload_plan_attch($_FILES['budget_sheet_attch']);
		}
		$info['budget_sheet_attch_remark']	= $_POST['budget_sheet_attch_remark'];
		$info['pfi_inv1']		= $POST['pfi_inv1'];
		if(!empty($_FILES['pfi_inv1_attch']['tmp_name'])) {
			$info['pfi_inv1_attch'] = upload_plan_attch($_FILES['pfi_inv1_attch']);
		}
		$info['pfi_inv1_remark']	= $_POST['pfi_inv1_remark'];
		$info['pfi_inv2']		= $POST['pfi_inv2'];
		if(!empty($_FILES['pfi_inv2_attch']['tmp_name'])) {
			$info['pfi_inv2_attch'] = upload_plan_attch($_FILES['pfi_inv2_attch']);
		}
		$info['pfi_inv2_remark']	= $_POST['pfi_inv2_remark'];
		$info['process_flow_dg']		= $POST['process_flow_dg'];
		if(!empty($_FILES['process_flow_dg_attch']['tmp_name'])) {
			$info['process_flow_dg_attch'] = upload_plan_attch($_FILES['process_flow_dg_attch']);
		}
		$info['process_flow_dg_remark']	= $_POST['process_flow_dg_remark'];
		$info['civil_layout']		= $POST['civil_layout'];
		if(!empty($_FILES['civil_layout_attch']['tmp_name'])) {
			$info['civil_layout_attch'] = upload_plan_attch($_FILES['civil_layout_attch']);
		}
		$info['civil_layout_remark']	= $_POST['civil_layout_remark'];
		$info['section_drawing']		= $POST['section_drawing'];
		if(!empty($_FILES['section_drawing_attch']['tmp_name'])) {
			$info['section_drawing_attch'] = upload_plan_attch($_FILES['section_drawing_attch']);
		}
		$info['section_drawing_remark']	= $_POST['section_drawing_remark'];
		$info['fab_drawing']		= $POST['fab_drawing'];
		if(!empty($_FILES['fab_drawing_attch']['tmp_name'])) {
			$info['fab_drawing_attch'] = upload_plan_attch($_FILES['fab_drawing_attch']);
		}
		$info['fab_drawing_remark']	= $_POST['fab_drawing_remark'];
		$info['p_and_id']		= $POST['p_and_id'];
		if(!empty($_FILES['p_and_id_attch']['tmp_name'])) {
			$info['p_and_id_attch'] = upload_plan_attch($_FILES['p_and_id_attch']);
		}
		$info['p_and_id_remark']	= $_POST['p_and_id_remark'];
		
		$info['phase2_start_date']	= date("Y-m-d",strtotime($POST['phase2_start_date']));
		$info['phase2_end_date']	= date("Y-m-d",strtotime($POST['phase2_end_date']));
		$info['phase2_status']		= $POST['phase2_status'];
		$info['purchase_bill']		= $POST['purchase_bill'];
		if(!empty($_FILES['purchase_bill_attch']['tmp_name'])) {
			$info['purchase_bill_attch'] = upload_plan_attch($_FILES['purchase_bill_attch']);
		}
		$info['purchase_bill_remark']	= $_POST['purchase_bill_remark'];
		$info['inspection_status']		= $POST['inspection_status'];
		if(!empty($_FILES['inspection_attch']['tmp_name'])) {
			$info['inspection_attch'] = upload_plan_attch($_FILES['inspection_attch']);
		}
		$info['inspection_remark']	= $_POST['inspection_remark'];
		
		$info['phase3_start_date']	= date("Y-m-d",strtotime($POST['phase3_start_date']));
		$info['phase3_end_date']	= date("Y-m-d",strtotime($POST['phase3_end_date']));
		$info['phase3_status']		= $POST['phase3_status'];
		$info['dispatch_status']		= $POST['dispatch_status'];
		if(!empty($_FILES['dispatch_status_attch']['tmp_name'])) {
			$info['dispatch_status_attch'] = upload_plan_attch($_FILES['dispatch_status_attch']);
		}
		$info['dispatch_status_remark']	= $_POST['dispatch_status_remark'];
		$info['transport_status']		= $POST['transport_status'];
		if(!empty($_FILES['transport_status_attch']['tmp_name'])) {
			$info['transport_status_attch'] = upload_plan_attch($_FILES['transport_status_attch']);
		}
		$info['transport_status_remark']	= $_POST['transport_status_remark'];
		$info['tax_inv_status']		= $POST['tax_inv_status'];
		if(!empty($_FILES['tax_inv_status_attch']['tmp_name'])) {
			$info['tax_inv_status_attch'] = upload_plan_attch($_FILES['tax_inv_status_attch']);
		}
		$info['tax_inv_status_remark']	= $_POST['tax_inv_status_remark'];
		$info['del_challan_status']		= $POST['del_challan_status'];
		if(!empty($_FILES['del_challan_status_attch']['tmp_name'])) {
			$info['del_challan_status_attch'] = upload_plan_attch($_FILES['del_challan_status_attch']);
		}
		$info['del_challan_status_remark']	= $_POST['del_challan_status_remark'];
		$info['eway_bill_status']		= $POST['eway_bill_status'];
		if(!empty($_FILES['eway_bill_status_attch']['tmp_name'])) {
			$info['eway_bill_status_attch'] = upload_plan_attch($_FILES['eway_bill_status_attch']);
		}
		$info['eway_bill_status_remark']	= $_POST['eway_bill_status_remark'];
		
		
		$info['phase4_start_date']	= date("Y-m-d",strtotime($POST['phase4_start_date']));
		$info['phase4_end_date']	= date("Y-m-d",strtotime($POST['phase4_end_date']));
		$info['phase4_status']		= $POST['phase4_status'];
		$info['install_status']		= $POST['install_status'];
		if(!empty($_FILES['install_status_attch']['tmp_name'])) {
			$info['install_status_attch'] = upload_plan_attch($_FILES['install_status_attch']);
		}
		$info['install_status_remark']	= $_POST['install_status_remark'];
		$info['commission_status']		= $POST['commission_status'];
		if(!empty($_FILES['commission_status_attch']['tmp_name'])) {
			$info['commission_status_attch'] = upload_plan_attch($_FILES['commission_status_attch']);
		}
		$info['commission_status_remark']	= $_POST['commission_status_remark'];
		$info['plant_handover_status']		= $POST['plant_handover_status'];
		if(!empty($_FILES['plant_handover_attch']['tmp_name'])) {
			$info['plant_handover_attch'] = upload_plan_attch($_FILES['plant_handover_attch']);
		}
		$info['plant_handover_remark']	= $_POST['plant_handover_remark'];
		
		//Get Percentage of overall Plan
		$phs_cnt=floatval($POST['phase1_status'])+floatval($POST['phase2_status'])+floatval($POST['phase3_status'])+floatval($POST['phase4_status']);
		$phs_per=floatval($phs_cnt/4)*100;
		$info['plan_per']	= $phs_per;
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		
		$updateid=update_record('tbl_planning', $info,"planning_id=".$POST['eid'] , $dbcon);
		
		//TRN entry data
		foreach ($POST['bom_trn_id'] as $key => $name) 
		{
			$grptrn['plantrn_start_date']		= date("Y-m-d",strtotime($POST['plantrn_start_date'][$key]));
			$grptrn['plantrn_end_date']			= date("Y-m-d",strtotime($POST['plantrn_end_date'][$key]));
			$grptrn['plantrn_status']			= $POST['plantrn_status'][$key];
			if($POST['bom_trn_id'][$key]){
				$updtrnqry=update_record('tbl_bom_trn', $grptrn, "bom_trn_id=".$POST['bom_trn_id'][$key], $dbcon);
			}
		}
		
		if($updateid){
			$resp['msg']='2';
		}
		else{
			$resp['msg']='0';
		}
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['planning_status']='2';
		$updateid=update_record('tbl_planning', $info,"planning_id=".$POST['planning_id'] , $dbcon);
		
		//Changes SO Plan Done Status
		$so_plan_qry="Update tbl_sales_order set plan_done_status=0 where sales_order_id=".$POST['sales_order_id'];
		$so_plan_qry_rs=$dbcon->query($so_plan_qry);
		
		if($updateid){
			echo 1;
		}
		else{
			echo 0;
		}
	}
	else if(strtolower($POST['mode'])== "load_planning_no") {
		echo $resp= load_planning_no($dbcon);
	}
	else if(strtolower($POST['mode'])== "load_quot_name") {
		$qry="SELECT (select quot_subject from tbl_quotation where quotation_id=so.quotation_id) as quot_subject  FROM `tbl_sales_order` as so
			where so.sales_order_id=".$POST['sales_order_id'];
		$rel=mysqli_fetch_assoc($dbcon->query($qry));	
		echo json_encode($rel);
	}


function upload_plan_attch($FILES){	
	$rand=rand(0,999999).time();
	$temp = explode(".", $FILES["name"]);
	$extension = strtolower(end($temp));
	$file_name = $FILES['name'];
	$err = $FILES["tmp_name"];
	$file_name = "plan_attach_".$rand.'.'.$extension;
	move_uploaded_file($err,PLAN_ATTACH_UPING.$file_name);
	return 	$file_name;
}
function load_planning_no($dbcon){
	//Load no by Type ID
	$row=array();
	$query1="select * from tbl_invoicetype where status=0 and type_id=5 and company_id=".$_SESSION['company_id'];
	$rows=mysqli_fetch_assoc($dbcon->query($query1));
	$id=$rows['taxinvoice_start'];
	$id=$id+1;
	if($rows['invoice_format']=='2'){
		$row['invoiceno']= str_pad($id,4,"0",STR_PAD_LEFT).$rows['format_value'];
	}
	else if($rows['invoice_format']=='1'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT);
	}
	else if($rows['invoice_format']=='3'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT).$rows['end_format_value'];
	}
	else{
		$row['invoiceno']=str_pad($id,3,"0",STR_PAD_LEFT);
	}
	return $row['invoiceno'];
}	
?>	