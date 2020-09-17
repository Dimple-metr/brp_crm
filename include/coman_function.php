<?php
function get_year(){
	$minyear= 2018;
	$maxyear=(date('m')<'04') ? date('Y',strtotime('-1 year')) : date('Y');
	 $str="";
	for($y=$minyear;$y<=$maxyear;$y++)
	{
		$sel='';
		if($maxyear==$y)
		{
			$sel='selected="selected"';
		}
		$ny=$y+1;
		$str.="<option ".$sel." value='".$y."'> ".$y."-".$ny."</option>";	
	
	} 
	return $str; 
}
function count_usr_pen_tsk1($dbcon,$task_type_id,$user_id){
	$fis=check_crm_find_in_set($dbcon,$user_id,1);
	//$fis1=' and instr("'.$fis.'",task.assign_user_ids)';
	$fis1=' and instr("'.$user_id.'",task.assign_user_ids)';
	 /* $qry='SELECT count(task.task_id) as ttl_pen_tasks
from tbl_task as task
WHERE task.task_status=0 and task.entry_type=1 and task.alert_date_time!="0000-00-00 00:00:00" and task.alert_date_time!="1970-01-01 05:30:00" and find_in_set('.$_SESSION['user_id'].',task.assign_user_ids) and alert_date_time<"'.date('Y-m-d H:i:s').'" and task.task_type_id='.$task_type_id.' order by task.task_priority_id,task.alert_date_time'; */ 

 $qry='SELECT count(DISTINCT task.task_id) as ttl_pen_tasks
from tbl_task as task
WHERE task.task_status=0 and task.entry_type=1 
and DATE_FORMAT(task.task_due_date,"%Y-%m-%d")<="'.date('Y-m-d').'" 
'.$fis1.' 
and task.task_type_id='.$task_type_id.' 
order by task_due_date DESC'; 


	$qry_rel=mysqli_fetch_assoc($dbcon->query($qry));
	return floatval($qry_rel['ttl_pen_tasks']);
	//return $task_type_id;
	//return $qry;
}
function get_tree_user($dbcon,$user_id,$sel1){
	$query="select us.user_id,us.user_name,rus.user_name as pname from users as us
			left join users as rus on rus.user_id=us.user_report
		where us.user_id=".$user_id;
	$rs_dispatch=$dbcon->query($query);
$str="";	
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel=''; 
		if($rel['user_id']==$sel1)
		{$sel ="selected='selected'";}
		$str.= '<option '.$sel.' value="'.$rel['user_id'].'">'.$rel['user_name'].' - '.$rel['pname'].'</option>';
		
		$query1="select user_id,user_name from users where user_report=".$user_id;
		$rs_dispatch1=$dbcon->query($query1);	
		while($rel1=mysqli_fetch_assoc($rs_dispatch1))
		{
			if(!empty($rel1['user_id'])){
				$str.=get_tree_user($dbcon,$rel1['user_id'],$sel1);
			}
		}
	}
	return $str;
}
function check_crm_find_in_set($dbcon,$user_id,$status){
	$query="select user_id,user_name from users where user_id=".$user_id;
	$rs_dispatch=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		//$sel[]=$user_id;
		if($status==1){
			//$sel=" and find_in_set(".$user_id.",task.assign_user_ids) ";
			$sel= $user_id;
		}else{
			//$sel .=" or find_in_set(".$user_id.",task.assign_user_ids) ";
			$sel= ",".$user_id;
		}
		
		$query1="select user_id,user_name from users where user_report=".$user_id;
		$rs_dispatch1=$dbcon->query($query1);
		$pending_count=mysqli_num_rows($rs);		
		while($rel1=mysqli_fetch_assoc($rs_dispatch1))
		{
			if(!empty($rel1['user_id'])){
				$sel.=check_crm_find_in_set($dbcon,$rel1['user_id'],0);
			}
		}
	}
	return $sel;
}
function count_usr_pen_tsk($dbcon,$task_type_id,$user_id){
	$fis=check_crm_find_in_set($dbcon,$user_id,1);
	$fis1=' and instr("'.$fis.'",task.assign_user_ids)';
	 /* $qry='SELECT count(task.task_id) as ttl_pen_tasks
from tbl_task as task
WHERE task.task_status=0 and task.entry_type=1 and task.alert_date_time!="0000-00-00 00:00:00" and task.alert_date_time!="1970-01-01 05:30:00" and find_in_set('.$_SESSION['user_id'].',task.assign_user_ids) and alert_date_time<"'.date('Y-m-d H:i:s').'" and task.task_type_id='.$task_type_id.' order by task.task_priority_id,task.alert_date_time'; */ 

 $qry='SELECT count(DISTINCT task.task_id) as ttl_pen_tasks
        from tbl_task as task
        WHERE task.task_status=0 and task.entry_type=1 
        and DATE_FORMAT(task.task_due_date,"%Y-%m-%d")<="'.date('Y-m-d').'"
        and task.task_type_id='.$task_type_id.' 
        '.$fis1.'
        order by task_due_date DESC'; 


	$qry_rel=mysqli_fetch_assoc($dbcon->query($qry));
	return floatval($qry_rel['ttl_pen_tasks']);
	//return $task_type_id;
	//return $qry;
}
function get_user_report($dbcon,$user_id){
	$query="select user_id,user_name from users where user_id in (".$user_id.")";
	$rs_dispatch=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$str.= '<option '.$sel.' value="'.$rel['user_id'].'">'.$rel['user_name'].'</option>';
	}
	return $str;
}
function check_user_chein($dbcon,$user_id,$status){
	$query="select user_id,user_name from users where user_id=".$user_id;
	$rs_dispatch=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		//$sel[]=$user_id;
		if($status==1){
			//$sel=" and find_in_set(".$user_id.",task.assign_user_ids) ";
			$sel= $user_id;
		}else{
			//$sel .=" or find_in_set(".$user_id.",task.assign_user_ids) ";
			$sel= ",".$user_id;
		}
		
		$query1="select user_id,user_name from users where user_report=".$user_id;
		$rs_dispatch1=$dbcon->query($query1);
		$pending_count=mysqli_num_rows($rs);		
		while($rel1=mysqli_fetch_assoc($rs_dispatch1))
		{
			if(!empty($rel1['user_id'])){
				$sel.=check_user_chein($dbcon,$rel1['user_id'],0);
			}
		}
	}
	return $sel;
}
function month_name(){
	
	$str.= '<option value="">--Select Month--</option>';
	for($y = 1970; $y <= 2036; $y++){
		 for ($x = 1; $x <= 12; $x++) {
			//$v=$y."-".$x;
			$sel="";
			$v=date("1-".$x."-".$y);
			$d=date("Y-m");
			$d1=date("Y");
			$d2=date("m");
			if($y==$d1){
				if($x==$d2){
					$sel='selected="selected"';
				}
			}
			$month_name = date("F", mktime(0, 0, 0, $x, 10));
			$str.= '<option '.$sel.' value="'.$v.'">'.$y.'-'.$month_name.'</option>';	
		} 
	}
	return $str;
}
function get_inquiry_probability($dbcon,$eid)
{
	$qry="select opp_id,opp_probability from tbl_opportunity_mst where opp_status=0";
	$rs_state=$dbcon->query($qry);	
	$str="<option value=''>Choose Stage</option>";
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['opp_id']==$eid)
		{$sel='selected="selected"';}
		
		$str.= '<option '.$sel.' value="'.$row['opp_id'].'">'.$row['opp_probability'].'</option>';
	}
	return $str;
}


function get_po_all_report($dbcon,$id)
{	
	$str='';
	$query="select * from tbl_purchaseorder where status=0 and approval_status=1 and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Purchase Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['purchaseorder_id']==$id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['purchaseorder_id'].'">'.$rel['purchaseorder_no'].'</option>';
	}
	return $str;
}
function get_po_for_grn($dbcon,$purchaseorder_id,$cust_id,$mode)
{
	$str='';
	if($mode=='Edit'){
		$query="select purchaseorder_id,purchaseorder_no from tbl_purchaseorder where status=0 and purchaseorder_id=".$purchaseorder_id." and cust_id=".$cust_id." and company_id=".$_SESSION['company_id'];
	}
	else{
		$query="select * from tbl_purchaseorder as so where status=0 and (select IFNULL(sum(product_qty),0) as qty from tbl_purchaseordertrn as sosub  where purchaseordertrn_status=0 and sosub.purchaseorder_id=so.purchaseorder_id ) > (select IFNULL(sum(product_qty),0) as qty  from tbl_grn as chall left join tbl_grn_trn as chtrn on chtrn.grn_id=chall.grn_id where grn_status=0 and chtrn.grn_trn_status=0 and chtrn.purchaseorder_id=so.purchaseorder_id) and so.approval_status=1 and so.used_grn_status=0 and so.cust_id=".$cust_id." and company_id=".$_SESSION['company_id'];
	}
	
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Purchase Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['purchaseorder_id']==$purchaseorder_id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['purchaseorder_id'].'">'.$rel['purchaseorder_no'].'</option>';
	}
	return $str;
}
function get_po_for_grn_trn($dbcon,$purchaseorder_id,$product_id,$mode)
{
	$str='';
	if($mode=='Edit'){
		$query="select trn.product_id,pro.product_name from tbl_purchaseordertrn as trn
		left join tbl_product as pro on pro.product_id=trn.product_id
		where trn.purchaseordertrn_status=0 and trn.product_id=".$product_id." and trn.purchaseorder_id=".$purchaseorder_id;
	}
	else{
		$query="select trn.product_id,pro.product_name,trn.product_qty,main_grn_qty from tbl_purchaseordertrn as trn
		left join tbl_product as pro on pro.product_id=trn.product_id
		left join (SELECT purchaseorder_id,product_id,sum(product_qty) as main_grn_qty FROM tbl_grn_trn as chtrn where chtrn.grn_trn_status=0 and chtrn.purchaseorder_id=".$purchaseorder_id." group by chtrn.product_id,chtrn.purchaseorder_id) as chtrn on chtrn.product_id=trn.product_id
		where trn.purchaseordertrn_status=0 and trn.purchaseorder_id=".$purchaseorder_id." having trn.product_qty>main_grn_qty or main_grn_qty is NULL";
	}
	$rs_trn=$dbcon->query($query);	
	$str = '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_trn))
	{	
		$sel='';
		if($rel['product_id']==$product_id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function load_po_prf_trn($dbcon,$prf_entry_id,$trn_id)
{
	 $qry="select trn.product_id,pro.product_name from tbl_prf_ven_rmrk as trn
	inner join tbl_product as pro on pro.product_id=trn.product_id
	where trn.ven_rmrk_status=0 and trn.prf_entry_id=".$prf_entry_id;
	$str='<option value="">Choose Product</option>';
	$rs_type=$dbcon->query($qry);
	while($row=mysqli_fetch_assoc($rs_type))
	{
		$sel='';
		if($row['product_id']==$trn_id)
		{$sel='selected="selected"';}
		$str.= '<option '.$sel.' value="'.$row['product_id'].'">'.$row['product_name'].'</option>';
	}
	return $str;
}
function load_po_prf_no($dbcon,$prf_entry_id,$mode,$user_idd)
{
	if($mode=='Add'){
		
		if($user_idd!=1)
		{
		
		 $qry="select * from tbl_prf_entry where prf_approve_status=1 and status=0 and po_status=0 and user_id=".$_SESSION['user_id']."";
		}
		else
		{
		 	$qry="select * from tbl_prf_entry where prf_approve_status=1 and status=0 and po_status=0";
		
		}
	}
	else{
		$qry="select * from tbl_prf_entry where prf_approve_status=1 status=0 and po_status=1";
	}
	$str='<option value="">Choose PRF No.</option>';
	$rs_type=$dbcon->query($qry);
	while($row=mysqli_fetch_assoc($rs_type))
	{
		$sel='';
		if($row['prf_entry_id']==$prf_entry_id)
		{$sel='selected="selected"';}
		$str.= '<option '.$sel.' value="'.$row['prf_entry_id'].'">'.$row['prf_entry_no'].'</option>';
	}
	return $str;
}
function get_product_stockqty($dbcon,$product_id){
	$query="SELECT pro.product_id,pro.product_name,opening_stock,minimum_stock,purchaseqty, bomplus_qty,  invoiceqty, bom_m_qty, issueqty FROM `tbl_product` as pro 
		
		left join (select sum(purtrn.product_qty) as purchaseqty,purtrn.product_id from tbl_grn_trn as purtrn 
		inner join tbl_grn as pur on pur.grn_id=purtrn.grn_id
		where purtrn.grn_trn_status=0 and pur.grn_status=0 and pur.company_id=".$_SESSION['company_id']." group by purtrn.product_id) as pur on pur.product_id=pro.product_id
	
		left join (select sum(sotrn.product_qty) as bomplus_qty,sotrn.product_id from tbl_bom as bom
		inner join tbl_sales_order_trn as sotrn on sotrn.so_trn_id=bom.so_trn_id
		where bom.bom_status=0 and bom.company_id=".$_SESSION['company_id']." group by sotrn.product_id) as bom_plus on bom_plus.product_id=pro.product_id
		
		left join (select sum(invtrn.product_qty) as invoiceqty,invtrn.product_id from tbl_invoice_trn as invtrn 
		inner join tbl_invoice as invmst on invmst.invoice_id=invtrn.invoice_id where invtrn.invoice_trn_status=0 and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id) as invoice on invoice.product_id=pro.product_id
		
		left join (select sum(bomtrn.req_product_qty) as bom_m_qty,bomtrn.req_product_id from tbl_bom_trn as bomtrn 
		inner join tbl_bom as bom on bom.bom_id=bomtrn.bom_id where bomtrn.bom_trn_status=0 and bom.company_id=".$_SESSION['company_id']." group by bomtrn.req_product_id) as bom_m on bom_m.req_product_id=pro.product_id
		
		left join (select sum(isstrn.product_qty) as issueqty,isstrn.product_id from tbl_issue_entry_trn as isstrn 
		inner join tbl_issue_entry as iss on iss.issue_entry_id=isstrn.issue_entry_id
		where isstrn.issue_trn_status=0 and iss.company_id=".$_SESSION['company_id']." group by isstrn.product_id) as issue on issue.product_id=pro.product_id
		
		where pro.product_status=0 and pro.product_id=".$product_id." group by pro.product_id order by product_name";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	
	$stock=(floatval($rel['opening_stock'])+floatval($rel['purchaseqty'])+floatval($rel['bomplus_qty']))-(floatval($rel['invoiceqty'])+floatval($rel['bom_m_qty'])+floatval($rel['issueqty']));
	return floatval($stock);
}
function getMonthNumber($monthStr) {
//e.g, $month='Jan' or 'January' or 'JAN' or 'JANUARY' or 'january' or 'jan'
$m = ucfirst(strtolower(trim($monthStr)));
switch ($m) {
    case "January":        
    case "Jan":
        $m = "01";
        break;
    case "February":
    case "Feb":
        $m = "02";
        break;
    case "March":
    case "Mar":
        $m = "03";
        break;
    case "April":
    case "Apr":
        $m = "04";
        break;
    case "May":
        $m = "05";
        break;
    case "June":
    case "Jun":
        $m = "06";
        break;
    case "July":        
    case "Jul":
        $m = "07";
        break;
    case "August":
    case "Aug":
        $m = "08";
        break;
    case "September":
    case "Sep":
        $m = "09";
        break;
    case "October":
    case "Oct":
        $m = "10";
        break;
    case "November":
    case "Nov":
        $m = "11";
        break;
    case "December":
    case "Dec":
        $m = "12";
        break;
    default:
        $m = false;
        break;
}
return $m;
}
function load_f_by_year($f_by_id,$f_year){
	$str='';
	if($f_by_id=='1'){//Calender Year
		$s_year=2018;
		$e_year=date("Y");
		for($i=$e_year;$i>=$s_year;$i--){
			$sel='';
			if($f_year==$i) {
				$sel='selected="selected"';
			}
			$str.='<option value="'.$i.'" '.$sel.'>'.$i.'</option>';
		}
	}
	else if($f_by_id=='2'){//Financial Year
		$minyear= 2018;
		$maxyear=(date('m')<'04') ? date('Y',strtotime('-1 year')) : date('Y');
		$end = $start+1;
		for($y=$minyear;$y<=$maxyear;$y++)
		{
			$sel='';
			if($f_year==$y) {
				$sel='selected="selected"';
			}
			$str.='<option '.$sel.' value="'.$y.'">'.$y.'-'.($y+1).'</option>';
		}
	}
	
	return $str;
}
function get_sales_order_trn($dbcon,$so_trn_id,$sales_order_id){
	$query="select trn.so_trn_id,pro.product_name from tbl_sales_order_trn as trn 
	left join tbl_product as pro on pro.product_id=trn.product_id
	where trn.so_trn_status=0 and trn.sales_order_id=".$sales_order_id;
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Sales Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['so_trn_id']==$so_trn_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['so_trn_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function get_for_period($dbcon,$f_by_id,$f_target_period,$f_period_id){
	
	$query="select f_period_id,f_period_name from forecast_period_mst where f_period_status=0 and f_by_id=".$f_by_id." and f_target_period=".$f_target_period."";

	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Period</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['f_period_id']==$f_period_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['f_period_id'].'">'.$rel['f_period_name'].'</option>';
	}
	return $str;
}
function get_sales_order_plan($dbcon,$sales_order_id,$mode){
	if($mode=='Add'){
		$query="select sales_order_id,sales_order_no,cust.cust_name from tbl_sales_order as so
		LEFT JOIN tbl_customer as cust on cust.cust_id=so.cust_id
		where sales_order_status=0 and plan_done_status=0";
	}
	else{
		$query="select sales_order_id,sales_order_no,cust.cust_name from tbl_sales_order as so
		LEFT JOIN tbl_customer as cust on cust.cust_id=so.cust_id
		where sales_order_status=0";
	}
	
	
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Sales Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['sales_order_id']==$sales_order_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['sales_order_id'].'">'.$rel['sales_order_no'].' - '.$rel['cust_name'].'</option>';
	}
	return $str;
}
function get_sales_order($dbcon,$sales_order_id,$mode){
	if($mode=='Add'){
		$query="select sales_order_id,sales_order_no,cust.cust_name from tbl_sales_order as so
		LEFT JOIN tbl_customer as cust on cust.cust_id=so.cust_id
		where sales_order_status=0 and plan_done_status=1 and so_approve_status=1 and bom_done_status=0";
	}
	else{
		$query="select sales_order_id,sales_order_no,cust.cust_name from tbl_sales_order as so
		LEFT JOIN tbl_customer as cust on cust.cust_id=so.cust_id
		where sales_order_status=0";
	}
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Sales Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['sales_order_id']==$sales_order_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['sales_order_id'].'">'.$rel['sales_order_no'].' - '.$rel['cust_name'].'</option>';
	}
	return $str;
}
function get_sales_order_invoice($dbcon,$cust_id,$sales_order_id,$mode){
	if($mode=='Add'){
		$query="select sales_order_id,sales_order_no from tbl_sales_order where sales_order_status=0 and plan_done_status=1  and invoice_done_status=0 and cust_id=".$cust_id;
	}
	else{
		$query="select sales_order_id,sales_order_no from tbl_sales_order where sales_order_status=0 and sales_order_id=".$sales_order_id;
	}
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Sales Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['sales_order_id']==$sales_order_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['sales_order_id'].'">'.$rel['sales_order_no'].'</option>';
	}
	return $str;
}
function get_custwise_quot($dbcon,$cust_id,$quotation_id,$mode){
	if($mode=='Add'){
		$query="select quotation_id,quotation_no from tbl_quotation where quotation_status=0 and approve_status=1 and revise_status=0 and cust_id=".$cust_id." ";
	}
	else{
		$query="select quotation_id,quotation_no from tbl_quotation where quotation_status=0 and revise_status=0 and cust_id=".$cust_id." ";
	}
	
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Quotation</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['quotation_id']==$quotation_id){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['quotation_id'].'">'.$rel['quotation_no'].'</option>';
	}
	return $str;
}	
function check_delete_trn($dbcon,$chk_arr){
	$chk_flag=false;
	foreach($chk_arr as $fil_arr){
		$col=$fil_arr[0]; $tbl=$fil_arr[1]; $whr=$fil_arr[2];
		$chk_qry="select $col from $tbl where $whr";
		$chk_nums=mysqli_num_rows($dbcon->query($chk_qry));
		if($chk_nums){
			return $chk_flag=true;
		}
	}
	return $chk_flag;
}
function get_annexure_types($dbcon,$eid){
	$query="select an_id,an_name from tbl_annexure where an_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Annexure</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['an_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['an_id'].'">'.$rel['an_name'].'</option>';
	}
	return $str;
}
function get_alert_mintes($dbcon,$task_alert_id){
	$query="select * from task_alert_mst where task_alert_status=0 and task_alert_id=".$task_alert_id;
	$query_rs=$dbcon->query($query);	
	$query_rel=mysqli_fetch_assoc($query_rs);
	return floatval($query_rel['task_gap_minutes']);
}
function check_po_pending($dbcon,$purchaseorder_id){
	
	$str='';
		$query="select * from tbl_purchaseorder as so where status=0 and (select IFNULL(sum(product_qty),0) as qty from tbl_purchaseordertrn as sosub  where purchaseordertrn_status=0 and sosub.purchaseorder_id=so.purchaseorder_id ) > (select IFNULL(sum(product_qty),0) as qty  from tbl_grn as chall left join tbl_grn_trn as chtrn on chtrn.grn_id=chall.grn_id where grn_status=0 and chtrn.grn_trn_status=0 and chtrn.purchaseorder_id=so.purchaseorder_id) and so.purchaseorder_id=".$purchaseorder_id." and company_id=".$_SESSION['company_id'];
		$rs_dispatch=$dbcon->query($query);	
		$cnt=mysqli_num_rows($rs_dispatch);
		if($cnt>0){
			return 1;
		}else{
			return 2;	
		}
}
function get_po_for_grn1($dbcon,$purchaseorder_id,$vender_id,$mode)
{
	$str='';
	if($mode=='Edit'){
		$query="select purchaseorder_id,purchaseorder_no from tbl_purchaseorder where status=0 and purchaseorder_id=".$purchaseorder_id." and vender_id=".$vender_id." and company_id=".$_SESSION['company_id'];
	}
	else{
		$query="select purchaseorder_id,purchaseorder_no from tbl_purchaseorder where status=0 and used_grn_status=0 and vender_id=".$vender_id." and company_id=".$_SESSION['company_id'];
	}
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Purchase Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['purchaseorder_id']==$purchaseorder_id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['purchaseorder_id'].'">'.$rel['purchaseorder_no'].'</option>';
	}
	return $str;
}
function get_product_moc($dbcon,$eid){
	$query="select product_moc_id,product_moc_name from tbl_product_moc where product_moc_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose MOC</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_moc_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['product_moc_id'].'">'.$rel['product_moc_name'].'</option>';
	}
	return $str;
}
function get_product_color($dbcon,$eid){
	$query="select product_color_id,product_color_name from tbl_product_color where product_color_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Color</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_color_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['product_color_id'].'">'.$rel['product_color_name'].'</option>';
	}
	return $str;
}
function get_product_size($dbcon,$eid){
	$query="select product_size_id,product_size_name from tbl_product_size where product_size_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Size</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_size_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['product_size_id'].'">'.$rel['product_size_name'].'</option>';
	}
	return $str;
}
function get_stock_transfer_branch($dbcon,$eid){
	$query="select branch_id,branch_name from branch_mst where branch_status!=2";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Branch</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['branch_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['branch_id'].'">'.$rel['branch_name'].'</option>';
	}
	return $str;
}
function get_cust_inq($dbcon,$eid,$cust_id){
	$query="select inquiry_id,inquiry_name from tbl_inquiry where inquiry_status=0 and cust_id=".$cust_id;
	$rs_dispatch=$dbcon->query($query);
	$str='<option value="">Choose Inquiry</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['inquiry_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['inquiry_id'].'">'.$rel['inquiry_name'].'</option>';
	}
	return $str;
}
function get_branch($dbcon,$eid){
	$query="select branch_id,branch_name from branch_mst where branch_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Branch</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['branch_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['branch_id'].'">'.$rel['branch_name'].'</option>';
	}
	return $str;
}

function get_branchwise_productqty($dbcon,$productid,$branch)
{
	$query='SELECT pro.product_id,product_name,opening_stock,pur_qty,jobout_qty,jobin_qty,inv_qty FROM `tbl_product` as pro 
	 
	left join (select sum(opntrn.product_stock) as opening_stock,opntrn.product_id from tbl_branch_product_stock as opntrn  where opntrn.status=0 and opntrn.branch_id in (0,'.$branch.') and opntrn.company_id='.$_SESSION['company_id'].' group by opntrn.product_id) as opn_stock on opn_stock.product_id=pro.product_id
	
	left join (select sum(purtrn.product_qty) as pur_qty,purtrn.product_id from tbl_potrancation as purtrn where purtrn.potrancation_status=0 and purtrn.company_id='.$_SESSION['company_id'].' and purtrn.branch_id in (0,'.$branch.') group by purtrn.product_id) as grn on grn.product_id=pro.product_id
	
	left join (select sum(jobout.outward_product_required_qty) as jobout_qty,jobout.raw_product_id from tbl_jobworktrn as jobout where jobout.jobworktrn_status=0 and jobwork_id!=0 and jobout.company_id='.$_SESSION['company_id'].' and jobout.branch_id in (0,'.$branch.') group by jobout.raw_product_id) as jout on jout.raw_product_id=pro.product_id
	
	left join (select sum(jobin.inw_qty) as jobin_qty,jobin.product_id from tbl_jobwork_inward as jobin where jobin.status=0 and jobin.company_id='.$_SESSION['company_id'].' and jobin.branch_id in (0,'.$branch.') group by jobin.product_id) as jin on jin.product_id=pro.product_id
	
	left join (select sum(intrn.product_qty) as inv_qty,intrn.product_id from tbl_invoicetrn as intrn where intrn.trancation_status=0 and intrn.company_id='.$_SESSION['company_id'].' and intrn.branch_id in (0,'.$branch.')  group by intrn.product_id) as invt on invt.product_id=pro.product_id
	
	where pro.product_status!=2 and pro.branch_id in (0,'.$branch.') and pro.product_id='.$productid;
	$rows=mysqli_fetch_assoc($dbcon->query($query));
	
	$stock=($rows['opening_stock']+$rows['pur_qty']+$rows['jobin_qty'])-($rows['jobout_qty']+$rows['inv_qty']);
	return floatval($stock);
	//return $rows['pur_qty'];
}

function get_sale_order_stock($dbcon,$product,$branch)
{
	$query="select sum(product_qty) as pqty from tbl_sales_ordertrntemp where product_id='$product' and branch_id='$_SESSION[branch_id]' and temp_status='0'";
	$rows=mysqli_fetch_assoc($dbcon->query($query));
	return $rows['pqty'];
}

function get_product_make($dbcon,$eid){
	$query="select product_make_id,product_make_name from tbl_product_make where product_make_status=0";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Product Make</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_make_id']==$eid){
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['product_make_id'].'">'.$rel['product_make_name'].'</option>';
	}
	return $str;
}
function get_product_sub_category($dbcon,$eid,$product_category_id){
	$query="select product_subcategory_id,product_sub_category_name from tbl_product_sub_category where product_subcategory_status=0 and product_category_id=".$product_category_id;
	$rs_dispatch=$dbcon->query($query);	
	$str= '<option value="">Choose Product Category</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_subcategory_id']==$eid){
			$sel='selected="selected"';
		}
		$str.= '<option '.$sel.' value="'.$rel['product_subcategory_id'].'">'.$rel['product_sub_category_name'].'</option>';
	}
	return $str;
}

function addinvoicetype($userid,$companyid){
	
while($i==4){
	$invoice_type="TAX INVOICE";
	$type_id="1";$invoice_format="3";$format_value="";
	$end_format_value="/18-19";$deletable="1";$cdate=date('Y-m-d H:i:s');
	$usertype_id="2";
	
	$qry ="INSERT INTO `tbl_invoicetype`(`invoice_type`, `taxinvoice_start`, `type_id`, `invoice_format`,`format_value`, `end_format_value`, `deletable`, `status`, `cdate`, `user_id`, `usertype_id`, `company_id`) VALUES (".$invoice_type.",0,".$type_id.",3,'',/18-19,1,0,".date('Y-m-d H:i:s').",".$userid.",2,".$companyid.")";
   $dbcon->query($qry);
   $i++;
}
}

function getpaymentterms($dbcon,$eid){
	 $query="select * from pay_terms where terms_status=0";
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="">Choose Payment Terms</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['terms_id']==$eid)
		{
			$sel='selected="selected"';
		}
			echo '<option '.$sel.' value="'.$rel['terms_id'].'">'.$rel['payment_days'].' days'.'</option>';
	}
}
function getplaceofsupply($dbcon,$eid){
	 $query="select * from supply_place where supply_place_status=0";
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="">Choose Place Of Supply</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['supply_place_id']==$eid)
		{
			$sel='selected="selected"';
		}
			echo '<option '.$sel.' value="'.$rel['supply_place_id'].'">'.$rel['place_supply'].'</option>';
	}
}
function getmodeofdispache($dbcon,$eid){
	 $query="select * from mode_of_dispatch where mode_des_status=0";
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="">Choose Mode Of Dispatch</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['mode_dis_id']==$eid)
		{
			$sel='selected="selected"';
		}
			echo '<option '.$sel.' value="'.$rel['mode_dis_id'].'">'.$rel['mode_dispatch'].'</option>';
	}
}
function getreportinvoice($dbcon)
{	
    $query="select * from tbl_invoice where invoice_status=0 and invoicetype_id=2  and company_id in (0,".$_SESSION['company_id'].") order by invoice_date DESC";
	$rs_cust=$dbcon->query($query);	 
	//echo '<option value="">All Vendor</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		
		echo '<option '.$sel.' value="'.$rel['invoice_id'].'">'.$rel['invoice_no'].'</option>';
	}

}
function get_country($dbcon,$id)
{
	$str='';
	$query="select `countryid`,`country_name` from country_mst where country_status=0 order by country_name";
	$rs_country=$dbcon->query($query);	
	$str = '<option value="">Choose Country</option>';
	while($rel=mysqli_fetch_assoc($rs_country))
	{
		$sel='';
		if($rel['countryid']==$id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['countryid'].'">'.$rel['country_name'].'</option>';
	}
	return $str;
}
function load_cust_grn_edit($dbcon,$grn_id)
{	
	$str='';
	$query="select grn_id,grn_no from tbl_grn where status=0 and grn_id in(".$grn_id.") ";
	$rs_dispatch=$dbcon->query($query);
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		$exp_grn_id=explode(",",$grn_id);
		if(in_array($rel['grn_id'],$exp_grn_id))
		{$sel ="selected='selected'";}
		$str.= '<option '.$sel.' value="'.$rel['grn_id'].'">'.$rel['grn_no'].'</option>';
	}
	return $str;
}
function load_po_grn($dbcon,$id,$purchaseorder_id,$mode)
{	
	$str='';
	if($mode=='Add'){
		$query="SELECT mst.grn_id,mst.grn_no FROM `tbl_grn` as mst
			left join tbl_grn_trn as trn on trn.grn_id=mst.grn_id
			where mst.grn_status=0 and grn_trn_status=0 and trn.purchaseorder_id=".$purchaseorder_id."
			group by trn.grn_id";
	}
	else{
		$query="SELECT mst.grn_id,mst.grn_no FROM `tbl_grn` as mst
			left join tbl_grn_trn as trn on trn.grn_id=mst.grn_id
			where mst.grn_status=0 and grn_trn_status=0 and trn.purchaseorder_id=".$purchaseorder_id." and mst.grn_id in(".$id.")
			group by trn.grn_id";
	}
	$rs_dispatch=$dbcon->query($query);
	$exp_id=explode($id);
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if(in_array($exp_id,$rel['grn_id']))
		{$sel ="selected='selected'";}
		$str.= '<option '.$sel.' value="'.$rel['grn_id'].'">'.$rel['grn_no'].'</option>';
	}
	return $str;
}
function load_cust_grn($dbcon,$id)
{	
	$str='';
	$query="select grn_id,grn_no from tbl_grn where status=0 and used_purchase_status=0 and vender_id=".$id." and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		/*if($rel['grn_id']==$id)
		{$sel ="selected='selected'";}*/
		$str.= '<option '.$sel.' value="'.$rel['grn_id'].'">'.$rel['grn_no'].'</option>';
	}
	return $str;
}
function get_purchase_order($dbcon,$cust_id,$id,$mode)
{	
	$str='';
	if($mode=='Add'){
		$query="select purchaseorder_id,purchaseorder_no from tbl_purchaseorder as mst where status=0 and purchase_status=0 and (SELECT sum(product_qty) from tbl_grn_trn WHERE grn_trn_status=0 and purchaseorder_id=mst.purchaseorder_id)>0 and cust_id=".$cust_id." and company_id=".$_SESSION['company_id'];
		
		/*$query="select * from tbl_purchaseorder as so where status=0 
		and (select IFNULL(sum(product_qty),0) as qty from tbl_purchaseordertrn as sosub  where purchaseordertrn_status=0 and sosub.purchaseorder_id=so.purchaseorder_id ) > (select IFNULL(sum(product_qty),0) as qty  from tbl_pono as chall left join tbl_potrancation as chtrn on chtrn.po_id=chall.po_id where status=0 and chtrn.potrancation_status=0 and chall.purchaseorder_id=so.purchaseorder_id)
		and so.vender_id=".$cust_id." and company_id=".$_SESSION['company_id'];*/
	}
	else{
		$query="select * from tbl_purchaseorder where status=0 and purchaseorder_id=".$id;
	}
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Purchase Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($mode=='Edit'){
			if($rel['purchaseorder_id']==$id)
			{$sel ="selected='selected'";}
		}
		$str .= '<option '.$sel.' value="'.$rel['purchaseorder_id'].'">'.$rel['purchaseorder_no'].'</option>';
	}
	return $str;
}
function get_purchase_order_data($dbcon,$id)
{	
	$str='';
	$query="select trn.product_id,pro.product_name from tbl_purchaseordertrn as trn 
	inner join tbl_product as pro on pro.product_id=trn.product_id 
	where purchaseordertrn_status=0 and inspect_status=1 and purchaseorder_id=".$id;
	$rs_dispatch=$dbcon->query($query);	
	
	$str = '<option value="">Choose Purchase Order Products</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel=''; 
		/*if($rel['sales_order_id']==$id)
		{$sel ="selected='selected'";}*/
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function get_sales_order_data($dbcon,$id)
{	
	$str='';
	
	$query="select trn.*,pro.product_id,pro.product_name from tbl_sales_order_trn as trn inner join tbl_product as pro on pro.product_id=trn.product_id where so_trn_status=0 and sales_order_id=".$id;
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Sales Order Products</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		/*if($rel['sales_order_id']==$id)
		{$sel ="selected='selected'";}*/
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}


function get_custmer_consignee($dbcon,$parentid,$id)
{	
	$str='';
	
	$query="select * from tbl_custmer_consignee where cust_status=0 and cust_ref_id=".$parentid." and company_id in (0,$_SESSION[company_id])";
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Consignee</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['cust_id']==$id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['cust_id'].'">'.$rel['company_name'].'</option>';
	}
	return $str;
}
function addDayswithdate($date,$days){

    $date = strtotime("+".$days." days", strtotime($date));
    return  date("Y-m-d", $date);

}
function getenvelope($dbcon,$id)
{
	$query="select * from evelope_design where env_status=0 and company_id=".$_SESSION['company_id'];
	$rs_cust=$dbcon->query($query);	
	echo '<option value="">Select Envelope</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['envelope_design_id']==$id)
		{
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['envelope_design_id'].'">'.$rel['env_name'].'</option>';
	}

}
function getbalance_type($dbcon,$id)
{
	$query="select * from mst_balance_type where status=0";
	$rs_cust=$dbcon->query($query);	
	echo '<option value="">Select Type</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['balance_typeid']==$id) {
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['balance_typeid'].'">'.$rel['balance_type_name'].'</option>';
	}
}
function getquestion($dbcon,$id,$cond)
{
	$query="select * from tbl_question where status=0 ";
	$rs_cust=$dbcon->query($query);	
	$q= '<option value="">Choose Your Security Question </option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['question_id']==$id)
		{
			$sel="selected='selected'";
		}
		$q .='<option '.$sel.' value="'.$rel['question_id'].'">'.$rel['question'].'</option>';
	}
	return $q;
}
function get_product_tax_common($dbcon,$product_amount,$formulaid)
{
	$qry="SELECT formula.*,tax.* FROM `formula_mst` as formula inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) WHERE formulaid=".$formulaid." order by tax_value desc";
	$row=$dbcon->query($qry);
	$rate_total=$total=$product_amount;
	$i=1;
	while($tax=mysqli_fetch_assoc($row))
	{	
		$infpotrn['tax_name'.$i]=$tax['tax_name'];
		$infpotrn['tax_amount'.$i]=$tax_amount=($total)*$tax['tax_value']/100;
		$rate_total+=$tax_amount;
		$i++;
	}
	for($j=$i;$j<=3;$j++)
	{
		$infpotrn['tax_name'.$i]='';
		$infpotrn['tax_amount'.$i]='';		
	}
	$infpotrn['total']=$rate_total;
	return $infpotrn;
}


function get_product_tax_common_expense($dbcon,$product_amount,$formulaid,$type='exclusive')
{
	$qry="SELECT formula.*,tax.*,(select sum(tax_value)   FROM `formula_mst` as formula inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) WHERE formulaid=".$formulaid.") as tax_total  FROM `formula_mst` as formula inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) WHERE formulaid=".$formulaid." order by tax_value desc";
	$row=$dbcon->query($qry);
	$rate_total=$total=$product_amount;
	$i=1;
	while($tax=mysqli_fetch_assoc($row))
	{	
		$info['tax_name'.$i]=$tax['tax_name'];
		if($type=='exclusive')
		{
			$info['tax_amount'.$i]=$tax_amount=($total)*$tax['tax_value']/100;
			$rate_total+=$tax_amount;
		}
		else if($type=='inclusive')
		{
			$tax_amount=$total-(($total*100)/(100+$tax['tax_total']));
			$tax_amount=$tax_amount/2;
			$info['tax_amount'.$i]=$tax_amount;
			$rate_total-=$tax_amount;
		}
		$info['tax_name'][]=$tax['tax_name'];
		$info['tax_amount'][]=$tax_amount;	
		$i++;
	}
	for($j=$i;$j<=3;$j++)
	{
		$info['tax_name'.$i]='';
		$info['tax_amount'.$i]='';		
	}
	$info['total']=$rate_total;
	return $info;
}

function map_arr($a, $b,$specifiar) 
{ return $a . ' : ' . $b; }

function getvender($dbcon,$id)
{
	$query="select * from tbl_customer where cust_status=0 and party_type in(0,2) and company_id='$_SESSION[company_id]'";
	$rs_cust=$dbcon->query($query);
	echo '<option value="">Choose Vendor</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['cust_id']==$id)
		{
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['cust_id'].'">'.$rel['cust_name'].'</option>';
	}
}

function getvender_jobwork($dbcon,$id)
{
	$query="select cust_id,company_name from tbl_customer where cust_status=0 and branch_id in (0,".$_SESSION['branch_id'].") and party_type in (0,3) ";
	$rs_cust=$dbcon->query($query);	
	//echo '<option value="">Choose </option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['cust_id']==$id)
		{
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['cust_id'].'">'.$rel['company_name'].'</option>';
	}

}

function getreportvender($dbcon)
{	
    $query="select * from tbl_vender where vender_status=0 and vendor_cat=1 and company_id in (0,".$_SESSION['company_id'].")";
	$rs_cust=$dbcon->query($query);	 
	echo '<option value="">All Vendor</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		
		echo '<option '.$sel.' value="'.$rel['vender_id'].'">'.$rel['vender_name'].'</option>';
	}

}
function getbillno($dbcon,$id)
{
    $query="select * from  tbl_pono where status=0 AND g_total>paid_amount AND vender_id=".$id;
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="">Choose Bill</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
			echo '<option value="'.$rel['po_id'].'">'.$rel['po_no'].'</option>';
	}
}
function getlistinvoicetype($dbcon,$id)
{
	$query="select * from tbl_invoicetype where status=0 and type_id=1 and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="" selected="selected">All</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['invoicetype_id']==$id)
		{
			$sel='selected="selected"';
		}
		echo '<option '.$sel.' value="'.$rel['invoicetype_id'].'">'.$rel['invoice_type'].'</option>';
	}
}
function getallaccount($dbcon)
{
	$query="SELECT acc_id,bank_name,branch_name,acc_number,acc_name FROM `account_mst` as accmst left join bank_mst as bmst on bmst.bankid=accmst.bankid where acc_status=0 and accmst.company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="" selected="selected">Choose Account</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		
		echo '<option '.$sel.' value="'.$rel['acc_id'].'">'.$rel['acc_name'].' ('.$rel['bank_name'].' - '.$rel['branch_name'].')</option>';
	}
}
function getinvoiceno($dbcon,$id)
{
	$query="select * from tbl_invoice where invoice_status=0 AND g_total>paid_amount AND cust_id=".$id;
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="" selected="selected">Choose Invoice</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
			echo '<option value="'.$rel['invoice_id'].'">'.$rel['invoice_no'].'</option>';
	}
}
function getbank($dbcon,$bankid,$con)
{
	$bank='';
	$qry="select * from bank_mst where bank_status=0".$con;
	$rs_type=$dbcon->query($qry);	
	$bank .='<option value="" selected="selected">Choose Bank</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['bankid']==$bankid)
		{$sel='selected="selected"';}
		$bank .= '<option '.$sel.' value="'.$row['bankid'].'">'.$row['bank_name'].'</option>';
	}
	return $bank;
}
function getaccount($dbcon,$bankid,$condition)
{
	$bank='';
	$qry="SELECT acc_id,bank_name,branch_name,acc_number,acc_name FROM `account_mst` as accmst left join bank_mst as bmst on bmst.bankid=accmst.bankid where acc_status=0 and accmst.company_id=".$_SESSION['company_id']." and ".$condition;
	$rs_type=$dbcon->query($qry);	
	$bank .='<option value="" selected="selected">Choose Account</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['acc_id']==$bankid)
		{$sel='selected="selected"';}
		$bank .= '<option '.$sel.' value="'.$row['acc_id'].'">'.$row['acc_name'].' ('.$row['bank_name'].' - '.$row['branch_name'].')</option>';
	}
	return $bank;
}
function getinvoicecontent($dbcon,$contentid)
{
	$content='';
	$qry="select * from content_mst where content_status=0";
	$rs_type=$dbcon->query($qry);	
	$content .='<option value="" selected="selected">Choose</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['contentid']==$contentid)
		{$sel='selected="selected"';}
		$content .= '<option '.$sel.' value="'.$row['contentid'].'">'.$row['content_name'].'</option>';
	}
	return $content;
}
function getproduct_typewise($dbcon,$id,$type)
{	
	$str='';$whr='';
	if($type){
		$whr=' and product_type in('.$type.')';
	}
	$query="select product_id,product_name from tbl_product as pro where product_status=0 ".$whr." order by product_name";
	$rs_dispatch=$dbcon->query($query);
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['product_id']==$id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function getproduct($dbcon,$id)
{	
	$str='';
	$query="select product_id,product_name from tbl_product as pro where product_status=0 order by product_name";
	$rs_dispatch=$dbcon->query($query);
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
				$sel=''; 
				if($rel['product_id']==$id)
				{$sel ="selected='selected'";}
				$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function getpurchaseproduct($dbcon,$id,$mode,$invoice_no)
{	
	$str='';
	$q='';
	/*if(strtolower($mode)=="add")
	{
		$q=" and product_id not in (select product_id from  tbl_potrntemp where user_id=".$_SESSION['user_id']." and temp_status=0)";
	}
	else
	{
		$q=" and product_id not in (select product_id from  tbl_potrancation where  potrancation_status=0 and po_id=".$invoice_no.")";
	}*/
	$query="select * from tbl_purchaseproduct as pro where product_status=0 and company_id in (0,$_SESSION[company_id])".$q;
	$rs_dispatch=$dbcon->query($query);	
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
				$sel=''; 
				if($rel['product_id']==$id)
				{$sel ="selected='selected'";}
				$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function getpurproduct($dbcon,$id,$mode,$invoice_no)
{	
	$str='';
	$q='';
	if(strtolower($mode)=="add")
	{
		$q=" and product_id not in (select product_id from  tbl_potrntemp where user_id=".$_SESSION['user_id']." and temp_status=0)";
	}
	else
	{
		$q=" and product_id not in (select product_id from  tbl_potrancation where user_id=".$_SESSION['user_id']." and potrancation_status=0 and po_id=".$invoice_no.")";
	}
	$query="select * from tbl_product as pro where product_status=0 and company_id=".$_SESSION['company_id'].$q;
	$rs_dispatch=$dbcon->query($query);	
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
				$sel=''; 
				if($rel['product_id']==$id)
				{$sel ="selected='selected'";}
				$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function getpoproduct($dbcon,$id,$mode,$invoice_no)
{	
	$str='';
	$q='';
	if(strtolower($mode)=="add")
	{
		$q=" and product_id not in (select product_id from  tbl_purchasetrntemp where user_id=".$_SESSION['user_id']." and temp_status=0)";
	}
	else
	{
		$q=" and product_id not in (select product_id from  tbl_purchaseordertrn where user_id=".$_SESSION['user_id']." and purchaseordertrn_status=0 and purchaseorder_id=".$invoice_no.")";
	}
	$query="select * from tbl_product as pro where product_status=0 and company_id=".$_SESSION['company_id'].$q;
	$rs_dispatch=$dbcon->query($query);	
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
				$sel=''; 
				if($rel['product_id']==$id)
				{$sel ="selected='selected'";}
				$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}

function get_estimate_product($dbcon,$id,$mode,$e_no)
{	
	$str='';
	$q='';
	if(strtolower($mode)=="add")
	{
		$q=" and product_id not in (select product_id from  tbl_estimatetrntemp where user_id=".$_SESSION['user_id']." and temp_status=0)";
	}
	else
	{
		$q=" and product_id not in (select product_id from  tbl_estimatetrn where user_id=".$_SESSION['user_id']." and estimatetrn_status=0 and estimate_id=".$e_no.")";
	}
	$query="select * from tbl_product as pro where product_status=0 and company_id=".$_SESSION['company_id'].$q;
	$rs_dispatch=$dbcon->query($query);	
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
				$sel=''; 
				if($rel['product_id']==$id)
				{$sel ="selected='selected'";}
				$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}
function getinvoicetype($dbcon,$id)
{
	$query="select * from tbl_invoicetype where status=0 and type_id=1 and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="" selected="selected">Choose Invoice Type</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['invoicetype_id']==$id)
		{
			$sel='selected="selected"';
		}
		echo '<option '.$sel.' value="'.$rel['invoicetype_id'].'">'.$rel['invoice_type'].'</option>';
	}
}

function getusertype($dbcon,$sid,$con)
{
	$usertype='';
	$qry="select * from tbl_usertype where status=0 ".$con;
	$rs_type=$dbcon->query($qry);	
	//$usertype .='<option value="" selected="selected">Choose User Type</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['usertype_id']==$sid)
		{$sel='selected="selected"';}
		$usertype .= '<option '.$sel.' value="'.$row['usertype_id'].'">'.$row['usertype_name'].'</option>';
	}
	return $usertype;
}
function getmenu($dbcon,$sid)
{
	$menu='';
	$qry="select * from tbl_menu where status=0 and pid=0";
	$rs_menu=$dbcon->query($qry);	
	$menu .='<option value="" selected="selected">Choose Menu</option>';
	while($row=mysqli_fetch_assoc($rs_menu))
	{	
		$sel='';
		if($row['menu_id']==$sid)
		{$sel='selected="selected"';}
		$menu .= '<option '.$sel.' value="'.$row['menu_id'].'">'.$row['menu_name'].'</option>';
	}
	return $menu;
}
function get_state($dbcon,$sid,$cid)
{
	$qry="select * from state_mst where state_status=0 and countryid=".$cid;
	$rs_state=$dbcon->query($qry);		
	$str='';
	$str.= '<option value="">Choose State</option>';
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['stateid']==$sid)
			{ $sel='selected="selected"'; }
			$str.='<option '.$sel.' value="'.$row['stateid'].'">'.$row['state_name'].'</option>';
	}
	return $str;
}
function getstate($dbcon,$sid)
{
	$qry="select * from state_mst where state_status=0";
	$rs_state=$dbcon->query($qry);		
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['stateid']==$sid)
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['stateid'].'">'.$row['state_name'].'</option>';
	}
}
function getcity($dbcon,$sid,$cid)
{
	$city='';
	$c_qry="select * from city_mst where city_status=0 and stateid=".$sid.' order by city_name';
	$rs_city=$dbcon->query($c_qry);	
	$city.= '<option value="">Choose City</option>';	
	while($r=mysqli_fetch_assoc($rs_city))
	{	
		$sel='';	
		if($r['cityid']==$cid)
		{$sel='selected="selected"';}
		$city .= '<option '.$sel.' value="'.$r['cityid'].'">'.$r['city_name'].'</option>';
	}						
	return $city;								
}

function get_inquiry($dbcon,$id)
{
	$query="select inquiry_id,inquiry_name from tbl_inquiry where inquiry_status=0 and company_id='$_SESSION[company_id]'";
	$rs_dispatch=$dbcon->query($query);	
	$str='<option value="">Choose Inquiry</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['inquiry_id']==$id) {
			$sel='selected="selected"';
		}
		$str.='<option '.$sel.' value="'.$rel['inquiry_id'].'">'.$rel['inquiry_name'].'</option>';
	}
	return $str;
}
function get_type($dbcon,$id)
{
	$query="select * from tbl_type where status=0";
	$rs_dispatch=$dbcon->query($query);	
	echo '<option value="">Choose Type</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['type_id']==$id)
		{
			$sel='selected="selected"';
		}
		echo '<option '.$sel.' value="'.$rel['type_id'].'">'.$rel['type_name'].'</option>';
	}
}
function getcust($dbcon,$id)
{   
	//$query="select * from tbl_customer where cust_status=0 and  company_id in (0,$_SESSION[company_id])";
	$query="select * from tbl_customer  where cust_status=0 and company_id='$_SESSION[company_id]'";
	$rs_cust=$dbcon->query($query);
        $str = '';
	$str .= '<option value="">Choose Company</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['cust_id']==$id)
		{
			$sel="selected='selected'";
		}
		$str .= '<option '.$sel.' value="'.$rel['cust_id'].'">'.$rel['cust_name'].'</option>';
	}
        return $str;

}
function get_cust_contactperson($dbcon,$eid,$cust_id)
{
	$query="select c_con_id,c_con_fname,c_con_lname from tbl_cust_contact where c_con_status=0 and cust_id='$cust_id'";
	$rs_cust=$dbcon->query($query);	
	$str='<option value="">Choose Contact Person</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{
		$sel='';
		if($rel['c_con_id']==$eid){
			$sel="selected='selected'";
		}
		$str.= '<option '.$sel.' value="'.$rel['c_con_id'].'">'.$rel['c_con_fname'].' '.$rel['c_con_lname'].'</option>';
	}
	return $str;
}
function get_contactperson_all($dbcon,$eid)
{
	$query="select c_con_id,c_con_fname,c_con_lname from tbl_cust_contact where c_con_status=0";
	$rs_cust=$dbcon->query($query);	
	$str='<option value="">Choose Contact Person</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{
		$sel='';
		if($rel['c_con_id']==$eid){
			$sel="selected='selected'";
		}
		$str.= '<option '.$sel.' value="'.$rel['c_con_id'].'">'.$rel['c_con_fname'].' '.$rel['c_con_lname'].'</option>';
	}
	return $str;
}

function getreportcust($dbcon,$id)
{	
    $query="select * from tbl_customer where cust_status=0 and company_id in (0,$_SESSION[company_id])";
	$rs_cust=$dbcon->query($query);	
	echo '<option value="">All Company</option>';
	while($rel=mysqli_fetch_assoc($rs_cust))
	{	
		$sel='';
		if($rel['cust_id']==$id)
		{
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['cust_id'].'">'.$rel['company_name'].'</option>';
	}

}
function getpaymentmode($dbcon,$id)
{	
	$str='';
	$query="select * from tbl_payment_mode where status=0";
	$rs_payment=$dbcon->query($query);	
	echo '<option value="">Choose Mode</option>';
	while($rel=mysqli_fetch_assoc($rs_payment))
	{
		$sel='';
		if($rel['paymentmodeid']==$id)
		{$sel="selected='selected'";}
			$str .= '<option '.$sel.' value="'.$rel['paymentmodeid'].'">'.$rel['payment_mode'].'</option>';
	}
	return $str;
}
function getpaymentmodeedit($dbcon,$id)
{	
	$str='';
	$query="select * from tbl_payment_mode where status=0";
	$rs_payment1=$dbcon->query($query);	
	while($re1=mysqli_fetch_assoc($rs_payment1))
	{
		$sel='';
		if($re1['paymentmodeid']==$id)
		{$sel="selected='selected'";}
	
			$str .= '<option '.$sel.' value="'.$re1['paymentmodeid'].'">'.$re1['payment_mode'].'</option>';
	}
	return $str;
}
function getdescriptioncode($dbcon,$did)
{
	$decription='';
	$code_qry="select * from  descriptioncode_mst where code_status=0";
	$rs_code=$dbcon->query($code_qry);	
	$decription .= '<option value="">Description code</option>';
	while($code=mysqli_fetch_assoc($rs_code))
	{	
		$sel='';
		if($code['descriptionid']==$did)
		{
			$sel="selected='selected'";
		}
		$decription .= '<option '.$sel.' value="'.$code['descriptionid'].'">'.$code['description_code'].'</option>';
	}
	return $decription;

}

function getformula($dbcon,$id)
{
	$formula_qry="select * from  formula_mst where formula_status=0 and company_id=".$_SESSION['company_id'];
	$rs_formula=$dbcon->query($formula_qry);	
	echo '<option value="">Choose Formula</option>';
	while($formula=mysqli_fetch_assoc($rs_formula))
	{	
		$sel='';
		if($formula['formulaid']==$id)
		{
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$formula['formulaid'].'">'.$formula['formula_name'].'</option>';
	}

}
function getunit($dbcon,$id)
{	
	$punit='';
	$query_unit="select * from unit_mst where unit_status=0";
	$rs_unit=$dbcon->query($query_unit);	
	$punit .= '<option value="">Unit</option>';
	while($rel_unit=mysqli_fetch_assoc($rs_unit))
	{
		$sel='';
		if($rel_unit['unitid']==$id)
		{
			$sel="selected='selected'";
		}
		$punit .= '<option '.$sel.' value="'.$rel_unit['unitid'].'">'.$rel_unit['unit_name'].'</option>';
	}
	return $punit;
}
function get_opening_balance($acc_id,$dbcon,$acc_type)
{
$query="SELECT opn_balance,
(select sum(tran_amount) from tbl_banktransaction where debit_accid=".$acc_id." and status=0) as debit 
,(SELECT sum(amount)  FROM `tbl_passbookentry` where acc_id=".$acc_id." and status=0 and typeid=1) as pdebit,(select sum(tran_amount) from tbl_banktransaction where credit_accid=".$acc_id."  and status=0) as credit ,(SELECT sum(amount)  FROM `tbl_passbookentry` where acc_id=".$acc_id." and status=0 and typeid=2) as pcredit
FROM `account_mst` where acc_id=".$acc_id." and acc_status=0 and company_id=".$_SESSION['company_id']." and acc_type=".$acc_type;
$rel=mysqli_fetch_assoc($dbcon->query($query));	
$opn_balance=$rel['opn_balance']+$rel['credit']+$rel['pcredit']-($rel['debit']+$rel['pdebit']);
	return $opn_balance;
}
function get_chequeno($acc_id,$dbcon)
{
	$query="SELECT * from account_mst where acc_id=".$acc_id;
	$rel=mysqli_fetch_assoc($dbcon->query($query));	
	return $rel['acc_chequeno'];
}
function get_vender_balance($vender_id,$dbcon)
{
  $query="select vendor.opening_balance,vendor.balance_typeid,
(SELECT sum(g_total) FROM `tbl_pono` where vender_id=vendor.vender_id and status!=2) as purchase_amount,
(SELECT sum(g_total) FROM `tbl_invoice` as inv where inv.cust_id=cust.cust_id and inv.invoice_status!=2) as invoice_amount,
(SELECT sum(paid_amount) FROM `tbl_purchasereceipt` WHERE  vender_id=vendor.vender_id and status!=2) as paid_amount 
from tbl_vender as vendor where vendor.vender_id=".$vender_id;
 $rel=mysqli_fetch_assoc($dbcon->query($query));
if(!empty($rel['opening_balance']))
{
	$op_balance=($rel['balance_typeid']=="1"?($rel['opening_balance']):-$rel['opening_balance']);
}
$amount=$op_balance+$rel['purchase_amount']-$rel['paid_amount'];
return $amount;
}
function get_sales_customer_due_amount($dbcon,$customerid,$type)
{
$query="select cust.opening_balance,cust.balance_typeid,
(SELECT sum(g_total) FROM `tbl_invoice` as inv where inv.cust_id=cust.cust_id and inv.invoice_status!=2) as invoice_amount,
(SELECT sum(g_total) FROM `tbl_pono` as po where po.vender_id=cust.cust_id and po.status!=2) as po_amount,
(SELECT sum(paid_amount) FROM `tbl_receipt` as rec where rec.cust_id=cust.cust_id and rec.status!=2) as paid_amount,
(SELECT sum(paid_amount) FROM `tbl_purchasereceipt` as perrec where perrec.vender_id=cust.cust_id and perrec.status!=2) as purchasepaid_amount 
from tbl_customer as cust where cust.cust_id=".$customerid;
$rel=mysqli_fetch_assoc($dbcon->query($query));
$op_balance=0;
if(!empty($rel['opening_balance']))
{
	$op_balance=($rel['balance_typeid']=="1"?-($rel['opening_balance']):$rel['opening_balance']);
}
if($type=="1"){
$amount=$op_balance+$rel['invoice_amount']+$rel['purchasepaid_amount']-($rel['paid_amount']+$rel['po_amount']);

}
else{
$amount=$op_balance+$rel['paid_amount']+$rel['po_amount']-($rel['invoice_amount']+$rel['purchasepaid_amount']);
}
if($amount<0){
	$amount=0;
}
return $amount;
}


function getrequiredproduct($dbcon,$id,$where)
{	
	$str='';
	$q='';
	if($where)
	{
		$q = $where;
	}
	$query="select * from tbl_product as pro where product_status=0 and branch_id in (0,$_SESSION[company_id]) ".$q." order by product_name";
	$rs_dispatch=$dbcon->query($query);	
	$str .= '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel=''; 
		if($rel['product_id']==$id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}

function get_pro_field($dbcon,$product_id,$field_name){
	$get_pro_qry = "select $field_name from tbl_product where product_id=".$product_id;
	$get_qry_rrl  = mysqli_fetch_assoc($dbcon->query($get_pro_qry));
	return $get_qry_rrl[$field_name];	
}

function get_bom_producttype($dbcon,$id)
{
	$pro_tml='';
	$pro_tml.= '<option value="">Choose Product Type</option>';
	$pro_tml.= '<option value="1" '.(($id=="1")?"selected":"").'>Assembly Product</option>';
	$pro_tml.= '<option value="2" '.(($id=="2")?"selected":"").'>Semi-Finish Product</option>';
	$pro_tml.= '<option value="4" '.(($id=="4")?"selected":"").'>Raw Material</option>';
	$pro_tml.= '<option value="5" '.(($id=="5")?"selected":"").'>Finish Component</option>';
	return $pro_tml;
}

function getOutStock($dbcon,$id)
{
	$get_pro_qry = "select product_id,minimum_stock from tbl_product where product_id=".$id;
	$get_qry_rrl  = mysqli_fetch_assoc($dbcon->query($get_pro_qry));
	return $get_qry_rrl['minimum_stock'];	
}

function getproducttype($dbcon,$id)
{
	$pro_tml='';
	$pro_tml.= '<option value="">Choose Product Type</option>';
	$pro_tml.= '<option value="0" '.(($id=="0")?"selected":"").'>Finish Product</option>';
	$pro_tml.= '<option value="1" '.(($id=="1")?"selected":"").'>Assembly Product</option>';
	$pro_tml.= '<option value="2" '.(($id=="2")?"selected":"").'>Semi-Finish Product</option>';
	$pro_tml.= '<option value="4" '.(($id=="4")?"selected":"").'>Raw Material</option>';
	$pro_tml.= '<option value="5" '.(($id=="5")?"selected":"").'>Finish Component</option>';
	return $pro_tml;
}
function get_pro_type_name($product_type){
	switch($product_type){
		case "0":
			$pro_type_name="Finish Product";
			break;
		case "1":
			$pro_type_name="Assembly Product";
			break;
		case "2":
			$pro_type_name="Semi-Finish Product";
			break;
		case "4":
			$pro_type_name="Raw Material";
			break;
		case "5":
			$pro_type_name="Finish Component";
			break;
		default:
			$pro_type_name="";
	}
	return $pro_type_name;
}

function get_for_cast_by($dbcon,$id)
{
	$pro_tml='';
	$pro_tml.= '<option value="1" '.(($id=="1")?"selected":"").'>Calender Year</option>';
	$pro_tml.= '<option value="2" '.(($id=="2")?"selected":"").'>Financial Year</option>';
	return $pro_tml;
}
function get_for_cast_by_name($id){
	switch($id){
		case "1":
			$name="Calender Year";
			break;
		case "2":
			$name="Financial Year";
			break;
		default:
			$name="";
	}
	return $name;
}
function get_for_target_p($dbcon,$id)
{
	$html='';
	$html.= '<option value="1" '.(($id=="1")?"selected":"").'>Monthly</option>';
	$html.= '<option value="2" '.(($id=="2")?"selected":"").'>Quarterly</option>';
	$html.= '<option value="3" '.(($id=="3")?"selected":"").'>Half Yearly</option>';
	$html.= '<option value="4" '.(($id=="4")?"selected":"").'>Yearly</option>';
	return $html;
}
function get_for_target_p_name($dbcon,$id)
{
	switch($id){
		case "1":
			$name="Monthly";
			break;
		case "2":
			$name="Quarterly";
			break;
		case "3":
			$name="Half Yearly";
			break;
		case "4":
			$name="Yearly";
			break;
		default:
			$name="";
	}
	return $name;
}
function get_product_purchase_rate($dbcon,$id)
{
	$get_pro_qry = "select product_id,product_purchase_mst_rate from tbl_product where product_id=".$id;
	$get_qry_rrl  = mysqli_fetch_assoc($dbcon->query($get_pro_qry));
	return $get_qry_rrl['product_purchase_mst_rate'];	
}
function get_job_out($dbcon,$jobwork_id)
{
	$str='';
	
	$query="select jobwork_id,jobwork_no from tbl_jobwork where status=0 and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Jobwork Outward</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['jobwork_id']==$jobwork_id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['jobwork_id'].'">'.$rel['jobwork_no'].'</option>';
	}
	return $str;
}
function get_job_out_html($dbcon,$vender_id)
{
	$str='';
	
	$query="select j.jobwork_id,j.jobwork_no,j.sel_product_id,p.product_name from tbl_jobwork as j left join tbl_product as p on p.product_id=j.sel_product_id where j.status=0 and j.vender_id=".$vender_id." and j.job_close_status=0 and j.company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Jobwork Outward</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['jobwork_id']==$exp_id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['jobwork_id'].'">'.$rel['jobwork_no'].' -- ('.$rel['product_name'].')'.'</option>';
	}
	return $str;
}

function get_job_out_pro_html($dbcon,$jobwork_id)
{
	$get_job_type_qry = "select jobwork_type from tbl_jobwork where jobwork_id=".$jobwork_id;
	$get_job_type_rel=mysqli_fetch_assoc($dbcon->query($get_job_type_qry));
	
	$query = "select pro.product_id,pro.product_name from tbl_jobworktrn as trn
	inner join tbl_product as pro on pro.product_id=trn.raw_product_id
	where trn.jobworktrn_status=0 and trn.jobwork_id=".$jobwork_id." group by trn.raw_product_id";
	
	$str='';
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Product</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{
		$sel='';
		if($rel['product_id']==$exp_id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'</option>';
	}
	return $str;
}

function get_outward_from_job_out($dbcon,$id)
{
	$query = "select sel_product_qty,jobwork_id from tbl_jobwork where jobwork_id=$id";
	$row = $dbcon->query($query);
	$result=mysqli_fetch_array($row);
	return $result['sel_product_qty'];
}

function get_tot_inward_from_job_out($dbcon,$id)
{
	$query = "select sum(inw_qty) as quantity,jobwork_id from tbl_jobwork_inward where jobwork_id=$id";
	$row = $dbcon->query($query);
	$result=mysqli_fetch_array($row);
	return $result['quantity'];
}

function get_outward_project($dbcon,$id)
{
	$query = "select j.sel_product_id,j.jobwork_id,p.product_name from tbl_jobwork as j inner join tbl_product as p on p.product_id=j.sel_product_id where j.jobwork_id=$id";
	$row = $dbcon->query($query);
	$result=mysqli_fetch_array($row);
	return $result['product_name'];
}


function get_outward_project_id($dbcon,$id)
{
	$query = "select j.sel_product_id,j.jobwork_id,p.product_name from tbl_jobwork as j inner join tbl_product as p on p.product_id=j.sel_product_id where j.jobwork_id=$id";
	$row = $dbcon->query($query);
	$result=mysqli_fetch_array($row);
	return $result['sel_product_id'];
}


function add_product_tax_data($mstid,$trn_col_name,$emode,$rs_tax,$dbcon)
{		
	$info_tax['mst_id']=$mstid;
	$info_tax['tax_for']=$emode;
	while($rel_tax=mysqli_fetch_assoc($rs_tax))
	{
		$info_tax['trn_id']			= $rel_tax[$trn_col_name];
		$info_tax['tax_id']			= $rel_tax['tax_id'];
		$info_tax['tax_rate']		= $rel_tax['tax_value'];
		$info_tax['tax_amount']		= $rel_tax['product_amount']*$rel_tax['tax_value']/100;
		add_record('tbl_tax_trn', $info_tax, $dbcon);
	}
}
function get_accounts_typewise($dbcon,$id,$typeid)
{
	$str='';
	$query="SELECT acc.* FROM `mst_accounts` as acc left join mst_accounts as parentacc on parentacc.accountid=acc.acc_type_id left join mst_acc_type as acctype on parentacc.acc_type_id=acctype.acc_type_id where acc.status=0 and acc.view_status=0 and acctype.acc_type_name='".$typeid."' and acc.company_id in (0,$_SESSION[company_id]) order by acc.account_name";
	$rs_dispatch=$dbcon->query($query);	
	$str= '<option value="">Choose Account Type</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		if($rel['accountid']==$id)
		{$sel ="selected='selected'";}
		$str .= '<option '.$sel.' value="'.$rel['accountid'].'">'.$rel['account_name'].'</option>';
	}
	return $str;
	
}

function get_expense_head($dbcon,$id) {
	$str='';
	$query="select `expense_head_id`,`expense_head_name` from expense_head_mst where expense_head_status=0 and company_id in(0,$_SESSION[company_id]) ";
	$rs_product=$dbcon->query($query);
	$str = '<option value="">Choose Expense Head</option>';
	while($rel=mysqli_fetch_assoc($rs_product))
	{
		$sel='';
		if($rel['expense_head_id']==$id)
		{ $sel ="selected='selected'"; }
		$str .= '<option '.$sel.' value="'.$rel['expense_head_id'].'">'.$rel['expense_head_name'].'</option>';
	}
	return $str;
}


function get_all_expense($dbcon,$id)
{
	$query="select * from expense_master where expense_status=0";
	$rs_expense=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_expense))
	{	
		$sel='';
		if($rel['expense_id']==$id) {
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['expense_id'].'">'.$rel['expense_name'].'</option>';
	}
}


function get_company_cash_accounts($dbcon)
{
	$qry="select acc_id,acc_type from account_mst where acc_type=1 and acc_status=0 and company_id=".$_SESSION['company_id'];
	$rel_acc=mysqli_fetch_assoc($dbcon->query($qry));	
	$acc_id=$rel_acc['acc_id'];
	return $acc_id;
}

function get_income_account($dbcon,$id)
{
	$query="select * from income_master where inc_status=0";
	$rs_expense=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_expense))
	{	
		$sel='';
		if($rel['inc_id']==$id) {
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['inc_id'].'">'.$rel['inc_name'].'</option>';
	}
}

function getAllBOM($dbcon,$id)
{
	
	$query="select * from tbl_bom where bom_status=0 and bom_close_status=0";
	$rs_expense=$dbcon->query($query);	
	while($rel=mysqli_fetch_assoc($rs_expense))
	{	
		$sel='';
		if($rel['bom_id']==$id) {
			$sel="selected='selected'";
		}
		echo '<option '.$sel.' value="'.$rel['bom_id'].'">'.$rel['bom_no'].'</option>';
	}
	
}

function get_po_for_purchase($dbcon,$id)
{	
	$str='';
	$query="select * from tbl_purchaseorder where status=0 and po_type_status=1 and purchase_status=0 and po_approval_status=1 and vender_id=".$id." and company_id=".$_SESSION['company_id'];
	$rs_dispatch=$dbcon->query($query);	
	$str = '<option value="">Choose Purchase Order</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		/*if($rel['sales_order_id']==$id)
		{$sel ="selected='selected'";}*/
		$str .= '<option '.$sel.' value="'.$rel['purchaseorder_id'].'">'.$rel['purchaseorder_no'].'</option>';
	}
	return $str;
}

function get_purchase_order_typewise_data($dbcon,$pro_type,$id)
{
	$str='';
	$query="select trn.*,pro.product_id,pro.product_name from tbl_purchaseordertrn as trn inner join tbl_product as pro on pro.product_id=trn.product_id where purchaseordertrn_status=0 and use_purchase_status=0 and trn.product_type=".$pro_type." and purchaseorder_id=".$id;
	$rs_dispatch=$dbcon->query($query);	
	$que="select * from tbl_product where product_status=0 and product_type=3";
	$rs_dispatch1=$dbcon->query($que);
	$str = '<option value="">Choose Purchase Order Products</option>';
	while($rel=mysqli_fetch_assoc($rs_dispatch))
	{	
		$sel=''; 
		/*if($rel['sales_order_id']==$id)
		{$sel ="selected='selected'";}*/
		$str .= '<option '.$sel.' value="'.$rel['product_id'].'">'.$rel['product_name'].'-'.$rel['product_hsn_code'].'</option>';
	}
	while($re=mysqli_fetch_assoc($rs_dispatch1))
	{	
		$sel=''; 
		/*if($rel['sales_order_id']==$id)
		{$sel ="selected='selected'";}*/
		$str .= '<option '.$sel.' value="'.$re['product_id'].'">'.$re['product_name'].'-'.$re['product_code'].'</option>';
	}
	return $str;
}

function get_acc_type($dbcon,$parentid,$id)
{
	$str='';
	$query="SELECT * FROM `mst_accounts` where edit_status=1 and status!=2 and acc_type_id=0";
	$rs_acc=$dbcon->query($query);	
	$str = '<option value="">Choose Account Type</option>';
	while($rel_acc=mysqli_fetch_assoc($rs_acc))
	{
		$str .= '<optgroup label="'.$rel_acc['account_name'].'" data-select2-id="'.$rel_acc['accountid'].'">';
		$query="SELECT * FROM `mst_accounts` as acc where acc.status=0 and edit_status=1   and acc_type_id=".$rel_acc['accountid'];
		$rs_dispatch=$dbcon->query($query);	
		
		while($rel=mysqli_fetch_assoc($rs_dispatch))
		{	
			$sel=''; 
			if($rel['accountid']==$id)
			{$sel ="selected='selected'";}
			$str .= '<option '.$sel.' value="'.$rel['accountid'].'">'.stripslashes($rel['account_name']).'</option>';
		}
		$str .= '</optgroup>';
	}
	return $str;
	
}

function get_voucher_type_list_common($eid,$dbcon)
{
	$str='';
	$query="Select * from mst_accounts_voucher_type where voucher_status!=2";
	$rs_type=$dbcon->query($query);	
	$str ='<option value="" selected="selected">Choose</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['voucher_typeid']==$eid)
		{$sel='selected="selected"';}
		$str .= '<option '.$sel.' value="'.$row['voucher_typeid'].'">'.$row['voucher_type_name'].'</option>';
	}
	return $str;
}

function get_all_acc_type($dbcon,$id,$condition='')
{
	$str='';
	$query="SELECT * FROM `mst_accounts` where edit_status=1 and status!=2 and acc_type_id!=0 ".$condition;
	$rs_acc=$dbcon->query($query);	
	$str = '<option value="">Choose Account</option>';
	while($rel_acc=mysqli_fetch_assoc($rs_acc))
	{
		$str .= '<optgroup label="'.$rel_acc['account_name'].'" data-select2-id="'.$rel_acc['accountid'].'">';
		$query="SELECT * FROM `mst_accounts` as acc where acc.status!=2 and edit_status=0   and acc_type_id=".$rel_acc['accountid'];
		$rs_dispatch=$dbcon->query($query);	
		
		while($rel=mysqli_fetch_assoc($rs_dispatch))
		{	
			$sel=''; 
			if($rel['accountid']==$id)
			{$sel ="selected='selected'";}
			$str .= '<option '.$sel.' value="'.$rel['accountid'].'">'.stripslashes($rel['account_name']).'</option>';
		}
		$str .= '</optgroup>';
	}
	
	return $str;
	
}

function get_serise_common($dbcon,$invoicetype)
{
  
    $row=array();
			$query1="select * from  tbl_invoicetype where type_id='".$invoicetype."' ";
            //echo $query1;
            $rows=mysqli_fetch_assoc($dbcon->query($query1));
			$id=$rows['taxinvoice_start'];
			$id=$id+1;
	
           //$id=$rows['Max(taxinvoice_start)']+1;
	
			//$start=(date('m')<'04') ? date('y',strtotime(date('y').'-1 year')) : date('y');
			//$end = $start+1;
			if($rows['invoice_format']=='2'){
				$info['paymentno']= str_pad($id,4,"0",STR_PAD_LEFT).$rows['format_value'];
			}
			else if($rows['invoice_format']=='1'){
				$info['paymentno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT);
			}
			else if($rows['invoice_format']=='3'){
				$info['paymentno']=$rows['format_value'].str_pad($id,3,"0",STR_PAD_LEFT).$rows['end_format_value'];
               
			}
			else{
				$info['paymentno']=str_pad($id,3,"0",STR_PAD_LEFT);
			}
  // var_dump($info);
      return $info;
}
function get_p_and_l_stock($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="select sum(productavgprice*open_stock_qty) as stock_amount from (select product_id,((product_stock+purchaseqty+creditqty)-(invoiceqty+debitqty)) as open_stock_qty,((stock_amt+purchaseamt)/(product_stock+purchaseqty)) as productavgprice from (SELECT pdt.product_id,pdt.product_stock,pdt.product_stock_rate,(pdt.product_stock*pdt.product_stock_rate) as stock_amt,COALESCE(purchase.purchaseqty,0) as purchaseqty,COALESCE(purchase.purchaseamt,0) as purchaseamt,COALESCE(purdebit.purdebitqty,0) as debitqty,COALESCE(purdebit.purdebitamt,0) as debitamt,COALESCE(invoice.invoiceqty,0) as invoiceqty,COALESCE(invoice.invoiceamt,0) as invoiceamt,COALESCE(innote.creditqty,0) as creditqty,COALESCE(innote.creditamt,0) as creditamt FROM `tbl_product` as pdt 
	left join ( SELECT potrn.product_id,sum(product_qty) as purchaseqty,sum(product_amount) as purchaseamt FROM `tbl_pono` as pomst inner join tbl_potrancation as potrn on potrn.po_id=pomst.po_id where pomst.status=0 and po_date  ".$where_date." and pomst.company_id=".$_SESSION['company_id']." group by potrn.product_id) as purchase on pdt.product_id=purchase.product_id
	left join (SELECT product_id,sum(product_qty) as purdebitqty,sum(product_amount) as purdebitamt  FROM `tbl_purchasedebitnote` as pomst inner join tbl_purchasedebitnotetrn as potrn on potrn.purchasedebitnote_id=pomst.purchasedebitnote_id where pomst.debitnote_status=0 and debit_date  ".$where_date." and pomst.company_id=".$_SESSION['company_id']." group by potrn.product_id ) as purdebit on pdt.product_id=purdebit.product_id 
	left join (SELECT product_id,sum(product_qty) as invoiceqty,sum(product_amount)as invoiceamt  FROM `tbl_invoice` as invmst inner join tbl_invoicetrn as invtrn on invmst.invoice_id=invtrn.invoice_id where invmst.invoice_status=0 and invoice_date  ".$where_date." and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as invoice on pdt.product_id=invoice.product_id
	left join (SELECT product_id,sum(product_qty) as creditqty,sum(product_amount) as creditamt  FROM `tbl_invoicenote` as invmst inner join tbl_invoicenotetrn as invtrn on invmst.invoicenote_id=invtrn.invoicenote_id where invmst.noteused_status=0 and note_date  ".$where_date." and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as innote on pdt.product_id=innote.product_id) as product_data  ) as openstock";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['stock_amount'];
}
function get_p_and_l_sale($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="select sum(productavgprice) as sale_amount from (select product_id,(invoiceqty-creditqty) as sale_qty,(invoiceamt-creditamt) as productavgprice from (SELECT pdt.product_id,COALESCE(invoice.invoiceqty,0) as invoiceqty,COALESCE(invoice.invoiceamt,0) as invoiceamt,COALESCE(innote.creditqty,0) as creditqty,COALESCE(innote.creditamt,0) as creditamt FROM `tbl_product` as pdt 
	left join ( SELECT product_id,sum(product_qty) as invoiceqty,sum(product_amount)as invoiceamt  FROM `tbl_invoice` as invmst inner join tbl_invoicetrn as invtrn on invmst.invoice_id=invtrn.invoice_id where invmst.invoice_status=0 and invoice_date ".$where_date."  and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as invoice on pdt.product_id=invoice.product_id
	left join ( SELECT product_id,sum(product_qty) as creditqty,sum(product_amount) as creditamt  FROM `tbl_invoicenote` as invmst inner join tbl_invoicenotetrn as invtrn on invmst.invoicenote_id=invtrn.invoicenote_id where invmst.noteused_status=0 and note_date ".$where_date." and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as innote on pdt.product_id=innote.product_id) as product_data  ) as openstock";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['sale_amount'];
}
function get_p_and_l_purchase($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="select sum(productavgprice*purchase_qty) as purchase_amount from (select product_id,((purchaseqty)-(debitqty)) as purchase_qty,(purchaseamt)/(purchaseqty) as productavgprice from (SELECT pdt.product_id,pdt.product_stock,pdt.product_stock_rate,(pdt.product_stock*pdt.product_stock_rate) as stock_amt,COALESCE(purchase.purchaseqty,0) as purchaseqty,COALESCE(purchase.purchaseamt,0) as purchaseamt,COALESCE(purdebit.purdebitqty,0) as debitqty,COALESCE(purdebit.purdebitamt,0) as debitamt FROM `tbl_product` as pdt 
	left join ( SELECT potrn.product_id,sum(product_qty) as purchaseqty,sum(product_amount) as purchaseamt FROM `tbl_pono` as pomst inner join tbl_potrancation as potrn on potrn.po_id=pomst.po_id where pomst.status=0 and po_date ".$where_date." and pomst.company_id=".$_SESSION['company_id']."  group by potrn.product_id) as purchase on pdt.product_id=purchase.product_id
	left join (SELECT product_id,sum(product_qty) as purdebitqty,sum(product_amount) as purdebitamt  FROM `tbl_purchasedebitnote` as pomst inner join tbl_purchasedebitnotetrn as potrn on potrn.purchasedebitnote_id=pomst.purchasedebitnote_id where pomst.debitnote_status=0 and debit_date ".$where_date." and pomst.company_id=".$_SESSION['company_id']." group by potrn.product_id ) as purdebit on pdt.product_id=purdebit.product_id 
	) as product_data  ) as purchase";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['purchase_amount'];
}
function get_p_and_l_direct_expense($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="SELECT sum(packing) as direct_expense FROM `tbl_pono` where po_date ".$where_date." and status=0 and company_id=".$_SESSION['company_id'];
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['direct_expense'];
}
function get_p_and_l_direct_income($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="SELECT sum(packing+freight+cutting) as direct_income FROM `tbl_invoice` where invoice_date ".$where_date." and invoice_status=0 and company_id=".$_SESSION['company_id'];
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['direct_income'];
}
function get_p_and_l_total_indirect_income($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="SELECT sum(g_total) as income_amount FROM income_mst where income_date ".$where_date." and mst_status=0 and branch_id=".$_SESSION['branch_id'];
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['income_amount'];
}
function get_p_and_l_total_indirect_expense($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="SELECT sum(paid_amount) as expense_amount FROM expense_mst where expense_date ".$where_date." and mst_status=0 and branch_id=".$_SESSION['branch_id'];
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['expense_amount'];
}
function get_p_and_l_indirect_expense($startdate,$enddate,$dbcon)
{
	if(isset($enddate) && !empty($enddate))
	{
		$where_date=" between '".$startdate."' and '".$enddate."'";
	}
	else{
		$where_date=" < '".$startdate."'";
	}
	$query="SELECT exptrn.expense_grp,g.g_name,g.g_id,sum(exptrn.total) as expense_amount FROM expense_mst as e inner join expense_trn as exptrn on exptrn.expense_mstid=e.expenseid 
	left join tbl_group as g on exptrn.expense_grp=g.g_id
	where e.expense_date ".$where_date." and e.mst_status=0 and e.branch_id=".$_SESSION['branch_id']." group by expense_grp";
	$rs=($dbcon->query($query));
	return $rs;
}
function get_p_and_l_cost_of_good_sold($startdate,$enddate,$dbcon)
{
	$where_date=" between '".$startdate."' and '".$enddate."'";
	$where_date1=" < '".$enddate."'";
	$query="select sum(productavgprice*sale_qty) as product_stock_amount from (select product_id,((invoiceqty-creditqty)) as sale_qty,((purchaseamt)/(purchaseqty)) as productavgprice from (SELECT pdt.product_id,pdt.product_stock,pdt.product_stock_rate,(pdt.product_stock*pdt.product_stock_rate) as stock_amt,COALESCE(purchase.purchaseqty,0) as purchaseqty,COALESCE(purchase.purchaseamt,0) as purchaseamt,COALESCE(purdebit.purdebitqty,0) as debitqty,COALESCE(purdebit.purdebitamt,0) as debitamt,COALESCE(invoice.invoiceqty,0) as invoiceqty,COALESCE(invoice.invoiceamt,0) as invoiceamt,COALESCE(innote.creditqty,0) as creditqty,COALESCE(innote.creditamt,0) as creditamt FROM `tbl_product` as pdt 
left join ( SELECT potrn.product_id,sum(product_qty) as purchaseqty,sum(product_amount) as purchaseamt FROM `tbl_pono` as pomst inner join tbl_potrancation as potrn on potrn.po_id=pomst.po_id where pomst.status=0 and po_date ".$where_date1." and pomst.company_id=".$_SESSION['company_id']." group by potrn.product_id) as purchase on pdt.product_id=purchase.product_id
left join (SELECT product_id,sum(product_qty) as purdebitqty,sum(product_amount) as purdebitamt  FROM `tbl_purchasedebitnote` as pomst inner join tbl_purchasedebitnotetrn as potrn on potrn.purchasedebitnote_id=pomst.purchasedebitnote_id where pomst.debitnote_status=0 and debit_date ".$where_date1." and pomst.company_id=".$_SESSION['company_id']." group by potrn.product_id ) as purdebit on pdt.product_id=purdebit.product_id 
left join (SELECT product_id,sum(product_qty) as invoiceqty,sum(product_amount)as invoiceamt  FROM `tbl_invoice` as invmst inner join tbl_invoicetrn as invtrn on invmst.invoice_id=invtrn.invoice_id where invmst.invoice_status=0 and invoice_date ".$where_date." and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as invoice on pdt.product_id=invoice.product_id
left join (SELECT product_id,sum(product_qty) as creditqty,sum(product_amount) as creditamt  FROM `tbl_invoicenote` as invmst inner join tbl_invoicenotetrn as invtrn on invmst.invoicenote_id=invtrn.invoicenote_id where invmst.noteused_status=0 and note_date ".$where_date." and invmst.company_id=".$_SESSION['company_id']." group by invtrn.product_id ) as innote on pdt.product_id=innote.product_id) as product_data  ) as openstock ";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel['product_stock_amount'];
}

function get_purchase_product_rate($dbcon,$pid)
{
	$query="select product_id,product_purchase_mst_rate from tbl_product where product_id='$pid'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['product_purchase_mst_rate'];
}

function get_all_category($dbcon,$id,$where='')
{
	$str='';
	$query="Select * from tbl_category where cat_status=0 ".$where;
	$rs_type=$dbcon->query($query);
    if($id=='0'){ $psel='selected="selected"';}
	$str ='<option value="" >--Choose Category--</option>';
	$str.='<option value="0" '.$psel.' >PRIMARY</option>';
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['cat_id']==$id)
		{$sel='selected="selected"';}
		
		$str .= '<option '.$sel.' value="'.$row['cat_id'].'">'.$row['cat_name'].'</option>';
	}
	return $str;
}

function get_category_by_id($dbcon,$id)
{
	$query="select * from tbl_category where cat_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['cat_name'];
}

function get_all_group($dbcon,$id,$where='',$primary)
{
	$str='';
	$query="Select * from tbl_group where g_status=0 ".$where;
	$rs_type=$dbcon->query($query);
    if($id=='0'){ $psel='selected="selected"';}
	$str ='<option value="" >--Choose Group--</option>';
	if($primary!='0')
	{
	$str.='<option value="0" '.$psel.' >PRIMARY</option>';
	}
	while($row=mysqli_fetch_assoc($rs_type))
	{	
		$sel='';
		if($row['g_id']==$id)
		{$sel='selected="selected"';}
		
		$str .= '<option '.$sel.' value="'.$row['g_id'].'">'.$row['g_name'].'</option>';
	}
	return $str;
}

function get_grp_by_id($dbcon,$id)
{
	$query="select * from tbl_group where g_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['g_name'];
}


function get_expense_by_id($dbcon,$id)
{
	$query="select * from expense_master where expense_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['expense_name'];
}

function get_expense_by_invoice($dbcon,$id)
{
	$query="select sum(exp_e_amount) as sum_amount from tbl_invoice_exp where exp_in_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['sum_amount'];
}

function get_invoice_trn_tax_rate_total($trn_id,$tax_typeid,$dbcon)
{
	$query="SELECT tax_rate,sum(tax_amount) as tax_amount FROM `tbl_tax_trn` as trn left join tbl_tax as tax on tax.tax_id=trn.tax_id where tax_for='invoice' and find_in_set(trn_id,'$trn_id')";
	$rel=mysqli_fetch_assoc($dbcon->query($query));
	return $rel;
}

function get_group_from_expense($dbcon,$id)
{
	$query="select e.expense_id,e.expense_head_id,g.g_id from expense_master as e left join tbl_group as g  on e.expense_head_id=g.g_id where e.expense_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['g_id'];
}

function get_group_from_income($dbcon,$id)
{
	$query="select inc_id,inc_group from income_master where inc_id='$id'";
	$row=$dbcon->query($query);
	$rel=mysqli_fetch_array($row);
	return $rel['inc_group'];
}

function get_bank_by_group($dbcon,$id)
{
	
	$query="select a.b_grp,a.bankid,a.acc_status,b.bank_name from account_mst as a left join bank_mst as b on b.bankid=a.bankid where a.b_grp='$id' and a.acc_status='0'";
	$row=$dbcon->query($query);
	//$rel=mysqli_fetch_array($row);
	$str="";
	$str.="<option>--Select Bank--</option>";
	while($rel=mysqli_fetch_array($row))
	{
		$str.="<option value='".$rel['bankid']."'>".$rel['bank_name']."</option>";
	}
	return $str;
	//return $rel['bank_name'];
}

function productlast_price($productid,$dbcon)
	{
	
	$qry2="select product_rate from tbl_potrancation where po_id!=0 and product_id =".$productid." order by cdate Desc limit 0,1" ;
		$r3=$dbcon->query($qry2);
		$r4=mysqli_fetch_assoc($r3);

		return $r4['product_rate'];
	}
	
function getJobwork_lastprice($productid,$dbcon)
{

$qry2="select pp_rate from tbl_jobwork where job_close_status=0 and sel_product_id =".$productid." order by jobwork_id Desc limit 0,1" ;
	$r3=$dbcon->query($qry2);
	$r4=mysqli_fetch_assoc($r3);

	return $r4['pp_rate'];
}

function get_currency($dbcon,$id)
{
	
	$query="select * from tbl_currency order by currency_name";
	$row=$dbcon->query($query);
	//$rel=mysqli_fetch_array($row);
	$str="";
	$str.="<option>--Select Currency--</option>";
	
	while($rel=mysqli_fetch_array($row))
	{
		$psel='';
		if($rel['currency_id']==$id){ $psel="selected='selected'";}
		$str.="<option value='".$rel['currency_id']."' ".$psel.">".$rel['currency_name'].'('.$rel['currency_code'].')'."</option>";
	}
	return $str;
	//return $rel['bank_name'];
}

function get_all_module($dbcon,$sid)
{
	$qry="select * from module_mst where module_status=0";
	$rs_state=$dbcon->query($qry);		
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['module_id']==$sid)
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['module_id'].'">'.$row['module_name'].'</option>';
	}
}

function get_all_territory($dbcon,$sid)
{
	$qry="select t_id,t_name from territory_mst where t_status=0";
	$rs_state=$dbcon->query($qry);	
	$sid=explode(",",$sid);
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if(in_array($row['t_id'],$sid))
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['t_id'].'">'.$row['t_name'].'</option>';
	}
}
function get_inquiry_stage($dbcon,$eid)
{
	$qry="select opp_id,opp_stage from tbl_opportunity_mst where opp_status=0";
	$rs_state=$dbcon->query($qry);	
	$str="<option value=''>Choose Stage</option>";
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['opp_id']==$eid)
		{$sel='selected="selected"';}
		$str.= '<option '.$sel.' value="'.$row['opp_id'].'">'.$row['opp_stage'].'</option>';
	}
	return $str;
}

function get_all_role($dbcon,$sid)
{
	$qry="select * from tbl_role where status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['role_id']==$sid)
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['role_id'].'">'.$row['role_name'].'</option>';
	}
}

function get_time_zone($dbcon,$sid)
{
	$qry="select * from tbl_timezone order by t_name";
	$rs_state=$dbcon->query($qry);	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['t_id']==$sid)
			{$sel='selected="selected"';}else{ $sel=''; }
			echo '<option '.$sel.' value="'.$row['t_id'].'">'.$row['t_name'].'( '.$row['t_utc_offset'].' )'.'</option>';
	}
}

function get_org_currency($dbcon,$sid)
{
	$qry="select c.currency_name,c.currency_id ,c.currency_code from tbl_org_currency as org left join tbl_currency as c on c.currency_id=org.curren_id where org.comp_id='$_SESSION[company_id]'";
	$rs_state=$dbcon->query($qry);	
	$str="";
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['currency_id']==$sid)
		{$sel='selected="selected"';}else{ $sel=''; }
		$str.= '<option '.$sel.' value="'.$row['currency_id'].'">'.$row['currency_name'].' - '.$row['currency_code'].'</option>';
	}
	echo $str;
}

function get_product_category($dbcon,$sid)
{
	$qry="select * from tbl_category where cat_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['cat_id']==$sid)
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['cat_id'].'">'.$row['cat_name'].'</option>';
	}
}


function get_product_brand($dbcon,$sid)
{
	$qry="select * from tbl_product_brand where pb_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['pb_id']==$sid)
			{$sel='selected="selected"';}
			echo '<option '.$sel.' value="'.$row['pb_id'].'">'.$row['pb_name'].'</option>';
	}
}

function get_product_group($dbcon,$sid)
{
	$qry="select * from tbl_product_grp where pg_status=0";
	$rs_state=$dbcon->query($qry);	
	$str='<option value="">Choose Product Group</option>';
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['pg_id']==$sid)
		{$sel='selected="selected"';}
		$str.='<option '.$sel.' value="'.$row['pg_id'].'">'.$row['pg_name'].'</option>';
	}
	echo $str;
}

function get_assign_users($dbcon,$sid,$whr)
{
	$qry="select * from users where active=0 and user_type!=1".$whr;
	$rs_state=$dbcon->query($qry);	
	$str='';
	$e_id=explode(",",$sid);
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		//if($row['user_id']==$sid)
		if(in_array($row['user_id'],$e_id))
		{$sel='selected="selected"';} else {$sel="";}
		$str.= '<option '.$sel.' value="'.$row['user_id'].'">'.$row['user_name'].'</option>';
	}
	return $str;
}

function get_assign_users_inq($dbcon,$sid)
{
	 $qry="select * from users where active=0 and user_type!=1";
	$rs_state=$dbcon->query($qry);	
	$str='';
        $str .="<option value=''>Choose Assigned User</option>";
	$e_id=explode(",",$sid);
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		//if($row['user_id']==$sid)
		if(in_array($row['user_id'],$e_id))
		{$sel='selected="selected"';} else {$sel="";}
		$str.= '<option '.$sel.' value="'.$row['user_id'].'">'.$row['user_name'].'</option>';
	}
	echo $str;
}
function get_task_alert_types($dbcon,$sid)
{
	$qry="select * from task_alert_mst where task_alert_status=0";
	$rs_state=$dbcon->query($qry);	
	$str='';
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['task_alert_id']==$sid)
		{$sel='selected="selected"';} else { $sel="";}
		$str.= '<option '.$sel.' value="'.$row['task_alert_id'].'">'.$row['task_alert_name'].'</option>';
	}
	return $str;
}
function get_task_priority($dbcon,$sid)
{
	$qry="select * from task_priority_mst where task_priority_status=0";
	$rs_state=$dbcon->query($qry);	
	$str='';
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['task_priority_id']==$sid)
		{$sel='selected="selected"';} else { $sel="";}
		$str.= '<option '.$sel.' value="'.$row['task_priority_id'].'">'.$row['task_priority_name'].'</option>';
	}
	return $str;
}
function get_rel_task($dbcon,$sid)
{
	$qry="select * from task_rel_mst where task_rel_status=0";
	$rs_state=$dbcon->query($qry);	
	$str='';
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['task_rel_id']==$sid)
		{$sel='selected="selected"';} else { $sel="";}
		$str.= '<option '.$sel.' value="'.$row['task_rel_id'].'">'.$row['task_rel_name'].'</option>';
	}
	return $str;
}

function get_master_category($dbcon,$sid)
{
	$qry="select * from tbl_master_category where mc_status=1";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['mc_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['mc_id'].'">'.$row['mc_name'].'</option>';
	}
}

function get_master_category_dtl($dbcon,$sid,$mcd_cat_id)
{
	$str='';
	$qry="select mcd_id,mcd_name from tbl_master_category_detail where mcd_status=0 and mcd_cat_id=".$mcd_cat_id;
	$rs_state=$dbcon->query($qry);	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['mcd_id']==$sid)
		{$sel='selected="selected"';}
		$str.= '<option '.$sel.' value="'.$row['mcd_id'].'">'.$row['mcd_name'].'</option>';
	}
	return $str;
}

function get_terms_category($dbcon,$sid)
{
	$qry="select * from tbl_terms_category where tc_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['tc_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['tc_id'].'">'.$row['tc_name'].'</option>';
	}
}

function get_product_type($dbcon,$sid)
{
	$qry="select * from tbl_product_type where pt_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['pt_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['pt_id'].'">'.$row['pt_name'].'</option>';
	}
}

function get_customer_category($dbcon,$sid)
{
	$qry="select * from tbl_customer_category where cc_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['cc_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['cc_id'].'">'.$row['cc_name'].'</option>';
	}
}

function get_customer_type($dbcon,$sid)
{
	$qry="select * from tbl_customer_type where ct_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['ct_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['ct_id'].'">'.$row['ct_name'].'</option>';
	}
}

function get_customer_industries($dbcon,$sid)
{
	$qry="select * from tbl_customer_industry where ci_status=0";
	$rs_state=$dbcon->query($qry);	
	
	while($row=mysqli_fetch_assoc($rs_state))
	{	
			$sel='';
			if($row['ci_id']==$sid)
			{$sel='selected="selected"';} else { $sel="";}
			echo '<option '.$sel.' value="'.$row['ci_id'].'">'.$row['ci_name'].'</option>';
	}
}

function get_refer_by($dbcon,$sid)
{
	$qry="select * from tbl_refer_by where rb_status=0";
	$rs_state=$dbcon->query($qry);	
	$str="<option value=''>Choose Source / Referred By</option>";
	while($row=mysqli_fetch_assoc($rs_state))
	{	
		$sel='';
		if($row['rb_id']==$sid)
		{$sel='selected="selected"';} else { $sel="";}
		$str.= '<option '.$sel.' value="'.$row['rb_id'].'">'.$row['rb_name'].'</option>';
	}
	echo $str;
}

function get_customer_code($dbcon)
{
	$sel=$dbcon->query("select max(cust_code_series) as mid from tbl_customer");
	$row=mysqli_fetch_array($sel);
	$mid=$row['mid']+1;
	
	$month=date("m");
	$year=date("Y");
	
	$code="CUS".$month.$year.'-'.$mid;
	return $code;
}

function get_customer_code_series($dbcon)
{
	$sel=$dbcon->query("select max(cust_code_series) as mid from tbl_customer");
	$row=mysqli_fetch_array($sel);
	$mid=$row['mid']+1;
	
	return $mid;
}
   
function get_product_common_tax($dbcon,$product_amount,$formulaid)
{
	$qry="SELECT formula.*,tax.* FROM `formula_mst` as formula inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) WHERE formulaid=".$formulaid." order by tax_value desc";
	$row=$dbcon->query($qry);
	$rate_total=$total=$product_amount;
	$i=1;
	while($tax=mysqli_fetch_assoc($row))
	{	
		$info['tax_name'.$i]=$tax['tax_name'];
		$info['tax_amount'.$i]=$tax_amount=($total)*$tax['tax_value']/100;
		$rate_total+=$tax_amount;
		$i++;
	}
	for($j=$i;$j<=3;$j++)
	{
		$info['tax_name'.$j]='';
		$info['tax_amount'.$j]='';		
	}
	$info['product_total']=$rate_total;
	return $info;
}
?>