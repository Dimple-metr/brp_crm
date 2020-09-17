<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");

//print_r($_POST);
//print_r($_FILES);

$POST = ($_POST != NULL) ? bulk_filter($dbcon,$_POST) : bulk_filter($dbcon,$_GET);

if(strtolower($POST['mode']) == "fetch") {
    $edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);
    $delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);

    $s_date=explode(' - ',$POST['date']);
    $_SESSION['start']=$s_date[0];
    $_SESSION['end']=$s_date[1];

    $where='';
    $where.="   AND task.task_due_date between '".date('Y-m-d',strtotime($s_date[0]))."' 
                AND '".date('Y-m-d',strtotime("+1 day", strtotime($s_date[1])))."'";
    
    $task_status = 'task.task_status IN (0)';
    if($POST['task_status']!=''){
        if($POST['task_status']==2){
            $task_status = ' task.task_status IN (0,1)';
        } else {
            $task_status = ' task.task_status IN ('.$POST['task_status'].')';
        }
    } 
		
    //$appData = array();
    $i=1;
    $aColumns = array('task.task_id', 'type.mcd_name', 'regrd.task_rel_name', 'task.task_name', 'task.task_due_date', 'usr.user_name', 'prior.task_priority_name', 'task.task_status','inq.inquiry_name','per.c_con_fname', 'per.c_con_lname','per.c_con_mobile', 'cust.cust_name','cust.cust_mobile','inq_cust.cust_mobile as inq_mobile', 'task.task_rel_id', 'task.cdate', 'task.task_completion_date');
    $sIndexColumn = "task.task_id";
    $isWhere = array($task_status." and task.entry_type = 1".$where.check_user('task'));
//    print_r($isWhere);
//    exit();
    $sTable = "tbl_task as task";
    $isJOIN = array('left join tbl_inquiry as inq on inq.inquiry_id=task.inquiry_id','left join tbl_master_category_detail as type on type.mcd_id=task.task_type_id','left join task_rel_mst as regrd on regrd.task_rel_id=task.task_rel_id','left join users as usr on usr.user_id=task.user_id','left join task_priority_mst as prior on prior.task_priority_id=task.task_priority_id','left join tbl_cust_contact as per on per.c_con_id=task.c_con_id','left join tbl_customer as cust on cust.cust_id=task.cust_id', 'left join tbl_customer as inq_cust on inq_cust.cust_id=inq.cust_id');
    $hOrder = "task.task_id desc";
    include('../../include/pagging.php');
    $appData = array();
    $id=1;
    
    foreach($sqlReturn as $row) {
        $row_data = array();
        $row_data[] = $row['mcd_name'];
        $row_data[] = $row['task_rel_name'];

        if($row['task_rel_id']=='5'){//Inquiry
                $inq_name = $row['inquiry_name'];
                $row_data[] = $inq_name.'<br/>'.$row['inq_mobile'];
        }
        else if($row['task_rel_id']=='4'){//Company
                $inq_name = $row['cust_name'];
                $row_data[] = $inq_name.'<br/>'.$row['cust_mobile'];
        }
        else if($row['task_rel_id']=='3'){//Person
                $inq_name = $row['c_con_fname'].' '.$row['c_con_lname'];
                $row_data[] = $inq_name.'<br/>'.$row['c_con_mobile'];
        }
        else{
                $row_data[] = $inq_name = $row['task_name'];
        }

        $row_data[] = date("d-M-Y H:i A",strtotime($row['task_due_date']));
        $row_data[] = $row['user_name'];
        $row_data[] = $row['task_priority_name'];
			
        if($row['task_status']=='1'){
            $tsk_due_time=strtotime($row['task_due_date']);
            $cur_time=strtotime($row['task_completion_date']);
            $tsk_type='';
            if($tsk_due_time<$cur_time){
                    $tsk_type="<label style='background:#d9534f;'>(Delayed)</label>";
            }
            $row_data[] = '<button type="button" class="btn btn-sm btn-success" data-original-title="Task Completed" data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i> Completed '.$tsk_type.'</button>';
        }
        else{
            $tsk_due_time=strtotime($row['task_due_date']);
            $cur_time=strtotime(date('Y-m-d H:i:s'));
            $tsk_type='';
            if($tsk_due_time<$cur_time){
                    $tsk_type="<label style='background:#d9534f;'>(Delayed)</label>";
            }
            $row_data[] = '<button type="button" class="btn btn-sm btn-warning" data-original-title="Task Pending" data-toggle="tooltip" data-placement="top">Pending '.$tsk_type.'</button>';			
        }

        $edit='';$delete='';$task_btn='';$add_flp_btn='';
        if($edit_btn_per) {
            $edit = '<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'task_edit/'.$row['task_id'].'"><i class="fa fa-pencil"></i></a>';
        }
        if($delete_btn_per) {
            $delete = '<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_task('.$row['task_id'].')"><i class="fa fa-trash-o"></i></button>';
        }

//        if($row['task_status']=='0'){
//            $task_btn='<button class="btn btn-xs btn-success" data-original-title="Click to Complete Task" data-toggle="tooltip" data-placement="top" onClick="change_task_status('.$row['task_id'].',1)"><i class="fa fa-check"></i></button>';
//        }
//        else if($row['task_status']=='1'){
//                $task_btn='<button class="btn btn-xs btn-warning" data-original-title="Click to Open Task" data-toggle="tooltip" data-placement="top" onClick="change_task_status('.$row['task_id'].',0)"><i class="fa fa-ban"></i></button>';
//        }
			
        $add_flp_btn='<button class="btn btn-xs btn-primary" data-original-title="Click to Add Follow Up" data-toggle="tooltip" data-placement="top" onClick="open_follow_up('.$row['task_id'].',\''.$inq_name.'\')"><i class="fa fa-eye"></i></button>';

        $row_data[] = $edit.' '.$delete.' '.$task_btn.' '.$add_flp_btn;

        $appData[] = $row_data;
        $id++;
    }
    
    $output['aaData'] = $appData;
    echo json_encode( $output );
}
else if(strtolower($POST['mode']) == "add") {

    $info['task_type_id']		= $POST['task_type_id'];
    $info['task_rel_id']		= $POST['task_rel_id'];
    $info['task_name']			= $POST['task_name'];
    $info['c_con_id']			= $POST['c_con_id'];
    $info['cust_id']			= $POST['cust_id'];
    $info['inquiry_id']			= $POST['inquiry_id'];
    $info['opp_id']			= $POST['opp_id'];
    $info['sales_stage_id']             = $POST['sales_stage_id'];
    $info['task_remark']		= $_POST['task_remark'];
    $info['assign_user_ids']            = implode(",",array_filter($POST['assign_user_ids']));
    $info['task_priority_id']           = $POST['task_priority_id'];
    $info['task_due_date']		= date('Y-m-d H:i:s',strtotime($POST['task_due_date']));
    $info['task_alert_id']		= $POST['task_alert_id'];

    if($POST['task_alert_id'] && $POST['task_alert_id']!='1'){//If alert is not none
        $alert_date = date("Y-m-d H:i:s", strtotime($POST['task_due_date']));
        $gap_mints = get_alert_mintes($dbcon,$POST['task_alert_id']);
        $filt_alert_date = date("Y-m-d H:i:s", strtotime($alert_date . "-".$gap_mints." minutes"));//Subtract Minutes
        $info['alert_date_time']	= date('Y-m-d H:i:s',strtotime($filt_alert_date));
    }
		
    $info['create_date']	= date('Y-m-d H:i:s');
    $info['entry_type']		= 1;//Fixed Task Type
    $info['cdate']              = date("Y-m-d H:i:s");
    $info['user_id']		= $_SESSION['user_id'];
    $info['company_id']		= $_SESSION['company_id'];
    $ins_task_id=add_record('tbl_task', $info, $dbcon);
		
    //Complete Prev Flp Task
    if($POST['prev_task_id']){
        $upd_qry="update tbl_task set task_status=1,task_completion_date='".date("Y-m-d H:i:s")."' where task_id=".$POST['prev_task_id'];
        $upd_qry_rs=$dbcon->query($upd_qry);
    }
		
    if($ins_task_id){	
            $arr['msg']="1";							
    }
    else{
            $arr['msg']="0";
    }
    echo json_encode($arr);
}
else if(strtolower($POST['mode']) == "edit") {
    $info['task_type_id']		= $POST['task_type_id'];
    $info['task_rel_id']		= $POST['task_rel_id'];
    $info['task_name']			= $POST['task_name'];
    $info['task_remark']		= $_POST['task_remark'];
    $info['assign_user_ids']	= implode(",",array_filter($POST['assign_user_ids']));
    $info['task_priority_id']	= $POST['task_priority_id'];
    $info['task_due_date']		= date('Y-m-d H:i:s',strtotime($POST['task_due_date']));
    $info['alert_date_time']	= date('Y-m-d H:i:s', strtotime($POST['alert_date_time']));

    $info['cdate']			= date("Y-m-d H:i:s");
    //$info['user_id']		= $_SESSION['user_id'];
    //$info['company_id']	= $_SESSION['company_id'];
    $updateid=update_record('tbl_task', $info, "task_id=".$POST['eid'], $dbcon);

    if($updateid){	
            $arr['msg']="update";
    }
    else{
            $arr['msg']=0;
    }
    echo json_encode($arr);
}
else if(strtolower($POST['mode']) == "delete") {
    $info['task_status']	= 2;
    $info['cdate']			= date("Y-m-d H:i:s");
    $updateid=update_record('tbl_task', $info, "task_id=".$POST['task_id'], $dbcon);

    if($updateid)
            echo "1";	
    else
            echo "0";			
}
	else if(strtolower($POST['mode']) == "change_task_status") {
		$info['task_status']	= $POST['task_status'];
		if($info['task_status']=='1'){//Update Completion Date if Task Completed
			$info['task_completion_date']= date("Y-m-d H:i:s");
		}
		else{
			$info['task_completion_date']= "0000-00-00 00:00:00";//Reset Date
		}
		$info['cdate']			= date("Y-m-d H:i:s");
		$updateid=update_record('tbl_task', $info, "task_id=".$POST['task_id'], $dbcon);
		
		if($updateid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode']) == "add_flp_hist_field") {
		
		$info1['task_id']				= $POST['task_id'];
		$info1['task_flp_remark']		= $_POST['task_flp_remark'];
		$info1['flp_date']				= date("Y-m-d H:i:s");
		$info1['user_id']				= $_SESSION['user_id'];
		$info1['cdate']					= date("Y-m-d H:i:s");
		$info1['company_id']			= $_SESSION['company_id'];
		$table='tbl_followup';$tableid='flp_id';
		
		if(empty($POST['flp_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['flp_id'] , $dbcon);	
		}
	}
	else if(strtolower($POST['mode']) == "show_flp_hist") {
		if($POST['task_id']!=""){
		  $where ="and flp.task_id =".$POST['task_id'];
		}
		$appData = array();
		$i=1;
		$aColumns = array('flp.flp_id','flp.task_flp_remark','flp.flp_date','usr.user_name');
		$sIndexColumn = "flp.flp_id";
		$isWhere = array("flp.flp_status = 0 ".$where." and flp.company_id in (0,$_SESSION[company_id])");
		$sTable = "tbl_followup as flp";			
		$isJOIN = array("left join users as usr on usr.user_id=flp.user_id");
		$hOrder = "flp.flp_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['task_flp_remark'];
			$row_data[] = date("d-M-Y h:i A",strtotime($row['flp_date']));
			$row_data[] = $row['user_name'];
			
			$row_data[] = '<!--<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_reqpro('.$row['flp_id'].');"><i class="fa fa-pencil"></i></button>-->
			<button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_task_flp('.$row['flp_id'].')"><i class="fa fa-trash-o"></i></button>';
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "delete_task_flp") {
		$info['flp_status']		='2';
		$info['cdate']			= date("Y-m-d H:i:s");
		$updateid=update_record('tbl_followup', $info,"flp_id=".$POST['flp_id'] , $dbcon);
		
		if($updateid)
			echo "1";
		else
			echo "0";
	}
	else if(strtolower($POST['mode']) == "preview_rel_types") {
		$str='';$task_rel_id=$POST['task_rel_id'];
		$c_con_id=$POST['c_con_id'];
		$cust_id=$POST['cust_id'];
		$inquiry_id=$POST['inquiry_id'];
		if($task_rel_id=='3' && $c_con_id){//Person
			$str.='<table class="display table table-bordered table-striped">
				<thead>
					<tr>
						<th>Person Name</th>
						<th>Customer Name</th>
						<th>Email</th>
						<th>Mobile</th>
					</tr>
				</thead>
				<tbody>';
			
			$per_qry="select per.*,cust.cust_name from tbl_cust_contact as per 
			left join tbl_customer as cust on cust.cust_id=per.cust_id 
			where c_con_id=".$c_con_id;
			$per_rel=mysqli_fetch_assoc($dbcon->query($per_qry));
			$str.='<tr>
					<td>'.$per_rel['c_con_fname'].' '.$per_rel['c_con_lname'].'</td>
					<td>'.$per_rel['cust_name'].'</td>
					<td>'.$per_rel['c_con_email'].'</td>
					<td>'.$per_rel['c_con_mobile'].'</td>
				</tr>';
			
			$str.='</tbody>
			</table>';
		}
		else if($task_rel_id=='4' && $cust_id){//Company
			$str.='<table class="display table table-bordered table-striped">
				<thead>
					<tr>
						<th>Customer Name</th>
						<th>Owner</th>
					</tr>
				</thead>
				<tbody>';
			
			$cust_qry="select cust.*,usr.user_name FROM tbl_customer as cust 
			left join users as usr on usr.user_id=cust.user_id
			where cust.cust_id=".$cust_id;
			$cust_rel=mysqli_fetch_assoc($dbcon->query($cust_qry));
			$str.='<tr>
					<td>'.$cust_rel['cust_name'].'</td>
					<td>'.$cust_rel['user_name'].'</td>
				</tr>';
			
			$str.='</tbody>
			</table>';
		}
		else if($task_rel_id=='5' && $inquiry_id){//Inquiry
			$str.='<table class="display table table-bordered table-striped">
				<thead>
					<tr>
						<th>Inquiry Name</th>
						<th>Customer Name</th>
					</tr>
				</thead>
				<tbody>';
			
			$inq_qry="select inq.*,cust.cust_name FROM tbl_inquiry as inq 
			left join tbl_customer as cust on cust.cust_id=cust.cust_id
			where inq.inquiry_id=".$inquiry_id;
			$inq_rel=mysqli_fetch_assoc($dbcon->query($inq_qry));
			$str.='<tr>
					<td>'.$inq_rel['inquiry_name'].'</td>
					<td>'.$inq_rel['cust_name'].'</td>
				</tr>';
			
			$str.='</tbody>
			</table>';
		}
		
		$resp['html_resp']=$str;
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "load_pend_task") {
		$str='';
		 $qry='SELECT task.*,usr.user_name,task_sub.mcd_name as task_sub_name,rel.task_rel_name,
(
    CASE
    	 WHEN task.task_rel_id=1 then task.task_name
    	 WHEN task.task_rel_id=2 then task.task_name
    	 WHEN task.task_rel_id=3 then (SELECT c_con_fname from tbl_cust_contact WHERE c_con_id=task.c_con_id)
    	 WHEN task.task_rel_id=4 then (SELECT cust_name from tbl_customer WHERE cust_id=task.cust_id)
    	 WHEN task.task_rel_id=5 then (SELECT inquiry_name from tbl_inquiry WHERE inquiry_id=task.inquiry_id)
    END
) as rel_name
from tbl_task as task
left join users as usr on usr.user_id=task.user_id
left join tbl_master_category_detail as task_sub on task_sub.mcd_id=task.task_type_id
left join task_rel_mst as rel on rel.task_rel_id=task.task_rel_id
WHERE task.task_status=0 and task.entry_type=1 and task.alert_date_time!="0000-00-00 00:00:00" and task.alert_date_time!="1970-01-01 05:30:00" and find_in_set('.$_SESSION['user_id'].',task.assign_user_ids) and alert_date_time<"'.date('Y-m-d H:i:s').'" order by task.task_priority_id,task.alert_date_time';
		$qry_rs=$dbcon->query($qry);
		if(mysqli_num_rows($qry_rs)){
			$k=1;
			while($rel=mysqli_fetch_assoc($qry_rs))
			{
				$view_flp_btn='';
				//Action Btns
				
				$task_btn='<button class="btn btn-xs btn-success" title="Click to Complete Task"  onClick="change_task_status('.$rel['task_id'].',1)"><i class="fa fa-check"></i></button>';
				
				$add_rmrk_btn='<button class="btn btn-xs btn-info" title="Add Remark" onClick="open_follow_up('.$rel['task_id'].',\''.$rel['rel_name'].'\')"><i class="fa fa-eye"></i></button>';
				
				$add_flp_btn='<a href="'.ROOT.'task_flp/'.$rel['task_id'].'" class="btn btn-xs btn-primary" title="Add Follow-Up"><i class="fa fa-plus"></i></a>';
				
				
				if($rel['inquiry_id'] != 0)
				{	
				
					
				//	echo $rel['inquiry_id'].'</br>';
				
				$view_flp_btn='<a href="'.ROOT.'inquiry_view/'.$rel['inquiry_id'].'" class="btn btn-xs btn-primary" title="View Inquiry"><i class="fa fa-eye"></i></a>';
				}
				
			
			
				$str.='<tr>
					<td class="text-left">'.$k.'</td>
					<td class="text-left">'.$rel['task_rel_name'].'</td>
					<td class="text-left">'.$rel['rel_name'].'</td>
					<td class="text-left">'.date("d-m-Y h:i A",strtotime($rel['task_due_date'])).'</td>
					<td class="text-left">'.$rel['task_remark'].'</td>
					<td class="text-left">'.$rel['user_name'].'</td>
					<td class="text-center">'.$task_btn.' '.$add_rmrk_btn.' '.$add_flp_btn.' '.$view_flp_btn.'</td>
				</tr>';
				$k++;
			}
		}
		else{
			$str.='<tr>
				<td colspan="7" class="text-center">No Data Found !!!</td>
			</tr>';
		}
		$resp['resp_html']=$str;
		echo json_encode($resp);
	}
        else if(strtolower($POST['mode']) == "load_inquiry_stage") {
            $query = $dbcon->query("SELECT `opp_id`,`sales_stage_id` FROM `tbl_inquiry` WHERE `inquiry_id` = ".$POST['inq_id']);
            $data = mysqli_fetch_array($query,MYSQLI_ASSOC);
            echo json_encode($data);
        }

?>