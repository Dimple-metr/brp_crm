$(document).ready(function() {
	load_cust_cat_datatable();
	// validate the comment form when it is submitted        

$("#cust_cat_mst_add").validate({
	rules: {
		cc_name: {
			required: true
		}	
	},
	messages: {
		cc_name: {
			required: "Enter Party Category Name"			
		}	
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditCustCat").validate({
	rules: {
		edit_cc_name: {
			required: true
		}
	},
	messages: {
		edit_cc_name: {
			required: "Enter Party Category Name"			
		}
	}
});		

});
$("#cust_cat_mst_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#cust_cat_mst_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var cc_name=$("#cc_name").val();
	
	var form_data = {
		cc_name: cc_name,
		mode:"Add",
		CustCat_model:$("#CustCat_model").val(),
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/cust_cat_mst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			var resp=JSON.parse(response);
			var response = resp.resp;
			if(response.trim() == '1') {				
				toastr.success("Party Category ADDED SUCCESSFULLY", "SUCCESS");
				load_cust_cat_datatable();
			}
			else if(response.trim() == '2') {
				toastr.success("PARTY CATEGORY ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-product-group-modal").modal("hide");
				$('#cc_id').append('<option value='+resp.cc_id+'>'+resp.cc_name+'</option>');	
				$('#cc_id').select2("val",resp.cc_id);
				$("#cc_id").trigger('change');
			}
			else if(response.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(response.trim() == '-1') {
				toastr.info("ALREADY EXISTS", "INFO")			
			}
			Unloading();	
			$('#cust_cat_mst_add').trigger('reset');
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
//var editReq = null;
$("#FormEditCustCat").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#FormEditCustCat").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		cc_name: $("#edit_cc_name").val(),
		mode:'edit',
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/cust_cat_mst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			if(response.trim() == '1') {
				toastr.success("DATA UPDATED SUCCESSFULLY", "SUCCESS");
				load_cust_cat_datatable();
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
			$("#ModalEditCustCat").modal("hide");					
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function delete_cust_category(id) 
{
	var r= confirm(" Are you want to delete ?");

	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/cust_cat_mst/',
			data: { mode : "delete", eid : id },
			success: function(response)
			{
				
				if(response.trim() == "1") {
					toastr.success("PARTY CATEGORY DELETE SUCCESSFULLY", "SUCCESS");
					load_cust_cat_datatable();
				}
				else if(response.trim() == "-1") {
					toastr.error("USED PARTY CATEGORY CAN'T BE DELETED !!!", "WARNING"); 
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
	
}
function edit_cust_category(id)
{
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/cust_cat_mst/',
		data: { mode : "preedit", id : id },
		success: function(response)
		{
			console.log(response);
			var obj = jQuery.parseJSON(response);
			$("#ModalEditCustCat").modal("show");
			$("#edit_id").val(obj.cc_id);
			$("#edit_cc_name").val(obj.cc_name);
			Unloading();
		}
	});	
}
function load_cust_cat_datatable(){
	$("#dynamic-table").dataTable({
		"bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bProcessing": true,
		"bServerSide" : true,
		"bDestroy" : true,
		"oLanguage": {
				"sLengthMenu": "_MENU_",
				"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
				"sEmptyTable": "NO DATA ADDED YET !",
		},
		"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/cust_cat_mst/',
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
}