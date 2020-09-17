<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$form='Bank Account';
	$_SESSION['token'] = $token;
?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
<style type="text/css">
	label .error { color:#cc0000;}
	</style>
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
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
				  <section class="panel">
					  <header class="panel-heading">
						  <h3><?=$form?></h3>
						</header>	
						<div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li class="active"><?=$form?> </li>
						  </ul>
						 </div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
             </div>
              <!--Customer overview start-->
		<?php include_once('../include/country_Customer_po.php');?>
		  <div class="row">
			<div class="col-sm-3">
				<section class="panel">
				  <header class="panel-heading">
					  <i class="fa fa-plus"></i> Create <?=$form?> 
					  </header>	
					<div class="panel-body">
						<form role="form" id="bank_account_add" action="javascript:;" method="post" name="bank_account_add">
							  
							<div class="form-group">
								<label>Select Group*</label>
								<select class="select2" name="gr_id" id="gr_id">
									<?=get_all_group($dbcon,$rel['cust_group']);?>
								</select>
							</div>
							
							
							
							  <div class="form-group">
								  <label for="Product Type">Select Bank *</label>
								  <select class="select2" id="bankid" name="bankid" title="Select Bank" required >
									  <?=getbank($dbcon,0)?>
								  </select>
							  </div>
							<div class="form-group">
								  <label for="Product Type">Branch *</label>
								  <input type="text"  class="form-control" id="branch_name" name="branch_name" placeholder="" required/>
							  </div>
							<div class="form-group">
								  <label for="Product Type">City *</label>
								  
								<select class="select2" id="cityid" name="cityid" title="Select Bank" required >
									  <?=getcity($dbcon,'1',$cid)?>
								  </select>
							  </div>
								<div class="form-group">
								  <label for="Product Type">Account Name *</label>
								  <input type="text"  class="form-control" id="acc_name" name="acc_name"  required title="Enter Account Name" />
							  </div>
							  <div class="form-group">
								  <label for="Product Type">Account Number *</label>
								  <input type="text"  class="form-control" id="acc_number" name="acc_number" placeholder="" required title="Enter Account Number" />
							  </div>
								<div class="form-group">
									  <label for="Product Type">Cheque Series Starting Number </label>
									  <input type="number"  class="form-control" id="acc_chequeno" name="acc_chequeno" placeholder=""  min="0" />
								  </div>
								<div class="form-group">
									  <label >Number of Cheques </label>
									  <input type="number"  class="form-control" id="acc_chequeleft" name="acc_chequeleft" placeholder="" min="0" max="1000"/>
								  </div>
								<div class="form-group">
									  <label>Opening Balance</label>
									  <input type="number"  class="form-control" id="opn_balance" name="opn_balance" placeholder="" min="0" max=""/>
								  </div>
								<input type='hidden' name='mode' id='mode' value='add' />
							  	<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							  <button type="submit" class="btn btn-success">Submit</button>
							<button type="button" class="btn btn-danger">Cancel</button>
						  </form>

					</div>
				</section>
			</div>
			<div class="col-sm-9">
			<section class="panel">
				  <header class="panel-heading">
					 <i class="fa fa-list"></i>  <?=$form?>  List
				 <!--<span class="tools pull-right">
					<a href="javascript:;" class="fa fa-chevron-down"></a>
					<a href="javascript:;" class="fa fa-times"></a>
				 </span>-->
				  </header>
				  <div class="panel-body">
				  <div class="adv-table">
				  <table  class="display table table-bordered table-striped" id="dynamic-table">
				  <thead>
				  <tr>
					  <th>Sr. NO.</th>
					  <th>Account Name</th>
					  <th>Account Number</th>
					  <th>Bank Name</th>
					  <th>Branch Name</th>
					  <th>City</th>
					  <th>Cheques Left</th>
					  <th>Opening Balance</th>
					  <th class="hidden-phone">Action</th>					  
				  </tr>
				  </thead>
				  <tbody>
				  </tbody>				 
				  </table>
				  </div>
				  </div>
				  </section>
			</div>
		  </div>
		  
		  <!--Customer overview end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>
<!-- Modal -->
<div class="modal colored-header info" id="ModalEditAccount" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Edit Account</h3>				
			</div>
			<form id="FormEditAccount" role="form" method="post" novalidate>
			<div class="modal-body form">
				
				<div class="form-group">
					  <label for="Product Type">Select Group *</label>
					  <select class="select2" id="edit_gid" name="edit_gid" title="Select Bank" required >
						  <?=get_all_group($dbcon,0)?>
					  </select>
				  </div>
				<div class="form-group">
					  <label for="Product Type">Select Bank *</label>
					  <select class="select2" id="edit_bankid" name="bankid" title="Select Bank" required >
						  <?=getbank($dbcon,0)?>
					  </select>
				  </div>
				<div class="form-group">
								  <label for="Product Type">Branch *</label>
								  <input type="text"  class="form-control" id="edit_branch_name" name="branch_name" placeholder="" required/>
							  </div>
				<div class="form-group">
								  <label for="Product Type">City *</label>
								  
								<select class="select2" id="edit_cityid" name="cityid" title="Select Bank" required >
									  <?=getcity($dbcon,'1',$cid)?>
								  </select>
							  </div>
				<div class="form-group">
					  <label for="Product Type">Account Name *</label>
					  <input type="text"  class="form-control" id="edit_acc_name" name="acc_name"  required/>
				  </div>
				  <div class="form-group">
					  <label for="Product Type">Account Number *</label>
					  <input type="text"  class="form-control" id="edit_acc_number" name="acc_number" placeholder="" required />
				  </div>
				<div class="form-group">
					  <label for="Product Type">Cheque Series Starting Number </label>
					  <input type="number"  class="form-control" id="edit_acc_chequeno" name="acc_chequeno" placeholder=""  min="0"/>
				  </div>
				<div class="form-group">
					  <label >Number of Cheques </label>
					  <input type="number"  class="form-control" id="edit_acc_chequeleft" name="acc_chequeleft" placeholder="" min="0" max="1000"/>
				  </div>
				<div class="form-group">
					  <label>Opening Balance</label>
					  <input type="number"  class="form-control" id="edit_opn_balance" name="opn_balance" placeholder="" min="0" max="1000000"/>
				  </div>						
			</div>
			<div class="modal-footer">
				<input type="hidden" name="mode" id="mode" value="Edit" />
				<input type="hidden" name="edit_id" id="edit_id" value="" />
				<input type="hidden" name="vender_id" id="vender_id" value="" />
				<button type="button" class="btn btn-default btn-flat md-close" data-dismiss="modal">Cancel</button>
				<button class="btn btn-info btn-flat" type="submit">Update</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/bank_account.js"></script>
<script>
$(".select2").select2({
		width: '100%'
	});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
        });
</script>
  </body>
</html>
