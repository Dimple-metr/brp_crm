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
  //if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	
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
			
			$WHERE="";
			$appData = array();
			$i=1;
			$aColumns = array('pro.product_id','pro.product_name','pro.product_hsn','type.pt_name','pro.item_code','pro.product_mst_rate','pro.cdate','pro.product_status','pro.user_id');
			$sIndexColumn = "pro.product_id";
			$isWhere = array("pro.product_status = 0 ".$where." and pro.company_id in (0,$_SESSION[company_id])");
			$sTable = "tbl_product as pro";			
			$isJOIN = array('left join tbl_product_type as type on type.pt_id=pro.product_type');
			$hOrder = "pro.product_id desc";
			include('../../include/pagging.php');
			$appData = array();
			$id=1;
			foreach($sqlReturn as $row) {
				$row_data = array();
				
				$row_data[] = $row['sr'];
				
			
				$row_data[] = $row['pt_name'];
				$row_data[] = $row['product_name'];
				$row_data[] = $row['product_hsn'];
			
				$edit_btn='';$delete_btn='';
				if($edit_btn_per){
					$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'product_edit/'.$row['product_id'].'"><i class="fa fa-pencil"></i></a>';
				}
				if($delete_btn_per){
					$delete_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_product('.$row['product_id'].')"><i class="fa fa-trash-o"></i></button>';
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
		$tr = $dbcon -> query("SELECT `product_id`,`product_name`,`product_status` FROM `tbl_product` WHERE product_status=0 and `product_name` = '".$POST["product_name"]."' and company_id=".$_SESSION['company_id']);
		if($tr->num_rows > 0) {
			echo '-1';
		}
		else {
			
			 $test = explode('.', $_FILES["file"]["name"]);
			 $ext = end($test);
			 $name = rand(10000, 99999) . '.' . $ext;
			 $path='../../view/upload/product_image/';
			 $location = $path . $name;  
			 move_uploaded_file($_FILES["file"]["tmp_name"], $location);
			
			$info['product_name']		= stripslashes($POST['product_name']);
			$info['item_code']			= $POST['item_code'];
			$info['product_cat']			= $POST['product_cat'];
			$info['product_group']			= $POST['product_group'];
			$info['product_brand']			= $POST['product_brand'];
			$info['product_type']		= $POST['product_type'];
			$info['product_hsn']		= $POST['product_hsn'];
			$info['product_desc']		= stripslashes($_POST['product_desc']);
			$info['product_part']		= $POST['product_part'];
			$info['p_photo']			= $name;
			$info['product_mst_rate']	= $POST['productmst_rate'];
			$info['product_purchase_mst_rate']	= $POST['product_purchase_mst_rate'];
			$info['product_mst_unitid']	= $POST['productmst_unitid'];
			$info['opening_stock']		= $POST['opening_stock'];
			$info['minimum_stock']		= $POST['minimum_stock'];
			
			$info['cdate']				= date("Y-m-d H:i:s");
			$info['user_id']			= $_SESSION['user_id'];
			$info['company_id']			= $_SESSION['company_id'];
			
			$inserid=add_record('tbl_product', $info, $dbcon);
			
			$dbcon->query("update tbl_product_model set pm_product_id='$inserid' WHERE pm_product_id='0' and  user_id='$_SESSION[user_id]'");
			
			$dbcon->query("update tbl_product_serial set ps_product_id='$inserid' WHERE ps_product_id='0' and  user_id='$_SESSION[user_id]'");
			
			$dbcon->query("update tbl_product_specs set pspec_product_id='$inserid' WHERE pspec_product_id='0' and  user_id='$_SESSION[user_id]'");
			
			$dbcon->query("update tbl_product_ven_hist set product_id='$inserid' WHERE ven_hist_status='0' and  user_id='$_SESSION[user_id]'");
			
				if($inserid){
					
					echo "1";
					
				}
				else{
					echo "0";
				}
			}
			//echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "preedit") {	
			$q = $dbcon -> query("SELECT * FROM `tbl_product` WHERE `product_id` = '$POST[id]'");
			$r = $q->fetch_assoc();
			echo json_encode($r);
		}
		else if(strtolower($POST['mode']) == "edit") {
			//var_dump($POST);
			//exit;
			
			
			 if(!empty($_FILES['file']['tmp_name'])) {
				$q="select * from tbl_product where product_id=".$POST['eid'];
				$row=mysqli_fetch_assoc($dbcon->query($q));
				$file=$row['p_photo'];
				
				$path='../../view/upload/product_image/';
			
				$location = $path . $file;  
				
				unlink($location);
				
				$test = explode('.', $_FILES["file"]["name"]);
				$ext = end($test);
				//$ext = pathinfo($test, PATHINFO_EXTENSION);
				$name1 = rand(100, 999) . '.' . $ext;
				$location1 = $path . $name1;  
				//unlink(LOGO_A."thumb//".$file);
				move_uploaded_file($_FILES["file"]["tmp_name"], $location1);
				
				$info['p_photo']= $name1;
			}
			/*if(@is_array(getimagesize($location1))){
				var_dump($ext);
				var_dump($location1);
				exit;
			}*/
			
			
			$info['product_name']		= $POST['product_name'];
			$info['item_code']			= $POST['item_code'];
			$info['product_cat']			= $POST['product_cat'];
			$info['product_group']			= $POST['product_group'];
			$info['product_brand']			= $POST['product_brand'];
			$info['product_type']		= $POST['product_type'];
			$info['product_hsn']		= $POST['product_hsn'];
			$info['product_desc']		= stripslashes($_POST['product_desc']);
			$info['product_part']		= $POST['product_part'];
			
			$info['product_mst_rate']	= $POST['productmst_rate'];
			$info['product_purchase_mst_rate']	= $POST['product_purchase_mst_rate'];
			$info['product_mst_unitid']	= $POST['productmst_unitid'];
			$info['opening_stock']		= $POST['opening_stock'];
			$info['minimum_stock']		= $POST['minimum_stock'];
			
			$info['cdate']				= date("Y-m-d H:i:s");
			$updateid=update_record('tbl_product', $info,"product_id=".$POST['eid'] , $dbcon);
			
			
			if($updateid)
					echo "1";
				else
					echo "0".$dbcon->error;
		}
		else if(strtolower($POST['mode']) == "delete") {
			//check Entry Record in TRN tables
			$chk_arr[]=array("inquiry_trn_id","tbl_inquiry_trn","inquiry_trn_status=0 and product_id=".$POST['eid']);
			$chk_arr[]=array("quot_trn_id","tbl_quotation_trn","quot_trn_status=0 and product_id=".$POST['eid']);
			$chk_resp=check_delete_trn($dbcon,$chk_arr);
			if($chk_resp){
				echo '-1';
			}
			else{
				$info['product_status']='2';
				$updateid=update_record('tbl_product', $info,"product_id=".$POST['eid'] , $dbcon);
				
				if($updateid)
					echo "1";
				else
					echo "0";	
			}
			
		}
		else if(strtolower($POST['mode']) == "check_data")
		{
				$row[] ='';
				if(!empty($_FILES['excel_file']['tmp_name']))
				{
					$file_name = $_FILES['excel_file']['name'];
					$err = $_FILES["excel_file"]["tmp_name"];
					$exts = array('csv'); 
					if(in_array(end(explode('.', $file_name)), $exts))
					{
						move_uploaded_file($err,CUSTOMER_UPING.$file_name);
						$handle = fopen(CUSTOMER_UPING.$file_name, "r");
						$row = check_data($file_name,$dbcon);
					}
					else
					{
						$row['res'] = "-1";
					}
			}
			else
				$row['res'] ='0';
				echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "import_data"){
				if(!empty($_FILES['excel_file']['tmp_name']))
				{	
					
					$file_name = $_FILES['excel_file']['name'];
					$err = $_FILES["excel_file"]["tmp_name"];
					move_uploaded_file($err,CUSTOMER_UPING.$file_name);
					$handle = fopen(CUSTOMER_UPING.$file_name, "r");
					($data = fgetcsv($handle,","));//get field rows
					$i=1;$error_array=array();
					while (($data = fgetcsv($handle,",")) !== FALSE) //get all data one by one
					{
						if ($data['4']  == ""){
							  $unitid_n = '0';
							}
						else{
							 
							 $unitname = $data['4'];
							$query="SELECT * FROM unit_mst WHERE unit_name='$unitname'";
							$unit=$dbcon->query($query);	
						
							while($rel = mysqli_fetch_assoc($unit))
							{	
							 
							 $unitid_n = $rel['unitid'];
							
							}
						}
						if ($data['5']  == ""){
							  $intrat = '';
							}
						else{
							 
							$intraname = $data['5'];
							$query="SELECT * FROM formula_mst WHERE formula_name='$intraname'";
							$intra_tax=$dbcon->query($query);	
						
							while($rel = mysqli_fetch_assoc($intra_tax))
							{	
							 
							 $intrat = $rel['formulaid'];
							
							}
						}
						if ($data['6']  == ""){
							  $intert = '';
							}
						else{
							 
							$intername = $data['6'];
							$query="SELECT * FROM formula_mst WHERE formula_name='$intername'";
							$inter_tax=$dbcon->query($query);	
						
							while($rel = mysqli_fetch_assoc($inter_tax))
							{	
							 
							 $intert = $rel['formulaid'];
							
							}
						}

						$error='';
						if(!empty($data['0']))
						{
							checkunit($data['4']);
							$info['product_name']=$data['0'];
							$info['product_des']=$data['1'];
							$info['product_code']=$data['2'];
							$info['product_mst_rate']=$data['3'];
							$info['product_mst_unitid']=$unitid_n;
							$info['intra_tax']=$intrat;
							$info['inter_tax']=$intert;
							$info['company_id']=$_SESSION['company_id'];
							$q="SELECT `product_name` FROM `tbl_product` WHERE product_status=0 and `product_name` ='".$info['product_name']."' and `company_id` ='".$_SESSION['company_id']."'";
							$tr = $dbcon -> query($q);
							$cnt=mysqli_num_rows($tr);
							if($cnt>0 ) {
								$error='Product Already Added';
								array_push($error_array,1);
							}
							else
							{
									add_record('tbl_product', $info, $dbcon);
							}
								 
						}
						else
						{
							$error='Blank Row';
							array_push($error_array,1);
						}
						if(!empty($error))
						{	
							$info1['line_num']=$i;
							$info1['error']=$error;
							$info1['company_id']=$_SESSION['company_id'];
							add_record('product_tempdata', $info1, $dbcon);
						}
						$i++;
					}
					 	if(in_array(1,$error_array))
						{
							$result['res']='5';
						}
						else
						{
							$result['res']='4';
						}	
				fclose($handle);//close file reading
				 
			}
			else
			{$result['res']='0';}
		
			echo  json_encode($result);
		}
		else if(strtolower($POST['mode']) == "show_importedcustdata") {
			$temp_custqry='select * from product_tempdata where company_id='.$_SESSION['company_id'];
			$temp_result=$dbcon->query($temp_custqry);
			if(mysqli_num_rows($temp_result)>0)
			{
			echo '<table  class="display table table-bordered table-striped">
								<tr>
								<td>Line Number</td>
								<td>Error</td>
								</tr>';
			 
		 
			while($temp_rel=mysqli_fetch_assoc($temp_result))
			{
				echo '<tr>';
				echo '<td>'.$temp_rel['line_num'].'</td>'; 
				echo '<td>'.$temp_rel['error'].'</td>'; 
				echo '</tr>';
			}
				echo '</table>';
			}
		}
		else if(strtolower($POST['mode']) == "add_serial") {	
			
			$info['ps_serial_no']=$POST['p_serial'];
			$info['ps_product_id']=$POST['product_id'];
			$info['user_id']		= $_SESSION['user_id'];
			$info['cdate']		= date("Y-m-d H:i:s");
			$info['company_id']		= $_SESSION['company_id'];
			
			if($POST['edit_id']=='')
			{
				$updateid=add_record('tbl_product_serial', $info, $dbcon);
			}
			else
			{
				$updateid=update_record('tbl_product_serial', $info,"ps_id=".$POST['edit_id'] , $dbcon);
				
			}
			
			if($updateid)
				echo "1";
			else
				echo "0";
		}
		else if(strtolower($POST['mode']) == "load_serial_data") {
			
			$product_id=$POST['product_id'];
			
			$query="select * from tbl_product_serial where ps_product_id='$product_id'";
			
			$result=$dbcon->query($query);
			echo ' 
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th class="text-center">#</th>
							<th class="text-center"  width="80%">Serial No</th>
						 	<th class="text-center">Action</th>
						</tr>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
			 echo '<tr id="fieldtr'.$id.'" >
					
					<td style="vertical-align:top;">
						<b>'.$i.'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['ps_serial_no'].'</b><br>
					</td>
					
					<td style="vertical-align:top">
						<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_serial('.$rel['ps_id'].',\'tbl_product_serial\',\'ps_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
						<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_serial('.$rel['ps_id'].',\'tbl_product_serial\',\'ps_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
					</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="3" class="text-center">NO DATA FOUND</td></tr>';
		}
		
			echo '</table>			 
					';
		}
		
		else if(strtolower($POST['mode'])== "preedit_serial")
		{
			$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
			$r = $q->fetch_assoc();
			
			echo json_encode($r);
		}
		
		else if(strtolower($POST['mode'])== "delete_data")
		{
			$row=array();
			
			delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
			//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);


			$row['res']="1";
			
			echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "add_model") {	
			
			$info['pm_model_no']=$POST['p_model'];
			$info['pm_product_id']=$POST['product_id'];
			$info['user_id']		= $_SESSION['user_id'];
			$info['cdate']		= date("Y-m-d H:i:s");
			$info['company_id']		= $_SESSION['company_id'];
			
			if($POST['edit_id']=='')
			{
				$updateid=add_record('tbl_product_model', $info, $dbcon);
			}
			else
			{
				$updateid=update_record('tbl_product_model', $info,"pm_id=".$POST['edit_id'] , $dbcon);
				
			}
			
			if($updateid)
				echo "1";
			else
				echo "0";
		}
		else if(strtolower($POST['mode']) == "load_model_data") {
			
			$product_id=$POST['product_id'];
			
			$query="select * from tbl_product_model where pm_product_id='$product_id'";
			
			$result=$dbcon->query($query);
			echo ' 
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th class="text-center">#</th>
							<th class="text-center"  width="80%">Model No</th>
						 	<th class="text-center">Action</th>
						</tr>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
			 echo '<tr id="fieldtr'.$id.'" >
					
					<td style="vertical-align:top;">
						<b>'.$i.'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['pm_model_no'].'</b><br>
					</td>
					
					<td style="vertical-align:top">
						<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_model('.$rel['pm_id'].',\'tbl_product_model\',\'pm_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
						<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_model('.$rel['pm_id'].',\'tbl_product_model\',\'pm_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
					</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="3" class="text-center">NO DATA FOUND</td></tr>';
		}
		
			echo '</table>			 
					';
		}
		
		else if(strtolower($POST['mode'])== "preedit_model")
		{
			$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
			$r = $q->fetch_assoc();
			
			echo json_encode($r);
		}
		
		else if(strtolower($POST['mode'])== "delete_model")
		{
			$row=array();
			
			delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
			//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);


			$row['res']="1";
			
			echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "add_product_spec") {	
			
			$info['p_priority']=$POST['p_priority'];
			$info['p_header']=$POST['p_header'];
			$info['p_spec']=$POST['p_spec'];
			$info['p_value']=$POST['p_value'];
			$info['user_id']		= $_SESSION['user_id'];
			$info['cdate']		= date("Y-m-d H:i:s");
			$info['company_id']		= $_SESSION['company_id'];
			
			$info['pspec_product_id']=$POST['product_id'];
			
			if($POST['edit_id']=='')
			{
				$updateid=add_record('tbl_product_specs', $info, $dbcon);
			}
			else
			{
				$updateid=update_record('tbl_product_specs', $info,"pspec_id=".$POST['edit_id'] , $dbcon);
				
			}
			
			if($updateid)
				echo "1";
			else
				echo "0";
		}
		else if(strtolower($POST['mode']) == "load_spec_data") {
			
			$product_id=$POST['product_id'];
			
			$query="select * from tbl_product_specs where pspec_product_id='$product_id'";
			
			$result=$dbcon->query($query);
			echo ' 
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th class="text-center">#</th>
							<th class="text-center" >Priority</th>
							<th class="text-center" >Header</th>
							<th class="text-center" >Specification</th>
							<th class="text-center" >Values</th>
						 	<th class="text-center">Action</th>
						</tr>';
		if(mysqli_num_rows($result)>0)
		{
			$i=1;
			while($rel=mysqli_fetch_assoc($result))
			{
			 echo '<tr id="fieldtr'.$id.'" >
					
					<td style="vertical-align:top;">
						<b>'.$i.'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['p_priority'].'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['p_header'].'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['p_spec'].'</b><br>
					</td>
					
					<td style="vertical-align:top;">
						<b>'.$rel['p_value'].'</b><br>
					</td>
					
					<td style="vertical-align:top">
						<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_spec('.$rel['pspec_id'].',\'tbl_product_specs\',\'pspec_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
						<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_spec('.$rel['pspec_id'].',\'tbl_product_specs\',\'pspec_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
					</td>	
				</tr>';
				$i++;
			}
		}
		else{
			echo '<tr><td colspan="3" class="text-center">NO DATA FOUND</td></tr>';
		}
		
			echo '</table>			 
					';
		}
		else if(strtolower($POST['mode'])== "preedit_spec")
		{
			$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
			$r = $q->fetch_assoc();
			
			echo json_encode($r);
		}
		else if(strtolower($POST['mode'])== "delete_spec")
		{
			$row=array();
			
			delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
			//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);


			$row['res']="1";
			
			echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "add_ven_hist") {	
			
			$info['cust_id']	= $POST['cust_id'];
			$info['ven_rate']	= $POST['ven_rate'];
			$info['ven_rmrk']	= $_POST['ven_rmrk'];
			$info['user_id']	= $_SESSION['user_id'];
			$info['cdate']		= date("Y-m-d H:i:s");
			$info['company_id']	= $_SESSION['company_id'];
			
			if($POST['product_id']){
				$info['product_id']=$POST['product_id'];
			}
			else{
				$info['ven_hist_status']=3;
			}
			
			if($POST['edit_id']) {
				$updateid=update_record('tbl_product_ven_hist', $info,"ven_hist_id=".$POST['edit_id'] , $dbcon);
			}
			else {
				$updateid=add_record('tbl_product_ven_hist', $info, $dbcon);
			}
			
			if($updateid)
				echo "1";
			else
				echo "0";
		}
		else if(strtolower($POST['mode']) == "show_ven_hist") {
			
			$product_id=$POST['product_id'];
			if($product_id){
				$query="select trn.*,cust.cust_name from tbl_product_ven_hist as trn 
				left join tbl_customer as cust on cust.cust_id=trn.cust_id
				where ven_hist_status!=2 and product_id='$product_id'";
			}
			else{
				$query="select trn.*,cust.cust_name from tbl_product_ven_hist as trn 
				left join tbl_customer as cust on cust.cust_id=trn.cust_id
				where ven_hist_status!=2 and trn.user_id=".$_SESSION['user_id'];
			}
			
			$result=$dbcon->query($query);
			echo ' <table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th class="text-center">#</th>
							<th class="text-center" >Vendor Name</th>
							<th class="text-center" >Rate</th>
							<th class="text-center" >Remark</th>
							<th class="text-center" >Date</th>
						 	<th class="text-center readonly">Actionx</th>
						</tr>';
			if(mysqli_num_rows($result)>0)
			{
				$i=1;
				while($rel=mysqli_fetch_assoc($result))
				{
				 echo '<tr id="fieldtr'.$i.'" >
						<td style="vertical-align:top;">
							<b>'.$i.'</b>
						</td>
						<td style="vertical-align:top;">
							<b>'.$rel['cust_name'].'</b>
						</td>
						<td style="vertical-align:top;">
							'.$rel['ven_rate'].'
						</td>
						<td style="vertical-align:top;">
							'.nl2br($rel['ven_rmrk']).'
						</td>
						<td style="vertical-align:top;">
							'.date("d-m-Y",strtotime($rel['cdate'])).'
						</td>
						<td style="vertical-align:top" class="readonly">
							<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_ven_hist('.$rel['ven_hist_id'].');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
							<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_ven_hist('.$rel['ven_hist_id'].');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
						</td>	
					</tr>';
					$i++;
				}
			}
			else{
				echo '<tr><td colspan="6" class="text-center">NO DATA FOUND</td></tr>';
			}
		
			echo '</table>	';
		}
		else if(strtolower($POST['mode'])== "edit_ven_hist") {
			$q = $dbcon -> query("SELECT * FROM tbl_product_ven_hist WHERE ven_hist_id= '$POST[ven_hist_id]'");
			$r = $q->fetch_assoc();
			
			echo json_encode($r);
		}
		else if(strtolower($POST['mode'])== "delete_ven_hist") {
			$info['ven_hist_status']=2;
			$updateid=update_record("tbl_product_ven_hist", $info,"ven_hist_id=".$POST['ven_hist_id'] , $dbcon);

			$row['res']="1";
			echo json_encode($row);
		}
  
}

//else {
  //  die("Error - 1");
//}
function check_data($filename,$dbcon)
{
	$error=array();
	//$qry="SELECT * FROM `productfield_mst` where status=0 and user_id=".$_SESSION['user_rid']." limit 2";
	//$row=$dbcon->query($qry);
	$arr = explode(".", $filename);
	$fp = fopen(CUSTOMER_UPING.$filename, 'r');
	$frow = fgetcsv($fp);
	if(count($frow)==7) // Define coulmn count Here
	{
		$msg='';
		 if ( $frow[0] !== 'Product Name' || $frow[1] !== 'Product Description' || $frow[2] !== 'Hsn Code' || $frow[3] !== 'Product Rate' || $frow[4] !== 'Product Unit' || $frow[5] !== 'Intra Tax' || $frow[6] !== 'Inter Tax' )
		{
			$msg='error';
		}
		
		if(!empty($msg))
		{
			$error['res']="3";
		}
		else
		{
			delete_record('product_tempdata', 'company_id='.$_SESSION['company_id'], $dbcon);
			$error['res']="1";
		}
	}
	else
	{
		$error['res']="0";
	}
	return $error;
}
?>