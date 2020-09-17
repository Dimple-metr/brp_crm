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
			$aColumns = array('cat_id', 'cat_name','cat_status','user_id');
			$sIndexColumn = "cat_id";
			$isWhere = array("cat_status = 0");
			$sTable = "tbl_category";			
			$isJOIN = array();
			$hOrder = "cat_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['cat_name'];
				
				$edit_btn=''; $delete_btn='';  
				if($edit_btn_per){ 
					$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_category('.$row['cat_id'].');"><i class="fa fa-pencil"></i></button>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_category('.$row['cat_id'].')"><i class="fa fa-trash-o"></i></button>'; 
				}
				$row_data[] = $edit_btn.' '.$delete_btn; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			
			$tr = $dbcon -> query("SELECT `cat_id`,`cat_name`,`cat_status` FROM `tbl_category` WHERE `cat_name` ='".$POST['cat_name']."' and `cat_pid` ='".$POST['cat_parent']."' and `cat_status`='0'");
			if($tr->num_rows > 0) {
				
				$resp['resp']= '-1';
				
			}
			else {
						$info['cat_name']	= $POST['cat_name'];							
						$info['cdate']		= date("Y-m-d H:i:s");
						$info['user_id']	= $_SESSION['user_id'];
						$info['company_id']	= $_SESSION['company_id'];
						$inserid=add_record('tbl_category', $info, $dbcon);
						
				if($inserid){
					if(strtolower($POST['cat_model']) == "cat_model"){
						$sel_qry="select * from tbl_category where cat_id=".$inserid;
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
			$q = $dbcon -> query("SELECT * FROM `tbl_category` WHERE `cat_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			
				$info['cat_name']	= $POST['e_cat_name'];							
				$info['cdate']		= date("Y-m-d H:i:s");
				$info['user_id']	= $_SESSION['user_id'];
				$info['company_id']	= $_SESSION['company_id'];
				$updateid=update_record('tbl_category', $info,"cat_id=".$POST['eid'] , $dbcon);
			if($updateid)
				echo "1";
			else
				echo "0".$dbcon->error;
			
		}
		else if(strtolower($POST['mode']) == "delete") {
			//check Entry Record in TRN tables
			$chk_arr[]=array("product_id", "tbl_product", "product_status=0 and product_cat=".$POST['eid']);
			$chk_arr[]=array("inquiry_trn_id", "tbl_inquiry_trn", "inquiry_trn_status=0 and cat_id=".$POST['eid']);
			$chk_resp=check_delete_trn($dbcon,$chk_arr);
			if($chk_resp){
				echo '-1';
			}
			else{
				$info['cat_status']='2';
				$updateid=update_record('tbl_category', $info,"cat_id=".$POST['eid'] , $dbcon);
				
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