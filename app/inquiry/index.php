<?php

session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");
include_once("../common_send_email.php");

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

    if($POST['start_date'] && $POST['end_date']){
        $_SESSION['start'] = $start_date = $POST['start_date'];
        $_SESSION['end'] = $end_date = $POST['end_date'];
    } 
    else if(isset($_SESSION['summary_start_date']) && !empty($_SESSION['summary_start_date']) 
            && isset($_SESSION['summary_end_date']) && !empty($_SESSION['summary_end_date'])){
        $start_date = $_SESSION['summary_start_date'];
        $end_date = $_SESSION['summary_end_date'];
    } else {
        $start_date = date('1-m-Y');
        $end_date = date("d-m-Y");
    }
    
    $where='';
    $stage_flag = TRUE;
    
    if(isset($POST['stage_id']) && !empty($POST['stage_id'])){
        $stage_where = " AND inq.opp_id IN(".$POST['stage_id'].")";
        $stage_flag = FALSE;
    }

    if(isset($POST['sales_stage_id']) && !empty($POST['sales_stage_id'])){
        $where .= " AND inq.sales_stage_id IN(".$POST['sales_stage_id'].") ";
        $stage_flag = FALSE;
    }

    if(isset($POST['source_id']) && !empty($POST['source_id'])){
        $where .= " AND inq.rb_id IN(".$POST['source_id'].") ";
        $stage_flag = FALSE;
    }

    if(isset($POST['assign_user_id']) && !empty($POST['assign_user_id'])){
        $where .= " AND find_in_set(".$POST['assign_user_id'].",assign_user_inq_ids)";
        $stage_flag = FALSE;
    }
    
    if(isset($POST['user_id']) && !empty($POST['user_id'])){
        $where .= " AND usr.user_id IN(".$POST['user_id'].") ";
        $stage_flag = FALSE;
    }
    
    if(!empty($start_date) && !empty($end_date)){
        $where.="  AND inquiry_date >= '".date('Y-m-d',strtotime($start_date))."' AND inquiry_date <= '".date('Y-m-d',strtotime($end_date))."'";
    }
    
    if($stage_flag){
        $stage_where = " AND inq.opp_id NOT IN(".WON.",".CLOSED_LOST.")";
    }
    //echo $where;
    $appData = array();
    $i=1;
    $aColumns = array('inq.inquiry_id','usr.user_name', 'inq.inquiry_no', 'inq.inquiry_date', 'inq.inquiry_name', 'cust.cust_name','cust.cust_mobile', 'per.c_con_fname','per.c_con_mobile', 'stage.opp_stage','stage.opp_color', 'inq.inquiry_status','inq.cdate','inq.cust_id','inq.g_total','inq.cdate','updated_user.user_name as updated_by');
    $sIndexColumn = "inq.inquiry_id";
    $isWhere = array("inq.inquiry_status = 0".$stage_where.$where.check_user_inq('inq'));
    $sTable = "tbl_inquiry as inq";
    $isJOIN = array('left join tbl_customer as cust on cust.cust_id=inq.cust_id', 'left join tbl_cust_contact as per on per.c_con_id=inq.c_con_id', 'left join tbl_opportunity_mst as stage on stage.opp_id=inq.opp_id', 'left join users as usr on usr.user_id=inq.user_id','left join users as updated_user on updated_user.user_id=inq.updated_by_userid');
    $hOrder = "inq.cdate desc";
    include('../../include/pagging.php');
    //$appData = array();
    $id=1;
    
    foreach($sqlReturn as $row) {
        $bg_color = ($row['opp_color'])? trim($row['opp_color']) : '';
        $row_data = array();
        $row_data[] = $row['user_name'];
        //$row_data[] = $row['inquiry_no'];
        $row_data[] = date('d M, Y',strtotime($row['inquiry_date']));
        $row_data[] = $row['inquiry_name'];
        $row_data[] = '<strong>'.$row['cust_name'].'</strong><br/>'.$row['cust_mobile'];
        $row_data[] = '<strong>'.$row['c_con_fname'].'</strong><br/>'.$row['c_con_mobile'];
        $row_data[] = '<span class="btn btn-sm" style="background-color: '.$bg_color.';">'.$row['opp_stage'].'</span>';
        $row_data[] = $row['g_total'];
        $row_data[] = $row['updated_by'].' updated on '.date('d M, Y',strtotime($row['cdate'])).' by '.date('h:m A',strtotime($row['cdate']));
			
        $edit='';$delete='';$view_hist_btn='';$send_email='';
        if($edit_btn_per) {
            $edit = '<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'inquiry_edit/'.$row['inquiry_id'].'"><i class="fa fa-pencil"></i></a>';
        }
        if($delete_btn_per) {
            $inquiry_no = $dbcon->real_escape_string($row['inquiry_no']);
            $delete = '<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_inquiry('.$row['inquiry_id'].',\''.$inquiry_no.'\')"><i class="fa fa-trash-o"></i></button>';
        }
		
        $add_task_btn = $add_appointment_btn = '';
        $view_hist_btn = '<button class="btn btn-xs btn-info" data-original-title="View History" data-toggle="tooltip" data-placement="top" onClick="view_followup_hist('.$row['inquiry_id'].')"><i class="fa fa-history"></i></button>';

        $send_email = '<button class="btn btn-xs btn-primary" data-original-title="Send Email" data-toggle="tooltip" data-placement="top" onClick="open_inq_email('.$row['inquiry_id'].','.$row['cust_id'].')"><i class="fa fa-envelope"></i></button>'; 

        $add_task_btn = '<button class="btn btn-xs btn-primary" data-original-title="Add Task" data-toggle="tooltip" data-placement="top" onClick="open_add_task_popup('.$row['inquiry_id'].',1)"><i class="fa fa-list-alt"></i></button>';
        
        $add_appointment_btn = '<button class="btn btn-xs btn-primary" data-original-title="Add Appointment" data-toggle="tooltip" data-placement="top" onClick="open_add_task_popup('.$row['inquiry_id'].',2)"><i class="fa fa-clock-o"></i></button>';
        
        $row_data[] = $edit.' '.$delete.' '.$view_hist_btn.' '.$send_email.' '.$add_task_btn.' '.$add_appointment_btn;

        $appData[] = $row_data;
        $id++;
    }
    $output['aaData'] = $appData;
    echo json_encode( $output );
}
else if(strtolower($POST['mode']) == "add") {
	
        $info['inquiry_no']		= load_inquiry_no($dbcon);
        //Update Start series of No
        $query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE status=0 and type_id=1 and company_id=".$_SESSION['company_id']);

        $info['inquiry_date']           = date('Y-m-d',strtotime($POST['inquiry_date']));
        $info['cust_id']		= $POST['cust_id'];
        $info['c_con_id']		= $POST['c_con_id'];
        $info['assign_user_inq_ids']    = $POST['assign_user_inq_ids'];
        $info['inquiry_name']           = $_POST['inquiry_name'];
        $info['closing_date']           = date('Y-m-d',strtotime($POST['closing_date']));
        $info['closed_reason']		= $POST['closed_reason'];
        $info['t_id']			= $POST['t_id'];
        $info['opp_id']			= $POST['opp_id'];
        $info['stage_prob']		= $POST['stage_prob'];
        $info['sales_stage_id']         = $POST['sales_stage_id'];
        $info['inquiry_type_id']        = $POST['inquiry_type_id'];
        $info['rb_id']			= $POST['rb_id'];
        $info['inquiry_cat_id']         = $POST['inquiry_cat_id'];
        $info['currency_id']            = $POST['currency_id'];
        $info['g_total']		= $POST['g_total'];
        $info['inq_desc']		= $_POST['inq_desc'];
        $info['inq_comp_desc']          = $_POST['inq_comp_desc'];

        $info['create_date']            = date('Y-m-d H:i:s');
        $info['cdate']			= date("Y-m-d H:i:s");
        $info['user_id']		= $POST['assign_user_inq_ids']; //$_SESSION['user_id'];
        $info['updated_by_userid']      = $_SESSION['user_id'];
        $info['company_id']		= $_SESSION['company_id'];
	//echo '<pre>';        print_r($info);
        //var_dump($info);
	
        $ins_inquiry_id=add_record('tbl_inquiry', $info, $dbcon);
        
        /*Insert in task table, when new inquiry add */
        $task_info['task_type_id']	= $POST['task_type_id'];
        $task_info['task_rel_id']	= 5;
        $task_info['task_name']		= $POST['inquiry_name'];
        $task_info['c_con_id']		= $POST['c_con_id'];
        $task_info['cust_id']		= $POST['cust_id'];
        $task_info['inquiry_id']	= $ins_inquiry_id;
        $task_info['opp_id']		= $POST['opp_id'];
        $task_info['sales_stage_id']    = $POST['sales_stage_id'];
        $task_info['task_remark']	= 'New Inquiry Added';
        $task_info['assign_user_ids']   = $POST['assign_user_inq_ids'];
        $task_info['task_priority_id']  = $POST['task_priority_id'];
        $task_info['task_due_date']     = date("Y-m-d H:i:s",strtotime($POST['task_due_date']));
        $task_info['create_date']       = date('Y-m-d H:i:s');
        $task_info['entry_type']	= 1;//Fixed Task Type
        $task_info['cdate']             = date("Y-m-d H:i:s");
        $task_info['user_id']		= $POST['assign_user_inq_ids'];
        $task_info['company_id']	= $_SESSION['company_id'];
        $ins_task_id=add_record('tbl_task', $task_info, $dbcon);
        //echo '<pre>';        print_r($task_info);
        //exit;
        /*Update Trn Table Start*/
        if($ins_inquiry_id){
                $infotrn['inquiry_id']			= $ins_inquiry_id;
                $infotrn['inquiry_trn_status']	= 0;
                $updatetrnid=update_record('tbl_inquiry_trn', $infotrn,"inquiry_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
        }
        /*Update Trn Table End*/

        /*Update Note Trn Table Start*/
        if($ins_inquiry_id){
                $infonote['inquiry_id']			= $ins_inquiry_id;
                $infonote['inq_note_status']	= 0;
                $updatetrnid=update_record('tbl_inq_notes', $infonote,"inq_note_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
        }
        /*Update Note Trn Table End*/

        /*Update Attach Trn Table Start*/
        if($ins_inquiry_id){
                $infoattch['inquiry_id']			= $ins_inquiry_id;
                $infoattch['inq_attach_status']	= 0;
                $updatetrnid=update_record('tbl_inq_attach', $infoattch,"inq_attach_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
        }
        /*Update Attach Trn Table End*/
		
        if($ins_inquiry_id){	
                $arr['msg']="1";							
        }
        else{
                $arr['msg']="0";
        }
        echo json_encode($arr);
}
else if(strtolower($POST['mode']) == "edit") {
    
        $old_users = $dbcon->query("SELECT assign_user_inq_ids FROM tbl_inquiry WHERE inquiry_id = ".$POST['eid'])
            ->fetch_object()->assign_user_inq_ids;
        if($old_users){
            $assigned_users_arr = explode(',', $old_users);
            if(!in_array($POST['assign_user_inq_ids'], $assigned_users_arr)){
                $assigned_users = $old_users.','.$POST['assign_user_inq_ids'];
            } else {
                $assigned_users = $old_users;
            }
        }
    
        $info['inquiry_date']           = date('Y-m-d',strtotime($POST['inquiry_date']));
        $info['cust_id']		= $POST['cust_id'];
        $info['c_con_id']		= $POST['c_con_id'];
        $info['assign_user_inq_ids']    = $assigned_users;
        $info['inquiry_name']           = $_POST['inquiry_name'];
        $info['closing_date']           = date('Y-m-d',strtotime($POST['closing_date']));
        $info['closed_reason']		= $POST['closed_reason'];
        $info['t_id']			= $POST['t_id'];
        $info['opp_id']			= $POST['opp_id'];
        $info['stage_prob']		= $POST['stage_prob'];
        $info['sales_stage_id']         = $POST['sales_stage_id'];
        $info['inquiry_type_id']        = $POST['inquiry_type_id'];
        $info['rb_id']			= $POST['rb_id'];
        $info['inquiry_cat_id']         = $POST['inquiry_cat_id'];
        $info['currency_id']            = $POST['currency_id'];
        $info['g_total']		= $POST['g_total'];
        $info['inq_desc']		= $_POST['inq_desc'];
        $info['inq_comp_desc']          = $_POST['inq_comp_desc'];
        $info['cdate']			= date("Y-m-d H:i:s");
        $info['updated_by_userid']      = $_SESSION['user_id'];
        $info['user_id']		= $POST['assign_user_inq_ids'];
        //$info['company_id']		= $_SESSION['company_id'];
        if($POST['opp_id'] == WON){
            $info['won_by_userid']      = $_SESSION['user_id'];
            $info['won_date']           = date("Y-m-d H:i:s");
            update_record('tbl_task', array('task_status'=>'1','task_completion_date'=>date("Y-m-d H:i:s")), "inquiry_id=".$POST['eid'], $dbcon);
        }
        if($POST['opp_id'] == CLOSED_LOST){
            $info['lost_by_userid']      = $_SESSION['user_id'];
            update_record('tbl_task', array('task_status'=>'1','task_completion_date'=>date("Y-m-d H:i:s")), "inquiry_id=".$POST['eid'], $dbcon);
        }
        //echo '<pre>';print_r($info);exit;
        $updateid = update_record('tbl_inquiry', $info, "inquiry_id=".$POST['eid'], $dbcon);
		
        if($updateid){	
                $arr['msg']="update";
        }
        else{
                $arr['msg']=0;
        }
        echo json_encode($arr);
}
else if(strtolower($POST['mode']) == "delete") {
        $info['inquiry_status']	= 2;
        $infotrn['inquiry_trn_status']	= 2;
        $updateid = update_record('tbl_inquiry', $info, "inquiry_id=".$POST['inquiry_id'], $dbcon);
        $updatetrnid = update_record('tbl_inquiry_trn', $infotrn, "inquiry_id=".$POST['inquiry_id'], $dbcon);

        if($updateid)
                echo "1";	
        else
                echo "0";			
}
else if(strtolower($POST['mode']) == "add_field") {
        $info1['product_id']	= $POST['product_id'];
        $info1['cat_id']		= $POST['cat_id'];
        $info1['pg_id']			= $POST['pg_id'];
        $info1['level_id']		= $POST['level_id'];
        $info1['unitid']		= $POST['unitid'];
        $info1['product_qty']	= $POST['product_qty'];
        $info1['product_rate']	= $POST['product_rate'];
        $info1['product_amount']= $POST['product_amount'];
        $info1['product_desc']	= $_POST['product_desc'];
        $info1['product_spec']	= $_POST['product_spec'];
        $info1['user_id']		= $_SESSION['user_id'];
        $info1['company_id']	= $_SESSION['company_id'];
        $table='tbl_inquiry_trn';$tableid='inquiry_trn_id';
        if(!empty($POST['inquiry_id'])) {
                $info1['inquiry_id']= $POST['inquiry_id'];
        }
        else{
                $info1['inquiry_trn_status']= 3;
        }
		
        if(empty($POST['edit_id'])) {
                $inserid = add_record($table, $info1, $dbcon);
        }
        else {
                $updateid = update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
        }
}
else if(strtolower($POST['mode'])=="show_data") {
        $str='';
        $delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);
        $chkmode=$POST['modee'];
		
        if($POST['inquiry_id']){
                $query="select trn.*,pro.product_name,cat.cat_name,grp.pg_name,unit.unit_name from tbl_inquiry_trn as trn 
                left join tbl_product as pro on pro.product_id=trn.product_id
                left join tbl_category as cat on cat.cat_id=trn.cat_id
                left join tbl_product_grp as grp on grp.pg_id=trn.pg_id
                left join unit_mst as unit on unit.unitid=trn.unitid
                where trn.inquiry_trn_status=0 and trn.inquiry_id=".$POST['inquiry_id'];
        }
        else{
                $query="select trn.*,pro.product_name,cat.cat_name,grp.pg_name,unit.unit_name from tbl_inquiry_trn as trn 
                left join tbl_product as pro on pro.product_id=trn.product_id
                left join tbl_category as cat on cat.cat_id=trn.cat_id
                left join tbl_product_grp as grp on grp.pg_id=trn.pg_id
                left join unit_mst as unit on unit.unitid=trn.unitid
                where trn.inquiry_trn_status=3 and trn.user_id=".$_SESSION['user_id'];
        }
        $result=$dbcon->query($query);
        $str.='<table class="display table table-bordered table-striped" style="width:110%;">
                <tr>';
        if($chkmode!='VIEW'){ 
            $str.='<th width="5%" class="text-center">Action</th>';
        }
            $str.='<th width="20%" class="text-center">Product Name</th>
                    <!--<th width="10%" class="text-center">Product Category</th>-->
                    <th width="10%" class="text-center">Product Group</th>
                    <!--<th width="2%" class="text-center">Level</th>-->
                    <th width="5%" class="text-center">Quantity</th>
                    <th width="3%" class="text-center">Unit</th>
                    <th width="8%" class="text-center">Rate</th>
                    <th width="12%" class="text-center">Amount</th>				  
                    <th width="10%" class="text-center">Specification</th>				  
                </tr>
                <tbody>';
		if(mysqli_num_rows($result)>0){
                    $i=1;
                    while($rel=mysqli_fetch_assoc($result)){
				
                    $str.='<tr> ';
                        //echo $chkmode;
                        if($chkmode!='VIEW'){ 
                            $str.='<td style="vertical-align:middle"> 
                                    <button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_trn_data('.$rel['inquiry_trn_id'].')"><i class="fa fa-pencil"></i></button>';
                            if($delete_btn_per){
                                $str .= '&nbsp;<button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_trn_data('.$rel['inquiry_trn_id'].')">X</button>';
                            }
                            $str .= '</td>';
                        } 
                            $str.='<td style="vertical-align:top;">
                                        <strong>'.$rel['product_name'].'</strong><br/>
                                        <strong>Desc:</strong> '.(nl2br($rel['product_desc'])).'
                                    </td>
                                    <!--<td style="vertical-align:top;" class="text-center">
                                        '.$rel['cat_name'].'
                                    </td>-->
                                    <td style="vertical-align:top;" class="text-center">
                                        '.$rel['pg_name'].'
                                    </td>
                                    <!--<td style="vertical-align:top;" class="text-center">
                                        '.$rel['level_id'].'
                                    </td>-->
                                    <td style="vertical-align:top;" class="text-center">
                                        '.$rel['product_qty'].'
                                    </td>
                                    <td style="vertical-align:top;" class="text-center">
                                        '.$rel['unit_name'].'
                                    </td>
                                    <td style="vertical-align:top;" class="text-right">
                                        '.$rel['product_rate'].'
                                    </td>
                                    <td style="vertical-align:top;" class="text-right">
                                        <input type="hidden" name="amount[]" value="'.$rel['product_amount'].'">
                                        '.$rel['product_amount'].'
                                    </td>
                                    <td style="vertical-align:top;">
                                        '.$rel['product_spec'].'
                                    </td>	
				</tr>';
				$i++;
                    }
		} else{
                    $str.= '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		
        $str.= '</tbody>
            </table>';
    echo $str;
}
else if(strtolower($POST['mode'])== "edit_trn_data") {
    $q = $dbcon -> query("SELECT trn.* FROM tbl_inquiry_trn as trn WHERE inquiry_trn_id = '$POST[inquiry_trn_id]'");
    $r = $q->fetch_assoc();
    echo json_encode($r);
}
else if(strtolower($POST['mode'])== "delete_trn_data") {
		$row=array();
		$info['inquiry_trn_status']=2;	
		$updateid=update_record('tbl_inquiry_trn', $info, "inquiry_trn_id=".$POST['inquiry_trn_id'] , $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		echo json_encode($row);
}
else if(strtolower($POST['mode']) == "add_inq_note_field") {
		$info1['inq_note_title']	= $POST['inq_note_title'];
		$info1['inq_note_desc']		= $_POST['inq_note_desc'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		$table='tbl_inq_notes';$tableid='inq_note_id';
		if(!empty($POST['inquiry_id'])) {
			$info1['inquiry_id']= $POST['inquiry_id'];
		}
		else{
			$info1['inq_note_status']= 3;
		}
		
		if(empty($POST['edit_inq_noteid'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_inq_noteid'] , $dbcon);	
		}
	}
else if(strtolower($POST['mode'])== "show_inq_note_data") {
    $delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);
    $chkmode=$POST['chkmode'];
        if($POST['inquiry_id']){
                $query="select mst.* from tbl_inq_notes as mst 
                where inq_note_status=0 and mst.inquiry_id=".$POST['inquiry_id'];
        }
        else{
                $query="select mst.* from tbl_inq_notes as mst 
                where inq_note_status=3 and mst.user_id=".$_SESSION['user_id'];
        }
        $result=$dbcon->query($query);
        echo '<table class="display table table-bordered table-striped">

                        <tr>
                                <th width="30%" class="text-center">Title</th>
                                <th width="60%" class="text-center">Description</th>';
                                if($chkmode!='VIEW')
                                {
                                echo'<th width="10%" class="text-center">Action</th>';
                                }
                        echo'</tr>
                        <tbody>';
        if(mysqli_num_rows($result)>0)
        {
                $i=1;
                while($rel=mysqli_fetch_assoc($result))
                {
                        echo '<tr> 
                                <td style="vertical-align:top;">
                                        <strong>'.$rel['inq_note_title'].'</strong>
                                </td>
                                <td style="vertical-align:top;" class="text-center">
                                        '.$rel['inq_note_desc'].'
                                </td>';
                                if($chkmode!='VIEW')
                                {
                                echo '<td style="vertical-align:top"> 
                                        <button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_inq_note_data('.$rel['inq_note_id'].')"><i class="fa fa-pencil"></i></button>';
                                if($delete_btn_per){
                                    echo ' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_inq_note_data('.$rel['inq_note_id'].')">X</button>';
                                }
                                echo '</td>';
                                }
                        echo'</tr>';
                        $i++;
                }
        }
        else{
                echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
        }

        echo '</tbody>
                        </table>';
}
else if(strtolower($POST['mode'])== "edit_inq_note_data") {
        $q = $dbcon -> query("SELECT mst.* FROM tbl_inq_notes as mst WHERE inq_note_id = '$POST[inq_note_id]'");
        $r = $q->fetch_assoc();
        echo json_encode($r);
}
else if(strtolower($POST['mode'])== "delete_inq_note_data") {
        $row=array();
        $info['inq_note_status']=2;	
        $updateid=update_record('tbl_inq_notes', $info, "inq_note_id=".$POST['inq_note_id'] , $dbcon);

        if($updateid)
                $row['res']="1";
        else
                $row['res']="0";
        echo json_encode($row);
}
else if(strtolower($POST['mode'])== "add_inq_attch_field") {
        $info1['inq_attch_doc_name']= $POST['inq_attch_doc_name'];
        $info1['inq_attch_file']	= upload_attch_file($_FILES);
        $info1['user_id']			= $_SESSION['user_id'];
        $info1['company_id']		= $_SESSION['company_id'];

        $table='tbl_inq_attach';$tableid='inq_attach_id';
        if(!empty($POST['inquiry_id'])) {
                $info1['inquiry_id']= $POST['inquiry_id'];
        }
        else{
                $info1['inq_attach_status']= 3;
        }

        $inserid=add_record($table, $info1, $dbcon);
}
else if(strtolower($POST['mode'])== "show_inq_attach_data") {
        $chkmode=$POST['modee'];
        $delete_btn_per = check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);
        if($POST['inquiry_id']){
                $query="select mst.* from tbl_inq_attach as mst 
                where inq_attach_status=0 and mst.inquiry_id=".$POST['inquiry_id'];
        }
        else{
                $query="select mst.* from tbl_inq_attach as mst 
                where inq_attach_status=3 and mst.user_id=".$_SESSION['user_id'];
        }
        $result=$dbcon->query($query);
        echo '<table class="display table table-bordered table-striped">
                <tr>
                        <th width="60%" class="text-center">Document Name</th>
                        <th width="30%" class="text-center">Attached Document</th>';
                        if($chkmode!='VIEW' && $delete_btn_per)
                        {
                        echo'<th width="10%" class="text-center">Action</th>';
                        }
                echo'</tr>
                <tbody>';
        if(mysqli_num_rows($result)>0)
        {
                $i=1;
                while($rel=mysqli_fetch_assoc($result))
                {
                        echo '<tr> 
                                <td style="vertical-align:top;">
                                        <strong>'.$rel['inq_attch_doc_name'].'</strong>
                                </td>
                                <td style="vertical-align:top;" class="text-center">
                                        <a href="'.ROOT.INQ_ATTACH_VWING.$rel['inq_attch_file'].'" class="btn btn-info" target="_blank"><i class="fa fa-eye"></i> VIEW</a>
                                </td>';
                        if($chkmode!='VIEW')
                        {
                            if($delete_btn_per){
                                echo '<td style="vertical-align:top"> 
                                        <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_inq_attach_data('.$rel['inq_attach_id'].')">X</button>
                                    </td>';
                            }
                        }
                        echo '</tr>';
                        $i++;
                }
        }
        else{
                echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
        }

        echo '</tbody>
                        </table>';
}
else if(strtolower($POST['mode'])== "delete_inq_attach_data") {
        $row=array();
        $del_attch_qry="select inq_attch_file from tbl_inq_attach where inq_attach_id=".$POST['inq_attach_id'];
        $del_attch_rel=mysqli_fetch_assoc($dbcon->query($del_attch_qry));
        unlink(INQ_ATTACH_UPING.$del_attch_rel['inq_attch_file']);

        $info['inq_attach_status']=2;	
        $updateid=update_record('tbl_inq_attach', $info, "inq_attach_id=".$POST['inq_attach_id'] , $dbcon);

        if($updateid)
                $row['res']="1";
        else
                $row['res']="0";
        echo json_encode($row);
}
else if(strtolower($POST['mode'])== "load_product_dtls") {
        $pro_qry="select * from tbl_product where product_id=".$POST['product_id'];
        $pro_rel=mysqli_fetch_assoc($dbcon->query($pro_qry));
        echo json_encode($pro_rel);
}
else if(strtolower($POST['mode'])== "view_followup_hist") {
        $inquiry_id=$POST['inquiry_id'];$str='';
        $inq_qry="select inq.inquiry_id,inq.inquiry_date,inq.inq_desc,inq.inq_comp_desc,inq.inquiry_name,cust.cust_name,
            usr.user_name, inq.inquiry_no, inq.inquiry_date, inq.inquiry_name, cust.cust_name,
            cust.cust_mobile,per.c_con_email, per.c_con_fname, per.c_con_lname,mcd.mcd_name,rb.rb_name,
            stage.opp_stage, stage.opp_color, inq.inquiry_status,inq.cdate,inq.cust_id,inq.g_total,inq.cdate
            from tbl_inquiry as inq
            left join tbl_customer as cust on cust.cust_id=inq.cust_id
            left join tbl_cust_contact as per on per.c_con_id=inq.c_con_id
            left join tbl_opportunity_mst as stage on stage.opp_id=inq.opp_id
            left join users as usr on usr.user_id=inq.user_id
            left join tbl_master_category_detail as mcd on mcd.mcd_id = inq.sales_stage_id
            left join tbl_refer_by as rb on rb.rb_id = inq.rb_id
            where inq.inquiry_id=".$inquiry_id;
        $inq_rel=mysqli_fetch_assoc($dbcon->query($inq_qry));
        $str.='<div class="col-md-12">
                    <div class="col-md-6"><strong>Inquiry Date : </strong>'.date('d-M-yy', strtotime($inq_rel['inquiry_date'])).'</div>
                </div>';
        $str.='<div class="col-md-12">
                    <div class="col-md-6"><strong>Company Name : </strong>'.$inq_rel['cust_name'].'</div>
                    <div class="col-md-6"><strong>Contact Person : </strong>'.$inq_rel['c_con_fname'].' '.$inq_rel['c_con_lname'].'</div>
                </div>';
        $str.='<div class="col-md-12">
                    <div class="col-md-6"><strong>Mobile : </strong>'.$inq_rel['cust_mobile'].'</div>
                    <div class="col-md-6"><strong>Email : </strong>'.$inq_rel['c_con_email'].'</div>
                </div>';
        $str.='<div class="col-md-12">
                    <div class="col-md-3"><strong>Sales stage : </strong>'.$inq_rel['mcd_name'].'</div>
                    <div class="col-md-3"><strong>Stage : </strong>'.$inq_rel['opp_stage'].'</div>
                    <div class="col-md-3"><strong>Source : </strong>'.$inq_rel['rb_name'].'</div>
                    <div class="col-md-3"><strong>Total : </strong>'.$inq_rel['g_total'].'</div>
                </div>';
        $str.='<br/><div class="col-md-12 text-left"><h4>Remarks</h4></div>';
        $str .= '<table class="display table table-bordered table-striped">
                <tr>
                    <td width="25%" class="text-left">
                            <strong>Description: </strong>'.$inq_rel['inq_desc'].'
                    </td>
                    <td width="25%" class="text-left">
                            <strong>Competition Status: </strong>'.$inq_rel['inq_comp_desc'].'
                    </td>
                </tr>
            </table>';
        $str .= '<div class="col-md-12 text-left"><h4>Task</h4></div>';

        $str.='<table class="display table table-bordered table-striped">
                        <tr>
                                <th class="text-center">Created</th>
                                <th class="text-center">Due Date</th>
                                <th class="text-center">Type</th>
                                <th class="text-center">Owner</th>
                                <th class="text-center">Priority</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Remarks</th>
                        </tr>';

        $flp_qry="select task.*,type.mcd_name,usr.user_name,prior.task_priority_name from tbl_task as task
        left join tbl_master_category_detail as type on type.mcd_id=task.task_type_id
        left join users as usr on usr.user_id=task.user_id
        left join task_priority_mst as prior on prior.task_priority_id=task.task_priority_id
        where task.task_status!=2 and task.entry_type=1 and task.inquiry_id=".$inquiry_id." order by create_date DESC";
        $flp_qry_rs=$dbcon->query($flp_qry);
        if(mysqli_num_rows($flp_qry_rs)){
                while($flp_rel=mysqli_fetch_assoc($flp_qry_rs)){
                        $str.='<tr>
                                <td class="text-left">'.(date("d-M-Y H:i: A",strtotime($flp_rel['create_date']))).'</td>
                                <td class="text-left">'.(date("d-M-Y H:i: A",strtotime($flp_rel['task_due_date']))).'</td>
                                <td class="text-left">'.$flp_rel['mcd_name'].'</td>
                                <td class="text-left">'.$flp_rel['user_name'].'</td>
                                <td class="text-center">'.$flp_rel['task_priority_name'].'</td>';

                        if($flp_rel['task_status']=='1'){
                                $str.='<td class="text-center btn-success">Completed</td>';
                        }
                        else{
                                $str.='<td class="text-center btn-warning">Pending</td>';			
                        }
                        $str.='<td class="text-center">'.(nl2br($flp_rel['task_remark'])).'</td>';
                        $str.='</tr>';
                }
        }
        else{
                $str.='<tr><td colspan="7" class="text-center">NO DATA FOUND!!!</td></tr>';
        }
        $str.='</table>';

        $str.='<div class="col-md-12 text-left"><h4>Appointment</h4></div>';

        $str.='<table class="display table table-bordered table-striped">
                        <tr>
                                <th class="text-center">Location</th>
                                <th class="text-center">Subject</th>
                                <th class="text-center">Start Time</th>
                                <th class="text-center">End Time</th>
                                <th class="text-center">Remarks</th>
                        </tr>';

        $task_qry="select task.* from tbl_task as task
        where task.task_status!=2 and task.entry_type=2 and task.inquiry_id=".$inquiry_id." order by create_date DESC";
        $task_qry_rs=$dbcon->query($task_qry);
        if(mysqli_num_rows($task_qry_rs)){
                while($apt_rel=mysqli_fetch_assoc($task_qry_rs)){
                        $str.='<tr>
                                <td class="text-left">'.$apt_rel['task_location'].'</td>
                                <td class="text-left">'.$apt_rel['appointment_subject'].'</td>
                                <td class="text-left">'.(date("d-M-Y H:i: A",strtotime($apt_rel['appointment_start_time']))).'</td>
                                <td class="text-left">'.(date("d-M-Y H:i: A",strtotime($apt_rel['appointment_end_time']))).'</td>';

                        $str.='<td class="text-center">'.(nl2br($apt_rel['task_remark'])).'</td>';
                        $str.='</tr>';
                }
        }
        else{
                $str.='<tr><td colspan="7" class="text-center">NO DATA FOUND!!!</td></tr>';
        }
        $str .='</table>';
        $str .= '<div class="col-md-1">
                    <a onclick="open_add_task_popup('.$inq_rel['inquiry_id'].',1);"  type="button" class="btn btn-primary" ><i class="fa fa-plus"></i> Task</a>
                </div>
                <div class="col-md-1">
                    <a onclick="open_add_task_popup('.$inq_rel['inquiry_id'].',2);" type="button" class="btn btn-info"><i class="fa fa-plus"></i> Appointment</a>
                </div>';

        $resp['inq_name'] = $inq_rel['inquiry_name'];
        $resp['html_resp']=$str;
        echo json_encode($resp);
}
else if(strtolower($POST['mode'])== "open_inq_email") {
        $set="select inq_email_content from tbl_company where company_id=".$_SESSION['company_id'];
        $set_head=mysqli_fetch_assoc($dbcon->query($set));
        $email_content = $set_head['inq_email_content'];
        $resp['email_content']	= $email_content;

        //Get Customer Detail
        $custqry="select cust_email from tbl_customer where cust_id=".$POST['cust_id'];
        $cust_rel=mysqli_fetch_assoc($dbcon->query($custqry));
        $resp['to_email_id']	= strtolower($cust_rel['cust_email']);

        echo json_encode($resp);
}
else if(strtolower($POST['mode'])== "send_mail") {
		//var_dump($POST);
		//exit;
		$inquiry_id=strtolower($POST['email_ref_id']);
		$to_email_id=strtolower($POST['to_email_id']);
		$ccemail_id=strtolower($POST['ccemail_id']);
		$bccemail_id=strtolower($POST['bccemail_id']);
		$email_subject=$_POST['email_subject'];
		$email_content=$_POST['email_content'];
		if(!empty($_FILES['email_attach']['tmp_name'])) {
			$file = upload_mail_attch_file($_FILES,$dbcon);
		}
		
		$files=array();
		array_push($files,$file);
		$resp=final_send_email($to_email_id,$ccemail_id,$bccemail_id,$email_subject,$email_content,$files);
		unlink(MAIL_ATTACH_UPING.$file);
		
		$arr['msg']=array();
		if($resp['code']=='success'){
			$arr['msg']='1';
		}
		else{
			$arr['msg']='0';
		}
		echo json_encode($arr);
	}

function upload_mail_attch_file($FILES)
{
	$rand=rand(0,99999999);
	if(!empty($FILES['email_attach']['tmp_name'])) {
		$temp = explode(".", $FILES["email_attach"]["name"]);
		$extension = strtolower(end($temp));
		$File = "mail_attch_".$rand.".".$extension;
		$tmp_name = $FILES["email_attach"]["tmp_name"];
		move_uploaded_file($tmp_name,MAIL_ATTACH_UPING.$File);

		return  $File;				
	}
}
function upload_attch_file($FILES)
{
	$rand=rand(0,99999999);
	if(!empty($FILES['inq_attch_file']['tmp_name'])) {
		$temp = explode(".", $FILES["inq_attch_file"]["name"]);
		$extension = strtolower(end($temp));
		$File = "inq_attch_".$rand.".".$extension;
		$tmp_name = $FILES["inq_attch_file"]["tmp_name"];
		move_uploaded_file($tmp_name,INQ_ATTACH_UPING.$File);

		return  $File;				
	}
}
function load_inquiry_no($dbcon){
	//Load no by Type ID
	$row=array();
	$query1="select * from tbl_invoicetype where status=0 and type_id=1 and company_id=".$_SESSION['company_id'];
	$rows=mysqli_fetch_assoc($dbcon->query($query1));
	$id=$rows['taxinvoice_start'];
	$id=$id+1;
	if($rows['invoice_format']=='2'){
		$row['invoiceno']= str_pad($id,4,"0",STR_PAD_LEFT).$rows['format_value'];
	}
	else if($rows['invoice_format']=='1'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT);
	}
	else if($rows['invoice_format']=='3'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT).$rows['end_format_value'];
	}
	else{
		$row['invoiceno']=str_pad($id,3,"0",STR_PAD_LEFT);
	}
	return $row['invoiceno'];
}	

?>