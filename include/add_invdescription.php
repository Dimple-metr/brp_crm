<div class="modal colored-header info " id="bs-des-modal-lg" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Invoice Description</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

			<div class="col-md-12">
			
			<form class="form-horizontal" role="form" id="invdescription" action="javascript:;" method="post" name="invdescription">
				
				<div class="col-md-12">
			      <div class="form-group">
					<label class="col-md-12 control-label" style="text-align:left;line-height:25px">Invoice Description</label>
						<div class="col-md-12 col-xs-11">
							<!--<input type="text" class="form-control" placeholder="Payment Terms" name="payment_terms" id="payment_terms"  title="Payment Terms"/>-->
							 <input type="text" class="form-control" id="inv_description" name="inv_description" placeholder="Invoice Description">
						</div>
						
					 </div>	
				</div>
				</div>
				<div class="col-md-3"></div>
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
					
					<!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='Add' />
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
						  </form>
				</div>
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
