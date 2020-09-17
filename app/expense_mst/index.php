<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");

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
			
		$appData = array();
		$i=1;
		$aColumns = array('expense_id', 'exp_head.g_name', 'expense_name', 'mst.cdate', 'expense_status', 'mst.user_id');
		$sIndexColumn = "expense_id";
		$isWhere = array("expense_status = 0");
		$sTable = "expense_master as mst";			
		$isJOIN = array('left join tbl_group as exp_head on exp_head.g_id=mst.expense_head_id');
		$hOrder = "mst.expense_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['g_name']; 
			$row_data[] = $row['expense_name']; 
			
			$edit_btn='';$delete_btn='';
			if($edit_btn_per){
				$edit_btn='<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_expense('.$row['expense_id'].');"><i class="fa fa-pencil"></i></button>';
			}
			if($delete_btn_per){
				$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_expense('.$row['expense_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$row_data[] = $edit_btn.' '.$delete_btn; 
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		$tr = $dbcon -> query("SELECT `expense_id`,`expense_name`,`expense_status` FROM `expense_master` WHERE expense_status=0 and `expense_name` ='".$POST['expense_name']."' and `expense_head_id` ='".$POST['expense_head_id']."' ");
		if($tr->num_rows > 0) {
			$resp['msg'] = '-1';
		}
		else {
			$info['expense_head_id']	= $POST['expense_head_id'];							
			$info['expense_name']	= $POST['expense_name'];							
			$info['cdate']		= date("Y-m-d H:i:s");
			$info['user_id']	= $_SESSION['user_id'];
			$info['company_id']	= $_SESSION['company_id'];
			$inserid=add_record('expense_master', $info, $dbcon);
			
			if($inserid){
				$resp['msg'] = "1";
				if(strtolower($POST['expense_model']) == "expense_model"){
					$zone_qry="select * from expense_master where expense_id=".$inserid; 
					$zone_rel=mysqli_fetch_assoc($dbcon->query($zone_qry));
					$resp=$zone_rel;
					$resp['msg'] = "2"; 
				}
			}
			else{
				$resp['msg'] = "0";
			}
		}
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "preedit") {			
		$q = $dbcon -> query("SELECT * FROM `expense_master` WHERE `expense_id` = '$POST[expense_id]'");
		$r = $q->fetch_assoc();
		echo json_encode($r);
	}
	else if(strtolower($POST['mode']) == "edit") {
		$info['expense_head_id']	= $POST['expense_head_id'];							
		$info['expense_name']	= $POST['expense_name'];							
		$info['cdate']		= date("Y-m-d H:i:s");
		$info['user_id']	= $_SESSION['user_id'];
		$info['company_id']	= $_SESSION['company_id'];
		$updateid=update_record('expense_master', $info,"expense_id=".$POST['eid'] , $dbcon);
		
		if($updateid)
			echo "1";
		else
			echo "0".$dbcon->error; 
	}
	else if(strtolower($POST['mode']) == "delete") {
		$info['expense_status']='2';
		$updateid=update_record('expense_master', $info,"expense_id=".$POST['expense_id'] , $dbcon);
		
		if($updateid)
			echo "1";
		else
			echo "0"; 
	}
	
	
?>