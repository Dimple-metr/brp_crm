//var datatable;
$(document).ready(function() {
	/*$("#chk_cust").click(function() { // a button with checkall2 as its id
		var allPages = datatable.fnGetNodes(); 
		if($("#chk_cust").prop("checked")==true)
		{
			$('input[type="checkbox"]', allPages).prop('checked', true);
		}
		else{
			$('input[type="checkbox"]', allPages).prop('checked', false);
		}
	});*/
	
	load_cust_datatable();
	load_address_table();
	load_contact_table();
	load_exist_table();
	// validate vendor add form on keyup and submit
	$("#cust_add").validate({
		rules: {
			cust_name:{
				required:true
			},
			cust_mobile: {
				number:true
			},
			cust_email:{
				email:true
			},
			gst_no:{
				maxlength:15,
				minlength:15
			}
		},
		messages: {
			cust_name:{
				required: "Customer name must be select"
			},
			cust_mobile: {
				number:"Enter Only number "
			},
			cust_email:{
				email:"Enter Valid Email"
			},
			gst_no:{
				maxlength:"Maximum Length For GST No. is reached",
				minlength:"Minimum Length For GST No. is 15"
			}
			
		}
	});
	$("#import_customer").validate({
		rules: {
			excel_file: {
				required: true			
			}
		},
		messages: {
			excel_file: {
				required: "Select CSV File"			
			}
		}
	}); 
});

$(".btn_close").click(function() {
    $("label.error").hide();
});
$("#cust_add").on('submit',function(e) {
	
});
$("#cust_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#cust_add").valid()) {
		return false;
	}
	
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");	 
	
	var form_data=new FormData(this);	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{	
			console.log(response);
			var data = JSON.parse(response);
			var responsevalue=data.res;
			if(responsevalue.trim() == '1') {
				Unloading();
				toastr.success("CUSTOMER ADDED SUCCESSFULLY", "SUCCESS");	
				window.location=root_domain+'customer_list';
			}
			else if(responsevalue.trim() == '0') {
				Unloading();
				toastr.error("Something Went Wrong", "ERROR");	
			}
			else if(responsevalue.trim() == '2') {
				toastr.success("CUSTOMER ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_id').append('<option value='+data.cust_id+'>'+data.cust_name+'</option>');	
				$('#cust_id').select2("val",data.cust_id);
				$("#cust_id").trigger('change');
				$('#cust_add').trigger('reset');
				Unloading();
			}
			else if(responsevalue.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_add').trigger('reset');
				Unloading();				
			}
			else if(responsevalue.trim() == 'update')
			{	
				toastr.success("CUSTOMER UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'customer_list';
				//	toastr.success("SLIDER UPDATED SUCCESSFULLY", "SUCCESS");		
			}
			$('#cust_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});

function delete_cust(id) 
{
	var r= confirm(" Are you want to delete ?");
	
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/customer/',
			data: { mode : "delete",  eid : id },
			success: function(response)
			{
				console.log(response);
				if(response.trim() == "1") {
					toastr.success("CUSTOMER DELETE SUCCESSFULLY", "SUCCESS");
					load_cust_datatable();
				}
				else if(response.trim() == "-1") {
					toastr.error("USED CUSTOMER TYPE CAN'T BE DELETED !!!", "WARNING"); 
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}			
				Unloading();				
			}
		});	
	}
}
function load_state(parentid,control,val1)
{	
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "load_state",  id : parentid},
		success: function(responce){
			//console.log(responce);
			$('#'+control).html(responce);
			$("#"+control).select2("val",val1);
		}
	});
	
}
function add_state()
{
	if($("#countryid").val()=='')
	{
		toastr.warning("Please Select the Country", "WARNING");
	}
	else{
		$("#bs-example-modal-state").modal("show");
		$("#countryid").val($("#countryid").val());
	}
}
function load_city(parentid,control,val1)
{	
	//alert(parentid);
	$.ajax({
		type: "POST",
		url: root_domain+'app/vender/',
		data: { mode : "load_city",  id : parentid},
		success: function(responce){
			//console.log(responce);
			//alert(responce);
			$('#'+control).html(responce);
			$("#"+control).select2("val",val1);
		}
	});
	
}
function add_city()
{
	if($("#stateid").val()=='')
	{
		toastr.warning("Please Select the State", "WARNING");
	}
	else{
		$("#bs-example-modal-city").modal("show");
		$("#state_id").val($("#stateid").val());
	}
}

$("#import_customer").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#import_customer").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled"); 
	var form_data=new FormData(this);	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{	
			console.log(response);
			var data = JSON.parse(response);
			var response=data.res;
			Unloading();
			if(response == '1') {
				$('#msg').html('<span style="color:green">Data Cheked Successfully</span>');
				$('#check_button').hide();
				$('#mode').val('import_data');
				$('#import_button').show();
			}
			else if(response == '-1')
			{
				toastr.info("SELECT WRONG FILE", "INFO")
				$('#import_customer').trigger('reset');
				Unloading();				
			}
			else if(response == '0')
			{
				$('#msg').html('<span style="color:red"> Coloums Does Not Match Please Check With demo File</span>');
				$('#import_customer').trigger('reset');
				Unloading();				
			}
			else if(response == '3')
			{
				$('#msg').html('<span style="color:red"> Coloum Name Does Not Match Please Check With demo File</span>');
				$('#import_customer').trigger('reset');
				Unloading();				
			}
			else if(response == '4')
			{
				toastr.success("CUSTOMER IMPORT SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'customer_list';		
				$('#import_customer').trigger('reset');
				Unloading();				
			}
			else if(response == '5')
			{
				$('#import_customer').trigger('reset');
				$('#check_button').show();
				$('#mode').val('check_data');
				$('#import_button').hide();
				show_importedcust_data();
				Unloading();				
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function show_importedcust_data(total)
{
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "show_importedcustdata"},
		success: function(responce){
			console.log(responce);
			Unloading();
			$('#imported_data_section').show();
			$('#temp_custdata').html(responce);
			
		}
	});
	
}

function load_cust_datatable(){
	var party_type = $('input[name="party_type"]:checked').val();
	var business_type = $('#business_type').val();
	
	datatable = $("#dynamic-table").dataTable({
	    "bStateSave": true,
		"bAutoWidth" : false,
		"bFilter" : true,
		"bSort" : true,
		"bProcessing": true,
		"bServerSide" : true,
		"bDestroy" : true,
		/*"aoColumns": [
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": true },
			{ "bSortable": true }
		
		], */
		"oLanguage": {
			"sLengthMenu": "_MENU_",
			"sProcessing": "<img src='"+root_domain+"img/loading.gif'/> Loading ...",
			"sEmptyTable": "NO DATA ADDED YET !",
		},
		"aLengthMenu": [[10, 30, 50, -1], [10, 30, 50, "ALL"]],
		"iDisplayLength": 10,
		"sAjaxSource": root_domain+'app/customer/',
		"fnServerParams": function ( aoData ) {
			aoData.push( { "name": "mode", "value": "fetch" },{ "name": "party_type", "value": party_type },{ "name": "business_type", "value": business_type } );
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}

// Add address

function add_cust_address()
{
	//alert('hii');
	
	Loading(true);
	
	var c_add_location=$('#c_add_location').val();
	var c_add_street=$('#c_add_street').val();
	var c_add_country=$('#c_add_country').val();
	var c_add_state=$('#c_add_state').val();
	var c_add_city=$('#c_add_city').val();
	var c_add_zip=$('#c_add_zip').val();
	var cust_id=$('#eid').val();
	var edit_id=$('#edit_add_id').val();
	var mode='add_cust_address';
	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , c_add_location:c_add_location, c_add_street:c_add_street, c_add_country:c_add_country,c_add_state:c_add_state,c_add_city:c_add_city,c_add_zip:c_add_zip,cust_id:cust_id,edit_id:edit_id },
		success: function(responsevalue)
		{	
			//console.log(response);
			//var data = JSON.parse(response);
			//var responsevalue=data.res;
			if(responsevalue.trim() == '1') {
				Unloading();
				toastr.success("Address ADDED SUCCESSFULLY", "SUCCESS");
				$('#c_add_location').val('');
				$('#c_add_street').val('');
				$('#c_add_country').select2('val',"");
				$('#c_add_state').select2('val',"");
				$('#c_add_city').select2('val',"");
				$('#c_add_zip').val('');
				load_address_table();
				//window.location=root_domain+'customer_list';
			}
			else if(responsevalue.trim() == '2') {
				toastr.success("CUSTOMER ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_id').append('<option value='+data.cust_id+'>'+data.company_name+'</option>');	
                $('#vender_id').append('<option value='+data.cust_id+'>'+data.company_name+'</option>');				
				$("#vender_id").trigger('change')
				$("#cust_id").trigger('change')
				$('#cust_id').select2("val",data.cust_id);
				$('#vender_id').select2("val",data.cust_id);
				$('#cust_add').trigger('reset');
				Unloading();
			}
			else if(responsevalue.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_add').trigger('reset');
				Unloading();				
			}
			else if(responsevalue.trim() == 'update')
			{	
				toastr.success("CUSTOMER UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'customer_list';
				//	toastr.success("SLIDER UPDATED SUCCESSFULLY", "SUCCESS");		
			}
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
	
}

function load_address_table()
{
	var cust_id=$('#eid').val();
	var mode='show_cust_address';
	
	Loading(true);
	
	$.ajax({
		
		type:'POST',
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , cust_id:cust_id },
		success: function(responsevalue)
		{	
			//console.log(responsevalue);
			$('#cust_address_details').html(responsevalue);
			$('#add_ad_btn').val('Add');
			Unloading();
		}
	})
}

function edit_data_serial(id,table,whereid)
{
	//alert(id);

	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "preedit_serial",id:id,table:table,whereid:whereid},
		success: function(response)
		{

			console.log(response);
			//alert(response);
			var data = jQuery.parseJSON(response);
			
			$("#c_add_location").val(data.c_add_location);
			$("#c_add_street").val(data.c_add_street);
			$("#c_add_zip").val(data.c_add_zip);
			$("#edit_add_id").val(data.c_add_id);
			$('#add_ad_btn').val('Update');
			
			load_country(data.c_add_country);
			load_state(data.c_add_country,'c_add_state',data.c_add_state);
			load_city(data.c_add_state,'c_add_city',data.c_add_city);
			
			Unloading();
		}
	});
}

function delete_data_serial(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/customer/',
				data: { mode : "delete_data_serial",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					load_address_table();
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}

function load_country(country)
{
	//alert(country);
	Loading(true);
	
	$.ajax({
		
		type:'POST',
		url: root_domain+'app/customer/',
		data: { mode : "load_country",country:country },
		success: function(response)
		{
			//alert(response);
			$('#c_add_country').html(response);
			$('#c_add_country').select2("val",country);
		}
	})
}

//contact
function open_cust_contact(){
	var cust_id = $("#cust_id").val();
	if(!cust_id){
		toastr.warning("Customer Not Found!!!", "WARNING");
		$('#cust_id').select2('focus');
		return false;
	}
	$('#add_person_modal').modal('show');
}
function add_cust_contact()
{
	//alert('hii');
	
	Loading(true);
	
	var cust_person_model=$('#cust_person_model').val();
	var con_first=$('#con_first').val();
	var con_last=$('#con_last').val();
	var com_email=$('#com_email').val();
	var con_mobile=$('#con_mobile').val();
	var con_phone=$('#con_phone').val();
	var con_job=$('#con_job').val();
	var cust_id=$('#eid').val();
	var cust_ref_id=$('#cust_id').val();
	var edit_id=$('#edit_con_id').val();
	var mode='add_cust_contact';
	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , con_first:con_first, con_last:con_last, com_email:com_email,con_mobile:con_mobile,con_phone:con_phone,con_job:con_job,cust_id:cust_id,edit_id:edit_id,cust_person_model:cust_person_model,cust_ref_id:cust_ref_id },
		success: function(responsevalue)
		{	
			//console.log(response);
			//var data = JSON.parse(response);
			//var responsevalue=data.res;
			if(responsevalue.trim() == '1') {
				Unloading();
				toastr.success("Contact ADDED SUCCESSFULLY", "SUCCESS");
				$('#con_first').val('');
				$('#con_last').val('');
				$('#com_email').val('');
				$('#con_mobile').val('');
				$('#con_phone').val('');
				$('#con_job').val('');
				load_contact_table();
				//window.location=root_domain+'customer_list';
			}
			else if(cust_ref_id) {
				$('#con_first').val('');
				$('#con_last').val('');
				$('#com_email').val('');
				$('#con_mobile').val('');
				$('#con_phone').val('');
				$('#con_job').val('');
				toastr.success("CONTACT ADDED SUCCESSFULLY", "SUCCESS");
				$("#add_person_modal").modal("hide");
				var c_con_id = responsevalue.trim();//Get Ins ID
				load_cust_person(cust_ref_id);
				setTimeout(function(){$('#c_con_id').select2("val",c_con_id);},1000);
				Unloading();
			}
			else if(responsevalue.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_add').trigger('reset');
				Unloading();				
			}
			else if(responsevalue.trim() == 'update')
			{	
				toastr.success("Contact UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'customer_list';
				//	toastr.success("SLIDER UPDATED SUCCESSFULLY", "SUCCESS");		
			}
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
	
}

function load_contact_table()
{
	var cust_id=$('#eid').val();
	var mode='show_cust_contact';
	
	Loading(true);
	
	$.ajax({
		
		type:'POST',
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , cust_id:cust_id },
		success: function(responsevalue)
		{	
			//console.log(responsevalue);
			$('#cust_contact_details').html(responsevalue);
			$('#add_btn_contact').val('Add');
			Unloading();
		}
	})
}

function edit_data_contact(id,table,whereid)
{
	//alert(id);

	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "preedit_contact",id:id,table:table,whereid:whereid},
		success: function(response)
		{

			console.log(response);
			//alert(response);
			var data = jQuery.parseJSON(response);
			
			$("#con_first").val(data.c_con_fname);
			$("#con_last").val(data.c_con_lname);
			$("#com_email").val(data.c_con_email);
			$("#con_mobile").val(data.c_con_mobile);
			$("#con_phone").val(data.c_con_phone);
			$("#con_job").val(data.c_con_job);
			$("#edit_con_id").val(data.c_con_id);
			$('#add_btn_contact').val('Update');
			
			Unloading();
		}
	});
}

function delete_data_contact(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/customer/',
				data: { mode : "delete_data_contact",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					load_contact_table();
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}

//Existing Customer

function add_exist()
{
	//alert('hii');
	
	Loading(true);
	
	var ext_type=$('#ext_type').val();
	var ext_product=$('#ext_product').val();
	var ext_remark=$('#ext_remark').val();
	
	var cust_id=$('#eid').val();
	var edit_id=$('#edit_exist_id').val();
	var mode='add_cust_exist';
	
	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , ext_type:ext_type, ext_product:ext_product, ext_remark:ext_remark,cust_id:cust_id,edit_id:edit_id },
		success: function(responsevalue)
		{	
			//console.log(response);
			//var data = JSON.parse(response);
			//var responsevalue=data.res;
			if(responsevalue.trim() == '1') {
				Unloading();
				toastr.success("Data ADDED SUCCESSFULLY", "SUCCESS");
				$('#ext_type').val('');
				$('#ext_product').select2('val','');
				$('#ext_remark').val('');
				
				load_exist_table();
				//window.location=root_domain+'customer_list';
			}
			else if(responsevalue.trim() == '2') {
				toastr.success("Contact ADDED SUCCESSFULLY", "SUCCESS");
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_id').append('<option value='+data.cust_id+'>'+data.company_name+'</option>');	
                $('#vender_id').append('<option value='+data.cust_id+'>'+data.company_name+'</option>');				
				$("#vender_id").trigger('change')
				$("#cust_id").trigger('change')
				$('#cust_id').select2("val",data.cust_id);
				$('#vender_id').select2("val",data.cust_id);
				$('#cust_add').trigger('reset');
				Unloading();
			}
			else if(responsevalue.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				$("#bs-example-modal-lg").modal("hide");
				$('#cust_add').trigger('reset');
				Unloading();				
			}
			else if(responsevalue.trim() == 'update')
			{	
				toastr.success("Contact UPDATED SUCCESSFULLY", "SUCCESS");		
				Unloading();
				window.location=root_domain+'customer_list';
				//	toastr.success("SLIDER UPDATED SUCCESSFULLY", "SUCCESS");		
			}
			
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
	
}

function load_exist_table()
{
	var cust_id=$('#eid').val();
	var mode='show_cust_exist';
	
	Loading(true);
	
	$.ajax({
		
		type:'POST',
		url: root_domain+'app/customer/',
		type: "POST",
		data: { mode : mode , cust_id:cust_id },
		success: function(responsevalue)
		{	
			//console.log(responsevalue);
			$('#cust_exist_details').html(responsevalue);
			$('#add_exist_btn').val('Add');
			Unloading();
		}
	})
}

function edit_data_exist(id,table,whereid)
{
	//alert(id);

	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "preedit_exist",id:id,table:table,whereid:whereid},
		success: function(response)
		{

			console.log(response);
			//alert(response);
			var data = jQuery.parseJSON(response);
			
			$("#ext_type").val(data.c_ext_type);
			load_product(data.c_ext_product);
			$("#ext_remark").val(data.c_ext_remark);
			
			$("#edit_exist_id").val(data.c_ext_id);
			$('#add_exist_btn').val('Update');
			
			Unloading();
		}
	});
}

function delete_data_exist(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/customer/',
				data: { mode : "delete_data_exist",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					load_exist_table();
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}

function load_product(pid)
{
	Loading(true);
	
	$.ajax({
		
		type:'POST',
		url: root_domain+'app/customer/',
		data: { mode : "load_product",pid:pid },
		success: function(response)
		{
			//alert(response);
			$('#ext_product').html(response);
			$('#ext_product').select2("val",pid);
		}
	})
}
function load_cust_person(cust_id){
	if(cust_id){
		Loading(true);
		$.ajax({
			type:'POST',
			url: root_domain+'app/customer/',
			data: { mode:"load_cust_person", cust_id:cust_id },
			success: function(response)
			{
				var resp=JSON.parse(response);
				$('#c_con_id').html(resp.html_resp);
				$('#c_con_id').select2("val",($("#c_con_id option:eq(1)").val())).select2('focus');
				Unloading();
			}
		});
	}
}

function check_csv_data(){
	if(!$('#import_file').val()){
		toastr.warning("Select File", "ERROR");
		$("#import_file").focus();
		return false;
	}
	
	var conf_form = new FormData();
	
	conf_form.append('mode', "check_csv_data");
	conf_form.append("import_file", document.getElementById('import_file').files[0]);//append files
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: conf_form,
		contentType: false,
		processData:false,
		success: function(response){
			console.log(response);
			var resp=JSON.parse(response);
			if(resp.res=='1'){
				$('#mode').val("import_csv_data");
				$('#check_btn').hide();
				$('#submit_btn').show();
				$('#import_file').attr("readonly",true);
			}
			else if(resp.res=='2'){
				$("#import_file").val("");
				toastr.warning("Column Name Doesn't matched !!!", "ERROR", { timeOut: 9500 });
			}
			else {
				$("#import_file").val("");
				toastr.warning("SOMETHING WENT WRONG!!!", "ERROR");
			}
			Unloading();
		}
	});
}

$("#cust_imp_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#cust_imp_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");
	$("#submit_btn").prop("disabled",true);
	
	var form_data=new FormData(this);
	
	$.ajax({
		cache:false,
		url: root_domain+'app/customer/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			//console.log(response);
			var response=JSON.parse(response);
			var resp=response.res;
			if(resp.trim() == '1') {
				toastr.success("DATA IMPORT SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'customer_list';
			}
			else if(resp.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
			}
			Unloading();
			$('#cust_imp_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});