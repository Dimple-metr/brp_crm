$(document).ready(function() {
	load_master_bom_datatable(); 
	load_bom_trn_data(); 
	
	// validate vendor add form on keyup and submit
	$("#master_bom_add").validate({
		rules: {
			product_id: {
				required: true
			},
			finish_pro_qty: {
				required: true
			}
			
		},
		messages: {
			product_id: {
				required: "Choose Product Product"
			},
			finish_pro_qty: {
				required: "Enter Quantity"
			}
			
		}
	}); 
	
});
$("#master_bom_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#master_bom_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled");		
	$("#submit_btn").prop("disabled",true);		
	
	var form_data = new FormData(this);
	
	$.ajax({
		cache:false,
		url: root_domain+'app/master_bom/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);
			var resp=JSON.parse(response);
			var msg=resp.msg;
			if(msg.trim() == '1') {				
				toastr.success("MASTER BOM ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'master_bom_list';
			}
			else if(msg.trim() == '2') {				
				toastr.success("MASTER BOM UPDATED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'master_bom_list';
			}
			else if(msg.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(msg.trim() == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");		
			}
			$("#submit_btn").prop("disabled",false);	
			Unloading();
		}
	});
	
});
function delete_master_bom(bom_mst_id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/master_bom/',
			data: { mode : "delete", bom_mst_id : bom_mst_id },
			success: function(resnse)
			{
				if(resnse.trim() == "1") {
					toastr.success("MASTER BOM DELETE SUCCESSFULLY", "SUCCESS");
					load_master_bom_datatable();
				}
				else if(resnse.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
	
}

function load_master_bom_datatable(){
	
	$("#masterbom-datatable").dataTable({
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
		"sAjaxSource": root_domain+'app/master_bom/',
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
}

function add_bom_trn_data()
{
	if(!$("#req_product_id").val()){
		toastr.warning("Select Item", "ERROR");
		$("#req_product_id").select2('focus');
		return false;
	}
	else if(!$("#req_product_qty").val() || parseFloat($("#req_product_qty").val())=='0'){		
		toastr.warning("Enter Qty", "ERROR");
		$("#req_product_qty").focus();
		return false;
	}
	
	var form_data = { 
		mode : "add_bom_trn_data",
		edit_id:$("#edit_id").val(),
		req_product_id:$("#req_product_id").val(),
		req_product_desc:$("#req_product_desc").val(),
		req_product_qty:$("#req_product_qty").val(),
		req_unitid:$("#req_unitid").val(),
		bom_mst_id:$("#eid").val() 
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/master_bom/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#req_product_id").select2("val","");
			$("#req_unitid").select2("val","");
			$("#req_product_id").select2('focus');
			$("#req_product_desc").val("");
			$("#req_product_qty").val("");
			$("#edit_id").val('');
			$('#addrow').val('Add');
			Unloading();
			load_bom_trn_data();
		}
	});
}
function load_bom_trn_data() {
	var eid = $('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/master_bom/',
		data: { mode : "load_bom_trn_data", bom_mst_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#master_bomtrn_tbody').html(resp);		 
			Unloading();
		}		 
	}); 
}
function edit_bom_trn_data(bom_mst_trn_id)
{ 
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/master_bom/',
		data: { mode:"edit_bom_trn_data", bom_mst_trn_id:bom_mst_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#req_product_id").select2("val",resp.req_product_id);
			$("#req_unitid").select2("val",resp.req_unitid);
			$("#req_product_desc").val(resp.req_product_desc);
			$("#req_product_qty").val(resp.req_product_qty);
			$("#edit_id").val(bom_mst_trn_id);
			$('#addrow').val('Update');
			Unloading();
		}
	});
}
function delete_bom_trn_data(bom_mst_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/master_bom/',
			data: { mode:"delete_bom_trn_data", bom_mst_trn_id:bom_mst_trn_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				var msg=resp.res;
				if(msg.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
				}
				else if(msg.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();
				load_bom_trn_data();						
			}
		});	
	}
}

function load_product_dtls(product_id)
{
	if(product_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/master_bom/',
			data: { mode:"load_product_dtls", product_id:product_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				$('#req_product_desc').val(resp.product_desc);
				$('#req_unitid').select2("val",resp.product_mst_unitid);
				Unloading();						
			}
		});	
	}
}
function chk_exist_bom(product_id){
	if(product_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/master_bom/',
			data: { mode:"chk_exist_bom", product_id:product_id },
			success: function(response)
			{
				//console.log(response);
				if(response.trim()=='-1'){
					$('#product_id').select2('focus');
					$('#chk_exist_bom_err').show();
				}
				else{
					$('#chk_exist_bom_err').hide();
				}
				Unloading();						
			}
		});	
	}
}