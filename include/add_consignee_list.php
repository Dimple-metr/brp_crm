<div class="modal colored-header info " id="bs-consignee-direct-modal-lg" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button"  class="btn_close  close md-close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Add Consignee</h3>
				
			</div>
			<div class="modal-body form">
			<div class="row">

			<div class="col-md-12">
			
			<form class="form-horizontal" role="form" id="consignee_add" action="javascript:;" method="post" name="consignee_add">
				<div  class="col-md-4">
				<div class="form-group">
							  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Main Company</label>
								<div class="col-md-12 col-xs-11">
									<select class="select2" name="consignee_custmerid" id="consignee_custmerid" >
										<?=getcust($dbcon,'');?>	
									</select>
								</div>
                             </div>
				</div>
				<div  class="col-md-4">
				<div class="form-group">
							  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Company Name *</label>
							  <div class="col-md-12 col-xs-11">
									<input type="text" class="form-control" placeholder="Company Name" name="company_name" id="company_name"  value="<?=$rel['company_name']?>"/>
								</div>
                             </div>
				</div>			
				<div  class="col-md-4">
				<div class="form-group">
				  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Consignee Name </label>
					  <div class="col-md-12 col-xs-11">
							<input type="text" class="form-control" placeholder="Customer Name" name="cust_name" id="cons_name"  value="<?=$rel['cust_name']?>"/>
							
					  </div>
               </div>	
			   </div>
			   
				
				<div class="col-md-12"></div>
				<div class="col-md-8 col-xs-11">
				<div class="form-group">
				  <label class="control-label">Address *</label>
					<textarea id="cons_address" name="cust_address" class="form-control" rows="2"></textarea> 
					</div>
                </div>	
				<div class="col-md-4">
			      <div class="form-group">
					<label class="col-md-12 control-label" style="text-align:left;line-height:25px">Select State *</label>
						<div class="col-md-10 col-xs-11">
							<select class="select2" name="stateid" id="stateid" onChange="load_city(this.value,'con_cityid','0')">
									<?=getstate($dbcon,$rel['stateid'])?>			
								</select>
								</div>
								<!--<input type="button"  name="addState" id="addState" data-toggle="modal" data-target="#bs-example-modal-state"  class="btn btn-primary" value="+"/>-->
					         </div>	
				</div>	
				<div class="col-md-12"></div>
				<div class="col-md-4">
							  <div class="form-group">
								<label class="col-md-12 control-label" style="text-align:left;line-height:25px">Select City *</label>
								<div class="col-md-10 col-xs-11">
								<select class="select2" name="cityid" id="con_cityid">
								<option value="">Select City</option>	
								</select>
								</div>
								<!--<input type="button"  name="addCity" id="addCity" data-toggle="modal" data-target=""  onclick="add_city();" class="btn btn-primary" value="+"/>-->
								
					         </div>	
							</div>
						 	
				
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Mobile no </label>
							<div class="col-md-12 col-xs-11">
									<input type="text" class="form-control" placeholder="Customer Mobile" name="cust_mobile" id="cust_mobile"   value="<?=$rel['cust_mobile']?>"  />
							</div>	
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Email </label>
					<div class="col-md-12 col-xs-11">
						<input type="text" class="form-control" placeholder="Email" name="cust_email" id="cust_email"   value="<?=$rel['cust_email']?>"  />
					</div>	
					</div>
				</div>
				<div class="col-md-12"></div>
				<div class="col-md-4">
					<div class="form-group">
					  <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Pin Code</label>
						<div class="col-md-12 col-xs-11">
							<input type="text" class="form-control" placeholder="Customer Pincode" name="cust_pincode" id="cust_pincode"   value="<?=$rel['cust_pincode']?>"  />
						</div>
					</div>
				</div>		
					<!--<div class="col-md-4">
				<div class="form-group">
				 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">C.S.T No</label>
					<div class="col-md-12 col-xs-11">
						<input type="text" class="form-control" placeholder="C.S.T No" name="cst_no" id="cst_no"  />
					</div>
				</div>
				</div>
			<div class="col-md-4">
				<div class="form-group">
				 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Cst Date</label>
					<div class="col-md-12 col-xs-11">
						<input type="text" class="form-control  default-date-picker" placeholder="Cst Date" name="cst_date" id="cst_date"  />
					</div>
				</div>
				</div>-->
				<div class="col-md-4">
				<div class="form-group">
				 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">GSTIN No</label>
					<div class="col-md-12 col-xs-11">
						<input type="text" min="0" class="form-control" name="gst_no" id="gst_no" placeholder="GSTIN No" />
					</div>
				</div>
				</div>
				<!--<div class="col-md-4">
					<div class="form-group">
					 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">S.T Date</label>
						<div class="col-md-12 col-xs-11">
							<input type="text" class="form-control  default-date-picker"  name="st_date" id="st_date" placeholder="S.T Date" />
						</div>
					</div>
				</div>-->
				<!--<div class="col-md-4">
					<div class="form-group">
				 		 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Cst No</label>
							<div class="col-md-12 col-xs-11">
								<input type="text" class="form-control" placeholder="Cst no" name="cst_no" id="cst_no"   value="<?=$rel['cst_no']?>"  />
							</div>
					</div>
				</div>			
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-12 control-label" style="text-align:left;line-height:25px">Excise No *</label>
							<div class="col-md-12 col-xs-11">
								<input type="text" class="form-control" placeholder="Customer Excise" name="excise_no" id="excise_no"   value="<?=$rel['excise_no']?>"  />
							</div>
						</div>
				</div>-->
				</div>
				<div class="col-md-3"></div>
							<button type="submit" class="btn btn-success">Submit</button> &nbsp;
							<button type="button"  class="btn_close btn btn-danger" data-dismiss="modal" aria-hidden="true">Close</button>
					</div>
					
					<!--Vendor row end-->	
							<input type='hidden' name='mode' id='mode' value='Add' />
							<input type='hidden' name='model' id='model' value='model' />
							<input type='hidden' name='entry_type' id='entry_type' value='1' />
							
							<input type='hidden' name='consignee_eid' id='consignee_eid' value='' />
							<input type='hidden' name='token' id='token' value='<?php echo $token; ?>' />				  
							
						  </form>
				</div>
			</div>	
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
