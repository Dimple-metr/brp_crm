<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Expense";
	if(strpos($_SERVER[REQUEST_URI], "expense-update")==false)
	{
		$mode="Add";
		$date=date('d-m-Y');
		$invoiceid=$dbcon->real_escape_string($_REQUEST['id']);
		
		$date=date('d-m-Y');
		$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
		$set_head=mysqli_fetch_assoc($dbcon->query($set));	
		$condition=$set_head['quot_condition'];
	}
	else
	{
		$mode="Edit";
		$id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select * from expense_mst as expmst where expmst.expenseid=$id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$invoice_no=$rel['invoice_no'];
		$date=date('d-m-Y',strtotime($rel['expense_date']));
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
</head>
<body>
  <section id="container"  >
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
					  <h3> <span class="english"><?=$mode .' '.$form?></span></h3>
						
					  </header>	
							<div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> 
							 Home
							</a></li>
							  <li ><a href="<?=ROOT.'expense_list'?>"><span class="english"><?=$form?> List</span></a></li>
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
					<span class="english">  New <?=$form?></span>
					</header>	
				<div class="panel-body">
	<form class="form-horizontal" role="form" id="estimate_add" action="javascript:;" method="post" name="estimate_add">
					<div class="row">
							<div class="form-group">
							  <label class="col-md-2  control-label"><span class="english">Date*</span></label>
							  <div class="col-md-2 col-xs-11">
								<input id="expense_date" name="expense_date" type="text" class="form-control default-date-picker required valid" title="Date" value="<?=$date?>" placeholder="Expense Date">
								</div>
                             </div>	
							 <div class="form-group">
							 	<label class="col-md-2 control-label" > <span class="english">Party *</span></label>
								<div class="col-md-3 col-xs-11">
									<select class="select2" name="cust_id" id="cust_id" onChange="" >
										<?=getcust($dbcon,$rel['vendorid']);?>	
									</select>
								</div>
								<div class="col-md-3">
								<button type="button"  name="addcust" id="addcust" data-toggle="modal" data-target="#bs-example-modal-lg"  class="btn btn-primary" /><span class="english">New Party</span>
									
								</button>
                        	</div>
								
					         </div>		
							
					 		<div class="form-group">
								<label class="col-md-2 control-label"><span class="english">Invoice  No *</span></label>
								<div class="col-md-2 col-xs-11">
								<input id="expense_no" name="expense_no" type="text" class="form-control" value="<?=$rel['invoice_no']?>" placeholder="Invoice No">		
								</div>
					         </div>
					 		 <div class="form-group">
								<label class="col-md-2 control-label">Amount are</label>
								<div class="col-md-6 col-xs-11">
									<label class="checkbox-inline" style="padding-left:0px;">
                                              <input type="radio" name="tax_inclusive" id="tax_inclusive" value="exclusive" <?=(strtolower($rel['tax_type'])=="exclusive"?'checked':'checked')?> onclick="change_tax_type();"> Tax Exclusive
                                    </label>
									<label class="checkbox-inline" style="padding-left:0px;">
                                              <input type="radio" name="tax_inclusive" id="tax_inclusive" value="inclusive" onclick="change_tax_type();" <?=(strtolower($rel['tax_type'])=="inclusive"?'checked':'')?>> Tax Inclusive
                                    </label>
											
								</div>
								<div class="col-md-6 col-md-offset-2 col-xs-11"><label for="tax_inclusive" class="error"></label></div>
					         </div>
							 
							 <div class="form-group">
								 <?php if($_SESSION['user_type']=='1' || $_SESSION['user_type']=='2') { ?>
								<label class="col-md-2 control-label" style="">Select Branch </label>
								<div class="col-md-3 col-xs-10">
								
									<select class="select2" name="branchid" id="branchid">
									
										<?=get_branch($dbcon,$rel['branch_id'])?>	
										<option value="0" selected>Admin</option>							
									</select>
								</div>
								<?php } else {  ?>
									<input type="hidden" name="branchid" id="branchid" value="<?=$_SESSION['branch_id']; ?>" />	
								<?php } ?>
							</div>
							
							<div class="clearfix"></div>
						    	
							<div class="col-md-12">
							 	<div class="form-group">
						<table cellspacing="10" style="border-collapse:inherit; " id="product_list" class="display table table-bordered table-striped">
							<tr id="field">
							<!--<th width="5%"></th>-->
							<th width="25%"><span class="english">Expense Accounts</span></th>
							<!--<th width="25%">HSN/SAC Code</th>-->
							 <th width="10%"><span class="english">Amount</span></th>
							<th width="15%"><span class="english">Tax</span></th>
							<th width="15%"><span class="english">Notes</span></th>
							<th width="5%"><span class="english"></th>
							
						</tr>
					<input type="hidden" value="1" name="fieldcnt" id="fieldcnt"/>
					<tr id="field1">
						
						<!--<td  style="vertical-align:top;">
							<input type="button"  name="addproduct" id="addproduct" data-toggle="modal" data-target="#bs-example-modal-addproduct"  class="btn btn-primary" value="+"/>
						</td>-->
						
						<td style="vertical-align:top;">
							<select class="select2"  title="Select Account" name="accountid" id="accountid">
								<option value="">--Select Expense--</option>
								<?=get_all_expense($dbcon,0);?>
							</select>
						</td>	
						<!--<td style="vertical-align:top;">
							<input type="text"  title="Enter HSN/SAC Code" min="0" id="hsn_code" name="hsn_code" class="form-control"/>
						</td>-->
						<td style="vertical-align:top;">
							<input type="number"  title="Enter Amount" min="0" id="expense_amount" name="expense_amount" onkeyup="return get_amount();" class="form-control"/>
						</td>
						<td style="vertical-align:top;">
							<select class="form-control" name="formulaid" id="formulaid" onchange="get_amount();"  title="Select Formula">
									<?=getformula($dbcon,$rel['formulaid']);?>
							</select>
						</td>
						<td style="vertical-align:top;"> 
							<textarea id="expense_notes" name="expense_notes" class="form-control" ></textarea>
						</td>
						<td style="vertical-align:top;">
							<input type="button"  name="addrow" id="addrow" onClick="return add_field();"  class="btn btn-primary" value="Add"/>
							<input type="hidden"  title="Enter Amount" min="0" id="expense_gtotal" name="expense_gtotal" class="form-control"/>
						</td>
						<input type='hidden' name='edit_id' id='edit_id' value='' />
						</tr>
					</table>			
						
                             </div>
							 </div>
							 <div id="sale_productdata">
					
					
				</div>
				<div class="col-md-7">
					<div class="form-group">
					<label class="col-md-2 control-label"><span class="english">Remarks </span></label>
					<div class="col-md-6 col-xs-11">
						<textarea id="remark" name="remark" class="form-control" rows="3"><?=$rel['remark']?></textarea> 
					</div>
					</div>
				</div>	
						
							<div class="col-md-5" >
								
							<div class="form-group">
								<label class="col-md-4 control-label"><span class="english">Grand Total *</span></label>
								<div class="col-md-6 col-xs-11">
								<input id="g_total" name="g_total" type="text" class="form-control" title="dispatch_no" value="<?=$rel['g_total']?>" placeholder="Grand Total" readonly="readonly">
								</div>
							</div>	
							<div style="<?=($mode=="Add"?'':'display:none')?>">
							<div class="form-group">
								<label class="col-md-4 control-label">Paid Through </label>
								<div class="col-md-6 col-xs-11">
									<select class="form-control" name="paymentmodeid" id="paymentmodeid" onChange="paymentmode(this.value);get_cash_opening_bal(this.value,'max_paid_amount','tran_amounterr')" title="Select Payment Mode">
										<?=getpaymentmode($dbcon,$rel['paymentmodeid']);?>	
									</select>
								</div>
							</div>
							<div class="form-group cheque_data 	" style="display:none;">
									<label class="col-md-4 control-label">Choose Account  *</label>
									<div class="col-lg-6 padding-right">
										<select class="form-control"  name="pur_acc_id" id="pur_acc_id" required title="Select Bank" onchange="get_opening_bal(this.value,'max_paid_amount','tran_amounterr');">
											<?=getaccount($dbcon,$rel['acc_id'],'acc_type!=1');?>	
										</select>
										
									</div>
									
								</div>
							<div class="form-group">
									<label class="col-md-4 control-label">Paid Amount</label>
									<div class="col-lg-6 padding-right">
										<input id="paid_amount" name="paid_amount" type="number" min='0' class="form-control" title="Not Greater than Grand Total" value="<?=$rel['paid_amount']?>" max="" placeholder="Amount" >
										<br/><span class="amtbalance" style="display:none"><span class="label label-danger"  >NOTE!</span><span style="font-size:14px;padding-left:10px" id="tran_amounterr"> </span></span>
									</div>
							</div>
							<div class="form-group cheque_data" style="display:none;">
									<label class="col-md-4 control-label">Reference No *</label>
									<div class="col-lg-6 padding-right">
										<input id="cheque_dtl" name="cheque_dtl" type="text" class="form-control" title="cheque_dtl" value="<?=$rel['cheque_dtl']?>" placeholder="Cheque No. / NEFT No. / RTGS No." >
									</div>
								</div>
								<div class="form-group cheque_data" style="display:none;">  	
								<label class="col-md-4 control-label" >Reference date </label>
								  <div class="col-md-6 col-xs-11">
									<input id="ref_date" name="ref_date" type="text" class="form-control default-date-picker" title="Reference Date" value="<?=$date?>" placeholder="Cheque Date/NEFT Date">
									</div>
                             	</div>	
								
							</div>	
						</div>
						<div class="col-md-12">
							<button type="submit" class="btn btn-success" id="save" name="save"><span class="english">Save</span></button>
							<button type="submit" class="btn btn-success" id="saveprint" name="saveprint" onClick="submit_estimate()"><span class="english">Save and New</span></button> &nbsp;
							<a href="<?=ROOT.'expense_list'?>" type="button" class="btn btn-danger"><span class="english">Cancel</span></a><div class="col-md-3"></div>			</div>		
							<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
							<input type='hidden' name='eid' id='eid' value='<?=$rel['expenseid']?>' />
							<input type='hidden' name='save_new' id='save_new' value='' />
							<input type='hidden' name='expense_paymentid' id='expense_paymentid' value='<?=$rel['expensereceipt_id']?>' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />	
							</div>
						</div><!--Vendor row end-->	
										  
							
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
	  
	<?php include_once('../include/add_cust.php');?>
	<?php include_once('../include/add_product.php');?>
	
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
   <script src="<?=ROOT?>js/app/expense_entry.js?<?=time()?>"></script>
    <script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
 	<script src="<?=ROOT?>js/app/product_mst.js?<?=time()?>"></script>
	<script>
$(".select2").select2({
		width: '100%'
	});
$('.default-date-picker').datepicker({
            format: 'dd-mm-yyyy',
            autoclose: true
        });
/*function paymentmode(id)
{
	if(id!="1" && id!="")
	{	
		$('#cheque_dtl').val('');
		$('#cheque_data').show();
		if(id=="2"){
			$('#cheque_display').show();
		}else{
			$('#cheque_display').hide();
		}
	}
	else{
		
		$('#cheque_data').hide();
	}
		
	
}*/
function paymentmode(id)
{
	if(id==2)//for cheque generate 
		$('#save_cheque').show();
	else
		$('#save_cheque').hide();
	if(id!="1" && id!="")
	{	
		$('#cheque_dtl').val('');
		$('.cheque_data').show();
	}
	else
		$('.cheque_data').hide();
		get_chequeno($("#pur_acc_id").val(),'cheque_dtl')
				
}
</script>
<?
echo "<script>load_state(229,'stateid',0)</script>";
echo "<script>show_data() </script>";
if($mode=="Add")
{
	
	//echo "<script>load_estimateno(4) </script>";
}
else if($mode=="Edit")
{
	if($rel['paymentmodeid']==1)
	{
		echo "<script>get_cash_opening_bal(".$rel['paymentmodeid'].",'max_paid_amount','tran_amounterr')</script>";
	}
	else{
		echo "<script>get_opening_bal(".$rel['acc_id'].",'max_paid_amount','tran_amounterr');</script>";
	}
}
?>
  </body>
</html>
