//var datatable;
$(document).ready(function() {
	
	load_purchase_datatable();
	show_data();
		
	// validate vendor add form on keyup and submit
	$("#purchase_add").validate({
		rules: {
			cust_id: {
				required: true			
			},
			purchase_no: {
				required: true			
			},
			purchase_date:{
				required : true	
			}
		},
		messages: {
			cust_id: {
				required: "Select Vendor"
			},
			purchase_no: {
				required: "Enter Purchase no"
			},
			purchase_date:{
				required : "Enter Purchase date"
			}
		}
	}); 
});
$("#purchase_add").on('submit',function(e) {
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#purchase_add").valid()) {
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
		url: root_domain+'app/purchase/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);
			if(arr.msg == '1') {
				toastr.success("PURCHASE ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'purchase_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1'){
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg== 'update'){	
				toastr.success("PURCHASE UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'purchase_list';
			}
			Unloading();
			$('#purchase_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
}); 
function delete_purchase(id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase/',
			data: { mode : "delete",  eid : id },
			success: function(response)
			{
				console.log(response)
				if(response.trim() == "1") {
					toastr.success("PURCHASE DELETED SUCCESSFULLY", "SUCCESS");
					load_purchase_datatable();
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
				url: root_domain+'app/purchase/',
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
	
	var cust_id = $('#cust_id').val();
	if(cust_id==''){
		toastr.warning("Please Select Vendor First","ERROR");
		$('#cust_id').select2('focus');
		return false;
	}
	var purchaseorder_id = $("#purchaseorder_id").val();
	if(purchaseorder_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase/',
			data: { mode : "loadpurchase_productdata",product_id :product_id, purchaseorder_id:purchaseorder_id },
			success: function(response)
			{
				//console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.description);				
				//$('#product_qty').val(obj.product_qty);
				$('#product_qty').attr("placeholder",obj.max_grn_qty);
				$('#product_qty').attr("max",obj.max_grn_qty);
				
				$('#product_rate').val(obj.product_rate);	
				$('#unitid').select2("val",obj.unit_id);
				$('#product_discount').val(obj.product_discount);
				$('#discount_per').val(obj.discount_per);
				$('#formulaid').val(obj.formulaid);
				get_amount();	
			}
		});
	}
	else{
		toastr.warning("Please Select P.O.","ERROR");
		$('#purchaseorder_id').select2('focus');
		$('#product_id').select2("val","");
		return false;
		/*$.ajax({
			type: "POST",
			url: root_domain+'app/purchase/',
			data: { mode : "load_productdata", eid :product_id, cust_id : cust_id },
			success: function(response)
			{
				//console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.product_des);						
				$('#product_rate').val(obj.product_purchase_mst_rate);				
				$('#unitid').select2("val",obj.product_mst_unitid);
				/*if(obj.com_stateid==obj.ven_stateid){
					$('#formulaid').val(obj.intra_tax);
				}else{
					$('#formulaid').val(obj.inter_tax);
				}*			
			}
		});*/
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
	
	var promaxval=$('#product_qty').attr("max");
	if(parseFloat(promaxval)<parseFloat($("#product_qty").val())) {
		toastr.warning("Please Check Pending Qty", "ERROR")
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase/',
		data: { mode : "fieldadd",edit_id:$("#edit_id").val(),product_id:$("#product_id").val(),product_des:$("#product_des").val(),product_qty:$("#product_qty").val(),product_rate:$("#product_rate").val(),product_disc:$("#product_disc").val(),unit_id:$("#unitid").val(),formulaid:$("#formulaid").val(),product_discount:$("#product_discount").val(),discount_per:$("#discount_per").val(),product_amount:$("#product_amount").val(),purchase_id:$("#eid").val() },
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
function load_purchase_datatable()
{
	var date=$('#rep_date').val();
	
	$("#purchase-bill-table").dataTable({
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
		"sAjaxSource": root_domain+'app/purchase/',
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
		url: root_domain+'app/purchase/',
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
	var purchaseorder_id = $('#purchaseorder_id').val();
	if(!purchaseorder_id){
		toastr.warning("Please Select P.O.","ERROR");
		$('#purchaseorder_id').select2('focus');
		return false;
	}
	
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase/',
		data: { mode : "preedit",  id : id, purchaseorder_id:purchaseorder_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			//$('#product_id').html(resp.producthtml);
			//$('#product_id').append('<option value="'+resp.product_id+'">'+resp.product_name+'</option>');
			$("#product_id").select2("val",resp.product_id);
			$("#product_des").val(resp.description);
			$("#product_qty").val(resp.product_qty);
			
			$('#product_qty').attr("placeholder",resp.max_grn_qty);
			$('#product_qty').attr("max",resp.max_grn_qty);
				
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
			url: root_domain+'app/purchase/',
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
function load_purchase_no() {
	$.ajax({
		type: "POST",
		url: root_domain+'app/purchase/',
		data: { mode : "load_invoiceno" },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#purchase_no').val(no.invoiceno); 
		}
	});
}
function load_purchase_order(cust_id){
	if(cust_id){
		$('#purchase_order_div').attr("style","display:block");
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase/',
			data: { mode : "load_purchase_order", cust_id : cust_id },
			success: function(response){
				 console.log(response);
				 $('#purchaseorder_id').html(response);
				 $('#purchaseorder_id').select2('val','');
				 Unloading();
			}
		});
	}
	else{
		$('#purchase_order_div').attr("style","display:none");
	}
}
function load_purhcase_order_data(purchaseorder_id){
	if(purchaseorder_id){
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/purchase/',
			data: { mode:"load_purhcase_order_data", purchaseorder_id:purchaseorder_id },
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