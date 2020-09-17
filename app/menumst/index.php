<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
//if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') 
{ 
    //if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	{
		//print_r($_POST);
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		
		if(strtolower($POST['mode']) == "fetch" || strtolower($POST['mode']) == "per_click" ) {
			$appData = array();
			$i=1;
			$aColumns = array('m.menu_id', 'm.menu_name','m.menuorder', 'm.status', 'm.pid','m.user_id','m.menu_module','md.module_name');
			$sIndexColumn = "m.menu_id";
			$isWhere = array("m.status = 0","m.pid =".$POST['pid']);
			$sTable = "tbl_menu as m";			
			$isJOIN = array("left join module_mst as md on md.module_id=m.menu_module");
			$hOrder = "m.menuorder";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['menu_name'];
				$row_data[] = $row['menuorder'];
				$row_data[] = $row['module_name'];
				if($row['pid']=='0')
				{
				
				$addcat='<button class="btn btn-xs btn-success"  onClick="pid_test('.$row['menu_id'].',\''.$row['menu_name'].'\');" data-original-title="Add Sub Menu" data-toggle="tooltip" data-placement="top">Add Sub Menu</button>';
				}
				else
				{
					$addcat='';
				}
					$row_data[]=$addcat.' <button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['menu_id'].');"><i class="fa fa-pencil"></i></button>
					<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_menu('.$row['menu_id'].')"><i class="fa fa-trash-o"></i></button>';
			
				$appData[] = $row_data;
				$id++;
				}
			
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
							$info['menu_name']	= $POST['menu_name'];	
							$info['menu_module']	= $POST['menu_module'];	
							$info['menuorder']	= $POST['order'];	
							$info['page_name']	= strtolower($POST['page_name']);	
							$info['pid']		= $POST['pid'];							
							$info['fa_icon']	= $POST['fa_icon'];							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['user_id']	= $_SESSION['user_id'];
							$inserid=add_record('tbl_menu', $info, $dbcon);
							
					if($inserid)
						echo "1";
					else
						echo "0";
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {		
			$q = $dbcon -> query("SELECT * FROM `tbl_menu` WHERE `menu_id` = '$POST[id]' ");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['menu_name']= $POST['menu_name'];
				$info['menu_module']	= $POST['menu_module'];				
				$info['menuorder']= $POST['order'];	
				$info['page_name']= strtolower($POST['page_name']);			
				$info['fa_icon']	= $POST['fa_icon'];							
				$info['cdate']		= date("Y-m-d H:i:s");				
				$updateid=update_record('tbl_menu', $info,"menu_id=".$POST['eid'] , $dbcon);
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
				$updateid=update_record('tbl_menu', $info,"menu_id=".$POST['eid'] , $dbcon);
				
				if($updateid)	
					echo "1";
				else
					echo "0";
			}
		}
		else if(strtolower($POST['mode']) == "get_module") {

			echo get_all_module($dbcon);

		}
    }
   /* else {
        die("Error - 2");
    }*/
}
/*
else {
    die("Error - 1");
}*/

?>