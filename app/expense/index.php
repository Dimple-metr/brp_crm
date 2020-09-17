<?php
session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");
							
//if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') 
{ 
    //if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	{
		//print_r($_POST);
		//print_r($_FILES);
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		if(strtolower($POST['mode']) == "fetch") {
		$s_date=explode(' - ',$POST['date']);
		$delete_btn=true;
		$where='';
		$branch=$_SESSION['branch_id'];
		//$where.=" and expmst.branch_id=$branch";
		//$_SESSION['expense']['filter']['payment_status']=$POST['report'];
			/*switch($POST['report'])
			{
				case '2' : $where.=" and paid_amount=0 ";break; //unpaid
				case '3' : $where.="  and g_total>paid_amount and paid_amount!=0 ";break; //partial paid
				case '4' : $where.="  and  g_total=paid_amount ";break; //paid
				default : $where.=""; //all
			}*/
			
			$where.="  and expense_date>='".date('Y-m-d',strtotime($s_date[0]))."' AND expense_date<='".date('Y-m-d',strtotime($s_date[1]))."'";
			
			$appData = array();
			$i=1;
			$aColumns = array('cust.company_name','expmst.expense_date','expmst.invoice_no','expmst.g_total','expmst.paid_amount','expmst.mst_status','expmst.cdate','expmst.user_id','expmst.expenseid');
			$sIndexColumn = "expenseid";
			$isWhere = array("expmst.mst_status = 0".$where.check_user('expmst'));
			$sTable = "expense_mst as expmst";			
			$isJOIN = array('left join  tbl_customer cust on expmst.vendorid=cust.cust_id');
			$hOrder = "expmst.expenseid desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				//$row_data[] = $id;
				$row_data[] = $row['invoice_no'];
				$row_data[] = $row['company_name'];
				$row_data[] = date('d M, Y',strtotime($row['expense_date']));				
				//$row_data[] = $row['city_name'];
				$row_data[] = $row['g_total'];
				/*if($row['g_total']>$row['paid_amount'])
				{
					
					if(empty($row['paid_amount']) || $row['paid_amount']=="0.00")
					{	
						$row_data[] = "<div class='external-event label label-danger ui-draggable' style='position: relative;'>Unpaid (".($row['g_total']).")</div>";
					}
					else
					{
						$row_data[] = "<div class='external-event label label-warning ui-draggable' style='position: relative;'>Partially Paid (".($row['g_total']-$row['paid_amount']).")</div>";
					}
				}
				else
				{
					$row_data[]="<div class='external-event label label-success ui-draggable' style='position: relative;'>Paid</div>";;
				}*/
					$addpayment='';$delete='';$edit='';
					if($delete_btn)//$pagename,$usetype,$permission,$dbcon
					{
						$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_expense('.$row['expenseid'].')"><i class="fa fa-trash-o"></i></button>';
					}
					/*if($row["g_total"]>$row["paid_amount"]){
						$addpayment='<a class="btn btn-xs btn-primary" data-original-title="Payable '.($row['g_total']-$row['paid_amount']).'" data-toggle="tooltip" data-placement="top" href="expensepaymentdirect/'.$row['expenseid'].'"><i class="fa fa-plus"></i></a>';
					}*/					
					$edit='<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'expense-update/'.$row['expenseid'].'"><i class="fa fa-pencil"></i></a>';
					$row_data[] = $edit.' '.$delete.' '.$addpayment;
				
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		
		else if(strtolower($POST['mode']) == "add") {
			
						$info['expense_date']	= date('Y-m-d',strtotime($POST['expense_date']));			
						$info['invoice_no']		= $POST['expense_no'];
						$info['vendorid']		= $POST['cust_id'];
						$info['tax_type']		= $POST['tax_inclusive'];
						$info['g_total']		= $POST['g_total'];
						$info['remark']			= text_rnremove($POST['remark']);
						$info['cdate']			= date("Y-m-d H:i:s");
						$info['user_id']		= $_SESSION['user_id'];
						$info['company_id']		= $_SESSION['company_id'];
						$info['paid_amount']	 	= $POST['paid_amount'];
						$info['branch_id']			= $POST['branchid'];
						$inserestimateid=add_record('expense_mst', $info, $dbcon);
						$info_trn['expense_mstid']=$inserestimateid;
						$info_trn['trn_status']=0;
						update_record('expense_trn',$info_trn,"user_id=".$_SESSION['user_id']." and trn_status=3", $dbcon);	
							/* Tax Transaction Table Entry Start*/		
						$query="select trn.expense_trnid,trn.formulaid,tax.tax_id,tax.tax_value,trn.expense_amount as product_amount from expense_trn as trn
						left join `formula_mst` as formula on formula.formulaid=trn.formulaid inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) where expense_mstid=".$inserestimateid." and trn_status=0";
						$rs_tax=$dbcon->query($query);
						add_product_tax_data($inserestimateid,'expense_trnid','expense',$rs_tax,$dbcon);
						/* Tax Transaction Table Entry End*/
						if($inserestimateid )
						{	
							//&& $POST['paymentmodeid']>0
							if($POST['paymentmodeid']==1)
							{	
								$acc_id	= get_company_cash_accounts($dbcon);
							}
							else
							{
								$acc_id = $POST['pur_acc_id'];
							}
							$infopbk['paymentmodeid']	= $info2['paymentmodeid']	= $POST['paymentmodeid'];
							$infopbk['acc_id']	        = $info2['acc_id']			= $acc_id;
							$infopbk['reference_no']    = $info2['cheque_dtl']	 	= $POST['cheque_dtl'];
							$infopbk['bill_no_ref']     = $info2['expenseid']		= $inserestimateid;
							$infopbk['amount']          = $info2['paid_amount']	 	= $POST['paid_amount'];
							$infopbk['entry_date']      = $info2['payment_date'] 	= date("Y-m-d",strtotime($POST['expense_date']));
							$infopbk['reference_date']  = $info2['ref_date']	 	= date("Y-m-d",strtotime($POST['ref_date']));
							$infopbk['cdate']           = $info2['cdate']		 	= date("Y-m-d H:i:s");
							$infopbk['user_id']         = $info2['user_id']		 	= $_SESSION['user_id'];
							$infopbk['company_id'] 		=	$info2['company_id']		= $_SESSION['company_id'];
							$info2['vender_id']			= 	$POST['vender_id'];
							$info2['receipt_flag']		= 'expense';	
							//$insertreceiptid=add_record('expense_payment', $info2, $dbcon);
							$insertreceiptid=add_record('tbl_purchasereceipt', $info2, $dbcon);
							$rs=$dbcon->query("SELECT company_name FROM tbl_customer  where cust_id=".$POST['cust_id']);
							$rel=mysqli_fetch_assoc($rs);
							$infopbk['typeid']          = '1';//1:debit,2:Credit 
                            $infopbk['trn_id']          = $insertreceiptid;
                            $infopbk['trn_table']       = 'expense_payment';
                            $infopbk['passbook_note']   = 'Expense Payment  :'.$rel['company_name'];
							$insert=add_record('tbl_passbookentry', $infopbk, $dbcon);
							if($info2['paymentmodeid']==2 )//if cheque select then
							{
									//insert cheque generate record
								//$query_from = $dbcon->query("UPDATE account_mst SET acc_chequeno = acc_chequeno + 1 WHERE acc_id = ".$infopbk['acc_id']);
								//$query_from = $dbcon->query("UPDATE account_mst SET acc_chequeleft = acc_chequeleft - 1 WHERE acc_id = ".$infopbk['acc_id']);
								$info_gen['acc_id']			= $infopbk['acc_id'];
								$info_gen['amount']			= $infopbk['amount'];
								$info_gen['cheque_date']	= $infopbk['reference_date'];
								$info_gen['cheque_num']		= $POST['cheque_dtl'];
								$info_gen['vender_id']		= $rel['vender_id'];
								$info_gen['purchase_payid'] = $insertreceiptid;
								$info_gen['generat_status'] = 0;// for cheque generate
								$info_gen['company_id']		= $_SESSION['company_id'];
								$insert_cheque=add_record('tbl_payment_cheque_generate', $info_gen, $dbcon);
								//Payment Remainder entry START
								if($info2['ref_date']>date("Y-m-d"))
								{
									$info_remainder['task_detail']		= ' Given Cheque of  ( '.get_bank_name($dbcon,$POST['bankid']).' - '.$POST['cheque_dtl'].' ) ';
									$info_remainder['date']				= $info2['ref_date'];
									$info_remainder['company_id']		= $_SESSION['company_id'];
									$inserinvoiceid=add_record('todo_mst', $info_remainder, $dbcon);
								}
								//Payment Remainder entry END
								
							}
							$arr['msg']="1";
							$arr['eid']=$inserestimateid;
						}
						else
						{
							$arr['msg']="0";
						}
			echo json_encode($arr);
			}		
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
						$info['expense_date']	= date('Y-m-d',strtotime($POST['expense_date']));			
						$info['invoice_no']		= $POST['expense_no'];
						$info['vendorid']		= $POST['cust_id'];
						$info['g_total']		= $POST['g_total'];
						$info['tax_type']		= $POST['tax_inclusive'];
						$info['remark']			= text_rnremove($POST['remark']);
						$info['cdate']			= date("Y-m-d H:i:s");
						$info['user_id']		= $_SESSION['user_id'];
						$info['company_id']		= $_SESSION['company_id'];
					$updateid=update_record('expense_mst', $info,"expenseid=".$POST['eid'] , $dbcon);
					/* Tax Transaction Table Entry Start*/		
						$query="select trn.expense_trnid,trn.formulaid,tax.tax_id,tax.tax_value,trn.expense_amount as product_amount from expense_trn as trn
						left join `formula_mst` as formula on formula.formulaid=trn.formulaid inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) where expense_mstid=".$POST['eid']." and trn_status=0";
						$rs_tax=$dbcon->query($query);
						delete_record("tbl_tax_trn","tax_for='expense' and mst_id=".$POST['eid'],$dbcon);
						add_product_tax_data($POST['eid'],'expense_trnid','expense',$rs_tax,$dbcon);
						/* Tax Transaction Table Entry End*/
					if($updateid)
					{	
						/*if($POST['paymentmodeid']==1)
							{	
								$acc_id	= get_company_cash_accounts($dbcon);
							}
							else
							{
								$acc_id = $POST['pur_acc_id'];
							}
							$infopbk['paymentmodeid']	= $info2['paymentmodeid']	= $POST['paymentmodeid'];
							$infopbk['acc_id']	        = $info2['acc_id']			= $acc_id;
							$infopbk['reference_no']    = $info2['cheque_dtl']	 	= $POST['cheque_dtl'];
							$infopbk['bill_no_ref']     = $info2['expenseid']		= $POST['eid'];
							$infopbk['amount']          = $info2['paid_amount']	 	= $POST['paid_amount'];
							$infopbk['entry_date']      = $info2['payment_date'] 	= date("Y-m-d",strtotime($POST['expense_date']));
							$infopbk['reference_date']  = $info2['ref_date']	 	= date("Y-m-d",strtotime($POST['ref_date']));
							$infopbk['cdate']           = $info2['cdate']		 	= date("Y-m-d H:i:s");
							$infopbk['user_id']         = $info2['user_id']		 	= $_SESSION['user_id'];
							$infopbk['company_id'] 		=	$info2['company_id']		= $_SESSION['company_id'];
							$info2['vender_id']			= 	$POST['vender_id'];
							if(empty($POST['expense_paymentid']))
							{
								$insertreceiptid=add_record('expense_payment', $info2, $dbcon);
							}
							else
							{
								$updatepayment=update_record('expense_payment', $info2,"expensereceipt_id=".$POST['expense_paymentid'], $dbcon);
								$insertreceiptid=$POST['expense_paymentid'];
							}
							$rs=$dbcon->query("SELECT vender_name FROM tbl_vender  where vender_id=".$POST['vender_id']);
							$rel=mysqli_fetch_assoc($rs);
							$infopbk['typeid']          = '1';//1:debit,2:Credit 
                            $infopbk['trn_id']          = $insertreceiptid;
                            $infopbk['trn_table']       = 'expense_payment';
                            $infopbk['passbook_note']   = 'Expense  :'.$rel['vender_name'];
							if(empty($POST['expense_paymentid']))
							{
								$insert=add_record('tbl_passbookentry', $infopbk, $dbcon);
							}							
							else
							{
								$insertreceiptid=update_record('tbl_passbookentry', $infopbk,"trn_id=".$POST['expense_paymentid']." and trn_table='expense_payment'", $dbcon);
							}*/
						$arr['msg']="update";
						$arr['eid']=$POST['eid'];
					}
					else
						$arr['msg']=0;
			echo json_encode($arr);	
				
			
		}
		else if(strtolower($POST['mode']) == "delete") {
					
			$info['mst_status']	= 2;
			$info1['trn_status']	= 2;
			$updateestimateid=update_record('expense_mst', $info,"expenseid=".$POST['eid'] , $dbcon);	
			$updatetrancationid=update_record('expense_trn', $info1,"expense_mstid=".$POST['eid'] , $dbcon);
			$query="select paid_amount from expense_mst where expenseid=".$POST['eid'];	
			$rel_mst=mysqli_fetch_assoc($dbcon->query($query));
			if(intval($rel_mst['paid_amount'])>0 || !empty($rel_mst['paid_amount']))//check paid amount for payment entry
			{
				$info_rec['status']	= 2;
				$updateestimateid=update_record('tbl_purchasereceipt', $info_rec,"purchasebill_id=".$POST['eid']." and receipt_flag='expense'" , $dbcon);
				$query="select group_concat(purchasereceipt_id) as receipt_trnid from tbl_purchasereceipt where purchasebill_id=".$POST['eid']." and receipt_flag='expense'";	
				$rel_mst=mysqli_fetch_assoc($dbcon->query($query));	
				$updateestimateid=update_record('tbl_passbookentry', $info_rec,"trn_id in (".$rel_mst['receipt_trnid'].") and trn_table='tbl_purchasereceipt'" , $dbcon);
			}
			if($updatetrancationid)
				echo "1";	
			else
				echo "0";			
		}
		
		else if(strtolower($POST['mode']) == "change_tax_type") {
		if(!empty($POST['eid']))
			{
				$where=' expense_mstid='.$POST['eid'];
			}
			else
			{
				$where=' trn.trn_status=3';
			}
		   $query="SELECT trn.* FROM `expense_trn` as trn where ".$where."  and trn.user_id=".$_SESSION['user_id'];
		   $rs=$dbcon->query($query);
		   while($rel=mysqli_fetch_assoc($rs))
		   {
			   $info_up=array();
				if($_POST['tax_type']=="inclusive")
				{
					$info= get_product_tax_common($dbcon,$rel['expense_amount'],$rel['formulaid'],$_POST['tax_type']);
					//$info_up=array_merge($info_up,$info);
					$info_up['total']		= $rel['expense_amount'];
					$info_up['expense_amount']	= $info['total'];
				}
				else
				{
					$info= get_product_tax_common($dbcon,$rel['total'],$rel['formulaid'],$_POST['tax_type']);
					//$info_up=array_merge($info_up,$info);
					$info_up['total']=$info['total'];
					$info_up['expense_amount']= $rel['total'];
				}	
				 update_record('expense_trn', $info_up,"expense_trnid=".$rel['expense_trnid'], $dbcon);
			 }
		}
		else if(strtolower($POST['mode']) == "fieldadd") {
			
				$info1['expense_acct']	= $POST['accountid'];
				$info1['expense_grp']	= get_group_from_expense($dbcon,$POST['accountid']);
				$info1['expense_amount']	= $POST['expense_amount'];
				$info1['expense_notes']		= stripslashes($POST['expense_notes']);
			 	$info1['formulaid']			= $POST['formulaid'];
				$info1['user_id']			= $_SESSION['user_id'];
				$info1['total']				= $POST['expense_gtotal'];
				$info=get_product_tax_common($dbcon,$POST['expense_amount'],$POST['formulaid'],$_POST['tax_type']);
				$info1=array_merge($info1,$info);
				if($_POST['tax_type']=="inclusive")
				{	
					$info1['total']				= $POST['expense_gtotal'];
					$info1['expense_amount']		= $POST['expense_amount'];
				}
				$table='expense_trn';$tableid='expense_trnid';
			if(!empty($POST['expenseid']))
			{
					$info1['expense_mstid']= $POST['expenseid'];
			}
			else
			{
				$info1['trn_status']	= 3;
			}
			if(empty($POST['edit_id']))
			{
				$inserid=add_record($table, $info1, $dbcon);
			}
			else
			{
				$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
			}
		}
		else if(strtolower($POST['mode']) == "formulavalue") {
			$rate_total=0;$c_total=$POST['c_total'];
			$qry="SELECT formula.*,tax.* FROM `formula_mst` as formula inner join tbl_tax as tax on find_in_set(tax.tax_id,formula.tax_id) WHERE formulaid=".$POST['eid']." order by tax_value desc";
			$row=$dbcon->query($qry);
			$j=0;
				//$dis=$POST['total']*$POST['t_dis']/100;
				$rate_total=$total=$POST['total'];
			while($tax=mysqli_fetch_assoc($row))
			{	
				if(strpos(strtolower(" ".$tax['tax_name']), "excise")==true)
				{
					$rate=$total*$tax['tax_value']/100;
					
					$total+=$rate;
				}
				else	
				{
					 $rate=($total)*$tax['tax_value']/100;
				}
				$rate=round($rate,2,PHP_ROUND_HALF_UP);
				echo '<div class="form-group">
								<label class="col-md-3 control-label">'.$tax['tax_name'].'</label>
								<div class="col-md-6 col-xs-11">
								<input id="taxvalue'.$j.'" name="taxvalue'.$j.'" value= "'.$rate.'"type="text" class="form-control" readonly="readonly">
						</div>
					</div>
					<input id="taxname'.$j.'" name="taxname'.$j.'" value= "'.$tax['tax_name'].'" type="hidden" class="form-control">';
					$rate_total=$rate_total+$rate;
					$j++;
			}
			$g_total=$rate_total+$c_total;
			echo '<input id="rate" name="rate" value= "'.$g_total.'" type="hidden" class="form-control" >';
		}
		else if(strtolower($POST['mode'])== "getproduct_amount")
		{
			$arr=get_product_tax_common($dbcon,$POST['amount'],$POST['formulaid']);
			echo json_encode($arr);
		}
		else if(strtolower($POST['mode']) == "load_tempoutward") 
		{
			if(!empty($POST['expenseid']))
			{
				$where=' trn.expense_mstid='.$POST['expenseid'].' and trn.trn_status=0';
			}
			else
			{
				$where=' trn.trn_status=3';
			}
		   $query="SELECT trn.*,e.expense_name FROM `expense_trn` as trn inner join expense_master as e on e.expense_id=trn.expense_acct  where ".$where."  and trn.user_id=".$_SESSION['user_id'];
			$result=$dbcon->query($query);
			echo ' <div class="form-group">
							  <div class="col-md-12 col-xs-11">
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th class="text-center"width="30%"><span class="english">Expense Accounts</span></th>
							<th class="text-center" width="12%"><span class="english">Amount</span></th>
							<th class="text-center"width="12%"><span class="english">Tax</span></th>
							<th class="text-center"width="12%"><span class="english">Total Amount</span></th>
							<th class="text-center"width="20%"><span class="english">Notes</span></th>
							<th class="text-center"width="7%"><span class="english">Action</span></th>
						</tr>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
				$tax_arr=get_product_tax_common_expense($dbcon,$rel['expense_amount'],$rel['formulaid']);
				$combine_arr=array_map(map_arr, $tax_arr['tax_name'], $tax_arr['tax_amount']);
				$tax_str=implode(" <br/>",$combine_arr);
			 echo '<tr id="fieldtr'.$id.'" >
					<td style="vertical-align:top;">
						'.$rel['expense_name'].'
					</td>
					<td style="vertical-align:top;">
							'.$rel['expense_amount'].'
					</td>
						
					<td style="vertical-align:top" class="text-left">
						'.$tax_str.'
						</td>
					<td style="vertical-align:top;">
						'.$rel['total'].'
					</td>					
					<td style="vertical-align:top;">
						'.$rel['expense_notes'].'
					</td>
					<input type="hidden" name="amount[]" id="amount'.$i.'" value="'.$rel['total'].'"/>
					 <td style="vertical-align:top">
							<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data('.$rel['expense_trnid'].',\' expense_trn\',\'expense_trnid\');" id="fieldremove'.$id.'"><i class="fa fa-pencil"></i></button>
							<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data('.$rel['expense_trnid'].',\' expense_trn\',\'expense_trnid\');" id="fieldremove'.$id.'"><i class="fa fa-trash-o"></i></button>
					</td>	
			</tr>';
			$i++;
			}
		}
		else{
		echo '<tr><td colspan="7" class="text-center">NO DATA FOUND</td></tr>';
			}
			echo '
	 
		</table>			 
							</div>
                           
							</div>	';
		}
		else if(strtolower($POST['mode'])== "preedit")
		{
			$q = $dbcon -> query("SELECT mst.* FROM ".$_POST['table']." as mst  WHERE ".$_POST['whereid']." = '$POST[id]'");
			$r = $q->fetch_assoc();
			
			echo json_encode($r);
		}
		else if(strtolower($POST['mode'])== "delete_data")
		{
			$row=array();
			$info['trn_status']=2;	
			$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);
			if($updateid){
				$row['res']="1";
			}
			else
			{
				$row['res']="0";
			}
			echo json_encode($row);
		}
    }
    /*else {
        die("Error - 2");
    }*/
}

/*
else {
    die("Error - 1");
}*/
?>
