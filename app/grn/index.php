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
		$where.=" and grn_date>='".date('Y-m-d',strtotime($s_date[0]))."' AND grn_date<='".date('Y-m-d',strtotime($s_date[1]))."'";
	
		if($POST['purchaseorder_id']){
			$where.=' and grn.purchaseorder_id='.$POST['purchaseorder_id'];
		}
		
		$appData = array();
		$i=1;
		$aColumns = array('grn_id', 'grn_no', 'grn_date', 'po.purchaseorder_no', 'cust.cust_name', 'grn_status','grn.cdate','grn.user_id','grn.grn_status','grn.purchaseorder_id');
		$sIndexColumn = "grn_id";
		$isWhere = array("grn_status = 0".$where.check_user('grn'));
		$sTable = "tbl_grn as grn";
		$isJOIN = array('left join tbl_customer as cust on cust.cust_id=grn.cust_id', 'left join tbl_purchaseorder as po on po.purchaseorder_id=grn.purchaseorder_id');
		$hOrder = "grn.grn_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['grn_no'];
			$row_data[] = date('d M, Y',strtotime($row['grn_date']));
			//$row_data[] = '<a href="'.ROOT.'poprint/'.$row['purchaseorder_id'].'">'.$row['purchaseorder_no'].'</a>';
			$row_data[] = $row['purchaseorder_no'];
			$row_data[] = $row['cust_name'];
   
			$edit_btn=''; $delete_btn=''; $view='';
			if($edit_btn_per){
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'grn_edit/'.$row['grn_id'].'"><i class="fa fa-pencil"></i></a>'; 
			}
			if($delete_btn_per){
				$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_grn('.$row['grn_id'].','.$row['purchaseorder_id'].')"><i class="fa fa-trash-o"></i></button>'; 
			}  
			//$view=' <a class="btn btn-xs btn-info" data-original-title="View" data-toggle="tooltip" data-placement="top" href="'.ROOT.'grn_view/'.$row['grn_id'].'"><i class="fa fa-eye"></i></a> ';
			
			//$brcd_btn=' <button type="button" class="btn btn-xs btn-primary" data-original-title="Print Barcode" data-toggle="tooltip" data-placement="top" onclick="print_barcode_grn(\''.$row['grn_id'].'\')" ><i class="fa fa-barcode"></i></button>';
			/*$brcd_btn=' <a class="btn btn-xs btn-primary" data-original-title="Print Barcode" data-toggle="tooltip" data-placement="top" href="'.ROOT.'grn_barcode_full_print/'.$row['grn_id'].'" ><i class="fa fa-barcode"></i></a>';*/
			
			/*if($row['grn_status']=='2'){//check if deleted
				$edit_btn='';$view='';$brcd_btn='';
				$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Deleted" data-toggle="tooltip" data-placement="top"><i class="fa fa-times"></i> Deleted</button>';
			}*/
			
			$row_data[] = $edit_btn.' '.$delete_btn.' '.$view;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE type_id=11 and company_id=".$_SESSION['company_id']);
		
		$info['grn_no']			= $POST['grn_no'];
		$info['grn_date']		= date('Y-m-d',strtotime($POST['grn_date']));
		$info['ref_no']			= $POST['ref_no'];
		$info['ref_date']		= date('Y-m-d',strtotime($POST['ref_date']));
		$info['cust_id']		= $POST['cust_id'];
		$info['purchaseorder_id']= $POST['purchaseorder_id'];
		$info['remark']			= $_POST['remark'];
		
		$info['cdate']			= date("Y-m-d H:i:s"); 
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$inserpoid=add_record('tbl_grn', $info, $dbcon);
		
		/*Update Data in Trn Table Start*/
		if($inserpoid){
			$infotrn['grn_id']			= $inserpoid;
			$infotrn['grn_trn_status']	= 0;
			$updatetrnid=update_record('tbl_grn_trn', $infotrn,"grn_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		$UPD_PO=upd_grn_used_status($dbcon, $POST['purchaseorder_id'], 1);

		/*if(!empty($_FILES['grn_file']['tmp_name'][0])) {
			$imgresp = upload_grn_receipt($_FILES,$dbcon,$inserpoid);
		}*/

		if($inserpoid){	
			$arr['msg']="1";							
		}
		else{
			$arr['msg']="0";
		}
		echo json_encode($arr);	
	}
	else if(strtolower($POST['mode']) == "edit") {

		$info['grn_no']			= $POST['grn_no'];
		$info['grn_date']		= date('Y-m-d',strtotime($POST['grn_date']));
		$info['ref_no']			= $POST['ref_no'];
		$info['ref_date']		= date('Y-m-d',strtotime($POST['ref_date']));
		$info['cust_id']		= $POST['cust_id'];
		$info['purchaseorder_id']= $POST['purchaseorder_id'];
		$info['remark']			= $_POST['remark']; 
		
		$info['cdate']			= date("Y-m-d H:i:s"); 
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id']; 
		$updateid=update_record('tbl_grn', $info,"grn_id=".$POST['eid'] , $dbcon);
		 
		$UPD_PO=upd_grn_used_status($dbcon, $POST['purchaseorder_id'], 1);
		
		/*if(!empty($_FILES['grn_file']['tmp_name'][0])) {
			$imgresp = upload_grn_receipt($_FILES,$dbcon,$POST['eid']);
		}*/
		
		if($updateid){	
			$arr['msg']="1";							
		}
		else{
			$arr['msg']="0";
		}
		echo json_encode($arr);	
	}
	else if(strtolower($POST['mode']) == "fieldadd") {
		
		$info1['purchaseorder_id']	= $POST['purchaseorder_id'];
		//$info1['pro_entry_date']	= date('Y-m-d',strtotime($POST['pro_entry_date']));
		$info1['product_id']		= $POST['product_id'];
		$info1['description']		= $_POST['product_des'];
		$info1['product_qty']		= $POST['product_qty'];
		$info1['unit_id']			= $POST['unit_id']; 
		//$info1['branch_id']			= $POST['branch_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		$info1['company_id']		= $_SESSION['company_id'];
		$info1['product_rate']		= $POST['product_rate'];
		$info1['formulaid']			= $POST['formulaid'];
		$info1['product_amount']	= $total=($POST['product_rate']*$POST['product_qty']);
		$info=get_product_tax_common($dbcon,$total,$POST['formulaid']);
		$info1=array_merge($info1,$info);
		$table='tbl_grn_trn';$tableid='grn_trn_id';
		if(!empty($POST['grn_id'])) {
			$info1['grn_id']= $POST['grn_id'];
		}
		else{
			$info1['grn_trn_status']= 3;
		}
		
		if(empty($POST['edit_id'])) {
			$inserid=add_record($table, $info1, $dbcon);
		}
		else {
			$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
		}
		
		//var_dump($info1);
	}
	else if(strtolower($POST['mode'])== "load_grn_trn_data") {
		
		if($POST['grn_id']){
			$query="select mst.*,pro.product_name,cat.unit_name,pro.item_code from tbl_grn_trn as mst
			left join tbl_product as pro on pro.product_id=mst.product_id
			left join unit_mst as cat on cat.unitid=mst.unit_id  
			where grn_trn_status=0 and mst.grn_id=".$POST['grn_id'];
		}
		else{
			$query="select mst.*,pro.product_name,cat.unit_name,pro.item_code from tbl_grn_trn as mst
			left join tbl_product as pro on pro.product_id=mst.product_id
			left join unit_mst as cat on cat.unitid=mst.unit_id 
			where grn_trn_status=3 and mst.user_id=".$_SESSION['user_id'];
		}
		$result=$dbcon->query($query);
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
				echo '<tr> 
					<td style="vertical-align:top;text-align:center;">'.$i.'</td>
					<td style="vertical-align:top;">
						<strong>'.$rel['product_name'].'</strong>';
						echo ''.(!empty($rel['description'])?'<br/><strong>Desc.</strong> :'.$rel['description']:'').'
					</td>
					<td style="vertical-align:top;" class="text-center">
						'.$rel['product_qty'].'
					</td>
					<td style="vertical-align:top" class="text-center">
						'.$rel['unit_name'].'
					</td>
					<td style="vertical-align:top"> 
						<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_grn_data('.$rel['grn_trn_id'].')"><i class="fa fa-pencil"></i></button>';
			if(!$POST['grn_id']){
				echo ' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_grn_data('.$rel['grn_trn_id'].','.$rel['purchaseorder_id'].')">X</button>';
			}
					echo '</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="10" class="text-center">NO DATA FOUND</td></tr>';
		}
	}
	else if(strtolower($POST['mode'])== "preedit") {
		$q = $dbcon -> query("SELECT mst.* FROM tbl_grn_trn as mst WHERE grn_trn_id = '$POST[grn_trn_id]'");
		$r = $q->fetch_assoc();
		
		//$r['po_html_resp']=get_po_for_grn($dbcon,$r['purchaseorder_id'],'Edit');
		$r['pro_html_resp']=get_po_for_grn_trn($dbcon,$r['purchaseorder_id'],$r['product_id'],'Edit');

		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_data") {
		$row=array();
		$info['grn_trn_status']=2;	
		$updateid=update_record('tbl_grn_trn', $info, "grn_trn_id=".$POST['grn_trn_id'] , $dbcon);
		
		//$UPD_PO=upd_grn_used_status($dbcon, $POST['purchaseorder_id'], 2);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "delete_grn") {
		$row=array();
		$info['grn_status']=2;
		$updateid=update_record('tbl_grn', $info, "grn_id=".$POST['grn_id'] , $dbcon);
		$infotrn['grn_trn_status']=2;	
		$updatetrnid=update_record('tbl_grn_trn', $infotrn, "grn_id=".$POST['grn_id'] , $dbcon);
		
		
		$upd_po_sts=upd_grn_used_status($dbcon, $POST['purchaseorder_id'], 2);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		echo json_encode($row);
	} 
	else if(strtolower($POST['mode'])== "load_purhcase_order_data") {
		/*$brnch_qry="select branch_id from tbl_purchaseorder where purchaseorder_id=".$POST['purchaseorder_id'];
		$brnch_rel=mysqli_fetch_assoc($dbcon->query($brnch_qry));
		$resp['branch_id'] = $brnch_rel['branch_id'];*/
		$resp['pro_html'] = get_po_for_grn_trn($dbcon,$POST['purchaseorder_id'],'','Add');
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "load_po_ven_wise") {
		$resp['pro_html'] = get_po_for_grn($dbcon,'',$POST['cust_id'],'Add');
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "load_productdetail") {
		$purchaseorder_id=$POST['purchaseorder_id'];$product_id=$POST['product_id'];
		$query="select trn.*,main_grn_qty from tbl_purchaseordertrn as trn
		left join (SELECT purchaseorder_id,product_id,sum(product_qty) as main_grn_qty FROM tbl_grn_trn as chtrn where chtrn.grn_trn_status!=2 and chtrn.purchaseorder_id=".$purchaseorder_id." group by chtrn.product_id,chtrn.purchaseorder_id) as chtrn on chtrn.product_id=trn.product_id
		where trn.purchaseordertrn_status=0 and trn.purchaseorder_id=".$purchaseorder_id." and trn.product_id=".$product_id;
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$rel['pending_qty']=floatval($rel['product_qty'])-floatval($rel['main_grn_qty']);
		echo json_encode($rel);
	}
	else if(strtolower($POST['mode'])== "load_grn_no") {
		$row=array();
		$query1="select * from tbl_invoicetype where type_id=11 and company_id=".$_SESSION['company_id'];
		$rows=mysqli_fetch_assoc($dbcon->query($query1));
		$id=$rows['taxinvoice_start'];
		$id=$id+1;
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
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "delete_attch") {
		$row=array();
		$info['grn_attch_status']=2;	
		$updateid=update_record('tbl_grn_attch', $info, "grn_attch_id=".$POST['grn_attch_id'] , $dbcon);
		 
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		echo json_encode($row);
	} 
	
function upd_grn_used_status($dbcon,$purchaseorder_id,$flag){
	if($flag=='1'){
		//get Same Qty Data
		$get_dt_qry="SELECT SUM(potrn.product_qty) as po_qty,(SELECT SUM(grntrn.product_qty) FROM `tbl_grn_trn` as grntrn where grntrn.grn_trn_status=0 and grntrn.purchaseorder_id=".$purchaseorder_id." and grntrn.product_id=potrn.product_id) as grn_qty FROM `tbl_purchaseordertrn` as potrn where potrn.purchaseordertrn_status=0 and potrn.purchaseorder_id=".$purchaseorder_id." group by potrn.product_id";
		$get_dt_rs=$dbcon->query($get_dt_qry);
		$same_qty=true;
		while($get_dt_rel=mysqli_fetch_assoc($get_dt_rs)){
			//compare pending qty
			if($get_dt_rel['po_qty']!=$get_dt_rel['grn_qty']){
				$same_qty=false;
			}
		}
	}
	
	//update PO if all used in GRN
	if($same_qty){
		$upd_po_qry=$dbcon->query("update tbl_purchaseorder set used_grn_status=1 where purchaseorder_id=".$purchaseorder_id);
	}
	else{
		$upd_po_qry=$dbcon->query("update tbl_purchaseorder set used_grn_status=0 where purchaseorder_id=".$purchaseorder_id);
	}
}
/*
function upload_grn_receipt($FILES,$dbcon,$grn_id){
	$cnt=count($_FILES['grn_file']['name']);
	for( $i=0 ; $i < $cnt ; $i++ ) {
		if(!empty($_FILES['grn_file']['tmp_name'][$i])) {
			$rand=rand(0,999999);
			$temp = explode(".", $_FILES["grn_file"]["name"][$i]);
			$extension = strtolower(end($temp));
			$file_name = $_FILES['grn_file']['name'][$i];
			$err = $_FILES["grn_file"]["tmp_name"][$i];
			$file_name = "grn_rec_".$rand.'.'.$extension;
			move_uploaded_file($err,RECEIPT_FILE_UPING.$file_name);
			$attch['grn_id']		= $grn_id;
			$attch['grn_file']		= $file_name;
			$attch['cdate']			= date("Y-m-d H:i:s"); 
			$attch['user_id']		= $_SESSION['user_id'];
			$attch['company_id']	= $_SESSION['company_id']; 
			$inserid=add_record('tbl_grn_attch', $attch, $dbcon);
			//return 	$file_name;
		}
	}
}*/

?>