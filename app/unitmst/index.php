<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/coman_function.php");
include("../../include/function_database_query.php");
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
			$aColumns = array('unitid', 'unit_name','cdate', 'unit_status', 'fmst.user_id');
			$sIndexColumn = "unitid";
			$isWhere = array("unit_status = 0");
			$sTable = "unit_mst as fmst";			
			$isJOIN = array();
			$hOrder = "fmst.unitid desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['unit_name'];
				$row_data[] = date('d, M y',strtotime($row['cdate']));
				
				$edit_btn=''; $delete_btn='';  
				if($edit_btn_per){ 
					$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['unitid'].');"><i class="fa fa-pencil"></i></button>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_unit('.$row['unitid'].')"><i class="fa fa-trash-o"></i></button>'; 
				}
				$row_data[] = $edit_btn.' '.$delete_btn; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$tr = $dbcon -> query("SELECT `unitid`,`unit_name`,`unit_status` FROM `unit_mst` WHERE `unit_name` ='".$POST['unit_name']."'");
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['unit_status'] != 0) {
						$info['unit_status']=0;
						$updateid=update_record('unit_mst', $info,"unitid=".$r['unitid'] , $dbcon);						
						if($updateid)
							echo "1";
						else
							echo "0";
					}
					else {
						echo '-1';
					}
				}
				else {
							$info['unit_name']	= $POST['unit_name'];							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['user_id']	= $_SESSION['user_id'];
							$info['usertype_id']	= $_SESSION['user_type'];
							$inserid=add_record('unit_mst', $info, $dbcon);
					if($inserid)
						echo "1";
					else
						echo "0";
				}
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `unit_mst` WHERE `unitid` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token'])
			{
					$info['unit_name']	= $POST['unit_name'];							
					$info['cdate']		= date("Y-m-d H:i:s");
					$info['user_id']	= $_SESSION['user_id'];
					$info['usertype_id']	= $_SESSION['user_type'];
					$updateid=update_record('unit_mst', $info,"unitid=".$POST['eid'] , $dbcon);
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			//check Entry Record in TRN tables
			$chk_arr[]=array("inquiry_trn_id","tbl_inquiry_trn","inquiry_trn_status=0 and unitid=".$POST['eid']);
			$chk_arr[]=array("quot_trn_id","tbl_quotation_trn","quot_trn_status=0 and unitid=".$POST['eid']);
			$chk_resp=check_delete_trn($dbcon,$chk_arr);
			if($chk_resp){
				echo '-1';
			}
			else{
				$info['unit_status']='2';
				$updateid=update_record('unit_mst', $info,"unitid=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";
			}	
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