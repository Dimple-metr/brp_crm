//var datatable;
$(document).ready(function() {
	load_prf_datatable();
	show_ven_rmrk_field();
		
	// validate vendor add form on keyup and submit
	$("#prf_entry_add").validate({
		rules: {
			prf_entry_no: {
				required: true			
			},
			prf_entry_date:{
				required : true	
			},
			remark:{
				required : true	
			}
		},
		messages: {
			prf_entry_no: {
				required: "Enter PRF Entry no"
			},
			prf_entry_date:{
				required : "Enter PRF Entry date"
			},
			remark:{
				required : "Enter Remark"
			}
		}
	}); 
});
$("#prf_entry_add").on('submit',function(e) {
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#prf_entry_add").valid()) {
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
		url: root_domain+'app/prf/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);
			if(arr.msg == '1') {
				toastr.success("PRF ENTRY ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'prf_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1'){
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg== 'update'){	
				toastr.success("PRF ENTRY UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'prf_list';
			}
			Unloading();
			$('#prf_entry_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
}); 
function delete_prf_entry(id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/prf/',
			data: { mode:"delete", eid:id },
			success: function(response)
			{
				console.log(response)
				if(response.trim() == "1") {
					toastr.success("PRF ENTRY DELETED SUCCESSFULLY", "SUCCESS");
					load_prf_datatable();
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
	if(product_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/prf/',
			data: { mode : "load_productdata", eid :product_id },
			success: function(response)
			{
				//console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.product_des);					
			}
		});
	}
}
function load_prf_datatable()
{
	var date=$('#rep_date').val();
	
	$("#prf-entry-datatable").dataTable({
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
		"sAjaxSource": root_domain+'app/prf/',
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

function show_ven_hist(product_id)
{
	if(product_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode:"show_ven_hist", product_id:product_id },
			success: function(resp){
				//console.log(resp);
				$('#pro_ven_hist').html(resp);	
				$('.readonly').hide();
				Unloading();
			}
		});
	}
}
function load_prf_entry_no() {
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode : "load_invoiceno" },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#prf_entry_no').val(no.invoiceno); 
		}
	});
}

function add_ven_rmrk_field()
{
	if(!$("#product_id").val()){		
		toastr.warning("Choose Product !!!", "ERROR");
		$("#product_id").select2('focus');
		return false;
	}
	else if(!$("#prf_qty").val()){		
		toastr.warning("Enter Qty", "ERROR");
		$("#prf_qty").focus();
		return false;
	}
	/*else if(!$("#new_ven_name").val()){		
		toastr.warning("Enter Vendor Name", "ERROR");
		$("#new_ven_name").focus();
		return false;
	}
	else if(!$("#new_ven_rmrk").val()){
		toastr.warning("Enter Description", "ERROR");
		$("#new_ven_rmrk").focus();
		return false;
	}*/
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode : "add_ven_rmrk_field", edit_rmrk_id:$("#edit_rmrk_id").val(), product_id:$("#product_id").val(),prf_qty:$("#prf_qty").val(),product_des:$("#product_des").val(),new_ven_name:$("#new_ven_name").val(),new_ven_rmrk:$("#new_ven_rmrk").val(), prf_entry_id:$("#eid").val() },
		success: function(response)
		{
			//console.log(response);
			$("#product_id").select2("val","");
			$("#product_des").val("");
			$("#prf_qty").val("");
			$("#new_ven_name").val("");
			$("#new_ven_rmrk").val("");
			$("#edit_rmrk_id").val("");
			$('#add_rmrk_btn').val('Add');
			Unloading();
			show_ven_rmrk_field();
		}
	});
}
function show_ven_rmrk_field() {
	var eid = $('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode : "show_ven_rmrk_field", prf_entry_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#new_ven_rmrk_div').html(resp);
			Unloading();
		}		 
	}); 
}
function edit_ven_rmrk_field(ven_rmrk_id)
{ 
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode:"edit_ven_rmrk_field", ven_rmrk_id:ven_rmrk_id },
		success: function(response)
		{
			//console.log(response)
			var resp = jQuery.parseJSON(response);
			$("#product_id").select2("val",resp.product_id);
			$("#prf_qty").val(resp.prf_qty);
			$("#product_des").val(resp.product_des);
			$("#new_ven_name").val(resp.new_ven_name);
			$("#new_ven_rmrk").val(resp.new_ven_rmrk);
			$("#edit_rmrk_id").val(ven_rmrk_id);
			$('#add_rmrk_btn').val('Update');
			Unloading();
		}
	});
}
function delete_ven_rmrk_field(ven_rmrk_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/prf/',
			data: { mode:"delete_ven_rmrk_field", ven_rmrk_id:ven_rmrk_id },
			success: function(response)
			{
				//console.log(response);
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_ven_rmrk_field();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
}

function open_approv_prf_status(user_id,prf_entry_id,prf_entry_no){
	alert(user_id);
	$('#preview_approval_hist_modal').modal('show');
	$('#apprv_ref_no').html(prf_entry_no);
	$('#assign_user_ids').select2("val",user_id);
	$('#ref_sales_order_id').val(prf_entry_id);
	load_prf_hist_datatable();
}
function add_apprv_hist(){
	
	var form_data = {
		mode:"add_apprv_hist",
		assign_user_ids:$('#assign_user_ids').val(),
		approve_status:$('#approve_status').val(),
		approve_remark:$('#approve_remark').val(),
		prf_entry_id:$('#ref_sales_order_id').val()
	};
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: form_data,
		success: function(response)
		{
			$('#assign_user_ids').select2("val","");
			$('#approve_status').select2("val","0");
			$('#approve_remark').val("");
			load_prf_hist_datatable();
			load_prf_datatable();
			Unloading();
		}
	});	
}
function load_prf_hist_datatable(){
	var prf_entry_id = $('#ref_sales_order_id').val();
	
	$("#sales-order-history-datatable").dataTable({
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
		"aLengthMenu": [[5, 10, 20, -1], [5, 10, 20,"All"]],
		"iDisplayLength": 5,
		"sAjaxSource": root_domain+'app/prf/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_prf_hist_datatable" }, { "name": "prf_entry_id", "value": prf_entry_id }  );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
	// validate the comment form when it is submitted  
}
function chk_open_ven_rate_hist(){
	var product_id = $('#product_id').val();
	if(product_id){
		var product_name = $('#product_id option:selected').text();
		open_ven_rate_hist(product_id,product_name);
	}
	else{
		toastr.warning("Choose Product !!!", "WARNING");
		$('#product_id').select2('focus');
	}
}
function open_ven_rate_hist(product_id,product_name){
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode:"open_ven_rate_hist", product_id:product_id},
		success: function(response)
		{
			var resp = JSON.parse(response);
			$('#view_ven_rate_rmrk_modal').modal('show');
			$('#view_ven_rate_rmrk_pro').html(product_name);
			$('#view_ven_rate_rmrk_modal_div').html(resp.resp_html);
			Unloading();
		}
	});	
}
function close_prf_status(prf_entry_id,po_status){
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/prf/',
		data: { mode:"close_prf_status", prf_entry_id:prf_entry_id, po_status:po_status},
		success: function(response)
		{
			if(response.trim() == "1") {
				toastr.success("PRF STATUS DELETED SUCCESSFULLY", "SUCCESS");
				load_prf_datatable();
			}
			else if(response.trim() == "0") {
				toastr.warning("SOMETHING WRONG", "WARNING");
			}
			Unloading();
		}
	});	
}