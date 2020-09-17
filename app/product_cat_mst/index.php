<?php

session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");

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
		$aColumns = array('product_category_id', 'product_category_name','cdate', 'product_category_status', 'fmst.user_id');
		$sIndexColumn = "product_category_id";
		$isWhere = array("product_category_status = 0");
		$sTable = "tbl_product_category as fmst";			
		$isJOIN = array();
		$hOrder = "fmst.product_category_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['product_category_name'];
			 
			$edit_btn=''; $delete_btn=''; 
			if($edit_btn_per){ 
				$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_pro_cat('.$row['product_category_id'].');"><i class="fa fa-pencil"></i></button>'; 
			}
			if($delete_btn_per){
				$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_pro_cat('.$row['product_category_id'].')"><i class="fa fa-trash-o"></i></button>'; 
			}
			$row_data[] = $edit_btn.' '.$delete_btn; 
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		$tr = $dbcon -> query("SELECT `product_category_id`,`product_category_name`,`product_category_status` FROM `tbl_product_category` WHERE `product_category_name` ='".$POST['product_category_name']."'");
			if($tr->num_rows > 0) {
				$r = $tr -> fetch_assoc();
				if($r['product_category_status'] != 0) {
					$info['product_category_status']=0;
					$updateid=update_record('tbl_product_category', $info,"product_category_id=".$r['product_category_id'] , $dbcon);	
					
					if($updateid)
						$row['res'] ="1";
					else
						$row['res'] ="0";
				}
				else {
					$row['res'] ="-1";
				}
			}
			else {
						$info['product_category_name']	= $POST['product_category_name'];							
						$info['cdate']					= date("Y-m-d H:i:s");
						$info['user_id']				= $_SESSION['user_id'];
						$info['usertype_id']			= $_SESSION['user_type'];
						$inserid=add_record('tbl_product_category', $info, $dbcon);
					
						
						
				if($inserid){
					if(strtolower($POST['cat_model'])=="cat_model"){
						$query="select * from tbl_product_category where product_category_id=".$inserid;
						$rel=mysqli_fetch_assoc($dbcon->query($query));		
						$row = $rel;
						$row['res']="2"; 
					}
					else{
						$row['res'] ="1";
					}
				}
				else{
					$row['res'] ="0";
				}
				echo json_encode($row);		
			}
	}
	else if(strtolower($POST['mode']) == "preedit") {			
		$q = $dbcon -> query("SELECT * FROM `tbl_product_category` WHERE `product_category_id` = '$POST[id]'");
		$r = $q->fetch_assoc();
		echo json_encode($r);
	}
	else if(strtolower($POST['mode']) == "edit") {
			$info['product_category_name']	= $POST['product_category_name'];							
			$info['cdate']				= date("Y-m-d H:i:s");
			$info['user_id']			= $_SESSION['user_id'];
			$info['usertype_id']		= $_SESSION['user_type'];
			$updateid=update_record('tbl_product_category', $info,"product_category_id=".$POST['eid'] , $dbcon);
			
			if($updateid)
				echo "1";
			else
				echo "0".$dbcon->error;
	}
	else if(strtolower($POST['mode']) == "delete") {
		$info['product_category_status']='2';
		$updateid=update_record('tbl_product_category', $info,"product_category_id=".$POST['eid'] , $dbcon);
		
		if($updateid)
			echo "1";
		else
			echo "0";
	}
   
?>