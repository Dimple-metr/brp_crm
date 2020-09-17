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

if(strtolower($POST['mode']) == "add_task") {

    $info['task_type_id']		= $POST['task_type_id'];
    $info['task_rel_id']		= 5; //fixed realted Id
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
    $ins_task_id = add_record('tbl_task', $info, $dbcon);
    
    if($ins_task_id){
        $inq_data = array();
        $inq_data['opp_id']			= $POST['opp_id'];
        $inq_data['sales_stage_id']         = $POST['sales_stage_id'];
        $inq_id = update_record('tbl_inquiry', $inq_data,"inquiry_id=".$POST['inquiry_id'], $dbcon);
    }
		
    //Complete Prev Flp Task
    if($POST['prev_task_id']){
        $upd_qry = "update tbl_task set task_status=1,task_completion_date='".date("Y-m-d H:i:s")."' where task_id=".$POST['prev_task_id'];
        $upd_qry_rs = $dbcon->query($upd_qry);
    }
    
    		
    if($ins_task_id){	
            $arr['msg']="1";							
    }
    else{
            $arr['msg']="0";
    }
    echo json_encode($arr);
}
else if(strtolower($POST['mode']) == "add_appointment") {

        $info['task_location']		= $_POST['task_location'];
        $info['full_day_event']		= $_POST['full_day_event'];
        $info['appointment_start_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_start_time']));
        $info['appointment_end_time']	= date('Y-m-d H:i:s',strtotime($POST['appointment_end_time']));
        $info['appointment_subject']    = $_POST['appointment_subject'];
        $info['task_remark']		= $_POST['task_remark'];
        $info['assign_user_ids']	= implode(",",array_filter($POST['assign_user_ids']));
        $info['task_rel_id']		= 5; //fixed related Id;
        $info['task_name']              = $POST['task_name'];
        $info['c_con_id']		= $POST['c_con_id'];
        $info['cust_id']		= $POST['cust_id'];
        $info['inquiry_id']		= $POST['inquiry_id'];

        if($POST['task_alert_id'] && $POST['task_alert_id']!='1'){//If alert is not none
            $alert_date = date("Y-m-d H:i:s", strtotime($POST['appointment_start_time']));
            $gap_mints = get_alert_mintes($dbcon,$POST['task_alert_id']);
            $filt_alert_date = date("Y-m-d H:i:s", strtotime($alert_date . "-".$gap_mints." minutes"));//Subtract Minutes
            $info['alert_date_time']	= date('Y-m-d H:i:s',strtotime($filt_alert_date));
        }
        $info['task_alert_id']		= $POST['task_alert_id'];
        $info['create_date']		= date('Y-m-d H:i:s');
        $info['entry_type']		= 2;//Fixed Appointment Type
        $info['cdate']			= date("Y-m-d H:i:s");
        $info['user_id']		= $_SESSION['user_id'];
        $info['company_id']		= $_SESSION['company_id'];
        $ins_task_id = add_record('tbl_task', $info, $dbcon);

        if($ins_task_id){	
                $arr['msg']="1";							
        }
        else{
                $arr['msg']="0";
        }
        echo json_encode($arr);
}