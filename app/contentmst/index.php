<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
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
			$appData = array();
			$i=1;
			$aColumns = array('contentid', 'content_name','cdate', 'content_status', 'fmst.user_id');
			$sIndexColumn = "contentid";
			$isWhere = array("content_status = 0".check_user('fmst'));
			$sTable = "content_mst as fmst";			
			$isJOIN = array();
			$hOrder = "fmst.contentid desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['content_name'];
				$row_data[] = date('d, M y',strtotime($row['cdate']));
				if($row['usertype_id']==$_SESSION['user_type'] ||  $_SESSION['user_type'] =='1')
				{
				$row_data[] = '<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['contentid'].');"><i class="fa fa-pencil"></i></button>
					<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_content('.$row['contentid'].')"><i class="fa fa-trash-o"></i></button>
				';}
				else
				{
					$row_data[]='';
				}
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			if($_POST['token'] == $_SESSION['token']) {
				$tr = $dbcon -> query("SELECT `contentid`,`content_name`,`content_status` FROM `content_mst` WHERE `content_name` ='".$POST['content_name']."'");
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['content_status'] != 0) {
						$info['content_status']=0;
						$updateid=update_record('content_mst', $info,"contentid=".$r['contentid'] , $dbcon);						
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
							//var_dump($POST);exit;
							$info['content_name']	= $POST['content_name'];							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['user_id']	= $_SESSION['user_id'];
							$inserid=add_record('content_mst', $info, $dbcon);
					if($inserid)
						echo "1";
					else
						echo "0";
				}
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `content_mst` WHERE `contentid` = '$POST[id]'  AND `user_id` = '$_SESSION[user_id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			if($_POST['token'] == $_SESSION['token']) {
					$info['content_name']	= $POST['content_name'];							
					$info['cdate']		= date("Y-m-d H:i:s");
					$info['user_id']	= $_SESSION['user_id'];
					$updateid=update_record('content_mst', $info,"contentid=".$POST['eid'] , $dbcon);
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			if($_POST['token'] == $_SESSION['token']) {
				$info['content_status']='2';
				$updateid=update_record('content_mst', $info,"contentid=".$POST['eid'] , $dbcon);
				
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