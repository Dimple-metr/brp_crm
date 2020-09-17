var datatable;
$(document).ready(function() {
	load_pro_tbl(); 
	show_data_serial();
	show_data_model();
	show_data_spec();
	show_ven_hist();
// validate the comment form when it is submitted        

// validate vendor add form on keyup and submit
$("#product_add").validate({
	rules: {
		product_name: {
			required: true
		},
		
	},
	messages: {
		product_name: {
			required: "Enter Product"
		},
		
	}
}); 
// validate vendor edit form on keyup and submit
$("#FormEditproduct").validate({
	rules: {
		edit_product_name: {
			required: true
		}
	},
	messages: {
		edit_product_name: {
			required: "Enter product",
		}
	}
});		
$("#product_importfile").validate({
	rules: {
		excel_file:{
			required:true
		}
	},
	messages: {
		excel_file: {
			required: "Select Product Csv file",
		}
	}
});
});
$("#product_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#product_add").valid()) {
		return false;
	}		
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	
	var token	=  $("#token").val();	
	
	var data = new FormData();
	
    data.append('file', $('#file').prop('files')[0]);
    data.append("mode",$('#mode').val());
    data.append("product_name",$('#product_name').val());
    data.append("item_code",$('#item_code').val());
    data.append("product_cat",$('#product_cat').val());
    data.append("product_group",$('#product_group').val());
    data.append("product_brand",$('#product_brand').val());
    data.append("product_type",$('#product_type').val());
    data.append("product_hsn",$('#product_hsn').val());
    data.append("product_desc",$('#product_desc').val());
    data.append("product_part",$('#product_part').val());
    data.append("productmst_rate",$('#product_mst_rate').val());
    data.append("product_purchase_mst_rate",$('#product_purchase_mst_rate').val());
    data.append("productmst_unitid",$('#product_mst_unitid').val());
    data.append("opening_stock",$('#opening_stock').val());
    data.append("minimum_stock",$('#minimum_stock').val());
    data.append("eid",$('#eid').val());
	
	$.ajax({
	   url: root_domain+'app/productmst/',
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
			if(data.trim() == '1') {				
				toastr.success("ADDED SUCCESSFULLY", "SUCCESS");
				
				Unloading();
				window.location=root_domain+'product_list';
			}
			else if(data.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(data.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			
		}
	  });
	
});
//var editReq = null;
$("#FormEditproduct").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();
	if (!$("#FormEditproduct").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading(true);	
	$(this).attr("disabled","disabled");		
	var form_data = {
		eid :$("#edit_id").val(),
		pro_type: $("input[name='editproType']:checked"). val(),
		product_name: $("#edit_product_name").val(),		
		product_alias_name: $("#edit_product_alias_name").val(),		
		product_des: $("#edit_product_des").val(),
		multi_company: $("#edit_multi_company").prop("checked") ? 1 : 0,		
		item_code: $("#edit_item_code").val(),		
		product_code: $("#edit_product_code").val(),		
		productmst_rate: $("#edit_productmst_rate").val(),		
		product_purchase_mst_rate: $("#edit_product_purchase_mst_rate").val(),		
		productmst_unitid: $("#edit_productmst_unitid").val(),		
		intra_tax: $("#edit_intra_tax").val(),		
		inter_tax: $("#edit_inter_tax").val(),
        opening_stock: $("#edit_opening_stock").val(),
        minimum_stock: $("#edit_minimum_stock").val(),		
        e_pr_valuation: $("#e_pr_valuation").val(),		
        e_p_category: $("#e_p_category").val(),		
		token:$("#edit_token").val(),
		mode:'edit',
		is_ajax: 1
	};	
	$.ajax({
		cache:false,
		url: root_domain+'app/productmst/',
		type: "POST",
		data: form_data,
		success: function(resnse)
		{
			console.log(resnse);
			
			if(resnse.trim() == '1') {
				toastr.success("product UPDATED SUCCESSFULLY", "SUCCESS");
				load_pro_tbl();
				Unloading();						
			}
			else if(resnse.trim() == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR")
				Unloading();
			}
			else if(resnse.trim() == '-1')
			{
				toastr.info("ALREADY EXISTS", "INFO")
				Unloading();				
			}
			$("#ModalEditAccount").modal("hide");					
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function delete_product(id) 
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading(true);
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "delete", token :  $("#token").val(), eid : id },
				success: function(resnse)
				{
					
					if(resnse.trim() == "1") {
						toastr.success("PRODUCT DELETE SUCCESSFULLY", "SUCCESS");
						load_pro_tbl();
					}
					else if(resnse.trim() == "-1") {
						toastr.error("USED PRODUCT CAN'T BE DELETED !!!", "WARNING"); 
					}
					else if(resnse.trim() == "0") {
						toastr.warning("SOMETHING WRONG", "WARNING");
					}	
					Unloading();						
				}
			});	
		}
	
}
function edit_product(id)
{
		Loading(true);
		editReq = $.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode : "preedit", id : id },
			success: function(resnse)
			{
				//console.log(resnse);
				var obj = jQuery.parseJSON(resnse);
				$("#ModalEditAccount").modal("show");
				$("#edit_id").val(id);		
				$("#edit_product_name").val(obj.product_name);
				$("#edit_product_desc").val(obj.product_desc);
				$("#edit_product_mst_rate").val(obj.product_mst_rate);
				$("#edit_rate").val(obj.product_rate);
				$("#edit_product_hsn_code").val(obj.product_hsn_code);
				$("#edit_item_code").val(obj.item_code);
				$("#edit_unitid").select2("val",obj.unitid);
				$("#edit_intra_tax").val(obj.intra_tax);
				$("#edit_inter_tax").val(obj.inter_tax);
				$("#edit_opening_stock").val(obj.product_stock);
				$("#edit_minimum_stock").val(obj.minimum_stock);
				if(obj.multi_company==1)
				{
					$("#edit_multi_company").prop('checked',true);
				}
				else
				{
					$("#edit_multi_company").prop('checked',false);
				}
				Unloading();
			}
		});	
}

function get_category_dropdown(sel_id)
{
	//alert(sel_id);
	var id = $('#edit_cat_id').val();
	//alert(id);
	Loading(true);
	editReq = $.ajax({
		type: "POST",
		url: root_domain+'app/categorymst/',
		data: { mode : "get_category_dropdown_data",id:id },
		success: function(response)
		{
			//alert(response);
			console.log(response);
			$('#'+sel_id).html(response);
			Unloading();
		}
	});	
}

$("#product_importfile").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#product_importfile").valid()) {
		return false;
	}
	form.submitted = true;	
	Loading();	
	$(this).attr("disabled","disabled");		
	var token	=  $("#token").val();	
	var form_data=new FormData(this);	
	$.ajax({
		cache:false,
		url: root_domain+'app/productmst/',
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
				$('#product_importfile').trigger('reset');
				Unloading();				
			}
			else if(response == '0')
			{
				$('#msg').html('<span style="color:red"> Coloums Does Not Match Please Check With demo File</span>');
				$('#product_importfile').trigger('reset');
				Unloading();				
			}
			else if(response == '3')
			{
				$('#msg').html('<span style="color:red"> Coloum Name Does Not Match Please Check With demo File</span>');
				$('#product_importfile').trigger('reset');
				Unloading();				
			}
			else if(response == '4')
			{
				$('#msg').html('<span style="color:green"> Data Import Successfully</span>');
				$('#product_importfile').trigger('reset');
				Unloading();				
			}
			else if(response == '5')
			{
				$('#product_importfile').trigger('reset');
				 $('#check_button').show();
				$('#mode').val('check_data');
				$('#import_button').hide();
				show_importedproduct_data();
				Unloading();				
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function show_importedproduct_data(total)
{
	Loading();
	$.ajax({
	type: "POST",
	url: root_domain+'app/productmst/',
	data: { mode : "show_importedcustdata"},
	success: function(responce){
				console.log(responce);
				Unloading();
				 $('#sampledata_show').show();
				$('#temp_productdata').html(responce);
				
			}
	});
				
}
function showtype(producttype){
	//alert(producttype);
	if(producttype== 'service'){
		$('#typepro').attr("style","display:none");
		
		$('#edittype').attr("style","display:none");
	}else{
	$('#typepro').attr("style","display:block");
	
	$('#edittype').attr("style","display:block");
	}
}
function reload(id){
	load_pro_tbl(id);
}

function load_pro_tbl(product_type){
	
	var datatable = $("#product-table").dataTable({
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
			"sAjaxSource": root_domain+'app/productmst/',
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

function add_serial()
{
	
	if($("#p_serial").val()===""){		
		toastr.warning("Select Serial No", "ERROR");
		$("#p_serial").select2('focus');
		return false;
	}
	
	//alert($('#p_serial').val());
	
	Loading();	
	$.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode : "add_serial",edit_id:$("#edit_id_serial").val(),product_id:$("#eid").val(),p_serial:$('#p_serial').val() },
			success: function(response)
			{
				//console.log(response);				
				$('#p_serial').val('');
				$('#ad_serial_btn').val('Add');
				Unloading();
				show_data_serial();
			
			}
		});
}





function edit_data_serial(id,table,whereid)
{
	//alert(id);
	//alert(table);
	//alert(whereid);
	Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "preedit_serial",  id : id ,table:table,whereid:whereid},
				success: function(response)
				{

					console.log(response);
					//alert(response);
					var data = jQuery.parseJSON(response);
					
					$("#p_serial").val(data.ps_serial_no)
					$("#edit_id_serial").val(id);
					$('#ad_serial_btn').val('Update');
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
				url: root_domain+'app/productmst/',
				data: { mode : "delete_data",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					show_data_serial()
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}

function show_data_serial()
{
	var product_id=$('#eid').val();
	Loading()
	$.ajax({
	type: "POST",
	url: root_domain+'app/productmst/',
	data: { mode : "load_serial_data" , product_id:product_id },
	success: function(data){
				
				//alert(data);
				//console.log(data);
				 $('#serial_table').html(data);				
				 Unloading();
		}		
		
	});
	
}


function add_model()
{
	
	if($("#p_model").val()===""){		
		toastr.warning("Select Serial No", "ERROR");
		$("#p_model").select2('focus');
		return false;
	}
	
	//alert($('#p_model').val());
	
	Loading();	
	$.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode : "add_model",edit_id:$("#edit_id_model").val(),product_id:$("#eid").val(),p_model:$('#p_model').val() },
			success: function(response)
			{
				//console.log(response);				
				$('#p_model').val('');
				$('#ad_model_btn').val('Add');
				Unloading();
				show_data_model();
			
			}
		});
}

function show_data_model()
{
	var product_id=$('#eid').val();
	Loading()
	$.ajax({
	type: "POST",
	url: root_domain+'app/productmst/',
	data: { mode : "load_model_data" , product_id:product_id },
	success: function(data){
				
				//alert(data);
				//console.log(data);
				 $('#model_table').html(data);				
				 Unloading();
		}		
		
	});
	
}



function edit_data_model(id,table,whereid)
{
	//alert(id);
	//alert(table);
	//alert(whereid);
	Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "preedit_model",  id : id ,table:table,whereid:whereid},
				success: function(response)
				{

					console.log(response);
					//alert(response);
					var data = jQuery.parseJSON(response);
					
					$("#p_model").val(data.pm_model_no)
					$("#edit_id_model").val(id);
					$('#ad_model_btn').val('Update');
					Unloading();
				}
			});
}

function delete_data_model(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "delete_model",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					show_data_model()
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}


function add_product_spec()
{
	
	if($("#p_priority").val()===""){		
		toastr.warning("Enter Priority", "ERROR");
		$("#p_priority").focus();
		return false;
	}
	
	
	if($("#p_spec").val()===""){		
		toastr.warning("Enter Specification", "ERROR");
		$("#p_spec").focus();
		return false;
	}
	
	if($("#p_value").val()===""){		
		toastr.warning("Enter Value", "ERROR");
		$("#p_value").focus();
		return false;
	}
	
	//alert($('#p_model').val());
	
	Loading();	
	$.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode : "add_product_spec",edit_id:$("#edit_id_spec").val(),product_id:$("#eid").val(),p_priority:$('#p_priority').val(),p_header:$('#p_header').val(),p_spec:$('#p_spec').val(),p_value:$('#p_value').val(),  },
			success: function(response)
			{
				//console.log(response);				
				$('#p_priority').val('');
				$('#p_header').val('');
				$('#p_spec').val('');
				$('#p_value').val('');
				
				$('#add_spec_btn').val('Add');
				Unloading();
				show_data_spec();
			
			}
		});
}

function show_data_spec()
{
	var product_id=$('#eid').val();
	Loading()
	$.ajax({
	type: "POST",
	url: root_domain+'app/productmst/',
	data: { mode : "load_spec_data" , product_id:product_id },
	success: function(data){
				
				//alert(data);
				//console.log(data);
				 $('#specs_table').html(data);				
				 Unloading();
		}		
		
	});
	
}


function edit_data_spec(id,table,whereid)
{
	//alert(id);
	//alert(table);
	//alert(whereid);
	Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "preedit_spec",  id : id ,table:table,whereid:whereid},
				success: function(response)
				{

					console.log(response);
					//alert(response);
					var data = jQuery.parseJSON(response);
					
					$("#p_priority").val(data.p_priority);
					$("#p_header").val(data.p_header);
					$("#p_spec").val(data.p_spec);
					$("#p_value").val(data.p_value);
					
					$("#edit_id_spec").val(id);
					$('#add_spec_btn').val('Update');
					Unloading();
				}
			});
}

function delete_data_spec(id,table,whereid)
{
	var r= confirm(" Are you want to delete ?");

		if(r) {
			Loading();
			$.ajax({
				type: "POST",
				url: root_domain+'app/productmst/',
				data: { mode : "delete_spec",  eid : id ,table:table,whereid:whereid,product_id:$("#eid").val() },
				success: function(response)
				{
				console.log(response)
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					
					show_data_spec()
					
					Unloading();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}							
				}
			});	
		}
	
}


function add_ven_hist()
{
	if($("#cust_id").val()==""){		
		toastr.warning("Choose Vendor !!", "ERROR");
		$("#cust_id").select2('focus');
		return false;
	}
	
	var form_data ={
		mode:"add_ven_hist", 
		edit_id:$("#edit_id_ven").val(),
		product_id:$("#eid").val(),
		cust_id:$('#cust_id').val(),
		ven_rate:$('#ven_rate').val(),
		ven_rmrk:$('#ven_rmrk').val() 
	};
	
	Loading();	
	$.ajax({
		type: "POST",
		url: root_domain+'app/productmst/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);				
			$('#cust_id').select2('val',"");
			$('#ven_rate').val('');
			$('#ven_rmrk').val('');
			$('#edit_id_ven').val('');
			
			$('#add_ven_btn').val('Add');
			Unloading();
			
			
			show_ven_hist();
			
		}
	});
}

function show_ven_hist()
{
	var product_id=$('#eid').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/productmst/',
		data: { mode : "show_ven_hist", product_id:product_id },
		success: function(resp){
			//console.log(resp);
			$('#ven_dtl_table').html(resp);				
			Unloading();
			
			/*$('html, body').animate({
				scrollTop: ($("#add_ven_btn").offset().top) - (160)
			}, 200);*/
		}	
	});
	
}

function edit_ven_hist(ven_hist_id)
{
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/productmst/',
		data: { mode : "edit_ven_hist", ven_hist_id:ven_hist_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#cust_id").select2("val",resp.cust_id);
			$("#ven_rate").val(resp.ven_rate);
			$("#ven_rmrk").val(resp.ven_rmrk);
			
			$("#edit_id_ven").val(ven_hist_id);
			$('#add_ven_btn').val('Update');
			Unloading();
		}
	});
}
function delete_ven_hist(ven_hist_id)
{
	var r= confirm(" Are you want to delete ?");

	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/productmst/',
			data: { mode : "delete_ven_hist", ven_hist_id:ven_hist_id },
			success: function(response)
			{
				//console.log(response);
				var data=jQuery.parseJSON(response)
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_ven_hist();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}
				Unloading();							
			}
		});	
	}
	
}