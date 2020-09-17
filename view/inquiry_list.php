<?php 
    session_start();
    include_once("../config/config.php");
    include_once("../config/session.php");
    include_once("../include/coman_function.php");
    $form="Opportunity";
    $infopage = pathinfo( __FILE__ );
     //echo '<pre>';print_r($_SESSION);exit;
    $_SESSION['page']=$infopage['filename'];
    
    if(isset($_SESSION['summary_start_date']) && !empty($_SESSION['summary_start_date']) 
            && isset($_SESSION['summary_end_date']) && !empty($_SESSION['summary_end_date'])){
        $start_date = $_SESSION['summary_start_date'];
        $end_date = $_SESSION['summary_end_date'];
    } else {
        $start_date = date('1-m-Y');
        $end_date = date("d-m-Y");
    }
    $stage_id = (isset($_REQUEST['stage_id']) && !empty($_REQUEST['stage_id'])) ? $_REQUEST['stage_id'] : '';
    $user_id = (isset($_REQUEST['user_id']) && !empty($_REQUEST['user_id'])) ? $_REQUEST['user_id'] : '';
    $sales_stage_id = (isset($_REQUEST['sales_stage_id']) && !empty($_REQUEST['sales_stage_id'])) ? $_REQUEST['sales_stage_id'] : '';
    $source_id = (isset($_REQUEST['source_id']) && !empty($_REQUEST['source_id'])) ? $_REQUEST['source_id'] : '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container" class="sidebar-closed">
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
                        <h3> <?=$form?> List</h3>
                    </header>
                    <ul class="breadcrumb">
                            <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
                            <li><a href="<?=ROOT.'inquiry_list'?>"><?=$form?> List</a></li>
                    </ul>
                </section>
                <!--breadcrumbs end -->
            </div>
        </div>
        <div class="row">		
            <!--state overview start-->
            <div class="row">			
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <span class="tools pull-right">
                                    <a href="<?=ROOT.'inquiry_add'?>"><button class="btn btn-success btn-flat">Add <?=$form?></button></a>
                            </span>
                            <div class="col-md-12"	style="height:20px;" ></div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4" style="text-align: right;">Start :</label>
                                        <div class="col-md-6">
                                            <input id="start_date" name="start_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_inquiry_datatable();">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="text-align: right;">End :</label>
                                        <div class="col-md-6"> 
                                            <input id="end_date" name="end_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_inquiry_datatable();">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="height:20px;" ></div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4" style="text-align: right;">Stage :</label>
                                        <div class="col-md-6">
                                            <select class="select2" name="stage_id" id="stage_id" onChange="load_inquiry_datatable();">
                                                <?= get_inquiry_stage($dbcon,$stage_id); ?>	
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="text-align: right;">User :</label>
                                        <div class="col-md-6"> 
                                            <select class="select2" id="user_id" name="user_id" onChange="load_inquiry_datatable();">
                                                <?= get_assign_users_inq($dbcon,$user_id); ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="height:20px;" ></div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="text-align: right;">Source :</label>
                                        <div class="col-md-6"> 
                                            <select class="select2" id="source_id" name="source_id" onChange="load_inquiry_datatable();">
                                                <?=get_refer_by($dbcon,$source_id);?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" style="text-align: right;">Sales Stage :</label>
                                        <div class="col-md-6"> 
                                            <select class="select2" id="sales_stage_id" name="sales_stage_id" onChange="load_inquiry_datatable();">
                                                <option value="">Choose Sales Stage</option>
                                                <?=get_master_category_dtl($dbcon,$sales_stage_id,7);//7:Sales Stage?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<input type="hidden" name="user_id" id="user_id" value="<?= $user_id; ?>" />-->
                            <div class="col-md-12"	style="height:20px;" ></div>
                        </header>	
                        <div class="panel-body">
                            <div class="adv-table">
                                <table class="display table table-bordered table-striped" id="inquiry-table">
                                    <thead>
                                        <tr>
                                            <th>Owner</th>
                                            <!--<th>Inquiry No</th>-->
                                            <th>Opportunity Date</th>
                                            <th>Opportunity Name</th>
                                            <th>Company</th>
                                            <th>Person</th>
                                            <th>Stage</th>
                                            <th>Amount</th>
                                            <th>Last Updated</th>
                                            <th class="hidden-phone">Action</th>	
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>				 
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!--state overview end-->
        </div>
    </section>
</section>
<!--main content end-->
<!--footer start-->
<div id="task_model_popup"></div>
<?php include_once('../include/preview_flp_hist.php');?>
<?php include_once('../include/send_email.php');?>
<?php include_once('../include/footer.php');?>
<!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/inquiry.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
function cb(start, end) {
	$('.datepikerdemo span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
}
cb(moment().subtract(29, 'days'), moment());

$('.datepikerdemo').daterangepicker({       
	locale: {
		format: 'DD-MM-YYYY'
	},
	"autoApply": true,	
	"startDate": $('#from_date').val(),
	"endDate": $('#to_date').val(),	
	ranges: {
		'Today': [moment(), moment()],
		'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		'Last 7 Days': [moment().subtract(6, 'days'), moment()],
		'Last 30 Days': [moment().subtract(29, 'days'), moment()],
		'This Month': [moment().startOf('month'), moment().endOf('month')],
		'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	}
}, cb);
$('.date-set').click(function(){
	$('.datepikerdemo').trigger('click');
});
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
});

CKEDITOR.replace( 'email_content', {
	enterMode: CKEDITOR.ENTER_BR
});
</script>
</body>
</html>
