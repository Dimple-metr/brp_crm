<div class="modal colored-header info" id="bs-example-modal-addproduct" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Purchase Product</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

				 <div class="col-md-12">
						<form class="form-horizontal" role="form" id="product_add" action="javascript:;" method="post" name="item_add">
							<div class="form-group">
							  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Product Name *</label>
							  <div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Product Name" name="product_name" id="product_name" />
								</div>
                             </div>
							<div class="form-group">
							 <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Product Description</label>
								<div class="col-md-6 col-xs-11">
									<textarea class="form-control" placeholder="Product Description" name="productdes" id="productdes" ><?=$rel['product_des']?></textarea>
								</div>
							</div>	
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Hsn  Code </label>
								<div class="col-md-6 col-xs-11">
									<input type="text" class="form-control" placeholder="Hsn Code" name="product_code" id="product_code" />
								</div>
					        </div>
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Product Rate</label>
								<div class="col-md-6 col-xs-11">
									 <input type="number" min="0" class="form-control" id="product_mst_rate" name="product_mst_rate" placeholder="Product Rate" />
								</div>
					        </div>	
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Product Unit</label>
								<div class="col-md-6 col-xs-11">
									<select class="select2" name="product_mst_unitid" id="product_mst_unitid"  title="Select Unit">
										<?=getunit($dbcon,0);?>
									</select>
								</div>
					        </div>
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Intra Tax(CGST+SGST)</label>
								<div class="col-md-6 col-xs-11">
									<select class="form-control" name="intra_tax" id="intra_tax">
										<?=getformula($dbcon,'');?>
									</select>
								</div>
					        </div>	
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Inter Tax(IGST)</label>
								<div class="col-md-6 col-xs-11">
									<select class="form-control" name="inter_tax" id="inter_tax">
										<?=getformula($dbcon,'');?>
									</select>
								</div>
					        </div>	
							 <div class="form-group">
								<div class="checkbox col-md-6 col-md-offset-4">
								  <label>
									 <input type="checkbox" id="multi_company" name="multi_company" checked value="1">  View in all Company
								  </label>
							  </div>
							</div>
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='mode' id='mode' value='Add' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />
							</div>
						  </form>
				</div>
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
