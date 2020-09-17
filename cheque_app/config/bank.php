<?php
	include("../core/config.php");
	$banks = array("ALLAHABAD BANK","ANDHRA BANK","BANK OF BARODA","BANK OF INDIA","BANK OF MAHARASHTRA","BHARTIYA MAHILA BANK","CANARA BANK","CENTRAL BANK OF INDIA","CORPORATION BANK","INDIAN BANK","INDIAN OVERSEAS BANK","ORIENTAL BANK OF COMMERCE","PUNJAB NATIONAL BANK","PUNJAB &AMP; SIND BANK","SYNDICATE BANK","UCO BANK","UNION BANK OF INDIA","UNITED BANK OF INDIA","VIJAYA BANK","IDBI BANK","DENA BANK","ECGC","STATE BANK OF INDIA","STATE BANK OF BIKANER &AMP; JAIPUR","STATE BANK OF HYDERABAD","STATE BANK OF MYSORE","STATE BANK OF PATIALA","STATE BANK OF TRAVANCORE","STATE BANK OF SAURASHTRA","STATE BANK OF INDORE","ALLAHABAD UP GRAMIN BANK","ANDHRA PRADESH GRAMEENA VIKAS BANK","ANDHRA PRAGATHI GRAMEENA BANK","ARUNACHAL PRADESH RURAL BANK","ARYAVART GRAMIN BANK","ASSAM GRAMIN VIKASH BANK","BAITARANI GRAMYA BANK","BALLIA GRAMIN BANK","BANGIYA GRAMIN VIKASH BANK","BARODA GUJARAT GRAMIN BANK","BARODA RAJASTHAN GRAMIN BANK","BARODA UTTAR PRADESH GRAMIN BANK","BIHAR KSHETRIYA GRAMIN BANK","CAUVERY KALPATHARU GRAMEENA BANK","CHAITANYA GODAVARI GRAMEENA BANK","CHHATTISGARH GRAMIN BANK","CHIKMAGALUR-KODAGU GRAMEENA BANK","DECCAN GRAMEENA BANK","DENA GUJARAT GRAMIN BANK","DURG-RAJNANDGAON GRAMIN BANK","ELLAQUAI DEHATI BANK","GURGAON GRAMIN BANK","HADOTI KSHETRIYA GRAMIN BANK","HARYANA GRAMIN BANK","HIMACHAL GRAMIN BANK","JAIPUR THAR GRAMIN BANK","JHABUA DHAR KSHETRIYA GRAMIN BANK","JHARKHAND GRAMIN BANK","KALINGA GRAMYA BANK","KARNATAKA VIKAS GRAMEENA BANK","KASHI GOMTI SAMYUT GRAMIN BANK","KERALA GRAMIN BANK","KRISHNA GRAMEENA BANK","KSHETRIYA KISAN GRAMIN BANK","LANGPI DEHANGI RURAL BANK","MADHUMALTI BUILDING GUPTE MARG","MADHYA BHARAT GRAMIN BANK","MADHYA BIHAR GRAMIN BANK","MAHAKAUSHAL KSHETRIYA GRAMIN BANK","MAHARASHTRA GRAMIN BANK","MALWA GRAMIN BANK","MANIPUR RURAL BANK","MARWAR GANGANAGAR BIKANER GRAMIN BANK","MEGHALAYA RURAL BANK","MEWAR ANCHALIK GRAMIN BANK","MIZORAM RURAL BANK","NAGALAND RURAL BANK","UTTRAKHAND GRAMIN BANK","NARMADA MALWA GRAMIN BANK","NEELACHAL GRAMYA BANK","PALLAVAN GRAMA BANK","PANDYAN GRAMA BANK","PARVATIYA GRAMIN BANK","PASCHIM BANGA GRAMIN BANK","PRAGATHI GRAMIN BANK","PRATHAMA BANK","PUDUVAI BHARATHIAR GRAMA BANK","PUNE DISTRICT CENTRAL COOPERATIVE BANK LTD.","PUNJAB GRAMIN BANK","PURVANCHAL GRAMIN BANK","RAJASTHAN GRAMIN BANK","REWA-SIDHI GRAMIN BANK","RUSHIKULYA GRAMYA BANK","SAMASTIPUR KSHETRIYA GRAMIN BANK","SAPTAGIRI GRAMEENA BANK","SARVA UP GRAMIN BANK","SATPURA NARMADA KSHETRIYA","SAURASHTRA GRAMIN BANK","SHARDA GRAMIN BANK","SHREYAS GRAMIN BANK","SURGUJA KSHETRIYA GRAMIN BANK","SUTLEJ KSHETRIYA GRAMIN BANK","TRIPURA GRAMIN BANK","UTKAL GRAMYA BANK","UTTAR BANGA KSHETRIYA GRAMIN BANK","UTTAR BIHAR GRAMIN BANK","VANANCHAL GRAMIN BANK","VIDHARBHA KSHETRIYA GRAMIN BANK","VISVESHVARAYA GRAMEENA BANK","WAINGANGA KRISHNA GRAMIN BANK","AXIS BANK","CATHOLIC SYRIAN BANK","CITY UNION BANK","DEVELOPMENT CREDIT BANK","DHANLAXMI BANK","FEDERAL BANK","HDFC BANK","ICICI BANK","INDUSIND BANK","ING VYSYA BANK","KARNATAKA BANK","KARUR VYSYA BANK","KOTAK MAHINDRA BANK","LAKSHMI VILAS BANK","NAINITAL BANK","TAMILNADU MERCANTILE BANK","SOUTH INDIAN BANK","YES BANK","UP AGRO CORPORATION BANK","ABU DHABI COMMERCIAL BANK","AUSTRALIA AND NEW ZEALAND BANK","BANK INTERNASIONAL INDONESIA","BANK OF AMERICA NA","BANK OF BAHRAIN AND KUWAIT","BANK OF CEYLON","BANK OF NOVA SCOTIA (SCOTIA BANK)","BANK OF TOKYO MITSUBISHI UFJ","BARCLAYS BANK PLC","BNP PARIBAS","CALYON BANK","CHINATRUST COMMERCIAL BANK","CITIBANK N.A.","CREDIT SUISSE","COMMONWEALTH BANK OF AUSTRALIA","DBS BANK","DCB BANK NOW RHB BANK","DEUTSCHE BANK AG","FIRSTRAND BANK","HSBC","JPMORGAN CHASE BANK","KRUNG THAI BANK","MASHREQ BANK PSC","MIZUHO CORPORATE BANK","ROYAL BANK OF SCOTLAND","SHINHAN BANK","SONALI BANK","STANDARD CHARTERED BANK","STATE BANK OF MAURITIUS","UBS","WOORI BANK");
	sort($banks);
	$i=1;
	foreach($banks as $bank) {
		$dbcon->query("INSERT INTO `mudra_banks`(`bank_name`) VALUES ('$bank')");
		echo $i." ".$bank."<br>";
		$i++;
	}
?>