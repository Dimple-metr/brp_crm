<?php 
$start_date= date('d-m-Y', strtotime('first day of last month'));
$end_date=date("d-m-Y");
$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
									
?>
<!--<link href="assets/morris.js-0.4.3/morris.css" rel="stylesheet" />-->
<div class="">
    <div class="col-lg-12">
        <section class="panel1">
            <div class="panel-body">
                <div class="row state-overview">
                    <div class="icons icons12">
                            <div class="icon1 terques">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                            </div>
                            <div class="">
                                    <h1 class="count" id="business_achieved_counts">0</h1>
                                    <p style="color: #4c4e4e;">Business Achieved This Month</p>
                            </div>
                    </div>
                    <div class="icons icons12">
                            <div class="icon1 yellow">
                                    <i class="fa fa-tags" aria-hidden="true"></i>
                            </div>
                            <div class="">
                                    <h1 class="count" id="opportunity_onhand_counts">0</h1>
                                    <p style="color: #4c4e4e;">Opportunity On Hand This Month</p>
                            </div>
                    </div>
                    <div class="icons icons12">
                            <div class="icon1 pink">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            </div>
                            <div class="">
                                <h1 class="count" id="pending_quotation_counts">0</h1>
                                    <p style="color: #4c4e4e;">Pending Quotation This Month</p>
                            </div>
                    </div>
                    <div class="icons icons12">
                            <div class="icon1 success">
                                    <i class="fa fa-bar-chart-o" aria-hidden="true"></i>
                            </div>
                            <div class="">
                                <h1 class="count" id="lost_opportunity_counts">0</h1>
                                <p style="color: #4c4e4e;">&nbsp; &nbsp; Inquiries Lost This Month &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </p>
                            </div>
                    </div>
                    <div class="icons icons12">
                            <div class="icon1 mustard">
                                    <i class="fa fa-book" aria-hidden="true"></i>
                            </div>
                            <div class="">
                                <h1 class="count" id="hot_leads_counts">0</h1>
                                    <p style="color: #4c4e4e;">Hot Leads On Hand This Month</p>
                            </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="col-lg-6">
        <section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
			<section class="panel">
                            <div class="row">
				<form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                    <input id="lead_source_start_date" name="lead_source_start_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_lead_by();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                    <input id="lead_source_end_date" name="lead_source_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_lead_by();">
                                            </div>
                                    </div>
                                    <!--<div class="col-md-6">
                                                <select class="form-control" name="c_year" id="c_year" onchange="get_chart();" >
                                                        <?=get_year()?>
                                                </select>
                                        </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="lead_source_user_id" id="lead_source_user_id" onchange="load_lead_by()();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div id="lead_source_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                </form>
                            </div>
			</section>
                    </div>
		</div>
            </div>
        </section>
    </div>
    <div class="col-lg-6">
        <section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
			<section class="panel">
                            <div class="row">
                                <form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="employee_sales_start_date" name="employee_sales_start_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_employee_sales();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="employee_sales_end_date" name="employee_sales_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_employee_sales();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year1" id="c_year1" onchange="get_chart();" >
                                                    <?=get_year()?>
                                            </select>
                                    </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="employee_sales_user_id" id="employee_sales_user_id" onchange="get_chart();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="employee_sales_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                </form>
                            </div>
			</section>
                    </div>
		</div>
            </div>
        </section>
    </div>
    <div class="col-lg-6">
	<section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
                        <section class="panel">
                            <div class="row">
                                <form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                    <input id="lead_by_product_start_date" name="lead_by_product_start_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_lead_by_product();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                    <input id="lead_by_product_end_date" name="lead_by_product_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_lead_by_product();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year3" id="c_year3" onchange="get_chart();" >
                                                    <?//=get_year()?>
                                            </select>
                                    </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="lead_by_product_user_id" id="lead_by_product_user_id" onchange="get_chart();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="lead_by_product_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                </form>
                            </div>
			</section>
                    </div>
		</div>
            </div>
	</section>
    </div>
    <div class="col-lg-6">
        <section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
                        <section class="panel">
                            <div class="row">
                                <form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="quote_stage_start_date" name="quote_stage_start_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_funal();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="quote_stage_end_date" name="quote_stage_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_funal();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year4" id="c_year4" onchange="get_chart();" >
                                                    <?//=get_year()?>
                                            </select>
                                    </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="quote_stage_user_id" id="quote_stage_user_id" onchange="get_chart();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="quote_stage_container" style="height: 300px; width: 100%;"></div>
                                    </div>
				</form>
                            </div>
			</section>
                    </div>
		</div>
            </div>
	</section>
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
                        <section class="panel">
                            <div class="row">
				<form>
                                    <div class="col-md-4" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="month_won_revenue_start_date" name="month_won_revenue_start_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_month_wise_won();">
                                            </div>
                                    </div>
                                    <div class="col-md-4" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="month_won_revenue_end_date" name="month_won_revenue_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_month_wise_won();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year5" id="c_year5" onchange="load_month_wise_won();" >
                                                    <?//=get_year()?>
                                            </select>
                                    </div> -->                        <div class="col-md-4">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="month_won_revenue_user_id" id="month_won_revenue_user_id" onchange="load_month_wise_won();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="month_won_revenue_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="col-lg-6">
        <section class="panel">
            <div class="panel-body" >
		<div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
			<section class="panel">
                            <div class="row">
                                <form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="lead_by_city_start_date" name="lead_by_city_start_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_lead_by_city();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="lead_by_city_end_date" name="lead_by_city_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_lead_by_city();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year6" id="c_year6" onchange="load_month_wise_won();" >
                                                    <?//=get_year()?>
                                            </select>
                                    </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="lead_by_city_user_id" id="lead_by_city_user_id" onchange="load_lead_by_city();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="lead_by_city_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="col-lg-6">
        <section class="panel">
            <div class="panel-body" >
		<div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
                        <section class="panel">
                            <div class="row">
                                <form>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Start Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="lead_by_state_start_date" name="lead_by_state_start_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$start_date?>" placeholder="Start Date" onchange="load_lead_by_state();">
                                            </div>
                                    </div>
                                    <div class="col-md-6" style="margin-bottom: 15px;">
                                            <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>End Date</strong></div>
                                            <div class="col-md-9" style="padding-right: 0px;">
                                                <input id="lead_by_state_end_date" name="lead_by_state_end_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$end_date?>" placeholder="End Date" onchange="load_lead_by_state();">
                                            </div>
                                    </div>
<!--                                    <div class="col-md-6">
                                            <select class="form-control" name="c_year7" id="c_year7" onchange="load_lead_by_state();" >
                                                    <?//=get_year()?>
                                            </select>
                                    </div> -->
                                    <div class="col-md-6">
                                        <div class="col-md-3" style="white-space:nowrap;padding-left: 0px;"><strong>Employee</strong></div>
                                        <div class="col-md-9" style="padding-right: 0px;">
                                            <select class="form-control" name="lead_by_state_user_id" id="lead_by_state_user_id" onchange="load_lead_by_state();" >
                                                    <?=get_user_report($dbcon,$user_ids);?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                            <div id="lead_by_state_container" style="height: 300px; width: 100%;"></div>
                                    </div>
                                    </form>
                            </div>
                        </section>
                    </div>
		</div>
            </div>
        </section>
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <div class="panel-body" >
                <div class="row state-overview">
                    <div class="col-md-12 col-sm-6">
                        <section class="panel">
                            <div class="row">			
                                <div class="col-sm-12">
                                    <section class="panel">
                                        <header class="panel-heading">
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Choose Due Date</label>
                                                    <div class="col-md-7">
                                                        <div class="input-group date form_datetime-component">
                                                            <input type="hidden" id="from_date" value="<?=$start_date?>">
                                                            <input type="hidden" id="to_date" value="<?=$end_date?>">
                                                            <input type="text" id="rep_date" onChange="load_task_datatable();" class="form-control datepikerdemo" value="">
                                                            <span class="input-group-btn">
                                                                    <button type="button" class="btn btn-danger date-set"><i class="fa fa-calendar"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>	
                                            <div class="col-md-5" style="display:none;">
                                                <div class="form-group">
                                                    <div class="col-md-4">
                                                        <label>
                                                            <div class='external-event label label-primary ui-draggable' style='position: relative;width:70px;'>All</div>					
                                                            <input id="task_status_all" name="task_status"  type="radio" style="width:20px;height:20px;vertical-align:middle" onClick="load_task_datatable();" class="" title="All" value="">
                                                        </label>
                                                    </div>
                                                    <div class="col-md-4">
                                                            <label>
                                                                    <div class='external-event label label-warning ui-draggable' style='position: relative;width:70px;'>Pending</div>					
                                                                    <input id="task_status_pend" name="task_status" type="radio" style="width:20px;height:20px;vertical-align:middle" checked="checked" onClick="load_task_datatable();" class="" title="Pending" value="0">
                                                            </label>
                                                    </div>
                                                    <div class="col-md-4">
                                                            <label>
                                                                    <div class='external-event label label-success ui-draggable' style='position: relative;width:70px;'>Completed</div>					
                                                                    <input id="task_status_comp" name="task_status" type="radio" style="width:20px;height:20px;vertical-align:middle" onClick="load_task_datatable();" class="" title="Pending" value="1">
                                                            </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--<span class="tools pull-right">
                                                    <a href="<?=ROOT.'task_add'?>"><button class="btn btn-success btn-flat">Add <?=$form?></button></a>
                                            </span>-->
                                            <div class="col-md-12" style="height:0px;" ></div>
					</header>	
                                        <div class="panel-body">
                                            <div class="adv-table">
                                                <table class="display table table-bordered table-striped" id="task-table">
                                                    <thead>
                                                        <tr>
                                                            <th>Type</th>
                                                            <th>Regarding</th>
                                                            <th>Name</th>
                                                            <th>Due Date</th>
                                                            <th>Owner</th>
                                                            <th>Priority</th>
							</tr>
                                                    </thead>
                                                    <tbody></tbody>				 
						</table>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<?php include_once('../include/add_flp_hist.php');?>

<script type="text/javascript">
$(document).ready(function() {
	Loading(true);	
	load_counts();
	//load_graph();
	load_pend_task();
	load_lead_by();
	load_employee_sales();
	load_lead_by_product();
	load_funal();
	load_month_wise_won();
	load_lead_by_city();
	load_lead_by_state();
	
	Unloading();
});
	
function get_chart(){
	load_lead_by_product();
	load_employee_sales();
	load_lead_by();
	load_funal();
}
function load_funal(){
	var d_start_date=$('#quote_stage_start_date').val();
	var d_end_date=$('#quote_stage_end_date').val();
	var d_user_id=$('#quote_stage_user_id').val();
	//var c_year=$('#c_year4').val();
	//alert("dsa");
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_funal&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("quote_stage_container", {
			animationEnabled: true,
			title: {
				text: "Quotes Stage Funnel"
			},
			data: [{
				type: "funnel",
				indexLabel: "{label} - {y}",
				yValueFormatString: "#,##0",
				neckHeight: 0,
				dataPoints: arr1
			}]
		});
		chart.render();
	});	
}
function load_counts(){
	$.ajax({
		type: "POST",
		url: root_domain+'app/dashboard/',
		data: { mode : "load_counts"},
		success: function(response){
			//console.log(response);
			var data = JSON.parse(response);
			$('#business_achieved_counts').html(data.business_achieved_counts).attr("title",data.business_achieved_words);
			$('#opportunity_onhand_counts').html(data.opportunity_onhand_counts).attr("title",data.opportunity_onhand_words);
			$('#pending_quotation_counts').html(data.pending_quotation_counts).attr("title",data.pending_quotation_counts);
                        $('#lost_opportunity_counts').html(data.lost_opportunity_counts).attr("title",data.lost_opportunity_words);
                        $('#hot_leads_counts').html(data.hot_leads_counts).attr("title",data.hot_leads_words);
		}
	});
	Unloading();
}  
function load_graph(){
	Loading(true);	
	var c_year=$('#c_year').val();
	var mainurl = root_domain+'app/dashboard/index.php?mode=dynamic_chart&c_year='+c_year;
	$.getJSON(mainurl, function(json) {
		var arr=new Array();
		for(var i=0;i<12;i++)
		{	
			arr[i]=json[i];	
		}
		Morris.Bar({
			element: 'chart-3',
			data: arr,
			barSizeRatio:0.55,
			xkey: 'device',
			ykeys: ['geekbench'],
			labels: ['Total Inquiry'],
			barRatio: 0.4,
			xLabelAngle: 35,
			hideHover: 'auto',
			barColors: ['#6883a3'],
			lineWidth:25
		});
	});
	Unloading();
}
function load_lead_by(){
var d_start_date=$('#lead_source_start_date').val();
var d_end_date=$('#lead_source_end_date').val();
var d_user_id=$('#lead_source_user_id').val();
//var c_year=$('#c_year').val();
//alert(d_start_date);
//alert(d_end_date);
//alert(d_user_id);
//var mainurl = root_domain+'app/dashboard/index.php?mode=employee_circle&c_year='+c_year
var mainurl = root_domain+'app/dashboard/index.php?mode=lead_circle&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
 
$.getJSON(mainurl, function(json) {
			//console.log(json);
			var arr1=new Array();
                        for(var i=0;i<json.length;i++)
                        {	
                                arr1[i]=json[i],json[i];	
                        }
			//console.log(arr1);
			
			var chart = new CanvasJS.Chart("lead_source_container", {
	theme: "light2",
	animationEnabled: true,
	title: {
		text: "Leads By Source"
	},
	data: [{
		type: "doughnut",
		radius: "100%", 
                innerRadius: "50%",
		indexLabelPlacement: "outside", 
		indexLabel: "{symbol} - {y}",
		yValueFormatString: "#,##0.0\"\"",
		showInLegend: false,
		legendText: "{label} : {symbol}",
		dataPoints: arr1
	}]
});
chart.render();
	});	
		
}
function load_employee_sales(){
	var d_start_date=$('#employee_sales_start_date').val();
	var d_end_date=$('#employee_sales_end_date').val();
	var d_user_id=$('#employee_sales_user_id').val();
	var c_year=$('#c_year1').val();
	
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_employee_sales&d_start_date='+d_start_date+'&d_end_date='+d_end_date+'&d_user_id='+d_user_id+'&c_year='+c_year
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("employee_sales_container", {
			animationEnabled: true,
			title: {
				text: "Employee Sales Performance"
			},
			axisX: {
				interval: 1
			},
			axisY: {
				title: "",
				
			},
			data: [{
				type: "bar",
				dataPoints:arr1
			}]
		});
		chart.render();
	});	
}
function load_lead_by_product(){
	var d_start_date=$('#lead_by_product_start_date').val();
	var d_end_date=$('#lead_by_product_end_date').val();
	var d_user_id=$('#lead_by_product_user_id').val();
	//var c_year=$('#c_year3').val();
	
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_lead_by_product&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("lead_by_product_container", {
			animationEnabled: true,
			//exportEnabled: true,
			title:{
				text: "Leads By Product"
			},
			/* subtitles: [{
				text: "Currency Used: Thai Baht (฿)"
			}], */
			data: [{
				type: "pie",
				radius: "100%",
				showInLegend: "true",
				legendText: "{label}",
				indexLabelFontSize: 16,
				//indexLabel: "{label} - #percent",
				indexLabel: "{label} - {y}",
				//yValueFormatString: "฿#,##0",
				dataPoints: arr1
			}]
		});
		chart.render();
	});	
}
function load_month_wise_won(){
	var d_start_date=$('#month_won_revenue_start_date').val();
	var d_end_date=$('#month_won_revenue_end_date').val();
	var d_user_id=$('#month_won_revenue_user_id').val();
	//var c_year=$('#c_year5').val();
	
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_month_wise_won&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("month_won_revenue_container", {
			animationEnabled: true,
			theme: "light2", // "light1", "light2", "dark1", "dark2"
			title: {
				text: "Month Wise Won Revnue"
			},
			/* axisY: {
				title: "Number of Apps",
				includeZero: false
			}, */
			data: [{
				type: "column",
				name: "Artificial Trees",
				indexLabel: "{y}",
				yValueFormatString: "₹#0.##",
				//showInLegend: true,
				dataPoints: arr1
			}]
		});
		chart.render();
	});	
}
function load_lead_by_city(){
	var d_start_date=$('#lead_by_city_start_date').val();
	var d_end_date=$('#lead_by_city_end_date').val();
	var d_user_id=$('#lead_by_city_user_id').val();
	//var c_year=$('#c_year6').val();
	
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_lead_by_city&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("lead_by_city_container", {
			animationEnabled: true,
			//exportEnabled: true,
			title:{
				text: "City Wise Leads"
			},
			/* subtitles: [{
				text: "Currency Used: Thai Baht (฿)"
			}], */
			data: [{
				type: "pie",
				radius: "100%",
				//showInLegend: "true",
				legendText: "{label}",
				indexLabelFontSize: 12,
				//indexLabel: "{label} - #percent",
				indexLabel: "{label} - {y}",
				//yValueFormatString: "฿#,##0",
				dataPoints: arr1
			}]
		});
		chart.render();
	});	
}
function load_lead_by_state(){
	var d_start_date=$('#lead_by_state_start_date').val();
	var d_end_date=$('#lead_by_state_end_date').val();
	var d_user_id=$('#lead_by_state_user_id').val();
	//var c_year=$('#c_year7').val();
	
	var mainurl = root_domain+'app/dashboard/index.php?mode=load_lead_by_state&start_date='+d_start_date+'&end_date='+d_end_date+'&user_id='+d_user_id
	$.getJSON(mainurl, function(json) {
		var arr1=new Array();
		for(var i=0;i<json.length;i++)
		{	
			arr1[i]=json[i],json[i];	
		}
		//console.log(arr1);
		var chart = new CanvasJS.Chart("lead_by_state_container", {
			animationEnabled: true,
			//exportEnabled: true,
			title:{
				text: "State Wise Leads"
			},
			/* subtitles: [{
				text: "Currency Used: Thai Baht (฿)"
			}], */
			data: [{
				type: "pie",
				radius: "100%",
				//showInLegend: "true",
				legendText: "{label}",
				indexLabelFontSize: 12,
				//indexLabel: "{label} - #percent",
				indexLabel: "{label} - {y}",
				//yValueFormatString: "฿#,##0",
				dataPoints: arr1
			}]
		});
		chart.render();
	});	
}
</script>