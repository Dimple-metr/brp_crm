$(document).ready(function() {
	load_sales_order_datatable(); 
	load_so_trn_data(); 
	
	// validate vendor add form on keyup and submit
	$("#sales_order_add").validate({
		rules: {
			sales_order_date: {
				required: true
			},
			cust_id: {
				required: true
			},
			quotation_id: {
				required: true
			}
			
		},
		messages: {
			sales_order_date: {
				required: "Choose Sales Order Date"
			},
			cust_id: {
				required: "Choose Customer"
			},
			quotation_id: {
				required: "Choose Quotation"
			}
			
		}
	}); 
	
});
$("#sales_order_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#sales_order_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled");		
	$("#submit_btn").prop("disabled",true);		
	
	var form_data = new FormData(this);
	
	$.ajax({
		cache:false,
		url: root_domain+'app/sales_order/',
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
				toastr.success("SALES ORDER ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'sales_order_list';
			}
			else if(msg.trim() == '2') {				
				toastr.success("SALES ORDER UPDATED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'sales_order_list';
			}
			else if(msg.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			$("#submit_btn").prop("disabled",false);	
			Unloading();
		}
	});
	
});
function delete_sales_order(sales_order_id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/sales_order/',
			data: { mode : "delete", sales_order_id : sales_order_id },
			success: function(resnse)
			{
				if(resnse.trim() == "1") {
					toastr.success("SALES ORDER DELETE SUCCESSFULLY", "SUCCESS");
					load_sales_order_datatable();
				}
				else if(resnse.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
	
}

function load_sales_order_datatable(){
	var date=$('#rep_date').val();
	
	$("#sales-order-datatable").dataTable({
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
		"sAjaxSource": root_domain+'app/sales_order/',
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

function add_so_trn_data()
{
	if(!$("#product_id").val()){
		toastr.warning("Select Item", "ERROR");
		$("#product_id").select2('focus');
		return false;
	}
	else if(!$("#product_qty").val() || parseFloat($("#product_qty").val())=='0'){		
		toastr.warning("Enter Qty", "ERROR");
		$("#product_qty").focus();
		return false;
	}
	
	var form_data = { 
		mode : "add_so_trn_data",
		edit_id:$("#edit_id").val(),
		product_id:$("#product_id").val(),
		product_desc:$("#product_desc").val(),
		product_qty:$("#product_qty").val(),
		unitid:$("#unitid").val(), 
		product_rate:$("#product_rate").val(), 
		product_discount:$("#product_discount").val(), 
		discount_per:$("#discount_per").val(), 
		product_amount:$("#product_amount").val(), 
		formulaid:$("#formulaid").val(), 
		product_total:$("#product_total").val(), 
		sales_order_id:$("#eid").val() 
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#product_id").select2("val","");
			$("#product_id").select2('focus');
			$("#unitid").select2("val","");
			$("#product_qty").val("");
			$("#product_desc").val("");
			$("#product_rate").val("");
			$("#product_discount").val("");
			$("#discount_per").val("");
			$("#product_amount").val("");
			$("#formulaid").val("");
			$("#product_total").val("");
			$("#edit_id").val('');
			$('#addrow').val('Add');
			Unloading();
			load_so_trn_data();
		}
	});
}
function load_so_trn_data() {
	var eid = $('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: { mode : "load_so_trn_data", sales_order_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#master_sotrn_tbody').html(resp);		 
			get_amount();
			Unloading();
		}		 
	}); 
}
function edit_so_trn_data(so_trn_id)
{ 
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: { mode:"edit_so_trn_data", so_trn_id:so_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#product_id").select2("val",resp.product_id);
			$("#unitid").select2("val",resp.unitid);
			$("#product_qty").val(resp.product_qty);
			$("#product_rate").val(resp.product_rate);
			$("#product_discount").val(resp.product_discount);
			$("#discount_per").val(resp.discount_per);
			$("#product_amount").val(resp.product_amount);
			$("#formulaid").val(resp.formulaid);
			$("#product_total").val(resp.product_total);
			$("#product_desc").val(resp.product_desc);
			$("#edit_id").val(so_trn_id);
			$('#addrow').val('Update');
			Unloading();
		}
	});
}
function delete_so_trn_data(so_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/sales_order/',
			data: { mode:"delete_so_trn_data", so_trn_id:so_trn_id },
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
				load_so_trn_data();						
			}
		});	
	}
}
function load_cust_quot(cust_id)
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: { mode:"load_cust_quot", cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var resp=jQuery.parseJSON(response);
			$('#quotation_id').html(resp.html_resp);
			$('#quotation_id').select2("val","").select2('focus');
		}
	});	
	
}
function load_so_no()
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: { mode:"load_so_no" },
		success: function(response)
		{
			$('#sales_order_no').val(response);
		}
	});	
	
}
function get_discount(type)
{
	var product_qty = parseFloat($("#product_qty").val());
	var product_rate = parseFloat($("#product_rate").val());
	var disc=0;var disc1=0;
	if(product_qty && product_rate && product_qty!='0' && product_rate!='0')
	{	
		if($('#product_discount').val() || $('#discount_per').val()){
			if(type=="amt") {
				disc=100*parseFloat($('#product_discount').val())/(product_qty*product_rate);
				var disc1=disc.toFixed(2);			
				$('#discount_per').val(disc1);
			}
			else if(type=="per") {
				disc=((product_qty*product_rate)*parseFloat($('#discount_per').val()))/100;	
				var	disc1=disc.toFixed(2);
				$('#product_discount').val(disc1);
			}
		}
	}
	else
	{
		$('#product_discount').val('');
		$('#discount_per').val('');
	}
	get_amount();
}
function get_amount()
{	
	var product_qty = parseFloat($("#product_qty").val());
	var product_rate = parseFloat($("#product_rate").val());
	var product_discount = parseFloat($("#product_discount").val());
	if(product_qty && product_rate && product_qty!='0' && product_rate!='0')
	{
		var product_amount=parseFloat((product_qty)*(product_rate));
		if(product_discount && product_discount!='0')//discount calculation
		{	
			product_amount=product_amount-product_discount; 
		}
		$("#product_amount").val(parseFloat(product_amount).toFixed(2));
		$("#product_total").val(parseFloat(product_amount).toFixed(2));
		if($("#formulaid").val()!="")//tax calculation
		{
			var formulaid=$("#formulaid").val();
			$.ajax({
				type: "POST",
				url: root_domain+'app/quotation/',
				data: { mode : "getproduct_amount", product_amount:product_amount ,formulaid:formulaid },
				success: function(response)
				{
					var obj=jQuery.parseJSON(response);
					$('#product_total').val(obj.product_total);
				}
			});
		}
	}
	else {
		$("#product_amount").val(0);
	}
	get_gtotal();
}
function get_gtotal()
{	
	var t=0;
	var input_amount=(document.getElementsByName('amount[]'));
	var cnt=input_amount.length;
	var total=0;
	for(var i=0;i<cnt;i++)
	{	
		var t=input_amount[i].value;
		if(t>0)
		total=parseFloat(total)+parseFloat(t);
	}
	//$("#total").val(parseFloat(total).toFixed(2));
	
	$("#g_total").val(parseFloat(total).toFixed(2));
}

function copy_quot_trn_data(quotation_id)
{
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: { mode:"copy_quot_trn_data", quotation_id:quotation_id },
		success: function(response)
		{
			load_so_trn_data();
			Unloading();
		}
	});	
	
}
function approv_sales_order(sales_order_id,so_approve_status)
{
	var conf = confirm("Are Sure Want to change S.O. Authorize Status ?");
	if(conf){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/sales_order/',
			data: { mode:"approv_sales_order", sales_order_id:sales_order_id, so_approve_status:so_approve_status },
			success: function(response)
			{
				if(response.trim() == "1") {
					toastr.success("S.O. STATUS SUCCESSFULLY", "SUCCESS");
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				load_sales_order_datatable();
				Unloading();
			}
		});	
	}
	
}
function open_approv_sales_order(sales_order_id,sales_order_no){
	$('#preview_approval_hist_modal').modal('show');
	$('#apprv_ref_no').html(sales_order_no);
	$('#ref_sales_order_id').val(sales_order_id);
	load_so_hist_datatable();
}
function add_apprv_hist(){
	
	var form_data = {
		mode:"add_apprv_hist",
		assign_user_ids:$('#assign_user_ids').val(),
		approve_status:$('#approve_status').val(),
		approve_remark:$('#approve_remark').val(),
		sales_order_id:$('#ref_sales_order_id').val()
	};
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/sales_order/',
		data: form_data,
		success: function(response)
		{
			$('#assign_user_ids').select2("val","");
			$('#approve_status').select2("val","0");
			$('#approve_remark').val("");
			load_so_hist_datatable();
			load_sales_order_datatable();
			Unloading();
		}
	});	
}

function load_so_hist_datatable(){
	var sales_order_id = $('#ref_sales_order_id').val();
	
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
		"sAjaxSource": root_domain+'app/sales_order/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_so_hist_datatable" }, { "name": "sales_order_id", "value": sales_order_id }  );
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