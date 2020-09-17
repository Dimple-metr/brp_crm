<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");
/*if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest')*/ 
{ 
    /*if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) */
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
			$aColumns = array('t_id', 't_name', 't_status', 'userid','(select t_name from territory_mst where t_id=ter.t_parent) as p_name');
			$sIndexColumn = "t_id";
			$isWhere = array("t_status = 0","userid in (0,$_SESSION[user_id])");
			$sTable = "territory_mst as ter";			
			$isJOIN = array();
			$hOrder = "ter.t_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['t_name'];
				$row_data[] = $row['p_name'];
				
				$edit_btn=''; $delete_btn=''; 
				
			if($row['t_id']!='0'){
				if($edit_btn_per){
					$edit_btn=' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['t_id'].');"><i class="fa fa-pencil"></i></button>'; 
				}
				if($delete_btn_per){
					$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_territory('.$row['t_id'].')"><i class="fa fa-trash-o"></i></button>'; 
				} 
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
				
				$tr = $dbcon -> query("SELECT `t_id`,`t_name`,`t_status` FROM `territory_mst` WHERE `t_name` = '$POST[t_name]' and t_status='0'");
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['t_status'] != 0) {
						$info['t_status']=0;
						$updateid=update_record('territory_mst', $info,"t_id=".$r['t_id'] , $dbcon);						
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
							$info['t_name']= $POST['t_name'];							
							$info['t_parent']= $POST['t_parent'];							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['userid']		= $_SESSION['user_id'];
							$inserid=add_record('territory_mst', $info, $dbcon);
					if($inserid)
						echo "1";
					else
						echo "0";
				}
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {		
			$q = $dbcon -> query("SELECT * FROM `territory_mst` WHERE `t_id` = '$POST[id]' ");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "get_ter_list") {		
			echo get_all_territory($dbcon,'');
		}
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['t_name']= $POST['territory_name'];				
				$info['cdate']		= date("Y-m-d H:i:s");				
				$updateid=update_record('territory_mst', $info,"t_id=".$POST['eid'] , $dbcon);
				
				
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
				
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['t_status']='2';
				$updateid=update_record('territory_mst', $info,"t_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";
			}
		}
    }
    /*else {
        die("Error - 2");
    }*/
}
/*
else {
    die("Error - 1");
}*/
?>