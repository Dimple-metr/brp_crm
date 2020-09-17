<?php 
session_start();
include_once("../config/config.php");
//error_reporting(E_ALL);
include_once("../config/session.php");
include_once("../include/coman_function.php");
$infopage = pathinfo( __FILE__ );
$_SESSION['page'] = $infopage['filename'];
$form = "Opportunity";
$countryid = '101';
$stateid = '1';
$cityid = '1';
	
if(strpos($_SERVER[REQUEST_URI], "inquiry_edit") == true) {
    $mode = "Edit";
    $inquiry_id = $dbcon->real_escape_string($_REQUEST['id']);

    $query = "SELECT inquiry.*,usr.user_name FROM tbl_inquiry as inquiry
            LEFT JOIN users as usr ON usr.user_id = inquiry.user_id
            WHERE inquiry.inquiry_id = $inquiry_id";
    $rel = mysqli_fetch_assoc($dbcon->query($query));
    
    $inquiry_date = date('d-m-Y',strtotime($rel['inquiry_date']));
    $closing_date = '';
    if($rel['closing_date'] != "1970-01-01" && $rel['closing_date'] != "0000-00-00"){
            $closing_date = date('d-m-Y',strtotime($rel['closing_date']));
    }
    $cust_id = $rel['cust_id'];
    $user_name = $rel['user_name'];
    $assign_user_inq_ids = $rel['assign_user_inq_ids'];
                
} 
elseif(strpos($_SERVER[REQUEST_URI], "inquiry_view") == true) {
    $mode = "view";
    $inquiry_id = $dbcon->real_escape_string($_REQUEST['id']);
    $query = "SELECT inquiry.*,usr.user_name FROM tbl_inquiry as inquiry
            LEFT JOIN users as usr ON usr.user_id = inquiry.user_id
            WHERE inquiry.inquiry_id  =  $inquiry_id";
    $rel = mysqli_fetch_assoc($dbcon->query($query));
    $inquiry_date = date('d-m-Y',strtotime($rel['inquiry_date']));
    $closing_date = '';
    if($rel['closing_date'] != "1970-01-01" && $rel['closing_date'] != "0000-00-00"){
            $closing_date = date('d-m-Y',strtotime($rel['closing_date']));
    }
    $cust_id = $rel['cust_id'];
    $user_name = $rel['user_name'];
    $assign_user_inq_ids  =  $rel['assign_user_inq_ids'];
	
}
else {
    $mode = "Add";
    $inquiry_date = date('d-m-Y');
    $closing_date = '';
    $user_name = $_SESSION['user_name'];
    $assign_user_inq_ids  = $_SESSION['user_id'].',1' ;
		
}
	
$set = "select * from tbl_company where company_id = ".$_SESSION['company_id'];
$set_head = mysqli_fetch_assoc($dbcon->query($set));
?>
<!DOCTYPE html>
<html lang = "en">
<head>
	<?php include_once('../include/include_css_file.php');?>
</head>
<body>
    <section id="container" class="sidebar-closed"> <!--class="side bar-closed"-->
    <?php include_once('../include/include_top_menu.php');?>
    <!--side bar start-->
    <?php include_once('../include/left_menu.php');?>
    <!--side bar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                <!--bread crumbs start -->
                    <section class="panel">
                        <header class="panel-heading">
                            <h3><?=$mode .' '.$form?></h3>
                            <!--<div class="text-center">Owner : <strong><?=$user_name?></strong></div>-->
                        </header>	
                        <div class="">
                            <ul class="breadcrumb">
                                    <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
                                    <li><a href="<?=ROOT.'inquiry_list'?>"><?=$form?> List</a></li>
                            </ul>
                        </div>
                    </section>
                <!--bread crumbs end -->
                </div>	
            </div>
<!--state overview start-->
<div class="row">			
    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                    New <?=$form?>
            </header>	
            <div class="panel-body">
            <form class="form-horizontal" role="form" id="inquiry_add" action="javascript:;" method="post" name="inquiry_add">
		<div class="row">
                    <div class="clearfix"></div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Opportunity No*</label>
                                <div class="col-md-6">
                                        <input id="inquiry_no" name="inquiry_no" type="text" class="form-control" title="Enter Inquiry No" value="<?=$rel['inquiry_no']?>" placeholder="Inquiry No" readonly >		
                                </div>
                            </div>
			</div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Opportunity Date*</label>
                                <div class="col-md-6"> 
                                        <input id="inquiry_date" name="inquiry_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$inquiry_date?>" placeholder="Inquiry Date"<? echo ($mode=="view")?"readonly":""?>>
                                </div>
                            </div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Customer*</label>
                                <div class="col-md-6"> 
                                    <select class="select2" id="cust_id" name="cust_id" onchange="load_cust_person(this.value);copy_inq_name();"<? echo ($mode=="view")?"disabled":""?>>
                                        <?= getcust($dbcon,$cust_id) ?>
                                    </select>
                                </div>
                                <? if($mode=='Add'){ ?>
                                <div class="col-md-1">
                                    <button type="button" id="addcust" data-toggle="modal" data-target="#bs-example-modal-lg"  class="btn btn-primary"><i class="fa fa-plus"></i></button>
                                </div>
                                <?}?>
                                <div class="col-md-1">
                                    <button type="button" id="viewcompany" onclick="preview_company()" title="View Company" class="btn btn-primary"><i class="fa fa-eye"></i></button>
                                </div>
                            </div>	
			</div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Contact Person</label>
                                <div class="col-md-6"> 
                                        <select class="select2" id="c_con_id" name="c_con_id" <? echo ($mode=="view")?"disabled":""?> >
                                                <?=get_cust_contactperson($dbcon,$rel['c_con_id'],$cust_id);?>
                                        </select>
                                </div>
                                <div class="col-md-1">
                                        <button type="button" id="addcustper" onclick="open_cust_contact()" class="btn btn-primary"><i class="fa fa-plus"></i></button>
                                </div>
                                <div class="col-md-1">
                                        <button type="button" id="viewcustper" onclick="preview_cust_person()" title="View Contact Persons" class="btn btn-primary"><i class="fa fa-eye"></i></button>
                                </div>
                            </div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Opportunity Name*</label>
                                <div class="col-md-6"> 
                                    <input type="text" class="form-control" id="inquiry_name" name="inquiry_name" placeholder="Opportunity Name" value="<?=$rel['inquiry_name']?>"<? echo ($mode=="view")?"readonly":""?>>
                                </div>
                            </div>	
			</div>
			<div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Closing Date</label>
                                <div class="col-md-6">
                                    <input id="closing_date" name="closing_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$closing_date?>" placeholder="Closing Date" <? echo ($mode=="view")?"readonly":""?>>
                                </div>
                            </div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Territory</label> 
                                <div class="col-md-8">
                                    <select class="select2" id="t_id" name="t_id" <? echo ($mode=="view")?"disabled":""?>>
                                            <?=get_all_territory($dbcon,$rel['t_id']);?>
                                    </select>
                                </div>
                            </div>	
			</div>
			<div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Stage*</label>
                                <div class="col-md-8"> 
                                    <select class="select2" id="opp_id" name="opp_id" onchange="load_opp_stage_prob(this.value);" <? echo ($mode=="view")?"disabled":""?>>
                                        <?=get_inquiry_stage($dbcon,$rel['opp_id']);?>
                                    </select>
                                </div>
                            </div>	
			</div>
			<div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Probability(%)</label>
                                <div class="col-md-8"> 
                                    <input type="text" id="stage_prob" name="stage_prob" class="form-control" value="<?=$rel['stage_prob']?>" readonly>
                                </div>	
                            </div>	
			</div>
                        <div class="clearfix"></div>
                        <div class="col-md-8" id="closed_reason_div" style="float: right;display: none;">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Reason to Close*</label>
                                <div class="col-md-8"> 
                                    <textarea class="form-control" id="closed_reason" name="closed_reason" height="50px" width="300px" required="true" ><?=$rel['closed_reason']?></textarea>
                                </div>	
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Sales Stage</label>
                                <div class="col-md-8"> 
                                    <select class="select2" id="sales_stage_id" name="sales_stage_id"<? echo ($mode=="view")?"disabled":""?>>
                                        <option value="">Choose Sales Stage</option>
                                        <?= get_master_category_dtl($dbcon,$rel['sales_stage_id'],7);//7:Sales Stage?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Type</label>
                                <div class="col-md-8"> 
                                    <select class="select2" id="inquiry_type_id" name="inquiry_type_id"<? echo ($mode=="view")?"disabled":""?>>
                                        <option value="">Choose Opportunity Type</option>
                                        <?=get_master_category_dtl($dbcon,$rel['inquiry_type_id'],8);//8:Type?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Source </label>
                                <div class="col-md-8"> 
                                    <select class="select2" id="rb_id" name="rb_id"<? echo ($mode=="view")?"disabled":""?>>
                                        <?=get_refer_by($dbcon,$rel['rb_id']);?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Opportunity Category</label>
                                <div class="col-md-8">  
                                    <select class="select2" id="inquiry_cat_id" name="inquiry_cat_id"<? echo ($mode=="view")?"disabled":""?>>
                                        <option value="">Choose Opportunity Category</option>
                                        <?=get_master_category_dtl($dbcon,$rel['inquiry_cat_id'],9);//9:Category?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Currency</label>
                                <div class="col-md-8">  
                                    <select class="select2" id="currency_id" name="currency_id"<? echo ($mode=="view")?"disabled":""?>>
                                        <?=get_org_currency($dbcon,$rel['currency_id'])?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Total</label>
                                <div class="col-md-8">
                                        <input type="number" min="0" id="g_total" name="g_total" class="form-control" value="<?=$rel['g_total']?>" readonly>
                                </div>
                            </div>	
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Assign To*</label>
                                <div class="col-md-8">
<!--                                    <select class="select2" id="assign_user_inq_ids" name="assign_user_inq_ids[]" title="Choose Assign User" placeholder="Choose Assign User" multiple="multiple" required>
                                        <?//=get_assign_users_inq($dbcon,$assign_user_inq_ids);?>
                                    </select>-->
                                    <select class="select2" id="assign_user_inq_ids" name="assign_user_inq_ids" onChange="load_inquiry_datatable();" required>
                                        <?= get_assign_users_inq($dbcon,$rel['user_id']); ?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="clearfix"></div>
                        <?php	//Show Flp field only if add mode
                        if($mode=='Add'){
                        ?>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Task*</label>
                                <div class="col-md-8">
                                <?//=get_master_category_dtl($dbcon,$task_type_id,10,"",1);//10:Task?>
                                    <select class="select2" id="task_type_id" name="task_type_id" title="Choose Task Type" required>
                                        <option value="">Choose Task Type</option>
                                        <?=get_master_category_dtl($dbcon,16,10);//10:Task?>
                                    </select>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-4">
                                <div class="form-group">
                                        <label class="col-md-4 control-label">Priority*</label>
                                        <div class="col-md-8">
                                                <select class="select2" id="task_priority_id" name="task_priority_id">
                                                        <?=get_task_priority($dbcon,$rel['task_priority_id']);?>
                                                </select>
                                        </div>
                                </div>	
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="col-md-4 control-label">Follow-Up Date*</label>
                                <div class="col-md-8">
                                    <div data-date="<?=$task_due_date?>" class="input-group date form_datetime-meridian">
                                        <input type="text" class="form-control" value="<?=$task_due_date?>" name="task_due_date" id="task_due_date" autocomplete="off">
                                        <div class="input-group-btn">
                                                <button type="button" class="btn btn-info date-set"><i class="fa fa-calendar"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>	
                        </div>	
		
                        <?php } ?>
                        <div class="clearfix"></div>
                        <hr/>
                    	<div class="col-md-12">
                            <div class="form-group" style="margin-top:20px;overflow-x:scroll;">
                                <table class="display table table-bordered table-striped">
                                    <thead>
                                    <? if($mode!="view")
                                    { ?>
                                    <tr>
					<th width="25%" class="text-center">Product Name</th>
					<!--<th width="15%" class="text-center">Product Category</th>-->
					<th width="15%" class="text-center">Product Group</th>
					<!--<th width="10%" class="text-center">Level</th>-->
					<th width="" class="text-center">Quantity</th>
					<th width="" class="text-center">Unit</th>
					<th width="" class="text-center">Rate</th>
					<th width="" class="text-center">Amount</th>
					<th width="2%" class="text-center">Action</th>					  
                                    </tr>
                                    <? } ?>
                                    </thead>
                                    <tbody>
                                    <? if($mode!="view"){ ?>
                                    <tr>
                                        <td>
                                            <select class="select2" id="product_id" name="product_id" onchange="load_product_dtls(this.value)">
                                                <?=getproduct($dbcon,"");?>
                                            </select>
                                        </td>
                                        <!--<td>
                                                <select class="select2" id="cat_id" name="cat_id">
                                                        <?//=get_all_category($dbcon,"");?>
                                                </select>
                                        </td>-->
                                        <td>
                                            <select class="select2" id="pg_id" name="pg_id">
                                                <?=get_product_group($dbcon,"");?>
                                            </select>
                                        </td>
                                        <!--<td>
                                                <select class="select2" id="level_id" name="level_id">
                                                        <!--<option value="">Choose Level</option>--
                                                        <option value="1">Level 1</option>
                                                </select>
                                        </td>-->
                                        <td>
                                            <input type="number" min="0" class="form-control" id="product_qty" name="product_qty" onkeyup="get_amount();" value="">
                                        </td>
                                        <td>
                                            <select class="select2" name="unitid" id="unitid" title="Select Unit">
						<?=getunit($dbcon,0);?>
                                            </select>
                                        </td>
                                        <td>
                                                <input type="number" min="0" class="form-control" id="product_rate" name="product_rate" onkeyup="get_amount();" value="">
                                        </td>
                                        <td>
                                                <input type="number" min="0" class="form-control" id="product_amount" name="product_amount" value="" readonly>
                                        </td>
                                        <td rowspan="2" style="vertical-align:middle;">
                                                <input type="hidden" id="edit_id" name="edit_id" value="">
                                                <button type="button" class="btn btn-primary" id="inq_trn_btn" onclick="add_field()">Add</button>
                                        </td>
                                    </tr>
                                    <tr>
					<td colspan="2">
						<textarea class="form-control" id="product_desc" name="product_desc" placeholder="Enter Product Description" style="resize:both;"></textarea>
					</td>
					<td colspan="3">
						<textarea class="form-control" id="product_spec" name="product_spec" placeholder="Enter Specification" style="resize:both;"></textarea>
					</td>
					<td></td>
                                    </tr>
                                    <? } ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group" id="inq_trn_div" style="margin-top:20px;overflow-x:scroll;"></div>
                        </div>
                        <div class="clearfix"></div>
                        <hr/>
                        <div class="clearfix"></div>
                        <!--tab start--> 
                        <div class="col-md-12">
                            <div class="card">
                                <ul class="nav nav-tabs" id="my_tab_id" role="tablist"> 
                                        <li role="presentation" id="tab4" class="active"><a href="#task-section" aria-controls="task-section" role="tab" data-toggle="tab">History</a></li>
                                        <li role="presentation" id="tab1"><a href="#remark-section" aria-controls="remark-section" role="tab" data-toggle="tab">Remark</a></li>
                                        <li role="presentation" id="tab2"><a href="#attch-section" aria-controls="attch-section" role="tab" data-toggle="tab">Attachments</a></li>
                                        <li role="presentation" id="tab3"><a href="#note-section" aria-controls="note-section" role="tab" data-toggle="tab">Notes</a></li>

                                </ul> 
                            <!-- Tab panes -->
                            <div class="tab-content"> 
                            <!-- Remaks Tab Start -->
                                <div role="tabpanel" class="tab-pane" id="remark-section">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Description</label>
                                            <div class="col-md-12">
                                                <textarea id="inq_desc" name="inq_desc" class="form-control" rows="3" style="resize:both;"><?=$rel['inq_desc']?></textarea> 
                                            </div>
                                        </div> 
                                    </div> 
                                    <div class="col-md-6">
					<div class="form-group">
                                            <label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Competition Status</label>
                                            <div class="col-md-12">
                                                <textarea id="inq_comp_desc" name="inq_comp_desc" class="form-control" rows="3" style="resize:both;"><?=$rel['inq_comp_desc']?></textarea> 
                                            </div>
					</div> 
                                    </div> 
                                </div> 
                                <!-- Attachments Tab Start -->
                                <div role="tabpanel" class="tab-pane" id="attch-section">
                                    <div class="form-group" style="margin-top:20px;">
                                    <? if($mode!='view'){?>
					<table class="display table table-bordered table-striped">
                                            <thead>
						<tr>
                                                    <th width="40%" class="text-center">Document Name</th>
                                                    <th width="50%" class="text-center">Upload Document</th>
                                                    <th width="10%" class="text-center">Action</th>					  
						</tr>
                                            </thead>
                                            <tbody>
						<tr>
                                                    <td>
                                                            <input type="text" class="form-control" id="inq_attch_doc_name" name="inq_attch_doc_name" value="" placeholder="Document Name">
                                                    </td>
                                                    <td>
                                                            <input type="file" class="form-control" id="inq_attch_file" name="inq_attch_file">
                                                    </td>
                                                    <td>
                                                            <button type="button" class="btn btn-primary" id="inq_attch_btn" onclick="add_inq_attch_field()">Add</button>
                                                    </td>
						</tr>
                                            </tbody>
					</table>
                                        <? } ?>
                                    </div> 
				<div class="form-group" style="margin-top:20px;" id="inq_attch_trn_div"></div> 
                                </div> 
                                <!-- Note Tab Start -->
                                <div role="tabpanel" class="tab-pane" id="note-section">
                                    <div class="form-group" style="margin-top:20px;">
					<table class="display table table-bordered table-striped">
                                            <thead>
						<tr>
                                                    <th width="30%" class="text-center">Title</th>
                                                    <th width="60%" class="text-center">Description</th>
                                                    <th width="10%" class="text-center">Action</th>					  
						</tr>
                                            </thead>
                                            <tbody>
						<tr>
                                                    <td>
                                                        <input type="text" class="form-control" id="inq_note_title" name="inq_note_title" value="" placeholder="Title">
                                                    </td>
                                                    <td>
                                                        <textarea class="form-control" id="inq_note_desc" name="inq_note_desc" placeholder="Description" style="resize:both;"></textarea>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="edit_inq_noteid" name="edit_inq_noteid" value="">
                                                        <button type="button" class="btn btn-primary" id="inq_note_btn" onclick="add_inq_note_field()">Add</button>
                                                    </td>
						</tr>
                                            </tbody>
					</table>
                                    </div> 
                                    <div class="form-group" style="margin-top:20px;" id="inq_notes_trn_div"></div> 
                                </div> 
			<!-- Task Tab Start -->
			<div role="tabpanel" class="tab-pane active" id="task-section">
                            <div class="form-group" style="margin-top:20px;">
                                <div class="clearfix"></div>
				<?if($mode=='Edit'){?>
<!--                                    <div class="col-md-1">
                                            <a onclick="setFormSubmitting();" href="<?=ROOT.'task_add/'.$rel['inquiry_id']?>" type="button" class="btn btn-primary" ><i class="fa fa-plus"></i> Task</a>
                                    </div>
                                    <div class="col-md-1">
                                            <a onclick="setFormSubmitting();" href="<?=ROOT.'appointment_add/'.$rel['inquiry_id']?>" type="button" class="btn btn-info"><i class="fa fa-plus"></i> Appointment</a>
                                    </div>-->
                                    <div class="col-md-1">
                                            <a onclick="open_add_task_popup(<?= $rel['inquiry_id'] ?>,1);" type="button" class="btn btn-primary" ><i class="fa fa-plus"></i> Task</a>
                                    </div>
                                    <div class="col-md-1">
                                            <a onclick="open_add_task_popup(<?= $rel['inquiry_id'] ?>,2)"  type="button" class="btn btn-info"><i class="fa fa-plus"></i> Appointment</a>
                                    </div>
				<?}?>
                                    <div class="clearfix"></div>
                                    <table class="display table table-bordered table-striped">
                                        <tr>
        <td width="25%" class="text-left">
                <strong>Remarks</strong>
        </td>
        <td width="25%" class="text-left">
                Description: <?=$rel['inq_desc']?>
        </td>
        <td width="25%" class="text-left">
                Competition Status: <?=$rel['inq_comp_desc']?>
        </td>
        <td width="25%" class="text-left">

        </td>
    </tr>
    <tr>
        <td colspan="4" class="text-left" style="border-bottom: 1px solid #000 !important;"></td>
    </tr>
	<?php
        $get_task_qry="select tsk.*,sub.mcd_name as subject,usr.user_name,prior.task_priority_name from tbl_task as tsk 
        left join tbl_master_category_detail as sub on sub.mcd_id=tsk.task_type_id
        left join users as usr on usr.user_id=tsk.user_id
        left join task_priority_mst as prior on prior.task_priority_id=tsk.task_priority_id
        where tsk.task_status!=2 and tsk.task_rel_id=5 and tsk.inquiry_id=".$rel['inquiry_id']." order by tsk.create_date DESC";
        $get_task_qry_rs=$dbcon->query($get_task_qry);
        while($task_rel=mysqli_fetch_assoc($get_task_qry_rs)){
            if($task_rel['entry_type']=='1'){//Task 

            $task_completion_date='';$task_due_date='';
            if($task_rel['task_completion_date']!="1970-01-01 00:00:00" && $task_rel['task_completion_date']!="0000-00-00 00:00:00"){
                    $task_completion_date=date('d-m-Y h:i A',strtotime($task_rel['task_completion_date']));
            }
            if($task_rel['task_due_date']!="1970-01-01 00:00:00" && $task_rel['task_due_date']!="0000-00-00 00:00:00"){
                    $task_due_date=date('d-m-Y h:i A',strtotime($task_rel['task_due_date']));
            }
            //Get Task Timing
	?>
            <tr>
                <td width="25%" class="text-left">
                        <strong>Task</strong>
                </td>
        <?	
            $tsk_type="";
            $tsk_due_time=strtotime($task_rel['task_due_date']);

            if($task_rel['task_status']=='1'){ 
                $cur_time=strtotime($task_rel['task_completion_date']);
                if($tsk_due_time<$cur_time){
                        $tsk_type="<label style='background:#d9534f;'>(Delayed)</label>";
                }
        ?>
        <td width="25%" class="text-center btn-success">Completed <?=$tsk_type?></td>
        <? } else {
            $cur_time=strtotime(date('Y-m-d H:i:s'));
            if($tsk_due_time<$cur_time){
                $tsk_type="<label style='background:#d9534f;'>(Delayed)</label>";
            }	
        ?>
        <td width="25%" class="text-center btn-warning">Pending <?=$tsk_type?></td>
        <? } ?>
        <td width="25%" class="text-left">
            Completion Date: <?=$task_completion_date?>
        </td>
        <td width="25%" class="text-left">
                Create Date: <?=date('d-m-Y h:i A',strtotime($task_rel['create_date']));?>
        </td>
    </tr>
    <tr>
        <td class="text-left">
                Subject: <?=$task_rel['subject']?>
        </td>
        <td class="text-left">
                Owner: <?=$task_rel['user_name']?>
        </td>
        <td class="text-left">
                Priority: <?=$task_rel['task_priority_name']?>
        </td>
        <td class="text-left">
                Due Date: <?=$task_due_date?>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="text-left">
                Owners Remark : <?=nl2br($task_rel['task_remark'])?>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="text-left" style="border-bottom: 1px solid #000 !important;">
            <?
                $task_flp_qry="select flp.*,usr.user_name from tbl_followup as flp 
                left join users as usr on usr.user_id=flp.user_id
                where flp.flp_status=0 and flp.task_id=".$task_rel['task_id']."";
                $task_flp_qry_rs=$dbcon->query($task_flp_qry);
                if(mysqli_num_rows($task_flp_qry_rs)){
            ?>
            <table class="display table table-bordered table-striped">
                <thead>
                    <th>User</th>
                    <th>Remarks Date</th>
                    <th>Remarks</th>
                </thead>
                <tbody>
                <? while($flp_rel=mysqli_fetch_assoc($task_flp_qry_rs)){ ?>
                    <td width="20%"><?=$flp_rel['user_name']?></td>
                    <td width="20%"><?=date("d-M-Y h:i A",strtotime($flp_rel['flp_date']))?></td>
                    <td width="60%"><?=$flp_rel['task_flp_remark']?></td>
                <? } ?>	
                </tbody>
            </table>
            <? } ?>
        </td>
    </tr>
    <?	} else if($task_rel['entry_type']=='2'){
            //Appointment
            $appointment_start_time='';$appointment_end_time='';
            if($task_rel['appointment_start_time']!="1970-01-01 00:00:00" && $task_rel['appointment_start_time']!="0000-00-00 00:00:00"){
                    $appointment_start_time=date('d-m-Y h:i A',strtotime($task_rel['appointment_start_time']));
            }
            if($task_rel['appointment_end_time']!="1970-01-01 00:00:00" && $task_rel['appointment_end_time']!="0000-00-00 00:00:00"){
                    $appointment_end_time=date('d-m-Y h:i A',strtotime($task_rel['appointment_end_time']));
            }
    ?>
    <tr>
        <td width="25%" class="text-left">
                <strong>Appointment</strong>
        </td>
        <td width="25%" class="text-left">
                Subject: <?=$task_rel['appointment_subject']?>
        </td>
        <td width="25%" class="text-left">
                Location: <?=$task_rel['task_location']?>
        </td>
        <td width="25%" class="text-left">
                Owner: <?=$task_rel['user_name']?>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="text-left">
                Start Time: <?=$appointment_start_time?>
        </td>
        <td colspan="2" class="text-left">
                End Time: <?=$appointment_end_time?>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="text-left">
                Owner Remarks : <?=nl2br($task_rel['task_remark'])?>
        </td>
    </tr>
    <tr>
            <td colspan="4" class="text-left" style="border-bottom: 1px solid #000 !important;"></td>
    </tr>
        <? } ?>	
    <? } ?>			
    </table>
    </div> 
</div>               
</div>
</div>      		
</div>      		
    <!--tabs end-->	
    <div class="clearfix"></div>

    </div>
    <div class="clearfix"></div>
        <? if($mode!='view'){ ?>
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
                <a href="<?=ROOT.'inquiry_list'?>" type="button" class="btn btn-danger">Cancel</a>	
            </div>	
        <? } ?>
    </div>
</div><!--Vendor row end-->	
<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
<input type='hidden' name='eid' id='eid' value='<?=$inquiry_id?>' />

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
<div id="task_model_popup"></div>
<?php include_once('../include/add_cust.php');?>
<?php include_once('../include/add_person.php');?>
<?php include_once('../include/preview_cust_person_dtl.php');?>
<?php include_once('../include/preview_company.php');?>
<?php include_once('../include/footer.php');?>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script>
var formSubmitting = false;
var setFormSubmitting = function() { formSubmitting = true; };
//window.onload = function() {
//    window.addEventListener("beforeunload", function (e) {
//        if (formSubmitting) {
//            return undefined;
//        }
//
//        var confirmationMessage = 'You sure you want to leave? ';
//
//        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
//        //return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
//    });
//};
</script>
<script src="<?=ROOT?>js/app/inquiry.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
var date = new Date();
var today = new Date(date.getFullYear(), date.getMonth(), date.getDate()); //start date is today
var endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate()+15); //end date should not greater than 15 days
$(".form_datetime-meridian").datetimepicker({
    format: "dd-mm-yyyy HH:ii P",
    showMeridian: true,
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    startDate: today,
    endDate: endDate
});
/*disabledDates: [
     moment("12/25/2013"),
     new Date(2013, 11 - 1, 21),
     "11/22/2013 00:53"
 ] */
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
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
	$('#party_type_ven_div').hide();
});

</script>
</body>
</html>