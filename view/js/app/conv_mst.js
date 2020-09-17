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
			"sAjaxSource": root_domain+'app/conv_mst/',
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
$("#conv_add").validate({
	rules: {
		a_name: {
			required: true
		},
		a_priority: {
			required: true
		},
		
		
	},
	messages: {
		a_name: {
			required: "Enter conv_mst Name"			
		},
		a_priority: {
			required: "Enter conv_mst Priority"	
		},
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditunit").validate({
	rules: {
	edit_g_name: {
			required: true
		}
	},
	messages: {
		edit_g_name: {
			required: "Enter Product Group Name"			
		}
	}
});		

});
$("#conv_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#conv_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	
	Loading();	
	$(this).attr("disabled","disabled");		
	
	var form_data=new FormData(this);
	
	var token	=  $("#token").val();	
	
	//alert(form_data);
	$.ajax({
		cache:false,
		url: root_domain+'app/conv_mst/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(responsevalue)
		{
			
			if(responsevalue.trim() == '1') {
				
				toastr.success("DATA ADDED SUCCESSFULLY", "SUCCESS")
				$('#conv_add').trigger('reset');
				$(".conv_currency").select2("val","");				
						
				Unloading();
				window.location.reload();
				//show_unit_data();
				//load_pro_tbl();
			}
			if(responsevalue.trim() == '2') {
				
				toastr.success("PRODUCT Updated SUCCESSFULLY", "SUCCESS")
				$('#product_add').trigger('reset');
				$("#product_gst").select2("val","");				
				$("#product_sale_gst").select2("val","");				
				$("#product_purchase_gst").select2("val","");				
				$("#product_base_unit").select2("val","");				
				$("#product_category").select2("val","");				
				Unloading();
				window.location=root_domain+'product_list';
				//show_unit_data();
				//load_pro_tbl();
			}
			else if(responsevalue.trim() == '0') {
				toastr.error("something wrong", "ERROR")
				$('#product_add').trigger('reset');	
				Unloading();
			}
			else if(responsevalue.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				//$("#bs-example-modal-addproduct").modal("hide");
				$('#product_add').trigger('reset');
				Unloading();				
			}
			else if(responsevalue.trim() == '3') {
				toastr.success("PRODUCT ADDED SUCCESSFULLY", "SUCCESS");
				$("#add_product_modal").modal("hide");
				$('#product_id').append('<option value='+data.product_id+'>'+data.product_name+'</option>'); 
				$('#product_id').select2("val",data.product_id);
				$("#product_id").trigger('change');
				Unloading();
			}
			
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
		e_a_name: $("#e_a_name").val(),
		e_a_priority: $("#e_a_priority").val(),
		e_a_detail: $("#e_a_detail").val(),
		mode:'edit',
		is_ajax: 1
	};	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/conv_mst/',
		type: "POST",
		data: form_data,
		success: function(response)
		{
			console.log(response);
			if(response.trim() == '1') {
				toastr.success("UPDATED SUCCESSFULLY", "SUCCESS");
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
function delete_data(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/conv_mst/',
				data: { mode : "delete", eid : id },
				success: function(response)
				{
					
					if(response.trim() == "1") {
						toastr.success("Data DELETE SUCCESSFULLY", "SUCCESS");
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
function edit_data(id)
{
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/conv_mst/',
		data: { mode : "preedit", id : id },
		success: function(response)
		{
			console.log(response);
			var obj = jQuery.parseJSON(response);
			
			$("#ModalEditAccount").modal("show");
			$("#edit_id").val(obj.an_id);
			$("#e_a_name").val(obj.an_name);
			$("#e_a_priority").val(obj.an_priority);
			$("#e_a_detail").val(obj.an_detail);
			Unloading();
		}
	});	
}
