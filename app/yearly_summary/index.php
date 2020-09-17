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
				
			$set="select * from tbl_setting";
			$set_head=mysqli_fetch_assoc($dbcon->query($set));		
				$str .='
					<table  width="100%"   class="display table table-bordered table-striped">
					</table>
				  <table  class="display table table-bordered table-striped" id="data_list">
				  <tr id="logo" class="logo" style="display:none">
						<td colspan="8" style="text-align:center;">
							<strong>'.$set_head['title'].'</strong>
						</td>
					</tr>
					<tr>
						<td colspan="8"><strong>Yearly Summary  Report</strong></td>
						
				
					</tr>
					
				  <tr>
					  <th width="2%" style="text-align:center">Sr. NO.</th>
					  <th width="20%" style="text-align:center">Financial Year </th>
					  <th width="20%" style="text-align:center">Total Business</th>
					  <th width="15%" style="text-align:center">Total Collection</th>					   
				</tr>
				 <tbody>';
				 $qry='SELECT  CASE WHEN MONTH(invoice_date)>=4 THEN concat(YEAR(invoice_date), "-",YEAR(invoice_date)+1)
				   ELSE concat(YEAR(invoice_date)-1,"-", YEAR(invoice_date)) END AS financial_year,
				SUM(g_total) as tot_business,sum(paid_amount) as tot_collection
				from tbl_invoice
				where invoice_status=0 and company_id='.$_SESSION['company_id'].'
				group by 1';
			  $result1=$dbcon->query($qry);
				$i=1;
				if(mysqli_num_rows($result1)>0)
				{
					$total=0;
					while($re=mysqli_fetch_assoc($result1))
					{	
						$str.='<tr>
						  <td style="text-align:center">'.$i.'</td>
						  <td style="text-align:center">'.$re["financial_year"].'</td>';
						 	$str .='<td style="text-align:center">'.indian_number($re["tot_business"]).'</td>';
					  	$str .='<td style="text-align:center">'.indian_number($re["tot_collection"]).'</td></tr>';				
						$i++;
						$total_bus=$total_bus+$re['tot_business'];
						$total_col=$total_col+$re['tot_collection'];
					}
						$str .="<tr>
							<td colspan='2' style='text-align:right;'>Total:</td><td style='text-align:center'>".indian_number($total_bus)."</td><td style='text-align:center'>".indian_number($total_col)."</td></tr>";
				}
				else
				{
					$str .='<tr>
							<td colspan="4" style="text-align:center">NO DATA FOUND  </td>
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