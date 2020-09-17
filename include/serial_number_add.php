<div class="modal colored-header info " id="bs-serial-modal-lg" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close close md-close" data-dismiss="modal" aria-hidden="true">Close &times;</button>
				<h3>Add Serial Numbers</h3>
			</div>
			<div class="modal-body form">
			<div class="row">

			<div class="col-md-12">
			
			<form class="form-horizontal" role="form" id="serial_number_add" action="javascript:;" method="post" name="serial_number_add">
				<div  class="col-md-6">
					<div class="form-group">
							<label class="col-md-12 control-label" style="text-align:left;line-height:25px">Starting Number</label>
							<div class="col-md-12 col-xs-11">
								<input type="text" class="form-control" placeholder="Starting Number" name="start_serial[]" id="start_serial1" value=""/>
							</div>
                    </div>
				</div>			
				<div  class="col-md-6">
				<div class="form-group">
				  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Ending Number</label>
					  <div class="col-md-12 col-xs-11">
							<input type="text" class="form-control" placeholder="Ending Number" name="end_serial[]" id="end_serial1" value=""/>
							
					  </div>
               </div>	
			   </div>
			   
			<div class="col-md-12"></div>
				<div class="col-md-6">
					<div class="form-group">
							<div class="col-md-12 col-xs-11">
								<input type="text" class="form-control" placeholder="Starting Number" name="start_serial[]" id="start_serial2" value=""/>
							</div>
                    </div>
				</div>			
				<div  class="col-md-6">
					<div class="form-group">
						<div class="col-md-12 col-xs-11">
							<input type="text" class="form-control" placeholder="Ending Number" name="end_serial[]" id="end_serial2" value=""/>
						</div>
					</div>	
			   </div>
			
			<div class="col-md-12"></div>
				<div class="col-md-6">
					<div class="form-group">
							<div class="col-md-12 col-xs-11">
								<input type="text" class="form-control" placeholder="Starting Number" name="start_serial[]" id="start_serial3" value=""/>
							</div>
                    </div>
				</div>			
				<div class="col-md-6">
					<div class="form-group">
						<div class="col-md-12 col-xs-11">
							<input type="text" class="form-control" placeholder="Ending Number" name="end_serial[]" id="end_serial3" value=""/>
						</div>
					</div>	
			   </div>
						 	
				
			</div>
				<!--<div class="col-md-3"></div>
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>-->
			</div>
					
					<!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='Add' />
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='consignee_custmerid' id='consignee_custmerid' value='' />
							<input type='hidden' name='consignee_eid' id='consignee_eid' value='' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
						  </form>
				</div>
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
