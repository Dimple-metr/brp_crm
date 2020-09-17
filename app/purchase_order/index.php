<?php

session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");
include_once("../common_send_email.php");

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
		$where.="  and purchaseorder_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND purchaseorder_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		 
		$appData = array();
		$i=1;
		$aColumns = array('purchaseorder_id','purchaseorder_no','purchaseorder_date','vender.cust_name','g_total','po_inspect_status','po.delivery_status','paid_amount','po.status','po.main_id','purchase_status','po.cdate','po.userid','po.approval_status','po.cust_id','po.used_grn_status');
		$sIndexColumn = "purchaseorder_id";
		$isWhere = array("status != 2".$where.check_user_po('po'));
		$sTable = "tbl_purchaseorder as po";			
		$isJOIN = array('left join tbl_customer vender on po.cust_id=vender.cust_id');
		$hOrder = "po.purchaseorder_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['purchaseorder_no'];
			$row_data[] = date('d M, Y',strtotime($row['purchaseorder_date']));
			$row_data[] = $row['cust_name'];
			$row_data[] = $row['g_total'];
			
			if($row['po_inspect_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Done</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Pending</div>';
			}
			
			if($row['approval_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Authorized</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Pending</div>';
			}
			
			$poprint='';$delete='';$edit='';$revise_btn='';$insp_btn='';$aprv_btn='';$send_email='';
			
			if($row['purchase_status']=="0" ){
				if($edit_btn_per){ 
					$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'poedit/'.$row['purchaseorder_id'].'"><i class="fa fa-pencil"></i></a>';
				}
				if($delete_btn_per){
					$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_po('.$row['purchaseorder_id'].','.$row['main_id'].')"><i class="fa fa-trash-o"></i></button>';
				} 
				
			$purchaseorder_no=$dbcon->real_escape_string($row['purchaseorder_no']);
			$aprv_btn='<button class="btn btn-xs btn-info" data-original-title="Approve/Reject P.O." data-toggle="tooltip" data-placement="top" onClick="open_approv_purchase_order_status('.$row['purchaseorder_id'].',\''.$purchaseorder_no.'\')"><i class="fa fa-exclamation-triangle"></i></button>';
			
				
				//Hide Buttons if PO Revised
				if($row['status']=='1'){
					$revise_btn='<button class="btn btn-xs btn-info" data-original-title="PO Revised" data-toggle="tooltip" data-placement="top">Revised</button>';
					$edit='';$delete='';
				}
				else{
					$revise_btn=' <a class="btn btn-xs btn-info" data-original-title="Revise P.O." data-toggle="tooltip" data-placement="top" href="'.ROOT.'po_revise/'.$row['purchaseorder_id'].'"><i class="fa fa-undo"></i></a>';
				}
				$insp_btn=' <a class="btn btn-xs btn-primary" data-original-title="Inspect Items" data-toggle="tooltip" data-placement="top" href="'.ROOT.'po_inspect/'.$row['purchaseorder_id'].'"><i class="fa fa-plus"></i></a>';
				$chng_sts='<button type="button" class="btn btn-xs btn-success" data-original-title="Click here to Close P.O." data-toggle="tooltip" data-placement="top" onClick="change_pur_done_sts('.$row['purchaseorder_id'].',1)"><i class="fa fa-check"></i></button>';
			}
			else{
				$aprv_btn='<button class="btn btn-xs btn-success" data-original-title="Purchase Done" data-toggle="tooltip" data-placement="top"><i class="fa fa-check"></i> Purchase Done</button>';
				$chng_sts='<button type="button" class="btn btn-xs btn-danger" data-original-title="Click here to Re-open P.O." data-toggle="tooltip" data-placement="top" onClick="change_pur_done_sts('.$row['purchaseorder_id'].',0)"><i class="fa fa-times"></i></button>';
			}
			
			$send_email='<button class="btn btn-xs btn-primary" data-original-title="Send Email" data-toggle="tooltip" data-placement="top" onClick="open_po_email('.$row['purchaseorder_id'].','.$row['cust_id'].')"><i class="fa fa-envelope"></i></button>';
			
			$poprint='<a class="btn btn-xs btn-primary" data-original-title="Print" data-toggle="tooltip" data-placement="top" href="'.ROOT.'poprint/'.$row['purchaseorder_id'].'"><i class="fa fa-print"></i></a>';
			
			if($row['used_grn_status']=="1"){//Hide modify btn if used in GRN
				$edit='';$delete='';$revise_btn='';
			}
			
			if($row['approval_status']=='1' && $_SESSION['user_type']!='2'){
				$edit='';
			}
			
			$row_data[] = $poprint.' '.$edit.' '.$delete.' '.$revise_btn.' '.$insp_btn.' '.$aprv_btn.' '.$send_email.' '.$chng_sts;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add" || strtolower($POST['mode']) == "rewiseadd") {
		
		if(!$POST['main_id']){//Update only if Add mode
			$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE type_id=6 and company_id=".$_SESSION['company_id']);
		}
		
		$info['purchaseorder_no']		= $POST['purchaseorder_no'];
		$info['cust_id']	= $POST['cust_id'];
		$info['po_so_no']	= $POST['po_so_no'];
		$info['po_ref_no']	= $POST['po_ref_no'];
		$info['po_ref_date']	= date('Y-m-d',strtotime($POST['po_ref_date']));
		$info['purchaseorder_date']	= date('Y-m-d',strtotime($POST['purchaseorder_date']));
		$info['payment_terms']		= $POST['payment_terms'];
		$info['round_off']	= $POST['round_off'];
		$info['packing']	= $POST['paking'];
		$info['misc_charges']	= $POST['misc_charges'];
		$info['remark']		= $_POST['remark'];
		$info['po_terms_cond']	= $_POST['po_terms_cond'];
		$info['g_total']	= $POST['g_total'];
		$info['img_disp_flag']	= $POST['img_disp_flag'];
		$info['currency_id']	= $POST['currency_id'];
		$info['sales_order_id']	= $POST['sales_order_id'];
		$info['po_ven_address']	= $_POST['po_ven_address'];
		$info['prf_entry_id']	= $POST['prf_entry_id'];
		
		if(!empty($_FILES['po_attach']['tmp_name'])) {
			$info['po_attach']	= upload_attach($_FILES);
		}
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['mdate']				= date("Y-m-d H:i:s");
		 
		$info['userid']			= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$inserpoid=add_record('tbl_purchaseorder', $info, $dbcon);
		
		if(!$POST['main_id']){//Add self start id
			$infost['start_id']			= $inserpoid;
		}
		else{//Update prev and start ID
			$infost['start_id']			= $POST['start_id'];
			$infost['main_id']			= $POST['main_id'];//Previous
			//Update Revised Status in Previous
			$upd_sts="update tbl_purchaseorder set status=1 where purchaseorder_id=".$POST['main_id'];
			$upd_sts_rs=$dbcon->query($upd_sts);
		}
		$updateid=update_record('tbl_purchaseorder', $infost,"purchaseorder_id=".$inserpoid , $dbcon);

		/*Update Data in Trn Table Start*/
		if($inserpoid){
			$infotrn['purchaseorder_id']			= $inserpoid;
			$infotrn['purchaseordertrn_status']		= 0;
			$updatetrnid=update_record('tbl_purchaseordertrn', $infotrn,"purchaseordertrn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		
		}
		/*Update Data in Trn Table End*/
		
		
		/* Terms and Condition Start */
		foreach ($POST['tc_id'] as $key => $name) {
			$infotrm['tc_id']			= $POST['tc_id'][$key];
			$infotrm['tc_priority']		= $POST['tc_priority'][$key];
			$infotrm['tc_details']		= $_POST['tc_details'][$key];
			$infotrm['purchaseorder_id']= $inserpoid;
			$infotrm['cdate']			= date("Y-m-d H:i:s");
			if(in_array($POST['tc_id'][$key],$POST['disp_term_flag'])){
				$insertrmid=add_record('tbl_po_terms_trn', $infotrm, $dbcon);
			}
		}
		/* Terms and Condition End */
		
		
		//Update BOM Product Requested Status
		$upd_bomtrn_req=upd_bomtrn_req_sts($dbcon,$inserpoid);
		
		//Update PRF Close Status
		if($POST['prf_entry_id']){
			$infoprfsts['po_status'] = 1;
			$updateprfstsid=update_record('tbl_prf_entry', $infoprfsts,"prf_entry_id=".$POST['prf_entry_id'] , $dbcon);	
		}
		
		if(isset($POST['save_print'])) {
			$arr['printstatus']=$POST['print_status'];
			$arr['msg']="1";
			$arr['eid']=$inserpoeid;
		}
		else {
			if($inserpoid) {	
				$arr['msg']="1";							
			}
			else
			$arr['msg']="0";
		}
		echo json_encode($arr);		 
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['purchaseorder_no']		= $POST['purchaseorder_no'];
		$info['purchaseorder_date']	= date('Y-m-d',strtotime($POST['purchaseorder_date']));
		$info['cust_id']	= $POST['cust_id'];
		$info['po_so_no']	= $POST['po_so_no'];
		$info['po_ref_no']	= $POST['po_ref_no'];
		$info['po_ref_date']	= date('Y-m-d',strtotime($POST['po_ref_date']));
		$info['payment_terms']		= $POST['payment_terms'];
		$info['round_off']	= $POST['round_off'];
		$info['packing']	= $POST['paking'];
		$info['misc_charges']	= $POST['misc_charges'];
		$info['remark']		= $_POST['remark'];
		$info['po_terms_cond']		= $_POST['po_terms_cond'];
		$info['g_total']	= $POST['g_total']; 
		$info['img_disp_flag']	= $POST['img_disp_flag'];
		$info['currency_id']	= $POST['currency_id'];
		$info['sales_order_id']	= $POST['sales_order_id'];
		$info['po_ven_address']	= $_POST['po_ven_address'];

		if(!empty($_FILES['po_attach']['tmp_name'])) {
			$info['po_attach']	= upload_attach($_FILES);
		}
		
		$info['userid']		= $_SESSION['user_id']; 
		$info['cdate']				= 	date("Y-m-d H:i:s");
		$updateid=update_record('tbl_purchaseorder', $info,"purchaseorder_id=".$POST['eid'] , $dbcon);
 
		
		/* Terms and Condition Start */
		$deltrmid=delete_record('tbl_po_terms_trn',"purchaseorder_id=".$POST['eid'], $dbcon);
		foreach ($POST['tc_id'] as $key => $name) {
			$infotrm['tc_id']			= $POST['tc_id'][$key];
			$infotrm['tc_priority']		= $POST['tc_priority'][$key];
			$infotrm['tc_details']		= $_POST['tc_details'][$key];
			$infotrm['purchaseorder_id']= $POST['eid'];
			$infotrm['cdate']			= date("Y-m-d H:i:s");
			if(in_array($POST['tc_id'][$key],$POST['disp_term_flag'])){
				$insertrmid=add_record('tbl_po_terms_trn', $infotrm, $dbcon);
			}
		}
		/* Terms and Condition End */
 
		if(isset($POST['save_print'])) {
			$arr['printstatus']=$POST['print_status'];
			$arr['msg']="update";
			$arr['eid']=$POST['eid'];
		}
		else {
			if($updateid)
			{	
				$arr['msg']="update"; 
			}
			else
			$arr['msg']=0;
		}
		echo json_encode($arr);	
		
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		/*$query="select main_id from tbl_purchaseorder where purchaseorder_id=".$POST['eid'];
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		if($rel['main_id']!="0"){
			$info_re['status']		= 0;
			$updatetrancationid11=update_record('tbl_purchaseorder', $info_re,"purchaseorder_id=".$rel['main_id'] , $dbcon);
		}*/
		
		$info['status']		= 2;
		$info1['purchaseordertrn_status']		= 2;
		$updateinvoiceid=update_record(' tbl_purchaseorder', $info,"purchaseorder_id=".$POST['eid'] , $dbcon);	
		$updatetrancationid=update_record('tbl_purchaseordertrn', $info1,"purchaseorder_id=".$POST['eid'] , $dbcon);	
		
		//Re-open Prev PO
		$infoprv['status']		= 0;
		$updateprvid=update_record('tbl_purchaseorder', $infoprv,"purchaseorder_id=".$POST['main_id'] , $dbcon);	
		
		if($updateinvoiceid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode'])== "load_productdata")
	{ 
		/*echo $qry="select popro.*,com.stateid as com_stateid,ven.stateid as ven_stateid from `tbl_product` as popro left join `tbl_company` as com on com.company_id=".$_SESSION['company_id']." left join tbl_customer as ven on ven.cust_id=".$POST['cust_id']." where product_id=".$POST['eid'];*/
		$qry="select popro.* from `tbl_product` as popro where product_id=".$POST['eid'];
		$result=$dbcon->query($qry);
		$row=mysqli_fetch_assoc($result);
		if($POST['prf_entry_id']){
			$prf_qry="select trn.product_des from tbl_prf_ven_rmrk as trn where trn.product_id=".$row['product_id']." and trn.ven_rmrk_status=0 and trn.prf_entry_id=".$POST['prf_entry_id'];
			$prf_rel=mysqli_fetch_assoc($dbcon->query($prf_qry));
			$row['product_des'] = $prf_rel['product_des'];
		}
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
		$table='tbl_purchaseordertrn';$tableid='purchaseordertrn_id';
		if(!empty($POST['purchaseorder_id'])) {
			$info1['purchaseorder_id']= $POST['purchaseorder_id']; 
		}
		else{
			$info1['purchaseordertrn_status']= 3;
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
			$query="select trn.*,product.product_name,cat.unit_name from tbl_purchaseordertrn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.purchaseordertrn_status=0 and trn.purchaseorder_id=".$POST['eid'];
		}
		else{
			$query="select trn.*,product.product_name,cat.unit_name from tbl_purchaseordertrn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.purchaseordertrn_status=3 and trn.user_id=".$_SESSION['user_id'];
		}
		$result=$dbcon->query($query);
		echo ' <div class="form-group">
		<div class="col-md-12 col-xs-11">
		<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
		<tr id="field">
		<th class="text-center" width="30%">Product Name</th>
		<th class="text-center"width="5%">Qty</th>
		<th class="text-center"width="10%">Rate</th>
		<th class="text-center"width="6%">Per</th>
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
				echo '<tr id="fieldtr'.$i.'" >
				<td style="vertical-align:top;">
					<strong>'.$rel['product_name'].'</strong> <button type="button" class="btn btn-xs btn-primary" title="" onclick="open_ven_rate_hist('.$rel['product_id'].',\''.$rel['product_name'].'\')"><i class="fa fa-exclamation-triangle"></i></button>';
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
				<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data('.$rel['purchaseordertrn_id'].');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
				<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data('.$rel['purchaseordertrn_id'].');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		echo '
		
		</table>			 
		</div>
		
		</div>	';
	}
	else if(strtolower($POST['mode'])== "preedit")
	{
		$q = $dbcon -> query("SELECT mst.* FROM tbl_purchaseordertrn as mst WHERE purchaseordertrn_id= '$POST[id]'");
		$r = $q->fetch_assoc();
		$r['pro_html'] = getproduct($dbcon,$r['product_id']);
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_data"){
		$row=array();
		$info['purchaseordertrn_status']=2;
		$updateid=update_record("tbl_purchaseordertrn", $info, "purchaseordertrn_id=".$POST['eid'], $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "load_invoiceno")
	{
		$row=array();
		$query1="select * from tbl_invoicetype where type_id=6 and company_id=".$_SESSION['company_id'];
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
	else if(strtolower($POST['mode']) == "load_typeswise_terms") {
		$po_type=$POST['po_type'];
		$purchaseorder_id=$POST['purchaseorder_id'];
		$str='';
		$str.='<table class="display table table-bordered table-striped">
			  <thead>
				<tr>
					<th width="25%" class="text-center">Term Name</th>
					<th width="5%" class="text-center">Priority</th>
					<th width="70%" class="text-center">Term And Condition</th>				  
				</tr>
			  </thead>
			  <tbody>';
		//Get All Terms
		$terms_qry="select * from tbl_terms_condition where tc_status=0 and tc_category=2 and find_in_set(".$po_type.",tc_for) order by tc_priority";
		$terms_qry_rs=$dbcon->query($terms_qry);$t=1;
		while($terms_rel=mysqli_fetch_assoc($terms_qry_rs)){
			$tc_priority=$terms_rel['tc_priority'];
			$tc_details=$terms_rel['tc_details'];
			if($purchaseorder_id){
				$quot_term_qry="select * from tbl_po_terms_trn where po_terms_trn_status=0 and purchaseorder_id=".$purchaseorder_id." and tc_id=".$terms_rel['tc_id']."";
				$quot_term_rel=mysqli_fetch_assoc($dbcon->query($quot_term_qry));
				if($quot_term_rel['tc_priority']){
					$tc_priority=$quot_term_rel['tc_priority'];
				}
				if($quot_term_rel['tc_details']){
					$tc_details=$quot_term_rel['tc_details'];
				}
			}
			
			$str.='<tr>
					<td>
						<label><input type="checkbox" style="height: 20px;width: 20px;" id="disp_term_flag'.$t.'" name="disp_term_flag[]" value="'.$terms_rel['tc_id'].'" '.(($terms_rel['tc_id']==$quot_term_rel['tc_id'])?'checked':'').'>
						'.$terms_rel['tc_name'].'</label>
						<input type="hidden" id="tc_id'.$t.'" name="tc_id[]" value="'.$terms_rel['tc_id'].'">
					</td>
					<td>
						<input type="number" class="form-control" min="0" id="tc_priority'.$t.'" name="tc_priority[]" value="'.$tc_priority.'">
					</td>
					<td>
						<textarea class="form-control" id="tc_details'.$t.'" name="tc_details[]">'.$tc_details.'</textarea>
					</td>
				</tr>';
			
			$t++;
		}	  
			
		$str.='</tbody> 
					</table>';	  
					
		$resp['resp_html']=$str;
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "show_inspect_data") {
		
		$query="select trn.*,product.product_name,cat.unit_name from tbl_purchaseordertrn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.purchaseordertrn_status=0 and trn.purchaseorder_id=".$POST['eid'];
		
		$result=$dbcon->query($query);
		echo ' <div class="form-group">
		<div class="col-md-12 col-xs-11">
		<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
		<tr id="field">
		<th class="text-center" width="25%">Product Name</th>
		<th class="text-center"width="5%">Qty</th>
		<th class="text-center"width="8%">Rate</th>
		<th class="text-center"width="5%">Discount</th>
		<th class="text-center"width="10%">Taxable value</th>
		<th class="text-center"width="10%">Tax</th>
		<th class="text-center"width="10%">Amount</th>
		<th class="text-center" width="10%">Inspection Status</th>
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
				'.$rel['product_qty'].' '.$rel['unit_name'].'
				</td>					
				<td style="vertical-align:top;" class="text-right">
				'.$rel['product_rate'].'
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
				<td style="vertical-align:top" class="text-center">';
				
				if($rel['inspect_status']=='1'){
					echo '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Done</div>';
				}
				else if($rel['inspect_status']=='2'){
					echo '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Reject</div>';
				}
				else{
					echo '<div class="external-event label label-info ui-draggable" style="cursor:auto;">Pending</div>';
				}
				
				echo '</td>
				<td style="vertical-align:top">';
				
				/*if($rel['inspect_status']=='1'){
					echo '<button type="button" class="btn btn-round btn-warning btn-xs" onclick="change_inspect_sts('.$rel['purchaseordertrn_id'].',0);" title="Click to Reject Inspection"><i class="fa fa-times"></i></button>';
				}
				else{
					echo '<button type="button" class="btn btn-round btn-success btn-xs" onclick="change_inspect_sts('.$rel['purchaseordertrn_id'].',1);" title="Click to Approve Inspection"><i class="fa fa-check"></i></button>';
				}*/
				$product_name=$dbcon->real_escape_string($rel['product_name']);
				echo '<button type="button" class="btn btn-xs btn-success" data-original-title="Approve/Reject Product" data-toggle="tooltip" data-placement="top" onClick="open_approv_po('.$rel['purchaseordertrn_id'].',\''.$product_name.'\')"><i class="fa fa-exclamation-triangle"></i></button>';
					
				echo '</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
		echo '
		
		</table>			 
		</div>
		
		</div>	';
	}
	else if(strtolower($POST['mode']) == "change_inspect_sts") {
		$info['inspect_status']=$POST['inspect_status'];
		$updateid=update_record("tbl_purchaseordertrn", $info, "purchaseordertrn_id=".$POST['purchaseordertrn_id'], $dbcon);
		
		//Update PO STS
		$get_qry="select purchaseordertrn_id from tbl_purchaseordertrn where purchaseordertrn_status=0 and inspect_status=0 and purchaseorder_id=".$POST['purchaseorder_id'];
		$rw_cnt=mysqli_num_rows($dbcon->query($get_qry));
		if($rw_cnt){
			$upd_po=$dbcon->query("UPDATE tbl_purchaseorder set po_inspect_status=0 WHERE purchaseorder_id=".$POST['purchaseorder_id']);
		}
		else{
			$upd_po=$dbcon->query("UPDATE tbl_purchaseorder set po_inspect_status=1 WHERE purchaseorder_id=".$POST['purchaseorder_id']);
		}
	}
	else if(strtolower($POST['mode']) == "add_apprv_hist") {
		
		$info1['approve_remark']	= $_POST['approve_remark'];
		$info1['approve_status']	= $POST['approve_status'];
		$info1['purchaseordertrn_id']= $POST['purchaseordertrn_id'];
		$info1['purchaseorder_id']	= $POST['purchaseorder_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		
		$inserid=add_record("tbl_po_log", $info1, $dbcon);
	
		
		$infoso['inspect_status']	= $POST['approve_status'];
		$updateid=update_record('tbl_purchaseordertrn', $infoso,"purchaseordertrn_id=".$POST['purchaseordertrn_id'] , $dbcon);
		
		
		//Update PO STS
		$get_qry="select purchaseordertrn_id from tbl_purchaseordertrn where purchaseordertrn_status=0 and inspect_status in(0,2) and purchaseorder_id=".$POST['purchaseorder_id'];
		$rw_cnt=mysqli_num_rows($dbcon->query($get_qry));
		if($rw_cnt){
			$upd_po=$dbcon->query("UPDATE tbl_purchaseorder set po_inspect_status=0 WHERE purchaseorder_id=".$POST['purchaseorder_id']);
		}
		else{
			$upd_po=$dbcon->query("UPDATE tbl_purchaseorder set po_inspect_status=1 WHERE purchaseorder_id=".$POST['purchaseorder_id']);
		}
		
	}
	else if(strtolower($POST['mode']) == "load_quot_hist_datatable") {
		
		$where='';
		$where.="  and log.purchaseordertrn_id=".$POST['purchaseordertrn_id'];
		
		$appData = array();
		$i=1;
		$aColumns = array('log.po_log_id', 'log.approve_status', 'log.approve_remark', 'log.cdate', 'usr.user_name', 'log.user_id');
		$sIndexColumn = "log.po_log_id";
		$isWhere = array("log.po_log_status=0 ".$where." ");
		$sTable = "tbl_po_log as log";			
		$isJOIN = array('left join users as usr on usr.user_id=log.user_id');
		$hOrder = "log.po_log_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			
			if($row['approve_status']=='1'){
				$row_data[] = '<div class="external-event label label-success ui-draggable" style="cursor:auto;">Approved</div>';
			}
			else if($row['approve_status']=='2'){
				$row_data[] = '<div class="external-event label label-warning ui-draggable" style="cursor:auto;">Reject</div>';
			}
			else{
				$row_data[] = '<div class="external-event label label-info ui-draggable" style="cursor:auto;">Pending</div>';
			}
			
			$row_data[] = nl2br($row['approve_remark']);
			$row_data[] = date("d-M-Y h:i A",strtotime($row['cdate']));
			$row_data[] = $row['user_name'];
			
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
	else if(strtolower($POST['mode']) == "add_po_apprv_hist") {
		
		$info1['assign_user_ids']	= $POST['assign_user_ids'];
		$info1['approve_remark']	= $_POST['approve_remark'];
		$info1['approve_status']	= $POST['approve_status'];
		$info1['purchaseorder_id']	= $POST['purchaseorder_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		
		$inserid=add_record("tbl_purchaseorder_log", $info1, $dbcon);
		
		if($_SESSION['user_type']=='2'){
			$infoso['approval_status']	= $POST['approve_status'];
			$updateid=update_record('tbl_purchaseorder', $infoso,"purchaseorder_id=".$POST['purchaseorder_id'] , $dbcon);
		}
		
	}
	else if(strtolower($POST['mode']) == "load_po_hist_datatable") {
		
		$where='';
		$where.="  and log.purchaseorder_id=".$POST['purchaseorder_id'];
		
		$appData = array();
		$i=1;
		$aColumns = array('log.purchaseorder_log_id', 'usr.user_name', 'log.approve_status', 'log.approve_remark', 'log.cdate', 'log.user_id');
		$sIndexColumn = "log.purchaseorder_log_id";
		$isWhere = array("log.purchaseorder_log_status=0 ".$where." ");
		$sTable = "tbl_purchaseorder_log as log";			
		$isJOIN = array('left join users as usr on usr.user_id=log.assign_user_ids');
		$hOrder = "log.purchaseorder_log_id desc";
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
	else if(strtolower($POST['mode'])== "open_po_email") {
		$set="select po_email_content from tbl_company where company_id=".$_SESSION['company_id'];
		$set_head=mysqli_fetch_assoc($dbcon->query($set));
		$email_content = $set_head['po_email_content'];
		$resp['email_content']	= $email_content;
		
		//Get Customer Detail
		$custqry="select cust_email from tbl_customer where cust_id=".$POST['cust_id'];
		$cust_rel=mysqli_fetch_assoc($dbcon->query($custqry));
		$resp['to_email_id']	= strtolower($cust_rel['cust_email']);
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "send_mail") {
		//var_dump($POST);
		//exit;
		$inquiry_id=strtolower($POST['email_ref_id']);
		$to_email_id=strtolower($POST['to_email_id']);
		$ccemail_id=strtolower($POST['ccemail_id']);
		$bccemail_id=strtolower($POST['bccemail_id']);
		$email_subject=$_POST['email_subject'];
		$email_content=$_POST['email_content'];
		if(!empty($_FILES['email_attach']['tmp_name'])) {
			$file = upload_mail_attch_file($_FILES,$dbcon);
		}
		
		$files=array();
		array_push($files,$file);
		$resp=final_send_email($to_email_id,$ccemail_id,$bccemail_id,$email_subject,$email_content,$files);
		unlink(MAIL_ATTACH_UPING.$file);
		
		$arr['msg']=array();
		if($resp['code']=='success'){
			$arr['msg']='1';
		}
		else{
			$arr['msg']='0';
		}
		echo json_encode($arr);
	}
	else if(strtolower($POST['mode']) == "load_po_req_datatable") {
		$edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);

		$where='';
		$appData = array();
		$i=1;
		$aColumns = array('trn.bom_trn_id','so.sales_order_no','bom.bom_no', 'pro.product_name', 'trn.out_stk', 'unit.unit_name');
		$sIndexColumn = "trn.bom_trn_id";
		$isWhere = array("trn.bom_trn_status != 2 and trn.req_status=1 and trn.p_done_status=0 ".$where);
		$sTable = "tbl_bom_trn as trn";			
		$isJOIN = array('left join tbl_bom as bom on bom.bom_id=trn.bom_id', 'left join tbl_sales_order as so on so.sales_order_id=bom.sales_order_id', 'left join tbl_product as pro on pro.product_id=trn.req_product_id', 'left join unit_mst as unit on unit.unitid=trn.req_unitid');
		$hOrder = "trn.bom_trn_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sales_order_no'];
			$row_data[] = $row['bom_no'];
			$row_data[] = $row['product_name'];
			$row_data[] = $row['out_stk'].' '.$row['unit_name'];
				
			$aprv_btn='';$cng_sts='';
			if($edit_btn_per){ 
				$aprv_btn='<input type="checkbox" class="form-control" style="width:26px;" id="allchk'.$row['bom_trn_id'].'" name="chk" value="'.$row["bom_trn_id"].'">';
				$cng_sts='<button type="button" class="btn btn-xs btn-success" data-original-title="Change Status to ordered" data-toggle="tooltip" data-placement="top" onclick="cng_sts_po_req('.$row['bom_trn_id'].')"><i class="fa fa-check"></i></button>';
			}
		
		
			$row_data[] = $aprv_btn.' '.$cng_sts;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add_req_po_qty") {
		$req_trn_ids=$POST['req_trn_ids'];
		if($req_trn_ids=='ON'){ unset($req_trn_ids[0]);}//unset first element if select all
		$req_trn_ids=array_filter($req_trn_ids);//Remove 0 Values
		
		
		//Delete Temp Data
		$deltrmid=$dbcon->query('DELETE FROM tbl_purchaseordertrn where purchaseordertrn_status=3 and user_id='.$_SESSION['user_id']);
		$k=0;
		foreach($req_trn_ids as $trn_arr){
			//Copy temp Data
			$bomtrn_qry="select trn.* from tbl_bom_trn as trn where bom_trn_id=".$trn_arr;
			$bomtrn_qry_rs=$dbcon->query($bomtrn_qry);
			while($bomtrn_rel=mysqli_fetch_assoc($bomtrn_qry_rs)){
				$info1['product_id']		= $bomtrn_rel['req_product_id'];
				$info1['description']		= $bomtrn_rel['req_product_desc'];
				$info1['product_qty']		= floatval($bomtrn_rel['out_stk']);
				$info1['unit_id']			= $bomtrn_rel['req_unitid'];
				$info1['product_rate']		= $bomtrn_rel['req_product_rate'];
				$info1['product_amount']	= ((floatval($bomtrn_rel['out_stk']))*($bomtrn_rel['req_product_rate']));
				$info1['product_total']		= ((floatval($bomtrn_rel['out_stk']))*($bomtrn_rel['req_product_rate']));
				$info1['bom_trn_id']		= $bomtrn_rel['bom_trn_id'];
				$info1['user_id']			= $_SESSION['user_id'];
				$info1['purchaseordertrn_status']= 3;
				
				$inserid=add_record("tbl_purchaseordertrn", $info1, $dbcon);
			}
			
			$k++;
		}
	}
	else if(strtolower($POST['mode']) == "cng_sts_po_req") {
		$info['p_done_status']=1;
		$updateid=update_record("tbl_bom_trn", $info, "bom_trn_id=".$POST['bom_trn_id'], $dbcon);
		
		if($updateid)
			echo "1";
		else
			echo "0";
	}
	else if(strtolower($POST['mode']) == "load_prf_det") {
		$resp['prf_trnhtml']=load_po_prf_trn($dbcon,$POST['prf_entry_id'],"");
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "change_pur_done_sts") {
		$info['purchase_status']	= $POST['purchase_status'];
		$updateinvoiceid=update_record('tbl_purchaseorder', $info, "purchaseorder_id=".$POST['purchaseorder_id'], $dbcon);	
		
		if($updateinvoiceid)
			echo "1";	
		else
			echo "0";			
	}


function upload_mail_attch_file($FILES)
{
	$rand=rand(0,99999999);
	if(!empty($FILES['email_attach']['tmp_name'])) {
		$temp = explode(".", $FILES["email_attach"]["name"]);
		$extension = strtolower(end($temp));
		$File = "mail_attch_".$rand.".".$extension;
		$tmp_name = $FILES["email_attach"]["tmp_name"];
		move_uploaded_file($tmp_name,MAIL_ATTACH_UPING.$File);

		return  $File;				
	}
}
function upd_bomtrn_req_sts($dbcon,$purchaseorder_id){
	$trn_qry="SELECT GROUP_CONCAT(bom_trn_id) as bom_trn_id FROM `tbl_purchaseordertrn` WHERE purchaseordertrn_status=0 and purchaseorder_id=".$purchaseorder_id;
	$trn_qry_rel=mysqli_fetch_assoc($dbcon->query($trn_qry));
	
	$upd_qry="UPDATE `tbl_bom_trn` set p_done_status=1 WHERE find_in_set(bom_trn_id,'".$trn_qry_rel['bom_trn_id']."')";
	$upd_qry_rs=$dbcon->query($upd_qry);
}

function upload_attach($FILES)
{
	$rand=rand(0,99999);
	if(!empty($FILES['po_attach']['tmp_name'])) {
		$temp = explode(".", $FILES["po_attach"]["name"]);
		$extension = strtolower(end($temp));
	
		$File = "po_attach".$rand.".".$extension;
		$tmp_name = $FILES["po_attach"]["tmp_name"];
		move_uploaded_file($tmp_name,SO_ATTACH_UPING.$File);
		return  $File;				
	}
}
?>