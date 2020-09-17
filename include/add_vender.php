<div class="modal colored-header info " id="bs-example-modal-lg" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Vendor</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

				 <div class="col-md-12">
						<form class="form-horizontal" role="form" id="vender_add" action="javascript:;" method="post" name="vender_add">
							<div class="form-group">
							  <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Vendor Name *</label>
							  <div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" placeholder="Vender Name" name="vender_name" id="vender_name"  value="<?=$rel['vender_name']?>"/>
								</div>
                            </div>
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Select Country *</label>
								<div class="col-md-8 col-xs-11">
									<select class="select2" name="countryid" id="countryid" onChange="load_state(this.value,'stateid','')">
										<?=get_country($dbcon,$countryid)?>
									</select>
								</div>
					        </div>
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Select State *</label>
								<div class="col-md-7 col-xs-11">
									<select class="select2" name="stateid" id="stateid" onChange="load_city(this.value,'cityid','')">
										<option value="">Select State</option>
									</select>
								</div>
								<input type="button"  name="addState" id="addState" data-toggle="modal" data-target="" onclick="add_state();" class="btn btn-info" value="+"/>
					        </div>	
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Select City *</label>
								<div class="col-md-7 col-xs-11">
									<select class="select2" name="cityid" id="cityid"  onChange="">
										<option value="">Select City</option>
									</select>
								</div>
								<input type="button"  name="addCity" id="addCity" data-toggle="modal" data-target=""  onclick="add_city();" class="btn btn-info" value="+"/>
					         </div>			  	
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align:left;line-height:25px">Address *</label>
								<div class="col-md-8 col-xs-11">
									<textarea id="vender_address" name="vender_address" class="form-control" rows="3"><?=$rel['vender_address']?></textarea> 
								</div>
                            </div>
							<div class="form-group">
							 <label class="col-md-4 control-label" style="text-align:left;line-height:25px">Opening Balance</label>
								<div class="col-md-4 col-xs-11">
									<input type="number" class="form-control" placeholder="Amount" name="opening_balance" id="opening_balance" value="<?=$rel['opening_balance']?>" min="0"  title="Enter Balance"/>
								</div>
								<div class="col-md-4 col-xs-11">
									<select class="select2" name="balance_typeid" id="balance_typeid" title="Select Type" >
										<?=getbalance_type($dbcon,$rel['balance_typeid'])?>				
									</select>
								</div>
								</div>
     			           	<div class="form-group">
							 <label class="col-md-4	 control-label" style="text-align:left;line-height:25px">Mobile no</label>
								<div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" placeholder="Verder Mobile" name="vender_mobile" id="vender_mobile"   value="<?=$rel['vender_mobile']?>"  />
								</div>	
							
							</div>
							<div class="form-group">
							 <label class="col-md-4	control-label" style="text-align:left;line-height:25px">GSTIN</label>
								<div class="col-md-8 col-xs-11">
									<input type="text" class="form-control" placeholder="GSTIN" name="tin_no" id="tin_no"   />
								</div>	
							
							</div>
							<div class="form-group">
								<div class="checkbox">
								  <label class="col-md-offset-4">
									 <input type="checkbox" id="multi_company" name="multi_company" <?=($mode=="Add"?'checked':($rel['multi_company']=="1"?'checked':''))?> value="1">  View in all Company
								  </label>
							  </div>
							</div>
							<div class="col-md-4 col-xs-11"></div>
							<div class="col-md-8 col-xs-11">
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button></div>
								<input type='hidden' name='mode' id='mode' value='Add' />
								<input type='hidden' name='cat_id' id='cat_id' value='' />
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
