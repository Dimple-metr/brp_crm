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
		
		$where="";
		$appData = array();
		$i=1;
		$aColumns = array('bom.bom_mst_id', 'pro.product_name', 'bom.finish_pro_qty', 'bom.cdate','bom.bom_mst_status','bom.user_id');
		$sIndexColumn = "bom.bom_mst_id";
		$isWhere = array("bom.bom_mst_status=0 ".$where." and bom.company_id in (0,$_SESSION[company_id])");
		$sTable = "tbl_master_bom as bom";			
		$isJOIN = array('left join tbl_product as pro on pro.product_id=bom.product_id');
		$hOrder = "bom.bom_mst_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['product_name'];
			$row_data[] = $row['finish_pro_qty'];
			
			$edit_btn='';$delete_btn='';
			if($edit_btn_per){
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'master_bom_edit/'.$row['bom_mst_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_master_bom('.$row['bom_mst_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$row_data[] = $edit_btn.' '.$delete_btn; 
			$appData[] = $row_data;
			$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
			$row['res']='';
			$tr = $dbcon -> query("SELECT `bom_mst_id` FROM `tbl_master_bom` WHERE bom_mst_status=0 and `product_id` = '".$POST["product_id"]."' and company_id=".$_SESSION['company_id']);
			if($tr->num_rows > 0) {
				$resp['msg']='-1';
			}
			else {
				
				$info['product_id']			= $POST['product_id'];
				$info['finish_pro_qty']		= $POST['finish_pro_qty'];
				
				$info['cdate']				= date("Y-m-d H:i:s");
				$info['user_id']			= $_SESSION['user_id'];
				$info['company_id']			= $_SESSION['company_id'];
				
				$inserid=add_record('tbl_master_bom', $info, $dbcon);
				
		/*Update Data in Trn Table Start*/
		if($inserid){
			$infotrn['bom_mst_id']			= $inserid;
			$infotrn['bom_mst_trn_status']	= 0;
			$updatetrnid=update_record('tbl_master_bom_trn', $infotrn,"bom_mst_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		//Update Actual Req Qty
		$f_qty=floatval($POST['finish_pro_qty']);
		$upd_act_qty=$dbcon->query("update `tbl_master_bom_trn` set act_req_qty = req_product_qty/".$f_qty." where bom_mst_id=".$inserid);
		
				
				if($inserid){
					$resp['msg']='1';
				}
				else{
					$resp['msg']='0';
				}
			}
			echo json_encode($resp);
		}
		else if(strtolower($POST['mode']) == "edit") {
		
			$info['product_id']			= $POST['product_id'];
			$info['finish_pro_qty']		= $POST['finish_pro_qty'];
			
			$info['cdate']				= date("Y-m-d H:i:s");
			$info['user_id']			= $_SESSION['user_id'];
			
			$updateid=update_record('tbl_master_bom', $info,"bom_mst_id=".$POST['eid'] , $dbcon);
			
		//Update Actual Req Qty
		$f_qty=floatval($POST['finish_pro_qty']);
		$upd_act_qty=$dbcon->query("update `tbl_master_bom_trn` set act_req_qty = req_product_qty/".$f_qty." where bom_mst_id=".$POST['eid']);
			
			if($updateid){
				$resp['msg']='2';
			}
			else{
				$resp['msg']='0';
			}
			
			echo json_encode($resp);
		}
		else if(strtolower($POST['mode']) == "delete") {
			
			$info['bom_mst_status']='2';
			$updateid=update_record('tbl_master_bom', $info,"bom_mst_id=".$POST['bom_mst_id'] , $dbcon);
			
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
		$info1['req_unitid']		= $POST['req_unitid'];
		$info1['user_id']			= $_SESSION['user_id'];
		
		$table='tbl_master_bom_trn';$tableid='bom_mst_trn_id';
		if(!empty($POST['bom_mst_id'])) {
			$info1['bom_mst_id']= $POST['bom_mst_id'];
		}
		else{
			$info1['bom_mst_trn_status']= 3;
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
		if($POST['bom_mst_id']){
			$query="select trn.*,pro.product_name,unit.unit_name from tbl_master_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_mst_trn_status=0 and trn.bom_mst_id=".$POST['bom_mst_id']." order by bom_mst_trn_id DESC";
		}
		else{
			$query="select trn.*,pro.product_name,unit.unit_name from tbl_master_bom_trn as trn
			left join tbl_product as pro on pro.product_id=trn.req_product_id 
			left join unit_mst as unit on unit.unitid=trn.req_unitid
			where bom_mst_trn_status=3 and trn.user_id=".$_SESSION['user_id']." order by bom_mst_trn_id DESC";
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
						Desc: '.nl2br($rel['req_product_desc']).'
					</td>
					<td style="vertical-align:top;" class="text-center">
						'.$rel['req_product_qty'].' '.$rel['unit_name'].'
					</td>
					<td style="vertical-align:top"> 
						<button type="button" class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_bom_trn_data('.$rel['bom_mst_trn_id'].')"><i class="fa fa-pencil"></i></button>';
			
				$str.=' <button type="button" class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_bom_trn_data('.$rel['bom_mst_trn_id'].')">X</button>';
			
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
		$q = $dbcon -> query("SELECT mst.* FROM tbl_master_bom_trn as mst WHERE bom_mst_trn_id = '$POST[bom_mst_trn_id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	else if(strtolower($POST['mode'])== "delete_bom_trn_data") {
		$row=array();
		$info['bom_mst_trn_status']=2;
		$updateid=update_record('tbl_master_bom_trn', $info, "bom_mst_trn_id=".$POST['bom_mst_trn_id'], $dbcon);
		
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
	else if(strtolower($POST['mode'])== "chk_exist_bom") {
		$pro_qry="select bom_mst_id from tbl_master_bom where bom_mst_status=0 and product_id=".$POST['product_id'];
		$pro_rel=mysqli_num_rows($dbcon->query($pro_qry));
		if($pro_rel){
			echo '-1';
		}
		else{
			echo '1';
		}
	}
		
		
?>	