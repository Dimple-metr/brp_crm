$(document).ready(function() {
	load_bom_datatable(); 
	load_bom_trn_data(); 
	
	// validate vendor add form on keyup and submit
	$("#bom_add").validate({
		rules: {
			bom_no: {
				required: true
			},
			bom_date: {
				required: true
			}
			
		},
		messages: {
			bom_no: {
				required: "Enter BOM No."
			},
			bom_date: {
				required: "Enter BOM Date"
			}
		}
	}); 
	
});
$("#bom_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#bom_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled");		
	$("#submit_btn").prop("disabled",true);		
	
	var form_data = new FormData(this);
	
	$.ajax({
		cache:false,
		url: root_domain+'app/bom/',
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
				toastr.success("BOM ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'bom_list';
			}
			else if(msg.trim() == '2') {				
				toastr.success("BOM UPDATED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'bom_list';
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
function delete_bom(bom_id,sales_order_id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/bom/',
			data: { mode : "delete", bom_id:bom_id, sales_order_id:sales_order_id },
			success: function(resnse)
			{
				if(resnse.trim() == "1") {
					toastr.success("BOM DELETED SUCCESSFULLY", "SUCCESS");
					load_bom_datatable();
				}
				else if(resnse.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
				Unloading();
			}
		});	
	}
	
}

function load_bom_datatable(){
	var date= $('#rep_date').val();
	
	$("#bom-datatable").dataTable({
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
		"sAjaxSource": root_domain+'app/bom/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "fetch" }, { "name": "date", "value": date } );
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
		req_product_rate:$("#req_product_rate").val(),
		req_unitid:$("#req_unitid").val(),
		req_product_amount:$("#req_product_amount").val(),
		bom_id:$("#eid").val() 
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/bom/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#req_product_id").select2("val","");
			$("#req_unitid").select2("val","");
			$("#req_product_id").select2('focus');
			$("#req_product_desc").val("");
			$("#req_product_qty").val("");
			$("#req_product_rate").val("");
			$("#req_product_amount").val("");
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
		url: root_domain+'app/bom/',
		data: { mode : "load_bom_trn_data", bom_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#master_bomtrn_tbody').html(resp);
			Unloading();
			get_bom_amount();
		}
	});
}
function edit_bom_trn_data(bom_trn_id)
{ 
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/bom/',
		data: { mode:"edit_bom_trn_data", bom_trn_id:bom_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#req_product_id").select2("val",resp.req_product_id);
			$("#req_unitid").select2("val",resp.req_unitid);
			$("#req_product_desc").val(resp.req_product_desc);
			$("#req_product_qty").val(resp.req_product_qty);
			$("#req_product_rate").val(resp.req_product_rate);
			$("#req_product_amount").val(resp.req_product_amount);
			$("#edit_id").val(bom_trn_id);
			$('#addrow').val('Update');
			Unloading();
		}
	});
}
function delete_bom_trn_data(bom_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/bom/',
			data: { mode:"delete_bom_trn_data", bom_trn_id:bom_trn_id },
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
			url: root_domain+'app/bom/',
			data: { mode:"load_product_dtls", product_id:product_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				$('#req_product_desc').val(resp.product_desc);
				$('#req_product_rate').val(resp.product_purchase_mst_rate);
				$('#req_unitid').select2("val",resp.product_mst_unitid);
				Unloading();						
			}
		});	
	}
}
function load_bom_no()
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/bom/',
		data: { mode:"load_bom_no" },
		success: function(response)
		{
			//console.log(response);
			$('#bom_no').val(response);
		}
	});	
}
function load_sales_order_data(sales_order_id)
{
	if(sales_order_id){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/bom/',
			data: { mode:"load_sales_order_data", sales_order_id:sales_order_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#so_trn_id').html(resp.html_resp);
				$('#so_trn_id').select2("val","").select2('focus');
				Unloading();
			}
		});	
	}
}
function load_sales_order_trn(so_trn_id)
{
	if(so_trn_id){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/bom/',
			data: { mode:"load_sales_order_trn", so_trn_id:so_trn_id },
			success: function(response)
			{
				//console.log(response);
				Unloading();
				load_bom_trn_data();
			}
		});	
	}
}

function get_bom_amount(){
	var req_product_qty = parseFloat($("#req_product_qty").val());
	var req_product_rate = parseFloat($("#req_product_rate").val());
	if(req_product_qty && req_product_rate && req_product_qty!='0' && req_product_rate!='0')
	{
		var req_product_amount=parseFloat((req_product_qty)*(req_product_rate));
		$("#req_product_amount").val(parseFloat(req_product_amount).toFixed(2));
	}
	else {
		$("#req_product_amount").val(0);
	}
	get_budget_gtotal();
}
function get_budget_gtotal()
{	
	var t=0;
	var input_amount=(document.getElementsByName('req_product_amount_ttl[]'));
	var cnt=input_amount.length;
	var total=0;
	for(var i=0;i<cnt;i++)
	{	
		var t=input_amount[i].value;
		if(t>0)
		total=parseFloat(total)+parseFloat(t);
	}
	$("#bom_trn_ttl").val(parseFloat(total).toFixed(2));
	
}

function load_chk_box(){
	//alert('OK');
	if($("#all_chk_box").prop("checked")==true){
		$(".chk_box").prop('checked', true);
	}
	else{
		$(".chk_box").prop('checked', false);
	}
}
function req_po_qty(){
	//Get Checkbox Values
	var req_trn_ids = $('input:checkbox:checked.chk_box').map(function(){ return this.value; }).get().join(",");
	var out_stk = $('input[name="out_stk[]"]').map(function(){ return this.value; }).get().join(",");
	if(!req_trn_ids){
		toastr.warning("Choose at least one Product", "WARNING");
	}
	else{
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/bom/',
			data: { mode:"req_po_qty", req_trn_ids:req_trn_ids, out_stk:out_stk },
			success: function(response)
			{
				//console.log(response);
				Unloading();
				location.reload();
				//window.location=root_domain+'po';
			}
		});
	}
}