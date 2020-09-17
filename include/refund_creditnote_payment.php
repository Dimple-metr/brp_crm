<div class="modal colored-header info " id="modal_refund_creditnote_payment" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">Close &times;</button>
				<h3>Refund Payment</h3>
			</div>
			<div class="modal-body form">
			<div class="row">

			 <div class="col-md-12">
				<form class="form-horizontal" role="form" id="credit_note_payment_add" action="javascript:;" method="post" name="credit_note_payment_add">
					<div class="form-group">
					  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Payment Date *</label>
						<div class="col-md-8 col-xs-11">
							<input type="text" class="form-control default-date-picker required valid" placeholder="Payment Date" name="credit_note_payment_date" id="credit_note_payment_date"/>
						</div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Ref No.</label>
						<div class="col-md-8 col-xs-11">
							<input type="text" class="form-control" placeholder="Payment Ref No." name="credit_note_payment_refno" id="credit_note_payment_refno"/>
						</div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Due Amount</label>
						<div class="col-md-8 col-xs-11">
							<input type="text" class="form-control" placeholder="Due Amount" name="credit_note_due_amt" id="credit_note_due_amt" readonly />
						</div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Paid Amount</label>
						<div class="col-md-8 col-xs-11">
							<input type="number" min="0" class="form-control" placeholder="Paid Amount" name="credit_note_paid_amt" id="credit_note_paid_amt" />
							<span class="amtbalance" style="display:none"><span class="label label-danger"  >NOTE!</span><span style="font-size:14px;padding-left:10px" id="tran_amounterr"> </span></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Payment Mode </label>
						<div class="col-md-8 col-xs-11">
							<select class="form-control" name="paymentmodeid" id="paymentmodeid" onChange="paymentmode(this.value);get_cash_opening_bal(this.value,'max_paid_amount','tran_amounterr')" required title="Select Payment Mode">
								<?echo getpaymentmode($dbcon);?>	
							</select>
						</div>
					</div>
					
				<div style="display:none" id="cheque_data">
					<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Choose Account  *</label>
						<div class="col-lg-8 padding-right">
							<select class="form-control" id="pur_acc_id" name="pur_acc_id" title="Select Bank" onchange="get_opening_bal(this.value,'max_paid_amount','tran_amounterr');get_chequeno(this.value,'cheque_dtl')">
								<?=getaccount($dbcon,$rel['acc_id'],'acc_type!=1');?>	
							</select>
							
						</div>
					</div> 
					<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Reference No *</label>
						<div class="col-lg-8 padding-right">
							<input id="cheque_dtl" name="cheque_dtl" type="text" class="form-control" title="cheque_dtl" value="<?=$rel['cheque_dtl']?>" placeholder="Cheque No. / NEFT No. / RTGS No." >
						</div>
					</div>
					<div class="form-group">  	
					<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Reference date </label>
						<div class="col-md-8 col-xs-11">
							<input id="ref_date" name="ref_date" type="text" class="form-control default-date-picker" title="Reference Date" value="<?=$date?>" placeholder="Cheque Date/NEFT Date">
						</div>
					</div>	
				</div>
							
							
					<div class="form-group">
						<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Remark *</label>
						<div class="col-md-8 col-xs-11">
							<textarea id="credit_note_payment_remark" name="credit_note_payment_remark" class="form-control" rows="3"></textarea> 
						</div>
					</div>
				
					<div class="col-md-4 col-xs-11"></div>
					<div class="col-md-8 col-xs-11">
						<button type="submit" class="btn btn-success">Submit</button> &nbsp;
						<button type="button" class="btn_close btn btn-danger" onclick="delete_payment()">Delete <i class="fa fa-trash-o"></i></button>
					</div>
				<input type="hidden" name="mode" id="mode" value="credit_note_payment_add" />				  
				<input type="hidden" name="edit_payment_id" id="edit_payment_id" value="" />				  
				<input type="hidden" name="credit_note_id" id="credit_note_id" value="" />				  
			</div>
				</form>
			</div>
			</div>	
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

