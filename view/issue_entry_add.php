<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$form="Issue Entry";
	if(strpos($_SERVER[REQUEST_URI], "issue_entry_edit")==true){
		$mode="Edit";
		$issue_entry_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from tbl_issue_entry where issue_entry_id=$issue_entry_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$issue_entry_date=date('d-m-Y',strtotime($rel['issue_entry_date']));
	}
	else{
		$mode="Add";
		$issue_entry_date=date('d-m-Y');
	}
$set_query="select * from tbl_company where company_id=".$_SESSION['company_id'];
$set_head=mysqli_fetch_assoc($dbcon->query($set_query));
?> 
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?> 
</head>
<body>
  <section id="container">
      <?php include_once('../include/include_top_menu.php');?>
      <!--sidebar start-->
      <?php include_once('../include/left_menu.php');?>
      <!--sidebar end-->
      <!--main content start-->
           <section id="main-content">
          <section class="wrapper">
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
							  <li><a href="<?=ROOT.'issue_entry_list'?>"><?=$form?> List</a></li>
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
				<div class="panel-body">
				<form class="form-horizontal" role="form" id="issue_entry_add" action="javascript:;" method="post" name="issue_entry_add">
						<div class="row">
					 		
				<div class="col-md-12" >
					<div class="col-md-6">
						<div class="form-group">
							<label class="col-md-4 control-label">Issue Entry No</label>
							<div class="col-md-6 col-xs-11">
								<input id="issue_entry_no" name="issue_entry_no" type="text" class="form-control" title="Date" value="<?=$rel['issue_entry_no']?>" placeholder="Issue Entry No" readonly >
							</div>
						</div>	
					</div>	
					<div class="col-md-6">
					 <div class="form-group">  	
					  <label class="col-md-3 control-label">Issue Entry Date</label>
						<div class="col-md-5 col-xs-11">
							<input id="issue_entry_date" name="issue_entry_date" type="text" class="form-control default-date-picker" title="Date" value="<?=$issue_entry_date?>" placeholder="Issue Entry Date" autocomplete="off">
						</div>
					 </div>	
					</div>
				</div>		
	
				<div class="col-md-12" style="margin-top:10px;">
							 				 	
				<div class="form-group">
					<div class="col-md-12 col-xs-11">
						<table cellspacing="10" style=" border-spacing:10px;" class="display table table-bordered table-striped" id="product_list">
						<tr id="field" >
							<th width="25%" class="text-center">Product Detail</th> 
							<th width="7%" class="text-center">Quantity</th>
							<th width="7%" class="text-center">Unit</th>
							<th width="5%" class="text-center"></th>
						</tr>
					<input type="hidden" value="1" name="fieldcnt" id="fieldcnt"/>
					<tr id="field1"> 
						<td style="vertical-align:top;">
							<select class="select2" title="Select product" name="product_id" id="product_id" onChange="load_productdetail(this.value);">
								<?=getproduct($dbcon,0,'')?>
							</select>
							<br><br>
							<textarea id="product_des" name="product_des" class="form-control"></textarea>
						</td>	 
						<td style="vertical-align:top;">
							<input type="number"  title="Enter Qty" min="0" id="product_qty" name="product_qty"  class="form-control" onkeyup="get_amount();"/>
						</td> 
						<td style="vertical-align:top;">
							<select class="select2"  name="unitid" id="unitid"  title="Select Unit">
								<?=getunit($dbcon,0);?>
							</select>
						</td>
						<td width="5%">
							<input type="button"  name="addrow" id="addrow" onClick="return add_field();" class="btn btn-primary" value="Add"/>
						</td>
							<input type='hidden' name='edit_id' id='edit_id' value='' />
					
						</tr>
					</table>
						</div>
                             </div>
	<div id="sale_productdata"></div>	
	
<div class="col-md-6">		
	<div class="form-group">
		<label class="col-md-3 control-label">Remarks </label>
		<div class="col-md-9 col-xs-11">
			<textarea id="remark" name="remark" class="form-control" rows="3"><?=$rel['remark']?></textarea> 
		</div>
	</div> 
</div>
			
				</div>
					
			<div class="col-md-12 text-center">
				<button type="submit" class="btn btn-success" id="save" name="save">Submit</button>
				<a href="<?=ROOT.'issue_entry_list'?>" type="button" class="btn btn-danger">Cancel</a>
			</div>					
	</div>
			<!--Vendor row end-->	
			<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
			<input type='hidden' name='eid' id='eid' value='<?=$rel['issue_entry_id']?>' />				  
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
	
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
	<!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
<script src="<?=ROOT?>js/app/issue_entry.js?<?=time()?>"></script>
	
<script>
$(".select2").select2({
	width: '100%'
});  
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
}); 
$(".form_datetime").datetimepicker({
    format: 'dd-mm-yyyy hh:ii',
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left"
}); 
</script>
<? 
if($mode=="Add") {
	echo "<script>load_issue_entry_no();</script>";
}
?>
</body>
</html>