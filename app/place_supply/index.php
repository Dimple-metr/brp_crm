<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
/*if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest')*/ 
{ 
    /*if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) */
	{
	//	print_r($_POST);
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		if(strtolower($POST['mode']) == "fetch") {
			$appData = array();
			$i=1;
			$aColumns = array('supply_place_id', 'place_supply', 'supply_place_status', 'userid');
			$sIndexColumn = "supply_place_id";
			$isWhere = array("supply_place_status = 0");
			$sTable = "supply_place";			
			$isJOIN = array();
			$hOrder = "supply_place.supply_place_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['place_supply'];
                $btn='<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['supply_place_id'].');"><i class="fa fa-pencil"></i></button> ';
				if($row['supply_place_id']>0)
				{
				    $btn.= '<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_bank('.$row['supply_place_id'].')"><i class="fa fa-trash-o"></i></button>';
                }
				$row_data[] = $btn;
				
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add" || strtolower($POST['mode']) == "payment") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$tr = $dbcon -> query("SELECT `supply_place_id`,`place_supply`,`supply_place_status` FROM `supply_place` WHERE `place_supply` = '$POST[place_supply]'");
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['supply_place_status'] != 0) {
						$info['supply_place_status']=0;
						$updateid=update_record('supply_place', $info,"supply_place_id=".$r['supply_place_id'] , $dbcon);
						$row['res']='';
							if($updateid)
							{
									$row['res']='1';
							}
							else
							{
									$row['res']='0';
							}
					}
					else 
					{
									$row['res']='-1';
					}		
				}
				else {
							
							$info['place_supply']= $POST['place_supply'];							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['userid']		= $_SESSION[user_id];
							$inserid=add_record('supply_place', $info, $dbcon);
							$row['res']='';
					if($inserid)
					{
						if(strtolower($POST['model'])=="model")
						{
							$query="select * from supply_place where supply_place_id=".$inserid;
							$rel=mysqli_fetch_assoc($dbcon->query($query));		
							$row = $rel;
							$row['res']="2"; 
						}
						else
						{
							$row['res'] ="1";
						}
					}
					else
					{
						$row['res'] ="0";
					}
					
				}
				echo json_encode($row);	
				
			}
		}
		else if(strtolower($POST['mode']) == "preedit") {			
			$q = $dbcon -> query("SELECT * FROM `supply_place` WHERE `supply_place_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['place_supply']= $POST['place_supply'];				
				$info['cdate']		= date("Y-m-d H:i:s");				
				$updateid=update_record('supply_place', $info,"supply_place_id=".$POST['eid'] , $dbcon);
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
				
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			if($_POST['token'] == $_SESSION['token']) {
				$info['supply_place_status']='2';
				$updateid=update_record('supply_place', $info,"supply_place_id=".$POST['eid'] , $dbcon);
				
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