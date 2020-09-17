<?php

session_start(); //start session
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include_once("../../include/coman_function.php");

//print_r($_POST);
//print_r($_FILES);
if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}
	if(strtolower($POST['mode']) == "generate_report") {
		$s_date=explode(' - ',$POST['date']);
		$str='';$whr='';
		$str.='<table class="display table table-bordered table-striped">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Created Date</th>				  
						<th>Modified  Date</th>				  
						<th>Owner</th>				  
						<th>Territory</th>				  
						<th>Inquiry No</th>				  
						<th>Opportunity Name</th>				  
						<th>Customer Name</th>				  
						<th>Customer Type</th>				  
						<th>Type</th>				  
						<th>Source</th>				  
						<th>Industry</th>				  
						<th>Stage</th>				  
						<th>Amount</th>				  
						<th>Close Date</th>						  
						<th>Inquiry Category</th>				  
						<th>Sales Stage</th>	  
						<th>Desc</th>				  
						<th>Competition Status</th>					  
					</tr>
				</thead>
				<tbody>';
	
	$whr.=" and inq.inquiry_date between '".date("Y-m-d",strtotime($s_date[0]))."' and '".date("Y-m-d",strtotime($s_date[1]))."'";
	
	if($POST['t_id']){
		$whr.=' and inq.t_id='.$POST['t_id'];
	}
	
	
$c=1;
$qry="SELECT inq.*,usr.user_name,ter.t_name,cust.cust_name,stage.opp_stage,src.rb_name,ind.ci_name,inq_cat.mcd_name as inq_cat_name,inq_sale_stage.mcd_name as inq_sale_stage_name,inq_type.mcd_name as inq_type_name,cur.currency_code,IF((select count(cust_id) from tbl_inquiry where inquiry_status=0 and cust_id=inq.cust_id)>1, 'Existing Customer', 'New Customer') as ctype from tbl_inquiry as inq
left join users as usr on usr.user_id=inq.user_id
left join territory_mst as ter on ter.t_id=inq.t_id
left join tbl_customer as cust on cust.cust_id=inq.cust_id
left join tbl_opportunity_mst as stage on stage.opp_id=inq.opp_id
left join tbl_refer_by as src on src.rb_id=inq.rb_id
left join tbl_customer_industry as ind on ind.ci_id=cust.cust_ind
left join tbl_master_category_detail as inq_type on inq_type.mcd_id=inq.inquiry_type_id
left join tbl_master_category_detail as inq_cat on inq_cat.mcd_id=inq.inquiry_cat_id
left join tbl_master_category_detail as inq_sale_stage on inq_sale_stage.mcd_id=inq.sales_stage_id
left join tbl_currency as cur on cur.currency_id=inq.currency_id
WHERE inq.inquiry_status=0".$whr." order by inq.inquiry_date";
	$qry_rs=$dbcon->query($qry);
	if(mysqli_num_rows($qry_rs)){
		while($rel=mysqli_fetch_assoc($qry_rs)){
			$closing_date='';
			if($rel['closing_date']!='1970-01-01' && $rel['closing_date']!='0000-00-00'){
				$closing_date=date("d-m-Y",strtotime($rel['closing_date']));
			}
			
			$str.='<tr>
				<td class="text-left">'.$c.'</td>
				<td class="text-left" style="white-space:nowrap;">'.date("d-m-Y h:i A",strtotime($rel['create_date'])).'</td>
				<td class="text-left" style="white-space:nowrap;">'.date("d-m-Y h:i A",strtotime($rel['cdate'])).'</td>
				<td class="text-left">'.$rel['user_name'].'</td>
				<td class="text-left">'.$rel['t_name'].'</td>
				<td class="text-left">'.$rel['inquiry_no'].'</td>
				<td class="text-left">'.$rel['inquiry_name'].'</td>
				<td class="text-left">'.$rel['cust_name'].'</td>
				<td class="text-left">'.$rel['ctype'].'</td>
				<td class="text-left">'.$rel['inq_type_name'].'</td>
				<td class="text-left">'.$rel['rb_name'].'</td>
				<td class="text-left">'.$rel['ci_name'].'</td>
				<td class="text-left">'.$rel['opp_stage'].'</td>
				<td class="text-left">'.$rel['g_total'].' '.$rel['currency_code'].'</td>
				<td class="text-left" style="white-space:nowrap;">'.$closing_date.'</td>
				<td class="text-left">'.$rel['inq_cat_name'].'</td>
				<td class="text-left">'.$rel['inq_sale_stage_name'].'</td>
				<td class="text-left">'.nl2br($rel['inq_desc']).'</td>
				<td class="text-left">'.nl2br($rel['inq_comp_desc']).'</td>
			</tr>';
			$c++;
		}
	}
	else{
		$str.='<tr><td colspan="20" class="text-center">NO DATA FOUND !!!</td></tr>';
	}
		
		$str.='</tbody>				 
			</table>';
		
		$resp['html_resp']=$str;
		echo json_encode($resp);
	}
?>