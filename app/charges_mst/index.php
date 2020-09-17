<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");
//if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') 
{ 
  //  if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	{
		//print_r($_POST);
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		
			if(strtolower($POST['mode']) == "fetch") {
			$appData = array();
			$i=1;
			$aColumns = array('product_id','product_name','product_code','product_mst_rate','cdate', 'product_status', 'imst.user_id');
			$sIndexColumn = "product_id";
			$isWhere = array("product_status = 0 and product_type=3 and imst.company_id in (0,$_SESSION[company_id])");
			$sTable = "tbl_product as imst";			
			$isJOIN = array();
			$hOrder = "imst.product_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				$row_data[] = $row['sr'];
				$row_data[] = $row['product_name'];
				$row_data[] = $row['product_mst_rate'];
				$row_data[] = '<button class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" onClick="edit_test('.$row['product_id'].');"><i class="fa fa-pencil"></i></button>
					<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_product('.$row['product_id'].')"><i class="fa fa-trash-o"></i></button>
				';
				$appData[] = $row_data;
				$id++;
			}
			$output['aaData'] = $appData;
			echo json_encode( $output );
		}
	else if(strtolower($POST['mode']) == "add") {
				$row['res']='';
				$tr = $dbcon -> query("SELECT `product_id`,`product_name`,`product_status` FROM `tbl_product` WHERE product_status=0 and `product_name` = '".$POST["product_name"]."' and company_id=".$_SESSION['company_id']);
				if($tr->num_rows > 0) {
					$row['res']='3';
				}
				else {
							$info['product_type']		= 3; // FIXed Charges ID
							$info['product_name']		= stripslashes($POST['charges_name']);
							$info['product_mst_rate']	= $POST['charges_rate'];
							$info['intra_tax']			= $POST['intra_tax'];
							$info['inter_tax']			= $POST['inter_tax'];
							$info['cdate']				= date("Y-m-d H:i:s");
							$info['user_id']			= $_SESSION['user_id'];
							$info['multi_company']		= $POST['multi_company'];
							if(!$POST['multi_company'])
								$info['company_id']			= $_SESSION['company_id'];
							else
								$info['company_id']			= 0;
							$inserid=add_record('tbl_product', $info, $dbcon);
					if($inserid)
					{
						$row['res'] ="1";
						
					}
					else
					{
						$row['res'] ="0";
					}
					
				}
				echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "preedit") {	
			$q = $dbcon -> query("SELECT * FROM `tbl_product` WHERE `product_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
							$info['product_name']		= stripslashes($POST['charges_name']);
							$info['product_mst_rate']	= $POST['charges_rate'];
							$info['intra_tax']			= $POST['intra_tax'];
							$info['inter_tax']			= $POST['inter_tax'];
							$info['cdate']				= date("Y-m-d H:i:s");
							$info['user_id']			= $_SESSION['user_id'];
							$info['multi_company']		= $POST['multi_company'];
							if(!$POST['multi_company'])
								$info['company_id']			= $_SESSION['company_id'];
							else
								$info['company_id']			= 0;
							$updateid=update_record('tbl_product', $info,"product_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
		}
		else if(strtolower($POST['mode']) == "delete") {
				$info['product_status']='2';
					$updateid=update_record('tbl_product', $info,"product_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";
		}
		
    }
  
}

?>