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
		if($POST['party_type']){
			$where.=' and cust.party_type='.$POST['party_type'];
		}
		
		$appData = array();
		$i=1;
		$aColumns = array('cust_id', 'party_type', 'cust_name','cust_email' ,'cust_mobile', 'cust_gst', 'cust_status','cust.cdate','cust.user_id');
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
			
			if($row['party_type']=='1'){
				$row_data[] = "Customer";
			}
			else if($row['party_type']=='2'){
				$row_data[] = "Vendor";
			}
			else{
				$row_data[] = "Both";
			}
			
			
			$row_data[] = $row['cust_name'];
			$row_data[] = $row['cust_email'];
			$row_data[] = $row['cust_mobile'];
			$row_data[] = $row['cust_gst'];
			
			
			$edit_btn=''; $delete_btn=''; 
			
			$view_cust_btn=' <a target="_blank" class="btn btn-xs btn-info" data-original-title="View Customer" data-toggle="tooltip" data-placement="top" href="'.ROOT.'customer_view/'.$row['cust_id'].'"><i class="fa fa-eye"></i></a>';
			
			if($edit_btn_per){ 
				$edit_btn=' <a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'customeraddedit/'.$row['cust_id'].'"><i class="fa fa-pencil"></i></a>'; 
			}
			if($delete_btn_per){
				$delete_btn=' <button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_cust('.$row['cust_id'].')"><i class="fa fa-trash-o"></i></button>'; 
			}
			
			$row_data[] = $printcheckbox.' '.$edit_btn.' '.$delete_btn.' '.$view_cust_btn;
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		//echo json_encode( $output );
		echo json_encode( utf8ize($output) );
	}
	else if(strtolower($POST['mode']) == "add" || strtolower($POST['cust_mode']) == "add") {
		$tr = $dbcon -> query("SELECT `cust_id`,`cust_name`,`cust_status` FROM `tbl_customer` WHERE `cust_name` = '$POST[company_name]' and  cust_status=0 and company_id=".$_SESSION['company_id'] );
		if($tr->num_rows > 0) {
			$row['res']='-1';
		}
		else {
			$info['party_type']		= $POST['party_type'];
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
			
			$inserid=add_record('tbl_customer', $info, $dbcon);
			
			$row['res']='';
			
			if($inserid)
			{
				
				$dbcon->query("update tbl_cust_address set cust_id='$inserid' where cust_id='0' and user_id='$_SESSION[user_id]'");
				
				$dbcon->query("update tbl_cust_contact set cust_id='$inserid' where cust_id='0' and user_id='$_SESSION[user_id]'");
				
				$dbcon->query("update tbl_cust_existing set cust_id='$inserid' where cust_id='0' and user_id='$_SESSION[user_id]'");
				
				if(strtolower($POST['cust_model'])=="model")
				{
					$query="select * from tbl_customer where cust_id=".$inserid;
					$rel=mysqli_fetch_assoc($dbcon->query($query));		
					$row = $rel;
					$row['res']="2"; 
					
					// Add Address Data if Entry from Modal
					if($POST['c_add_location']){
						$infoadd['c_add_location']	= $POST['c_add_location'];
						$infoadd['c_add_street']	= $POST['c_add_street'];
						$infoadd['c_add_country']	= $POST['c_add_country'];
						$infoadd['c_add_state']		= $POST['c_add_state'];
						$infoadd['c_add_city']		= $POST['c_add_city'];
						$infoadd['c_add_zip']		= $POST['c_add_zip'];
						$infoadd['cust_id']			= $inserid;
						$infoadd['cdate']			= date("Y-m-d H:i:s");
						$infoadd['user_id']			= $_SESSION['user_id'];
						$infoadd['company_id']		= $_SESSION['company_id'];
						$inseraddid=add_record('tbl_cust_address',$infoadd,$dbcon);
					}
					
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
		$info['party_type']		= $POST['party_type'];
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
		
		$sel=$dbcon->query("select per.*,country_name,state_name,city_name from tbl_cust_address as per
		left join country_mst as country on country.countryid=per.c_add_country
		left join state_mst as state on state.stateid=per.c_add_state
		left join city_mst as city on city.cityid=per.c_add_city
		where per.cust_id='$cust_id'");
		
		while($row=mysqli_fetch_assoc($sel))
		{
			echo '<tr>';
			echo '<td>'.$row['c_add_location'].'</td>';
			echo '<td>'.$row['c_add_street'].'</td>';
			echo '<td>'.$row['country_name'].'</td>';
			echo '<td>'.$row['state_name'].'</td>';
			echo '<td>'.$row['city_name'].'</td>';
			echo '<td>'.$row['c_add_zip'].'</td>';
			echo '<td>
				
				<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_serial('.$row['c_add_id'].',\'tbl_cust_address\',\'c_add_id\');" id="fieldedit'.$i.'"><i class="fa fa-pencil"></i></button>
				
				<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_serial('.$row['c_add_id'].',\'tbl_cust_address\',\'c_add_id\');" id="fieldremove'.$i.'"><i class="fa fa-times"></i></button>
				
			</td>';
			echo '</tr>';
		}
		
	}
	else if(strtolower($POST['mode']) == "view_cust_address") {
		$cust_id=$POST['cust_id'];$str='';
		
		$sel=$dbcon->query("select per.*,country_name,state_name,city_name from tbl_cust_address as per
		left join country_mst as country on country.countryid=per.c_add_country
		left join state_mst as state on state.stateid=per.c_add_state
		left join city_mst as city on city.cityid=per.c_add_city
		where per.cust_id='$cust_id'");
		$str.='<table class="display table table-bordered table-striped">
			<thead>
				<tr>
					<th>Sr No.</th>
					<th>Location</th>
					<th>Street</th>
					<th>Country</th>
					<th>State</th>
					<th>City</th>
					<th>Zip / Postal Code</th>
					<th>Action</th>
				</tr>
			</thead>
		';
		if(mysqli_num_rows($sel)){
			$k=1;
			while($row=mysqli_fetch_assoc($sel))
			{
				$str.= '<tr>';
				$str.= '<td>'.$k.'</td>';
				$str.= '<td>'.$row['c_add_location'].'</td>';
				$str.= '<td>'.$row['c_add_street'].'</td>';
				$str.= '<td>'.$row['country_name'].'</td>';
				$str.= '<td>'.$row['state_name'].'</td>';
				$str.= '<td>'.$row['city_name'].'</td>';
				$str.= '<td>'.$row['c_add_zip'].'</td>';
				
				$prep_add=$row['c_add_location'].'\n'.$row['c_add_street'].'\n'.$row['city_name'].', '.$row['state_name'].', '.$row['country_name'].' - '.$row['c_add_zip'];
				$str.= '<td><button type="button" class="btn btn-primary" onclick="copy_address(\''.$prep_add.'\')">COPY</button></td>';
				$str.= '</tr>';
				$k++;
			}
		}
		else{
			$str.='<tr><td colspan="8">NO DATA FOUND!!!</td></tr>';
		}
		$str.='</table>';
		$resp['resp_html']=$str;
		echo json_encode($resp);
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
		if(strtolower($POST['cust_person_model'])=='model'){
			$info['cust_id']=$POST['cust_ref_id'];
		}
		else{
			$info['cust_id']=$POST['cust_id'];
		}
		
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
			if(strtolower($POST['cust_person_model'])=='model'){
				echo $inserid;
			}
			else{
				echo "1";
			}
		}
		else{
			echo "0";
		}
	}
	
	else if(strtolower($POST['mode']) == "show_cust_contact") {
		
		$cust_id=$POST['cust_id'];
		
		$sel=$dbcon->query("select * from tbl_cust_contact where cust_id='$cust_id' ");
		
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
		
		$sel=$dbcon->query("select e.*,p.product_name from tbl_cust_existing as e left join tbl_product as p on p.product_id=e.c_ext_product where e.cust_id='$cust_id' ");
		
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
	else if(strtolower($POST['mode'])== "load_cust_person"){
		$resp['html_resp'] = get_cust_contactperson($dbcon,"",$POST['cust_id']);
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "preview_cust_person"){
		$str='';
		$str.='<table class="display table table-bordered table-striped">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Phone</th>
					<th>Job Title</th>
				</tr>';
				
		$per_qry="select * from tbl_cust_contact where c_con_status=0 and cust_id=".$POST['cust_id'];	
		$per_qry_rs=$dbcon->query($per_qry);
		if(mysqli_num_rows($per_qry_rs)){
			while($per_rel=mysqli_fetch_assoc($per_qry_rs)){
                            $str.='<tr>
                                <td>'.$per_rel['c_con_fname'].'</td>
                                <td>'.$per_rel['c_con_lname'].'</td>
                                <td>'.strtolower($per_rel['c_con_email']).'</td>
                                <td>'.$per_rel['c_con_mobile'].'</td>
                                <td>'.$per_rel['c_con_phone'].'</td>
                                <td>'.$per_rel['c_con_job'].'</td>
                            </tr>';
			}
		}
		else{
			$str.='<tr>
					<td colspan="6" class="text-center">Contact Person Not Found !!!</td>
				</tr>';
		}
		
		$str.='</table>';
		
		$resp['html_resp'] = $str;
		echo json_encode($resp);
	}
        else if(strtolower($POST['mode'])== "preview_company"){
		$str='';
		$str.='<table class="display table table-bordered table-striped">
                            <tr>
                                    <th>Company Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                            </tr>';
				
		$per_qry="select * from tbl_customer where cust_status=0 and cust_id=".$POST['cust_id'];	
		$per_qry_rs=$dbcon->query($per_qry);
		if(mysqli_num_rows($per_qry_rs)){
                    while($per_rel=mysqli_fetch_assoc($per_qry_rs)){
                        $str.='<tr>
                            <td>'.$per_rel['cust_name'].'</td>
                            <td>'.strtolower($per_rel['cust_email']).'</td>
                            <td>'.$per_rel['cust_mobile'].'</td>
                        </tr>';
                    }
		}
		else{
                    $str.='<tr>
                                <td colspan="6" class="text-center">Company Not Found !!!</td>
                            </tr>';
		}
		$str.='</table>';
		
		$resp['html_resp'] = $str;
		echo json_encode($resp);
	}
	else if(strtolower($POST['mode'])== "check_csv_data") {
		$row[] ='';
		if(!empty($_FILES['import_file']['tmp_name']))
		{
			$rand=rand(0,99999);
			$file_name = "cust_check_import".$rand.".csv";
			$ftmp = $_FILES["import_file"]["tmp_name"];
			move_uploaded_file($ftmp,CUSTOMER_UPING.$file_name);
			$row = check_data($file_name,$dbcon);
			unlink(CUSTOMER_UPING.$file_name);
			
		}
		else
			$row['res'] ='0';
		
		echo json_encode($row);
	}
	else if(strtolower($POST['mode'])== "import_csv_data") {
	
	if(!empty($_FILES['import_file']['tmp_name']))
	{
		$rand=rand(0,99999);
		$file_name = "cust_import".$rand.".csv";
		$err = $_FILES["import_file"]["tmp_name"];
		move_uploaded_file($err,CUSTOMER_UPING.$file_name);
		$handle = fopen(CUSTOMER_UPING.$file_name, "r");
		$i=1;$error_array=array();
		while (($data = fgetcsv($handle,",")) !== FALSE) //get all data one by one
		{
			$error=''; 
			if($data['0']){
				$tr = $dbcon -> query("SELECT cust_id FROM tbl_customer WHERE cust_name = '".trim($data['0'])."' and  cust_status=0 and company_id=".$_SESSION['company_id']);
				$num_rws=mysqli_num_rows($tr);
			}
			
			if($data['0'] && $num_rws=='0'){
				
				$info['party_type']			= $POST['party_type'];
				$info['cust_name']			= trim($data['0']);
				$info['cust_code']			= get_customer_code($dbcon);//Generate New Code
				$info['cust_code_series']	= get_customer_code_series($dbcon);
				
				//Party Category
				if($data['3']){
					$get_cat_qry="select cc_id from tbl_customer_category where cc_status=0 and cc_name='".trim($data['3'])."'";
					$get_cat_rel=mysqli_fetch_assoc($dbcon->query($get_cat_qry));
					$info['cust_cat']		= $get_cat_rel['cc_id'];
				}
				
				//Party Industry
				if($data['4']){
					$get_ind_qry="select ci_id from tbl_customer_industry where ci_status=0 and ci_name='".trim($data['4'])."'";
					$get_ind_rel=mysqli_fetch_assoc($dbcon->query($get_ind_qry));
					$info['cust_ind']		= $get_ind_rel['ci_id'];
				}
				
				//Party Source
				if($data['5']){
					$get_src_qry="select rb_id from tbl_refer_by where rb_status=0 and rb_name='".trim($data['5'])."'";
					$get_src_rel=mysqli_fetch_assoc($dbcon->query($get_src_qry));
					$info['cust_source']		= $get_src_rel['rb_id'];
				}
				
				$info['cust_gst']			= trim($data['6']);
				$info['cust_mobile']		= trim($data['7']);
				$info['cust_email']			= strtolower(trim($data['8']));
				$info['cust_desc']			= (trim($data['15']));
				
				$info['cust_creator']		= $_SESSION['user_id'];
				$info['cdate']				= date("Y-m-d H:i:s");
				$info['user_id']			= $_SESSION['user_id'];
				$info['company_id']			= $_SESSION['company_id'];
				$inserid=add_record('tbl_customer', $info, $dbcon);
				
				//Add Contact Person
				if($data['1']){
					$infoper['c_con_fname']	= trim($data['1']);
					$infoper['c_con_lname']	= trim($data['2']);
					$infoper['cust_id']		= $inserid;
					$infoper['cdate']		= date("Y-m-d H:i:s");
					$infoper['user_id']		= $_SESSION['user_id'];
					$infoper['company_id']	= $_SESSION['company_id'];
					$inserperid=add_record('tbl_cust_contact',$infoper,$dbcon);
				}
				
				//Add Cust Address
				if($data['9']){
					$infoadd['c_add_location']	= trim($data['9']);
					$infoadd['c_add_street']	= trim($data['10']);
					
					//Get Country
					if($data['11']){
						$get_con_qry="select countryid from country_mst where country_status=0 and country_name='".trim($data['11'])."'";
						$get_con_rel=mysqli_fetch_assoc($dbcon->query($get_con_qry));
						$infoadd['c_add_country']		= $get_con_rel['countryid'];
					}
					//Get State
					if($data['12']){
						$get_sts_qry="select stateid from state_mst where state_status=0 and state_name='".trim($data['12'])."'";
						$get_sts_rel=mysqli_fetch_assoc($dbcon->query($get_sts_qry));
						$infoadd['c_add_state']		= $get_sts_rel['stateid'];
					}
					//Get City
					if($data['13']){
						$get_city_qry="select cityid from city_mst where city_status=0 and city_name='".trim($data['13'])."'";
						$get_city_rel=mysqli_fetch_assoc($dbcon->query($get_city_qry));
						$infoadd['c_add_city']		= $get_city_rel['cityid'];
					}
					
					$infoadd['c_add_zip']		= trim($data['14']);
					$infoadd['cust_id']		= $inserid;
					$infoadd['cdate']			= date("Y-m-d H:i:s");
					$infoadd['user_id']		= $_SESSION['user_id'];
					$infoadd['company_id']		= $_SESSION['company_id'];
					$inserid=add_record('tbl_cust_address',$infoadd,$dbcon);
				}
				
				
				$i++;
			}
		}
			
		$result['res']='1';
		fclose($handle);//close file reading
		unlink(CUSTOMER_UPING.$file_name);
	}
	else
	{ $result['res']='0'; }
	
		echo  json_encode($result);
		
	}



function check_data($filename,$dbcon)
{
	$error=array();
	$arr = explode(".", $filename);
	$fp = fopen(CUSTOMER_UPING.$filename, 'r');
	$frow = fgetcsv($fp);
	$frow =array_map('trim', $frow);
	if(count($frow)==16) // Define column count Here
	{
		$msg='';
		if ($frow[0] !== 'Company Name' || $frow[1] !== 'First Name' || $frow[2] !== 'Last Name' || $frow[3] !== 'Party Category' || $frow[4] !== 'Party Industry' || $frow[5] !== 'Source' || $frow[6] !== 'Gst No' || $frow[7] !== 'Mobile'  || $frow[8] !== 'E-mail' || $frow[9] !== 'Location' || $frow[10] !== 'Street' || $frow[11] !== 'Country' || $frow[12] !== 'State' || $frow[13] !== 'City' || $frow[14] !== 'Postal Code' || $frow[15] !== 'Notes' ) {
			$error['res']="2";
		}
		else {
			$error['res']="1";
		}
	}
	else
	{
		$error['res']="2";
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

function utf8ize( $mixed ) {
    if (is_array($mixed)) {
        foreach ($mixed as $key => $value) {
            $mixed[$key] = utf8ize($value);
        }
    } elseif (is_string($mixed)) {
        return mb_convert_encoding($mixed, "UTF-8", "UTF-8");
    }
    return $mixed;
}
?>