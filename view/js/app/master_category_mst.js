var datatable;
$(document).ready(function() {
		
	load_table_category();
	// validate the comment form when it is submitted        

// validate vendor add form on keyup and submit
$("#master_cat_add").validate({
	rules: {
		master_cat: {
			required: true
		},
		master_cat_name:{
			required:true
		},
		
	},
	messages: {
		master_cat: {
			required: "Select Category"			
		},
		master_cat_name:{
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
$("#master_cat_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#master_cat_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var master_cat=$("#master_cat").val();
	var master_cat_name=$("#master_cat_name").val();
	
	//alert(master_cat);
	//alert(master_cat_name);
	
	var form_data = {
		master_cat: master_cat,
		master_cat_name: master_cat_name,
		mode:$("#mode").val(),
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/mastercategory/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			if(response.trim() == '1') {				
				toastr.success("Category ADDED SUCCESSFULLY", "SUCCESS");
				load_table_category(master_cat);
				$('#master_cat').select2("val","");
				$('#master_cat_name').val('');
				Unloading();
				//datatable.fnReloadAjax();
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
			//$('#category_add').trigger('reset');
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
		master_cat: $('#e_master_cat').val(),
		master_cat_name: $('#e_cat_name').val(),
		mode:'edit',
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/mastercategory/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			if(response.trim() == '1') {
				
				toastr.success("UPDATED SUCCESSFULLY", "SUCCESS");
				load_table_category();
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
				url: root_domain+'app/mastercategory/',
				data: { mode : "delete", eid : id },
				success: function(response)
				{
					
					if(response.trim() == "1") {
						toastr.success("DELETE SUCCESSFULLY", "SUCCESS");
						load_table_category();
						Unloading();
					}
					else if(response.trim() == "0") {
						
					toastr.warning("SOMETHING WRONG", "WARNING");
					}							
				}
			});	
		}
	
}
function edit_category(id)
{
	//alert(id);
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/mastercategory/',
		data: { mode : "preedit", id : id },
		success: function(response)
		{
			console.log(response);
			var obj = jQuery.parseJSON(response);
			
			$("#ModalEditAccount").modal("show");
			$("#edit_id").val(obj.mcd_id);
			get_category_dropdown(obj.mcd_cat_id);
			$("#e_cat_name").val(obj.mcd_name);
			Unloading();
		}
	});	
}
function get_category_dropdown(sel_id)
{
	//alert(sel_id);
	//var id = $('#edit_pid').val();
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/mastercategory/',
		data: { mode : "get_master_category_dropdown_data",id:sel_id },
		success: function(response)
		{
			console.log(response);
			//alert(response);
			$('#e_master_cat').html(response);
			$('#e_master_cat').select2("val",sel_id);
			Unloading();
		}
	});	
}

function load_table_category(cat)
{
	var datatable = $("#dynamic-table").dataTable({
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
			"sAjaxSource": root_domain+'app/mastercategory/',
			"fnServerParams": function ( aoData ) {
				aoData.push( { "name": "mode", "value": "fetch" },{ "name": "cat", "value": cat } );
			},
			"fnDrawCallback": function( oSettings ) {
				$('.ttip, [data-toggle="tooltip"]').tooltip();
			}
		}).fnSetFilteringDelay();

		//Search input style
		$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
		$('.dataTables_length select').addClass('form-control');
}