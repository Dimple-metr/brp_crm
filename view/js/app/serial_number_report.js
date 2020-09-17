
function reload_data()
{
	generate_report();
}

function generate_report() 
{
	var search_serial_no=$("#search_serial_no").val();
	var product_id=$("#product_id").val();
	var date=$("#rep_date").val();
	
	if(search_serial_no=="" && product_id==""){
		toastr.warning("Select Product Or Serial Number.", "ERROR")
		return false;
	}
	
	if(search_serial_no!="" || product_id!="")
	{
		Loading();
		
		$.ajax({
			type: "POST",
			url: root_domain+'app/serial_number_report/',
			data: { mode : "generate_report", search_serial_no : search_serial_no, product_id : product_id, date:date },
			success: function(response)
			{
				//console.log(response);
				if(response != "") {
					$('#adv-table').html(response);
					Unloading();
				}
											
			}
		});	
	}
}