<?php
session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/coman_function.php");
include("../../include/function_database_query.php");
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
		
		if(strtolower($POST['mode']) == "fetch") {
			$appData = array();
			$i=1;
			$aColumns = array('acc.tansactionid', 'debit.acc_id','credit.acc_id','tran_amount','tran_date','status', 'debit.acc_name as debit_aname','credit.acc_name as credit_aname','debit.branch_name as debit_bname','debitbank.bank_name as debit_bankname','credit.branch_name as credit_bname','creditbank.bank_name as credit_bankname','acc.cdate','acc.user_id','pay.generat_status','pay.chequegenerateid');
			$sIndexColumn = "acc.tansactionid";
			$isWhere = array("status != 2".check_user('acc'));
			$sTable = " tbl_banktransaction as acc";			
			$isJOIN = array("left join account_mst  as debit on debit.acc_id=acc.debit_accid","left join account_mst  as credit on credit.acc_id=acc.credit_accid","left join bank_mst as debitbank on debitbank.bankid=debit.bankid","left join bank_mst as creditbank on creditbank.bankid=credit.bankid","left join tbl_payment_cheque_generate as pay on pay.tansactionid=acc.tansactionid");
			$hOrder = "acc.tansactionid desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['debit_aname'].'('.$row['debit_bankname'].' - '.$row['debit_bname'].')';
				$row_data[] = $row['credit_aname'].'('.$row['credit_bankname'].' - '.$row['credit_bname'].')';
				$row_data[] = $row['tran_amount'];
                $row_data[] = $row['tran_date'];
                $edit='<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['tansactionid'].')"><i class="fa fa-pencil"></i></button> ';
				$delete='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_banktransactionmst('.$row['tansactionid'].')"><i class="fa fa-trash-o"></i></button>';
				if($row['tansactionid']>0)
				{
				    $btn = $edit.' '.$delete;
                }
				if($row['generat_status']=="0")
                {
                    $btn =  $edit.' '.$delete.' <a class="btn btn-xs btn-info" data-original-title="Print Cheque" data-toggle="tooltip" data-placement="top" href="'.DOMAIN_CHEQUE.'generage-cheque/'.$row['chequegenerateid'].'" target="_blank"><i class="fa fa-money"></i></a>';
                }
				else if($row['generat_status']=="1")
				{
					$btn = $delete;
				}
                $row_data[] = $btn;
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
		else if(strtolower($POST['mode']) == "add") {
				
				$tr = $dbcon -> query("SELECT `tansactionid`,`status` FROM `tbl_banktransaction` WHERE `debit_accid` = '".$POST['debit_accid']."' and credit_accid=".$POST['credit_accid']," and tran_date='".date('Y-m-d',strtotime($POST['tran_date']))."' and tran_amount='".$POST['tran_amount']."' and company_id=".$_SESSION['company_id']);
				if($tr->num_rows > 0) {
					$r = $tr -> fetch_assoc();
					if($r['status'] != 0) {
						$info['status']=0;
						$updateid=update_record('tbl_banktransaction', $info,"tansactionid=".$r['tansactionid'] , $dbcon);
						if($updateid)
							echo "1";
						else
							echo "0";
					}
					else {
						echo '-1';
					}
				}
				else {
                            $info['debit_accid']		= $POST['debit_accid'];
							$info['paymentmodeid']		= $POST['paymentmodeid'];
							$info['reference_no']		= $POST['cheque_dtl'];
							$info['credit_accid']		= $POST['credit_accid'];
							$info['tran_amount']		= $POST['tran_amount'];
							$info['tran_date']			= date('Y-m-d',strtotime($POST['tran_date']));
							$info['tran_note']			= $POST['tran_note'];
                            $info['cdate']				= date("Y-m-d H:i:s");
							$info['user_id']			= $_SESSION['user_id'];
							$info['company_id']			= $_SESSION['company_id'];
							$inserid=add_record('tbl_banktransaction', $info, $dbcon);
							if($POST['debit_accid']!='0' && $POST['paymentmodeid']=="2" )
							{
								$query_ven="SELECT * FROM `tbl_vender` where venderacc_id=".$POST['credit_accid'];
								$rel_ven=mysqli_fetch_assoc($dbcon->query($query_ven));

								$info_gen['acc_id']			= $POST['debit_accid'];
								$info_gen['amount']			= $POST['tran_amount'];
								$info_gen['cheque_date']	= date('Y-m-d',strtotime($POST['tran_date']));
								$info_gen['cheque_num']		= $POST['cheque_dtl'];
								$info_gen['vender_id']		= $rel_ven['vender_id'];
								$info_gen['tansactionid']	= $inserid;
								$info_gen['generat_status'] = 0;// for cheque generate
								$info_gen['company_id']	=	$info['company_id']			= $_SESSION['company_id'];
								$insert_cheque=add_record('tbl_payment_cheque_generate', $info_gen, $dbcon);
							}
					if($inserid)
                    {
                        if(strtolower($POST['model'])=="model")
						{
							$query="SELECT acc_id,bank_name,branch_name,acc_number,acc_name FROM `account_mst` as accmst left join bank_mst as bmst on bmst.bankid=accmst.bankid where acc_status=0 and acc_id=".$inserid;
							$rel=mysqli_fetch_assoc($dbcon->query($query));		
							//$row = $rel;
                            $row['id']=$rel['acc_id'];
                            $row['name']=$rel['acc_name'].' ('.$rel['bank_name'].' - '.$rel['branch_name'].')';
							$row['res']="2"; 
						}
						else
						{
							$row['res'] ="1";
						}
                    }
                    else
						$row['res'] ="0";
				}
			
         echo json_encode($row);
		}		
        else if(strtolower($POST['mode']) == "preedit") {
           
			$tr = $dbcon -> query("SELECT * FROM `tbl_banktransaction` as banktrn left join tbl_payment_cheque_generate as chequepay on chequepay.tansactionid=banktrn.tansactionid WHERE banktrn.`tansactionid` =".$POST['id']);
            $rel=mysqli_fetch_assoc($tr);
            $rel['tran_date1']=date('d-m-Y',strtotime($rel['tran_date']));
            echo json_encode($rel);
        }
		else if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{
				$info['debit_accid']		= $POST['debit_accid'];
                $info['paymentmodeid']		= $POST['editpaymentmodeid'];
				$info['reference_no']		= $POST['editcheque_dtl'];
				$info['credit_accid']		= $POST['credit_accid'];
                $info['tran_amount']		= $POST['tran_amount'];
                $info['tran_date']			= date('Y-m-d',strtotime($POST['tran_date']));
                $info['tran_note']			= $POST['tran_note'];
                $info['cdate']				= date("Y-m-d H:i:s");
                $info['user_id']			= $_SESSION['user_id'];
                $updateid=update_record('tbl_banktransaction', $info,"tansactionid=".$POST['edit_id'] , $dbcon);
				if(!empty($POST['chequegenerateid']))
				{
					if($POST['debit_accid']!='0' && $POST['editpaymentmodeid']=="2" )
					{	
					
					$info_gen['acc_id']			= $POST['debit_accid'];
					$info_gen['amount']			= $POST['tran_amount'];
					$info_gen['cheque_date']	= date('Y-m-d',strtotime($POST['tran_date']));
					$info_gen['cheque_num']		= $POST['cheque_dtl'];
					$info_gen['vender_id']		= $POST['editvender_id'];
					$info_gen['tansactionid']	= $POST['edit_id'];
					$info_gen['generat_status'] = 0;// for cheque generate
					$updateid=update_record('tbl_payment_cheque_generate', $info_gen,"chequegenerateid=".$POST['chequegenerateid'] , $dbcon);
					}
					else
					{
						$deleteid=delete_record('tbl_payment_cheque_generate',"chequegenerateid=".$POST['chequegenerateid'],$dbcon);
					}
				}
				else
				{
					if($POST['debit_accid']!='0' && $POST['editpaymentmodeid']=="2" )
					{
						$query_ven="SELECT * FROM `tbl_vender` where venderacc_id=".$POST['credit_accid'];
						$rel_ven=mysqli_fetch_assoc($dbcon->query($query_ven));
						$info_gen['acc_id']			= $POST['debit_accid'];
						$info_gen['amount']			= $POST['tran_amount'];
						$info_gen['cheque_date']	= date('Y-m-d',strtotime($POST['tran_date']));
						$info_gen['cheque_num']		= $POST['cheque_dtl'];
						$info_gen['vender_id']		= $rel_ven['vender_id'];
						$info_gen['tansactionid']	= $inserid;
						$info_gen['generat_status'] = 0;// for cheque generate
						$info_gen['usertype_id']			= $_SESSION['user_type'];
						$insert_cheque=add_record('tbl_payment_cheque_generate', $info_gen, $dbcon);
					}
				}
				if($updateid)
					echo "2";
				else
					echo "0".$dbcon->error;
			}
		}
		else if(strtolower($POST['mode']) == "delete") {
			$info['status']		= 2;
			$updateid=update_record('tbl_banktransaction', $info,"tansactionid=".$POST['eid'] , $dbcon);	
			$query="select cheque_id from tbl_payment_cheque_generate where tansactionid=".$POST['eid'];
			$rs_cheque=($dbcon->query($query));
			if(mysqli_num_rows($rs_cheque)>0)
			{
				$rel_cheque=mysqli_fetch_assoc($rs_cheque);
				$info_cheque['cheque_iscancel']=1;
				update_record('coro_cheques', $info_cheque,"cheque_id=".$rel_cheque['cheque_id'], $dbcon);
			}	
			if($updateid)
				echo "1";	
			else
				echo "0";			
		}
		else if(strtolower($POST['mode']) == "get_opn_bal") {
			$acc_id=$POST['acc_id'];
			if($acc_id==0)
			{	
				$qry="select acc_id,acc_type from account_mst where acc_type=1 and acc_status=0 and company_id=".$_SESSION['company_id'];
				$rel=mysqli_fetch_assoc($dbcon->query($qry));	
				$acc_id=$rel['acc_id'];
			}
			else
			{
					$qry="select acc_id,acc_type from account_mst where  acc_status=0 and company_id=".$_SESSION['company_id']." and acc_id=".$acc_id;
					$rel=mysqli_fetch_assoc($dbcon->query($qry));	
					$acc_id=$rel['acc_id'];
			
			}
			echo get_opening_balance($acc_id,$dbcon,$rel['acc_type']);
		}
		else if(strtolower($POST['mode']) == "get_venderid") {
            $tr = $dbcon -> query("SELECT vender_id FROM `tbl_vender` WHERE `venderacc_id` =".$POST['acc_id']);
            $rel=mysqli_fetch_assoc($tr);
            echo $rel['vender_id'];
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