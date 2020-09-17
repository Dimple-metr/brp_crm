<?php
	
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/coman_function.php");
include("../../include/function_database_query.php");

//print_r($_POST);
if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}

	if(strtolower($POST['mode']) == "generate_report") {
		$s_date=date('Y-m-d',strtotime($POST['date']));
		$where='';
		
		if(!empty($POST['product_id'])){
			$where.=' and pro.product_id='.$POST['product_id'];
		}
		if(!empty($POST['product_group'])){
			$where.=' and pro.product_group='.$POST['product_group'];
		}

		$query="SELECT pro.product_id,pro.product_name,opening_stock,minimum_stock,purchaseqty, todaypurchaseqty, bomplus_qty, todaybomplus_qty, invoiceqty, todayinvoiceqty, bom_m_qty, today_bom_m_qty, issueqty, todayissueqty FROM `tbl_product` as pro 
		
		left join (select sum(purtrn.product_qty) as purchaseqty,purtrn.product_id from tbl_grn_trn as purtrn 
		inner join tbl_grn as pur on pur.grn_id=purtrn.grn_id
		where purtrn.grn_trn_status=0 and pur.grn_status=0 and pur.company_id=".$_SESSION['company_id']." and pur.grn_date < '".$s_date."'  group by purtrn.product_id) as pur on pur.product_id=pro.product_id
	
		left join (select sum(purtrn.product_qty) as todaypurchaseqty,purtrn.product_id from tbl_grn_trn as purtrn 
		inner join tbl_grn as pur on pur.grn_id=purtrn.grn_id
		where purtrn.grn_trn_status=0 and pur.grn_status=0 and pur.company_id=".$_SESSION['company_id']." and pur.grn_date = '".$s_date."'  group by purtrn.product_id) as pur1 on pur1.product_id=pro.product_id
		
		left join (select sum(sotrn.product_qty) as todaybomplus_qty,sotrn.product_id from tbl_bom as bom
		inner join tbl_sales_order_trn as sotrn on sotrn.so_trn_id=bom.so_trn_id
		where bom.bom_status=0 and bom.company_id=".$_SESSION['company_id']." and bom.bom_date = '".$s_date."' group by sotrn.product_id) as bom_plus1 on bom_plus1.product_id=pro.product_id
		
		left join (select sum(sotrn.product_qty) as bomplus_qty,sotrn.product_id from tbl_bom as bom
		inner join tbl_sales_order_trn as sotrn on sotrn.so_trn_id=bom.so_trn_id
		where bom.bom_status=0 and bom.company_id=".$_SESSION['company_id']." and bom.bom_date < '".$s_date."' group by sotrn.product_id) as bom_plus on bom_plus.product_id=pro.product_id
		
		left join (select sum(invtrn.product_qty) as invoiceqty,invtrn.product_id from tbl_invoice_trn as invtrn 
		inner join tbl_invoice as invmst on invmst.invoice_id=invtrn.invoice_id where invtrn.invoice_trn_status=0 and invmst.company_id=".$_SESSION['company_id']." and invoice_date<'".$s_date."' group by invtrn.product_id) as invoice on invoice.product_id=pro.product_id
		
		left join (select sum(invtrn.product_qty) as todayinvoiceqty,invtrn.product_id from  tbl_invoice_trn as invtrn
		inner join tbl_invoice as invmst on invmst.invoice_id=invtrn.invoice_id where invtrn.invoice_trn_status=0 and invmst.company_id=".$_SESSION['company_id']." and invoice_date='".$s_date."' group by invtrn.product_id) as invoice1 on invoice1.product_id=pro.product_id
		
		left join (select sum(bomtrn.req_product_qty) as bom_m_qty,bomtrn.req_product_id from tbl_bom_trn as bomtrn 
		inner join tbl_bom as bom on bom.bom_id=bomtrn.bom_id where bomtrn.bom_trn_status=0 and bom.company_id=".$_SESSION['company_id']." and bom_date<'".$s_date."' group by bomtrn.req_product_id) as bom_m on bom_m.req_product_id=pro.product_id
		
		left join (select sum(bomtrn.req_product_qty) as today_bom_m_qty,bomtrn.req_product_id from tbl_bom_trn as bomtrn 
		inner join tbl_bom as bom on bom.bom_id=bomtrn.bom_id where bomtrn.bom_trn_status=0 and bom.company_id=".$_SESSION['company_id']." and bom_date='".$s_date."' group by bomtrn.req_product_id) as bom_m1 on bom_m1.req_product_id=pro.product_id
		
		left join (select sum(isstrn.product_qty) as issueqty,isstrn.product_id from tbl_issue_entry_trn as isstrn 
		inner join tbl_issue_entry as iss on iss.issue_entry_id=isstrn.issue_entry_id
		where isstrn.issue_trn_status=0 and iss.company_id=".$_SESSION['company_id']." and issue_entry_date<'".$s_date."' group by isstrn.product_id) as issue on issue.product_id=pro.product_id
		
		left join (select sum(isstrn.product_qty) as todayissueqty,isstrn.product_id from tbl_issue_entry_trn as isstrn 
		inner join tbl_issue_entry as iss on iss.issue_entry_id=isstrn.issue_entry_id
		where isstrn.issue_trn_status=0 and iss.company_id=".$_SESSION['company_id']." and issue_entry_date='".$s_date."' group by isstrn.product_id) as issue1 on issue1.product_id=pro.product_id
		
		where pro.product_status=0 ".$where." group by pro.product_id order by product_name";

		$rs=$dbcon->query($query);
		$str='';
		
		if(mysqli_num_rows($rs)){
			$i=1;
			while($rel=mysqli_fetch_assoc($rs))
			{
				$product_stock = floatval($rel['opening_stock']);
				
				$op_stock=($product_stock+floatval($rel['purchaseqty'])+floatval($rel['bomplus_qty']))-(floatval($rel['invoiceqty'])+floatval($rel['bom_m_qty'])+floatval($rel['issueqty']));
				$total=$op_stock+floatval($rel['todaypurchaseqty'])+floatval($rel['todaybomplus_qty']);
				$cl_stock=$total-(floatval($rel['todayinvoiceqty'])+floatval($rel['today_bom_m_qty'])+floatval($rel['todayissueqty']));
			
				$style="";$hdn_cls="out_stk_cls";
				if($cl_stock<=floatval($rel['minimum_stock'])){
					$style="color: red;font-weight: bold;";
					$hdn_cls="";
				}
				
				$str.='<tr class="'.$hdn_cls.'"><td style="text-align:center;">'.$i.'</td>
					<td>'.$rel['product_name'].'</td>
					<td style="text-align:right;">'.$op_stock.'</td>
					<td style="text-align:right;">'.$rel['minimum_stock'].'</td>
					<td style="text-align:right;'.$style.'">'.$cl_stock.'</td>
					</tr>';
				$i++;					  
			}
		}
		else{
			$str.='<tr><td colspan="8" style="text-align:center;">NO DATA FOUND !!!</td></tr>';
		}
		echo $str;
	}
	
?>