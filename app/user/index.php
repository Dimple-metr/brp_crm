<?php
session_start();
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
include("../../include/coman_function.php");

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
		$aColumns = array('user.user_id','usertype_name', 'user_name','user_mail','city.city_name','user_phone','user.company_id','user.user_rid','user.user_type');
		$sIndexColumn = "user.user_id";
		$isWhere = array("user.active=0 and user.company_id=".$_SESSION['company_id']);
		$sTable = "users as user";			
		$isJOIN = array( 'left join city_mst city on user.user_city=city.cityid', 'left join tbl_usertype type on user.user_type=type.usertype_id');
		$hOrder = "user.user_id desc";
		include('../../include/pagging.php');
		$appData = array();
		$id=1;
		foreach($sqlReturn as $row) {
			$row_data = array();
			$row_data[] = $row['sr'];
			$row_data[] = $row['usertype_name'];
			$row_data[] = $row['user_name'];
			$row_data[] = $row['user_mail'];
			$row_data[] = $row['city_name'];
			//$row_data[] = $row['state_name'];
			$row_data[] = $row['user_phone'];
			
			if($_SESSION['user_type']=='2'){
				if($row['user_type']=='2'){
					$del_btn='';
				}
				else{
					$del_btn='<button class="btn btn-xs btn-danger" data-original-title="Delete" data-toggle="tooltip" data-placement="top" onClick="delete_user('.$row['user_id'].')"><i class="fa fa-trash-o"></i></button>';
				}
				
				$row_data[] = '<a class="btn btn-xs btn-warning" data-original-title="Edit" data-toggle="tooltip" data-placement="top" href="'.ROOT.'useredit/'.$row['user_id'].'"><i class="fa fa-pencil"></i></a> '.$del_btn;
			}
			else{
				$row_data[]='';
			}
			$appData[] = $row_data;
			$id++;
		}
		$output['aaData'] = $appData;
		echo json_encode( $output );
	}
	else if(strtolower($POST['mode']) == "add") {
		$tr = $dbcon -> query("SELECT `user_id`,`user_email` FROM `tbl_user` WHERE active=0 and `user_email` = '$POST[user_email]' ");
		if($tr->num_rows > 0) {
			$row['res']='-1';
		}
		else {
			$info['user_name']		= $POST['user_name'];
			$info['user_mail']		= strtolower($POST['user_email']);
			$info['user_key']		= md5($_POST['password']);
			$info['user_type']		= $POST['usertype_id'];
			$info['branch_id']		= $POST['branch_id'];
			$info['user_stat']		= $POST['stateid'];
			$info['user_city']		= $POST['cityid'];
			$info['user_phone']		= $POST['user_mobile'];
			$info['user_country']	= '100';
			$info['user_address']	= $POST['user_address'];
			$info['user_fname']		= $POST['user_fname'];
			$info['user_lname']		= $POST['user_lname'];
			$info['roletype_id']	= $POST['roletype_id'];
			$info['user_report']	= implode(",",$POST['user_report']);
			$info['usertype_form_date']	= date('Y-m-d',strtotime($POST['usertype_form_date']));
			$info['usertype_expiry_date']	= date('Y-m-d',strtotime($POST['usertype_expiry_date']));
			$info['usertype_timezone']	= $POST['usertype_timezone'];
			$info['usertype_currency']	= $POST['usertype_currency'];
			$info['is_admin']	= $POST['is_admin'];
			$info['usertype_terr']	= implode(",",$POST['usertype_terr']);
			if(!empty($_FILES['h_sign']['tmp_name'])) {
				
				$info['h_sign']	= upload_image($_FILES);
			}
			$info['user_rid']		= $_SESSION['user_id'];
			$info['company_id']		= $_SESSION['company_id'];
			$info['payment_status'] = 1;
			$infousr['user_company'] 	= $_SESSION['user_company'];
			$inserid=add_record('users', $info, $dbcon);
			$row['res']='';
			if($inserid)
			{
				if($POST['model']=="model"){
					$query="select * from tbl_customer where cust_id=".$inserid;
					$rel=mysqli_fetch_assoc($dbcon->query($query));		
					$row = $rel;
					$row['res']="2"; 
				}
				else{
					$row['res'] ="1";
				}
			}
			else{
				$row['res'] ="0";
			}	
		}
		echo json_encode($row);
	}		
	else if(strtolower($POST['mode']) == "edit") {
		
		$info['user_name']		= $POST['user_name'];
			$info['user_mail']		= strtolower($POST['user_email']);
			if($_POST['password']){
				$info['user_key']		= md5($_POST['password']);
			}
			
			$info['user_type']		= $POST['usertype_id'];
			//$info['branch_id']		= $POST['branch_id'];
			$info['user_stat']		= $POST['stateid'];
			$info['user_city']		= $POST['cityid'];
			$info['user_phone']		= $POST['user_mobile'];
			$info['user_country']	= '100';
			$info['user_address']	= $POST['user_address'];
			$info['user_fname']		= $POST['user_fname'];
			$info['user_lname']		= $POST['user_lname'];
			//$info['roletype_id']	= $POST['roletype_id'];
			$info['user_report']	= implode(",",$POST['user_report']);
			$info['usertype_form_date']	= date('Y-m-d',strtotime($POST['usertype_form_date']));
			$info['usertype_expiry_date']	= date('Y-m-d',strtotime($POST['usertype_expiry_date']));
			$info['usertype_timezone']	= $POST['usertype_timezone'];
			$info['usertype_currency']	= $POST['usertype_currency'];
			if($POST['is_admin']){
			$info['is_admin']	= $POST['is_admin'];
			}
			$info['usertype_terr']	= implode(",",$POST['usertype_terr']);
			 $info['user_tmst']		=date('Y-m-d H:i:s');
			$info['user_rid']		= $_SESSION['user_id'];
			$info['company_id']		= $_SESSION['company_id'];
		
			if(!empty($_FILES['h_sign']['tmp_name'])) {
				$q1="select h_sign from users where user_id=".$POST['eid'];
				$row1=mysqli_fetch_assoc($dbcon->query($q1));
				$file1=$row1['h_sign'];
				unlink(USER_SIGN.$file1);
				//unlink(LOGO_A."thumb//".$file);
				$info['h_sign']	= upload_image($_FILES);
			}
			$updateid=update_record('users', $info,"user_id=".$POST['eid'] , $dbcon);
			$row['res']=''; 
			if($updateid){
				$row['res']='update';
			}
			else{
				$row['res']='0';
			}
			echo json_encode($row);
		}
	else if(strtolower($POST['mode']) == "delete") {
		$info['active']		= 2;
		$updateid=update_record('users', $info,"user_id=".$POST['eid'] , $dbcon);	
		
		if($updateid)
		echo "1";	
		else
		echo "0";			
	}
	else if(strtolower($POST['mode']) == "load_state") {
		echo getstate($dbcon,0);	
	}
	else if(strtolower($POST['mode']) == "load_city") {
		$cityid=$POST['id'];				
		echo $str=getcity($dbcon,$cityid,0);
	}
	
function upload_image($FILES)
{
	$rand=rand(0,9999);
	if(!empty($FILES['h_sign']['tmp_name'])) {
					list($width, $height, $type, $attr) = getimagesize($FILES['h_sign']['tmp_name']);
					if (isset($type) && in_array($type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
						$allowedExts = array("gif", "jpeg", "jpg", "png");
						$temp = explode(".", $FILES["h_sign"]["name"]);
						$extension = strtolower(end($temp));
						if (in_array($extension, $allowedExts)) {
							$File = "header".$rand.".jpg";
							$tmp_name = $FILES["h_sign"]["tmp_name"];
							move_uploaded_file($tmp_name,USER_SIGN.$File);
							//smart_resize_image(LOGO_A.$File,792,201);
							
						}
				}
		return  $File;				
	}
	
}
	
?>