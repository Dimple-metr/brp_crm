//var datatable;

// validate vendor add form on keyup and submit
$("#a_add").validate({
	rules: {
		title: {
			required: true			
		},
		address: {
			required: true,
			minlength: 15
		}
	},
	messages: {
		title: {
			required: "Enter Title"
		},
		address: {
			required: "Enter Address",
			minlength: "Your Description must consist of at least 15 characters"
		}
		
	}

});
$("#a_add").on('submit',function(e) {
									
									
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#a_add").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var token=  $("#token").val();	
	var form_data=new FormData(this);

	$.ajax({
		cache:false,
		url: root_domain+'app/invoice_serise/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,	
		success: function(response)
		{
			console.log(response);			
			if(response.trim() == 'update') {
				Unloading();
				window.location=root_domain+'invoice_numberserise/1';
				toastr.success("UPDATE SUCCESSFULLY", "SUCCESS");		
			}
			else if(response == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(response == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			$('#serv_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function format_valuechange(typevalue)
{
	
	if(typevalue>0)
	{
		$('#format_value_div').removeClass('hidden');
		view_format($('#formate').val());
	}
	else
	{
		$('#format_value_div').addClass('hidden');	
		$('#ex_format_div').addClass('hidden');	
		$('#formate').val('');
	}
}
function view_format(formatval)
{
	var format=$('#invoice_format').val();
	var excise=$('#start_no').val();
	
	if(format>0)
	{
		$('#ex_format_div').removeClass('hidden');	
		if(format==1)
		{
			$('#ex_format').html(formatval+excise);
		}
		else if(format==2)
		{
			$('#ex_format').html(excise+formatval);
		}
	}
	else
	{
		$('#format_value_div').addClass('hidden');	
		$('#ex_format_div').addClass('hidden');	
		
	}
}
