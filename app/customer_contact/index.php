<?php
session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/coman_function.php");
include("../../include/function_database_query.php"); 

//print_r($_POST);
//print_r($_FILES);
if($_POST != NULL) {
	$POST = bulk_filter($dbcon,$_POST);
}
else {
	$POST = bulk_filter($dbcon,$_GET);
}
	
	if(strtolower($POST['mode']) == "fetch") {
		$edit_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'edit',$dbcon);
		$delete_btn_per=check_permission($_SESSION['page'],$_SESSION['user_type'],'delete',$dbcon);
		 
		$where='';
		
		
		$appData = array();
		$i=1;
		$aColumns = array('cust_id', 'cust_code', 'cust_name','cust_mobile','cust_status','cust.cdate','cust.user_id');
		$sIndexColumn = "cust_id";
		$isWhere = array("cust_status = 0 ".$where."  and cust.company_id in (0,$_SESSION[company_id])");
		$sTable = " tbl_customer as cust";			
		$isJOIN = array();
		$hOrder = "cust.cust_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['cust_code'];
			$row_data[] = $row['cust_name'];
			$row_data[] = $row['cust_mobile'];
			
			
			$edit_btn=''; $delete_btn=''; 
			
			$view_cust_btn=' <a class="btn btn-xs btn-info" data-original-title="View Customer" data-toggle="tooltip" data-placement="top" href="'.ROOT.'customer_view/'.$row['cust_id'].'"><i class="fa fa-eye"></i></a>';
			
			if($edit_btn_per){ 
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'customeraddedit/'.$row['cust_id'].'"><i class="fa fa-pencil"></i></a>'; 
			}
			if($delete_btn_per){
				$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_cust('.$row['cust_id'].')"><i class="fa fa-trash-o"></i></button>'; 
			}
			
			$row_data[] = $printcheckbox.' '.$edit_btn.' '.$delete_btn;
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		$tr = $dbcon -> query("SELECT `c_con_id`,`c_con_fname`,`c_con_status` FROM `tbl_cust_contact` WHERE `c_con_fname` = '$POST[cust_fname]' and  c_con_status=0 and company_id=".$_SESSION['company_id'] );
		if($tr->num_rows > 0) {
			$row['res']='-1';
		}
		else {
			$info['cust_creator']		= $_SESSION['user_id'];
			$info['cust_id']		= $POST['cust_id'];
			$info['cust_title']		= $POST['cust_title'];
			$info['c_con_fname']		= $POST['c_con_fname'];
			$info['c_con_lname']		= $POST['c_con_lname'];
			$info['c_con_email']		= $POST['c_con_email'];
			$info['c_con_mobile']		= $POST['c_con_mobile'];
			$info['c_con_phone']		= $POST['c_con_phone'];
			$info['c_con_job']		= $POST['c_con_job'];
			$info['cust_email2']		= $POST['cust_email2'];
			$info['cust_mobile2']		= $POST['cust_mobile2'];
			$info['cust_dept']		= $POST['cust_dept'];
			$info['cust_web']		= $POST['cust_web'];
			$info['cust_comm']		= $POST['cust_comm'];
			$info['cust_skype']		= $POST['cust_skype'];
			$info['cust_linkedin']		= $POST['cust_linkedin'];
			$info['cust_ship_street']		= $POST['cust_ship_street'];
			$info['c_ship_country']		= $POST['c_ship_country'];
			$info['c_ship_state']		= $POST['c_ship_state'];
			$info['c_ship_city']		= $POST['c_ship_city'];
			$info['cust_ship_zip']		= $POST['cust_ship_zip'];
			$info['cust_ship_location']		= $POST['cust_ship_location'];
			$info['cust_street']		= $POST['cust_street'];
			$info['c_add_country']		= $POST['c_add_country'];
			$info['c_add_state']		= $POST['c_add_state'];
			$info['c_add_city']		= $POST['c_add_city'];
			$info['cust_zip']		= $POST['cust_zip'];
			$info['cust_location']		= $POST['cust_location'];
			$info['cust_dob']		= $POST['cust_dob'];
			$info['cust_fax']		= $POST['cust_fax'];
			$info['cust_hp']		= $POST['cust_hp'];
			$info['cust_op']		= $POST['cust_op'];
			
			
			$info['cdate']			= date("Y-m-d H:i:s");
			$info['user_id']		= $_SESSION['user_id'];
			$info['company_id']			= $_SESSION['company_id'];
			
			$inserid=add_record('tbl_cust_contact', $info, $dbcon);
			
			$row['res']='';
			
			if($inserid)
			{
				
				if(strtolower($POST['model'])=="model")
				{
					$query="select * from tbl_customer where cust_id=".$inserid;
					$rel=mysqli_fetch_assoc($dbcon->query($query));		
					$row = $rel;
					$row['res']="2"; 
				}
				else
				{
					$row['res'] ="1";
				}
			}
			else
			{
				$row['res'] ="0";
			}
			
		}
		echo json_encode($row);	
	}
	else if(strtolower($POST['mode']) == "edit") {
		$info['cust_name']		= $POST['cust_name'];
		$info['cust_creator']	= $_SESSION['user_id'];
		$info['cust_code']		= $POST['cust_code'];//Generate New Code
		$info['cust_code_series']= $POST['cust_code_series'];//Generate New Code
		$info['cust_cat']		= $POST['cust_cat'];
		$info['cust_desc']		= $POST['cust_desc'];
		$info['cust_ind']		= $POST['cust_ind'];
		$info['cust_type']		= $POST['cust_type'];
		$info['cust_source']	= $POST['cust_source'];
		$info['cust_gst']		= $POST['cust_gst'];
		$info['cust_mobile']	= $POST['cust_mobile'];
		$info['cust_email']		= $POST['cust_email'];
		$info['cust_assign_user']= implode(",",$POST['cust_assign_user']);
		
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		$updateid=update_record('tbl_customer', $info,"cust_id=".$POST['eid'] , $dbcon);
		$row['res']='';
		if($updateid)
		{
			$row['res']='update';
		}
		else
		{
			$row['res']='0';
		}
		echo json_encode($row);
		
	}
	else if(strtolower($POST['mode']) == "delete") {
		//check Entry Record in TRN tables
		$chk_arr[]=array("inquiry_id","tbl_inquiry","inquiry_status=0 and cust_id=".$POST['eid']);
		$chk_arr[]=array("task_id","tbl_task","task_status!=2 and cust_id=".$POST['eid']);
		$chk_resp=check_delete_trn($dbcon,$chk_arr);
		if($chk_resp){
			echo '-1';
		}
		else{
			$info['cust_status']		= 2;
			$updateid=update_record('tbl_customer', $info,"cust_id=".$POST['eid'] , $dbcon);				
			
			if($updateid)
				echo "1";	
			else
				echo "0";	
		}			
	}
	else if(strtolower($POST['mode']) == "print_cust_label") {
		
		if($POST['cust_id'][0]=='ON'){ unset($POST['cust_id'][0]);}//unset first element if select all
		$_COOKIE['label_cust']=$_SESSION['label']['cust']=implode(",",$POST['cust_id']);
		
		setcookie("label_cust", $_COOKIE['label_cust'], time() + (86400 * 30), "/"); // 86400 = 1 day
		$row['status']=0;
		if(!empty($_COOKIE['label_cust']))
		{
			$row['status']=1;
		}
		echo json_encode($row);	
	}
	else if(strtolower($POST['mode']) == "load_state") {
		$countryid=$POST['id'];				
		echo get_state($dbcon,'',$countryid);
	}
	else if(strtolower($POST['mode']) == "load_city") {
		$cityid=$POST['id'];				
		echo $str=getcity($dbcon,$cityid,'');
	}
	else if(strtolower($POST['mode']) == "check_data"){
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
				$error='';
				if(!empty($data['0']))
				{
					
					$info['company_name']=$data['0'];
					$info['cust_name']=$data['1'];
					$info['cust_address']=$data['2'];
					$qstate="SELECT `stateid`,`state_name` FROM `state_mst` WHERE state_status=0 and `state_name` ='".$data['3']."'";
					$tr_state = mysqli_fetch_array($dbcon -> query($qstate));
					if(!empty($tr_state))
					{
						$info['stateid']=$tr_state['stateid'];
					}				
					else
					{
						$error='State Name Not Found';
						array_push($error_array,1);
					}				
					$qcity="SELECT `cityid`,`city_name` FROM `city_mst` WHERE city_status=0 and `city_name` ='".$data['4']."'";
					$tr_city = mysqli_fetch_array($dbcon -> query($qcity));
					if(!empty($tr_city))
					{
						$info['cityid']=$tr_city['cityid'];
					}				
					else
					{
						$error='City Name Not Found';
						array_push($error_array,1);
					}				
					$info['opening_balance']=$data['5'];
					if($data['6']=="Cr")
					{
						$info['balance_typeid']=1;
					}
					else if($data['6']=="Dr")
					{
						$info['balance_typeid']=2;
					}
					else if(!empty($data['7']))
					{
						$error='Please Mention Cr/Dr';
						array_push($error_array,1);
					}
					$info['cust_mobile']=$data['7'];
					$info['cust_email']=strtolower($data['8']);
					$info['cust_pincode']=$data['9'];
					$info['gst_no']=$data['10'];
					$info['pan_no']=$data['11'];
					
					$qcity="SELECT `countryid`,`country_name` FROM `country_mst` WHERE country_status=0 and `country_name` ='".$data['12']."'";
					$tr_city = mysqli_fetch_array($dbcon -> query($qcity));
					if(!empty($tr_city)) {
						$info['countryid']=$tr_city['countryid'];
					}
					else {
						$error='Country Name Not Found';
						array_push($error_array,1);
					}
					$info['party_type']=$data['13'];
					$info['cdate']			= date("Y-m-d H:i:s");
					$info['user_id']		= $_SESSION['user_id'];
					$info['usertype_id']	= $_SESSION['user_type'];
					$info['company_id']		= $_SESSION['company_id'];
					
					$q="SELECT `cust_name`,`company_name` FROM `tbl_customer` WHERE cust_status=0 and `company_id` ='".$_SESSION['company_id']."' and `company_name` ='".$info['company_name']."' ";
					$tr = $dbcon -> query($q);
					$cnt=mysqli_num_rows($tr);
					if($cnt>0 ) {
						$error='Company Already Added';
						array_push($error_array,1);
					}
					else if(!empty($error))
					{
						$err='error';
						array_push($error_array,1);
					}
					else
					{
						add_record('tbl_customer', $info, $dbcon);
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
					add_record('cust_tempdata', $info1, $dbcon);
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
		$temp_custqry='select * from cust_tempdata where company_id='.$_SESSION['company_id'];
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
	
	//Address Details
	
	else if(strtolower($POST['mode']) == "add_cust_address") {
		
		$info['c_add_location']=$POST['c_add_location'];
		$info['c_add_street']=$POST['c_add_street'];
		$info['c_add_country']=$POST['c_add_country'];
		$info['c_add_state']=$POST['c_add_state'];
		$info['c_add_city']=$POST['c_add_city'];
		$info['c_add_zip']=$POST['c_add_zip'];
		$info['cust_id']=$POST['cust_id'];
	//	$info['edit_id']=$POST['edit_id'];
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		if($POST['edit_id']=='')
		{
			$inserid=add_record('tbl_cust_address',$info,$dbcon);
		}
		else
		{
			$inserid=update_record('tbl_cust_address',$info,"c_add_id=".$POST['edit_id'],$dbcon);
		}
		
		if($inserid)
		{
			echo "1";
		}
		else{
			echo "0";
		}
	}
	
	else if(strtolower($POST['mode']) == "show_cust_address") {
		
		$cust_id=$POST['cust_id'];
		
		$sel=$dbcon->query("select * from tbl_cust_address where cust_id='$cust_id' and user_id='$_SESSION[user_id]'");
		
		while($row=mysqli_fetch_assoc($sel))
		{
			echo '<tr>';
			echo '<td>'.$row['c_add_location'].'</td>';
			echo '<td>'.$row['c_add_street'].'</td>';
			echo '<td>'.$row['c_add_country'].'</td>';
			echo '<td>'.$row['c_add_state'].'</td>';
			echo '<td>'.$row['c_add_city'].'</td>';
			echo '<td>'.$row['c_add_zip'].'</td>';
			echo '<td>
				
				<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_serial('.$row['c_add_id'].',\'tbl_cust_address\',\'c_add_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
				
				<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_serial('.$row['c_add_id'].',\'tbl_cust_address\',\'c_add_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				
			</td>';
			echo '</tr>';
		}
		
	}
	
	else if(strtolower($POST['mode'])== "preedit_serial")
	{
		$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	
	else if(strtolower($POST['mode'])== "delete_data_serial")
	{
		$row=array();
		
		delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
		//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);

		$row['res']="1";
		
		echo json_encode($row);
	}
	
	//Contact Details
	
	else if(strtolower($POST['mode']) == "add_cust_contact") {
		
		$info['c_con_fname']=$POST['con_first'];
		$info['c_con_lname']=$POST['con_last'];
		$info['c_con_email']=$POST['com_email'];
		$info['c_con_mobile']=$POST['con_mobile'];
		$info['c_con_phone']=$POST['con_phone'];
		$info['c_con_job']=$POST['con_job'];
		$info['cust_id']=$POST['cust_id'];
	//	$info['edit_id']=$POST['edit_id'];
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		if($POST['edit_id']=='')
		{
			$inserid=add_record('tbl_cust_contact',$info,$dbcon);
		}
		else
		{
			$inserid=update_record('tbl_cust_contact',$info,"c_con_id=".$POST['edit_id'],$dbcon);
		}
		
		if($inserid)
		{
			echo "1";
		}
		else{
			echo "0";
		}
	}
	
	else if(strtolower($POST['mode']) == "show_cust_contact") {
		
		$cust_id=$POST['cust_id'];
		
		$sel=$dbcon->query("select * from tbl_cust_contact where cust_id='$cust_id' and user_id='$_SESSION[user_id]'");
		
		while($row=mysqli_fetch_assoc($sel))
		{
			echo '<tr>';
			echo '<td>'.$row['c_con_fname'].'</td>';
			echo '<td>'.$row['c_con_lname'].'</td>';
			echo '<td>'.$row['c_con_email'].'</td>';
			echo '<td>'.$row['c_con_mobile'].'</td>';
			echo '<td>'.$row['c_con_phone'].'</td>';
			echo '<td>'.$row['c_con_job'].'</td>';
			echo '<td>
				
				<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_contact('.$row['c_con_id'].',\'tbl_cust_contact\',\'c_con_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
				
				<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_contact('.$row['c_con_id'].',\'tbl_cust_contact\',\'c_con_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				
			</td>';
			echo '</tr>';
		}
		
	}
	
	else if(strtolower($POST['mode'])== "preedit_contact")
	{
		$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	
	else if(strtolower($POST['mode'])== "delete_data_contact")
	{
		$row=array();
		
		delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
		//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);

		$row['res']="1";
		
		echo json_encode($row);
	}
	
	//Customer Exist Details
	
	else if(strtolower($POST['mode']) == "add_cust_exist") {
		
		$info['c_ext_type']=$POST['ext_type'];
		$info['c_ext_product']=$POST['ext_product'];
		$info['c_ext_remark']=$POST['ext_remark'];
		
		$info['cust_id']=$POST['cust_id'];
	//	$info['edit_id']=$POST['edit_id'];
		$info['cdate']			= date("Y-m-d H:i:s");
		$info['user_id']		= $_SESSION['user_id'];
		$info['company_id']			= $_SESSION['company_id'];
		
		if($POST['edit_id']=='')
		{
			$inserid=add_record('tbl_cust_existing',$info,$dbcon);
		}
		else
		{
			$inserid=update_record('tbl_cust_existing',$info,"c_ext_id=".$POST['edit_id'],$dbcon);
		}
		
		if($inserid)
		{
			echo "1";
		}
		else{
			echo "0";
		}
	}
	
	else if(strtolower($POST['mode']) == "show_cust_exist") {
		
		$cust_id=$POST['cust_id'];
		
		$sel=$dbcon->query("select e.*,p.product_name from tbl_cust_existing as e left join tbl_product as p on p.product_id=e.c_ext_product where e.cust_id='$cust_id' and e.user_id='$_SESSION[user_id]'");
		
		while($row=mysqli_fetch_assoc($sel))
		{
			echo '<tr>';
			echo '<td>'.$row['c_ext_type'].'</td>';
			echo '<td>'.$row['product_name'].'</td>';
			echo '<td>'.$row['c_ext_remark'].'</td>';
			
			echo '<td>
				
				<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_exist('.$row['c_ext_id'].',\'tbl_cust_existing\',\'c_ext_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
				
				<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_exist('.$row['c_ext_id'].',\'tbl_cust_existing\',\'c_ext_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				
			</td>';
			echo '</tr>';
		}
		
	}
	
	else if(strtolower($POST['mode'])== "preedit_exist")
	{
		$q = $dbcon -> query("SELECT *  FROM ".$_POST['table']." WHERE ".$_POST['whereid']." = '$POST[id]'");
		$r = $q->fetch_assoc();
		
		echo json_encode($r);
	}
	
	else if(strtolower($POST['mode'])== "delete_data_exist")
	{
		$row=array();
		
		delete_record($_POST['table'],$_POST['whereid']."=".$POST['eid'],$dbcon);
		//$updateid=update_record($_POST['table'], $info,$_POST['whereid']."=".$POST['eid'] , $dbcon);

		$row['res']="1";
		
		echo json_encode($row);
	}
	
	else if(strtolower($POST['mode'])== "load_country")
	{
		$country=$POST['country'];
	
		echo get_country($dbcon,$country);
	}
	
	else if(strtolower($POST['mode'])== "load_product")
	{
		$pid=$POST['pid'];
	
		echo getproduct($dbcon,$pid);
	}



function check_data($filename,$dbcon)
{
	$error=array();
	$arr = explode(".", $filename);
	$fp = fopen(CUSTOMER_UPING.$filename, 'r');
	$frow = fgetcsv($fp);
	if(count($frow)==14) // Define coulmn count Here
	{
		$msg='';
		foreach($frow as $i)
		if ( !in_array($i, array('Company Name','Customer Name','Address','State','City','Opening Balance','Cr/Dr','Mobile no','Email','Pin Code','GSTIN','Pan No','Country','Party Type'), true ) ) 
		{
			$msg='error';
		}
		
		if(!empty($msg))
		{
			$error['res']="3";
		}
		else
		{
			delete_record('cust_tempdata', 'company_id='.$_SESSION['company_id'], $dbcon);
			$error['res']="1";
		}
	}
	else
	{
		$error['res']="0";
	}
	return $error;
}

function generate_party_code($dbcon,$party_type){
	$sel_qry="select max(cust_id) as max_cust_id from tbl_customer";
	$sel_rel=mysqli_fetch_assoc($dbcon->query($sel_qry));
	$id = intval($sel_rel['max_cust_id'])+1;
	if($party_type=='1'){
		$pref='C';
	}
	else if($party_type=='2'){
		$pref='V';
	}
	else if($party_type=='3'){
		$pref='JV';
	}
	else{
		$pref='B';
	}
	$party_code = $pref.str_pad($id,4,"0",STR_PAD_LEFT);
	return $party_code;
}

?>