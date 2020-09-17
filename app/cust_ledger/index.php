<?php
session_start();
$AJAX = true;
include("../../config/config.php");
include("../../config/session.php");
include("../../include/function_database_query.php");
include_once("../../include/coman_function.php");
include("../../config/image.php");
$image = new SimpleImage();
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
		
		if(strtolower($POST['mode']) == "generate_report") {
			$s_date=explode(' - ',$POST['date']);
			$_SESSION['start']=$s_date[0];
			$_SESSION['end']=$s_date[1];
			$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
		$set_head=mysqli_fetch_assoc($dbcon->query($set));		
			$qrycust="select * from tbl_customer where cust_id=".$POST['cust_id'];
			$cust_rel=mysqli_fetch_assoc($dbcon->query($qrycust));		
				$str .='
					<table  width="100%"   class="display table table-bordered table-striped">
					</table>
				  <table  class="display table table-bordered table-striped" id="data_list">
				  <tr id="logo" class="logo" style="display:none">
						<td colspan="8" style="text-align:center;">
							<strong>'.$set_head['company_name'].'</strong>
						</td>
					</tr>
					<tr>
						<td colspan="2"><strong>Customer Ledger </strong></td>
						<td colspan="2" style="text-align:center"><strong>	Name:'.$cust_rel['company_name'].'
						</strong></td>
						<td colspan="2" style="text-align:right">Date
					<label>  : <strong>'.date('d/m/Y',strtotime($s_date[0])).'</strong> To <strong>'.date('d/m/Y',strtotime($s_date[1])).'</strong></label></td>
				
					</tr>
					
				  <tr>
					  <th width="5%" style="text-align:center">Sr. NO.</th>
					  <th width="12%" style="text-align:center">Date</th>
					  <th width="47%" style="text-align:center">Description</th>
					   <th width="12%" style="text-align:center">Debit Amount</th>
					   <th width="12%" style="text-align:center">Credit Amount</th>
					   <th width="12%" style="text-align:center">Balance</th>
					 
				</tr>
				 <tbody>';
		$query="select opening_balance,balance_typeid,debitamount,creditamount,pocraditamount,podebitamount  from tbl_customer as cust 
		left join 
		(select sum(g_total) as debitamount,invoice.cust_id from tbl_invoice as invoice where invoice_status=0 and invoice.company_id=".$_SESSION['company_id']." and invoice_date < '".date('Y-m-d',strtotime($s_date[0]))."'  group by invoice.cust_id) as debitinvoice on debitinvoice.cust_id=cust.cust_id 
		left join 
		(select sum(paid_amount) as creditamount,rec.cust_id from tbl_receipt as rec where rec.status=0 and rec.company_id=".$_SESSION['company_id']." and rec.payment_date < '".date('Y-m-d',strtotime($s_date[0]))."'  group by rec.cust_id) as creditcust on creditcust.cust_id=cust.cust_id 
		left join 
		(select sum(g_total) as pocraditamount,pono.vender_id from tbl_pono as pono where pono.status=0 and pono.company_id=".$_SESSION['company_id']." and pono.po_date < '".date('Y-m-d',strtotime($s_date[0]))."'  group by pono.vender_id) as craditpo on craditpo.vender_id=cust.cust_id
		left join 
		(select sum(paid_amount) as podebitamount,porec.vender_id from tbl_purchasereceipt as porec where porec.status=0 and porec.company_id=".$_SESSION['company_id']." and porec.payment_date < '".date('Y-m-d',strtotime($s_date[0]))."'  group by porec.vender_id) as debitven on debitven.vender_id=cust.cust_id
		where cust.cust_id=".$POST['cust_id'];
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$op_balance=($rel['balance_typeid']=="1"?(-$rel['opening_balance']):$rel['opening_balance']);
		
		 $balance=$op_balance+$rel['debitamount']+$rel['podebitamount']-($rel['creditamount']+$rel['pocraditamount']);
		//$balance=$op_balance+$rel['creditamount']+$rel['pocraditamount'];
		 $balancetype='';
		$str .='<tr>
					<td style="text-align:center"></td>
					<td style="text-align:center">'.date('d/m/Y',strtotime($s_date[0])).'</td> 
					<td style="text-align:center">Opening Balance</td>
					<td style="text-align:center"> </td>
					<td style="text-align:center"> </td>';
					if($balance>0)
					{
						$balancetype='DR';
						$str .='
					  <td style="text-align:center;color:red;">'.abs($balance).' '.$balancetype.'</td>';
					}
					else if($balance<0)
					{
							$balancetype='CR';
							$str .='
					  <td style="text-align:center;color:green;">'.abs($balance).' '.$balancetype.'</td>';
					}else{
						$str .='
					  <td style="text-align:center;color:green;"></td>';
					}
					
					$str .='
					  <!--<td style="text-align:center">'.abs($balance).' '.$balancetype.'</td>-->
					</tr>';
			$qry='Select * from ((Select invoice_date,invoice_no,g_total,NULL as paymentmodeid,NULL as payment_mode,1 as typeid,invoice_id from tbl_invoice as invoice where invoice_status=0 and invoice_date>="'.date('Y-m-d',strtotime($s_date[0])).'" and invoice_date<="'.date('Y-m-d',strtotime($s_date[1])).'" and invoice.company_id='.$_SESSION['company_id'].' and invoice.cust_id='.$POST['cust_id'].' order by invoice_date) 
			
			union (select payment_date as invoice_date,concat(bank_name,"-",cheque_dtl) as invoice_no,paid_amount as g_total,payment.paymentmodeid,payment_mode,2 as typeid,receipt_id from tbl_receipt as payment left join bank_mst as bank on bank.bankid=payment.bank_id left join tbl_payment_mode mode on payment.paymentmodeid=mode.paymentmodeid where payment.status=0 and payment.company_id='.$_SESSION['company_id'].' and payment_date>="'.date('Y-m-d',strtotime($s_date[0])).'" and payment_date<="'.date('Y-m-d',strtotime($s_date[1])).'" and payment.cust_id='.$POST['cust_id'].' )
			
			union(Select po_date as invoice_date,po_no as invoice_no,g_total,NULL as paymentmodeid,NULL as payment_mode,3 as typeid,po_id from tbl_pono as pono where pono.status=0 and po_date>="'.date('Y-m-d',strtotime($s_date[0])).'" and po_date<="'.date('Y-m-d',strtotime($s_date[1])).'" and pono.company_id='.$_SESSION['company_id'].' and pono.vender_id='.$POST['cust_id'].' order by po_date)
			
			union (select payment_date as invoice_date,concat(acc_name,"-",cheque_dtl) as invoice_no,paid_amount as g_total,purpayment.paymentmodeid,payment_mode,4 as typeid,purchasereceipt_id from tbl_purchasereceipt as purpayment left join account_mst as acc on acc.acc_id=purpayment.acc_id left join tbl_payment_mode mode on purpayment.paymentmodeid=mode.paymentmodeid where purpayment.status=0 and purpayment.company_id='.$_SESSION['company_id'].' and purpayment.payment_date>="'.date('Y-m-d',strtotime($s_date[0])).'" and purpayment.payment_date<="'.date('Y-m-d',strtotime($s_date[1])).'" and purpayment.vender_id='.$POST['cust_id'].' )
			
			) as data order by invoice_date,typeid';
			$result1=$dbcon->query($qry);
			$i=1;
				
			if(mysqli_num_rows($result1)>0)
				{
					$total=0;
					while($re=mysqli_fetch_assoc($result1))
					{
						$balancetype='';
						$str.='<tr>
						  <td style="text-align:center">'.$i.'</td>
						  <td style="text-align:center">'.date('d/m/Y',strtotime($re["invoice_date"])).'</td>';
							$mode1=$re['paymentmodeid']==1 ? $re['payment_mode'] : 'Invoice Payment: '.$re['payment_mode'] .' ('.$re['invoice_no'].')';
							$mode2=$re['paymentmodeid']==1 ?'Purchace Payment: '. $re['payment_mode']: 'Purchace Payment: '.$re['payment_mode'] .' ('.$re['invoice_no'].')';
						if($re['typeid']=="1")
						{
							$str .='<td style="text-align:center">Invoice No : '.$re["invoice_no"].'</td>';
						}
						else if($re['typeid']=="2"){
							$str .='<td style="text-align:center">'.$mode1.'</td>';
						}else if($re['typeid']=="3"){
							$str .='<td style="text-align:center">Purchace No : '.$re["invoice_no"].'</td>';
						}else{
							$str .='<td style="text-align:center">'.$mode2.'</td>';
						}
						
						if($re['typeid']=="1")
						 {
						 $str.='
						  <td style="text-align:center;color:red;">'.$re['g_total'].'</td>';
							$balance+=$re['g_total'];
							
						 }  
						 else if($re['typeid']=="4")
						 {
							$str.='
						  <td style="text-align:center;color:red;">'.$re['g_total'].'</td>';
							$balance+=$re['g_total'];
						
						 }else 
						 {
							$str.='
						  <td style="text-align:center"></td>';
						
						 }
						 if($re['typeid']=="2")
						 {
						  $str.='<td style="text-align:center;color:green;">'.$re['g_total'].'</td>';
							$balance-=$re['g_total'];
							 
						 }else if($re['typeid']=="3")
						 {
						  $str.='<td style="text-align:center;color:green;">'.$re['g_total'].'</td>';
							$balance-=$re['g_total'];
							 
						 }  
						else
						{
								$str.='
						  <td style="text-align:center"></td>';
						
						}
					if($balance>0)
					{
						$balancetype='DR';
						$str.='
						  <td style="text-align:center;color:red;">'.abs($balance).' '.$balancetype.'</td>';	
						 
					}
					else if($balance<0)
					{
							$balancetype='CR';
							$str.='
						  <td style="text-align:center;color:green;">'.abs($balance).' '.$balancetype.'</td>	';
						 
					}else{
						$str.='
						  <td style="text-align:center;color:green;"></td>	';
					}
						 $str.='
						  <!--<td style="text-align:center">'.abs($balance).' '.$balancetype.'</td>	--> 
				 		</tr>';		
						$i++;
						
					}
					
				}
				else
				{
					$str .='<tr>
							<td colspan="10" style="text-align:center">NO DATA FOUND  </td>
							</tr>';
							
				}
			$str .='</tbody>				 
				  </table>';
				  
			echo $str;
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