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
			$aColumns = array('tc_id', 'tc_name','tc_priority','tc_status','tc_details','tc_for','user_id');
			$sIndexColumn = "tc_id";
			$isWhere = array("tc_status = 0");
			$sTable = "tbl_terms_condition";			
			$isJOIN = array();
			$hOrder = "tc_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['tc_name'];
				$row_data[] = nl2br($row['tc_details'],false);
				
				$tc_for_name='';
				$for_arr=explode(",",$row['tc_for']);
				if(in_array('0',$for_arr)){
					$tc_for_name[]='DOMESTIC';
				}
				if(in_array('1',$for_arr)){
					$tc_for_name[]=' EXPORT';
				}
				$row_data[] = implode(",",$tc_for_name);
				
				$edit_btn=''; $delete_btn='';  
				if($edit_btn_per){ 
					$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'terms_edit/'.$row['tc_id'].'"><i class="fa fa-pencil"></i></a>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_data('.$row['tc_id'].')"><i class="fa fa-trash-o"></i></button>'; 
				}
				$row_data[] = $edit_btn.' '.$delete_btn; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			
			$tr = $dbcon -> query("SELECT `tc_id`,`tc_name`,`tc_status` FROM `tbl_terms_condition` WHERE `tc_name` ='".$POST['term_name']."' and tc_status='0'");
			if($tr->num_rows > 0) {
				
				echo '-1';
				
			}
			else {
					if(isset($POST['allow_change'])){ $allow="1"; } else { $allow="0"; }
				
						$info['tc_name']	= $POST['term_name'];							
						$info['tc_priority']	= $POST['term_priority'];							
						$info['tc_category']	= $POST['term_category'];							
						$info['tc_details']	= $_POST['terms_details'];							
						$info['tc_for']	= implode(",",$POST['term_for']);							
						$info['tc_allow']	= 	$allow;						
						$info['cdate']		= date("Y-m-d H:i:s");
						$info['user_id']	= $_SESSION['user_id'];
						$info['company_id']	= $_SESSION['company_id'];
						$inserid=add_record('tbl_terms_condition', $info, $dbcon);
				if($inserid)
					echo "1";
				else
					echo "0";
			}
		
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `tbl_terms_condition` WHERE `tc_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
				
				if(isset($POST['allow_change'])){ $allow="1"; } else { $allow="0"; }
				
				$info['tc_name']	= $POST['term_name'];							
				$info['tc_priority']	= $POST['term_priority'];							
				$info['tc_category']	= $POST['term_category'];							
				$info['tc_details']	= $_POST['terms_details'];							
				$info['tc_for']	= implode(",",$POST['term_for']);							
				$info['tc_allow']	= 	$allow;													
				$info['cdate']		= date("Y-m-d H:i:s");
				$info['user_id']	= $_SESSION['user_id'];
				$info['company_id']	= $_SESSION['company_id'];
				$updateid=update_record('tbl_terms_condition', $info,"tc_id=".$POST['eid'] , $dbcon);
			if($updateid)
				echo "1";
			else
				echo "0".$dbcon->error;
			
		}
		else if(strtolower($POST['mode']) == "delete") {
			
				$info['tc_status']='2';
				$updateid=update_record('tbl_terms_condition', $info,"tc_id=".$POST['eid'] , $dbcon);
				
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