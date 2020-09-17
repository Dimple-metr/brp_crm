//var datatable;
$(document).ready(function() {
	load_issue_datatable();
	show_data();
		
	// validate vendor add form on keyup and submit
	$("#issue_entry_add").validate({
		rules: {
			issue_entry_no: {
				required: true			
			},
			issue_entry_date:{
				required : true	
			}
		},
		messages: {
			issue_entry_no: {
				required: "Enter Issue Entry no"
			},
			issue_entry_date:{
				required : "Enter Issue Entry date"
			}
		}
	}); 
});
$("#issue_entry_add").on('submit',function(e) {
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#issue_entry_add").valid()) {
		return false;
	}
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	$("#save").attr("disabled","disabled");		
	
	var form_data=new FormData(this);
	//console.log(form_data);
	$.ajax({
		cache:false,
		url: root_domain+'app/issue_entry/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);
			if(arr.msg == '1') {
				toastr.success("ISSUE ENTRY ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'issue_entry_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1'){
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg== 'update'){	
				toastr.success("ISSUE ENTRY UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'issue_entry_list';
			}
			Unloading();
			$('#issue_entry_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
}); 
function delete_issue_entry(id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/issue_entry/',
			data: { mode:"delete", eid:id },
			success: function(response)
			{
				console.log(response)
				if(response.trim() == "1") {
					toastr.success("ISSUE ENTRY DELETED SUCCESSFULLY", "SUCCESS");
					load_issue_datatable();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
				Unloading();
			}
		});
	}
	
}


function load_productdetail(product_id) {
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/issue_entry/',
		data: { mode : "load_productdata", eid :product_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response)
			$('#product_des').val(obj.product_des);							
			$('#unitid').select2("val",obj.product_mst_unitid);		
		}
	});
	
}
function add_field()
{
	if($("#product_id").val()=="") {		
		toastr.warning("Select Product", "ERROR");
		$("#product_id").select2('focus');
		return false;
	}
	else if(!$("#product_qty").val() || parseFloat($("#product_qty").val())=='0') {		
		toastr.warning("Enter Qty", "ERROR");
		$("#product_qty").focus();
		return false;
	}
	else if(!$("#unitid").val()) {
		toastr.warning("Select Unit", "ERROR");
		$("#unitid").select2('focus');
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/issue_entry/',
		data: { mode : "fieldadd",edit_id:$("#edit_id").val(),product_id:$("#product_id").val(),product_des:$("#product_des").val(),product_qty:$("#product_qty").val(),unit_id:$("#unitid").val(),issue_entry_id:$("#eid").val() },
		success: function(response)
		{
			//console.log(response);
			//$("#product_id option[value='"+$("#product_id").val()+"']").remove();
			$("#product_id").select2("val","");
			$("#product_id").select2('focus');
			$("#product_des").val("");
			$("#product_qty").val("");
			$("#unit_id").select2('val',"");
			$("#edit_id").val('');
			$('#addproduct').show();
			$('#addrow').val('Add');
			Unloading();
			show_data();
		}
	});
}
function load_issue_datatable()
{
	var date=$('#rep_date').val();
	
	$("#issue-entry-datatable").dataTable({
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
		"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/issue_entry/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "fetch" },{ "name": "date", "value": date } );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}

function show_data()
{
	var eid = $("#eid").val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/issue_entry/',
		data: { mode:"load_tempoutward", eid:eid },
		success: function(data){
			//console.log(data);
			$('#sale_productdata').html(data);		
			Unloading();
		}		
	});
}

function edit_data(id)
{
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/issue_entry/',
		data: { mode : "preedit",  id : id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			//$('#product_id').html(resp.producthtml);
			//$('#product_id').append('<option value="'+resp.product_id+'">'+resp.product_name+'</option>');
			$("#product_id").select2("val",resp.product_id);
			$("#product_des").val(resp.description);
			$("#product_qty").val(resp.product_qty);
			$("#unitid").select2("val",resp.unit_id);
			$("#edit_id").val(id);
			$('#addrow').val('Update');
			Unloading();
		}
	});
}
function delete_data(id)
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/issue_entry/',
			data: { mode : "delete_data", eid:id },
			success: function(response)
			{
				console.log(response)
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
	
}
function load_issue_entry_no() {
	$.ajax({
		type: "POST",
		url: root_domain+'app/issue_entry/',
		data: { mode : "load_invoiceno" },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#issue_entry_no').val(no.invoiceno); 
		}
	});
}