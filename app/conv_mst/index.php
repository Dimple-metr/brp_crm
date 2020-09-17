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
			$aColumns = array('conv_id', 'an_name','an_priority','an_detail','an_status','user_id');
			$sIndexColumn = "conv_id";
			$isWhere = array("an_status = 0");
			$sTable = "tbl_annexure";			
			$isJOIN = array();
			$hOrder = "conv_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['an_name'];
				$row_data[] = $row['an_priority'];
				$row_data[] = $row['an_detail'];
				
				$edit_btn=''; $delete_btn='';  
				if($edit_btn_per){ 
					$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_data('.$row['conv_id'].');"><i class="fa fa-pencil"></i></button>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_data('.$row['conv_id'].')"><i class="fa fa-trash-o"></i></button>'; 
				}
				$row_data[] = $edit_btn.' '.$delete_btn; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			
				$dbcon->query("delete from tbl_conv_rate where company_id='$_SESSION[company_id]'");
			
				for($i=0;$i<count($POST['conv_base']);$i++)
				{
					$info['conv_st_date']	= date("Y-m-d",strtotime($POST['conv_st_date']));							
					$info['conv_base']	= $POST['conv_base'][$i];							
					$info['conv_currency']	= $POST['conv_currency'][$i];							
					$info['conv_rate']	= $POST['c_rate'][$i];							
					$info['loop_count	']	= $i+1;							
					$info['cdate']		= date("Y-m-d H:i:s");
					$info['user_id']	= $_SESSION['user_id'];
					$info['company_id']	= $_SESSION['company_id'];
					
					$inserid=add_record('tbl_conv_rate', $info, $dbcon);
				}
				if($inserid)
					echo "1";
				else
					echo "0";
			
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `tbl_annexure` WHERE `conv_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			
				$info['an_name']	= $POST['e_a_name'];							
				$info['an_priority']	= $POST['e_a_priority'];							
				$info['an_detail']	= $POST['e_a_detail'];										
				$info['cdate']		= date("Y-m-d H:i:s");
				$info['user_id']	= $_SESSION['user_id'];
				$info['company_id']	= $_SESSION['company_id'];
				$updateid=update_record('tbl_annexure', $info,"conv_id=".$POST['eid'] , $dbcon);
			if($updateid)
				echo "1";
			else
				echo "0".$dbcon->error;
			
		}
		else if(strtolower($POST['mode']) == "delete") {
			
				$info['an_status']='2';
				$updateid=update_record('tbl_annexure', $info,"conv_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";
			
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