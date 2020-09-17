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
		$where.="  and issue_entry_date >= '".date('Y-m-d',strtotime($s_date[0]))."' AND issue_entry_date <= '".date('Y-m-d',strtotime($s_date[1]))."'";
		
		$appData = array();
		$i=1;
		$aColumns = array('inv.issue_entry_id','inv.issue_entry_no','inv.issue_entry_date','inv.remark','usr.user_name','inv.status','inv.cdate','inv.userid');
		$sIndexColumn = "issue_entry_id";
		$isWhere = array("inv.status = 0".$where.check_user('inv'));
		$sTable = "tbl_issue_entry as inv";
		$isJOIN = array('left join users as usr on usr.user_id=inv.userid');
		$hOrder = "inv.issue_entry_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['issue_entry_no'];
			$row_data[] = date('d M, Y',strtotime($row['issue_entry_date']));
			$row_data[] = nl2br($row['remark']);
			$row_data[] = $row['user_name'];
			
			$delete='';$edit='';$print_btn='';
			if($edit_btn_per){
				$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'issue_entry_edit/'.$row['issue_entry_id'].'"><i class="fa fa-pencil"></i></a>';
			}
			if($delete_btn_per){
				$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_issue_entry('.$row['issue_entry_id'].')"><i class="fa fa-trash-o"></i></button>';
			}
			
			$print_btn='<a class="btn btn-xs btn-primary" data-original-title="Print" data-toggle="tooltip" data-placement="top" href="'.ROOT.'issue_entry_print/'.$row['issue_entry_id'].'"><i class="fa fa-print"></i></a>';
			
			$row_data[] = $print_btn.' '.$edit.' '.$delete;
			
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		
		$query_invoicetype = $dbcon->query("UPDATE tbl_invoicetype SET taxinvoice_start = taxinvoice_start +1 WHERE type_id=9 and company_id=".$_SESSION['company_id']);

		$info['issue_entry_no']		= $POST['issue_entry_no'];
		$info['issue_entry_date']	= date('Y-m-d',strtotime($POST['issue_entry_date']));
		$info['remark']		= $_POST['remark'];
		
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['userid']			= $_SESSION['user_id'];
		$info['company_id']		= $_SESSION['company_id'];
		$inserpoid=add_record('tbl_issue_entry', $info, $dbcon);
		
		/*Update Data in Trn Table Start*/
		if($inserpoid){
			$infotrn['issue_entry_id']			= $inserpoid;
			$infotrn['issue_trn_status']		= 0;
			$updatetrnid=update_record('tbl_issue_entry_trn', $infotrn,"issue_trn_status=3 and user_id=".$_SESSION['user_id'] , $dbcon);
		}
		/*Update Data in Trn Table End*/
		
		if($inserpoid) {	
			$arr['msg']="1";							
		}
		else
			$arr['msg']="0";
	
		echo json_encode($arr);		 
	}
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['issue_entry_no']		= $POST['issue_entry_no'];
		$info['issue_entry_date']	= date('Y-m-d',strtotime($POST['issue_entry_date']));
		$info['remark']			= $_POST['remark'];
		
		$info['cdate']				= 	date("Y-m-d H:i:s");
		$info['userid']			= $_SESSION['user_id'];
		$updateid=update_record('tbl_issue_entry', $info,"issue_entry_id=".$POST['eid'] , $dbcon);

		if($updateid) {	
			$arr['msg']="update"; 
		}
		else
			$arr['msg']=0;
	
		echo json_encode($arr);	
	}
	else if(strtolower($POST['mode']) == "delete") {
		
		$info['status']		= 2;
		$info1['issue_trn_status']		= 2;
		$updateinvoiceid=update_record(' tbl_issue_entry', $info,"issue_entry_id=".$POST['eid'] , $dbcon);	
		$updatetrancationid=update_record('tbl_issue_entry_trn', $info1,"issue_entry_id=".$POST['eid'] , $dbcon);
		
		if($updatetrancationid)
			echo "1";	
		else
			echo "0";			
	}
	else if(strtolower($POST['mode']) == "fieldadd") {
		
		$info1['product_id']		= $POST['product_id'];
		$info1['description']		= $_POST['product_des'];
		$info1['product_qty']		= $POST['product_qty'];
		$info1['unit_id']			= $POST['unit_id'];
		$info1['user_id']			= $_SESSION['user_id'];
		
		$table='tbl_issue_entry_trn';$tableid='issue_trn_id';
		if(!empty($POST['issue_entry_id'])) {
			$info1['issue_entry_id']= $POST['issue_entry_id']; 
		}
		else{
			$info1['issue_trn_status']= 3;
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
			$query="select trn.*,product.product_name,cat.unit_name from tbl_issue_entry_trn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.issue_trn_status=0 and trn.issue_entry_id=".$POST['eid'];
		}
		else{
			$query="select trn.*,product.product_name,cat.unit_name from tbl_issue_entry_trn as trn 
			left join unit_mst as cat on cat.unitid=trn.unit_id 
			left join tbl_product as product on product.product_id=trn.product_id 
			where trn.issue_trn_status=3 and trn.user_id=".$_SESSION['user_id'];
		}
		$result=$dbcon->query($query);
		echo ' <div class="form-group">
		<div class="col-md-12 col-xs-11">
		<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
			<tr id="field">
				<th class="text-center" width="30%">Product Name</th>
				<th class="text-center" width="5%">Qty</th>
				<th class="text-center" width="6%">Unit</th>
				<th class="text-center" width="5%">Action</th>
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
				<td style="vertical-align:top" class="text-center">
				'.$rel['unit_name'].'
				</td>
				<input type="hidden" name="amount[]" id="amount'.$i.'" value="'.$rel['product_total'].'"/>
				
				<td style="vertical-align:top">
					<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data('.$rel['issue_trn_id'].');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
					<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data('.$rel['issue_trn_id'].');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
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
	else if(strtolower($POST['mode'])== "preedit") {
		$q = $dbcon -> query("SELECT mst.* FROM tbl_issue_entry_trn as mst WHERE issue_trn_id= '$POST[id]'");
		$r = $q->fetch_assoc();
		echo json_encode($r);
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
		$query1="select * from tbl_invoicetype where type_id=9 and company_id=".$_SESSION['company_id'];
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
	else if(strtolower($POST['mode'])== "delete_data"){
		$row=array();
		$info['issue_trn_status']=2;
		$updateid=update_record("tbl_issue_entry_trn", $info, "issue_trn_id=".$POST['eid'], $dbcon);
		
		if($updateid)
			$row['res']="1";
		else
			$row['res']="0";
		
		echo json_encode($row);
	}
?>