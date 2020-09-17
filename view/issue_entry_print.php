<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");
	include_once("../include/coman_function.php");
	$_SESSION['contents']='';
	$form="Issue Entry";
	$mode="Print";
	$issue_entry_id=$dbcon->real_escape_string($_REQUEST['id']);
	$query="select invoice.* from tbl_issue_entry as invoice where issue_entry_id=$issue_entry_id";
	$rel=mysqli_fetch_assoc($dbcon->query($query));	
	
	$set="select comp.* from tbl_company as comp where company_id=".$rel['company_id'];
	$set_head=mysqli_fetch_assoc($dbcon->query($set));	
?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>
<style>
body {
    color: #000000;
}
.con ul 
{
	padding-left:0px;
}
.con ul li 
{
	margin-left:22px;
	list-style: disc !important;
}
/*td, th {
    padding: 0px 2px !important;
}*/
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
							  <li><a href="<?=ROOT.'issue_entry_list'?>"><?=$form?> List</a></li>
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
					<header class="panel-heading">
					  <?=$form?> <?=$mode?>
					</header>	
		<div class="panel-body">
		<center>
			<div class="col-md-1"> </div>
					<br/>
					
				<!--<label class="col-md-2 control-label"> Print</label>
				<div class="col-md-4 col-xs-11">
				 <form class="form-horizontal" role="form" id="print_form" action="javascript:;" method="post" name="print_form">
					<select class="form-control" name="print_status" id="print_status" <?if($_REQUEST['printstatus']!=''){ echo "readonly";}?>>
						<option value="">Select Print</option>
						<option value="1">ORIGINAL</option>
						<option value="2">DUPLICATE</option>
						<option value="3">TRIPLICATE</option>
						<option value="4">EXTRA</option>
					</select>
				 </form>
				</div>-->
				<div class="col-md-2"></div>
				<div class="col-md-3">With Logo
					<input type="checkbox" class="form-control"  name="logo" id="logo" value="1">
				</div>
				<div class="col-md-4 text-left">
					<button type="submit" class="btn btn-success" onClick="PrintMe('receipt_print');"><i class="fa fa-print"></i> Print</button>
					<a href="<?=ROOT.'issue_entry_list'?>" type="button" class="btn btn-danger"><i class="fa fa-ban"></i> Cancel</a>
					<!--<input type="button" name="printpdf" id="printpdf" class="btn btn-default" value="Export to Pdf" onClick="make_pdf()" />-->
				</div>
		</center>	
			<div class="col-md-12"></div>
				<label class="col-md-3 control-label"></label>
					<div class="col-lg-4"></div>
					<?php ob_start(); ?>
							<div class="col-lg-12 table-responsive" id="receipt_print">	<div class="col-md-12" style=" margin-top:10px;" id="print1">
							
				<table width="100%" border="0" style="" id="table_head">
					<tr>
						<td width="100%" style="border:none;padding:0px 0px !important;"> 
							<img src="<?=ROOT.LOGO.$set_head['h_logo']?>" style="width:100%"/>
						</td>
					</tr>
				</table>
						<table width="100%" border="0" style="" id="">
							<tr>
								<td width="90%" style="text-align:center"> 
									<strong style="font-size:16px">
										<?=$form?> 
									</strong>
								</td>
								<td width="10%" style="text-align:center"> 
									<!--<strong style="font-size:12px">
										<b class="data_title">ORIGINAL</b>
									</strong>-->
								</td>
							</tr>
						</table>
<!-- Multi Page Challan Start -->				
<table width="100%" class="maintable" style="font-size: 12px;" id="invoice_type" >
	<thead>
		<tr>
			<th colspan="5" style="padding:0px !important;">
				<table  border="0" style="font-size:12px;border-collapse:collapse;" cellpadding="0"  cellspacing="0" width="100%" id="">
					<!--<thead>-->
						<tr>
							<td width="10%" style="vertical-align:top;border:1px solid;border-right:none;"><strong>Issue Entry No </strong>
							</td>
							 
							<td style="vertical-align:top;border-bottom:1px solid;border-top:1px solid;border-right:1px solid;">: <strong> <?=$rel['issue_entry_no']?></strong>
							</td>
							<td rowspan="2" width="55%" style="vertical-align:top;border:1px solid;padding-bottom:0px !important;">
							Remark,<br>
								<span style="font-weight:normal;"><?=nl2br($rel['remark'])?></span>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;border:1px solid;border-right:none;white-space:nowrap;">
								<strong>Issue Entry Date</strong>
							</td>
							<td style="vertical-align:top;border-bottom:1px solid;border-right:1px solid;">
								: <?=date('d/m/Y',strtotime($rel['issue_entry_date']))?>							
							</td>							
						</tr>
						
					<!--</thead>-->	
				</table>
			</th>
		</tr>
		<tr height="30px">					
			<th  width="5%" style="text-align:center;border:1px solid;border-top:none;">
				<strong>SR. NO.</strong>
			</th>
			<th width="55%"  style="text-align:center;border-right:1px solid; border-bottom:1px solid;border-top: none;" ><strong>Item Description</strong></th>
			<th width="17%" style="text-align:center;border-right:1px solid; border-bottom:1px solid;border-top: none;"><strong>Quantity</strong></th>
			<!--<th width="17%" style="text-align:center;border-right:1px solid; border-bottom:1px solid;border-top: none;"><strong>Sqr/Ft</strong></th>-->
			<!--<th width="15%" style="text-align:center;border-right:1px solid; border-bottom:1px solid;border-top: none;"><strong>HSN/SAC Code</strong></th>-->
			
		</tr>
	</thead>
	<tbody style="border: 1px solid;">
		<? 
			$qry="select trn.*,product.product_name,unit_name FROM `tbl_issue_entry_trn` as trn
			left join tbl_product as product on product.product_id=trn.product_id
			left join unit_mst as per on per.unitid=trn.unit_id 
			where issue_trn_status=0 and issue_entry_id=".$rel['issue_entry_id'];
			$result=$dbcon->query($qry);		
			$i=1;$total=0;$discount=0;$totalqty=0;
			$cnt=mysqli_num_rows($result);
			 while($row=mysqli_fetch_assoc($result))
			{
		?>
		<tr style="height:40px">
			<td style="text-align:center;vertical-align:top;border-right:1px solid;border-left:1px solid;">
				<?=$i?>
			</td>
			<td style="padding-left:5px;border-bottom-color:#FFFFFF; border-right:1px solid;vertical-align:top;" >
				<strong><?=stripcslashes($row['product_name'])?>
				<br/><?=nl2br(stripcslashes($row['description']));?> 
			</td>
			<td style="text-align:center;padding-right:10px;vertical-align:top;border-bottom-color:#FFFFFF; border-right:1px solid;" >
				<?=$row['product_qty'].' '.$row['unit_name']?>
			</td>
		</tr>
		<? 	
			$i++; 
			$totalqty=$totalqty+$row['product_qty'];
			}
			$pr=10-$cnt;
			for($j=0; $j<$pr; $j++)
			{
		?>
				<tr style="height:55px">
					<td style="border-right:1px solid;border-left:1px solid;"></td>
					<td style="border-right:1px solid;"></td>
					<td style="border-right:1px solid;"></td>
				</tr>
		<? } ?>
		<tr>
			<td colspan="3" style="text-align:center;border:1px solid; "></td>
		</tr>
		<!--<tr height="24px">
			<td colspan="2" style="border-top:1px solid;border-bottom:1px solid;border-right:1px solid;border-left:1px solid;font-size:14px;text-align:right;">TOTAL</td>
			<td style="text-align:center;border-bottom:1px solid; border-top:1px solid;font-size:14px;border-right:1px solid; "><?=number_format($totalqty,2,".","")?></td>
		</tr>	-->
		
		</table>
		
<!-- Multi Page Challan End -->	
	</div>
		<div id="print2"></div>
		<div id="print3"></div>
			
</div>
	<?php  
		$contents = ob_get_contents();
		$_SESSION['contents']=$contents;
		$_SESSION['file_name']='Challan-#';
		$_SESSION['page_size']='A5';
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
   <!--<script src="<?=ROOT?>js/app/issue_entry.js"></script>-->
   
<script>
$(".select2").select2({
	width: '100%'
});
$('.default-date-picker').datepicker({
	format: 'dd-mm-yyyy',
	autoclose: true
});
</script>
<script type="text/javascript"> 
function PrintMe(DivID) {

/*if($('#print_status').val()=='')
{
	alert('Select PrintType');
}
else
{*/


if($('#print_status').val()<=3)
{	
for(var i=1;i<$('#print_status').val();i++)
{	
	if($("#invoice").val()==2)
	{
		$("#print"+i+" .data_title").html('Performance');
		$("#type").html("Performance Invoice");
	}
	if($("#invoice").val()==1)
	{
		$("#print"+i+" .data_title").html('ORIGINAL');
		$("#type").html($("#typename").val());
	}
	if(i<$('#print_status').val())
	{
		$("#print"+i).after('<div class="page"></div>');
	}
	$("#print"+(i+1)).html($("#print1").clone());
	if((i+1)==2)
	{
		$("#print"+(i+1)+" .data_title").html('DUPLICATE');
	}
	if((i+1)==3)
	{
		$("#print"+(i+1)+" .data_title").html('TRIPLICATE');
	}
	
}
}
else
{
	$("#print1 .data_title").html('EXTRA');
}
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
		docprint.document.write('@media print{ @page { size:A4; margin: 0.2in <?=$set_head['letter_head_right_margin']?>in 0.2in <?=$set_head['letter_head_left_margin']?>in; } }   ');
	}
	else{
		docprint.document.write(' @media print{ @page { size:A4; margin: <?=$set_head['letter_head_top_margin']?>in <?=$set_head['letter_head_right_margin']?>in <?=$set_head['letter_head_bottom_margin']?>in <?=$set_head['letter_head_left_margin']?>in; } }  #table_head, #table_foot { display:none }');
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

  //}
  location.reload();
}
</script>


  </body>
</html>
