<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
	$form="Task";
	$countryid='101';
	$stateid='1';
	$cityid='1';
        $task_due_date='';$alert_date_time='';
	if(strpos($_SERVER[REQUEST_URI], "task_edit")==true) {
		$mode="Edit";
		$task_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select task.*,usr.user_name from tbl_task as task
		left join users as usr on usr.user_id=task.user_id
		where task.task_id=$task_id";	
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$user_name=$rel['user_name'];
		$task_rel_id=$rel['task_rel_id'];
		$inquiry_id=$rel['inquiry_id'];
		
		if($rel['task_due_date']!="1970-01-01 00:00:00" && $rel['task_due_date']!="0000-00-00 00:00:00"){
			$task_due_date=date('d-m-Y h:i a',strtotime($rel['task_due_date']));
		}
		if($rel['alert_date_time']!="1970-01-01 00:00:00" && $rel['alert_date_time']!="0000-00-00 00:00:00"){
			$alert_date_time=date('d-m-Y h:i A',strtotime($rel['alert_date_time']));
		}
	}
	else {
		$mode="Add";
		if(strpos($_SERVER[REQUEST_URI], "task_flp")==true) {
			$prev_task_id=$dbcon->real_escape_string($_REQUEST['id']);
			$query="select task.*,usr.user_name from tbl_task as task
			left join users as usr on usr.user_id=task.user_id
			where task.task_id=$prev_task_id";	
			$rel=mysqli_fetch_assoc($dbcon->query($query));
			$task_rel_id=$rel['task_rel_id'];
			if($rel['inquiry_id']){
				$inquiry_id=$rel['inquiry_id'];
			}
		}
		else{
			$inquiry_id=$dbcon->real_escape_string($_REQUEST['id']);
			$task_rel_id='';
			if($inquiry_id){
				$task_rel_id=5;//Fixed Inquiry ID
			}
		}
		//$inquiry_date=date('d-m-Y');
		$user_name=$_SESSION['user_name'];
		$task_due_date=date('d-m-Y h:i A');
	}
	
$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
$set_head=mysqli_fetch_assoc($dbcon->query($set));
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container">
<?php include_once('../include/include_top_menu.php');?>
<!--sidebar start-->
<?php include_once('../include/left_menu.php');?>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
<section class="wrapper">

<div class="row">
<div class="col-lg-12">
	<!--breadcrumbs start -->
	<section class="panel">
		<header class="panel-heading">
			<h3><?=$mode .' '.$form?></h3>
			<!--<div class="text-center">Owner : <strong><?=$user_name?></strong></div>-->
		</header>	
		<div class="">
			<ul class="breadcrumb">
				<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="<?=ROOT.'task_list'?>"><?=$form?> List</a></li>
			</ul>
		</div>
	</section>
	<!--breadcrumbs end -->
</div>	
</div>
<!--state overview start-->
<div class="row">			
<div class="col-md-12">
<section class="panel">
<header class="panel-heading">
    <?=$mode.' '.$form?>
</header>	
<div class="panel-body">
	<form class="form-horizontal" role="form" id="task_add" action="javascript:;" method="post" name="task_add">
		<div class="row">
			
	<div class="clearfix"></div>
		<div class="col-md-12">
			<div class="form-group">
				<label class="col-md-2 control-label">Task</label>
				<div class="col-md-6"> 
					<select class="select2" id="task_type_id" name="task_type_id" onchange="validateDueDate(this.value,'<?=$task_due_date?>');">
						<option value="">Choose Task Type</option>$
						<?=get_master_category_dtl($dbcon,$rel['task_type_id'],10);//10:Task?>
					</select>
				</div>
			</div>	
		</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-4 control-label">Related To</label>
				<div class="col-md-6"> 
					<select class="select2" id="task_rel_id" name="task_rel_id" onchange="get_rel_task_divs(this.value)">
						<?=get_rel_task($dbcon,$task_rel_id);?>
					</select>
				</div>
			</div>	
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<div id="gen_rel_div">
					<label class="col-md-2 control-label">Name</label>
					<div class="col-md-8"> 
						<input type="text" class="form-control" id="task_name" name="task_name" value="<?=$rel['task_name']?>" placeholder="Task Name">
					</div>
				</div>
				<div id="person_rel_div" style="display:none;">
					<div class="col-md-10"> 
						<select class="select2" id="c_con_id" name="c_con_id">
							<?=get_contactperson_all($dbcon,$rel['c_con_id']);?>
						</select>
					</div>
					<div class="col-md-2"> 
						<button type="button" class="btn btn-primary" title="View Details" onclick="preview_rel_types()"><i class="fa fa-eye"></i></button>
					</div>
				</div>
				<div id="company_rel_div" style="display:none;">
					<div class="col-md-10"> 
						<select class="select2" id="cust_id" name="cust_id">
							<?=getcust($dbcon,$rel['cust_id']);?>
						</select>
					</div>
					<div class="col-md-2"> 
						<button type="button" class="btn btn-primary" title="View Details" onclick="preview_rel_types()"><i class="fa fa-eye"></i></button>
					</div>
				</div>
				<div id="inq_rel_div" style="display:none;">
					<div class="col-md-10"> 
                                            <select class="select2" id="inquiry_id" name="inquiry_id" onchange="load_inquiry_stage(this.value)" required>
							<?=get_inquiry($dbcon,$inquiry_id);?>
						</select>
					</div>
					<div class="col-md-2"> 
						<button type="button" class="btn btn-primary" title="View Details" onclick="preview_rel_types()"><i class="fa fa-eye"></i></button>
					</div>
				</div>
			</div>	
		</div>
        <div class="clearfix"></div>
        <div class="col-md-6" id="task_stage_div" style="display:none;">
            <div class="form-group">
                <label class="col-md-4 control-label">Stage</label>
                <div class="col-md-6"> 
                    <select class="select2" id="opp_id" name="opp_id" onchange="show_lost_reason();" >
                        <?=get_inquiry_stage($dbcon,$rel['opp_id']);?>
                    </select>
                </div>
            </div>	
        </div>
        <div class="col-md-6" id="task_sales_stage_div" style="display:none;">
            <div class="form-group">
                <label class="col-md-2 control-label" style="white-space:nowrap;">Sales Stage</label>
                <div class="col-md-6"> 
                    <select class="select2" id="sales_stage_id" name="sales_stage_id">
                        <option value="">Choose Sales Stage</option>
                        <?= get_master_category_dtl($dbcon,$rel['sales_stage_id'],7) ?>
                    </select>
                </div>	
            </div>	
        </div>
	<div class="clearfix"></div>
        <div class="col-md-12" id="lost_reason_div" style="display:none;">
            <div class="form-group">
                <label class="col-md-2 control-label">Lost/Won Reason*</label>
                <div class="col-md-6"> 
                    <textarea class="form-control" name="lost_reason" id="lost_reason" style="resize:both;" placeholder="Lost/Won Reason" rows="2" required/><?=$rel['lost_reason']?></textarea>
                </div>
            </div>	
        </div>
        <div class="clearfix"></div>
	<div class="col-md-12">
		<div class="form-group">
			<label class="col-md-2 control-label">Remark</label>
			<div class="col-md-6"> 
				<textarea class="form-control" id="task_remark" name="task_remark" style="resize:both;" placeholder="Remark" rows="3"><?=$rel['task_remark']?></textarea>
			</div>
		</div>	
	</div>
	<div class="clearfix"></div>
        <div class="col-md-12">
		<div class="form-group">
			<label class="col-md-2 control-label">Assign To</label>
			<div class="col-md-6"> 
				<select class="select2" id="assign_user_ids" name="assign_user_ids[]" placeholder="Choose Assign User" multiple="multiple">
					<?//=get_assign_users($dbcon, $rel['assign_user_ids'], " and user_id not in(".$_SESSION['user_id'].")");?>
					<?=get_assign_users($dbcon, $rel['assign_user_ids'], "");?>
				</select>
			</div>
		</div>	
	</div>
	<div class="clearfix"></div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-4 control-label">Priority</label>
			<div class="col-md-6"> 
				<select class="select2" id="task_priority_id" name="task_priority_id">
					<?=get_task_priority($dbcon,$rel['task_priority_id']);?>
				</select>
			</div>
		</div>	
	</div>
        <div class="clearfix"></div>
	<div class="col-md-12">
		<div class="form-group">
			<label class="col-md-2 control-label">Next Followup Date</label>
			<div class="col-md-6"> 
				<!--<input type="text" class="form-control default-date-picker reuired valid" id="task_due_date" name="task_due_date" value="<?=$rel['task_due_date']?>" placeholder="Due Date">-->
				<div data-date="<?=$task_due_date?>" class="input-group date form_datetime-meridian">
					  <input type="text" class="form-control" value="<?=$task_due_date?>" name="task_due_date" id="task_due_date" autocomplete="off">
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
				<select class="select2" id="task_alert_id" name="task_alert_id">
					<?=get_task_alert_types($dbcon,$rel['task_alert_id']);?>
				</select>
			</div>
                </div>
        </div>
        <? if($rel['task_alert_id']!='1' && $alert_date_time){?>
        <div class="col-md-12">
            <div class="form-group">
                <label class="col-md-2 control-label">Alert Date</label>
                <div class="col-md-6">
                    <div data-date="<?=$alert_date_time?>" class="input-group date form_datetime-meridian">
                        <input type="text" class="form-control" value="<?=$alert_date_time?>" name="alert_date_time" id="alert_date_time">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?}?>
	<hr/>
		<div class="clearfix"></div>
			
		</div>
		<div class="clearfix"></div>
		<div class="col-md-12 text-center">
			<button type="submit" class="btn btn-success" id="save" name="save">Save</button>
			<a href="<?=ROOT.'task_list'?>" type="button" class="btn btn-danger">Cancel</a>	
		</div>	
	</div>
</div><!--Vendor row end-->	
<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
<input type='hidden' name='eid' id='eid' value='<?=$task_id?>' />
<input type='hidden' name='prev_task_id' id='prev_task_id' value='<?=$prev_task_id?>' />

</form>
</div>	
</section>
</div>
</div>
<!--state overview end-->
</section>
</section>
<!--main content end-->
<!--footer start-->
	
	<?php include_once('../include/preview_rel_details.php');?>
	<?php include_once('../include/footer.php');?>
	<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/task.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
<?if($mode!='Add'){?>
	$('#task_rel_id').select2("readonly",true);
	$('#c_con_id').select2("readonly",true);
	$('#cust_id').select2("readonly",true);
	$('#inquiry_id').select2("readonly",true);
<?}?>
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
$(".form_datetime-meridian").datetimepicker({
    format: "dd-mm-yyyy HH:ii P",
    showMeridian: true,
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left"
});
/*$(function() { 
	$('#inquiry_date').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
	<?if($mode=='Add')
	{?>
	,startDate: 'd'//don't allow today and past dates
	<?}?>
	});
});*/
<?if($task_rel_id){?>
$(document).ready(function() {
	get_rel_task_divs(<?=$task_rel_id?>);
}); 
<?}?>
</script>
</body>
</html>