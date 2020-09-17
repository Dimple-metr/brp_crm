<div class="modal colored-header info" id="bs-example-modal-addproduct" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Product</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

				
			<form class="form-horizontal" role="form" id="product_add" action="javascript:;" method="post" name="item_add">
				<div class="col-md-12">
					<div class="form-group" style="margin-right:0px;">
						  <label for="Product Type" style="line-height:25px">Product Type *</label><br/>
						  <div class="col-md-12 col-xs-11" style="padding-right:0px;">
						  <input type="radio" class="" style="margin-left: 10px;width: 17px;height: 15px;" id="product_type_finish" name="product_type" value="0" checked> <label for="product_type_finish" style="font-weight: bold;" title="Use As FINISH PRODUCT">FINISH PRODUCT</label>
						  <input type="radio" class="" style="margin-left: 10px;width: 17px;height: 15px;" id="product_type_assembly" name="product_type" value="1"/> <label for="product_type_assembly" style="font-weight: bold;" title="Use As ASSEMBLY PRODUCT">ASSEMBLY PRODUCT</label>
						  <input type="radio" class="" style="margin-left: 10px;width: 17px;height: 15px;" id="product_type_semi" name="product_type" value="2"/> <label for="product_type_semi" style="font-weight: bold;" title="Use As SEMI-FINISH">SEMI-FINISH</label>
						  <input type="radio" class="" style="margin-left: 10px;width: 17px;height: 15px;" id="product_type_row" name="product_type" value="4"/> <label for="product_type_row" style="font-weight: bold;" title="Use As RAW MATERIAL">RAW MATERIAL</label>
						  <input type="radio" class="" style="margin-left: 10px;width: 17px;height: 15px;" id="product_type_component" name="product_type" value="5"/> <label for="product_type_component" style="font-weight: bold;" title="Use As FINISH COMPONENTS">FINISH COMPONENT</label>
						  </div>
					</div>
				</div>
				
				<div class="col-md-12">
					
					<div class="col-md-4"> 
						<div class="form-group" style="margin-right:0px;">
						  <label class="control-label" style="text-align:left;line-height:25px">Product Name *</label>
						  <input type="text" class="form-control" placeholder="Product Name" name="product_name" id="product_name" />
							
						</div>
					</div>
					
					<div class="col-md-4"> 
						<div class="form-group" style="margin-right:0px;">
						  <label class="control-label" style="text-align:left;line-height:25px">Alias Name</label>
							<input type="text"  class="form-control" id="product_alias_name" name="product_alias_name" placeholder="Product Alias Name" />
						</div>
					</div>
				
				</div>
				
				<div class="col-md-12">
				<div class="col-md-4"> 
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Product Description</label>
					<textarea class="form-control" placeholder="Product Description" name="productdes" id="productdes" ><?=$rel['product_des']?></textarea>
				</div>	
				</div>	
				
				<div class="col-md-4"> 
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Item Code</label>
					 <input type="text" class="form-control" id="item_code" name="item_code" placeholder="Item Code" />
				</div>
				</div>
				<div class="col-md-4"> 
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">HSN Code</label>
					<input type="text" class="form-control" placeholder="Hsn Code" name="product_code" id="product_code" />
				</div>
				</div>
				
				</div>	
				<div class="col-md-12">
				<div class="col-md-4">
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Product Sale Rate</label>
					<input type="number" min="0" class="form-control" id="product_mst_rate" name="product_mst_rate" placeholder="Product Sale Rate" />
					
				</div>
				</div>
				<div  class="col-md-4">
				  <div class="form-group" style="margin-right:0px;">
					  <label for="Product Type" style="text-align:left;line-height:25px">Product Purchase Rate</label>
					  <input type="number" min="0" class="form-control" id="product_purchase_mst_rate" name="product_purchase_mst_rate" placeholder="Product Purchase Rate" />
				  </div>
				</div>
				<div class="col-md-4"> 
				 <div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Product Unit</label>
					<select class="select2" name="product_mst_unitid" id="product_mst_unitid"  title="Select Unit">
							<?=getunit($dbcon,0);?>
						</select>
					
				</div>
				</div>
				
					
				
					
				</div>
				<div class="col-md-12">
				<div class="col-md-4">
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Intra Tax(CGST+SGST)</label>
					<select class="form-control" name="intra_tax" id="intra_tax">
							<?=getformula($dbcon,'');?>
						</select>
					
				</div>	
				</div>
				<div class="col-md-4" >
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label" style="text-align:left;line-height:25px">Inter Tax(IGST)</label>
					<select class="form-control" name="inter_tax" id="inter_tax">
							<?=getformula($dbcon,'');?>
					</select>
					
				</div>	
				</div>
				<div class="col-md-4">
				<div class="form-group" style="margin-right:0px;">
					<label class="control-label"></label>
					 <input type="checkbox"  id="multi_company" name="multi_company" checked value="1">  View in all Company
				</div>								 
				</div>
				</div>
				
				 <div class="col-md-4 col-xs-11"></div>
				 <div class="col-md-8 col-xs-11">
				<button type="submit" class="btn btn-success">Submit</button> &nbsp;
				<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button></div>
				<input type='hidden' name='model' id='model' value='model' />
				<input type='hidden' name='mode' id='mode' value='Add' />
				<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />
				</div>
			  </form>
				
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
