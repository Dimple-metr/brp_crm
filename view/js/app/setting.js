//var datatable;
$(document).ready(function() {
	
	show_currency_data();
	show_images_data();
	show_bank_data();

// validate vendor add form on keyup and submit
$("#a_add").validate({
	rules: {
		company_name: {
			required: true			
		},
		comp_add1: {
			required: true,
			minlength: 15
		}
	},
	messages: {
		company_name: {
			required: "Enter Company Name"
		},
		comp_add1: {
			required: "Enter Address",
			minlength: "Your Description must consist of at least 15 characters"
		}
		
	}

});
});
$("#a_add").on('submit',function(e) {
								 
	for (instance in CKEDITOR.instances) {
    	CKEDITOR.instances[instance].updateElement();
	}	
	
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#a_add").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data=new FormData(this);
	$.ajax({
		cache:false,
		url: root_domain+'app/setting/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,	
		success: function(response)
		{
			
			console.log(response);			
			if(response.trim() == 'update') {
				toastr.success("UPDATE SUCCESSFULLY", "SUCCESS");
				Unloading();
				window.location=root_domain+'manage_company';
						
			}
			else if(response == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(response == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			$('#serv_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});

function add_currency()
{
	if($("#comp_org_currency").val()==""){
		toastr.warning("Select currency", "ERROR")
		$("#comp_org_currency").select2('focus');
		return false;
	}
	
	
	Loading();	
	$.ajax({
			type: "POST",
			url: root_domain+'app/setting/',
			data: { mode : "add_currency",id:$("#eid").val(),comp_org_currency:$("#comp_org_currency").val() },
			success: function(response)
			{
				console.log(response);
				
				$("#comp_org_currency").select2("val","");
				
				if(response==1)
				{
					toastr.success("inserted ", "SUCCESS");
					Unloading();
					show_currency_data();
				}
			}
		});
}

function show_currency_data()
{
	Loading();	
	$.ajax({
			type: "POST",
			url: root_domain+'app/setting/',
			data: { mode : "show_currency",id:$("#eid").val() },
			success: function(response)
			{
				console.log(response);
				
				$("#show_currency_table").html(response);
				Unloading();
				
			}
		});
}

function delete_currency(id)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/setting/',
				data: { mode : "delete_data",eid : id,comp_id:$("#eid").val() },
				success: function(response)
				{
				
					if(response== "1") {
						toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
						show_currency_data();
						Unloading();
					}
					else if(response.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}							
					}
			});	
		}
	
}

function add_certi()
{ 
   var data = new FormData();
   data.append('file', $('#f_logo1').prop('files')[0]);
   data.append("mode",$('#img_mode').val());
   data.append("pid",$('#eid').val());
   data.append("certi_name",$('#certi_name').val());
  // alert(form_data);
   $.ajax({
   url: root_domain+'app/setting/',
    method:"POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    beforeSend:function(){
     $('#uploaded_image').html("<label class='text-success'>Image Uploading...</label>");
    },   
    success:function(data)
    {
		//alert(data);
		$("#f_logo1").val('');
		show_images_data();
		//$('#uploaded_image').html(data);
		
    }
   });
 
}

function show_images_data()
{
	var company_id=$('#eid').val();
	//alert(form_mode);
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/setting/',
		data: { mode : "load_certi_images",company_id:company_id },
		success: function(data){
			//console.log(data);
			$('#certi_table').html(data);				
			Unloading();
		}		
	});
}

function delete_data_image(id)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/setting/',
				data: { mode : "delete_data_image",  eid : id },
				success: function(response)
				{
					console.log(response)
					var data=jQuery.parseJSON(response)
					var response=data.res;
					if(response.trim() == "1") {
						toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
						show_images_data();
						Unloading();
					}
					else if(response.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}							
				}
			});	
		}
	
}


function add_bank()
{
	if($("#c_b_name").val()==""){
		toastr.warning("Select Account Number", "ERROR");
		$("#c_b_name").focus();
		return false;
	}
	else if($("#c_b_branch").val()==""){
		toastr.warning("Select bank branch", "ERROR");
		$("#c_b_branch").focus();
		return false;
	}
	else if($("#c_b_ifsc").val()==""){
		toastr.warning("Select bank IFSC", "ERROR");
		$("#c_b_ifsc").focus();
		return false;
	}
	else if($("#c_b_acno").val()==""){
		toastr.warning("Select bank Account No.", "ERROR");
		$("#c_b_acno").focus();
		return false;
	}
	
	var c_b_name=$('#c_b_name').val();
	var c_b_branch=$('#c_b_branch').val();
	var c_b_ifsc=$('#c_b_ifsc').val();
	var c_b_acno=$('#c_b_acno').val();
	var cust_id=$('#eid').val();
	var edit_id=$('#edit_id').val();
	
	Loading();	
	$.ajax({
		type: "POST",
		url: root_domain+'app/setting/',
		data: { mode : "add_bank_name",edit_id:edit_id,c_b_name:$("#c_b_name").val(),c_b_branch:$("#c_b_branch").val(),c_b_ifsc:$("#c_b_ifsc").val(),c_b_acno:$("#c_b_acno").val(),cust_id:cust_id },
		success: function(response)
		{
			console.log(response);
			$("#c_b_name").val("");
			$("#c_b_branch").val("");
			$("#c_b_ifsc").val("");
			$("#c_b_acno").val("");
			$("#add_bank_bt").val("Add");
			Unloading();
			show_bank_data();
			
		}
	});
	
}

function show_bank_data()
{
	var cust_id=$('#eid').val();
	//var mode=$('#mode').val();
	//alert(cust_id);
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/setting/',
		data: { mode : "load_bank_detail", comp_id:cust_id },
		success: function(data){
			//alert(data);
			//console.log(data);
			$('#table_bank_details').html(data);				
			Unloading();
		}		
	});
}

function edit_data_bank(id)
{
	//var form_mode=$("#jobwork_outward_add #mode").val();
	//alert(id);
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/setting/',
		data: { mode : "preedit_bank",  id : id },
		success: function(response)
		{
			//alert(response);
			console.log(response);
			var data = jQuery.parseJSON(response);
			$('#c_b_name').val(data.c_b_name);
			$('#c_b_branch').val(data.c_b_branch);
			$("#c_b_ifsc").val(data.c_b_ifsc);
			$("#c_b_acno").val(data.c_b_acno);
			
			//$("#outward_product_amount").val(data.outward_product_amount);
			$("#edit_id").val(id);
			$("#add_bank_bt").val("Update");
			/*if(form_mode=='Edit'){
				load_stock(data.raw_product_id,data.outward_product_qty)
			}else{
				load_stock(data.raw_product_id,0)
			}*/
			show_bank_data();
			Unloading();
		}
	});
}


function delete_data_bank(id)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/setting/',
				data: { mode : "delete_data_bank",  eid : id },
				success: function(response)
				{
					console.log(response)
					var data=jQuery.parseJSON(response)
					var response=data.res;
					if(response.trim() == "1") {
						toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
						show_bank_data();
						Unloading();
					}
					else if(response.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}

					show_bank_data();					
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