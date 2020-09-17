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
			"iDisplayLength": 10,
			"sAjaxSource": root_domain+'app/categorymst/',
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
$("#category_add").validate({
	rules: {
		cat_name: {
			required: true
		},
		
	},
	messages: {
		cat_name: {
			required: "Enter Category Name"			
		},
		
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditunit").validate({
	rules: {
	edit_unit_name: {
			required: true
		}
	},
	messages: {
		edit_unit_name: {
			required: "Enter Unit Name"			
		}
	}
});		

});
$("#category_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#category_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var cat_name=$("#cat_name").val();
	
	var form_data = {
		cat_name: cat_name,
		mode:"Add",
		cat_model:$("#cat_model").val(),
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/categorymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			var resp=JSON.parse(response);
			var response = resp.resp;
			if(response.trim() == '1') {				
				toastr.success("CATEGORY ADDED SUCCESSFULLY", "SUCCESS");
				get_category_dropdown('cat_parent');
				Unloading();
				datatable.fnReloadAjax();
			}
			else if(response.trim() == '2') {
				toastr.success("CATEGORY ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-product-category-modal").modal("hide");
				$('#product_cat').append('<option value='+resp.cat_id+'>'+resp.cat_name+'</option>');	
				$('#product_cat').select2("val",resp.cat_id);
				$("#product_cat").trigger('change');
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
			$('#category_add').trigger('reset');
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
//var editReq = null;
$("#FormEditunit").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#FormEditunit").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		e_cat_name: $("#e_cat_name").val(),
		e_cat_parent: $("#e_cat_parent").val(),
		mode:'edit',
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/categorymst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			if(response.trim() == '1') {
				toastr.success("CATEGORY UPDATED SUCCESSFULLY", "SUCCESS");
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
function delete_category(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/categorymst/',
				data: { mode : "delete", eid : id },
				success: function(response)
				{
					
					if(response.trim() == "1") {
						toastr.success("Category DELETE SUCCESSFULLY", "SUCCESS");
						delete_reload();
					}
					else if(response.trim() == "-1") {
						toastr.error("USED CATEGORY TYPE CAN'T BE DELETED !!!", "WARNING"); 
					}
					else if(response.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}	
					Unloading();						
				}
			});	
		}
	
}
function edit_category(id)
{
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/categorymst/',
		data: { mode : "preedit", id : id },
		success: function(response)
		{
			console.log(response);
			var obj = jQuery.parseJSON(response);
			
			$("#ModalEditAccount").modal("show");
			$("#edit_id").val(obj.cat_id);
			$("#edit_pid").val(obj.cat_pid);
			get_category_dropdown('e_cat_parent');
			$("#e_cat_name").val(obj.cat_name);
			Unloading();
		}
	});	
}
function get_category_dropdown(sel_id)
{
	//alert(sel_id);
	var id = $('#edit_pid').val();
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/categorymst/',
		data: { mode : "get_category_dropdown_data",id:id },
		success: function(response)
		{
			console.log(response);
			$('#'+sel_id).html(response);
			Unloading();
		}
	});	
}