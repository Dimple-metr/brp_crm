//var datatable;
$(document).ready(function() {
	load_task_datatable();
	// validate vendor add form on keyup and submit
	$("#task_add").validate({
		rules: {
			task_due_date: {
				required: true			
			}
		},
		messages: {
			task_due_date: {
				required: "Choose Next Follow up Date"
			}
		}
	}); 
}); 

$("#task_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#task_add").valid()) {
		return false;
	} 
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	$('#save').prop('disabled', true);
	var form_data=new FormData(this);	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/task/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("TASK ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'task_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg == 'update') {	
				toastr.success("TASK UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'task_list';	
			}
			Unloading();
			$('#task_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function load_task_datatable(){
	var task_status=$('input[name=task_status]:Checked').val();
	var date=$('#rep_date').val();
	
	datatable = $("#task-table").dataTable({
                "bStateSave": true,
                "bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bProcessing": true,
		"bDestroy": true,
		"bServerSide" : true,
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
			"sEmptyTable": "NO DATA ADDED YET !"
		},
		"aLengthMenu": [[-1, 10, 20, 30, 50], ["All", 10, 20, 30, 50]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain + 'app/task/',
		"fnServerParams": function ( aoData ) {
			aoData.push( {"name": "mode", "value": "fetch"}, {"name": "date", "value": date}, {"name": "task_status", "value": task_status } );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}

function delete_task(task_id) 
{
	var r= confirm(" Are you sure want to delete ?");
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/task/',
			data: { mode : "delete",  task_id : task_id },
			success: function(response)
			{
				console.log(response);
				if(response.trim() == "1") {
					toastr.success("TASK DELETE SUCCESSFULLY", "SUCCESS");
					load_task_datatable();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	} 
}

function change_task_status(task_id,task_status) 
{
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/task/',
		data: { mode : "change_task_status",  task_id:task_id, task_status:task_status },
		success: function(response)
		{
			console.log(response);
			if(response.trim() == "1") {
				toastr.success("TASK CHANGED SUCCESSFULLY", "SUCCESS");
				load_task_datatable();
				load_pend_task();
			}
			else if(response.trim() == "0") {
				toastr.warning("SOMETHING WRONG", "WARNING");
			}	
			Unloading();						
		}
	});		
}
function get_rel_task_divs(task_rel_id){
	if(task_rel_id=='3'){//Person
		$('#person_rel_div').show();
		$('#gen_rel_div').hide();
		$('#company_rel_div').hide();
		$('#inq_rel_div').hide();
                $("#task_stage_div").hide();
                $("#task_sales_stage_div").hide();
	}
	else if(task_rel_id=='4'){//Company
		$('#company_rel_div').show();
		$('#person_rel_div').hide();
		$('#gen_rel_div').hide();
		$('#inq_rel_div').hide();
                $("#task_stage_div").hide();
                $("#task_sales_stage_div").hide();
	}
	else if(task_rel_id=='5'){//Inquiry
		$('#inq_rel_div').show();
		$('#company_rel_div').hide();
		$('#person_rel_div').hide();
		$('#gen_rel_div').hide();
                //$("#task_stage_div").show();
                //$("#task_sales_stage_div").show();
	}
	else{
		$('#gen_rel_div').show();
		$('#person_rel_div').hide();
		$('#company_rel_div').hide();
		$('#inq_rel_div').hide();
                $("#task_stage_div").hide();
                $("#task_sales_stage_div").hide();
	}
}
function validateDueDate(task_type, due_date){
    if(task_type == '16'){
        $("#task_due_date").val('');
        $("#task_add").validate({
		rules: {
			task_type_id: {
				required: true			
			}
		},
		messages: {
			task_type_id: {
				required: "Choose Task Type"
			}
		}
	});
    } else {
        $("#task_due_date").val(due_date);
    }
}
function preview_rel_types() 
{
	var task_rel_id=$('#task_rel_id').val();
	var c_con_id=$('#c_con_id').val();
	var cust_id=$('#cust_id').val();
	var inquiry_id=$('#inquiry_id').val();
	if(task_rel_id){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/task/',
			data: { mode : "preview_rel_types", task_rel_id:task_rel_id, c_con_id:c_con_id, cust_id:cust_id, inquiry_id:inquiry_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#preview_rel_details_modal').modal('show');
				$('#preview_rel_details_div').html(resp.html_resp);
				Unloading();
			}
		});
	}
}
function open_follow_up(task_id,inq_name) {
	$('#add_flp_hist_modal').modal('show');
	$('#flp_task_id').val(task_id);
	$('#flp_modal_inq_name').html(inq_name);
	$('#task_flp_remark').focus();
	show_flp_hist();
}
function add_flp_hist_field()
{
	if(!$("#task_flp_remark").val()) {		
		toastr.warning("Enter Remark", "ERROR");
		$("#task_flp_remark").focus();
		return false;
	}
	
	var form_data = {
		mode : "add_flp_hist_field",
		flp_id:$("#flp_id").val(),
		task_flp_remark:$("#task_flp_remark").val(),
		task_id:$("#flp_task_id").val() 
	};
	
	Loading();	
	$.ajax({
		type: "POST",
		url: root_domain+'app/task/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#task_flp_remark").val("");
			$("#flp_id").val('');
			$("#addhistrow").val("Add");
			Unloading();
			show_flp_hist();
		}
	});
}
function show_flp_hist(){
	var task_id = $("#flp_task_id").val();
	
	$("#flp-hist-datatable").dataTable({
		"bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bDestroy": true,
		"bProcessing": true,
		"bServerSide" : true,
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
			"sEmptyTable": "NO DATA ADDED YET !",
		},
		"aLengthMenu": [[5, 10, 20, -1], [5, 10, 20,"All"]],
		"iDisplayLength": 5,
		"sAjaxSource": root_domain+'app/task/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name":"mode", "value":"show_flp_hist" }, { "name":"task_id", "value":task_id } );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}
function delete_task_flp(flp_id) 
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/task/',
			data: { mode : "delete_task_flp", flp_id:flp_id },
			success: function(resnse)
			{
				//console.log(resnse);
				if(resnse.trim() == "1") {
					toastr.success("REMARK DELETED SUCCESSFULLY", "SUCCESS");
					show_flp_hist();
				}
				else if(resnse.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}		
				Unloading();					
			}
		});	
	}
}
function load_pend_task(){
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/task/',
		data: { mode : "load_pend_task"  },
		success: function(resnse)
		{
			console.log(resnse);
			var resp = JSON.parse(resnse);
			$('#pend_task_tbody').html(resp.resp_html);
			Unloading();					
		}
	});
}
function show_lost_reason(){
	var oid=$("#opp_id").val();
	
	if(oid==="4" || oid==="8"){
		$("#lost_reason_div").show();
                $('#task_add').validate({
                    rules: {
                            lost_reason: {
                                    required: true			
                            }
                    },
                    messages: {
                            lost_reason: {
                                    required: "Write Reason to close."
                            }
                    }
                });
	}else{
		$("#lost_reason_div").hide();
	}
}

function load_inquiry_stage(inq_id){
    $.ajax({
        type: "POST",
        url: root_domain+'app/task/',
        data: { mode : "load_inquiry_stage", inq_id: inq_id},
        success: function(response)
        {
            console.log(response);
            var arr = jQuery.parseJSON(response);
            
            $('#opp_id').select2("val",arr.opp_id);
            $('#sales_stage_id').select2("val",arr.sales_stage_id);
            
            $("#task_stage_div").show();
            $("#task_sales_stage_div").show();
        }
    });
}