//var datatable;
$(document).ready(function() {
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

function show_close_reason(opp_id){
    if(opp_id === '4'){
            $('#closed_reason_div_popup').show();
            $('#task_add').validate({
                    rules: {
                            closed_reason: {
                                    required: true			
                            }
                    },
                    messages: {
                            closed_reason: {
                                    required: "Write Reason to close."
                            }
                    }
            });
    } else {
        $('#closed_reason_div_popup').hide();
    }
}

$("#task_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#task_add").valid()) {
		return false;
	} 
	
	form.submitted = true;	
	$(this).attr("disabled","disabled");		
	$('#save').prop('disabled', true);
	var form_data=new FormData(this);	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/add_task_popup/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("TASK ADDED SUCCESSFULLY", "SUCCESS");
                                $("#add_task_modal .close").click();
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});

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

// Add Appointment
// validate vendor add form on keyup and submit
$("#appointment_add").validate({
        rules: {
                task_location: {
                        required: true			
                },
                appointment_start_time: {
                        required: true			
                },
                appointment_end_time: {
                        required: true			
                },
                appointment_subject: {
                        required: true			
                }
        },
        messages: {
                task_location: {
                        required: "Enter Task Location"
                },
                appointment_start_time: {
                        required: "Choose Start Time"
                },
                appointment_end_time: {
                        required: "Choose End Time"
                },
                appointment_subject: {
                        required: "Enter Subject"
                }
        }
}); 

$("#appointment_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#appointment_add").valid()) {
		return false;
	} 
	
	form.submitted = true;	
	$(this).attr("disabled","disabled");		
	$('#save').prop('disabled', true);
	var form_data=new FormData(this);	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/add_task_popup/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("APPOINTMENT ADDED SUCCESSFULLY", "SUCCESS");
                                $("#add_task_modal .close").click();
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
