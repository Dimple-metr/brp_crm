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
		$where.="  and prf_entry_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND prf_entry_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('prf.prf_entry_id','prf.prf_entry_no', 'prf.prf_entry_date', 'prf.remark','usr.user_mail','prf.prf_approve_status','prf.po_status','prf.status','prf.cdate','prf.user_id');
		$sIndexColumn = "prf_entry_id";
		$isWhere = array("prf.status = 0".$where.check_user('prf'));
		$sTable = "tbl_prf_entry as prf";
		$isJOIN = array('left join users as usr on usr.user_id=prf.user_id');
		$hOrder = "prf.prf_entry_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['prf_entry_no'];
			$row_data[] = date('d M, Y',strtotime($row['prf_entry_date']));
			$row_data[] = nl2br($row['remark']);
			
			if($row['prf_approve_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Authorized</div>';
			}
			elseif($row['prf_approve_status']=='0'){
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Pending</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Reject</div>';
			}
			
			if($row['po_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Closed</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-info ui-draggable" style="cursor:auto;">Open</div>';
			}
			
			$row_data[] = $row['user_mail'];
			
			$delete='';$edit='';$print_btn='';$aprv_btn='';$close_btn='';
			if($edit_btn_per){
				$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'prf_edit/'.$row['prf_entry_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_prf_entry('.$row['prf_entry_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$print_btn='<a class="btn btn-xs btn-primary" data-original-title="Print" data-toggle="tooltip" data-placement="top" href="'.ROOT.'prf_print/'.$row['prf_entry_id'].'"><i class="fa fa-print"></i></a>';
			if($row['prf_approve_status']!='1' || $_SESSION['user_type']=='2' )
			{
			$prf_entry_no=$dbcon->real_escape_string($row['prf_entry_no']);
			$aprv_btn='<button class="btn btn-xs btn-info" data-original-title="Approve/Reject PRF" data-toggle="tooltip" data-placement="top" onClick="open_approv_prf_status('.$row['user_id'].','.$row['prf_entry_id'].',\''.$prf_entry_no.'\')"><i class="fa fa-exclamation-triangle"></i></button>';
			}
			
			if($_SESSION['user_type']=='2'){
			
				if($row['po_status']=='1'){
					$close_btn='<button class="btn btn-xs btn-danger" data-original-title="Click to Re-open PRF" data-toggle="tooltip" data-placement="top" onClick="close_prf_status('.$row['prf_entry_id'].',0)"><i class="fa fa-times"></i></button>';
				}
				else{
					$close_btn='<button class="btn btn-xs btn-success" data-original-title="Click to Close PRF" data-toggle="tooltip" data-placement="top" onClick="close_prf_status('.$row['prf_entry_id'].',1)"><i class="fa fa-check"></i></button>';
				}
			}
			
			if($row['prf_approve_status']=='1' && $_SESSION['user_type']!='2'){
				$edit='';
			}
			
			$row_data[] = $print_btn.' '.$edit.' '.$delete.' '.$aprv_btn.' '.$close_btn;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE type_id=10 and company_id=".$_SESSION['company_id']);

		$info['prf_entry_no']	= prf_number($dbcon);
		$info['prf_entry_date']	= date('Y-m-d',strtotime($POST['prf_entry_date']));
		//$info['product_id']		= $POST['product_id'];
		//$info['product_des']	= $_POST['product_des'];
		$info['remark']			= $_POST['remark'];
		$info['prf_approve_status'] = $_POST['prf_approve_status'];
		
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$inserpoid=add_record('tbl_prf_entry', $info, $dbcon);
		 
		/*Update Trn Table Start*/
		if($inserpoid){
			$infonote['prf_entry_id']		= $inserpoid;
			$infonote['ven_rmrk_status']	= 0;
			$updatetrnid=update_record('tbl_prf_ven_rmrk', $infonote,"ven_rmrk_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Trn Table End*/ 
		 
		if($inserpoid) {	
			$arr['msg']="1";							
		}
		else
			$arr['msg']="0";
	
		echo json_encode($arr);		 
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['prf_entry_no']	= $POST['prf_entry_no'];
		$info['prf_entry_date']	= date('Y-m-d',strtotime($POST['prf_entry_date']));
		//$info['product_id']		= $POST['product_id'];
		//$info['product_des']	= $_POST['product_des'];
		$info['remark']			= $_POST['remark'];
		if($_POST['prf_approve_status'] = 2)
		{
			$info['prf_approve_status'] = 0;
		}
		$info['cdate']			= date("Y-m-d H:i:s");
		$updateid=update_record('tbl_prf_entry', $info,"prf_entry_id=".$POST['eid'] , $dbcon);

		if($updateid) {	
			$arr['msg']="update"; 
		}
		else
			$arr['msg']=0;
	
		echo json_encode($arr);	
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['status']		= 2;
		$updateinvoiceid=update_record('tbl_prf_entry', $info,"prf_entry_id=".$POST['eid'] , $dbcon);	
		
		if($updateinvoiceid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode']) == "close_prf_status") {
		
		$info['po_status']		= $POST['po_status'];
		$updateinvoiceid=update_record('tbl_prf_entry', $info,"prf_entry_id=".$POST['prf_entry_id'] , $dbcon);	
		
		if($updateinvoiceid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode'])== "load_productdata") { 
		/*$qry="select popro.*,com.stateid as com_stateid,ven.stateid as ven_stateid from `tbl_product` as popro left join `tbl_company` as com on com.company_id=".$_SESSION['company_id']." left join tbl_customer as ven on ven.cust_id=".$POST['cust_id']." where product_id=".$POST['eid'];*/
		$qry="select * from `tbl_product` where product_id=".$POST['eid'];
		$result=$dbcon->query($qry);
		$row=mysqli_fetch_assoc($result);
		echo json_encode( $row );
	}
	else if(strtolower($POST['mode'])== "load_invoiceno")
	{
		$row=array();
		$query1="select * from tbl_invoicetype where type_id=10 and company_id=".$_SESSION['company_id'];
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
	else if(strtolower($POST['mode']) == "add_ven_rmrk_field") {
		$info1['product_id']		= $POST['product_id'];
		$info1['prf_qty']			= $POST['prf_qty'];
		$info1['product_des']		= $_POST['product_des'];
		$info1['new_ven_name']		= $POST['new_ven_name'];
		$info1['new_ven_rmrk']		= $_POST['new_ven_rmrk'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		$table='tbl_prf_ven_rmrk';$tableid='ven_rmrk_id';
		if(!empty($POST['prf_entry_id'])) {
			$info1['prf_entry_id']= $POST['prf_entry_id'];
		}
		else{
			$info1['ven_rmrk_status']= 3;
		}
		
		if(empty($POST['edit_rmrk_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_rmrk_id'] , $dbcon);	
		}
	}
	else if(strtolower($POST['mode'])== "show_ven_rmrk_field") {
		
		if($POST['prf_entry_id']){
			$query="select mst.*,pro.product_name from tbl_prf_ven_rmrk as mst 
			left join tbl_product as pro on pro.product_id=mst.product_id
			where ven_rmrk_status=0 and mst.prf_entry_id=".$POST['prf_entry_id'];
		}
		else{
			$query="select mst.*,pro.product_name from tbl_prf_ven_rmrk as mst 
			left join tbl_product as pro on pro.product_id=mst.product_id
			where ven_rmrk_status=3 and mst.user_id=".$_SESSION['user_id'];
		}
		$result=$dbcon->query($query);
		echo '<table class="display table table-bordered table-striped">
				<tr>
					<th width="40%" class="text-center">Product Details</th>
					<th width="10%" class="text-center">Prf Qty</th>
					<th width="40%" class="text-center">Vendor Details</th>
					<th width="10%" class="text-center">Action</th>					  
				</tr>
				<tbody>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
				$product_name=$dbcon->real_escape_string($rel['product_name']);
				echo '<tr> 
					<td style="vertical-align:top;">
						<strong>'.$rel['product_name'].'</strong>
						<button type="button" class="btn btn-xs btn-primary" title="" onclick="open_ven_rate_hist('.$rel['product_id'].',\''.$product_name.'\')"><i class="fa fa-eye"></i></button>
						<br/>'.nl2br($rel['product_des']).'
					</td>
					
					<td style="vertical-align:top;">
					<strong>'.$rel['prf_qty'].'</strong>
					</td>
					
					<td style="vertical-align:top;" class="text-left">
						<strong>'.$rel['new_ven_name'].'</strong><br/>
						'.nl2br($rel['new_ven_rmrk']).'
					</td>
					<td style="vertical-align:top"> 
						<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_ven_rmrk_field('.$rel['ven_rmrk_id'].')"><i class="fa fa-pencil"></i></button>';
			
					echo ' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_ven_rmrk_field('.$rel['ven_rmrk_id'].')">X</button>';
			
					echo '</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		
		echo '</tbody>
				</table>';
	}
	else if(strtolower($POST['mode'])== "edit_ven_rmrk_field") {
		$q = $dbcon -> query("SELECT mst.* FROM tbl_prf_ven_rmrk as mst WHERE ven_rmrk_id = '$POST[ven_rmrk_id]'");
		$r = $q->fetch_assoc();
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_ven_rmrk_field") {
		$row=array();
		$info['ven_rmrk_status']=2;	
		$updateid=update_record('tbl_prf_ven_rmrk', $info, "ven_rmrk_id=".$POST['ven_rmrk_id'], $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode']) == "add_apprv_hist") {
		
		$info1['assign_user_ids']	= $POST['assign_user_ids'];
		$info1['approve_remark']	= $_POST['approve_remark'];
		$info1['approve_status']	= $POST['approve_status'];
		$info1['prf_entry_id']		= $POST['prf_entry_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		
		$inserid=add_record("tbl_prf_entry_log", $info1, $dbcon);
		
		if($_SESSION['user_type']=='2'){
			$infoso['prf_approve_status']	= $POST['approve_status'];
			$updateid=update_record('tbl_prf_entry', $infoso,"prf_entry_id=".$POST['prf_entry_id'] , $dbcon);
		}
		
	}
	else if(strtolower($POST['mode']) == "load_prf_hist_datatable") {
		
		$where='';
		$where.="  and log.prf_entry_id=".$POST['prf_entry_id'];
		
		$appData = array();
		$i=1;
		$aColumns = array('log.prf_log_id', 'usr.user_name', 'log.approve_status', 'log.approve_remark', 'log.cdate', 'log.user_id');
		$sIndexColumn = "log.prf_log_id";
		$isWhere = array("log.prf_log_status=0 ".$where." ");
		$sTable = "tbl_prf_entry_log as log";			
		$isJOIN = array('left join users as usr on usr.user_id=log.assign_user_ids');
		$hOrder = "log.prf_log_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['user_name'];
			
			if($row['approve_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Approved</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Reject</div>';
			}
			
			$row_data[] = nl2br($row['approve_remark']);
			$row_data[] = date("d-M-Y h:i A",strtotime($row['cdate']));
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "open_ven_rate_hist") {
		$product_id=$POST['product_id'];
		$str='';
		$v_qry="select hist.*,cust.cust_name from tbl_product_ven_hist as hist
		left join tbl_customer as cust on cust.cust_id=hist.cust_id
		where hist.ven_hist_status=0 and hist.product_id=".$product_id;
		$v_qry_rs=$dbcon->query($v_qry);$k=1;
		$str.='<table class="display table table-bordered table-striped">
			<tr>
				<th class="text-center">Sr.</th>
				<th class="text-center">Vendor Name</th>
				<th class="text-center">Rate</th>
				<th class="text-center">Remark</th>
			</tr>';
			
		if(mysqli_num_rows($v_qry_rs)){
			while($rel=mysqli_fetch_assoc($v_qry_rs)){
				$str.='<tr>
						<td>'.$k.'</td>
						<td>'.$rel['cust_name'].'</td>
						<td>'.$rel['ven_rate'].'</td>
						<td>'.nl2br($rel['ven_rmrk']).'</td>
					</tr>';
				$k++;
			}
		}
		else{
			$str.='<tr><td colspan="5" class="text-center">NO DATA FOUND !!!</td></tr>';
		}
		
		$str.='</table>';
		$resp['resp_html']=$str;
		echo json_encode($resp);
	}
	function prf_number($dbcon)
{	

	$row=array();
		$query1="select * from tbl_invoicetype where type_id=10 and company_id=".$_SESSION['company_id'];
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
		//echo json_encode($row);
		return $row['invoiceno'];
}
?>