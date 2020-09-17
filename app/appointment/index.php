<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");

//print_r($_POST);
//print_r($_FILES);
if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}

	if(strtolower($POST['mode']) == "fetch") {
		$edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);
		$delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);

		$s_date=explode(' - ',$POST['date']);
		$_SESSION['start']=$s_date[0];
		$_SESSION['end']=$s_date[1];
                $today = date('Y-m-d');

		$where='';
		//$where.="  and apt.appointment_start_time >= '".date('Y-m-d',strtotime($s_date[0]))."' AND apt.appointment_start_time <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$where.="  and apt.appointment_start_time between '".date('Y-m-d',strtotime($s_date[0]))."' 
		AND '".date('Y-m-d',strtotime("+1 day", strtotime($s_date[1])))."'";
                
		if($POST['task_status']!=''){
                    if($POST['task_status'] == 1){
                        $where_status .= ' and apt.task_status=1';
                        
                    } else if ($POST['task_status'] == 0){
                        $where_status.=' and apt.task_status=0 AND apt.appointment_start_time > "'.$today.'"';
                        
                    } else if ($POST['task_status'] == 2){
                        $where_status.=' and apt.task_status=0 AND apt.appointment_start_time < "'.$today.'"';
                        
                    } else {
                        $where_status.='apt.task_status != 2';
                    }
		}
		
		$appData = array();
		$i=1;
		$aColumns = array('apt.task_id', 'apt.appointment_subject','apt.task_status','apt.appointment_start_time','apt.appointment_end_time','regrd.task_rel_name', 'apt.task_name', 'usr.user_name', 'apt.create_date', 'inq.inquiry_name', 'cust.cust_name', 'per.c_con_fname', 'per.c_con_lname', 'apt.cdate', 'apt.task_rel_id');
		$sIndexColumn = "apt.task_id";
		$isWhere = array("apt.entry_type=2".$where_status.$where.check_user('apt'));
                //echo '<pre>'; print_r($isWhere); 
		$sTable = "tbl_task as apt";
		$isJOIN = array('left join task_rel_mst as regrd on regrd.task_rel_id=apt.task_rel_id', 'left join tbl_inquiry as inq on inq.inquiry_id=apt.inquiry_id', 'left join tbl_customer as cust on cust.cust_id=apt.cust_id', 'left join tbl_cust_contact as per on per.c_con_id=apt.c_con_id', 'left join users as usr on usr.user_id=apt.user_id');
		$hOrder = "apt.task_id desc";
		include('../../include/pagging.php');
		//$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['appointment_subject'];
			$row_data[] = $row['task_rel_name'];
			
			if($row['task_rel_id']=='5'){//Inquiry
				$row_data[] = $row['inquiry_name'];
			}
			else if($row['task_rel_id']=='4'){//Company
				$row_data[] = $row['cust_name'];
			}
			else if($row['task_rel_id']=='3'){//Person
				$row_data[] = $row['c_con_fname'].' '.$row['c_con_lname'];
			}
			else{
				$row_data[] = $row['task_name'];
			}
			
                        $row_data[] = $row['user_name'];
                        
                        $appointment_date = date("d-M-Y",strtotime($row['appointment_start_time']));
                        $start_time = date("H:i: A",strtotime($row['appointment_start_time']));
                        $end_time = date("H:i: A",strtotime($row['appointment_end_time']));
			$row_data[] = $appointment_date .'<br/>'.$start_time.' to '.$end_time ;
                        
                        if($row['task_status']==1){
                            $tsk_type="<label>Completed</label>";
                            $row_data[] = '<button type="button" class="btn btn-sm btn-success" data-original-title="Task Completed" data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i>'.$tsk_type.'</button>';
                        }
                        else{
                            $tsk_due_time = strtotime($row['appointment_start_time']);
                            $cur_time = strtotime(date('Y-m-d H:i:s'));
                            
                            $tsk_type='';
                            if($tsk_due_time < $cur_time){
                                $tsk_type="<label>Missed</label>";
                                $row_data[] = '<button type="button" class="btn btn-sm btn-warning" data-original-title="Task Pending" data-toggle="tooltip" data-placement="top">'.$tsk_type.'</button>';
                            } else{
                                $tsk_type="<label>Upcoming</label>";
                                $row_data[] = '<button type="button" class="btn btn-sm btn-primary" data-original-title="Task Pending" data-toggle="tooltip" data-placement="top">'.$tsk_type.'</button>';
                            }
                            			
                        }
			
			$edit='';$delete='';
			if($edit_btn_per) {
				$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'appointment_edit/'.$row['task_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per) {
				$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_appointment('.$row['task_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$row_data[] = $edit.' '.$delete;

			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {

		$info['task_location']		= $_POST['task_location'];
		$info['full_day_event']		= $_POST['full_day_event'];
		$info['appointment_start_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_start_time']));
		$info['appointment_end_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_end_time']));
		$info['appointment_subject']    = $_POST['appointment_subject'];
		$info['task_remark']		= $_POST['task_remark'];
		$info['assign_user_ids']	= implode(",",array_filter($POST['assign_user_ids']));
		$info['task_rel_id']		= $POST['task_rel_id'];
		$info['task_name']              = $POST['task_name'];
		$info['c_con_id']		= $POST['c_con_id'];
		$info['cust_id']		= $POST['cust_id'];
		$info['inquiry_id']		= $POST['inquiry_id'];
		
		if($POST['task_alert_id'] && $POST['task_alert_id']!='1'){//If alert is not none
                    $alert_date = date("Y-m-d H:i:s", strtotime($POST['appointment_start_time']));
                    $gap_mints = get_alert_mintes($dbcon,$POST['task_alert_id']);
                    $alert_date . "-".$gap_mints." minutes";
                    $filt_alert_date = date("Y-m-d H:i:s", strtotime($alert_date . "-".$gap_mints." minutes"));//Subtract Minutes
                    $info['alert_date_time']	= date('Y-m-d H:i:s',strtotime($filt_alert_date));
		}
		$info['task_alert_id']		= $POST['task_alert_id'];
		$info['create_date']		= date('Y-m-d H:i:s');
		$info['entry_type']		= 2;//Fixed Appointment Type
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$ins_task_id=add_record('tbl_task', $info, $dbcon);

                if($ins_task_id){	
			$arr['msg']="1";							
		}
		else{
			$arr['msg']="0";
		}
		echo json_encode($arr);
	}
	else if(strtolower($POST['mode']) == "edit") {
		$info['task_location']		= $_POST['task_location'];
		$info['full_day_event']		= $_POST['full_day_event'];
		$info['appointment_start_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_start_time']));
		$info['appointment_end_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_end_time']));
		$info['appointment_subject']    = $_POST['appointment_subject'];
		$info['task_remark']		= $_POST['task_remark'];
		$info['assign_user_ids']	= implode(",",array_filter($POST['assign_user_ids']));
		$info['task_rel_id']		= $POST['task_rel_id'];
		$info['task_name']		= $POST['task_name'];
                $info['task_alert_id']		= $POST['task_alert_id'];
		
                if($POST['task_alert_id'] && $POST['task_alert_id']!='1'){//If alert is not none
                    $alert_date = date("Y-m-d H:i:s", strtotime($POST['appointment_start_time']));
                    $gap_mints = get_alert_mintes($dbcon,$POST['task_alert_id']);
                    $alert = $alert_date . "-".$gap_mints." minutes";
                    $filt_alert_date = date("Y-m-d H:i:s", strtotime($alert));//Subtract Minutes
                    $info['alert_date_time']	= date('Y-m-d H:i:s',strtotime($filt_alert_date));
		}
		
                $info['task_status']	= $POST['task_status'];
		if($info['task_status']=='1'){//Update Completion Date if Task Completed
			$info['task_completion_date']= date("Y-m-d H:i:s");
                        $info['closed_remark'] = $POST['closed_remark'];
		}
		else{
			$info['task_completion_date']= "0000-00-00 00:00:00";//Reset Date
		}
                
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

?>