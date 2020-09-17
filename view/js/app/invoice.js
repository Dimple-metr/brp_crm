//var datatable;
$(document).ready(function() {
	
	load_invoice_datatable();
	show_data();
		
	// validate vendor add form on keyup and submit
	$("#invoice_add").validate({
		rules: {
			cust_id: {
				required: true			
			},
			invoice_no: {
				required: true			
			},
			invoice_date:{
				required : true	
			}
		},
		messages: {
			cust_id: {
				required: "Select Customer"
			},
			invoice_no: {
				required: "Enter Invoice no"
			},
			invoice_date:{
				required : "Enter Invoice date"
			}
		}
	}); 
});
$("#invoice_add").on('submit',function(e) {
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#invoice_add").valid()) {
		return false;
	}
	else if (parseFloat($("#total").val())=='0') {
		toastr.warning("Enter Valid Data", "ERROR");
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
		url: root_domain+'app/invoice/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);
			if(arr.msg == '1') {
				toastr.success("INVOICE ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'invoice_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1'){
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg== 'update'){	
				toastr.success("INVOICE UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'invoice_list';
			}
			Unloading();
			$('#invoice_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
}); 
function delete_invoice(id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/invoice/',
			data: { mode : "delete",  eid : id },
			success: function(response)
			{
				console.log(response)
				if(response.trim() == "1") {
					toastr.success("INVOICE DELETED SUCCESSFULLY", "SUCCESS");
					load_invoice_datatable();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();
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
				url: root_domain+'app/invoice/',
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
function get_gtotal(eid)
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
	
	if(r!=0) {
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
function load_productdetail(product_id) {
	if(product_id!=0){
		$('#addproduct').hide();
	}
	else{
		$('#addproduct').show();
	}
	var cust_id = $('#cust_id').val();
	if(cust_id==''){
		toastr.warning("Please Select Vendor First","ERROR");
		$('#cust_id').select2('focus');
		return false;
	}
	var sales_order_id = $("#sales_order_id").val();
	if(sales_order_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/invoice/',
			data: { mode : "loadsales_productdata", product_id:product_id, sales_order_id:sales_order_id },
			success: function(response)
			{
				console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.product_desc);				
				$('#product_qty').val(obj.product_qty);
				$('#product_rate').val(obj.product_rate);	
				$('#unitid').select2("val",obj.unitid);
				$('#product_discount').val(obj.product_discount);
				$('#discount_per').val(obj.discount_per);
				$('#formulaid').val(obj.formulaid);
				get_amount();	
			}
		});
	}
	else{
		$.ajax({
			type: "POST",
			url: root_domain+'app/invoice/',
			data: { mode : "load_productdata", eid :product_id, cust_id : cust_id },
			success: function(response)
			{
				//console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.product_des);						
				$('#product_rate').val(obj.product_mst_rate);				
				$('#unitid').select2("val",obj.product_mst_unitid);
				/*if(obj.com_stateid==obj.ven_stateid){
					$('#formulaid').val(obj.intra_tax);
				}else{
					$('#formulaid').val(obj.inter_tax);
				}*/				
			}
		});
	}
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
	else if(!$("#product_rate").val()) {		
		toastr.warning("Enter Rate", "ERROR");
		$("#product_rate").focus();
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/invoice/',
		data: { mode : "fieldadd",edit_id:$("#edit_id").val(),product_id:$("#product_id").val(),product_des:$("#product_des").val(),product_qty:$("#product_qty").val(),product_rate:$("#product_rate").val(),product_disc:$("#product_disc").val(),unit_id:$("#unitid").val(),formulaid:$("#formulaid").val(),product_discount:$("#product_discount").val(),discount_per:$("#discount_per").val(),product_amount:$("#product_amount").val(),invoice_id:$("#eid").val() },
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
function load_invoice_datatable()
{
	var date=$('#rep_date').val();
	
	$("#invoice-datatable").dataTable({
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
		"sAjaxSource": root_domain+'app/invoice/',
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
		url: root_domain+'app/invoice/',
		data: { mode:"load_tempoutward", eid:eid },
		success: function(data){
			//console.log(data);
			$('#sale_productdata').html(data);				
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
		url: root_domain+'app/invoice/',
		data: { mode : "preedit",  id : id },
		success: function(response)
		{
			console.log(response);
			var resp = jQuery.parseJSON(response);
			//$('#product_id').html(resp.producthtml);
			//$('#product_id').append('<option value="'+resp.product_id+'">'+resp.product_name+'</option>');
			$("#product_id").select2("val",resp.product_id);
			$("#product_des").val(resp.description);
			$("#product_qty").val(resp.product_qty);
			$("#product_rate").val(resp.product_rate);
			$("#product_disc").val(resp.product_disc);
			$("#unitid").select2("val",resp.unit_id);
			$("#formulaid").val(resp.formulaid);
			$("#product_amount").val(resp.product_total);
			$("#product_discount").val(resp.product_discount);
			$("#discount_per").val(resp.discount_per);
			$("#taxable_value").val(resp.product_amount);
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
			url: root_domain+'app/invoice/',
			data: { mode : "delete_data", eid:id },
			success: function(response)
			{
				console.log(response)
				var data=jQuery.parseJSON(response);
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
function load_invoice_no() {
	$.ajax({
		type: "POST",
		url: root_domain+'app/invoice/',
		data: { mode : "load_invoiceno" },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#invoice_no').val(no.invoiceno); 
		}
	});
}
function load_sales_order(cust_id){
	if(cust_id){
		$('#sales_order_div').attr("style","display:block");
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/invoice/',
			data: { mode : "load_sales_order", cust_id : cust_id },
			success: function(response){
				 console.log(response);
				 $('#sales_order_id').html(response);
				 $('#sales_order_id').select2('val','');
				 Unloading();
			}
		});
	}
	else{
		$('#sales_order_div').attr("style","display:none");
	}
}
function load_sales_order_data(sales_order_id){
	if(sales_order_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/invoice/',
			data: { mode:"load_sales_order_data", sales_order_id:sales_order_id },
			success: function(response){
				//console.log(response);
				var resp = 	JSON.parse(response);
				$('#product_id').html(resp.pro_html);
				$('#product_id').select2('val','');
				Unloading();
			}
		});
	}
}

function view_cust_address(){
	var cust_id = $('#cust_id').val();
	if(!cust_id){
		toastr.warning("Customer Not Found!!!", "WARNING");
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
	$('#inv_cust_address').val(add_cont);
}

function view_ship_address(){
	var cust_id = $('#cust_id').val();
	if(!cust_id){
		toastr.warning("Customer Not Found!!!", "WARNING");
		$('#cust_id').select2('focus');
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/invoice/',
		data: { mode:"view_ship_address", cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var resp=jQuery.parseJSON(response);	
			$('#preview_cust_address_modal').modal('show');
			$('#preview_cust_address_div').html(resp.resp_html);
		}
	});
}
function copy_ship_address(add_cont){
	$('#preview_cust_address_modal').modal('hide');
	$('#inv_ship_address').val(add_cont);
}