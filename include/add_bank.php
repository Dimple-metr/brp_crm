<div class="modal" id="model_addbank" role="dialog"  aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Bank</h3>
			</div>
			<div class="modal-body form">
		<div class="row">
			<div  class="col-md-12">
			<form class="form-horizontal" role="form" id="bank_add" action="javascript:;" method="post" name="bank_add">
			<div class="form-group">
			  <label class="col-md-12 control-label" style="text-align:left;line-height:29px;">Bank Name *</label>
				  <div class="col-md-12 col-xs-11">
						<input type="text" class="form-control" placeholder="Bank Name" name="bank_name" id="bank_name"  value=""/>
										
				</div>
            </div>
		</div>
		<button type="submit" class="btn btn-success">Submit</button> &nbsp;
		<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button><div class="col-md-3"></div>					</div>
						</div>	
							<input type='hidden' name='mode' id='mode' value="Add" />
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />
			</form>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>
<!--<div class="modal fade" id="add_customer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                              <h4 class="modal-title">Modal Tittle</h4>
                                          </div>
                                          <div class="modal-body">

                                              Body goes here...

                                          </div>
                                          <div class="modal-footer">
                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                              <button class="btn btn-warning" type="button"> Confirm</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>-->