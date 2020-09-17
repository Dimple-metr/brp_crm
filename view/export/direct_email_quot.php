<?php 
//include("../config/config.php");
//error_reporting(E_ALL);
function email_quotation_pdf($quotation_id,$dbcon){
ob_start();
//Quotation Data
$query="select quot.*,per.c_con_fname,per.c_con_lname,per.c_con_mobile,per.c_con_email,cust.cust_name, cust.cust_email, cust.cust_mobile, inq.inquiry_no,inq.inquiry_date from tbl_quotation as quot
left join tbl_cust_contact as per on per.c_con_id=quot.c_con_id
left join tbl_customer as cust on cust.cust_id=quot.cust_id
left join tbl_inquiry as inq on inq.inquiry_id=quot.inquiry_id
where quot.quotation_id=".$quotation_id;
$rel=mysqli_fetch_assoc($dbcon->query($query));
//Company Data
$comp_qry="select comp.*,country.country_name,state.state_name,city.city_name from tbl_company as comp 
left join country_mst as country on country.countryid=comp.countryid
left join state_mst as state on state.stateid=comp.stateid
left join city_mst as city on city.cityid=comp.cityid
where comp.company_id=".$rel['company_id'];
$comp_rel=mysqli_fetch_assoc($dbcon->query($comp_qry));
$header ='<img src="'.DOMAIN_F.LOGO.$comp_rel["h_logo"].'" style="width:8.27in" />';  
//$footer='<img src="'.DOMAIN_F.LOGO.$comp_rel['f_logo'].'" style="padding-left:0px !important;width:8.27in"/>';

$approve_status='';
if($rel['approve_status']=='0'){
	$approve_status=' (DRAFT)';
}

$html ='<html>
		<head>					
			<title>Quotation - '.$rel['quotation_no'].'</title>
<style type="text/css">
/*
.page{
	width:8.27in;
	height:10.69in;
}*/
.nextpage
{
	page-break-after: always;
}
table{
    border-collapse:collapse;
    width:100%;
}

table tr,td{
border:1px solid #000 !important;
/*page-break-inside:avoid;*/
}
.quot_annex_content_div table tr,td{
	padding:5px;
}

</style>
</head>
<body>

<htmlpageheader name="otherpages" style="display:none">
    <div style="text-align:center">'.$header.'</div>
</htmlpageheader>
<!--<htmlpagefooter name="otherpages_footer" style="display:none">
    <div style="text-align:center">'.$footer.'</div>
</htmlpagefooter>-->
<sethtmlpageheader name="otherpages" value="on" show-this-page="0"/>
<div>
	<table style="font-size:12px;border-collapse: collapse;width:100%;" cellpadding="5" cellspacing="5">
		<tr>
			<td colspan="3" style="text-align:center;font-size:15px;font-weight:bold;"> 
				Quotation'.$approve_status.'
			</td>
		</tr>
		<tr>
			<td rowspan="5" style="text-align:left;vertical-align:top;border:1px solid;width:50%;"> 
				<strong>'.$comp_rel['company_name'].'</strong><br/>
				'.$comp_rel['comp_add1'].'<br/>
				'.$comp_rel['city_name'].', '.$comp_rel['state_name'].', '.$comp_rel['country_name'].'<br/>
				Phone No : '.$comp_rel['comp_mobile'].'
			</td>
			<td style="text-align:left;border:1px solid;width:20%;"> 
				Quotation No
			</td>
			<td style="text-align:left;border:1px solid;width:30%;"> 
				<strong>'.$rel['quotation_no'].'</strong>
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Quotation Date
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.date("d-M-Y",strtotime($rel['quotation_date'])).'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Sales Person
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.$rel['c_con_fname'].' '.$rel['c_con_lname'].'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Person Contact No
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.$rel['c_con_mobile'].'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Person Email
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.(strtolower($rel['c_con_email'])).'
			</td>
		</tr>
		<tr>
			<td rowspan="4" style="text-align:left;vertical-align:top;border:1px solid;"> 
				To,<br/>
				<strong>'.$rel['cust_name'].'</strong><br/>
				'.(nl2br($rel['quot_address'])).'
			</td>
			<td style="text-align:left;border:1px solid;"> 
				Inquiry Ref No
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.$rel['inquiry_no'].'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Inquiry Ref Date
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.date("d-M-Y",strtotime($rel['inquiry_date'])).'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Email
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.(strtolower($rel['cust_email'])).'
			</td>
		</tr>
		<tr>
			<td style="text-align:left;border:1px solid;"> 
				Mobile No
			</td>
			<td style="text-align:left;border:1px solid;"> 
				'.$rel['cust_mobile'].'
			</td>
		</tr>
	</table>
	<table style="font-size:12px;border-collapse: collapse;width:100%;" cellpadding="3" cellspacing="3">
		<thead>
			<tr>
				<th style="width:2%;text-align:center;border:1px solid;">Sr.<br/>No.</th>
				<th style="width:50%;text-align:center;border:1px solid;">Item Description</th>
				<th style="width:8%;text-align:center;border:1px solid;">Qty</th>
				<th style="width:5%;text-align:center;border:1px solid;">Unit</th>
				<th style="width:10%;text-align:center;border:1px solid;">Unit Price</th>
				<th style="width:15%;text-align:center;border:1px solid;">Total Price</th>
			</tr>
		</thead>
		<tbody>';
$trn_qry="select trn.*,pro.product_name,unit.unit_name from tbl_quotation_trn as trn 
left join tbl_product as pro on pro.product_id=trn.product_id
left join unit_mst as unit on unit.unitid=trn.unitid
where trn.quot_trn_status=0 and trn.quotation_id=".$rel['quotation_id'];
$trn_qry_rs=$dbcon->query($trn_qry);
$p=1;$ttl_amt=0;$ttl_qty=0;
$cnt=mysqli_num_rows($trn_qry_rs);
while($trn_rel=mysqli_fetch_assoc($trn_qry_rs)){
	
	$html.='<tr style="border:none;border-left:1px solid;border-right:1px solid;">
		<td style="text-align:center;border:1px solid;vertical-align:top;">'.$p.'</td>
		<td style="text-align:left;border:1px solid;vertical-align:top;">
			<strong>'.$trn_rel['product_name'].'</strong><br/>
			'.nl2br($trn_rel['product_desc']).'
		</td>
		<td style="text-align:center;border:1px solid;vertical-align:top;">
			'.$trn_rel['product_qty'].'
		</td>
		<td style="text-align:center;border:1px solid;vertical-align:top;">'.$trn_rel['unit_name'].'</td>
		<td style="text-align:center;border:1px solid;vertical-align:top;">';
		if($trn_rel['act_amt_flag']=='1'){
			$html.="Extra At Actual";
		}
		else{
			$html.=$trn_rel['product_rate'];
		}
			
		$html.='</td>
		<td style="text-align:center;border:1px solid;vertical-align:top;">';
		if($trn_rel['act_amt_flag']=='1'){
			$html.="Extra At Actual";
		}
		else{
			$html.=$trn_rel['product_amount'];
		}
			
		$html.='</td>
	</tr>';
	$ttl_qty=$ttl_qty+$trn_rel['product_qty'];
	if($trn_rel['act_amt_flag']!='1'){
		$ttl_amt=$ttl_amt+$trn_rel['product_amount'];
	}
	
	$p++;
}
$pr=5-$cnt;
for($j=0; $j<$pr; $j++)
{
    $html.='<tr style="border:none;border-left:1px solid;border-right:1px solid;">
		<td style="border:none;border-left:1px solid;border-right:1px solid;height:40px;"></td>
		<td style="border:none;border-left:1px solid;border-right:1px solid;"></td>
		<td style="border:none;border-left:1px solid;border-right:1px solid;"></td>
		<td style="border:none;border-left:1px solid;border-right:1px solid;"></td>
		<td style="border:none;border-left:1px solid;border-right:1px solid;"></td>
		<td style="border:none;border-left:1px solid;border-right:1px solid;"></td>
	</tr>';
}

	$html.='<tr>
		<td colspan="2" style="text-align:center;border:1px solid;">Total</td>
		<td style="text-align:center;border:1px solid;">
			'.$ttl_qty.'
		</td>
		<td style="text-align:center;border:1px solid;"></td>
		<td style="text-align:center;border:1px solid;"></td>
		<td style="text-align:center;border:1px solid;">
			'.$ttl_amt.'
		</td>
	</tr>';
$html.='</tbody></table>
<table style="font-size:12px;border-collapse: collapse;width:100%;" cellpadding="5" cellspacing="5">
<tr style="height:80px;">
	<td style="height:80px;text-align:center;vertical-align:bottom;border-left:1px solid;border-bottom:1px solid;">Prepared By</td>
	<td style="text-align:center;vertical-align:bottom;border-bottom:1px solid;">Checked By</td>
	<td style="text-align:center;vertical-align:bottom;border-bottom:1px solid;border-right:1px solid;">Authorised Signatory</td>
</tr>
</table>

	<div style="clear:both;"></div>
</div>
<!--page1 end-->';

/*$html.='';*/

/* Get Terms And Condition Start */
$terms_qry="select qtrm.*,mst.tc_name from tbl_quotation_terms_trn as qtrm 
left join tbl_terms_condition as mst on mst.tc_id=qtrm.tc_id
where qtrm.quotation_terms_trn_status=0 and qtrm.quotation_id=".$rel['quotation_id']." order by qtrm.tc_priority";
$terms_qry_rs=$dbcon->query($terms_qry);
if(mysqli_num_rows($terms_qry_rs)){
$html.='<center class="nextpage"></center>
<h3 style="text-align:center;">Commercial Terms</h3>
<div><table width="100%" style="font-size:12px;border-collapse: collapse;width:100%;overflow:wrap;" cellpadding="3" cellspacing="3"><tbody>';
	$t=1;
	while($term_rel=mysqli_fetch_assoc($terms_qry_rs)){
	    $string=(nl2br($term_rel['tc_details']));

		$html.='<tr>
			<td width="5%" style="width:5%;text-align:center;border:1px solid;padding:5px;">'.$t.'</td>
			<td width="25%" style="width:25%;text-align:center;border:1px solid;padding:5px;">'.$term_rel['tc_name'].'</td>
			<td width="70%" style="width:70%;text-align:left;border:1px solid #000;padding:5px;">'.$string.'</td>
		</tr>';
		$t++;
	}
$html.='</tbody></table></div>';	
}
/* Get Terms And Condition Start */

/* Check Annexure Attachments Start */
if(trim($rel['quot_annex_content'])){
	$html.='<center class="nextpage"></center>';
	$html.='<div class="quot_annex_content_div">'.$rel['quot_annex_content'];
	$html.='</div>';
}
/* Check Annexure Attachments End */

$html.='<sethtmlpagefooter name="otherpages_footer" value="on" />
</body>
</html>';
//echo $html;exit;
	$quot_no = $rel['quotation_no'];
	$quot_no=str_ireplace("/","-",$quot_no);
		ob_end_clean();
		include("../../view/export/mpdf/mpdf.php");
		$mpdf=new mPDF('','A4','0','calibri','10','10','45','10','1','1');
		$mpdf->defaultheaderfontsize = 10; /* in pts */
		$mpdf->defaultheaderfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultheaderline = 1; /* 1 to include line below header/above footer */
		$mpdf->defaultfooterfontsize = 10; /* in pts */
		$mpdf->defaultfooterfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultfooterline = 1; /* 1 to include line below header/above footer */
		$mpdf->SetHTMLHeader($header);
		//$mpdf->SetHTMLFooter($footer);
		$mpdf->SetWatermarkText();
		$mpdf->showWatermarkText = true;
		$mpdf->allow_charset_conversion=true;
		$mpdf->charset_in='UTF-8';
		$mpdf->WriteHTML($html);
		//$mpdf->Output();
		$mpdf->Output('../../view/upload/mail_attach/'.$quot_no.'.pdf','f');
		ob_clean();
		return $quot_no.'.pdf';
	}
	
?>
		