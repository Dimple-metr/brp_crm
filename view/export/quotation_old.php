<?php 
//error_reporting(E_ALL); 
function quotation_pdf($id,$type,$dbcon)
{	
		ob_start();
		$id=$dbcon->real_escape_string($id);	
$query="select quotation_id , quotation_no , quotation_date , cust.* , genrate , q_price ,discount, remark , quotation.cdate , quotation.user_id , quotation.usertype_id , quotation.cust_id , quotation.product_id , quotation_status , inquiry_id , send_status, quotation_subject,product.*,product2.*,cat.subcategory_name,mcat.category_name,state.state_name,city.city_name from tbl_quotation as quotation left join tbl_customer as cust on cust.cust_id=quotation.cust_id 
left join state_mst as state on state.stateid=cust.stateid
left join city_mst as city on city.cityid=cust.cityid
		
left join tbl_product as product on product.product_id=quotation.product_id left join tbl_product2 as product2 on product2.product_id=product.product_id  left join tbl_subcategory as cat on cat.subcategory_id=quotation.subcategory_id left join tbl_category as mcat on mcat.category_id=quotation.category_id where quotation_id=$id";
		$rel=mysqli_fetch_assoc($dbcon->query($query));
	$type="pdf";
	
    if(isset($type)== "pdf") {
		$type = $dbcon -> real_escape_string($type);
	}
	else {
		die('<h1> ERROR </h1>');
	}
      if(strtolower($type) == 'pdf') {
		$id_num = 1;
	$query2="select * from tbl_setting where id=1";
	$rel2=mysqli_fetch_assoc($dbcon->query($query2));
	//$msg=$quotation_msg;
$subject = str_ireplace("[ subcategory ]",$rel['subcategory_name'],$rel['quo_sub']);	
$des1=str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description1']));
$des1=str_ireplace("<div> </div>","<br>",$des1);
$des2_removesub=str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description2']));
$des2 =str_ireplace("[ category ]",$rel['category_name'],$des2_removesub);
$des2='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des2);
	
$des3 =stripcslashes($rel['description3']);
$des3='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des3);

$des4 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description4']));
$des4='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des4);

$des5 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description5']));
$des5='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des5);
 
$des6 =stripcslashes($rel['description6']);
$des6='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des6);

$des_removeprice =str_ireplace("[ price ]",$rel['q_price'].'<br />('.convert_number_to_words($rel['q_price']).')',stripcslashes($rel['description7']));
$des7 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],$des_removeprice);
$des7='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des7);

$des8 =stripcslashes($rel['description8']);
$des8=str_ireplace("<div> </div>","<br>",$des8);
$des9 =stripcslashes($rel['description9']);	
$des9='<center class="nextpage"></center></center>'.str_ireplace("<div> </div>","<br>",$des9);

$des10 =stripcslashes($rel['description10']);
$des10=str_ireplace("<div> </div>","<br>",$des10);
	
$des11 =stripcslashes($rel['description11']);								
$des11=str_ireplace("<div> </div>","<br>",$des11);

$img1='';$img2='';
if(!empty($rel["pro_image1"]))
{
 $img1='<center style="text-align:center"><img src="'.ROOT.PRODUCT_VMING.$rel["pro_image1"].'"/></center>';
}
if(!empty($rel["pro_image2"]))
{
 $img2='<center style="text-align:center"><img src="'.ROOT.PRODUCT_VMING.$rel["pro_image2"].'" class="image2" /></center>';
}
if(empty($rel['description1']))
{
	$des1='';
}
if(empty($rel['description2']))
{

	$des2='';
}		
if(empty($rel['description3']))
{
	$des3='';
}	
if(empty($rel['description4']))

{
	$des4='';
}	

if(empty($rel['description5']))

{
	$des5='';
}	

if(empty($rel['description6']))

{
	$des6='';
}	
if(empty($rel['description7']))

{
	$des7='';
}	
if(empty($rel['description8']))

{
	$des8='';
}	
if(empty($rel['description9']))

{
	$des9='';
}	

if(empty($rel['description10']))

{
	$des10='';
}	

if(empty($rel['description11']))
{
	$des11='';
}							
		$html ='<html>
				<head>					
					<title>Quotation - '.$rel['company_name'].'</title>
<style type="text/css">
.nextpage
{
page-break-after: always;
}
table {
border-width: 0 0 1px 1px;
border-spacing: 0;
border-collapse: collapse;
border-style: solid;

}
th, tr, td {
margin: 0;
padding: 4px;
border-width: 1px 1px 0 0;
border-style: solid;
text-align: center;
}
th {
font-weight:bold;
}
.image2{
    max-height:450px !important;
    max-width:800px;
}
</style>
				</head>
<body>

<center>
<h3 style="text-align:center"><strong><u>TECHNO - COMMERCIAL OFFER</u></strong></h3></center>

<table border="0" style="font-size:13px;border:none !important;"  width="100%">
<tr  style="border:none !important;">
<td width="50%" style="text-align:left;border:none !important;">
	<strong>Quote Ref No: '.$rel['quotation_no'].'</strong>
</td>
<td width="50%" style="text-align:right;border:none !important;">
	<strong>Date:</strong>'.date("d/m/Y",strtotime($rel['quotation_date'])).'
</td>
</tr>
<tr style="border:none !important;">
<td colspan="2" style="border:none !important;text-align:left">
	To,<br> '.$rel['company_name'].' - '.$rel['cust_name'] .'<br>
			'.$rel['cust_address'].'<br>
'.$rel['city_name'].', '.$rel['state_name'].'<br>
Mobile No : '.$rel['cust_mobile'].'<br>
Email : '.strtolower($rel['cust_email']).'
</td>
</tr>
</table>
<br><br><br>
Dear Sir,<br><br>
<strong >Sub :  </strong>'.$subject.'
<br>	<br>
'.$des1.'

'.$img1.'
'.$des10.'
<br/>
'.$img2.'
</center>
<br/>
'.$des11.'
'.$des2.''
.$des3.''
.$des4.''
.$des5.''
.$des6.''
.$des7.''
.$des8.''
.$des9.'
<br>
<strong><u>For RECICLAR TECHNOLOGIES PVT LTD</u></strong>
</body>
</html>';
$header ='<img src="'.ROOT.LOGO.$rel2["quotation_header"].'"/>';  
$footer='<img src="'.ROOT.LOGO.$rel2['quotation_footer'].'"/>';
		ob_end_clean();
		include("mpdf/mpdf.php");
		$mpdf=new mPDF('','A4','0','calibri','10','10','60','50');
		$mpdf->defaultheaderfontsize = 10; /* in pts */
		$mpdf->defaultheaderfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultheaderline = 1; /* 1 to include line below header/above footer */
		$mpdf->defaultfooterfontsize = 10; /* in pts */
		$mpdf->defaultfooterfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultfooterline = 1; /* 1 to include line below header/above footer */
		$mpdf->SetHTMLHeader($header);
		$mpdf->SetHTMLFooter($footer);
		$mpdf->SetWatermarkText();
		$mpdf->showWatermarkText = true;
		$mpdf->WriteHTML($html);
		$mpdf->Output();
		$mpdf->Output('../../view/upload/quotation_pfd/'.$rel['quotation_no'].' - '.$rel['company_name'].'.pdf','f');
		ob_clean();
		return $rel['quotation_no'].' - '.$rel['company_name'].'.pdf';
	}
}	

?>
