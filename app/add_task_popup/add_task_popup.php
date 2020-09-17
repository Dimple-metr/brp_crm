<?php  
    session_start();
    //error_reporting(E_ALL);
    include("../../config/config.php");
    include("../../config/session.php");
    include("../../include/function_database_query.php");
    include_once("../../include/coman_function.php");
    include_once('../include/include_css_file.php');
    
    $countryid='101';
    $stateid='1';
    $cityid='1';
    $user_name=$_SESSION['user_name'];
    $task_due_date = date('d-m-Y h:i A');
    $inquiry_id = $_POST['inquiry_id'];
    $entry_type = $_POST['entry_type'];
    $title = ($entry_type == '1') ? "Task" : "Appointment";
    
    $query = $dbcon -> query("SELECT inquiry_id, inquiry_name, sales_stage_id, opp_id FROM tbl_inquiry as inq WHERE inquiry_id = ".$inquiry_id);
    $inq_data = $query->fetch_assoc();
    //print_r($inq_data);

$html = '';
$html .= '
<div class="modal fade colored-header info" id="add_task_modal" role="dialog" style="z-index: 1041;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn_close close md-close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                <h3 class="modal-title">Add New '.$title.'</h3>
            </div>
            <div class="modal-body form">';
if($entry_type == '1'){
            $html .= '<form class="form-horizontal" role="form" id="task_add" action="javascript:;" method="post" name="task_add">
                        <div class="row">
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Task</label>
                                    <div class="col-md-6"> 
                                        <select class="select2 form-control" id="task_type_id" name="task_type_id" onchange="validateDueDate(this.value,\''.$task_due_date.'\');">
                                            <option value="">Choose Task Type</option>
                                            '.get_master_category_dtl($dbcon,'',10).'
                                        </select>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Related To</label>
                                    <div class="col-md-6"> 
                                        <select class="select2 form-control" id="task_rel_id" name="task_rel_id" disabled>
                                            '.get_rel_task($dbcon,5).'
                                        </select>
                                    </div>
                                </div>	
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div id="inq_rel_div">
                                        <div class="col-md-8"> 
                                            <select class="select2 form-control" id="sel_inquiry_id" name="inquiry_id" disabled>
                                                '.get_inquiry($dbcon,$inquiry_id).'
                                            </select>
                                        </div>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4" style="text-align: right;">Stage :</label>
                                    <div class="col-md-6">
                                        <select class="select2 form-control" name="opp_id" id="opp_id" onchange="show_close_reason(this.value);">
                                            '.get_inquiry_stage($dbcon,$inq_data['opp_id']).'	
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" style="text-align: right;">Sales Stage :</label>
                                    <div class="col-md-6"> 
                                        <select class="select2 form-control" id="sales_stage_id" name="sales_stage_id">
                                            <option value="">Choose Sales Stage</option>
                                            '.get_master_category_dtl($dbcon,$inq_data['sales_stage_id'],7).'
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12" id="closed_reason_div_popup" style="display: none;">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Reason to Close*</label>
                                    <div class="col-md-6"> 
                                        <textarea class="form-control" id="closed_reason" name="closed_reason" height="50px" width="300px" required="true" >'.$rel['closed_reason'].'</textarea>
                                    </div>	
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Remark</label>
                                    <div class="col-md-6"> 
                                            <textarea class="form-control" id="task_remark" name="task_remark" style="resize:both;" placeholder="Remark" rows="3"></textarea>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Assign To</label>
                                    <div class="col-md-6"> 
                                        <select class="select2" id="assign_user_ids" name="assign_user_ids[]" placeholder="Choose Assign User" multiple="multiple">
                                            '.get_assign_users($dbcon, $rel['assign_user_ids'], "").'
                                        </select>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Priority</label>
                                    <div class="col-md-6"> 
                                        <select class="select2 form-control" id="task_priority_id" name="task_priority_id">
                                            '.get_task_priority($dbcon,$rel['task_priority_id']).'
                                        </select>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Next Followup Date</label>
                                    <div class="col-md-8"> 
                                        <div data-date="'.$task_due_date.'" class="input-group date form_datetime-meridian">
                                            <input type="text" class="form-control" value="'.$task_due_date.'" name="task_due_date" id="task_due_date" autocomplete="off">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Alert</label>
                                    <div class="col-md-6"> 
                                            <select class="select2 form-control" id="task_alert_id" name="task_alert_id">
                                                    '.get_task_alert_types($dbcon,$rel['task_alert_id']).'
                                            </select>
                                    </div>
                                </div>		
                            </div>
                            <hr/>
                            <div class="clearfix"></div>
                        <div class="clearfix"></div>
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-success" id="save" name="save">Save</button>
                        </div>
                        <input type="hidden" name="mode" id="mode" value="add_task" />
                        <input type="hidden" name="inquiry_id" id="inquiry_id" value="'.$inquiry_id.'" />
                    </form>
                </div>';
                
} else {
    $html .= '
    <form class="form-horizontal" role="form" id="appointment_add" action="javascript:;" method="post" name="appointment_add">
        <div class="row">
            <div class="clearfix"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">Location*</label>
                    <div class="col-md-8"> 
                        <input type="text" class="form-control" id="task_location" name="task_location" placeholder="Location" value="'.$rel['task_location'].'">
                    </div>
                </div>	
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">Full Day Event</label>
                    <div class="col-md-8"> 
                        <label class="col-md-4 col-sm-6 " style="font-weight:bold;">
                            <input type="radio" id="full_day_event_yes" name="full_day_event" style="width: 15px;height: 15px;" value="1"> 
                        YES</label>
                        <label class="col-md-4 col-sm-6" style="font-weight:bold;">
                            <input type="radio" checked id="full_day_event_no" name="full_day_event" style="width: 15px;height: 15px;" value="0"> 
                        No</label>
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">Start Time*</label>
                    <div class="col-md-8"> 
                        <div data-date="" class="input-group date form_datetime-meridian">
                            <input type="text" class="form-control" value="" name="appointment_start_time" id="appointment_start_time">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                            </div>
                        </div>
                    </div>
                </div>	
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">End Time*</label>
                    <div class="col-md-8"> 
                        <div data-date="" class="input-group date form_datetime-meridian">
                            <input type="text" class="form-control" value="" name="appointment_end_time" id="appointment_end_time">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                            </div>
                        </div>
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="col-md-2 control-label">Subject*</label>
                    <div class="col-md-6"> 
                        <input type="text" class="form-control" id="appointment_subject" name="appointment_subject" placeholder="Subject">
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="col-md-2 control-label">Remark</label>
                    <div class="col-md-6"> 
                            <textarea class="form-control" id="task_remark" name="task_remark" style="resize:both;" placeholder="Remark" rows="5"></textarea>
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="col-md-2 control-label">Invites To</label>
                    <div class="col-md-6"> 
                        <select class="select2" id="assign_user_ids" name="assign_user_ids[]" placeholder="Choose Assign User" multiple="multiple">
                            '.get_assign_users($dbcon, $rel['assign_user_ids'], " and user_id not in(".$_SESSION['user_id'].")").'
                        </select>
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-md-4 control-label">Related To</label>
                    <div class="col-md-6"> 
                        <select class="select2 form-control" id="task_rel_id" name="task_rel_id" disabled>
                            '.get_rel_task($dbcon,5).'
                        </select>
                    </div>
                </div>	
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div id="inq_rel_div">
                        <div class="col-md-10"> 
                            <select class="select2 form-control" id="sel_inquiry_id" name="inquiry_id" disabled>
                                '.get_inquiry($dbcon,$inquiry_id).'
                            </select>
                        </div>
                    </div>
                </div>	
            </div>
            <div class="clearfix"></div>
            <div class="col-md-12">
                <div class="form-group">
                    <label class="col-md-2 control-label">Alert</label>
                    <div class="col-md-6"> 
                        <select class="select2 form-control" id="task_alert_id" name="task_alert_id">
                            '.get_task_alert_types($dbcon,$rel['task_alert_id']).'
                        </select>
                    </div>
                </div>	
            </div>
            <hr/>
            <div class="clearfix"></div>
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-success" id="save" name="save">Save</button>
            </div>
            <input type="hidden" name="mode" id="mode" value="add_appointment" />
            <input type="hidden" name="inquiry_id" id="inquiry_id" value="'.$inquiry_id.'" />
        </div>
    </form>';
}
$html .=   '</div>
        </div>	
    </div>
</div>';
$html .= '
    <script src="'.ROOT.'js/app/add_task_popup.js?'.time().'"></script>
    <script type="text/javascript">
    $("#inquiry_id").select2("readonly",true);
    $("#assign_user_ids").select2({
        width: "100%"
    });
    $(".form_datetime-meridian").datetimepicker({
        format: "dd-mm-yyyy HH:ii P",
        showMeridian: true,
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left",
        minDate: moment()
    });
</script>';

echo $html;

