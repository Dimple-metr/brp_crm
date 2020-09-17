<div class="modal colored-header info " id="bs-example-modal-lg" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Party</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

				 <div class="col-md-12">
						<form class="form-horizontal" role="form" id="party_add" action="javascript:;" method="post" name="party_add">
							<div class="form-group">
							  <label class="col-md-2 control-label" style="text-align:left;line-height:25px">Party Name *</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Party Name" name="party_name" id="party_name"  value=""/>
								</div>
                             </div>
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
								<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							</div>
						  </form>
				</div>
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
