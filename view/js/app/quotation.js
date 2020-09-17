//var datatable;
$(document).ready(function() {
	load_quotation_datatable();
	show_data();
	show_dfd_attach_data();
	// validate vendor add form on keyup and submit
	$("#quotation_add").validate({
		rules: {
			quotation_date: {
				required: true			
			},
			cust_id: {
				required: true			
			},
			c_con_id: {
				required: true			
			},
			inquiry_id: {
				required: true			
			},
			quot_subject: {
				required: true			
			}
		},
		messages: {
			quotation_date: {
				required: "Enter Quotation Date"
			},
			cust_id: {
				required: "Choose Customer"
			},
			c_con_id: {
				required: "Choose Person"
			},
			inquiry_id: {
				required: "Choose Inquiry"
			},
			quot_subject: {
				required: "Enter Subject"
			}
		}
	}); 
}); 

$("#quotation_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#quotation_add").valid()) {
		return false;
	} 
							 
	for (instance in CKEDITOR.instances) {
    	CKEDITOR.instances[instance].updateElement();
	}
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	$('#save').prop('disabled', true);
	var form_data=new FormData(this);	
	
	//Hide Form Submit Alert
	setFormSubmitting();
	
	$.ajax({
		cache:false,
		url: root_domain+'app/quotation/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("QUOTATION ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'quotation_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg == 'update') {	
				toastr.success("QUOTATION UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'quotation_list';	
			}
			Unloading();
			$('#quotation_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});

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
function load_quotation_datatable(){
	//var status=$('input[name=approved_status]:Checked').val();
	var date=$('#rep_date').val();
	
	$("#quotation-datatable").dataTable({
	    "bStateSave": true,
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
		"aLengthMenu": [[ 10, 20, 50, 100, -1], [ 10, 20, 50, 100, "All"]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/quotation/',
		"fnServerParams": function ( aoData ) {
			aoData.push( {"name": "mode", "value": "fetch"}, {"name": "date", "value": date} );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}

function delete_quotation(quotation_id,quotation_no,prev_quotation_id) 
{
	var r= confirm(" Are you sure want to delete '"+quotation_no+"' ?");
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode : "delete",  quotation_id : quotation_id, prev_quotation_id:prev_quotation_id },
			success: function(response)
			{
				console.log(response);
				if(response.trim() == "1") {
					toastr.success("QUOTATION DELETE SUCCESSFULLY", "SUCCESS");
					load_quotation_datatable();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	} 
}
function load_cust_inq(cust_id) 
{
	if(cust_id) {
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode : "load_cust_inq",  cust_id : cust_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#inquiry_id').html(resp.resp_html);
				$('#inquiry_id').select2("val","");
			}
		});
	}
}

function load_typeswise_terms(quot_type,quotation_id) 
{
	if(quot_type || quot_type==0) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode : "load_typeswise_terms", quot_type:quot_type, quotation_id:quotation_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#quot_terms_cond_div').html(resp.resp_html);
				Unloading();
			}
		});
	}
}

function add_field()
{
	if(!$("#product_id").val()){		
		toastr.warning("Choose Product", "ERROR");
		$("#product_id").select2('focus');
		return false;
	}
	else if(!$("#product_qty").val()){
		toastr.warning("Enter Quantity", "ERROR");
		$("#product_qty").focus();
		return false;
	}
	else if(!$("#product_rate").val()){
		toastr.warning("Enter Rate", "ERROR");
		$("#product_rate").focus();
		return false;
	}
	
	var form_data = { 
		mode : "add_field",
		edit_id:$("#edit_id").val(),
		product_id:$("#product_id").val(), 
		product_desc:$("#product_desc").val(), 
		product_spec:$("#product_spec").val(), 
		level_id:$("#level_id").val(), 
		product_qty:$("#product_qty").val(), 
		unitid:$("#unitid").val(), 
		product_rate:$("#product_rate").val(), 
		product_discount:$("#product_discount").val(), 
		discount_per:$("#discount_per").val(), 
		product_amount:$("#product_amount").val(), 
		formulaid:$("#formulaid").val(), 
		product_total:$("#product_total").val(), 
		act_amt_flag:$('input[name="act_amt_flag"]:checked').val(), 
		quotation_id:$("#eid").val()
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#product_id").select2("val","");
			$("#level_id").select2("val","1");
			$("#unitid").select2("val","");
			$("#product_desc").val("");
			$("#product_spec").val("");
			$("#product_qty").val("");
			$("#product_rate").val("");
			$("#product_discount").val("");
			$("#discount_per").val("");
			$("#product_amount").val("");
			$("#formulaid").val("");
			$("#product_total").val("");
			$("#edit_id").val("");
			$('#quot_trn_btn').html('Add');
			$('#bud_ttl_span').html("");
			$('#act_amt_flag').prop("checked",false);
			Unloading();
			show_data();
		}
	});
}

function show_data() {
	var eid = $('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode : "show_data", quotation_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#quot_trn_div').html(resp);
			Unloading();
			get_amount();
		}		 
	}); 
}
function edit_trn_data(quot_trn_id)
{ 
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode:"edit_trn_data", quot_trn_id:quot_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#product_id").select2("val",resp.product_id);
			$("#level_id").select2("val",resp.level_id);
			$("#unitid").select2("val",resp.unitid);
			$("#product_qty").val(resp.product_qty);
			$("#product_rate").val(resp.product_rate);
			$("#product_discount").val(resp.product_discount);
			$("#discount_per").val(resp.discount_per);
			$("#product_amount").val(resp.product_amount);
			$("#formulaid").val(resp.formulaid);
			$("#product_total").val(resp.product_total);
			$("#product_desc").val(resp.product_desc);
			$("#product_spec").val(resp.product_spec);
			$("#edit_id").val(quot_trn_id);
			$('#quot_trn_btn').html('Update');
			$('#bud_ttl_span').html(resp.budget_trn_g_total);
			if(resp.act_amt_flag=='1'){
				$('#act_amt_flag').prop("checked",true);
			}
			else{
				$('#act_amt_flag').prop("checked",false);
			}
			Unloading();
		}
	});
}
function delete_trn_data(quot_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"delete_trn_data", quot_trn_id:quot_trn_id },
			success: function(response)
			{
				//console.log(response);
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

function load_product_dtls(product_id)
{
	if(product_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"load_product_dtls", product_id:product_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				$('#product_desc').val(resp.product_desc);
				Unloading();						
			}
		});	
	}
}
function load_inq_pro(inquiry_id)
{
	if(inquiry_id) {
		var c_con_id = $('#c_con_id').val();
		
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"load_inq_pro", inquiry_id:inquiry_id, c_con_id:c_con_id, def_quot_subject:$("#inquiry_id option:selected").text() },
			success: function(response)
			{
				//console.log(response);
				//var data=jQuery.parseJSON(response);
				$('#quot_subject').val($("#inquiry_id option:selected").text());
				show_data();	
				Unloading();						
			}
		});	
	}
}
function load_annex_content(an_id)
{
	if(an_id) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"load_annex_content", an_id:an_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				//Put Ckeditor DATA
				CKEDITOR.instances['quot_annex_content'].setData(resp.an_detail);
				//Scroll To Bottom of the page
				$("html, body").animate({ scrollTop: $(document).height() }, 1000);
				Unloading();						
			}
		});	
	}
}
function view_cust_address(){
	var cust_id = $('#cust_id').val();
	if(!cust_id){
		toastr.warning("Customer Not Found!!!", "WARNING");
		$('html, body').animate({
		scrollTop: ($("#quotation_no").offset().top) - (160)
		}, 1000);
		$('#cust_id').select2('focus');
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode:"view_cust_address", cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var resp=jQuery.parseJSON(response);	
			$('#preview_cust_address_modal').modal('show');
			$('#preview_cust_address_div').html(resp.resp_html);
		}
	});
}
function copy_address(add_cont){
	$('#preview_cust_address_modal').modal('hide');
	$('#quot_address').val(add_cont);
}

function copy_prev_quot_trn(prev_quotation_id){
	if(prev_quotation_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"copy_prev_quot_trn", prev_quotation_id:prev_quotation_id },
			success: function(response)
			{
				//console.log(response);
				show_data();
			}
		});
	}
}
function load_item_det(req_product_id){
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode:"load_product_dtls", product_id:req_product_id },
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
function get_budget_amount(){
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

function get_budget_margin(type){
	var budget_margin_per = parseFloat($('#budget_margin_per').val());
	var budget_margin_amt = parseFloat($('#budget_margin_amt').val());
	var budget_trn_ttl = parseFloat($('#budget_trn_ttl').val());
	
	var disc=0;
	if(type=="amt") {
		disc=100*(budget_margin_amt)/(budget_trn_ttl);
		$('#budget_margin_per').val((disc).toFixed(2));
	}
	else if(type=="per") {
		disc=((budget_trn_ttl)*(budget_margin_per))/100;	
		$('#budget_margin_amt').val((disc).toFixed(2));
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
	$("#budget_trn_ttl").val(parseFloat(total).toFixed(2));
	
	var budget_margin_amt = parseFloat($('#budget_margin_amt').val());
	if(budget_margin_amt>0){
		total=parseFloat(total)+parseFloat(budget_margin_amt);
	}
	$("#budget_trn_g_total").val(parseFloat(total).toFixed(2));
}
function add_budget_trn_data(){
	if(!$("#req_product_id").val()){		
		toastr.warning("Choose Product", "ERROR");
		$("#req_product_id").select2('focus');
		return false;
	}
	else if(!$("#req_product_qty").val()){
		toastr.warning("Enter Quantity", "ERROR");
		$("#req_product_qty").focus();
		return false;
	}
	else if(!$("#req_product_rate").val()){
		toastr.warning("Enter Rate", "ERROR");
		$("#req_product_rate").focus();
		return false;
	}
	
	var form_data = { 
		mode : "add_budget_trn_data",
		budget_trn_edit_id: $("#budget_trn_edit_id").val(),
		req_product_id: $("#req_product_id").val(), 
		req_product_desc: $("#req_product_desc").val(), 
		req_product_qty: $("#req_product_qty").val(), 
		req_product_rate: $("#req_product_rate").val(), 
		req_unitid: $("#req_unitid").val(), 
		req_product_amount: $("#req_product_amount").val(), 
		quot_trn_id: $("#quot_trn_id").val()
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: form_data,
		success: function(response)
		{
			if(response.trim()=='-1'){
				toastr.warning("Item Already Exist!!!", "WARNING");
			}
			//console.log(response);
			$("#req_product_id").select2("val","");
			$("#req_product_desc").val("");
			$("#req_product_qty").val("");
			$("#req_product_rate").val("");
			$("#req_unitid").select2("val","");
			$("#req_product_amount").val("");
			$("#budget_trn_edit_id").val("");
			$('#addbudgetrow').val('Add');
			Unloading();
			show_budget_trn_data();
		}
	});
}

function show_budget_trn_data() {
	var quot_trn_id = $('#quot_trn_id').val();
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode : "show_budget_trn_data", quot_trn_id:quot_trn_id },
		success: function(resp){
			//console.log(resp);
			$('#quot_budget_trn_div').html(resp);
			Unloading();
			get_budget_amount();
		}		 
	}); 
}
function edit_budget_trn_data(quot_budget_trn_id)
{ 
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode:"edit_budget_trn_data", quot_budget_trn_id:quot_budget_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#req_product_qty").focus();
			$("#req_product_id").select2("val",resp.req_product_id);
			$("#req_product_desc").val(resp.req_product_desc);
			$("#req_product_qty").val(resp.req_product_qty);
			$("#req_product_rate").val(resp.req_product_rate);
			$("#req_product_amount").val(resp.req_product_amount);
			$("#req_unitid").select2("val",resp.req_unitid);
			$("#budget_trn_edit_id").val(quot_budget_trn_id);
			$('#addbudgetrow').val('Update');
			Unloading();
		}
	});
}
function delete_budget_trn_data(quot_budget_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"delete_budget_trn_data", quot_budget_trn_id:quot_budget_trn_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				var response=resp.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_budget_trn_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
}
$("#quotation_budget_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#quotation_budget_add").valid()) {
		return false;
	} 
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	$('#save').prop('disabled', true);
	var form_data=new FormData(this);	
	
	//Hide Form Submit Alert
	setFormSubmitting();
	
	$.ajax({
		cache:false,
		url: root_domain+'app/quotation/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("BUDGET UPDATED SUCCESSFULLY", "SUCCESS");
				var referrer =  document.referrer;
				window.location=referrer;
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			Unloading();
			$('#save').prop('disabled', false);
			$('#quotation_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function copy_master_bom_data(){
	var product_id = $('#product_id').val();
	var product_qty = $('#product_qty').val();
	var quot_trn_id = $('#quot_trn_id').val();
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode:"copy_master_bom_data", product_id:product_id, product_qty:product_qty, quot_trn_id:quot_trn_id },
		success: function(response)
		{
			//console.log(response);
			Unloading();
			show_budget_trn_data();
		}
	});	
}

function approv_quot(quotation_id,approve_status)
{
	var conf = confirm("Are Sure Want to change Quotation Authorize Status ?");
	if(conf){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"approv_quot", quotation_id:quotation_id, approve_status:approve_status },
			success: function(response)
			{
				console.log(response);
				if(response.trim() == "1") {
					toastr.success("QUOTATION STATUS CHANGED SUCCESSFULLY", "SUCCESS");
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				load_quotation_datatable();
				Unloading();
			}
		});	
	}
	
}

function open_approv_quot(quotation_id,quotation_no){
	$('#preview_approval_hist_modal').modal('show');
	$('#apprv_ref_no').html(quotation_no);
	$('#ref_quotation_id').val(quotation_id);
	load_quot_hist_datatable();
}

function add_apprv_hist(){
	
	var form_data = {
		mode:"add_apprv_hist",
		assign_user_ids:$('#assign_user_ids').val(),
		approve_status:$('#approve_status').val(),
		approve_remark:$('#approve_remark').val(),
		quotation_id:$('#ref_quotation_id').val()
	};
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: form_data,
		success: function(response)
		{
			$('#assign_user_ids').select2("val","");
			$('#approve_status').select2("val","0");
			$('#approve_remark').val("");
			load_quot_hist_datatable();
			load_quotation_datatable();
			Unloading();
		}
	});	
}

function load_quot_hist_datatable(){
	var quotation_id = $('#ref_quotation_id').val();
	
	$("#sales-order-history-datatable").dataTable({
	    "bStateSave": true,
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
		"sAjaxSource": root_domain+'app/quotation/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_quot_hist_datatable" }, { "name": "quotation_id", "value": quotation_id }  );
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

function open_quot_email(quotation_id, cust_id){
	$('#send_email_modal').modal("show");
	$('#email_ref_id').val(quotation_id);
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode : "open_quot_email", quotation_id:quotation_id, cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response);
			$('#to_email_id').val(obj.to_email_id);
			$('#ccemail_id').val("");
			$('#bccemail_id').val("");
			CKEDITOR.instances['email_content'].setData(obj.email_content);
			$('#email_subject').val(obj.email_subject);
			Unloading();
		}
	});
}

$("#send_email_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#send_email_add").valid()) {
		return false;
	} 
	
	for (instance in CKEDITOR.instances) {
		CKEDITOR.instances[instance].updateElement();
	}
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	$('#send_mail_btn').prop('disabled', true);
	var form_data=new FormData(this);	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/quotation/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("MAIL SENT SUCCESSFULLY", "SUCCESS");
				$('#send_email_modal').modal('hide');
				load_quotation_datatable();
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			Unloading();
			$('#send_mail_btn').prop('disabled', false);
			$('#send_email_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function add_dfd_attch_field()
{
	if(!$("#dfd_attch_file").val()){
		toastr.warning("Choose File", "ERROR");
		$("#dfd_attch_file").focus();
		return false;
	}
	
	Loading();
	var form_data = new FormData();
	form_data.append('mode', "add_dfd_attch_field");
	form_data.append('quotation_id', $("#eid").val());
	form_data.append("dfd_attch_file", document.getElementById('dfd_attch_file').files[0]);
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: form_data,
		contentType: false,
		processData: false,
		success: function(response)
		{
			//console.log(response);
			$("#dfd_attch_file").val("").focus();
			$('#dfd_attch_btn').val('Add');
			Unloading();
			show_dfd_attach_data();
		}
	});
}

function show_dfd_attach_data() {
	var eid = $('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/quotation/',
		data: { mode : "show_dfd_attach_data", quotation_id:eid },
		success: function(resp){
			//console.log(resp);
			$('#dfd_attch_trn_div').html(resp);
			Unloading();
		}		 
	}); 
}
function delete_dfd_attach_data(dfd_attach_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/quotation/',
			data: { mode:"delete_dfd_attach_data", dfd_attach_id:dfd_attach_id },
			success: function(response)
			{
				//console.log(response);
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_dfd_attach_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
}
function copyToClipboard(element) {
	console.log(element);
  var $temp = $("<input>");
  $("body").append($temp);
  //$temp.val($(element).text()).select();
	$temp.val(element).select();
  document.execCommand("copy");
  $temp.remove();
}