var datatable;
$(document).ready(function() {
		datatable = $("#dynamic-table").dataTable({
			"bAutoWidth" : false,
			"bFilter" : true,
			"bSort" : true,
			"bProcessing": true,
			"bServerSide" : true,
			"oLanguage": {
					"sLengthMenu": "_MENU_",
					"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
					"sEmptyTable": "NO CITY ADDED YET !",
			},
			"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
			"iDisplayLength": 10,
			"sAjaxSource": root_domain+'app/citymst/',
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name": "mode", "value": "fetch" } );
			},
			"fnDrawCallback": function( oSettings ) {
				$('.ttip, [data-toggle="tooltip"]').tooltip();
			}
		}).fnSetFilteringDelay();

		//Search input style
		$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
		$('.dataTables_length select').addClass('form-control');
	// validate the comment form when it is submitted        

// validate vendor add form on keyup and submit
$("#city_add").validate({
	rules: {
		city_name: {
			required: true,
			minlength: 3
		},
		stateid: {
			required: true
		}	
	},
	messages: {
		city_name: {
			required: "Enter City Name",
			minlength: "Your City Name must consist of at least 3 characters"
		},
		stateid: {
			required: "Select State ID"			
		}
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditCity").validate({
	rules: {
		edit_city_name: {
			required: true,
			minlength: 3
		},
		edit_stateid: {
			required: true			
		}
		

	},
	messages: {
		edit_city_name: {
			required: "Enter City Name",
			minlength: "Your City Name must consist of at least 3 characters"
		},		
		edit_stateid: {
			required: "Select State ID"
		}
	}
});		

});
$("#city_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#city_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var token=  $("#token").val();	
	var state= $("#state_id").val();	
	var form_data = {
		stateid: state,
		city_name: $("#city_name").val(),		
		model: $("#model").val(),		
		token:token,
		mode:$("#mode").val(),
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/citymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);			
			var obj=jQuery.parseJSON(response);
			response=obj.res;
			if(response.trim() == '1') {
				toastr.success("CITY ADDED SUCCESSFULLY", "SUCCESS")
				Unloading();
				datatable.fnReloadAjax();
			}
			else if(response.trim() == '2') {
				toastr.success("CITY ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-example-modal-city").modal("hide");
				$('#cityid').append('<option value='+obj.cityid+'>'+obj.city_name+'</option>');
				$("#cityid").trigger('change')
				$('#cityid').select2("val",obj.cityid);
				$('#city_add').trigger('reset');
				Unloading();
			}
			else if(response.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(response.trim() == '-1')
			{
				$("#bs-example-modal-city").modal("hide");
				toastr.info("ALREADY EXISTS", "INFO")
				$("#bs-example-modal-city").modal("hide");
				$('#city_add').trigger('reset');
				Unloading();
			}
			$('#city_add').trigger('reset');	
			$('#stateid').select2("val",state);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
//var editReq = null;
$("#FormEditCity").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#FormEditCity").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		stateid: $("#edit_stateid").val(),
		city_name: $("#edit_city_name").val(),		
		token:$("#edit_token").val(),
		mode:'edit',
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/citymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			
			if(response.trim() == '1') {
				toastr.success("CITY UPDATED SUCCESSFULLY", "SUCCESS");
				datatable.fnReloadAjax();
				Unloading();						
			}
			else if(response.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(response.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			$("#ModalEditAccount").modal("hide");					
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function delete_catalog(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/citymst/',
				data: { mode : "delete", token :  $("#token").val(), eid : id },
				success: function(response)
				{
					
					if(response.trim() == "1") {
						toastr.success("CITY DELETE SUCCESSFULLY", "SUCCESS");
						datatable.fnReloadAjax();
						Unloading();
					}
					else if(response.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}							
				}
			});	
		}
	
}
function edit_test(id)
{
		Loading(true);
		editReq = $.ajax({
			type: "POST",
			url: root_domain+'app/citymst/',
			data: { mode : "preedit", id : id },
			success: function(response)
			{
				console.log(response);
				var obj = jQuery.parseJSON(response);
				$("#ModalEditAccount").modal("show");
				$("#edit_id").val(id);								
				$("#edit_city_name").val(obj.city_name);
				$("#edit_stateid").select2("val",obj.stateid);				
				Unloading();
			}
		});	
}
