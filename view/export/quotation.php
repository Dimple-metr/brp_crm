<?php 
error_reporting(E_ALL); 
function quotation_pdf($id,$type,$dbcon)
{	
	ob_start();
	$id=$dbcon->real_escape_string($id);	
	$query="select quotation_id , quotation_no , quotation_date , cust.* , genrate , q_price,qty,rate ,discount, remark , quotation.cdate , quotation.user_id , quotation.usertype_id , quotation.cust_id , quotation.product_id , quotation_status , inquiry_id , send_status, quotation_subject,product.*,product2.*,cat.subcategory_name,mcat.category_name,state.state_name,city.city_name from tbl_quotation as quotation left join tbl_customer as cust on cust.cust_id=quotation.cust_id 
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
$des1=str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description1']));//about product
$des1=str_ireplace("<div> </div>","<br>",$des1);
$des2_removesub=str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description2']));
$des2 =str_ireplace("[ category ]",$rel['category_name'],$des2_removesub);
$des2=str_ireplace("<div> </div>","<br>",$des2);
	
$des3 =stripcslashes($rel['description3']);
$des3=str_ireplace("<div> </div>","<br>",$des3).'<center class="nextpage"></center>';

$des4 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description4']));
$des4=str_ireplace("<div> </div>","<br>",$des4).'<center class="nextpage"></center>';

$des5 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],stripcslashes($rel['description5']));
$des5=str_ireplace("<div> </div>","<br>",$des5).'<center class="nextpage"></center></center>';
 
$des6 =stripcslashes($rel['description6']);
$des6=str_ireplace("<div> </div>","<br>",$des6).'<center class="nextpage"></center></center>';

$des_removeprice =str_ireplace("[ price ]",$rel['q_price'].'<br />('.convert_number_to_words($rel['q_price']).')',stripcslashes($rel['description7']));
$des_removeprice =str_ireplace("[ qty_rate ]",$rel['rate'],$des_removeprice);
$des_removeprice =str_ireplace("[ qty ]",$rel['qty'],$des_removeprice);
$des7 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],$des_removeprice);
$des7=str_ireplace("<div> </div>","<br>",$des7);

$des8 =stripcslashes($rel['description8']);
$des8=str_ireplace("<div> </div>","<br>",$des8).'<center class="nextpage"></center></center>';
$des9 =stripcslashes($rel['description9']);	
$des9=str_ireplace("<div> </div>","<br>",$des9);

$des10 =stripcslashes($rel['description10']);
$des10 =str_ireplace("[ subcategory ]",$rel['subcategory_name'],$des10);
$des10='<div class="page">'.str_ireplace("<div> </div>","<br>",$des10);
	
$des11 =stripcslashes($rel['description11']);								
$des11=str_ireplace("<div> </div>","<br>",$des11);

$img1='';$img2='';

if(!empty($rel["pro_image1"]))//about product image
{
	$img1='<center style="text-align:center;max-width:800px;"><img src="'.DOMAIN_F.PRODUCT_VMING.$rel["pro_image1"].'" /></center><div class="nextpage"></div>';
}
if(!empty($rel["pro_image2"]))//product image
{
 $img2='<center style="text-align:center;max-width:8in;"><img src="'.DOMAIN_F.PRODUCT_VMING.$rel["pro_image2"].'" class="image2" style="margin-top:60px;" /></center><center class="nextpage"></center>';
}
if(!empty($rel["pro_image3"]))//product benefit image
{
 $benefit_product_block='<h3><span style="color:#3498db"><u><strong>BENEFITS OF BIOFLOCS - STP :</strong></u></span></h3><center style="text-align:center;max-width:8in;"><img src="'.DOMAIN_F.PRODUCT_VMING.$rel["pro_image3"].'" class="image2" style="" /></center><center class="nextpage"></center>';
}
if(!empty($rel["pro_image4"]))//technical details image
{
 $technical_image='<center style="text-align:center;max-width:8in;float:left;"><img src="'.DOMAIN_F.PRODUCT_VMING.$rel["pro_image4"].'" class="technical details" style="" /></center></div> <center class="nextpage"></center>';
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
$header ='<img src="'.DOMAIN_F.LOGO.$rel2["quotation_header"].'" style="width:8.27in" />';  
$footer='<img src="'.DOMAIN_F.LOGO.$rel2['quotation_footer'].'" style="padding-left:0px !important;width:8.27in"/>';
$html ='<html>
				<head>					
					<title>Quotation - '.$rel['company_name'].'</title>
<style type="text/css">

.page{
	width:8.27in;
	height:10.69in;
}
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
    max-height:8in !important;
}
td ul
{
  margin: 0px 0px;
}
.quotation_head{margin:0px 20px 0;font-size:20px;position: relative;width: 100%;}
.date{float:right; width:30%;font-weight:600;}
.quotationno{float:left;width:65%;font-weight:600;}
.logoverticle{ position: absolute; padding:0px; margin:0; width:9in;}
p {margin: 10px 0px;}

</style>
</head>
<body>

<htmlpageheader name="otherpages" style="display:none">
    <div style="text-align:center">'.$header.'</div>
</htmlpageheader>
<htmlpagefooter name="otherpages_footer" style="display:none">
    <div style="text-align:center">'.$footer.'</div>
</htmlpagefooter>
<sethtmlpageheader name="otherpages" value="on" show-this-page="0"/>
<sethtmlpagefooter name="otherpages_footer" value="off" />
<div class="page">
	<div class="quotation_head" >
		<div class="quotationno"><strong>QUOTE REF NUM:'.$rel['quotation_no'].'</strong></div>
		<div class="date"><strong>DATE: '.date("d/m/Y",strtotime($rel['quotation_date'])).'</strong></div>
	</div>
	<div style="clear:both;"></div>
	<div style="width:30%; float:left;height:6in;" > 
		<table  style="border:none; float:left;">
			<tr style="border:none;"><td style="border:none;">
				<img  class="logoverticle" src="'.DOMAIN_F.LOGO.$rel2["quotation_header"].'" rotate="-90"/>
			</td>
			</tr>
		</table>
	</div>
	<div style="width:70%; float:right">
		<div style="padding-top:100px;font-size:35px;">
				<div style="text-align:center">
					<u><span style="color:#d35400;"><b><i>TECHNO COMMERCIAL OFFER</i></b></span> <b><i> <br/>FOR</i></b> <br/><span style="color:#3498db"><b><i>'.$subject.'</i></b></span></u>
				</div>
				<div style="margin-left: 50px;margin-top:100px;font-size:20px;">
					To,<br> <b>'.strtoupper($rel['company_name']).'</b> <br/> '.$rel['cust_name'] .'<br>
						'.$rel['cust_address'].'<br>
						'.ucwords(strtolower($rel['city_name'])).' , '.ucwords(strtolower($rel['state_name'])).'<br>
					Mobile No : '.$rel['cust_mobile'].'<br>
					Email : '.strtolower($rel['cust_email']).'
				</div>
		</div>
	</div>

</div><!--page1 end-->
<center class="nextpage"></center>
<sethtmlpagefooter name="otherpages_footer" value="on" />
'.$img2.'

'.$des1.' '.$img1.'
'.$benefit_product_block.'

'.$des10.'<!--Technical details1-->'.$technical_image.'<!--Technical image-->
'.$des11.' <!--Technical details2-->
<div style="width:8in">'.$des2.'<!--Design Parameters--> '.$des3.'</div> <!--Assumptions--><div style="width:8in">'.$des4.'</div><!--supplier scope--><div style="width:8in">'.$des5.'</div><!--Client Scope-->'.$des6.'<!--Exclusions from supplier’s scope--><div style="width:8in">'.$des7.'</div><!--price schedule--><div style="width:8in">'.$des8.'</div><!--payment terms--><div style="width:8in">'.$des9.'</div> <!--Commercial Terms-->'.'<br/> 
<strong><u>For RECICLAR TECHNOLOGIES PVT LTD</u></strong>
</body>
</html>';
//echo $html;exit;
		ob_end_clean();
		include("../../view/export/mpdf/mpdf.php");
		$mpdf=new mPDF('','A4','0','calibri','10','10','45','40','1','1');
		$mpdf->defaultheaderfontsize = 10; /* in pts */
		$mpdf->defaultheaderfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultheaderline = 1; /* 1 to include line below header/above footer */
		$mpdf->defaultfooterfontsize = 10; /* in pts */
		$mpdf->defaultfooterfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultfooterline = 1; /* 1 to include line below header/above footer */
		//$mpdf->SetHTMLHeader($header);
		//$mpdf->SetHTMLFooter($footer);
		$mpdf->SetWatermarkText();
		$mpdf->showWatermarkText = true;
		$mpdf->WriteHTML($html);
		$mpdf->Output();
		$mpdf->Output('../../view/upload/quotation_pfd/'.$rel['quotation_no'].' - '.$rel['company_name'].'.pdf','f');
		ob_clean();
		return $rel['quotation_no'].' - '.$rel['company_name'].'.pdf';
		
}//pdf creation end
}//function end	

?>
