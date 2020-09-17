//var datatable;
$(document).ready(function() {
	/*$('#product_amount').hover(function(){
		var pro_amt = $('#product_amount').val();
		$('#product_amount').attr("title",pro_amt);
		});
	*/
	load_po_datatable();
	show_data();
		
	// validate vendor add form on keyup and submit
	$("#purchaseorder_add").validate({
		rules: {
			cust_id: {
				required: true			
			},
			purchaseorder_no: {
				required: true			
			},
			purchaseorder_date:{
				required : true	
			}
		},
		messages: {
			cust_id: {
				required: "Select Vendor"
			},
			purchaseorder_no: {
				required: "Enter P.O no"
			},
			purchaseorder_date:{
				required : "Enter P.O date"
			}
		}
	}); 
});
$("#purchaseorder_add").on('submit',function(e) {
	
	for (instance in CKEDITOR.instances) {
    	CKEDITOR.instances[instance].updateElement();
	}
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#purchaseorder_add").valid()) {
		return false;
	}
	else if (parseFloat($("#total").val())=='0') {
		toastr.warning("Enter Valid Data", "ERROR");
		return false;
	}
	form.submitted = true;
	Loading(true);
	$(this).attr("disabled","disabled");
	
	var form_data=new FormData(this);
	//console.log(form_data);
	$.ajax({
		cache:false,
		url: root_domain+'app/purchase_order/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);
			if(arr.msg == '1') {
				Unloading();
				toastr.success("PURCHASE ORDER ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'po_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(arr.msg == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			else if(arr.msg== 'update')
			{	
				toastr.success("PO UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'po_list';
				
			}
			$('#purchaseorder_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
}); 
function delete_po(id,main_id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase_order/',
			data: { mode : "delete",  eid : id, main_id:main_id },
			success: function(response)
			{
				console.log(response)
				if(response.trim() == "1") {
					toastr.success("PO DELETE SUCCESSFULLY", "SUCCESS");
					load_po_datatable();
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
			}
		});	
	}
	
}
function get_discount(type)
{
	var qty=parseFloat($('#product_qty').val());
	var rate=parseFloat($('#product_rate').val());
	var disc=0;
	if(qty!="" && rate !="")
	{	
		if(type=="amt")
		{
			disc=100*parseFloat($('#product_discount').val())/(qty*rate);	
			$('#discount_per').val(disc);
		}
		else if(type=="per")
		{
			disc=((qty*rate)*parseFloat($('#discount_per').val()))/100;	
			$('#product_discount').val(disc);
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
	var id=parseInt($('#fieldcnt').val())+1;
	if($("#product_qty").val()!="" && $("#product_rate").val()!="")
	{
		var q=$("#product_qty").val();
		var rate=$("#product_rate").val();
		var a=q*rate;
		if($("#product_discount").val()!="" )//discount calculation
		{	
			var discount=parseFloat($("#product_discount").val());
			a=a-discount; 
		}
		$("#product_amount").val(parseFloat(a));
		$("#taxable_value").val(parseFloat(a));
		if($("#formulaid").val()!="")//tax calculation
		{
			var total=a;
			var formulaid=$("#formulaid").val();
			$.ajax({
				type: "POST",
				url: root_domain+'app/purchase_order/',
				data: { mode : "getproduct_amount",  product_amount : total ,formulaid:formulaid},
				success: function(response)
				{
					var obj=jQuery.parseJSON(response);
					$('#product_amount').val(obj.product_total);
				}
			});
		}
	}
	else
	{
		$("#product_amount").val(0);
	}
	get_gtotal();
}
function get_gtotal()
{	
	var id=parseInt($('#fieldcnt').val());
	var t=0;
	var r=parseFloat($('#round_off').val());
	
	var input_amount=(document.getElementsByName('amount[]'));
	var cnt=input_amount.length;
	var total=0;var c_total=0;
	
	for(var i=0;i<cnt;i++) {	
		var t=input_amount[i].value;
		if(t>0)
		total=parseFloat(total)+parseFloat(t);
	}
	$("#total").val(parseFloat(total).toFixed(2));
	
	if(r) {
		total=parseFloat(total)+r;
	}
	
	g_total=parseFloat(total);
	$("#g_total").val(g_total.toFixed(2));
}
function load_pro(){
	var product_id = $('#product_id').val();
	if(product_id){
		load_productdetail(product_id);
	}
}
function load_productdetail(val) {
	if(val!=0){
		$('#addproduct').hide();
	}
	else{
		$('#addproduct').show();
	}
	var prf_entry_id = $('#prf_entry_id').val();
	var cust_id = $('#cust_id').val();
	if(cust_id==''){
		toastr.warning("Please Select Vendor First","ERROR");
		$('#cust_id').select2('focus');
		return false;
	}
	
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "load_productdata", eid :val, cust_id : cust_id, prf_entry_id:prf_entry_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response);
			$('#product_des').val(obj.product_des);						
			$('#product_rate').val(obj.product_purchase_mst_rate);				
			$('#unitid').select2("val",obj.product_mst_unitid);
			/*if(obj.com_stateid==obj.ven_stateid){
				$('#formulaid').val(obj.intra_tax);
			}else{
				$('#formulaid').val(obj.inter_tax);
			}*/			
		}
	});
}
function add_field()
{
	if(!$("#product_id").val()) {		
		toastr.warning("Select Product", "ERROR");
		$("#product_id").select2('focus');
		return false;
	}
	else if(!$("#product_qty").val() || parseFloat($("#product_qty").val())=='0') {		
		toastr.warning("Enter Qty", "ERROR");
		$("#product_qty").focus();
		return false;
	} 
	else if($("#unitid").val()=="") {		
		toastr.warning("Select Unit", "ERROR");
		$("#unitid").select2('focus');
		return false;
	}
	else if($("#product_rate").val()=="") {		
		toastr.warning("Enter Rate", "ERROR");
		$("#product_rate").focus();
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "fieldadd",edit_id:$("#edit_id").val(),product_id:$("#product_id").val(),product_des:$("#product_des").val(),product_qty:$("#product_qty").val(),product_rate:$("#product_rate").val(),product_disc:$("#product_disc").val(),unit_id:$("#unitid").val(),formulaid:$("#formulaid").val(),product_discount:$("#product_discount").val(),discount_per:$("#discount_per").val(),product_amount:$("#product_amount").val(),purchaseorder_id:$("#eid").val() },
		success: function(response)
		{
			//console.log(response);
			//$("#product_id option[value='"+$("#product_id").val()+"']").remove();
			$("#product_id").select2("val","");
			$("#product_id").select2('focus');
			$("#product_des").val("");
			$("#formulaid").val("");
			$("#discount_per").val("");
			$("#product_discount").val("");
			$("#product_qty").val("");
			$("#unit_id").select2('val',"");
			$("#product_rate").val('');
			$("#product_disc").val('');
			$("#taxable_value").val('');
			$("#product_amount").val('');
			$("#edit_id").val('');
			$('#addproduct').show();
			$('#addrow').val('Add');
			Unloading();
			show_data();
		}
	});
}
function load_po_datatable()
{
	var delivery_status=$('input[name=delivery_status]:Checked').val();
	var date=$('#rep_date').val();
	
	$("#purchase-order-table").dataTable({
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
		"sAjaxSource": root_domain+'app/purchase_order/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "fetch" },{ "name": "delivery_status", "value": delivery_status },{ "name": "date", "value": date });
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
		url: root_domain+'app/purchase_order/',
		data: { mode:"load_tempoutward", eid:eid },
		success: function(data){
			//console.log(data);
			$('#sale_productdata').html(data);				
			get_amount();
			Unloading();
		}		
	});
}
function show_inspect_data()
{
	var eid = $("#eid").val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode:"show_inspect_data", eid:eid },
		success: function(resp){
			//console.log(resp);
			$('#show_inspect_data_div').html(resp);	
			get_amount();
			Unloading();
		}		
	});
}

function edit_data(id)
{
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "preedit",  id : id },
		success: function(response)
		{
			console.log(response)
			var data = jQuery.parseJSON(response);
			$('#product_id').html(data.pro_html);
			//$('#product_id').append('<option value="'+data.product_id+'">'+data.product_name+'</option>');
			$("#product_id").select2("val",data.product_id);
			$("#product_des").val(data.description);
			$("#product_qty").val(data.product_qty);
			$("#product_rate").val(data.product_rate);
			$("#product_disc").val(data.product_disc);
			$("#unitid").select2("val",data.unit_id);
			$("#formulaid").val(data.formulaid);
			$("#product_amount").val(data.product_total);
			$("#product_discount").val(data.product_discount);
			$("#discount_per").val(data.discount_per);
			$("#taxable_value").val(data.product_amount);
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
			url: root_domain+'app/purchase_order/',
			data: { mode : "delete_data", eid:id },
			success: function(response)
			{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					Unloading();
					show_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
			}
		});	
	}
	
}
function load_pono() {
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "load_invoiceno" },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#purchaseorder_no').val(no.invoiceno); 
		}
	});
}

function load_typeswise_terms(po_type,purchaseorder_id) 
{
	if(po_type || po_type==0) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase_order/',
			data: { mode : "load_typeswise_terms", po_type:po_type, purchaseorder_id:purchaseorder_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#po_terms_cond_div').html(resp.resp_html);
				Unloading();
			}
		});
	}
}

function view_cust_address(){
	var cust_id = $('#cust_id').val();
	if(!cust_id){
		toastr.warning("Vendor Not Found!!!", "WARNING");
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
	$('#po_ven_address').val(add_cont);
}
function change_inspect_sts(purchaseordertrn_id,inspect_status){
	var purchaseorder_id= $('#eid').val();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode:"change_inspect_sts", purchaseordertrn_id:purchaseordertrn_id, inspect_status:inspect_status, purchaseorder_id:purchaseorder_id },
		success: function(response)
		{
			
			show_inspect_data();
		}
	});
}
function open_approv_po(purchaseordertrn_id,product_name){
	$('#preview_approval_hist_modal').modal('show');
	$('#ref_purchaseordertrn_id').val(purchaseordertrn_id);
	$('#apprv_ref_no').html(product_name);
	load_po_per_hist_datatable();
}

function add_apprv_hist(){
	
	var form_data = {
		mode:"add_apprv_hist",
		approve_status:$('#approve_status').val(),
		approve_remark:$('#approve_remark').val(),
		purchaseordertrn_id:$('#ref_purchaseordertrn_id').val(),
		purchaseorder_id:$('#eid').val()
	};
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: form_data,
		success: function(response)
		{
			$('#approve_status').select2("val","0");
			$('#approve_remark').val("");
			load_po_per_hist_datatable();
			show_inspect_data();
			Unloading();
		}
	});	
}
function load_po_per_hist_datatable(){
	var purchaseordertrn_id = $('#ref_purchaseordertrn_id').val();
	
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
		"sAjaxSource": root_domain+'app/purchase_order/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_quot_hist_datatable" }, { "name": "purchaseordertrn_id", "value": purchaseordertrn_id }  );
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
function open_ven_rate_hist(product_id,product_name){
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
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

function open_approv_purchase_order_status(purchaseorder_id,purchaseorder_no){
	$('#preview_approval_hist_modal').modal('show');
	$('#apprv_ref_no').html(purchaseorder_no);
	$('#ref_sales_order_id').val(purchaseorder_id);
	load_po_hist_datatable();
}

function add_po_apprv_hist(){
	
	var form_data = {
		mode:"add_po_apprv_hist",
		assign_user_ids:$('#assign_user_ids').val(),
		approve_status:$('#approve_status').val(),
		approve_remark:$('#approve_remark').val(),
		purchaseorder_id:$('#ref_sales_order_id').val()
	};
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: form_data,
		success: function(response)
		{
			$('#assign_user_ids').select2("val","");
			$('#approve_status').select2("val","0");
			$('#approve_remark').val("");
			load_po_hist_datatable();
			load_po_datatable();
			Unloading();
		}
	});	
}
function load_po_hist_datatable(){
	var purchaseorder_id = $('#ref_sales_order_id').val();
	
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
		"sAjaxSource": root_domain+'app/purchase_order/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_po_hist_datatable" }, { "name": "purchaseorder_id", "value": purchaseorder_id }  );
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
function open_po_email(purchaseorder_id, cust_id){
	$('#send_email_modal').modal("show");
	$('#email_ref_id').val(purchaseorder_id);
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "open_po_email", purchaseorder_id:purchaseorder_id, cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response);
			$('#to_email_id').val(obj.to_email_id);
			$('#ccemail_id').val("");
			$('#bccemail_id').val("");
			CKEDITOR.instances['email_content'].setData(obj.email_content);
			$('#email_subject').val("");
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
		url: root_domain+'app/purchase_order/',
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
				load_po_datatable();
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

function load_po_req_datatable()
{
	
	var delivery_status=$('input[name=delivery_status]:Checked').val();
	var date=$('#rep_date').val();
	
	datatable = $("#purchase-order-request-table").dataTable({
		"bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bProcessing": true,
		"bDestroy": true,
		"bServerSide" : true,
		"aoColumns": [
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": false }
		], 
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
			"sEmptyTable": "NO DATA ADDED YET !",
		},
		"aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/purchase_order/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "load_po_req_datatable" },{ "name": "delivery_status", "value": delivery_status },{ "name": "date", "value": date });
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}
function add_req_po_qty()
{
	var req_trn_ids = $("#purchase-order-request-table input:checkbox:checked").map(function(){
        return $(this).val();
    }).toArray();
	
	if(req_trn_ids!="")
	{
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase_order/',
			data: { mode : "add_req_po_qty",  req_trn_ids:req_trn_ids},
			success: function(response)
			{
				Unloading();				
				window.location=root_domain+'po';			
			}
		});
	}
	else {
		toastr.warning("Choose at least one Product", "WARNING");
	}
}
function cng_sts_po_req(bom_trn_id){
	var s = confirm("Are you sure want to Confirm Purchase order sent ?");
	
	if(s) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase_order/',
			data: { mode : "cng_sts_po_req", bom_trn_id:bom_trn_id },
			success: function(response)
			{
				if(response.trim() == "1") {
					toastr.success("STATUS CHANGED SUCCESSFULLY", "SUCCESS");
					load_po_req_datatable();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
				Unloading();							
			}
		});
	}
}
function load_prf_det(prf_entry_id){
	alert("HR");
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase_order/',
		data: { mode : "load_prf_det", prf_entry_id:prf_entry_id },
		success: function(response)
		{
			var resp=JSON.parse(response);
			$('#product_id').html(resp.prf_trnhtml);
			Unloading();							
		}
	});
}
function change_pur_done_sts(purchaseorder_id,purchase_status){
	var conf = confirm("Are sure want to change P.O. Status ?");
	if(conf){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase_order/',
			data: { mode : "change_pur_done_sts", purchaseorder_id:purchaseorder_id, purchase_status:purchase_status },
			success: function(response)
			{
				if(response.trim() == "1") {
					toastr.success("PO STATUS CHANGED SUCCESSFULLY", "SUCCESS");
					load_po_datatable();
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();							
			}
		});
	}
}