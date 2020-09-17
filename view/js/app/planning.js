$(document).ready(function() {
	load_planning_datatable(); 
	
	// validate vendor add form on keyup and submit
	$("#planning_add").validate({
		rules: {
			planning_no: {
				required: true
			},
			planning_date: {
				required: true
			},
			sales_order_id: {
				required: true
			},
			planning_name: {
				required: true
			}
			
		},
		messages: {
			planning_no: {
				required: "Enter Planning No."
			},
			planning_date: {
				required: "Enter Planning Date"
			},
			sales_order_id: {
				required: "Choose Sales Order"
			},
			planning_name: {
				required: "Enter Project Name"
			}
		}
	}); 
	
});
$("#planning_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#planning_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled");		
	$("#submit_btn").prop("disabled",true);		
	
	var form_data = new FormData(this);
	
	$.ajax({
		cache:false,
		url: root_domain+'app/planning/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);
			var resp=JSON.parse(response);
			var msg=resp.msg;
			if(msg.trim() == '1') {				
				toastr.success("PLANNING ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'planning_list';
			}
			else if(msg.trim() == '2') {				
				toastr.success("PLANNING UPDATED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'planning_list';
			}
			else if(msg.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(msg.trim() == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");		
			}
			$("#submit_btn").prop("disabled",false);	
			Unloading();
		}
	});
	
});
function delete_planning(planning_id,sales_order_id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/planning/',
			data: { mode : "delete", planning_id:planning_id, sales_order_id:sales_order_id },
			success: function(resnse)
			{
				if(resnse.trim() == "1") {
					toastr.success("PLANNING DELETED SUCCESSFULLY", "SUCCESS");
					load_planning_datatable();
				}
				else if(resnse.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
				Unloading();
			}
		});	
	}
	
}

function load_planning_datatable(){
	var date= $('#rep_date').val();
	
	$("#planning-datatable").dataTable({
		"bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bProcessing": true,
		"bDestroy": true,
		"bServerSide" : true,
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
			"sEmptyTable": "NO DATA ADDED YET !",
		},
		"aLengthMenu": [[20, 50, 100, -1], [20, 50, 100,"All"]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/planning/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "fetch" }, { "name": "date", "value": date } );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
	// validate the comment form when it is submitted  
}

function load_planning_no()
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/planning/',
		data: { mode:"load_planning_no" },
		success: function(response)
		{
			//console.log(response);
			$('#planning_no').val(response);
		}
	});	
}
function load_quot_name(sales_order_id){
	
	if(sales_order_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/planning/',
			data: { mode:"load_quot_name", sales_order_id:sales_order_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#planning_name').val(resp.quot_subject);
			}
		});	
	}
}
