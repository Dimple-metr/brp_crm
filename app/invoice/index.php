<?php

session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");

if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}
	
	if(strtolower($POST['mode']) == "fetch") {
		$edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);
		$delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);

		$s_date=explode(' - ',$POST['date']);
		$_SESSION['start']=$s_date[0];
		$_SESSION['end']=$s_date[1];
		
		$where=''; 
		$where.="  and invoice_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND invoice_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('inv.invoice_id','inv.invoice_no','inv.invoice_date','so.sales_order_no','vender.cust_name','inv.g_total','inv.status','inv.cdate','inv.userid');
		$sIndexColumn = "invoice_id";
		$isWhere = array("inv.status = 0".$where.check_user('inv'));
		$sTable = "tbl_invoice as inv";
		$isJOIN = array('left join tbl_customer vender on inv.cust_id=vender.cust_id', 'left join tbl_sales_order as so on so.sales_order_id=inv.sales_order_id');
		$hOrder = "inv.invoice_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['invoice_no'];
			$row_data[] = date('d M, Y',strtotime($row['invoice_date']));
			$row_data[] = $row['sales_order_no'];
			$row_data[] = $row['cust_name'];
			$row_data[] = $row['g_total'];
			
			$delete='';$edit='';$print_btn='';
			if($edit_btn_per){
				$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'invoice_edit/'.$row['invoice_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_invoice('.$row['invoice_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$print_btn='<a class="btn btn-xs btn-primary" data-original-title="Print Invoice" data-toggle="tooltip" data-placement="top" href="'.ROOT.'invoice_print/'.$row['invoice_id'].'"><i class="fa fa-print"></i></a>';
			
			$row_data[] = $print_btn.' '.$edit.' '.$delete;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE type_id=8 and company_id=".$_SESSION['company_id']);

		$info['sales_order_id']	= $POST['sales_order_id'];
		$info['invoice_no']		= $POST['invoice_no'];
		$info['invoice_date']	= date('Y-m-d',strtotime($POST['invoice_date']));
		$info['challan_no']		= $POST['challan_no'];
		$info['challan_date']	= date('Y-m-d',strtotime($POST['challan_date']));
		$info['cust_id']	= $POST['cust_id'];
		$info['round_off']	= $POST['round_off'];
		$info['remark']		= $_POST['remark'];
		$info['g_total']	= $POST['g_total'];
		$info['currency_id']	= $POST['currency_id'];
		$info['inv_cust_address']	= $_POST['inv_cust_address'];
		$info['inv_ship_address']	= $_POST['inv_ship_address'];
		
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['userid']			= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$inserpoid=add_record('tbl_invoice', $info, $dbcon);
		
		/*Update Data in Trn Table Start*/
		if($inserpoid){
			$infotrn['invoice_id']			= $inserpoid;
			$infotrn['invoice_trn_status']		= 0;
			$updatetrnid=update_record('tbl_invoice_trn', $infotrn,"invoice_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		
		/** Purchase Order Entry Start ***/
		if($POST['sales_order_id']){
			$info_so['invoice_done_status']  = 1;
			$info_so['used_invoice_id'] = $inserpoid;
			$updatepurchaseid=update_record('tbl_sales_order', $info_so,"sales_order_id=".$POST['sales_order_id'], $dbcon);
		}
		/** Purchase Order Entry End ***/
		
		if($inserpoid) {	
			$arr['msg']="1";							
		}
		else
			$arr['msg']="0";
	
		echo json_encode($arr);		 
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['invoice_no']		= $POST['invoice_no'];
		$info['invoice_date']	= date('Y-m-d',strtotime($POST['invoice_date']));
		$info['challan_no']		= $POST['challan_no'];
		$info['challan_date']	= date('Y-m-d',strtotime($POST['challan_date']));
		$info['cust_id']		= $POST['cust_id'];
		$info['round_off']		= $POST['round_off'];
		$info['remark']			= $_POST['remark'];
		$info['g_total']		= $POST['g_total']; 
		$info['currency_id']		= $POST['currency_id']; 
		$info['inv_cust_address']	= $_POST['inv_cust_address'];
		$info['inv_ship_address']	= $_POST['inv_ship_address'];
		
		$info['cdate']				= 	date("Y-m-d H:i:s");
		$info['userid']			= $_SESSION['user_id'];
		$updateid=update_record('tbl_invoice', $info,"invoice_id=".$POST['eid'] , $dbcon);

		if($updateid) {	
			$arr['msg']="update"; 
		}
		else
			$arr['msg']=0;
	
		echo json_encode($arr);	
		
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['status']		= 2;
		$info1['invoice_trn_status']		= 2;
		$updateinvoiceid=update_record(' tbl_invoice', $info,"invoice_id=".$POST['eid'] , $dbcon);	
		$updatetrancationid=update_record('tbl_invoice_trn', $info1,"invoice_id=".$POST['eid'] , $dbcon);				
		
		// Update Purchase Order Status
		$info_so['invoice_done_status']  = 0;
		$updatepurchaseid=update_record('tbl_sales_order', $info_so,"used_invoice_id=".$POST['eid'], $dbcon);
	
		
		if($updatetrancationid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode'])== "load_sales_order") {
		echo get_sales_order_invoice($dbcon,$POST['cust_id'],"","Add");
	}
	else if(strtolower($POST['mode'])== "load_sales_order_data") {
		$resp['pro_html']	= get_sales_order_data($dbcon,$POST['sales_order_id']);
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "loadsales_productdata") {
		$q = $dbcon -> query("SELECT * from tbl_sales_order_trn where sales_order_id=".$POST['sales_order_id']." and so_trn_status=0 and product_id=".$POST['product_id']." ");
		$resp = $q->fetch_assoc();
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "load_productdata") { 
		/*$qry="select popro.*,com.stateid as com_stateid,ven.stateid as ven_stateid from `tbl_product` as popro left join `tbl_company` as com on com.company_id=".$_SESSION['company_id']." left join tbl_customer as ven on ven.cust_id=".$POST['cust_id']." where product_id=".$POST['eid'];*/
		$qry="select * from `tbl_product` where product_id=".$POST['eid'];
		$result=$dbcon->query($qry);
		$row=mysqli_fetch_assoc($result);
		echo json_encode( $row );
	}
	else if(strtolower($POST['mode']) == "fieldadd") {
		
		$info1['product_id']		= $POST['product_id'];
		$info1['description']		= $_POST['product_des'];
		$info1['product_qty']		= $POST['product_qty'];
		$info1['unit_id']			= $POST['unit_id'];
		$info1['product_rate']		= $POST['product_rate'];
		$info1['product_discount']	= $POST['product_discount'];
		$info1['discount_per']		= $POST['discount_per'];
		$info1['formulaid']			= $POST['formulaid'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['product_amount']	= $total=($POST['product_rate']*$POST['product_qty'])-$POST['product_discount'];
		$info=get_product_common_tax($dbcon,$total,$POST['formulaid']);
		$info1=array_merge($info1,$info);
		$table='tbl_invoice_trn';$tableid='invoice_trn_id';
		if(!empty($POST['invoice_id'])) {
			$info1['invoice_id']= $POST['invoice_id']; 
		}
		else{
			$info1['invoice_trn_status']= 3;
		}
		
		if(empty($POST['edit_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
		}
		//var_dump($info1);
	}
	else if(strtolower($POST['mode']) == "load_tempoutward") {
		if($POST['eid']){
			$query="select trn.*,product.product_name,cat.unit_name from tbl_invoice_trn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.invoice_trn_status=0 and trn.invoice_id=".$POST['eid'];
		}
		else{
			$query="select trn.*,product.product_name,cat.unit_name from tbl_invoice_trn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.invoice_trn_status=3 and trn.user_id=".$_SESSION['user_id'];
		}
		$result=$dbcon->query($query);
		echo ' <div class="form-group">
		<div class="col-md-12 col-xs-11">
		<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
		<tr id="field">
			<th class="text-center" width="30%">Product Name</th>
			<th class="text-center"width="5%">Qty</th>
			<th class="text-center"width="10%">Rate</th>
			<th class="text-center"width="6%">Unit</th>
			<th class="text-center"width="8%">Discount</th>
			<th class="text-center"width="10%">Taxable value</th>
			<th class="text-center"width="10%">Tax</th>
			<th class="text-center"width="12%">Amount</th>
			<th class="text-center"width="5%">Action</th>
		</tr>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
				echo '<tr id="fieldtr'.$id.'" >
				<td style="vertical-align:top;">
					<strong>'.$rel['product_name'].'</strong>';
					echo ''.(!empty($rel['description'])?'<br/><strong>Desc.</strong>: '.nl2br($rel['description']):'').'
				</td>
				<td style="vertical-align:top;" class="text-center">
				'.$rel['product_qty'].'
				</td>					
				<td style="vertical-align:top;" class="text-right">
				'.$rel['product_rate'].'
				</td>				
				<td style="vertical-align:top" class="text-center">
				'.$rel['unit_name'].'
				</td>
				<td style="vertical-align:top" class="text-right">
				'.$rel['product_discount'].' ('.$rel['discount_per'].'%)
				</td>
				<td style="vertical-align:top" class="text-right">
				'.($rel['product_amount']).'
				</td>
				<td style="vertical-align:top" class="text-left">
					'.(empty($rel['tax_name1']) ? "" : $rel['tax_name1'].' : '.$rel['tax_amount1']).'<br/>
					'.(empty($rel['tax_name2']) ? "" : $rel['tax_name2'].' : '.$rel['tax_amount2']).'<br/>
					'.(empty($rel['tax_name3']) ? "" : $rel['tax_name3'].' : '.$rel['tax_amount3']).'
				</td>
				<td style="vertical-align:top" class="text-right">
					'.$rel['product_total'].'
				</td>
				<input type="hidden" name="amount[]" id="amount'.$i.'" value="'.$rel['product_total'].'"/>
				
				<td style="vertical-align:top">
					<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data('.$rel['invoice_trn_id'].');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
					<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data('.$rel['invoice_trn_id'].');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		echo '</table>			 
			</div>
		</div>';
	}
	else if(strtolower($POST['mode'])== "preedit")
	{
		$q = $dbcon -> query("SELECT mst.* FROM tbl_invoice_trn as mst WHERE invoice_trn_id= '$POST[id]'");
		$r = $q->fetch_assoc();
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "load_invoiceno")
	{
		$row=array();
		$query1="select * from tbl_invoicetype where type_id=8 and company_id=".$_SESSION['company_id'];
		$rows=mysqli_fetch_assoc($dbcon->query($query1));
		$id=$rows['taxinvoice_start'];
		$id=$id+1;
		//$start=(date('m')<'04') ? date('y',strtotime(date('y').'-1 year')) : date('y');
		//$end = $start+1;
		if($rows['invoice_format']=='2') {
			$row['invoiceno']= str_pad($id,4,"0",STR_PAD_LEFT).$rows['format_value'];
		}
		else if($rows['invoice_format']=='1') {
			$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT);
		}
		else if($rows['invoice_format']=='3'){
			$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT).$rows['end_format_value'];
		}
		else{
			$row['invoiceno']=str_pad($id,3,"0",STR_PAD_LEFT);
		}
		$row['challanno']=str_pad($id,3,"0",STR_PAD_LEFT);
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "getproduct_amount") {
		$arr=get_product_common_tax($dbcon,$POST['product_amount'],$POST['formulaid']);
		echo json_encode($arr);
	}
	else if(strtolower($POST['mode'])== "delete_data"){
		$row=array();
		$info['invoice_trn_status']=2;
		$updateid=update_record("tbl_invoice_trn", $info, "invoice_trn_id=".$POST['eid'], $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode']) == "view_ship_address") {
		$cust_id=$POST['cust_id'];$str='';
		
		$sel=$dbcon->query("select per.*,country_name,state_name,city_name from tbl_cust_address as per
		left join country_mst as country on country.countryid=per.c_add_country
		left join state_mst as state on state.stateid=per.c_add_state
		left join city_mst as city on city.cityid=per.c_add_city
		where per.cust_id='$cust_id' and per.user_id='$_SESSION[user_id]'");
		$str.='<table class="display table table-bordered table-striped">
			<thead>
				<tr>
					<th>Sr No.</th>
					<th>Location</th>
					<th>Street</th>
					<th>Country</th>
					<th>State</th>
					<th>City</th>
					<th>Zip / Postal Code</th>
					<th>Action</th>
				</tr>
			</thead>
		';
		if(mysqli_num_rows($sel)){
			$k=1;
			while($row=mysqli_fetch_assoc($sel))
			{
				$str.= '<tr>';
				$str.= '<td>'.$k.'</td>';
				$str.= '<td>'.$row['c_add_location'].'</td>';
				$str.= '<td>'.$row['c_add_street'].'</td>';
				$str.= '<td>'.$row['country_name'].'</td>';
				$str.= '<td>'.$row['state_name'].'</td>';
				$str.= '<td>'.$row['city_name'].'</td>';
				$str.= '<td>'.$row['c_add_zip'].'</td>';
				
				$prep_add=$row['c_add_location'].'\n'.$row['c_add_street'].'\n'.$row['city_name'].', '.$row['state_name'].', '.$row['country_name'].' - '.$row['c_add_zip'];
				$str.= '<td><button type="button" class="btn btn-primary" onclick="copy_ship_address(\''.$prep_add.'\')">COPY</button></td>';
				$str.= '</tr>';
				$k++;
			}
		}
		else{
			$str.='<tr><td colspan="8">NO DATA FOUND!!!</td></tr>';
		}
		$str.='</table>';
		$resp['resp_html']=$str;
		echo json_encode($resp);
	}
	
?>