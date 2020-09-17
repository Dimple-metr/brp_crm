$(document).ready(function() {
		reload_data();
});
function reload_data()
{
	generate_report();
}

function generate_report() 
{
	Loading(true);	
	$.ajax({
		type: "POST",
		url: root_domain+'app/yearly_summary/',
		data: { mode : "generate_report"},
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