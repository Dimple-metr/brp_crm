<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Role";
	if(strpos($_SERVER[REQUEST_URI], "roleedit")==false)
	{
		$mode="Add";
		$countryid="101";
		$stateid="1";
		$cityid="1";
	}
	else
	{
		$mode="Edit";
		$id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_role where role_id=$id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));	
		$module_arr=explode(",",$rel['role_module']);
		//print_r($module_arr);
	}
	
	

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container" >
    <?php include_once('../include/include_top_menu.php');?>
      <!--sidebar start-->
      <?php include_once('../include/left_menu.php');?>
      <!--sidebar end-->
      <!--main content start-->
           <section id="main-content">
          <section class="wrapper">			
		<?php 
			//include_once('../include/quick_link.php');
		?>
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
					<section class="panel">
						<header class="panel-heading">
						  <h3><?=$mode.' '.$form?></h3>
					  
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.'role_list'?>"><?=$form?> List</a></li>
							</ul>
						</div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
            </div>
        <!--state overview start-->
		  <div class="row">			
			<div class="col-sm-12">
				<section class="panel">
				  <header class="panel-heading">
					  New <?=$form?>
					</header>	
					<div class="panel-body ">
					<form class="form-horizontal" role="form" id="role_add" action="javascript:;" method="post" name="role_add">
						<div class="row">
						<div class="col-md-12">
							<div class="form-group">
							  <label class="col-md-3 control-label">Role Name </label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Role Name" name="role_name" id="role_name"  value="<?=$rel['role_name']?>"/>
								</div>
                             </div>
						</div>
						<div class="col-md-9 col-md-offset-1">
							<?php 
								$cnt=1;
								$q=$dbcon->query("select * from module_mst order by module_name");
								 while($row=mysqli_fetch_array($q))
								 {
									  $mid=$row['module_id'];

							?>
							<div class="panel-group">
							  <div class="panel panel-default">
								<div class="panel-heading">
								  <h4 class="panel-title">
									<input type="checkbox" name="user_module[]" value="<?php echo $row['module_id']; ?>" id=""<?php if(in_array($row['module_id'],$module_arr)){ echo "checked"; } ?> />
									<a data-toggle="collapse" href="#collapse<?php echo $cnt; ?>">
									<?php echo $row['module_name']; ?></a>
								  </h4>
								</div>
								<div id="collapse<?php echo $cnt; ?>" class="panel-collapse collapse">
									<div class="row">
										<div class="col-md-12">
											<table class="table table-bordered">
											<tr>
												<th>Menu Name</th>
												<th>Add</th>
												<th>Edit</th>
												<th>View</th>
												<th>Active</th>
												<th>Inactive</th>
												<th>Export</th>
											</tr>
									<?php 
										$cntt=1;
										if($mode=='Edit')
										{
											$r=$dbcon->query("select m.*,p.* from tbl_menu as m left join tbl_permission_role as p on p.menu_id=m.menu_id where m.menu_module='$mid' and p.role_id='$id'");
											
											
										}
										else
										{
											$r=$dbcon->query("select * from tbl_menu where menu_module='$mid' order by menu_name");
										}
										while($row1=mysqli_fetch_array($r))
										{
											
									?>
									
										<tr>
											<td><input type="hidden" name="menu_id[]" id="" value="<?php echo $row1['menu_id']; ?>" /><?php echo $row1['menu_name']; ?></td>
											
											<td><input type="checkbox" name="add_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['add_permission']=='1'){ echo "checked";  } ?> /> </td>
											
											<td><input type="checkbox" name="edit_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['edit_permission']=='1'){ echo "checked";  } ?> /> </td>
											
											<td><input type="checkbox" name="view_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['view_permission']=='1'){ echo "checked";  } ?>  /></td>
											
											<td><input type="checkbox" name="active_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['active_permission']=='1'){ echo "checked";  } ?> /></td>
											
											<td><input type="checkbox" name="inactive_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['inactive_permission']=='1'){ echo "checked";  } ?>  /></td>
											
											<td><input type="checkbox" name="export_per[]" value=<?=$row1['menu_id'];?> <?php if($mode=='Edit' && $row1['export_permission']=='1'){ echo "checked";  } ?>  /></td>
										</tr>
										
									<?php $cntt++; } ?>
											
											</table>
											
										</div>
									</div>
								</div>
							  </div>
							</div>
							<?php $cnt++; } ?>
						</div>
							
						<div class="col-md-5">
							 
							 <button type="submit" class="btn btn-info">Submit</button>
							
						</div>
						
						</div><!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
							<input type='hidden' name='eid' id='eid' value='<?php if($mode=='Edit'){ echo $id;  } else { echo  $_SESSION['user_id']; } ?>' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							

						  </form>
</div>	
					</section>
					
				</div>
			  </div>
			  <!--state overview end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
	<?php include_once('../include/add_city.php');?>
	<?php include_once('../include/add_state.php');?>
	
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="<?=ROOT?>js/app/roles.js"></script>
   <script src="<?=ROOT?>js/app/state_mst.js"></script>
   <script src="<?=ROOT?>js/app/city_mst.js"></script>
<script>
$(".select2").select2({
		width: '100%'
});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
});</script>
	<?php
	if($mode=="Edit"){
		echo "<script>load_state(".$countryid.",'stateid',".$stateid.")</script>";
		echo "<script>load_city(".$stateid.",'cityid',".$cityid.")</script>";
	}
	else{
		echo "<script>load_state(".$countryid.",'stateid',".$stateid.")</script>";
		echo "<script>load_city(".$stateid.",'cityid',".$cityid.")</script>";
	}
	?>


  </body>
</html>
