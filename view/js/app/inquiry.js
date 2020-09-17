
$(document).ready(function() {
	load_inquiry_datatable();
	show_data();
	show_inq_note_data();
	show_inq_attach_data();
        var opp_id = $('#opp_id').val();
        validate_close_reason(opp_id);
	
	// validate vendor add form on keyup and submit
	$("#inquiry_add").validate({
		rules: {
			inquiry_date: {
				required: true			
			},
			cust_id: {
				required: true			
			},
			inquiry_name: {
				required: true			
			},
			opp_id: {
				required: true			
			},
                        task_due_date: {
				required: true
			}
		},
		messages: {
			inquiry_date: {
				required: "Enter Inquiry Date"
			},
			cust_id: {
				required: "Choose Customer"
			},
			inquiry_name: {
				required: "Enter Oppotunity Name"
			},
			opp_id: {
				required: "Choose Stage"
			},
                        task_due_date: {
                                required: "Choose Task Due Date"
                        }
		}
	}); 
}); 

$("#inquiry_add").on('submit',function(e) {
	var form = this;
	e.preventDefault();
	e.stopPropagation();	
	if (!$("#inquiry_add").valid()) {
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
		url: root_domain+'app/inquiry/',
		type: "POST",
		data: form_data,
		contentType: false,
		processData:false,
		success: function(response)
		{
			console.log(response);	
			var arr = jQuery.parseJSON(response);			
			if(arr.msg == '1') {
				toastr.success("INQUIRY ADDED SUCCESSFULLY", "SUCCESS");
				window.location=root_domain+'inquiry_list';
			}
			else if(arr.msg == '0') {
				toastr.warning("SOMETHING WRONG", "ERROR");
			}
			else if(arr.msg == '-1') {
				toastr.info("ALREADY EXISTS", "INFO");
			}
			else if(arr.msg == 'update') {	
				toastr.success("INQUIRY UPDATED SUCCESSFULLY", "SUCCESS");		
				window.location=root_domain+'inquiry_list';	
			}
			Unloading();
			$('#inquiry_add').trigger('reset');	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
		}
	});
	
});
function load_inquiry_datatable(){
	//var status=$('input[name=approved_status]:Checked').val();
	var start_date = $('#start_date').val();
        var end_date = $('#end_date').val();
        var stage_id = $('#stage_id').val();
	var sales_stage_id = $('#sales_stage_id').val();
        var source_id = $('#source_id').val();
        //var assign_user_id = $('#assign_user_id').val();
        var user_id = $('#user_id').val();
        
	$("#inquiry-table").dataTable({
                "bStateSave": true,
                "fixedHeader": true,
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
		"sAjaxSource": root_domain+'app/inquiry/',
		"fnServerParams": function ( aoData ) {
			aoData.push( {"name": "mode", "value": "fetch"}, 
                                    {"name": "user_id", "value": user_id},
                                    {"name": "stage_id", "value": stage_id},
                                    {"name": "sales_stage_id", "value": sales_stage_id},
                                    {"name": "source_id", "value": source_id},
                                    {"name": "start_date", "value": start_date},
                                    {"name": "end_date", "value": end_date});
		},
		"fnDrawCallback": function( oSettings ) {
			$('.ttip, [data-toggle="tooltip"]').tooltip();
		}
	}).fnSetFilteringDelay();
	
	//Search input style
	$('.dataTables_filter input').addClass('form-control').attr('placeholder','Search');
	$('.dataTables_length select').addClass('form-control');
}

function delete_inquiry(inquiry_id,inquiry_no) 
{
	var r= confirm(" Are you sure, you want to delete '"+inquiry_no+"' ?");
	if(r) {
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/inquiry/',
			data: { mode : "delete",  inquiry_id : inquiry_id },
			success: function(response)
			{
                            //console.log(response);
                            if(response.trim() == "1") {
                                    toastr.success("INQUIRY DELETE SUCCESSFULLY", "SUCCESS");
                                    load_inquiry_datatable();
                            }
                            else if(response.trim() == "0") {
                                    toastr.warning("SOMETHING WRONG", "WARNING");
                            }	
                            Unloading();						
			}
		});	
	} 
}
function load_opp_stage_prob(opp_id){
	if(opp_id){
		$.ajax({
			type: "POST",
			url: root_domain+'app/opp_mst/',
			data: { mode:"load_opp_stage_prob", opp_id:opp_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				$('#stage_prob').val(resp.opp_probability);
                                validate_close_reason(opp_id);
			}
		});
                
                
	}
        
}
function validate_close_reason(opp_id){
    if(opp_id === '4' || opp_id === '8'){
                    $('#closed_reason_div').show();
                    $('#inquiry_add').validate({
                            rules: {
                                    closed_reason: {
                                            required: true			
                                    }
                            },
                            messages: {
                                    closed_reason: {
                                            required: "Write Reason to close."
                                    }
                            }
                    });
                } else {
                    $('#closed_reason_div').hide();
                }
}
function add_inq_attch_field()
{
	if(!$("#inq_attch_doc_name").val()){		
		toastr.warning("Enter Document Name", "ERROR");
		$("#inq_attch_doc_name").focus();
		return false;
	}
	else if(!$("#inq_attch_file").val()){
		toastr.warning("Choose File", "ERROR");
		$("#inq_attch_file").focus();
		return false;
	}
	
	Loading();
	var form_data = new FormData();
	form_data.append('mode', "add_inq_attch_field");
	form_data.append('inquiry_id', $("#eid").val());
	form_data.append('inq_attch_doc_name', $("#inq_attch_doc_name").val());
	form_data.append("inq_attch_file", document.getElementById('inq_attch_file').files[0]);
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: form_data,
		contentType: false,
		processData: false,
		success: function(response)
		{
			//console.log(response);
			$("#inq_attch_doc_name").val("").focus();
			$("#inq_attch_file").val("");
			$('#inq_attch_btn').val('Add');
			Unloading();
			show_inq_attach_data();
		}
	});
}
function show_inq_attach_data() {
	var eid = $('#eid').val();
	var chkmode = $('#mode').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode : "show_inq_attach_data", inquiry_id:eid,modee:chkmode },
		success: function(resp){
			//console.log(resp);
			$('#inq_attch_trn_div').html(resp);
			Unloading();
		}		 
	}); 
}
function delete_inq_attach_data(inq_attach_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/inquiry/',
			data: { mode:"delete_inq_attach_data", inq_attach_id:inq_attach_id },
			success: function(response)
			{
				//console.log(response);
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_inq_attach_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
}

function add_inq_note_field()
{
	if(!$("#inq_note_title").val()){		
		toastr.warning("Enter Note Title", "ERROR");
		$("#inq_note_title").focus();
		return false;
	}
	else if(!$("#inq_note_desc").val()){
		toastr.warning("Enter Description", "ERROR");
		$("#inq_note_desc").focus();
		return false;
	}
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode : "add_inq_note_field", edit_inq_noteid:$("#edit_inq_noteid").val(),inq_note_title:$("#inq_note_title").val(),inq_note_desc:$("#inq_note_desc").val(),inquiry_id:$("#eid").val() },
		success: function(response)
		{
			//console.log(response);
			$("#inq_note_title").val("");
			$("#inq_note_desc").val("");
			$("#edit_inq_noteid").val("");
			$('#inq_note_btn').val('Add');
			Unloading();
			show_inq_note_data();
		}
	});
}
function show_inq_note_data() {
	var eid = $('#eid').val();
	var modee = $('#mode').val();
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode : "show_inq_note_data", inquiry_id:eid,chkmode:modee },
		success: function(resp){
			//console.log(resp);
			$('#inq_notes_trn_div').html(resp);
			Unloading();
		}		 
	}); 
}
function edit_inq_note_data(inq_note_id)
{ 
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode:"edit_inq_note_data", inq_note_id:inq_note_id },
		success: function(response)
		{
			//console.log(response)
			var resp = jQuery.parseJSON(response);
			$("#inq_note_title").val(resp.inq_note_title);
			$("#inq_note_desc").val(resp.inq_note_desc);
			$("#edit_inq_noteid").val(inq_note_id);
			$('#inq_note_btn').val('Update');
			Unloading();
		}
	});
}
function delete_inq_note_data(inq_note_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/inquiry/',
			data: { mode:"delete_inq_note_data", inq_note_id:inq_note_id },
			success: function(response)
			{
				//console.log(response);
				var data=jQuery.parseJSON(response);
				var response=data.res;
				if(response.trim() == "1") {
					toastr.success("DATA DELETE SUCCESSFULLY", "SUCCESS");
					show_inq_note_data();
				}
				else if(response.trim() == "0") {
					toastr.warning("SOMETHING WRONG", "WARNING");
				}	
				Unloading();						
			}
		});	
	}
}
function get_amount()
{	
	var product_qty = parseFloat($("#product_qty").val());
	var product_rate = parseFloat($("#product_rate").val());
	if(product_qty && product_rate && product_qty!='0' && product_rate!='0')
	{
		var product_amount=parseFloat((product_qty)*(product_rate));
		$("#product_amount").val(product_amount);
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
		cat_id:$("#cat_id").val(), 
		pg_id:$("#pg_id").val(), 
		level_id:$("#level_id").val(), 
		product_qty:$("#product_qty").val(), 
		unitid:$("#unitid").val(), 
		product_rate:$("#product_rate").val(), 
		product_amount:$("#product_amount").val(), 
		product_desc:$("#product_desc").val(), 
		product_spec:$("#product_spec").val(), 
		inquiry_id:$("#eid").val()
	};
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: form_data,
		success: function(response)
		{
			//console.log(response);
			$("#product_id").select2("val","");
			$("#cat_id").select2("val","");
			$("#pg_id").select2("val","");
			$("#level_id").select2("val","1");
			$("#unitid").select2("val","");
			$("#product_qty").val("");
			$("#product_rate").val("");
			$("#product_amount").val("");
			$("#product_desc").val("");
			$("#product_spec").val("");
			$("#edit_id").val("");
			$('#inq_trn_btn').html('Add');
			Unloading();
			show_data();
		}
	});
}
function show_data() {
    	var eid = $('#eid').val();
	var modee = $('#mode').val();
	
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode : "show_data", inquiry_id:eid,modee:modee },
		success: function(resp){
			//console.log(resp);
			$('#inq_trn_div').html(resp);
			Unloading();
			get_amount();
		}		 
	}); 
}
function edit_trn_data(inquiry_trn_id)
{ 
	Loading();
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode:"edit_trn_data", inquiry_trn_id:inquiry_trn_id },
		success: function(response)
		{
			//console.log(response);
			var resp = jQuery.parseJSON(response);
			$("#product_id").select2("val",resp.product_id);
			$("#cat_id").select2("val",resp.cat_id);
			$("#pg_id").select2("val",resp.pg_id);
			$("#level_id").select2("val",resp.level_id);
			$("#unitid").select2("val",resp.unitid);
			$("#product_qty").val(resp.product_qty);
			$("#product_rate").val(resp.product_rate);
			$("#product_amount").val(resp.product_amount);
			$("#product_desc").val(resp.product_desc);
			$("#product_spec").val(resp.product_spec);
			$("#edit_id").val(inquiry_trn_id);
			$('#inq_trn_btn').html('Update');
			Unloading();
		}
	});
}
function delete_trn_data(inquiry_trn_id)
{
	var r= confirm(" Are you want to delete ?");
	if(r) {
		Loading();
		$.ajax({
			type: "POST",
			url: root_domain+'app/inquiry/',
			data: { mode:"delete_trn_data", inquiry_trn_id:inquiry_trn_id },
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
			url: root_domain+'app/inquiry/',
			data: { mode:"load_product_dtls", product_id:product_id },
			success: function(response)
			{
				//console.log(response);
				var resp=jQuery.parseJSON(response);
				$('#cat_id').select2("val",resp.product_cat);
				$('#pg_id').select2("val",resp.product_group);
				$('#product_desc').val(resp.product_desc);
				Unloading();						
			}
		});	
	}
}
function copy_inq_name() {
	if($('#cust_id').val())
	{
		$('#inquiry_name').val("@"+$('#cust_id option:selected').text());
	}
}
function view_followup_hist(inquiry_id) 
{
	if(inquiry_id){
		Loading(true);
		$.ajax({
			type: "POST",
			url: root_domain+'app/inquiry/',
			data: { mode : "view_followup_hist", inquiry_id:inquiry_id },
			success: function(response)
			{
				//console.log(response);
				var resp=JSON.parse(response);
				$('#preview_flp_hist_modal').modal('show');
				$('#preview_flp_hist_div').html(resp.html_resp);
                                $('#preview_flp_hist_inq_name').html(resp.inq_name);
				Unloading();
			}
		});
	}
}
function open_add_task_popup(inquiry_id, entry_type){
    if(inquiry_id){
        $.ajax({
            type: "POST",
            url: root_domain+'app/add_task_popup/add_task_popup',
            data: { inquiry_id : inquiry_id, entry_type : entry_type },
            success: function(response)
            {
                $('#task_model_popup').html(response);
                $('#add_task_modal').modal('show');
            }
        });
    }
}

function open_inq_email(inquiry_id,cust_id){
	$('#send_email_modal').modal("show");
	$('#email_ref_id').val(inquiry_id);
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/inquiry/',
		data: { mode : "open_inq_email", inquiry_id:inquiry_id, cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response);
			$('#to_email_id').val(obj.to_email_id);
			$('#ccemail_id').val("");
			$('#bccemail_id').val("");
			CKEDITOR.instances['email_content'].setData(obj.email_content)
			$('#email_subject').val("Thank You For Your Inquiry");
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
		url: root_domain+'app/inquiry/',
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
				load_inquiry_datatable();
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

function preview_cust_person(){
	var cust_id = $('#cust_id').val();
	if(!cust_id){
		toastr.warning("Choose Customer!!!", "ERROR");
		$('#cust_id').select2('focus');
		return false;
	}
	
	Loading(true);
	$.ajax({
		type: "POST",
		url: root_domain+'app/customer/',
		data: { mode : "preview_cust_person", cust_id:cust_id },
		success: function(response)
		{
			//console.log(response);
			var obj =jQuery.parseJSON(response);
			$('#preview_cust_person_modal').modal("show");
			$('#preview_cust_person_modal_div').html(obj.html_resp);
			Unloading();
		}
	});
}

function preview_company(){
    var cust_id = $('#cust_id').val();
    if(!cust_id){
            toastr.warning("Choose Company!!!", "ERROR");
            $('#cust_id').select2('focus');
            return false;
    }
	
    Loading(true);
    $.ajax({
        type: "POST",
        url: root_domain+'app/customer/',
        data: { mode : "preview_company", cust_id:cust_id },
        success: function(response)
        {
            //console.log(response);
            var obj =jQuery.parseJSON(response);
            $('#preview_company_modal').modal("show");
            $('#preview_company_modal_div').html(obj.html_resp);
            Unloading();
        }
    });
}