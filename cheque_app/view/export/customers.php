<?php
    session_start();
    include('../../../config/config.php');
    include('../../../config/session.php');
 
    $rows = array();
    
	 $str = "SELECT * FROM `tbl_vender` as ven left join state_mst as state on state.stateid=ven.stateid left join city_mst as city on city.cityid=ven.cityid WHERE vender_status =0 and vendor_cat=2 AND  `company_id` = '$_SESSION[company_id]'";
	$query = $dbcon -> query($str);
    
	while($data = $query -> fetch_assoc()) {
		$rows[] = $data;
	}
    
	function frmt($str) {
		if($str == NULL || $str == "" || $str == " ")
			$str = "  ";
		
		$str = str_replace("<BR>","  ",$str);
		$str = str_replace("<br>","  ",$str);
		$str = str_replace("'","",$str);
		$str = str_replace('"','',$str);
		$str = str_replace(";","",$str);
		$str = str_replace(",","",$str);
		$str = str_replace (array("\r\n", "\n", "\r"), ' ', $str);
		return " ".$str." ";
	}
	
    ///////////////////////////////////////////////////////////////////////
    if(isset($_GET['type'])) {
		$type = $dbcon -> real_escape_string($_GET['type']);
	}
	else {
		die('<h1> ERROR </h1>');
	}
    
    if(strtolower($type) == "csv" || strtolower($type) == "xls")
	{
    
		if(isset($_GET['type'])) {
			if($_GET['type'] == 'csv') {
				$f = 'filename=customers_'.str_replace(' ','_',COMPANY).'_'.date("d-m-Y").'.csv';
			}
			else{
				$f = 'filename=customers_'.str_replace(' ','_',COMPANY).'_'.date("d-m-Y").'.xls';
			}
		}
		else {
			$f = 'filename=customers_'.str_replace(' ','_',COMPANY).'_'.date("d-m-Y").'.csv';
		}
		
		// output headers so that the file is downloaded rather than displayed
		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment;'.$f);

		// create a file pointer connected to the output stream
		$output = fopen('php://output', 'w');

		// output the column headings
		fputcsv($output, array(" ID "," NAME "," CITY "," PHONE "," EMAIL "));
		//address
		// loop over the rows, outputting them
		$id_num = 1;
		
		foreach($rows as $result)
		{
			$data = array();
			$data = NULL;
			$data[] = frmt($id_num);
			$data[] = frmt($result['vender_name']);
			$data[] = frmt($result['city_name']);
			$data[] = frmt($result['vender_mobile']);
			$data[] = frmt($result['vender_email']);
			 fputcsv($output, $data);
			$id_num++;
		}
	}
	else if(strtolower($type) == 'pdf') {
		$id_num = 1;
		
		$html = '
			<html>
				<head>
					<style type="text/css">
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
					</style>
					<title>List of Customers - '.COMPANY.'</title>
				</head>
				<body>
				<table>
					<thead>
					<tr>
						<th> Sr </th>
						<th> NAME </th>
						<th> CITY </th>
						<th> PHONE </th>
						<th> EMAIL </th>
						<th> PAN </th>
						<th> DATE </th>
					</tr>
					</thead>
					<tbody>
		';
		
		foreach($rows as $result)
		{
			$html .= "<tr>".
						"<td>".$id_num."</td>".
						"<td>".$result['cust_name']."</td>".
						"<td>".$result['cust_city']."</td>".
						"<td>".$result['cust_phone']."</td>".
						"<td>".$result['cust_mail']."</td>".
						"<td>".$result['cust_pan']."</td>".
						"<td>".date("d-m-Y g:i a",strtotime($result['cust_tmst']))."</td>".
					  "</tr>";
			$id_num++;
		}
		
		$html .= '</tbody>
				</table>
				</body>
			</html>';
		
		
		include("mpdf/mpdf.php");
		$mpdf=new mPDF();
		$mpdf->defaultheaderfontsize = 10; /* in pts */
		$mpdf->defaultheaderfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultheaderline = 1; /* 1 to include line below header/above footer */
		$mpdf->defaultfooterfontsize = 10; /* in pts */
		$mpdf->defaultfooterfontstyle = B; /* blank, B, I, or BI */
		$mpdf->defaultfooterline = 1; /* 1 to include line below header/above footer */
		$mpdf->SetHeader('{DATE j-m-Y}|{PAGENO}/2| List of Customers');
		$mpdf->SetFooter(COMPANY);
		$mpdf->SetWatermarkText(COMPANY);
		$mpdf->showWatermarkText = true;
		
		$mpdf->WriteHTML($html);
		$mpdf->Output();
		exit;
		
	}
?>
