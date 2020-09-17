<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$form='Bank Cash Transaction';
	$_SESSION['token'] = $token;
	$date=date('d-m-Y');
 
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
		  <div class="row">
			<div class="col-sm-3">
				<section class="panel">
				  <header class="panel-heading">
					  <i class="fa fa-plus"></i> Create <?=$form?> 
					  </header>	
					<div class="panel-body">
						<form role="form" id="bank_account_add" action="javascript:;" method="post" name="bank_account_add">
							 <div class="form-group">
								  <label for="Product Type">Debit Account (FROM) *</label>
								  <select class="select2" id="debit_accid" name="debit_accid" title="Select Account" required onchange="get_opening_bal(this.value,'tran_amount','tran_amounterr');get_chequeno(this.value,'cheque_dtl')">
									  <?=getaccount($dbcon,$rel['acc_id'],'acc_id>-1')?>
								  </select>
							  </div>
							<div class="form-group">
								  <label for="Product Type">Credit Account (TO) *</label>
								  <select class="select2" id="credit_accid" name="credit_accid" title="Select Account" required onchange="get_venderid(this.value,'vender_id');">
									  <?=getaccount($dbcon,$rel['acc_id'],'acc_id>-1')?>
								  </select>
							  </div>
							<div class="form-group">
									  <label>Amount *</label>
									  <input type="number"  class="form-control" id="tran_amount" name="tran_amount" placeholder="" min="0" max="" required title="Transfer Amount Required"/>
										<br/><span class="label label-danger"  style="display:none">NOTE!</span><span style="font-size:14px;padding-left:10px" id="tran_amounterr"> </span>
							</div>
							   
							<div class="form-group" id="">
								<label class="control-label">Payment Mode *</label>
								<div class="">
								<select class="select2" name="paymentmodeid" id="paymentmodeid" onChange="paymentmode(this.value);" required title="Select Payment Mode">
									<?=getpaymentmode($dbcon);?>	
								</select>
					
								</div>
							</div>
							<div style="display:none" id="cheque_data">
							
							<div class="form-group">
								<label class="control-label">Reference No *</label>
								<div class="padding-right">
									<input id="cheque_dtl" name="cheque_dtl" type="text" class="form-control" title="cheque_dtl" value="<?=$rel['cheque_dtl']?>" placeholder="Cheque No. / NEFT No. / RTGS No." >
								</div>
							</div>
							
							</div>
							<div class="form-group">
								  <label for="Product Type">Transaction Date *</label>
								  
								<input id="tran_date" name="tran_date" type="text" class="form-control default-date-picker" title="Transaction Date" value="<?=$date?>" placeholder="">
							  </div>
							<div class="form-group">
								  <label for="Product Type">Note</label>
								  
								<textarea id="tran_note" name="tran_note" class="form-control" title="Note"  placeholder=""> </textarea>
							  </div>	
								<input type='hidden' name='mode' id='mode' value='add' />
								<input type='hidden' name='vender_id' id='vender_id' value='' />
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
					  <th>Debit Account(FROM)</th>
					  <th>Credit Account (TO)</th>
					  <th>Amount</th>
					  <th>Date</th>
					  
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
				<h3>Edit <?=$form?></h3>				
			</div>
			<form id="FormEditTransfer" role="form" method="post" novalidate>
			<div class="modal-body form row">
				<div class="form-group col-md-12">  	
					<label class="col-md-3 control-label" >Debit Account *</label>
					<div class="col-md-7 col-xs-11">
						<select class="select2" id="edit_debit_accid" name="debit_accid" title="Select Account" required >
							<?=getaccount($dbcon,$rel['acc_id'],'acc_id>-1')?>
						</select>
					</div>
				</div>
				<div class="form-group col-md-12">  	
					<label class="col-md-3 control-label" >Credit Account *</label>
					<div class="col-md-7 col-xs-11">
						<select class="select2" id="edit_credit_accid" name="credit_accid" title="Select Account" required onchange="get_venderid(this.value,'editvender_id');">
							<?=getaccount($dbcon,$rel['acc_id'],'acc_id>-1')?>
						</select>
					</div>
					<input type="hidden" value="<?=$rel['acc_id']?>">
				</div>
				<div class="form-group col-md-12">  	
					<label class="col-md-3 control-label" >Amount *</label>
					<div class="col-md-5 col-xs-11">
						<input type="number"  class="form-control" id="edit_tran_amount" name="tran_amount" placeholder="" min="0"  required title="Transfer Amount Required"/>
						<br/><span class="label label-danger"  style="">NOTE!</span><span style="font-size:14px;padding-left:10px" id="edit_tran_amounterr"> </span>
					</div>
				</div>
				<div class="form-group col-md-12">  	
								<label class="col-md-3 control-label">Payment Mode *</label>
								<div class="col-md-7 col-xs-11">
								<select class="select2" name="editpaymentmodeid" id="editpaymentmodeid" onChange="paymentmode1(this.value);" required title="Select Payment Mode">
									<?echo getpaymentmode($dbcon);?>	
								</select>
					
								</div>
				</div>
							<div style="display:none" id="editcheque_data">
					<div class="form-group col-md-12">  	
							<label class="col-md-3  control-label">Reference No *</label>
								<div class="col-md-7 col-xs-11">
									<input id="editcheque_dtl" name="editcheque_dtl" type="text" class="form-control" title="Enter Reference No"  placeholder="Cheque No. / NEFT No. / RTGS No." required >
								</div>
							</div>
							
							</div>

				<div class="form-group col-md-12">  	
					<label class="col-md-3 control-label" >Transaction Date *</label>
					<div class="col-md-4 col-xs-11">
						<input id="edit_tran_date" name="tran_date" type="text" class="form-control default-date-picker" title="Transaction Date" value="<?=$date?>" placeholder="">
					</div>
				</div>
				<div class="form-group col-md-12">  	
					<label class="col-md-3 control-label" >Note </label>
					<div class="col-md-7 col-xs-11">
						<textarea id="edit_tran_note" name="tran_note" class="form-control" title="Note"  placeholder=""> </textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="hidden" name="mode" id="mode" value="Edit" />
				<input type="hidden" name="edit_id" id="edit_id" value="" />
				<input type='hidden' name='editvender_id' id='editvender_id' value='' />
				<input type='hidden' name='chequegenerateid' id='chequegenerateid' value='' />
				<button type="button" class="btn btn-default btn-flat md-close" data-dismiss="modal">Cancel</button>
				<button class="btn btn-info btn-flat" type="submit">Update</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
	<script src="<?=ROOT?>js/app/bank_transfer.js?<?=time()?>"></script>
<script>
$(".select2").select2({
		width: '100%'
	});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
      });
function paymentmode(id)
{
	
	if(id!="1")
	{	
		$('#cheque_dtl').val('');
		$('#cheque_data').show();
	}
	else
		$('#cheque_data').hide();
		get_chequeno($("#debit_accid").val(),'cheque_dtl')
}
function paymentmode1(id)
{
	
	if(id!="1")
	{	
		$('#editcheque_dtl').val('');
		$('#editcheque_data').show();
	}
	else
		$('#editcheque_data').hide();
}
</script>
  </body>
</html>
