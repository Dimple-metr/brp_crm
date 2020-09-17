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
		$where.="  and bom.bom_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND bom.bom_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('bom.bom_id', 'bom.bom_no', 'bom.bom_date', 'so.sales_order_no', 'pro.product_name', 'bom.cdate','bom.bom_status','bom.user_id','bom.sales_order_id');
		$sIndexColumn = "bom.bom_id";
		$isWhere = array("bom.bom_status=0 ".$where." and bom.company_id in (0,$_SESSION[company_id])");
		$sTable = "tbl_bom as bom";
		$isJOIN = array('left join tbl_sales_order as so on so.sales_order_id=bom.sales_order_id', 'left join tbl_sales_order_trn as sotrn on sotrn.so_trn_id=bom.so_trn_id','left join tbl_product as pro on pro.product_id=sotrn.product_id');
		$hOrder = "bom.bom_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['bom_no'];
			$row_data[] = $row['bom_date'];
			$row_data[] = $row['sales_order_no'];
			$row_data[] = $row['product_name'];
			
			$edit_btn='';$delete_btn='';$bom_po_req='';$bom_print='';
			if($edit_btn_per){
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'bom_edit/'.$row['bom_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_bom('.$row['bom_id'].','.$row['sales_order_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$bom_po_req=' <a class="btn btn-xs btn-primary" data-original-title="Request Out of Stock Qty" data-toggle="tooltip" data-placement="top" href="'.ROOT.'bom_stock_req/'.$row['bom_id'].'"><i class="fa fa-plus"></i></a>';
			
			$bom_print=' <a class="btn btn-xs btn-info" data-original-title="Print BOM" data-toggle="tooltip" data-placement="top" href="'.ROOT.'bom_print/'.$row['bom_id'].'"><i class="fa fa-print"></i></a>';
			
			$row_data[] = $bom_print.' '.$edit_btn.' '.$delete_btn.' '.$bom_po_req; 
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$info['bom_no']			= load_bom_no($dbcon);
		//Update Start series of No
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE status=0 and type_id=4 and company_id=".$_SESSION['company_id']);
		
		$info['bom_date']		= date("Y-m-d",strtotime($POST['bom_date']));
		$info['sales_order_id']		= $POST['sales_order_id'];
		$info['so_trn_id']			= $POST['so_trn_id'];
		$info['bom_trn_ttl']		= $POST['bom_trn_ttl'];
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		$inserid=add_record('tbl_bom', $info, $dbcon);
		
		/*Update Data in Trn Table Start*/
		if($inserid){
			$infotrn['bom_id']			= $inserid;
			$infotrn['bom_trn_status']	= 0;
			$updatetrnid=update_record('tbl_bom_trn', $infotrn,"bom_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		
		//Close SO For BOM
		$upd_so_sts=upd_so_sts($dbcon,$POST['sales_order_id']);
		
		
		
		if($inserid){
			$resp['msg']='1';
		}
		else{
			$resp['msg']='0';
		}
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['bom_no']			= $_POST['bom_no'];
		$info['bom_date']		= date("Y-m-d",strtotime($POST['bom_date']));
		$info['sales_order_id']		= $POST['sales_order_id'];
		$info['so_trn_id']			= $POST['so_trn_id'];
		$info['bom_trn_ttl']		= $POST['bom_trn_ttl'];
		
		$info['cdate']				= date("Y-m-d H:i:s");
		$info['user_id']			= $_SESSION['user_id'];
		
		$updateid=update_record('tbl_bom', $info,"bom_id=".$POST['eid'] , $dbcon);
		
		
		if($updateid){
			$resp['msg']='2';
		}
		else{
			$resp['msg']='0';
		}
		
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['bom_status']='2';
		$updateid=update_record('tbl_bom', $info,"bom_id=".$POST['bom_id'] , $dbcon);
		
		$infotrn['bom_trn_status']='2';
		$updatestrnid=update_record('tbl_bom_trn', $infotrn, "bom_id=".$POST['bom_id'], $dbcon);
		
		$upd_so_qry="update tbl_sales_order set bom_done_status=0 where sales_order_id=".$POST['sales_order_id'];
		$upd_so_qry_rs=$dbcon->query($upd_so_qry);
		
		if($updateid){
			echo 1;
		}
		else{
			echo 0;
		}
	}
	else if(strtolower($POST['mode']) == "add_bom_trn_data") {
		
		$info1['req_product_id']	= $POST['req_product_id'];
		$info1['req_product_desc']	= $_POST['req_product_desc'];
		$info1['req_product_qty']	= $POST['req_product_qty'];
		$info1['req_product_rate']	= $POST['req_product_rate'];
		$info1['req_unitid']		= $POST['req_unitid'];
		$info1['req_product_amount']= $POST['req_product_amount'];
		$info1['user_id']			= $_SESSION['user_id'];
		
		$table='tbl_bom_trn';$tableid='bom_trn_id';
		if(!empty($POST['bom_id'])) {
			$info1['bom_id']= $POST['bom_id'];
		}
		else{
			$info1['bom_trn_status']= 3;
		}
		
		if(empty($POST['edit_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
		}
		
	}
	else if(strtolower($POST['mode'])== "load_bom_trn_data") {
		$str='';
		if($POST['bom_id']){
			$query="select trn.*,pro.product_name,unit.unit_name from tbl_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_trn_status=0 and trn.bom_id=".$POST['bom_id']." order by bom_trn_id DESC";
		}
		else{
			$query="select trn.*,pro.product_name,unit.unit_name from tbl_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_trn_status=3 and trn.user_id=".$_SESSION['user_id']." order by bom_trn_id DESC";
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
					<strong>Desc:</strong> '.(nl2br($rel['req_product_desc'])).'
				</td>
				<td style="vertical-align:top;" class="text-center">
				'.$rel['req_product_qty'].' '.$rel['unit_name'].'
				</td>
				<td style="vertical-align:top;" class="text-right">
					'.$rel['req_product_rate'].'
				</td>
				<td style="vertical-align:top;" class="text-right">
					'.$rel['req_product_amount'].'
					<input type="hidden" name="req_product_amount_ttl[]" value="'.$rel['req_product_amount'].'">
				</td>
				<td style="vertical-align:top"> 
				<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_bom_trn_data('.$rel['bom_trn_id'].')"><i class="fa fa-pencil"></i></button>';
				
				$str.=' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_bom_trn_data('.$rel['bom_trn_id'].')">X</button>';
				
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
	else if(strtolower($POST['mode'])== "edit_bom_trn_data") {
		$q = $dbcon -> query("SELECT mst.* FROM tbl_bom_trn as mst WHERE bom_trn_id = '$POST[bom_trn_id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_bom_trn_data") {
		$row=array();
		$info['bom_trn_status']=2;
		$updateid=update_record('tbl_bom_trn', $info, "bom_trn_id=".$POST['bom_trn_id'], $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "load_product_dtls") {
		$pro_qry="select * from tbl_product where product_id=".$POST['product_id'];
		$pro_rel=mysqli_fetch_assoc($dbcon->query($pro_qry));
		echo json_encode($pro_rel);
	}
	else if(strtolower($POST['mode'])== "load_bom_no") {
		echo $resp= load_bom_no($dbcon);
	}
	else if(strtolower($POST['mode'])== "load_sales_order_data") {
		$resp['html_resp']=get_sales_order_trn($dbcon,"",$POST['sales_order_id']);
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "load_sales_order_trn") {
		$deltempid=delete_record('tbl_bom_trn', "bom_trn_status=3 and user_id=".$_SESSION['user_id'], $dbcon);
		
		$get_qt_qry="select * from tbl_sales_order_trn where so_trn_id=".$POST['so_trn_id'];
		$get_qt_rel=mysqli_fetch_assoc($dbcon->query($get_qt_qry));
		
		//Get Quot Budget TRN Data
		
		
		//Get Quot Budget Data Trn
		$copy_qry="Insert into tbl_bom_trn (req_product_id,req_product_desc,req_product_qty,req_product_rate,req_unitid,req_product_amount,bom_trn_status,user_id)
		SELECT req_product_id,req_product_desc,req_product_qty,req_product_rate,req_unitid,req_product_amount,3,".$_SESSION['user_id']." FROM `tbl_quot_budget_trn` where quot_budget_trn_status=0 and quot_trn_id=".$get_qt_rel['quot_trn_id'];
		$copy_qry_rs=$dbcon->query($copy_qry);
		
	}
	else if(strtolower($POST['mode'])== "req_po_qty") {
		$req_trn_ids=$POST['req_trn_ids'];
		$req_trn_ids=array_filter(explode(",",$req_trn_ids));//Remove 0 Values
		$out_stk=array_filter(explode(",",$POST['out_stk']));//Remove 0 Values
		
		//Changes Trn status to Requested
		$k=0;
		foreach($req_trn_ids as $trn_arr){
			$info1['req_status']		= 1;
			$info1['out_stk']			= floatval($out_stk[$k]);
			$upd_qry=update_record('tbl_bom_trn', $info1, "bom_trn_id=".$trn_arr, $dbcon);
		}
		
		/*
		//Delete Temp Data
		$deltrmid=$dbcon->query('DELETE FROM tbl_purchaseordertrn where purchaseordertrn_status=3 and user_id='.$_SESSION['user_id']);
		$k=0;
		foreach($req_trn_ids as $trn_arr){
			//var_dump($trn_arr); 
			if(floatval($out_stk[$k])){
				//Copy temp Data
				$bomtrn_qry="select trn.* from tbl_bom_trn as trn where bom_trn_id=".$trn_arr;
				$bomtrn_qry_rs=$dbcon->query($bomtrn_qry);
				while($bomtrn_rel=mysqli_fetch_assoc($bomtrn_qry_rs)){
					$info1['product_id']		= $bomtrn_rel['req_product_id'];
					$info1['description']		= $bomtrn_rel['req_product_desc'];
					$info1['product_qty']		= floatval($out_stk[$k]);
					$info1['unit_id']			= $bomtrn_rel['req_unitid'];
					$info1['product_rate']		= $bomtrn_rel['req_product_rate'];
					$info1['product_amount']	= ((floatval($out_stk[$k]))*($bomtrn_rel['req_product_rate']));
					$info1['product_total']		= ((floatval($out_stk[$k]))*($bomtrn_rel['req_product_rate']));
					$info1['bom_trn_id']		= $bomtrn_rel['bom_trn_id'];
					$info1['user_id']			= $_SESSION['user_id'];
					$info1['purchaseordertrn_status']= 3;
					
					$inserid=add_record("tbl_purchaseordertrn", $info1, $dbcon);
				}
			}
			$k++;
		}*/
		
	}
	

function load_bom_no($dbcon){
	//Load no by Type ID
	$row=array();
	$query1="select * from tbl_invoicetype where status=0 and type_id=4 and company_id=".$_SESSION['company_id'];
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
function upd_so_sts($dbcon,$sales_order_id){
	//Get SO TRN Count
	$cnt_so_qry="select count(so_trn_id) as ttl_so_cnt from tbl_sales_order_trn where so_trn_status=0 and sales_order_id=".$sales_order_id;
	$cnt_so_rel=mysqli_fetch_assoc($dbcon->query($cnt_so_qry));
	$ttl_so_cnt=floatval($cnt_so_rel['ttl_so_cnt']);
	
	//Get BOM Count
	$cnt_bom_qry="select count(bom_id) as ttl_bom_cnt from tbl_bom 
	where bom_status=0 and sales_order_id=".$sales_order_id;
	$cnt_bom_rel=mysqli_fetch_assoc($dbcon->query($cnt_bom_qry));
	$ttl_bom_cnt=floatval($cnt_bom_rel['ttl_bom_cnt']);
	
	if($ttl_so_cnt==$ttl_bom_cnt){//Compare BOM and SO Counts
		$upd_so_qry="update tbl_sales_order set bom_done_status=1 where sales_order_id=".$sales_order_id;
		$upd_so_qry_rs=$dbcon->query($upd_so_qry);
	}
	
}
?>	