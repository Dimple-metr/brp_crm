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
						<th>Product Name</th>				  
						<th>Product Category</th>				  
						<th>Product Group</th>				  
						<th>Product Brand</th>				  
						<th>Quantity</th>				  
						<th>Amount</th>				  
						<th>Customer Name</th>				  
						<th>Inquiry No</th>				  
						<th>Opportunity Name</th>				  
						<th>Owner</th>				  
						<th>Territory</th>				  
						<th>Created Date</th>				  
						<th>Modified Date</th>				  
						<th>Type</th>				  
						<th>Stage</th>				  
						<th>Close Date</th>				  
						<th>Category</th>				  
						<th>Sales Stage</th>				  
						<th>Desc.</th>				  
						<th>Competition Status</th>				  
					</tr>
				</thead>
				<tbody>';
	
	$whr.=" and inq.inquiry_date between '".date("Y-m-d",strtotime($s_date[0]))."' and '".date("Y-m-d",strtotime($s_date[1]))."'";
	if($POST['user_id']){
		$whr.=' and inq.user_id='.$POST['user_id'];
	}
	if($POST['t_id']){
		$whr.=' and inq.t_id='.$POST['t_id'];
	}
	if($POST['product_cat']){
		$whr.=' and pro.product_cat='.$POST['product_cat'];
	}
	if($POST['product_brand']){
		$whr.=' and pro.product_brand='.$POST['product_brand'];
	}
	
	$pro_id=array_filter($POST['product_id']);
	if($pro_id){
		$pro_id=implode(",",$pro_id);
		$whr.=' and trn.product_id in('.$pro_id.')';
	}
	
$c=1;
$qry="SELECT trn.*,pro.product_name,grp.pg_name,brand.pb_name,cat.cat_name,cust.cust_name,inq.inquiry_no,inq.inquiry_name,usr.user_name,ter.t_name,inq_type.mcd_name as inq_type_name,stage.opp_stage,inq.closing_date,inq.create_date,inq.cdate,inq_cat.mcd_name as inq_cat_name,inq_sale_stage.mcd_name as inq_sale_stage_name,inq.inq_desc,inq.inq_comp_desc from tbl_inquiry_trn as trn
left join tbl_inquiry as inq on inq.inquiry_id=trn.inquiry_id
left join tbl_customer as cust on cust.cust_id=inq.cust_id
left join users as usr on usr.user_id=inq.user_id
left join territory_mst as ter on ter.t_id=inq.t_id
left join tbl_master_category_detail as inq_type on inq_type.mcd_id=inq.inquiry_type_id
left join tbl_opportunity_mst as stage on stage.opp_id=inq.opp_id
left join tbl_master_category_detail as inq_cat on inq_cat.mcd_id=inq.inquiry_cat_id
left join tbl_master_category_detail as inq_sale_stage on inq_sale_stage.mcd_id=inq.sales_stage_id
left join tbl_product as pro on pro.product_id=trn.product_id
left join tbl_category as cat on cat.cat_id=pro.product_cat
left join tbl_product_grp as grp on grp.pg_id=trn.pg_id
left join tbl_product_brand as brand on brand.pb_id=pro.product_brand
WHERE trn.inquiry_trn_status=0 and inq.inquiry_status=0 ".$whr." order by inquiry_date";
	$qry_rs=$dbcon->query($qry);
	if(mysqli_num_rows($qry_rs)){
		while($rel=mysqli_fetch_assoc($qry_rs)){
			$closing_date='';
			if($rel['closing_date']!='1970-01-01' && $rel['closing_date']!='0000-00-00'){
				$closing_date=date("d-m-Y",strtotime($rel['closing_date']));
			}
			
			$str.='<tr>
				<td class="text-left">'.$c.'</td>
				<td class="text-left">'.$rel['product_name'].'</td>
				<td class="text-left">'.$rel['cat_name'].'</td>
				<td class="text-left">'.$rel['pg_name'].'</td>
				<td class="text-left">'.$rel['pb_name'].'</td>
				<td class="text-left">'.$rel['product_qty'].'</td>
				<td class="text-left">'.$rel['product_amount'].'</td>
				<td class="text-left">'.$rel['cust_name'].'</td>
				<td class="text-left">'.$rel['inquiry_no'].'</td>
				<td class="text-left">'.$rel['inquiry_name'].'</td>
				<td class="text-left">'.$rel['user_name'].'</td>
				<td class="text-left">'.$rel['t_name'].'</td>
				<td class="text-left" style="white-space:nowrap;">'.date("d-m-Y h:i A",strtotime($rel['create_date'])).'</td>
				<td class="text-left" style="white-space:nowrap;">'.date("d-m-Y h:i A",strtotime($rel['cdate'])).'</td>
				<td class="text-left">'.$rel['inq_type_name'].'</td>
				<td class="text-left">'.$rel['opp_stage'].'</td>
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