<div class="modal colored-header info " id="bs-example-modal-city" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add City</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

			<div class="col-md-12">
			
			<form class="form-horizontal" role="form" id="city_add" action="javascript:;" method="post" name="city_add">
				<div class="form-group">
							  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">City Name *</label>
							  <div class="col-md-12 col-xs-11">
									<input type="text" class="form-control" placeholder="City Name" name="city_name" id="city_name"  />
								</div>
                     </div>
				<div class="col-md-12">
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
					</div></div>
					
					<!--Vendor row end-->	
							<input type='hidden' name='state_id' id='state_id' value='' />
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
