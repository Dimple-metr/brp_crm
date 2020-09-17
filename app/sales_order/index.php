<?php
	
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");

//print_r($_POST);
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
		$where.="  and so.sales_order_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND so.sales_order_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('so.sales_order_id', 'so.sales_order_no', 'so.sales_order_date', 'cust.cust_name', 'quot.quotation_no', 'quot.quot_subject', 'so.so_approve_status', 'so.cdate','so.sales_order_status','so.user_id', 'so.bom_done_status');
		$sIndexColumn = "so.sales_order_id";
		$isWhere = array("so.sales_order_status=0 ".$where." and so.company_id in (0,$_SESSION[company_id])");
		$sTable = "tbl_sales_order as so";			
		$isJOIN = array('left join tbl_customer as cust on cust.cust_id=so.cust_id','left join tbl_quotation as quot on quot.quotation_id=so.quotation_id');
		$hOrder = "so.sales_order_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['sales_order_no'];
			$row_data[] = date('d M, Y',strtotime($row['sales_order_date']));
			$row_data[] = $row['cust_name'];
			$row_data[] = $row['quotation_no'];
			$row_data[] = $row['quot_subject'];
			
			if($row['so_approve_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Authorized</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Pending</div>';
			}
			
			$edit_btn='';$delete_btn='';$aprv_btn='';$bom_btn='';$so_print='';
			/*if($_SESSION['user_type']=='2'){
				if($row['so_approve_status']=='1'){
					$aprv_btn='<button class="btn btn-xs btn-danger" data-original-title="Cancel S.O." data-toggle="tooltip" data-placement="top" onClick="approv_sales_order('.$row['sales_order_id'].',0)"><i class="fa fa-times"></i></button>';
					$bom_btn=' <a class="btn btn-xs btn-info" data-original-title="Create BOM" data-toggle="tooltip" data-placement="top" href="'.ROOT.'bom_add/'.$row['sales_order_id'].'"><i class="fa fa-plus"></i></a>';
				}
				else{
					$aprv_btn='<button class="btn btn-xs btn-success" data-original-title="Approve S.O." data-toggle="tooltip" data-placement="top" onClick="approv_sales_order('.$row['sales_order_id'].',1)"><i class="fa fa-check"></i></button>';
				}
			}*/
			$sales_order_no=$dbcon->real_escape_string($row['sales_order_no']);
			$aprv_btn='<button class="btn btn-xs btn-info" data-original-title="Approve/Reject S.O." data-toggle="tooltip" data-placement="top" onClick="open_approv_sales_order('.$row['sales_order_id'].',\''.$sales_order_no.'\')"><i class="fa fa-exclamation-triangle"></i></button>';
			
			if($edit_btn_per){
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'sales_order_edit/'.$row['sales_order_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_sales_order('.$row['sales_order_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			
			if($row['bom_done_status']=='1'){
				$edit_btn='';$delete_btn='';$aprv_btn='';
				$bom_btn='<button type="button" class="btn btn-xs btn-success" data-original-title="BOM Done" data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i> BOM Done</button>';
			}
			
			if($row['so_approve_status']=='1'){
				$so_print='<a class="btn btn-xs btn-primary" data-original-title="Print Sales Order" data-toggle="tooltip" data-placement="top" href="'.ROOT.'sales_order_print/'.$row['sales_order_id'].'"><i class="fa fa-print"></i></a>';
			}
			
			$row_data[] = $so_print.' '.$edit_btn.' '.$delete_btn.' '.$aprv_btn.' '.$bom_btn; 
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		$row['res']='';
		
		$info['sales_order_no']		= load_so_no($dbcon);
		//Update Start series of No
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE status=0 and type_id=3 and company_id=".$_SESSION['company_id']);
		
		$info['sales_order_date']	= date("Y-m-d",strtotime($POST['sales_order_date']));
		$info['so_ref_no']			= $POST['so_ref_no'];
		$info['so_ref_date']		= date("Y-m-d",strtotime($POST['so_ref_date']));
		$info['cust_id']			= $POST['cust_id'];
		$info['quotation_id']		= $POST['quotation_id'];
		$info['so_remark']		= $_POST['so_remark'];
		$info['g_total']			= $POST['g_total'];
		
		if(!empty($_FILES['so_attach']['tmp_name'])) {
			$info['so_attach']	= upload_attach($_FILES);
		}
		
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		$inserid=add_record('tbl_sales_order', $info, $dbcon);
		
		/*Update Data in Trn Table Start*/
		if($inserid){
			$infotrn['sales_order_id']	= $inserid;
			$infotrn['so_trn_status']	= 0;
			$updatetrnid=update_record('tbl_sales_order_trn', $infotrn,"so_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		
		if($inserid){
			$resp['msg']='1';
		}
		else{
			$resp['msg']='0';
		}
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		//$info['sales_order_no']		= $POST['sales_order_no'];
		$info['sales_order_date']	= date("Y-m-d",strtotime($POST['sales_order_date']));
		$info['so_ref_no']			= $POST['so_ref_no'];
		$info['so_ref_date']		= date("Y-m-d",strtotime($POST['so_ref_date']));
		$info['cust_id']			= $POST['cust_id'];
		$info['quotation_id']		= $POST['quotation_id'];
		$info['so_remark']			= $_POST['so_remark'];
		$info['g_total']			= $POST['g_total'];
		
		if(!empty($_FILES['so_attach']['tmp_name'])) {
			$info['so_attach']	= upload_attach($_FILES);
		}
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		
		$updateid=update_record('tbl_sales_order', $info,"sales_order_id=".$POST['eid'] , $dbcon);
		
		
		if($updateid){
			$resp['msg']='2';
		}
		else{
			$resp['msg']='0';
		}
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['sales_order_status']='2';
		$updateid=update_record('tbl_sales_order', $info,"sales_order_id=".$POST['sales_order_id'] , $dbcon);
		
		$infotrn['so_trn_status']	= 2;
		$updatetrnid=update_record('tbl_sales_order_trn', $infotrn, "sales_order_id=".$POST['sales_order_id'], $dbcon);
		
		if($updateid){
			echo 1;
		}
		else{
			echo 0;
		}
	}
	else if(strtolower($POST['mode']) == "approv_sales_order") {
		
		$info['so_approve_status']=$POST['so_approve_status'];
		$updateid=update_record('tbl_sales_order', $info,"sales_order_id=".$POST['sales_order_id'] , $dbcon);
		
		if($updateid){
			echo 1;
		}
		else{
			echo 0;
		}
	}
	else if(strtolower($POST['mode']) == "add_so_trn_data") {
		
		$info1['product_id']	= $POST['product_id'];
		$info1['product_desc']	= $_POST['product_desc'];
		$info1['unitid']		= $POST['unitid'];
		$info1['product_qty']	= $POST['product_qty'];
		$info1['product_rate']	= $POST['product_rate'];
		$info1['product_discount']	= $POST['product_discount'];
		$info1['discount_per']	= $POST['discount_per'];
		$info1['product_amount']= $POST['product_amount'];
		$info1['formulaid']		= $POST['formulaid'];
		$info=get_product_common_tax($dbcon,$POST['product_amount'],$POST['formulaid']);
		$info1=array_merge($info1,$info);
		$info1['user_id']			= $_SESSION['user_id'];
		
		$table='tbl_sales_order_trn';$tableid='so_trn_id';
		if(!empty($POST['sales_order_id'])) {
			$info1['sales_order_id']= $POST['sales_order_id'];
		}
		else{
			$info1['so_trn_status']= 3;
		}
		
		if(empty($POST['edit_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
		}
		
	}
	else if(strtolower($POST['mode'])== "load_so_trn_data") {
		$str='';
		if($POST['sales_order_id']){
			$query="select trn.*,pro.product_name from tbl_sales_order_trn as trn
			left join tbl_product as pro on pro.product_id=trn.product_id 
			where so_trn_status=0 and trn.sales_order_id=".$POST['sales_order_id']." order by so_trn_id DESC";
		}
		else{
			$query="select trn.*,pro.product_name from tbl_sales_order_trn as trn
			left join tbl_product as pro on pro.product_id=trn.product_id 
			where so_trn_status=3 and trn.user_id=".$_SESSION['user_id']." order by so_trn_id DESC";
		}
		$result=$dbcon->query($query);
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
				$str.='<tr> 
				<td style="vertical-align:top;text-align:center;">'.$i.'</td>
				<td style="vertical-align:top;">
				<strong>'.$rel['product_name'].'</strong><br/>
				<strong>Desc:</strong> '.(nl2br($rel['product_desc'])).'
				</td>
				<td style="vertical-align:top;" class="text-center">
				'.$rel['product_qty'].' '.$rel['unit_name'].'
				</td>
				<td style="vertical-align:top;" class="text-center">
				'.$rel['product_rate'].'
				</td>
				<td style="vertical-align:top;" class="text-center">
				'.$rel['product_discount'].' ('.$rel['discount_per'].'%)
				</td>
				<td style="vertical-align:top;" class="text-right">
				'.$rel['product_amount'].'
				</td>
				<td style="vertical-align:top;" class="text-left">';
				if(empty($rel['formulaid'])){
					$str.= '-';
					}else{
					$str.= (empty($rel['tax_name1']) ? " " : $rel['tax_name1'] .' : '. $rel['tax_amount1']).'<br/>';
					$str.= (empty($rel['tax_name2']) ? " " : $rel['tax_name2'] .' : '. $rel['tax_amount2']).'<br/>';
					$str.= (empty($rel['tax_name3']) ? " " : $rel['tax_name3'] .' : '. $rel['tax_amount3']).'<br/>';
				}
				
				$str.='</td>
				<td style="vertical-align:top;" class="text-right">
				<input type="hidden" name="amount[]" value="'.$rel['product_total'].'">
				'.$rel['product_total'].'
				</td>
				<td style="vertical-align:top"> 
				<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_so_trn_data('.$rel['so_trn_id'].')"><i class="fa fa-pencil"></i></button>';
				
				$str.=' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_so_trn_data('.$rel['so_trn_id'].')">X</button>';
				
				$str.= '</td>	
				</tr>';
				$i++;
			}
		}
		else{
			$str.= '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		
		echo $str;
	}
	else if(strtolower($POST['mode'])== "edit_so_trn_data") {
		$q = $dbcon -> query("SELECT mst.* FROM tbl_sales_order_trn as mst WHERE so_trn_id = '$POST[so_trn_id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_so_trn_data") {
		$row=array();
		$info['so_trn_status']=2;
		$updateid=update_record('tbl_sales_order_trn', $info, "so_trn_id=".$POST['so_trn_id'], $dbcon);
		
		if($updateid)
		$row['res']="1";
		else
		$row['res']="0";
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "load_cust_quot") {
		$resp['html_resp']	= get_custwise_quot($dbcon,$POST['cust_id'],"","Add");
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "load_so_no") {
		echo $resp = load_so_no($dbcon);
	}
	else if(strtolower($POST['mode'])== "copy_quot_trn_data") {
		$quotation_id=$POST['quotation_id'];
		//Delete temp DATA
		$deltempid=delete_record('tbl_sales_order_trn', "so_trn_status=3 and user_id=".$_SESSION['user_id'], $dbcon);
		$copy_qry="
		Insert into tbl_sales_order_trn (quot_trn_id,product_id,product_desc,unitid,product_qty,product_rate,product_discount,discount_per,product_amount,formulaid,tax_name1,tax_amount1,tax_name2,tax_amount2,tax_name3,tax_amount3,product_total,so_trn_status,user_id)
		SELECT quot_trn_id,product_id,product_desc,unitid,product_qty,product_rate,product_discount,discount_per,product_amount,formulaid,tax_name1,tax_amount1,tax_name2,tax_amount2,tax_name3,tax_amount3,product_total,3,".$_SESSION['user_id']." FROM `tbl_quotation_trn` where quot_trn_status=0 and quotation_id=".$quotation_id;
		$copy_qry_rs=$dbcon->query($copy_qry);
	}
	else if(strtolower($POST['mode']) == "add_apprv_hist") {
		
		$info1['assign_user_ids']	= $POST['assign_user_ids'];
		$info1['approve_remark']	= $_POST['approve_remark'];
		$info1['approve_status']	= $POST['approve_status'];
		$info1['sales_order_id']	= $POST['sales_order_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		
		$inserid=add_record("tbl_sales_order_log", $info1, $dbcon);
		
		if($_SESSION['user_type']=='2'){
			$infoso['so_approve_status']	= $POST['approve_status'];
			$updateid=update_record('tbl_sales_order', $infoso,"sales_order_id=".$POST['sales_order_id'] , $dbcon);
		}
		
	}
	else if(strtolower($POST['mode']) == "load_so_hist_datatable") {
		
		$where='';
		$where.="  and log.sales_order_id=".$POST['sales_order_id'];
		
		$appData = array();
		$i=1;
		$aColumns = array('log.sales_order_log_id', 'usr.user_name', 'log.approve_status', 'log.approve_remark', 'log.cdate', 'log.user_id');
		$sIndexColumn = "log.sales_order_log_id";
		$isWhere = array("log.sales_order_log_status=0 ".$where." ");
		$sTable = "tbl_sales_order_log as log";			
		$isJOIN = array('left join users as usr on usr.user_id=log.assign_user_ids');
		$hOrder = "log.sales_order_log_id desc";
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
	
	
function load_so_no($dbcon){
	//Load no by Type ID
	$row=array();
	$query1="select * from tbl_invoicetype where status=0 and type_id=3 and company_id=".$_SESSION['company_id'];
	$rows=mysqli_fetch_assoc($dbcon->query($query1));
	$id=$rows['taxinvoice_start'];
	$id=$id+1;
	if($rows['invoice_format']=='2'){
		$row['invoiceno']= str_pad($id,4,"0",STR_PAD_LEFT).$rows['format_value'];
	}
	else if($rows['invoice_format']=='1'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT);
	}
	else if($rows['invoice_format']=='3'){
		$row['invoiceno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT).$rows['end_format_value'];
	}
	else{
		$row['invoiceno']=str_pad($id,3,"0",STR_PAD_LEFT);
	}
	return $row['invoiceno'];
}	

function upload_attach($FILES)
{
	$rand=rand(0,99999);
	if(!empty($FILES['so_attach']['tmp_name'])) {
		$temp = explode(".", $FILES["so_attach"]["name"]);
		$extension = strtolower(end($temp));
	
		$File = "so_attach".$rand.".".$extension;
		$tmp_name = $FILES["so_attach"]["tmp_name"];
		move_uploaded_file($tmp_name,SO_ATTACH_UPING.$File);
		return  $File;				
	}
}	
?>	