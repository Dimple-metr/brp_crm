<?php 

	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$_SESSION['contents']=''; 
	$form="Sales Order";
	$mode="Print";
	$sales_order_id=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select po.*,ven.cust_name,quot.quotation_no from tbl_sales_order as po 
		inner join tbl_customer as ven on ven.cust_id=po.cust_id
		left join tbl_quotation as quot on quot.quotation_id=po.quotation_id
		where po.sales_order_id=$sales_order_id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
		$_SESSION['invoice_no']=$rel['sales_order_no'];		
		
		$set="select comp.*,state.state_name,state.gst_state_code from tbl_company as comp left join state_mst as state on comp.stateid=state.stateid where company_id=".$rel['company_id'];
		$set_head=mysqli_fetch_assoc($dbcon->query($set));	
		$so_ref_date='';$delivery_date='';
		if($rel['so_ref_date']!="1970-01-01" && $rel['so_ref_date']!="0000-00-00"){
			$so_ref_date=date('d-m-Y',strtotime($rel['so_ref_date']));
		}
		
 
	/* Check Discount is On or off Start */
	if($set_head['show_disc']=='1'){
		$colspan=5;
		$dynamicwidth=40;
	}else{
		$colspan=6;
		$dynamicwidth=46;
	}
	/* Check Discount is On or off End */
	
	//Get State/International Tax Types
	$tax_types_qry="select sum(tax_amount2) as tax2_amt from tbl_sales_order_trn where so_trn_status=0 and sales_order_id=".$rel['sales_order_id'];
	$tax_types_rel=mysqli_fetch_assoc($dbcon->query($tax_types_qry));
	if(floatval($tax_types_rel['tax2_amt'])){
		$tax_types=1;//CGST+SGST
	}
	else{
		$tax_types=2;//IGST
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
<style>
body {
    color: #000000;
}
.con ul {
	padding-left:0px;
}
.con ul li  {
	margin-left:22px;
	list-style: disc !important;
}
td, th {
    padding: 0px 5px !important;
}
</style>
</head>
<body>
<section id="container" >
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
						  <h3><?=$mode.' '.$form?></h3>
						</header>	
						<div class="">
							<ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li ><a href="<?=ROOT.'sales_order_list'?>"><?=$form?> List</a></li>
							</ul>
						</div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
            </div>
              <!--state overview start-->
	<div class="row">			
		<div class="col-sm-12">
			<section class="panel">
				  	
		<div class="panel-body">
	<!--<center>-->
			<div class="col-md-4"> </div>With Logo
						<br/>
				<label class="col-md-4 control-label"> </label>
				<div class="col-md-1" style="">
					<input type="checkbox" class="form-control"  name="logo" id="logo" value="1">
				</div>
			<div class="col-md-4">
				<button type="submit" class="btn btn-success" onClick="PrintMe('receipt_print');"><i class="fa fa-print"></i> Print</button> 
			
				<a href="<?=ROOT.'sales_order_list'?>" type="button" class="btn btn-danger"><i class="fa fa-ban"></i> Cancel</a>
				<!--<input type="button" name="printpdf" id="printpdf" class="btn btn-default" value="Export to Pdf" onClick="make_pdf()" />-->
			</div>
<!--</center>-->	
				
			<div class="col-md-12"></div>
				<label class="col-md-3 control-label"></label>
			<div class="col-lg-4">
			</div>
<input type="hidden" name="typename" id="typename" value="<?=$rel['invoice_type']?>">
	<?php ob_start(); ?>
	<div class="col-lg-12 table-responsive" id="receipt_print">
	<div class="col-md-12" style="margin-top:10px;" id="print1">
	<!-- Fixed Logo Table Start -->
	<table width="100%" class="maintable" border="0" style="" id="table_head">
		<tr>
			<td width="100%" style="border:none;padding:0px 0px !important;"> 
				<img src="<?=ROOT.LOGO.$set_head['h_logo']?>" style="width:100%" />
			</td>
		</tr>
	</table>
	<!-- Fixed Logo Table End -->
	<!-- Multipage Table Start -->	
	<table width="100%" class="maintable" style="font-size: 12px;margin-top: 5px;" id="invoice_type" >
	<thead>
		<tr>
			<th colspan="11" style="padding:0px !important;">
				<table style="font-size:12px;border-collapse: collapse;border-top:none;" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td colspan="3" style="text-align:center;width:100%;"> 
								<strong style="font-size:14px;">
									<?=$form?>
								</strong>
							</td>
						</tr>
						<tr>
							<td rowspan="5" width="50%" style="vertical-align:top;border:1px solid;">
							<b>From, </b><br/>
							<strong><?=$rel['cust_name']?></strong>
							<br/>
							<!--<span style="font-weight:normal;"><?=nl2br($rel['po_ven_address'])?></span>-->
								<br/><strong><?if(!empty($typ_lbl)){?>
									<?=$typ_lbl?> : 
								<?}?> <?=$rel['gst_no']?></strong>
							</td>
							<td style="vertical-align:top;border:1px solid;border-right:none;">Sales Order No 
							</td>
							<td style="vertical-align:top;border:1px solid;border-left:none;"> : <strong><?=$rel['sales_order_no']?></strong>
							</td>
						</tr> 
						<tr>
							<td style="vertical-align:top;border:1px solid;border-right:none;">Sales Order Date 
							</td>
							<td style="vertical-align:top;border:1px solid;border-left:none;"> : <strong><?=date('d-m-Y',strtotime($rel['sales_order_date']))?></strong>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;border:1px solid;border-right:none;">Ref No.
							</td>
							<td style="vertical-align:top;border:1px solid;border-left:none;"> : <strong><?=$rel['so_ref_no']?></strong>
								</td>
						</tr>
						<tr>
							<td style="vertical-align:top;border:1px solid;border-right:none;">Ref Date
							</td>
							<td style="vertical-align:top;border:1px solid;border-left:none;"> : <strong><?=$so_ref_date?></strong>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;border:1px solid;border-right:none;">Quotation No.
							</td>
							<td style="vertical-align:top;border:1px solid;border-left:none;"> : <strong><?=$rel['quotation_no']?></strong>
							</td>
						</tr>
					
				</table>
			
			
			</th>
		</tr>
		<tr>
			<th width="3%" style="text-align:center;border:1px solid;border-top: none;"><strong>Sr.<br/> No.</strong></th>
			<th width="<?=$dynamicwidth?>%" style="text-align:center;border:1px solid;border-top: none;" colspan="2">
				<strong>Particulars </strong>
			</th>
			<th width="8%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>HSN/SAC <br/>Code</strong>
			</th>
			<th width="7%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>QTY.</strong>
			</th>
			<th width="7%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Rate</strong>
			</th>
			<? /*if($set_head['show_disc']=='1'){ */?>
			<th width="6%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Less:<br/>Disc.</strong>
			</th>
			<?/*}*/?>
			<th width="9%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Taxable<br/>Value</strong>
			</th>
			<th width="4%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Tax</strong>
			</th>
			<th width="6%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Tax Amount</strong>
			</th>
			<th width="10%" style="text-align:center;border:1px solid;border-top: none;">
				<strong>Total</strong>
			</th>
		</tr>
	</thead>
	<tbody style="border: 1px solid;">
		<? 
			$qry="select trn.*,product.product_name,product.product_hsn,unit_name,group_concat(tax.tax_value) as tax_val,group_concat(tax.tax_name) as tax_name FROM `tbl_sales_order_trn` as trn 
			left join tbl_product as product on product.product_id=trn.product_id 
			left join unit_mst as per on per.unitid=trn.unitid 
			left join `formula_mst` as ftax on ftax.formulaid=trn.formulaid left join tbl_tax as tax on find_in_set(tax.tax_id,ftax.tax_id)
			where so_trn_status=0 and sales_order_id=".$rel['sales_order_id']." group by so_trn_id order by so_trn_id";
			$result=$dbcon->query($qry);		
			$i=1;$total=0;$discount=0;$totalqty=0;
			$cnt=mysqli_num_rows($result);
			while($row=mysqli_fetch_assoc($result))
			{
				$tax_arr=explode(",",$row['tax_val']);
				//tax summary calculation start
				if(!empty($row['tax_val']))
				{
					$tax_num=explode(",",$row['tax_val']);
					$tax_name=explode(",",$row['tax_name']);
					$total_net_rate=($row['product_qty']*$row['product_rate'])-$row['discount'];
					for($j=0;$j<count($tax_num);$j++)
					{
						if(!in_array($tax_name[$j],$tax['per']))
						{
							$tax['per'][]=$tax_name[$j];
						}
						$tax['per_total'][$tax_name[$j]]+=$total_net_rate*$tax_num[$j]/100;
					}
				}
				//tax summary calculation end
		?>
		<tr style="height:40px">
					<td style="text-align:center;vertical-align:top;border-right:1px solid;border-left:1px solid;">
						<?=$i?>
					</td>
					<td style="border-bottom-color:#FFFFFF; border-right:1px solid;vertical-align:top;" colspan="2">
						<strong><?=stripcslashes($row['product_name'])?></strong>
						<br/><?=nl2br($row['product_desc']);?> 
					</td>
					<td style="border-bottom-color:#FFFFFF;border-right:1px solid;vertical-align:top;text-align:center">
						<?=stripcslashes($row['product_hsn'])?>
					</td>
					<td style="text-align:center;vertical-align:top;border-bottom-color:#FFFFFF; border-right:1px solid;white-space:nowrap;" >
						<?=$row['product_qty'].' '.$row['unit_name']?>
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF; border-right:1px solid;" >
						<?=$row['product_rate'];?>
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF;border-right:1px solid;">
						<?=number_format($row['discount_per'],2,".","").'%'?>
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF;border-right:1px solid;">
						<?=number_format($row['product_amount'],2,".","")?>
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF;border-right:1px solid;">
						<?=$tax_arr[0]+$tax_arr[1]?>%
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF;border-right:1px solid;">
						<?=number_format($row['tax_amount1']+$row['tax_amount2'],2,".","")?>
					</td>
					<td style="text-align:right;vertical-align:top;border-bottom-color:#FFFFFF;border-right:1px solid;">
						<?=number_format($row['product_total'],2,".","")?>
					</td>
				</tr>
		
		<? 
			$i++; 
				$totalqty=$totalqty+$row['product_qty'];
				$totaltaxable+=$row['product_amount'];
				$totaltax1+=$row['tax_amount1'];
				$totaltax2+=$row['tax_amount2'];
				$total+=$row['product_total'];
		}
			$pr=8-$cnt;
			for($j=0; $j<$pr; $j++)
			{
		?>	
			<tr style="height:45px">
					<td style="border-right:1px solid;border-left:1px solid;"></td>
					<td style="border-right:1px solid;" colspan="2"></td>
					<td style="border-right:1px solid;"></td>
					<? /*if($set_head['show_disc']=='1'){*/?>
					<td style="border-right:1px solid;"></td>
					<?/*}*/?>
					<td style="border-right:1px solid;"></td>
					<td style="border-right:1px solid;"></Td>
					<td style="border-right:1px solid;"></td>
					<td style="border-right:1px solid;"></td>
					<td style="border-right:1px solid;"></td>
					<td style="border-right:1px solid;"></td>
			</tr>
			
		<?  } ?>
			<tr style="height:20px">
				<td style="border-top:1px solid;border-right:1px solid;border-left:1px solid; text-align:right;" colspan="4"><strong>Total</strong></td>
				
				<td style="text-align:center;border-top:1px solid;border-right:1px solid;"><strong><?=number_format($totalqty,2,".","")?></strong></td>
				<!--<td style="text-align:center;border-top:1px solid;border-right:1px solid;"><strong><?=number_format($totalsqr,2,".","")?></strong></td>-->
				<? /*if($set_head['show_disc']=='1'){*/?>
				<td style="border-top:1px solid;border-right:1px solid;"></td>
				<?/*}*/?>
				<td style="border-top:1px solid;border-right:1px solid;"></td>
				<td style="border-top:1px solid;border-right:1px solid;text-align:right;"><strong><?=number_format($totaltaxable,2,".","")?></strong></td>
				<td style="border-top:1px solid;border-right:1px solid;text-align:right;"></td>
				<td style="border-top:1px solid;border-right:1px solid;text-align:right;"><strong><?=number_format($totaltax1+$totaltax2,2,".","")?></strong></td>
				
				<td style="border-top:1px solid;border-right:1px solid;text-align:right;"><strong><?=number_format($total,2,".","")?></strong></td>
							
			</tr>		
			<tr>
				<td colspan="11" style="padding: 0px !important;border:1px solid">
				<table class="footer-table" width="100%">
					<tr width="61.6%" height="20px">
							<td style="border-right:1px solid;" colspan="<?=$colspan?>">
							<? if($rel['remark']){ ?>
								Remark : <?=nl2br($rel['remark'])?>
							<?}?>
							</td>
						<td width="28.9%" colspan="3" style="border-right:1px solid;text-align:left">
							Basic Price
						</td>
						<td colspan="2" style="text-align:right;" width="10%"><?=number_format($totaltaxable,2,".","")?></td>	
					</tr>
					
					<tr height="20px">
						<td style="border-right:1px solid;border-top:1px solid;" colspan="<?=$colspan?>"></td>
						<td colspan="3" style="border-top:1px solid;border-right:1px solid;text-align:left;">
							<?=(($tax_types=='1')?'Add :  CGST':'Add :  IGST');?>
						</td>
						<td colspan="2" style="text-align:right; border-top:1px solid;border-right:1px solid; ">
							<?=number_format($totaltax1,2,".","")?>
						</td>
					</tr>
					
				<? 	if($tax_types=='1') { ?>
					<tr height="20px">
						<td style="border-right:1px solid;border-top:1px solid;" colspan="<?=$colspan?>"></td>
						<td colspan="3" style="border-top:1px solid;border-right:1px solid;text-align:left">Add : SGST</td>
						<td colspan="2" style="text-align:right; border-top:1px solid;border-right:1px solid; ">
							<?=number_format($totaltax2,2,".","")?>
						</td>
					</tr>
				<? 	}
					$totaltax=$totaltax1+$totaltax2;
				?>
		 
				<? $r=round($total)-$total; ?>
					<tr height="20px">
						<td style="border-right:1px solid;border-top:1px solid;" colspan="<?=$colspan?>">
							<strong>COMPANY GST No. : <?=$set_head['comp_gst']?> </strong><br>
						</td>
						<td colspan="3" style="border-top:1px solid;border-right:1px solid;text-align:left">Round off</td>
						<td colspan="2" style="text-align:right; border-top:1px solid;border-right:1px solid; "> <?=number_format($r+$rel['round_off'],2,".","")?></td>
					</tr>
					
					<tr height="20px">
						<td style="border-right:1px solid;border-top:1px solid;" colspan="<?=$colspan?>">
							<strong>In Words:</strong> <?=ucwords(convert_number_to_words($rel['g_total']))?>		
						</td>
						<td colspan="3" style="border-top:1px solid;border-right:1px solid;text-align:left"><strong>Grand Total</strong> </td>
						<td colspan="2" style="text-align:right; border-top:1px solid;font-size:13px;border-right:1px solid; ">
							<strong><?=number_format($rel['g_total'],2,".","");?></strong>
						</td>
					</tr>
					<tr>
						<td colspan="<?=$colspan?>" style="vertical-align:top;font-size:10px;text-align:left;border-top:1px solid;" class="con">
					
						</td>
						<td colspan="5" style="vertical-align:top;border-top:1px solid;">
							<center>
								For, <strong style="font-size:11px;"> <?=$set_head['company_name']?></strong>
							</center>
						 <br><br><br><br>
						 <center style="vertical-align:bottom;">Authorised Signatory</center>
						</td>
					</tr>
				</table>
					</td>
			</tr>		
	</tbody>
	</table>
	<!-- Multipage Table End -->	
	<!-- Image Print in PO Start -->	
	<!--<center><span style="float:left;">E.& O. E.</span>This is a Computer Generated Invoice</center>-->
							</div>
								<div id="print2" style="margin-top:0in;"></div>
								<div id="print3" style="margin-top:0in;"></div>
						
</div>
	<?php  
			$contents = ob_get_contents();
			$_SESSION['contents']=$contents;
			$_SESSION['file_name']='invoice-#';
			$_SESSION['page_size']='A4';
			echo "<script> function make_pdf()
			{ window.open('".ROOT."export/print','_blank');
			}</script>";  
	?>
		</div>	
					</section>
				</div>
			  </div>
			  <!--state overview end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
</section>

    <!-- js placed at the end of the document so the pages load faster -->
<?php include_once('../include/include_js_file.php');?>   
    
<script type="text/javascript"> 

function PrintMe(DivID) {

  //var duplicate = $("#receipt_data").clone().appendTo("#receipt_duplicate");
  var disp_setting="toolbar=yes,location=no,";
  disp_setting+="directories=yes,menubar=yes,";
  disp_setting+="scrollbars=yes,width=800, height=600, left=100, top=25";
  var content_vlue = document.getElementById(DivID).innerHTML;
  var docprint=window.open("","",disp_setting);
  docprint.document.open();
  docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
  docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
  docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
  docprint.document.write('<head><title><? echo TITLE;?></title>');
  docprint.document.write('<link rel="stylesheet" href="<?php echo ROOT;?>css/style.css" media="all"/>');
  docprint.document.write('<link rel="stylesheet" href="<?php echo ROOT;?>css/bootstrap.min.css" media="all"/>');
  docprint.document.write('<style type="text/css">');
	if ($('input[name=logo]:Checked').val() == "1") {
		$('#table_head').show();
		$('#table_foot').show();
		docprint.document.write(' @media print{ @page { size:A4; margin: 0.2in <?=$set_head['letter_head_right_margin']?>in 0.2in <?=$set_head['letter_head_left_margin']?>in; } }   ');
		
	}
	else {
		docprint.document.write(' @media print{ @page { size:A4; margin: <?=$set_head['letter_head_top_margin']?>in <?=$set_head['letter_head_right_margin']?>in <?=$set_head['letter_head_bottom_margin']?>in <?=$set_head['letter_head_left_margin']?>in; }  }  #table_head, #table_foot { display:none }');
		//$('#invoice_type').css('margin-top','1.7in');	
	}
 
  docprint.document.write('body { font-family:Tahoma;color:#000;');
  docprint.document.write('font-family:Tahoma,Verdana; font-size:10px;} .dataTables_length, .dataTables_filter , .dataTables_paginate { display:none; }');
  docprint.document.write('a{color:#000;text-decoration:none;} h1 {font-size:25px; line-height:5px;} b { font-weight:normal; } div.page { page-break-after: always; page-break-inside: avoid; } tr { page-break-inside: avoid } .maintable tbody tr { border-bottom:0.5px #ccc solid; }');
  docprint.document.write(' .maintable table { page-break-inside:auto } .maintable tr{ page-break-inside:avoid; page-break-after:auto } .maintable thead { display:table-header-group }  .maintable tfoot tr{ /*display:table-footer-group;*/ page-break-inside:avoid; page-break-before:always; } footer-table{ page-break-inside:avoid; page-break-before:always;  } #table_foot{position:fixed;bottom:0}</style>');
  docprint.document.write('</head><body onLoad="self.print()">');
  docprint.document.write(content_vlue);
  docprint.document.write('</body></html>');
  docprint.document.close();
  docprint.focus();
	$('#table_head').show();
	//$('#invoice_type').css('margin-top','0px');

  location.reload();
}
</script>
</body>
</html>