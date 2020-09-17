<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");
//if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') 
{ 
  //  if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	{
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
			$aColumns = array('pg_id', 'pg_name','pg_status','user_id');
			$sIndexColumn = "pg_id";
			$isWhere = array("pg_status = 0");
			$sTable = "tbl_product_grp";			
			$isJOIN = array();
			$hOrder = "pg_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['pg_name'];
				
				$edit_btn=''; $delete_btn='';  
				if($edit_btn_per){ 
					$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_category('.$row['pg_id'].');"><i class="fa fa-pencil"></i></button>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_category('.$row['pg_id'].')"><i class="fa fa-trash-o"></i></button>'; 
				}
				$row_data[] = $edit_btn.' '.$delete_btn; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			
			$tr = $dbcon -> query("SELECT `pg_id`,`pg_name`,`pg_status` FROM `tbl_product_grp` WHERE `pg_name` ='".$POST['g_name']."' and pg_status='0'");
			if($tr->num_rows > 0) {
				
				$resp['resp']= '-1';
				
			}
			else {
						$info['pg_name']	= $POST['g_name'];							
						$info['cdate']		= date("Y-m-d H:i:s");
						$info['user_id']	= $_SESSION['user_id'];
						$info['company_id']	= $_SESSION['company_id'];
						$inserid=add_record('tbl_product_grp', $info, $dbcon);
						
				if($inserid){
					if(strtolower($POST['grp_model']) == "grp_model"){
						$sel_qry="select * from tbl_product_grp where pg_id=".$inserid;
						$sel_rel=mysqli_fetch_assoc($dbcon->query($sel_qry));
						$resp=$sel_rel;
						$resp['resp']= "2";
					}
					else{
						$resp['resp']= "1";
					}
				}
				else{
					$resp['resp']= "0";
				}
			}
			echo json_encode($resp);
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `tbl_product_grp` WHERE `pg_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			
				$info['pg_name']	= $POST['e_g_name'];							
				$info['cdate']		= date("Y-m-d H:i:s");
				$info['user_id']	= $_SESSION['user_id'];
				$info['company_id']	= $_SESSION['company_id'];
				$updateid=update_record('tbl_product_grp', $info,"pg_id=".$POST['eid'] , $dbcon);
			if($updateid)
				echo "1";
			else
				echo "0".$dbcon->error;
			
		}
		else if(strtolower($POST['mode']) == "delete") {
			//check Entry Record in TRN tables
			$chk_arr[]=array("product_id","tbl_product","product_status=0 and product_group=".$POST['eid']);
			$chk_arr[]=array("inquiry_trn_id","tbl_inquiry_trn","inquiry_trn_status=0 and pg_id=".$POST['eid']);
			$chk_resp=check_delete_trn($dbcon,$chk_arr);
			if($chk_resp){
				echo '-1';
			}
			else{
				$info['pg_status']='2';
				$updateid=update_record('tbl_product_grp', $info,"pg_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";	
			}
		}
		else if(strtolower($POST['mode']) == "get_category_dropdown_data") {
			echo get_all_category($dbcon,$POST['id']);
		}
    }
  //  else {
    //    die("Error - 2");
    //}
}

//else {
   // die("Error - 1");
//}
?>