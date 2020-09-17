<?php

session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
include("../../config/session.php");
include("../../include/function_database_query.php");
//if(@isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') 
{ 
    //if(@isset($_SERVER['HTTP_REFERER']) && strpos($_SERVER['HTTP_REFERER'],DOMAIN) !== false) 
	{
		//print_r($_POST);
		
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		if(strtolower($POST['mode']) == "edit") {
			//if($_POST['token'] == $_SESSION['token']) 
			{			
						$infousr['user_name'] =	$info['company_name']= $_POST['company_name'];
						$infousr['user_address'] = $info['comp_add1']	= $_POST['comp_add1'];	
						$info['company_alias']	= $POST['company_alias'];
						$info['comp_add2']	= $POST['comp_add2'];
						$info['comp_add3']	= $POST['comp_add3'];
						$info['countryid']	= $POST['countryid'];
						$info['stateid']	= $POST['stateid'];
						$info['cityid']	= $POST['cityid'];
						$info['comp_pincode']	= $POST['comp_pincode'];
						$info['comp_mobile']	= $POST['comp_mobile'];
						$info['comp_email']	= $_POST['comp_email'];
						$info['comp_web']	= $_POST['comp_web'];
						$info['comp_toll']	= $_POST['comp_toll'];
						$info['comp_gst']	= $_POST['comp_gst'];
						$info['comp_cin']	= $_POST['comp_cin'];
						$info['comp_pan']	= $_POST['comp_pan'];
						$info['comp_ryear']	= $_POST['comp_ryear'];
						$info['comp_per_currency']	= $_POST['comp_per_currency'];
			
						$info['serno']		= $POST['serno'];
						$info['ser_date']	= date('Y-m-d',strtotime($POST['ser_date']));
						$info['quot_condition']		= $_POST['quot_condition'];
						if(!empty($_FILES['h_logo']['tmp_name'])) {
							$q="select * from tbl_company where company_id=".$POST['eid'];
							$row=mysqli_fetch_assoc($dbcon->query($q));
							$file=$row['h_logo'];
							unlink(LOGO_A.$file);
							//unlink(LOGO_A."thumb//".$file);
							$info['h_logo']	= upload_image($_FILES);
						}
							if(!empty($_FILES['f_logo']['tmp_name'])) {
								$q1="select * from tbl_company where company_id=".$POST['eid'];
								$row1=mysqli_fetch_assoc($dbcon->query($q1));
								$file1=$row1['f_logo'];
								unlink(LOGO_A.$file1);
								//unlink(LOGO_A."thumb//".$file);
								$info['f_logo']	= upload_image1($_FILES);
							}
							$info['conditions']			= stripslashes($_POST['condition']);
							$info['challan_condition']	= stripslashes($_POST['challan_condition']);
							$info['po_condition']		= $_POST['po_condition'];
							$info['logo_content']		= $_POST['logo_content'];
							$info['dispatch_head_content']		= $_POST['dispatch_head_content'];
							$info['dispatch_footer_content']	= $_POST['dispatch_footer_content'];
							$info['inq_email_content']	= $_POST['inq_email_content'];
							$info['quot_email_content']	= $_POST['quot_email_content'];
							$info['po_email_content']	= $_POST['po_email_content'];
							
							$info['cdate']		= date("Y-m-d H:i:s");
							$info['user_id']	= $_SESSION['user_id'];		
							//var_dump($info);
							//exit();	
				$updateid=update_record('tbl_company', $info,"company_id=".$POST['eid'] , $dbcon);
			//	$infousr['user_rid']  = $inserid;
			
				$infousr['user_company'] 	= $POST['company_name']; 
					
				$updateuserid=update_record('users', $infousr,"user_type=2 and user_rid=".$POST['eid'] , $dbcon);
					
				
				if($updateid)
					echo "update";
				else
					echo "0".$dbcon->error;
				
			}
		}
		else if(strtolower($POST['mode']) == "add_currency")
		{
			$id=$POST['id'];
			$currency_id=$POST['comp_org_currency'];
			
			$info['curren_id'] = $currency_id;
			$info['comp_id'] = $id;
			
			$insertid=add_record('tbl_org_currency', $info, $dbcon);
			
			if($insertid)
			{
				echo "1";
			}
		}
		else if(strtolower($POST['mode']) == "show_currency")
		{
			$id=$POST['id'];
			
			$q="select o.*,c.currency_name  from tbl_org_currency as o left join tbl_currency as c on c.currency_id=o.curren_id where comp_id=$id";
			$row=$dbcon->query($q);
			$str="";
			$str.="<table class='table table-bordered'>
					<tr>
						<th>#</th>
						<th>Currency Name</th>
						<th></th>
					</tr>
			";
			$cnt=1;
			while($rel=mysqli_fetch_array($row))
			{
				$str.="<tr>
					
					<td>".$cnt."</td>
					<td>".$rel['currency_name']."</td>
					<td><a class='btn btn-xs btn-danger' data-original-title='Delete' data-toggle='tooltip' data-placement='top' onclick='delete_currency(".$rel['c_id'].")'><i class='fa fa-trash'></i></a></td>
				
				</tr>";
				$cnt++;
			}
			
			echo $str;
		}
		else if(strtolower($POST['mode'])== "delete_data")
		{
			$id=$POST['eid'];
			$comp_id=$POST['comp_id'];
			
			$deleteid=$dbcon->query("delete from tbl_org_currency where c_id=$id and comp_id=$comp_id");
			
			if($deleteid)
				echo "1";
			else
				echo "0";
			
		}
		else if(strtolower($POST['mode']) == "add_product_image_temp") {
			
		 $test = explode('.', $_FILES["file"]["name"]);
		 $ext = end($test);
		 $name = rand(100, 999) . '.' . $ext;
		 $path='../../view/upload/certi_images/';
		 $location = $path . $name;  
		 move_uploaded_file($_FILES["file"]["tmp_name"], $location);
		 
		 $info1['im_name']=$POST['certi_name'];
		 $info1['im_path']=$name;
		 $info1['cdate']=date("Y-m-d");
		 $info1['user_id']			= $_SESSION['user_id'];
		 $info1['company_id']			= $POST['pid'];
		
		 $table='tbl_company_certi';$tableid='img_id';
		
		 $inserid=add_record($table, $info1, $dbcon);
		
		// echo get_images_product($dbcon,'0');
		 
		
		}
		else if(strtolower($POST['mode']) == "load_certi_images") {
			
				$company_id=$POST['company_id'];
				$q="select * from tbl_company_certi where company_id='".$company_id."' order by img_id Desc";
				
				$rel=$dbcon->query($q);
				$path='view/upload/certi_images/';
				$str="";
				$str.="<table class='table table-bordered'>
				<tr>
					<th>#</th>
					<th>Certi.Name</th>
					<th>Certi.Image</th>
					<th>Action</th>
				</tr>";
				$cnt=1;
				while($row  = mysqli_fetch_assoc($rel))
				{
					$str.='<tr>
						<td>'.$cnt.'</td>
						<td>'.$row['im_name'].'</td>
						<td>
							<img src="'.ROOT.$path.$row['im_path'].'" height="100" width="100" class="img-thumbnail" />
						</td>
						<td><a onclick="delete_data_image('.$row['img_id'].');" href="#"><i class="fa fa-trash" style="color:red"></i></a></td>
						';
					
					$cnt++;
				}
				$str.="</tr></table>";
				echo $str;
		}
		else if(strtolower($POST['mode'])== "delete_data_image")
		{
			
			$deleteid=delete_record('tbl_company_certi', "img_id=$POST[eid]", $dbcon);

			if($deleteid)
				$row['res']="1";
			else
				$row['res']="0";
			echo json_encode($row);
		}
		else if(strtolower($POST['mode']) == "add_bank_name") {
			
			
			$info1['c_b_acno']= $POST['c_b_acno'];
			$info1['c_b_name']= $POST['c_b_name'];
			$info1['c_b_branch']= $POST['c_b_branch'];
			$info1['c_b_ifsc']= $POST['c_b_ifsc'];
			$info1['b_comp_id']= $POST['cust_id'];
			$info1['userid']		= $_SESSION['user_id'];
			
			$info1['cdate'] = date("Y-m-d");
			
			$table='tbl_company_bank';$tableid='b_id';
		
			if(empty($POST['edit_id']))
			{
				$inserid=add_record($table, $info1, $dbcon);
			}
			else
			{
				$updateid=update_record($table, $info1,$tableid."=".$POST['edit_id'] , $dbcon);	
			}
			
			echo "1";
		}
		else if(strtolower($POST['mode']) == "load_bank_detail") {
			
			
			$query="select * from tbl_company_bank  where b_comp_id='$POST[comp_id]' order by b_id Desc";
		
			$result=$dbcon->query($query);
			echo '<div class="clearfix"></div>
					
					<div class="col-md-12 col-xs-11">
					  <div class="form-group">
						<table cellspacing="10" style="border-spacing:10px;" class="display table table-bordered table-striped">
						<tr id="field">
							<th width="5%">Bank Nmae</th>
							<th>Branch Name</th>
							<th>IFSC</th>
							<td>Ac No</td>
							<td></td>
						</tr>';
			if(mysqli_num_rows($result)>0)
			{
				$i=1;
				while($rel=mysqli_fetch_assoc($result))
				{
					echo '<tr id="fieldtr'.$id.'" >
						<td style="vertical-align:top;">
							'.$rel['c_b_name'].'
						</td>
						<td style="vertical-align:top;" class="text-center hide_act_add">
							'.$rel['c_b_branch'].'
						</td>
						<td style="vertical-align:top;" class="text-right">
							'.$rel['c_b_ifsc'].'
						</td>
						<td style="vertical-align:top;" class="text-right">
							'.$rel['c_b_acno'].'
						</td>
						
						<td style="vertical-align:top" class="text-center">
							<button type="button" class="btn btn-round btn-warning btn-xs" onclick="edit_data_bank('.$rel['b_id'].');" id="fieldtrnedit'.$i.'"><i class="fa fa-pencil"></i></button>
							<button type="button" class="btn btn-round btn-danger btn-xs" onclick="delete_data_bank('.$rel['b_id'].');" id="fieldtrnremove'.$i.'"><i class="fa fa-times"></i></button>
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
			</div>';
		}
		else if(strtolower($POST['mode'])== "preedit_bank")
		{
			$q = $dbcon -> query("SELECT * FROM tbl_company_bank WHERE b_id='$POST[id]'");
			$r = $q->fetch_assoc();
			
			//$r['producthtml'] = getrequiredproduct($dbcon,$r['raw_product_id'],' and product_type='.$r["product_type"].'');
			echo json_encode($r);
			//echo $POST['mode'];
		}
		else if(strtolower($POST['mode'])== "delete_data_bank")
		{
			
			$deleteid=delete_record('tbl_company_bank', "b_id=$POST[eid]", $dbcon);

			if($deleteid)
				$row['res']="1";
			else
				$row['res']="0";
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
function upload_image($FILES)
{
	$rand=rand(0,9999);
	if(!empty($FILES['h_logo']['tmp_name'])) {
			list($width, $height, $type, $attr) = getimagesize($FILES['h_logo']['tmp_name']);
			if (isset($type) && in_array($type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
				$allowedExts = array("gif", "jpeg", "jpg", "png");
				$temp = explode(".", $FILES["h_logo"]["name"]);
				$extension = strtolower(end($temp));
				if (in_array($extension, $allowedExts)) {
					$File = "header".$rand.".jpg";
					$tmp_name = $FILES["h_logo"]["tmp_name"];
					move_uploaded_file($tmp_name,LOGO_A.$File);
					//smart_resize_image(LOGO_A.$File,792,100);
					
					
				}
		}
		return  $File;				
	}
	
}
function upload_image1($FILES)
{
	$rand=rand(0,9999);
	if(!empty($FILES['f_logo']['tmp_name'])) {
					list($width, $height, $type, $attr) = getimagesize($FILES['f_logo']['tmp_name']);
					if (isset($type) && in_array($type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
						$allowedExts = array("gif", "jpeg", "jpg", "png");
						$temp = explode(".", $FILES["f_logo"]["name"]);
						$extension = strtolower(end($temp));
						if (in_array($extension, $allowedExts)) {
							$File = "footer".$rand.".jpg";
							$tmp_name = $FILES["f_logo"]["tmp_name"];
							move_uploaded_file($tmp_name,LOGO_A.$File);
							//smart_resize_image(LOGO_A.$File,792,80);
						}
				}
		return  $File;				
	}
	
}

?>
