<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");
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
			$appData = array();
			$i=1;
			$delete_btn=true;
			$aColumns = array('acc.accountid', 'acc.account_name','acc.account_code', 'acc.status', 'acc.user_id','acctype.account_name as parent');
			$sIndexColumn = "acc.accountid";
			$isWhere = array("acc.status = 0 and acc.edit_status=0");
			$sTable = "mst_accounts as acc";			
			$isJOIN = array("inner join mst_accounts as acctype on acc.acc_type_id=acctype.accountid");
			$hOrder = "acctype.accountid,acc.account_name";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = stripslashes($row['account_name']);
				$row_data[] = $row['account_code'];
				$row_data[] = stripslashes($row['parent']);
				 $delete='';
				 if($delete_btn)//$pagename,$usetype,$permission,$dbcon
				{
					$delete=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_formula('.$row['accountid'].')"><i class="fa fa-trash-o"></i></button>';
				}
				$row_data[] = '<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['accountid'].');"><i class="fa fa-pencil"></i></button>'.$delete; 
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$tr = $dbcon -> query("SELECT `accountid`,`account_name`,`status` FROM `mst_accounts` WHERE `account_name` ='".$POST['account_name']."' and  company_id =".$_SESSION['company_id']);
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['status'] != 0) {
						$info['status']=0;
						$updateid=update_record('mst_accounts', $info,"accountid=".$r['accountid'] , $dbcon);
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
							$info['acc_type_id']			= $POST['acc_type_id'];
							$info['account_name']			= $POST['account_name'];	
							$info['account_code']			= $POST['account_code'];
							$info['account_description']	= $POST['account_description'];							
							$info['cdate']					= date("Y-m-d H:i:s");
							$info['user_id']				= $_SESSION['user_id'];
							$info['company_id']				= $_SESSION['company_id'];
							$inserid=add_record('mst_accounts', $info, $dbcon);
					if($inserid)
						echo "1";
					else
						echo "0";
				}
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `mst_accounts` WHERE `accountid` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['acc_type_id']			= $POST['acc_type_id'];
				$info['account_name']			= $POST['account_name'];	
				$info['account_code']			= $POST['account_code'];
				$info['account_description']	= $POST['account_description'];							
				$info['cdate']					= date("Y-m-d H:i:s");
				$info['user_id']				= $_SESSION['user_id'];
				$info['company_id']				= $_SESSION['company_id'];
				$updateid=update_record('mst_accounts', $info,"accountid=".$POST['edit_id'] , $dbcon);
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
				
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['status']='2';
				$updateid=update_record('mst_accounts', $info,"accountid=".$POST['eid'] , $dbcon);
				
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