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
					"sEmptyTable": "NO DATA ADDED YET !",
			},
			"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
			"iDisplayLength": 100,
			"sAjaxSource": root_domain+'app/itemmst/',
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
$("#item_add").validate({
	rules: {
		item_name: {
			required: true
		},
		item_stock:{
			required: true
		}
	},
	messages: {
		item_name: {
			required: "Enter item"
		},
		item_stock:{
			required: "Enter Stock"
		}
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEdititem").validate({
	rules: {
		edit_item_name: {
			required: true
		},
		edit_item_stock:{
			required: true
		}
	},
	messages: {
		edit_item_name: {
			required: "Enter item",
		},
		edit_item_stock:{
			required: "Enter Stock"
		}
	}
});		

});
$("#item_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#item_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var token	=  $("#token").val();	
	var mode=$("#mode").val();
	var form_data = {
		item_name: $("#item_name").val(),		
		item_code: $("#item_code").val(),		
		item_stock: $("#item_stock").val(),		
		token:token,
		mode:mode,
		is_ajax: 1
	};	
	$.ajax({
		cache:false,
		url: root_domain+'app/itemmst/',
		type: "POST",
		data: form_data,
		success: function(resnse)
		{
			console.log(resnse);			
			if(resnse.trim() == '1') {
				toastr.success("Item ADDED SUCCESSFULLY", "SUCCESS")
				Unloading();
				datatable.fnReloadAjax();
			}
			else if(resnse.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(resnse.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			$('#item_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
//var editReq = null;
$("#FormEdititem").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#FormEdititem").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		item_name: $("#edit_item_name").val(),		
		item_code: $("#edit_item_code").val(),		
		item_stock: $("#edit_item_stock").val(),		
		token:$("#edit_token").val(),
		mode:'edit',
		is_ajax: 1
	};	
	$.ajax({
		cache:false,
		url: root_domain+'app/itemmst/',
		type: "POST",
		data: form_data,
		success: function(resnse)
		{
			console.log(resnse);
			
			if(resnse.trim() == '1') {
				toastr.success("item UPDATED SUCCESSFULLY", "SUCCESS");
				datatable.fnReloadAjax();
				Unloading();						
			}
			else if(resnse.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(resnse.trim() == '-1')
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
function delete_item(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/itemmst/',
				data: { mode : "delete", token :  $("#token").val(), eid : id },
				success: function(resnse)
				{
					
					if(resnse.trim() == "1") {
						toastr.success("item DELETE SUCCESSFULLY", "SUCCESS");
						datatable.fnReloadAjax();
						Unloading();
					}
					else if(resnse.trim() == "0") {
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
			url: root_domain+'app/itemmst/',
			data: { mode : "preedit", id : id },
			success: function(resnse)
			{
				//console.log(resnse);
				var obj = jQuery.parseJSON(resnse);
				$("#ModalEditAccount").modal("show");
				$("#edit_id").val(id);								
				$("#edit_item_name").val(obj.item_name);
				$("#edit_item_stock").val(obj.item_stock);
				$("#edit_item_code").val(obj.item_code);
				Unloading();
			}
		});	
}
