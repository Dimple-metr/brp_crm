//var datatable;
$(document).ready(function() {
	load_creditnote_datatable();
	get_amount();

// validate the comment form when it is submitted
// validate vendor add form on keyup and submit
$("#credit_note_add").validate({
	rules: {
		credit_note_no: {
			required: true			
		},
		credit_note_date: {
			required: true			
		},
		cust_id: {
			required: true
		}
	},
	messages: {
		credit_note_no: {
			required: "Enter Credit Note No."
		},
		credit_note_date: {
			required: "Enter Credit Note date"
		},
		cust_id: {
			required: "Select Customer"
		}
		
	}
}); 
});
function submit_estimate()
{
	$("#save_print").val(1)
	//$("#credit_note_add").submit();
}
$("#credit_note_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#credit_note_add").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	for (instance in CKEDITOR.instances) 
	{
    	CKEDITOR.instances[instance].updateElement();
	}
	var form_data=new FormData(this);	
	$.ajax({
		cache:false,
		url: root_domain+'app/credit_note/',
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
				toastr.success("SALES RETURN ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'credit_note_list';
				
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(arr.msg == '-1'){
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			else if(arr.msg == 'update'){	
				toastr.success("SALES RETURN UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'credit_note_list';
			}
			$('#credit_note_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});

function delete_credit_note(id) 
{
	var r= confirm(" Are you want to delete ?");
	if(r){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "delete",  eid : id },
			success: function(response)
			{
				console.log(response);
				if(response.trim() == "1"){
					toastr.success("SALES RETURN DELETE SUCCESSFULLY", "SUCCESS");
					load_creditnote_datatable();
					Unloading();
				}
				else if(response.trim() == "0"){
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
			}
		});	
	}	
}

function add_discount(type)
{
	var total=$("#total").val();
	var discount_amt=0; var discount_per=0;
	if(total!="")
	{
		if(type=="amt")
		{
			discount_amt=$('#discount_amt').val();
			discount_per=((discount_amt*100)/total).toFixed(2);
			$("#discount_per").val(discount_per);
		}
		else if(type=="per")	
		{
			discount_per=$('#discount_per').val();
			discount_amt=((total*discount_per)/100).toFixed(2);
			$("#discount_amt").val(discount_amt);
		}
		get_gtotal($('#formulaid').val());
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
function add_freight()
{
	get_gtotal($('#formulaid').val());
}
function cal_discount()
{
	get_gtotal($('#formulaid').val());
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
						$('#product_amount').val(obj.total);
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
function get_gtotal(id)
{	
	var input_amount=(document.getElementsByName('amount[]'));
	var cnt=input_amount.length;
	var total=$("#product_amount").val();
	var c_total=0;
	if(total=="")
	{
		total=0;
	}
	for(var i=0;i<cnt;i++)
	{	
		var t=input_amount[i].value;
		if(t>0)
			total=parseFloat(total)+parseFloat(t);
	}
	
	$("#total").val(parseFloat(total));
	var p=$("#packing").val();
	if(p>0)
	{
		total=parseFloat(total)+parseFloat(p);
	}
	/*
	var f=$("#freight").val();
	if(f>0)
	{
		c_total=parseFloat(c_total)+parseFloat(f);
	}
	
	var d=$("#discount_amt").val();
	if(d>0)
	{
		c_total=parseFloat(c_total)-parseFloat(d);
	}*/
	
	g_total=total;
	$("#g_total").val(total);
	/*
	$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "formulavalue",eid :id,total : g_total, c_total:c_total},
			success: function(response)
			{
				//console.log(response);
				$('#showformulatextbox').html(response);
				g_total=parseFloat($('#rate').val());
				
				$("#g_total").val(g_total);
				
			}
	});
	*/
}
function load_productdetail(val) {
	if(val!=0)
	{
		$('#addproduct').hide();
	}
	else
	{
		$('#addproduct').show();
	}
	var cust_id = $('#cust_id').val();
	if(cust_id==''){
		toastr.warning("Please Select Customer First","ERROR");
		$('#cust_id').select2('focus');
		return false;
	}
	$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "load_productdata",eid :val, cust_id:cust_id },
			success: function(response)
			{
				//console.log(response);
				var obj =jQuery.parseJSON(response)
				$('#product_des').val(obj.product_des);				
				$('#product_hsn_code').val(obj.product_code);				
				$('#product_rate').val(obj.product_mst_rate);	
				$('#unit_id').select2("val",obj.product_mst_unitid);
				if(obj.com_stateid==obj.cust_stateid){
					$('#formulaid').val(obj.intra_tax);
				}else{
					$('#formulaid').val(obj.inter_tax);
				}
			}
		});
}

function add_field()
{
	
	if($("#product_id").val()==="")
	{		
		toastr.warning("Select Product Name", "ERROR")
		return false;
	}
	if($("#product_qty").val()==="")
	{		
		toastr.warning("Enter Qty", "ERROR")
		return false;
	}
	if($("#product_rate").val()==="")
	{		
		toastr.warning("Enter Rate", "ERROR")
		return false;
	}
	Loading();	
	$.ajax({
		type: "POST",
		url: root_domain+'app/credit_note/',
		data: { mode : "fieldadd",edit_id:$("#edit_id").val(),product_id:$("#product_id").val(),product_des:$("#product_des").val(),product_hsn_code:$("#product_hsn_code").val(),product_qty:$("#product_qty").val(),product_rate:$("#product_rate").val(),unit_id:$("#unit_id").val(),formulaid:$("#formulaid").val(),product_discount:$("#product_discount").val(),discount_per:$("#discount_per").val(),product_amount:$("#product_amount").val(),credit_note_id:$("#eid").val() },
		success: function(response)
		{
			//console.log(response);
			//$("#product_id option[value='"+$("#product_id").val()+"']").remove();
			$("#product_id").select2("val","");
			$("#product_des").val("");
			$("#product_hsn_code").val("");
			$("#product_qty").val("");
			$("#unit_id").select2('val',"");
			$("#formulaid").val("");
			$("#product_discount").val("");
			$("#discount_per").val("");
			$("#taxable_value").val("");
			$("#product_rate").val('');
			$("#product_amount").val('');
			$("#edit_id").val('');
			$('#addproduct').show();
			$('#addrow').val('Add');
			
			Unloading();
			if($("#eid").val()==""){
				show_data()
			}
			else{
				location.reload();
			}
		}
	});
}

function reload_data()
{
	load_creditnote_datatable();
}	
function load_creditnote_datatable()
{
	var data=$('input[name=report]:Checked').val();
	var date=$('#rep_date').val();
	var type=$('#type_id').val();
	datatable = $("#dynamic-table").dataTable({
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
			"aLengthMenu": [[-1, 10, 20, 30, 50], ["All", 10, 20, 30, 50]],
			"iDisplayLength": 10,
			"sAjaxSource": root_domain+'app/credit_note/',
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
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/credit_note/',
		data: { mode : "load_tempoutward"},
		success: function(data){
			//console.log(data);
			$('#sale_productdata').html(data);				
			get_amount()
			Unloading();
		}		
	});
	
}

function edit_data(id,table,whereid)
{
	Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "preedit",  id : id ,table:table,whereid:whereid},
			success: function(response)
			{
				console.log(response)
				var data = jQuery.parseJSON(response);
				//$('#product_id').html(data.producthtml);
				//$('#product_id').append('<option value="'+data.product_id+'">'+data.product_name+'</option>');
				$("#product_id").select2("val",data.product_id)
				$("#product_hsn_code").val(data.product_hsn_code)
				$("#product_des").val(data.description)
				$("#product_qty").val(data.product_qty)
				$("#product_rate").val(data.product_rate)
				$("#product_disc").val(data.product_disc)
				$("#unit_id").select2("val",data.unit_id);
				$("#formulaid").val(data.formulaid);
				$("#product_amount").val(data.total)
				$("#product_discount").val(data.product_discount)
				$("#discount_per").val(data.discount_per)
				$("#taxable_value").val(data.product_amount)
				$("#edit_id").val(id)
				$('#addrow').val('Update');
				Unloading();
			}
		});
}
function delete_data(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "delete_data", eid:id, table:table, whereid:whereid, credit_note_id:$("#eid").val() },
			success: function(response)
			{
				console.log(response);
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					if($("#eid").val()==""){	
						show_data();
					}
					else{
						location.reload();
					}
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
			}
		});	
	}
}
function get_series_no(){
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/credit_note/',
		data: { mode : "get_series_no"},
		success: function(resp){
			//console.log(resp);
			$('#invoicetype_id').val(resp);	
			load_credit_no(resp);	
		}		
	});	
}
function load_credit_no(id)
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/credit_note/',
		data: { mode : "load_invoiceno", typeid : id },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#credit_note_no').val(no.invoiceno);
		}
	});
}
function refund_credit_note(credit_note_id)
{
	$.ajax({
		type: "POST",
		url: root_domain+'app/credit_note/',
		data: { mode : "refund_credit_note", credit_note_id : credit_note_id },
		success: function(data){
			//console.log(data);
			var no = jQuery.parseJSON(data);
			$('#modal_refund_creditnote_payment').modal('show');
			$('#credit_note_payment_date').val(no.credit_note_payment_date);
			$('#credit_note_due_amt').val(no.credit_note_due_amt);
			$('#credit_note_payment_refno').val(no.credit_note_payment_refno);
			$('#credit_note_paid_amt').attr("max",no.credit_note_due_amt);
			$('#credit_note_paid_amt').val(no.credit_note_paid_amt);
			$('#paymentmodeid').val(no.paymentmodeid);
			$('#credit_note_id').val(credit_note_id);
			$('#credit_note_payment_remark').val(no.credit_note_payment_remark);
			if(no.paymentmodeid!="1"){	
				$('#cheque_data').show();
			}
			else{
				$('#cheque_data').hide();
			}
			$('#pur_acc_id').val(no.pur_acc_id);
			$('#cheque_dtl').val(no.cheque_dtl);
			$('#ref_date').val(no.ref_date);
		}
	});
}
function get_chequeno(acc_id,refcontroll)
{
	if($("#paymentmodeid").val()==2)
	{
		Loading();
		editReq = $.ajax({
			type: "POST",
			url: root_domain+'app/purchasepayment/',
			data: { mode : "get_chequeno", acc_id :acc_id },
			success: function(response)
			{
				//console.log(response);
				response=response.trim();
				if(response!="")
				{
				$('#'+refcontroll).val(parseInt(response)+parseInt(1));
				}
				Unloading();
			}
		});	
	}
}
function get_opening_bal(acc_id,amt_text,amt_err)
{
		Loading();
	
		editReq = $.ajax({
			type: "POST",
			url: root_domain+'app/purchasepayment/',
			data: { mode : "get_opn_bal", acc_id :acc_id },
			success: function(response)
			{
				//console.log(response);
				response=response.trim();
				$('.amtbalance').css('display','');
				$('#'+amt_text).val(response);
				$('#'+amt_err).html('Balance '+response);
				Unloading();
			}
		});	
}
function get_cash_opening_bal(acc_id,amt_text,amt_err)
{
	$('.amtbalance').css('display','none');
	if(acc_id==1)
	{
		Loading();
		editReq = $.ajax({
			type: "POST",
			url: root_domain+'app/purchasepayment/',
			data: { mode : "get_opn_bal", acc_id :'0' },
			success: function(response)
			{
				//console.log(response);
				response=response.trim();
				$('.amtbalance').css('display','');
				$('#'+amt_text).val(response);
				$('#'+amt_err).html('Balance '+response);
				Unloading();
			}
		});	
	}
}
$("#credit_note_payment_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#credit_note_payment_add").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var form_data=new FormData(this);	
	$.ajax({
		cache:false,
		url: root_domain+'app/credit_note/',
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
				toastr.success("SALES RETURN REFUND ADDED SUCCESSFULLY", "SUCCESS");
				load_creditnote_datatable();
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
				Unloading();
			}
			$('#credit_note_payment_add').trigger('reset');
			$('#modal_refund_creditnote_payment').modal('hide');
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function delete_payment(){
	
	var del_conf = confirm('Are you sure want to delete All Transactions of selected Sales Return ?');
	
	if(del_conf){
		$('#modal_refund_creditnote_payment').modal('hide');
		var credit_note_id = $('#credit_note_id').val();
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/credit_note/',
			data: { mode : "del_payment_credit_note", credit_note_id : credit_note_id },
			success: function(response){
				//console.log(response);
				
				if(response.trim() == "1") {
					toastr.success("PAYMENT DELETED SUCCESSFULLY", "SUCCESS");
					load_creditnote_datatable();
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
			}
		});
	}
	else{
		return false;
	}
}
function load_pro(){
	var product_id = $('#product_id').val();
	if(product_id){
		load_productdetail(product_id);
	}
}