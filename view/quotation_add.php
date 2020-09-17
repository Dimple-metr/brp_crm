<?php 
	session_start();
	include_once("../config/config.php");
	//error_reporting(E_ALL);
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$infopage = pathinfo( __FILE__ );
	$_SESSION['page']=$infopage['filename'];
	$form="Quotation";
	$countryid='101';
	$stateid='1';
	$cityid='1';
	if(strpos($_SERVER[REQUEST_URI], "quotation_edit")==true) {
		$mode="Edit";
		$viewmode="Edit";
		$quotation_id=$dbcon->real_escape_string($_REQUEST['id']);
		$query="select quot.*,usr.user_name from tbl_quotation as quot
		left join users as usr on usr.user_id=quot.user_id
		where quot.quotation_id=$quotation_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$quotation_date=date('d-m-Y',strtotime($rel['quotation_date']));
		$user_name=$rel['user_name'];
		$cust_id=$rel['cust_id'];
		$inquiry_id=$rel['inquiry_id'];
		$quot_type = $rel['quot_type'];
		$quot_subject=$rel['quot_subject'];
		$c_con_id=$rel['c_con_id'];
		$quotation_valid_date='';
		if($rel['quotation_valid_date']!="1970-01-01" && $rel['quotation_valid_date']!="0000-00-00"){
			$quotation_valid_date=date('d-m-Y',strtotime($rel['quotation_valid_date']));
		}
	}
	else {
		$mode="Add";
		$viewmode="Add";
		$quotation_date=date('d-m-Y');
		$quotation_valid_date=date('d-m-Y');
		$user_name=$_SESSION['user_name'];
		$cust_id='';$inquiry_id='';$quot_subject='';$c_con_id='';$quot_type=0;
                if(strpos($_SERVER[REQUEST_URI], "inq_to_quot")==true) {
			$inq_to_quot=true;
			$inquiry_id=$dbcon->real_escape_string($_REQUEST['id']);
			$inq_qry="select inq.*,(SELECT group_concat(assign_user_ids) FROM `tbl_task` where task_status!=2 and inquiry_id=inq.inquiry_id) as assign_user_ids from tbl_inquiry as inq
			where inquiry_id=".$inquiry_id;
			$inq_rel=mysqli_fetch_assoc($dbcon->query($inq_qry));
			
			$inq_qry1="select * from tbl_task as task where inquiry_id=".$inquiry_id." and task_status=0";
			$inq_rel1=mysqli_fetch_assoc($dbcon->query($inq_qry1));
			
			$cust_id=$inq_rel['cust_id'];
			$c_con_id=$inq_rel['c_con_id'];
			$assign_user_ids=array_unique(explode(",",$inq_rel['assign_user_ids']));
			unset( $assign_user_ids[array_search( $_SESSION['user_id'], $assign_user_ids )] );
			
			//$assign_user_ids=implode(",",$assign_user_ids);
			 $assign_user_ids=$inq_rel1['assign_user_ids'];
		}
                else if($dbcon->real_escape_string($_REQUEST['id'])){
                    $prev_quotation_id=$dbcon->real_escape_string($_REQUEST['id']);
                    if($prev_quotation_id){
                            $viewmode="Revise";
                            $revise_status=true;
                            $query="select quot.*,usr.user_name from tbl_quotation as quot
                            left join users as usr on usr.user_id=quot.user_id
                            where quot.quotation_id=$prev_quotation_id";
                            $rel=mysqli_fetch_assoc($dbcon->query($query));
                            $cust_id=$rel['cust_id'];
                            $inquiry_id=$rel['inquiry_id'];
                            $quot_type=$rel['quot_type'];
                            $start_quotation_id=$rel['start_quotation_id'];
                            $quot_subject=$rel['quot_subject'];
                            $c_con_id=$rel['c_con_id'];
                    }
                }
		else{
			$cust_id=$_SESSION['def_quot_cust_id'];
			$inquiry_id=$_SESSION['def_quot_inquiry_id'];
			$quot_subject=$_SESSION['def_quot_subject'];
			$c_con_id=$_SESSION['def_c_con_id'];
		}
	}
	
$set="select * from tbl_company where company_id=".$_SESSION['company_id'];
$set_head=mysqli_fetch_assoc($dbcon->query($set));
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php include_once('../include/include_css_file.php');?>
</head>
<body>
<section id="container" class="sidebar-closed">
<?php include_once('../include/include_top_menu.php');?>
<!--sidebar start-->
<?php include_once('../include/left_menu.php');?>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
<section class="wrapper">

<div class="row">
<div class="col-lg-12">
	<!--breadcrumbs start -->
	<section class="panel">
		<header class="panel-heading">
			<h3><?=$viewmode .' '.$form?></h3>
			<!--<div class="text-center">Owner : <strong><?=$user_name?></strong></div>-->
		</header>	
		<div class="">
			<ul class="breadcrumb">
				<li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="<?=ROOT.'quotation_list'?>"><?=$form?> List</a></li>
			</ul>
		</div>
	</section>
	<!--breadcrumbs end -->
</div>	
</div>
<!--state overview start-->
<div class="row">			
<div class="col-md-12">
<section class="panel">
<header class="panel-heading">
	New <?=$form?>
</header>	
<div class="panel-body">
	<form class="form-horizontal" role="form" id="quotation_add" action="javascript:;" method="post" name="quotation_add">
		<div class="row">
			<div class="clearfix"></div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="col-md-3 control-label">Quotation No*</label>
					<div class="col-md-6">
						<input id="quotation_no" name="quotation_no" type="text" class="form-control" title="Enter Quotation No" value="<?=$rel['quotation_no']?>" placeholder="Quotation No" readonly >		
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label class="col-md-3 control-label">Quotation Date*</label>
					<div class="col-md-6"> 
						<input id="quotation_date" name="quotation_date" type="text" class="form-control default-date-picker reuired valid" title="Date" value="<?=$quotation_date?>" placeholder="Quotation Date">
					</div>
				</div>	
			</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Customer*</label>
				<div class="col-md-6"> 
					<select class="select2" id="cust_id" name="cust_id" onchange="load_cust_person(this.value);load_cust_inq(this.value);">
						<?=getcust($dbcon,$cust_id)?>
					</select>
				</div>
			</div>	
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Contact Person*</label>
				<div class="col-md-6"> 
					<select class="select2" id="c_con_id" name="c_con_id">
						<?=get_cust_contactperson($dbcon,$c_con_id,$cust_id);?>
					</select>
				</div>
				<div class="col-md-1">
					<button type="button" id="addcustper" onclick="open_cust_contact()" class="btn btn-primary"><i class="fa fa-plus"></i></button>
				</div>
			</div>	
		</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Inquiry*</label>
				<div class="col-md-6"> 
					<select class="select2" id="inquiry_id" name="inquiry_id" onchange="load_inq_pro(this.value);">
						<?=get_cust_inq($dbcon,$inquiry_id,$cust_id);?>
					</select>
				</div>
			</div>	
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Subject*</label>
				<div class="col-md-6"> 
					<input type="text" class="form-control" id="quot_subject" name="quot_subject" placeholder="Subject" value="<?=$quot_subject?>">
				</div>
			</div>	
		</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Quotation Type</label>
				<div class="col-md-6"> 
					<label class="col-md-5 col-sm-6" style="font-weight:bold;"><input type="radio" id="quot_type_domestic" name="quot_type" style="width: 15px;height: 15px;" <?if($mode=='Add'){?>onclick="load_typeswise_terms(this.value,'');"<?}?> value="0" <?=($quot_type!='1')?'checked':''?>> Domestic</label>
					<label class="col-md-6 col-sm-6 " style="font-weight:bold;"><input type="radio" id="quot_type_export" name="quot_type" style="width: 15px;height: 15px;" <?if($mode=='Add'){?>onclick="load_typeswise_terms(this.value,'');"<?}?> value="1" <?=($quot_type=='1')?'checked':''?>> Export</label>
				</div>
			</div>	
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Valid Till</label>
				<div class="col-md-6"> 
					<input id="quotation_valid_date" name="quotation_valid_date" type="text" class="form-control default-date-picker  valid" title="Date" value="<?=$quotation_valid_date?>" placeholder="Quotation Date">
				</div>
			</div>	
		</div>
	<div class="clearfix"></div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Reference</label>
				<div class="col-md-6"> 
					<input type="text" id="quotation_ref" name="quotation_ref" class="form-control" title="Reference" value="<?=$rel['quotation_ref']?>" placeholder="Reference">
				</div>
			</div>	
		</div>
		<div class="col-md-6">
			<div class="form-group">
				<label class="col-md-3 control-label">Currency</label>
				<div class="col-md-6"> 
					<select class="select2" id="currency_id" name="currency_id">
						<?=get_org_currency($dbcon,$rel['currency_id'])?>
					</select>
				</div>
			</div>	
		</div>
	<div class="clearfix"></div>
	<hr/>
	<div class="col-md-12">
		<div class="form-group" style="margin-top:20px;overflow-x:scroll;">
			<table class="display table table-bordered table-striped">
			  <thead>
				<tr>
					<th width="25%" class="text-center">Product Name</th>
					<!--<th width="5%" class="text-center">Level</th>-->
					<th width="" class="text-center">Quantity</th>
					<th width="" class="text-center">Rate</th>
					<th width="" class="text-center">Unit</th>
					<th width="" class="text-center">Discount</th>
					<th width="" class="text-center">Taxable Value</th>
					<th width="" class="text-center">Tax</th>
					<th width="" class="text-center">Amount</th>
					<th width="2%" class="text-center">Action</th>					  
				</tr>
			  </thead>
			  <tbody>
				<tr>
					<td>
						<select class="select2" id="product_id" name="product_id" onchange="load_product_dtls(this.value);">
							<?=getproduct($dbcon,"");?>
						</select>
					</td>
					<!--<td>
						<select class="select2" id="level_id" name="level_id">
							<!--<option value="">Choose Level</option>--
							<option value="1">Level 1</option>
						</select>
					</td>-->
					<td>
						<input type="number" min="0" class="form-control" id="product_qty" name="product_qty" onkeyup="get_amount();get_discount('per');" value="">
					</td>
					<td>
						<input type="number" min="0" class="form-control" id="product_rate" name="product_rate" onkeyup="get_amount();get_discount('per');" value="">
					</td>
					<td>
						<select class="select2" name="unitid" id="unitid" title="Select Unit">
							<?=getunit($dbcon,0);?>
						</select>
					</td>
					<td>
						<input type="number" title="Enter Discount (In value)" min="0" id="product_discount" name="product_discount" onkeyup="get_discount('amt');" class="form-control" placeholder="in value"/>
					</td>
					<td>
						<input type="number" min="0" class="form-control" id="product_amount" name="product_amount" value="" readonly>
					</td>
					<td>
						<select class="form-control" name="formulaid" id="formulaid" onChange="get_amount();">
								<?=getformula($dbcon,$rel['formulaid']);?>
						</select>
					</td>
					<td>
						<input type="number" min="0" class="form-control" id="product_total" name="product_total" value="" readonly>
					</td>
					<td rowspan="2" style="vertical-align:middle;">
						<input type="hidden" id="edit_id" name="edit_id" value="">
						<button type="button" class="btn btn-primary" id="quot_trn_btn" onclick="add_field()">Add</button>
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="form-control" id="product_desc" name="product_desc" placeholder="Enter Product Description" style="resize:both;"></textarea>
					</td>
					<td colspan="3">
						<textarea class="form-control" id="product_spec" name="product_spec" placeholder="Enter Specification" style="resize:both;"></textarea>
					</td>
					<td>
						<input type="number"  title="Enter Discount (In %)" min="0" id="discount_per" name="discount_per" onkeyup="get_discount('per');" class="form-control" placeholder="in %" max="100"/>
					</td>
					<td><strong>Budget Total:</strong><br/><span id="bud_ttl_span"></span></td>
					<td></td>
					<td>
						<strong>Extra At Actual :</strong>
						<input type="checkbox" class="form-control" id="act_amt_flag" name="act_amt_flag" value="1">
					</td>
				</tr>
			  </tbody>
			</table>
		</div>
		<div class="form-group" id="quot_trn_div" style="margin-top:20px;overflow-x:scroll;"></div>
	</div>
	<div class="clearfix"></div>
	<div class="col-md-6"></div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-4 control-label">Grand Total</label>
			<div class="col-md-8">  
				<input type="number" min="0" id="g_total" name="g_total" class="form-control" value="<?=$rel['g_total']?>" readonly>
			</div>
		</div>	
	</div>
	<hr/>
	<div class="clearfix"></div>
<!--tab start--> 
<div class="col-md-12">
	<div class="card">
		<ul class="nav nav-tabs" id="my_tab_id" role="tablist"> 
			<li role="presentation" id="tab1" class="active"><a href="#remark-section" aria-controls="remark-section" role="tab" data-toggle="tab">Remark</a></li>
			<li role="presentation" id="tab2"><a href="#terms-section" aria-controls="terms-section" role="tab" data-toggle="tab">Terms And Condition</a></li>
			<li role="presentation" id="tab3"><a href="#annexure-section" aria-controls="annexure-section" role="tab" data-toggle="tab">Annexure</a></li>
			<li role="presentation" id="tab5"><a href="#dfd-section" aria-controls="dfd-section" role="tab" data-toggle="tab">Annex DFD</a></li>
			<li role="presentation" id="tab4"><a href="#address-section" aria-controls="address-section" role="tab" data-toggle="tab">Address</a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content"> 
			<!-- Remaks Tab Start -->
			<div role="tabpanel" class="tab-pane active" id="remark-section">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-12 control-label text-left" style="text-align:left;font-weight:bold;">Description</label>
						<div class="col-md-12">
							<textarea id="quot_remark" name="quot_remark" class="form-control" rows="3" style="resize:both;"><?=$rel['quot_remark']?></textarea> 
						</div>
					</div> 
				</div>
			</div>
			<!-- Terms Tab Start -->
			<div role="tabpanel" class="tab-pane" id="terms-section">
				<div class="form-group" style="margin-top:20px;" id="quot_terms_cond_div">
					
				</div>  
			</div>
			<!-- Annexure Tab Start -->
			<div role="tabpanel" class="tab-pane" id="annexure-section">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-4 control-label text-left">Choose Annexure</label>
						<div class="col-md-4">
							<select class="select2" id="an_id" name="an_id" onchange="load_annex_content(this.value);">
								<?=get_annexure_types($dbcon,$rel['an_id']);?>
							</select>
						</div>
					</div> 
				</div> 
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-12 control-label text-center" style="text-align:left;font-weight:bold;">Annexure Content</label>
						<div class="col-md-12">
							<textarea id="quot_annex_content" name="quot_annex_content" class="form-control"><?=$rel['quot_annex_content']?></textarea>
						</div>
					</div> 
				</div> 
			</div>
			<!-- DFD Tab Start -->
			<div role="tabpanel" class="tab-pane" id="dfd-section">
				<div class="col-md-8 col-md-offset-2">
					<div class="form-group" style="margin-top:20px;">
						<table class="display table table-bordered table-striped">
						  <thead>
							<tr>
								<th width="50%" class="text-center">Upload Image</th>
								<th width="10%" class="text-center">Action</th>					  
							</tr>
						  </thead>
						  <tbody>
							<tr>
								<td>
									<input type="file" class="form-control" id="dfd_attch_file" name="dfd_attch_file" accept="image/*">
								</td>
								<td>
									<button type="button" class="btn btn-primary" id="dfd_attch_btn" onclick="add_dfd_attch_field()">Add</button>
								</td>
							</tr>
						  </tbody>
						</table>
					</div> 
					<div class="form-group" style="margin-top:20px;" id="dfd_attch_trn_div"></div> 
				</div> 
			</div>
			<!-- Address Tab Start -->
			<div role="tabpanel" class="tab-pane" id="address-section">
				<div class="col-md-12 text-center">
					<div class="form-group">
						<div class="col-md-12">
							<button type="button" class="btn btn-primary" onclick="view_cust_address()">View Address</button>
						</div>
					</div> 
				</div> 
				<div class="col-md-12">
					<div class="form-group">
						<div class="col-md-12">
							<textarea id="quot_address" name="quot_address" class="form-control" placeholder="Enter Address" style="resize:both;" rows="4"><?=$rel['quot_address']?></textarea>
						</div>
					</div> 
				</div> 
			</div>
		</div>
	</div>      		
</div>      		
<!--tabs end-->	
	<div class="clearfix"></div>
	<hr/>	
		</div>
		<div class="clearfix"></div>
		<div class="col-md-12 text-center">
			<button type="submit" class="btn btn-success" id="save" name="save">Save</button>
			<a href="<?=ROOT.'quotation_list'?>" type="button" class="btn btn-danger">Cancel</a>	
		</div>	
	</div>
</div><!--Vendor row end-->	
<input type='hidden' name='mode' id='mode' value='<?=$mode?>' />
<input type='hidden' name='eid' id='eid' value='<?=$quotation_id?>' />
<input type='hidden' name='revise_status' id='revise_status' value='<?=$revise_status?>' />
<input type='hidden' name='start_quotation_id' id='start_quotation_id' value='<?=$start_quotation_id?>' />
<input type='hidden' name='prev_quotation_id' id='prev_quotation_id' value='<?=$prev_quotation_id?>' />

</form>
</div>	
</section>
</div>
</div>
<!--state overview end-->
</section>
</section>
<!--main content end-->
<!--footer start-->

	<?php include_once('../include/add_person.php');?>
	<?php include_once('../include/preview_cust_address.php');?>
	<?php include_once('../include/footer.php');?>
	<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
<script>
var formSubmitting = false;
var setFormSubmitting = function() { formSubmitting = true; };
window.onload = function() {
    window.addEventListener("beforeunload", function (e) {
        if (formSubmitting) {
            return undefined;
        }

        var confirmationMessage = 'You sure you want to leave? ';

        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
        return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
    });
};
</script>
<script src="<?=ROOT?>js/app/quotation.js?<?=time()?>"></script>
<script src="<?=ROOT?>js/app/customer.js?<?=time()?>"></script>
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
<?if($mode=='Edit'){?>
	$('#cust_id').select2('readonly',true);
	$('#c_con_id').select2('readonly',true);
	$('#inquiry_id').select2('readonly',true);
	//Disable not selected Radio Button
	$(':radio:not(:checked)').attr('disabled', true);
	load_typeswise_terms(<?=$quot_type?>,<?=$quotation_id?>);
<?}
else{?>
	load_typeswise_terms(<?=$quot_type?>,'');
<?}?>
<?if($prev_quotation_id){?>
	copy_prev_quot_trn(<?=$prev_quotation_id?>);
<?}?>
/*$(function() { 
	$('#quotation_date').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
	<?if($mode=='Add')
	{?>
	,startDate: 'd'//don't allow today and past dates
	<?}?>
	});
});*/
CKEDITOR.replace( 'quot_annex_content', {
	enterMode: CKEDITOR.ENTER_BR
});
$(function(){
	setTimeout(function(){ $('#sidebar > ul').hide(); }, 1000);
});
</script>
</body>
</html>