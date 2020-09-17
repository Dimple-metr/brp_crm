$(document).ready(function() {
	  	generate_report();
});
function generate_report() 
{
	Loading(true);
	var s_date=$('#from_date').val()
	var e_date=$('#to_date').val()
	
	$.ajax({
		type: "POST",
		url: root_domain+'app/lesar/',
		data: { mode : "generate_report", s_date:s_date, e_date : e_date},
		success: function(response)
		{
			console.log(response);
			if(response != "") {
				
				$('#adv-table').html(response);
				Unloading();
			}
										
		}
	});	

}
