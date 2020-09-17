var datatable;
$(document).ready(function() {
	
		get_ter_list('t_parent');
		datatable = $("#dynamic-table").dataTable({
			"bAutoWidth" : false,
			"bFilter" : true,
			"bSort" : true,
			"bProcessing": true,
			"bServerSide" : true,
			"oLanguage": {
					"sLengthMenu": "_MENU_",
					"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
					"sEmptyTable": "NO territory ADDED YET !",
			},
			"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
			"iDisplayLength": 10,
			"sAjaxSource": root_domain+'app/territorymst/',
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
$("#territory_add").validate({
	rules: {
		t_name: {
			required: true,
			minlength: 3
		}
	},
	messages: {
		t_name: {
			required: "Enter territory Name",
			minlength: "Your territory Name must consist of at least 3 characters"
		}
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditterritory").validate({
	rules: {
		territory_name: {
			required: true,
			minlength: 3
		}		

	},
	messages: {
		vendor_name: {
			required: "Enter territory Name",
			minlength: "Your territory Name must consist of at least 3 characters"
		}
	}
});		

});
$("#territory_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#territory_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var token=  $("#token").val();		
	var form_data = {
		t_name: $("#t_name").val(),
		t_parent: $("#t_parent").val(),
		token:token,
		mode:$("#mode").val(),
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/territorymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{response=response.replace(/\<head\s*[\/]?>/gi,"");

			console.log(response);
			
			if(response.trim() == '1') {
				toastr.success("territory ADDED SUCCESSFULLY", "SUCCESS");
				get_ter_list('t_parent');
				Unloading();
				datatable.fnReloadAjax();
				
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
			$('#territory_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
//var editReq = null;
$("#FormEditterritory").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#FormEditterritory").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		territory_name: $("#edit_t_name").val(),
		mode:'edit',
		is_ajax: 1
	};	
	//alert(form_data);
	$.ajax({
		cache:false,
		url: root_domain+'app/territorymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{response=response.replace(/\<head\s*[\/]?>/gi,"");

			//console.log(response);
			
			if(response.trim() == '1') {
				toastr.success("territory UPDATED SUCCESSFULLY", "SUCCESS");
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
function delete_reload()
{
	datatable.fnReloadAjax();
}
function delete_territory(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/territorymst/',
				data: { mode : "delete", token :  $("#token").val(), eid : id },
				success: function(response)
		{response=response.replace(/\<head\s*[\/]?>/gi,"");

					
					if(response.trim() == "1") {
						toastr.success("territory DELETE SUCCESSFULLY", "SUCCESS");
						delete_reload();
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
			url: root_domain+'app/territorymst/',
			data: { mode : "preedit", id : id },
			success: function(response)
		{response=response.replace(/\<head\s*[\/]?>/gi,"");

				//console.log(response);
				var obj = jQuery.parseJSON(response);
				//alert(obj.t_parent);
				$("#ModalEditAccount").modal("show");
				get_ter_list('edit_t_parent');
				$("#edit_id").val(id);				
				$("#edit_t_parent").val(obj.t_parent);				
				$("#edit_t_name").val(obj.t_name);
				Unloading();
			}
		});	
	}
	
function get_ter_list(text_id)
{
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/territorymst/',
		data: { mode : "get_ter_list" },
		success: function(response)
		{
			//alert(response);
			$("#"+text_id).html(response);
			$("#"+text_id).select2("val","0");
			Unloading();
		}
	});	
}