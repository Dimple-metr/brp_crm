SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--Database: `bizaccou_bds_crm`




CREATE TABLE `account_mst` (
  `acc_id` double NOT NULL AUTO_INCREMENT,
  `acc_type` int(11) NOT NULL,
  `b_grp` int(11) NOT NULL,
  `bankid` double NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `cityid` double NOT NULL,
  `acc_name` varchar(100) NOT NULL,
  `acc_number` varchar(30) NOT NULL,
  `acc_chequeno` double NOT NULL,
  `acc_chequeleft` int(11) NOT NULL,
  `opn_balance` double NOT NULL,
  `acc_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` double NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `account_voucher_mst` (
  `voucher_mstid` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_typeid` int(11) NOT NULL,
  `voucher_date` date NOT NULL,
  `voucher_no` varchar(20) NOT NULL,
  `remark` varchar(250) NOT NULL,
  `g_total` decimal(10,2) NOT NULL,
  `mst_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`voucher_mstid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `account_voucher_trn` (
  `voucher_trnid` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_mstid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `partyid` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1:debit,2:credit',
  `user_id` int(11) NOT NULL,
  `trn_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`voucher_trnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `bank_mst` (
  `bankid` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;


INSERT INTO bank_mst VALUES
("0","CASH-SELF","0","2016-12-02 00:28:56","0","0"),
("1","STATE BANK OF INDIA","0","2016-08-17 04:58:11","0","0"),
("2","BANK OF BARODA","0","2016-11-29 00:50:02","0","0"),
("3","BANK OF INDIA","0","2016-11-29 00:50:13","0","0"),
("4","ICICI BANK","0","2016-11-29 00:50:20","0","0"),
("5","HDFC BANK","2","2016-11-29 00:50:26","0","0"),
("6","KOTAK BANK","0","2016-11-29 00:50:35","0","0"),
("7","CENTRAL BANK OF INDIA","0","2016-11-29 00:50:44","0","0"),
("8","DEUTSCHE BANK","0","2016-11-29 00:50:51","0","0"),
("9","CANARA BANK","0","2016-11-29 00:51:01","0","0"),
("10","THE VIJAY CO-OPERATIVE BANK LTD.","0","2017-11-15 17:01:04","0","0"),
("15","THE NAVNIRMAN CO-OP. BANK LTD.","0","2017-03-27 22:33:28","1","0"),
("16","BANK OF MAHARASHTRA","0","2017-04-11 18:28:37","0","0"),
("17","PUNJAB NATIONAL BANK","0","2017-07-15 15:23:35","2","0"),
("18","SYNDICATE BANK","0","2017-08-11 11:31:37","1","0"),
("19","HJFKFI","2","2018-01-17 16:13:28","1","0"),
("20","THE KALUPUR COMERCIAL CO-OPERATIV BANK LTD","0","2018-06-29 11:46:53","1","0"),
("21","IDBI BANK","0","2018-07-10 12:11:19","1","0"),
("22","ALLAHABAD BANK","0","2018-07-10 12:11:27","1","0"),
("23","ANDHRA BANK","0","2018-07-10 12:11:33","1","0"),
("24","CORPORATION BANK","0","2018-07-10 12:12:29","1","0"),
("25","DENA BANK","0","2018-07-10 12:12:36","1","0"),
("26","INDIAN BANK","0","2018-07-10 12:12:44","1","0"),
("27","AXIS BANK LIMITED","0","2018-07-10 12:12:52","1","0"),
("28","BANDHAN BANK LIMITED","0","2018-07-10 12:12:59","1","0"),
("29","CATHOLIC SYRIAN BANK LIMITED","0","2018-07-10 12:13:08","1","0"),
("30","CITY UNION BANK LIMITED","0","2018-07-10 12:13:16","1","0"),
("31","DCB BANK LIMITED","0","2018-07-10 12:13:21","1","0"),
("32","DHANLAXMI BANK LIMITED","0","2018-07-10 12:13:32","1","0"),
("33","FEDERAL BANK LIMITED","0","2018-07-10 12:13:40","1","0"),
("34","HDFC BANK LIMITED","0","2018-07-10 12:13:47","1","0"),
("35","ICICI BANK LIMITED","0","2018-07-10 12:13:56","1","0"),
("36","INDUSIND BANK LIMITED","0","2018-07-10 12:14:08","1","0"),
("37","JAMMU & KASHMIR BANK LIMITED","0","2018-07-10 12:14:26","1","0"),
("38","KARNATAKA BANK LIMITED","0","2018-07-10 14:11:18","1","0"),
("39","KARUR VYSYA BANK LIMITED","0","2018-07-10 14:11:25","1","0"),
("40","KOTAK MAHINDRA BANK LIMITED","0","2018-07-10 14:11:32","1","0"),
("41","LAKSHMI VILAS BANK LIMITED","0","2018-07-10 14:11:42","1","0"),
("42","NAINITAL BANK LIMITED","0","2018-07-10 14:11:51","1","0"),
("43","RBL BANK LIMITED","0","2018-07-10 14:12:05","1","0"),
("44","SOUTH INDIAN BANK LIMITED","0","2018-07-10 14:12:12","1","0"),
("45","TAMILNAD MERCANTILE BANK LIMITED","0","2018-07-10 14:12:21","1","0"),
("46","YES BANK LIMITED","0","2018-07-10 14:12:28","1","0"),
("47","AU SMALL FINANCE BANK LIMITED","0","2018-07-10 14:12:50","1","0"),
("48","CAPITAL SMALL FINANCE BANK LIMITED","0","2018-07-10 14:12:59","1","0"),
("49","FINCARE SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:07","1","0"),
("50","EQUITAS SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:23","1","0"),
("51","ESAF SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:32","1","0"),
("52","SURYODAY SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:38","1","0"),
("53","UJJIVAN SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:46","1","0"),
("54","UTKARSH SMALL FINANCE BANK LIMITED","0","2018-07-10 14:13:53","1","0"),
("55","NORTH EAST SMALL FINANCE BANK LIMITED","0","2018-07-10 14:14:02","1","0"),
("56","AIRTEL PAYMENTS BANK LIMITED","0","2018-07-10 14:14:11","1","0"),
("57","INDIA POST PAYMENTS BANK LIMITED","0","2018-07-10 14:14:23","1","0"),
("58","FINO PAYMENTS BANK LIMITED","0","2018-07-10 14:14:31","1","0"),
("59","PAYTM PAYMENTS BANK LIMITED","0","2018-07-10 14:14:37","1","0"),
("60","ANDHRA PRADESH STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:15:14","1","0"),
("61","THE BIHAR STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:15:26","1","0"),
("62","CHHATISGARH RAJYA SAHAKARI BANK MARYADIT","0","2018-07-10 14:15:33","1","0"),
("63","THE GOA STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:15:41","1","0"),
("64","THE GUJARAT STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:15:50","1","0"),
("65","HARYANA RAJYA SAHAKARI BANK LTD.","0","2018-07-10 14:15:58","1","0"),
("66","HIMACHAL PRADESH STATE COOPERATIVE BANK LTD.","0","2018-07-10 14:16:04","1","0"),
("67","KARNATAKA STATE CO-OPERATIVE APEX BANK LTD.","0","2018-07-10 14:16:13","1","0"),
("68","KERALA STATE C-OPERATIVE BANK LTD.","0","2018-07-10 14:16:21","1","0"),
("69","MADHYA PRADESH RAJYA SAHAKARI BANK MARYADIT","0","2018-07-10 14:16:29","1","0"),
("70","THE MAHARASHTRA STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:16:37","1","0"),
("71","	THE ORISSA STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:16:42","1","0"),
("72","PONDICHERRY STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:16:48","1","0"),
("73","PUNJAB STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:16:54","1","0"),
("74","THE RAJASTHAN STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:17:01","1","0"),
("75","TAMIL NADU STATE APEX CO-OPERATIVE BANK LTD.","0","2018-07-10 14:17:11","1","0"),
("76","THE UTTAR PRADESH CO-OPERATIVE BANK LTD.","0","2018-07-10 14:17:17","1","0"),
("77","UTTARAKHAND STATE COOPERATIVE BANK LTD.","0","2018-07-10 14:17:25","1","0"),
("78","WEST BENGAL STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:17:32","1","0"),
("79","ANDAMAN AND NICOBAR STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:17:48","1","0"),
("80","ARUNACHAL STATE CO-OPERATIVE APEX BANK LTD.","0","2018-07-10 14:17:54","1","0"),
("81","ASSAM CO-OPERATIVE APEX BANK LTD.","0","2018-07-10 14:17:59","1","0"),
("82","	CHANDIGARH STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:18:04","1","0"),
("83","DELHI STATE COOPERATIVE BANK LTD.","0","2018-07-10 14:18:10","1","0"),
("84","JAMMU AND KASHMIR STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:18:15","1","0"),
("85","JHARKHAND STATE COOPERATIVE BANK LTD.","0","2018-07-10 14:18:21","1","0"),
("86","MANIPUR STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:18:28","1","0"),
("87","MEGHALAYA CO-OPERATIVE APEX BANK LTD.","0","2018-07-10 14:18:34","1","0"),
("88","MIZORAM CO-OPERATIVE APEX BANK LTD.","0","2018-07-10 14:18:40","1","0"),
("89","NAGALAND STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:18:48","1","0"),
("90","SIKKIM STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:18:54","1","0"),
("91","TELANGANA STATE COOPERATIVE APEX BANK LTD.","0","2018-07-10 14:19:03","1","0"),
("92","TRIPURA STATE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:19:11","1","0"),
("93","AHMEDABAD MERCANTILE CO-OP BANK LTD.","0","2018-07-10 14:19:30","1","0"),
("94","KALUPUR COMMERCIAL COOP.BANK LTD.","0","2018-07-10 14:19:37","1","0"),
("95","MEHSANA URBAN CO-OP BANK LTD.","0","2018-07-10 14:19:45","1","0"),
("96","NUTAN NAGARIK SAHAKARI BANK LTD., AHMEDABAD","0","2018-07-10 14:19:52","1","0"),
("97","RAJKOT NAGRIK SAHAKARI BANK LTD.","0","2018-07-10 14:19:58","1","0"),
("98","SARDAR BHILADWALA PARDI PEOPLES COOP BANK LTD.","0","2018-07-10 14:20:05","1","0"),
("99","SURAT PEOPLES COOP BANK LTD.","0","2018-07-10 14:20:13","1","0"),
("100","AMANATH CO-OPERATIVE BANK LTD. BANGALORE","0","2018-07-10 14:20:19","1","0"),
("101","ANDHRA PRADESH MAHESH CO-OP URBAN BANK LTD.","0","2018-07-10 14:20:26","1","0"),
("102","INDIAN MERCANTILE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:20:32","1","0"),
("103","ABHYUDAYA CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:20:39","1","0");
INSERT INTO bank_mst VALUES
("104","APNA SAHAKARI BANK LTD.","0","2018-07-10 14:20:45","1","0"),
("105","BASSEIN CATHOLIC CO-OPERATIVE BANK LTD.","0","2018-07-10 14:20:55","1","0"),
("106","BHARAT CO-OPERATIVE BANK (MUMBAI) LTD., MUMBAI","0","2018-07-10 14:21:00","1","0"),
("107","BHARATI SAHAKARI BANK LIMITED.","0","2018-07-10 14:21:07","1","0"),
("108","BOMBAY MERCANTILE CO-OPERATIVE BANK LIMITED","0","2018-07-10 14:21:14","1","0"),
("109","CITIZEN CREDIT CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:21:20","1","0"),
("110","COSMOS CO-OPERATIVE BANK LTD","0","2018-07-10 14:21:27","1","0"),
("111","DOMBIVLI NAGARI SAHAKARI BANK LTD.","0","2018-07-10 14:21:33","1","0"),
("112","GOPINATH PATIL PARSIK JANATA SAHAKARI BANK LTD., THANE","0","2018-07-10 14:21:43","1","0"),
("113","GREATER BOMBAY CO-OPERATIVE BANK LIMITED","0","2018-07-10 14:21:51","1","0"),
("114","JALGAON JANATA SAHAKARI BANK LTD.","0","2018-07-10 14:21:57","1","0"),
("115","JALGAON PEOPLE\\\'S CO-OPERATIVE BANK LTD.","0","2018-07-10 14:22:03","1","0"),
("116","JANAKALYAN SAHAKARI BANK LTD., MUMBAI","0","2018-07-10 14:22:09","1","0"),
("117","JANATA SAHAKARI BANK LTD., PUNE.","0","2018-07-10 14:22:28","1","0"),
("118","	KALLAPPANNA AWADE ICHALKARANJI JANATA SAHAKARI BANK LTD","0","2018-07-10 14:22:34","1","0"),
("119","KALYAN JANATA SAHAKARI BANK LTD., KALYAN","0","2018-07-10 14:22:42","1","0"),
("120","	KAPOL CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:22:47","1","0"),
("121","KARAD URBAN CO-OPERATIVE BANK LTD.","0","2018-07-10 14:22:52","1","0"),
("122","MAHANAGAR CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:22:59","1","0"),
("123","NAGAR URBAN CO-OPERATIVE BANK LTD., AHMEDNAGAR","0","2018-07-10 14:23:08","1","0"),
("124","NASIK MERCHANT\\\'S CO-OPERATIVE BANK LTD.","0","2018-07-10 14:23:14","1","0"),
("125","NEW INDIA CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:23:20","1","0"),
("126","NKGSB CO-OPERATIVE BANK LTD., MUMBAI","0","2018-07-10 14:23:27","1","0"),
("127","PRAVARA SAHAKARI BANK LTD.","0","2018-07-10 14:23:34","1","0"),
("128","PUNJAB & MAHARASHTRA CO-OPERATIVE BANK LTD.","0","2018-07-10 14:23:43","1","0"),
("129","RAJARAMBAPU SAHAKARI BANK LTD.","0","2018-07-10 14:23:51","1","0"),
("130","RUPEE CO-OPERATIVE BANK LTD.","0","2018-07-10 14:23:59","1","0"),
("131","SANGLI URBAN CO-OPERATIVE BANK LTD., SANGLI","0","2018-07-10 14:24:04","1","0"),
("132","SARASWAT CO-OPERATIVE BANK LTD., BOMBAY","0","2018-07-10 14:24:10","1","0"),
("133","SHAMRAO VITHAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:24:16","1","0"),
("134","SOLAPUR JANATA SAHAKARI BANK LTD.","0","2018-07-10 14:24:23","1","0"),
("135","THANE BHARAT SAHAKARI BANK LTD.","0","2018-07-10 14:24:33","1","0"),
("136","TJSB SAHAKARI BANK","0","2018-07-10 14:24:39","1","0"),
("137","VASAI VIKAS SAHAKARI BANK LTD.","0","2018-07-10 14:24:45","1","0"),
("138","NAGPUR NAGRIK SAHAKARI BANK LTD.","0","2018-07-10 14:24:56","1","0"),
("139","AHMEDABAD DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:26:28","1","0"),
("140","AMRELI JILLA MADHYASTH SAHAKARI BANK MARYADIT","0","2018-07-10 14:26:34","1","0"),
("141","BANASKANTHA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:26:40","1","0"),
("142","BARODA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:26:45","1","0"),
("143","BHAVANAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:26:50","1","0"),
("144","BROACH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:26:55","1","0"),
("145","JAMNAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:01","1","0"),
("146","JUNAGADH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:07","1","0"),
("147","KACHCHH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:13","1","0"),
("148","KAIRA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:20","1","0"),
("149","	KODINAR TALUKA CO-OPERATIVE BANKING UNION LTD.","0","2018-07-10 14:27:26","1","0"),
("150","MEHSANA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:35","1","0"),
("151","PANCHMAHALS DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:40","1","0"),
("152","SABARKANTHA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:47","1","0"),
("153","SHRI RAJKOT DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:27:53","1","0"),
("154","SURAT DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:28:00","1","0"),
("155","SURENDRANAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:28:05","1","0"),
("156","VALSAD DISTRICT CENTRAL CO-OPERATIVE BANK LTD.","0","2018-07-10 14:28:11","1","0"),
("157","DENA GUJARAT GRAMIN BANK","0","2018-07-10 14:28:52","1","0");




CREATE TABLE `branch_mst` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_user_id` int(11) NOT NULL COMMENT 'User table id relation',
  `branch_name` varchar(400) NOT NULL,
  `branch_email` varchar(400) NOT NULL,
  `branch_password` varchar(400) NOT NULL,
  `branch_address` mediumtext NOT NULL,
  `countryid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `branch_pincode` varchar(400) NOT NULL,
  `branch_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `city_mst` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `stateid` int(11) NOT NULL,
  `city_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=latin1;


INSERT INTO city_mst VALUES
("1","AHMEDABAD","1","0","2016-11-10 20:01:03","0","1"),
("2","AMRELI","1","0","2016-11-10 20:03:32","0","1"),
("3","ANAND","1","0","2016-11-10 20:05:29","0","1"),
("4","ANJAR","1","0","2016-11-10 20:05:40","0","1"),
("5","ANKLAV","1","0","2016-11-10 20:02:37","0","1"),
("6","ANKLESVAR","1","0","2016-11-10 20:02:33","0","1"),
("7","BABRA","1","0","2016-11-10 20:08:55","0","1"),
("8","BAGASARA","1","0","2016-11-10 20:17:36","0","1"),
("9","BALASINOR","1","0","2016-11-10 20:18:25","0","1"),
("10","BARDOLI","1","0","2016-11-10 20:18:12","0","1"),
("11","BHABHAR","1","0","2016-11-10 20:18:00","0","1"),
("12","BHACHAU","1","0","2016-11-10 20:17:48","0","1"),
("13","BHANVAD","1","0","2016-11-10 20:17:14","0","1"),
("14","BHARACHA(BROACH)","1","0","2016-11-10 20:16:59","0","1"),
("15","BHAVNAGARA(BHAUNAGAR)","1","0","2016-11-10 20:09:34","0","1"),
("16","BHUJ","1","0","2016-11-10 20:16:44","0","1"),
("17","BALAMORA","1","0","2016-11-10 20:14:22","0","1"),
("18","BORSAD","1","0","2016-11-10 20:14:59","0","1"),
("19","BOTAD","1","0","2016-11-10 20:11:39","0","1"),
("20","CHAKLASI","1","0","2016-11-10 20:02:28","0","1"),
("21","CHALTHAN","1","0","2016-11-10 20:16:33","0","1"),
("22","CHHOTA UDAIPUR","1","0","2016-11-10 20:13:15","0","1"),
("23","CHORVAD","1","0","2016-11-10 20:12:52","0","1"),
("24","CHOTILA","1","0","2016-11-10 20:11:25","0","1"),
("25","DABHOI","1","0","2016-11-10 20:10:59","0","1"),
("26","DAHGAM","1","0","2016-11-10 20:10:44","0","1"),
("27","DAHOD","1","0","2016-11-10 20:10:08","0","1"),
("28","DAKOR","1","0","2016-11-10 20:02:23","0","1"),
("29","DEVGADBARIA","1","0","2016-11-10 20:05:48","0","1"),
("30","DHANDHUKA","1","0","2016-11-10 20:02:19","0","1"),
("31","DHANERA","1","0","2016-11-10 20:09:49","0","1"),
("32","DHARAMPUR","1","0","2016-11-10 20:09:10","0","1"),
("33","DHOLKA","1","0","2016-11-10 20:02:14","0","1"),
("34","DHORAJI","1","0","2016-11-10 20:00:27","0","1"),
("35","DHRANGADHRA","1","0","2016-11-10 20:08:38","0","1"),
("36","DHROL","1","0","2016-11-10 20:08:25","0","1"),
("37","DISA","1","0","2016-11-10 20:08:15","0","1"),
("38","DWARKA(DVARAKA)","1","0","2016-11-10 20:02:09","0","1"),
("39","GADHADA","1","0","2016-11-10 20:07:09","0","1"),
("40","GANDHIDHAM","1","0","2016-11-10 20:06:54","0","1"),
("41","GARIADHAR","1","0","2016-11-10 20:06:35","0","1"),
("42","GODHRA","1","0","2016-11-10 20:06:05","0","1"),
("43","GONDAL","1","0","2016-11-10 20:05:05","0","1"),
("44","HALOL","1","0","2016-11-10 20:05:23","0","1"),
("45","HALVAD","1","0","2016-11-10 20:04:51","0","1"),
("46","HARIJ","1","0","2016-11-10 19:57:56","0","1"),
("47","HIMATNAGAR","1","0","2016-11-10 20:04:38","0","1"),
("48","IDAR","1","0","2016-11-10 20:03:53","0","1"),
("49","JAFARABAD","1","0","2016-11-10 19:57:48","0","1"),
("50","JAMBUSAR","1","0","2016-11-10 20:03:42","0","1"),
("51","JAMJODHPUR","1","0","2016-11-10 19:57:36","0","1"),
("52","JAMNAGAR","1","0","2016-11-10 19:57:31","0","1"),
("53","JASDAN","1","0","2016-11-10 20:03:15","0","1"),
("54","JETPUR NAVAGADH","1","0","2016-11-10 20:03:01","0","1"),
("55","JHADESHWAR","1","0","2016-11-10 20:02:52","0","1"),
("56","JHALOD","1","0","2016-11-10 19:57:25","0","1"),
("57","JUNAGADH","1","0","2016-11-10 19:57:18","0","1"),
("58","KADI","1","0","2016-11-10 20:02:03","0","1"),
("59","KADODARA","1","0","2016-11-10 20:01:56","0","1"),
("60","KALAVAD","1","0","2016-11-10 19:57:05","0","1"),
("61","KALOL","1","0","2016-11-10 19:56:44","0","1"),
("62","KAPADVANJ","1","0","2016-11-10 20:01:51","0","1"),
("63","KARJAN","1","0","2016-11-10 20:01:46","0","1"),
("64","KATHLAL","1","0","2016-11-10 19:56:37","0","1"),
("65","KESHOD","1","0","2016-11-10 20:01:37","0","1"),
("66","KHAMBHALIYA","1","0","2016-11-10 19:55:54","0","1"),
("67","KHAMBHAT","1","0","2016-11-10 19:55:34","0","1"),
("68","KHEDA","1","0","2016-11-10 20:01:42","0","1"),
("69","KHED BRAHMA","1","0","2016-11-10 20:01:29","0","1"),
("70","KHERALU","1","0","2016-11-10 19:55:27","0","1"),
("71","KODANAR","1","0","2016-11-10 19:54:40","0","1"),
("72","KOSAMBA-TARSADI","1","0","2016-11-10 20:01:10","0","1"),
("73","LATHI","1","0","2016-11-10 19:54:20","0","1"),
("74","LIMBDI","1","0","2016-11-10 20:01:20","0","1"),
("75","LUNAWADA","1","0","2016-11-10 19:54:04","0","1"),
("76","MAHEMDAVAD","1","0","2016-11-10 19:53:38","0","1"),
("77","MAHESANA","1","0","2016-11-10 19:53:31","0","1"),
("78","MAHUVA","1","0","2016-11-10 19:59:41","0","1"),
("79","MANAVADAR","1","0","2016-11-10 19:53:19","0","1"),
("80","MANDVI","1","0","2016-11-10 19:52:52","0","1"),
("81","MANGROL","1","0","2016-11-10 19:52:46","0","1"),
("82","MANSA","1","0","2016-11-10 19:52:29","0","1"),
("83","MODASA","1","0","2016-11-10 19:52:23","0","1"),
("84","MORVI","1","0","2016-11-10 20:00:20","0","1"),
("85","MUNDRA","1","0","2016-11-10 20:00:14","0","1"),
("86","NADIAD","1","0","2016-11-10 19:52:15","0","1"),
("87","NAVSARI","1","0","2016-11-10 19:49:11","0","1"),
("88","ODE","1","0","2016-11-10 20:00:05","0","1"),
("89","OKHA","1","0","2016-11-10 19:59:55","0","1"),
("90","PADRA","1","0","2016-11-10 19:59:47","0","1"),
("91","PALANPUR","1","0","2016-11-10 19:49:02","0","1"),
("92","PALITANA","1","0","2016-11-10 19:48:57","0","1"),
("93","PARDI","1","0","2016-11-10 19:48:43","0","1"),
("94","PATAN","1","0","2016-11-10 19:48:07","0","1"),
("95","PETLAD","1","0","2016-11-10 19:47:59","0","1"),
("96","PORBANDAR","1","0","2016-11-10 19:59:27","0","1"),
("97","PRANTIJ","1","0","2016-11-10 19:47:51","0","1"),
("98","RADHANPUR","1","0","2016-11-10 19:47:18","0","1"),
("99","RAJKOT","1","0","2016-11-10 19:47:12","0","1"),
("100","RAJPIPLA","1","0","2016-11-10 19:47:01","0","1");
INSERT INTO city_mst VALUES
("101","RAJULA","1","0","2016-11-10 19:46:49","0","1"),
("102","RANAVAV","1","0","2016-11-10 19:46:41","0","1"),
("103","RAPAR","1","0","2016-11-10 19:46:13","0","1"),
("104","SALAYA","1","0","2016-11-10 19:46:06","0","1"),
("105","SAVARKUNDLA (KUNDLA)","1","0","2016-11-10 19:45:55","0","1"),
("106","SIDHPUR (SIDDHAPUR)","1","0","2016-11-10 19:42:34","0","1"),
("107","SIHOR","1","0","2016-11-10 19:59:18","0","1"),
("108","SIKKA","1","0","2016-11-10 19:59:13","0","1"),
("109","SONGADH","1","0","2016-11-10 19:59:07","0","1"),
("110","SURAT","1","0","2016-11-10 19:42:28","0","1"),
("111","SURENDRANAGAR","1","0","2016-11-10 19:59:01","0","1"),
("112","SUTRAPADA","1","0","2016-11-10 19:58:56","0","1"),
("113","TALAJA","1","0","2016-11-10 19:45:42","0","1"),
("114","TALALA","1","0","2016-11-10 19:58:49","0","1"),
("115","THANGADH","1","0","2016-11-10 19:45:21","0","1"),
("116","THARAD","1","0","2016-11-10 19:44:50","0","1"),
("117","UMBERGAON","1","0","2016-11-10 19:42:15","0","1"),
("118","UMRETH","1","0","2016-11-10 19:58:41","0","1"),
("119","UNA","1","0","2016-11-10 19:58:35","0","1"),
("120","UNJHA","1","0","2016-11-10 19:58:29","0","1"),
("121","UPLETA","1","0","2016-11-10 19:58:22","0","1"),
("122","VADALI","1","0","2016-11-10 19:41:46","0","1"),
("123","VADNAGAR","1","0","2016-11-10 19:58:16","0","1"),
("124","VADODARA (BARODA)","1","0","2016-11-10 19:41:30","0","1"),
("125","VALSAD","1","0","2016-11-10 19:41:20","0","1"),
("126","VAPI","1","0","2016-11-10 19:39:45","0","1"),
("127","VAPI INA","1","0","2016-11-10 19:41:00","0","1"),
("128","VERAVAL","1","0","2016-11-10 19:40:44","0","1"),
("129","VIJAPUR","1","0","2016-11-10 19:40:36","0","1"),
("130","VIRAMGAM","1","0","2016-11-10 19:40:28","0","1"),
("131","VISNAGAR","1","0","2016-11-10 19:58:04","0","1"),
("132","VYARA","1","0","2016-11-10 19:44:43","0","1"),
("133","WANKANER","1","0","2017-03-07 17:35:24","1","2"),
("134","WQDSXA","31","0","2017-03-18 17:34:30","1","0"),
("135","DELHI","32","0","2017-03-21 20:02:37","1","0"),
("136","MORBI","1","0","2017-03-21 20:12:03","1","0"),
("137","HUBALI","13","0","2017-04-11 16:17:29","1","0"),
("138","MANAWAR","15","0","2017-06-02 17:18:33","1","0"),
("139","DAR ESS SALAM","33","0","2017-06-06 18:26:46","1","0"),
("140","MUMBAI","16","0","2017-09-01 18:42:57","1","0"),
("141","DUBAI","34","0","2018-04-13 14:37:27","1","0"),
("142","ABU DHABI","35","2","2019-09-09 12:48:21","1","0"),
("143","GANDHINAGAR","1","0","2018-07-16 16:54:49","1","0"),
("144","ROM","1","0","2019-06-20 16:40:05","1","0"),
("145","QWE12","23","2","2019-09-09 12:48:32","1","0"),
("146","NAGPUR","16","0","2019-09-30 16:25:26","1","0"),
("147","PUNE","16","0","2019-09-30 16:26:02","1","0"),
("148","DANAM","16","0","2020-01-12 08:31:49","1","0"),
("149","BHOKARDAN","16","0","2020-07-03 15:30:47","32","0"),
("150","MEERUT","27","0","2020-07-03 15:44:19","32","0"),
("151","DUMARIYA GANJ","27","0","2020-07-03 15:54:40","32","0"),
("152","CHANDRAPUR","16","0","2020-07-03 15:58:15","32","0"),
("153","TARANAGAR","23","0","2020-07-03 16:02:05","32","0"),
("154","SITAMARHI","5","0","2020-07-03 16:07:17","32","0"),
("155","FATEPUR SIKRI","27","0","2020-07-03 16:10:39","32","0"),
("156","JAYAKONDAM","25","0","2020-07-03 16:16:32","32","0"),
("157","NEDMKANDAM","14","0","2020-07-03 16:20:48","32","0"),
("158","HOSUR","25","0","2020-07-03 16:24:11","32","0"),
("159","MUNGER","5","0","2020-07-03 16:27:55","32","0"),
("160","BANGLORE","13","0","2020-07-03 16:37:12","32","0"),
("161","MANJERI","14","0","2020-07-03 16:39:40","32","0"),
("162","JAIPUR","23","0","2020-07-03 16:42:50","32","0"),
("163","BELGAUM","13","0","2020-07-03 16:47:25","32","0"),
("164","BIDAR","13","0","2020-07-03 16:53:51","32","0"),
("165","LATUR","16","0","2020-07-03 16:56:26","32","0"),
("166","NASHIK","16","0","2020-07-03 16:59:10","32","0"),
("167","GHAZIPUR","27","0","2020-07-03 17:01:13","32","0"),
("168","AURANGABAD","16","0","2020-07-03 17:06:11","32","0"),
("169","LUCKNOW","27","0","2020-07-03 17:08:37","32","0"),
("170","BIJNOR","27","0","2020-07-03 17:10:30","32","0"),
("171","MIRZAPUR","27","0","2020-07-03 17:17:31","32","0"),
("172","DULIAJAN","4","0","2020-07-03 17:19:40","32","0"),
("173","KOLHAPUR","16","0","2020-07-03 17:22:07","32","0"),
("174","MANDYA","13","0","2020-07-03 17:25:55","32","0"),
("175","BAJNA","27","0","2020-07-03 17:28:01","32","0"),
("176","BUDAUN","27","0","2020-07-03 17:30:03","32","0"),
("177","SAHARANPUR","27","0","2020-07-03 17:37:16","32","0"),
("178","SANGLI","16","0","2020-07-03 17:39:52","32","0"),
("179","GOLAGHAT","4","0","2020-07-03 17:42:38","32","0"),
("180","SOLAPUR","16","0","2020-07-03 17:44:35","32","0"),
("181","BHAGALPUR","27","0","2020-07-03 17:52:14","32","0"),
("182","AGRA","27","0","2020-07-03 17:55:05","32","0"),
("183","HAILAKANDI","4","0","2020-07-03 17:57:48","32","0"),
("184","BAHJOI","27","0","2020-07-03 17:59:55","32","0"),
("185","ALLAHABAD","27","0","2020-07-03 18:02:11","32","0"),
("186","BETTIAH","5","0","2020-07-06 10:36:42","32","0"),
("187","MALEGAON","16","0","2020-07-06 11:19:43","32","0"),
("188","KAVATHE MAHANKAL","16","0","2020-07-06 11:23:48","32","0"),
("189","SILCHAR","4","0","2020-07-06 11:27:47","32","0"),
("190","RAMPUR","27","0","2020-07-06 11:38:05","32","0"),
("191","AZMGARH","27","0","2020-07-06 11:41:30","32","0"),
("192","TALBEHAT","27","0","2020-07-06 11:45:12","32","0"),
("193","AMBEDKAR NAGAR","27","0","2020-07-06 11:48:17","32","0"),
("194","JORHAT","4","0","2020-07-06 12:00:20","32","0"),
("195","GAYA","5","0","2020-07-06 12:07:35","32","0"),
("196","SIKANDRA RAO","27","0","2020-07-06 12:10:56","32","0"),
("197","PATUR","16","0","2020-07-06 12:17:30","32","0"),
("198","DEORIA","27","0","2020-07-06 12:28:18","32","0"),
("199","BUXAR","5","0","2020-07-06 12:31:51","32","0"),
("200","KANPUR","27","0","2020-07-06 12:36:04","32","0");
INSERT INTO city_mst VALUES
("201","NAGAON","4","0","2020-07-06 12:39:22","32","0"),
("202","NANDED","16","0","2020-07-06 12:45:44","32","0"),
("203","HAJIPUR","5","0","2020-07-06 12:48:30","32","0"),
("204","BIHAR","5","0","2020-07-06 15:25:15","32","0"),
("205","BEGUSARAI","5","0","2020-07-06 15:27:29","32","0"),
("206","GORAKHPUR","27","0","2020-07-06 15:30:41","32","0"),
("207","KAUSHAMBI","27","0","2020-07-06 17:54:26","32","0"),
("208","USKABAZAR","27","0","2020-07-06 17:59:19","32","0"),
("209","HYDERABAD","25","0","2020-07-06 18:06:58","32","0"),
("210","KHURJA","27","0","2020-07-06 18:10:15","32","0"),
("211","JAMALPUR","5","0","2020-07-06 18:14:03","32","0"),
("212","OSMANABAD","16","0","2020-07-06 18:16:21","32","0"),
("213","AMROHA","27","0","2020-07-06 18:25:59","32","0"),
("214","IGATPURI","16","0","2020-07-06 18:29:16","32","0"),
("215","SATARA","16","0","2020-07-06 18:32:24","32","0"),
("216","RAIGAD","16","0","2020-07-06 18:37:22","32","0"),
("217","KARAD","16","0","2020-07-06 18:41:07","32","0"),
("218","BULDANA","16","0","2020-07-06 18:44:08","32","0"),
("219","MUZAFFARPUR","5","0","2020-07-06 18:51:21","32","0"),
("220","KAPTANGANJ KUSHINAGER ","27","0","2020-07-06 18:58:16","32","0"),
("221","ULHASNAGAR","16","0","2020-07-06 19:09:10","32","0"),
("222","BISWANATH CHARIALI","4","0","2020-07-06 19:13:11","32","0"),
("223","JAUNPUR","27","0","2020-07-07 11:35:36","32","0"),
("224","SANGAM","16","0","2020-07-07 11:40:28","32","0"),
("225","CHENNAI","25","0","2020-07-07 11:43:24","32","0"),
("226","DEOBAND","27","0","2020-07-07 11:55:14","32","0"),
("227","SAMBHAL","27","0","2020-07-07 12:05:51","32","0"),
("228","SIWAN","5","0","2020-07-07 12:10:59","32","0"),
("229","AHMEDPUR","16","0","2020-07-07 12:12:47","32","0"),
("230","ALIBAG","16","0","2020-07-07 12:15:11","32","0"),
("231","FIROZABAD","27","0","2020-07-07 12:17:45","32","0"),
("232","ORAI","27","0","2020-07-07 12:26:17","32","0"),
("233","YAVATMAL","16","0","2020-07-07 12:31:36","32","0"),
("234","BEED","16","0","2020-07-07 12:34:16","32","0"),
("235","PATNA","5","0","2020-07-07 12:42:46","32","0"),
("236","MEHASANA","1","0","2020-07-13 13:34:13","32","0"),
("237","KAPADWANJ","1","0","2020-07-14 14:18:22","32","0"),
("238","DAMAN","1","0","2020-07-14 14:37:09","32","0");




CREATE TABLE `coro_chequebook` (
  `chequebookid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `acc_chequeno` int(11) NOT NULL,
  `acc_chequeleft` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`chequebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `coro_cheques` (
  `cheque_id` double NOT NULL AUTO_INCREMENT,
  `cheque_number` double NOT NULL,
  `cheque_acc` double NOT NULL,
  `cheque_date` date NOT NULL,
  `cheque_payee` double NOT NULL,
  `cheque_amount` float NOT NULL,
  `cheque_note` varchar(500) NOT NULL,
  `cheque_mode` int(11) NOT NULL,
  `cheque_morethen` tinyint(4) NOT NULL,
  `cheque_iscancel` tinyint(4) NOT NULL DEFAULT '0',
  `cheque_tmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paytype` varchar(250) NOT NULL,
  `cheque_of` double NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`cheque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






CREATE TABLE `coro_design` (
  `design_id` double NOT NULL AUTO_INCREMENT,
  `design_bank` double NOT NULL,
  `design_payee` varchar(200) NOT NULL,
  `design_payeeWidth` float NOT NULL,
  `design_date` varchar(200) NOT NULL,
  `design_dateWidth` float NOT NULL,
  `design_dateLspace` float NOT NULL,
  `design_amount_text` varchar(200) NOT NULL,
  `design_amount_textWidth` float NOT NULL,
  `design_amount_textIndent` float NOT NULL,
  `design_amount_textLHeight` float NOT NULL,
  `design_amount_number` varchar(200) NOT NULL,
  `design_amount_numberWidth` float NOT NULL,
  `design_bearer` varchar(200) NOT NULL,
  `design_bearerWidth` float NOT NULL,
  `design_mark` varchar(100) NOT NULL,
  `design_notmore` varchar(100) NOT NULL,
  `design_notmoreWidth` float NOT NULL,
  `design_preview` varchar(500) NOT NULL,
  `design_status` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int(11) NOT NULL,
  `design_tmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `design_of` double NOT NULL,
  PRIMARY KEY (`design_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;


INSERT INTO coro_design VALUES
("12","7","{\"top\":\"79\",\"left\":\"70\"}","450","{\"top\":\"38\",\"left\":\"543\"}","158","13","{\"top\":\"105\",\"left\":\"44\"}","455","76","31","{\"top\":\"136\",\"left\":\"562\"}","113","{\"top\":\"83\",\"left\":\"643\"}","50","{\"top\":\"219\",\"left\":\"257\"}","{\"top\":\"225\",\"left\":\"391\"}","181","cbi-294380415.jpg","1","0","2016-01-27 06:08:59","0"),
("14","9","{\"top\":\"82\",\"left\":\"62\"}","526","{\"top\":\"30\",\"left\":\"593\"}","155","12","{\"top\":\"107\",\"left\":\"56\"}","534","72","28","{\"top\":\"143\",\"left\":\"595\"}","104","{\"top\":\"84\",\"left\":\"631\"}","83","{\"top\":\"201\",\"left\":\"375\"}","{\"top\":\"186\",\"left\":\"345\"}","178","canctscopy-1388119199.jpg","1","0","2016-03-08 14:20:55","0"),
("15","3","{\"top\":\"74\",\"left\":\"56\"}","97","{\"top\":\"32\",\"left\":\"554\"}","150","12","{\"top\":\"96\",\"left\":\"33\"}","538","70","32","{\"top\":\"130\",\"left\":\"561\"}","108","{\"top\":\"80\",\"left\":\"658\"}","46","{\"top\":\"198\",\"left\":\"255\"}","{\"top\":\"211\",\"left\":\"389\"}","172","chaque2255393621-1214658089.jpg","1","0","2016-03-28 06:56:15","0"),
("22","8","{\"top\":\"101\",\"left\":\"121\"}","54","{\"top\":\"67\",\"left\":\"550\"}","90","5","{\"top\":\"129\",\"left\":\"74\"}","550","40","35","{\"top\":\"163\",\"left\":\"514\"}","120","{\"top\":\"104\",\"left\":\"615\"}","58","{\"top\":\"245\",\"left\":\"360\"}","{\"top\":\"227\",\"left\":\"395\"}","184","kotakrameshbhaihuf1408473232-8711140588.jpg","1","0","2016-12-05 11:55:57","0"),
("29","15","{\"top\":\"74\",\"left\":\"73\"}","522","{\"top\":\"40\",\"left\":\"598\"}","142","12","{\"top\":\"101\",\"left\":\"91\"}","647","40","35","{\"top\":\"139\",\"left\":\"642\"}","116","{\"top\":\"88\",\"left\":\"689\"}","77","{\"top\":\"218\",\"left\":\"132\"}","{\"top\":\"218\",\"left\":\"282\"}","180","thenavnirmancoopbankltd-395763292.jpg","1","0","2017-03-27 22:37:30","1"),
("31","16","{\"top\":\"92\",\"left\":\"115\"}","421","{\"top\":\"39\",\"left\":\"607\"}","150","12","{\"top\":\"116\",\"left\":\"29\"}","499","80","31","{\"top\":\"150\",\"left\":\"621\"}","118","{\"top\":\"92\",\"left\":\"699\"}","56","{\"top\":\"197\",\"left\":\"259\"}","{\"top\":\"243\",\"left\":\"247\"}","182","maharashtrabankedited-1157640979.jpg","1","0","2017-04-11 18:30:35","0"),
("32","17","{\"top\":\"80\",\"left\":\"75\"}","441","{\"top\":\"30\",\"left\":\"588\"}","155","12","{\"top\":\"100\",\"left\":\"60\"}","552","75","35","{\"top\":\"140\",\"left\":\"595\"}","122","{\"top\":\"85\",\"left\":\"623\"}","86","{\"top\":\"204\",\"left\":\"343\"}","{\"top\":\"190\",\"left\":\"312\"}","186","bhagyoday-1269910896.jpg","1","0","2017-07-15 16:27:58","0"),
("33","18","{\"top\":\"65\",\"left\":\"68\"}","529","{\"top\":\"12\",\"left\":\"580\"}","156","13","{\"top\":\"90\",\"left\":\"51\"}","552","70","35","{\"top\":\"126\",\"left\":\"596\"}","122","{\"top\":\"61\",\"left\":\"637\"}","78","{\"top\":\"183\",\"left\":\"339\"}","{\"top\":\"166\",\"left\":\"309\"}","186","syndicatebank192610252-721858130.jpg","1","0","2017-08-11 11:37:52","0"),
("34","10","{\"top\":\"78\",\"left\":\"68\"}","592","{\"top\":\"32\",\"left\":\"587\"}","157","13","{\"top\":\"102\",\"left\":\"62\"}","542","40","35","{\"top\":\"140\",\"left\":\"601\"}","112","{\"top\":\"79\",\"left\":\"682\"}","69","{\"top\":\"179\",\"left\":\"353\"}","{\"top\":\"172\",\"left\":\"552\"}","176","editedcheque-211113918.jpg","1","0","2017-11-20 17:32:49","0"),
("35","20","{\"top\":\"75\",\"left\":\"72\"}","550","{\"top\":\"23\",\"left\":\"579\"}","163","13","{\"top\":\"98\",\"left\":\"64\"}","552","40","35","{\"top\":\"138\",\"left\":\"597\"}","122","{\"top\":\"69\",\"left\":\"676\"}","60","{\"top\":\"227\",\"left\":\"346\"}","{\"top\":\"205\",\"left\":\"338\"}","186","vkentrprise-1156780343.jpg","1","0","2018-06-29 12:17:29","0"),
("36","34","{\"top\":\"85\",\"left\":\"60\"}","578","{\"top\":\"37\",\"left\":\"586\"}","163","13","{\"top\":\"110\",\"left\":\"63\"}","552","40","35","{\"top\":\"150\",\"left\":\"592\"}","122","{\"top\":\"92\",\"left\":\"688\"}","60","{\"top\":\"265\",\"left\":\"318\"}","{\"top\":\"246\",\"left\":\"298\"}","186","hdfc6960256216-409920748.jpg","1","0","2018-07-16 16:38:42","0"),
("37","40","{\"top\":\"67\",\"left\":\"46\"}","56","{\"top\":\"29\",\"left\":\"586\"}","140","11","{\"top\":\"97\",\"left\":\"12\"}","528","40","35","{\"top\":\"140\",\"left\":\"583\"}","122","{\"top\":\"68\",\"left\":\"629\"}","60","{\"top\":\"205\",\"left\":\"278\"}","{\"top\":\"250\",\"left\":\"226\"}","186","kotakfinal-289130538.png","1","0","2018-07-25 12:45:59","0"),
("39","1","{\"top\":\"75\",\"left\":\"68\"}","73","{\"top\":\"16\",\"left\":\"596\"}","140","11","{\"top\":\"100\",\"left\":\"39\"}","552","40","35","{\"top\":\"138\",\"left\":\"604\"}","122","{\"top\":\"62\",\"left\":\"615\"}","60","{\"top\":\"210\",\"left\":\"317\"}","{\"top\":\"177\",\"left\":\"581\"}","186","sbifinal-19106110.png","1","0","2018-07-25 13:00:40","0"),
("41","25","{\"top\":\"83\",\"left\":\"54\"}","62","{\"top\":\"23\",\"left\":\"580\"}","140","11","{\"top\":\"102\",\"left\":\"31\"}","494","40","35","{\"top\":\"141\",\"left\":\"596\"}","122","{\"top\":\"67\",\"left\":\"614\"}","60","{\"top\":\"175\",\"left\":\"342\"}","{\"top\":\"216\",\"left\":\"317\"}","186","denabankcheck-1024414584.png","1","0","2018-08-10 11:40:38","0"),
("42","2","{\"top\":\"74\",\"left\":\"73\"}","541","{\"top\":\"29\",\"left\":\"598\"}","140","11","{\"top\":\"96\",\"left\":\"83\"}","418","40","35","{\"top\":\"138\",\"left\":\"613\"}","122","{\"top\":\"65\",\"left\":\"646\"}","60","{\"top\":\"175\",\"left\":\"315\"}","{\"top\":\"219\",\"left\":\"289\"}","186","bob-1404987657.png","1","0","2018-10-02 15:21:26","0"),
("43","4","{\"top\":\"78\",\"left\":\"54\"}","527","{\"top\":\"29\",\"left\":\"593\"}","133","11","{\"top\":\"98\",\"left\":\"35\"}","507","40","35","{\"top\":\"143\",\"left\":\"610\"}","118","{\"top\":\"66\",\"left\":\"650\"}","86","{\"top\":\"201\",\"left\":\"611\"}","{\"top\":\"244\",\"left\":\"581\"}","182","icicifinal-1156995502.png","1","0","2018-10-03 11:24:11","0");




CREATE TABLE `coro_vouchers` (
  `v_id` double NOT NULL AUTO_INCREMENT,
  `v_cheque` double NOT NULL,
  `v_tds` float NOT NULL,
  `v_rec_name` varchar(50) NOT NULL,
  `v_rec_mobno` varchar(20) NOT NULL,
  `v_tmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `v_of` double NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






CREATE TABLE `country_mst` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  `country_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;


INSERT INTO country_mst VALUES
("1","Afghanistan","0","2016-10-17 17:18:18","0"),
("2","Albania","0","2016-10-17 17:18:18","0"),
("3","Algeria","0","2016-10-17 17:18:18","0"),
("4","American Samoa","0","2016-10-17 17:18:18","0"),
("5","Andorra","0","2016-10-17 17:18:18","0"),
("6","Angola","0","2016-10-17 17:18:18","0"),
("7","Anguilla","0","2016-10-17 17:18:18","0"),
("8","Antarctica","0","2016-10-17 17:18:18","0"),
("9","Antigua And Barbuda","0","2016-10-17 17:18:18","0"),
("10","Argentina","0","2016-10-17 17:18:18","0"),
("11","Armenia","0","2016-10-17 17:18:18","0"),
("12","Aruba","0","2016-10-17 17:18:18","0"),
("13","Australia","0","2016-10-17 17:18:18","0"),
("14","Austria","0","2016-10-17 17:18:18","0"),
("15","Azerbaijan","0","2016-10-17 17:18:18","0"),
("16","Bahamas The","0","2016-10-17 17:18:18","0"),
("17","Bahrain","0","2016-10-17 17:18:18","0"),
("18","Bangladesh","0","2016-10-17 17:18:18","0"),
("19","Barbados","0","2016-10-17 17:18:18","0"),
("20","Belarus","0","2016-10-17 17:18:18","0"),
("21","Belgium","0","2016-10-17 17:18:18","0"),
("22","Belize","0","2016-10-17 17:18:18","0"),
("23","Benin","0","2016-10-17 17:18:18","0"),
("24","Bermuda","0","2016-10-17 17:18:18","0"),
("25","Bhutan","0","2016-10-17 17:18:18","0"),
("26","Bolivia","0","2016-10-17 17:18:18","0"),
("27","Bosnia and Herzegovina","0","2016-10-17 17:18:18","0"),
("28","Botswana","0","2016-10-17 17:18:18","0"),
("29","Bouvet Island","0","2016-10-17 17:18:18","0"),
("30","Brazil","0","2016-10-17 17:18:18","0"),
("31","British Indian Ocean Territory","0","2016-10-17 17:18:18","0"),
("32","Brunei","0","2016-10-17 17:18:18","0"),
("33","Bulgaria","0","2016-10-17 17:18:18","0"),
("34","Burkina Faso","0","2016-10-17 17:18:18","0"),
("35","Burundi","0","2016-10-17 17:18:18","0"),
("36","Cambodia","0","2016-10-17 17:18:18","0"),
("37","Cameroon","0","2016-10-17 17:18:18","0"),
("38","Canada","0","2016-10-17 17:18:18","0"),
("39","Cape Verde","0","2016-10-17 17:18:18","0"),
("40","Cayman Islands","0","2016-10-17 17:18:18","0"),
("41","Central African Republic","0","2016-10-17 17:18:18","0"),
("42","Chad","0","2016-10-17 17:18:18","0"),
("43","Chile","0","2016-10-17 17:18:18","0"),
("44","China","0","2016-10-17 17:18:18","0"),
("45","Christmas Island","0","2016-10-17 17:18:18","0"),
("46","Cocos (Keeling) Islands","0","2016-10-17 17:18:18","0"),
("47","Colombia","0","2016-10-17 17:18:18","0"),
("48","Comoros","0","2016-10-17 17:18:18","0"),
("49","Congo","0","2016-10-17 17:18:18","0"),
("50","Congo The Democratic Republic Of The","0","2016-10-17 17:18:18","0"),
("51","Cook Islands","0","2016-10-17 17:18:18","0"),
("52","Costa Rica","0","2016-10-17 17:18:18","0"),
("53","Cote D\'Ivoire (Ivory Coast)","0","2016-10-17 17:18:18","0"),
("54","Croatia (Hrvatska)","0","2016-10-17 17:18:18","0"),
("55","Cuba","0","2016-10-17 17:18:18","0"),
("56","Cyprus","0","2016-10-17 17:18:18","0"),
("57","Czech Republic","0","2016-10-17 17:18:18","0"),
("58","Denmark","0","2016-10-17 17:18:18","0"),
("59","Djibouti","0","2016-10-17 17:18:18","0"),
("60","Dominica","0","2016-10-17 17:18:18","0"),
("61","Dominican Republic","0","2016-10-17 17:18:18","0"),
("62","East Timor","0","2016-10-17 17:18:18","0"),
("63","Ecuador","0","2016-10-17 17:18:18","0"),
("64","Egypt","0","2016-10-17 17:18:18","0"),
("65","El Salvador","0","2016-10-17 17:18:18","0"),
("66","Equatorial Guinea","0","2016-10-17 17:18:18","0"),
("67","Eritrea","0","2016-10-17 17:18:18","0"),
("68","Estonia","0","2016-10-17 17:18:18","0"),
("69","Ethiopia","0","2016-10-17 17:18:18","0"),
("70","External Territories of Australia","0","2016-10-17 17:18:18","0"),
("71","Falkland Islands","0","2016-10-17 17:18:18","0"),
("72","Faroe Islands","0","2016-10-17 17:18:18","0"),
("73","Fiji Islands","0","2016-10-17 17:18:18","0"),
("74","Finland","0","2016-10-17 17:18:18","0"),
("75","France","0","2016-10-17 17:18:18","0"),
("76","French Guiana","0","2016-10-17 17:18:18","0"),
("77","French Polynesia","0","2016-10-17 17:18:18","0"),
("78","French Southern Territories","0","2016-10-17 17:18:18","0"),
("79","Gabon","0","2016-10-17 17:18:18","0"),
("80","Gambia The","0","2016-10-17 17:18:18","0"),
("81","Georgia","0","2016-10-17 17:18:18","0"),
("82","Germany","0","2016-10-17 17:18:18","0"),
("83","Ghana","0","2016-10-17 17:18:18","0"),
("84","Gibraltar","0","2016-10-17 17:18:18","0"),
("85","Greece","0","2016-10-17 17:18:18","0"),
("86","Greenland","0","2016-10-17 17:18:18","0"),
("87","Grenada","0","2016-10-17 17:18:18","0"),
("88","Guadeloupe","0","2016-10-17 17:18:18","0"),
("89","Guam","0","2016-10-17 17:18:18","0"),
("90","Guatemala","0","2016-10-17 17:18:18","0"),
("91","Guernsey and Alderney","0","2016-10-17 17:18:18","0"),
("92","Guinea","0","2016-10-17 17:18:18","0"),
("93","Guinea-Bissau","0","2016-10-17 17:18:18","0"),
("94","Guyana","0","2016-10-17 17:18:18","0"),
("95","Haiti","0","2016-10-17 17:18:18","0"),
("96","Heard and McDonald Islands","0","2016-10-17 17:18:18","0"),
("97","Honduras","0","2016-10-17 17:18:18","0"),
("98","Hong Kong S.A.R.","0","2016-10-17 17:18:18","0"),
("99","Hungary","0","2016-10-17 17:18:18","0"),
("100","Iceland","0","2016-10-17 17:18:18","0");
INSERT INTO country_mst VALUES
("101","India","0","2016-10-17 17:18:18","0"),
("102","Indonesia","0","2016-10-17 17:18:18","0"),
("103","Iran","0","2016-10-17 17:18:18","0"),
("104","Iraq","0","2016-10-17 17:18:18","0"),
("105","Ireland","0","2016-10-17 17:18:18","0"),
("106","Israel","0","2016-10-17 17:18:18","0"),
("107","Italy","0","2016-10-17 17:18:18","0"),
("108","Jamaica","0","2016-10-17 17:18:18","0"),
("109","Japan","0","2016-10-17 17:18:18","0"),
("110","Jersey","0","2016-10-17 17:18:18","0"),
("111","Jordan","0","2016-10-17 17:18:18","0"),
("112","Kazakhstan","0","2016-10-17 17:18:18","0"),
("113","Kenya","0","2016-10-17 17:18:18","0"),
("114","Kiribati","0","2016-10-17 17:18:18","0"),
("115","Korea North","0","2016-10-17 17:18:18","0"),
("116","Korea South","0","2016-10-17 17:18:18","0"),
("117","Kuwait","0","2016-10-17 17:18:18","0"),
("118","Kyrgyzstan","0","2016-10-17 17:18:18","0"),
("119","Laos","0","2016-10-17 17:18:18","0"),
("120","Latvia","0","2016-10-17 17:18:18","0"),
("121","Lebanon","0","2016-10-17 17:18:18","0"),
("122","Lesotho","0","2016-10-17 17:18:18","0"),
("123","Liberia","0","2016-10-17 17:18:18","0"),
("124","Libya","0","2016-10-17 17:18:18","0"),
("125","Liechtenstein","0","2016-10-17 17:18:18","0"),
("126","Lithuania","0","2016-10-17 17:18:18","0"),
("127","Luxembourg","0","2016-10-17 17:18:18","0"),
("128","Macau S.A.R.","0","2016-10-17 17:18:18","0"),
("129","Macedonia","0","2016-10-17 17:18:18","0"),
("130","Madagascar","0","2016-10-17 17:18:18","0"),
("131","Malawi","0","2016-10-17 17:18:18","0"),
("132","Malaysia","0","2016-10-17 17:18:18","0"),
("133","Maldives","0","2016-10-17 17:18:18","0"),
("134","Mali","0","2016-10-17 17:18:18","0"),
("135","Malta","0","2016-10-17 17:18:18","0"),
("136","Man (Isle of)","0","2016-10-17 17:18:18","0"),
("137","Marshall Islands","0","2016-10-17 17:18:18","0"),
("138","Martinique","0","2016-10-17 17:18:18","0"),
("139","Mauritania","0","2016-10-17 17:18:18","0"),
("140","Mauritius","0","2016-10-17 17:18:18","0"),
("141","Mayotte","0","2016-10-17 17:18:18","0"),
("142","Mexico","0","2016-10-17 17:18:18","0"),
("143","Micronesia","0","2016-10-17 17:18:18","0"),
("144","Moldova","0","2016-10-17 17:18:18","0"),
("145","Monaco","0","2016-10-17 17:18:18","0"),
("146","Mongolia","0","2016-10-17 17:18:18","0"),
("147","Montserrat","0","2016-10-17 17:18:18","0"),
("148","Morocco","0","2016-10-17 17:18:18","0"),
("149","Mozambique","0","2016-10-17 17:18:18","0"),
("150","Myanmar","0","2016-10-17 17:18:18","0"),
("151","Namibia","0","2016-10-17 17:18:18","0"),
("152","Nauru","0","2016-10-17 17:18:18","0"),
("153","Nepal","0","2016-10-17 17:18:18","0"),
("154","Netherlands Antilles","0","2016-10-17 17:18:18","0"),
("155","Netherlands The","0","2016-10-17 17:18:18","0"),
("156","New Caledonia","0","2016-10-17 17:18:18","0"),
("157","New Zealand","0","2016-10-17 17:18:18","0"),
("158","Nicaragua","0","2016-10-17 17:18:18","0"),
("159","Niger","0","2016-10-17 17:18:18","0"),
("160","Nigeria","0","2016-10-17 17:18:18","0"),
("161","Niue","0","2016-10-17 17:18:18","0"),
("162","Norfolk Island","0","2016-10-17 17:18:18","0"),
("163","Northern Mariana Islands","0","2016-10-17 17:18:18","0"),
("164","Norway","0","2016-10-17 17:18:18","0"),
("165","Oman","0","2016-10-17 17:18:18","0"),
("166","Pakistan","0","2016-10-17 17:18:18","0"),
("167","Palau","0","2016-10-17 17:18:18","0"),
("168","Palestinian Territory Occupied","0","2016-10-17 17:18:18","0"),
("169","Panama","0","2016-10-17 17:18:18","0"),
("170","Papua new Guinea","0","2016-10-17 17:18:18","0"),
("171","Paraguay","0","2016-10-17 17:18:18","0"),
("172","Peru","0","2016-10-17 17:18:18","0"),
("173","Philippines","0","2016-10-17 17:18:18","0"),
("174","Pitcairn Island","0","2016-10-17 17:18:18","0"),
("175","Poland","0","2016-10-17 17:18:18","0"),
("176","Portugal","0","2016-10-17 17:18:18","0"),
("177","Puerto Rico","0","2016-10-17 17:18:18","0"),
("178","Qatar","0","2016-10-17 17:18:18","0"),
("179","Reunion","0","2016-10-17 17:18:18","0"),
("180","Romania","0","2016-10-17 17:18:18","0"),
("181","Russia","0","2016-10-17 17:18:18","0"),
("182","Rwanda","0","2016-10-17 17:18:18","0"),
("183","Saint Helena","0","2016-10-17 17:18:18","0"),
("184","Saint Kitts And Nevis","0","2016-10-17 17:18:18","0"),
("185","Saint Lucia","0","2016-10-17 17:18:18","0"),
("186","Saint Pierre and Miquelon","0","2016-10-17 17:18:18","0"),
("187","Saint Vincent And The Grenadines","0","2016-10-17 17:18:18","0"),
("188","Samoa","0","2016-10-17 17:18:18","0"),
("189","San Marino","0","2016-10-17 17:18:18","0"),
("190","Sao Tome and Principe","0","2016-10-17 17:18:18","0"),
("191","Saudi Arabia","0","2016-10-17 17:18:18","0"),
("192","Senegal","0","2016-10-17 17:18:18","0"),
("193","Serbia","0","2016-10-17 17:18:18","0"),
("194","Seychelles","0","2016-10-17 17:18:18","0"),
("195","Sierra Leone","0","2016-10-17 17:18:18","0"),
("196","Singapore","0","2016-10-17 17:18:18","0"),
("197","Slovakia","0","2016-10-17 17:18:18","0"),
("198","Slovenia","0","2016-10-17 17:18:18","0"),
("199","Smaller Territories of the UK","0","2016-10-17 17:18:18","0"),
("200","Solomon Islands","0","2016-10-17 17:18:18","0");
INSERT INTO country_mst VALUES
("201","Somalia","0","2016-10-17 17:18:18","0"),
("202","South Africa","0","2016-10-17 17:18:18","0"),
("203","South Georgia","0","2016-10-17 17:18:18","0"),
("204","South Sudan","0","2016-10-17 17:18:18","0"),
("205","Spain","0","2016-10-17 17:18:18","0"),
("206","Sri Lanka","0","2016-10-17 17:18:18","0"),
("207","Sudan","0","2016-10-17 17:18:18","0"),
("208","Suriname","0","2016-10-17 17:18:18","0"),
("209","Svalbard And Jan Mayen Islands","0","2016-10-17 17:18:18","0"),
("210","Swaziland","0","2016-10-17 17:18:18","0"),
("211","Sweden","0","2016-10-17 17:18:18","0"),
("212","Switzerland","0","2016-10-17 17:18:18","0"),
("213","Syria","0","2016-10-17 17:18:18","0"),
("214","Taiwan","0","2016-10-17 17:18:18","0"),
("215","Tajikistan","0","2016-10-17 17:18:18","0"),
("216","Tanzania","0","2016-10-17 17:18:18","0"),
("217","Thailand","0","2016-10-17 17:18:18","0"),
("218","Togo","0","2016-10-17 17:18:18","0"),
("219","Tokelau","0","2016-10-17 17:18:18","0"),
("220","Tonga","0","2016-10-17 17:18:18","0"),
("221","Trinidad And Tobago","0","2016-10-17 17:18:18","0"),
("222","Tunisia","0","2016-10-17 17:18:18","0"),
("223","Turkey","0","2016-10-17 17:18:18","0"),
("224","Turkmenistan","0","2016-10-17 17:18:18","0"),
("225","Turks And Caicos Islands","0","2016-10-17 17:18:18","0"),
("226","Tuvalu","0","2016-10-17 17:18:18","0"),
("227","Uganda","0","2016-10-17 17:18:18","0"),
("228","Ukraine","0","2016-10-17 17:18:18","0"),
("229","United Arab Emirates","0","2016-10-17 17:18:18","0"),
("230","United Kingdom","0","2016-10-17 17:18:18","0"),
("231","United States","0","2016-10-17 17:18:18","0"),
("232","United States Minor Outlying Islands","0","2016-10-17 17:18:18","0"),
("233","Uruguay","0","2016-10-17 17:18:18","0"),
("234","Uzbekistan","0","2016-10-17 17:18:18","0"),
("235","Vanuatu","0","2016-10-17 17:18:18","0"),
("236","Vatican City State (Holy See)","0","2016-10-17 17:18:18","0"),
("237","Venezuela","0","2016-10-17 17:18:18","0"),
("238","Vietnam","0","2016-10-17 17:18:18","0"),
("239","Virgin Islands (British)","0","2016-10-17 17:18:18","0"),
("240","Virgin Islands (US)","0","2016-10-17 17:18:18","0"),
("241","Wallis And Futuna Islands","0","2016-10-17 17:18:18","0"),
("242","Western Sahara","0","2016-10-17 17:18:18","0"),
("243","Yemen","0","2016-10-17 17:18:18","0"),
("244","Yugoslavia","0","2016-10-17 17:18:18","0"),
("245","Zambia","0","2016-10-17 17:18:18","0"),
("246","Zimbabwe","0","2017-09-27 23:45:38","0"),
("247","SADASDASDASDSAD1212","2","2019-09-09 12:47:23","1");




CREATE TABLE `cust_tempdata` (
  `cust_tempdata_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_num` int(11) NOT NULL,
  `error` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`cust_tempdata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `employee_mst` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) NOT NULL,
  `employee_name` varchar(400) NOT NULL,
  `employee_address` text NOT NULL,
  `countryid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `emp_mobile` varchar(255) NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_password` varchar(400) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `opening_balance` int(11) NOT NULL,
  `balance_typeid` int(11) NOT NULL,
  `emp_incen` varchar(100) NOT NULL,
  `inc_inv_amount` varchar(100) NOT NULL,
  `inc_inv_qty` varchar(100) NOT NULL,
  `com_type` varchar(100) NOT NULL,
  `inc_inv_com` varchar(100) NOT NULL,
  `emp_salary` varchar(100) NOT NULL,
  `multi_company` varchar(10) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `evelope_design` (
  `envelope_design_id` int(11) NOT NULL AUTO_INCREMENT,
  `env_name` varchar(200) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `from_top_margin` decimal(10,2) NOT NULL,
  `from_left_margin` decimal(10,2) NOT NULL,
  `font_size` int(11) NOT NULL,
  `font_family` varchar(50) NOT NULL,
  `line_height` int(11) NOT NULL,
  `top_margin` decimal(10,2) NOT NULL,
  `left_margin` decimal(10,2) NOT NULL,
  `env_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`envelope_design_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO evelope_design VALUES
("1","DL","9.50","4.50","2.40","0.50","20","CALIBRI","30","1.00","5.00","0","1","1"),
("2","LABEL","8.50","3.90","3.00","6.00","20","CALIBRI","25","1.00","3.00","2","0","1"),
("3","EDL","9.00","4.00","3.00","0.50","15","","25","0.50","5.00","0","0","1"),
("4","DL","9.50","4.50","1.00","0.50","20","CALIBRI","30","1.00","5.00","0","0","3");




CREATE TABLE `expense_head_mst` (
  `expense_head_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_head_name` varchar(400) NOT NULL,
  `expense_head_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `expense_master` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_head_id` int(11) NOT NULL,
  `expense_name` varchar(400) NOT NULL,
  `expense_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `expense_mst` (
  `expenseid` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `vendorid` int(11) NOT NULL,
  `place_of_supply` int(11) NOT NULL,
  `tax_type` varchar(20) NOT NULL,
  `g_total` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `invoice_no` varchar(40) NOT NULL,
  `remark` text NOT NULL,
  `payment_id` int(11) NOT NULL,
  `mst_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  PRIMARY KEY (`expenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `expense_trn` (
  `expense_trnid` int(11) NOT NULL AUTO_INCREMENT,
  `expense_acct` int(10) NOT NULL,
  `expense_grp` int(10) NOT NULL,
  `expense_mstid` int(11) NOT NULL,
  `expense_amount` decimal(10,2) NOT NULL,
  `hsn_code` varchar(250) NOT NULL,
  `expense_notes` varchar(250) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(40) NOT NULL,
  `tax_name2` varchar(40) NOT NULL,
  `tax_name3` varchar(40) NOT NULL,
  `tax_amount1` decimal(10,2) NOT NULL,
  `tax_amount2` decimal(10,2) NOT NULL,
  `tax_amount3` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_trnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `forecast_period_mst` (
  `f_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_by_id` int(11) NOT NULL,
  `f_target_period` int(11) NOT NULL,
  `f_period_name` varchar(400) NOT NULL,
  `f_period_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`f_period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;


INSERT INTO forecast_period_mst VALUES
("1","1","1","JAN","0"),
("2","1","1","FEB","0"),
("3","1","1","MAR","0"),
("4","1","1","APR","0"),
("5","1","1","MAY","0"),
("6","1","1","JUN","0"),
("7","1","1","JUL","0"),
("8","1","1","AUG","0"),
("9","1","1","SEP","0"),
("10","1","1","OCT","0"),
("11","1","1","NOV","0"),
("12","1","1","DEC","0"),
("13","1","2","JAN - MAR","0"),
("14","1","2","APR - JUN","0"),
("15","1","2","JUL - SEP","0"),
("16","1","2","OCT - DEC","0"),
("17","1","3","JAN - JUN","0"),
("18","1","3","JUL - DEC","0"),
("19","1","4","JAN - DEC","0"),
("20","2","1","APR","0"),
("21","2","1","MAY","0"),
("22","2","1","JUN","0"),
("23","2","1","JUL","0"),
("24","2","1","AUG","0"),
("25","2","1","SEP","0"),
("26","2","1","OCT","0"),
("27","2","1","NOV","0"),
("28","2","1","DEC","0"),
("29","2","1","JAN","0"),
("30","2","1","FEB","0"),
("31","2","1","MAR","0"),
("32","2","2","APR - JUN","0"),
("33","2","2","JUL - SEP","0"),
("34","2","2","OCT - DEC","0"),
("35","2","2","JAN - MAR","0"),
("36","2","3","APR - SEP","0"),
("37","2","3","OCT - MAR","0"),
("38","2","4","APR - MAR","0");




CREATE TABLE `formula_mst` (
  `formulaid` int(11) NOT NULL AUTO_INCREMENT,
  `formula_name` varchar(100) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `formula_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`formulaid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO formula_mst VALUES
("1","CGST 9% * SGST 9%","8,7","0","2019-09-25 19:05:55","1","2","1"),
("2","IGST 18%","15","0","2019-09-25 19:06:01","1","2","1"),
("3","CGST 6% * SGST 6%","6,5","0","2019-09-25 19:06:26","1","2","1"),
("4","IGST 12%","13","0","2019-09-25 19:06:32","1","2","1"),
("5","CGST 2.5% * SGST 2.5%","4,3","0","2019-09-25 19:07:04","1","2","1"),
("6","IGST 5%","12","0","2019-09-25 19:07:09","1","2","1"),
("7","CGST 14% * SGST 14%","10,9","0","2019-09-25 19:07:26","1","2","1"),
("8","IGST 28%","14","0","2019-09-25 19:07:30","1","2","1"),
("9","CGST 0% * SGST 0%","2,1","0","2019-09-25 19:07:36","1","2","1"),
("10","IGST 0%","11","0","2019-09-25 19:07:40","1","2","1");




CREATE TABLE `income_master` (
  `inc_id` int(10) NOT NULL AUTO_INCREMENT,
  `inc_name` varchar(100) NOT NULL,
  `inc_group` int(11) NOT NULL,
  `inc_status` int(10) NOT NULL,
  `cdate` date NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`inc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `income_mst` (
  `incomeid` int(11) NOT NULL AUTO_INCREMENT,
  `income_date` date NOT NULL,
  `customerid` int(11) NOT NULL,
  `place_of_supply` int(11) NOT NULL,
  `tax_type` varchar(10) NOT NULL,
  `g_total` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `invoice_no` varchar(40) NOT NULL,
  `remark` text NOT NULL,
  `payment_id` int(11) NOT NULL,
  `mst_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  PRIMARY KEY (`incomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `income_trn` (
  `income_trnid` int(11) NOT NULL AUTO_INCREMENT,
  `income_mstid` int(11) NOT NULL,
  `account_mst_id` int(11) NOT NULL,
  `income_group` int(10) NOT NULL,
  `income_amount` decimal(10,2) NOT NULL,
  `hsn_code` varchar(250) NOT NULL,
  `income_notes` varchar(250) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(40) NOT NULL,
  `tax_name2` varchar(40) NOT NULL,
  `tax_name3` varchar(40) NOT NULL,
  `tax_amount1` decimal(10,2) NOT NULL,
  `tax_amount2` decimal(10,2) NOT NULL,
  `tax_amount3` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`income_trnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `login_history` (
  `log_id` double NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `browser` varchar(20) NOT NULL,
  `version` varchar(20) NOT NULL,
  `os` varchar(30) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;


INSERT INTO login_history VALUES
("1","1","2020-06-18 17:42:31","0000-00-00 00:00:00","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("2","1","2020-06-18 18:03:50","2020-07-03 15:30:23","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("3","31","2020-06-18 19:21:08","2020-06-18 19:21:21","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("4","1","2020-06-19 11:19:48","2020-06-19 14:34:54","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("5","1","2020-06-19 14:35:12","2020-06-19 14:39:26","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("6","1","2020-06-19 14:39:42","2020-06-19 14:54:07","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("7","1","2020-06-19 15:22:16","2020-06-19 15:22:22","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("8","1","2020-06-19 15:22:51","2020-06-19 15:23:29","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("9","27","2020-06-19 15:24:32","2020-06-19 15:25:20","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("10","1","2020-06-19 15:25:29","2020-06-19 15:43:57","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("11","27","2020-06-19 15:44:29","0000-00-00 00:00:00","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("12","27","2020-06-19 15:48:47","0000-00-00 00:00:00","42.111.117.150","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("13","27","2020-06-19 16:55:28","0000-00-00 00:00:00","42.111.124.239","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("14","27","2020-06-23 16:39:29","2020-06-23 16:40:06","117.99.104.183","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("15","1","2020-06-23 16:40:22","2020-06-23 16:49:42","117.99.104.183","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("16","1","2020-06-24 12:27:07","0000-00-00 00:00:00","27.57.186.215","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("17","1","2020-06-24 12:34:27","0000-00-00 00:00:00","27.57.186.215","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("18","1","2020-06-24 12:50:25","0000-00-00 00:00:00","27.57.186.215","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("19","29","2020-06-24 12:53:00","0000-00-00 00:00:00","27.57.186.215","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("20","1","2020-06-26 10:28:48","0000-00-00 00:00:00","42.111.200.4","CHROME","78","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("21","29","2020-06-26 10:38:45","0000-00-00 00:00:00","42.111.200.4","CHROME","78","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("22","27","2020-06-26 10:45:11","0000-00-00 00:00:00","2402:3A80:87E:EBA3:71A4:7B14:28:9E28","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("23","1","2020-06-26 13:03:50","0000-00-00 00:00:00","2402:3A80:8A2:C840:B1B2:8274:3A5F:D57A","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("24","1","2020-06-26 14:19:10","2020-06-26 14:48:11","2402:3A80:8A2:C840:B1B2:8274:3A5F:D57A","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("25","1","2020-06-26 14:50:15","0000-00-00 00:00:00","2402:3A80:8A2:C840:B1B2:8274:3A5F:D57A","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("26","27","2020-06-26 14:51:57","0000-00-00 00:00:00","2402:3A80:8A2:C840:B1B2:8274:3A5F:D57A","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("27","29","2020-06-27 11:59:42","2020-06-27 12:01:12","122.170.51.203","CHROME","78","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("28","29","2020-06-27 12:03:43","0000-00-00 00:00:00","122.170.51.203","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("29","31","2020-06-27 12:10:05","0000-00-00 00:00:00","122.170.51.203","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("30","31","2020-06-27 12:15:59","0000-00-00 00:00:00","122.170.51.203","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("31","29","2020-06-29 10:25:37","0000-00-00 00:00:00","2402:8100:39A3:FC8F:989:7431:B6AF:D35C","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("32","31","2020-06-29 10:28:44","0000-00-00 00:00:00","106.76.94.13","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("33","1","2020-06-29 10:35:53","0000-00-00 00:00:00","122.170.53.90","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("34","28","2020-06-29 10:47:05","0000-00-00 00:00:00","106.76.90.15","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("35","29","2020-06-29 13:21:21","0000-00-00 00:00:00","2405:204:8205:8F54:9954:5203:8572:83D6","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("36","28","2020-06-30 10:44:32","0000-00-00 00:00:00","1.38.165.90","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("37","1","2020-06-30 11:02:32","2020-06-30 11:12:34","122.170.50.245","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("38","1","2020-06-30 11:15:02","0000-00-00 00:00:00","122.170.50.245","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("39","28","2020-06-30 11:47:10","0000-00-00 00:00:00","1.38.165.90","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("40","1","2020-06-30 12:04:59","0000-00-00 00:00:00","122.170.50.245","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("41","28","2020-06-30 13:01:17","0000-00-00 00:00:00","2402:3A80:16AF:907:9993:EF59:5DE5:EF9","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("42","1","2020-06-30 15:08:28","0000-00-00 00:00:00","2402:3A80:874:CE8B:A493:60AA:2711:C77A","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("43","1","2020-06-30 16:26:26","0000-00-00 00:00:00","103.249.232.181","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("44","28","2020-06-30 16:29:07","0000-00-00 00:00:00","42.111.212.10","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("45","29","2020-06-30 16:37:55","0000-00-00 00:00:00","2405:205:C8CF:B63D:8C82:20E5:D3FF:6D0F","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("46","29","2020-07-01 10:07:08","0000-00-00 00:00:00","2405:204:830E:5732:206E:1791:789F:EF35","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("47","28","2020-07-01 10:24:42","0000-00-00 00:00:00","2402:3A80:16AA:C5D:A080:9FA8:7A79:FFA5","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("48","29","2020-07-01 12:08:36","0000-00-00 00:00:00","2405:204:830E:5732:206E:1791:789F:EF35","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("49","28","2020-07-01 13:53:31","0000-00-00 00:00:00","42.111.220.18","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("50","29","2020-07-01 14:03:37","0000-00-00 00:00:00","2405:204:830E:5732:F926:7405:A6F0:CEC1","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("51","31","2020-07-01 14:05:40","2020-07-01 14:06:41","2405:204:830E:5732:F926:7405:A6F0:CEC1","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("52","1","2020-07-01 18:05:53","0000-00-00 00:00:00","2402:3A80:16A5:152:15BA:A0FD:6FBE:FB06","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("53","1","2020-07-02 01:08:52","0000-00-00 00:00:00","2402:3A80:16A3:235D:8943:52E8:EE67:F0F1","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("54","27","2020-07-02 01:10:54","0000-00-00 00:00:00","2402:3A80:16A3:235D:8943:52E8:EE67:F0F1","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("55","29","2020-07-02 16:01:18","0000-00-00 00:00:00","117.99.96.199","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("56","29","2020-07-03 10:15:06","0000-00-00 00:00:00","2402:3A80:16AE:E3B6:C1F3:8118:D69C:2F1","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("57","28","2020-07-03 10:32:31","0000-00-00 00:00:00","2402:3A80:16AE:E3B6:C1:9FB:E55E:79A9","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("58","28","2020-07-03 14:07:48","0000-00-00 00:00:00","2402:3A80:1306:362B:146B:116F:F32B:4FF8","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("59","31","2020-07-03 15:00:42","0000-00-00 00:00:00","122.170.32.51","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("60","32","2020-07-03 15:06:58","2020-07-03 15:14:30","122.170.32.51","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("61","32","2020-07-03 15:15:52","0000-00-00 00:00:00","122.170.32.51","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("62","32","2020-07-03 15:18:21","0000-00-00 00:00:00","122.170.32.51","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("63","1","2020-07-03 15:30:34","0000-00-00 00:00:00","122.170.32.51","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("64","1","2020-07-03 15:34:00","0000-00-00 00:00:00","122.170.32.51","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("65","1","2020-07-03 16:55:26","0000-00-00 00:00:00","122.170.32.51","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("66","32","2020-07-04 09:09:06","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("67","28","2020-07-04 11:10:47","0000-00-00 00:00:00","42.106.27.131","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("68","1","2020-07-04 16:56:41","2020-07-04 16:58:17","103.113.33.92","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("69","28","2020-07-06 10:24:04","0000-00-00 00:00:00","2402:3A80:1573:BF7E:70DE:76DB:4BA4:4528","CHROME","83","WINDOWS","GANDHINAGAR","GUJARAT","INDIA","72.6833","23.2167"),
("70","32","2020-07-06 10:28:54","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("71","29","2020-07-06 10:36:34","0000-00-00 00:00:00","2402:3A80:1573:BF7E:5102:38C4:13A0:81C7","CHROME","83","WINDOWS","GANDHINAGAR","GUJARAT","INDIA","72.6833","23.2167"),
("72","1","2020-07-06 10:59:39","0000-00-00 00:00:00","2402:3A80:1319:66BC:69D2:C12B:C2DE:B6BA","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("73","32","2020-07-06 11:18:23","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("74","1","2020-07-06 11:21:21","2020-07-06 11:31:47","27.57.174.81","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("75","1","2020-07-06 11:31:17","2020-07-06 11:46:20","2402:3A80:1303:2810:49A8:63A5:42D0:6A17","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("76","29","2020-07-06 11:34:03","2020-07-06 11:38:42","2402:3A80:1303:2810:49A8:63A5:42D0:6A17","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("77","28","2020-07-06 11:39:05","2020-07-06 11:48:31","2402:3A80:1303:2810:49A8:63A5:42D0:6A17","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("78","1","2020-07-06 11:47:13","0000-00-00 00:00:00","2402:3A80:1303:2810:49A8:63A5:42D0:6A17","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("79","29","2020-07-06 11:49:08","2020-07-06 15:57:55","2402:3A80:1B85:A992:4469:36F2:C89B:3703","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("80","27","2020-07-06 11:49:29","0000-00-00 00:00:00","2402:3A80:1303:2810:49A8:63A5:42D0:6A17","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("81","29","2020-07-06 12:10:35","2020-07-06 15:56:46","2405:205:C926:648D:4179:AAF6:FB44:11CD","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("82","1","2020-07-06 12:24:02","0000-00-00 00:00:00","27.57.174.81","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("83","1","2020-07-06 13:49:59","0000-00-00 00:00:00","2402:3A80:1303:2810:BC2E:C1B3:F359:286C","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("84","27","2020-07-06 14:04:20","0000-00-00 00:00:00","2402:3A80:1303:2810:BC2E:C1B3:F359:286C","CHROME","83","MAC","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("85","1","2020-07-06 14:34:19","0000-00-00 00:00:00","27.57.174.81","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("86","32","2020-07-06 15:09:34","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("87","28","2020-07-06 15:11:40","0000-00-00 00:00:00","42.106.26.22","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("88","27","2020-07-06 15:58:58","0000-00-00 00:00:00","27.57.174.81","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("89","34","2020-07-06 15:59:58","0000-00-00 00:00:00","2402:8100:3986:56F2:D05F:705:B7E6:76FA","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("90","34","2020-07-06 16:00:05","0000-00-00 00:00:00","2402:8100:3986:56F2:70A7:5609:E928:D327","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("91","1","2020-07-06 16:00:47","0000-00-00 00:00:00","27.57.174.81","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("92","34","2020-07-06 16:08:11","2020-07-06 18:25:52","2402:8100:3986:56F2:70A7:5609:E928:D327","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("93","29","2020-07-06 16:38:13","0000-00-00 00:00:00","2402:8100:3986:56F2:D05F:705:B7E6:76FA","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("94","32","2020-07-06 16:41:41","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("95","28","2020-07-06 16:53:58","0000-00-00 00:00:00","42.111.196.39","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("96","32","2020-07-06 17:50:35","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("97","1","2020-07-06 17:51:14","0000-00-00 00:00:00","27.57.174.81","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("98","27","2020-07-06 18:05:35","0000-00-00 00:00:00","27.57.174.81","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("99","32","2020-07-06 19:06:39","0000-00-00 00:00:00","27.57.174.81","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("100","29","2020-07-07 10:15:35","0000-00-00 00:00:00","2402:3A80:1317:29F:615A:F70E:8C57:E08E","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003");
INSERT INTO login_history VALUES
("101","28","2020-07-07 10:27:22","0000-00-00 00:00:00","2402:3A80:1318:2B33:6586:D843:2B32:B5BD","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("102","32","2020-07-07 11:27:56","0000-00-00 00:00:00","122.170.45.70","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("103","28","2020-07-07 12:08:31","0000-00-00 00:00:00","42.111.216.51","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("104","29","2020-07-07 14:08:04","0000-00-00 00:00:00","2405:205:C8E3:60E2:891D:357A:B78E:644F","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("105","28","2020-07-07 14:09:29","0000-00-00 00:00:00","2402:3A80:1306:A7CA:6586:D843:2B32:B5BD","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("106","32","2020-07-07 14:35:30","0000-00-00 00:00:00","122.170.45.70","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("107","29","2020-07-07 15:03:32","2020-07-07 15:43:36","2402:3A80:1306:A7CA:8816:5EE9:DBE2:D2D2","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("108","32","2020-07-07 15:40:25","0000-00-00 00:00:00","122.170.45.70","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("109","29","2020-07-07 15:47:09","0000-00-00 00:00:00","2402:3A80:1311:A1FC:E8E0:5C35:1161:A300","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("110","29","2020-07-07 16:35:47","0000-00-00 00:00:00","2405:205:C8E3:60E2:20E6:B6B5:6A29:254A","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("111","1","2020-07-07 17:08:09","0000-00-00 00:00:00","122.170.45.70","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("112","1","2020-07-08 00:09:13","0000-00-00 00:00:00","103.250.145.22","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("113","27","2020-07-08 00:15:04","0000-00-00 00:00:00","103.250.145.22","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("114","1","2020-07-08 00:16:25","0000-00-00 00:00:00","2409:4041:E82:DFE4:F166:4D76:3777:546C","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("115","1","2020-07-08 10:09:54","0000-00-00 00:00:00","42.106.21.0","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("116","28","2020-07-08 10:13:03","0000-00-00 00:00:00","2402:3A80:130B:EE4:DD98:7807:89C3:C77C","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("117","32","2020-07-08 10:30:54","0000-00-00 00:00:00","122.170.171.141","CHROME","80","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("118","32","2020-07-08 11:06:59","0000-00-00 00:00:00","122.170.171.141","CHROME","80","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("119","1","2020-07-08 11:39:57","0000-00-00 00:00:00","42.106.21.0","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("120","32","2020-07-08 12:43:20","0000-00-00 00:00:00","122.170.171.141","CHROME","80","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("121","1","2020-07-08 14:02:13","0000-00-00 00:00:00","122.170.171.141","CHROME","83","MAC","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("122","28","2020-07-08 14:13:04","0000-00-00 00:00:00","42.111.216.51","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("123","32","2020-07-08 15:22:15","0000-00-00 00:00:00","122.170.171.141","CHROME","80","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("124","29","2020-07-08 15:49:31","0000-00-00 00:00:00","2405:205:C828:E024:7784:1282:8006:20E0","CHROME","83","LINUX","SURAT","GUJARAT","INDIA","72.83","21.198"),
("125","1","2020-07-08 15:53:05","0000-00-00 00:00:00","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("126","28","2020-07-08 15:56:01","0000-00-00 00:00:00","42.111.216.51","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("127","1","2020-07-08 16:01:32","0000-00-00 00:00:00","122.170.171.141","CHROME","78","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("128","28","2020-07-08 17:37:46","0000-00-00 00:00:00","112.110.72.240","CHROME","83","WINDOWS","BHARUCH","GUJARAT","INDIA","72.9805","21.6948"),
("129","29","2020-07-08 17:42:52","2020-07-08 17:43:31","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("130","1","2020-07-08 17:44:18","2020-07-08 17:47:40","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("131","29","2020-07-08 17:45:23","0000-00-00 00:00:00","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("132","32","2020-07-08 18:11:45","0000-00-00 00:00:00","122.170.171.141","CHROME","80","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("133","29","2020-07-08 18:36:08","0000-00-00 00:00:00","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("134","1","2020-07-08 18:37:13","0000-00-00 00:00:00","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("135","29","2020-07-08 18:42:08","0000-00-00 00:00:00","122.170.171.141","CHROME","83","WINDOWS","MUMBAI","MAHARASHTRA","INDIA","72.8856","19.0748"),
("136","28","2020-07-09 10:07:19","0000-00-00 00:00:00","2402:3A80:16A9:92D5:F9A3:FF54:3447:6A6D","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("137","29","2020-07-09 10:08:23","0000-00-00 00:00:00","2402:3A80:16A9:92D5:F1F6:C7F2:6D6C:1143","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("138","1","2020-07-09 10:26:07","0000-00-00 00:00:00","2402:3A80:865:17FB:CCCB:83C2:100B:FD1","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("139","32","2020-07-09 10:36:46","0000-00-00 00:00:00","122.170.21.156","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("140","1","2020-07-09 11:24:10","2020-07-09 11:27:27","122.170.21.156","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("141","1","2020-07-09 11:28:13","2020-07-09 11:36:08","122.170.21.156","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("142","1","2020-07-09 11:28:46","2020-07-09 11:53:51","122.170.21.156","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("143","1","2020-07-09 11:36:09","0000-00-00 00:00:00","2402:3A80:865:17FB:3C47:DF83:F2FE:65CF","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("144","1","2020-07-09 11:39:31","2020-07-09 11:41:45","167.114.170.76","CHROME","83","WINDOWS","MONTREAL","QUEBEC","CANADA","-73.5794","45.5063"),
("145","1","2020-07-09 11:43:09","2020-07-09 11:59:25","122.170.21.156","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("146","28","2020-07-09 12:21:19","0000-00-00 00:00:00","2402:3A80:16A9:92D5:3CF1:8C5E:B916:5500","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("147","32","2020-07-09 13:14:09","0000-00-00 00:00:00","122.170.21.156","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("148","32","2020-07-09 14:35:08","0000-00-00 00:00:00","122.170.21.156","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("149","1","2020-07-09 17:31:22","0000-00-00 00:00:00","2402:3A80:895:3615:B1E0:AE73:8962:56FB","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("150","32","2020-07-10 10:27:56","0000-00-00 00:00:00","122.170.166.89","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("151","28","2020-07-10 11:57:00","0000-00-00 00:00:00","2402:3A80:1B86:E9A5:4DDE:C4CA:9748:AA31","SAFARI","AN UNKNOWN VERSION","IPHONE/IPOD","NO-DATA","NO-DATA","INDIA","77","20"),
("152","28","2020-07-10 12:01:57","2020-07-10 12:38:37","2405:205:C8CE:3F83:E43E:5AB8:E6D2:2F30","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("153","32","2020-07-10 12:05:35","0000-00-00 00:00:00","122.170.166.89","CHROME","80","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("154","32","2020-07-10 12:22:56","0000-00-00 00:00:00","122.170.166.89","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("155","29","2020-07-10 12:38:59","0000-00-00 00:00:00","2405:205:C8CE:3F83:E43E:5AB8:E6D2:2F30","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("156","1","2020-07-10 12:39:10","2020-07-10 12:47:27","2405:205:C8CE:3F83:E43E:5AB8:E6D2:2F30","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("157","32","2020-07-10 12:57:29","0000-00-00 00:00:00","122.170.166.89","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("158","1","2020-07-10 14:09:03","0000-00-00 00:00:00","42.106.17.27","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("159","28","2020-07-10 14:17:26","0000-00-00 00:00:00","2402:3A80:1B83:7679:F10F:2EBF:C8A5:23C3","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("160","29","2020-07-10 14:19:07","0000-00-00 00:00:00","2402:3A80:1B83:7679:718F:93EB:6B10:86E1","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("161","28","2020-07-10 15:00:15","0000-00-00 00:00:00","2402:3A80:1B83:7679:508:419C:B0C:7201","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("162","28","2020-07-10 15:32:47","0000-00-00 00:00:00","2402:3A80:1B83:7679:508:419C:B0C:7201","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("163","1","2020-07-10 17:01:44","0000-00-00 00:00:00","122.170.166.89","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("164","33","2020-07-10 17:21:47","2020-07-10 18:28:28","2405:205:C862:F4E5:FD9F:E834:610E:15C5","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("165","1","2020-07-10 17:55:47","0000-00-00 00:00:00","122.170.166.89","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("166","34","2020-07-10 18:29:08","2020-07-10 18:46:00","2402:3A80:8B8:5AD8:BC04:5DEE:D400:2F61","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("167","1","2020-07-10 19:58:15","2020-07-10 20:14:57","122.170.166.89","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("168","1","2020-07-10 21:44:43","0000-00-00 00:00:00","2402:3A80:16AF:C6C2:7473:9175:EE5B:27DE","CHROME","83","LINUX","SURAT","GUJARAT","INDIA","72.83","21.198"),
("169","1","2020-07-10 22:48:40","0000-00-00 00:00:00","103.86.19.119","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("170","27","2020-07-10 22:54:31","0000-00-00 00:00:00","103.86.19.119","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("171","1","2020-07-11 00:30:24","0000-00-00 00:00:00","103.86.19.119","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("172","1","2020-07-11 00:52:10","0000-00-00 00:00:00","NO-DATA","CHROME","83","LINUX","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("173","28","2020-07-11 10:19:42","0000-00-00 00:00:00","2409:4041:2E9B:52AD:3992:6BC2:FBA8:92CD","CHROME","83","WINDOWS","RAJKOT","GUJARAT","INDIA","70.7932","22.2916"),
("174","33","2020-07-11 10:21:52","0000-00-00 00:00:00","2405:205:C867:25F8:E485:31D3:1F82:15FE","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("175","34","2020-07-11 10:24:20","0000-00-00 00:00:00","2409:4041:2E9B:52AD:D0A5:1335:1C8D:389E","CHROME","83","WINDOWS","RAJKOT","GUJARAT","INDIA","70.7932","22.2916"),
("176","32","2020-07-11 10:30:24","0000-00-00 00:00:00","122.170.162.47","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("177","1","2020-07-11 10:47:32","0000-00-00 00:00:00","2402:3A80:16A2:C845:6C6A:59BC:1B33:6C28","CHROME","83","LINUX","SURAT","GUJARAT","INDIA","72.83","21.198"),
("178","32","2020-07-11 11:09:38","0000-00-00 00:00:00","122.170.162.47","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("179","1","2020-07-11 11:38:39","0000-00-00 00:00:00","1.38.160.67","CHROME","83","LINUX","SURAT","GUJARAT","INDIA","72.83","21.198"),
("180","1","2020-07-11 11:44:32","0000-00-00 00:00:00","1.38.160.67","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("181","28","2020-07-11 14:17:51","0000-00-00 00:00:00","2405:204:8587:D60E:B520:8B4D:8523:609B","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("182","32","2020-07-11 14:38:36","0000-00-00 00:00:00","122.170.162.47","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("183","1","2020-07-11 16:28:01","2020-07-11 16:31:51","122.170.162.47","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("184","1","2020-07-11 17:26:19","2020-07-11 17:27:56","2402:3A80:8D4:75D:FAB4:3A7B:AC58:E1D6","CHROME","83","LINUX","CUTTACK","ODISHA","INDIA","85.8774","20.4644"),
("185","27","2020-07-11 17:28:10","0000-00-00 00:00:00","2402:3A80:8D4:75D:FAB4:3A7B:AC58:E1D6","CHROME","83","LINUX","CUTTACK","ODISHA","INDIA","85.8774","20.4644"),
("186","1","2020-07-11 18:15:22","0000-00-00 00:00:00","122.170.162.47","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("187","1","2020-07-12 03:12:25","0000-00-00 00:00:00","2402:3A80:16A8:62CF:B11F:384E:64D3:2DE0","CHROME","83","LINUX","SURAT","GUJARAT","INDIA","72.83","21.198"),
("188","28","2020-07-12 12:07:06","2020-07-12 12:29:52","2402:3A80:16A8:8347:DD00:6E35:151D:1891","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("189","1","2020-07-12 14:36:18","0000-00-00 00:00:00","103.85.228.24","CHROME","83","WINDOWS","BORSAD","GUJARAT","INDIA","72.8982","22.4079"),
("190","1","2020-07-12 18:39:26","0000-00-00 00:00:00","2402:3A80:859:8B7A:F060:BA28:9FA4:306","CHROME","83","LINUX","NO-DATA","NO-DATA","INDIA","77","20"),
("191","1","2020-07-12 20:36:14","0000-00-00 00:00:00","2402:3A80:859:8B7A:F060:BA28:9FA4:306","CHROME","83","LINUX","NO-DATA","NO-DATA","INDIA","77","20"),
("192","28","2020-07-13 10:19:37","0000-00-00 00:00:00","42.111.208.17","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("193","29","2020-07-13 10:21:57","0000-00-00 00:00:00","42.111.192.70","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("194","27","2020-07-13 10:23:02","0000-00-00 00:00:00","2402:3A80:16A2:89A0:99D2:EFE4:827C:B719","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("195","1","2020-07-13 10:32:49","0000-00-00 00:00:00","2402:3A80:16A2:89A0:99D2:EFE4:827C:B719","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("196","33","2020-07-13 10:35:27","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("197","28","2020-07-13 10:38:34","0000-00-00 00:00:00","2405:205:C80F:7DC2:D456:9401:E6F2:23A9","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("198","29","2020-07-13 11:12:35","0000-00-00 00:00:00","2402:3A80:1305:7ECE:396F:F1EF:C23A:31BC","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("199","28","2020-07-13 11:32:29","0000-00-00 00:00:00","2402:3A80:1301:16CB:95C7:82E2:7175:63A7","SAFARI","AN UNKNOWN VERSION","IPHONE/IPOD","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("200","32","2020-07-13 11:40:09","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063");
INSERT INTO login_history VALUES
("201","1","2020-07-13 12:17:28","0000-00-00 00:00:00","2402:3A80:1305:4D9C:C853:A19A:E94D:AE4D","CHROME","78","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("202","1","2020-07-13 12:23:43","0000-00-00 00:00:00","2402:3A80:16A2:89A0:ADAF:315C:A274:D506","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("203","27","2020-07-13 12:29:52","0000-00-00 00:00:00","2402:3A80:16A2:89A0:ADAF:315C:A274:D506","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("204","32","2020-07-13 13:18:47","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("205","28","2020-07-13 13:19:07","0000-00-00 00:00:00","2402:3A80:1301:16CB:4C8E:49C9:96E7:CE6E","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("206","27","2020-07-13 13:53:14","0000-00-00 00:00:00","2402:3A80:16A2:89A0:C4B0:D01D:1FED:4A9","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("207","32","2020-07-13 15:13:32","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("208","1","2020-07-13 15:23:18","0000-00-00 00:00:00","2402:3A80:16A2:89A0:219E:2A1D:DA5A:42E2","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("209","28","2020-07-13 15:46:27","0000-00-00 00:00:00","42.111.208.17","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("210","28","2020-07-13 16:45:56","0000-00-00 00:00:00","42.111.208.17","CHROME","83","WINDOWS","VADODARA","GUJARAT","INDIA","73.2051","22.3003"),
("211","33","2020-07-13 16:48:54","0000-00-00 00:00:00","2405:204:8085:29F0:3C00:AF95:C7CB:3D4D","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("212","1","2020-07-13 17:00:25","0000-00-00 00:00:00","2402:3A80:16A2:89A0:FD4F:42B4:3FC9:6282","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("213","27","2020-07-13 17:06:50","2020-07-13 17:10:00","2402:3A80:16A2:89A0:FD4F:42B4:3FC9:6282","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("214","36","2020-07-13 17:10:16","2020-07-13 17:11:32","2402:3A80:16A2:89A0:FD4F:42B4:3FC9:6282","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("215","36","2020-07-13 17:12:25","0000-00-00 00:00:00","2402:3A80:16A2:89A0:FD4F:42B4:3FC9:6282","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("216","28","2020-07-13 17:12:42","0000-00-00 00:00:00","2402:3A80:894:8C1E:68EC:B283:E72D:B574","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("217","1","2020-07-13 17:22:17","0000-00-00 00:00:00","2402:3A80:897:F66F:99C8:A2A:B588:95B0","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("218","32","2020-07-13 17:55:14","0000-00-00 00:00:00","NO-DATA","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77.006","20.0063"),
("219","27","2020-07-13 18:42:28","0000-00-00 00:00:00","2402:3A80:16A2:89A0:A863:75A2:42A7:84C6","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("220","1","2020-07-13 18:52:08","0000-00-00 00:00:00","2402:3A80:16A2:89A0:F12F:A0C0:8E1A:7C58","CHROME","83","MAC","SURAT","GUJARAT","INDIA","72.83","21.198"),
("221","1","2020-07-13 20:38:26","0000-00-00 00:00:00","103.250.145.255","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("222","1","2020-07-14 00:20:27","0000-00-00 00:00:00","103.250.145.255","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("223","29","2020-07-14 09:47:29","0000-00-00 00:00:00","2405:205:C8A5:3644:F960:8FEB:3D55:66D5","CHROME","83","WINDOWS","NO-DATA","NO-DATA","INDIA","77","20"),
("224","32","2020-07-14 10:20:15","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("225","27","2020-07-14 10:46:23","0000-00-00 00:00:00","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("226","1","2020-07-14 10:53:46","2020-07-14 12:27:21","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("227","32","2020-07-14 11:40:25","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("228","32","2020-07-14 12:27:36","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("229","33","2020-07-14 12:39:25","0000-00-00 00:00:00","2405:204:8084:A73A:BC11:E3F2:3D2:2567","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("230","32","2020-07-14 13:04:54","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("231","28","2020-07-14 13:07:22","0000-00-00 00:00:00","2402:3A80:16AF:1284:855B:C416:8F96:242A","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("232","32","2020-07-14 13:43:19","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("233","28","2020-07-14 14:08:44","0000-00-00 00:00:00","2402:3A80:16AF:1284:855B:C416:8F96:242A","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("234","1","2020-07-14 14:14:17","0000-00-00 00:00:00","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("235","27","2020-07-14 14:15:20","0000-00-00 00:00:00","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("236","29","2020-07-14 14:21:12","2020-07-14 14:23:42","150.129.165.169","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("237","1","2020-07-14 15:02:23","0000-00-00 00:00:00","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("238","28","2020-07-14 16:02:04","0000-00-00 00:00:00","2402:3A80:16AF:1284:855B:C416:8F96:242A","CHROME","83","WINDOWS","SURAT","GUJARAT","INDIA","72.83","21.198"),
("239","1","2020-07-14 16:02:56","0000-00-00 00:00:00","122.170.47.144","CHROME","83","MAC","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("240","32","2020-07-14 16:45:14","0000-00-00 00:00:00","122.170.47.144","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("241","1","2020-07-14 17:18:48","0000-00-00 00:00:00","2409:4041:E86:8023:E982:974A:B8A4:5F80","CHROME","83","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276");




CREATE TABLE `mode_of_dispatch` (
  `mode_dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_dispatch` varchar(250) NOT NULL,
  `mode_des_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`mode_dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `module_mst` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO module_mst VALUES
("1","Admin","0","2019-09-02 12:14:25","0"),
("2","Customer","0","2019-09-02 12:14:25","0"),
("3","Opportunity","0","2019-09-02 12:14:40","0"),
("4","Activity","0","2019-09-02 12:14:40","0"),
("5","Quotation","0","2019-09-02 12:14:53","0"),
("6","Forecast","0","2019-09-02 12:14:53","0");




CREATE TABLE `pay_terms` (
  `terms_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_terms` varchar(250) NOT NULL,
  `payment_days` int(11) NOT NULL,
  `terms_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`terms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `payment_mode` (
  `mode_id` double NOT NULL AUTO_INCREMENT,
  `mode_name` varchar(100) NOT NULL,
  `mode_status` int(11) NOT NULL DEFAULT '1',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` double NOT NULL,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO payment_mode VALUES
("1","CASH","1","2016-11-22 23:23:05","0"),
("2","CHEQUE","1","2016-11-22 23:23:07","0"),
("3","NEFT","1","2016-11-22 23:23:09","0"),
("4","RTGS","1","2016-11-22 23:23:12","0");




CREATE TABLE `state_mst` (
  `stateid` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL,
  `gst_state_code` int(11) NOT NULL,
  `countryid` int(11) NOT NULL,
  `state_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;


INSERT INTO state_mst VALUES
("1","Gujarat","24","101","0","2018-04-13 12:21:41","0","0"),
("2","Andhra Pradesh","28","101","0","2018-04-13 12:21:41","0","0"),
("3","Arunachal Pradesh","12","101","0","2018-04-13 12:21:41","0","0"),
("4","Assam","18","101","0","2018-04-13 12:21:41","0","0"),
("5","Bihar","10","101","0","2018-04-13 12:21:41","0","0"),
("6","Chhattisgarh","22","101","0","2018-04-13 12:21:41","0","0"),
("7","Goa","30","101","0","2018-04-13 12:21:41","0","0"),
("9","Haryana","6","101","0","2018-04-13 12:21:41","0","0"),
("10","Himachal Pradesh","2","101","0","2018-04-13 12:21:41","0","0"),
("11","Jammu & Kashmir","1","101","0","2018-04-13 12:21:41","0","0"),
("12","Jharkhand","20","101","0","2018-04-13 12:21:41","0","0"),
("13","Karnataka","29","101","0","2018-04-13 12:21:41","0","0"),
("14","Kerala","32","101","0","2018-04-13 12:21:41","0","0"),
("15","Madhya Pradesh","23","101","0","2018-04-13 12:21:41","0","0"),
("16","Maharashtra","27","101","0","2018-04-13 12:21:41","0","0"),
("17","Manipur","14","101","0","2018-04-13 12:21:41","0","0"),
("18","Meghalaya","17","101","0","2018-04-13 12:21:41","0","0"),
("19","Mizoram","15","101","0","2018-04-13 12:21:41","0","0"),
("20","Nagaland","13","101","0","2018-04-13 12:21:41","0","0"),
("21","Odisha (Formerly Orissa","21","101","0","2018-04-13 12:21:41","0","0"),
("22","Punjab","3","101","0","2018-04-13 12:21:41","0","0"),
("23","Rajasthan","8","101","0","2018-04-13 12:21:41","0","0"),
("24","Sikkim","11","101","0","2018-04-13 12:21:41","0","0"),
("25","Tamil Nadu","33","101","0","2018-04-13 12:21:41","0","0"),
("26","Tripura","16","101","0","2018-04-13 12:21:41","0","0"),
("27","Uttar Pradesh","9","101","0","2018-04-13 12:21:41","0","0"),
("29","West Bengal","19","101","0","2018-04-13 12:21:41","0","0"),
("32","Delhi","7","101","0","2018-04-13 12:21:41","0","0"),
("34","DUBAI","0","229","0","2018-04-13 14:37:03","0","0"),
("35","ABU DHABI","0","229","0","2018-04-13 17:02:04","0","0"),
("36","DEMO","0","101","2","2019-09-09 12:48:01","0","0"),
("37","DEMO TEST1","898981","101","2","2019-09-09 12:47:59","0","0"),
("38","SSS","12","96","2","2019-09-09 12:47:46","0","0"),
("39","1231","123123","95","2","2019-09-09 12:47:53","0","0");




CREATE TABLE `task_alert_mst` (
  `task_alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_alert_name` varchar(400) NOT NULL,
  `task_gap_minutes` bigint(20) NOT NULL,
  `task_alert_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO task_alert_mst VALUES
("1","None","0","0"),
("2","At the Time of Event","0","0"),
("3","5 Minutes Before","5","0"),
("4","15 Minutes Before","15","0"),
("5","30 Minutes Before","30","0"),
("6","1 Hour Before","60","0"),
("7","1 Day Before","1440","0"),
("8","1 Week Before","10080","0");




CREATE TABLE `task_priority_mst` (
  `task_priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_priority_name` varchar(400) NOT NULL,
  `task_priority_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO task_priority_mst VALUES
("1","High","0"),
("2","Medium","0"),
("3","Low","0");




CREATE TABLE `task_rel_mst` (
  `task_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_rel_name` varchar(400) NOT NULL,
  `task_rel_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO task_rel_mst VALUES
("1","General","0"),
("2","AMC","0"),
("3","Person","0"),
("4","Company","0"),
("5","Inquiry","0");




CREATE TABLE `tbl_annexure` (
  `an_id` int(10) NOT NULL AUTO_INCREMENT,
  `an_name` varchar(400) NOT NULL,
  `an_priority` int(11) NOT NULL,
  `an_detail` longtext NOT NULL,
  `an_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`an_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO tbl_annexure VALUES
("1"," ANNEXURE I: BASIS OF DESIGN","0","<span style=\"font-size:18px;\">Untreated Effluent Parameters( Assumed)</span>\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"716\">\n	<tbody>\n		<tr height=\"17\">\n			<td height=\"17\" width=\"249\">\n			<p>Daily Flow (Maximum)</p>\n			</td>\n			<td width=\"468\">\n			<p>300 m3/Day</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>PH</p>\n			</td>\n			<td width=\"468\">\n			<p>5.5-9.5</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>COD</p>\n			</td>\n			<td width=\"468\">\n			<p>350 mg/l</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>BOD</p>\n			</td>\n			<td width=\"468\">\n			<p>250mg/l</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>TSS</p>\n			</td>\n			<td width=\"468\">\n			<p>150-200 mg/l</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n<br />\n<span style=\"font-size:18px;\">Treated Effluent Parameters :</span>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"716\">\n	<tbody>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>PH</p>\n			</td>\n			<td width=\"468\">\n			<p>6.5-8.5</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>COD</p>\n			</td>\n			<td width=\"468\">\n			<p><100mg/l</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>BOD</p>\n			</td>\n			<td width=\"468\">\n			<p><30mg/l</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p>TSS</p>\n			</td>\n			<td width=\"468\">\n			<p><10mg/l</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n","0","2019-11-24 12:48:59","1","1"),
("2","ANNEXURE ETP (MSEP)","0","<h1 align=\"center\"><u>Annexure: I</u></h1>\n\n<p align=\"center\"><b><u>DESIGN BASIS of ETP</u></b></p>\n\n<p><b>Â </b></p>\n\n<p><b>Â </b></p>\n\n<p><b>1.1Â Â  </b><b>UNTREATED EFFLUENT PARAMETERS (ASSUMED):</b></p>\n\n<p><b>Â </b></p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"687\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Daily Flow (Maximum)</p>\n			</td>\n			<td width=\"448\">\n			<p>15 m<sup>3</sup>/Day</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>PH</p>\n			</td>\n			<td width=\"448\">\n			<p>6.5-7.5</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>COD</p>\n			</td>\n			<td width=\"448\">\n			<p>1200-1700 mg/l</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>BOD</p>\n			</td>\n			<td width=\"448\">\n			<p>500-600 mg/l</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>TSS</p>\n			</td>\n			<td width=\"448\">\n			<p>1000-1200 mg/l</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<p><b>1.2Â Â  </b><b>TREATED EFFLUENT QUALITY:</b></p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"687\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>PH</p>\n			</td>\n			<td width=\"448\">\n			<p>7-7.5</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>COD</p>\n			</td>\n			<td width=\"448\">\n			<p><250 mg/l</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>BOD</p>\n			</td>\n			<td width=\"448\">\n			<p><30 mg/l</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>TSS</p>\n			</td>\n			<td width=\"448\">\n			<p><40 mg/l</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p><b>Â </b></p>\n\n<p align=\"center\"><b><u>Annexure: II</u></b></p>\n\n<p><b><u>Â </u></b></p>\n\n<p><b>EQUIPMENT LIST</b></p>\n\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"638\">\n	<tbody>\n		<tr>\n			<td colspan=\"6\" valign=\"top\" width=\"638\">\n			<p><b>Scope of Supply â€“ By Environ</b></p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p>Sr. No.</p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Item Description</p>\n			</td>\n			<td width=\"161\">\n			<p>Quantity</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">1.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Bar Screener</p>\n			</td>\n			<td width=\"161\">\n			<p>1 Nos</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">2.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Oil Skimmer</p>\n			</td>\n			<td width=\"161\">\n			<p>1Nos</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">3.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Raw Effluent Transfer Pump</p>\n			</td>\n			<td width=\"161\">\n			<p>2 No. (1W+1S)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">4.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Neutralization tank</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>2 No. MSEP</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">5.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Agitator</p>\n			</td>\n			<td width=\"161\">\n			<p>1 Lot.</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">6.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Sludge Transfer Pump</p>\n			</td>\n			<td width=\"161\">\n			<p>2 No. (1W+1S)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">7.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Primary Settling tank</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No. MSEP</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">8.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Aeration Tank</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No. MSEP</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">9.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Root Â Blower</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">10.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Secondary Settling tank</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No. MSEP</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">11.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Holding Tank</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No. MSEP</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" valign=\"top\" width=\"61\">\n			<p align=\"center\">12.Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Filter Feed PumpÂ </p>\n			</td>\n			<td width=\"161\">\n			<p>2 No. (1W+1S)</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">13.Â  Â </p>\n			</td>\n			<td colspan=\"3\" width=\"417\">\n			<p>Sand Filter</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">14.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"top\" width=\"417\">\n			<p>Activated Carbon Filter</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">15.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"bottom\" width=\"417\">\n			<p>Control panel</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>As per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">16.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"bottom\" width=\"417\">\n			<p>Inter cabling work</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>As per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">17.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"bottom\" width=\"417\">\n			<p>Inter Connecting Piping and accessories</p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>Std. Make</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"2\" width=\"61\">\n			<p align=\"center\">18.Â  Â </p>\n			</td>\n			<td colspan=\"3\" valign=\"bottom\" width=\"417\">\n			<p>Â </p>\n			</td>\n			<td valign=\"top\" width=\"161\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"6\" valign=\"top\" width=\"638\">\n			<p><b>Scope of Supply â€“ Client ( Civil)</b></p>\n\n			<p><b>All tankâ€™s volume is in m3 </b></p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"59\">\n			<p align=\"center\">1.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"213\">\n			<p>Collection Tank</p>\n			</td>\n			<td valign=\"top\" width=\"203\">\n			<p>As per Design</p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"163\">\n			<p>RCCÂ Â Â Â Â Â Â Â Â Â Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"59\">\n			<p align=\"center\">2.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"213\">\n			<p>Final Holding Tank</p>\n			</td>\n			<td valign=\"top\" width=\"203\">\n			<p>As per Design</p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"163\">\n			<p>RCCÂ Â Â Â Â Â Â Â Â Â Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"59\">\n			<p align=\"center\">3.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"213\">\n			<p>Sludge Bed</p>\n			</td>\n			<td valign=\"top\" width=\"203\">\n			<p>As per Design</p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"163\">\n			<p>Brick</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"59\">\n			<p align=\"center\">4.Â Â Â Â Â  Â </p>\n			</td>\n			<td colspan=\"2\" width=\"213\">\n			<p>Miscellaneous Civil Work</p>\n\n			<p>( Foundation )Â </p>\n			</td>\n			<td width=\"203\">\n			<p>As per Requirement</p>\n			</td>\n			<td colspan=\"2\" valign=\"top\" width=\"163\">\n			<p>RCC</p>\n			</td>\n		</tr>\n		<tr height=\"0\">\n			<td width=\"59\">Â </td>\n			<td width=\"2\">Â </td>\n			<td width=\"211\">Â </td>\n			<td width=\"203\">Â </td>\n			<td width=\"3\">Â </td>\n			<td width=\"161\">Â </td>\n		</tr>\n	</tbody>\n</table>\n\n<p><b><u>Â </u></b></p>\n\n<p align=\"center\"><b><u>Annexure: III</u></b></p>\n\n<p><b><u>Â </u></b></p>\n\n<p><b><u>DETAILED TECHNICAL DATA SHEET</u></b></p>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p><b>Collection Tank </b></p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>1 No</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>CapacityÂ  ( Liquid Volume )</p>\n			</td>\n			<td width=\"392\">\n			<p>As Per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Dimension</p>\n			</td>\n			<td width=\"392\">\n			<p>To Be Provided</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>RCC / Civil</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Raw Effluent Transfer Pump</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 No. ( 1W + 1S )</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Rate</p>\n			</td>\n			<td width=\"392\">\n			<p>0.75 m<sup>3 </sup></p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>CI / SS</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Head</p>\n			</td>\n			<td width=\"392\">\n			<p>10 â€“ 15 Meter</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Speed</p>\n			</td>\n			<td width=\"392\">\n			<p>1440 RPM</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Horizontal, Non-Clog, Centrifugal</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"392\">\n			<p>Kirloskar/Â  Lubi / Indoforce/Equivalent</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Neutralization Tank</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Capacity ( Liquid Volume )</p>\n			</td>\n			<td width=\"392\">\n			<p>As Per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Dimension</p>\n			</td>\n			<td width=\"392\">\n			<p>To Be Provided</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>MSEP</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Flocculation tank</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Capacity ( Liquid Volume )</p>\n			</td>\n			<td width=\"392\">\n			<p>As Per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Dimension</p>\n			</td>\n			<td width=\"392\">\n			<p>To Be Provided</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>MSEP</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Agitator</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 No</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Propeller Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Turbine</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC Shaft Propeller</p>\n			</td>\n			<td width=\"392\">\n			<p>MS-FRP</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Agitator RPM</p>\n			</td>\n			<td width=\"392\">\n			<p>45</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Gear Box Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Worm</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Gear Box Make</p>\n			</td>\n			<td width=\"392\">\n			<p>Greaves/ Transtech / Elecon / Equivalent</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Dosing System</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 No</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Propeller Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Turbine / Blade Type</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC Shaft Propeller</p>\n			</td>\n			<td width=\"392\">\n			<p>MSFRP</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Agitator RPM</p>\n			</td>\n			<td width=\"392\">\n			<p>45</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Gear Box Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Worm</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Gear Box Make</p>\n			</td>\n			<td width=\"392\">\n			<p>Greaves/ Transtech / Elecon / Equivalent</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Drum MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>HDPE</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Aeration tank</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Capacity</p>\n			</td>\n			<td width=\"392\">\n			<p>As Per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Dimension</p>\n			</td>\n			<td width=\"392\">\n			<p>As Per Design</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>MSEP</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Root Blower</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 No. ( 1W + 1S )</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Tri Lobe Rotary Blower</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Pressure</p>\n			</td>\n			<td width=\"392\">\n			<p>0.5 kg / cm2</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type Of Cooling</p>\n			</td>\n			<td width=\"392\">\n			<p>Air Cooling</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type Of Drive</p>\n			</td>\n			<td width=\"392\">\n			<p>V-Belt Drive</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Frequency</p>\n			</td>\n			<td width=\"392\">\n			<p>50 HZ</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Air Flow</p>\n			</td>\n			<td width=\"392\">\n			<p>10-20 m<sup>3 / </sup>Hr</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Suction Temperature</p>\n			</td>\n			<td width=\"392\">\n			<p>Ambient</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Direction</p>\n			</td>\n			<td width=\"392\">\n			<p>Horizontal</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make Of Blower</p>\n			</td>\n			<td width=\"392\">\n			<p>Usha / TMVT / Shreeji/ Equivalent</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Air Diffusers</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>1 Lot</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Tubular Fine Bubble</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Dimension</p>\n			</td>\n			<td width=\"392\">\n			<p>63 x 1000</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Operating Air Temperature</p>\n			</td>\n			<td width=\"392\">\n			<p>5-80Â°C</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>EPDM / Hige Grade Silicon / Equivalent</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"392\">\n			<p>Airfin/ Fivebro / Equivalent</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Settling Tank</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 Nos</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Paint</p>\n			</td>\n			<td width=\"392\">\n			<p>All Part Are Painted WithÂ  Coates Of Epoxy Paints</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>CAPACITY</p>\n			</td>\n			<td width=\"392\">\n			<p>AS PER DESIGN</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>Â MSEP</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"631\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Re- Circulation Pump</p>\n			</td>\n			<td width=\"392\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"392\">\n			<p>2 No ( 1W + 1S )</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Rate</p>\n			</td>\n			<td width=\"392\">\n			<p>0.75m<sup>3 / </sup>Hr</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"392\">\n			<p>CI / SS</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Head</p>\n			</td>\n			<td width=\"392\">\n			<p>10-15 Meter</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"392\">\n			<p>Centrifugal, Coupled, Non Clog</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"392\">\n			<p>Kirloskar/ Lubi/ Indoforce / Equivelant</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"621\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Filter Feed Pump</p>\n			</td>\n			<td width=\"383\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"383\">\n			<p>2 No. ( 1W + 1S )</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Rate</p>\n			</td>\n			<td width=\"383\">\n			<p>0.75 m<sup>3 / </sup>Hr</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"383\">\n			<p>CI / SS</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Head</p>\n			</td>\n			<td width=\"383\">\n			<p>20 â€“ 25 Meter</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"383\">\n			<p>Centrifugal, Mono Block</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"383\">\n			<p>Kirloskar/ Lubi/ Indoforce / Equivelant</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"621\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Pressure sand Filter</p>\n			</td>\n			<td width=\"383\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"383\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Rate</p>\n			</td>\n			<td width=\"383\">\n			<p>0.75m<sup>3 / </sup>Hr</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"383\">\n			<p>FRP</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Duration Of Backwash</p>\n			</td>\n			<td width=\"383\">\n			<p>10 â€“ 15 Minutes</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Pressure</p>\n			</td>\n			<td width=\"383\">\n			<p>2.5 Kg/cm<sup>2</sup></p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"383\">\n			<p>Pentair / Starlite / Equiv.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Application</p>\n			</td>\n			<td width=\"383\">\n			<p>To Remove Suspended Solids / Undissolved Impurities</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"621\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p>Activated carbon Filter</p>\n			</td>\n			<td width=\"383\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"383\">\n			<p>1 No.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Flow Rate</p>\n			</td>\n			<td width=\"383\">\n			<p>0.75m<sup>3 / </sup>Hr</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"383\">\n			<p>FRP</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Duration Of Backwash</p>\n			</td>\n			<td width=\"383\">\n			<p>10 â€“ 15 Minutes</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Pressure</p>\n			</td>\n			<td width=\"383\">\n			<p>2.5 Kg/cm<sup>2</sup></p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Make</p>\n			</td>\n			<td width=\"383\">\n			<p>Pentair / Starlite / Equiv.</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Top â€“ Bottom Distribution</p>\n			</td>\n			<td width=\"383\">\n			<p>Strainer</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Application</p>\n			</td>\n			<td width=\"383\">\n			<p>To Remove Suspended Solids / Undissolved Impurities</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"621\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p><b>Interconnecting Piping & Valves</b></p>\n			</td>\n			<td width=\"383\">\n			<p>Â </p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Quantity</p>\n			</td>\n			<td width=\"383\">\n			<p>1 Lot</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Types</p>\n			</td>\n			<td width=\"383\">\n			<p>UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Valves</p>\n			</td>\n			<td width=\"383\">\n			<p>Butterfly Valve, Ball Valve and Isolation Valves As Required</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Supports</p>\n			</td>\n			<td width=\"383\">\n			<p>Pipe Supports For Interconnecting Piping And Skid</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"383\">\n			<p>UPVC / HDPE / GI / MS</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"621\">\n	<tbody>\n		<tr>\n			<td width=\"239\">\n			<p><b>Electric Control Panel</b></p>\n			</td>\n			<td width=\"383\">Â </td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>MOC</p>\n			</td>\n			<td width=\"383\">\n			<p>MS Foot Mounted MS Powder Coating</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Type</p>\n			</td>\n			<td width=\"383\">\n			<p>Free Standing Cubical</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Contact Parts</p>\n			</td>\n			<td width=\"383\">\n			<p>L&T / Schneider</p>\n			</td>\n		</tr>\n		<tr>\n			<td width=\"239\">\n			<p>Wire</p>\n			</td>\n			<td width=\"383\">\n			<p>Copper</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Â </p>\n","0","2019-12-01 07:28:43","1","1"),
("3","ANNEXURE II :DISCRIPTION OF THE TREATMENT SCHEME (SBR)","0","<span style=\"font-size:12px;\">This system contain only two tanks which includes total four phases in the whole operation cycle. The four phase operation cycleis described below;</span><br />\n<br />\n<u><strong><span style=\"font-size:14px;\">Loading Phase:</span></strong></u><br />\n<span style=\"font-size:12px;\">The wastewater is initially fed into the sludge tank (1stchamber) where solid constituents are removed. From here, the wastewater is then gradually led into the SBR tank (2nd Chamber).</span><br />\n<br />\n<u><strong><span style=\"font-size:16px;\">Aeration Phase:</span></strong></u><br />\n<span style=\"font-size:12px;\">The SBR tank is where the actual biological treatment process takes place. Here, short aeration and rest phases alternate with one another within the scope of a controlled cleaning process. This means that the so-called activated sludge with its millions of microorganisms can develop and treat the water thoroughly</span><br />\n<br />\n<u><strong><span style=\"font-size:16px;\">Rest Phase</span></strong></u><br />\n<span style=\"font-size:12px;\">During the 90 minute rest phase, the activated sludge then settles on the bottom of the tank. A clear water zone forms on the upper part of the SBR tank</span><br />\n<br />\n<u><strong><span style=\"font-size:16px;\">Clearwater Extraction</span></strong></u><br />\n<span style=\"font-size:12px;\">The separated clear water is then led from the SBR tank to the receiving water (stream, river or lake) or into a percolation system. Afterwards, the sludge is returned to the first chamber from the SBR tank and the process starts again from the beginning.</span><br />\nÂ ","0","2019-11-24 12:50:27","1","1"),
("4"," ANNEXURE I: BASIS OF DESIGN (SBR)","0","<span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Untreated Effluent Parameters( Assumed)</span></span>\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"716\">\n	<tbody>\n		<tr height=\"17\">\n			<td height=\"17\" width=\"249\">\n			<p><span style=\"font-size:12px;\">Daily Flow (Maximum)</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">300 m3/Day</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">PH</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">5.5-9.5</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">COD</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">350 mg/l</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">BOD</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">250mg/l</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">TSS</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">150-200 mg/l</span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n<br />\n<span style=\"font-size:18px;\">Treated Effluent Parameters :</span>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"716\">\n	<tbody>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">PH</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\">6.5-8.5</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">COD</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\"><100mg/l</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">BOD</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\"><30mg/l</span></p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"249\">\n			<p><span style=\"font-size:12px;\">TSS</span></p>\n			</td>\n			<td width=\"468\">\n			<p><span style=\"font-size:12px;\"><10mg/l</span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<ul>\n	<li>Â <span style=\"font-size:12px;\">The quality and quantity of treated water will be based on the raw/feed water quality and quantity. Any change in raw/feed water quality and/or quantity, it will reflect in the treated water quality and/or quantity.</span></li>\n	<li><span style=\"font-size:12px;\">The treated sewage can be utilized for gardening, horticulture and/or irrigation purpose.</span></li>\n</ul>\n<span style=\"font-size:18px;\"><strong>ABOUT THE TECHNOLOGY</strong></span><br />\nEnviron is the pioneer in sewage treatment systems that are fully automatic, efficient and meet the treatment standards whichare higher than the statutory requirements. Our treatment systems have won the confidence of many clients and every client has been testimonial to the plant performance. The choice of the electro-mechanical equipment and the meticulous design set us ahead in the market for high quality sewage treatment systems.\n<ul>\n	<li>ïƒ˜ Fully automatic sewage treatment systems by Environ can be installed and retrofitted in the plastic or concrete container at any time.</li>\n	<li>ïƒ˜ Fully biological small wastewater treatment plant based on the SBR principle.</li>\n	<li>ïƒ˜ Single or multiple container models from 1 KLD to 500 KLD.</li>\n	<li>ïƒ˜ Energy-efficient due to fine-bubble pressure diffusion and ventilation.</li>\n	<li>ïƒ˜ Due to the compact design, Environ saves large space which is advantageous to the Real Estate Developers and promoters as more space will be available for construction, recreation and other developments.</li>\n	<li>ïƒ˜ No need for centralized plumbing as each villa can have its own STP.</li>\n	<li>ïƒ˜ Reduces operation and maintenance burden/costs for associations and Reduces electricity costs to almost 75%.</li>\n	<li>ïƒ˜ No need for a full time service person to maintain sewage tanks.</li>\n	<li>ïƒ˜ Need not evacuate sludge on a frequent mode, can be done once in a year or more.</li>\n	<li>ïƒ˜ Need not have a large room for sewage treatment plant; this can be fitted within a small underground space.</li>\n	<li>ïƒ˜ Automated maintenance system with 24/7 dashboard links to CPU, smart phones, with email and message (sms) indications.</li>\n	<li>ïƒ˜ Any emergency operations can be done through internet or mobile phone. User controls given to each users including operations or just view only.</li>\n	<li>ïƒ˜ Intelligent system with auto sleeps and holiday mode when less inflow, ideal for development where there is lesser number of people during weekdays.</li>\n	<li>ïƒ˜ Water can be reused for gardening purpose, with almost zero smell, further the water can be filtered for toilet reuse with additional simple filter units.</li>\n</ul>\n","0","2019-11-24 12:48:41","1","1"),
("5","ANNEXURE II SCOPE OF SUPPLY -ENVIRON (SBR)","0","<strong>SCOPE OF SUPPLY -ENVIRON</strong><br />\n<br />\n1.Â  Plant will beÂ retrofitted in the underground tank<br />\n2. The Two Chamber Pit Consists Of : Mounting Parts;\n<ul>\n	<li>Charging Air</li>\n	<li>Lifter Clear Water Air Lifter</li>\n	<li>Excessive Air Sludge Lifter</li>\n</ul>\n3. ENVIRON - Hose Set Membrane Air Diffuser\n\n<ul>\n	<li>MOC:Â Stainless Steel Air Supply System</li>\n	<li>Types :Finely Perforated EPDM</li>\n</ul>\n4.Â Fixing Material Machine Technology For Indoor Installation, In A Cool, Dry And Dust-free Environment\n\n<ul>\n	<li>Compressor Rotary Vane Compressor Â (0.75 Kw, 220v, 1 ~) : 01 Nos</li>\n	<li>Microprocessor Control With Preset Work Cycles, Real-time Controlled, Graphic Display,14 Operating Keys, Operating Hours Counter, Optional Manual And Automatic Mode : 01 Nos</li>\n	<li>Operating Levels, (Operator, Service, Manufacturer): 3.0</li>\n</ul>\n<br />\n<br />\nÂ ","0","2019-11-24 14:54:01","1","1"),
("6","ETP ANNEX","0","<p><strong>Water/Waste Water Analysis</strong></p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\n	<tbody>\n		<tr height=\"12\">\n			<td height=\"12\" width=\"34\">\n			<p>Sr. No</p>\n			</td>\n			<td width=\"574\">\n			<p>Parameter</p>\n			</td>\n			<td width=\"112\">\n			<p>Charges ( Rs. )</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>1</p>\n			</td>\n			<td width=\"574\">\n			<p>Acidity</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>2</p>\n			</td>\n			<td width=\"574\">\n			<p>Alkalinity</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>3</p>\n			</td>\n			<td width=\"574\">\n			<p>Ammonical Nitrogen</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>4</p>\n			</td>\n			<td width=\"574\">\n			<p>BiochemicalÂ  Oxygen Demand</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>5</p>\n			</td>\n			<td width=\"574\">\n			<p>Boron</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>6</p>\n			</td>\n			<td width=\"574\">\n			<p>Calcium (Titrimetric)</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>7</p>\n			</td>\n			<td width=\"574\">\n			<p>Calcium Hardness</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>8</p>\n			</td>\n			<td width=\"574\">\n			<p>Chemical Oxygen Demand</p>\n			</td>\n			<td width=\"112\">\n			<p>350</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>9</p>\n			</td>\n			<td width=\"574\">\n			<p>Chlorides</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>10</p>\n			</td>\n			<td width=\"574\">\n			<p>Chromium</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>11</p>\n			</td>\n			<td width=\"574\">\n			<p>Colloidal Silica</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>12</p>\n			</td>\n			<td width=\"574\">\n			<p>Colour</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>13</p>\n			</td>\n			<td width=\"574\">\n			<p>Conductivity</p>\n			</td>\n			<td width=\"112\">\n			<p>60</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>14</p>\n			</td>\n			<td width=\"574\">\n			<p>Dissolved Oxygen</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>15</p>\n			</td>\n			<td width=\"574\">\n			<p>Fluorides</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>16</p>\n			</td>\n			<td width=\"574\">\n			<p>Free Ammonia</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>17</p>\n			</td>\n			<td width=\"574\">\n			<p>Hexavalent Chromium</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>18</p>\n			</td>\n			<td width=\"574\">\n			<p>Iron</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>19</p>\n			</td>\n			<td width=\"574\">\n			<p>Magnesium (Titrimetric)</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>20</p>\n			</td>\n			<td width=\"574\">\n			<p>Magnesium Hardness</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>21</p>\n			</td>\n			<td width=\"574\">\n			<p>Nitrate</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>22</p>\n			</td>\n			<td width=\"574\">\n			<p>Nitrite</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>23</p>\n			</td>\n			<td width=\"574\">\n			<p>Oil and Grease</p>\n			</td>\n			<td width=\"112\">\n			<p>150</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>24</p>\n			</td>\n			<td width=\"574\">\n			<p>Percent Sodium</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>25</p>\n			</td>\n			<td width=\"574\">\n			<p>pH</p>\n			</td>\n			<td width=\"112\">\n			<p>60</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>26</p>\n			</td>\n			<td width=\"574\">\n			<p>Phenolic Compound</p>\n			</td>\n			<td width=\"112\">\n			<p>350</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>27</p>\n			</td>\n			<td width=\"574\">\n			<p>Potassium</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>28</p>\n			</td>\n			<td width=\"574\">\n			<p>Reactive Silica</p>\n			</td>\n			<td width=\"112\">\n			<p>350</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>29</p>\n			</td>\n			<td width=\"574\">\n			<p>Residual chlorine</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>30</p>\n			</td>\n			<td width=\"574\">\n			<p>Sodium</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>31</p>\n			</td>\n			<td width=\"574\">\n			<p>Sodium Absorption Ratio</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>32</p>\n			</td>\n			<td width=\"574\">\n			<p>Sulphates</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>33</p>\n			</td>\n			<td width=\"574\">\n			<p>Sulphide</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>34</p>\n			</td>\n			<td width=\"574\">\n			<p>Sulphite</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>35</p>\n			</td>\n			<td width=\"574\">\n			<p>Temperature</p>\n			</td>\n			<td width=\"112\">\n			<p>60</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>36</p>\n			</td>\n			<td width=\"574\">\n			<p>Total Dissolved Solids</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>37</p>\n			</td>\n			<td width=\"574\">\n			<p>Total Hardness</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\nÂ \n\n<p><strong>Soil /Sludge/Solid waste Analysis</strong><br />\n<br />\nÂ </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\n	<tbody>\n		<tr height=\"12\">\n			<td height=\"12\" width=\"34\">\n			<p>Sr. No</p>\n			</td>\n			<td width=\"574\">\n			<p>Parameter</p>\n			</td>\n			<td width=\"112\">\n			<p>Charges ( Rs. )</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>1</p>\n			</td>\n			<td width=\"574\">\n			<p>Available Nitrogen as N</p>\n			</td>\n			<td width=\"112\">\n			<p>350</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>2</p>\n			</td>\n			<td width=\"574\">\n			<p>Available Phosphorus</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>3</p>\n			</td>\n			<td width=\"574\">\n			<p>Boron</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>4</p>\n			</td>\n			<td width=\"574\">\n			<p>Bulk Density</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>5</p>\n			</td>\n			<td width=\"574\">\n			<p>Calcium</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>6</p>\n			</td>\n			<td width=\"574\">\n			<p>Chloride</p>\n			</td>\n			<td width=\"112\">\n			<p>150</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>7</p>\n			</td>\n			<td width=\"574\">\n			<p>Color</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>8</p>\n			</td>\n			<td width=\"574\">\n			<p>Conductivity</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>9</p>\n			</td>\n			<td width=\"574\">\n			<p>Magnesium</p>\n			</td>\n			<td width=\"112\">\n			<p>200</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>10</p>\n			</td>\n			<td width=\"574\">\n			<p>Moisture</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>11</p>\n			</td>\n			<td width=\"574\">\n			<p>Nitrate</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>12</p>\n			</td>\n			<td width=\"574\">\n			<p>Organic Carbon</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>13</p>\n			</td>\n			<td width=\"574\">\n			<p>Organic Matter</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>14</p>\n			</td>\n			<td width=\"574\">\n			<p>pH</p>\n			</td>\n			<td width=\"112\">\n			<p>100</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>15</p>\n			</td>\n			<td width=\"574\">\n			<p>Potassium</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>16</p>\n			</td>\n			<td width=\"574\">\n			<p>Sodium</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>17</p>\n			</td>\n			<td width=\"574\">\n			<p>Sodium Absorption Ratio (SAR) in Soil Extract</p>\n			</td>\n			<td width=\"112\">\n			<p>650</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>18</p>\n			</td>\n			<td width=\"574\">\n			<p>Total Phosphate</p>\n			</td>\n			<td width=\"112\">\n			<p>400</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>19</p>\n			</td>\n			<td width=\"574\">\n			<p>Water Holding Capacity</p>\n			</td>\n			<td width=\"112\">\n			<p>300</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>Â </p>\n			</td>\n			<td width=\"574\">\n			<p>Sampling Charges</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\nÂ \n\n<p><strong>Stack Monitoring & Analysis</strong><br />\n<br />\nÂ </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\n	<tbody>\n		<tr height=\"12\">\n			<td height=\"12\" width=\"34\">\n			<p>Sr. No</p>\n			</td>\n			<td width=\"574\">\n			<p>Parameter</p>\n			</td>\n			<td width=\"112\">\n			<p>Charges ( Rs. )</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>1</p>\n			</td>\n			<td width=\"574\">\n			<p>SPM</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>2</p>\n			</td>\n			<td width=\"574\">\n			<p>NOx</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>3</p>\n			</td>\n			<td width=\"574\">\n			<p>SO2</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>Â </p>\n			</td>\n			<td width=\"574\">\n			<p>Sampling Charges</p>\n			</td>\n			<td width=\"112\">\n			<p>2500</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\nÂ \n\n<p><strong>Ambient Air Monitoring & Analysis</strong><br />\n<br />\nÂ </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\n	<tbody>\n		<tr height=\"12\">\n			<td height=\"12\" width=\"34\">\n			<p>Sr. No</p>\n			</td>\n			<td width=\"574\">\n			<p>Parameter</p>\n			</td>\n			<td width=\"112\">\n			<p>Charges ( Rs. )</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>1</p>\n			</td>\n			<td width=\"574\">\n			<p>SPM</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>2</p>\n			</td>\n			<td width=\"574\">\n			<p>NO2</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>3</p>\n			</td>\n			<td width=\"574\">\n			<p>SO2</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>4</p>\n			</td>\n			<td width=\"574\">\n			<p>RSPM ( PM10)</p>\n			</td>\n			<td width=\"112\">\n			<p>600</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>5</p>\n			</td>\n			<td width=\"574\">\n			<p>PM2.5</p>\n			</td>\n			<td width=\"112\">\n			<p>1000</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>Â </p>\n			</td>\n			<td width=\"574\">\n			<p>Sampling charge ( 8 Hour)</p>\n			</td>\n			<td width=\"112\">\n			<p>2000</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>Â </p>\n			</td>\n			<td width=\"574\">\n			<p>Sampling Charge ( 24 Hour)</p>\n			</td>\n			<td width=\"112\">\n			<p>3000</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\nÂ \n\n<p><strong>Noise Monitoring</strong><br />\nÂ </p>\n\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\n	<tbody>\n		<tr height=\"12\">\n			<td height=\"12\" width=\"34\">\n			<p>Sr. No</p>\n			</td>\n			<td width=\"574\">\n			<p>Parameter</p>\n			</td>\n			<td width=\"112\">\n			<p>Charges ( Rs. )</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>1</p>\n			</td>\n			<td width=\"574\">\n			<p>Noise Monitoring (One time)</p>\n			</td>\n			<td width=\"112\">\n			<p>1000</p>\n			</td>\n		</tr>\n		<tr height=\"14\">\n			<td height=\"14\" width=\"34\">\n			<p>2</p>\n			</td>\n			<td width=\"574\">\n			<p>Noise Monitoring (24 Hour)</p>\n			</td>\n			<td width=\"112\">\n			<p>3000</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n","0","2019-11-29 11:34:10","1","1"),
("7","ENVIRONMENT CLARANCE CATAGORY (B)","0","<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td valign=\"top\" width=\"31\">\n			<p>1.</p>\n			</td>\n			<td valign=\"top\" width=\"545\">\n			<p>Application & get the TOR</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"31\">\n			<p>Â </p>\n			</td>\n			<td valign=\"top\" width=\"545\">\n			<p>a)Â Â Â Â Â  Generate online login ID for application of EC & Prepare Form I with required documents for online submission</p>\n\n			<p>b)Â Â Â Â Â  Prepare related documents and submit online and get it accepted by the SEIAA - State pollution Control Board along with the</p>\n\n			<p>c)Â Â Â Â Â Â  quarries raised of the same & Submit the physical Copy of TOR application to SEIAA-GPCB, Gandhinagar</p>\n\n			<p>d)Â Â Â Â Â  Presentation in State Pollution Control Board on behalf of your company to get the TOR & Get the TOR copy</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"31\">\n			<p>2</p>\n			</td>\n			<td valign=\"top\" width=\"545\">\n			<p>Preparation of Draft EIA report for Stage(3)</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"31\">\n			<p>Â </p>\n			</td>\n			<td valign=\"top\" width=\"545\">\n			<p>1. Technical data collection as per check list based on TOR provided at different stages & its study.</p>\n\n			<p>2. Â Primary data collection for baseline study</p>\n\n			<p>a)Â Â Â Â Â  Ambient Air Quality Survey: At different locations in the project impact area for the parameters like PM2.5, PM10, SO2, NOX, CO (As per TOR, CPCB & NAAQM standards, 2009). Maximum 2 locations in upwind side, more in downwind side/impact Zone.</p>\n\n			<p>b)Â Â Â Â Â  Surface & subsurface Water Quality Survey: Once in a study period from different location for the Physical, Chemical & biological parameters and heavy metals.</p>\n\n			<p>c)Â Â Â Â Â Â  Soil Survey: Once in a study period at different location for the parameters like Particle size Distribution, Texture, pH, Electrical Conductivity, Alkali metals, Permeability, WHC, Porosity, etc.</p>\n\n			<p>d)Â Â Â Â Â  Â Noise Survey: Hourly equivalent Noise levels monitoring once in a study period at different locations.</p>\n\n			<p>e)Â Â Â Â Â  Meteorological Survey: 1 hourly continuous from one site in the project impact area for the parameters like Temp., Relative Humidity, Rain Fall, Cloud Cover, Wind Speed, and Wind Direction.</p>\n\n			<p>f)Â Â Â Â Â Â  Biological Environment (Terrestrial): Once in a study period Within project impact area for the collection of Vegetation-species list, economic importance, forest produce, medicinal value, Fauna, Avi Fauna, Rare and endangered species,</p>\n\n			<p>Sanctuaries, National Park / Biosphere reserve, Migratory routes.</p>\n\n			<p>g)Â Â Â Â Â  Socio-Economic status: Once in a study period within study area for the parameters like Demographic structure, infrastructure resource base, economic resource base, health status: Morbidity pattern, cultural & aesthetic attributes, etc.</p>\n\n			<p>3. Secondary data collection:</p>\n\n			<p>a)Â Â Â Â Â  Land use land cover map</p>\n\n			<p>b)Â Â Â Â Â  Â Meteorological data like Temp., Rainfall, Humidity cloud cover, wind speed, wind direction stability, mixing height</p>\n\n			<p>c)Â Â Â Â Â Â  Socio - Economic Data Collection like Demographic structure, infrastructure resource base, economic resource base, health status: Morbidity pattern, cultural & aesthetic attributes</p>\n\n			<p>d)Â Â Â Â Â  Biological Environment (Terrestrial) like List common flora & fauna found in the region with schedule</p>\n\n			<p>e)Â Â Â Â Â  Data of Natural Disaster like History, zoning, map, for Seismic, Flood, Cyclone, Landslide, etc. hazards.</p>\n\n			<p>f)Â Â Â Â Â Â  Physical & Chemical properties of raw material like Specific MSDS, Characterization of materials, Raw material Analysis report for trace elements or as per TOR collected from client.</p>\n\n			<p>4. Identification, prediction and evaluation of impacts on environment during construction & operation phase.</p>\n\n			<p>5. Â Preparation of Environmental Management Plan in coordination with client.</p>\n\n			<p>6. Â Risk Assessment & disaster management study.</p>\n\n			<p>7. Â Preparation of EIA report and preparation of executive summary in English.</p>\n\n			<p>a)Â Â Â Â Â  Â Submission of final EIA Report.</p>\n\n			<p>b)Â Â Â Â Â  ii) Follow up regarding EC meeting.</p>\n\n			<p>c)Â Â Â Â Â Â  Preparation of Final EC presentation & to attend meeting.</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n","0","2019-12-01 08:36:22","1","1"),
("8","ENVIRONMENT CLEARANCE ( CATAGORY A)","0","<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>Scope of Work</b></p>\n\n			<p><b>Â </b></p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>A)Â Â  </b><b>Preparation of TOR application i.e. Form â€“ I & PFR</b></p>\n\n			<p>a)Â Â Â Â Â  Site visit and review/understanding of data on water balance, waste water generation, water consumption, ETP details, APCM details, hazardous waste details, manufacturing process, etc.</p>\n\n			<p>b)Â Â Â Â Â  Data collection from you and preparation of TOR application i. e. Form â€“ I & PFR.</p>\n\n			<p>c)Â Â Â Â Â Â  Online TOR application uploaded and follow up for the same at MoEF&CC.</p>\n\n			<p>d)Â Â Â Â Â  Preparation of TOR presentation as per MoEF&CC format and present for the same against MoEF&CC for getting TOR.</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>B)Â Â  </b><b>Primary Data Collection</b></p>\n\n			<p><b>a)Â Â Â Â Â  </b><b>Meteorological Survey:</b> Meteorological data like temperature, wind speed, wind direction, relative humidity etc on hourly basis for the three month will be collected and utilized for EIA study purpose. Interpretation of measured data like daily maximum and minimum temperature, average temperature in day, preparation of wind rose diagram to identify the predominant wind direction and wind speed etc. Collection of data from Indian Metrological Department (IMD) also.</p>\n\n			<p><b>b)Â Â Â  </b><b>Land Use Pattern:</b> Satellite imaginary picture from the Space Application Centern for the study area will be obtained.</p>\n\n			<p><b>c)Â Â Â Â  </b><b>Mathematical Modeling:</b> Running the model ISCST-3 and plotting the isopleths for identifying the ground level concentration of emissions to be generated from the proposed project.</p>\n\n			<p><b>d)Â Â Â  </b><b>Survey of India Map:</b> Survey of India map will be obtained from the relevant department.</p>\n\n			<p><b>e)Â Â Â  </b><b>Geology:</b> Geological data will be collected if required from the Geological Survey of India.</p>\n\n			<p><b>f)Â Â Â Â  </b><b>Socio Economic Data:</b> Socio Economic Data will be collected during the monitoring period for the study area.</p>\n\n			<p><b>g)Â Â Â  </b><b>Traffic Study:</b> Traffic study will be carried out during the study period for the traffic density analysis with reference to the transportaion and its impact on existing traffic scenario.</p>\n\n			<p><b>Â </b></p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>C)Â Â  </b><b>Baseline Environmental Studies</b></p>\n\n			<p><b>a)Â Â Â Â Â  </b><b>Ambinet Air Environment: </b>Collection of Ambient Air samples and analysis as per the CPCB guidlines for the Parameters like PM<sub>10</sub>, PM<sub>2.5</sub>, SO<sub>2</sub> and NOx within the study area.</p>\n\n			<p><b>b)Â Â Â  </b><b>Water Environment:</b></p>\n\n			<p>Collection of surface and ground water samples within the study area and analysed the same.</p>\n\n			<p>Assessment of ground water quality from available wells.</p>\n\n			<p>Study of ground water with respect to depth of water table.</p>\n\n			<p>Secondary data collection on hydro-geological features & aquifer characteristics near exploration sites and depth & variation of water table, irrigation water characteristics within the study area, if required.</p>\n\n			<p><b>c)Â Â Â Â  </b><b>Noise Environment: </b>Noise Survey will be carried out for day time as well as night time within the study area as per the MOEF guidelines.</p>\n\n			<p><b>d)Â Â Â  </b><b>Soil Characteristics:</b> Collection of soil sample from the study area as per the CPCB guidelines and analyzed for major physical and chemical parameters.</p>\n\n			<p><b>e)Â Â Â  </b><b>Flora & Fauna:</b></p>\n\n			<p>Collection of available information on major flora and fauna including rare and endangered species, ecologically sensitive areas in the study area. Collection of information on micro - fauna communities, etc.</p>\n\n			<p>Assessment including identification of rare, endangered flora and fauna in study area. Assessment of likely changes on flora and fauna due to the project and related activities.</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>D)Â Â Â Â Â Â  </b><b>Environmental Impact Assessment report and Environmental Management Plan</b></p>\n\n			<p>Rapid Environmental Impact Assessment report will be prepared.</p>\n\n			<p>Material balance, water balance, available resources for proposed project will be studied.</p>\n\n			<p>From project decription and Baseline Environmental study, we will identify the various activities, impacts on various environmental attributes and mitigation measures during construction and operation phase.</p>\n\n			<p>Environmental Management Plan will be prepared and incorporated in the EIA report.</p>\n\n			<p>Post project monitoring plan willÂ  be provided and incorporated in the EIA report.</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>E)Â  </b><b>Risk Assessment & Disaster Management Plan </b></p>\n\n			<p>Risk assessment will be conducted based on all the risks and hazards associated with the proposed project including prediction of the worst-case scenario and maximum credible accident scenarios. The worst-case scenario will take in to the account the maximum inventory of storage at site at any point in time. Consequence analysis will be carried out using software and the risk contours will be plotted on the plant layout map clearly showing which of the facilities would be affected in case of accidents taking place. Based on the same, proposed safeguard measures including On-site/off-site Emergency Plan will be provided.</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>F)Â Â Â  </b><b>EnvironmentalÂ  Clearance (EC) </b></p>\n\n			<p>vÂ Â Â  EIA report will be submitted online for the grant of Environmental Clearance. EC presentation will be prepared by us and presented in front of the MoEF&CC, New Delhi. We shall remain present during the meeting/presentation invited by the MoEF&CC, New Delhi to answer Environment related Technical queries raised during the presentation.</p>\n			</td>\n		</tr>\n		<tr>\n			<td valign=\"top\" width=\"638\">\n			<p><b>Specific Conditions</b></p>\n\n			<p>a)Â Â Â Â Â  Any government Liasioning shall be borne by client.</p>\n\n			<p>b)Â Â Â Â Â  This offer is only for technical services and does not include liasioning charges, if any.</p>\n\n			<p>c)Â Â Â Â Â Â  This offer is only for the Environment Clearance and does not include any other government/private application for this project. Preparation of application other than Environment Clearance shall be charged extra.</p>\n\n			<p>d)Â Â Â Â Â  Processing fees or any government fees shall be borne by the Client.</p>\n\n			<p>e)Â Â Â Â Â  Charges for to and fro transportation, lodging and boarding at MoEF&CC, New Delhi for our team shall be borne by the client.</p>\n\n			<p>f)Â Â Â Â Â Â  Certified copy of Compliance report for EC/CC&A Conditions given by MoEF&CC for the existing EC/CC&A shall be provided by the client.</p>\n\n			<p>g)Â Â Â Â Â  The client shall give the approved layout plan with green belt, fire hydrant layout, separate entry and exit gate, production capacity of the project and all the required maps etc.</p>\n\n			<p>h)Â Â Â Â Â  A Director / Vice President / Senior Manager from your organization shall accompany us at the time of representation at various places, if required.</p>\n\n			<p>i)Â Â Â Â Â Â Â  This offer does not include any charges for preparation of Comprehensive EIA report.</p>\n\n			<p>j)Â Â Â Â Â Â Â  Total expenses of Public Consultation is in client scope. We shall prepare only Public Consultation presentation and Executive Summary in English. We shall only guide to the client during whole public consultation process.</p>\n\n			<p>k)Â Â Â Â Â  We need work order before starting the work as per requirement of ISO 9001:2008.</p>\n\n			<p>l)Â Â Â Â Â Â Â  Bill shall be raised on periodic basis and payment shall be made to us within 15 days.</p>\n\n			<p>m)Â Â Â  Payment shall be made by e-payment or at-par cheque or demand draft only.</p>\n\n			<p>n)Â Â Â Â Â  We shall not be responsible for delay in project due to natural calamities or unforeseen incidents.</p>\n\n			<p><b>Â </b></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n","0","2019-12-01 10:48:05","1","1");




CREATE TABLE `tbl_bom` (
  `bom_id` int(11) NOT NULL AUTO_INCREMENT,
  `bom_no` varchar(400) NOT NULL,
  `bom_date` date NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `so_trn_id` int(11) NOT NULL,
  `bom_trn_ttl` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bom_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`bom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO tbl_bom VALUES
("1","BOM/003/19-20","2019-11-18","1","2","56000.00","2019-11-18 16:03:09","0","1","1"),
("2","BOM/004/19-20","2019-12-06","9","13","912600.00","2019-12-06 15:30:40","0","1","1"),
("3","BOM/005/19-20","2019-12-06","10","14","104000.00","2019-12-06 16:29:12","0","1","1"),
("4","BOM/006/19-20","2020-01-24","11","15","15120.00","2020-01-24 12:25:14","0","1","1");




CREATE TABLE `tbl_bom_trn` (
  `bom_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `bom_id` int(11) NOT NULL,
  `req_product_id` int(11) NOT NULL,
  `req_product_desc` longtext NOT NULL,
  `req_product_qty` double(10,2) NOT NULL,
  `req_product_rate` double(10,2) NOT NULL,
  `req_unitid` int(11) NOT NULL,
  `req_product_amount` double(10,2) NOT NULL,
  `plantrn_start_date` date NOT NULL,
  `plantrn_end_date` date NOT NULL,
  `plantrn_status` int(11) NOT NULL,
  `bom_trn_status` int(11) NOT NULL,
  `req_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `out_stk` double(10,2) NOT NULL,
  `p_done_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`bom_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_category` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_pid` int(10) NOT NULL,
  `cat_status` int(10) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO tbl_category VALUES
("1","CONSULTING","0","0","2019-11-19 20:51:54","1","1"),
("2","PROJECT","0","0","2019-11-19 20:51:34","1","1"),
("3","LABORATORY TESTING & REPORTING","0","2","2019-11-19 20:52:07","1","1"),
("4","GENERAL OFFICE RELATED","0","2","2019-12-28 10:23:23","1","1"),
("5","WEBSITE DEVELOPMENT","0","0","2020-01-01 15:57:43","1","1"),
("6","SOFTWARE DEVELOPMENT","0","0","2020-06-24 12:39:17","1","1");




CREATE TABLE `tbl_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `cstno` varchar(50) NOT NULL,
  `cst_date` date NOT NULL,
  `vatno` varchar(50) NOT NULL,
  `vat_date` date NOT NULL,
  `serno` varchar(50) NOT NULL,
  `ser_date` date NOT NULL,
  `logo_content` longtext NOT NULL,
  `conditions` mediumtext NOT NULL,
  `challan_condition` mediumtext NOT NULL,
  `quot_condition` longtext NOT NULL,
  `po_condition` longtext NOT NULL,
  `show_disc` int(11) NOT NULL COMMENT '1:YES, 2:NO',
  `show_charges` int(11) NOT NULL COMMENT '1:WithOut Tax, 2: With Tax',
  `letter_head_top_margin` double(10,2) NOT NULL,
  `letter_head_bottom_margin` double(10,2) NOT NULL,
  `letter_head_left_margin` double(10,2) NOT NULL,
  `letter_head_right_margin` double(10,2) NOT NULL,
  `dispatch_head_content` longtext NOT NULL,
  `dispatch_footer_content` longtext NOT NULL,
  `inq_email_content` longtext NOT NULL,
  `quot_email_content` longtext NOT NULL,
  `po_email_content` longtext NOT NULL,
  `software_type` int(11) NOT NULL,
  `series_same` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_alias` varchar(100) NOT NULL,
  `comp_add1` longtext NOT NULL,
  `comp_add2` longtext NOT NULL,
  `comp_add3` longtext NOT NULL,
  `countryid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `comp_pincode` varchar(100) NOT NULL,
  `comp_email` varchar(100) NOT NULL,
  `comp_web` varchar(100) NOT NULL,
  `comp_mobile` varchar(100) NOT NULL,
  `comp_toll` varchar(100) NOT NULL,
  `comp_gst` varchar(100) NOT NULL,
  `comp_cin` varchar(100) NOT NULL,
  `comp_pan` varchar(100) NOT NULL,
  `comp_ryear` varchar(100) NOT NULL,
  `comp_per_currency` int(11) NOT NULL,
  `h_logo` longtext NOT NULL,
  `f_logo` longtext NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_company VALUES
("1","BDS","24575106323","2011-01-10","2ABCDxxxx","2011-01-10","","1970-01-01","","","","","","2","2","1.80","1.00","0.20","0.45","","","Hello,<br />\n<br />\nOur sales team shall contact you soon, to understand your specific requirements and revert with the<br />\nappropriate solution, specifications and terms.<br />\nThank you and assuring you of our best attention and services at all times,","","","2","2","2020-06-19 14:39:21","0","1","","G-608  Titanium City Center, Anand nagar Road, Satelite, Ahmedabad, Gujarat, India","","","101","1","1","","harshil@metrtechnology.com","","7405409098","","","","","","68","header9282.jpg","footer3611.jpg");




CREATE TABLE `tbl_company_bank` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_b_name` varchar(100) NOT NULL,
  `c_b_branch` varchar(100) NOT NULL,
  `c_b_ifsc` varchar(100) NOT NULL,
  `c_b_acno` varchar(100) NOT NULL,
  `b_comp_id` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_company_certi` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_path` longtext NOT NULL,
  `im_name` longtext NOT NULL,
  `im_status` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_conv_rate` (
  `conv_id` int(10) NOT NULL AUTO_INCREMENT,
  `conv_st_date` date NOT NULL,
  `conv_base` varchar(255) NOT NULL,
  `conv_currency` int(11) NOT NULL,
  `conv_rate` double(10,2) NOT NULL,
  `conv_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `loop_count` int(11) NOT NULL,
  PRIMARY KEY (`conv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_conv_rate VALUES
("11","2019-11-09","","107","777.00","0","2019-11-24 15:35:10","1","1","1");




CREATE TABLE `tbl_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(64) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`currency_id`),
  KEY `idx_currency_name` (`currency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;


INSERT INTO tbl_currency VALUES
("1","Andorran Peseta","ADP"),
("2","United Arab Emirates Dirham","AED"),
("3","Afghanistan Afghani","AFA"),
("4","Albanian Lek","ALL"),
("5","Netherlands Antillian Guilder","ANG"),
("6","Angolan Kwanza","AOK"),
("7","Argentine Peso","ARS"),
("9","Australian Dollar","AUD"),
("10","Aruban Florin","AWG"),
("11","Barbados Dollar","BBD"),
("12","Bangladeshi Taka","BDT"),
("14","Bulgarian Lev","BGN"),
("15","Bahraini Dinar","BHD"),
("16","Burundi Franc","BIF"),
("17","Bermudian Dollar","BMD"),
("18","Brunei Dollar","BND"),
("19","Bolivian Boliviano","BOB"),
("20","Brazilian Real","BRL"),
("21","Bahamian Dollar","BSD"),
("22","Bhutan Ngultrum","BTN"),
("23","Burma Kyat","BUK"),
("24","Botswanian Pula","BWP"),
("25","Belize Dollar","BZD"),
("26","Canadian Dollar","CAD"),
("27","Swiss Franc","CHF"),
("28","Chilean Unidades de Fomento","CLF"),
("29","Chilean Peso","CLP"),
("30","Yuan (Chinese) Renminbi","CNY"),
("31","Colombian Peso","COP"),
("32","Costa Rican Colon","CRC"),
("33","Czech Republic Koruna","CZK"),
("34","Cuban Peso","CUP"),
("35","Cape Verde Escudo","CVE"),
("36","Cyprus Pound","CYP"),
("40","Danish Krone","DKK"),
("41","Dominican Peso","DOP"),
("42","Algerian Dinar","DZD"),
("43","Ecuador Sucre","ECS"),
("44","Egyptian Pound","EGP"),
("45","Estonian Kroon (EEK)","EEK"),
("46","Ethiopian Birr","ETB"),
("47","Euro","EUR"),
("49","Fiji Dollar","FJD"),
("50","Falkland Islands Pound","FKP"),
("52","British Pound","GBP"),
("53","Ghanaian Cedi","GHC"),
("54","Gibraltar Pound","GIP"),
("55","Gambian Dalasi","GMD"),
("56","Guinea Franc","GNF"),
("58","Guatemalan Quetzal","GTQ"),
("59","Guinea-Bissau Peso","GWP"),
("60","Guyanan Dollar","GYD"),
("61","Hong Kong Dollar","HKD"),
("62","Honduran Lempira","HNL"),
("63","Haitian Gourde","HTG"),
("64","Hungarian Forint","HUF"),
("65","Indonesian Rupiah","IDR"),
("66","Irish Punt","IEP"),
("67","Israeli Shekel","ILS"),
("68","Indian Rupee","INR"),
("69","Iraqi Dinar","IQD"),
("70","Iranian Rial","IRR"),
("73","Jamaican Dollar","JMD"),
("74","Jordanian Dinar","JOD"),
("75","Japanese Yen","JPY"),
("76","Kenyan Schilling","KES"),
("77","Kampuchean (Cambodian) Riel","KHR"),
("78","Comoros Franc","KMF"),
("79","North Korean Won","KPW"),
("80","(South) Korean Won","KRW"),
("81","Kuwaiti Dinar","KWD"),
("82","Cayman Islands Dollar","KYD"),
("83","Lao Kip","LAK"),
("84","Lebanese Pound","LBP"),
("85","Sri Lanka Rupee","LKR"),
("86","Liberian Dollar","LRD"),
("87","Lesotho Loti","LSL"),
("89","Libyan Dinar","LYD"),
("90","Moroccan Dirham","MAD"),
("91","Malagasy Franc","MGF"),
("92","Mongolian Tugrik","MNT"),
("93","Macau Pataca","MOP"),
("94","Mauritanian Ouguiya","MRO"),
("95","Maltese Lira","MTL"),
("96","Mauritius Rupee","MUR"),
("97","Maldive Rufiyaa","MVR"),
("98","Malawi Kwacha","MWK"),
("99","Mexican Peso","MXP"),
("100","Malaysian Ringgit","MYR"),
("101","Mozambique Metical","MZM"),
("102","Namibian Dollar","NAD"),
("103","Nigerian Naira","NGN"),
("104","Nicaraguan Cordoba","NIO"),
("105","Norwegian Kroner","NOK"),
("106","Nepalese Rupee","NPR"),
("107","New Zealand Dollar","NZD"),
("108","Omani Rial","OMR"),
("109","Panamanian Balboa","PAB"),
("110","Peruvian Nuevo Sol","PEN"),
("111","Papua New Guinea Kina","PGK");
INSERT INTO tbl_currency VALUES
("112","Philippine Peso","PHP"),
("113","Pakistan Rupee","PKR"),
("114","Polish Zloty","PLN"),
("116","Paraguay Guarani","PYG"),
("117","Qatari Rial","QAR"),
("118","Romanian Leu","RON"),
("119","Rwanda Franc","RWF"),
("120","Saudi Arabian Riyal","SAR"),
("121","Solomon Islands Dollar","SBD"),
("122","Seychelles Rupee","SCR"),
("123","Sudanese Pound","SDP"),
("124","Swedish Krona","SEK"),
("125","Singapore Dollar","SGD"),
("126","St. Helena Pound","SHP"),
("127","Sierra Leone Leone","SLL"),
("128","Somali Schilling","SOS"),
("129","Suriname Guilder","SRG"),
("130","Sao Tome and Principe Dobra","STD"),
("131","Russian Ruble","RUB"),
("132","El Salvador Colon","SVC"),
("133","Syrian Potmd","SYP"),
("134","Swaziland Lilangeni","SZL"),
("135","Thai Baht","THB"),
("136","Tunisian Dinar","TND"),
("137","Tongan Paanga","TOP"),
("138","East Timor Escudo","TPE"),
("139","Turkish Lira","TRY"),
("140","Trinidad and Tobago Dollar","TTD"),
("141","Taiwan Dollar","TWD"),
("142","Tanzanian Schilling","TZS"),
("143","Uganda Shilling","UGX"),
("144","US Dollar","USD"),
("145","Uruguayan Peso","UYU"),
("146","Venezualan Bolivar","VEF"),
("147","Vietnamese Dong","VND"),
("148","Vanuatu Vatu","VUV"),
("149","Samoan Tala","WST"),
("150","CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BEAC, Francs","XAF"),
("151","Silver, Ounces","XAG"),
("152","Gold, Ounces","XAU"),
("153","East Caribbean Dollar","XCD"),
("154","International Monetary Fund (IMF) Special Drawing Rights","XDR"),
("155","CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BCEAO - Francs","XOF"),
("156","Palladium Ounces","XPD"),
("157","Comptoirs FranÃƒÂ§ais du Pacifique Francs","XPF"),
("158","Platinum, Ounces","XPT"),
("159","Democratic Yemeni Dinar","YDD"),
("160","Yemeni Rial","YER"),
("161","New Yugoslavia Dinar","YUD"),
("162","South African Rand","ZAR"),
("163","Zambian Kwacha","ZMK"),
("164","Zaire Zaire","ZRZ"),
("165","Zimbabwe Dollar","ZWD"),
("166","Slovak Koruna","SKK"),
("167","Armenian Dram","AMD");




CREATE TABLE `tbl_cust_address` (
  `c_add_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `c_add_location` varchar(255) NOT NULL,
  `c_add_street` varchar(255) NOT NULL,
  `c_add_country` int(11) NOT NULL,
  `c_add_state` int(11) NOT NULL,
  `c_add_city` int(11) NOT NULL,
  `c_add_zip` varchar(255) NOT NULL,
  `c_add_status` int(11) NOT NULL,
  `cdate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`c_add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=latin1;


INSERT INTO tbl_cust_address VALUES
("1","1","Rakhial","","101","1","1","","0","2020","1","1"),
("2","2","","","101","1","1","","0","2020","29","1"),
("3","3","","","101","1","1","","0","2020","29","1"),
("4","4","","Nr. vande Matram So.","101","1","1","","0","2020","29","1"),
("5","5","","Bapunagar","101","1","1","","0","2020","29","1"),
("6","6","","Nr. Sicence City","101","1","1","","0","2020","29","1"),
("7","7","","Naroda","101","1","1","","0","2020","29","1"),
("8","8","","","101","1","1","","0","2020","29","1"),
("9","9","","Sanand","101","1","1","","0","2020","29","1"),
("10","10","","Odhav","101","1","1","","0","2020","29","1"),
("11","11","","Rakhial","101","1","1","","0","2020","29","1"),
("12","12","","Kathwada","101","1","1","","0","2020","29","1"),
("13","13","","Amariwadi","101","1","1","","0","2020","29","1"),
("15","14","40 PARTHNA IND EST SKARIBA PARTY PLOT","CTM","101","1","1","380026","0","2020","28","1"),
("16","15","VATVA","","101","1","1","","0","2020","28","1"),
("17","16","VATVA","","101","1","1","","0","2020","28","1"),
("18","17","","","101","1","1","","0","2020","28","1"),
("19","18","","KATHWADA","101","1","1","","0","2020","28","1"),
("20","19","","","101","1","1","","0","2020","28","1"),
("21","20","","KATHWADA","101","1","1","","0","2020","28","1"),
("22","21","","VATVA","101","1","1","","0","2020","28","1"),
("23","23","","ODHAV","101","1","1","","0","2020","28","1"),
("24","24","kathwada","","101","1","1","382430","0","2020","28","1"),
("25","25","KATHWADA","","101","1","1","382430","0","2020","28","1"),
("26","26","vatva","","101","1","1","382445","0","2020","28","1"),
("27","27","VATVA","","101","1","1","","0","2020","28","1"),
("28","28","MEMCO","","101","1","1","","0","2020","28","1"),
("29","29","RAKHIAL","","101","1","1","","0","2020","28","1"),
("30","30","VATVA","","101","1","1","","0","2020","28","1"),
("31","31","VASTRAL","","101","1","1","","0","2020","28","1"),
("32","32","VATVA","","101","1","1","","0","2020","28","1"),
("33","33","RAMOL RING ROAD","","101","1","1","","0","2020","28","1"),
("34","34","KATHWADA","","101","1","1","","0","2020","28","1"),
("35","35","VATVA","","101","1","1","","0","2020","28","1"),
("36","36","VASTRAL","","101","1","1","","0","2020","28","1"),
("37","37","vatva","","101","1","1","","0","2020","28","1"),
("38","38","vastral","","101","1","1","","0","2020","28","1"),
("39","39","CG ROAD","","101","1","1","","0","2020","29","1"),
("40","40","AMRAWADI","","101","1","1","","0","2020","28","1"),
("41","41","AMRAWADI","","101","1","1","","0","2020","28","1"),
("42","42","Maninagar","","101","1","1","","0","2020","29","1"),
("43","43","VATVA","","101","1","1","","0","2020","28","1"),
("44","44","Naroda","","101","1","1","","0","2020","29","1"),
("45","45","CTM","","101","1","1","","0","2020","29","1"),
("46","46","CTM","","101","1","1","","0","2020","29","1"),
("47","47","Rabari Colony","","101","1","1","","0","2020","29","1"),
("48","48","Vatva","","101","1","1","","0","2020","29","1"),
("49","49","Ahmedabad","","101","1","1","","0","2020","29","1"),
("50","50","Ahmedabad","","101","1","1","","0","2020","29","1"),
("51","51","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("52","52","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("53","53","Vadodara","","101","1","124","","0","2020","29","1"),
("54","55","Chandkheda","","101","1","1","","0","2020","29","1"),
("55","57","DEESA","","101","1","1","","0","2020","29","1"),
("56","58","Ahmedabad","","101","1","1","","0","2020","29","1"),
("57","59","Gandhinagar","","101","1","1","","0","2020","29","1"),
("58","60","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("59","61","Ahmedabad","","101","1","1","","0","2020","29","1"),
("60","63","Ahmedabad","","101","1","1","","0","2020","29","1"),
("61","64","Surendranagar","","101","1","111","","0","2020","29","1"),
("62","66","MUNDRA","","101","1","85","","0","2020","29","1"),
("63","67","Ahmedabad","","101","1","1","","0","2020","29","1"),
("64","68","BAKROL","","101","1","1","","0","2020","28","1"),
("65","70","Valsad","","101","1","125","","0","2020","29","1"),
("66","71","Ghandhinagar","","101","1","1","","0","2020","29","1"),
("67","72","Ahmedabad","","101","1","1","","0","2020","29","1"),
("68","73","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("69","74","Ahmedabad","","101","1","1","","0","2020","29","1"),
("70","75","himatnagar","","101","1","1","","0","2020","29","1"),
("71","81","NARODA","","101","1","1","","0","2020","28","1"),
("72","83","RAKHAIL","","101","1","1","","0","2020","28","1"),
("73","84","TUMKUR","","101","0","0","","0","2020","28","1"),
("74","85","RAKHAIL","","101","1","1","","0","2020","28","1"),
("75","86","RAKHIAL","","101","0","0","","0","2020","28","1"),
("76","87","KATHWADA","","0","0","0","","0","2020","28","1"),
("77","88","SURAT","","101","1","110","","0","2020","28","1"),
("78","89","GANDHINAGR","","101","1","143","","0","2020","28","1"),
("79","90","VATVA","","101","1","1","","0","2020","28","1"),
("80","91","VATVA","","0","0","0","","0","2020","28","1"),
("81","92","BOPAL","","101","1","1","","0","2020","28","1"),
("82","93","VATVA","","101","1","1","","0","2020","28","1"),
("83","94","KATHWADA","","101","1","1","","0","2020","27","1"),
("84","95","Ahmedabad","","101","1","1","","0","2020","29","1"),
("85","96","Ahmedabad","","101","1","1","","0","2020","29","1"),
("86","97","Ahmedabad","","101","1","1","","0","2020","29","1"),
("87","98","Ahmedabad","","101","1","1","","0","2020","29","1"),
("88","99","Ahmedabad","","101","1","1","","0","2020","29","1"),
("89","100","Ahmedabad","","101","1","1","","0","2020","29","1"),
("90","101","Ahmedabad","","101","1","1","","0","2020","29","1"),
("91","102","Anand","","101","1","3","","0","2020","29","1"),
("92","103","Ahmedabad","","101","1","1","","0","2020","29","1"),
("93","104","Dholka","","101","1","1","","0","2020","29","1"),
("94","105","Ahmedabad","","101","1","1","","0","2020","29","1"),
("95","106","Ahmedabad","","101","1","1","","0","2020","29","1"),
("96","107","Ahmedabad","","101","1","1","","0","2020","29","1"),
("97","108","Ahmedabad","","101","1","1","","0","2020","29","1"),
("98","109","Vatva","","101","1","1","","0","2020","29","1"),
("99","110","Bapunagar","","101","1","1","","0","2020","29","1"),
("100","111","Ahmedabad","","101","1","1","","0","2020","29","1"),
("101","112","Ahmedabad","","101","1","1","","0","2020","29","1");
INSERT INTO tbl_cust_address VALUES
("102","113","Ahmedabad","","101","1","1","","0","2020","29","1"),
("103","114","Chattral","","101","1","1","","0","2020","29","1"),
("104","115","Ahmedabad","","101","1","1","","0","2020","29","1"),
("105","116","Ahmedabad","","101","1","1","","0","2020","29","1"),
("106","117","Ahmedabad","","101","1","1","","0","2020","29","1"),
("107","118","Ahmedabad","","101","1","1","","0","2020","29","1"),
("108","119","Vatva","","101","1","1","","0","2020","29","1"),
("109","120","Ahmedabad","","101","1","1","","0","2020","29","1"),
("110","121","Mehsana","","101","1","1","","0","2020","29","1"),
("111","122","Ahmedabad","","101","1","1","","0","2020","29","1"),
("112","123","Gandhinagar","","101","1","143","","0","2020","29","1"),
("113","124","Ahmedabad","","101","1","1","","0","2020","29","1"),
("114","125","Ahmedabad","","101","1","1","","0","2020","29","1"),
("115","126","Ahmedabad","","101","1","1","","0","2020","29","1"),
("116","127","Ahmedabad","","101","1","1","","0","2020","29","1"),
("117","128","Diyidar","","101","1","1","","0","2020","29","1"),
("118","129","Changodar","","101","1","1","","0","2020","29","1"),
("119","130","Ahmedabad","","101","1","1","","0","2020","29","1"),
("120","131","Ahmedabad","","101","1","1","","0","2020","29","1"),
("121","132","Ahmedabad","","101","1","1","","0","2020","29","1"),
("122","133","Bakrol","","101","1","1","","0","2020","29","1"),
("123","134","Kathwada","","101","1","1","","0","2020","29","1"),
("124","135","Surat","","101","1","110","","0","2020","29","1"),
("125","136","Ahmedabad","","101","1","1","","0","2020","29","1"),
("126","137","Ahmedabad","","101","1","1","","0","2020","29","1"),
("127","138","Ahmedabad","","101","1","1","","0","2020","29","1"),
("128","139","Ahmedabad","","101","1","1","","0","2020","29","1"),
("129","141","Ahmedabad","","101","1","1","","0","2020","29","1"),
("130","144","Ahmedabad","","101","1","1","","0","2020","29","1"),
("131","146","Santej","","101","1","1","","0","2020","29","1"),
("132","148","Ahmedabad","","101","1","1","","0","2020","29","1"),
("133","152","Ahmedabad","","101","1","1","","0","2020","29","1"),
("134","156","Ahmedabad","","101","1","1","","0","2020","29","1"),
("135","158","Ahmedabad","","101","1","1","","0","2020","29","1"),
("136","168","Naroda","","101","1","1","","0","2020","29","1"),
("137","171","Shaibuag","","101","1","1","","0","2020","29","1"),
("138","172","VATVA","","101","1","1","","0","2020","28","1"),
("139","175","Ahmedabad","","101","1","1","","0","2020","29","1"),
("140","177","Ahmedabad","","101","1","1","","0","2020","29","1"),
("141","179","Vastral","","101","1","1","","0","2020","29","1"),
("142","183","VAVTA","","101","1","1","","0","2020","28","1"),
("143","184","ODHAV","","0","0","0","","0","2020","28","1"),
("144","189","vatva","","0","0","0","","0","2020","28","1"),
("145","191","narol","","0","0","0","","0","2020","28","1"),
("146","193","vatva","","0","0","0","","0","2020","28","1"),
("147","194","Bhokardan","","101","16","149","","0","2020","32","1"),
("148","195","Himachal Pradesh","","101","10","0","","0","2020","32","1"),
("149","196","Meerut","","101","27","150","","0","2020","32","1"),
("150","197","Dumariya Ganj","","101","27","151","","0","2020","32","1"),
("151","198","Chandrapur","","101","16","152","","0","2020","32","1"),
("152","199","Taranagar","","101","23","153","","0","2020","32","1"),
("153","200","Sitamarhi","","101","5","154","","0","2020","32","1"),
("154","201","Fatepur Sikri","","101","27","155","","0","2020","32","1"),
("155","202","Jayakindam","","101","25","156","","0","2020","32","1"),
("156","203","Nedmkandam","","101","14","157","","0","2020","32","1"),
("157","204","Hosur","","101","25","158","","0","2020","32","1"),
("158","205","Munger","","101","5","159","","0","2020","32","1"),
("159","206","Banglore","","101","13","160","","0","2020","32","1"),
("160","207","Manjeri","","101","14","161","","0","2020","32","1"),
("161","208","Jaipur","","101","23","162","","0","2020","32","1"),
("162","209","Chandrapur","","101","16","152","","0","2020","32","1"),
("163","210","Belgaum","","101","13","163","","0","2020","32","1"),
("164","211","Banglore","","101","13","160","","0","2020","32","1"),
("165","212","Nagpur","","101","16","146","","0","2020","32","1"),
("166","213","Bidar","","101","13","164","","0","2020","32","1"),
("167","214","Latur","","101","16","165","","0","2020","32","1"),
("168","215","Nashik","","101","16","166","","0","2020","32","1"),
("169","216","Ghazipur","","101","27","167","","0","2020","32","1"),
("170","217","Nagpur","","101","16","146","","0","2020","32","1"),
("171","218","Aurangabad","","101","16","168","","0","2020","32","1"),
("172","219","Lucknow","","101","27","169","","0","2020","32","1"),
("173","220","Bijnor","","101","27","170","","0","2020","32","1"),
("174","221","Banglore","","101","13","160","","0","2020","32","1"),
("175","222","Banglore","","101","13","160","","0","2020","32","1"),
("176","223","Mirzapur","","101","27","171","","0","2020","32","1"),
("177","224","Duliajan","","101","4","172","","0","2020","32","1"),
("178","225","Kolhapur","","101","16","173","","0","2020","32","1"),
("179","226","Banglore","","101","13","160","","0","2020","32","1"),
("180","227","Mandya","","101","13","174","","0","2020","32","1"),
("181","228","Bajna","","101","27","175","","0","2020","32","1"),
("182","229","Budaun","","101","27","176","","0","2020","32","1"),
("183","230","Mirzapur","","101","27","171","","0","2020","32","1"),
("184","231","Saharanpur","","101","27","177","","0","2020","32","1"),
("185","232","Sangli","","101","16","178","","0","2020","32","1"),
("186","233","Golaghat","","101","4","179","","0","2020","32","1"),
("187","234","Solapur","","101","16","180","","0","2020","32","1"),
("188","235","Meerut","","101","27","150","","0","2020","32","1"),
("189","236","Bhagalpur","","101","27","181","","0","2020","32","1"),
("190","237","Agra","","101","27","0","","0","2020","32","1"),
("191","238","Hailakandi","","101","4","183","","0","2020","32","1"),
("192","239","Bahjoi","","101","27","184","","0","2020","32","1"),
("193","240","Allahabad","","101","27","185","","0","2020","32","1"),
("194","267","KATHWADA","","0","0","0","","0","2020","28","1"),
("195","278","Bettiah","","101","5","186","","0","2020","32","1"),
("196","292","Malegaon","","101","16","187","","0","2020","32","1"),
("197","293","Kavathe Mahankal","","101","16","188","","0","2020","32","1"),
("198","295","Silchar","","101","4","189","","0","2020","32","1"),
("199","304","Rampur","","101","27","190","","0","2020","32","1"),
("200","305","Azmgarh","","101","27","191","","0","2020","32","1"),
("201","306","Talbehat","","101","27","192","","0","2020","32","1");
INSERT INTO tbl_cust_address VALUES
("202","307","ahmedabad","","0","0","0","","0","2020","27","1"),
("203","309","Surat","","101","1","110","","0","2020","29","1"),
("204","310","Ambedkar Nagar","","101","27","193","","0","2020","32","1"),
("205","311","Ahmedabad","","101","1","1","","0","2020","29","1"),
("206","312","Vadodara","","101","1","124","","0","2020","29","1"),
("207","313","Jorhat","","101","4","194","","0","2020","32","1"),
("208","314","Rajkot","","101","1","99","","0","2020","29","1"),
("209","315","Budaun","","101","27","176","","0","2020","32","1"),
("210","316","Ahmedabad","","101","1","1","","0","2020","29","1"),
("211","317","Gaya","","101","5","195","","0","2020","32","1"),
("212","318","Sikandra Rao","","101","27","196","","0","2020","32","1"),
("213","319","Ahmedabad","","101","1","1","","0","2020","29","1"),
("214","320","Sangli","","101","16","178","","0","2020","32","1"),
("215","321","Patur","","101","16","197","","0","2020","32","1"),
("216","322","ahmedabad","","101","1","1","","0","2020","29","1"),
("217","323","Ahmedabad","","101","1","1","","0","2020","29","1"),
("218","324","Kheda","","101","1","1","","0","2020","29","1"),
("219","325","Ahmedabad","","101","1","1","","0","2020","29","1"),
("220","326","Deoria","","101","27","198","","0","2020","32","1"),
("221","327","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("222","328","Buxar","","101","5","199","","0","2020","32","1"),
("223","329","Modasa","","101","1","83","","0","2020","29","1"),
("224","330","Sirihi","","101","1","1","","0","2020","29","1"),
("225","331","Kanpur","","101","27","200","","0","2020","32","1"),
("226","332","Ahmedabad","","101","1","1","","0","2020","29","1"),
("227","333","mundra","","101","1","1","","0","2020","29","1"),
("228","334","Nagaon","","101","4","201","","0","2020","32","1"),
("229","335","Ahmedabad","","101","1","1","","0","2020","29","1"),
("230","336","Ahmedabad","","101","1","1","","0","2020","29","1"),
("231","337","Kanpur","","101","27","200","","0","2020","32","1"),
("232","338","Ahmedabad","","101","1","1","","0","2020","29","1"),
("233","339","Ahmedabad","","101","1","1","","0","2020","29","1"),
("234","340","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("235","341","Nanded","","101","16","202","","0","2020","32","1"),
("236","342","Kadi","","101","1","58","","0","2020","29","1"),
("237","343","Ahmedabad","","101","1","1","","0","2020","29","1"),
("238","344","A","Ahmedabad","101","1","1","","0","2020","29","1"),
("239","345","Hajipur","","101","5","203","","0","2020","32","1"),
("240","346","Dhrangadhra","","101","1","35","","0","2020","29","1"),
("241","347","SURENDRANAGAR","","101","1","1","","0","2020","29","1"),
("242","348","ankleshwar","","101","1","6","","0","2020","29","1"),
("243","349","Shankheswar","","101","1","1","","0","2020","29","1"),
("244","350","Ahmedabad","","101","1","1","","0","2020","29","1"),
("245","351","ahmedabad","","0","0","0","","0","2020","27","1"),
("246","352","Ahmedabad","","101","1","1","","0","2020","29","1"),
("247","353","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("248","354","Ahmedabad","","101","1","1","","0","2020","29","1"),
("249","355","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("250","356","Ahmedabad","","101","1","1","","0","2020","29","1"),
("251","357","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("252","358","Ahmedabad","","101","1","1","","0","2020","29","1"),
("253","359","VATVA","","0","0","0","","0","2020","28","1"),
("254","360","Ahmedabad","","101","1","1","","0","2020","29","1"),
("255","361","Ahmedabad","","101","1","1","","0","2020","29","1"),
("256","362","Ahmedabad","","101","1","1","","0","2020","29","1"),
("257","363","ODHAV","","0","0","0","","0","2020","28","1"),
("258","364","Baroda","","101","1","124","","0","2020","29","1"),
("259","365","Ahmedabad","","101","1","1","","0","2020","29","1"),
("260","366","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("261","367","bechraji","","101","1","1","","0","2020","29","1"),
("262","368","Jetpur","","101","1","54","","0","2020","29","1"),
("263","369","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("264","370","KALOL","","101","1","1","","0","2020","29","1"),
("265","371","Ahmedabad","","101","1","1","","0","2020","29","1"),
("266","372","GHANDHINAGAR","","101","1","1","","0","2020","29","1"),
("267","373","amrawadi","","0","0","0","","0","2020","28","1"),
("268","374","Baroda","","101","1","124","","0","2020","29","1"),
("269","375","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("270","376","Ahmedabad","","101","1","1","","0","2020","29","1"),
("271","377","Ahmedabad","","101","1","1","","0","2020","29","1"),
("272","378","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("273","379","Ahmedabad","","101","1","1","","0","2020","29","1"),
("274","380","Vadodara","","101","1","0","","0","2020","29","1"),
("275","381","Ahmedabad","","101","1","1","","0","2020","29","1"),
("276","382","Ahmedabad","","101","1","1","","0","2020","29","1"),
("277","383","Bavla","","101","1","1","","0","2020","29","1"),
("278","384","Bhiloda","","101","1","1","","0","2020","29","1"),
("279","385","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("280","386","Ahmedabad","","101","1","1","","0","2020","29","1"),
("281","387","Adipur","","101","1","1","","0","2020","29","1"),
("282","388","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("283","389","Ahmedabad","","101","1","1","","0","2020","29","1"),
("284","390","Ahmedabad","","101","1","1","","0","2020","29","1"),
("285","391","Ahmedabad","","101","1","1","","0","2020","29","1"),
("286","392","AHMEDABD","","101","1","1","","0","2020","29","1"),
("287","393","Rajkot","","101","1","99","","0","2020","29","1"),
("288","394","Ahmedabad","","101","1","1","","0","2020","29","1"),
("289","395","ahmedabd","","101","1","1","","0","2020","29","1"),
("290","396","Ahmedabad","","101","1","1","","0","2020","29","1"),
("291","397","AHMEDABD","","101","1","1","","0","2020","29","1"),
("292","398","surendranagr","","101","1","1","","0","2020","29","1"),
("293","399","Kadi","","101","1","58","","0","2020","29","1"),
("294","400","Naroda","","101","1","1","","0","2020","29","1"),
("295","401","IDAR","","101","1","1","","0","2020","29","1"),
("296","402","Gandhinagar","","101","1","143","","0","2020","29","1"),
("297","403","Talod","","101","1","1","","0","2020","29","1"),
("298","404","UDAIPUR","","101","1","1","","0","2020","29","1"),
("299","405","Sanad","","101","1","1","","0","2020","29","1"),
("300","406","Ahmedabad","","101","1","1","","0","2020","29","1"),
("301","407","AHMEDABAD","","101","1","1","","0","2020","29","1");
INSERT INTO tbl_cust_address VALUES
("302","408","Dhrangdhra","","101","1","35","","0","2020","29","1"),
("303","409","ahmedabd","","101","1","1","","0","2020","29","1"),
("304","410","Balasinor","","101","1","0","","0","2020","29","1"),
("305","411","Ahmedabad","","101","1","1","","0","2020","29","1"),
("306","412","dhandhuka ","","101","1","1","","0","2020","29","1"),
("307","413","Bhuj","","101","1","16","","0","2020","29","1"),
("308","414","Hajipur","","101","5","203","","0","2020","32","1"),
("309","415","Ahmedabad","","101","1","1","","0","2020","29","1"),
("310","416","AHMEDABD","","101","1","1","","0","2020","29","1"),
("311","417","Agra","","101","27","182","","0","2020","32","1"),
("312","418","Ahmedabad","","101","1","1","","0","2020","29","1"),
("313","419","Ahmedabad","","101","1","1","","0","2020","29","1"),
("314","420","Ahmedabad","","101","1","1","","0","2020","29","1"),
("315","421","ahmedabd","","101","1","1","","0","2020","29","1"),
("316","422","Begusarai","","101","5","205","","0","2020","32","1"),
("317","423","Ahmedabad","","101","1","1","","0","2020","29","1"),
("318","424","A","Ahmedabad","101","1","1","","0","2020","29","1"),
("319","425","limbasi","","101","1","1","","0","2020","29","1"),
("320","426","Gorakhpur","","101","27","206","","0","2020","32","1"),
("321","427","Ahmedabad","","101","1","1","","0","2020","29","1"),
("322","428","Ahmedabad","","101","1","1","","0","2020","29","1"),
("323","429","ahmedabd","","101","1","1","","0","2020","29","1"),
("324","430","Relif Road","","101","1","1","","0","2020","29","1"),
("325","431","Ahmedabad","","101","1","1","","0","2020","29","1"),
("326","432","ahmedabd","","101","1","1","","0","2020","29","1"),
("327","433","Odhav","","101","1","1","","0","2020","29","1"),
("328","434","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("329","435","ahmedabad","","101","1","1","","0","2020","29","1"),
("330","436","satellite","","101","1","1","","0","2020","27","1"),
("331","437","vatva","","101","1","1","","0","2020","34","1"),
("332","438","Kathwada","","101","1","1","","0","2020","29","1"),
("333","439","Bakrol","","101","1","1","","0","2020","29","1"),
("334","440","rakhial","","101","1","1","","0","2020","34","1"),
("335","441","rakhial","","101","1","1","","0","2020","28","1"),
("336","442","vatva","","101","1","1","","0","2020","34","1"),
("337","443","vatva","","101","1","1","","0","2020","34","1"),
("338","444","kalupur","","0","0","0","","0","2020","28","1"),
("339","445","tirupati ","","101","1","1","","0","2020","34","1"),
("340","446","Sateliite","","101","1","1","","0","2020","29","1"),
("341","447","odhav","","101","1","1","","0","2020","34","1"),
("342","448","thaltej","","101","1","1","","0","2020","34","1"),
("343","449","Ahmedabad","","101","1","1","","0","2020","29","1"),
("344","450","ahmedabad","","101","1","1","","0","2020","34","1"),
("345","451","vatwa","","101","1","1","","0","2020","34","1"),
("346","452","Naroda","","101","1","1","","0","2020","29","1"),
("347","453","Agra","","101","27","182","","0","2020","32","1"),
("348","454","Kaushambi","","101","27","207","","0","2020","32","1"),
("349","455","ellisbriges","","101","1","1","","0","2020","34","1"),
("350","456","Sangli","","101","16","178","","0","2020","32","1"),
("351","457","Ahmedabad","","101","1","1","","0","2020","29","1"),
("352","458","Uskabazar","","101","27","208","","0","2020","32","1"),
("353","459","Tekra","","101","1","1","","0","2020","34","1"),
("354","460","Pune","","101","16","147","","0","2020","32","1"),
("355","461","Hyderabad","","101","25","209","","0","2020","32","1"),
("356","462","Ahmedabad","","101","1","1","","0","2020","29","1"),
("357","463","sola","","101","1","1","","0","2020","34","1"),
("358","464","Khurja","","101","27","210","","0","2020","32","1"),
("359","465","Jamalpur","","101","5","211","","0","2020","32","1"),
("360","466","Gandhinagar","","101","1","143","","0","2020","29","1"),
("361","467","Osmanabad","","101","16","212","","0","2020","32","1"),
("362","468","Lambha","","101","1","1","","0","2020","34","1"),
("363","469","Allahabad","","101","27","185","","0","2020","32","1"),
("364","470","odhav","","101","1","1","","0","2020","34","1"),
("365","471","Pune","","101","16","147","","0","2020","32","1"),
("366","472","Amroha","","101","27","213","","0","2020","32","1"),
("367","473","Igatpuri","","101","16","214","","0","2020","32","1"),
("368","474","Satara","","101","16","215","","0","2020","32","1"),
("369","475","Nashik","","101","16","166","","0","2020","32","1"),
("370","476","Raigad","","101","16","216","","0","2020","32","1"),
("371","477","Karad","","101","16","217","","0","2020","32","1"),
("372","478","Buldana","","101","16","218","","0","2020","32","1"),
("373","479","Mumbai","","101","16","140","","0","2020","32","1"),
("374","480","Nagpur","","101","16","146","","0","2020","32","1"),
("375","481","Muzaffarpur","","101","5","219","","0","2020","32","1"),
("376","482","Pune","","101","16","147","","0","2020","32","1"),
("377","483","Mumbai","","101","16","140","","0","2020","32","1"),
("378","484","Maharashtra","","101","16","0","","0","2020","32","1"),
("379","485","Ulhasnagar","","101","16","221","","0","2020","32","1"),
("380","486","Biswanath Chariali","","101","4","222","","0","2020","32","1"),
("381","487","Odhav","","101","1","1","","0","2020","29","1"),
("382","488","vatva","","0","0","0","","0","2020","28","1"),
("383","489","Kathwada","","101","1","1","","0","2020","29","1"),
("384","490","Ahmedabad","","101","1","1","","0","2020","29","1"),
("385","491","ODHAV","","0","0","0","","0","2020","28","1"),
("386","492","Ahmedabad","","101","1","1","","0","2020","29","1"),
("387","493","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("388","494","Jaunpur","","101","27","223","","0","2020","32","1"),
("389","495","Gorakhpur","","101","27","206","","0","2020","32","1"),
("390","496","Ahmedabad","","101","1","1","","0","2020","29","1"),
("391","497","Sangam","","101","16","224","","0","2020","32","1"),
("392","498","Chennai","","101","25","225","","0","2020","32","1"),
("393","499","Chandrapur","","101","16","152","","0","2020","32","1"),
("394","500","Nashik","","101","16","166","","0","2020","32","1"),
("395","501","AHMEDABAD","","101","1","1","","0","2020","29","1"),
("396","502","Saharanpur","","101","27","177","","0","2020","32","1"),
("397","503","Deoband","","101","27","226","","0","2020","32","1"),
("398","504","Hyderabad","","101","25","209","","0","2020","32","1"),
("399","505","Ahmedabad","","101","1","1","","0","2020","29","1"),
("400","506","Hyderabad","","101","25","209","","0","2020","32","1"),
("401","507","Mirzapur","","101","27","171","","0","2020","32","1");
INSERT INTO tbl_cust_address VALUES
("402","508","Sambhal","","101","27","227","","0","2020","32","1"),
("403","509","Ahmedabad","","101","1","1","","0","2020","29","1"),
("404","510","Belgaum","","101","13","163","","0","2020","32","1"),
("405","511","Ahmedabad","","101","1","1","","0","2020","29","1"),
("406","512","Siwan","","101","5","228","","0","2020","32","1"),
("407","513","NARODA","","101","1","1","","0","2020","28","1"),
("408","514","Ahmedpur","","101","16","229","","0","2020","32","1"),
("409","515","Alibag","","101","16","230","","0","2020","32","1"),
("410","516","Firozabad","","101","27","231","","0","2020","32","1"),
("411","517","Jaunpur","","101","27","223","","0","2020","32","1"),
("412","518","Bettiah","","101","27","0","","0","2020","32","1"),
("413","519","Orai","","101","27","232","","0","2020","32","1"),
("414","520","Deoria","","101","27","198","","0","2020","32","1"),
("415","521","Yavatmal","","101","16","233","","0","2020","32","1"),
("416","522","Beed","","101","16","234","","0","2020","32","1"),
("417","523","Mirzapur","","101","27","171","","0","2020","32","1"),
("418","524","Patna","","101","5","235","","0","2020","32","1"),
("419","525","Ahmedabad","","101","1","1","","0","2020","29","1"),
("420","526","Saharanpur","","101","27","177","","0","2020","32","1"),
("421","527","Ahmedabad","","101","1","1","","0","2020","29","1"),
("422","528","Ahmedabad","","101","1","1","","0","2020","29","1"),
("423","529","Ahmedabad","","101","1","1","","0","2020","29","1"),
("424","530","Ahmedabad","","101","1","1","","0","2020","29","1"),
("425","531","Ahmedabad","","101","1","1","","0","2020","29","1"),
("426","532","Ahmedabad","","101","1","1","","0","2020","29","1"),
("427","535","VATVA","","0","0","0","","0","2020","28","1"),
("428","536","NARODA","","0","0","0","","0","2020","28","1"),
("429","537","SATELITE","","0","0","0","","0","2020","28","1"),
("430","538","VATVA","","0","0","0","","0","2020","28","1"),
("431","539","GATLODIYA","","0","0","0","","0","2020","28","1"),
("432","540","ISANPUR","","0","0","0","","0","2020","28","1"),
("433","541","Ahmedabad","","101","1","1","","0","2020","29","1"),
("434","542","Ahmedabad","","101","1","1","","0","2020","29","1"),
("435","543","Ahmedabad","","101","1","1","","0","2020","29","1"),
("436","544","ODHAV","","0","0","0","","0","2020","28","1"),
("437","545","Ahmedabad","","101","1","1","","0","2020","29","1"),
("438","546","MEMCO","","0","0","0","","0","2020","28","1"),
("439","547","DANILIMDA","","2","0","0","","0","2020","28","1"),
("440","548","KATHWADA","","0","0","0","","0","2020","28","1"),
("441","549","Ahmedabad","","101","1","1","","0","2020","29","1"),
("442","550","ODHAV","","0","0","0","","0","2020","28","1"),
("443","551","ODHAV","","0","0","0","","0","2020","28","1"),
("444","552","CTM","","101","1","1","380026","0","2020","28","1"),
("445","553","Assam","","101","4","0","","0","2020","32","1"),
("446","554","odhav","","0","0","0","","0","2020","28","1"),
("447","555","maninagar","","0","0","0","","0","2020","28","1"),
("448","556","dhudheshwer","","0","0","0","","0","2020","28","1"),
("449","557","vatva","","0","0","0","","0","2020","28","1"),
("450","558","kalol","","0","0","0","","0","2020","28","1"),
("451","559","mahuva","","101","1","15","","0","2020","28","1"),
("452","560","halol","","101","1","124","","0","2020","28","1"),
("453","561","UP","","101","27","0","","0","2020","32","1"),
("454","562","Latur","","101","16","165","","0","2020","32","1"),
("455","563","Odhav Ring Road","51, Karnavati Estate","101","1","1","","0","2020","29","1"),
("456","564","CTM","","101","1","1","","0","2020","29","1"),
("457","565","SARANGPUR","","101","1","1","","0","2020","28","1"),
("458","566","Ahmedabad","","101","1","1","","0","2020","33","1"),
("459","567","ahmedabad","","101","1","1","","0","2020","33","1"),
("460","568","ahmedabad","","101","1","1","","0","2020","33","1"),
("461","569","ahmedabad","","101","1","1","","0","2020","33","1"),
("462","570","ahmedabad","","101","1","1","","0","2020","33","1"),
("463","571","ahmedabad","","101","1","1","","0","2020","34","1"),
("464","572","ahmedabad","","101","1","1","","0","2020","34","1"),
("465","573","ahmedabad","","101","1","1","","0","2020","34","1"),
("466","574","ahmedabad","","101","1","1","","0","2020","34","1"),
("467","575","Kalol","","101","1","61","","0","2020","1","1"),
("468","576","Gandhinagar","","101","1","143","","0","2020","27","1"),
("469","577","Ahmedbad","","101","1","1","","0","2020","27","1"),
("470","578","Naroda","","101","1","1","","0","2020","29","1"),
("471","579","Jamnagar","","101","1","52","","0","2020","32","1"),
("472","580","Ahemdabad","","101","1","1","","0","2020","32","1"),
("473","581","Ahmedabad","","101","1","1","","0","2020","32","1"),
("474","582","Ahemdabad","","101","1","1","","0","2020","32","1"),
("475","583","Ahemdabad","","101","1","1","","0","2020","32","1"),
("476","584","Ahemdabad","","101","1","1","","0","2020","32","1"),
("477","585","Tanzania","","216","0","0","","0","2020","27","1"),
("478","586","Ahemdabad","","101","1","1","","0","2020","32","1"),
("479","587","Mehasana","","101","1","236","","0","2020","32","1"),
("480","588","kathwada ","","101","1","1","","0","2020","33","1"),
("481","589","Ahmedabad","","101","1","120","","0","2020","27","1"),
("482","590","Ahmedabad","","101","1","1","","0","2020","32","1"),
("483","591","Kanodar","","101","1","0","","0","2020","32","1"),
("484","592","Ahmedabad","","101","1","1","","0","2020","32","1"),
("485","593","Ahmedabad","","101","1","1","","0","2020","32","1"),
("486","594","Ahmedabad","","101","1","1","","0","2020","32","1"),
("487","595","Ahmedabad","","101","1","1","","0","2020","32","1"),
("488","596","Ahmedabad","","101","1","1","","0","2020","32","1"),
("489","597","Surendranagar","","101","1","111","","0","2020","32","1"),
("490","598","Ahmedabad","","101","1","1","","0","2020","32","1"),
("491","599","Ahmedabad","","101","1","1","","0","2020","32","1"),
("492","600","Ahmedabad","","101","1","1","","0","2020","32","1"),
("493","601","Â SARASPUR,","","101","1","1","","0","2020","33","1"),
("494","602","Kapadvanj","","101","1","62","","0","2020","32","1"),
("495","603","Ahmedabad","","101","1","1","","0","2020","32","1"),
("496","604","Valsad","","101","1","125","","0","2020","32","1"),
("497","605","Daman","","101","1","0","","0","2020","32","1"),
("498","606","Ahmedabad","","101","1","1","","0","2020","32","1"),
("499","607","Ahmedabad","","101","1","1","","0","2020","32","1"),
("500","608","Ahmedabad","","101","1","1","","0","2020","32","1"),
("501","609","Ahmedabad","","101","1","1","","0","2020","32","1");
INSERT INTO tbl_cust_address VALUES
("502","610","Ahmedabad","","101","1","1","","0","2020","32","1"),
("503","611","Ahmedabad","","101","1","1","","0","2020","32","1"),
("504","612","Ahmedabad","","101","1","1","","0","2020","32","1"),
("505","613","NARODA","","0","0","0","","0","2020","28","1");




CREATE TABLE `tbl_cust_contact` (
  `c_con_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_creator` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `c_con_fname` varchar(255) NOT NULL,
  `c_con_lname` varchar(255) NOT NULL,
  `c_con_email` varchar(255) NOT NULL,
  `c_con_mobile` varchar(255) NOT NULL,
  `c_con_phone` varchar(255) NOT NULL,
  `c_con_job` varchar(255) NOT NULL,
  `cust_title` varchar(255) NOT NULL,
  `cust_email2` varchar(255) NOT NULL,
  `cust_mobile2` varchar(255) NOT NULL,
  `cust_dept` int(11) NOT NULL,
  `cust_web` varchar(255) NOT NULL,
  `cust_comm` int(11) NOT NULL,
  `cust_skype` varchar(255) NOT NULL,
  `cust_linkedin` varchar(255) NOT NULL,
  `cust_ship_street` longtext NOT NULL,
  `c_ship_country` int(11) NOT NULL,
  `c_ship_state` int(11) NOT NULL,
  `c_ship_city` int(11) NOT NULL,
  `cust_ship_zip` varchar(255) NOT NULL,
  `cust_ship_location` varchar(255) NOT NULL,
  `cust_street` longtext NOT NULL,
  `c_add_country` int(11) NOT NULL,
  `c_add_state` int(11) NOT NULL,
  `c_add_city` int(11) NOT NULL,
  `cust_zip` varchar(255) NOT NULL,
  `cust_location` varchar(255) NOT NULL,
  `cust_dob` date NOT NULL,
  `cust_fax` varchar(255) NOT NULL,
  `cust_hp` varchar(255) NOT NULL,
  `cust_op` varchar(255) NOT NULL,
  `c_con_status` int(11) NOT NULL,
  `cdate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`c_con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=latin1;


INSERT INTO tbl_cust_contact VALUES
("1","0","1","TIRTH","PATEL","TIRTHPATEL@ERENGIEERING.IN","","","owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","1","1"),
("2","0","2","NIMESH ","SHAH","UNITECHSYSTEMS96@GMAIL.COM","9825011605","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("3","0","3","CHIRAG ","SHAH","CHIRAGSHAH_665@YAHOO.COM","9328558358","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("4","0","4","IRFAN ","KHAN","IRFANKING19121993@GMAIL.COM","8469968864","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("5","0","5","PRAVINBHAI","","r.p.apransh@gmail.com","7698299845","9265744742","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("6","0","6","SINDHAV ","SOMABHAI","S.SINDHAV3161@GMAIL.COM","9825048760","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("7","0","7","VIPUL MISTRY","","vipulmistry79@yahoo.com","9426568933","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("8","0","8","GOSWAMI PARTH","","goswami.parth376@gmail.com","9825830320","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("9","0","9","VIPIN","LABANA","LABANA.VIPIN@GMAIL.COM","9913986621","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("10","0","10","JIGNESH","PATEL","JIGNESHINDIAN140712@GMAIL.COM","9824560692","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("11","0","11","DHARMESH","PANCHAL","LAXMISPROCET490@GMAIL.COM","9925367183","","Manager","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("12","0","12","VILASRAO MANOHAR","DESHMUKH","DESAMUKH@GMAIL.COM","9824434887","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("13","0","13","JAGRAJ","SOLANKI","HEENAPLASTIC2017@GMAIL.COM","9725353203","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("14","0","14","G R PATEL","","","9825074026","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("15","0","15","HARDIK BHAI","","HARDIK@KARADANIENG.COM","9426580877","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("16","0","16","VIRAV BHAI","","","9925153467","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("17","0","17","ARCHIT POKAR","","","989823777","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("18","0","18","KAMLESH BHAI","","","8141215533","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("19","0","19","RAJKUMAR BHAI","","","9974374794","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("20","0","20","APURAV BHAI","","","9925790990","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("21","0","21","KANTI BHAI","","","9825492002","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("22","0","23","HIMMAT BHAI","","","9825026882","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("23","0","22","TEJAS BHAI","","","9377092267","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("24","0","25","ALPESH BHAI","","","9825256117","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("25","0","26","MUKESH BHAI","","","9824267536","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("26","0","27","RAJIV SIR","","","9426641480","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("27","0","28","YOGESH BHAI","","","9979975714","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("28","0","29","CHETAN BHAI","","","9824214567","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("29","0","30","JINESH BHAI","","","9825037015","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("30","0","31","MEHUL BHAI","","","9825023122","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("31","0","32","SANTOSH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("32","0","33","RAVI PPATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("33","0","34","JAGRUT BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("34","0","35","PRAGNESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("35","0","36","VASU BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("36","0","37","BRIJESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("37","0","39","VISHAL","SHAH","SALES@SHREERAJCORPORATION.COM","9913799333","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("38","0","42","JIGNESH BHAI","","","8511119955","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("39","0","45","PIYUSH","PANCHAL","","9925452516","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("40","0","46","ASHOK BHAI","","","9825358024","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("41","0","47","MANOJ BHAI","","","Manoj Bhai","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("42","0","48","MAYANK  BHAI","","","9227440199","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("43","0","49","KUNAL BHAI","","","9727927485","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("44","0","50","SHASHIKANT MAKHARIA","","","9377966596","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("45","0","51","PAL PRINCE","","princepal2293@gmail.com","8733090616","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("46","0","52","OJAS DEVALIYA","","devyanifashion777@gmail.com","7383801999","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("47","0","53","RANCHOD ODE","","saiconstruction722@yahoo.in","9913248722","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("48","0","55","SADIP PATEL","","shreeumiyabookstore@gmail.com","9429388162","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("49","0","57","SANJAY TANK","","sanjaytank618@gmail.com","7016652297","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("50","0","58","TUSHAR VAGHELA","","tjvaghela@gmail.com","9727722687","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("51","0","59","AJAY NAYAK","","ajaynayak2709@gmail.com","9925013070","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("52","0","60","HITESH PATEL","","satish.x.602@gmail.com","9979872602","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("53","0","61","GANPATSINGH RAJPUT","","ganpatsinghsurana@gmail.com","9428737478","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("54","0","63","WASIM SHAIKH","","wasimshaikh70086@gmail.com","9033077030","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("55","0","64","RAMESH MATARIYA","","patelrubber6005@gmail.com","9558506005","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("56","0","66","KAUSHIK SONI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("57","0","67","RAKESH KSHATRIYA","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("58","0","70","LALIT SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("59","0","71","JIGAR THAKKAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("60","0","72","MAYUR CHAVDA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("61","0","73","RIDHESH ANTALA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("62","0","74","HITEN PATEL","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("63","0","75","BRIJESH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("65","0","94","CHETAN","PATEL","","9925599323","","Partner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("66","0","95","JATIN RADHANI","","jatinradhani@ymail.com","9586441313","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("67","0","96","JOGRAJ RAJPUROHIT","","jograjrajpurohit568@gmail.com","9725265400","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("68","0","97","SHEIKH FARUK","","faruksheikh69355@gmail.com","919913160386","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("69","0","98","VYAS PUSHPENDRA","","mvpushpendra88@gamil.com","918866782232","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("70","0","99","RASHID KHAN","","rashidkhan760@gmail.com","917383531095","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("71","0","100","KEYUR PATEL","","keyurpatel643@gmail.com","919429471181","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("72","0","101","SANDIP PATEL","","sandip.patel7779@gmail.com","919724262080","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("73","0","102","MANISH PARMAR","","mohitbsnl17@gmail.com","919510171734","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("74","0","103","RAVI PATEL","","ravi.p9933@gmail.com","919913359994","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("75","0","104","SHOAIB VEPARI","","","919712666222","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("76","0","105","DEVEN BADANI","","simandhar88@gmail.com","919879955710","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("77","0","106","DAVE VISHAL","","vishal.dave54@gmail.com","919824092338","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("78","0","107","JETHVA SANJAY","","sanjayjethava815@gmail.in","919723979291","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("79","0","108","RAVINDRA AGRAWAL","","shreeganesh.2010@yahoo.com","919510862570","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("80","0","109","HIREN BHAYANI","","hirenbhayani20@gmail.com","919687395894","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("81","0","110","VASANT DHANANI","","vasantparesh007@gmail.com","919157579154","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("82","0","111","VINOD JIYANI","","jiyanivinod@gmail.com","919376109402","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("83","0","112","CHAUHAN SANJAY","","sanjayochauhan4971@gmail.com","919327904443","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("84","0","113","CHIRAG GAJJAR","","sachintexind@gmail.com","919726267450","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("85","0","114","ALPESH PATEL","","alpeshmaury12@gmail.com","918140626789","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("86","0","115","KIRITBHAI HARIBHAI","","kiritsarvaiya@567gmail.com","918401090476","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("87","0","116","NARENDRA MALVIYA","","malviya15@gmail.com","919662772306","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("88","0","117","ARIF SHAIKH","","arifshaikh873482@gmail.com","918734826951","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("89","0","118","GAMARA KAMLESH","","shreegwalinathtrading@gmail.com","919898777799","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("90","0","119","VYAS JANAK","","alphachem14@gmail.com","919426318936","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("91","0","120","MUKESH KUMAR","","mukesh9884595@gmail.com","9879113490","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("92","0","121","CHAUHAN ANANDSINH","","at1561996@gmail.com","919979371648","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("93","0","122","TARANG RAVAL","","tarangraval20@gmail.com","917984475220","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("94","0","123","CHAVDA BHUPENDRSINH","","bhupendrasinh319@gmail.com","919904158966","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("95","0","124","HIREN G PATEL","","hirenpatel6912@gmail.com","918238039240","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("96","0","125","PRATIK PATEL","","pratik4u83@gmail.com","919825555616","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("97","0","126","ANAND VADDI","","anandvaddi@yahoo.com","917878769896","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("98","0","127","ISHAN BHAI","","ip990@gmail.com","918758096748","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("99","0","128","NAVIN BHAI","","rajesh9978844486@gmail.com","919427874596","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("100","0","129","NANJIBHAI SUTHAR","","nanjibhaiksuthar@gmail.com","919712133598","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("101","0","130","JIGAR PANCHAL","","jigarpanchal71@gmail.com","919898520351","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1");
INSERT INTO tbl_cust_contact VALUES
("102","0","131","KIRAN DODA","","design1641@gmail.com","919427608133","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("103","0","132","SURESHBHAI CHAUHAN","","sureshjchauhan@gmail.com","919426833531","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("104","0","133","PATEL HARSH","","patelharsh9427@gmail.com","7698762937","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("105","0","134","PARAS MEWADA","","parasmewada@yahoo.co.in","919898525232","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("106","0","135","KALPESH PATEL","","mahadevburner@gmail.com","917622888777","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("107","0","136","PATEL KALPESH VISHNUBHAI","","patelkalpesh712418@gmail.com","919510343710","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("108","0","137","JATIN PATEL","","pateljatin407@gmail.com","919099141490","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("109","0","138","VINOD PATEL","","vinodpatel87305@gmail.com","919737746114","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("110","0","139","HARSHAD PATEL","","renuhpatel@yahoo.com","919898122922","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("111","0","141","YUNUSPANDYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("112","0","144","MAHESH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("113","0","146","DEELIP GAJJAR","","","9824729189","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("114","0","148","VIJAYSINH PARMAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("115","0","152","ASHVIN MISTRY","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("116","0","156","NAVNEET PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("117","0","158","DHAVAL SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("118","0","168","SAMRAT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("119","0","169","AABIDIN BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("120","0","171","ASHOK RATHOD","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("121","0","175","KIRTAN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("122","0","177","BABU MAKWANA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("123","0","179","MUKESH VAGHASIYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("124","0","193","PRAMOD BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("125","0","194","SHRIRANG ","JADHAV","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("126","0","195","KESHAV ","PANDIT","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("127","0","196","ASHOK ","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("128","0","197","ANAND","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("129","0","198","RAJKUMAR","JANGID","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("130","0","199","RAJADEEN ","KHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("131","0","200","RAKESH","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("132","0","201","LOKESH","SHARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("133","0","202","S JAYAVEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("134","0","203","SHAIJU ","MATHEW","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("135","0","204","RAJA ","LINGARAJ","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("136","0","205","AJAY","SHARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("137","0","206","BRAVIN ","CHANDER","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("138","0","207","ABID KP","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("139","0","208","ANURAG ","MEHRISHI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("140","0","209","JITENDRA"," TURARE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("141","0","210","RAJESH","PATIL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("142","0","211","SHIVAKUMAR"," MUNIRATHNAM","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("143","0","213","RAMESH ","LADDE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("144","0","212","PRASHANT ","SANGHAVI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("145","0","214","SACHIN ","MADANE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("146","0","215","PRASHANT ","AHER","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("147","0","216","RAJESH"," YADAV","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("148","0","217","JAGDISH"," AHUJA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("149","0","218","JAYPRAKASH"," VISHWAKARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("150","0","219","RAHUL"," SINGH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("151","0","220","SHOBHIT ","GUPTA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("152","0","221","AJITH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("153","0","222","BHAGYA"," RITHISH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("154","0","223","DEVENDRA ","CHAURASIA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("155","0","224","JOGENDRA ","BORUAH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("156","0","225","VISHWAJIT ","ADURE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("157","0","226","MADHU","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("158","0","227","PRASANNA S SHIVA S","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("159","0","228","RAJEEV ","GARG","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("160","0","229","VISHAL","RASTOGI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("161","0","230","SUJEET ","BARANWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("162","0","231","ASHUTOSH"," GOYAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("163","0","232","ULHAS ","PATIL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("164","0","233","SUNIL ","AGARWALLA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("165","0","234","AMIT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("166","0","235","KAPI","L SHARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("167","0","236","SNEH ","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("168","0","237","HAPPY ","VERMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("169","0","239","S K YADAV","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("170","0","238","SALEH","AHMED","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("171","0","240","HIMANSHU ","JAISWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("172","0","267","BHAVIN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("173","0","278","KASUHAL KISHOR","TRIPATHI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("174","0","292","SOMNATH ","AHIRE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("175","0","293","YASIN"," JAMADAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("176","0","295","ARIFUL ","ISLAM","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("177","0","304","O.P. AHUJA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("178","0","305","VISHAL ","JAISWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("179","0","306","PRAMILRAJ ","JAIN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("180","0","307","TEST","TEST","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("181","0","309","NIRMAL ATULBHAI PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("182","0","310","SALMAN ","KHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("183","0","311","KALPESH SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("184","0","312","JAYDEEP VADDORIYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("185","0","313","KHIROD","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("186","0","314","RAVI BHATELIA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("187","0","315","AIJAZ ","SIDDIQUI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("188","0","316","YASHVANT GADHIYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("189","0","317","RAJ","GUPTA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("190","0","318","UMESH","BAJAJ","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("191","0","319","MOHSIN MADHUPUR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("192","0","320","AKSHAY","JADAV","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("193","0","321","VIRENDRA ","BHAJIPALE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("194","0","322","NAVNIT BHADALIYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("195","0","323","ASHOK JAISWAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("196","0","324","GANSHYAMBHAI GYANCHAND SINDHI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("197","0","325","ASHOK PARMAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("198","0","326","GHULAM SARWAR KHAN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("199","0","327","GANPATSINGH RAJPUT RAJPUT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("200","0","328","SHIVA JI VERMA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("201","0","329","KHALID ZERAWALA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1");
INSERT INTO tbl_cust_contact VALUES
("202","0","330","INDER BHATI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("203","0","331","NAVPREET ","OBEROI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("204","0","332","PRIYANK CHAUHAN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("205","0","333","KAUSHIK SONI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("206","0","334","BITU ","DAS ","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("207","0","335","MANISH RAICHANDANI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("208","0","336","SALIM SHAIKH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("209","0","337","ASHISH ","AGNIHOTRI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("210","0","338","GOHIL CHANDRESH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("211","0","339","ARIK JAIN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("212","0","340","AMAN AGRAWAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("213","0","341","ANKIT","MUNDADA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("214","0","342","SANDIP PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("215","0","343","MITESH PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("216","0","344","SUBHASHBHAI SONI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("217","0","346","JADAV RAMESH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("218","0","348","MOHIT SINGH GHANGHORIYA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("219","0","347","CHIRAG BHAI KANANI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("220","0","349","HARIBHAI RAJPOOT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("221","0","350","RAVI SUTHAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("222","0","351","AZYX111","YA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("223","0","352","DOBARIYA PIYUSH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("224","0","353","VIKKY RATHORE AMIT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("225","0","354","AMRUTBHAI PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("226","0","355","NARENDRASINGH RAJPUT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("227","0","356","RAVI BHATT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("228","0","358","AMIT PAREKH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("229","0","357","HASMUKH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("230","0","359","BIPIN BHAI","","","9327061969","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("231","0","360","HASMUKHBHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("232","0","361","AMBARAMBHAI MAKASANA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("233","0","362","JAYDEEP PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("234","0","363","PRATIK BHAI","7801811655","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("235","0","364","TARUN BHARDWAJ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("236","0","365","PRAMOD JHANWAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("237","0","366","VALANI VAIBHAV","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("238","0","367","TULSI PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("239","0","368","DIVYESH  BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("240","0","369","ZALA BHUPAT SINH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("241","0","370","PURVANG RAVAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("242","0","371","HARESH PRAJAPATI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("243","0","372","SAGARBHAI P SHETH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("244","0","373","AJAY BHAI","","","","9879518727","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("245","0","374","VAIBHAV KHATRI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("246","0","375","RONAK PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("247","0","376","PANCHAL VIPUL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("248","0","377","SANDIP BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("249","0","378","BHAVESH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("250","0","379","MAYANK HIRPARA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("251","0","380","MANIN PRAJAPATI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("252","0","381","DHARMESHKUMAR SHANKARBHAI PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("253","0","382","PATEL MAHESH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("254","0","383","HITESH THAKKAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("255","0","384","PRAJAPATI GANPAT KUMAWAT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("256","0","385","RAJESH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("257","0","386","OMPRAKASH CHOUDHARY","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("258","0","387","NEELESH NANDA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("259","0","388","VISHAL KHODIFA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("260","0","389","SUKETU THAKKAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("261","0","390","GURMUKH","","","9998078142","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("262","0","391","CHETANSINH VAGHELA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("263","0","392","SHARMA DARSHAN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("264","0","393","TASVIN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("265","0","395","HARESH PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("266","0","396","JIVRANI DEVENDRA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("267","0","394","DEEPESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("268","0","397","KAMAL JHA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("269","0","398","AMIT PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("270","0","399","HIMANSHU PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("271","0","400","SIDDHANT BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("272","0","401","SAGAR PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("273","0","402","NISARG MODH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("274","0","403","PRAGNESH SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("275","0","404","PAVAN KALAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("276","0","405","GIRIRAJ CHAVDA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("277","0","345","BALRAM ","KHATRI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","3","4"),
("278","0","406","PARMAR SANJAY","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("279","0","407","NIRAV VAKIL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("280","0","408","ASHVIN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("281","0","409","DASHRATH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("282","0","410","JEKI LALWANI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("283","0","411","DILIP PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("284","0","412","MEHTA GROUP","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("285","0","413","BHAVIK THAKKAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("286","0","414","BALRAM ","KHATRI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("287","0","415","DEVENDRA PADMANI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("288","0","416","YASAR TADHA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("289","0","417","YOGESH ","TIWARI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("290","0","418","MUKESH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("291","0","419","SAMIR PUROHIT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("292","0","420","JAVALANT BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("293","0","421","JATIN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("294","0","422","RAUSHAN","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("295","0","423","MINESH BAROT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("296","0","424","RIZVAN MAFAT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("297","0","425","SATISH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("298","0","427","ASPAK MALEK","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("299","0","426","ADESH KUMAR SINGH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("300","0","428","SHIRISH SAVALIYA","","","6351571438","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("301","0","429","NAREN OZA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1");
INSERT INTO tbl_cust_contact VALUES
("302","0","430","DHANRAJ PAWAR","","","9979474707","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("303","0","431","PANKAJ PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("304","0","432","ASHWIN ASHWIN SHINGALA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("305","0","433","NILESH SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("306","0","434","VINAY MEHTA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("307","0","435","BHARGAV MEHTA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("308","0","436","HR","RAVAL","","7405490989","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("309","0","438","ISHWAR BHAI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("310","0","439","PRAJESH BHAI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("311","0","440","ZED VALVES","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("312","0","441","RAJU BHAI","","","","9227527233","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("313","0","442","KAMBERT MACHINERY ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("314","0","443","AEGIES ENGNIREEING ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("315","0","41","HITESH BHAI","","","","9998405280","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("316","0","445","PREMIER MILL STORE ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("317","0","444","HARESH BHAI","","","","8460830583","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("318","0","446","SHAILESH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("319","0","447"," BHAGWATI SPHEROCAST","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("320","0","448","SCC INFRASTRUCTURE ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("321","0","449","MANISH SHAH","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("322","0","450"," NABROS PHARMA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("323","0","451","SMIT MEDIMED PVT. LTD ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("324","0","452","SANAJAY BHAI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("325","0","453","MOHD YUNUS QURESHI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("326","0","454","MOHD IMRAN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("327","0","455","RATNAM LAMINATES ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("328","0","456","RAJENDRA","KALLOLE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("329","0","457","ANSHUL SABUWALA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("330","0","458","ASHOK ","JAISWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("331","0","459","APEX  FORMULATIONS ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("332","0","460","MOHSIN ","PATHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("333","0","461","AMANN K M","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("334","0","462","HITESH BAHTI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("335","0","463","TRIO ELEVATORS COMPANY ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("336","0","464","PRADEEP","SHARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("337","0","466","RAJU BHAI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("338","0","467","RUTURAJCHAGANRAO ","GHEWARE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("339","0","468","LEISTUNG ENGINEERING","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("340","0","469","S K PANDIT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("341","0","470","ALLMARC INDUSTRIES PVT .LTD ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("342","0","471","PANDIT"," HAVINAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("343","0","473","MUKESH"," VARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("344","0","472","SK SAINI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("345","0","474","RAHUL ","SHINGADE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("346","0","465","RAMPRAVESH ","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("347","0","475","SANDEEP ","KALE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("348","0","476","JAYANTA KASHINATH PANCHAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("349","0","477","SIDDHU ","CHAVAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("350","0","478","DATTA UBALE PATIL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("351","0","479","VIJAY","CHOUDHARY","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("352","0","480","NANDKISHOR ","HARODE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("353","0","481","RAJKUMAR ","AGRAWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("354","0","482","SACHIN ","SURYAWANSHI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("355","0","483","MOHAMMED ","TANVEER","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("356","0","485","RAVI ","LULLA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("357","0","486","BISWAMBAR ","PAUL.","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("358","0","487","NAYAN BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("359","0","488","MAHENDRA BHAI","","","","9825457711","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("360","0","489","KRUNAL BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("361","0","160","DINESH BHAI","","","","9825022407","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("362","0","490","MAHESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("363","0","491","JAYDEEP PANCHAL","","INDAIFLUID.POWER@GMAIL.COM","","9722707737","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("364","0","492","SATISH PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("365","0","493","DHRUVIL BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("366","0","494","SMIT","SRIVASTAV","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("367","0","495","IRSHAD","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("368","0","496","CHETAN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("369","0","497","AMOL ","DISALE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("370","0","498","SUJIT","PRASAD","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("371","0","499","RAMESH ","MOHURLE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("372","0","500","ASIF ","KHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("373","0","501","KIRAN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("374","0","502","TARIQ"," KHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("375","0","503","ADESH ","CHOUDHARY","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("376","0","504","YERUVA SRINIVAS REDDY","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("377","0","505","PURAV PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("378","0","506","MADHAVA ","REDDY","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("379","0","507","DEEPAK","PAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("380","0","508","NAJAF ","AHMAD","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("381","0","509","BHIKHA BHAI PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("382","0","510","JEETENDRA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("383","0","511","BALU BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("384","0","512","PANKAJ","SINGH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("385","0","513","RAVI KHAKHARIYA","","","","9998006600","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("386","0","514","SANJAY","BEMBDE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("387","0","515","NIWAS","PATIL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("388","0","516","SIDDHARTH ","AGARWAL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("389","0","517","SWATANTRA ","SINGH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("390","0","518","RAHUL","PANDEY","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("391","0","519","SONU","KURELE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("392","0","520","ASAD ALAM SIDDIQUI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("393","0","521","MANOJ ","CHAUDHARI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("394","0","522","RAMDAS ","BARGAJE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("395","0","523","RAKESH","PRAJAPATI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("396","0","524","RAJEEV ","KUMAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("397","0","525","MANU BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("398","0","526","AJEET","SINGH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("399","0","527","ROHAN TIWARI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("400","0","528","MAHENDRA PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("401","0","529","KAMLESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1");
INSERT INTO tbl_cust_contact VALUES
("402","0","530","PANCHAL MUKESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("403","0","531","PARESH BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("404","0","532","SHIVSHARAN BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("405","0","533","","","","079-25831061","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("406","0","534","FULESH PATEL","",""," +91-99980 40407","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("407","0","535","DHANJI PATEL","","","+919898139820","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("408","0","536","JIMMY BHAI","","","8866776999","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("409","0","537","PULKIT VALA","","","9824024448","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("410","0","538","AGNIPLAS","","","9662004149","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("411","0","539","ORBIS","",""," 80009 68014","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("412","0","540","DHANAJAY","","","9821602232","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("413","0","541","GOVIND BHAI SUTHAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("414","0","542","SHAILENDRA PAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("415","0","543","VINOD BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("416","0","544","KIRIT PATEL","","","","9227677800","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("417","0","545","JATIN PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("418","0","546","KIRAN PATEL","","","","9825421214","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("419","0","547","HAMMAD","","","","9152168621","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("420","0","548","MANAV","","","9152101331","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("421","0","549","HITESH BHATI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("422","0","550","PRIYANK YADAV","","","","9712916736","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("423","0","551","NARENDRA BHAI PANCHAL","","","","9879050522","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("424","0","552","DHANSHUKH PRAJAPATI","","","","9879790353","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("425","0","553","MOHAMMAD","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("426","0","554","VIJAY BHAI","","","","9898252510","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("427","0","555","MUKESH PATEL","","","","9825065234","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("428","0","556","DINESH BHAI PARMAE","","","","9825319336","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("429","0","557","VIR","","","","9152110240","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("430","0","558","BHAVIN PATEL","","","","9879089535","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("431","0","559","JITU BHAI","","","","9426455698","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("432","0","560","UTTAM JAIN","","","","9824055936","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("433","0","557","VASU BHAI","","",""," 098244 96028","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("434","0","561","RAJEEV","GARG","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("435","0","562","SACHIN","MADANE","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("436","0","563","PRAVIN PATEL","","","8153004878","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("437","0","564","CHETAN PATEL","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("438","0","557","VISHNU BHAI","","","","9824496028","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("439","0","565","NISHANT SHAH","","","","9898044204","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("440","0","566","SNEHAL SANGHVI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("441","0","567","KEYUR G THAKKAR","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("442","0","569","UNNATI MECH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("443","0","570","NUREE PLASTIC INDUESTRI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("444","0","571","PANKAJ DADHANIA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("445","0","573","DINESH A VARMA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("446","0","574","RAJIV V SHAH","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("447","0","575","PARESH","PATEL","","9925996789","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("448","0","576","CHIRAG BHAI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("449","0","572","VINODCHANDRA SHANUBHAI PATEL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("450","0","571","PANKAJ DADHANIA","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","34","1"),
("451","0","547","ASHARAF BHAI","","","","9825024269","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("452","0","577","MR. SANGHVI","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("453","0","578","HARESH BHAI","","","","","Owner","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","29","1"),
("454","0","579","AKSHAY ","PANASARA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("455","0","580","HIMANSHU ","TAPODHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("456","0","582","HIREN","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("457","0","583","DARSHI","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("458","0","581","JANAK","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("459","0","584","SOHEL","KHOJA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("460","0","585","VISHAL ","SHETH","RAS@VIRAGROUP.CO.TZ","255658260296","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("461","0","586","OJAS ","DEVALIYA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("462","0","587","VIMAL","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("463","0","588","MARUTI AIR COMPASSOR ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("464","0","589","CHINTAN","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","27","1"),
("465","0","590","ANISH ","SHAIKH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("466","0","591","MANASIYA ","ZULFKIAR","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("467","0","593","KAMAL","JHA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("468","0","594","DHAVAL","SHAH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("469","0","595","CHIRAG"," SHAH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("470","0","596","PRATIK ","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("471","0","597","AMIT ","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("472","0","598","DHARMESH","JANI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("473","0","599","DARSHAN","SHARMA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("474","0","600","PRASHANT","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("475","0","601","MR.SURESH ","","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","33","1"),
("476","0","602","UMANG","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("477","0","603","SAURABH","SOLANKI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("478","0","604","MANSUR","VORHA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("479","0","605","SARFARAZ","SHAIKH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("480","0","606","JIGNESH","CHAUHAN","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("481","0","607","PARAG","SHAH","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("482","0","608","KUSHAL ","VALECHHA","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("483","0","609","JIGNESH ","TRIVEDI","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("484","0","610","ABHISHEK","SHAH ","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("485","0","612","CHIRAG ","PATEL","","","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","32","1"),
("486","0","613","SHATISH BHAI PATEL","","","","9428100517","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("487","0","90","ANKIT BHAI","","","9033968929","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("488","0","87","KISHAN BHAI","","","9825404666","","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1"),
("489","0","87","KISHAN PATEL","","","","9825404666","","","","","0","","0","","","","0","0","0","","","","0","0","0","","","0000-00-00","","","","0","2020","28","1");




CREATE TABLE `tbl_cust_existing` (
  `c_ext_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `c_ext_status` int(11) NOT NULL,
  `c_ext_type` varchar(255) NOT NULL,
  `c_ext_product` int(11) NOT NULL,
  `c_ext_remark` longtext NOT NULL,
  `cdate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`c_ext_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


INSERT INTO tbl_cust_existing VALUES
("1","5","0","150 KL EFFLUENT TREATMENT PLANT","32","","2019","1","1"),
("2","38","0","","413","","2020","1","1"),
("3","212","0","FIREWALL AND LANE CONNECTION","467","","2020","1","1"),
("4","2","0","","2","Emne CRM mate malava nu che but emne time nathi malto meeting no","2020","29","1"),
("5","3","0","","1","Te trading kare che enu software levu che but emne haji kai naki krayu nathi  kyare levu.","2020","29","1"),
("6","4","0","","1","Require Billing360 Software","2020","29","1"),
("7","5","0","","1","","2020","29","1"),
("8","14","0","","2","40 k prise call nd meet","2020","28","1"),
("9","15","0","","2","CRM + BILLING SETN QOT","2020","28","1"),
("10","16","0","","2","QOT MAIL","2020","28","1"),
("11","17","0","","2","60K PRISE ","2020","28","1"),
("12","19","0","","1","BILLING + CRM ","2020","28","1"),
("13","20","0","","1","BILLING + CRM ","2020","28","1"),
("14","21","0","","1","14500 RATE","2020","28","1"),
("15","23","0","","1","BILLING + INVONTY","2020","28","1"),
("16","359","0","","1","online demo aapiyo che 22k nd 15k prise aapiyo che","2020","28","1");




CREATE TABLE `tbl_customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `party_type` int(11) NOT NULL COMMENT '0:Both, 1:Customer, 2:Vendor',
  `cust_name` varchar(400) NOT NULL,
  `cust_creator` int(11) NOT NULL,
  `cust_code` varchar(255) NOT NULL,
  `cust_cat` int(11) NOT NULL,
  `cust_desc` longtext NOT NULL,
  `cust_ind` int(11) NOT NULL,
  `cust_type` int(11) NOT NULL,
  `cust_source` int(11) NOT NULL,
  `cust_gst` varchar(255) NOT NULL,
  `cust_mobile` varchar(255) NOT NULL,
  `cust_email` varchar(255) NOT NULL,
  `cust_assign_user` varchar(255) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cust_status` int(11) NOT NULL,
  `cust_block_status` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `cust_code_series` int(11) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=latin1;


INSERT INTO tbl_customer VALUES
("1","1","PARTH ENGINEERING CO.","1","CUS062020-1","3","","0","3","3","","8128380603","TIRTHPATEL@ERENGINEERING.IN","","2020-06-24 12:48:06","0","0","1","1","1"),
("2","1","UNITECH SYSTEMS","29","CUS062020-2","3","","1","6","7","","9825011605","unitechsystems96@gmail.com","","2020-06-27 12:18:07","0","0","29","1","4"),
("3","1","METRO LUBRICANT","29","CUS062020-5","3","","2","6","7","","9328558358","CHIRAGSHAH_665@YAHOO.COM","","2020-06-27 12:22:41","0","0","29","1","7"),
("4","1","KINGS FURNISHINGS &MATTRASES","29","CUS062020-8","3","","3","6","7","","8469968864","irfanking19121993@gmail.com","","2020-06-27 12:24:53","0","0","29","1","8"),
("5","1","SDDISWRIGARMAYNSH","29","CUS062020-9","3","","0","6","7","","7698299845","r.p.apransh@gmail.com","","2020-06-27 12:29:49","0","0","29","1","9"),
("6","1","JYOTI ENTERPRISE","29","CUS062020-10","3","","1","6","7","","9825048760","s.sindhav3161@gmail.com","","2020-06-27 12:31:22","0","0","29","1","10"),
("7","1","AARTI TOOLS & DIE","29","CUS062020-11","3","","1","6","7","","9426568933","vipulmistry79@yahoo.com","","2020-06-27 12:33:03","0","0","29","1","11"),
("8","1","ASTHA ENTERPRISE","29","CUS062020-12","3","","1","6","7","","9825830320","goswami.parth376@gmail.com","","2020-06-27 12:34:56","0","0","29","1","12"),
("9","1","SHIVAM TRADERS","29","CUS062020-13","3","","0","6","7","","9913986621","labana.vipin@gmail.com","","2020-06-27 12:36:28","0","0","29","1","14"),
("10","1","RIDDHISIDDHI INDUSTRIES","29","CUS062020-15","3","","1","6","7","","9824560692","jigneshindian140712@gmail.com","","2020-06-27 12:39:22","0","0","29","1","15"),
("11","1","LAXMI SPOCCKET INDUSTRIES","29","CUS062020-16","3","","1","6","7","","9925367183","laxmisprocet490@gmail.com","","2020-06-27 12:41:12","0","0","29","1","16"),
("12","1","DESHMUKH ELECTRONICS","29","CUS062020-17","3","","0","6","7","","9824434887","desamukh@gmail.com","","2020-06-27 12:43:25","0","0","29","1","17"),
("13","1","HEENA PLASTICK","29","CUS062020-18","3","","1","6","7","","9725353203","heenaplastic2017@gmail.com","","2020-06-27 12:45:00","0","0","29","1","18"),
("14","1","APEX ELECRICALS","28","CUS062020-19","3","","1","5","2","","9825074026","","28","2020-06-29 11:36:26","0","0","28","1","25"),
("15","1","KRISH ENGINEERING ","28","CUS062020-20","3","","1","5","2","","9426580877","hardik@karadanieng.com","27","2020-06-29 11:09:14","0","0","28","1","21"),
("16","1","NEELAM INDUSTRIES","28","CUS062020-22","3","","1","5","2","","9925153467","NEELAMPHARMAMECH@GMAIL.COM","28","2020-06-29 11:18:27","0","0","28","1","22"),
("17","1","GANGOTRI INORGANIC LTD","28","CUS062020-23","3","","1","0","2","","989823777","","28","2020-06-29 11:49:46","0","0","28","1","27"),
("18","1","KHUSH VEER PHARMA MACHINE","28","CUS062020-26","3","","1","5","2","","8141215533","","28","2020-06-29 11:48:50","0","0","28","1","26"),
("19","1","NAVDURGA ENGINEERING","28","CUS062020-28","3","","1","5","2","","9974374794","","28","2020-06-29 12:14:25","0","0","28","1","29"),
("20","0","B J  ENGINEERING","28","CUS062020-30","3","","1","5","2","","9925790990","","28","2020-06-29 12:17:05","0","0","28","1","30"),
("21","1","SWASTIK REFRIGENATION","28","CUS062020-31","3","","1","5","2","","9825492002","","28","2020-06-29 12:20:38","0","0","28","1","31"),
("22","1","SAHYOG ENGINEERING","28","CUS062020-32","3","","1","5","2","","9377092267","","","2020-06-29 13:24:23","0","0","28","1","35"),
("23","1","PARTH PUMP INDIA","28","CUS062020-34","3","","1","5","2","","9825026882","","28","2020-06-29 12:50:27","0","0","28","1","34"),
("24","0","Vishwa Machinery And Processing Private Limited","28","CUS062020-36","3","","1","5","2","","9824466847","","","2020-06-30 13:04:19","0","0","28","1","36"),
("25","1","AMI COOLING SYSTEM","28","CUS062020-37","3","","1","5","2","","9825256117","","","2020-06-30 13:09:03","0","0","28","1","37"),
("26","0","Shivam Engineering","28","CUS062020-38","3","","1","5","2","","9824267536","","","2020-06-30 13:14:23","0","0","28","1","38"),
("27","0","Shriraj Engineers & Consultants","28","CUS062020-39","3","","1","5","2","","9426641480","","","2020-06-30 13:21:02","0","0","28","1","39"),
("28","0","Krishna Plast","28","CUS062020-40","3","","1","5","2","","9979975714","","","2020-06-30 13:30:08","0","0","28","1","40"),
("29","0","Ketan Plast Industrus","28","CUS062020-41","3","","1","5","2","","9824214567","","","2020-06-30 13:35:47","0","0","28","1","41"),
("30","1","VISHAL INDUSTRIAL LINING","28","CUS062020-42","3","","1","5","2","","9825037015","","","2020-06-30 13:43:17","0","0","28","1","42"),
("31","1","KHODIYAR PLASTIC","28","CUS062020-43","3","","1","5","2","","9825023122","","","2020-06-30 14:04:03","0","0","28","1","43"),
("32","1","TECHRIDER TECHNOLOGIES","28","CUS062020-44","3","","1","5","2","","9898402210","","","2020-06-30 17:09:26","0","0","28","1","44"),
("33","1","HITECH ELECTRONICS","28","CUS062020-45","3","","1","5","2","","7041221107","","","2020-06-30 17:13:19","0","0","28","1","45"),
("34","1","PARFECT ROTOMOULD INDIA","28","CUS062020-46","3","","1","5","2","","9712795240","","","2020-06-30 17:18:39","0","0","28","1","46"),
("35","1","0CEN EXTENSION PVT LTD","28","CUS062020-47","3","","1","5","2","","9724861199","","","2020-06-30 17:28:01","0","0","28","1","47"),
("36","1","JAY ENGINEERING WORKS","28","CUS062020-48","3","","1","5","2","","94296123800","","","2020-06-30 17:39:26","0","0","28","1","48"),
("37","1","SURYA CONSTRUCTION ENGINEERING ","28","CUS062020-49","3","","1","5","2","","8128137047","","","2020-06-30 17:55:00","0","0","28","1","49"),
("38","1","INDOTECH ENGINEERING","28","CUS072020-50","3","","1","5","2","","8530177958","","","2020-07-01 10:41:50","0","0","28","1","50"),
("39","1","SHRI RAJ CORPORATION","29","CUS072020-50","3","","1","6","3","","9913799333","SALES@SHREERAJCORPORATION.COM","","2020-07-01 10:42:47","0","0","29","1","50"),
("40","1","WRS SAFE LIFTING WIRE ROPE SLING","28","CUS072020-51","3","","1","5","2","","9825519364","","","2020-07-01 10:44:00","0","0","28","1","51"),
("41","1","BHUMI ENGINERRING","28","CUS072020-52","3","","1","5","2","","9998405280","","","2020-07-01 10:47:54","0","0","28","1","52"),
("42","1","JIGNESH BHAI","29","CUS072020-52","3","","1","6","3","","8511119955","","","2020-07-01 10:50:55","0","0","29","1","52"),
("43","1","AMBICA BOILERS","28","CUS072020-53","3","","1","5","2","","9426486425","","","2020-07-01 11:00:51","0","0","28","1","53"),
("44","1","SHIV ENGINEERING","29","CUS072020-54","3","","1","6","3","","9879380179","","","2020-07-01 11:04:37","0","0","29","1","54"),
("45","1","VISHWACON ENGINEERS","29","CUS072020-55","3","","1","3","3","","9925452516","","","2020-07-01 12:11:28","0","0","29","1","55"),
("46","1","ASHOK BHAI","29","CUS072020-56","3","","1","6","3","","9825358024","","","2020-07-01 12:24:52","0","0","29","1","56"),
("47","1","SHIV SHAKTI INDUSTRIES","29","CUS072020-57","3","","1","6","7","","8140609972","","","2020-07-01 12:27:30","0","0","29","1","57"),
("48","1","PURA-SYS PHARMA","29","CUS072020-58","3","","1","6","3","","9227440199","","","2020-07-01 12:36:03","0","0","29","1","58"),
("49","1","SHIV ELECTRICAL","29","CUS072020-59","3","","1","6","3","","9727927485","","","2020-07-01 12:44:20","0","0","29","1","59"),
("50","1","ANNAPURNA ENTERPRISE","29","CUS072020-60","3","","1","6","7","","9377966596","","","2020-07-01 12:50:00","0","0","29","1","60"),
("51","1","PAL PRINCE","29","CUS072020-61","3","","1","6","7","","8733090616","PRINCEPAL2293@GMAIL.COM","","2020-07-01 12:53:22","0","0","29","1","61"),
("52","1","DEVYANI FASHION","29","CUS072020-62","3","","1","6","7","","7383801999","DEVYANIFASHION777@GMAIL.COM","","2020-07-01 12:57:03","0","0","29","1","62"),
("53","1","SAI CONSTRUCTION","29","CUS072020-63","3","","0","6","7","","9913248722","SAICONSTRUCTION722@YAHOO.IN","","2020-07-01 13:02:07","0","0","29","1","63"),
("54","1","HEAT MAX ENGINEERING","28","CUS072020-64","3","\\R\\N\\R\\N\\R\\N\\R\\N","1","5","2","","9824052714","","","2020-07-01 14:01:17","0","0","28","1","64"),
("55","1","SHREEUMIYA BOOKSTORES","29","CUS072020-65","3","","0","6","7","","9429388162","SHREEUMIYABOOKSTORE@GMAIL.COM","","2020-07-01 14:15:26","0","0","29","1","65"),
("56","1","DYNAMIC INDUSTRIES.","28","CUS072020-65","3","","1","5","2","","9879586560","","","2020-07-01 14:16:47","0","0","28","1","65"),
("57","1","LYON REMEDIES PRIVATE LIMITED","29","CUS072020-66","3","","2","6","7","","7016652297","SANJAYTANK618@GMAIL.COM","","2020-07-01 14:18:15","0","0","29","1","66"),
("58","1","KRISHNA TECHNOLOGY","29","CUS072020-67","3","","0","6","7","","9727722687","TJVAGHELA@GMAIL.COM","","2020-07-01 14:20:25","0","0","29","1","67"),
("59","1","ARPIT NISARTA","29","CUS072020-68","3","","0","6","7","","9978031902","ARPITNISARTA@GMAIL.COM","","2020-07-01 14:25:33","0","0","29","1","68"),
("60","1","APAR INDUSTRIES","29","CUS072020-69","3","","1","6","7","","9979872602","SATISH.X.602@GMAIL.COM","","2020-07-01 14:29:14","0","0","29","1","69"),
("61","1","GANPATSINGH RAJPUT","29","CUS072020-70","3","","0","6","7","","9428737478","GANPATSINGHSURANA@GMAIL.COM","","2020-07-01 14:33:48","0","0","29","1","70"),
("62","1","ALFA ENTECH GUJ. PVT. LTD.","28","CUS072020-66","3","","1","5","2","","9426074733","","","2020-07-01 14:35:50","0","0","28","1","71"),
("63","1","FIROZ SELECTION","29","CUS072020-71","3","","0","6","7","","","","","2020-07-01 14:36:05","0","0","29","1","71"),
("64","1","PATEL RUBBERS","28","CUS072020-72","3","","1","6","7","","9558506005","patelrubber6005@gmail.com","","2020-07-01 14:49:09","0","0","28","1","73"),
("65","1","S P M TOOLS","28","CUS072020-72","3","","1","5","2","","9712991746","","","2020-07-01 14:45:32","0","0","28","1","72"),
("66","1","PARTH ELECTRONIC","29","CUS072020-73","3","","4","6","7","","9824813698","PARTHELECTRONIC1997@YAHOO.CO.IN","","2020-07-01 14:49:02","0","0","29","1","73"),
("67","1","INDO SPORTS","29","CUS072020-74","3","","0","6","7","","9714592363","INDOSPORTS091@GMAJL.COM","","2020-07-01 14:51:18","0","0","29","1","74"),
("68","1","KUNDAN MOULD PLAST","28","CUS072020-74","3","","1","5","2","","9898715137","","","2020-07-01 14:51:56","0","0","28","1","74"),
("69","1","HARSHIDA INDUSTRIES","28","CUS072020-75","3","","1","5","2","","9712135772","","","2020-07-01 14:53:25","0","0","28","1","75"),
("70","1","LALIT SHAH","29","CUS072020-75","3","","0","6","7","","9427515220","LALITSHAH1973@GMAIL.COM","","2020-07-01 14:53:41","0","0","29","1","75"),
("71","1","KAVYMEDICAL AGENCY","29","CUS072020-76","3","","0","6","7","","7777977626","THAKKARJIGAR15@GMAIL.COM","","2020-07-01 14:56:20","0","0","29","1","76"),
("72","1","ANGEL BRANDING","29","CUS072020-77","3","","0","6","7","","9173813197","ANGELBRANDING3112@GMAIL.COM","","2020-07-01 14:59:07","0","0","29","1","77"),
("73","1","ELECTRONIC SALES AND SERVICES","29","CUS072020-78","3","","4","6","7","","7046791402","ANTALA929@GMAIL.COM","","2020-07-01 15:01:21","0","0","29","1","78"),
("74","1","HITEN PATEL","29","CUS072020-79","3","","0","6","7","","9824182111","HITEN.NIHAR@GMAIL.COM","","2020-07-01 15:03:59","0","0","29","1","79"),
("75","1","YASH AGRI MART","29","CUS072020-80","3","","0","6","7","","9265255119","PATELBRIJESHBHOGIBHAI@GMAIL.COM","","2020-07-01 15:06:14","0","0","29","1","80"),
("76","1","GIRIVAR INDUSTRIES ","28","CUS072020-76","3","","1","5","2","","9909431062","","","2020-07-01 15:09:42","0","0","28","1","76"),
("77","1","AERO THERM SYSTEM PVT. LTD.","28","CUS072020-81","3","","1","5","2","","9824408720","","","2020-07-01 15:37:42","0","0","28","1","81"),
("78","1","PANCHAL ENGINEERING","28","CUS072020-82","3","","0","5","2","","9879050522","","","2020-07-01 15:53:50","0","0","28","1","82"),
("79","1","RAJ ENGINEERING WORKS","28","CUS072020-83","3","","1","5","2","","9924225214","","","2020-07-01 15:59:19","0","0","28","1","85"),
("80","1","Shree Radhey Engineering","28","CUS072020-84","0","","1","5","2","","9825164616","","","2020-07-01 15:58:38","0","0","28","1","84"),
("81","0","Ganesh Engineering ","28","CUS072020-86","0","","1","5","2","","9998686517","","","2020-07-01 16:03:13","0","0","28","1","86"),
("82","1","SHUBHAM ENGINEERING","28","CUS072020-87","3","","1","5","2","","9033711916","","","2020-07-01 16:12:53","0","0","28","1","88"),
("83","1","ADON CHEMICAL","28","CUS072020-89","3","","1","5","2","","9016533378","","","2020-07-01 16:16:22","0","0","28","1","89"),
("84","1","KRISHNA ENTERPRISE","28","CUS072020-90","3","","1","5","2","","9925099610","","","2020-07-01 16:23:31","0","0","28","1","90"),
("85","1","METRI PLAST","28","CUS072020-91","3","","1","5","2","","9879472362","","","2020-07-01 16:36:46","0","0","28","1","91"),
("86","1","SHREE RADHEY ENGINEERING","28","CUS072020-92","3","","1","5","2","","9825164616","","","2020-07-01 16:42:22","0","0","28","1","92"),
("87","1","SUMITEK NATRAJ MACHINE","28","CUS072020-93","3","","1","5","2","","","","","2020-07-14 17:26:24","0","0","28","1","583"),
("88","0","Shree Shakti Dham Engneering","28","CUS072020-94","3","","1","5","2","","9825295722","","","2020-07-01 16:51:04","0","0","28","1","94"),
("89","1","GAJJAR TOOL ROOM","28","CUS072020-95","3","","1","5","2","","9825007697","","","2020-07-01 16:53:48","0","0","28","1","95"),
("90","1","HINDUSTAN MACHINES ","28","CUS072020-96","3","","1","5","2","","","","","2020-07-14 17:20:54","0","0","28","1","582"),
("91","1","HARSHIDA INDUSTRIES","28","CUS072020-97","3","","1","5","2","","9712135772","","","2020-07-01 17:28:43","0","0","28","1","97"),
("92","1","MACONS EQUIPMENTS PVT LTD","28","CUS072020-98","3","","1","5","2","","9909003759","","","2020-07-01 17:38:25","0","0","28","1","98"),
("93","1","GAYATRI RUB TECH","28","CUS072020-99","3","","1","5","2","","9824038676","","","2020-07-01 17:46:17","0","0","28","1","99"),
("94","1","ROYAL STEEL INDIA","27","CUS072020-100","3","","1","3","2","","9925599323","ROYALSTEELINDIA@YMAIL.COM","","2020-07-02 01:13:12","0","0","27","1","100"),
("95","1","JATIN RADHANI","29","CUS072020-101","3","","0","6","0","","","","","2020-07-02 16:16:07","0","0","29","1","101"),
("96","1","JOGRAJ RAJPUROHIT","29","CUS072020-102","3","","0","6","0","","","","","2020-07-02 16:17:48","0","0","29","1","102"),
("97","1","SHEIKH FARUK","29","CUS072020-103","3","","0","6","0","","","","","2020-07-02 16:21:55","0","0","29","1","103"),
("98","1","MURLI CREATION","29","CUS072020-104","3","","0","6","0","","","","","2020-07-02 16:24:09","0","0","29","1","104"),
("99","1","NAVABI CREATION","29","CUS072020-105","3","","0","6","0","","","","","2020-07-02 16:25:51","0","0","29","1","105"),
("100","1","KEYUR PATEL","29","CUS072020-106","3","","0","6","0","","","","","2020-07-02 16:27:14","0","0","29","1","106");
INSERT INTO tbl_customer VALUES
("101","1","DOGMA INDUSTRIES","29","CUS072020-107","3","","1","6","0","","","","","2020-07-02 16:30:51","0","0","29","1","107"),
("102","1","MANISH PARMAR","29","CUS072020-108","3","","3","6","0","","","","","2020-07-02 16:32:55","0","0","29","1","108"),
("103","1","SHREEJI FABRICTION","29","CUS072020-109","3","","1","6","0","","","","","2020-07-02 16:36:19","0","0","29","1","109"),
("104","1","SHOAIB VEPARI","29","CUS072020-110","3","","1","6","0","","","","","2020-07-02 16:49:38","0","0","29","1","110"),
("105","1","APEX INTERNATIONAL","29","CUS072020-111","3","","1","6","0","","","","","2020-07-02 16:50:47","0","0","29","1","111"),
("106","1","SHIVAM WATER TREATERS","29","CUS072020-112","3","","0","6","0","","","","","2020-07-02 16:53:03","0","0","29","1","112"),
("107","1","JETHVA SANJAY","29","CUS072020-113","3","","0","6","0","","","","","2020-07-02 17:00:06","0","0","29","1","113"),
("108","1","RAVINDRA AGRAWAL","29","CUS072020-114","3","","0","6","0","","","","","2020-07-02 17:03:03","0","0","29","1","114"),
("109","1","ZYMECH PHARMA","29","CUS072020-115","3","","1","6","0","","","","","2020-07-02 17:04:20","0","0","29","1","115"),
("110","1","NAKSHTRA ENTERPRISE","29","CUS072020-116","3","","0","6","0","","","","","2020-07-02 17:05:52","0","0","29","1","116"),
("111","1","SHIVA ENTERPRISE","29","CUS072020-117","3","","0","6","0","","","","","2020-07-02 17:07:19","0","0","29","1","117"),
("112","1","AMAR FASHION","29","CUS072020-118","3","","0","6","0","","","","","2020-07-02 17:08:39","0","0","29","1","118"),
("113","1","SACHIN TEXTILE INDUSTRIES","29","CUS072020-119","3","","0","6","0","","","","","2020-07-02 17:16:18","0","0","29","1","119"),
("114","1","MAHAKALI ENTERPRISE","29","CUS072020-120","3","","1","6","0","","","","","2020-07-02 17:48:20","0","0","29","1","120"),
("115","1","JAY MATAJI ENTERPRISE","29","CUS072020-121","3","","0","6","0","","","","","2020-07-02 17:50:57","0","0","29","1","121"),
("116","1","RATNAMANI METALE & TUBES LTD","29","CUS072020-122","3","","1","6","0","","","","","2020-07-02 17:52:59","0","0","29","1","122"),
("117","1","QAWI ENTERPRISE","29","CUS072020-123","3","","0","6","0","","","","","2020-07-02 17:57:59","0","0","29","1","123"),
("118","1","SHREE GWALINATH","29","CUS072020-124","3","","0","6","0","","","","","2020-07-02 18:01:38","0","0","29","1","124"),
("119","1","ALPHA DYES AND CHEMICALS","29","CUS072020-125","3","","2","6","0","","","","","2020-07-02 18:03:02","0","0","29","1","125"),
("120","1","CHENNAI ELECTRICALS","29","CUS072020-126","3","","4","6","0","","","","","2020-07-02 18:05:14","0","0","29","1","126"),
("121","1","CHEHAR BHAVNI TRADING","29","CUS072020-127","3","","0","6","0","","","","","2020-07-02 18:06:55","0","0","29","1","127"),
("122","1","WAVES ENGINEERING","29","CUS072020-128","3","","1","6","0","","","","","2020-07-02 18:08:28","0","0","29","1","128"),
("123","1","RUDRA ENTERPRISE","29","CUS072020-129","3","","0","6","0","","","","","2020-07-02 18:10:01","0","0","29","1","129"),
("124","1","KARMAYOG ELECTRICALS","29","CUS072020-130","3","","4","6","0","","","","","2020-07-02 18:13:37","0","0","29","1","130"),
("125","1","GUJARAT STEEL","29","CUS072020-131","3","","1","6","0","","","","","2020-07-02 18:17:00","0","0","29","1","131"),
("126","1","VEER ENTERPRISE","29","CUS072020-132","3","","0","6","0","","","","","2020-07-02 18:22:21","0","0","29","1","132"),
("127","1","PURVI PLASTIC","29","CUS072020-133","3","","1","6","0","","","","","2020-07-02 18:23:43","0","0","29","1","133"),
("128","1","RAMDEV FURNITURE","29","CUS072020-134","3","","3","6","0","","","","","2020-07-02 18:25:12","0","0","29","1","134"),
("129","0","Aluminium Fabrication and Glass Work","29","CUS072020-135","3","","1","6","0","","","","","2020-07-02 18:26:24","0","0","29","1","135"),
("130","1","JIGER TEXTILE","29","CUS072020-136","3","","1","6","0","","","","","2020-07-02 18:29:18","0","0","29","1","136"),
("131","1","KIRAN CHEMICALS","29","CUS072020-137","3","","2","6","0","","","","","2020-07-02 18:31:22","0","0","29","1","137"),
("132","1","SURESHBHAI CHAUHAN","29","CUS072020-138","3","","0","6","0","","","","","2020-07-02 18:33:27","0","0","29","1","138"),
("133","1","ASHA TRADERS","29","CUS072020-139","3","","1","6","0","","","","","2020-07-02 18:34:52","0","0","29","1","139"),
("134","1","SHAKTI ENTERPRISE","29","CUS072020-140","3","","1","6","0","","","","","2020-07-02 18:36:32","0","0","29","1","140"),
("135","1","MAHADEV ENTERPRISE","29","CUS072020-141","3","","1","6","0","","","","","2020-07-02 18:37:45","0","0","29","1","141"),
("136","1","MATRU KRUPA ENTERPRICE","29","CUS072020-142","3","","0","6","0","","","","","2020-07-03 10:32:26","0","0","29","1","142"),
("137","1","SHREE HARI AUTO PARTS","29","CUS072020-143","3","","0","6","0","","","","","2020-07-03 10:41:54","0","0","29","1","143"),
("138","1","SHIVAM PLASATIK","29","CUS072020-144","3","","1","6","0","","","","","2020-07-03 10:50:53","0","0","29","1","144"),
("139","1","GAYATRI STEEL ","28","CUS072020-145","3","","1","6","0","","919898122922","renuhpatel@yahoo.com","","2020-07-03 10:55:57","0","0","28","1","146"),
("140","1","RAJDEEP PLATIC BAUG","28","CUS072020-145","3","","1","5","2","","9727064740","","","2020-07-03 10:54:25","0","0","28","1","145"),
("141","1","ARMAN IRONING","29","CUS072020-146","3","","1","6","0","","917041510145","","","2020-07-03 10:56:26","0","0","29","1","146"),
("142","0","Nilkanth Industries","28","CUS072020-147","3","","1","5","2","","9924143553","","","2020-07-03 10:57:46","0","0","28","1","147"),
("143","1","VIRKRUPA ENGINERS","28","CUS072020-148","3","","1","5","2","","9152110240","","","2020-07-03 11:03:19","0","0","28","1","148"),
("144","1","MG PLAST VATVA","29","CUS072020-148","3","","1","6","0","","919737668337","PATELMAHESH2977@GMAIL.COM","","2020-07-03 11:07:38","0","0","29","1","148"),
("145","1","COIMBOSS ENGINEERS","28","CUS072020-149","3","","0","5","2","","9898065093","","","2020-07-03 11:08:15","0","0","28","1","149"),
("146","1","YOGI ENTERPRISE","29","CUS072020-150","3","","0","6","0","","9724344899","DILIPGAJJAR@OUTLOOK.COM","","2020-07-03 11:11:23","0","0","29","1","150"),
("147","1","GEMA COATS ","28","CUS072020-151","3","","0","0","0","","9824085852","","","2020-07-03 11:19:16","0","0","28","1","151"),
("148","1","PARRAM ENTERPRISE","29","CUS072020-151","3","","0","6","0","","919601112544","V.PARMAR9942@GMAIL.COM","","2020-07-03 11:20:06","0","0","29","1","151"),
("149","1","GODAVARI PIPES PVT LTD ","28","CUS072020-152","3","","0","0","0","","9825305354","","","2020-07-03 11:20:17","0","0","28","1","152"),
("150","1","SWASTIK ENGINEERING WORKS","28","CUS072020-153","3","","0","0","0","","9376132392","","","2020-07-03 11:21:08","0","0","28","1","153"),
("151","0","GOLD COIN PLASTIC (INDIA)","28","CUS072020-154","0","","0","0","0","","9825272684","","","2020-07-03 11:22:26","0","0","28","1","154"),
("152","1","PERFECT ENGINEERING WORK","29","CUS072020-154","3","","1","6","0","","918401688568","ASHVINMAKWANA6@GMAIL.COM","","2020-07-03 11:22:55","0","0","29","1","154"),
("153","1","UMA Press Tools","28","CUS072020-155","0","","0","0","0","","9825558622","","","2020-07-03 11:24:02","0","0","28","1","155"),
("154","1","Ratan Metals","28","CUS072020-156","0","","0","0","0","","9426544113","","","2020-07-03 11:28:11","0","0","28","1","156"),
("155","1","Shree Harsiddhi Engineers","28","CUS072020-157","0","","0","0","0","","9898898676","","","2020-07-03 11:29:44","0","0","28","1","157"),
("156","1","V.B.SONS","29","CUS072020-155","3","","0","6","0","","919974203232","NAVNEETPATEL416@GMAIL.COM","","2020-07-03 11:30:05","0","0","29","1","155"),
("157","1","BHAGYESH ENGINEERING WORKS","28","CUS072020-158","3","","1","5","2","","9426356520","","","2020-07-03 11:31:02","0","0","28","1","158"),
("158","1","PARAS TIMBER","29","CUS072020-159","3","","0","6","0","","919879772299","PARASTIMBER2017@GMAIL.COM","","2020-07-03 11:32:31","0","0","29","1","159"),
("159","1","A PATEL ENGINEERS","28","CUS072020-159","3","","1","5","2","","9825457711","","","2020-07-03 11:32:51","0","0","28","1","159"),
("160","1","Keshav Metal Products","28","CUS072020-160","0","","0","0","0","","9825022407","","","2020-07-03 11:38:26","0","0","28","1","162"),
("161","1","Real  Air Comppressor","28","CUS072020-161","0","","0","0","0","","9726324788","inqury.real@gmail.com","","2020-07-03 11:38:39","0","0","28","1","163"),
("162","1","NEWTECH TECHNOLOGIES","28","CUS072020-164","0","","0","0","0","","9824543012","","","2020-07-03 11:40:18","0","0","28","1","164"),
("163","1","SAM AIR","28","CUS072020-165","0","","0","0","0","","9824269893","","","2020-07-03 11:42:46","0","0","28","1","165"),
("164","1","JALARAM ELECTRICALS","28","CUS072020-166","3","","4","5","2","","9824411460","","","2020-07-03 11:43:41","0","0","28","1","166"),
("165","1","INDO ASIA ENTERPRISE","28","CUS072020-167","3","","1","5","2","","9426768598","","","2020-07-03 11:45:25","0","0","28","1","168"),
("166","1","RELAX PLASTOPACK PVT. LTD.","28","CUS072020-169","0","","0","0","0","","9427547424","","","2020-07-03 11:46:19","0","0","28","1","169"),
("167","1","SHREE GANESH PLASTIC","28","CUS072020-170","3","","1","5","2","","9327069517","","","2020-07-03 11:53:29","0","0","28","1","170"),
("168","1","SAMRAT ENTERPRISE","29","CUS072020-170","3","","0","6","0","","919426700877","SAMRATENTERPRISE23@GMAIL.COM","","2020-07-03 11:54:16","0","0","29","1","170"),
("169","1","STAR GLASS HOUSE","28","CUS072020-171","3","","0","0","0","","9327059152","","","2020-07-03 11:54:49","0","0","28","1","171"),
("170","1","NIHAAL INDUSTRIES","28","CUS072020-172","0","","0","0","0","","9925233777","","","2020-07-03 12:00:27","0","0","28","1","172"),
("171","1","UNIQUEACT & CO.","29","CUS072020-172","3","","0","6","0","","919904120965","UNIQUEACTANDCO@GMAIL.COM","","2020-07-03 12:01:31","0","0","29","1","172"),
("172","1","BABUBHAI CHEMICALS","28","CUS072020-173","0","","2","5","2","","9898617659","","","2020-07-03 12:02:25","0","0","28","1","174"),
("173","1","PRICE ICE FACTORY","28","CUS072020-175","0","","0","0","0","","9825060785","","","2020-07-03 12:03:16","0","0","28","1","175"),
("174","1","LEO ICE FACTORY","28","CUS072020-176","0","","0","0","0","","9228105007","","","2020-07-03 12:03:54","0","0","28","1","176"),
("175","1","SAHJANAND VISION","29","CUS072020-177","3","","0","6","0","","918140028140","KIRTU2229@GMAIL.COM","","2020-07-03 12:13:43","0","0","29","1","177"),
("176","1","GURUKRUPA MOULDING WORK","28","CUS072020-178","3","","0","0","0","","9824686206","","","2020-07-03 12:17:34","0","0","28","1","179"),
("177","1","BIKMES FOOTER","29","CUS072020-179","3","","0","6","0","","919624479551","BABUMAKWANA1579@GMAIL.COM","","2020-07-03 12:17:39","0","0","29","1","179"),
("178","1","KHYATI CHEMICALS PVT. LTD.","28","CUS072020-180","3","","2","5","2","","9825294217","","","2020-07-03 12:18:44","0","0","28","1","180"),
("179","1","HARSH ENTERPRISE","29","CUS072020-181","3","","0","6","0","","919428606712","VAGHASIYAMUKESH93@GMAIL.COM","","2020-07-03 12:19:36","0","0","29","1","181"),
("180","1","Dishman Pharmaceuticals And Chemicals Ltd ","28","CUS072020-182","0","","0","0","0","","7567898035","","","2020-07-03 12:21:44","0","0","28","1","183"),
("181","1","Remedy Labs","28","CUS072020-184","0","","0","0","0","","9375060087","","","2020-07-03 12:23:02","0","0","28","1","184"),
("182","1","A K Dye Chem ","28","CUS072020-185","0","","0","0","0","","9898087849","","","2020-07-03 12:25:02","0","0","28","1","186"),
("183","1","ADACHI NATURAL POLYMER PVT LTD ","28","CUS072020-187","3","","1","5","2","","9825006759","","","2020-07-03 12:53:30","0","0","28","1","200"),
("184","1","LANDMARK INDUSTRY ","28","CUS072020-188","3","","1","5","2","","9909431177","","","2020-07-03 12:40:39","0","0","28","1","188"),
("185","1","JP CHEM TECH ","28","CUS072020-189","3","","2","5","2","","9998967207","","","2020-07-03 12:43:15","0","0","28","1","189"),
("186","1","ChemicalsScholl Dyes &","28","CUS072020-190","0","","0","0","0","","9998136744","","","2020-07-03 12:43:50","0","0","28","1","190"),
("187","1","9998136744","28","CUS072020-191","0","","0","0","0","","99824414972","","","2020-07-03 12:44:15","0","0","28","1","191"),
("188","1","99824414972","28","CUS072020-192","0","","0","0","0","","9428105180","","","2020-07-03 12:44:43","0","0","28","1","192"),
("189","1","ALANKAR BOILERS AND PRESSURE VESSELS PVT LTD ","28","CUS072020-193","3","","1","5","2","","9427083165","","","2020-07-03 12:52:24","0","0","28","1","197"),
("190","1","Ambica Engineering Works","28","CUS072020-194","0","","0","0","0","","9924141002","","","2020-07-03 12:53:18","0","0","28","1","199"),
("191","1","AMIT ENGINEERING WORKS","28","CUS072020-195","3","","1","5","2","","9426077491","","","2020-07-03 12:52:46","0","0","28","1","198"),
("192","1","Whirler Centrifugals Pvt Ltd ","28","CUS072020-196","0","","0","0","0","","9033039304","","","2020-07-03 12:51:54","0","0","28","1","196"),
("193","1","PERFECT STEEL ENGINEERS & FABRICATORS ","28","CUS072020-201","3","","1","5","2","","9824053738","","","2020-07-03 14:10:40","0","0","28","1","201"),
("194","1","SHRIRANG JADHAV","32","CUS072020-202","3","","0","6","0","","919423817200","SHRIRANGJADHAV1987@GMAIL.COM","","2020-07-03 15:32:32","0","0","32","1","202"),
("195","1","KESHAV PANDIT","32","CUS072020-203","3","","0","6","0","","918278731091","KESHAVPANDIT1985@GMAIL.COM","","2020-07-03 15:39:31","0","0","32","1","203"),
("196","1","SAMRAT SPORTS CO.","32","CUS072020-204","3","","0","6","0","","919359111213","CRICKETSAMRAT@GMAIL.COM","","2020-07-03 15:46:12","0","0","32","1","204"),
("197","1","ANAND KUMAR","32","CUS072020-205","3","","0","6","0","","919415346711","LAXMIAUTOITL@GMAIL.COM","","2020-07-03 15:56:29","0","0","32","1","205"),
("198","1","RAJKUMAR JANGID","32","CUS072020-206","3","","0","6","0","","8446781648","JANGIDGLASS1@GMAIL.COM","","2020-07-03 15:59:55","0","0","32","1","206"),
("199","1","MUSKAN PRINTER","32","CUS072020-207","3","","0","6","0","","9462141786","RDBUILDER786@GMAIL.COM","","2020-07-03 16:04:58","0","0","32","1","207"),
("200","1","RAKESH KUMAR","32","CUS072020-208","3","","0","6","0","","919431404582","BIHARRADIOHOUSE1@GMAIL.COM","","2020-07-03 16:08:56","0","0","32","1","208");
INSERT INTO tbl_customer VALUES
("201","1","LOKESH SHARMA","32","CUS072020-209","3","","0","6","0","","9368921558","MUDGALHIGHTECHMARKET@GMAIL.COM","","2020-07-03 16:12:54","0","0","32","1","209"),
("202","1"," AJAY CABLES","32","CUS072020-210","3","","0","6","0","","919942222500","JAYAVEEL@YAHOO.CO.IN","","2020-07-03 16:18:23","0","0","32","1","210"),
("203","1","KVM FLOORING SOLUTIONS","32","CUS072020-211","3","","0","6","0","","919526800263","SMSHAIJU2@GMAIL.COM","","2020-07-03 16:22:10","0","0","32","1","211"),
("204","1","VARSHINI DEPARTMENTAL STORES","32","CUS072020-212","3","","0","6","0","","9611235870","LINGARAJDR@HOTMAIL.COM","","2020-07-03 16:25:35","0","0","32","1","212"),
("205","1","AJAY SHARMA","32","CUS072020-213","3","","0","6","0","","7549235748","AJAYGTK49@GMAIL.COM","","2020-07-03 16:29:14","0","0","32","1","213"),
("206","1","ACCEL FRONTLINE","32","CUS072020-214","3","","0","6","0","","8884993864","BRAVINCHANDER@YAHOO.COM","","2020-07-03 16:38:10","0","0","32","1","214"),
("207","1","NEWMADEENA HYPER","32","CUS072020-215","3","","0","6","0","","918075133109","ABIDKP4U@GMAIL.COM","","2020-07-03 16:41:17","0","0","32","1","215"),
("208","1","BASIL\\\'S PHARMACEUTICALS","32","CUS072020-216","3","","0","6","0","","7727048280","ANURAGMEHRISHI@GMAIL.COM","","2020-07-03 16:43:34","0","0","32","1","216"),
("209","1","VAISHALI MATCHING","32","CUS072020-217","3","","0","6","0","","9921631551","JITTURARE@GMAIL.COM","","2020-07-03 16:46:04","0","0","32","1","217"),
("210","1","RAJESH PATIL","32","CUS072020-218","3","","0","6","0","","9964609882","BRP.WATER7@GMAIL.COM","","2020-07-03 16:48:36","0","0","32","1","218"),
("211","1","ATLAS ENGINEERS","32","CUS072020-219","3","","0","6","0","","9353186235","ATLASPIPING@GMAIL.COM","","2020-07-03 16:50:30","0","0","32","1","219"),
("212","1","OM TRADE LINK","32","CUS072020-220","3","","0","6","0","","9420954508","PRASHANT100002002@YAHOO.CO.IN","","2020-07-03 16:53:01","0","0","32","1","220"),
("213","1","SUPREMEME ENTERPRISE BIDAR","32","CUS072020-221","3","","0","6","0","","9510368802","LADDERAMESH2@GMAIL.COM","","2020-07-03 16:54:38","0","0","32","1","221"),
("214","1","MADANE DISTRIBUTORS","32","CUS072020-222","3","","0","6","0","","9421090516","MADANE011@REDIFFMAIL.COM","","2020-07-03 16:57:56","0","0","32","1","222"),
("215","1","PRASHANT AHER","32","CUS072020-223","3","","0","6","0","","9881001696","","","2020-07-03 17:00:00","0","0","32","1","223"),
("216","1","RAJESH YADAV","32","CUS072020-224","3","","0","6","0","","918090455410","JYOTICOMPUTERSRAUZAGZP@GMAIL.COM","","2020-07-03 17:02:10","0","0","32","1","224"),
("217","1","ANITA AGENCIES","32","CUS072020-225","3","","0","6","0","","9370644556","ANITA_AGENCIES@REDIFFMAIL.COM","","2020-07-03 17:04:47","0","0","32","1","225"),
("218","1","JAYPRAKASH VISHWAKARMA","32","CUS072020-226","3","","0","6","0","","9049335599","JAYPRAKASHBV@REDIFFMAIL.COM","","2020-07-03 17:07:02","0","0","32","1","226"),
("219","1","WAPCOS","32","CUS072020-227","3","","0","6","0","","8303314441","","","2020-07-03 17:09:24","0","0","32","1","227"),
("220","1","WEB TECHNOLOGIC","32","CUS072020-228","3","","0","6","0","","7599097888","SHOBHIT.GUPTA1@GMAIL.COM","","2020-07-03 17:11:41","0","0","32","1","228"),
("221","1","WIPRO","32","CUS072020-229","3","","0","6","0","","9845475525","AJITH@HOTMAIL.COM","","2020-07-03 17:13:45","0","0","32","1","229"),
("222","1","SAMSUNG","32","CUS072020-230","3","","0","6","0","","8970161845","ANUSHREE@GMAIL.COM","","2020-07-03 17:15:34","0","0","32","1","230"),
("223","1","DREAMS HOME INTERIOR","32","CUS072020-231","3","","0","6","0","","880894128","DEVRUSSIA@REDIFFMAIL.COM","","2020-07-03 17:18:43","0","0","32","1","231"),
("224","1","J.B. ENTERPRISE","32","CUS072020-232","3","","0","6","0","","9401217145","MOONBORUAH149@GMAIL.COM","","2020-07-03 17:20:34","0","0","32","1","232"),
("225","1","SOMESHWAR COMMUNICATION","32","CUS072020-233","3","","0","6","0","","9420301516","VISHWAJIT.1516@GMAIL.COM","","2020-07-03 17:22:53","0","0","32","1","233"),
("226","1","MADHU BANANA WHOLE SALE MARCHANT","32","CUS072020-234","3","","0","6","0","","8050020033","MADHU.NARAYANAPPA@EMAIL.COM","","2020-07-03 17:24:29","0","0","32","1","234"),
("227","1","PRASANNA S SHIVA S","32","CUS072020-235","3","","0","6","0","","8722211364","PRASANNA30SHADLY@GMAIL.COM","","2020-07-03 17:26:59","0","0","32","1","235"),
("228","1","ARYA BANDHU AYURVED BHAWAN","32","CUS072020-236","3","","0","6","0","","9675861102","RAJEEVGARG278@GMAIL.COM","","2020-07-03 17:28:56","0","0","32","1","236"),
("229","1","VISHAL RASTOGI","32","CUS072020-237","3","","0","6","0","","9837604491","VISHALEXIDE111@GMAIL.COM","","2020-07-03 17:31:01","0","0","32","1","237"),
("230","1"," HARSH MARBLES","32","CUS072020-238","3","","0","6","0","","7905262720","RACE.HARSH@GMAIL.COM","","2020-07-03 17:33:09","0","0","32","1","238"),
("231","1","KRGASSOCIATES","32","CUS072020-239","3","","0","6","0","","9358189971","KRISAHARAN@GMAIL.COM","","2020-07-03 17:38:40","0","0","32","1","239"),
("232","1","ULHAS PATIL","32","CUS072020-240","3","","0","6","0","","9764251845","FAUJIVISHESH@GMAIL.COM","","2020-07-03 17:40:38","0","0","32","1","240"),
("233","1","SUNIL AGARWALLA","32","CUS072020-241","3","","0","6","0","","9864793300","SUNILAGARWALLA204@GMAIL.COM","","2020-07-03 17:43:30","0","0","32","1","241"),
("234","1","AMIT","32","CUS072020-242","3","","0","6","0","","8793996666","SKYCAMAUTOMATION@GMAIL.COM","","2020-07-03 17:45:43","0","0","32","1","242"),
("235","1","ADVERTISEMENT COLLECTION AGENCY","32","CUS072020-243","3","","0","6","0","","9837348025","MCIDONLINE@YAHOO.COM","","2020-07-03 17:48:29","0","0","32","1","243"),
("236","1","CHING\\\'S SECRETCHI","32","CUS072020-244","3","","0","6","0","","9097306512","KR_SNEH@REDIFFMAIL.COM","","2020-07-03 17:53:35","0","0","32","1","244"),
("237","1","SHIV JEWELLERS","32","CUS072020-245","3","","0","6","0","","9760014384","HAPPYV257@GMAIL.COM","","2020-07-03 17:55:57","0","0","32","1","245"),
("238","1","SALEH AHMED LASKAR","32","CUS072020-246","3","","0","6","0","","9365409730","SALEHLASKAR@GMAIL.COM","","2020-07-03 17:58:46","0","0","32","1","246"),
("239","1","LAW STUDENTS AND LAWYERS","32","CUS072020-247","3","","0","6","0","","9927816995","SATYENDRAKUMARSS7312@GMAIL.CO","","2020-07-03 18:01:01","0","0","32","1","247"),
("240","1","HIMANSHU JAISWAL","32","CUS072020-248","3","","0","6","0","","9335688652","HIMANSU_MOBILECARE@YAHOO.COM","","2020-07-03 18:04:11","0","0","32","1","248"),
("241","1","ESEM ENGINEERS ","28","CUS072020-249","0","","1","5","2","","9427805453","","","2020-07-04 11:17:25","0","0","28","1","249"),
("242","1","FEBRROS AUTOCOMP PVT LTD ","28","CUS072020-250","3","","0","0","0","","9925055311","","","2020-07-04 12:08:40","0","0","28","1","250"),
("243","1","FERRO MACHINERY MFRS PVT LTD ","28","CUS072020-251","3","","1","5","2","","9909998504","","","2020-07-04 12:10:33","0","0","28","1","252"),
("244","1","GOPINATH ENTERPRISE ","28","CUS072020-253","3","","1","5","2","","9099973994","","","2020-07-04 12:11:50","0","0","28","1","254"),
("245","1","FLAMINGO MOULD PLASTICS PVT LTD ","28","CUS072020-255","0","","1","5","2","","9426909999","","","2020-07-04 12:12:32","0","0","28","1","255"),
("246","1","LONEX ENGINEERS","28","CUS072020-256","0","","0","0","0","","9327140258","","","2020-07-04 12:13:11","0","0","28","1","256"),
("247","1","COREL PHARMA CHEMICAL","28","CUS072020-257","3","","2","5","2","","9375031692","","","2020-07-04 12:14:12","0","0","28","1","258"),
("248","1","GUJARAT PACKAGING INDUSTRIES ","28","CUS072020-259","3","","1","5","2","","9512300512","","","2020-07-04 12:14:48","0","0","28","1","259"),
("249","1","FUSION TECHNOPLAST PVT LTD ","28","CUS072020-260","3","","1","5","2","","9824255809","","","2020-07-04 12:15:37","0","0","28","1","260"),
("250","1","GOODLUCK POLY FABRICS ","28","CUS072020-261","0","","1","5","2","","9825316044","","","2020-07-04 12:16:59","0","0","28","1","261"),
("251","1","GESCO WIRE INDUSTRIES","28","CUS072020-262","0","","0","0","0","","9426706181","","","2020-07-04 12:17:32","0","0","28","1","262"),
("252","1","AMAR INDUSTRIES","28","CUS072020-263","0","","0","0","0","","9428114733","","","2020-07-04 12:18:20","0","0","28","1","263"),
("253","1","GAYATRI RUBBER WORKS ","28","CUS072020-264","0","","0","0","0","","98790055162","","","2020-07-04 12:33:05","0","0","28","1","264"),
("254","1","GEHLOT WORKS ","28","CUS072020-265","0","","1","5","2","","9414132142","","","2020-07-04 12:33:56","0","0","28","1","265"),
("255","1","GAYATRI PLASTICS & STEEL","28","CUS072020-266","0","","1","5","0","","9824043394","","","2020-07-04 12:34:48","0","0","28","1","266"),
("256","1","UNITED MACHINE TOOLS","28","CUS072020-267","0","","1","5","0","","9824515079","","","2020-07-04 12:35:30","0","0","28","1","267"),
("257","0","COREL PHARMA CHEMICAL","28","CUS072020-268","0","","0","0","0","","9375031692","","","2020-07-04 12:40:43","2","0","28","1","268"),
("258","1","GUJARAT DYESTUFF INDUSTRIES PVT LTD ","28","CUS072020-269","0","","2","5","2","","9825097601","","","2020-07-04 12:42:43","0","0","28","1","269"),
("259","1","ENGLISH AGRO ","28","CUS072020-270","0","","1","5","2","","9510093444","","","2020-07-04 12:45:28","0","0","28","1","270"),
("260","1","S S POLYMERS","28","CUS072020-271","0","","0","0","0","","9898739612","","","2020-07-04 12:46:06","0","0","28","1","271"),
("261","1","ECONOPLAST PROCESSORS ","28","CUS072020-272","0","","0","0","0","","9426325542","","","2020-07-04 12:46:35","0","0","28","1","272"),
("262","1","GAYATRI PRODUCT","28","CUS072020-273","0","","0","0","0","","9727029111","","","2020-07-04 12:47:07","0","0","28","1","273"),
("263","1","TRIUMPH POLYMERS","28","CUS072020-274","0","","0","0","0","","9426366696","","","2020-07-04 12:48:15","0","0","28","1","275"),
("264","1","DIAMOND PVC PRODUCTS ","28","CUS072020-276","0","","0","0","0","","9099977946","","","2020-07-04 12:48:55","0","0","28","1","277"),
("265","1","ISOTEX CORPORATION PVT. LTD","28","CUS072020-278","0","","1","5","2","","9725014264","","","2020-07-04 12:49:54","0","0","28","1","278"),
("266","1","Shree Hansh Alloys","28","CUS072020-279","0","","1","5","2","","9824033291","","","2020-07-04 12:51:22","0","0","28","1","279"),
("267","0","Vishwa Machinery And Processing Private Limited","28","CUS072020-280","3","","1","5","2","","9824466847","","","2020-07-04 12:57:57","0","0","28","1","280"),
("268","1","REAL ENGINEERS & BOILER REPAIRERS","28","CUS072020-281","0","","1","0","0","","9825318255","","","2020-07-06 10:31:43","0","0","28","1","282"),
("269","1","WALIA ENGINEERING ASSOCIATES PVT.LTD","28","CUS072020-283","0","","0","0","0","","9725198672","","","2020-07-06 10:33:48","0","0","28","1","283"),
("270","1","CHEM PROCESS SYSTEMS PVT. LTD.","28","CUS072020-284","0","","0","0","0","","9904001108","","","2020-07-06 10:34:09","0","0","28","1","284"),
("271","1"," ANUP ENGINEERING LTD ","28","CUS072020-285","0","","0","0","0","","9820545729","","","2020-07-06 10:34:30","0","0","28","1","285"),
("272","1","C.DOCTOR INDIA PRIVATE LIMITED","28","CUS072020-286","0","","0","0","0","","","","","2020-07-06 10:35:06","0","0","28","1","286"),
("273","1","Apex Alloy Steel Pvt.Ltd.","28","CUS072020-287","0","","0","0","0","","9825062260","","","2020-07-06 10:35:53","0","0","28","1","287"),
("274","1","Airmex Newmetical LTD","28","CUS072020-288","0","","0","0","0","","9979924125","","","2020-07-06 10:36:28","0","0","28","1","288"),
("275","1","New Anad Auto Engi","28","CUS072020-289","0","","0","0","0","","9714423896","","","2020-07-06 10:37:28","0","0","28","1","292"),
("276","1","Shaswat Design","28","CUS072020-290","0","","0","0","0","","9998440402","","","2020-07-06 10:37:21","0","0","28","1","291"),
("277","1","J P engineering Works","28","CUS072020-293","0","","0","0","0","","9825474857","","","2020-07-06 10:37:47","0","0","28","1","293"),
("278","1","KAUSHAL KISHOR TRIPATHI","32","CUS072020-289","3","","0","6","0","","9263312300","","","2020-07-06 10:37:53","0","0","32","1","289"),
("279","1","JITENDRA ENGINEERING","28","CUS072020-294","3","","1","5","2","","9825388422","","","2020-07-06 10:38:21","0","0","28","1","294"),
("280","1","Shreee Hari Engineers","28","CUS072020-295","0","","1","5","2","","9924406970","","","2020-07-06 10:38:52","0","0","28","1","295"),
("281","1","Plastic Art Enginering","28","CUS072020-296","0","","0","0","0","","9727064740","","","2020-07-06 10:39:30","0","0","28","1","296"),
("282","1","S K Engineering","28","CUS072020-297","0","","1","5","2","","9727606206","","","2020-07-06 10:40:33","0","0","28","1","297"),
("283","1","Chamunda Enginerring Worker","28","CUS072020-298","0","","1","5","2","","9979474683","","","2020-07-06 10:41:02","0","0","28","1","298"),
("284","1","Shams Engineering","28","CUS072020-299","0","","0","0","0","","9979601970","","","2020-07-06 10:41:31","0","0","28","1","299"),
("285","1","M R Card Solustion","28","CUS072020-300","0","","0","0","0","","8487850813","","","2020-07-06 10:43:15","0","0","28","1","300"),
("286","1","ARK","28","CUS072020-301","0","","0","0","0","","9825051625","","","2020-07-06 10:44:21","0","0","28","1","302"),
("287","1","Revomac","28","CUS072020-303","0","","1","2","2","","8140158481","","","2020-07-06 10:45:31","0","0","28","1","303"),
("288","1","Ambica Sales Engency","28","CUS072020-304","0","","0","0","0","","9998662805","","","2020-07-06 10:46:22","0","0","28","1","305"),
("289","1","Raj Rajeshwari Contenor","28","CUS072020-306","0","","0","0","0","","9327084098","","","2020-07-06 10:46:47","0","0","28","1","306"),
("290","1","Sainath Wire Products","28","CUS072020-307","0","","0","0","0","","9825454016","","","2020-07-06 10:47:37","0","0","28","1","307"),
("291","1","V-Tech Valves","28","CUS072020-308","0","","0","0","0","","9537121992","","","2020-07-06 11:19:43","0","0","28","1","309"),
("292","1","GANHHAPUTRA K S K","32","CUS072020-310","3","","0","6","0","","9923601414","","","2020-07-06 11:21:13","0","0","32","1","310"),
("293","1","SAMRUDDHI PLASTIC INDUSTRY","32","CUS072020-311","3","","0","6","0","","9637227077","jamadaryasin6@gmail.com","","2020-07-06 11:26:54","0","0","32","1","312"),
("294","1","G K PLASTICS ","28","CUS072020-313","0","","0","0","0","","9825244897","","","2020-07-06 11:28:41","0","0","28","1","313"),
("295","1","GETINSTA","32","CUS072020-313","3","","0","6","0","","9508862529","ARIFULISLAM200891@GMAIL.COM","","2020-07-06 11:29:07","0","0","32","1","313"),
("296","1","G.M EXPORTS ","28","CUS072020-314","0","","0","0","0","","9426518292","","","2020-07-06 11:29:19","0","0","28","1","314"),
("297","1","INDIAN ENGINEERING COMPANY","28","CUS072020-315","0","","0","0","0","","9152672328","","","2020-07-06 11:29:42","0","0","28","1","315"),
("298","1","GABBAR ENGINEERING CO","28","CUS072020-316","0","","0","0","0","","9824062000","","","2020-07-06 11:30:41","0","0","28","1","316"),
("299","1","MAHAKALI INDUSTRIES","28","CUS072020-317","3","","1","5","2","","9152123648","","","2020-07-06 11:31:34","0","0","28","1","317"),
("300","1","MARUTI ELEVATORS & ENGINEERS","28","CUS072020-318","0","","0","0","0","","9152160326","","","2020-07-06 11:32:38","0","0","28","1","318");
INSERT INTO tbl_customer VALUES
("301","1","GAJROLL ENGINEERING","28","CUS072020-319","0","","1","5","2","","9687606390","","","2020-07-06 11:33:16","0","0","28","1","319"),
("302","1","SOLMEC EARTHMOVERS PVT LTD","28","CUS072020-320","0","","1","5","2","","8511175111","","","2020-07-06 11:35:00","0","0","28","1","320"),
("303","1","GANESH CORPORATION ","28","CUS072020-321","0","","1","5","0","","9825048678","","","2020-07-06 11:36:03","0","0","28","1","321"),
("304","1","AHUJA ASSOCIATES","32","CUS072020-322","3","","0","6","0","","9837344746","OM.AHUJA10@GMAIL.COM","","2020-07-06 11:39:38","0","0","32","1","322"),
("305","1","VISHAL JAISWAL","32","CUS072020-323","3","","0","6","0","","9532050790","VJ776590@GMAIL.COM","","2020-07-06 11:43:41","0","0","32","1","323"),
("306","1","PATANJALI","32","CUS072020-324","3","","0","6","0","","8090371234","JAINPRAMILRAJ253@GMAIL.COM","","2020-07-06 11:46:17","0","0","32","1","324"),
("307","1","TESTING 1","27","CUS072020-325","0","","0","0","0","","1234567890","TEST@TEST.COM","","2020-07-06 11:51:47","0","0","27","1","325"),
("308","1","GOKUL PLASTIC INDUSTRIES ","28","CUS072020-326","0","","0","0","0","","9428046101","","","2020-07-06 11:52:15","0","0","28","1","326"),
("309","1","ER NIRMAL ATULBHAI PATEL","29","CUS072020-326","3","","0","6","0","","919879666806","NIRMAL5055@GMAIL.COM","","2020-07-06 11:52:43","0","0","29","1","326"),
("310","1","SALMAN KHAN KICHHAUCHHA","32","CUS072020-325","3","","0","6","0","","8858643534","SALMANZZZBLACK@GMAIL.COM","","2020-07-06 11:58:08","0","0","32","1","325"),
("311","1","REAL GARMENTS","29","CUS072020-327","3","","0","6","0","","9924000088","KSHAH202@GMAIL.COM","","2020-07-06 11:58:43","0","0","29","1","327"),
("312","1","KAUTILYAM","29","CUS072020-328","3","","0","6","0","","917046460248","JAYDEEPV003@GMAIL.COM","","2020-07-06 12:00:28","0","0","29","1","328"),
("313","1","KHIROD ","32","CUS072020-328","3","","0","6","0","","8011102795","KHIROD.CHUTIA@GMAIL.COM","","2020-07-06 12:01:44","0","0","32","1","328"),
("314","1","EMIPRO","29","CUS072020-329","3","","0","6","0","","919408323288","BHATELIYAROCK@GMAIL.COM","","2020-07-06 12:03:32","0","0","29","1","329"),
("315","1","MAKRANA MARBAL","32","CUS072020-329","3","","0","6","0","","8941923635","AIJAZSIDDIQUI0@GMAIL.COM","","2020-07-06 12:04:17","0","0","32","1","329"),
("316","1","YASHVANT GADHIYA","29","CUS072020-330","3","","0","6","0","","919429541048","YASH784@YAHOO.COM","","2020-07-06 12:05:27","0","0","29","1","330"),
("317","1","RAJ GUPTA","32","CUS072020-331","3","","0","6","0","","9504481948","RAJESHGUPTAGAYA@GMAIL.COM","","2020-07-06 12:09:07","0","0","32","1","331"),
("318","1","UMESH BAJAJ","32","CUS072020-332","3","","0","6","0","","8192936407","UKM.05721@GMAIL.COM","","2020-07-06 12:12:37","0","0","32","1","332"),
("319","1","MOHSIN MADHUPUR","29","CUS072020-333","3","","0","6","0","","919727838338","MOHSINMADHUPUR13@GMAIL.COM","","2020-07-06 12:13:19","0","0","29","1","333"),
("320","1","SUMAN LADIES GARMENT","32","CUS072020-334","3","","0","6","0","","7875733111","AKSHAY.JADHAV918@GMIL.COM","","2020-07-06 12:15:11","0","0","32","1","334"),
("321","1","BALAJI RO AGENCIES","32","CUS072020-335","3","","0","6","0","","9960603005","VGBHAJIPALE89@GMAIL.COM","","2020-07-06 12:18:35","0","0","32","1","335"),
("322","1","NAVNIT BHADALIYA","29","CUS072020-336","3","","0","6","0","","989892669","NAVNIT.BHADALIYA1991@GMAIL.COM","","2020-07-06 12:21:56","0","0","29","1","336"),
("323","1","JPK BEVERAGES AND FOODS LLP","29","CUS072020-335","3","","0","6","0","","919925000109","ASHOKPJAISWAL@GMAIL.COM","","2020-07-06 12:22:41","0","0","29","1","335"),
("324","1","GANSHYAMBHAI GYANCHAND SINDHI","29","CUS072020-337","3","","1","6","0","","918401475411","GANSHYAMBHAI1970@GMAIL.COM","","2020-07-06 12:26:46","0","0","29","1","337"),
("325","1","SHIV SHAKTI MEDICINE","29","CUS072020-338","3","","0","6","0","","919429912582","PMANAN1509@GMAIL.COM","","2020-07-06 12:28:22","0","0","29","1","338"),
("326","1","GHULAM SARWAR KHAN","32","CUS072020-339","3","","0","6","0","","7355157575","AFTABCOMPUTERSRU@GMAIL.COM","","2020-07-06 12:29:26","0","0","32","1","339"),
("327","1","GANPATSINGH RAJPUT RAJPUT","29","CUS072020-338","3","","1","6","7","","919428737478","GANPATSINGHSURANA@GMAIL.C","","2020-07-06 12:29:39","0","0","29","1","338"),
("328","1","SHIV JI VERMA","32","CUS072020-340","3","","0","6","0","","9386546500","BHOOMIPHARMA4@GMAIL.COM","","2020-07-06 12:33:47","0","0","32","1","340"),
("329","1","KHALID ZERAWALA","29","CUS072020-341","3","","0","6","0","","919978231931","KHALIDZEER345@GMAIL.COM","","2020-07-06 12:34:33","0","0","29","1","341"),
("330","1","INDER BHATI","29","CUS072020-342","3","","0","6","0","","919987266524","INDERBHATI0357@GIMALI.COM","","2020-07-06 12:35:57","0","0","29","1","342"),
("331","1","NEW LOVELY GARMENTS","32","CUS072020-343","3","","0","6","0","","9140193284","LUV.IN.OBEROI@GMAIL.COM","","2020-07-06 12:37:14","0","0","32","1","343"),
("332","1","TECHMECH SOLUTIONS","29","CUS072020-344","3","","0","6","0","","919033663071","TECHMECH@OUTLOOK.IN","","2020-07-06 12:38:30","0","0","29","1","344"),
("333","1","PARTH ELECTRONIC","29","CUS072020-342","3","","4","6","0","","919824813698","PARTHELECTRONIC1997@YAHOO.CO.IN","","2020-07-06 12:38:39","0","0","29","1","342"),
("334","1","INDUSTRIAL TRAINING INSTITUTE","32","CUS072020-345","3","","0","6","0","","9101747300","BITUDAS3333@GMAIL.COM","","2020-07-06 12:40:33","0","0","32","1","345"),
("335","1","LUCKY HOSIERY","29","CUS072020-345","3","","0","6","0","","919998302447","RAICHANDANI.MANISH73@GMAIL.COM","","2020-07-06 12:41:18","0","0","29","1","345"),
("336","1","SALIM SHAIKH","29","CUS072020-346","3","","0","6","0","","919898383141","SALIMSHAIKH956@GMAIL.COM","","2020-07-06 12:42:53","0","0","29","1","346"),
("337","1","LASA THE BOOK MART","32","CUS072020-346","3","","0","6","0","","9811816288","LASATRADERSINDIA@GMAIL.COM","","2020-07-06 12:43:00","0","0","32","1","346"),
("338","1","GOHIL CHANDRESH","29","CUS072020-347","3","","0","6","0","","919998064689","GOHILRAJ155@GMAIL.COM","","2020-07-06 12:44:14","0","0","29","1","347"),
("339","1","JAINAM SILVER PRODUCT PVT LTD","29","CUS072020-348","3","","0","6","0","","919426411719","ARIKJAIN137@ICLOUD.COM","","2020-07-06 12:45:32","0","0","29","1","348"),
("340","1","ROYAL MOBILE GALLERY","29","CUS072020-348","3","","4","6","7","","917801910000","AMANAGRWAL7@GMAIL.COM","","2020-07-06 12:46:18","0","0","29","1","348"),
("341","1","ANKIT MUNDADA","32","CUS072020-349","3","","0","6","0","","9158888181","ANKITMUNDADA@GMAIL.COM","","2020-07-06 12:46:55","0","0","32","1","349"),
("342","1","SHARDA ENTERPRISES","29","CUS072020-349","3","","0","6","0","","917600008833","SANDIP4648@GMAIL.COM","","2020-07-06 12:46:58","0","0","29","1","349"),
("343","1","NAVYA ENTERPRISE","29","CUS072020-350","3","","0","6","0","","918238301086","PVJ561987@GMAIL.COM","","2020-07-06 12:49:20","0","0","29","1","350"),
("344","1","SUBHASHBHAI SONI","29","CUS072020-351","3","","0","6","0","","919898731392","SUBHASHBHAISONI74@GMAIL.COM","","2020-07-06 12:50:31","0","0","29","1","351"),
("345","1","BPCL","32","CUS072020-350","3","","0","6","0","","9905990790","BALRAMKHATRI26@GMAIL.COM","","2020-07-06 12:50:37","0","0","32","1","350"),
("346","1","RJ CODER","29","CUS072020-352","3","","0","6","0","","919638922130","RAMEAHJADAV133@GMAIL.COM","","2020-07-06 12:51:51","0","0","29","1","352"),
("347","1","SHREEJI ASSOCIATES","29","CUS072020-352","3","","1","6","7","","918128281222","CKANANI2448@GMAIL.COM","","2020-07-06 12:53:35","0","0","29","1","352"),
("348","1","MOHIT SINGH GHANGHORIYA","29","CUS072020-353","3","","1","6","0","","918487009476","MOHIT14895@GMAIL.COM","","2020-07-06 12:53:41","0","0","29","1","353"),
("349","1","HARIBHAI RAJPOOT","29","CUS072020-354","3","","0","6","0","","919925142351","HARIBHAIRAJPOOT24@GMAIL.COM","","2020-07-06 12:55:33","0","0","29","1","354"),
("350","1","RAVI TRADING COMPANY","29","CUS072020-355","3","","0","6","0","","919104564545","RAVITRADING518@GMAIL.COM","","2020-07-06 12:56:42","0","0","29","1","355"),
("351","1","XYZ 1","27","CUS072020-355","0","","0","0","0","","1234567890","XYZ@GMAIL.COM","","2020-07-06 12:57:05","0","0","27","1","355"),
("352","1","DOBARIYA PIYUSH","29","CUS072020-356","3","","0","6","0","","919429186396","PIYUSHDOBARIYA60@GMAIL.COM","","2020-07-06 12:58:31","0","0","29","1","356"),
("353","1","VIKKY RATHORE AMIT","29","CUS072020-356","3","","0","6","7","","917041227751","SANANDSUPERMALL@GMAIL.COM","","2020-07-06 12:59:02","0","0","29","1","356"),
("354","1","AMRUTBHAI PANCHAL","29","CUS072020-357","3","","0","6","0","","919825154237","AMRUTBHAI.PANCHAL62@GMAIL.COM","","2020-07-06 13:01:39","0","0","29","1","357"),
("355","1","SWATI WATER SUPPLY LTD","29","CUS072020-358","3","","0","6","0","","919662156249","KUMARTHAKURKOTA@GMAIL.COM","","2020-07-06 13:06:35","0","0","29","1","358"),
("356","1","E-PROCUREMENT TECHNOLOGIES LIMITED","29","CUS072020-359","3","","0","6","0","","919033035550","RAVI.BHATT442@GMAIL.COM","","2020-07-06 13:08:23","0","0","29","1","359"),
("357","0","Hasmukh Patel","29","CUS072020-360","3","","0","6","7","","918000260045","hasmukhpatel2078@gmail.com","","2020-07-06 13:11:57","0","0","29","1","360"),
("358","1","NIDHI COMPUTERS","29","CUS072020-361","3","","0","6","0","","919824932654","NIDHI.COMPUTERS@YAHOO.IN","","2020-07-06 13:13:03","0","0","29","1","361"),
("359","1","Ahmedabad packaging ind","28","CUS072020-362","0","","1","5","2","","9327061969","","28","2020-07-06 13:26:21","0","0","28","1","362"),
("360","1","HASMUKHBHAI","29","CUS072020-363","3","","0","6","0","","9904496503","","","2020-07-06 13:58:36","0","0","29","1","363"),
("361","1","RAJVEER TOURIST SERVICES","29","CUS072020-364","3","","0","6","0","","9978484492","AGPATELMP@GMAIL.COM","","2020-07-06 14:00:57","0","0","29","1","364"),
("362","1","SEJAL IMPEX","29","CUS072020-365","3","","0","6","0","","917802800383","JAYDEEPPANCHAL45@GMAIL.COM","","2020-07-06 14:02:31","0","0","29","1","365"),
("363","1","rama enterprise","28","CUS072020-365","0","","1","5","2","","7801811655","","","2020-07-06 14:03:37","0","0","28","1","365"),
("364","1","TARUN BHARDWAJ","29","CUS072020-366","3","","0","6","0","","919265726066","TEERTHENTERPRISE1@GMAIL.COM","","2020-07-06 14:04:09","0","0","29","1","366"),
("365","1","SHREE KALAJI METALS","29","CUS072020-367","3","","1","6","0","","9898754395","KALAJIMETALS@GMAIL.COM","","2020-07-06 14:05:42","0","0","29","1","367"),
("366","1","VALANI VAIBHAV","29","CUS072020-367","3","","0","6","0","","919427640968","VAIBHAV.VALANI89@GMAIL.COM","","2020-07-06 14:06:01","0","0","29","1","367"),
("367","1","MAHESHWARI ELECTRONIC","29","CUS072020-368","3","","4","6","0","","9898168839","TULSI2981@GMAIL.COM","","2020-07-06 14:08:11","0","0","29","1","368"),
("368","1","JAY AMBE TREDRS","29","CUS072020-369","3","","0","6","0","","9879726510","DIVYESH_2165@YAHOO.COM","","2020-07-06 14:09:55","0","0","29","1","369"),
("369","1","LAXMI MARKETING AND ROADWAYS","29","CUS072020-369","3","","0","6","0","","919512111951","BHUPATSINHZALA6637@GMAIL.COM","","2020-07-06 14:10:13","0","0","29","1","369"),
("370","1","PURVANG RAVAL","29","CUS072020-370","3","","1","6","7","","919979116901","RAVALGEM@GMAIL.COM","","2020-07-06 14:14:37","0","0","29","1","370"),
("371","1","HARESH PRAJAPATI","29","CUS072020-371","3","","0","6","0","","917359593685","HARESHPHARESH@GMAIL.COM","","2020-07-06 14:17:32","0","0","29","1","371"),
("372","1","SAGARBHAI P SHETH","29","CUS072020-371","3","","0","6","7","","918401545454","SUNNYSHETH434@GMAIL.COM","","2020-07-06 14:18:17","0","0","29","1","371"),
("373","1","MUNJAL METAL INDUSTRIES","28","CUS072020-371","3","","1","5","2","","9879518727","","","2020-07-06 14:18:19","0","0","28","1","371"),
("374","1","VAIBHAV KHATRI","29","CUS072020-372","3","","0","6","0","","919016623022","ORDERARTISTICGIFTS@GMAIL.COM","","2020-07-06 14:20:13","0","0","29","1","372"),
("375","1","SIDDHI AUTO PARTS","29","CUS072020-373","3","","0","0","2","","919510494426","RONAKPANCHAL408@GMAIL.COM","","2020-07-06 14:21:56","0","0","29","1","373"),
("376","1","PANCHAL VIPUL","29","CUS072020-374","3","","0","6","0","","919426661696","SRDEVSATYA@YAHOO.COM","","2020-07-06 14:23:19","0","0","29","1","374"),
("377","1","PARAAGON REFILL CAENTAR","29","CUS072020-375","3","","0","6","0","","919924835665","SANDIP.M.VAIDYA@GMIL.COM","","2020-07-06 14:24:40","0","0","29","1","375"),
("378","1","BHAVESH J.SHAH & CO.","29","CUS072020-375","3","","0","6","0","","919408223661","SHAHBHAVU94@GMAIL.COM","","2020-07-06 14:25:18","0","0","29","1","375"),
("379","1","BLUESTAR LTD","29","CUS072020-376","3","","0","6","0","","919624568684","MAYANKHIRPARA00@GMAIL.COM","","2020-07-06 14:28:23","0","0","29","1","376"),
("380","1","DWIJA ENTERPRISE","29","CUS072020-377","3","","0","6","0","","919725009345","DWIJAENTERPRISE@GMAIL.COM","","2020-07-06 14:31:16","0","0","29","1","377"),
("381","1","CITY TILES","29","CUS072020-378","3","","0","6","0","","919427079207","DSP1077@YAHOO.CO.IN","","2020-07-06 14:32:58","0","0","29","1","378"),
("382","1","PATEL MAHESH","29","CUS072020-379","3","","0","6","0","","919909991489","STEELCRAFT111@GMAIL.COM","","2020-07-06 14:34:44","0","0","29","1","379"),
("383","1","SHREE RAM MEDICAL","29","CUS072020-380","3","","0","6","0","","919824618202","HITESHTHAKKAR1478@GMAIL.COM","","2020-07-06 14:36:24","0","0","29","1","380"),
("384","1","GANESH COMPUTER","29","CUS072020-381","3","","0","6","0","","919461605271","GANPATKUMAR533@GMAIL.COM","","2020-07-06 14:38:03","0","0","29","1","381"),
("385","1","YAMUNA CLOTHING","29","CUS072020-381","3","","1","6","1","","919879918887","RAJESH98799@GMAIL.COM","","2020-07-06 14:38:25","0","0","29","1","381"),
("386","1","MATESHWARI TRADING COMPANY","29","CUS072020-382","3","","0","6","0","","919426929187","CHOUDHARYOMPRAKASH331@GMAIL.COM","","2020-07-06 14:40:07","0","0","29","1","382"),
("387","1","NEELESH NANDA","29","CUS072020-383","3","","0","6","0","","919879617471","NEELESH071172@GMAIL.COM","","2020-07-06 14:41:27","0","0","29","1","383"),
("388","1","BHAGWATI CREATION","29","CUS072020-383","3","","0","6","7","","919924054064","VISHAL.KHODIFAD@GMAIL.COM","","2020-07-06 14:42:44","0","0","29","1","383"),
("389","1","JAY JALARAM STORE","29","CUS072020-384","3","","0","6","0","","919879153020","SUKETUTHAKKAR1506@GMAIL.COM","","2020-07-06 14:43:15","0","0","29","1","384"),
("390","1","MAHALAXMI ENTERPRISES","29","CUS072020-385","3","","0","6","0","","9909978142","CITIPOINTDRESSMATERIALS@GMAIL.COM","","2020-07-06 14:45:09","0","0","29","1","385"),
("391","1","CHETANSINH VAGHELA","29","CUS072020-386","3","","0","6","0","","919687279884","CHETBHA007@GMAIL.COM","","2020-07-06 14:46:35","0","0","29","1","386"),
("392","1","SHARMA DARSHAN","29","CUS072020-386","3","","1","6","7","","919978106315","SHARMADARSHAN45@YAHOO.COM","","2020-07-06 14:46:41","0","0","29","1","386"),
("393","1","TASVIN PATEL","29","CUS072020-387","3","","0","6","0","","919998896555","PATELELECTRICALS11@GMAIL.COM","","2020-07-06 14:48:00","0","0","29","1","387"),
("394","1","NAYADAUR TRADERS","29","CUS072020-388","3","","0","6","0","","918460830583","DEEPESHWADERA24@GMAIL.COM","","2020-07-06 14:49:37","0","0","29","1","388"),
("395","1","HARESH INDUSTRIES","29","CUS072020-388","3","","0","6","7","","919913643441","HARESH_INDUS74@YAHOO.COM","","2020-07-07 17:33:46","2","0","29","1","514"),
("396","1","OM MEDICAL","29","CUS072020-389","3","","0","6","0","","919510320107","DEVENDRAFJIVRANI@GMEAL.COM","","2020-07-06 14:51:03","0","0","29","1","389"),
("397","1","KAMAL JHA","29","CUS072020-390","3","","1","6","7","","919825284911","KAMAL1213.KJ@GMAIL.COM","","2020-07-06 14:52:45","0","0","29","1","390"),
("398","1","AMIT PATEL","29","CUS072020-391","3","","0","6","7","","918980661766","GOLDSTARBATTERYSHOP01@GMAIL.COM","","2020-07-06 14:57:26","0","0","29","1","391"),
("399","1","D.RAJA SPINTEX","29","CUS072020-390","3","","0","6","0","","919173886389","PATELHIMANSHU9173@GMAIL.COM","","2020-07-06 14:58:07","0","0","29","1","390"),
("400","1","SKULL HOUSE","29","CUS072020-392","3","","0","6","0","","919157915717","STAMANCHE12@GMAIL.CON","","2020-07-06 14:59:34","0","0","29","1","392");
INSERT INTO tbl_customer VALUES
("401","1","BHAGWATI COMPUTERS","29","CUS072020-392","3","","1","6","7","","919979563858","SAGARPANCHAL467@GMAIL.COM","","2020-07-06 15:00:19","0","0","29","1","392"),
("402","1","KRISHA ENTERPRISE","29","CUS072020-393","3","","0","6","0","","919998510792","MODHNISARG7740@GMAIL.COM","","2020-07-06 15:01:05","0","0","29","1","393"),
("403","1","PRAGNESH SHAH","29","CUS072020-394","3","","0","6","0","","919426396703","SHAHPRAGNESH02@GMAIL.COM","","2020-07-06 15:02:56","0","0","29","1","394"),
("404","1","SHIVAM TRADRES","29","CUS072020-394","3","","0","6","7","","919928863382","PAVANKALALMCOM@GMAIL.COM","","2020-07-06 15:04:43","0","0","29","1","394"),
("405","1","NAVSARJAN TRUST","29","CUS072020-395","3","","0","6","0","","919998062472","GIRIRAJ15186@GMAIL.COM","","2020-07-06 15:05:34","0","0","29","1","395"),
("406","1","SNJY YOUTH CONAULTANT","29","CUS072020-396","3","","0","6","0","","919687388507","PARMARSNJY009@GMAIL.COM","","2020-07-06 15:06:47","0","0","29","1","396"),
("407","1","KRISHNA MARKETING","29","CUS072020-397","3","","0","6","7","","9724833606","NIRAVVAKIL3@GMAIL.COM","","2020-07-06 15:08:31","0","0","29","1","397"),
("408","1","BAJRANG KIRANA STOR","29","CUS072020-398","3","","0","6","0","","919913898315","ASHVINPATEL98315@GMAIL.COM","","2020-07-06 15:10:58","0","0","29","1","398"),
("409","1","SWIFT TRANS LOGISTIC SOLUTIONS PVT LTD","29","CUS072020-399","3","","0","6","7","","919898289908","DCPATEL1969@REDIFFMAIL.COM","","2020-07-06 15:13:00","0","0","29","1","399"),
("410","1","JEKI LALWANI","29","CUS072020-399","3","","0","6","0","","919879722232","JAYKISHAN.LALVANI@GMAIL.COM","","2020-07-06 15:13:20","0","0","29","1","399"),
("411","1","DILIP PATEL","29","CUS072020-400","3","","0","6","0","","919898056616","DCON201117@GMAIL.COM","","2020-07-06 15:15:14","0","0","29","1","400"),
("412","1","MEHTA GROUP","29","CUS072020-401","3","","1","6","0","","919327716808","MADHAVCEMENTDHANDHUKA@GMAIL.COM","","2020-07-06 15:16:42","0","0","29","1","401"),
("413","1","HONEY SALES","29","CUS072020-401","3","","0","6","0","","919712968825","BHAVIKTHAKKAR1985@GMAIL.COM","","2020-07-06 15:17:13","0","0","29","1","401"),
("414","1","BPCL","32","CUS072020-398","3","","0","6","0","","9905990790","BALRAMKHATRI26@GMAIL.COM","","2020-07-06 15:17:32","0","0","32","1","398"),
("415","1","AAKRUTI DIGITAL","29","CUS072020-402","3","","0","6","0","","919898531350","DEVENDRAPADMANI@GMAIL.COM","","2020-07-06 15:19:15","0","0","29","1","402"),
("416","1","HOTEL ROYAL","29","CUS072020-402","3","","1","6","7","","919898291166","TADHAYASAR@GMAIL.COM","","2020-07-06 15:20:46","0","0","29","1","402"),
("417","1","TIWARI PBOTO SERVICE","32","CUS072020-403","3","","0","6","0","","9319677552","TIEARIPHOTOSERVICE@GMAIL.COM","","2020-07-06 15:21:53","0","0","32","1","403"),
("418","1","NOVA MEDICAL DEVICES","29","CUS072020-404","3","","0","6","0","","919913524356","MSPATEL291976@GMAIL.COM","","2020-07-06 15:24:02","0","0","29","1","404"),
("419","1","ADANI WILMAR LTD","29","CUS072020-405","3","","0","6","0","","919409419803","SAMIRPUROHIT10@YAHOO.IN","","2020-07-06 15:25:28","0","0","29","1","405"),
("420","1","SITARAM TRADING","29","CUS072020-406","3","","0","6","0","","919825311065","JVALANTFAJALIA75@GMAIL.COM","","2020-07-06 15:27:48","0","0","29","1","406"),
("421","0","Jatin Patel","29","CUS072020-406","3","","0","6","0","","917359560933","jatinpatel111222333@gmail.com","","2020-07-06 15:28:40","0","0","29","1","406"),
("422","1","RAUSHAN KUMAR","32","CUS072020-406","3","","0","6","0","","7631560247","RAUSHANKRROYAL@GMAIL.COM","","2020-07-06 15:28:42","0","0","32","1","406"),
("423","1","GREE AIR CONDITIONERS","29","CUS072020-407","3","","0","6","0","","919157394009","MINESHBAROT1975@GMAIL.COM","","2020-07-06 15:28:57","0","0","29","1","407"),
("424","1","CIMPRESS INDIA","29","CUS072020-408","3","","0","6","0","","917623013100","73DESIGNPRINT@GMAIL.COM","","2020-07-06 15:30:48","0","0","29","1","408"),
("425","1","SHREE HARI BIZ AND AGRO FERTILIZER","29","CUS072020-409","3","","0","6","0","","918154895667","SATISHPATEL.SP47@GMAIL.COM","","2020-07-06 15:31:56","0","0","29","1","409"),
("426","1","AYUSH INFOSYSTEM","32","CUS072020-409","3","","0","6","0","","9161703707","AYUSHINFOSYSTEM4@GMAIL.COM","","2020-07-06 15:32:09","0","0","32","1","409"),
("427","1","ASPAK MALEK","29","CUS072020-409","3","","0","6","0","","919825424738","ASPAKMALEK99@GMAIL.COM","","2020-07-06 15:32:23","0","0","29","1","409"),
("428","1","SHIRISH SAVALIYA","29","CUS072020-410","3","","0","6","0","","9428117184","SM.MXSMS19@GMAIL.COM","","2020-07-06 15:33:49","0","0","29","1","410"),
("429","1","NAREN OZA","29","CUS072020-411","3","","0","6","0","","919825085169","NARENOZA@GMAIL.COM","","2020-07-06 15:35:01","0","0","29","1","411"),
("430","1","KUNAL TEXTILE","29","CUS072020-412","3","","0","6","0","","7405162405","PAWARDHANRAJ093@GMAIL.COM","","2020-07-06 15:35:57","0","0","29","1","412"),
("431","1","PATEL TECHNOLOGY","29","CUS072020-413","3","","0","6","0","","919426544161","PANKAJGOLD@YAHOO.COM","","2020-07-06 15:37:26","0","0","29","1","413"),
("432","1","ASHWIN SHINGALA","29","CUS072020-413","3","","2","6","0","","9737779346","ASHWINSHINGALA44444@GMAIL.COM","","2020-07-06 15:39:46","0","0","29","1","413"),
("433","1","NILESH SHAH","29","CUS072020-414","3","","0","6","0","","917046104722","SHAH.NILESH1429@GMAIL.COM","","2020-07-06 15:40:02","0","0","29","1","414"),
("434","1","VINAY MEHTA","29","CUS072020-415","3","","0","6","7","","919904902830","VINAYMEHTA2232@GMAIL.COM","","2020-07-06 15:46:47","0","0","29","1","415"),
("435","1","BHARGAV MEHTA","29","CUS072020-416","3","","1","6","0","","919925044291","BHARGAV1971@HOTMAIL.COM","","2020-07-06 15:51:07","0","0","29","1","416"),
("436","1","HR TESTING","27","CUS072020-417","0","","0","6","4","","1234567890","HR@GMAIL.COM","","2020-07-06 16:06:28","0","0","27","1","417"),
("437","1","ACME AIR EQUIPMENTS PVT.LTD ","34","CUS072020-418","3","","0","6","8","","7925835995","ACMEAIREQUIPMENTS@GMAIL.COM","","2020-07-06 16:14:07","0","0","34","1","418"),
("438","1","JAY GOPAL INDUSTRIES","29","CUS072020-419","3","","1","6","0","","9426006048","","","2020-07-06 16:44:03","0","0","29","1","420"),
("439","1","LAXMI ENGINEERING WORKS","29","CUS072020-421","3","","1","6","0","","9825045839","","","2020-07-06 16:54:53","0","0","29","1","421"),
("440","1","ZED VALVES CO. PVT.LTD ","34","CUS072020-421","3","","0","6","0","","7922910237","INFO@ZEDVALVES.COM","","2020-07-06 16:57:40","0","0","34","1","421"),
("441","1","JYOTI PLASTIC INDUSTRIES","28","CUS072020-422","3","","1","5","2","","9227527233","","","2020-07-06 17:01:00","0","0","28","1","422"),
("442","1","KAMBERT MACHINERY CO.PVT.LTD","34","CUS072020-422","3","","1","6","0","","7925834041","SALES@KAMBERT.COM","","2020-07-06 17:01:09","0","0","34","1","422"),
("443","1","AEGIES ENGNIREEING CO .PVT.LTD ","34","CUS072020-423","3","","1","6","0","","9909967693","SALES@AEGIESNGG.COM","","2020-07-06 17:05:34","0","0","34","1","423"),
("444","1","NAYYADUR TRADSER","28","CUS072020-424","3","","0","5","2","","8460830583","","","2020-07-06 17:12:27","0","0","28","1","424"),
("445","1","PREMIER MILL STORE ","34","CUS072020-425","3","","2","6","0","","9327049978","SALE@PMSPL.IN","","2020-07-06 17:15:44","0","0","34","1","425"),
("446","1","COMET ELECTRICALS","29","CUS072020-426","3","","1","6","8","","9227201222","","","2020-07-06 17:28:16","0","0","29","1","426"),
("447","1"," BHAGWATI SPHEROCAST ","34","CUS072020-426","3","","1","6","0","","7922870402","SPHEROCAST@BHAGWATI.COM","","2020-07-06 17:29:59","0","0","34","1","426"),
("448","1","SCC INFRASTRUCTURE ","34","CUS072020-427","3","","1","6","0","","7926840733","ADMIN@SCCINFRASTRUCTURE.COM","","2020-07-06 17:33:11","0","0","34","1","427"),
("449","1","SUJAL ENTERPRISE","29","CUS072020-428","3","","4","6","0","","9825063023","","","2020-07-06 17:36:11","0","0","29","1","428"),
("450","1"," NABROS PHARMA","34","CUS072020-428","3","","2","6","0","","7926407399","NABROSPHARMA@NABROS.IN","","2020-07-06 17:36:50","0","0","34","1","428"),
("451","1","RAMA ENGINEERING","34","CUS072020-429","3","","0","6","0","","9978909519","INFO@SMITMEDIMED.COM","","2020-07-06 17:46:55","0","0","34","1","429"),
("452","1","SHIV ENGINEERING","29","CUS072020-429","3","","1","6","3","","9879308179","","","2020-07-06 17:47:25","0","0","29","1","429"),
("453","1","M.A.Q MULTIVENTURES PVT LTD","32","CUS072020-430","3","","0","6","0","","9897727490","GUDDURAJA28@GMAIL.COM","","2020-07-06 17:52:49","0","0","32","1","430"),
("454","1","CAPITAL COMPUTERS","32","CUS072020-431","3","","0","6","0","","9839791308","IMRAN.CAPITAL@YAHOO.COM","","2020-07-06 17:55:48","0","0","32","1","431"),
("455","1","RATNAM LAMINATES PVT.LTD ","34","CUS072020-430","3","","0","6","8","","7926583522","RATNAMANI5880@YAHOO.COM","","2020-07-06 17:56:13","0","0","34","1","430"),
("456","1","RAJENDRA KALLOLE","32","CUS072020-432","3","","0","6","0","","9422379011","RKALLOLE@GMAIL.COM","","2020-07-06 17:57:42","0","0","32","1","432"),
("457","1","ANSHUL SABUWALA","29","CUS072020-432","3","","0","6","0","","9725590280","","","2020-07-06 17:58:42","0","0","29","1","432"),
("458","1","RAJBOOK DIPOT","32","CUS072020-433","3","","0","6","0","","9935389403","AJ667249@GMAIL.COM","","2020-07-06 18:00:35","0","0","32","1","433"),
("459","0","APEX  FORMULATIONS PVT .LTD ","34","CUS072020-433","3","","0","6","8","","07926446862","info@apexformulations.com","","2020-07-06 18:05:07","0","0","34","1","433"),
("460","1","PRIME MEDICO","32","CUS072020-434","3","","0","6","0","","9665846131","MOSIN.PATHAN@GMAIL.COM","","2020-07-06 18:05:30","0","0","32","1","434"),
("461","1","ASRX INFRATECH PRIVATE LIMITED","32","CUS072020-435","3","","0","6","0","","9703044455","AMANNKM@GMAIL.COM","","2020-07-06 18:09:07","0","0","32","1","435"),
("462","1","HITESH BHATI","29","CUS072020-434","3","","1","6","0","","9327164191","","","2020-07-06 18:09:22","0","0","29","1","434"),
("463","1","TRIO ELEVATORS COMPANY PVT .LTD ","34","CUS072020-435","3","","0","6","8","","07927478697","TRIO@TRIO.CO.IN","","2020-07-06 18:10:32","0","0","34","1","435"),
("464","1","PRADEEP SHARME","32","CUS072020-436","3","","0","6","0","","9368127093","PRADEEPKSHARMA.KHURJA@GMAIL.COM","","2020-07-06 18:12:22","0","0","32","1","436"),
("465","1","RAMPRAVESH KUMAR","32","CUS072020-437","3","","0","6","0","","8969081419","RAMPRAVESH7257984659@GMAIL.COM","","2020-07-06 18:15:06","0","0","32","1","437"),
("466","1","MAHALAXMI FURNITURE","29","CUS072020-438","3","","3","6","0","","9824543130","","","2020-07-06 18:16:52","0","0","29","1","438"),
("467","1","SKYMAIL EXPRESS SERVICES PVT.LTD.","32","CUS072020-438","3","","0","6","0","","9011127173","GHEWARERUTURAJ@GMAIL.COM","","2020-07-06 18:17:31","0","0","32","1","438"),
("468","1","LEISTUNG ENGINEERING PVT .LTD ","34","CUS072020-437","3","","0","6","8","","7925733411","","","2020-07-06 18:18:56","0","0","34","1","437"),
("469","1","S K PANDIT","32","CUS072020-439","3","","0","6","0","","8896964370","GKCHAUBEY776@GMAIL.COM","","2020-07-06 18:22:31","0","0","32","1","439"),
("470","0","ALLMARC INDUSTRIES PVT .LTD ","34","CUS072020-440","3","","0","6","8","","7929707274","info@aoexformulation.com","","2020-07-06 18:23:52","0","0","34","1","440"),
("471","1","ARATI ENGG . MACHINE MAIN","32","CUS072020-440","3","","0","6","0","","9226449238","PHAVINAL66@GMAIL.COM","","2020-07-06 18:24:44","0","0","32","1","440"),
("472","1","AMROHA","32","CUS072020-441","3","","0","6","0","","9634118735","SUMANT0317@GMAIL.COM","","2020-07-06 18:28:06","0","0","32","1","441"),
("473","1","AIRTE DISH","32","CUS072020-442","3","","0","6","0","","7744030143","MUKESHVARMA261186@GMAIL.COM","","2020-07-06 18:30:40","0","0","32","1","442"),
("474","1","RAHUL SHINGADE","32","CUS072020-443","3","","0","6","0","","9665620518","SHINGADERAHUL0@GMAIL.COM","","2020-07-06 18:33:22","0","0","32","1","443"),
("475","1","S K SYSTEMS","32","CUS072020-444","3","","0","6","0","","9881902409","SANDY_SNKALE@YAHOO.COM","","2020-07-06 18:36:11","0","0","32","1","444"),
("476","1","SUDARSHAN CHEMICAL IND. LTD","32","CUS072020-445","3","","0","6","0","","9271645944","JAYANTA.0ANCHAL44@GMAIL.COM","","2020-07-06 18:39:35","0","0","32","1","445"),
("477","1","R T CHAVAN","32","CUS072020-446","3","","0","6","0","","9881957817","SIDDHU_2201@YAHOO.COM","","2020-07-06 18:42:44","0","0","32","1","446"),
("478","1","RUSHIKESH KRUSHI KENDRA BULDANA","32","CUS072020-447","3","","0","6","0","","9422926270","RUSHIKESH.KK@REDIFFMAIL.COM","","2020-07-06 18:45:05","0","0","32","1","447"),
("479","1","VIJAY CHOUDHARY","32","CUS072020-448","3","","0","6","0","","9022899994","RAMDEVMETALVIJAY@GMAIL.COM","","2020-07-06 18:47:25","0","0","32","1","448"),
("480","1","NANDKISHOR ENG & ENT","32","CUS072020-449","3","","0","6","0","","9158121555","NANDKISHORENG@GMAIL.COM","","2020-07-06 18:49:55","0","0","32","1","449"),
("481","1","KISAN AGENCIES","32","CUS072020-450","3","","0","6","0","","9798855683","AGRAWAL1962@YAHOO.COM","","2020-07-06 18:52:30","0","0","32","1","450"),
("482","1","ANK DIGITAL SYSTEMS","32","CUS072020-451","3","","0","6","0","","8668400556","SACHSURYA@GMAIL.COM","","2020-07-06 18:54:56","0","0","32","1","451"),
("483","1","AMAN TRANDING CO","32","CUS072020-452","3","","0","6","0","","9833721472","AQTANVERR@GMAIL.COM","","2020-07-06 18:56:59","0","0","32","1","452"),
("484","1","ZIAUL HASAN","32","CUS072020-453","3","","0","6","0","","9936926599","0786ALIHASAN0786@GMAIL.COM","","2020-07-06 19:08:18","0","0","32","1","453"),
("485","1","SHREE BALAJI ENTERPRISE","32","CUS072020-453","0","","0","0","0","","918793643498","","","2020-07-06 19:10:18","0","0","32","1","453"),
("486","1","TATAN CYCLE MART.","32","CUS072020-454","3","","0","6","0","","9954815581","TATANPAUL@GMAIL.COM","","2020-07-06 19:14:37","0","0","32","1","454"),
("487","1","GOPAL KRISHNA FOUNDARY","29","CUS072020-455","3","","0","6","0","","777799944","","","2020-07-07 10:24:03","0","0","29","1","455"),
("488","0","A Patel Engineers","28","CUS072020-456","3","","1","5","2","","9825457711","","","2020-07-07 10:46:23","0","0","28","1","456"),
("489","1","AANAL INDUSTRIES","29","CUS072020-457","3","","1","3","0","","9974883210","","","2020-07-07 10:51:42","0","0","29","1","457"),
("490","1","SHIV BORNING","29","CUS072020-458","3","","1","6","0","","9099904693","","","2020-07-07 11:23:05","0","0","29","1","458"),
("491","1","INDIA FLUDE POWER","28","CUS072020-459","3","","1","5","2","","9722707737","INDIAFLUDE.POWER@GMAIL.COM","","2020-07-07 11:24:44","0","0","28","1","459"),
("492","1","KHODIYAR GRINDING","29","CUS072020-460","3","","1","6","0","","9033064572","","","2020-07-07 11:30:34","0","0","29","1","460"),
("493","1","YANUNA GRINDING","29","CUS072020-461","3","","1","6","0","","9724642718","","","2020-07-07 11:46:38","0","0","29","1","466"),
("494","1","SMIT SRIVASTAVA","32","CUS072020-462","3","","0","6","0","","9838468555","SMITSRIVASTAVA@GMAIL.COM","","2020-07-07 11:36:47","0","0","32","1","462"),
("495","1","AL-MIA TRADERS","32","CUS072020-463","3","","0","6","0","","9506063638","IRSHAD.MARIYA@GMAIL.COM","","2020-07-07 11:39:21","0","0","32","1","463"),
("496","1","YASH ENGINEERING","29","CUS072020-462","3","","1","6","0","","9904452692","","","2020-07-07 11:39:30","0","0","29","1","462"),
("497","1","GANESH HARDWER","32","CUS072020-464","3","","0","6","0","","9765726471","AMOLDISALE999@GIMAL.COM","","2020-07-07 11:41:29","0","0","32","1","464"),
("498","1","SUJIT PRASAD","32","CUS072020-465","3","","0","6","0","","7358789910","ZSIDELHI@GMAIL.COM","","2020-07-07 11:44:38","0","0","32","1","465"),
("499","1","TADOBA-ANDHARI TIGER RESERVESAFARI & HOTEL BOOKING","32","CUS072020-466","3","","0","6","0","","919021911528","RAJMOHURLE87@GMAIL.COM","","2020-07-07 11:46:55","0","0","32","1","466"),
("500","1","AAMIS INCORPORATION","32","CUS072020-467","3","","0","6","0","","9823275717","INDSERVEAS@GMAIL.COM","","2020-07-07 11:49:09","0","0","32","1","467");
INSERT INTO tbl_customer VALUES
("501","1","BALAJI ENGINEERING","29","CUS072020-468","3","","1","6","3","","9913887467","","29","2020-07-07 11:54:11","0","0","29","1","469"),
("502","1","MOHAMMAD TARIQ","32","CUS072020-468","3","","0","6","0","","9319787474","TARIK.KHAN.1989@GMAIL.COM","","2020-07-07 11:53:48","0","0","32","1","468"),
("503","1","KK INDUSTRIES","32","CUS072020-470","3","","0","6","0","","9045852380","JKIND.DBD@GMAIL.COM","","2020-07-07 11:56:31","0","0","32","1","470"),
("504","1","YERUVA SRINIVAS REDDY","32","CUS072020-471","3","","0","6","0","","9951903551","YSREDDYGPI@GMAIL.COM","","2020-07-07 11:59:24","0","0","32","1","471"),
("505","1","SHREENATH ENGINEERING","29","CUS072020-471","3","","1","6","0","","9726030670","","","2020-07-07 12:01:22","0","0","29","1","471"),
("506","1","SAMA INDUSTRIES","32","CUS072020-472","3","","0","6","0","","9849037936","SAMAINDS@GMAIL.COM","","2020-07-07 12:02:32","0","0","32","1","472"),
("507","1","DEEPAK PAL","32","CUS072020-473","3","","0","6","0","","9506363733","DEEPAKSKPAL@GMAIL.COM","","2020-07-07 12:04:47","0","0","32","1","473"),
("508","1","H.N. BATTERIES","32","CUS072020-474","3","","0","6","0","","8802199585","ITSNAJAF@YAHOO.CO.UK","","2020-07-07 12:06:46","0","0","32","1","474"),
("509","1","RIDDHI ENGINEERING","29","CUS072020-474","3","","1","6","0","","9824388261","","","2020-07-07 12:06:52","0","0","29","1","474"),
("510","1","PVR CINEMAS","32","CUS072020-475","3","","0","6","0","","9987756852","JEETZIPARE@YMAIL.COM","","2020-07-07 12:09:05","0","0","32","1","475"),
("511","1","VIRSON ENGINEERING","29","CUS072020-476","3","","1","6","0","","9427037811","","","2020-07-07 12:11:38","0","0","29","1","476"),
("512","1","PANKAJ KUMAR SINGH","32","CUS072020-476","3","","0","6","0","","9546359777","PANKAJARYA508@GMAIL.COM","","2020-07-07 12:11:50","0","0","32","1","476"),
("513","1","INDIAN ION EXCHANGE & CHEMICALS LIMITED","28","CUS072020-475","3","","2","5","2","","9998006600","ACCOUNT@INDIANIONEXCHANGE.COM","","2020-07-07 12:11:55","0","0","28","1","475"),
("514","1","SANJAY BEMBDE","32","CUS072020-477","3","","0","6","0","","9168887744","SANJAYBAMBDE777@GIMEL.CO","","2020-07-07 12:13:59","0","0","32","1","477"),
("515","1","NIWAS PATIL","32","CUS072020-478","3","","0","6","0","","9822519108","NIWASPATIL73@GMAIL.COM","","2020-07-07 12:16:02","0","0","32","1","478"),
("516","1","SIMCO CREATIONS","32","CUS072020-479","3","","0","6","0","","7500131155","SIDFORFRNDS@GMAIL.COM","","2020-07-07 12:19:25","0","0","32","1","479"),
("517","1","MUKESH AGENCY","32","CUS072020-480","3","","0","6","0","","8382969999","SWATANTRA.SINGH06@GMAIL.COM","","2020-07-07 12:22:35","0","0","32","1","480"),
("518","1","RAHUL PANDEY","32","CUS072020-481","3","","0","6","0","","917352287862","RAHULPANDEYBTH41@GMAIL.COM","","2020-07-07 12:25:20","0","0","32","1","481"),
("519","1","SONU KURELE","32","CUS072020-482","3","","0","6","0","","9956669679","SONUKURELE84@GAMAIL.COM","","2020-07-07 12:27:26","0","0","32","1","482"),
("520","1","ARSH COMMON SERVIC","32","CUS072020-483","3","","0","6","0","","9506223193","CSCH461@GMAIL.COM","","2020-07-07 12:29:55","0","0","32","1","483"),
("521","1","SAI E SERVICES AND COMPUTER","32","CUS072020-484","3","","0","6","0","","8483888333","MANOJCHAUDHARI117@GMAIL.COM","","2020-07-07 12:32:59","0","0","32","1","484"),
("522","1","RAMDAS BARGAJE","32","CUS072020-485","3","","0","6","0","","8888781314","RAMDASBARGAJE09@GMAIL.COM","","2020-07-07 12:35:04","0","0","32","1","485"),
("523","1","RAKESH PRAJAPATI","32","CUS072020-486","3","","0","6","0","","8009765722","RAKESHKUMAR737937@GMAIL.COM","","2020-07-07 12:37:12","0","0","32","1","486"),
("524","1","RAJEEV KUMAR","32","CUS072020-487","3","","0","6","0","","9308889657","RAJEEV930888@GMAIL.COM","","2020-07-07 12:43:38","0","0","32","1","487"),
("525","1","JAY DURGA BLACKODIES","29","CUS072020-488","3","","1","6","0","","8735004151","","","2020-07-07 12:44:34","0","0","29","1","488"),
("526","1","AJEET SINGH","32","CUS072020-489","3","","0","6","0","","8979471533","AJEETJHSS2014@GMAIL.COM","","2020-07-07 12:46:01","0","0","32","1","489"),
("527","1","SHREEJI ENTERPRISE","29","CUS072020-490","3","","1","6","0","","9978595866","","","2020-07-07 12:50:33","0","0","29","1","490"),
("528","1","GANGA TRANSMISSION","29","CUS072020-491","3","","1","6","0","","9824312604","","","2020-07-07 13:03:13","0","0","29","1","491"),
("529","1","BIVESH HEAT TREATERS","29","CUS072020-492","3","","1","6","0","","9913041915","","","2020-07-07 13:09:18","0","0","29","1","492"),
("530","1","MAHESH FORGING","29","CUS072020-493","3","","1","6","0","","9879141166","","","2020-07-07 13:18:43","0","0","29","1","493"),
("531","1","MAHI ENGINEERING","29","CUS072020-494","3","","1","6","0","","7990293584","","","2020-07-07 14:11:29","0","0","29","1","494"),
("532","1","KOMAL FOUNDARY","29","CUS072020-495","3","","1","6","0","","9725488366","","","2020-07-07 14:16:59","0","0","29","1","495"),
("533","1","HI LIFE ENGINEERING CO","28","CUS072020-496","3","","1","5","2","","","saleshilife3@gmail.com","","2020-07-07 14:30:38","0","0","28","1","496"),
("534","1","Airson Scale Manufacturing","28","CUS072020-497","0","","1","5","2","","9998040407","airsonscales@gmail.com","","2020-07-07 14:33:13","0","0","28","1","497"),
("535","1","AMBICA ENGINEERING CO","28","CUS072020-498","3","","1","5","2","","9898139820","info@ambicaengineering.com","","2020-07-07 14:36:39","0","0","28","1","498"),
("536","1","GEESONS ENGINEERING","28","CUS072020-499","3","","1","5","2","","8866776999","export@geesons.com","","2020-07-07 14:51:05","0","0","28","1","499"),
("537","1","Valas furniture","28","CUS072020-500","0","","3","5","2","","9824024448","valasfurniture@outlook.com","","2020-07-07 14:56:24","0","0","28","1","501"),
("538","1","ANGIPLAST PRIVATE LIMITED","28","CUS072020-502","3","","1","5","2","","9662004149","sales@angiplast.com","","2020-07-07 15:02:39","0","0","28","1","502"),
("539","1","ORBISELEVATOR","28","CUS072020-503","3","","1","5","2","","8000968014","info@orbiselevator.com","","2020-07-07 15:05:17","0","0","28","1","503"),
("540","1","VISHWAS NOTEBOOK MFG","28","CUS072020-504","3","","0","5","2","","9821602232","","","2020-07-07 15:07:35","0","0","28","1","504"),
("541","1","A.G.PATTERNS","29","CUS072020-505","3","","1","6","0","","9879657986","","","2020-07-07 15:13:09","0","0","29","1","505"),
("542","1","KRISHNA ENGINEERING","29","CUS072020-506","3","","1","6","0","","9898505658","","","2020-07-07 15:16:26","0","0","29","1","506"),
("543","1","SHREE AMBICA ENGINEERING(SPARK)","29","CUS072020-507","3","","1","6","0","","9824472455","","","2020-07-07 15:24:00","0","0","29","1","507"),
("544","1","JAYDEEP CONTROLS","28","CUS072020-508","3","","1","5","2","","9227677800","JAYDEEPCONTROLS@GMAIL.COM","","2020-07-07 15:39:16","0","0","28","1","508"),
("545","1","MADHAV ENGINEERING","29","CUS072020-508","3","","1","6","0","","9601979170","","","2020-07-07 15:40:06","0","0","29","1","508"),
("546","1","OCLEG CONTROLS","28","CUS072020-509","3","","1","5","2","","9879507581","OCLEGCONTROLS@YAHOO.CO.IN","","2020-07-07 16:03:59","0","0","28","1","509"),
("547","1","APEX DIGI SCALE AND CONTROL","28","CUS072020-510","3","","1","5","2","","9152168621","INFO@APEXDIGISCALE.COM","","2020-07-07 16:50:46","0","0","28","1","510"),
("548","1","ACCUPANELS ENERGY PVT LTD","28","CUS072020-511","3","","1","5","2","","9152101331","panels@accupanels.com","","2020-07-07 17:12:52","0","0","28","1","512"),
("549","1","HITESH BHATI","29","CUS072020-513","3","","1","6","0","","9327164191","","","2020-07-07 17:24:33","0","0","29","1","513"),
("550","1","YOPRO AUTOMATION SOLUTION","28","CUS072020-515","3","","1","5","2","","9712916736","YOPRO1191@GMAIL.COM","","2020-07-07 17:49:05","0","0","28","1","515"),
("551","1","PANCHAL ENGINEERING ","28","CUS072020-516","3","","1","5","2","","9879050522","","","2020-07-08 11:54:52","0","0","28","1","516"),
("552","1","SAHAKAR MACHINE TOOLS","28","CUS072020-517","3","","1","5","2","","9879790353","SAHAKAR.ENTERPRIS@GMAIL.COM","","2020-07-08 12:01:50","0","0","28","1","517"),
("553","1","MOHAMMAD SHAHNAWAZ","32","CUS072020-518","3","","0","6","0","","9027051555","MOHDSHAHNAWAZ059@GMAIL.COM","","2020-07-08 13:12:35","0","0","32","1","518"),
("554","1","VIJAY MODALUNG INDUSTRIES","28","CUS072020-519","3","","1","5","2","","9898252510","","","2020-07-08 14:25:47","0","0","28","1","519"),
("555","1","VISHAL ELECTRICALS","28","CUS072020-520","3","","4","5","2","","9825065234","","","2020-07-08 16:10:57","0","0","28","1","520"),
("556","1","GEMS ENGINEERING WORKS","28","CUS072020-521","3","","1","5","2","","9825319336","","","2020-07-13 14:36:47","0","0","28","1","554"),
("557","1","VIRKRUPA ENGINERS","28","CUS072020-522","3","","1","5","2","","9152110240","","","2020-07-08 17:38:59","0","0","28","1","522"),
("558","1","GANESH PLASTICS ","28","CUS072020-523","3","","1","5","2","","9879089535","","","2020-07-08 17:50:21","0","0","28","1","523"),
("559","1","GANESH ROPE ","28","CUS072020-524","3","","1","5","2","","9426455698","","","2020-07-08 17:59:18","0","0","28","1","524"),
("560","1","GAUTAM MININGS PVT LTD ","28","CUS072020-525","3","","0","5","2","","9824055936","JAINPOLYMERS2002@YAHOO.COM","","2020-07-09 11:08:48","0","0","28","1","525"),
("561","1","RAJEEV GARG","32","CUS072020-526","3","","0","6","0","","9675861102","RAJEEVGARG278@GMAIL.COM","","2020-07-09 17:14:06","0","0","32","1","526"),
("562","1","SACHIN MADANE","32","CUS072020-527","3","","0","6","0","","9421090516","MADANE011@REDIFFMAIL.COM","","2020-07-10 10:46:57","0","0","32","1","527"),
("563","1","MAHADEV ENGINEERING WORKS","29","CUS072020-528","3","","1","6","0","","8401401467","ADITI.ENGSOLUATION@GMAIL.COM","","2020-07-10 12:51:55","0","0","29","1","529"),
("564","1","KESHAR INDUSTRIES","29","CUS072020-530","3","","1","6","0","","8128142180","KESHARINDUSTRIES214@GMAI.COM","","2020-07-10 13:05:01","0","0","29","1","530"),
("565","1","SHREEJI ENGINEERING","28","CUS072020-531","3","","1","5","10","","9898044204","SHREEJIENGG2014@GMAIL.COM","","2020-07-10 15:49:17","0","0","28","1","531"),
("566","1","SNEHAL SANBHVI","33","CUS072020-532","3","","3","6","8","","982412107","","","2020-07-10 17:56:30","0","0","33","1","532"),
("567","1","FREEION ENGNEERING PVT LTD ","33","CUS072020-533","3","","1","6","8","","9601403011","","","2020-07-11 10:44:42","0","0","33","1","543"),
("568","1","UMMATI MECH ","33","CUS072020-534","3","","0","6","8","","9723559885","","","2020-07-10 18:08:54","0","0","33","1","534"),
("569","1","UNNATI MECH","33","CUS072020-535","3","","2","6","8","","9723559885","","","2020-07-10 18:19:37","0","0","33","1","535"),
("570","1","NUREE PLASTIC ","33","CUS072020-536","3","","0","6","8","","9099145770","","","2020-07-10 18:24:22","0","0","33","1","536"),
("571","1","BALAJI INDUESTRI","34","CUS072020-537","3","","0","6","8","","9879504753","","","2020-07-10 18:30:54","0","0","34","1","537"),
("572","1","BHAVNA CHEMICALS","34","CUS072020-538","3","","2","6","8","","9825006759","","","2020-07-10 18:38:26","0","0","34","1","538"),
("573","1","CADUM ENTERPRISE","34","CUS072020-539","3","","2","6","8","","9974051270","","","2020-07-10 18:41:07","0","0","34","1","539"),
("574","1","CARE WELL PACKAGING INDUSTRIES","34","CUS072020-540","3","","2","6","8","","9825255670","","","2020-07-10 18:44:29","0","0","34","1","540"),
("575","1","ROOT IMMIGRATION","1","CUS072020-541","3","","0","6","3","","9925996789","","","2020-07-10 22:53:09","0","0","1","1","541"),
("576","1","CHIRAG BHAI","27","CUS072020-542","3","","4","6","10","","8980811295","","","2020-07-10 23:03:09","0","0","27","1","542"),
("577","0","V C Gruh Udhyog","27","CUS072020-544","3","","0","6","3","","08128736371","","","2020-07-13 10:26:04","0","0","27","1","544"),
("578","1","HARESH INDUSTRIES","29","CUS072020-545","3","","1","6","0","","9913643441","","","2020-07-13 10:59:40","0","0","29","1","545"),
("579","1","AKSHAY PANASARA","32","CUS072020-546","3","","0","6","0","","9727006585","PANASARAAKSHAY007@GMAIL.COM","","2020-07-13 11:54:49","0","0","32","1","546"),
("580","1","ZYDUS HOSPITALS","32","CUS072020-547","3","","0","6","0","","9016049756","HDTAPODHAN@GMAIL.COM","","2020-07-13 11:58:46","0","0","32","1","547"),
("581","1","SHARDA GLASS AND ALUMINUM","32","CUS072020-548","3","","0","6","0","","9909924761","JANAKPATEL37@YAHOO.COM","","2020-07-13 12:03:39","0","0","32","1","548"),
("582","1","RANJAN SCULPTING STUDIO","32","CUS072020-549","3","","0","3","0","","9327978910","RATHOD.HIREN71625@GMAIL.COM","","2020-07-13 12:15:44","0","0","32","1","549"),
("583","1","GD ENTERPRISE","32","CUS072020-550","3","","0","6","0","","9662226868","DARSHIT.PATEL50@YAHOO.COM","","2020-07-13 12:21:12","0","0","32","1","550"),
("584","1","KINGSTAR ENTERPRISE","32","CUS072020-551","4","","0","6","0","","8490973155","SOHEL.KHOJA.1@GMAIL.COM","","2020-07-13 12:45:49","0","0","32","1","551"),
("585","0","Vira Group","27","CUS072020-551","3","","0","6","3","","255658260296","ras@viragroup.co.tz","","2020-07-13 12:55:24","0","0","27","1","551"),
("586","1","DEVYANI FASHIONS","32","CUS072020-552","3","","0","6","0","","7383801999","DEVYANIFASHION777@GMAIL.COM","","2020-07-13 13:20:24","0","0","32","1","552"),
("587","1","ASV TRADERS","32","CUS072020-553","3","","0","6","0","","9586080856","VIMAL11691@GMAIL.COM","","2020-07-13 13:35:10","0","0","32","1","553"),
("588","1","MARUTI AIR COMPRESSOR","33","CUS072020-555","3","","0","6","8","","9825464263","INFO@MARUTIAIRCOMPRESSOR.COM","","2020-07-13 16:51:03","0","0","33","1","555"),
("589","1","MAKWEL INDUSTRIES ( SAMRAT THRESHER)","27","CUS072020-556","3","","1","5","11","","9879566780","","","2020-07-13 18:44:59","0","0","27","1","556"),
("590","1","SHRI RAM EQUIPMENT FINANCE CO LTD","32","CUS072020-557","3","","0","6","0","","7359326709","SHAIKH_ANISH2812@YAHOO.COM","","2020-07-13 18:50:27","0","0","32","1","557"),
("591","1","MANASIYA ZULFIKAR","32","CUS072020-558","3","","0","6","0","","9998231614","MANASIYAZULFIKARALIR@GMAIL.COM","","2020-07-13 19:03:23","0","0","32","1","558"),
("592","1","HARESH PANCHAL","32","CUS072020-559","3","","0","6","0","","9913643441","HARESH_INDUS74@YAHOO.COM","","2020-07-13 19:06:19","0","0","32","1","559"),
("593","1","KAMAL JHA","32","CUS072020-560","3","","0","6","0","","9825284911","KAMAL1213.KJ@GMAIL.COM","","2020-07-13 19:13:59","0","0","32","1","560"),
("594","1","PARAS TIMBER","32","CUS072020-561","3","","0","6","0","","9879772299","PARASTIMBER2017@GMAIL.COM","","2020-07-13 19:18:33","0","0","32","1","561"),
("595","1","METRO LUBRICANT","32","CUS072020-562","3","","0","6","0","","9328558358","CHIRAGSHAH_665@YAHOO.COM","","2020-07-13 19:21:34","0","0","32","1","562"),
("596","1","GUJARAT STEEL","32","CUS072020-563","3","","0","6","0","","9825555616","PRATIK4U83@GMAIL.COM","","2020-07-13 19:25:31","0","0","32","1","563"),
("597","1","GOLD STAR POWER  LTD","32","CUS072020-564","3","","0","6","0","","8980661766","GOLDSTARBATTERYSHOP01@GMAIL.COM","","2020-07-13 19:28:37","0","0","32","1","564"),
("598","1","DHARMESH JANI","32","CUS072020-565","3","","0","6","0","","9924206734","DHARMESHJANI2005@GMAIL.COM","","2020-07-13 19:32:47","0","0","32","1","565"),
("599","1","SHARMA DARSHAN","32","CUS072020-566","3","","0","6","0","","9978106315","SHARMADARSHAN45@YAHOO.COM","","2020-07-13 19:36:42","0","0","32","1","566"),
("600","1","PRASHANT","32","CUS072020-567","3","","0","6","0","","9479565342","SANANDSUPERMALL@GMAIL.COM","","2020-07-13 19:39:33","0","0","32","1","567");
INSERT INTO tbl_customer VALUES
("601","1","ARTI ENGINEERING WORKS","33","CUS072020-568","3","","1","6","8","","9825569215","JIGAR@ARTIENGINEERINGWORKS.COM","","2020-07-14 12:46:56","0","0","33","1","568"),
("602","1","UMANG PATEL","32","CUS072020-569","3","","0","6","0","","9426680827","PATELUMANG61@GMAIL.COM","","2020-07-14 14:19:47","0","0","32","1","569"),
("603","1","SAURABH SOLANKI","32","CUS072020-570","3","","0","6","0","","9033881894","SAURABHSOLANKI268@GMAIL.COM","","2020-07-14 14:23:24","0","0","32","1","570"),
("604","1","MANSUR VORHA","32","CUS072020-571","3","","0","6","0","","9974171404","MANSURVOHRA1977@GMAIL.COM","","2020-07-14 14:31:09","0","0","32","1","571"),
("605","1","S S SERVICE","32","CUS072020-572","3","","0","6","0","","9879674949","SARFRAZMZAWAR@GMAIL.COM","","2020-07-14 14:38:51","0","0","32","1","573"),
("606","1","PARTH PACKGING ","32","CUS072020-574","3","","0","6","0","","9638640009","JIGNESHCHAUHAN22595@MAIL.COM","","2020-07-14 14:45:54","0","0","32","1","574"),
("607","1","ARVINDA ENTERPRISE","32","CUS072020-575","3","","0","6","0","","9825879226","ARVINDAENTERPRISE6594@GMAIL.COM","","2020-07-14 14:51:33","0","0","32","1","575"),
("608","1","KUSHAL VALECHHA","32","CUS072020-576","3","","0","6","0","","9904257426","KUSH.PJL@GMAIL.COM","","2020-07-14 14:55:21","0","0","32","1","576"),
("609","1","SHREE RANG LOGISTICS PVT LTD","32","CUS072020-577","3","","0","6","0","","9824090608","JIGNESH@SRLOGS.COM","","2020-07-14 14:58:38","0","0","32","1","577"),
("610","1","THE PLY HUB","32","CUS072020-578","3","","0","6","0","","9016313248","SHAH_ABHISHEK187@YAHOO.COM","","2020-07-14 15:01:24","0","0","32","1","578"),
("611","1","ANIKET","32","CUS072020-579","3","","0","6","0","","8849562295","ANIKET.KITKET13@GMAIL.COM","","2020-07-14 15:48:45","0","0","32","1","579"),
("612","1","CHIRAG PATEL","32","CUS072020-580","3","","0","6","0","","9726369063","PATELCHIRAG8000@GMAIL.COM","","2020-07-14 15:53:58","0","0","32","1","580"),
("613","1","PARTH ENTERPRISE","28","CUS072020-581","3","","1","5","2","","9428100517","","","2020-07-14 16:15:16","0","0","28","1","581");




CREATE TABLE `tbl_customer_category` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(100) NOT NULL,
  `cc_status` int(11) NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO tbl_customer_category VALUES
("1","AMC","0"),
("2","Consultant / Trader","0"),
("3","End Customer","0"),
("4","EPC","0"),
("5","Individual","0"),
("6","Vendor","0");




CREATE TABLE `tbl_customer_industry` (
  `ci_id` int(11) NOT NULL AUTO_INCREMENT,
  `ci_name` varchar(100) NOT NULL,
  `ci_status` int(11) NOT NULL,
  PRIMARY KEY (`ci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO tbl_customer_industry VALUES
("1","ENGINEEIRNG","0"),
("2","CHEMICAL","0"),
("3","FURNITURE","0"),
("4","ELECTRICAL","0");




CREATE TABLE `tbl_customer_type` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(100) NOT NULL,
  `ct_status` int(11) NOT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO tbl_customer_type VALUES
("1","Adult","0"),
("2","Dealer","0"),
("3","Existing Customer","0"),
("4","Existing Partner","0"),
("5","Manufacturer","0"),
("6","New Customer","0");




CREATE TABLE `tbl_db_backup` (
  `dbbkpid` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`dbbkpid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;


INSERT INTO tbl_db_backup VALUES
("1","2020-06-18 17:39:16","5","metr_crm_new___(18-06-2020 17)__rand.sql"),
("2","2020-06-18 19:20:48","5","metr_crm_new___(18-06-2020 19)__rand.sql"),
("3","2020-06-18 19:21:21","5","metr_crm_new___(18-06-2020 19)__rand.sql"),
("4","2020-06-19 14:34:54","5","metr_crm_new___(19-06-2020 14)__rand.sql"),
("5","2020-06-19 14:39:26","5","metr_crm_new___(19-06-2020 14)__rand.sql"),
("6","2020-06-19 14:54:06","5","metr_crm_new___(19-06-2020 14)__rand.sql"),
("7","2020-06-19 15:22:22","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("8","2020-06-19 15:22:27","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("9","2020-06-19 15:23:33","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("10","2020-06-19 15:25:23","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("11","2020-06-19 15:30:20","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("12","2020-06-19 15:44:04","5","bizaccou_bds_crm___(19-06-2020 15)__rand.sql"),
("13","2020-06-23 16:40:06","5","bizaccou_bds_crm___(23-06-2020 16)__rand.sql"),
("14","2020-06-26 14:48:10","5","bizaccou_bds_crm___(26-06-2020 14)__rand.sql"),
("15","2020-06-26 14:48:15","5","bizaccou_bds_crm___(26-06-2020 14)__rand.sql"),
("16","2020-06-27 12:01:11","5","bizaccou_bds_crm___(27-06-2020 12)__rand.sql"),
("17","2020-06-27 12:01:15","5","bizaccou_bds_crm___(27-06-2020 12)__rand.sql"),
("18","2020-06-27 15:26:19","5","bizaccou_bds_crm___(27-06-2020 15)__rand.sql"),
("19","2020-06-27 15:26:22","5","bizaccou_bds_crm___(27-06-2020 15)__rand.sql"),
("20","2020-06-27 15:32:09","5","bizaccou_bds_crm___(27-06-2020 15)__rand.sql"),
("21","2020-06-30 11:12:34","5","bizaccou_bds_crm___(30-06-2020 11)__rand.sql"),
("22","2020-07-01 14:06:41","5","bizaccou_bds_crm___(01-07-2020 14)__rand.sql"),
("23","2020-07-03 15:14:30","5","bizaccou_bds_crm___(03-07-2020 15)__rand.sql"),
("24","2020-07-04 16:58:16","5","bizaccou_bds_crm___(04-07-2020 16)__rand.sql"),
("25","2020-07-06 11:31:47","5","bizaccou_bds_crm___(06-07-2020 11)__rand.sql"),
("26","2020-07-06 11:38:42","5","bizaccou_bds_crm___(06-07-2020 11)__rand.sql"),
("27","2020-07-06 11:46:19","5","bizaccou_bds_crm___(06-07-2020 11)__rand.sql"),
("28","2020-07-06 15:56:45","5","bizaccou_bds_crm___(06-07-2020 15)__rand.sql"),
("29","2020-07-06 15:57:51","5","bizaccou_bds_crm___(06-07-2020 15)__rand.sql"),
("30","2020-07-06 15:58:21","5","bizaccou_bds_crm___(06-07-2020 15)__rand.sql"),
("31","2020-07-06 18:25:51","5","bizaccou_bds_crm___(06-07-2020 18)__rand.sql"),
("32","2020-07-07 15:43:34","5","bizaccou_bds_crm___(07-07-2020 15)__rand.sql"),
("33","2020-07-07 15:43:53","5","bizaccou_bds_crm___(07-07-2020 15)__rand.sql"),
("34","2020-07-08 16:42:06","5","bizaccou_bds_crm___(08-07-2020 16)__rand.sql"),
("35","2020-07-08 17:43:30","5","bizaccou_bds_crm___(08-07-2020 17)__rand.sql"),
("36","2020-07-08 17:46:12","5","bizaccou_bds_crm___(08-07-2020 17)__rand.sql"),
("37","2020-07-09 11:27:26","5","bizaccou_bds_crm___(09-07-2020 11)__rand.sql"),
("38","2020-07-09 11:38:41","5","bizaccou_bds_crm___(09-07-2020 11)__rand.sql"),
("39","2020-07-09 11:39:47","5","bizaccou_bds_crm___(09-07-2020 11)__rand.sql"),
("40","2020-07-09 11:41:42","5","bizaccou_bds_crm___(09-07-2020 11)__rand.sql"),
("41","2020-07-09 11:53:51","5","bizaccou_bds_crm___(09-07-2020 11)__rand.sql"),
("42","2020-07-09 12:23:58","5","bizaccou_bds_crm___(09-07-2020 12)__rand.sql"),
("43","2020-07-09 13:46:48","5","bizaccou_bds_crm___(09-07-2020 13)__rand.sql"),
("44","2020-07-10 12:38:35","5","bizaccou_bds_crm___(10-07-2020 12)__rand.sql"),
("45","2020-07-10 12:39:08","5","bizaccou_bds_crm___(10-07-2020 12)__rand.sql"),
("46","2020-07-10 12:47:26","5","bizaccou_bds_crm___(10-07-2020 12)__rand.sql"),
("47","2020-07-10 18:14:29","5","bizaccou_bds_crm___(10-07-2020 18)__rand.sql"),
("48","2020-07-10 18:28:28","5","bizaccou_bds_crm___(10-07-2020 18)__rand.sql"),
("49","2020-07-10 20:14:55","5","bizaccou_bds_crm___(10-07-2020 20)__rand.sql"),
("50","2020-07-11 16:31:50","5","bizaccou_bds_crm___(11-07-2020 16)__rand.sql"),
("51","2020-07-11 17:27:56","5","bizaccou_bds_crm___(11-07-2020 17)__rand.sql"),
("52","2020-07-12 12:29:51","5","bizaccou_bds_crm___(12-07-2020 12)__rand.sql"),
("53","2020-07-13 17:10:00","5","bizaccou_bds_crm___(13-07-2020 17)__rand.sql"),
("54","2020-07-13 18:42:12","5","bizaccou_bds_crm___(13-07-2020 18)__rand.sql"),
("55","2020-07-13 18:49:40","5","bizaccou_bds_crm___(13-07-2020 18)__rand.sql"),
("56","2020-07-14 14:23:41","5","bizaccou_bds_crm___(14-07-2020 14)__rand.sql");




CREATE TABLE `tbl_f_byuser_ter_trn` (
  `f_ter_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `ref_user_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `ter_target_amt` double(10,2) NOT NULL,
  `ter_target_qty` double(10,2) NOT NULL,
  `f_ter_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_ter_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_f_byuser_user_trn` (
  `f_user_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usr_target_amt` double(10,2) NOT NULL,
  `usr_target_qty` double(10,2) NOT NULL,
  `f_user_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_user_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_f_grp_trn` (
  `f_grp_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `pg_id` int(11) NOT NULL,
  `grp_target_amt` double(10,2) NOT NULL,
  `grp_target_qty` double(10,2) NOT NULL,
  `f_grp_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`f_grp_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO tbl_f_grp_trn VALUES
("7","1","21","800000.00","20.00","0","1"),
("8","1","30","800000.00","60.00","0","1"),
("9","1","31","500000.00","2.00","0","1"),
("10","1","32","600000.00","80.00","0","1");




CREATE TABLE `tbl_f_ter_trn` (
  `f_ter_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `ter_target_amt` double(10,2) NOT NULL,
  `ter_target_qty` double(10,2) NOT NULL,
  `f_ter_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`f_ter_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_f_user_trn` (
  `f_user_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usr_target_amt` double(10,2) NOT NULL,
  `usr_target_qty` double(10,2) NOT NULL,
  `f_user_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_user_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_f_user_trn VALUES
("8","1","27","500000.00","2.00","0","1"),
("9","1","28","800000.00","60.00","0","1"),
("10","1","29","800000.00","20.00","0","1"),
("11","1","35","600000.00","80.00","0","1");




CREATE TABLE `tbl_followup` (
  `flp_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `task_flp_remark` longtext NOT NULL,
  `flp_date` datetime NOT NULL,
  `flp_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`flp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_followup VALUES
("1","1","CAll for meeting ","2019-11-18 15:24:38","0","2019-11-18 15:24:38","1","1"),
("2","30","I have call party Will do in the eveing ","2020-02-27 19:12:47","0","2020-02-27 19:12:47","1","1"),
("3","58","Mail done, waiting for confirmation mail.","2020-06-06 13:02:58","0","2020-06-06 13:02:58","10","1"),
("4","1","Today i will visit client and try to close the deal","2020-06-24 12:53:48","0","2020-06-24 12:53:48","29","1"),
("5","5","sir me call kary but ae mane na pade che\n","2020-06-26 10:48:26","0","2020-06-26 10:48:26","29","1"),
("6","14","15 DATE PACHI KIDHU CHE","2020-07-06 12:26:07","0","2020-07-06 12:26:07","28","1"),
("7","14","OFFICE PAR REHTA NATHI ATLE ONLINE DEMO AAPVANO CHE CALL BACK KARSE","2020-07-06 12:27:23","0","2020-07-06 12:27:23","28","1"),
("8","65","Not requirement any software.","2020-07-07 11:48:58","0","2020-07-07 11:48:58","29","1"),
("9","131","call back aapse","2020-07-09 10:47:58","0","2020-07-09 10:47:58","28","1"),
("10","118","amna sun jode vat karavse","2020-07-09 10:51:17","0","2020-07-09 10:51:17","28","1"),
("11","106","Call for demo","2020-07-10 11:48:23","0","2020-07-10 11:48:23","32","1");




CREATE TABLE `tbl_forecast` (
  `forecast_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL,
  `f_by_id` int(11) NOT NULL,
  `f_year` varchar(400) NOT NULL,
  `f_target_period` int(11) NOT NULL,
  `f_period_id` int(11) NOT NULL,
  `f_target_amt` double(10,2) NOT NULL,
  `f_target_qty` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forecast_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`forecast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_forecast VALUES
("1","0","2","2020","1","23","20000000.00","90.00","2020-06-26 14:46:57","0","1","1");




CREATE TABLE `tbl_forecast_byuser` (
  `forecast_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL,
  `f_by_id` int(11) NOT NULL,
  `f_year` varchar(400) NOT NULL,
  `f_target_period` int(11) NOT NULL,
  `f_period_id` int(11) NOT NULL,
  `f_target_amt` double(10,2) NOT NULL,
  `f_target_qty` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forecast_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`forecast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_grn` (
  `grn_id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_no` varchar(400) NOT NULL,
  `grn_date` date NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `ref_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `purchaseorder_id` int(11) NOT NULL,
  `remark` mediumtext NOT NULL,
  `grn_file` varchar(400) NOT NULL,
  `grn_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`grn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


INSERT INTO tbl_grn VALUES
("1","GRN/002/19-20","2020-01-24","","1970-01-01","37","6","","","0","2020-01-24 12:13:35","1","1"),
("2","GRN/003/19-20","2020-01-26","123","1970-01-01","38","8","Material is found as per PO ","","0","2020-01-26 19:49:43","1","1"),
("3","GRN/004/19-20","2020-02-01","","1970-01-01","156","10","Done","","0","2020-02-01 14:40:48","1","1"),
("4","GRN/005/19-20","2020-02-01","","1970-01-01","156","11","Done","","0","2020-02-01 14:40:40","1","1"),
("5","GRN/006/19-20","2020-02-22","","1970-01-01","156","20","Hari Suppliers","","0","2020-03-16 10:35:02","1","1"),
("6","GRN/007/19-20","2020-03-09","","1970-01-01","38","18","1000 Vishal Parekh\n1000 Pradeep Karmur","","0","2020-03-16 10:27:43","1","1"),
("7","GRN/008/19-20","2020-03-16","","1970-01-01","162","22","Training Completed","","0","2020-03-16 10:32:00","1","1"),
("8","GRN/002/20-21","2020-06-12","","1970-01-01","30","30","","","0","2020-06-12 13:54:41","21","1"),
("9","GRN/003/20-21","2020-06-12","","1970-01-01","156","32","done","","0","2020-06-12 13:59:09","24","1");




CREATE TABLE `tbl_grn_trn` (
  `grn_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `pro_entry_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `grn_id` int(11) NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `sqr_ft` double(12,2) NOT NULL,
  `product_hsn_code` varchar(200) NOT NULL,
  `pro_mfg_date` date NOT NULL,
  `pro_exp_date` date NOT NULL,
  `product_des` text NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_disc` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_landing_price` int(11) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(200) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(200) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(200) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `grn_trn_status` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`grn_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_group` (
  `g_id` int(10) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(255) NOT NULL,
  `g_pid` int(10) NOT NULL,
  `g_open_balance` int(10) NOT NULL,
  `g_status` int(10) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;


INSERT INTO tbl_group VALUES
("12","BRANCH / DIVISIONS","0","0","0","2019-07-26 17:16:20","1","1"),
("13","CAPITAL ACCOUNT","0","0","0","2019-07-26 17:16:31","1","1"),
("14","CURRENT ASSETS","0","0","0","2019-07-26 17:16:42","1","1"),
("15","CURRENT LIABILITIES","0","0","0","2019-07-26 17:16:51","1","1"),
("16","DIRECT EXPENSES","0","0","0","2019-07-26 17:17:01","1","1"),
("17","DIRECT INCOMES","0","0","0","2019-07-26 17:17:08","1","1"),
("18","FIXED ASSETS","0","0","0","2019-07-26 17:17:14","1","1"),
("19","INDIRECT EXPENSES ","0","0","0","2019-07-26 17:17:21","1","1"),
("20","INDIRECT INCOMES ","0","0","0","2019-07-26 17:17:27","1","1"),
("21","INVESTMENTS","0","0","0","2019-07-26 17:17:34","1","1"),
("22","LOANS (LIABILITY)","0","0","0","2019-07-26 17:17:40","1","1"),
("23","MISC. EXPENSES (ASSET)","0","0","0","2019-07-26 17:17:47","1","1"),
("24","PURCHASE ACCOUNTS","0","0","0","2019-07-26 17:17:55","1","1"),
("25","SALES ACCOUNTS","0","0","0","2019-07-26 17:18:02","1","1"),
("26","SUSPENSE A/C","0","0","0","2019-07-26 17:18:09","1","1"),
("27","BANK ACCOUNTS","14","0","0","2019-07-26 17:19:13","1","1"),
("28","BANK OD A/C","22","0","0","2019-07-26 17:19:26","1","1"),
("29","CASH-IN-HAND","14","0","0","2019-07-26 17:19:36","1","1"),
("30","DEPOSITS (ASSET)","14","0","0","2019-07-26 17:19:49","1","1"),
("31","DUTIES & TAXES ","15","0","0","2019-07-26 17:19:56","1","1"),
("32","LOANS & ADVANCES (ASSET)","14","0","0","2019-07-26 17:20:07","1","1"),
("33","PROVISIONS","15","0","0","2019-07-26 17:20:17","1","1"),
("34","RESERVES & SURPLUS","13","0","0","2019-07-26 17:20:28","1","1"),
("35","SECURED LOANS","22","0","0","2019-07-26 17:20:37","1","1"),
("36","STOCK-IN-HAND","14","0","0","2019-07-26 17:20:50","1","1"),
("37","SUNDRY CREDITORS","15","0","0","2019-07-26 17:21:20","1","1"),
("38","SUNDRY DEBTORS","14","0","0","2019-07-26 17:21:28","1","1"),
("39","UNSECURED LOANS","22","0","0","2019-07-26 17:21:37","1","1"),
("40","DEMO S GROUP","19","80000","2","2019-07-30 14:32:34","1","1"),
("41","SDFSDF","13","0","0","2019-08-01 19:32:00","1","1"),
("42","SAD","0","0","0","2019-08-01 19:37:36","1","1"),
("43","ASD","13","0","0","2019-08-01 19:37:49","1","1");




CREATE TABLE `tbl_inq_attach` (
  `inq_attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `inq_attch_doc_name` varchar(400) NOT NULL,
  `inq_attch_file` varchar(400) NOT NULL,
  `inq_attach_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inq_attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_inq_notes` (
  `inq_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `inq_note_title` varchar(400) NOT NULL,
  `inq_note_desc` longtext NOT NULL,
  `inq_note_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inq_note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


INSERT INTO tbl_inq_notes VALUES
("1","10","Follow up for detail ","Detail Received ","0","1","1"),
("2","203","Inquiry for EC","they will provide physiscal file of thair componies data sheet next week call them on monday","0","21","1");




CREATE TABLE `tbl_inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_no` varchar(400) NOT NULL,
  `assign_user_inq_ids` varchar(100) NOT NULL,
  `inquiry_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `c_con_id` int(11) NOT NULL,
  `inquiry_name` varchar(400) NOT NULL,
  `closing_date` date NOT NULL,
  `t_id` int(11) NOT NULL,
  `opp_id` int(11) NOT NULL,
  `stage_prob` double NOT NULL,
  `sales_stage_id` int(11) NOT NULL,
  `inquiry_type_id` int(11) NOT NULL,
  `rb_id` int(11) NOT NULL,
  `inquiry_cat_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `g_total` double(10,2) NOT NULL,
  `inq_desc` longtext NOT NULL,
  `inq_comp_desc` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inquiry_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=latin1;


INSERT INTO tbl_inquiry VALUES
("1","INQ/19-20/015","1","2020-06-24","1","1","@PARTH ENGINEERING CO.","2020-06-30","17","12","0","7","8","3","10","68","32000.00","","","2020-06-24 12:49:57","2020-07-10 14:50:31","2020-06-24 12:49:57","0","1","1"),
("2","INQ/19-20/016","1,29","2020-06-26","1","1","CRM@PARTH ENGINEERING CO.","2020-06-30","17","5","10","4","9","4","0","68","35000.00","","","2020-06-26 10:36:41","2020-06-26 10:36:41","2020-06-26 10:36:41","0","1","1"),
("3","INQ/19-20/017","28","2020-06-29","15","15","crm @KRISH ENGINEERING ","1970-01-01","17","5","10","6","9","2","11","68","60000.00","","","2020-06-29 13:29:07","2020-06-29 13:30:50","2020-06-29 13:29:07","0","28","1"),
("4","INQ/19-20/018","28","2020-06-29","14","14","CRM @APEX ELECRICALS","1970-01-01","17","5","10","6","9","2","10","68","40000.00","","","2020-06-29 13:34:33","2020-06-29 13:34:33","2020-06-29 13:34:33","0","28","1"),
("5","INQ/19-20/019","28","2020-06-29","16","16","CRM@NEELAM INDUSTRIES","1970-01-01","17","5","10","5","9","2","11","68","40000.00","","","2020-06-29 13:38:33","2020-06-29 13:38:33","2020-06-29 13:38:33","0","28","1"),
("6","INQ/19-20/020","28","2020-06-29","22","23","BILLING STOCK@SAHYOG ENGINEERING","1970-01-01","17","5","10","6","9","2","11","68","18000.00","","","2020-06-29 13:46:30","2020-06-29 13:48:36","2020-06-29 13:46:30","0","28","1"),
("7","INQ/19-20/021","28","2020-06-29","17","17","CRM@GANGOTRI INORGANIC LTD","1970-01-01","17","11","90","4","9","2","12","68","60000.00","","","2020-06-29 13:51:15","2020-07-09 10:49:24","2020-06-29 13:51:15","0","28","1"),
("8","INQ/19-20/022","1,28","2020-06-29","21","21","BILLING@SWASTIK REFRIGENATION","1970-01-01","17","9","50","4","9","2","11","68","14500.00","","","2020-06-29 13:53:13","2020-07-09 10:49:04","2020-06-29 13:53:13","0","28","1"),
("9","INQ/19-20/023","28","2020-06-29","23","22","BILLING STOCK@PARTH PUMP INDIA","1970-01-01","17","5","10","6","9","2","11","68","20000.00","","","2020-06-29 13:55:24","2020-06-29 13:55:24","2020-06-29 13:55:24","0","28","1"),
("10","INQ/19-20/024","28","2020-06-29","18","18","CRM@KHUSH VEER PHARMA MACHINE","1970-01-01","17","5","10","6","9","2","11","68","40000.00","","","2020-06-29 13:59:06","2020-06-29 13:59:06","2020-06-29 13:59:06","0","28","1"),
("11","INQ/19-20/025","28","2020-06-29","19","19","BILLING CRM@NAVDURGA ENGINEERING","1970-01-01","17","5","10","5","9","2","11","68","40000.00","","","2020-06-29 14:15:10","2020-06-29 14:15:10","2020-06-29 14:15:10","0","28","1"),
("12","INQ/19-20/026","28","2020-06-29","20","20","BILLING@B J  ENGINEERING","1970-01-01","17","5","10","6","9","2","10","68","12000.00","","","2020-06-29 14:18:05","2020-06-29 14:18:05","2020-06-29 14:18:05","0","28","1"),
("13","INQ/19-20/027","28","2020-06-30","24","0","BILLING@Vishwa Machinery And Processing Private Limited","1970-01-01","17","5","10","5","9","2","11","68","14500.00","5 DATE PACHI CALL BACK KARVANO\n\n","","2020-06-30 13:05:37","2020-06-30 13:05:37","2020-06-30 13:05:37","0","28","1"),
("14","INQ/19-20/028","28","2020-06-30","25","24","CRM@AMI COOLING SYSTEM","1970-01-01","17","5","10","6","9","2","11","68","40000.00","CRM LINK SENT","","2020-06-30 13:10:39","2020-06-30 13:10:39","2020-06-30 13:10:39","0","28","1"),
("15","INQ/19-20/029","1,28","2020-06-30","26","25","BILLING@Shivam Engineering","1970-01-01","17","5","0","0","0","0","0","68","0.00","","","2020-06-30 13:15:12","2020-06-30 13:15:12","2020-06-30 13:15:12","0","28","1"),
("16","INQ/19-20/030","1,28","2020-06-30","27","26","BILLING CRM@Shriraj Engineers & Consultants","1970-01-01","17","5","0","0","0","0","0","68","0.00","","","2020-06-30 13:21:46","2020-06-30 13:21:46","2020-06-30 13:21:46","0","28","1"),
("17","INQ/19-20/031","28","2020-06-30","28","27","BILLING@Krishna Plast","1970-01-01","17","5","10","4","9","2","11","68","12000.00","BILLING MATE MEET KARVANI CHE","","2020-06-30 13:31:44","2020-06-30 13:31:44","2020-06-30 13:31:44","0","28","1"),
("18","INQ/19-20/032","28","2020-06-30","29","28","BILLING@Ketan Plast Industrus","1970-01-01","17","5","10","5","9","2","11","68","12000.00","NEXT WEEK MA MEET KARVANI","","2020-06-30 13:39:49","2020-06-30 13:39:49","2020-06-30 13:39:49","0","28","1"),
("19","INQ/19-20/033","28","2020-06-30","30","29","BILLING@VISHAL INDUSTRIAL LINING","1970-01-01","17","5","10","5","9","2","11","68","0.00","MESG REMDER SYSTEM","","2020-06-30 13:44:53","2020-06-30 13:44:53","2020-06-30 13:44:53","0","28","1"),
("20","INQ/19-20/034","28","2020-06-30","31","30","BILLING@KHODIYAR PLASTIC","1970-01-01","17","12","0","6","9","2","11","68","0.00","NEXT WEEK MA 15 PACHI CALL BACK AAPVANO\n\n","","2020-06-30 14:05:34","2020-07-13 16:16:07","2020-06-30 14:05:34","0","28","1"),
("21","INQ/19-20/035","28","2020-06-30","32","31","BILLING@TECHRIDER TECHNOLOGIES","1970-01-01","17","11","90","4","9","2","11","68","0.00","","","2020-06-30 17:10:02","2020-07-09 10:48:25","2020-06-30 17:10:02","0","28","1"),
("22","INQ/19-20/036","1,28","2020-06-30","33","32","BILLING@HITECH ELECTRONICS","1970-01-01","17","5","10","5","9","2","10","68","0.00","","","2020-06-30 17:14:53","2020-06-30 17:14:53","2020-06-30 17:14:53","0","28","1"),
("23","INQ/19-20/037","28","2020-06-30","34","33","BILLING@PARFECT ROTOMOULD INDIA","1970-01-01","17","9","50","4","9","2","0","68","0.00","","","2020-06-30 17:19:53","2020-07-09 10:47:29","2020-06-30 17:19:53","0","28","1"),
("24","INQ/19-20/038","1,28","2020-06-30","35","34","QOT@0CEN EXTENSION PVT LTD","1970-01-01","17","5","10","6","9","2","11","68","0.00","","","2020-06-30 17:29:04","2020-06-30 17:29:04","2020-06-30 17:29:04","0","28","1"),
("25","INQ/19-20/039","1,28","2020-06-30","36","35","BILLING@JAY ENGINEERING WORKS","1970-01-01","0","9","50","4","9","2","0","68","0.00","","","2020-06-30 17:39:50","2020-07-09 10:47:56","2020-06-30 17:39:50","0","28","1"),
("26","INQ/19-20/040","28","2020-06-30","37","36","BILLING@SURYA CONSTRUCTION ENGINEERING ","1970-01-01","17","5","10","5","9","2","11","68","0.00","BILLING DATA\n","","2020-06-30 18:01:06","2020-07-08 12:14:50","2020-06-30 18:01:06","0","28","1"),
("27","INQ/19-20/041","29","2020-07-01","2","2","CRM@UNITECH SYSTEMS","1970-01-01","17","9","50","6","9","7","11","68","35000.00","Emne CRM software ni inquiry kari hati but meeting no time nathi aapyo","","2020-07-01 10:10:45","2020-07-10 14:22:54","2020-07-01 10:10:45","0","29","1"),
("28","INQ/19-20/042","29","2020-07-01","3","3","Billing360 @METRO LUBRICANT","1970-01-01","17","5","10","6","9","7","11","68","10000.00","Meeting kari lidhi che emne te same thi call karse .","","2020-07-01 10:37:33","2020-07-01 10:37:33","2020-07-01 10:37:33","0","29","1"),
("29","INQ/19-20/043","29","2020-07-01","4","4","Billing360 @KINGS FURNISHINGS &MATTRASES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","Emne demo link send kari api hati and emne call pan karya hata but emne call  na answer nathi aapya.","","2020-07-01 10:40:43","2020-07-01 10:40:43","2020-07-01 10:40:43","0","29","1"),
("30","INQ/19-20/044","1,28","2020-07-01","38","0","BILLING@INDOTECH ENGINEERING","1970-01-01","17","5","0","0","0","0","0","68","0.00","","","2020-07-01 10:42:10","2020-07-01 10:42:10","2020-07-01 10:42:10","0","28","1"),
("31","INQ/19-20/045","1,28","2020-07-01","40","0","BILLING@WRS SAFE LIFTING WIRE ROPE SLING","1970-01-01","17","5","10","0","0","0","0","68","0.00","","","2020-07-01 10:44:16","2020-07-01 10:49:30","2020-07-01 10:44:16","0","28","1"),
("32","INQ/19-20/046","29","2020-07-01","39","37","CRM @SHRI RAJ CORPORATION","1970-01-01","17","11","80","4","9","3","12","68","40000.00","Emni sathe meeting  Kari lidhi emne Payment terms ma problem che. to pan aje final call karva no che.","","2020-07-01 10:45:29","2020-07-01 10:45:29","2020-07-01 10:45:29","0","29","1"),
("33","INQ/19-20/047","28","2020-07-01","41","0","BILLING@BHUMI ENGINERRING","1970-01-01","17","5","10","6","9","2","10","68","0.00","","","2020-07-01 10:48:53","2020-07-01 10:49:15","2020-07-01 10:48:53","0","28","1"),
("34","INQ/19-20/048","29","2020-07-01","42","38","Billing360 @JIGNESH BHAI","1970-01-01","17","5","10","6","9","3","10","68","14000.00","Te New Startup kare che to ena mate inquiry kari hati GST No. ave pachi  FInal kara nu che.","","2020-07-01 10:54:27","2020-07-01 10:54:27","2020-07-01 10:54:27","0","29","1"),
("35","INQ/19-20/049","28","2020-07-01","43","0","EXPRT BILLING@AMBICA BOILERS","1970-01-01","17","5","10","6","9","2","11","68","0.00","export invoice ","","2020-07-01 11:03:14","2020-07-01 11:04:16","2020-07-01 11:03:14","0","28","1"),
("36","INQ/19-20/050","29","2020-07-01","45","39","CRM @VISHWACON ENGINEERS","1970-01-01","17","5","10","6","9","3","11","68","35000.00","Te Demo Joyi ne Call karse.","","2020-07-01 12:13:48","2020-07-01 12:13:48","2020-07-01 12:13:48","0","29","1"),
("37","INQ/19-20/051","29","2020-07-01","46","40","Billing360@ASHOK BHAI","1970-01-01","17","5","10","4","9","3","11","68","9000.00","Month Na end ma kahyu hatu final karva mate nu bcz payment no problem hato.","","2020-07-01 12:26:16","2020-07-01 12:26:16","2020-07-01 12:26:16","0","29","1"),
("38","INQ/19-20/052","29","2020-07-01","47","41","Billing360 @SHIV SHAKTI INDUSTRIES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","Demo send kari apyo hato te same thi call karse.","Demo send kari apyo hato te same thi call karse.","2020-07-01 12:29:18","2020-07-01 12:29:18","2020-07-01 12:29:18","2","29","1"),
("39","INQ/19-20/053","29","2020-07-01","48","42","Billing360@PURA-SYS PHARMA","1970-01-01","17","11","80","4","9","3","11","68","10000.00","Emna mother ne hospital ma admit karya hata etle te month na starting ma final karse","","2020-07-01 12:39:01","2020-07-01 12:46:28","2020-07-01 12:39:01","0","29","1"),
("40","INQ/19-20/054","29","2020-07-01","49","43","Billing360 @SHIV ELECTRICAL","1970-01-01","17","5","10","6","9","3","11","68","10000.00","Emne Meeting mate malva java nu hatu. but te out of city hata etle possible na thayu","","2020-07-01 12:45:56","2020-07-01 12:46:55","2020-07-01 12:45:56","0","29","1"),
("41","INQ/19-20/055","29","2020-07-01","50","44","Billing360 @ANNAPURNA ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 12:51:36","2020-07-01 12:51:36","2020-07-01 12:51:36","0","29","1"),
("42","INQ/19-20/056","29","2020-07-01","51","45","Billing360 @PAL PRINCE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","Call not answering","","2020-07-01 12:54:37","2020-07-01 12:54:37","2020-07-01 12:54:37","0","29","1"),
("43","INQ/19-20/057","29","2020-07-01","52","46","Billing360 @DEVYANI FASHION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 12:57:52","2020-07-01 12:58:31","2020-07-01 12:57:52","0","29","1"),
("44","INQ/19-20/058","29","2020-07-01","53","47","Billing360 @SAI CONSTRUCTION","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-01 13:03:51","2020-07-01 13:03:51","2020-07-01 13:03:51","0","29","1"),
("45","INQ/19-20/059","29","2020-07-01","55","48","Billing360@SHREEUMIYA BOOKSTORES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:16:32","2020-07-01 14:16:32","2020-07-01 14:16:32","0","29","1"),
("46","INQ/19-20/060","29","2020-07-01","57","49","Billing360 @LYON REMEDIES PRIVATE LIMITED","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:19:26","2020-07-01 14:19:26","2020-07-01 14:19:26","0","29","1"),
("47","INQ/19-20/061","29","2020-07-01","58","50","Billing360 @KRISHNA TECHNOLOGY","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-01 14:22:26","2020-07-01 14:22:26","2020-07-01 14:22:26","0","29","1"),
("48","INQ/19-20/062","29","2020-07-01","59","51","Billing360 @ARPIT NISARTA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:27:25","2020-07-01 14:27:25","2020-07-01 14:27:25","0","29","1"),
("49","INQ/19-20/063","29","2020-07-01","60","52","Billing360 @APAR INDUSTRIES","1970-01-01","17","5","10","5","9","7","11","68","10000.00","Allready Tally Che j emne inquiry kari hati demo api didho che.","","2020-07-01 14:31:19","2020-07-01 14:31:19","2020-07-01 14:31:19","0","29","1"),
("50","INQ/19-20/064","29","2020-07-01","61","53","Billing360 @GANPATSINGH RAJPUT","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:35:01","2020-07-01 14:35:01","2020-07-01 14:35:01","0","29","1"),
("51","INQ/19-20/065","29","2020-07-01","63","54","Billing360@FIROZ SELECTION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:37:18","2020-07-01 14:37:18","2020-07-01 14:37:18","0","29","1"),
("52","INQ/19-20/066","29","2020-07-01","64","55","Billing360 @PATEL RUBBERS","1970-01-01","0","5","10","0","9","7","10","68","10000.00","","","2020-07-01 14:39:33","2020-07-01 14:40:07","2020-07-01 14:39:33","0","29","1"),
("53","INQ/19-20/067","29","2020-07-01","66","56","Billing360 @PARTH ELECTRONIC","1970-01-01","0","5","10","6","9","7","10","68","10000.00","Te New startup Kare che ena mate software joy che.","","2020-07-01 14:50:11","2020-07-01 14:50:11","2020-07-01 14:50:11","0","29","1"),
("54","INQ/19-20/068","29","2020-07-01","67","57","Billing360 @INDO SPORTS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:52:44","2020-07-01 14:52:44","2020-07-01 14:52:44","0","29","1"),
("55","INQ/19-20/069","29","2020-07-01","70","58","Billing360 @LALIT SHAH","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:54:53","2020-07-01 14:54:53","2020-07-01 14:54:53","0","29","1"),
("56","INQ/19-20/070","29","2020-07-01","71","59","Billing360@KAVYMEDICAL AGENCY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:57:16","2020-07-01 14:57:16","2020-07-01 14:57:16","0","29","1"),
("57","INQ/19-20/071","29","2020-07-01","72","60","@ANGEL BRANDING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 14:59:49","2020-07-01 14:59:49","2020-07-01 14:59:49","0","29","1"),
("58","INQ/19-20/072","29","2020-07-01","73","61","Billing360 @ELECTRONIC SALES AND SERVICES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 15:02:20","2020-07-01 15:02:20","2020-07-01 15:02:20","0","29","1"),
("59","INQ/19-20/073","29","2020-07-01","74","62","@HITEN PATEL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-01 15:05:10","2020-07-01 15:05:10","2020-07-01 15:05:10","0","29","1"),
("60","INQ/19-20/074","29","2020-07-01","75","63","Billing360 @YASH AGRI MART","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-01 15:09:14","2020-07-01 15:09:14","2020-07-01 15:09:14","0","29","1"),
("61","INQ/19-20/075","28","2020-07-01","83","0","CRM@ADON CHEMICAL","1970-01-01","17","5","10","6","9","2","11","68","35000.00","","","2020-07-01 16:18:35","2020-07-01 16:18:35","2020-07-01 16:18:35","0","28","1"),
("62","INQ/19-20/076","28","2020-07-01","84","0","WEB BILLING@KRISHNA ENTERPRISE","1970-01-01","17","5","10","6","9","2","11","68","12000.00","BILLING ND WEB LEAD\n\n","","2020-07-01 16:30:34","2020-07-01 16:30:34","2020-07-01 16:30:34","0","28","1"),
("63","INQ/19-20/077","28","2020-07-01","85","0","BILLING@METRI PLAST","1970-01-01","17","5","10","5","9","2","11","68","11000.00","","","2020-07-01 16:37:39","2020-07-01 16:37:39","2020-07-01 16:37:39","0","28","1"),
("64","INQ/19-20/078","28","2020-07-01","86","0","BILLING@SHREE RADHEY ENGINEERING","1970-01-01","17","5","10","5","9","2","10","68","10000.00","","","2020-07-01 16:43:23","2020-07-01 16:43:23","2020-07-01 16:43:23","0","28","1"),
("65","INQ/19-20/079","28","2020-07-01","87","489","BILLING@Sumitek Natraj Machine","1970-01-01","17","12","0","6","9","2","11","68","0.00","USING TEALLY","","2020-07-01 16:48:39","2020-07-14 17:27:31","2020-07-01 16:48:39","0","28","1"),
("66","INQ/19-20/080","28","2020-07-01","88","0","BILLING CRM@Shree Shakti Dham Engneering","1970-01-01","19","5","10","5","9","3","11","68","0.00","ONLINE DEMO\n","","2020-07-01 16:52:07","2020-07-01 16:52:07","2020-07-01 16:52:07","0","28","1"),
("67","INQ/19-20/081","28","2020-07-01","89","0","@GAJJAR TOOL ROOM","1970-01-01","0","5","10","6","9","2","11","68","0.00","","","2020-07-01 17:06:52","2020-07-01 17:06:52","2020-07-01 17:06:52","0","28","1"),
("68","INQ/19-20/082","28","2020-07-01","90","487","BILLING@HINDUSTAN MACHINES ","1970-01-01","17","9","50","6","9","2","11","68","0.00","BIJI COMPNY MATE","","2020-07-01 17:14:54","2020-07-14 17:21:48","2020-07-01 17:14:54","0","28","1"),
("69","INQ/19-20/083","28","2020-07-01","91","0","BILLING@HARSHIDA INDUSTRIES","1970-01-01","17","5","10","6","9","2","11","68","0.00","","","2020-07-01 17:34:33","2020-07-01 17:34:33","2020-07-01 17:34:33","0","28","1"),
("70","INQ/19-20/084","28","2020-07-01","92","0","BILLING@MACONS EQUIPMENTS PVT LTD","1970-01-01","17","5","10","5","9","2","11","68","0.00","","","2020-07-01 17:40:00","2020-07-01 17:40:00","2020-07-01 17:40:00","0","28","1"),
("71","INQ/19-20/085","28","2020-07-01","93","0","BILLING@GAYATRI RUB TECH","1970-01-01","17","5","10","6","9","2","11","68","0.00","","","2020-07-01 17:59:37","2020-07-03 11:57:06","2020-07-01 17:59:37","0","28","1"),
("72","INQ/19-20/086","1,27","2020-07-02","94","65","Mfg ERP @ROYAL STEEL INDIA","1970-01-01","0","9","30","4","9","2","11","68","400000.00","met client on 30 June. BOM and other material has ben given to harshil. Next stage is to run their prodcution cycle in erp","Comparing with SAP. SAP offered in 6,50,000","2020-07-02 01:17:34","2020-07-02 01:17:34","2020-07-02 01:17:34","0","27","1"),
("73","INQ/19-20/087","29","2020-07-02","95","66","Billing360 @JATIN RADHANI","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:17:18","2020-07-02 16:17:18","2020-07-02 16:17:18","0","29","1"),
("74","INQ/19-20/088","29","2020-07-02","96","67","Billing360 @JOGRAJ RAJPUROHIT","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:18:43","2020-07-02 16:18:43","2020-07-02 16:18:43","0","29","1"),
("75","INQ/19-20/089","29","2020-07-02","97","68","Billing360 @SHEIKH FARUK","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:22:51","2020-07-02 16:22:51","2020-07-02 16:22:51","0","29","1"),
("76","INQ/19-20/090","29","2020-07-02","98","69","Billing360 @MURLI CREATION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:25:00","2020-07-02 16:25:00","2020-07-02 16:25:00","0","29","1"),
("77","INQ/19-20/091","29","2020-07-02","99","70","Billing360@NAVABI CREATION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:26:43","2020-07-02 16:26:43","2020-07-02 16:26:43","0","29","1"),
("78","INQ/19-20/092","29","2020-07-02","100","71","@KEYUR PATEL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:27:56","2020-07-02 16:27:56","2020-07-02 16:27:56","0","29","1"),
("79","INQ/19-20/093","29","2020-07-02","101","72","Billing360 @DOGMA INDUSTRIES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:31:44","2020-07-02 16:31:44","2020-07-02 16:31:44","0","29","1"),
("80","INQ/19-20/094","29","2020-07-02","102","73","Billing360@MANISH PARMAR","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:33:46","2020-07-02 16:34:00","2020-07-02 16:33:46","0","29","1"),
("81","INQ/19-20/095","29","2020-07-02","103","74","Billing360 @SHREEJI FABRICTION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:37:13","2020-07-02 16:37:13","2020-07-02 16:37:13","0","29","1"),
("82","INQ/19-20/096","29","2020-07-02","6","6","Billing360@JYOTI ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:41:54","2020-07-02 16:41:54","2020-07-02 16:41:54","0","29","1"),
("83","INQ/19-20/097","29","2020-07-02","7","7","Billing360 @AARTI TOOLS & DIE","1970-01-01","17","5","10","6","9","7","10","68","10000.00","","","2020-07-02 16:42:35","2020-07-02 16:42:35","2020-07-02 16:42:35","0","29","1"),
("84","INQ/19-20/098","29","2020-07-02","8","8","Billing360@ASTHA ENTERPRISE","1970-01-01","17","5","10","6","9","7","10","68","10000.00","","","2020-07-02 16:43:48","2020-07-02 16:43:48","2020-07-02 16:43:48","0","29","1"),
("85","INQ/19-20/099","29","2020-07-02","9","9","Billing360 @SHIVAM TRADERS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 16:44:23","2020-07-02 16:44:23","2020-07-02 16:44:23","0","29","1"),
("86","INQ/19-20/100","29","2020-07-02","10","10","Billing360@RIDDHISIDDHI INDUSTRIES","1970-01-01","17","5","10","6","9","7","10","68","10000.00","","","2020-07-02 16:45:11","2020-07-02 16:45:11","2020-07-02 16:45:11","0","29","1"),
("87","INQ/19-20/101","29","2020-07-02","11","11","Billing360 @LAXMI SPOCCKET INDUSTRIES","1970-01-01","17","5","10","6","9","3","11","68","10000.00","","","2020-07-02 16:45:59","2020-07-02 16:45:59","2020-07-02 16:45:59","0","29","1"),
("88","INQ/19-20/102","29","2020-07-02","12","12","Billing360 @DESHMUKH ELECTRONICS","1970-01-01","17","5","10","5","0","7","10","68","10000.00","","","2020-07-02 16:46:57","2020-07-02 16:46:57","2020-07-02 16:46:57","0","29","1"),
("89","INQ/19-20/103","29","2020-07-02","13","13","Billing360 @HEENA PLASTICK","1970-01-01","17","5","10","6","9","7","10","68","10000.00","","","2020-07-02 16:47:34","2020-07-02 16:47:34","2020-07-02 16:47:34","0","29","1"),
("90","INQ/19-20/104","29","2020-07-02","104","75","Billing360 @SHOAIB VEPARI","1970-01-01","17","5","10","5","0","7","10","68","10000.00","","","2020-07-02 16:50:14","2020-07-02 16:50:14","2020-07-02 16:50:14","0","29","1"),
("91","INQ/19-20/105","29","2020-07-02","105","76","Billing360 @APEX INTERNATIONAL","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 16:51:22","2020-07-02 16:51:57","2020-07-02 16:51:22","0","29","1"),
("92","INQ/19-20/106","29","2020-07-02","106","77","Billing360 @SHIVAM WATER TREATERS","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 16:59:01","2020-07-02 16:59:01","2020-07-02 16:59:01","0","29","1"),
("93","INQ/19-20/107","29","2020-07-02","107","78","Billing360@JETHVA SANJAY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 17:00:53","2020-07-02 17:00:53","2020-07-02 17:00:53","0","29","1"),
("94","INQ/19-20/108","29","2020-07-02","108","79","Billing360@RAVINDRA AGRAWAL","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:03:47","2020-07-02 17:03:47","2020-07-02 17:03:47","0","29","1"),
("95","INQ/19-20/109","29","2020-07-02","109","80","Billing360 @ZYMECH PHARMA","1970-01-01","17","5","10","5","9","0","11","68","10000.00","","","2020-07-02 17:05:12","2020-07-02 17:05:12","2020-07-02 17:05:12","0","29","1"),
("96","INQ/19-20/110","29","2020-07-02","110","81","Biling360 @NAKSHTRA ENTERPRISE","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:06:34","2020-07-02 17:06:34","2020-07-02 17:06:34","0","29","1"),
("97","INQ/19-20/111","29","2020-07-02","111","82","Billing360 @SHIVA ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 17:08:07","2020-07-02 17:08:07","2020-07-02 17:08:07","0","29","1"),
("98","INQ/19-20/112","29","2020-07-02","112","83","Billing360 @AMAR FASHION","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 17:09:21","2020-07-02 17:09:21","2020-07-02 17:09:21","0","29","1"),
("99","INQ/19-20/113","29","2020-07-02","113","84","Billing360@SACHIN TEXTILE INDUSTRIES","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:17:00","2020-07-02 17:17:00","2020-07-02 17:17:00","0","29","1"),
("100","INQ/19-20/114","29","2020-07-02","114","85","Billing360 @MAHAKALI ENTERPRISE","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:49:29","2020-07-02 17:49:29","2020-07-02 17:49:29","0","29","1");
INSERT INTO tbl_inquiry VALUES
("101","INQ/19-20/115","29","2020-07-02","115","86","Billing360@JAY MATAJI ENTERPRISE","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:51:31","2020-07-02 18:02:35","2020-07-02 17:51:31","0","29","1"),
("102","INQ/19-20/116","29","2020-07-02","116","87","Billing360 @RATNAMANI METALE & TUBES LTD","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:53:50","2020-07-02 17:53:50","2020-07-02 17:53:50","0","29","1"),
("103","INQ/19-20/117","29","2020-07-02","117","88","Billing360@QAWI ENTERPRISE","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 17:58:47","2020-07-02 17:58:47","2020-07-02 17:58:47","0","29","1"),
("104","INQ/19-20/118","29","2020-07-02","118","89","billing360@SHREE GWALINATH","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-02 18:02:23","2020-07-02 18:02:23","2020-07-02 18:02:23","0","29","1"),
("105","INQ/19-20/119","29","2020-07-02","119","90","Billing360 @ALPHA DYES AND CHEMICALS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:03:27","2020-07-02 18:04:31","2020-07-02 18:03:27","0","29","1"),
("106","INQ/19-20/120","29","2020-07-02","120","91","Billing360 @CHENNAI ELECTRICALS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:06:19","2020-07-02 18:06:19","2020-07-02 18:06:19","0","29","1"),
("107","INQ/19-20/121","29","2020-07-02","121","92","Billing360@CHEHAR BHAVNI TRADING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:07:26","2020-07-02 18:07:49","2020-07-02 18:07:26","0","29","1"),
("108","INQ/19-20/122","29","2020-07-02","122","93","Billing360@WAVES ENGINEERING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:09:12","2020-07-02 18:09:12","2020-07-02 18:09:12","0","29","1"),
("109","INQ/19-20/123","29","2020-07-02","123","94","Billing360@RUDRA ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:10:46","2020-07-02 18:10:46","2020-07-02 18:10:46","0","29","1"),
("110","INQ/19-20/124","29","2020-07-02","124","95","Billing360 @KARMAYOG ELECTRICALS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:14:18","2020-07-02 18:14:18","2020-07-02 18:14:18","0","29","1"),
("111","INQ/19-20/125","29","2020-07-02","125","96","Billing360@GUJARAT STEEL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:17:38","2020-07-02 18:17:38","2020-07-02 18:17:38","0","29","1"),
("112","INQ/19-20/126","29","2020-07-02","126","97","Billing360@VEER ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:23:02","2020-07-02 18:23:02","2020-07-02 18:23:02","0","29","1"),
("113","INQ/19-20/127","29","2020-07-02","127","98","Billing360 @PURVI PLASTIC","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:24:34","2020-07-02 18:24:34","2020-07-02 18:24:34","0","29","1"),
("114","INQ/19-20/128","29","2020-07-02","128","99","Billing360@RAMDEV FURNITURE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:25:55","2020-07-02 18:25:55","2020-07-02 18:25:55","0","29","1"),
("115","INQ/19-20/129","29","2020-07-02","129","100","Billing360@Aluminium Fabrication and Glass Work","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:27:23","2020-07-02 18:27:23","2020-07-02 18:27:23","0","29","1"),
("116","INQ/19-20/130","29","2020-07-02","130","101","Billing360@JIGER TEXTILE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:29:51","2020-07-02 18:29:51","2020-07-02 18:29:51","0","29","1"),
("117","INQ/19-20/131","29","2020-07-02","131","102","Billing360@KIRAN CHEMICALS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:32:00","2020-07-02 18:32:00","2020-07-02 18:32:00","0","29","1"),
("118","INQ/19-20/132","29","2020-07-02","132","103","Billing360@SURESHBHAI CHAUHAN","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:34:11","2020-07-02 18:34:11","2020-07-02 18:34:11","0","29","1"),
("119","INQ/19-20/133","29","2020-07-02","133","104","Billing360@ASHA TRADERS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-02 18:35:36","2020-07-02 18:35:36","2020-07-02 18:35:36","0","29","1"),
("120","INQ/19-20/134","29","2020-07-02","134","105","Billing360@SHAKTI ENTERPRISE","1970-01-01","17","5","10","6","9","7","11","68","10000.00","","","2020-07-02 18:37:14","2020-07-02 18:37:14","2020-07-02 18:37:14","0","29","1"),
("121","INQ/19-20/135","29","2020-07-02","135","106","Billing360@MAHADEV ENTERPRISE","1970-01-01","19","5","10","6","9","7","10","68","10000.00","","","2020-07-02 18:38:47","2020-07-02 18:38:47","2020-07-02 18:38:47","0","29","1"),
("122","INQ/19-20/136","29","2020-07-03","136","107","Billing360@MATRU KRUPA ENTERPRICE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 10:39:40","2020-07-03 10:39:40","2020-07-03 10:39:40","0","29","1"),
("123","INQ/19-20/137","29","2020-07-03","137","108","Billing360@SHREE HARI AUTO PARTS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 10:49:30","2020-07-03 10:49:30","2020-07-03 10:49:30","0","29","1"),
("124","INQ/19-20/138","29","2020-07-03","138","109","Billing360@SHIVAM PLASATIK","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 10:52:13","2020-07-03 10:52:13","2020-07-03 10:52:13","0","29","1"),
("125","INQ/19-20/139","29","2020-07-03","139","110","Billing360@GAYATRI STEEL ","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 10:54:25","2020-07-03 10:54:25","2020-07-03 10:54:25","0","29","1"),
("126","INQ/19-20/140","29","2020-07-03","141","111","Billing360@ARMAN IRONING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 10:57:12","2020-07-03 10:57:12","2020-07-03 10:57:12","0","29","1"),
("127","INQ/19-20/141","29","2020-07-03","144","112","Billing360@MG PLAST VATVA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:08:18","2020-07-03 11:08:18","2020-07-03 11:08:18","0","29","1"),
("128","INQ/19-20/142","29","2020-07-03","146","113","Billing360@YOGI ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:17:39","2020-07-03 11:17:39","2020-07-03 11:17:39","0","29","1"),
("129","INQ/19-20/143","29","2020-07-03","148","114","Billing360@PARRAM ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:21:07","2020-07-03 11:21:29","2020-07-03 11:21:07","0","29","1"),
("130","INQ/19-20/144","29","2020-07-03","152","115","Billing360@PERFECT ENGINEERING WORK","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:23:35","2020-07-03 11:23:35","2020-07-03 11:23:35","0","29","1"),
("131","INQ/19-20/145","29","2020-07-03","156","116","Billing360@V.B.SONS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:31:15","2020-07-03 11:31:15","2020-07-03 11:31:15","0","29","1"),
("132","INQ/19-20/146","29","2020-07-03","158","117","Billing360@PARAS TIMBER","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:33:21","2020-07-03 11:33:21","2020-07-03 11:33:21","0","29","1"),
("133","INQ/19-20/147","29","2020-07-03","168","118","Billing360@SAMRAT ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 11:54:59","2020-07-03 11:54:59","2020-07-03 11:54:59","0","29","1"),
("134","INQ/19-20/148","28","2020-07-03","169","119","BILLING@STAR GLASS HOUSE","1970-01-01","17","5","10","5","9","2","10","68","0.00","10K PRISE\n","","2020-07-03 11:56:12","2020-07-03 11:57:23","2020-07-03 11:56:12","0","28","1"),
("135","INQ/19-20/149","29","2020-07-03","171","120","Billing360@UNIQUEACT & CO.","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-03 12:12:57","2020-07-03 12:12:57","2020-07-03 12:12:57","0","29","1"),
("136","INQ/19-20/150","29","2020-07-03","175","121","Billing360@SAHJANAND VISION","1970-01-01","17","5","0","5","9","7","10","68","10000.00","","","2020-07-03 12:15:57","2020-07-03 12:15:57","2020-07-03 12:15:57","0","29","1"),
("137","INQ/19-20/151","29","2020-07-03","177","122","Billing360@BIKMES FOOTER","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 12:18:41","2020-07-03 12:18:41","2020-07-03 12:18:41","0","29","1"),
("138","INQ/19-20/152","29","2020-07-03","179","123","Billing360@HARSH ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-03 12:20:17","2020-07-03 12:20:17","2020-07-03 12:20:17","0","29","1"),
("139","INQ/19-20/153","28","2020-07-03","183","0","CRM BILLING@Adachi Natural Polymer Pvt Ltd ","1970-01-01","17","5","10","5","9","2","12","68","0.00","CRM ND BILLING MATE MEET KARI AK VAR CALL KARI NE FINAL KARVANU CHE\n\n","","2020-07-03 12:28:07","2020-07-03 12:28:07","2020-07-03 12:28:07","0","28","1"),
("140","INQ/19-20/154","28","2020-07-01","184","0","BILLING@LANDMARK INDUSTRY ","1970-01-01","17","5","10","5","9","2","11","68","0.00","march ma karvanu che 25 a\n","","2020-07-03 12:41:28","2020-07-03 12:41:28","2020-07-03 12:41:28","0","28","1"),
("141","INQ/19-20/155","28","2020-07-01","189","0","billing@Alankar Boilers And Pressure Vessels Pvt Ltd ","1970-01-01","17","5","10","6","9","2","12","68","0.00","jun ending ma contact karvano","","2020-07-03 12:46:55","2020-07-03 12:46:55","2020-07-03 12:46:55","0","28","1"),
("142","INQ/19-20/156","28","2020-07-02","191","0","billing crm@Amit Engineering Works","1970-01-01","17","5","10","6","9","2","11","68","0.00","CRM nd billing mate meet karvani 2 divas pachi\n","","2020-07-03 12:50:12","2020-07-03 12:50:12","2020-07-03 12:50:12","0","28","1"),
("143","INQ/19-20/157","28","2020-07-03","193","124","BILLING@PERFECT STEEL ENGINEERS & FABRICATORS ","1970-01-01","17","5","10","6","9","2","11","68","0.00","JUN ending ma contact karvano excel ma banave che","","2020-07-03 14:13:09","2020-07-03 14:13:09","2020-07-03 14:13:09","0","28","1"),
("144","INQ/19-20/158","32","2020-07-03","194","125","Billing360@SHRIRANG JADHAV","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He wants Tally s/w and not interested for billing s/w.","","2020-07-03 15:34:10","2020-07-10 16:09:39","2020-07-03 15:34:10","0","32","1"),
("145","INQ/19-20/159","32","2020-07-03","195","126","Billing360@KESHAV PANDIT","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 15:41:21","2020-07-03 15:41:21","2020-07-03 15:41:21","0","32","1"),
("146","INQ/19-20/160","32","2020-07-03","196","127","Billing360@SAMRAT SPORTS CO.","1970-01-01","0","4","0","6","9","7","10","68","10000.00","He disconnected the call  after hearing the purpose of the call.","","2020-07-03 15:47:41","2020-07-10 16:39:04","2020-07-03 15:47:41","0","32","1"),
("147","INQ/19-20/161","32","2020-07-03","197","128","Billing360@ANAND KUMAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-03 15:57:36","2020-07-08 15:50:36","2020-07-03 15:57:36","0","32","1"),
("148","INQ/19-20/162","32","2020-07-03","198","129","Billing360@RAJKUMAR JANGID","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-03 16:01:16","2020-07-08 15:58:04","2020-07-03 16:01:16","0","32","1"),
("149","INQ/19-20/163","32","2020-07-03","199","130","Billing360@MUSKAN PRINTER","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-03 16:06:25","2020-07-08 15:58:50","2020-07-03 16:06:25","0","32","1"),
("150","INQ/19-20/164","32","2020-07-03","200","131","Billing360@RAKESH KUMAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He told that the requirement is closed. I asked about the s/w he purchased. He told that all his requirements are satisfied with the current s/w and don\'t want new s/w.","","2020-07-03 16:09:56","2020-07-10 17:43:59","2020-07-03 16:09:56","0","32","1"),
("151","INQ/19-20/165","32","2020-07-03","201","132","Billling360@LOKESH SHARMA","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Unable to connect","","2020-07-03 16:14:28","2020-07-14 14:01:12","2020-07-03 16:14:28","0","32","1"),
("152","INQ/19-20/166","32","2020-07-03","202","133","Billing360@ AJAY CABLES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:19:52","2020-07-09 11:19:17","2020-07-03 16:19:52","0","32","1"),
("153","INQ/19-20/167","32","2020-07-03","203","134","Billing360@KVM FLOORING SOLUTIONS","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He disocnnected the call without listening to anything.","","2020-07-03 16:22:47","2020-07-10 16:17:19","2020-07-03 16:22:47","0","32","1"),
("154","INQ/19-20/168","32","2020-07-03","204","135","Billling360@VARSHINI DEPARTMENTAL STORES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:26:48","2020-07-03 16:26:48","2020-07-03 16:26:48","0","32","1"),
("155","INQ/19-20/169","32","2020-07-03","205","136","Billing360@AJAY SHARMA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:30:21","2020-07-03 16:30:21","2020-07-03 16:30:21","0","32","1"),
("156","INQ/19-20/170","32","2020-07-03","206","137","Billing360@ACCEL FRONTLINE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:38:53","2020-07-03 16:39:09","2020-07-03 16:38:53","0","32","1"),
("157","INQ/19-20/171","32","2020-07-03","207","138","Billing360@NEWMADEENA HYPER","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Incoming facility not available. Mail Sent","","2020-07-03 16:42:01","2020-07-11 12:55:53","2020-07-03 16:42:01","0","32","1"),
("158","INQ/19-20/172","32","2020-07-03","208","139","Billing@BASIL\\\'S PHARMACEUTICALS","1970-01-01","0","4","0","6","9","7","10","68","10000.00","He purchased marg s/w.","","2020-07-03 16:44:34","2020-07-14 16:16:16","2020-07-03 16:44:34","0","32","1"),
("159","INQ/19-20/173","32","2020-07-03","209","140","Billing360@VAISHALI MATCHING","1970-01-01","0","9","50","6","9","7","10","68","10000.00","","","2020-07-03 16:46:37","2020-07-09 11:05:55","2020-07-03 16:46:37","0","32","1"),
("160","INQ/19-20/174","32","2020-07-03","210","141","Billing360@RAJESH PATIL","1970-01-01","0","9","50","6","9","7","10","68","10000.00","","","2020-07-03 16:49:17","2020-07-09 10:45:59","2020-07-03 16:49:17","0","32","1"),
("161","INQ/19-20/175","32","2020-07-03","211","142","Billing360@ATLAS ENGINEERS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:51:12","2020-07-03 16:51:44","2020-07-03 16:51:12","0","32","1"),
("162","INQ/19-20/176","32","2020-07-03","212","144","Billing360@OM TRADE LINK","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Not interested and disconnected the call","","2020-07-03 16:53:28","2020-07-11 13:32:14","2020-07-03 16:53:28","0","32","1"),
("163","INQ/19-20/177","32","2020-07-03","213","143","Billing360@SUPREMEME ENTERPRISE BIDAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-03 16:55:27","2020-07-10 11:39:27","2020-07-03 16:55:27","0","32","1"),
("164","INQ/19-20/178","32","2020-07-03","214","145","Billing360@MADANE DISTRIBUTORS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 16:58:44","2020-07-03 16:58:44","2020-07-03 16:58:44","0","32","1"),
("165","INQ/19-20/179","32","2020-07-03","215","146","Billing360@PRASHANT AHER","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Disconnected the call","","2020-07-03 17:00:47","2020-07-11 12:50:12","2020-07-03 17:00:47","0","32","1"),
("166","INQ/19-20/180","32","2020-07-03","216","147","Billing360@RAJESH YADAV","1970-01-01","0","9","50","6","9","7","10","68","10000.00","","","2020-07-03 17:02:54","2020-07-11 12:11:02","2020-07-03 17:02:54","0","32","1"),
("167","INQ/19-20/181","32","2020-07-03","217","148","Billing360@ANITA AGENCIES","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Purchased tally. Lead Lost","","2020-07-03 17:05:44","2020-07-14 13:50:55","2020-07-03 17:05:44","0","32","1"),
("168","INQ/19-20/182","32","2020-07-03","218","149","Billing360@JAYPRAKASH VISHWAKARMA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:07:45","2020-07-03 17:07:45","2020-07-03 17:07:45","0","32","1"),
("169","INQ/19-20/183","32","2020-07-03","219","150","bILLING360@WAPCOS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:10:06","2020-07-03 17:10:06","2020-07-03 17:10:06","0","32","1"),
("170","INQ/19-20/184","32","2020-07-03","220","151","Billing360@WEB TECHNOLOGIC","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:12:31","2020-07-03 17:12:31","2020-07-03 17:12:31","0","32","1"),
("171","INQ/19-20/185","32","2020-07-03","221","152","Billing360@WIPRO","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:14:33","2020-07-03 17:14:33","2020-07-03 17:14:33","0","32","1"),
("172","INQ/19-20/186","32","2020-07-03","222","153","Billing360@SAMSUNG","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:16:47","2020-07-03 17:16:47","2020-07-03 17:16:47","0","32","1"),
("173","INQ/19-20/187","32","2020-07-03","223","154","Billing360@DREAMS HOME INTERIOR","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:19:23","2020-07-03 17:19:23","2020-07-03 17:19:23","0","32","1"),
("174","INQ/19-20/188","32","2020-07-03","224","155","Billing360@J.B. ENTERPRISE","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Did not receive the call.Lead Lost. ","","2020-07-03 17:21:28","2020-07-14 12:03:47","2020-07-03 17:21:28","0","32","1"),
("175","INQ/19-20/189","32","2020-07-03","225","156","Billing360@SOMESHWAR COMMUNICATION","1970-01-01","0","9","50","5","9","7","10","68","10000.00","","","2020-07-03 17:23:33","2020-07-10 18:15:32","2020-07-03 17:23:33","0","32","1"),
("176","INQ/19-20/190","32","2020-07-03","226","157","Billing360@MADHU BANANA WHOLE SALE MARCHANT","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Disconnected the call","","2020-07-03 17:25:17","2020-07-11 11:23:41","2020-07-03 17:25:17","0","32","1"),
("177","INQ/19-20/191","32","2020-07-03","227","158","Billing360@PRASANNA S SHIVA S","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:27:41","2020-07-03 17:27:41","2020-07-03 17:27:41","0","32","1"),
("178","INQ/19-20/192","32","2020-07-03","228","159","Billing360@ARYA BANDHU AYURVED BHAWAN","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:29:37","2020-07-03 17:29:37","2020-07-03 17:29:37","0","32","1"),
("179","INQ/19-20/193","32","2020-07-03","229","160","Billing360@VISHAL RASTOGI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:31:49","2020-07-03 17:31:49","2020-07-03 17:31:49","0","32","1"),
("180","INQ/19-20/194","32","2020-07-03","230","161","Billing360@ HARSH MARBLES","1970-01-01","0","9","50","6","9","7","10","68","10000.00","","","2020-07-03 17:35:16","2020-07-11 12:11:34","2020-07-03 17:35:16","0","32","1"),
("181","INQ/19-20/195","32","2020-07-03","231","162","Billing360@KRGASSOCIATES","1970-01-01","0","4","0","5","9","7","10","68","10000.00","The requirement is closed","","2020-07-03 17:39:29","2020-07-10 16:07:11","2020-07-03 17:39:29","0","32","1"),
("182","INQ/19-20/196","32","2020-07-03","232","163","Billing360@ULHAS PATIL","1970-01-01","0","4","0","5","9","0","10","68","10000.00","No is unavailable.","","2020-07-03 17:41:17","2020-07-14 11:54:29","2020-07-03 17:41:17","0","32","1"),
("183","INQ/19-20/197","32","2020-07-03","233","164","Billing360@SUNIL AGARWALLA","1970-01-01","0","4","0","5","9","0","10","68","10000.00","Tried many times but did not get any reply","","2020-07-03 17:43:57","2020-07-14 13:49:04","2020-07-03 17:43:57","0","32","1"),
("184","INQ/19-20/198","32","2020-07-03","234","165","Billing360@AMIT","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He purchased the s/w and the company has customized the s/w as per his requirements.","","2020-07-03 17:46:26","2020-07-10 16:13:09","2020-07-03 17:46:26","0","32","1"),
("185","INQ/19-20/199","32","2020-07-03","235","166","Billing360@ADVERTISEMENT COLLECTION AGENCY","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:49:52","2020-07-03 17:49:52","2020-07-03 17:49:52","0","32","1"),
("186","INQ/19-20/200","32","2020-07-03","236","167","Billing360@CHINGS SECRETCHI","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He has purchased Vepar s/w.","","2020-07-03 17:54:36","2020-07-11 13:17:32","2020-07-03 17:54:36","0","32","1"),
("187","INQ/19-20/201","32","2020-07-03","237","168","Billing360@SHIV JEWELLERS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:56:48","2020-07-03 17:56:48","2020-07-03 17:56:48","0","32","1"),
("188","INQ/19-20/202","32","2020-07-03","238","170","Billing360@SALEH AHMED LASKAR","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 17:59:23","2020-07-03 18:02:43","2020-07-03 17:59:23","0","32","1"),
("189","INQ/19-20/203","32","2020-07-03","239","169","Billing360@LAW STUDENTS AND LAWYERS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-03 18:01:47","2020-07-03 18:01:47","2020-07-03 18:01:47","0","32","1"),
("190","INQ/19-20/204","32","2020-07-03","240","171","Billing360@HIMANSHU JAISWAL","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He is not looking for any s/w and he is not interested to discuss further","","2020-07-03 18:05:29","2020-07-10 16:13:48","2020-07-03 18:05:29","0","32","1"),
("191","INQ/19-20/205","28","2020-07-04","267","172","BILLING@Vishwa Machinery And Processing Private Limited","1970-01-01","17","5","10","5","8","2","11","68","0.00","8 juLY pachi call karvano\n","","2020-07-04 12:58:58","2020-07-06 12:11:46","2020-07-04 12:58:58","0","28","1"),
("192","INQ/19-20/206","32","2020-07-06","278","173","Billing360@KAUSHAL KISHOR TRIPATHI","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Does not require and disconnected ","","2020-07-06 10:38:48","2020-07-10 16:17:52","2020-07-06 10:38:48","0","32","1"),
("193","INQ/19-20/207","32","2020-07-06","292","174","Billing360@GANHHAPUTRA K S K","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:22:48","2020-07-06 11:22:48","2020-07-06 11:22:48","0","32","1"),
("194","INQ/19-20/208","32","2020-07-06","293","175","Billing360@SAMRUDDHI PLASTIC INDUSTRY","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Already purchased s/w.","","2020-07-06 11:26:18","2020-07-10 18:12:48","2020-07-06 11:26:18","0","32","1"),
("195","INQ/19-20/209","32","2020-07-06","295","176","Billing360@GETINSTA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:30:03","2020-07-06 11:30:03","2020-07-06 11:30:03","0","32","1"),
("196","INQ/19-20/210","32","2020-07-06","304","177","Billing360@AHUJA ASSOCIATES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:40:55","2020-07-06 11:40:55","2020-07-06 11:40:55","0","32","1"),
("197","INQ/19-20/211","32","2020-07-06","305","178","Billing360@VISHAL JAISWAL","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He had inquired long back and have purchased other s/w similar to ours","","2020-07-06 11:44:28","2020-07-10 16:08:58","2020-07-06 11:44:28","0","32","1"),
("198","INQ/19-20/212","32","2020-07-06","306","179","Billing360@PATANJALI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:47:28","2020-07-06 11:47:28","2020-07-06 11:47:28","0","32","1"),
("199","INQ/19-20/213","29","2020-07-06","309","181","Billing360@ER NIRMAL ATULBHAI PATEL","1970-01-01","19","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:53:24","2020-07-06 11:53:24","2020-07-06 11:53:25","0","29","1"),
("200","INQ/19-20/214","1,27","2020-07-06","307","180","Billing Software@TESTING 1","2020-07-31","17","12","0","7","9","4","10","68","14000.00","","","2020-07-06 11:56:41","2020-07-06 11:56:41","2020-07-06 11:56:41","2","27","1");
INSERT INTO tbl_inquiry VALUES
("201","INQ/19-20/215","1,27","2020-07-06","307","180","CRM@TESTING 1","2020-07-29","17","12","0","7","9","8","10","68","35000.00","","","2020-07-06 11:57:41","2020-07-06 11:57:41","2020-07-06 11:57:41","2","27","1"),
("202","INQ/19-20/216","1,27","2020-07-06","307","180","ERP@TESTING 1","2020-07-27","17","7","20","4","8","2","10","68","250000.00","","","2020-07-06 11:59:22","2020-07-06 13:05:01","2020-07-06 11:59:22","2","27","1"),
("203","INQ/19-20/217","29","2020-07-06","311","183","Billing360@REAL GARMENTS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:59:24","2020-07-06 11:59:24","2020-07-06 11:59:24","0","29","1"),
("204","INQ/19-20/218","32","2020-07-06","310","182","Billing360@SALMAN KHAN KICHHAUCHHA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 11:59:36","2020-07-06 11:59:36","2020-07-06 11:59:36","0","32","1"),
("205","INQ/19-20/219","29","2020-07-06","312","184","Billing360@KAUTILYAM","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:01:13","2020-07-06 12:01:13","2020-07-06 12:01:13","0","29","1"),
("206","INQ/19-20/220","32","2020-07-06","313","185","Billing360@KHIROD ","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:02:43","2020-07-06 12:02:43","2020-07-06 12:02:43","0","32","1"),
("207","INQ/19-20/221","29","2020-07-06","314","186","Billing360@EMIPRO","1970-01-01","20","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:04:11","2020-07-06 12:04:11","2020-07-06 12:04:11","0","29","1"),
("208","INQ/19-20/222","32","2020-07-06","315","187","Billing360@MAKRANA MARBAL","1970-01-01","0","4","0","5","9","7","10","68","10000.00","No is unavailable.","","2020-07-06 12:05:23","2020-07-10 16:16:46","2020-07-06 12:05:23","0","32","1"),
("209","INQ/19-20/223","29","2020-07-06","316","188","Billing360@YASHVANT GADHIYA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:06:09","2020-07-06 12:06:09","2020-07-06 12:06:09","0","29","1"),
("210","INQ/19-20/224","32","2020-07-06","317","189","Billing360@RAJ GUPTA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:10:07","2020-07-06 12:10:07","2020-07-06 12:10:07","0","32","1"),
("211","INQ/19-20/225","32","2020-07-06","318","190","Billing360@UMESH BAJAJ","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:13:25","2020-07-06 12:13:25","2020-07-06 12:13:25","0","32","1"),
("212","INQ/19-20/226","29","2020-07-06","319","191","Billing360@MOHSIN MADHUPUR","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:14:26","2020-07-06 12:14:26","2020-07-06 12:14:26","0","29","1"),
("213","INQ/19-20/227","32","2020-07-06","320","192","Billing360@SUMAN LADIES GARMENT","1970-01-01","0","4","0","5","9","7","10","68","10000.00","No is switched-off constantly","","2020-07-06 12:16:11","2020-07-14 16:58:29","2020-07-06 12:16:11","0","32","1"),
("214","INQ/19-20/228","32","2020-07-06","321","193","Billing360@BALAJI RO AGENCIES","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-06 12:24:00","2020-07-08 16:53:42","2020-07-06 12:24:00","0","32","1"),
("215","INQ/19-20/229","29","2020-07-06","322","194","Billing360@NAVNIT BHADALIYA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:24:05","2020-07-06 12:24:05","2020-07-06 12:24:05","0","29","1"),
("216","INQ/19-20/230","29","2020-07-06","323","195","Billing360@JPK BEVERAGES AND FOODS LLP","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:25:57","2020-07-06 12:25:57","2020-07-06 12:25:57","0","29","1"),
("217","INQ/19-20/231","29","2020-07-06","324","196","Billing360@GANSHYAMBHAI GYANCHAND SINDHI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:27:36","2020-07-06 12:27:36","2020-07-06 12:27:36","0","29","1"),
("218","INQ/19-20/232","32","2020-07-06","326","198","Billing360@GHULAM SARWAR KHAN","1970-01-01","0","4","0","5","9","7","10","68","20000.00","Not interested ","","2020-07-06 12:30:44","2020-07-10 16:22:42","2020-07-06 12:30:44","0","32","1"),
("219","INQ/19-20/233","29","2020-07-06","327","199","Billing360@GANPATSINGH RAJPUT RAJPUT","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:32:58","2020-07-06 12:32:58","2020-07-06 12:32:58","0","29","1"),
("220","INQ/19-20/234","29","2020-07-06","325","197","Billing360@SHIV SHAKTI MEDICINE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:33:04","2020-07-06 12:33:04","2020-07-06 12:33:04","0","29","1"),
("221","INQ/19-20/235","32","2020-07-06","328","200","Billing360@SHIV JI VERMA","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Pharma company and requirement does not match our s/w. Lead lost","","2020-07-06 12:34:53","2020-07-14 12:04:51","2020-07-06 12:34:53","0","32","1"),
("222","INQ/19-20/236","29","2020-07-06","329","201","Billing360@KHALID ZERAWALA","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 12:35:09","2020-07-06 12:35:09","2020-07-06 12:35:09","0","29","1"),
("223","INQ/19-20/237","32","2020-07-06","331","203","Billing360@NEW LOVELY GARMENTS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:37:48","2020-07-10 16:21:07","2020-07-06 12:37:48","0","32","1"),
("224","INQ/19-20/238","29","2020-07-06","330","202","Billing360@INDER BHATI","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:37:52","2020-07-06 12:37:52","2020-07-06 12:37:52","0","29","1"),
("225","INQ/19-20/239","29","2020-07-06","332","204","Billing360@TECHMECH SOLUTIONS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:39:05","2020-07-06 12:39:05","2020-07-06 12:39:05","0","29","1"),
("226","INQ/19-20/240","32","2020-07-06","334","206","Billing360@INDUSTRIAL TRAINING INSTITUTE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:41:26","2020-07-06 12:41:26","2020-07-06 12:41:26","0","32","1"),
("227","INQ/19-20/241","29","2020-07-06","335","207","Billing360@LUCKY HOSIERY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:42:07","2020-07-06 12:42:07","2020-07-06 12:42:07","0","29","1"),
("228","INQ/19-20/242","29","2020-07-06","333","205","Billing360@PARTH ELECTRONIC","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:42:15","2020-07-06 12:42:15","2020-07-06 12:42:15","0","29","1"),
("229","INQ/19-20/243","29","2020-07-06","336","208","Billing360@SALIM SHAIKH","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:43:39","2020-07-06 12:43:39","2020-07-06 12:43:39","0","29","1"),
("230","INQ/19-20/244","32","2020-07-06","337","209","Billing360@LASA THE BOOK MART","1970-01-01","0","4","0","5","9","7","10","68","0.00","He has already purchased other s/w.","","2020-07-06 12:44:03","2020-07-14 16:55:15","2020-07-06 12:44:03","0","32","1"),
("231","INQ/19-20/245","29","2020-07-06","338","210","Billing360@GOHIL CHANDRESH","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:44:50","2020-07-06 12:44:50","2020-07-06 12:44:50","0","29","1"),
("232","INQ/19-20/246","29","2020-07-06","339","211","Billing360@JAINAM SILVER PRODUCT PVT LTD","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:46:18","2020-07-06 12:46:18","2020-07-06 12:46:18","0","29","1"),
("233","INQ/19-20/247","32","2020-07-06","341","213","Billing360@ANKIT MUNDADA","1970-01-01","0","4","0","5","9","7","10","68","10000.00","They are using Tally and not in need to Billing s/w.","","2020-07-06 12:47:42","2020-07-10 16:26:22","2020-07-06 12:47:42","0","32","1"),
("234","INQ/19-20/248","29","2020-07-06","340","212","@ROYAL MOBILE GALLERY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:48:21","2020-07-06 12:48:21","2020-07-06 12:48:21","0","29","1"),
("235","INQ/19-20/249","29","2020-07-06","342","214","Billing360@SHARDA ENTERPRISES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:48:34","2020-07-06 12:48:34","2020-07-06 12:48:34","0","29","1"),
("236","INQ/19-20/250","29","2020-07-06","343","215","Billing360@NAVYA ENTERPRISE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:49:57","2020-07-06 12:49:57","2020-07-06 12:49:57","0","29","1"),
("237","INQ/19-20/251","29","2020-07-06","344","216","Billing360@SUBHASHBHAI SONI","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 12:51:08","2020-07-06 12:51:08","2020-07-06 12:51:08","0","29","1"),
("238","INQ/19-20/252","29","2020-07-06","346","217","Billing360@RJ CODER","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:52:25","2020-07-06 12:52:41","2020-07-06 12:52:25","0","29","1"),
("239","INQ/19-20/253","29","2020-07-06","348","218","Billing360@MOHIT SINGH GHANGHORIYA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:54:32","2020-07-06 12:54:32","2020-07-06 12:54:32","0","29","1"),
("240","INQ/19-20/254","29","2020-07-06","347","219","BILLING360@SHREEJI ASSOCIATES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:56:01","2020-07-06 12:56:01","2020-07-06 12:56:01","0","29","1"),
("241","INQ/19-20/255","29","2020-07-06","349","220","Billing360@HARIBHAI RAJPOOT","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 12:56:04","2020-07-06 12:56:04","2020-07-06 12:56:04","0","29","1"),
("242","INQ/19-20/256","29","2020-07-06","350","221","Billing360@RAVI TRADING COMPANY","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 12:57:24","2020-07-06 12:57:24","2020-07-06 12:57:24","0","29","1"),
("243","INQ/19-20/257","1,27","2020-07-06","351","222","accouting software @XYZ 1","2020-07-31","17","8","100","4","9","3","0","68","14000.00","","","2020-07-06 12:58:42","2020-07-06 14:31:28","2020-07-06 12:58:42","2","27","1"),
("244","INQ/19-20/258","29","2020-07-06","352","223","Billing360@DOBARIYA PIYUSH","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 13:00:11","2020-07-06 13:00:11","2020-07-06 13:00:11","0","29","1"),
("245","INQ/19-20/259","29","2020-07-06","353","224","BILLING360@VIKKY RATHORE AMIT","1970-01-01","17","5","10","5","9","0","10","68","10000.00","","","2020-07-06 13:01:24","2020-07-06 13:01:24","2020-07-06 13:01:24","0","29","1"),
("246","INQ/19-20/260","29","2020-07-06","354","225","Billing360@AMRUTBHAI PANCHAL","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 13:02:15","2020-07-06 13:02:15","2020-07-06 13:02:15","0","29","1"),
("247","INQ/19-20/261","29","2020-07-06","355","226","BILLING360@SWATI WATER SUPPLY LTD","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 13:08:52","2020-07-06 13:08:52","2020-07-06 13:08:52","0","29","1"),
("248","INQ/19-20/262","29","2020-07-06","356","227","Billing360@E-PROCUREMENT TECHNOLOGIES LIMITED","1970-01-01","0","5","10","5","9","7","11","68","10000.00","","","2020-07-06 13:08:57","2020-07-06 13:08:57","2020-07-06 13:08:57","0","29","1"),
("249","INQ/19-20/263","29","2020-07-06","357","229","BILLING360@Hasmukh Patel","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 13:13:12","2020-07-06 13:56:19","2020-07-06 13:13:12","0","29","1"),
("250","INQ/19-20/264","29","2020-07-06","358","228","Billing360@NIDHI COMPUTERS","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 13:13:39","2020-07-06 13:13:39","2020-07-06 13:13:39","0","29","1"),
("251","INQ/19-20/265","29","2020-07-06","360","231","Billing360@HASMUKHBHAI","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 13:59:24","2020-07-06 13:59:24","2020-07-06 13:59:24","0","29","1"),
("252","INQ/19-20/266","29","2020-07-06","361","232","Billing360@RAJVEER TOURIST SERVICES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:01:37","2020-07-06 14:01:37","2020-07-06 14:01:37","0","29","1"),
("253","INQ/19-20/267","29","2020-07-06","362","233","Billing360@SEJAL IMPEX","1970-01-01","17","5","10","5","9","7","11","68","10000.00","","","2020-07-06 14:03:16","2020-07-06 14:03:16","2020-07-06 14:03:16","0","29","1"),
("254","INQ/19-20/268","29","2020-07-06","364","235","Billing360@TARUN BHARDWAJ","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:04:54","2020-07-06 14:04:54","2020-07-06 14:04:54","0","29","1"),
("255","INQ/19-20/269","29","2020-07-06","365","236","Billing360@SHREE KALAJI METALS","1970-01-01","17","5","10","5","9","0","11","68","10000.00","","","2020-07-06 14:06:24","2020-07-06 14:06:24","2020-07-06 14:06:24","0","29","1"),
("256","INQ/19-20/270","29","2020-07-06","366","237","BILLING360@VALANI VAIBHAV","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:07:35","2020-07-06 14:07:35","2020-07-06 14:07:35","0","29","1"),
("257","INQ/19-20/271","29","2020-07-06","367","238","Billing360@MAHESHWARI ELECTRONIC","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:09:01","2020-07-06 14:09:01","2020-07-06 14:09:01","0","29","1"),
("258","INQ/19-20/272","29","2020-07-06","368","239","Billing360@JAY AMBE TREDRS","1970-01-01","0","5","10","5","9","0","10","68","10000.00","","","2020-07-06 14:12:24","2020-07-06 14:12:24","2020-07-06 14:12:24","0","29","1"),
("259","INQ/19-20/273","29","2020-07-06","369","240","BILLING360@LAXMI MARKETING AND ROADWAYS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:12:24","2020-07-06 14:12:24","2020-07-06 14:12:24","0","29","1"),
("260","INQ/19-20/274","29","2020-07-06","370","241","BILLING360@PURVANG RAVAL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:16:31","2020-07-06 14:16:31","2020-07-06 14:16:31","0","29","1"),
("261","INQ/19-20/275","28","2020-07-06","359","230","billing@Ahmedabad packaging ind","1970-01-01","17","13","99","4","9","2","11","68","22000.00","onlie demo aapiyo che 22k prise aapi che call revr karse","","2020-07-06 14:16:52","2020-07-13 14:23:55","2020-07-06 14:16:52","0","28","1"),
("262","INQ/19-20/276","29","2020-07-06","371","242","Billing360@HARESH PRAJAPATI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:18:23","2020-07-06 14:18:23","2020-07-06 14:18:23","0","29","1"),
("263","INQ/19-20/277","29","2020-07-06","372","243","BILLING360@SAGARBHAI P SHETH","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:19:44","2020-07-06 14:19:44","2020-07-06 14:19:44","0","29","1"),
("264","INQ/19-20/278","29","2020-07-06","374","245","Billing360@VAIBHAV KHATRI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:20:55","2020-07-06 14:20:55","2020-07-06 14:20:55","0","29","1"),
("265","INQ/19-20/279","28","2020-07-06","373","244","billing@MUNJAL METAL INDUSTRIES","1970-01-01","17","5","10","5","9","2","11","68","11000.00","july end ma karvanu che","","2020-07-06 14:21:12","2020-07-06 14:21:12","2020-07-06 14:21:12","0","28","1"),
("266","INQ/19-20/280","29","2020-07-06","375","246","BILLING360@SIDDHI AUTO PARTS","1970-01-01","17","5","10","5","9","2","10","68","10000.00","","","2020-07-06 14:23:25","2020-07-06 14:23:25","2020-07-06 14:23:25","0","29","1"),
("267","INQ/19-20/281","29","2020-07-06","376","247","Billing360@PANCHAL VIPUL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:23:55","2020-07-06 14:23:55","2020-07-06 14:23:55","0","29","1"),
("268","INQ/19-20/282","29","2020-07-06","377","248","Billing360@PARAAGON REFILL CAENTAR","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:25:26","2020-07-06 14:25:26","2020-07-06 14:25:26","0","29","1"),
("269","INQ/19-20/283","29","2020-07-06","378","249","BILLING360@BHAVESH J.SHAH & CO.","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:26:55","2020-07-06 14:26:55","2020-07-06 14:26:55","0","29","1"),
("270","INQ/19-20/284","29","2020-07-06","379","250","Billing360@BLUESTAR LTD","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:29:04","2020-07-06 14:29:04","2020-07-06 14:29:04","0","29","1"),
("271","INQ/19-20/285","29","2020-07-06","380","251","Billing360@DWIJA ENTERPRISE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:32:10","2020-07-06 14:32:10","2020-07-06 14:32:10","0","29","1"),
("272","INQ/19-20/286","29","2020-07-06","381","252","Biiling360@CITY TILES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:33:39","2020-07-06 14:33:39","2020-07-06 14:33:39","0","29","1"),
("273","INQ/19-20/287","29","2020-07-06","382","253","Billing360@PATEL MAHESH","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:35:37","2020-07-06 14:35:37","2020-07-06 14:35:37","0","29","1"),
("274","INQ/19-20/288","29","2020-07-06","383","254","Billing360@SHREE RAM MEDICAL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:36:58","2020-07-06 14:36:58","2020-07-06 14:36:58","0","29","1"),
("275","INQ/19-20/289","29","2020-07-06","384","255","Billing360@GANESH COMPUTER","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:38:59","2020-07-06 14:38:59","2020-07-06 14:38:59","0","29","1"),
("276","INQ/19-20/290","29","2020-07-06","385","256","BILLING360@YAMUNA CLOTHING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:39:45","2020-07-06 14:39:45","2020-07-06 14:39:45","0","29","1"),
("277","INQ/19-20/291","29","2020-07-06","386","257","Billing360@MATESHWARI TRADING COMPANY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:40:44","2020-07-06 14:40:44","2020-07-06 14:40:44","0","29","1"),
("278","INQ/19-20/292","29","2020-07-06","387","258","Billing360@NEELESH NANDA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:42:14","2020-07-06 14:42:14","2020-07-06 14:42:14","0","29","1"),
("279","INQ/19-20/293","29","2020-07-06","389","260","Billing360@JAY JALARAM STORE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:44:03","2020-07-06 14:44:03","2020-07-06 14:44:03","0","29","1"),
("280","INQ/19-20/294","29","2020-07-06","388","259","BILLING360@BHAGWATI CREATION","1970-01-01","17","5","10","5","9","7","10","68","0.00","","","2020-07-06 14:44:18","2020-07-06 14:44:18","2020-07-06 14:44:18","0","29","1"),
("281","INQ/19-20/295","29","2020-07-06","390","261","Billing360@MAHALAXMI ENTERPRISES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:45:58","2020-07-06 14:45:58","2020-07-06 14:45:58","0","29","1"),
("282","INQ/19-20/296","29","2020-07-06","391","262","Billing360@CHETANSINH VAGHELA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:47:16","2020-07-06 14:47:16","2020-07-06 14:47:16","0","29","1"),
("283","INQ/19-20/297","29","2020-07-06","392","263","BILLING360@SHARMA DARSHAN","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:48:10","2020-07-06 14:48:10","2020-07-06 14:48:10","0","29","1"),
("284","INQ/19-20/298","29","2020-07-06","393","264","Billing360@TASVIN PATEL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:48:34","2020-07-06 14:48:34","2020-07-06 14:48:34","0","29","1"),
("285","INQ/19-20/299","29","2020-07-06","394","267","Billing360@NAYADAUR TRADERS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:50:05","2020-07-06 14:52:11","2020-07-06 14:50:05","0","29","1"),
("286","INQ/19-20/300","29","2020-07-06","395","265","billing360@HARESH PANCHAL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:51:15","2020-07-06 14:51:15","2020-07-06 14:51:15","2","29","1"),
("287","INQ/19-20/301","29","2020-07-06","396","266","Billing360@OM MEDICAL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:51:42","2020-07-06 14:51:42","2020-07-06 14:51:42","0","29","1"),
("288","INQ/19-20/302","29","2020-07-06","397","268","Billing360KAMAL JHA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:54:58","2020-07-06 14:54:58","2020-07-06 14:54:58","0","29","1"),
("289","INQ/19-20/303","29","2020-07-06","398","269","billing360@AMIT PATEL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:58:45","2020-07-06 14:58:45","2020-07-06 14:58:45","0","29","1"),
("290","INQ/19-20/304","29","2020-07-06","399","270","Billing360@D.RAJA SPINTEX","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 14:58:49","2020-07-06 14:58:49","2020-07-06 14:58:49","0","29","1"),
("291","INQ/19-20/305","29","2020-07-06","400","271","Billing360@SKULL HOUSE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:00:12","2020-07-06 15:00:12","2020-07-06 15:00:12","0","29","1"),
("292","INQ/19-20/306","29","2020-07-06","402","273","Billing360@KRISHA ENTERPRISE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:02:01","2020-07-06 15:02:01","2020-07-06 15:02:01","0","29","1"),
("293","INQ/19-20/307","29","2020-07-06","401","272","BILLING360@BHAGWATI COMPUTERS","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:02:07","2020-07-06 15:02:07","2020-07-06 15:02:07","0","29","1"),
("294","INQ/19-20/308","29","2020-07-06","403","274","Billing360@PRAGNESH SHAH","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:03:35","2020-07-06 15:03:35","2020-07-06 15:03:35","0","29","1"),
("295","INQ/19-20/309","29","2020-07-06","405","276","Billing360@NAVSARJAN TRUST","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:06:08","2020-07-06 15:06:08","2020-07-06 15:06:08","0","29","1"),
("296","INQ/19-20/310","29","2020-07-06","404","275","BILLING360@SHIVAM TRADRES","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:06:12","2020-07-06 15:06:12","2020-07-06 15:06:12","0","29","1"),
("297","INQ/19-20/311","29","2020-07-06","406","278","Billing360@SNJY YOUTH CONAULTANT","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:07:37","2020-07-06 15:07:37","2020-07-06 15:07:37","0","29","1"),
("298","INQ/19-20/312","29","2020-07-06","407","279","billing360@KRISHNA MARKETING","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:10:08","2020-07-06 15:10:08","2020-07-06 15:10:08","0","29","1"),
("299","INQ/19-20/313","29","2020-07-06","408","280","Billing360@BAJRANG KIRANA STOR","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:11:31","2020-07-06 15:12:00","2020-07-06 15:11:31","0","29","1"),
("300","INQ/19-20/314","29","2020-07-06","410","282","Billing360@JEKI LALWANI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:13:54","2020-07-06 15:14:21","2020-07-06 15:13:54","0","29","1");
INSERT INTO tbl_inquiry VALUES
("301","INQ/19-20/315","29","2020-07-06","409","281","billing360@SWIFT TRANS LOGISTIC SOLUTIONS PVT LTD","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:14:32","2020-07-06 15:14:32","2020-07-06 15:14:32","0","29","1"),
("302","INQ/19-20/316","29","2020-07-06","411","283","Billing360@DILIP PATEL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:15:52","2020-07-06 15:15:52","2020-07-06 15:15:52","0","29","1"),
("303","INQ/19-20/317","29","2020-07-06","413","285","Billing360@HONEY SALES","1970-01-01","0","5","10","5","9","7","11","68","10000.00","","","2020-07-06 15:18:18","2020-07-06 15:18:18","2020-07-06 15:18:18","0","29","1"),
("304","INQ/19-20/318","29","2020-07-06","412","284","billing360@MEHTA GROUP","1970-01-01","17","5","10","5","9","7","10","68","0.00","","","2020-07-06 15:18:37","2020-07-06 15:18:37","2020-07-06 15:18:37","0","29","1"),
("305","INQ/19-20/319","32","2020-07-06","414","286","Billing360@BPCL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:20:00","2020-07-06 15:20:00","2020-07-06 15:20:00","0","32","1"),
("306","INQ/19-20/320","29","2020-07-06","415","287","Billing360@AAKRUTI DIGITAL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:20:06","2020-07-06 15:22:32","2020-07-06 15:20:06","0","29","1"),
("307","INQ/19-20/321","29","2020-07-06","416","288","billing360@HOTEL ROYAL","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:22:13","2020-07-06 15:22:13","2020-07-06 15:22:13","0","29","1"),
("308","INQ/19-20/322","32","2020-07-06","417","289","Billing360@TIWARI PBOTO SERVICE","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Purchased Vepar. Lead Lost","","2020-07-06 15:22:47","2020-07-14 13:58:53","2020-07-06 15:22:47","0","32","1"),
("309","INQ/19-20/323","29","2020-07-06","418","290","Billing360@NOVA MEDICAL DEVICES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:24:45","2020-07-06 15:24:45","2020-07-06 15:24:45","0","29","1"),
("310","INQ/19-20/324","29","2020-07-06","419","291","Billing360@ADANI WILMAR LTD","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:26:29","2020-07-06 15:26:55","2020-07-06 15:26:29","0","29","1"),
("311","INQ/19-20/325","29","2020-07-06","420","292","Billing360@SITARAM TRADING","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:28:21","2020-07-06 15:28:21","2020-07-06 15:28:21","0","29","1"),
("312","INQ/19-20/326","29","2020-07-06","423","295","Billing360@GREE AIR CONDITIONERS","1970-01-01","17","4","0","5","9","7","10","68","10000.00","","","2020-07-06 15:29:35","2020-07-06 15:29:35","2020-07-06 15:29:35","0","29","1"),
("313","INQ/19-20/327","32","2020-07-06","422","294","Billing360@RAUSHAN KUMAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","No is invalid","","2020-07-06 15:29:50","2020-07-14 13:08:36","2020-07-06 15:29:50","0","32","1"),
("314","INQ/19-20/328","29","2020-07-06","421","293","billing360@Jatin Patel","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:30:17","2020-07-06 15:30:17","2020-07-06 15:30:17","0","29","1"),
("315","INQ/19-20/329","29","2020-07-06","424","296","Billing360@CIMPRESS INDIA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:31:41","2020-07-06 15:31:41","2020-07-06 15:31:41","0","29","1"),
("316","INQ/19-20/330","29","2020-07-06","427","298","Billing360@ASPAK MALEK","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:33:06","2020-07-06 15:33:06","2020-07-06 15:33:06","0","29","1"),
("317","INQ/19-20/331","32","2020-07-06","426","299","Billing360@AYUSH INFOSYSTEM","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:33:10","2020-07-06 15:33:10","2020-07-06 15:33:10","0","32","1"),
("318","INQ/19-20/332","29","2020-07-06","425","297","billing360@SHREE HARI BIZ AND AGRO FERTILIZER","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:33:18","2020-07-06 15:33:18","2020-07-06 15:33:18","0","29","1"),
("319","INQ/19-20/333","29","2020-07-06","428","300","Billing360@SHIRISH SAVALIYA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:34:30","2020-07-06 15:34:30","2020-07-06 15:34:30","0","29","1"),
("320","INQ/19-20/334","29","2020-07-06","429","301","billing360@NAREN OZA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:36:24","2020-07-06 15:36:24","2020-07-06 15:36:24","0","29","1"),
("321","INQ/19-20/335","29","2020-07-06","430","302","Billing360@KUNAL TEXTILE","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:36:40","2020-07-06 15:36:40","2020-07-06 15:36:40","0","29","1"),
("322","INQ/19-20/336","29","2020-07-06","431","303","Billing360@PATEL TECHNOLOGY","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:38:30","2020-07-06 15:38:30","2020-07-06 15:38:30","0","29","1"),
("323","INQ/19-20/337","29","2020-07-06","433","305","Billing360@NILESH SHAH","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:40:42","2020-07-06 15:40:42","2020-07-06 15:40:42","0","29","1"),
("324","INQ/19-20/338","29","2020-07-06","432","304","billing360@ASHWIN SHINGALA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:41:42","2020-07-06 15:41:42","2020-07-06 15:41:42","0","29","1"),
("325","INQ/19-20/339","29","2020-07-06","434","306","BILLING360@VINAY MEHTA","1970-01-01","17","5","10","5","9","7","10","68","10000.00","","","2020-07-06 15:48:52","2020-07-06 15:48:52","2020-07-06 15:48:52","0","29","1"),
("326","INQ/19-20/340","29","2020-07-06","435","307","@BHARGAV MEHTA","1970-01-01","17","5","10","5","9","0","0","68","10000.00","","","2020-07-06 15:54:43","2020-07-06 15:55:17","2020-07-06 15:54:43","0","29","1"),
("327","INQ/19-20/341","1,27","2020-07-06","436","308","@HR TESTING","1970-01-01","0","11","90","4","9","8","10","68","15000.00","","","2020-07-06 16:07:25","2020-07-06 16:19:03","2020-07-06 16:07:25","2","27","1"),
("328","INQ/19-20/342","29","2020-07-06","438","309","Billing360@JAY GOPAL INDUSTRIES","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 16:40:28","2020-07-07 10:31:34","2020-07-06 16:40:28","0","29","1"),
("329","INQ/19-20/343","29","2020-07-06","439","310","CRM@LAXMI ENGINEERING WORKS","1970-01-01","0","5","10","5","9","8","11","68","35000.00","","","2020-07-06 16:55:43","2020-07-06 16:55:43","2020-07-06 16:55:43","0","29","1"),
("330","INQ/19-20/344","34","2020-07-06","440","311","billing360@ZED VALVES CO. PVT.LTD ","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 16:59:43","2020-07-06 16:59:43","2020-07-06 16:59:43","0","34","1"),
("331","INQ/19-20/345","28","2020-07-06","441","312","billing@JYOTI PLASTIC INDUSTRIES","1970-01-01","17","9","50","4","9","2","11","68","110000.00","wensday a meet kari ne final karvanu che","","2020-07-06 17:02:54","2020-07-08 10:36:27","2020-07-06 17:02:54","0","28","1"),
("332","INQ/19-20/346","34","2020-07-06","442","313","billing360@KAMBERT MACHINERY CO.PVT.LTD","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:03:09","2020-07-06 17:03:09","2020-07-06 17:03:09","0","34","1"),
("333","INQ/19-20/347","28","2020-07-06","92","0","billing@MACONS EQUIPMENTS PVT LTD","1970-01-01","17","12","0","5","9","2","11","68","0.00","","","2020-07-06 17:05:36","2020-07-14 16:56:14","2020-07-06 17:05:36","0","28","1"),
("334","INQ/19-20/348","34","2020-07-06","443","314","billing360@AEGIES ENGNIREEING CO .PVT.LTD ","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:07:17","2020-07-06 17:07:17","2020-07-06 17:07:17","0","34","1"),
("335","INQ/19-20/349","28","2020-07-06","41","315","billing@BHUMI ENGINERRING","1970-01-01","17","5","10","6","9","2","11","68","0.00","kale call back aapvano","","2020-07-06 17:09:32","2020-07-06 17:09:32","2020-07-06 17:09:32","0","28","1"),
("336","INQ/19-20/350","34","2020-07-06","445","316","billing360@PREMIER MILL STORE ","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:17:34","2020-07-06 17:17:34","2020-07-06 17:17:34","0","34","1"),
("337","INQ/19-20/351","1,28","2020-07-06","444","317","billing crm@NAYYADUR TRADSER","1970-01-01","17","5","10","5","9","2","11","68","0.00","","","2020-07-06 17:17:34","2020-07-06 17:17:34","2020-07-06 17:17:34","0","28","1"),
("338","INQ/19-20/352","29","2020-07-06","446","318","Billing360@COMET ELECTRICALS","1970-01-01","17","4","0","5","9","8","10","68","10000.00","Emni pase allready software che emne app vadu software jotu hatu.","","2020-07-06 17:29:11","2020-07-06 17:32:21","2020-07-06 17:29:11","0","29","1"),
("339","INQ/19-20/353","34","2020-07-06","447","319","billing360@ BHAGWATI SPHEROCAST ","1970-01-01","17","5","10","5","9","0","10","68","10000.00","","","2020-07-06 17:31:37","2020-07-06 17:31:37","2020-07-06 17:31:38","0","34","1"),
("340","INQ/19-20/354","34","2020-07-06","448","320","billing360@SCC INFRASTRUCTURE ","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:34:35","2020-07-06 17:34:35","2020-07-06 17:34:35","0","34","1"),
("341","INQ/19-20/355","29","2020-07-06","449","321","Billing360@SUJAL ENTERPRISE","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:37:48","2020-07-06 17:37:48","2020-07-06 17:37:48","0","29","1"),
("342","INQ/19-20/356","34","2020-07-06","450","322","billing360@NABROS PHARMA","1970-01-01","17","5","10","5","9","8","10","68","10000.00","","","2020-07-06 17:38:18","2020-07-06 17:39:14","2020-07-06 17:38:18","0","34","1"),
("343","INQ/19-20/357","34","2020-07-06","451","323","billing360@RAMA ENGINEERING","1970-01-01","17","5","10","5","9","2","10","68","10000.00","","","2020-07-06 17:48:29","2020-07-06 17:48:29","2020-07-06 17:48:29","0","34","1"),
("344","INQ/19-20/358","29","2020-07-06","452","324","Billing360+ Manufacturing Stock@SHIV ENGINEERING","1970-01-01","17","5","10","5","9","3","10","68","40000.00","","","2020-07-06 17:50:34","2020-07-06 17:50:34","2020-07-06 17:50:34","0","29","1"),
("345","INQ/19-20/359","32","2020-07-06","453","325","Billing360@M.A.Q MULTIVENTURES PVT LTD","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Tried many times but unable to connect","","2020-07-06 17:53:42","2020-07-14 16:08:30","2020-07-06 17:53:42","0","32","1"),
("346","INQ/19-20/360","32","2020-07-06","454","326","Billing360@CAPITAL COMPUTERS","1970-01-01","0","4","10","5","9","7","10","68","10000.00","Disconnected the call.","","2020-07-06 17:56:41","2020-07-11 12:00:00","2020-07-06 17:56:41","0","32","1"),
("347","INQ/19-20/361","34","2020-07-06","455","327","billing360@RATNAM LAMINATES PVT.LTD ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-06 17:58:47","2020-07-06 17:58:47","2020-07-06 17:58:47","0","34","1"),
("348","INQ/19-20/362","32","2020-07-06","456","328","Billing360@RAJENDRA KALLOLE","1970-01-01","0","5","10","6","9","7","10","68","10000.00","","","2020-07-06 17:58:47","2020-07-11 12:10:40","2020-07-06 17:58:47","0","32","1"),
("349","INQ/19-20/363","29","2020-07-06","457","329","Billing360@ANSHUL SABUWALA","1970-01-01","17","5","10","6","9","3","11","68","12000.00","","","2020-07-06 17:59:41","2020-07-06 17:59:41","2020-07-06 17:59:41","0","29","1"),
("350","INQ/19-20/364","32","2020-07-06","458","330","Billing360@RAJBOOK DIPOT","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:01:26","2020-07-06 18:01:26","2020-07-06 18:01:26","0","32","1"),
("351","INQ/19-20/365","32","2020-07-06","460","332","Billing360@PRIME MEDICO","1970-01-01","0","5","10","6","9","7","10","68","10000.00","","","2020-07-06 18:06:20","2020-07-09 10:44:46","2020-07-06 18:06:20","0","32","1"),
("352","INQ/19-20/366","34","2020-07-06","459","331","billing360@APEX  FORMULATIONS PVT .LTD ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-06 18:06:49","2020-07-06 18:06:49","2020-07-06 18:06:49","0","34","1"),
("353","INQ/19-20/367","32","2020-07-06","461","333","Billing360@ASRX INFRATECH PRIVATE LIMITED","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He already have a s/w and the features are same as our s/w so no need of other s/w.","","2020-07-06 18:09:50","2020-07-10 16:10:26","2020-07-06 18:09:50","0","32","1"),
("354","INQ/19-20/368","29","2020-07-06","462","334","Billing360@HITESH BHATI","1970-01-01","17","5","10","6","9","3","10","68","12000.00","","","2020-07-06 18:10:19","2020-07-06 18:10:19","2020-07-06 18:10:19","2","29","1"),
("355","INQ/19-20/369","32","2020-07-06","464","336","Billing360@PRADEEP SHARME","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Tried but never receives the call.","","2020-07-06 18:13:07","2020-07-14 12:00:54","2020-07-06 18:13:07","0","32","1"),
("356","INQ/19-20/370","34","2020-07-06","463","335","billing360@TRIO ELEVATORS COMPANY PVT .LTD ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-06 18:14:06","2020-07-06 18:14:06","2020-07-06 18:14:06","0","34","1"),
("357","INQ/19-20/371","32","2020-07-06","465","346","Billing360@RAMPRAVESH KUMAR","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:15:51","2020-07-06 18:35:02","2020-07-06 18:15:51","0","32","1"),
("358","INQ/19-20/372","32","2020-07-06","467","338","Billing360@SKYMAIL EXPRESS SERVICES PVT.LTD.","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He does not require the s/w.","","2020-07-06 18:18:06","2020-07-11 15:05:20","2020-07-06 18:18:06","0","32","1"),
("359","INQ/19-20/373","29","2020-07-06","466","337","Billing360@MAHALAXMI FURNITURE","1970-01-01","0","11","90","4","9","3","11","68","10000.00","","","2020-07-06 18:18:55","2020-07-06 18:18:55","2020-07-06 18:18:55","0","29","1"),
("360","INQ/19-20/374","34","2020-07-06","468","339","billing360@LEISTUNG ENGINEERING PVT .LTD ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-06 18:20:48","2020-07-06 18:20:48","2020-07-06 18:20:48","0","34","1"),
("361","INQ/19-20/375","32","2020-07-06","469","340","Billing360@S K PANDIT","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He told that currently he can\'t purchase s/w due to covid-19.","","2020-07-06 18:23:29","2020-07-10 16:11:07","2020-07-06 18:23:29","0","32","1"),
("362","INQ/19-20/376","34","2020-07-06","470","341","billing360@ALLMARC INDUSTRIES PVT .LTD ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-06 18:25:20","2020-07-06 18:25:20","2020-07-06 18:25:20","0","34","1"),
("363","INQ/19-20/377","32","2020-07-06","471","342","Billing360@ARATI ENGG . MACHINE MAIN","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He has purchases other s/w. Now he is not looking for any change","","2020-07-06 18:25:28","2020-07-10 16:11:38","2020-07-06 18:25:28","0","32","1"),
("364","INQ/19-20/378","32","2020-07-06","472","344","Billing360@AMROHA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:28:38","2020-07-06 18:32:01","2020-07-06 18:28:38","0","32","1"),
("365","INQ/19-20/379","32","2020-07-06","473","343","Billing360@AIRTE DISH","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Number does not exists. Mail sent","","2020-07-06 18:31:22","2020-07-11 15:14:30","2020-07-06 18:31:22","0","32","1"),
("366","INQ/19-20/380","32","2020-07-06","474","345","Billing360@RAHUL SHINGADE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:34:12","2020-07-06 18:34:12","2020-07-06 18:34:12","0","32","1"),
("367","INQ/19-20/381","32","2020-07-06","475","347","Billing360@S K SYSTEMS","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He is s/w developer and not in requirement of any s/w.","","2020-07-06 18:36:42","2020-07-11 12:09:42","2020-07-06 18:36:42","0","32","1"),
("368","INQ/19-20/382","32","2020-07-06","476","348","Billing360@SUDARSHAN CHEMICAL IND. LTD","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:40:20","2020-07-06 18:40:20","2020-07-06 18:40:20","0","32","1"),
("369","INQ/19-20/383","27,29,32","2020-07-06","477","349","Billing360@R T CHAVAN","1970-01-01","0","10","70","4","9","7","10","68","0.00","","","2020-07-06 18:43:46","2020-07-14 11:46:59","2020-07-06 18:43:46","0","32","1"),
("370","INQ/19-20/384","32","2020-07-06","478","350","Billing360@RUSHIKESH KRUSHI KENDRA BULDANA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:45:49","2020-07-06 18:45:49","2020-07-06 18:45:49","0","32","1"),
("371","INQ/19-20/385","32","2020-07-06","479","351","Billing360@VIJAY CHOUDHARY","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He disconnected the call without listening to anything","","2020-07-06 18:48:13","2020-07-10 16:14:40","2020-07-06 18:48:13","0","32","1"),
("372","INQ/19-20/386","32","2020-07-06","480","352","Billing360@NANDKISHOR ENG & ENT","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He inquired long back and does not require s/w now. Lead close.","","2020-07-06 18:50:45","2020-07-14 10:53:30","2020-07-06 18:50:45","0","32","1"),
("373","INQ/19-20/387","32","2020-07-06","481","353","Billing360@KISAN AGENCIES","1970-01-01","0","4","0","5","9","7","10","68","10000.00","They don\'t require the s/w.They have other s/w and not looking for new.","","2020-07-06 18:53:21","2020-07-11 17:16:01","2020-07-06 18:53:21","0","32","1"),
("374","INQ/19-20/388","32","2020-07-06","482","354","Billing360@ANK DIGITAL SYSTEMS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-06 18:55:53","2020-07-06 18:55:53","2020-07-06 18:55:53","0","32","1"),
("375","INQ/19-20/389","32","2020-07-06","483","355","Billing360@AMAN TRANDING CO","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-06 18:57:47","2020-07-09 18:43:38","2020-07-06 18:57:47","0","32","1"),
("376","INQ/19-20/390","32","2020-07-06","485","356","Billing360@SHREE BALAJI ENTERPRISE","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Number is invalid","","2020-07-06 19:11:04","2020-07-11 14:58:06","2020-07-06 19:11:04","0","32","1"),
("377","INQ/19-20/391","32","2020-07-06","486","357","Billing360@TATAN CYCLE MART.","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Tried many times but did not get any reply.","","2020-07-06 19:15:21","2020-07-14 13:10:43","2020-07-06 19:15:21","0","32","1"),
("378","INQ/19-20/392","29","2020-07-07","487","358","Billing360@GOPAL KRISHNA FOUNDARY","1970-01-01","17","5","10","6","9","3","10","68","15000.00","","","2020-07-07 10:25:28","2020-07-07 10:25:28","2020-07-07 10:25:28","0","29","1"),
("379","INQ/19-20/393","28","2020-07-07","488","359","billing@A Patel Engineers","1970-01-01","17","12","0","6","9","2","11","68","0.00","","","2020-07-07 10:47:21","2020-07-14 16:55:23","2020-07-07 10:47:21","0","28","1"),
("380","INQ/19-20/394","29","2020-07-07","489","360","CRM360 @AANAL INDUSTRIES","1970-01-01","17","5","10","5","9","3","11","68","35000.00","","","2020-07-07 10:52:33","2020-07-07 10:52:33","2020-07-07 10:52:33","0","29","1"),
("381","INQ/19-20/395","28","2020-07-07","160","361","billing@Keshav Metal Products","1970-01-01","17","5","10","6","9","2","11","68","0.00","","","2020-07-07 10:53:15","2020-07-07 10:53:15","2020-07-07 10:53:15","0","28","1"),
("382","INQ/19-20/396","29","2020-07-07","490","362","Billing360@SHIV BORNING","1970-01-01","17","9","50","5","9","3","10","68","18000.00","","","2020-07-07 11:23:59","2020-07-08 00:23:59","2020-07-07 11:23:59","0","29","1"),
("383","INQ/19-20/397","28","2020-07-07","491","363","BILLING@INDIA FLUDE POWER","1970-01-01","17","5","10","5","9","2","11","68","0.00","","","2020-07-07 11:26:00","2020-07-07 11:26:18","2020-07-07 11:26:00","0","28","1"),
("384","INQ/19-20/398","29","2020-07-07","492","364","@KHODIYAR GRINDING","1970-01-01","17","4","0","5","9","3","11","68","18000.00","te manually bill banve  che but emni pase computer and printer nathi and emne atyre koi requirement nathi.","","2020-07-07 11:32:13","2020-07-07 11:32:13","2020-07-07 11:32:13","0","29","1"),
("385","INQ/19-20/399","29","2020-07-07","493","365","Billing360@YanunaGRINDING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","","","2020-07-07 11:34:55","2020-07-07 11:49:57","2020-07-07 11:34:55","0","29","1"),
("386","INQ/19-20/400","32","2020-07-07","494","366","Billimg360@SMIT SRIVASTAVA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:37:38","2020-07-07 11:37:38","2020-07-07 11:37:38","0","32","1"),
("387","INQ/19-20/401","32","2020-07-07","495","367","Billing360@AL-MIA TRADERS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:40:04","2020-07-07 11:40:04","2020-07-07 11:40:04","0","32","1"),
("388","INQ/19-20/402","29","2020-07-07","496","368","Billing360@YASH ENGINEERING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer and printer nathi  and emne  monthly 2 j invoice banta hoy che so atyare koi requirement nathi.","","2020-07-07 11:41:16","2020-07-07 11:41:16","2020-07-07 11:41:16","0","29","1"),
("389","INQ/19-20/403","32","2020-07-07","497","369","Billing360@GANESH HARDWER","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Did not receive the call. He called back and then told that he is not interested and disconnected ","","2020-07-07 11:42:28","2020-07-10 16:06:38","2020-07-07 11:42:28","0","32","1"),
("390","INQ/19-20/404","32","2020-07-07","498","370","Billing360@SUJIT PRASAD","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:45:28","2020-07-07 11:45:28","2020-07-07 11:45:29","0","32","1"),
("391","INQ/19-20/405","32","2020-07-07","499","371","Billing360@TADOBA-ANDHARI TIGER RESERVESAFARI & HOTEL BOOKING","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:47:41","2020-07-07 11:47:41","2020-07-07 11:47:42","0","32","1"),
("392","INQ/19-20/406","32","2020-07-07","500","372","Billing360@AAMIS INCORPORATION","1970-01-01","0","4","0","5","9","7","10","68","10000.00","","","2020-07-07 11:50:07","2020-07-10 17:30:03","2020-07-07 11:50:07","0","32","1"),
("393","INQ/19-20/407","32","2020-07-07","502","374","Billing360@MOHAMMAD TARIQ","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:54:20","2020-07-07 11:54:47","2020-07-07 11:54:20","0","32","1"),
("394","INQ/19-20/408","32","2020-07-07","503","375","Billing360@KK INDUSTRIES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 11:57:47","2020-07-07 11:57:47","2020-07-07 11:57:47","0","32","1"),
("395","INQ/19-20/409","32","2020-07-07","504","376","Billing360@YERUVA SRINIVAS REDDY","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:00:17","2020-07-07 12:00:17","2020-07-07 12:00:17","0","32","1"),
("396","INQ/19-20/410","29","2020-07-07","505","377","Billing360@SHREENATH ENGINEERING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 12:02:48","2020-07-07 12:02:48","2020-07-07 12:02:48","0","29","1"),
("397","INQ/19-20/411","32","2020-07-07","506","378","Billing360@SAMA INDUSTRIES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:03:28","2020-07-07 12:03:28","2020-07-07 12:03:28","0","32","1"),
("398","INQ/19-20/412","32","2020-07-07","507","379","Billing360@DEEPAK PAL","1970-01-01","0","5","10","0","0","7","10","68","10000.00","","","2020-07-07 12:05:25","2020-07-07 12:05:25","2020-07-07 12:05:25","0","32","1"),
("399","INQ/19-20/413","32","2020-07-07","508","380","Billing360@H.N. BATTERIES","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:07:28","2020-07-07 12:07:28","2020-07-07 12:07:28","0","32","1"),
("400","INQ/19-20/414","29","2020-07-07","509","381","Billing360@RIDDHI ENGINEERING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 12:08:31","2020-07-07 12:08:31","2020-07-07 12:08:31","0","29","1");
INSERT INTO tbl_inquiry VALUES
("401","INQ/19-20/415","32","2020-07-07","510","382","Billing360@PVR CINEMAS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:09:43","2020-07-07 12:09:43","2020-07-07 12:09:43","0","32","1"),
("402","INQ/19-20/416","32","2020-07-07","512","384","Billing360@PANKAJ KUMAR SINGH","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He has already purchased the s/w.","","2020-07-07 12:12:26","2020-07-11 16:12:44","2020-07-07 12:12:26","0","32","1"),
("403","INQ/19-20/417","29","2020-07-07","511","383","Billing360@VIRSON ENGINEERING","1970-01-01","0","5","10","5","9","3","10","68","18000.00","","","2020-07-07 12:13:16","2020-07-07 12:13:16","2020-07-07 12:13:16","0","29","1"),
("404","INQ/19-20/418","27,28","2020-07-07","513","385","ERP & WEB@INDIAN ION EXCHANGE & CHEMICALS LIMITED","2020-08-29","17","5","10","5","9","2","12","68","0.00","mihir sir ne pass on karvani che ERP mate nd web mate next month ma plan karvanu che client ne","","2020-07-07 12:13:55","2020-07-13 13:53:46","2020-07-07 12:13:55","0","28","1"),
("405","INQ/19-20/419","32","2020-07-07","514","386","Billing360@SANJAY BEMBDE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:14:48","2020-07-07 12:14:48","2020-07-07 12:14:48","0","32","1"),
("406","INQ/19-20/420","32","2020-07-07","515","387","Billing360@NIWAS PATIL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:16:40","2020-07-07 12:16:40","2020-07-07 12:16:40","0","32","1"),
("407","INQ/19-20/421","32","2020-07-07","516","388","Billing360@SIMCO CREATIONS","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Billing360-Analysing Business Performance","","2020-07-07 12:20:48","2020-07-10 16:05:54","2020-07-07 12:20:48","0","32","1"),
("408","INQ/19-20/422","32","2020-07-07","517","389","Billing360@MUKESH AGENCY","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:23:23","2020-07-07 12:23:23","2020-07-07 12:23:23","0","32","1"),
("409","INQ/19-20/423","32","2020-07-07","518","390","Billing360@RAHUL PANDEY","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He has purchases other s/w. Now he is not looking for any change","","2020-07-07 12:26:04","2020-07-10 16:07:49","2020-07-07 12:26:04","0","32","1"),
("410","INQ/19-20/424","32","2020-07-07","519","391","Billing360@SONU KURELE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:28:17","2020-07-07 12:28:17","2020-07-07 12:28:17","0","32","1"),
("411","INQ/19-20/425","32","2020-07-07","520","392","Billing360@ARSH COMMON SERVIC","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:31:16","2020-07-07 12:31:16","2020-07-07 12:31:16","0","32","1"),
("412","INQ/19-20/426","32","2020-07-07","521","393","Billing360@SAI E SERVICES AND COMPUTER","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:33:51","2020-07-07 12:33:51","2020-07-07 12:33:51","0","32","1"),
("413","INQ/19-20/427","32","2020-07-07","522","394","Billing360@RAMDAS BARGAJE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:35:31","2020-07-07 12:36:21","2020-07-07 12:35:31","0","32","1"),
("414","INQ/19-20/428","32","2020-07-07","523","395","Billing360@RAKESH PRAJAPATI","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:37:52","2020-07-07 12:37:52","2020-07-07 12:37:52","0","32","1"),
("415","INQ/19-20/429","32","2020-07-07","524","396","Billing360@RAJEEV KUMAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Tried connecting but did not get any response","","2020-07-07 12:44:24","2020-07-10 16:01:43","2020-07-07 12:44:24","0","32","1"),
("416","INQ/19-20/430","29","2020-07-07","525","397","Billing360@JAY DURGA BLACKODIES","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 12:45:22","2020-07-07 12:45:22","2020-07-07 12:45:22","0","29","1"),
("417","INQ/19-20/431","32","2020-07-07","526","398","Billing360@AJEET SINGH","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-07 12:46:39","2020-07-07 12:46:39","2020-07-07 12:46:39","0","32","1"),
("418","INQ/19-20/432","29","2020-07-07","527","399","Billing360@SHREEJI ENTERPRISE","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Already have a tally . so not require any software.","","2020-07-07 12:52:45","2020-07-07 12:52:45","2020-07-07 12:52:45","0","29","1"),
("419","INQ/19-20/433","29","2020-07-07","528","400","Billing360@GANGA TRANSMISSION","1970-01-01","17","5","10","5","9","3","10","68","18000.00","","","2020-07-07 13:04:02","2020-07-07 13:04:02","2020-07-07 13:04:02","0","29","1"),
("420","INQ/19-20/434","29","2020-07-07","529","401","Billing360@BIVESH HEAT TREATERS","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 13:11:16","2020-07-07 13:11:16","2020-07-07 13:11:16","0","29","1"),
("421","INQ/19-20/435","29","2020-07-07","530","402","Billing360@MAHESH FORGING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 13:20:09","2020-07-07 13:20:09","2020-07-07 13:20:09","0","29","1"),
("422","INQ/19-20/436","29","2020-07-07","531","403","Billing360@MAHI ENGINEERING","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 14:12:16","2020-07-07 14:12:16","2020-07-07 14:12:16","0","29","1"),
("423","INQ/19-20/437","29","2020-07-07","532","404","Billing360@KOMAL FOUNDARY","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 14:17:58","2020-07-07 14:17:58","2020-07-07 14:17:58","0","29","1"),
("424","INQ/19-20/438","29","2020-07-07","541","413","Billing360@A.G.PATTERNS","1970-01-01","17","4","0","5","9","3","10","68","18000.00","Emni pase computer ke printer nathi and emne software ni requirement nathi.","","2020-07-07 15:14:15","2020-07-07 15:14:15","2020-07-07 15:14:15","0","29","1"),
("425","INQ/19-20/439","29","2020-07-07","542","414","Billing360@KRISHNA ENGINEERING","1970-01-01","17","5","10","5","9","3","10","68","18000.00","","","2020-07-07 15:19:52","2020-07-07 15:19:52","2020-07-07 15:19:52","0","29","1"),
("426","INQ/19-20/440","29","2020-07-07","543","415","Billing360@SHREE AMBICA ENGINEERING(SPARK)","1970-01-01","17","5","10","5","9","3","10","68","0.00","","","2020-07-07 15:25:19","2020-07-07 15:25:19","2020-07-07 15:25:19","0","29","1"),
("427","INQ/19-20/441","28","2020-07-07","544","416","billing@JAYDEEP CONTROLS","1970-01-01","17","12","0","6","9","2","11","68","0.00","billing data","","2020-07-07 15:40:35","2020-07-13 15:51:40","2020-07-07 15:40:35","0","28","1"),
("428","INQ/19-20/442","29","2020-07-07","545","417","Billing360@MADHAV ENGINEERING","1970-01-01","17","9","50","6","9","3","10","68","18000.00","","","2020-07-07 15:41:20","2020-07-07 15:41:20","2020-07-07 15:41:20","0","29","1"),
("429","INQ/19-20/443","28","2020-07-07","546","418","BILLING@OCLEG CONTROLS","1970-01-01","17","12","0","6","9","2","11","68","0.00","BILLING DATA","","2020-07-07 16:05:09","2020-07-14 16:47:50","2020-07-07 16:05:09","0","28","1"),
("430","INQ/19-20/444","28","2020-07-07","547","451","billing@APEX DIGI SCALE AND CONTROL","1970-01-01","17","11","90","5","9","2","11","68","0.00","billing data","","2020-07-07 16:52:10","2020-07-14 14:09:19","2020-07-07 16:52:10","0","28","1"),
("431","INQ/19-20/445","29","2020-07-07","549","421","Billing360@HITESH BHATI","1970-01-01","17","5","10","5","9","3","10","68","10000.00","","","2020-07-07 17:25:14","2020-07-07 17:25:14","2020-07-07 17:25:14","0","29","1"),
("432","INQ/19-20/446","28","2020-07-07","550","422","billing@YOPRO AUTOMATION SOLUTION","1970-01-01","17","9","50","4","9","2","11","68","0.00","billing data","","2020-07-07 17:50:10","2020-07-08 14:13:59","2020-07-07 17:50:10","0","28","1"),
("433","INQ/19-20/447","28","2020-07-08","551","423","BILLING@PANCHAL ENGINEERING ","1970-01-01","17","12","0","6","9","2","10","68","0.00","","","2020-07-08 11:55:51","2020-07-14 16:46:59","2020-07-08 11:55:51","0","28","1"),
("434","INQ/19-20/448","28","2020-07-08","552","424","BILLING@SAHAKAR MACHINE TOOLS","1970-01-01","17","5","10","5","9","2","11","68","0.00","BILLING DATA\n\n","","2020-07-08 12:02:34","2020-07-08 12:03:08","2020-07-08 12:02:34","0","28","1"),
("435","INQ/19-20/449","32","2020-07-08","553","425","Billing360@MOHAMMAD SHAHNAWAZ","1970-01-01","0","9","50","6","9","7","10","68","10000.00","","","2020-07-08 13:13:10","2020-07-09 10:45:41","2020-07-08 13:13:10","0","32","1"),
("436","INQ/19-20/450","1,28","2020-07-08","554","426","billing@VIJAY MODALUNG INDUSTRIES","1970-01-01","17","12","0","6","9","2","10","68","0.00","","","2020-07-08 14:27:13","2020-07-14 16:39:55","2020-07-08 14:27:13","0","28","1"),
("437","INQ/19-20/451","28","2020-07-08","555","427","billing@VISHAL ELECTRICALS","1970-01-01","17","9","50","4","9","2","11","68","0.00","billing data\n","","2020-07-08 16:12:14","2020-07-09 10:45:57","2020-07-08 16:12:14","0","28","1"),
("438","INQ/19-20/452","28","2020-07-08","556","428","billing@GEMS ENGINEERING WORKS","1970-01-01","17","5","10","5","9","2","11","68","0.00","billing data\nhamda mans nathi aavse tyare same thi call back aapse","","2020-07-08 16:54:45","2020-07-13 14:40:22","2020-07-08 16:54:45","0","28","1"),
("439","INQ/19-20/453","28","2020-07-08","557","438","billing@VIRKRUPA ENGINERS","1970-01-01","17","11","90","5","9","2","11","68","0.00","billing data","","2020-07-08 17:40:11","2020-07-10 14:28:20","2020-07-08 17:40:11","0","28","1"),
("440","INQ/19-20/454","28","2020-07-08","558","430","billing@GANESH PLASTICS ","1970-01-01","17","5","10","6","9","2","10","68","0.00","billing data","","2020-07-08 17:51:41","2020-07-08 17:51:41","2020-07-08 17:51:41","0","28","1"),
("441","INQ/19-20/455","28","2020-07-08","559","431","billing@GANESH ROPE ","1970-01-01","21","12","0","6","9","2","11","68","0.00","billing data\nnot requre \nusing telly","","2020-07-08 18:00:41","2020-07-13 14:33:03","2020-07-08 18:00:41","0","28","1"),
("442","INQ/19-20/456","28","2020-07-09","560","432","billing nd web@GAUTAM MININGS PVT LTD ","1970-01-01","21","5","10","6","9","2","11","68","0.00","billing data","","2020-07-09 11:10:12","2020-07-09 11:10:12","2020-07-09 11:10:12","0","28","1"),
("443","INQ/19-20/457","32","2020-07-09","561","434","Billing360@RAJEEV GARG","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He has purchased other s/w.","","2020-07-09 17:14:49","2020-07-10 16:12:50","2020-07-09 17:14:49","0","32","1"),
("444","INQ/19-20/458","32","2020-07-10","562","435","Billing360@SACHIN MADANE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-10 10:48:04","2020-07-10 10:48:04","2020-07-10 10:48:04","0","32","1"),
("445","INQ/19-20/459","29","2020-07-09","563","436","Billing360@MAHADEV ENGINEERING WORKS","1970-01-01","17","8","100","6","9","10","11","68","14500.00","","","2020-07-10 12:51:04","2020-07-10 13:02:59","2020-07-10 12:51:04","0","29","1"),
("446","INQ/19-20/460","29","2020-07-10","564","437","Billing360@KESHAR INDUSTRIES","1970-01-01","17","4","0","5","9","10","11","68","21000.00","Emne demo api didho che but Right now emne koi requirement nathi software ni.","Emne demo api didho che but Right now emne koi requirement nathi software ni.","2020-07-10 13:06:19","2020-07-13 10:28:36","2020-07-10 13:06:19","0","29","1"),
("447","INQ/19-20/461","28","2020-07-10","565","439","BILLING@SHREEJI ENGINEERING","1970-01-01","17","8","100","4","9","10","11","68","14500.00","BILLING DATA","","2020-07-10 15:51:39","2020-07-13 18:52:41","2020-07-10 15:51:39","0","28","1"),
("448","INQ/19-20/462","33","2020-07-10","566","440","billing360@SNEHAL SANBHVI","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 17:58:39","2020-07-10 17:58:39","2020-07-10 17:58:39","0","33","1"),
("449","INQ/19-20/463","33","2020-07-10","567","441","billing360@freeion engneering pvt ltd ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:04:56","2020-07-10 18:05:29","2020-07-10 18:04:56","0","33","1"),
("450","INQ/19-20/464","33","2020-07-10","569","442","billing360@UNNATI MECH","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:21:10","2020-07-10 18:21:10","2020-07-10 18:21:10","0","33","1"),
("451","INQ/19-20/465","33","2020-07-10","570","443","billing360@NUREE PLASTIC ","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:26:06","2020-07-10 18:26:06","2020-07-10 18:26:06","0","33","1"),
("452","INQ/19-20/466","34","2020-07-10","571","450","biling360@BALAJI INDUESTRI","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:31:59","2020-07-11 10:28:50","2020-07-10 18:31:59","0","34","1"),
("453","INQ/19-20/467","34","2020-07-10","572","449","billing360@BHAVNA CHEMICALS","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:39:48","2020-07-11 10:27:30","2020-07-10 18:39:48","0","34","1"),
("454","INQ/19-20/468","34","2020-07-10","573","445","billing360@CADUM ENTERPRISE","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:42:51","2020-07-10 18:42:51","2020-07-10 18:42:51","0","34","1"),
("455","INQ/19-20/469","34","2020-07-10","574","446","billing360@CARE WELL PACKAGING INDUSTRIES","1970-01-01","17","5","10","5","9","8","10","68","18000.00","","","2020-07-10 18:45:48","2020-07-10 18:45:48","2020-07-10 18:45:48","0","34","1"),
("456","INQ/19-20/470","1,27","2020-07-10","575","447","CRM & Billing@ROOT IMMIGRATION","2020-07-15","0","13","99","4","9","3","10","68","55000.00","Demo Given at metR office. awaiting for payment earliest","","2020-07-10 22:56:27","2020-07-13 12:30:37","2020-07-10 22:56:27","0","27","1"),
("457","INQ/19-20/471","1,27","2020-07-10","576","448","ERP @R B Automation","2020-07-31","0","10","70","4","9","10","10","68","500000.00","","","2020-07-10 23:03:54","2020-07-14 14:17:27","2020-07-10 23:03:54","0","27","1"),
("458","INQ/19-20/472","1,27,36","2020-07-13","577","452","CRM @V C Gruh Udhyog","2020-07-30","17","7","25","4","9","3","11","68","50000.00","","","2020-07-13 10:29:43","2020-07-13 17:09:52","2020-07-13 10:29:43","2","27","1"),
("459","INQ/19-20/473","29","2020-07-13","578","453","Billing360@HARESH INDUSTRIES","1970-01-01","17","8","100","6","9","7","11","68","12000.00","","","2020-07-13 11:00:55","2020-07-13 18:54:46","2020-07-13 11:00:55","0","29","1"),
("460","INQ/19-20/474","32","2020-07-13","579","454","Billing360@AKSHAY PANASARA","1970-01-01","0","4","0","5","9","7","10","68","10000.00","His requirements do not match our s/w.","","2020-07-13 11:55:57","2020-07-13 18:53:39","2020-07-13 11:55:57","0","32","1"),
("461","INQ/19-20/475","32","2020-07-13","580","455","Billing360@ZYDUS HOSPITALS","1970-01-01","0","4","0","5","9","7","10","68","9000.00","He does not require s/w and he did not inquiry for the same.","","2020-07-13 11:59:58","2020-07-13 18:54:23","2020-07-13 11:59:58","0","32","1"),
("462","INQ/19-20/476","32","2020-07-13","581","458","Billing360@SHARDA GLASS AND ALUMINUM","1970-01-01","0","5","10","5","9","0","10","68","9000.00","","","2020-07-13 12:04:23","2020-07-13 19:00:24","2020-07-13 12:04:23","0","32","1"),
("463","INQ/19-20/477","27,32","2020-07-13","582","456","Billing360@RANJAN SCULPTING STUDIO","1970-01-01","0","5","10","6","9","7","10","68","9000.00","","","2020-07-13 12:17:01","2020-07-13 18:56:30","2020-07-13 12:17:01","0","32","1"),
("464","INQ/19-20/478","32","2020-07-13","583","457","Billing360@GD ENTERPRISE","1970-01-01","0","4","0","5","9","7","10","68","10000.00","He inquired by mistake and is currently doing job.","","2020-07-13 12:22:09","2020-07-13 18:58:38","2020-07-13 12:22:09","0","32","1"),
("465","INQ/19-20/479","32","2020-07-13","584","459","Billing360@KINGSTAR ENTERPRISE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 12:46:27","2020-07-13 13:14:40","2020-07-13 12:46:27","0","32","1"),
("466","INQ/19-20/480","1,27","2020-07-13","585","460","CRM @Vira Group","2020-07-30","0","9","50","4","9","3","11","68","80000.00","","","2020-07-13 12:58:12","2020-07-13 17:07:32","2020-07-13 12:58:12","0","27","1"),
("467","INQ/19-20/481","32","2020-07-13","586","461","Billing360@DEVYANI FASHIONS","1970-01-01","0","9","50","6","9","7","0","68","8000.00","","","2020-07-13 13:21:29","2020-07-13 13:21:29","2020-07-13 13:21:29","0","32","1"),
("468","INQ/19-20/482","32","2020-07-13","587","462","Billing360@ASV TRADERS","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 13:35:50","2020-07-13 19:01:29","2020-07-13 13:35:50","0","32","1"),
("469","INQ/19-20/483","28,33","2020-07-13","588","463","billing360@MARUTI AIR COMPRESSOR","1970-01-01","17","9","50","5","9","2","11","68","18000.00","","","2020-07-13 16:52:56","2020-07-13 17:36:35","2020-07-13 16:52:56","0","33","1"),
("470","INQ/19-20/484","1,27","2020-07-13","3","3","@METRO LUBRICANT","1970-01-01","0","9","50","4","9","0","0","68","350000.00","","","2020-07-13 17:05:57","2020-07-13 17:08:52","2020-07-13 17:05:57","0","1","1"),
("471","INQ/19-20/485","1,27,36","2020-07-13","577","452","CRM Software @V C Gruh Udhyog","2020-07-31","0","9","50","4","9","3","10","68","50000.00","","","2020-07-13 17:15:11","2020-07-14 10:47:00","2020-07-13 17:15:11","0","36","1"),
("472","INQ/19-20/486","1,27,36","2020-07-13","589","464","ERP @MAKWEL INDUSTRIES ( SAMRAT THRESHER)","1970-01-01","0","4","0","4","0","0","11","68","500000.00","He bought ST ERP last week","","2020-07-13 18:45:46","2020-07-14 14:15:41","2020-07-13 18:45:46","0","27","1"),
("473","INQ/19-20/487","32","2020-07-13","590","465","Billing360@SHRI RAM EQUIPMENT FINANCE CO LTD","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 18:51:45","2020-07-13 18:51:45","2020-07-13 18:51:45","0","32","1"),
("474","INQ/19-20/488","32","2020-07-13","591","466","Billing360@MANASIYA ZULFIKAR","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Invalid Inquiry","","2020-07-13 19:04:20","2020-07-14 15:46:44","2020-07-13 19:04:20","0","32","1"),
("475","INQ/19-20/489","32","2020-07-13","592","0","Billing360@HARESH PANCHAL","1970-01-01","0","4","0","5","9","7","10","68","10000.00","Purchased s/w last week.Entry left","","2020-07-13 19:09:30","2020-07-13 19:09:30","2020-07-13 19:09:30","0","32","1"),
("476","INQ/19-20/490","32","2020-07-13","593","467","Billing360@KAMAL JHA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 19:15:56","2020-07-13 19:15:56","2020-07-13 19:15:56","0","32","1"),
("477","INQ/19-20/491","32","2020-07-13","594","468","Billing360@PARAS TIMBER","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 19:19:16","2020-07-13 19:19:16","2020-07-13 19:19:16","0","32","1"),
("478","INQ/19-20/492","32","2020-07-13","595","469","Billing360@METRO LUBRICANT","1970-01-01","0","5","10","6","9","0","10","68","10000.00","","","2020-07-13 19:22:28","2020-07-13 19:22:28","2020-07-13 19:22:28","0","32","1"),
("479","INQ/19-20/493","32","2020-07-13","596","470","Billing360@GUJARAT STEEL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 19:26:13","2020-07-13 19:26:13","2020-07-13 19:26:13","0","32","1"),
("480","INQ/19-20/494","32","2020-07-13","597","471","Billing360@GOLD STAR POWER  LTD","1970-01-01","0","5","10","6","9","7","10","68","10000.00","","","2020-07-13 19:29:39","2020-07-13 19:29:39","2020-07-13 19:29:39","0","32","1"),
("481","INQ/19-20/495","27,32","2020-07-13","598","472","Billing360@DHARMESH JANI","1970-01-01","0","9","50","6","0","7","10","68","9000.00","","","2020-07-13 19:33:50","2020-07-14 11:43:42","2020-07-13 19:33:50","0","32","1"),
("482","INQ/19-20/496","32","2020-07-13","599","473","Billing360@SHARMA DARSHAN","1970-01-01","0","5","10","6","9","7","10","68","10000.00","","","2020-07-13 19:37:27","2020-07-13 19:37:27","2020-07-13 19:37:27","0","32","1"),
("483","INQ/19-20/497","32","2020-07-13","600","474","Billing360@PRASHANT","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-13 19:40:17","2020-07-13 19:40:17","2020-07-13 19:40:17","0","32","1"),
("484","INQ/19-20/498","33","2020-07-14","601","475","billing360@ARTI ENGINEERING WORKS","1970-01-01","17","5","10","5","0","0","10","68","18000.00","","","2020-07-14 12:48:36","2020-07-14 12:48:36","2020-07-14 12:48:36","0","33","1"),
("485","INQ/19-20/499","32","2020-07-14","602","476","Billing360@UMANG PATEL","1970-01-01","0","5","10","5","9","7","0","68","10000.00","","","2020-07-14 14:20:43","2020-07-14 14:20:43","2020-07-14 14:20:43","0","32","1"),
("486","INQ/19-20/500","32","2020-07-14","603","477","Billing360@SAURABH SOLANKI","1970-01-01","0","4","0","5","9","7","0","68","10000.00","","","2020-07-14 14:26:28","2020-07-14 14:26:28","2020-07-14 14:26:28","0","32","1"),
("487","INQ/19-20/501","32","2020-07-14","604","478","Billing360@MANSUR VORHA","1970-01-01","0","5","10","6","9","7","0","68","10000.00","","","2020-07-14 14:32:37","2020-07-14 14:32:37","2020-07-14 14:32:37","0","32","1"),
("488","INQ/19-20/502","32","2020-07-14","605","479","Billing360@S S SERVICE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 14:36:49","2020-07-14 14:36:49","2020-07-14 14:36:49","0","32","1"),
("489","INQ/19-20/503","32","2020-07-14","606","480","Billing360@PARTH PACKGING ","1970-01-01","0","9","50","5","9","7","10","68","10000.00","","","2020-07-14 14:48:26","2020-07-14 14:48:26","2020-07-14 14:48:26","0","32","1"),
("490","INQ/19-20/504","32","2020-07-14","607","481","Billing360@ARVINDA ENTERPRISE","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 14:52:49","2020-07-14 14:52:49","2020-07-14 14:52:49","0","32","1"),
("491","INQ/19-20/505","32","2020-07-14","608","482","Billing360@KUSHAL VALECHHA","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 14:56:42","2020-07-14 14:56:42","2020-07-14 14:56:42","0","32","1"),
("492","INQ/19-20/506","32","2020-07-14","609","483","Billing360@SHREE RANG LOGISTICS PVT LTD","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 14:59:23","2020-07-14 15:14:58","2020-07-14 14:59:23","0","32","1"),
("493","INQ/19-20/507","32","2020-07-14","610","484","Billing360@THE PLY HUB","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 15:02:10","2020-07-14 15:15:40","2020-07-14 15:02:10","0","32","1"),
("494","INQ/19-20/508","32","2020-07-14","611","0","Billing360@ANIKET","1970-01-01","0","4","0","5","9","7","0","68","10000.00","Invalid Inquiry","","2020-07-14 15:49:41","2020-07-14 15:49:41","2020-07-14 15:49:41","0","32","1"),
("495","INQ/19-20/509","32","2020-07-14","612","485","Billing360@CHIRAG PATEL","1970-01-01","0","5","10","5","9","7","10","68","10000.00","","","2020-07-14 15:55:07","2020-07-14 15:55:07","2020-07-14 15:55:07","0","32","1"),
("496","INQ/19-20/510","28","2020-07-14","613","486","BILLING & WEB@PARTH ENTERPRISE","1970-01-01","17","5","10","5","8","2","11","68","0.00","","","2020-07-14 16:17:37","2020-07-14 16:17:37","2020-07-14 16:17:37","0","28","1");




CREATE TABLE `tbl_inquiry_trn` (
  `inquiry_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `pg_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `product_qty` double NOT NULL,
  `unitid` int(11) NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_spec` longtext NOT NULL,
  `inquiry_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inquiry_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=latin1;


INSERT INTO tbl_inquiry_trn VALUES
("1","0","1","0","30","0","1","0","1400.00","1400.00","","","2","1","1"),
("2","1","2","0","21","0","1","0","32000.00","32000.00","","","0","1","1"),
("3","2","2","0","21","0","1","0","35000.00","35000.00","","","0","1","1"),
("4","3","2","0","21","0","1","6","60000.00","60000.00","crm + billing","","0","28","1"),
("5","4","2","0","21","0","1","6","40000.00","40000.00","","","0","28","1"),
("6","5","2","0","21","0","1","6","40000.00","40000.00","","","0","28","1"),
("7","6","1","0","30","0","1","6","18000.00","18000.00","","INWORD OUTWORD STOCK","0","28","1"),
("8","7","2","0","21","0","1","6","60000.00","60000.00","","ONLINE DEMO ","0","28","1"),
("9","8","1","0","30","0","1","6","14500.00","14500.00","","","0","28","1"),
("10","9","1","0","30","0","1","6","20000.00","20000.00","","","0","28","1"),
("11","10","2","0","21","0","1","6","40000.00","40000.00","","","0","28","1"),
("12","11","1","0","21","0","1","6","40000.00","40000.00","","","0","28","1"),
("13","12","1","0","30","0","1","6","12000.00","12000.00","","","0","28","1"),
("14","13","1","0","30","0","1","6","14500.00","14500.00","","","0","28","1"),
("15","14","2","0","21","0","1","6","40000.00","40000.00","","","0","28","1"),
("16","17","1","0","30","0","1","6","12000.00","12000.00","","","0","28","1"),
("17","18","1","0","30","0","1","6","12000.00","12000.00","","","0","28","1"),
("18","19","1","0","30","0","1","6","15000.00","15000.00","","","0","28","1"),
("19","27","2","0","21","0","1","6","35000.00","35000.00","","","0","29","1"),
("20","28","1","0","30","0","1","0","10000.00","10000.00","Billing With Trading Stock","","0","29","1"),
("21","29","1","0","30","0","1","6","10000.00","10000.00","","","0","29","1"),
("22","32","2","0","21","0","1","6","40000.00","40000.00","CRM + Purchase Order","","0","29","1"),
("23","34","1","0","30","0","1","6","14000.00","14000.00","","","0","29","1"),
("24","36","2","0","21","0","1","6","35000.00","35000.00","","","0","29","1"),
("25","0","2","0","21","0","1","6","35000.00","35000.00","","","2","29","1"),
("26","37","1","0","30","0","1","0","9000.00","9000.00","","","0","29","1"),
("27","38","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("28","39","1","0","30","0","1","6","10000.00","10000.00","","","0","29","1"),
("29","40","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("30","41","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("31","42","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("32","43","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("33","44","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("34","45","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("35","46","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("36","47","1","0","30","0","1","6","10000.00","10000.00","","","0","29","1"),
("37","48","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("38","49","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("39","50","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("40","51","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("41","52","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("42","53","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("43","54","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("44","55","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("45","56","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("46","57","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("47","58","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("48","59","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("49","60","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("50","61","2","0","21","0","1","6","35000.00","35000.00","","","0","28","1"),
("51","62","1","0","30","0","1","6","12000.00","12000.00","","","0","28","1"),
("52","63","1","0","30","0","1","6","11000.00","11000.00","","","0","28","1"),
("53","64","1","0","30","0","1","6","10000.00","10000.00","","","0","28","1"),
("54","72","5","0","31","0","1","0","400000.00","400000.00","","","0","27","1"),
("55","73","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("56","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("57","74","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("58","75","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("59","76","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("60","77","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("61","78","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("62","79","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("63","80","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("64","81","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("65","82","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("66","83","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("67","84","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("68","85","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("69","86","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("70","87","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("71","88","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("72","89","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("73","90","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("74","91","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("75","92","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("76","93","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("77","94","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("78","95","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("79","96","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("80","97","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("81","98","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("82","99","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("83","100","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("84","101","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("85","102","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("86","103","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("87","104","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("88","105","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("89","106","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("90","107","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("91","108","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("92","109","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("93","110","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("94","111","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("95","112","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("96","113","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("97","114","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("98","115","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("99","116","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("100","117","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1");
INSERT INTO tbl_inquiry_trn VALUES
("101","118","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("102","119","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("103","120","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("104","121","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("105","122","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("106","123","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("107","124","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("108","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("109","125","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("110","126","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("111","127","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("112","128","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("113","129","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("114","130","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("115","131","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("116","132","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("117","133","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("118","135","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("119","136","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("120","137","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("121","138","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("122","144","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("123","0","3","0","32","0","1","0","10000.00","10000.00","","","2","32","1"),
("124","145","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("125","146","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("126","147","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("127","148","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("128","149","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("129","150","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("130","151","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("131","152","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("132","153","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("133","154","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("134","155","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("135","156","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("136","157","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("137","158","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("138","159","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("139","160","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("140","161","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("141","162","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("142","163","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("143","164","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("144","165","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("145","166","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("146","167","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("147","168","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("148","169","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("149","170","2","0","21","0","1","0","10000.00","10000.00","","","0","32","1"),
("150","171","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("151","172","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("152","173","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("153","174","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("154","175","2","0","21","0","1","0","10000.00","10000.00","","","0","32","1"),
("155","176","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("156","177","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("157","178","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("158","179","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("159","180","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("160","181","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("161","182","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("162","183","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("163","184","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("164","185","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("165","186","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("166","187","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("167","188","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("168","189","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("169","190","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("170","192","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("171","193","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("172","194","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("173","195","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("174","196","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("175","197","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("176","198","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("177","199","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("178","200","1","0","30","0","1","0","14000.00","14000.00","","","2","27","1"),
("179","201","2","0","21","0","1","0","35000.00","35000.00","","","2","27","1"),
("180","204","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("181","202","5","0","31","0","1","0","250000.00","250000.00","","","2","27","1"),
("182","203","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("183","205","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("184","206","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("185","207","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("186","208","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("187","209","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("188","210","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("189","211","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("190","212","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("191","213","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("192","214","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("193","215","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("194","216","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("195","217","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("196","218","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("197","219","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("198","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("199","218","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("200","0","1","0","30","0","1","0","10000.00","10000.00"," ","","2","29","1");
INSERT INTO tbl_inquiry_trn VALUES
("201","221","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("202","222","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("203","223","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("204","224","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("205","225","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("206","226","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("207","227","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("208","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("209","229","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("210","231","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("211","232","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("212","233","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("213","234","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("214","235","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("215","236","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("216","237","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("217","238","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("218","239","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("219","240","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("220","241","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("221","242","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("222","243","1","0","30","0","1","0","14000.00","14000.00","","","2","27","1"),
("223","244","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("224","245","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("225","246","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("226","247","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("227","248","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("228","249","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("229","250","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("230","251","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("231","252","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("232","253","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("233","254","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("234","255","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("235","256","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("236","257","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("237","258","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("238","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("239","261","1","0","30","0","1","6","22000.00","22000.00","","","0","28","1"),
("240","260","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("241","262","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("242","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("243","263","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("244","265","1","0","30","0","1","6","11000.00","11000.00","","","0","28","1"),
("245","266","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("246","267","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("247","268","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("248","269","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("249","270","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("250","271","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("251","272","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("252","273","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("253","274","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("254","275","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("255","276","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("256","277","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("257","278","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("258","279","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("259","279","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("260","281","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("261","282","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("262","283","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("263","284","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("264","285","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("265","286","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("266","287","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("267","288","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("268","289","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("269","290","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("270","291","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("271","292","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("272","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("273","294","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("274","295","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("275","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("276","297","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("277","298","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("278","299","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("279","300","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("280","301","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("281","303","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("282","303","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("283","306","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("284","305","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("285","307","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("286","308","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("287","309","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("288","310","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("289","311","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("290","312","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("291","313","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("292","314","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("293","315","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("294","316","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("295","317","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("296","318","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("297","320","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("298","321","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("299","322","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("300","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1");
INSERT INTO tbl_inquiry_trn VALUES
("301","323","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("302","324","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("303","325","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("304","326","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("305","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("306","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("307","0","1","0","30","0","1","0","10000.00","10000.00","","","2","29","1"),
("308","327","1","0","30","0","1","0","15000.00","15000.00","","","2","27","1"),
("309","328","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("310","329","2","0","21","0","1","0","35000.00","35000.00","","","0","29","1"),
("311","330","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("312","331","1","0","30","0","1","6","110000.00","110000.00","","","0","28","1"),
("313","332","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("314","334","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("315","336","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("316","338","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("317","339","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("318","340","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("319","341","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("320","342","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("321","343","1","0","30","0","1","0","10000.00","10000.00","","","0","34","1"),
("322","344","1","0","30","0","1","0","40000.00","40000.00","Billing with Manufacturing Stock ","","0","29","1"),
("323","345","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("324","346","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("325","347","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("326","348","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("327","349","1","0","30","0","1","0","12000.00","12000.00","","","0","29","1"),
("328","350","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("329","351","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("330","352","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("331","353","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("332","354","1","0","30","0","1","0","12000.00","12000.00","","","2","29","1"),
("333","355","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("334","356","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("335","357","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("336","358","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("337","359","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("338","360","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("339","361","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("340","362","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("341","363","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("342","364","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("343","365","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("344","366","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("345","367","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("346","368","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("347","370","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("348","371","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("349","372","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("350","373","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("351","374","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("352","375","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("353","376","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("354","377","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("355","378","1","0","30","0","1","0","15000.00","15000.00","","","0","29","1"),
("356","380","2","0","21","0","1","0","35000.00","35000.00","","","0","29","1"),
("357","382","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("358","384","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("359","385","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("360","386","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("361","387","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("362","388","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("363","389","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("364","390","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("365","391","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("366","392","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("367","393","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("368","394","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("369","395","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("370","396","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("371","397","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("372","398","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("373","399","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("374","400","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("375","401","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("376","402","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("377","403","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("378","405","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("379","406","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("380","407","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("381","408","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("382","409","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("383","410","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("384","411","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("385","412","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("386","413","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("387","414","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("388","415","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("389","416","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("390","417","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("391","418","1","0","0","0","1","0","18000.00","18000.00","","","0","29","1"),
("392","419","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("393","420","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("394","421","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("395","422","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("396","423","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("397","424","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("398","425","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("399","426","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("400","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1");
INSERT INTO tbl_inquiry_trn VALUES
("401","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("402","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("403","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("404","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("405","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("406","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("407","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("408","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("409","426","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("410","428","1","0","30","0","1","0","18000.00","18000.00","","","0","29","1"),
("411","0","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("412","0","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("413","0","1","0","30","0","1","0","18000.00","18000.00","","","2","29","1"),
("414","431","1","0","30","0","1","0","10000.00","10000.00","","","0","29","1"),
("415","435","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("416","443","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("417","444","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("418","445","1","0","30","0","1","0","14500.00","14500.00","","","0","29","1"),
("419","446","1","0","30","0","1","0","21000.00","21000.00","","","0","29","1"),
("420","448","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("421","449","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("422","450","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("423","451","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("424","452","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("425","453","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("426","454","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("427","455","1","0","30","0","1","0","18000.00","18000.00","","","0","34","1"),
("428","456","1","0","30","0","1","0","15000.00","15000.00","","","0","27","1"),
("429","456","2","0","21","0","1","0","40000.00","40000.00","","","0","27","1"),
("430","457","5","0","31","0","1","0","500000.00","500000.00","","","0","27","1"),
("431","458","2","0","21","0","1","0","50000.00","50000.00","","","2","27","1"),
("432","459","1","0","30","0","1","0","12000.00","12000.00","","","0","1","1"),
("433","460","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("434","461","1","0","30","0","1","0","9000.00","9000.00","","","0","32","1"),
("435","462","1","0","30","0","1","0","9000.00","9000.00","","","0","32","1"),
("436","463","3","0","32","0","1","0","9000.00","9000.00","","","0","32","1"),
("437","464","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("438","465","3","0","32","0","1","0","10000.00","10000.00","","","0","32","1"),
("439","466","2","0","21","0","1","0","80000.00","80000.00","","","0","27","1"),
("440","467","1","0","30","0","1","0","8000.00","8000.00","","","0","32","1"),
("441","468","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("442","469","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("443","470","5","0","31","0","1","0","350000.00","350000.00","","","0","1","1"),
("444","471","2","0","21","0","1","0","50000.00","50000.00","","","0","36","1"),
("445","472","5","0","31","0","1","0","500000.00","500000.00","","","0","27","1"),
("446","473","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("447","447","1","0","30","0","1","0","14500.00","14500.00","","","0","1","1"),
("448","474","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("449","475","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("450","476","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("451","477","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("452","478","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("453","479","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("454","480","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("455","481","1","0","30","0","1","0","9000.00","9000.00","","","0","32","1"),
("456","482","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("457","483","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("458","484","1","0","30","0","1","0","18000.00","18000.00","","","0","33","1"),
("459","485","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("460","486","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("461","487","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("462","488","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("463","489","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("464","490","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("465","491","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("466","492","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("467","493","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("468","494","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1"),
("469","495","1","0","30","0","1","0","10000.00","10000.00","","","0","32","1");




CREATE TABLE `tbl_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `inv_cust_address` mediumtext NOT NULL,
  `inv_ship_address` mediumtext NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `invoice_no` varchar(400) NOT NULL,
  `invoice_date` date NOT NULL,
  `challan_no` varchar(400) NOT NULL,
  `challan_date` date NOT NULL,
  `round_off` double(10,3) NOT NULL,
  `g_total` bigint(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `paid_amount` bigint(20) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `packing` bigint(20) NOT NULL,
  `discount` bigint(20) NOT NULL,
  `charges_formulaid` int(11) NOT NULL,
  `taxname1` varchar(400) NOT NULL,
  `taxname2` varchar(400) NOT NULL,
  `taxname3` varchar(400) NOT NULL,
  `taxvalue1` double(10,2) NOT NULL,
  `taxvalue2` double(10,2) NOT NULL,
  `taxvalue3` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `remark` text NOT NULL,
  `po_pdf` mediumtext NOT NULL,
  `print_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_invoice VALUES
("1","36","101\nsateltelite\nAHMEDABAD, Gujarat, India - 123456","","11","INV/004/19-20","2020-01-24","","1970-01-01","0.000","290000","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-01-24 12:30:40","2020-01-24 12:30:40","0","1","","","0","1");




CREATE TABLE `tbl_invoice_trn` (
  `invoice_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `product_hsn_code` varchar(200) NOT NULL,
  `product_des` text NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_disc` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(200) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(200) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(200) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`invoice_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_invoice_trn VALUES
("1","32","Manufacturing & Supply Effluent Treatment Plant Of Capacity 150 KLD \nïƒ˜ Annexure I - Basis of Design \nïƒ˜ Annexure II - ETP process Flow diagram \nïƒ˜ Annexure III - List of Equipment \nïƒ˜ Annexure IV - Technical Data Sheet","1","1.00","","","290000.00","0.00","6","290000.00","0.00","0.00","0","","0.00","","0.00","","0.00","290000.00","2020-01-24 12:30:29","0","1");




CREATE TABLE `tbl_invoicetype` (
  `invoicetype_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_type` varchar(30) NOT NULL,
  `taxinvoice_start` int(11) NOT NULL,
  `exciseinvoice_start` int(11) NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '1:Inq, 2:Quot, 3:SO, 4:BOM, 5:Planning, 6:PO, 7:Purchase, 8:Invoice, 9:Issue, 10:PRF',
  `invoice_format` int(11) NOT NULL,
  `format_value` varchar(200) NOT NULL,
  `end_format_value` varchar(400) NOT NULL,
  `deletable` int(11) NOT NULL COMMENT '0:Yes,1:No',
  `status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`invoicetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_invoicetype VALUES
("1","INQUIRY","510","0","1","1","INQ/19-20/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
("2","QUOTATION","5","0","2","3","QUO/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
("3","SALES ORDER","0","0","3","3","SO/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
("4","BOM","0","0","4","3","BOM/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
("5","PLANNING","1","0","5","3","PLN/","/19-20","1","0","2020-03-15 20:57:39","1","2","1"),
("6","P.O.","9","0","6","1","PO/ENV/20-21/","","1","0","2020-06-10 15:57:06","1","2","1"),
("7","PURCHASE","1","0","7","3","PUR/","/20-21","1","0","2020-06-10 14:34:39","1","2","1"),
("8","INVOICE","0","0","8","3","INV/","/20-21","1","0","2020-06-10 14:34:27","1","2","1"),
("9","ISSUE","5","0","9","3","IS/","/20-21","1","0","2020-06-10 14:34:15","1","2","1"),
("10","PRF","20","0","10","3","PRF/","/20-21","1","0","2020-06-10 15:56:56","1","2","1"),
("11","GRN","3","0","11","3","GRN/","/20-21","1","0","2020-06-10 14:33:52","1","2","1");




CREATE TABLE `tbl_issue_entry` (
  `issue_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `inv_cust_address` mediumtext NOT NULL,
  `inv_ship_address` mediumtext NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `issue_entry_no` varchar(400) NOT NULL,
  `issue_entry_date` date NOT NULL,
  `challan_no` varchar(400) NOT NULL,
  `challan_date` date NOT NULL,
  `round_off` double(10,3) NOT NULL,
  `g_total` bigint(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `paid_amount` bigint(20) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `packing` bigint(20) NOT NULL,
  `discount` bigint(20) NOT NULL,
  `charges_formulaid` int(11) NOT NULL,
  `taxname1` varchar(400) NOT NULL,
  `taxname2` varchar(400) NOT NULL,
  `taxname3` varchar(400) NOT NULL,
  `taxvalue1` double(10,2) NOT NULL,
  `taxvalue2` double(10,2) NOT NULL,
  `taxvalue3` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `remark` text NOT NULL,
  `po_pdf` mediumtext NOT NULL,
  `print_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;


INSERT INTO tbl_issue_entry VALUES
("1","0","","","0","IS/002/19-20","2019-12-12","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2019-12-12 14:50:25","2019-12-12 14:50:25","0","1","issue to Laboratory","","0","1"),
("2","0","","","0","IS/003/19-20","2019-12-15","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2019-12-27 10:35:43","2019-12-15 11:26:43","0","1","Issue to lab for nitrogen","","0","1"),
("3","0","","","0","IS/004/19-20","2020-02-13","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-02-13 17:21:36","2020-02-13 17:21:36","0","1","","","0","1"),
("4","0","","","0","IS/005/19-20","2020-03-02","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-02 15:41:27","2020-03-02 15:41:27","0","1","Ball pen issued to Niketa Maam","","0","1"),
("5","0","","","0","IS/006/19-20","2020-03-09","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-09 11:17:21","2020-03-09 11:17:21","0","1","","","0","1"),
("6","0","","","0","IS/007/19-20","2020-03-09","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-09 11:18:36","2020-03-09 11:18:36","0","1","","","0","1"),
("7","0","","","0","IS/008/19-20","2020-03-16","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-16 10:23:37","2020-03-16 10:23:37","0","1","","","0","1"),
("8","0","","","0","IS/009/19-20","2020-03-16","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-16 10:37:31","2020-03-16 10:37:31","0","1","","","0","1"),
("9","0","","","0","IS/010/19-20","2020-03-16","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-16 15:03:24","2020-03-16 15:03:24","0","18","Stationary","","0","1"),
("10","0","","","0","IS/011/19-20","2020-03-16","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-16 15:08:59","2020-03-16 15:06:59","0","1","Niketamaam","","0","1"),
("11","0","","","0","IS/012/19-20","2020-03-17","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-17 10:44:41","2020-03-17 10:44:41","0","18","Stationary","","0","1"),
("12","0","","","0","IS/013/19-20","2020-03-17","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-17 10:47:50","2020-03-17 10:47:50","0","18","Stationary","","0","1"),
("13","0","","","0","IS/014/19-20","2020-03-17","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-17 11:09:19","2020-03-17 11:09:19","0","18","Stationary","","0","1"),
("14","0","","","0","IS/015/19-20","2020-03-17","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-17 13:02:47","2020-03-17 13:02:47","0","18","Stationary","","0","1"),
("15","0","","","0","IS/016/19-20","2020-03-17","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-03-17 17:11:35","2020-03-17 17:11:35","0","18","Stationary","","0","1"),
("16","0","","","0","IS/001/19-20","2020-06-03","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-06-03 11:38:40","2020-06-03 11:38:40","0","18","Stationary","","0","1"),
("17","0","","","0","IS/002/19-20","2020-06-06","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-06-06 12:05:32","2020-06-06 12:05:32","0","1","Ball pen issued to Mayank Panchal","","0","1"),
("18","0","","","0","IS/003/19-20","2020-06-06","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-06-06 16:51:24","2020-06-06 16:51:24","0","1","","","0","1"),
("19","0","","","0","IS/004/19-20","2020-06-06","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-06-06 17:01:58","2020-06-06 17:01:58","0","18","","","0","1"),
("20","0","","","0","IS/005/20-21","2020-06-12","","0000-00-00","0.000","0","0","0","0","0","0","0","","","","0.00","0.00","0.00","2020-06-12 14:00:01","2020-06-12 14:00:01","0","24","","","0","1");




CREATE TABLE `tbl_issue_entry_trn` (
  `issue_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `issue_entry_id` int(11) NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `product_hsn_code` varchar(200) NOT NULL,
  `product_des` text NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_disc` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(200) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(200) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(200) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issue_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;


INSERT INTO tbl_issue_entry_trn VALUES
("1","86","","1","2.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2019-12-12 14:50:11","0","1"),
("2","358","","2","1.00","","","0.00","0.00","3","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2019-12-15 11:26:29","0","1"),
("3","363","Issue for Audit  Purpose","3","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-02-13 17:21:33","0","1"),
("4","379","Issued to Niketa Maam","4","4.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-02 15:40:58","0","1"),
("5","379","Vishal","5","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-09 11:17:18","0","1"),
("6","379","","6","2.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-09 11:18:33","0","1"),
("7","535","","7","1.00","","","0.00","0.00","7","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-16 10:23:31","0","1"),
("8","363","New packet issued to BOE","8","1.00","","","0.00","0.00","7","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-16 10:37:28","0","1"),
("9","379","niketa mem","9","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-16 15:03:01","0","18"),
("10","379","Niketa Maam","10","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-16 15:06:57","0","1"),
("11","379","Vaidk","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:41:42","0","18"),
("12","379","mansi","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:42:06","0","18"),
("13","379","Vaidik","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:42:23","0","18"),
("14","379","Mansi","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:42:38","0","18"),
("15","379","Disha","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:42:38","0","18"),
("16","379","Vaidik","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:42:53","0","18"),
("17","379","Niketa Mem","11","4.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:44:00","0","18"),
("18","379","Disha","11","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:44:23","0","18"),
("19","402","Krupa ","13","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:48:54","0","18"),
("20","385","mansi","13","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:51:31","0","18"),
("21","407","Mansi, Disha , pradip ,vishal sir, Ravi ","13","5.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:56:44","0","18"),
("22","407","Mansi, Disha , pradip ,vishal sir, Ravi ","0","5.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:56:44","2","18"),
("23","375","General office use","13","10.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 10:58:58","0","18"),
("24","401","For GPCB Work use","13","15.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 11:08:28","0","18"),
("25","401","For GPCB Work use","13","15.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 11:08:28","0","18"),
("26","384","Disha And Mansi","13","2.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 11:09:04","0","18"),
("27","544","Ravi (17 Nos.)\nVaidik (17 Nos.)\nDisha (17 Nos.)\nKrupa (17 Nos.)\nPintoo (17 Nos.)\nManu bhai (17 Nos.)\nPradip (8 Nos.)\nWaste (1 Nos.)","14","111.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-03-17 13:02:15","0","18"),
("28","396","Given To ketan bhai","16","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-03 11:36:00","0","18"),
("29","379","Given To ketan Bhai","16","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-03 11:36:25","0","18"),
("30","379","Given To mayank Bhai","16","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-03 11:38:14","0","18"),
("31","399","Given To mayank Bhai","16","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-03 11:38:37","0","18"),
("32","379","","17","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-06 12:05:14","0","1"),
("33","379","ketan jain","20","1.00","","","0.00","0.00","6","0.00","0.00","0.00","0","","0.00","","0.00","","0.00","0.00","2020-06-12 13:59:59","0","24");




CREATE TABLE `tbl_master_bom` (
  `bom_mst_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `finish_pro_qty` double NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bom_mst_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`bom_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO tbl_master_bom VALUES
("1","2","1","2019-11-18 15:21:16","2","1","1"),
("2","1","1","2019-11-18 19:29:20","2","1","1"),
("3","33","1","2019-12-28 08:20:47","0","1","1"),
("4","32","1","2019-12-28 08:05:22","0","1","1"),
("5","35","1","2019-12-28 08:10:05","0","1","1"),
("6","37","1","2019-12-28 08:08:53","0","1","1"),
("7","36","1","2019-11-24 13:01:58","0","1","1");




CREATE TABLE `tbl_master_bom_trn` (
  `bom_mst_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `bom_mst_id` int(11) NOT NULL,
  `req_product_id` int(11) NOT NULL,
  `req_product_desc` longtext NOT NULL,
  `req_product_qty` double(10,2) NOT NULL,
  `req_unitid` int(11) NOT NULL,
  `act_req_qty` double(10,2) NOT NULL,
  `bom_mst_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`bom_mst_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;


INSERT INTO tbl_master_bom_trn VALUES
("1","1","3","","2.00","3","2.00","0","1"),
("2","1","4","","2.00","3","2.00","0","1"),
("3","2","14","","2.00","3","2.00","0","1"),
("4","2","6","","2.00","3","2.00","0","1"),
("5","2","15","","2.00","3","2.00","0","1"),
("6","2","17","","2.00","3","2.00","0","1"),
("7","2","3","","2.00","3","2.00","0","1"),
("8","2","16","","2.00","3","2.00","0","1"),
("9","2","10","","2.00","3","2.00","0","1"),
("10","2","13","","1.00","3","1.00","0","1"),
("11","2","4","","1.00","3","1.00","0","1"),
("12","2","11","","1.00","3","1.00","0","1"),
("13","2","43","","1.00","3","0.00","0","1"),
("14","2","45","","2.00","3","0.00","0","1"),
("15","2","9","","16.00","1","0.00","2","1"),
("16","2","9","","16.00","1","0.00","0","1"),
("17","2","8","","46.00","3","0.00","0","1"),
("18","3","47","Capacity ( Liquid Volume ):As Per Design Dimension: To Be Provided \nMOC: RCC / Civil\n","1.00","6","1.00","0","1"),
("19","3","48","Flow Rate 0.25 m3 / Hr\nSpecification: 20 mm hole size\nMOC: SS \n","1.00","6","1.00","0","1"),
("20","3","46","Capacity ( Liquid Volume ): As Per Design Dimension: To Be Provided\nMOC: RCC / Civil\n","1.00","6","1.00","0","1"),
("21","3","6","Flow rate : 0.25 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","1.00","6","1.00","0","1"),
("22","3","54","CAPACITY: AS PER DESIGN\nPAINT: All Part Are Painted With Coates Of Epoxy Paints\nMOC MSEP\n","1.00","6","1.00","0","1"),
("23","3","49","CAPACITY: AS PER DESIGN\nPAINT: All Part Are Painted With Coates Of Epoxy Paints \nMOC: MSEP\n","1.00","6","1.00","0","1"),
("24","3","15","Propeller Type: Turbine / Blade Type \nMOC Shaft Propeller: MSFRP/SS \nAgitator RPM :45 \nGear Box Type: Worm Gear Box \nMake Greaves/ Duro / Elecon / Equivalent \nDrum MOC: HDPE\n","1.00","6","1.00","0","1"),
("25","3","50","CAPACITY :AS PER DESIGN \nPAINT: All Part Are Painted With Coates Of Epoxy Paints\nMOC: MSEP\n","1.00","6","1.00","0","1"),
("26","3","3","Flow rate : 0.25 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","1.00","3","1.00","0","1"),
("27","3","52","CAPACITY :AS PER DESIGN \nPAINT: All Part Are Painted With Coates Of Epoxy Paints\nMOC: MSEP\n","1.00","6","1.00","0","1"),
("28","3","10","Flow Rate: 0.25 m3 /Hr \nMOC:  CI Base / SS Impeller \nHead: 22-30 Meter\nType: Centrifugal \nMake: JEE / Kirloskar / Lubi / Equivalent\n","1.00","6","1.00","0","1"),
("29","3","4","Flow Rate : 0.25 m3 /Hr \nMOC :FRP \nDuration Of Backwash 10 â€“ 15 Minutes\nPressure: 2.5 Kg/cm2 \nMake :Pentair\n","1.00","3","1.00","0","1"),
("30","3","11","Flow Rate :0.25 m3 /Hr \nMOC :FRP\nDuration Of Backwash: 10 â€“ 15 Minutes \nPressure: 2.5 Kg/cm2 \nMake: Pentair\nTop â€“ Bottom Distribution Strainer Application To Remove Suspended Solids / Undissolved Impurities\n","1.00","6","1.00","0","1"),
("31","3","12","Type: UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery\nValves: Butterfly Valve, Ball Valve and Isolation Valves As Required\nSupports: Pipe Supports For Interconnecting Piping And Skid \nMOC: UPVC / HDPE / GI / MS\n","1.00","7","1.00","0","1"),
("32","3","43","Model: MS Foot Mounted MS Powder Coating Type: Free Standing Cubical \nContact Parts: L&T / Schneider \nWire: Copper","1.00","6","1.00","0","1"),
("33","3","56","CAPACITY :AS PER DESIGN \nPAINT: All Part Are Painted With Coates Of Epoxy Paints \nMOC :MSEP\n","1.00","6","1.00","0","1"),
("34","3","9","Type: Fluidized Bio Media \nDimension: 22mm (Dia) x 1000 (16 mm height)\nColor: Black \nMOC :Virgin PPUV Stabilized Density 0.93\nTemperature: 80â€™ C\n","15.00","8","15.00","0","1"),
("35","4","46","Capacity ( Liquid Volume ): As Per Design Dimension: To Be Provided \nMOC :RCC / Civil \n","1.00","6","1.00","0","1"),
("36","4","47","Capacity ( Liquid Volume ): As Per Design Dimension:To Be Provided \nMOC: RCC / Civil\n","1.00","6","1.00","0","1"),
("37","4","48","Capacity : As Per Design\nDimension To Be Provided \nMOC : SS/ HDPE\n","1.00","6","1.00","0","1"),
("38","4","6","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","6","2.00","0","1"),
("39","4","57","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("40","4","58","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("41","4","60","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","2.00","6","2.00","0","1"),
("42","4","63","Capacity: As Per Design \nDimension: As Per Design \nMOC: RCC\n","1.00","6","1.00","0","1"),
("43","4","62","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("44","4","53","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC/CIVIL","1.00","6","1.00","0","1"),
("45","4","13","No. Of Plate: 18 Plate\nSize: 18 x 18 \nMOC :CI PP \nModel :Semi-Automatic ( Hydraulic )\n","1.00","6","1.00","2","1"),
("46","4","13","No. Of Plate: 18 Plate\nSize: 18 x 18 \nMOC :CI PP \nModel :Semi-Automatic ( Hydraulic )\n","1.00","6","1.00","0","1"),
("47","4","16","Flow Rate :3 m3 /Hr\nMOC CI Base / SS Shaft / SS Impeller\n Head :30 â€“ 35 Meter \nType: Centrifugal, Mono Block \nMake: JEE / Jhonson / Lubi / Equivalent\n","2.00","6","2.00","0","1"),
("48","4","3","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","3","2.00","0","1"),
("49","4","10","Flow Rate: 0.75 m3 /Hr \nMOC:  CI Base / SS Impeller \nHead: 22-30 Meter\nType: Centrifugal \nMake: JEE / Kirloskar / Lubi / Equivalent\n","2.00","6","2.00","0","1"),
("50","4","4","Flow Rate : 0.75 m3 /Hr \nMOC :FRP \nDuration Of Backwash 10 â€“ 15 Minutes\nPressure: 2.5 Kg/cm2 \nMake :Pentair\n","1.00","6","1.00","0","1"),
("51","4","11","Flow Rate :0.75 m3 /Hr \nMOC :FRP\nDuration Of Backwash: 10 â€“ 15 Minutes \nPressure: 2.5 Kg/cm2 \nMake: Pentair\nTop â€“ Bottom Distribution Strainer Application To Remove Suspended Solids / Undissolved Impurities\n","1.00","6","1.00","0","1"),
("52","5","53","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC/CIVIL","1.00","6","1.00","0","1"),
("53","5","11","Flow Rate :0.75 m3 /Hr \nMOC :FRP\nDuration Of Backwash: 10 â€“ 15 Minutes \nPressure: 2.5 Kg/cm2 \nMake: Pentair\nTop â€“ Bottom Distribution Strainer Application To Remove Suspended Solids / Undissolved Impurities\n","1.00","6","1.00","0","1"),
("54","5","4","Flow Rate : 0.75 m3 /Hr \nMOC :FRP \nDuration Of Backwash 10 â€“ 15 Minutes\nPressure: 2.5 Kg/cm2 \nMake :Pentair\n","1.00","3","1.00","0","1"),
("55","5","10","Flow Rate: 0.75 m3 /Hr \nMOC:  CI Base / SS Impeller \nHead: 22-30 Meter\nType: Centrifugal \nMake: JEE / Kirloskar / Lubi / Equivalent\n","2.00","6","2.00","0","1"),
("56","5","10","Flow Rate: 0.75 m3 /Hr \nMOC:  CI Base / SS Impeller \nHead: 22-30 Meter\nType: Centrifugal \nMake: JEE / Kirloskar / Lubi / Equivalent\n","2.00","6","2.00","0","1"),
("57","5","62","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("58","5","60","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","2.00","6","2.00","0","1"),
("59","5","63","Capacity: As Per Design \nDimension: As Per Design \nMOC: RCC\n","1.00","6","1.00","0","1"),
("60","5","46","","1.00","6","1.00","0","1"),
("61","5","48","Capacity: As Per Design\nDimension :To Be Provided \nMOC SS/HDPE","1.00","6","1.00","0","1"),
("62","5","47","Capacity ( Liquid Volume ); As Per Design\nDimension: To Be Provided\nMOC RCC / Civil ","1.00","6","1.00","0","1"),
("63","5","3","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","6","2.00","0","1"),
("64","5","6","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","6","2.00","0","1"),
("65","6","53","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC/CIVIL","1.00","6","1.00","0","1"),
("66","6","11","Flow Rate :0.75 m3 /Hr \nMOC :FRP\nDuration Of Backwash: 10 â€“ 15 Minutes \nPressure: 2.5 Kg/cm2 \nMake: Pentair\nTop â€“ Bottom Distribution Strainer Application To Remove Suspended Solids / Undissolved Impurities\n","1.00","6","1.00","0","1"),
("67","6","4","Flow Rate : 0.75 m3 /Hr \nMOC :FRP \nDuration Of Backwash 10 â€“ 15 Minutes\nPressure: 2.5 Kg/cm2 \nMake :Pentair\n","1.00","6","1.00","0","1"),
("68","6","10","Flow Rate: 0.75 m3 /Hr \nMOC:  CI Base / SS Impeller \nHead: 22-30 Meter\nType: Centrifugal \nMake: JEE / Kirloskar / Lubi / Equivalent\n","2.00","6","2.00","0","1"),
("69","6","62","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("70","6","50","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: MSEP","2.00","6","2.00","0","1"),
("71","6","64","Capacity: As Per Design \nDimension:As Per Design \nMOC:MSEP\n","1.00","6","1.00","0","1"),
("72","6","3","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","6","2.00","0","1"),
("73","6","6","Flow rate : 0.75 M3/ Hr\nMOC: CL base/ SS impeller \nHead 10-15 Meter\nRPM: 1440\nType: Self Priming Non clog Monoblock\n","2.00","6","2.00","0","1"),
("74","6","46","Capacity ( Liquid Volume ) :As Per Design \nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("75","6","48","Capacity: As Per Design\nDimension :To Be Provided \nMOC SS/HDPE","1.00","6","1.00","0","1"),
("76","6","47","Capacity ( Liquid Volume ); As Per Design\nDimension: To Be Provided\nMOC RCC / Civil ","1.00","6","1.00","0","1"),
("77","7","46","Capacity ( Liquid Volume ) :As Per Design \nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("78","7","65","","1.00","6","1.00","2","1"),
("79","7","65","Capacity: As Per Design \nDimension:As Per Design \nMOC:RCC/ CIVIL","1.00","6","1.00","0","1"),
("80","7","62","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC / Civil","1.00","6","1.00","0","1"),
("81","7","53","Capacity ( Liquid Volume ): As Per Design\nDimension: To Be Provided \nMOC: RCC/CIVIL","1.00","6","1.00","0","1"),
("82","4","360","Type Tri Lobe Rotary Blower\nPressure: 0.55kg / cm2 \nType Of Cooling Air Cooling \nType Of Drive: V-Belt Drive \nFrequency :50 HZ \nAir Flow: 700 m3 /Hr\nSuction Temperature Ambient \nFlow Direction :Horizontal\nMake Of Blower TMVT /AGS / Kay/ Shreeji Equivalent\n","2.00","6","2.00","0","1"),
("83","4","359","Type Tri Lobe Rotary Blower\nPressure: 0.4 kg / cm2 \nType Of Cooling Air Cooling \nType Of Drive: V-Belt Drive \nFrequency :50 HZ \nAir Flow: 200 m3 /Hr\nSuction Temperature Ambient \nFlow Direction :Horizontal\nMake Of Blower TMVT /AGS / Kay/ Shreeji Equivalent\n","1.00","6","1.00","0","1"),
("84","4","12","Type: UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery\nValves: Butterfly Valve, Ball Valve and Isolation Valves As Required\nSupports: Pipe Supports For Interconnecting Piping And Skid \nMOC: UPVC / HDPE / GI / MS\n","1.00","7","1.00","0","1"),
("85","4","43","Model type: MS Foot Mounted MS Powder Coating Type: Free Standing Cubical\nContact Parts: L&T / Schneider \nWire Copper\n","1.00","6","1.00","0","1"),
("86","3","360","Type Tri Lobe Rotary Blower\nPressure: 0.4 kg / cm2 \nType Of Cooling Air Cooling \nType Of Drive: V-Belt Drive \nFrequency :50 HZ \nAir Flow: 100 m3 /Hr\nSuction Temperature Ambient \nFlow Direction :Horizontal\nMake Of Blower TMVT /AGS / Kay/ Shreeji Equivalent\n","2.00","6","2.00","0","1"),
("87","3","12","Type: UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery\nValves: Butterfly Valve, Ball Valve and Isolation Valves As Required\nSupports: Pipe Supports For Interconnecting Piping And Skid \nMOC: UPVC / HDPE / GI / MS\n","1.00","7","1.00","0","1"),
("88","3","43","Model type: MS Foot Mounted MS Powder Coating Type: Free Standing Cubical\nContact Parts: L&T / Schneider \nWire Copper\n","1.00","6","1.00","0","1"),
("89","6","360","Type Tri Lobe Rotary Blower\nPressure: 0.4 kg / cm2 \nType Of Cooling Air Cooling \nType Of Drive: V-Belt Drive \nFrequency :50 HZ \nAir Flow: 26 m3 /Hr\nSuction Temperature Ambient \nFlow Direction :Horizontal\nMake Of Blower TMVT /AGS / Kay/ Shreeji Equivalent\n","2.00","6","2.00","0","1"),
("90","6","12","Type: UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery\nValves: Butterfly Valve, Ball Valve and Isolation Valves As Required\nSupports: Pipe Supports For Interconnecting Piping And Skid \nMOC: UPVC / HDPE / GI / MS\n","1.00","7","1.00","0","1"),
("91","6","43","Model type: MS Foot Mounted MS Powder Coating Type: Free Standing Cubical\nContact Parts: L&T / Schneider \nWire Copper\n","1.00","6","1.00","0","1"),
("92","5","17","Type Tri Lobe Rotary Blower\nPressure: 0.4 kg / cm2 \nType Of Cooling Air Cooling \nType Of Drive: V-Belt Drive \nFrequency :50 HZ \nAir Flow: 26 m3 /Hr\nSuction Temperature Ambient \nFlow Direction :Horizontal\nMake Of Blower TMVT /AGS / Kay/ Shreeji Equivalent\n","2.00","6","2.00","0","1"),
("93","5","12","Type: UPVC / CPVC / HDPE / GI / MS, Interconnecting Piping Within Battery\nValves: Butterfly Valve, Ball Valve and Isolation Valves As Required\nSupports: Pipe Supports For Interconnecting Piping And Skid \nMOC: UPVC / HDPE / GI / MS\n","1.00","7","1.00","0","1"),
("94","5","43","Model type: MS Foot Mounted MS Powder Coating Type: Free Standing Cubical\nContact Parts: L&T / Schneider \nWire Copper\n","1.00","6","1.00","0","1"),
("95","3","55","MOC: PP\nMaterial : vergin Plastic\nMake: Cooldeck/ Equi.","1.00","8","1.00","0","1");




CREATE TABLE `tbl_master_category` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_name` varchar(100) NOT NULL,
  `mc_status` int(11) NOT NULL COMMENT '1 : Active , 0: Inactive',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO tbl_master_category VALUES
("1","AMC Type","1"),
("2","AMC Warranty","1"),
("3","Communication Preference","1"),
("4","Customer Category","1"),
("5","Customer Type","1"),
("6","Data Source","1"),
("7","Sales Stage","1"),
("8","Inquiry Type","1"),
("9","Inquiry Category","1"),
("10","Task Type","1");




CREATE TABLE `tbl_master_category_detail` (
  `mcd_id` int(11) NOT NULL AUTO_INCREMENT,
  `mcd_cat_id` int(11) NOT NULL,
  `mcd_name` varchar(100) NOT NULL,
  `mcd_status` int(11) NOT NULL COMMENT '0 : Active, 1 :inactive, 2 : delete',
  `cdate` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`mcd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;


INSERT INTO tbl_master_category_detail VALUES
("2","1","DEVV","2","2019-09-09 22:44:11","1","1","0"),
("3","3","DDDD12","2","2019-09-09 23:57:23","1","1","0"),
("4","7","HOT","0","2019-09-18 17:34:22","1","1","0"),
("5","7","COLD","0","2019-09-18 17:34:40","1","1","0"),
("6","7","WARM","0","2019-09-18 17:35:21","1","1","0"),
("7","7","NOT APPLICABLE","0","2019-09-18 17:35:27","1","1","0"),
("8","8","EXISTING BUSINESS","0","2019-09-18 17:38:54","1","1","0"),
("9","8","NEW BUSINESS","0","2019-09-18 17:38:59","1","1","0"),
("10","9","SMALL BUSINESS","0","2019-09-18 17:44:09","1","1","0"),
("11","9","MEDIUM BUSINESS","0","2019-09-18 17:44:14","1","1","0"),
("12","9","LARGE BUSINESS","0","2019-09-18 17:44:21","1","1","0"),
("13","10","EMAIL ACTIVITY","0","2019-09-21 15:35:03","1","1","0"),
("14","10","GENERAL TASK","0","2019-09-21 15:35:20","1","1","0"),
("15","10","NEW QUOTATION CREATION","0","2019-09-21 15:35:40","1","1","0"),
("16","10","INQUIRY FOLLOW UP","0","2019-09-21 15:35:54","1","1","0"),
("17","10","OUTDOOR DUTY REPORT","0","2019-09-21 15:36:09","1","1","0"),
("18","10","PHONE ACTIVITY","0","2019-09-21 15:36:28","1","1","0"),
("19","10","QUOTATION FOLLOW UP","0","2019-09-21 15:36:57","1","1","0"),
("20","4","TEST CAT","0","2019-11-21 16:06:17","1","1","0");




CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL,
  `menu_module` int(11) NOT NULL,
  `menuorder` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `page_name` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `fa_icon` varchar(100) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;


INSERT INTO tbl_menu VALUES
("1","DASHBOARD","1","1","0","dashboard","0","2019-09-02 12:56:41","0","FA-DASHBOARD"),
("5","MASTER","1","7","0","","0","2019-09-30 17:42:44","0","fa-gear"),
("6","USER MASTER","0","10","0","","2","2019-08-26 11:40:02","0","fa-user"),
("7","REPORT MANAGER","0","19","0","report_list","0","2019-11-18 13:06:52","0","fa-bar-chart-o"),
("8","INWARD BILL LIST","0","0","2","purchasebill_list","0","2016-05-13 16:56:35","0",""),
("9","RETURN LIST","0","0","2","purchasereturn_list","0","2016-05-13 16:57:37","0",""),
("10","CREATE PROJECT","0","0","3","project","0","2016-05-13 16:58:35","0",""),
("11","PROJECT LIST","0","0","3","project_list","0","2016-05-13 16:59:35","0",""),
("12","Component OUTWARD LIST","0","0","4","processorder","0","2016-05-24 23:09:44","0",""),
("13","DIRECT Component OUTWARD LIST","0","0","4","directprocessorder","0","2016-05-24 23:09:51","0",""),
("14","RETURN LIST","0","0","4","return_list","0","2016-05-13 17:05:20","0",""),
("15","PARTY LIST","0","0","5","CUSTOMER_LIST","2","2019-09-09 14:14:48","0",""),
("17","SALE PAYMENT","0","5","7","MONTHWISEPAYMENTREPORT","2","2019-11-18 12:20:57","0",""),
("19","CUSTOMER STATEMENT","0","5","7","PARTYPAYMENTREPORT","2","2017-03-15 23:50:36","0",""),
("20","ALL CUSTOMER STATMENT","0","6","7","PAYMENTREPORT","2","2017-03-14 16:42:07","0",""),
("21","SALE WISE REPORT","0","3","7","INVOICEWISEREPORT","2","2017-03-14 16:38:16","0",""),
("22","PARTY WISE BILL REPORT","0","0","7","INVOICE_REPORT","2","2016-05-26 17:45:19","0",""),
("23","USER LIST","0","0","6","user_list","0","2016-05-13 23:29:45","0",""),
("24","USER TYPE LIST","0","0","6","usertype_list","0","2016-05-13 23:30:19","0",""),
("25","MENU LIST","0","0","6","menu_list","0","2017-03-18 16:48:41","0",""),
("26","USER PERMISSION MASTER","0","0","6","user_permission","0","2016-05-13 23:31:02","0",""),
("27","VENDER LIST","0","0","5","vender_list","2","2016-05-25 21:57:35","0",""),
("28","PRODUCT LIST","0","4","5","PRODUCT_LIST","2","2019-06-20 15:13:11","0",""),
("29","UNIT LIST","0","4","5","unit_list","0","2019-09-09 14:26:16","0",""),
("30","STATE LIST","0","15","5","STATE","2","2019-09-09 14:15:33","0",""),
("31","CITY LIST","0","16","5","CITY","2","2019-09-09 14:15:36","0",""),
("32","INVOICE","0","6","0","","2","2019-06-20 14:49:50","0","FA FA-envelope"),
("33","CREATE INVOICE","0","1","32","INVOICE","0","2016-07-18 22:41:42","0",""),
("34","INVOICE LIST","0","2","32","INVOICE_LIST","0","2017-03-08 00:00:12","0",""),
("35","PAYMENT RECEIPT","0","3","32","INVOICEPAYMENTRECEIPT_LIST","2","2017-03-11 21:17:59","0",""),
("36","SERIES TYPE","0","6","5","INVOICETYPE_LIST","2","2019-09-09 14:15:08","0",""),
("37","TAX LIST","0","12","5","TAX_LIST","2","2019-09-09 14:15:24","0",""),
("38","FORMULA LIST","0","13","5","FORMULA_LIST","2","2019-09-09 14:15:27","0",""),
("39","TEST","0","0","5","test","2","2016-05-25 22:07:19","0",""),
("40","TEST1234","0","0","5","TESEE234","2","2016-05-25 22:07:26","0",""),
("43","ENVELOPE LIST","0","0","5","envelop","2","2016-07-11 23:44:30","0",""),
("46","INVOICERECEIPT","0","0","32","invoicereceipt","1","2016-05-28 16:24:32","0",""),
("47","YEARLY SUMMARY","0","11","7","YEARLY-SUMMARY","2","2017-03-15 23:57:40","0",""),
("48","invoicereceipt","0","6","0","invoicereceipt/0","2","2016-07-11 23:40:18","0","FA-COG"),
("49","SIZE LIST","0","4","5","sizelist","2","2016-07-18 22:30:54","0",""),
("50","DESCRIPTION CODE LIST","0","5","5","DESCRIPTIONCODE_LIST","2","2016-07-18 22:30:52","0",""),
("51","BANK LIST","0","11","5","BANK","2","2019-09-09 14:15:22","0",""),
("52","INVOICE CONTENT","0","11","5","content_list","2","2016-07-18 22:30:49","0",""),
("54","MONTHLY PRODUCT REPORT","0","11","7","MONTHWISEPRODUCTREPORT","2","2019-11-18 12:21:04","0",""),
("55","PURCHASE ","0","3","0","","2","2018-10-10 17:34:36","0","fa-shopping-cart"),
("56","PAYMENT RECEIPT","0","3","55","PURCHASEPAYMENT_LIST","2","2017-03-11 21:17:51","0",""),
("57","PURCHASE LIST","0","2","55","PURCHASE_LIST","0","2017-03-04 19:13:44","0",""),
("58","CREATE PURCHASE","0","1","55","purchase_add","0","2016-09-09 21:59:18","0",""),
("59","VENDOR LIST","0","2","5","VENDER_LIST","2","2018-10-10 17:35:00","0",""),
("60","SALES TAX REPORT","0","7","7","VAT_REPORT","2","2019-11-18 12:20:04","0",""),
("61","PURCHASE TAX REPORT","0","8","7","PURCHASEVAT_REPORT","2","2019-11-18 12:21:09","0",""),
("62","ACCOUNT MASTER","0","1","63","BANK-ACC-LIST","0","2017-03-08 00:00:22","0",""),
("63","BANK MANAGER","0","8","0","","2","2019-06-20 14:50:04","0","fa-building-o"),
("64","BANK TRANSACTION","0","2","63","BANK-CASH-TRANSFER","0","2017-03-08 00:00:26","0",""),
("65","PASSBOOK STATEMENT","0","12","7","PASSBOOK_REPORT","2","2019-11-18 12:19:48","0",""),
("66","DIRECT PASSBOOK ENTRY","0","3","63","DIRECT-ENTRY-PASSBOOK","0","2017-03-08 00:00:30","0",""),
("67","PURCHASE DETAIL REPORT","0","10","5","purchase_detail_report","2","2017-03-03 17:56:35","0",""),
("68","PURCHASE STATEMENT","0","8","7","PURCHASE_DETAIL_REPORT","2","2017-03-14 16:41:42","0",""),
("69","SALE STATEMENT","0","1","7","INVOICE-PAYMENT-ALL","2","2017-03-14 16:38:13","0",""),
("70","COMPANY MANAGER","1","11","0","","0","2019-09-02 12:56:59","0","fa-user"),
("71","CREATE COMPANY ","0","1","70","create_company","0","2017-03-03 17:58:26","0",""),
("72","COMPANY LIST","0","2","70","company_list","0","2017-03-03 17:59:13","0",""),
("73","QUOTATION  LIST","0","4","0","","2","2018-10-12 15:43:41","0"," FA-QUORA"),
("74","PAYMENT MANAGER","0","7","0","","2","2019-06-20 14:49:53","0","Fa-money"),
("75","SALE PAYMENT LIST","0","1","74","INVOICEPAYMENTRECEIPT_LIST","0","2017-03-11 21:20:52","0",""),
("76","PURCHASE PAYMENT LIST","0","2","74","PURCHASEPAYMENT_LIST","0","2017-03-11 21:20:57","0",""),
("77","PARTY LEDGER","0","1","7","CUSTOMER_LEDGER","2","2019-11-18 12:19:32","0",""),
("78","VENDOR LEDGER","0","2","7","vendor_ledger","2","2018-10-10 17:36:15","0",""),
("79","PURCHASE PAYMENT","0","6","7","MONTHLYPURCHASEPAYMENTREPORT","2","2019-11-18 12:21:02","0",""),
("80","ENVELOPE LIST","0","17","5","ENVELOPE_LIST","2","2019-06-20 15:10:14","0",""),
("81","PO LIST","0","2","0","","2","2019-06-20 14:49:33","0","FA-LIST"),
("82","PURCHASE PRODUCT LIST","0","4","5","purchase_product_list","2","2018-10-10 17:37:22","1",""),
("83","SETTING","1","9","0","","0","2019-09-30 17:42:05","0","FA-COG"),
("84","PERFORMANCE INVOICE","0","3","0","P_INVOICE_LIST","2","2018-02-15 18:31:15","1","FA-ENVELOPE-OPEN"),
("85","PARTYWISE SALES","0","9","7","PRODUCT_SALE_REPORT","2","2019-11-18 12:19:45","1",""),
("86","VENDOR STATEMENT","0","4","7","VENDERPAYMENTREPORT","2","2018-10-10 17:36:05","1",""),
("87","PARTY STATEMENT","0","3","7","PARTYPAYMENTREPORT","2","2019-11-18 12:21:13","1",""),
("88","PARTYWISE PURCHASE","0","10","7","PRODUCT_PURCHASE_REPORT","2","2019-11-18 12:21:06","1",""),
("89","INWARD LIST","0","3","0","INWARD_LIST","2","2018-02-15 18:31:19","1","FA-FILE-TEXT-O"),
("90","GSTR-1 REPORT","0","0","7","gstr-1-report","2","2018-10-10 17:36:54","1",""),
("91","CHARGES LIST","0","5","5","CHARGES_LIST","2","2018-10-10 17:37:52","1",""),
("92","SALES ORDER","0","5","0","","2","2019-06-20 14:49:42","1","FA-ENVELOPE-OPEN"),
("93","PURCHASE ORDER LIST","0","2","81","po_list","0","2018-02-15 18:29:35","1",""),
("94","CREATE PURCHASE ORDER","0","1","81","po","0","2018-02-15 18:29:47","1",""),
("95","QUOTATION  LIST","0","2","73","estimate_list","0","2018-02-15 18:30:15","1",""),
("96","CREATE QUOTATION","0","1","73","estimate","0","2018-02-15 18:30:40","1",""),
("97","SALES ORDER LIST","0","2","92","sales_order_list","0","2018-02-15 18:36:40","1",""),
("98","CREATE SALES ORDER","0","1","92","sales_order","0","2018-02-15 18:37:24","1",""),
("99","SERIAL NUMBER REPORT","0","0","7","serial_number_report","2","2018-10-10 17:35:24","1",""),
("100","CONSIGNEE LIST","0","1","5","consignee_list","2","2019-08-26 11:40:20","1",""),
("101","COUNTRY LIST","0","14","5","COUNTRY","2","2019-09-09 14:15:30","1",""),
("102","SALES REGISTER","0","13","7","sales_register","2","2019-11-18 12:19:52","1",""),
("103","PURCHASE REGISTER","0","14","7","purchase_register","2","2019-11-18 12:21:00","1",""),
("104","E-WAY BILL","0","9","0","E_WAYBILL","2","2018-10-10 17:34:17","1","FA-TRUCK"),
("105","PAYMENT TERMS","0","7","5","PAYMENT_TERMS","2","2019-09-09 14:15:11","1",""),
("106","MODE DISPACH LIST","0","8","5","MODE_DISPACH","2","2019-08-26 11:40:35","1",""),
("107","PLACE SUPPLY","0","10","5","PLACE_SUPPLY","2","2019-08-26 11:40:44","1",""),
("108","PRODUCT CATEGORY","0","4","5","product_cat_mst","2","2019-06-20 15:11:35","1",""),
("109","PRODUCT SUB-CATEGORY","0","4","5","product_sub_cat_mst","2","2019-06-20 15:11:32","1",""),
("110","BRANCH LIST","0","4","5","branch_mst","2","2019-09-09 14:15:04","1","");
INSERT INTO tbl_menu VALUES
("111","PURCHASE BILL","0","4","0","","2","2019-06-20 14:49:40","1","fa-shopping-cart"),
("112","CREATE PURCHASE","0","1","111","purchase_add","0","2018-10-12 11:14:41","1",""),
("113","PURCHASE LIST","0","2","111","purchase_list","0","2018-10-12 11:14:55","1",""),
("114","SALES-PURCHASE RETURN","0","7","0","","2","2019-06-20 14:49:56","1","fa-random"),
("115","PURCHASE RETURN","0","1","114","DEBITNOTE_LIST","0","2018-10-18 11:58:44","1",""),
("116","SALES RETURN","0","2","114","CREDIT_NOTE_LIST","0","2018-10-18 11:58:51","1",""),
("117","STOCK TRANSFER","0","5","0","stock_transfer_list","2","2019-06-20 14:49:45","1","FA-EXCHANGE"),
("118","PRODUCT STOCK REPORT","0","0","7","product-stock-report","2","2019-11-18 12:19:34","1",""),
("119","PRODUCT MAKE","0","4","5","product_make_mst","2","2019-06-20 15:09:50","1",""),
("120","LANDING PRICE REPORT","0","0","7","pro_landing_price_report","2","2019-11-18 12:21:11","1",""),
("121","PRODUCT SIZE","0","4","5","product_size_mst","2","2019-06-20 15:10:56","1",""),
("122","PRODUCT COLOR","0","4","5","product_color_mst","2","2019-06-20 15:10:45","1",""),
("123","PRODUCT MOC","0","4","5","product_moc_mst","2","2019-06-20 15:10:52","1",""),
("124","GOODS RECEIPT NOTE","0","3","0","","2","2019-06-20 14:49:37","1","FA-CART-PLUS"),
("125","CREATE G.R.N.","0","1","124","grn_add","2","2019-03-23 14:51:14","1",""),
("126","G.R.N. LIST","0","2","124","grn_list","2","2019-03-23 14:51:16","1",""),
("127","ADD G.R.N.","0","1","124","grn_add","0","2019-05-27 16:14:05","1",""),
("128","G.R.N. LIST","0","2","124","grn_list","0","2019-05-27 16:14:16","1",""),
("129","EMPLOYEE","0","3","0","employee_list","2","2019-06-20 15:29:20","1",""),
("130","EMPLOYEE","0","3","5","employee_list","2","2019-08-26 11:40:28","1",""),
("131","PRODUCT LIST","1","5","5","product_list","0","2019-09-09 15:16:40","1",""),
("132","BOM","0","2","0","","2","2019-08-26 11:39:16","1","fa fa-file-text-o"),
("133","CREATE BOM","0","1","132","bom_add","0","2019-06-21 10:39:51","1",""),
("134","BOM LIST","0","2","132","bom_list","0","2019-06-21 10:40:17","1",""),
("135","PO LIST","0","2","0","","2","2019-08-26 11:39:13","1","fa fa-list"),
("136","CREATE PURCHASE ORDER	","0","1","135","po","0","2019-06-21 18:38:30","1",""),
("137","PURCHASE ORDER LIST","0","2","135","po_list","0","2019-06-21 18:38:48","1",""),
("138","REQUEST LIST","0","3","135","po_req_list","0","2019-06-21 18:39:05","1",""),
("139","PURCHASE","0","4","0","","2","2019-08-26 11:39:21","1","fa-shopping-cart"),
("140","CREATE PURCHASE","0","1","139","purchase_add","0","2019-06-22 15:50:34","1",""),
("141","PURCHASE LIST","0","2","139","purchase_list","0","2019-06-22 15:50:55","1",""),
("142","STOCK TRANSFER","0","4","0","stock_transfer_list","2","2019-08-26 11:39:18","1","FA-EXCHANGE"),
("143","JOBWORK","0","6","0","","2","2019-08-26 11:39:23","1","fa fa-certificate"),
("144","OUTWARD","0","1","143","jobwork_list","0","2019-06-25 11:18:31","1",""),
("145","INWARD","0","2","143","jobwork_inward_list","0","2019-06-25 11:18:49","1",""),
("146","INVOICE","0","7","0","","2","2019-08-26 11:39:25","1","FA FA-envelope"),
("147","CREATE INVOICE","0","1","146","invoice","0","2019-06-27 15:23:29","1",""),
("148","INVOICE LIST","0","2","146","invoice_list","0","2019-06-27 15:23:48","1",""),
("149","EXPENSE MANAGER","0","8","0","","2","2019-08-26 11:39:34","1","fa-money"),
("150","EXPENSE ENTRY","0","1","149","expense-entry","0","2019-06-27 16:19:43","1",""),
("151","EXPENSE LIST","0","2","149","expense_list","0","2019-06-27 16:19:57","1",""),
("152","EXPENSE HEAD LIST","0","9","5","expense_head_list","2","2019-08-26 11:40:38","1",""),
("153","EXPENSE LIST","0","9","5","expense_mst","2","2019-09-09 14:15:16","1",""),
("154","INCOME MANAGER","0","9","0","","2","2019-08-26 11:39:39","1","fa-money"),
("155","INCOME ENTRY","0","1","154","income-entry","0","2019-06-27 19:02:25","1",""),
("156","INCOME LIST","0","2","154","income_list","0","2019-06-27 19:02:41","1",""),
("157","INCOME LIST","0","9","5","income_mst","2","2019-09-09 14:15:14","1",""),
("158","REPORT MANAGER","0","10","0","","2","2019-08-26 11:39:47","1","fa-bar-chart-o"),
("159","STOCK REPORT","0","1","158","report-stock","0","2019-07-15 15:43:58","1",""),
("160","JOBWORK STOCK REPORT","0","2","158","report-jobwork-stock","0","2019-07-16 15:09:12","1",""),
("161","STOCK VALUATION","0","3","158","report-stock-valuation","0","2019-07-16 18:57:30","1",""),
("162","ACCOUNTANT","0","8","0","","2","2019-08-26 11:39:28","1","fa fa-building"),
("163","ACCOUNT CHART","0","1","162","charts-of-account","0","2019-07-17 12:40:22","1",""),
("164","ACCOUNT VOUCHER","0","2","162","account-voucher-list","0","2019-07-17 12:40:37","1",""),
("165","PAYMENT MANAGER","0","9","0","","2","2019-08-26 11:39:41","1","Fa-money"),
("166","SALE PAYMENT LIST","0","1","165","invoicepayment_list","0","2019-07-17 14:27:54","1",""),
("167","PURCHASE PAYMENT LIST","0","2","165","purchasepayment_list","0","2019-07-17 14:28:06","1",""),
("168","JOBWORK PAYMENT LIST","0","3","165","jobworkpayment_list","0","2019-07-17 17:52:09","1",""),
("169","PROFIT AND LOSS","0","4","158","profit-and-loss-statement","0","2019-07-18 14:12:01","1",""),
("170","PRODUCT CATEGORY LIST","1","1","5","category_list","0","2019-09-09 14:26:00","1",""),
("171","GROUP LIST","0","3","5","group_list","2","2019-09-09 14:15:00","1",""),
("172","BANK MANAGER","0","8","0","","2","2019-08-26 11:39:31","1","fa-building-o"),
("173","BANK MASTER","0","1","172","bank-acc-list","0","2019-07-30 14:48:02","1",""),
("174","BANK TRANSACTION","0","2","172","bank-cash-transfer","0","2019-07-30 14:47:11","1",""),
("175","SALES ORDER","0","8","0","","2","2019-08-26 11:39:36","1","FA-ENVELOPE-OPEN"),
("176","CREATE SALES ORDER","0","1","175","sales_order","0","2019-08-21 10:29:42","1",""),
("177","SALES ORDER LIST","0","2","175","sales_order_list","0","2019-08-21 10:30:32","1",""),
("178","MANAGE COMPANY","1","1","83","manage_company","0","2019-09-02 12:57:12","1",""),
("179","DEMO","4","4","0","","2","2019-09-02 12:56:46","1","fa fa-user"),
("180","USER PERMISSION","1","2","83","user_permission","0","2019-12-17 12:19:42","1",""),
("181","USER","1","3","83","useradd","0","2019-09-04 11:42:39","1",""),
("182","TERRITORIES","1","4","83","territory_list","0","2019-09-04 13:25:10","1",""),
("183","OPPORTUNITY STAGE","1","5","83","opprotunity_list","0","2019-09-09 11:42:24","1",""),
("184","COUNTRY LIST","1","6","83","country","0","2019-09-09 12:46:16","1",""),
("185","STATE LIST","0","7","83","state","0","2019-09-09 12:46:34","1",""),
("186","CITY LIST","0","8","83","city","0","2019-09-09 12:46:51","1",""),
("187","PRODUCT GROUP","1","2","5","product_grp","0","2019-09-09 14:26:04","1",""),
("188","PRODUCT BRAND","1","3","5","product_brand","0","2019-09-09 14:57:13","1",""),
("189","MASTER","1","6","5","master_category_list","0","2019-09-09 22:07:50","1",""),
("190","ANNEXURE","1","7","5","annexure_detail_list","0","2019-09-26 12:19:41","1",""),
("191","TERMS AND CONDITIONS","1","8","5","terms_list","0","2019-09-10 12:08:51","1",""),
("192","CONVERSION RATE","1","9","5","conversion_rate_add","0","2019-09-10 19:11:49","1",""),
("193","PARTY","2","6","0","customer_list","0","2019-11-29 14:38:01","1","FA FA-USER"),
("194","CONTACT","2","5","0","customer_contact_list","2","2019-11-18 12:22:46","1","FA FA-ADDRESS-CARD-O"),
("195","SERIES","1","9","83","series_type_list","0","2019-09-18 15:28:57","1",""),
("196","INQUIRY","0","2","0","","0","2019-09-18 15:40:05","1","fa-globe"),
("197","Add Inquiry","0","1","196","inquiry_add","0","2019-09-18 15:40:27","1",""),
("198","Inquiry List","0","2","196","inquiry_list","0","2019-09-18 15:40:44","1",""),
("199","TASK","4","4","0","","0","2019-09-30 17:41:37","1","fa-list-alt"),
("200","Add Task","0","1","199","task_add","0","2019-09-21 15:54:40","1",""),
("201","Task List","0","2","199","task_list","0","2019-09-21 15:54:56","1",""),
("202","APPOINTMENT","4","5","0","","0","2019-09-30 17:41:44","1","fa-clock-o"),
("203","Add Appointment","0","1","202","appointment_add","0","2019-09-24 14:33:45","1",""),
("204","Appointment List","0","2","202","appointment_list","0","2019-09-24 14:34:02","1",""),
("205","QUOTATION","3","3","0","","0","2019-09-24 18:13:05","1","fa-diamond"),
("206","Add Quotation","0","1","205","quotation_add","0","2019-09-24 18:13:27","1",""),
("207","Quotation List","0","2","205","quotation_list","0","2019-09-24 18:13:42","1",""),
("208","MASTER BOM","1","10","5","master_bom_list","0","2019-10-17 19:13:52","1",""),
("209","SALES ORDER","0","6","0","","0","2019-10-24 14:26:51","1","fa-folder-open"),
("210","BOM LIST","0","7","0","bom_list","0","2019-10-24 14:27:14","1","fa-building-o");
INSERT INTO tbl_menu VALUES
("211","Planning","0","8","0","planning_list","0","2019-10-24 14:27:34","1","fa-calendar-o"),
("212","ADD SALES ORDER","0","1","209","sales_order_add","0","2019-11-29 14:38:30","1",""),
("213","PURCHASE ORDER","0","12","0","","0","2019-11-18 13:07:51","1","fa-shopping-cart"),
("214","Add Purchase Order","0","1","213","po","0","2019-11-18 12:09:43","1",""),
("215","Purchase Order List","0","2","213","po_list","0","2019-11-18 12:10:01","1",""),
("216","PURCHASE","0","13","0","","0","2019-11-18 12:10:26","1","fa-cart-plus"),
("217","Add Purchase","0","1","216","purchase_add","0","2019-11-18 12:10:48","1",""),
("218","Purchase List","0","2","216","purchase_list","0","2019-11-18 12:11:02","1",""),
("219","INVOICE","0","14","0","","0","2019-11-18 12:11:28","1","fa-envelope"),
("220","Add Invoice","0","1","219","invoice_add","0","2019-11-18 12:11:47","1",""),
("221","Invoice List","0","2","219","invoice_list","0","2019-11-18 12:12:09","1",""),
("222","REPORT MANAGER","0","19","0","report_list","2","2019-11-18 12:19:18","1","fa-bar-chart-o"),
("223","Inquiry Product Report","0","1","222","report_inq_pro","0","2019-11-18 12:17:41","1",""),
("224","Inquiry By Date Report","0","2","222","report_inq_bydate","0","2019-11-18 12:17:56","1",""),
("225","Task Activity Details By Owner Report","0","3","222","report_task_act_byowner","0","2019-11-18 12:18:09","1",""),
("226","Inquiry Product Report","0","1","7","report_inq_pro","0","2019-11-18 12:21:32","1",""),
("227","Inquiry By Date Report","0","2","7","report_inq_bydate","0","2019-11-18 12:21:44","1",""),
("228","Task Activity Details By Owner Report","0","3","7","report_task_act_byowner","0","2019-11-18 12:21:57","1",""),
("229","Party Industry","0","5","83","cust_ind_mst","0","2019-11-23 15:17:51","1",""),
("230","Sales Order List","0","2","209","sales_order_list","0","2019-11-29 14:38:45","1",""),
("231","Product Stock Report","0","4","7","product-stock-report","0","2019-12-12 13:02:28","1",""),
("232","Stock Issue Entry","0","14","0","issue_entry_list","0","2019-12-12 13:03:12","1","fa-minus-circle"),
("233","PRF List","0","15","0","prf_list","0","2019-12-17 11:34:21","1","fa-asterisk"),
("234","Request List","0","3","213","po_req_list","0","2019-12-17 11:34:46","1",""),
("235","Forecast","0","16","0","","0","2019-12-17 11:36:21","1","fa-line-chart"),
("236","Forecast","0","1","235","forecast_list","0","2019-12-17 11:36:37","1",""),
("237","Forecast By User","0","2","235","forecast_byuser_list","2","2020-01-09 19:38:50","1",""),
("238","Party Category","0","11","5","cust_cat_mst","0","2020-01-09 19:36:51","1",""),
("239","GRN","0","12","0","","0","2020-01-09 19:37:22","1","fa-archive"),
("240","ADD G.R.N.","0","1","239","grn_add","0","2020-01-09 19:38:01","1",""),
("241","G.R.N. List","0","2","239","grn_list","0","2020-01-09 19:38:15","1",""),
("242","SOURCE LIST","0","11","83","source_mst","0","2020-01-28 11:45:38","1",""),
("243","USER TYPE LIST","1","12","83","usertype_list","0","2020-06-18 15:25:34","0",""),
("244","Leads by Executive Report","0","5","7","report_leads_by_executive","0","2020-07-06 11:22:35","1",""),
("245","Leads by Sales Stage Report","0","6","7","report_leads_by_sales_stage","0","2020-07-06 11:22:50","1",""),
("246","Leads by Leads by Stages","0","7","7","report_lead_by_stages","0","2020-07-06 11:23:04","1",""),
("247","Leads by Leads by Probablity","0","8","7","report_leads_by_probablity","0","2020-07-06 11:23:19","1",""),
("248","New Vs Existing","0","9","7","report_new_vs_existing","0","2020-07-06 11:23:34","1",""),
("249","Leads by Closing Dates","0","10","7","report_leads_by_closing_dates","0","2020-07-06 11:23:52","1",""),
("250","Leads by Months","0","12","7","report_leads_by_months","0","2020-07-06 11:24:10","1",""),
("251","crm dashboard","0","1","0","crm_dashboard","0","2020-07-08 00:17:20","1","FA-DASHBOARD");




CREATE TABLE `tbl_opportunity_mst` (
  `opp_id` int(11) NOT NULL AUTO_INCREMENT,
  `opp_stage` varchar(100) NOT NULL,
  `opp_probability` varchar(100) NOT NULL,
  `opp_priority` int(11) NOT NULL,
  `opp_status` int(11) NOT NULL COMMENT '0:active , 1: inactive , 2:delete',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`opp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


INSERT INTO tbl_opportunity_mst VALUES
("2","SADAS","12","12","2","2019-09-09 12:23:45","1","1"),
("3","EEEE","12","12","2","2019-09-09 12:23:50","1","1"),
("4","CLOSED LOST","0","9","0","2020-07-13 12:28:30","1","1"),
("5","PROSPECTING","10","1","0","2019-12-28 06:23:20","1","1"),
("6","NOT APPLICABLE","15","11","1","2019-09-09 12:44:02","1","1"),
("7","QUALIFICATION","25","2","0","2020-07-06 14:17:20","1","1"),
("8","WON","100","7","0","2020-07-13 12:28:45","1","1"),
("9","DEMONSTRATION","50","3","0","2020-07-06 14:15:52","1","1"),
("10","COMMERCIAL","70","4","0","2020-07-11 00:43:53","1","1"),
("11","NEGOTOATION","90","5","0","2020-07-11 00:43:47","1","1"),
("12","DATABANK","0","0","0","2020-07-06 11:54:04","1","1"),
("13","SALES CONFIRMATION","99","6","0","2020-07-13 12:29:19","1","1");




CREATE TABLE `tbl_org_currency` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_id` int(11) NOT NULL,
  `curren_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_org_currency VALUES
("11","1","68");




CREATE TABLE `tbl_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `add_permission` int(11) NOT NULL,
  `view_permission` int(11) NOT NULL,
  `active_permission` int(11) NOT NULL,
  `inactive_permission` int(11) NOT NULL,
  `export_permission` int(11) NOT NULL,
  `edit_permission` int(11) NOT NULL,
  `delete_permission` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10301 DEFAULT CHARSET=latin1;


INSERT INTO tbl_permission VALUES
("7363","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7364","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7365","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7366","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7367","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7368","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7369","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7391","9","179","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7392","9","70","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7393","9","1","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7394","9","178","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7395","9","5","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7396","9","180","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("7397","9","83","1","0","0","0","0","0","0","0","0","2019-09-03 11:54:58","1"),
("9565","1","1","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9566","1","5","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9567","1","29","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9568","1","131","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9569","1","170","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9570","1","187","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9571","1","188","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9572","1","189","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9573","1","190","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9574","1","191","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9575","1","192","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9576","1","208","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9577","1","238","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9578","1","7","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9579","1","226","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9580","1","227","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9581","1","228","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9582","1","231","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9583","1","70","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9584","1","71","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:20","0"),
("9585","1","72","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9586","1","83","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9587","1","178","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9588","1","180","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9589","1","181","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9590","1","182","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9591","1","183","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9592","1","184","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9593","1","185","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9594","1","186","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9595","1","195","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9596","1","229","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9597","1","242","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9598","1","243","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9599","1","193","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9600","1","196","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9601","1","197","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9602","1","198","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9603","1","199","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9604","1","200","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9605","1","201","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9606","1","202","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9607","1","203","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9608","1","204","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9609","1","205","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9610","1","206","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9611","1","207","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9612","1","209","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9613","1","212","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9614","1","230","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9615","1","210","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9616","1","211","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:21","0"),
("9617","1","213","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9618","1","214","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9619","1","215","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9620","1","234","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9621","1","216","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9622","1","217","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9623","1","218","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9624","1","219","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9625","1","220","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9626","1","221","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9627","1","232","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9628","1","233","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9629","1","235","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9630","1","236","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9631","1","239","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9632","1","240","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9633","1","241","1","0","0","0","0","0","1","1","0","2020-06-18 15:27:22","0"),
("9927","7","1","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9928","7","7","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9929","7","226","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9930","7","227","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9931","7","228","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9932","7","231","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9933","7","182","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9934","7","183","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9935","7","184","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9936","7","185","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9937","7","186","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9938","7","229","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9939","7","242","1","0","0","0","0","0","1","0","0","2020-06-19 14:53:58","1"),
("9940","7","193","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9941","7","196","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9942","7","197","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9943","7","198","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1");
INSERT INTO tbl_permission VALUES
("9944","7","199","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9945","7","200","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9946","7","201","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9947","7","202","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9948","7","203","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9949","7","204","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9950","7","205","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9951","7","206","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9952","7","207","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9953","7","235","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9954","7","236","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("10071","8","180","1","0","0","0","0","0","0","0","0","2020-07-06 16:03:42","1"),
("10072","8","193","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10073","8","196","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10074","8","197","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10075","8","198","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10076","8","199","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10077","8","200","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10078","8","201","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10079","8","202","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10080","8","203","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10081","8","204","1","0","0","0","0","0","1","0","0","2020-07-06 16:03:42","1"),
("10082","6","1","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10083","6","5","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10084","6","29","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10085","6","131","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10086","6","170","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10087","6","187","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10088","6","188","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10089","6","189","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10090","6","190","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10091","6","191","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10092","6","192","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10093","6","208","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10094","6","238","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10095","6","7","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10096","6","226","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10097","6","227","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10098","6","228","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10099","6","231","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10100","6","244","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10101","6","245","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10102","6","246","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10103","6","247","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10104","6","248","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10105","6","249","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10106","6","250","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10107","6","83","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10108","6","178","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10109","6","180","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10110","6","181","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10111","6","182","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10112","6","183","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10113","6","184","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10114","6","185","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10115","6","186","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10116","6","195","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10117","6","229","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10118","6","242","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10119","6","243","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10120","6","193","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10121","6","196","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10122","6","197","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10123","6","198","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10124","6","199","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10125","6","200","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10126","6","201","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10127","6","202","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10128","6","203","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10129","6","204","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10130","6","205","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10131","6","206","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10132","6","207","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10133","6","235","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10134","6","236","1","0","0","0","0","0","1","1","0","2020-07-08 00:14:49","1"),
("10135","2","1","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10136","2","5","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10137","2","29","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10138","2","131","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10139","2","170","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10140","2","187","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10141","2","188","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10142","2","189","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10143","2","190","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10144","2","191","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10145","2","192","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10146","2","208","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10147","2","238","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10148","2","7","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10149","2","226","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10150","2","227","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10151","2","228","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10152","2","231","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10153","2","244","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10154","2","245","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10155","2","246","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10156","2","247","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10157","2","248","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10158","2","249","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10159","2","250","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1");
INSERT INTO tbl_permission VALUES
("10160","2","83","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10161","2","178","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10162","2","180","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10163","2","181","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10164","2","182","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10165","2","183","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10166","2","184","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10167","2","185","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10168","2","186","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10169","2","195","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10170","2","229","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10171","2","242","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10172","2","243","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10173","2","193","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10174","2","196","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10175","2","197","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10176","2","198","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10177","2","199","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10178","2","200","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10179","2","201","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10180","2","202","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10181","2","203","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10182","2","204","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10183","2","205","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10184","2","206","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10185","2","207","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10186","2","235","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10187","2","236","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10188","2","251","1","0","0","0","0","0","1","1","0","2020-07-08 00:17:47","1"),
("10189","5","1","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10190","5","5","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10191","5","29","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10192","5","131","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10193","5","170","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10194","5","187","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10195","5","188","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10196","5","189","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10197","5","190","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10198","5","191","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10199","5","192","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10200","5","208","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10201","5","238","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10202","5","7","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10203","5","226","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10204","5","227","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10205","5","228","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10206","5","231","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10207","5","83","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10208","5","178","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10209","5","180","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10210","5","181","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10211","5","182","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10212","5","183","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10213","5","184","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10214","5","185","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10215","5","186","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10216","5","195","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10217","5","229","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10218","5","242","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10219","5","243","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10220","5","193","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10221","5","196","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10222","5","197","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10223","5","198","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10224","5","199","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10225","5","200","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10226","5","201","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10227","5","202","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10228","5","203","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10229","5","204","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10230","5","205","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10231","5","206","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10232","5","207","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10233","5","251","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:35","1"),
("10234","4","1","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10235","4","5","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10236","4","29","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10237","4","131","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10238","4","170","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10239","4","187","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10240","4","188","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10241","4","189","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10242","4","190","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10243","4","191","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10244","4","192","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10245","4","208","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10246","4","238","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10247","4","7","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10248","4","226","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10249","4","227","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10250","4","228","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10251","4","231","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10252","4","83","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10253","4","178","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10254","4","180","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10255","4","181","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10256","4","182","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10257","4","183","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10258","4","184","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10259","4","185","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1");
INSERT INTO tbl_permission VALUES
("10260","4","186","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10261","4","195","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10262","4","229","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10263","4","242","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10264","4","243","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10265","4","193","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10266","4","196","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10267","4","197","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10268","4","198","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10269","4","199","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10270","4","200","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10271","4","201","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10272","4","202","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10273","4","203","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10274","4","204","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10275","4","205","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10276","4","206","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10277","4","207","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10278","4","235","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10279","4","236","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10280","4","251","1","0","0","0","0","0","1","1","0","2020-07-08 00:18:54","1"),
("10281","3","1","1","0","0","0","0","0","0","0","0","2020-07-10 14:30:00","1"),
("10282","3","83","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10283","3","182","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10284","3","184","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10285","3","185","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10286","3","186","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10287","3","193","1","0","0","0","0","0","1","1","0","2020-07-10 14:30:00","1"),
("10288","3","196","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10289","3","197","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10290","3","198","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10291","3","199","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10292","3","200","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10293","3","201","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10294","3","202","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10295","3","203","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10296","3","204","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10297","3","205","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10298","3","206","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10299","3","207","1","0","0","0","0","0","1","0","0","2020-07-10 14:30:00","1"),
("10300","3","251","1","0","0","0","0","0","0","0","0","2020-07-10 14:30:00","1");




CREATE TABLE `tbl_permission_role` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `add_permission` int(11) NOT NULL,
  `view_permission` int(11) NOT NULL,
  `active_permission` int(11) NOT NULL,
  `inactive_permission` int(11) NOT NULL,
  `export_permission` int(11) NOT NULL,
  `edit_permission` int(11) NOT NULL,
  `delete_permission` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;


INSERT INTO tbl_permission_role VALUES
("46","8","179","1","0","1","0","0","0","1","0","0","2019-09-06 10:43:33","1"),
("47","8","70","1","1","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("48","8","1","1","1","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("49","8","178","1","0","0","0","0","0","1","0","0","2019-09-06 10:43:33","1"),
("50","8","5","1","0","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("51","8","180","1","0","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("52","8","83","1","0","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("53","8","182","1","0","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("54","8","181","1","0","0","0","0","0","0","0","0","2019-09-06 10:43:33","1"),
("55","9","179","1","1","1","0","0","0","1","0","0","2019-09-06 10:44:31","1"),
("56","9","70","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("57","9","1","1","1","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("58","9","178","1","0","0","0","0","0","1","0","0","2019-09-06 10:44:31","1"),
("59","9","5","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("60","9","180","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("61","9","83","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("62","9","182","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1"),
("63","9","181","1","0","0","0","0","0","0","0","0","2019-09-06 10:44:31","1");




CREATE TABLE `tbl_planning` (
  `planning_id` int(11) NOT NULL AUTO_INCREMENT,
  `planning_no` varchar(400) NOT NULL,
  `planning_date` date NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `planning_name` varchar(400) NOT NULL,
  `phase1_status` int(11) NOT NULL,
  `phase1_start_date` date NOT NULL,
  `phase1_end_date` date NOT NULL,
  `op_sheet` int(11) NOT NULL,
  `op_sheet_attch` varchar(400) NOT NULL,
  `op_sheet_remark` longtext NOT NULL,
  `budget_sheet` int(11) NOT NULL,
  `budget_sheet_attch` varchar(400) NOT NULL,
  `budget_sheet_attch_remark` longtext NOT NULL,
  `pfi_inv1` int(11) NOT NULL,
  `pfi_inv1_attch` varchar(400) NOT NULL,
  `pfi_inv1_remark` longtext NOT NULL,
  `pfi_inv2` int(11) NOT NULL,
  `pfi_inv2_attch` varchar(400) NOT NULL,
  `pfi_inv2_remark` longtext NOT NULL,
  `process_flow_dg` int(11) NOT NULL,
  `process_flow_dg_attch` varchar(400) NOT NULL,
  `process_flow_dg_remark` longtext NOT NULL,
  `civil_layout` int(11) NOT NULL,
  `civil_layout_attch` varchar(400) NOT NULL,
  `civil_layout_remark` longtext NOT NULL,
  `section_drawing` int(11) NOT NULL,
  `section_drawing_attch` varchar(400) NOT NULL,
  `section_drawing_remark` longtext NOT NULL,
  `fab_drawing` int(11) NOT NULL,
  `fab_drawing_attch` varchar(400) NOT NULL,
  `fab_drawing_remark` longtext NOT NULL,
  `p_and_id` int(11) NOT NULL,
  `p_and_id_attch` varchar(400) NOT NULL,
  `p_and_id_remark` longtext NOT NULL,
  `phase2_status` int(11) NOT NULL,
  `phase2_start_date` date NOT NULL,
  `phase2_end_date` date NOT NULL,
  `purchase_bill` int(11) NOT NULL,
  `purchase_bill_attch` varchar(400) NOT NULL,
  `purchase_bill_remark` longtext NOT NULL,
  `inspection_status` int(11) NOT NULL,
  `inspection_attch` varchar(400) NOT NULL,
  `inspection_remark` longtext NOT NULL,
  `phase3_status` int(11) NOT NULL,
  `phase3_start_date` date NOT NULL,
  `phase3_end_date` date NOT NULL,
  `dispatch_status` int(11) NOT NULL,
  `dispatch_status_attch` varchar(400) NOT NULL,
  `dispatch_status_remark` longtext NOT NULL,
  `transport_status` int(11) NOT NULL,
  `transport_status_attch` varchar(400) NOT NULL,
  `transport_status_remark` longtext NOT NULL,
  `tax_inv_status` int(11) NOT NULL,
  `tax_inv_status_attch` varchar(400) NOT NULL,
  `tax_inv_status_remark` longtext NOT NULL,
  `del_challan_status` int(11) NOT NULL,
  `del_challan_status_attch` varchar(400) NOT NULL,
  `del_challan_status_remark` longtext NOT NULL,
  `eway_bill_status` int(11) NOT NULL,
  `eway_bill_status_attch` varchar(400) NOT NULL,
  `eway_bill_status_remark` longtext NOT NULL,
  `phase4_status` int(11) NOT NULL,
  `phase4_start_date` date NOT NULL,
  `phase4_end_date` date NOT NULL,
  `install_status` int(11) NOT NULL,
  `install_status_attch` varchar(400) NOT NULL,
  `install_status_remark` longtext NOT NULL,
  `commission_status` int(11) NOT NULL,
  `commission_status_attch` varchar(400) NOT NULL,
  `commission_status_remark` longtext NOT NULL,
  `plant_handover_status` int(11) NOT NULL,
  `plant_handover_attch` varchar(400) NOT NULL,
  `plant_handover_remark` longtext NOT NULL,
  `plan_per` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `planning_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`planning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO tbl_planning VALUES
("1","PLN/003/19-20","2019-11-20","1","rajkot","1","2019-11-20","2019-11-20","1","","Done","1","","Done","0","","","0","","","0","","","0","","","0","","","0","","","0","","","0","2019-11-20","2019-11-20","0","","","0","","","0","2019-11-20","2019-11-20","0","","","0","","","0","","","0","","","0","","","0","2019-11-20","2019-11-20","0","","","0","","","0","","","25","2019-11-20 11:11:43","0","1","1"),
("2","PLN/004/19-20","2019-11-24","4","5 KL ETP","1","2019-11-24","2019-11-24","0","","","0","","","0","","","0","","","0","","","0","","","0","","","0","","","0","","","1","2019-11-24","2019-11-24","0","","","0","","","1","2019-11-24","2019-11-24","0","","","0","","","0","","","0","","","0","","","1","2019-11-24","2019-11-24","0","","","0","","","0","","","100","2019-11-24 10:57:11","0","1","1"),
("3","PLN/005/19-20","2019-11-30","9","100 KL EFFLUENT TREATMENT PLANT","1","2019-11-30","2019-11-30","0","","","0","","","0","","","0","","","0","","","0","","","0","","","0","","","0","","","1","2019-11-30","2019-11-30","0","","","0","","","0","2019-11-30","2019-11-30","0","","","0","","","0","","","0","","","0","","","0","2019-11-30","2019-11-30","0","","","0","","","0","","","50","2019-11-30 09:31:20","0","1","1"),
("4","PLN/006/19-20","2019-12-06","10"," COMMERCIAL QUOTATION FOR 50 KL EFFLUENT TRETAMENT PLANT","1","2019-12-06","2019-12-06","1","","","0","","","1","","","0","","","0","","","0","","","0","","","0","","","0","","","1","2019-12-06","2019-12-06","1","","","1","","","0","2019-12-06","2019-12-06","0","","","0","","","0","","","0","","","0","","","1","2019-12-06","2019-12-06","0","","","0","","","0","","","75","2019-12-06 16:54:37","0","1","1"),
("5","PLN/007/19-20","2020-01-24","11","5KLD@TEST CUSTOMER 11","1","2020-01-24","2020-01-24","0","","","0","","","1","","","1","","","0","","","0","","","0","","","0","","","0","","","1","2020-01-24","2020-01-24","0","","","0","","","1","2020-01-24","2020-01-24","0","","","0","","","0","","","0","","","0","","","1","2020-01-24","2020-01-24","1","","","1","","","1","","","100","2020-01-24 12:31:18","0","1","1");




CREATE TABLE `tbl_po_log` (
  `po_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `purchaseordertrn_id` int(11) NOT NULL,
  `approve_remark` longtext NOT NULL,
  `approve_status` int(11) NOT NULL COMMENT '0:Reject, 1:Approve',
  `po_log_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`po_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO tbl_po_log VALUES
("1","3","4","","0","0","2019-12-06 16:48:35","1","1"),
("2","3","4","","1","0","2019-12-06 16:48:53","1","1"),
("3","5","23","ok","1","0","2020-01-07 12:37:35","5","1"),
("4","6","27","","1","0","2020-01-24 12:11:41","1","1"),
("5","24","91","Online application done","0","0","2020-04-16 18:22:10","1","1"),
("6","30","102","","1","0","2020-06-12 13:50:23","21","1"),
("7","30","102","","1","0","2020-06-12 13:50:44","21","1"),
("8","32","104","Done","1","0","2020-06-12 13:51:57","24","1");




CREATE TABLE `tbl_po_terms_trn` (
  `po_terms_trn_id` int(10) NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `tc_id` int(11) NOT NULL,
  `tc_priority` int(11) NOT NULL,
  `tc_details` longtext CHARACTER SET utf8 NOT NULL,
  `po_terms_trn_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`po_terms_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


INSERT INTO tbl_po_terms_trn VALUES
("1","9","15","2","50% advance along with order\n50% after getting CTE","0","2020-01-28 14:13:57"),
("2","12","15","2","50% advance along with order\n50% after getting CTE","0","2020-02-13 16:59:43");




CREATE TABLE `tbl_prf_entry` (
  `prf_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `prf_entry_no` varchar(400) NOT NULL,
  `prf_entry_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_des` mediumtext NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `prf_approve_status` int(11) NOT NULL,
  `po_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `print_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`prf_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;


INSERT INTO tbl_prf_entry VALUES
("1","PRF/002/19-20","2019-12-27","3","kjkj","0","2019-12-27 17:19:18","2019-12-27 17:19:18","0","1","0","1","hjbhkjbj","0","1"),
("2","PRF/003/19-20","2019-12-27","66","","0","2019-12-27 17:29:12","2019-12-27 17:29:12","0","1","0","1","hvghvgh","0","1"),
("3","PRF/004/19-20","2020-01-07","3","","0","2020-01-07 12:32:11","2020-01-07 12:32:11","2","1","0","5","hhhh","0","1"),
("4","PRF/005/19-20","2020-01-10","0","","0","2020-01-10 14:13:44","2020-01-10 14:13:44","2","0","0","1","We want to purchase","0","1"),
("5","PRF/006/19-20","2020-01-11","0","","0","2020-01-11 07:59:22","2020-01-11 07:59:22","0","1","1","7","Labhshree project","0","1"),
("6","PRF/007/19-20","2020-01-12","0","pH: 6.5-6.7\nConductivity : 1.0-5.0","0","2020-01-12 07:52:30","2020-01-12 07:35:02","0","1","0","5","We have stock of only 10 Lite/ 1 carboy","0","1"),
("7","PRF/008/19-20","2020-01-12","78","","0","2020-01-12 07:59:40","2020-01-12 07:59:40","0","1","0","5","we have stock of only 1 Box we want to purchase 3 Box","0","1"),
("8","PRF/009/19-20","2020-01-12","115","","0","2020-01-12 08:26:12","2020-01-12 08:26:12","0","1","0","5","two boc to be purchase. Stock is only 1 box","0","1"),
("9","PRF/010/19-20","2020-01-24","0","","0","2020-01-24 12:05:10","2020-01-24 12:05:10","0","1","1","1","test","0","1"),
("10","PRF/011/19-20","2020-01-24","413"," Offset Printing, Logo UV Printing","0","2020-01-29 10:21:42","2020-01-24 13:15:12","0","0","0","1","Delivery At our office Gota","0","1"),
("11","PRF/012/19-20","2020-01-26","0","","0","2020-01-26 19:37:36","2020-01-26 19:37:36","0","1","0","1","please grant to purchase ","0","1"),
("12","PRF/013/19-20","2020-01-28","0","","0","2020-01-28 13:48:44","2020-01-28 13:48:44","0","1","1","1","Khandubhai","0","1"),
("13","PRF/014/19-20","2020-02-01","0","Star Flow","0","2020-02-01 11:12:07","2020-02-01 11:11:42","2","0","0","1","Star Flow Ball pen","0","1"),
("14","PRF/015/19-20","2020-02-01","0","","0","2020-02-01 11:26:40","2020-02-01 11:19:17","2","1","1","1","Hari supplier ","0","1"),
("15","PRF/016/19-20","2020-02-01","0","","0","2020-02-01 11:53:27","2020-02-01 11:50:58","2","1","1","1","Hari supplier","0","1"),
("16","PRF/017/19-20","2020-02-05","0","","0","2020-02-09 12:13:41","2020-02-05 17:08:24","2","1","0","1","Firewall & Lan connection\n","0","1"),
("17","PRF/018/19-20","2020-02-05","379","","0","2020-02-05 17:11:25","2020-02-05 17:11:25","2","0","0","1","In this PRF Product detail is not Correct Because in My Record Details of product is not Available.","0","1"),
("18","PRF/019/19-20","2020-02-05","469","","0","2020-02-05 17:12:37","2020-02-05 17:12:37","2","0","0","1","fan","0","1"),
("19","PRF/020/19-20","2020-02-05","0","","0","2020-02-12 11:07:50","2020-02-05 17:15:14","2","0","0","1","Fan","0","1"),
("20","PRF/021/19-20","2020-02-05","413","","0","2020-02-05 17:16:35","2020-02-05 17:16:35","2","0","0","1","total 2000 Nos. (1000 vishal Parekh And 1000 Pradip Karmur","0","1"),
("21","PRF/022/19-20","2020-02-05","468","","0","2020-02-05 17:17:12","2020-02-05 17:17:12","2","0","0","1","Installation ","0","1"),
("22","PRF/023/19-20","2020-02-07","0","","0","2020-02-13 16:11:57","2020-02-07 16:23:12","2","1","0","1","Stationary and grossary","0","1"),
("23","PRF/024/19-20","2020-02-10","476","","0","2020-02-10 14:58:32","2020-02-10 14:58:32","2","0","0","1","250 Gm","0","1"),
("24","PRF/025/19-20","2020-02-10","477","","0","2020-02-10 14:59:08","2020-02-10 14:59:08","2","0","0","1","500 gm","0","1"),
("25","PRF/026/19-20","2020-02-10","478","","0","2020-02-10 14:59:59","2020-02-10 14:59:59","2","0","0","1","500gm","0","1"),
("26","PRF/027/19-20","2020-02-10","480","","0","2020-02-10 15:00:22","2020-02-10 15:00:22","2","0","0","1","500gm","0","1"),
("27","PRF/028/19-20","2020-02-10","479","","0","2020-02-10 15:00:50","2020-02-10 15:00:50","2","0","0","1","500gm","0","1"),
("28","PRF/029/19-20","2020-02-13","483","With Unlimited Visit Service","0","2020-02-13 17:02:07","2020-02-13 16:49:14","2","1","1","1","AMC of Environ PC","0","1"),
("29","PRF/030/19-20","2020-02-13","0","","0","2020-02-13 18:36:14","2020-02-13 18:36:14","2","1","0","1","Fire and Security Systems ","0","1"),
("30","PRF/094/19-20","2020-02-17","0","","0","2020-02-17 11:54:01","2020-02-17 11:54:01","0","1","1","1","Firewall and Lan Connection","0","1"),
("31","PRF/095/19-20","2020-02-17","0","","0","2020-02-17 11:56:11","2020-02-17 11:56:11","0","1","1","1","Consulting Work","0","1"),
("32","PRF/096/19-20","2020-02-17","0","","0","2020-02-17 11:57:43","2020-02-17 11:57:43","2","1","0","1","Fan for Aloft Hotel Operator","0","1"),
("33","PRF/097/19-20","2020-02-17","0","","0","2020-02-17 17:59:32","2020-02-17 17:59:32","2","1","1","18","Silicon Computer","0","1"),
("34","PRF/098/19-20","2020-02-17","0","","0","2020-02-18 11:29:42","2020-02-17 18:05:05","2","1","0","18","Visiting Card for Vishal Sir & Pradeep","0","1"),
("35","PRF/099/19-20","2020-02-18","412","","0","2020-02-18 10:55:16","2020-02-18 10:54:52","2","0","0","10","99% pure","0","1"),
("36","PRF/100/19-20","2020-02-18","480","","0","2020-02-18 11:02:29","2020-02-18 10:56:09","2","0","0","10","use for ambient monitoring","0","1"),
("37","PRF/099/19-20","2020-02-18","0","","0","2020-02-18 16:46:13","2020-02-18 16:46:13","2","0","0","1","Fan for Aloft Operator","0","1"),
("38","PRF/100/19-20","2020-02-18","0","","0","2020-02-18 16:48:34","2020-02-18 16:48:34","2","0","0","1","PC annual Maintenance Contract","0","1"),
("39","PRF/096/19-20","2020-02-18","0","","0","2020-02-18 16:53:09","2020-02-18 16:53:09","0","1","1","1","Fan for Aloft Operator","0","1"),
("40","PRF/097/19-20","2020-02-18","0","","0","2020-02-18 16:54:32","2020-02-18 16:54:32","0","1","1","1","PC ANNUAL MAINTENANCE CONTRACt","0","1"),
("41","PRF/098/19-20","2020-02-18","0","","0","2020-02-18 17:05:53","2020-02-18 16:59:34","0","1","1","1","Visiting card for Vishal Parekh and Pradeep","0","1"),
("42","PRF/099/19-20","2020-02-18","0","","0","2020-02-18 17:07:00","2020-02-18 17:07:00","0","1","1","1","Softner for Cleantech","0","1"),
("43","PRF/100/19-20","2020-02-19","0","","0","2020-02-19 11:40:57","2020-02-19 11:40:57","0","1","1","18","Hari Suppliers","0","1"),
("44","PRF/101/19-20","2020-02-19","0","","0","2020-02-19 12:31:26","2020-02-19 12:31:26","0","1","1","18","Iridium Technologies","0","1"),
("45","PRF/102/19-20","2020-02-19","0","","0","2020-02-19 17:44:38","2020-02-19 12:39:07","0","1","1","18","Aagam Laboratory","0","1"),
("46","PRF/103/19-20","2020-02-21","0","","0","2020-02-21 13:10:34","2020-02-21 13:09:34","0","1","1","7","1.electrical panel for evaporator \n2.wiring of panel to  evaporator. ","0","1"),
("47","PRF/104/19-20","2020-02-27","0","","0","2020-02-27 17:28:19","2020-02-27 17:14:18","0","1","0","7","diffuser \nsize- 65x620 mm\nQty-6 ","0","1"),
("48","PRF/105/19-20","2020-03-04","530","electrical heater for evaporator ","0","2020-03-04 14:55:08","2020-03-04 14:55:08","0","0","0","7","electrical heater for evaporator\n6 KW","0","1"),
("49","PRF/106/19-20","2020-03-04","0","","0","2020-03-04 16:42:27","2020-03-04 16:42:10","0","1","0","10","Lab accessories","0","1"),
("50","PRF/107/19-20","2020-03-09","0","","0","2020-03-09 10:10:25","2020-03-09 10:09:27","2","0","0","18","Environ Letterhead","0","1"),
("51","PRF/001/20-21","2020-04-16","0","","0","2020-04-16 16:53:11","2020-04-16 16:53:11","0","1","0","1","We need to Out sources of Pharma project EC in B2 Catagory	envio Fluid Consultant\nenvio Fluid Consultant ( New Consultant)	","0","1"),
("52","PRF/001/20-21","2020-06-10","0","","0","2020-06-10 15:53:07","2020-06-10 15:53:07","2","1","0","1","Environment Clearance (Vasa, Kumar, Rexise)","0","1"),
("53","PRF/001/20-21","2020-06-10","0","","0","2020-06-11 11:17:58","2020-06-10 16:05:07","0","1","1","24","PRF Of Env.fluid (Rexisize)","0","1"),
("54","PRF/002/20-21","2020-06-11","0","","0","2020-06-11 11:36:32","2020-06-11 11:00:00","0","1","1","24","Environ Fluid (Vasa)","0","1"),
("55","PRF/003/20-21","2020-06-11","0","","0","2020-06-11 11:38:27","2020-06-11 11:02:12","0","1","1","24","PRF Of Enviro Fluid (Prachem)","0","1"),
("56","PRF/004/20-21","2020-06-11","0","","0","2020-06-11 11:38:59","2020-06-11 11:03:00","0","1","1","24","PRF Of Enviro Fluid (Kumar)","0","1"),
("57","PRF/005/20-21","2020-06-12","0","","0","2020-06-12 11:46:13","2020-06-12 11:46:13","0","1","0","21","dfssfsd","0","1"),
("58","PRF/006/20-21","2020-06-12","0","","0","2020-06-12 12:33:13","2020-06-12 12:33:13","0","1","1","24","Shri hari suppliers","0","1"),
("59","PRF/007/20-21","2020-06-12","0","","0","2020-06-12 12:52:02","2020-06-12 12:35:51","2","0","0","24","Shri Hari Suppliers","0","1"),
("60","PRF/007/20-21","2020-06-12","0","use as CRM","0","2020-06-12 13:10:29","2020-06-12 12:36:35","0","1","0","20","the solution is required for Lab testing. urgently needed the same.","0","1"),
("61","PRF/009/20-21","2020-06-12","0","","0","2020-06-12 12:39:13","2020-06-12 12:39:13","0","1","0","20","Required for lab testing","0","1"),
("62","PRF/010/20-21","2020-06-12","0","elctrical panel ","0","2020-06-12 13:02:11","2020-06-12 12:50:03","0","1","0","25","electrical panel \n 20 hp electrical load \ncureernt load 10 hp ","0","1"),
("63","PRF/011/20-21","2020-06-12","470","5hp motor for blower ","0","2020-06-12 12:52:20","2020-06-12 12:52:20","0","1","0","25","5 hp motor\nmake - bharat bijali\nrpm -1440","0","1"),
("64","PRF/011/20-21","2020-06-12","0","","0","2020-06-12 12:53:21","2020-06-12 12:53:21","0","1","1","21","10 ml pipette ","0","1"),
("65","PRF/013/20-21","2020-06-12","0","","0","2020-06-12 13:00:38","2020-06-12 12:58:35","0","1","1","21","250 ml bottel","0","1"),
("66","PRF/014/20-21","2020-06-12","0","","0","2020-06-12 13:36:28","2020-06-12 13:36:28","0","1","1","24","HARI SUPPLIERS","0","1"),
("67","PRF/015/20-21","2020-06-15","0","","0","2020-06-15 14:51:25","2020-06-15 14:50:26","0","0","0","1","demo","0","1"),
("68","PRF/017/20-21","2020-06-15","0","","0","2020-06-15 15:08:10","2020-06-15 15:08:10","0","0","0","1","dfsdfsdfsd","0","1"),
("69","PRF/018/20-21","2020-06-15","0","","0","2020-06-15 15:08:40","2020-06-15 15:08:40","0","0","0","1","dasdasd","0","1"),
("70","PRF/019/20-21","2020-06-15","0","","0","2020-06-15 15:22:37","2020-06-15 15:22:37","0","0","0","24","gsd","0","1"),
("71","PRF/020/20-21","2020-06-15","0","","0","2020-06-15 15:22:38","2020-06-15 15:22:38","0","0","0","1","demo dmeo","0","1"),
("72","PRF/021/20-21","2020-06-15","0","","0","2020-06-15 16:48:35","2020-06-15 16:08:11","0","1","1","24","Ok Update","0","1");




CREATE TABLE `tbl_prf_entry_log` (
  `prf_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `prf_entry_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `assign_user_ids` int(11) NOT NULL,
  `approve_remark` longtext NOT NULL,
  `approve_status` int(11) NOT NULL COMMENT '0:Reject, 1:Approve',
  `prf_log_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`prf_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;


INSERT INTO tbl_prf_entry_log VALUES
("1","1","0","3","hubhukhbubh","1","0","2019-12-27 17:20:04","1","1"),
("2","2","0","3","mihir","1","0","2019-12-27 17:29:34","1","1"),
("3","3","0","3","","1","0","2020-01-07 12:33:04","1","1"),
("4","5","0","1","","1","0","2020-01-11 08:05:43","1","1"),
("5","6","0","1","","1","0","2020-01-12 07:36:39","5","1"),
("6","6","0","1","","1","0","2020-01-12 07:37:09","5","1"),
("7","6","0","5","","1","0","2020-01-12 07:39:41","1","1"),
("8","7","0","1","","1","0","2020-01-12 08:00:38","5","1"),
("9","7","0","3","","1","0","2020-01-12 08:02:00","1","1"),
("10","8","0","3","","1","0","2020-01-12 08:26:50","1","1"),
("11","9","0","3","","1","0","2020-01-24 12:05:36","1","1"),
("12","11","0","3","","1","0","2020-01-26 19:38:35","1","1"),
("13","12","0","12","","1","0","2020-01-28 13:50:18","1","1"),
("14","15","0","9","Done","1","0","2020-02-01 11:54:57","1","1"),
("15","14","0","9","Done","1","0","2020-02-01 11:55:27","1","1"),
("16","16","0","3","","1","0","2020-02-09 12:14:14","1","1"),
("17","22","0","0","","1","0","2020-02-09 12:14:40","1","1"),
("18","22","0","3","","1","0","2020-02-10 13:22:41","1","1"),
("19","22","0","3","","1","0","2020-02-11 11:55:30","1","1"),
("20","28","0","18","","1","0","2020-02-13 16:50:02","1","1"),
("21","29","0","18","","1","0","2020-02-13 18:36:56","1","1"),
("22","30","0","18","","1","0","2020-02-17 11:58:29","1","1"),
("23","31","0","12","","1","0","2020-02-18 11:24:10","1","1"),
("24","32","0","7","","1","0","2020-02-18 11:25:57","1","1"),
("25","32","0","11","","1","0","2020-02-18 11:26:06","1","1"),
("26","33","0","18","","1","0","2020-02-18 11:27:47","1","1"),
("27","34","0","7","","1","0","2020-02-18 11:30:14","1","1"),
("28","39","0","11","","1","0","2020-02-18 17:09:59","1","1"),
("29","40","0","18","","1","0","2020-02-18 17:10:16","1","1"),
("30","41","0","18","","1","0","2020-02-18 17:10:32","1","1"),
("31","42","0","7","","1","0","2020-02-18 17:10:55","1","1"),
("32","43","0","18","","1","0","2020-02-19 15:23:04","1","1"),
("33","44","0","18","","1","0","2020-02-19 15:23:19","1","1"),
("34","45","0","18","","1","0","2020-02-19 15:23:34","1","1"),
("35","46","0","3","","1","0","2020-02-22 08:43:17","1","1"),
("36","47","0","3","","1","0","2020-02-27 17:45:57","1","1"),
("37","50","0","1","","1","0","2020-03-09 10:11:00","18","1"),
("38","49","0","3","","1","0","2020-03-12 12:07:12","1","1"),
("39","51","0","3","","1","0","2020-04-16 16:53:42","1","1"),
("40","52","0","24","","1","0","2020-06-10 15:53:38","1","1"),
("41","53","0","19","","1","0","2020-06-10 16:42:10","1","1"),
("42","54","0","24","","1","0","2020-06-11 11:18:25","1","1"),
("43","55","0","24","","1","0","2020-06-11 11:18:38","1","1"),
("44","56","0","24","","1","0","2020-06-11 11:18:49","1","1"),
("45","54","0","1","","1","0","2020-06-11 11:28:04","24","1"),
("46","57","0","19","fsdfsdfsd","1","0","2020-06-12 11:46:42","1","1"),
("47","58","0","19","","1","0","2020-06-12 12:44:41","1","1"),
("48","59","0","1","","1","0","2020-06-12 12:49:07","24","1"),
("49","59","0","19","","1","0","2020-06-12 12:49:19","24","1"),
("50","59","0","19","","0","0","2020-06-12 12:50:29","1","1"),
("51","64","0","21","done","1","0","2020-06-12 12:54:25","1","1"),
("52","63","0","25","done","1","0","2020-06-12 12:56:05","1","1"),
("53","62","0","25","need more specification","0","0","2020-06-12 12:56:47","1","1"),
("54","61","0","20","","1","0","2020-06-12 12:57:02","1","1"),
("55","60","0","20","Need Specification","0","0","2020-06-12 12:57:22","1","1"),
("56","65","0","21","Need more detailing","0","0","2020-06-12 12:59:39","1","1"),
("57","65","0","20","go ahead","1","0","2020-06-12 13:01:43","1","1"),
("58","62","0","25","done","1","0","2020-06-12 13:05:09","1","1"),
("59","60","0","1","","1","0","2020-06-12 13:09:25","20","1"),
("60","60","0","20","done","1","0","2020-06-12 13:13:31","1","1"),
("61","66","0","24","","1","0","2020-06-12 13:37:01","1","1"),
("62","72","0","24","not good","0","0","2020-06-15 16:19:59","1","1"),
("63","72","0","19","goo","1","0","2020-06-15 16:23:44","24","1"),
("64","72","0","24","dssdsds","2","0","2020-06-15 16:32:46","1","1"),
("65","72","0","24","not More than 10","2","0","2020-06-15 16:47:08","1","1"),
("66","72","0","24","","1","0","2020-06-15 16:48:50","1","1");




CREATE TABLE `tbl_prf_ven_rmrk` (
  `ven_rmrk_id` int(11) NOT NULL AUTO_INCREMENT,
  `prf_entry_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `prf_qty` double(10,3) NOT NULL,
  `product_des` mediumtext NOT NULL,
  `new_ven_name` varchar(400) NOT NULL,
  `new_ven_rmrk` longtext NOT NULL,
  `ven_rmrk_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`ven_rmrk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` tinytext NOT NULL,
  `item_code` varchar(250) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_group` int(11) NOT NULL,
  `product_brand` int(11) NOT NULL,
  `product_type` int(11) NOT NULL COMMENT '1:Finish, 2:Semi, 3:Raw, 4:Assembly, 5:Bot, 6:Assets',
  `product_hsn` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_part` int(11) NOT NULL,
  `p_photo` longtext NOT NULL,
  `product_mst_rate` double(10,2) NOT NULL,
  `product_purchase_mst_rate` double(10,2) NOT NULL,
  `product_mst_unitid` int(11) NOT NULL,
  `opening_stock` double(10,2) NOT NULL,
  `minimum_stock` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product VALUES
("1","BILLING360","101","2","30","10","1","","","0","97746.","14500.00","0.00","6","0.00","0.00","2020-06-19 15:41:14","0","1","0","1","0"),
("2","CRM","102","2","21","11","1","","","0","66619.","50000.00","0.00","0","0.00","0.00","2020-06-19 15:43:02","0","1","0","1","0"),
("3","INDIAN BILLING SOFTWARE ( IBS)","","6","32","12","1","99","","0","84496.","12000.00","1200.00","6","0.00","0.00","2020-06-26 14:45:47","0","1","0","1","0"),
("4","IBS","","6","30","12","1","","","0","11932.","3500.00","0.00","6","0.00","0.00","2020-06-26 14:43:45","2","1","0","1","0"),
("5","BDS ENGINEERING ERP","","6","31","13","1","","","0","13884.","0.00","0.00","0","0.00","0.00","2020-07-02 01:15:56","0","1","0","1","0");




CREATE TABLE `tbl_product_brand` (
  `pb_id` int(10) NOT NULL AUTO_INCREMENT,
  `pb_name` varchar(255) NOT NULL,
  `pb_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_brand VALUES
("1","ASDSAD","2","2019-09-09 15:13:07","1","1"),
("2","DSF","2","2019-09-09 15:09:16","1","1"),
("3","JIO","2","2019-09-09 15:09:25","1","1"),
("4","ENVIRON","2","2019-09-09 15:13:42","1","1"),
("5","LUBI","2","2019-11-18 15:15:29","1","1"),
("6","COOL DECK","2","2019-11-18 15:15:36","1","1"),
("7","PENTIRE ","2","2019-11-18 15:15:50","1","1"),
("8","USHA ","2","2019-11-18 15:15:59","1","1"),
("9","WORDPRESS","2","2020-01-01 15:58:03","1","1"),
("10","BILLING360","0","2020-06-24 12:38:10","1","1"),
("11","CRM","0","2020-06-19 15:42:11","1","1"),
("12","INDIAN BILLING SOFTWARE ( IBS )","0","2020-06-24 12:37:59","1","1"),
("13","BDS ERP","0","2020-06-24 12:38:15","1","1");




CREATE TABLE `tbl_product_grp` (
  `pg_id` int(10) NOT NULL AUTO_INCREMENT,
  `pg_name` varchar(255) NOT NULL,
  `pg_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_grp VALUES
("1","DEMO1","2","2019-09-09 14:52:21","1","1"),
("2","VENDOR","2","2019-09-09 14:53:11","1","1"),
("3","NON-NABL REPORTING","2","2019-11-19 20:55:49","1","1"),
("4","NABL REPORTING","2","2019-11-19 20:56:16","1","1"),
("5","ASDSAD","2","2019-09-09 14:54:19","1","1"),
("6","HGHJG","2","2019-09-09 14:55:11","1","1"),
("7","ASDSADASDSAD","2","2019-09-09 14:56:15","1","1"),
("8","ENVIRONMENTAL AUDIT","2","2019-11-19 20:55:24","1","1"),
("9","ANNUAL MAINTENANCE CONTRACT","2","2019-11-19 20:53:55","1","1"),
("10","SADSAD","2","2019-09-09 15:04:32","1","1"),
("11","NOC/CCA","2","2019-11-19 20:53:33","1","1"),
("12","ANNUAL MAINTENANCE CONTRACT ( STP)","2","2019-11-18 17:50:05","1","1"),
("13","ANNUAL MAINTENANCE CONTRACT ( GPCB)","2","2019-11-18 17:50:18","1","1"),
("14","ENVIRONMENTAL CLEARANCE ","2","2019-11-19 20:53:11","1","1"),
("15","PROJECT CONSULTING ","2","2019-11-19 20:54:30","1","1"),
("16","EFFLUENT TREATMENT PLANT ","2","2019-11-19 20:57:15","1","1"),
("17","SEWAGE TREATMENT PLANT ","2","2019-11-19 20:57:40","1","1"),
("18","AIR POLLUTION CONTROL EQUIPMENT","2","2019-11-19 20:58:03","1","1"),
("19","GLASSWARE","2","2019-12-05 06:30:35","1","1"),
("20","REAGENT","2","2019-12-05 06:45:55","1","1"),
("21","CRM","0","2019-12-05 06:46:05","1","1"),
("22","STATIONARY ITEM","2","2019-12-28 10:23:53","1","1"),
("23"," LOCATION: ENV/OFFICE/ PROJECT","2","2020-01-15 14:16:34","1","1"),
("24"," LOCATION: ENV/OFFICE/LAB","2","2020-01-15 14:15:28","1","1"),
("25","ASSET (LABORATORY)","2","2020-01-27 11:50:07","1","1"),
("26","ASSET (OFFICE)","2","2020-02-13 18:05:38","1","1"),
("27","CONSULTING","2","2020-03-02 16:47:29","1","1"),
("28","CLEANING ITEM","2","2020-06-10 12:35:58","1","1"),
("29","GROCERY ITEM","2","2020-06-10 12:36:47","1","1"),
("30","BILLING","0","2020-06-19 15:26:47","1","1"),
("31","ERP","0","2020-06-24 12:38:26","1","1"),
("32","IBS","0","2020-06-26 14:44:15","1","1");




CREATE TABLE `tbl_product_model` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_product_id` int(11) NOT NULL,
  `pm_model_no` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_model VALUES
("17","3","P001","2019-09-09 19:08:56","1","1"),
("18","3","P002","2019-09-09 19:09:00","1","1"),
("19","4","123213","2019-09-09 19:10:28","1","1"),
("20","4","2222","2019-09-09 19:10:30","1","1"),
("21","5","p0001","2019-09-10 16:47:04","1","1"),
("22","5","p0002","2019-09-10 16:47:04","1","1");




CREATE TABLE `tbl_product_serial` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `ps_product_id` int(11) NOT NULL,
  `ps_serial_no` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_serial VALUES
("1","450","ENV/M/DC/01","2020-01-28 15:26:30","1","1"),
("2","449","ENV/M/PSI/01","2020-01-28 15:28:22","1","1"),
("3","448","ENV/M/TTR/01","2020-01-28 15:29:11","1","1"),
("4","447","ENV/M/SLM/01","2020-01-28 15:30:25","1","1"),
("6","441","ENV/TLB/01","2020-01-28 15:40:10","1","1"),
("7","440","ENV/SLM/01","2020-01-28 16:02:25","1","1"),
("8","440","ENV/SLM/24","2020-01-28 16:02:33","1","1"),
("9","439","ENV/WB/01","2020-01-28 16:03:54","1","1"),
("10","437","ENV/NOx/01","2020-01-28 16:05:03","1","1"),
("11","437","ENV/NOx/02","2020-01-28 16:05:18","1","1"),
("12","437","ENV/NOx/03","2020-01-28 16:05:37","1","1"),
("13","433","ENV/VCDS/01","2020-01-28 16:11:07","1","1"),
("14","433","ENV/VCDS/02","2020-01-28 16:11:16","1","1"),
("15","431","ENV/LUX/25","2020-01-28 16:12:16","1","1"),
("16","429","ENV/THM/01","2020-01-28 16:13:55","1","1"),
("17","427","ENV/C/01","2020-01-28 16:15:29","1","1"),
("18","426","ENV/SS/01","2020-01-28 16:16:00","1","1"),
("19","425","ENV/HM/01","2020-01-28 16:16:48","1","1"),
("20","424","ENV/MF/05","2020-01-28 16:17:22","1","1"),
("21","423","ENV/BOD/01","2020-01-28 16:18:02","1","1"),
("22","422","ENV/COD/02","2020-01-28 16:19:19","1","1"),
("23","421","ENV/HAO/07","2020-01-28 16:20:10","1","1"),
("24","420","ENV/WBS/10","2020-01-28 16:37:23","1","1"),
("25","419","ENV/WB3/09","2020-01-28 16:39:08","1","1"),
("26","418","ENV/SP/01","2020-01-28 16:39:48","1","1"),
("27","416","ENV/TM/01","2020-01-28 16:40:52","1","1"),
("28","415","ENV/CM/01","2020-01-28 16:41:24","1","1"),
("29","414","ENV/pH/01","2020-01-28 16:41:49","1","1");




CREATE TABLE `tbl_product_specs` (
  `pspec_id` int(11) NOT NULL AUTO_INCREMENT,
  `pspec_product_id` int(11) NOT NULL,
  `p_priority` varchar(100) NOT NULL,
  `p_header` varchar(100) NOT NULL,
  `p_spec` varchar(100) NOT NULL,
  `p_value` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`pspec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_specs VALUES
("1","6","Flow rate ","FLow Rate","0.75 M3/Hr","17800","2019-11-18 18:27:19","1","1");




CREATE TABLE `tbl_product_type` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(100) NOT NULL,
  `pt_status` int(11) NOT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_type VALUES
("1","Finish Product","0"),
("2","Stationary","0"),
("3","Raw Material","0"),
("4","Reagent","0"),
("5","Glassware","0"),
("6","Consulting","0"),
("7","Asset (Laboratory)","0"),
("8","Asset (Environ)","0");




CREATE TABLE `tbl_product_ven_hist` (
  `ven_hist_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `ven_rate` double(10,2) NOT NULL,
  `ven_rmrk` mediumtext NOT NULL,
  `ven_hist_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`ven_hist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `purchaseorder_id` int(11) NOT NULL,
  `purchase_no` varchar(400) NOT NULL,
  `purchase_date` date NOT NULL,
  `ref_no` varchar(400) NOT NULL,
  `ref_date` date NOT NULL,
  `round_off` double(10,3) NOT NULL,
  `g_total` bigint(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `paid_amount` bigint(20) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `packing` bigint(20) NOT NULL,
  `discount` bigint(20) NOT NULL,
  `charges_formulaid` int(11) NOT NULL,
  `taxname1` varchar(400) NOT NULL,
  `taxname2` varchar(400) NOT NULL,
  `taxname3` varchar(400) NOT NULL,
  `taxvalue1` double(10,2) NOT NULL,
  `taxvalue2` double(10,2) NOT NULL,
  `taxvalue3` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `remark` text NOT NULL,
  `po_pdf` mediumtext NOT NULL,
  `print_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_purchase_trn` (
  `purchase_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `product_hsn_code` varchar(200) NOT NULL,
  `product_des` text NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_disc` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(200) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(200) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(200) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_purchaseorder` (
  `purchaseorder_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `po_ven_address` mediumtext NOT NULL,
  `prf_entry_id` int(11) NOT NULL,
  `purchaseorder_no` varchar(400) NOT NULL,
  `purchaseorder_date` date NOT NULL,
  `po_so_no` varchar(400) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `po_ref_no` varchar(400) NOT NULL,
  `po_ref_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `mode_of_dispatch` varchar(400) NOT NULL,
  `payment_terms` varchar(400) NOT NULL,
  `round_off` double(10,3) NOT NULL,
  `g_total` bigint(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `paid_amount` bigint(20) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `packing` bigint(20) NOT NULL,
  `misc_charges` double NOT NULL,
  `discount` bigint(20) NOT NULL,
  `charges_formulaid` int(11) NOT NULL,
  `taxname1` varchar(400) NOT NULL,
  `taxname2` varchar(400) NOT NULL,
  `taxname3` varchar(400) NOT NULL,
  `taxvalue1` double(10,2) NOT NULL,
  `taxvalue2` double(10,2) NOT NULL,
  `taxvalue3` double(10,2) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL COMMENT '0-show,1-not show',
  `delivery_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `purchase_status` int(11) NOT NULL,
  `used_purchase_id` int(11) NOT NULL,
  `img_disp_flag` int(11) NOT NULL COMMENT '0:No, 1:YES',
  `userid` int(11) NOT NULL,
  `remark` text NOT NULL,
  `po_terms_cond` longtext NOT NULL,
  `po_pdf` mediumtext NOT NULL,
  `po_attach` varchar(400) NOT NULL,
  `print_status` int(11) NOT NULL,
  `approval_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `po_inspect_status` int(11) NOT NULL,
  `used_grn_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`purchaseorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_purchaseorder_log` (
  `purchaseorder_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `assign_user_ids` int(11) NOT NULL,
  `approve_remark` longtext NOT NULL,
  `approve_status` int(11) NOT NULL COMMENT '0:Reject, 1:Approve',
  `purchaseorder_log_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`purchaseorder_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_purchaseordertrn` (
  `purchaseordertrn_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `purchaseorder_id` int(11) NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `product_des` text NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_disc` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(200) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(200) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(200) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `bom_trn_id` int(11) NOT NULL,
  `inspect_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchaseordertrn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`purchaseordertrn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO tbl_question VALUES
("1","What is Your child hood nick name?","0"),
("2","What is Your Favorite book name? ","0"),
("3","What is your first mobile no?","0"),
("4","Who is your first child hood friend?","0"),
("5","which city/village you born?","0"),
("6","what would you like to ask to world?","0");




CREATE TABLE `tbl_quot_budget_trn` (
  `quot_budget_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `quot_trn_id` int(11) NOT NULL,
  `req_product_id` int(11) NOT NULL,
  `req_product_desc` longtext NOT NULL,
  `req_product_qty` double(10,2) NOT NULL,
  `req_product_rate` double(10,2) NOT NULL,
  `req_unitid` int(11) NOT NULL,
  `req_product_amount` double(10,2) NOT NULL,
  `quot_budget_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`quot_budget_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_quot_dfd_attach` (
  `dfd_attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `dfd_attch_doc_name` varchar(400) NOT NULL,
  `dfd_attch_file` varchar(400) NOT NULL,
  `dfd_attach_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`dfd_attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_quotation` (
  `quotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_no` varchar(400) NOT NULL,
  `quotation_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `c_con_id` int(11) NOT NULL,
  `inquiry_id` int(11) NOT NULL,
  `quot_subject` varchar(400) NOT NULL,
  `quot_type` int(11) NOT NULL COMMENT '0:Domestic, 1:Export',
  `quotation_valid_date` date NOT NULL,
  `quotation_ref` varchar(400) NOT NULL,
  `g_total` double(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `quot_remark` longtext NOT NULL,
  `an_id` int(11) NOT NULL,
  `quot_annex_content` longtext NOT NULL,
  `quot_address` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quotation_status` int(11) NOT NULL,
  `revise_status` int(11) NOT NULL COMMENT '1:YES,0:No',
  `start_quotation_id` int(11) NOT NULL,
  `prev_quotation_id` int(11) NOT NULL,
  `approve_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`quotation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO tbl_quotation VALUES
("1","QUO/002/19-20","2020-07-06","307","180","200","Billing Software@TESTING 1","0","2020-07-06","","14000.00","68","","0","","","2020-07-06 14:21:30","2020-07-06 14:21:30","2020-07-06 14:21:30","0","0","1","0","1","27","1"),
("2","QUO/003/19-20","2020-07-06","436","308","327","@HR TESTING","0","2020-07-06","","15000.00","68","","0","","","2020-07-06 16:15:45","2020-07-06 16:15:45","2020-07-06 16:15:45","0","0","2","0","1","27","1"),
("3","QUO/004/19-20","2020-07-07","15","15","3","crm @KRISH ENGINEERING ","0","2020-07-29","","76700.00","68","qot mail kariyu che follopup levanu che","0","","","2020-07-07 13:14:08","2020-07-07 13:14:08","2020-07-07 13:14:08","0","0","3","0","0","28","1"),
("4","QUO/005/19-20","2020-07-12","359","230","261","billing@Ahmedabad packaging ind","0","2020-07-12","","1770.00","68","","0","","","2020-07-13 17:21:03","2020-07-13 17:21:03","2020-07-13 17:21:03","0","0","4","0","0","28","1");




CREATE TABLE `tbl_quotation_terms_trn` (
  `quotation_terms_trn_id` int(10) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `tc_id` int(11) NOT NULL,
  `tc_priority` int(11) NOT NULL,
  `tc_details` longtext CHARACTER SET utf8 NOT NULL,
  `quotation_terms_trn_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`quotation_terms_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_quotation_trn` (
  `quot_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_spec` longtext NOT NULL,
  `level_id` int(11) NOT NULL,
  `product_qty` double NOT NULL,
  `unitid` int(11) NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `act_amt_flag` int(11) NOT NULL COMMENT '1:YES,0:No',
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(400) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(400) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(400) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `budget_trn_ttl` double(10,2) NOT NULL,
  `budget_margin_per` double(10,2) NOT NULL,
  `budget_margin_amt` double(10,2) NOT NULL,
  `budget_trn_g_total` double(10,2) NOT NULL,
  `quot_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`quot_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO tbl_quotation_trn VALUES
("1","0","2","","","0","1","0","35000.00","0.00","0.00","35000.00","0","0","","0.00","","0.00","","0.00","35000.00","0.00","0.00","0.00","0.00","3","1","1"),
("3","1","1","","","0","1","0","14000.00","0.00","0.00","14000.00","0","0","","0.00","","0.00","","0.00","14000.00","0.00","0.00","0.00","0.00","0","27","1"),
("4","2","1","","","0","1","0","15000.00","0.00","0.00","15000.00","0","0","","0.00","","0.00","","0.00","15000.00","0.00","0.00","0.00","0.00","0","27","1"),
("5","0","2","crm + billing","","0","1","6","60000.00","0.00","0.00","60000.00","0","0","","0.00","","0.00","","0.00","60000.00","0.00","0.00","0.00","0.00","2","28","1"),
("6","3","2","","","0","1","6","48000.00","0.00","0.00","48000.00","0","1","CGST 9%","4320.00","SGST 9%","4320.00","","0.00","56640.00","0.00","0.00","0.00","0.00","0","28","1"),
("7","3","1","","","0","1","6","17000.00","0.00","0.00","17000.00","0","1","CGST 9%","1530.00","SGST 9%","1530.00","","0.00","20060.00","0.00","0.00","0.00","0.00","0","28","1"),
("8","4","1","","","0","1","6","1500.00","0.00","0.00","1500.00","0","1","CGST 9%","135.00","SGST 9%","135.00","","0.00","1770.00","0.00","0.00","0.00","0.00","0","28","1");




CREATE TABLE `tbl_refer_by` (
  `rb_id` int(11) NOT NULL AUTO_INCREMENT,
  `rb_name` varchar(100) NOT NULL,
  `rb_status` int(11) NOT NULL,
  PRIMARY KEY (`rb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;


INSERT INTO tbl_refer_by VALUES
("1","BNI","0"),
("2","COLD CALL","0"),
("3","CUSTOMER REF.","0"),
("4","Don\'t Know","0"),
("5","Exhibition","2"),
("6","Indiamart","0"),
("7","OLD FB LEADS","0"),
("8","GOOGLE DATA SEARCH","0"),
("9","RAHUL BHAI-UMABOY","0"),
("10","UMABOY REF.","0"),
("11","METR REF.","0"),
("12","SOFTWARE SUGGEST","0"),
("13","WHATSAPP MARKETING","0"),
("14","EMAIL MARKETING","0"),
("15","FACEBOOK ADS","0");




CREATE TABLE `tbl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_module` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `deletable` int(11) NOT NULL COMMENT '0:YES,1:No',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


INSERT INTO tbl_role VALUES
("8","SERVICE MANAGER","4,1","0","0","2019-09-06 10:43:33","0","0"),
("9","PURCHASE ","4,1","0","0","2019-09-06 10:44:31","0","0");




CREATE TABLE `tbl_sales_order` (
  `sales_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_order_no` varchar(400) NOT NULL,
  `sales_order_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `so_ref_no` varchar(400) NOT NULL,
  `so_ref_date` date NOT NULL,
  `so_remark` longtext NOT NULL,
  `g_total` bigint(20) NOT NULL,
  `so_attach` varchar(400) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sales_order_status` int(11) NOT NULL,
  `so_approve_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `bom_done_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `plan_done_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `invoice_done_status` int(11) NOT NULL COMMENT '0:Pending, 1:Done',
  `used_invoice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_sales_order_log` (
  `sales_order_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `assign_user_ids` int(11) NOT NULL,
  `approve_remark` longtext NOT NULL,
  `approve_status` int(11) NOT NULL COMMENT '0:Reject, 1:Approve',
  `sales_order_log_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_order_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO tbl_sales_order_log VALUES
("1","0","1","1","","1","0","2020-07-06 14:21:48","27","1"),
("2","0","1","27","","1","0","2020-07-06 14:23:17","1","1"),
("3","0","2","27","appved","1","0","2020-07-06 16:16:41","1","1");




CREATE TABLE `tbl_sales_order_trn` (
  `so_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_qty` double(10,2) NOT NULL,
  `unitid` int(11) NOT NULL,
  `product_rate` double(10,2) NOT NULL,
  `product_discount` double(10,2) NOT NULL,
  `discount_per` double(10,2) NOT NULL,
  `product_amount` double(10,2) NOT NULL,
  `formulaid` int(11) NOT NULL,
  `tax_name1` varchar(400) NOT NULL,
  `tax_amount1` double(10,2) NOT NULL,
  `tax_name2` varchar(400) NOT NULL,
  `tax_amount2` double(10,2) NOT NULL,
  `tax_name3` varchar(400) NOT NULL,
  `tax_amount3` double(10,2) NOT NULL,
  `product_total` double(10,2) NOT NULL,
  `quot_trn_id` int(11) NOT NULL,
  `so_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`so_trn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_serialtrn` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_no` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoicetrn_id` int(11) NOT NULL,
  `use_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `bank_detail` text NOT NULL,
  `cstno` varchar(20) NOT NULL,
  `cst_date` date NOT NULL,
  `vatno` varchar(20) NOT NULL,
  `vat_date` date NOT NULL,
  `pan_no` varchar(20) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `f_logo` varchar(50) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ac_no` varchar(200) NOT NULL,
  `ifcs` varchar(200) NOT NULL,
  `branch_name` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


INSERT INTO tbl_setting VALUES
("1","NIDHI PACKAGING","<P><SPAN STYLE=\"\">11, BHAGIRATH IND ESTATE,</SPAN></P><P><SPAN STYLE=\"\">PART-3, OPP AMRAIWADI A.E.C</SPAN></P><P><SPAN STYLE=\"\">JAWAHARNAGAR ROAD AMRAIWADI</SPAN></P><P><SPAN STYLE=\"\">AHMEDABAD, 380 026</SPAN></P><P><SPAN STYLE=\"\">EMAIL: NIDHIPACKAGING49@YMAIL.COM</SPAN></P>","","24572304926","1970-01-01","24072304926","1970-01-01","","header3738.jpg","footer2323.jpg","BOI","1236548966552","BOI2017","ANADNAGAR","0","2017-02-21 17:20:40","0");




CREATE TABLE `tbl_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type_id` int(11) NOT NULL,
  `task_rel_id` int(11) NOT NULL,
  `task_name` varchar(400) NOT NULL,
  `c_con_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `inquiry_id` int(11) NOT NULL,
  `task_location` varchar(400) NOT NULL,
  `full_day_event` int(11) NOT NULL COMMENT '1:YES,0:No',
  `appointment_start_time` datetime NOT NULL,
  `appointment_end_time` datetime NOT NULL,
  `appointment_subject` varchar(400) NOT NULL,
  `task_remark` longtext NOT NULL,
  `assign_user_ids` varchar(400) NOT NULL,
  `task_priority_id` int(11) NOT NULL,
  `task_due_date` datetime NOT NULL,
  `task_alert_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `alert_date_time` datetime NOT NULL,
  `task_completion_date` datetime NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_status` int(11) NOT NULL,
  `entry_type` int(11) NOT NULL COMMENT '1:Task, 2:Appointment',
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;


INSERT INTO tbl_task VALUES
("1","16","5","","0","0","1","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","29","1","2020-06-24 12:50:00","4","2020-06-24 12:51:07","2020-06-24 12:35:00","2020-07-06 17:33:57","2020-07-06 17:33:57","1","1","1","1"),
("2","0","1","Clietn Meeting","0","0","0","Rakhial","0","2020-06-24 12:51:00","2020-06-24 12:51:00","CRM Software Demostration Meeting","","29","0","0000-00-00 00:00:00","1","2020-06-24 12:52:03","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-06-24 12:52:03","0","2","1","1"),
("3","13","5","","0","0","2","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","rwerwertrwevrwrvrre","29","1","2020-06-26 10:40:00","2","2020-06-26 10:41:52","2020-06-26 10:40:00","2020-06-26 10:43:06","2020-06-26 10:43:06","1","1","1","1"),
("4","13","5","","0","0","2","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Sir tamne call karvanu kidhu che","27","1","2020-06-26 10:43:00","2","2020-06-26 10:44:35","2020-06-26 10:43:00","2020-06-26 10:45:39","2020-06-26 10:45:39","1","1","29","1"),
("5","18","5","","0","0","2","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","tu call kr","29","1","2020-06-26 10:45:00","2","2020-06-26 10:47:08","2020-06-26 10:45:00","2020-07-06 17:34:00","2020-07-06 17:34:00","1","1","27","1"),
("6","16","4","","0","94","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Need to provide them demo with BOM","31","1","2020-07-06 09:30:00","2","2020-07-02 01:20:22","2020-07-06 09:30:00","2020-07-13 18:49:59","2020-07-13 18:49:59","1","1","27","1"),
("7","18","4","","0","308","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","party close kari ne out off country jay che\n","28","3","2020-07-06 11:52:00","1","2020-07-06 11:53:32","1970-01-01 05:30:00","2020-07-06 12:28:29","2020-07-07 10:35:52","1","1","28","1"),
("8","18","4","","0","34","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","demo link whatsapp kariyapi che demo joai ne kehse ","28","2","2020-07-09 11:55:00","8","2020-07-06 11:58:28","2020-07-02 11:55:00","2020-07-06 17:27:57","2020-07-06 11:58:28","1","1","28","1"),
("9","18","4","","0","34","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","demo link whatspp kari che joai ne call back karse","28","2","2020-07-06 11:59:00","8","2020-07-06 12:00:39","2020-06-29 11:59:00","0000-00-00 00:00:00","2020-07-07 10:36:10","0","1","28","1"),
("10","18","5","","0","0","200","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","testing data will decide in 2 working days","27","1","2020-07-07 11:55:00","1","2020-07-06 12:00:41","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 18:49:56","2","1","27","1"),
("11","13","5","","0","0","200","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","introduction email sent","27","1","2020-07-06 12:00:00","1","2020-07-06 12:04:17","0000-00-00 00:00:00","2020-07-06 15:59:27","2020-07-06 15:59:27","1","1","27","1"),
("12","15","5","","0","0","202","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Standard quote send","27","1","2020-07-06 12:04:00","1","2020-07-06 12:06:12","0000-00-00 00:00:00","2020-07-06 15:59:29","2020-07-06 15:59:29","1","1","27","1"),
("13","18","4","","0","85","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","OFFICE PAR REHTA NATHI ATLE ONLINE DEMO AAPVANO CHE CALL BACK KARSE","28","2","2020-07-06 12:12:00","7","2020-07-06 12:13:39","2020-07-05 12:12:00","0000-00-00 00:00:00","2020-07-06 12:28:07","0","1","28","1"),
("14","18","4","","0","31","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","15 DATE PACHI KIDHU CHE ","28","2","2020-07-06 12:23:00","8","2020-07-06 12:24:32","2020-06-29 12:23:00","2020-07-06 17:21:53","2020-07-06 12:24:32","1","1","28","1"),
("15","18","4","","0","28","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","NEXT MONTH MA ","28","2","2020-08-03 12:30:00","1","2020-07-06 12:32:50","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-06 12:33:26","0","1","28","1"),
("16","18","1","","0","0","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-06 12:36:00","1","2020-07-06 12:36:30","1970-01-01 05:30:00","2020-07-07 10:30:11","2020-07-07 10:30:11","1","1","28","1"),
("17","18","4","","0","29","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","CHATRAL COMPNY MA BUSY CHE FINAL INSTALL KARVANU CHE FRIDAY A KIDHU CHE RAKHAIL AAVSE ","28","1","2020-07-09 11:00:00","1","2020-07-06 12:38:59","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 12:38:59","0","1","28","1"),
("18","0","5","","0","0","202","satellite, ahmedabad","0","2020-07-06 12:53:00","2020-07-06 12:53:00","CRM Software Demonstration Meeting","Demo scheudle","","0","0000-00-00 00:00:00","1","2020-07-06 12:54:04","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 12:54:04","0","2","27","1"),
("19","18","5","","0","0","243","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","called to customer for meeting","","1","2020-07-06 13:01:00","1","2020-07-06 13:02:30","0000-00-00 00:00:00","2020-07-06 15:59:25","2020-07-06 15:59:25","1","1","27","1"),
("20","17","5","","0","0","202","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Met  client now i need to submit quote","","1","2020-07-06 13:05:00","1","2020-07-06 13:06:08","0000-00-00 00:00:00","2020-07-06 15:59:23","2020-07-06 15:59:23","1","1","27","1"),
("21","17","5","","0","0","72","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","met client for demostration ","","1","2020-07-06 13:08:00","1","2020-07-06 13:11:56","0000-00-00 00:00:00","2020-07-06 15:59:22","2020-07-06 15:59:22","1","1","27","1"),
("22","18","4","AHM","0","359","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","online demo batayo che 15k nd 22k prise aapi che p&l balance sheet na ","28","1","2020-07-06 13:26:00","1","2020-07-06 13:52:59","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-06 13:53:47","0","1","28","1"),
("23","17","5","","0","0","243","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","meeting for demo","","1","2020-07-06 14:11:00","1","2020-07-06 14:11:32","0000-00-00 00:00:00","2020-07-06 15:59:22","2020-07-06 15:59:22","1","1","27","1"),
("24","0","5","","0","0","243","Ahmedabad","0","2020-07-06 14:19:00","2020-07-06 14:19:00","meeting for Product Demostartion","","","0","0000-00-00 00:00:00","1","2020-07-06 14:19:34","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 14:19:34","0","2","27","1"),
("25","16","5","","0","0","243","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Need to submit quote","","1","2020-07-06 14:20:00","1","2020-07-06 14:20:48","0000-00-00 00:00:00","2020-07-06 15:59:21","2020-07-06 15:59:21","1","1","27","1"),
("26","18","4","","0","373","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","JULY END MA CALL BACK KARI FINAL KARVANO","28","2","2020-07-06 14:21:00","1","2020-07-06 14:22:49","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 14:22:49","0","1","28","1"),
("27","19","5","","0","0","243","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","client will revert back in 2 days.","","1","2020-07-06 14:26:00","1","2020-07-06 14:26:47","0000-00-00 00:00:00","2020-07-06 15:59:20","2020-07-06 15:59:20","1","1","27","1"),
("28","18","5","","0","0","243","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","client want to meet us for finalising the deal","","1","2020-07-06 14:27:00","1","2020-07-06 14:27:41","0000-00-00 00:00:00","2020-07-06 15:59:18","2020-07-06 15:59:18","1","1","27","1"),
("29","0","5","","0","0","243","ahmedabad","0","2020-07-06 14:28:00","2020-07-06 14:28:00","meeting for negotation ","finalise detal","","0","0000-00-00 00:00:00","1","2020-07-06 14:28:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 14:28:48","0","2","27","1"),
("30","18","4","","0","30","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","15 JULY PACHI  JEMNE OPRATE KARVANU CHE 10 DIVAS PACHI AAVANA CHE","28","2","2020-07-06 14:28:00","1","2020-07-06 14:29:49","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-07 10:35:27","0","1","28","1"),
("31","18","5","","0","0","327","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Called him for billing software. need to call back in evening","","1","2020-07-06 16:09:00","2","2020-07-06 16:09:49","2020-07-06 16:09:00","2020-07-06 16:11:24","2020-07-06 16:11:24","1","1","27","1"),
("32","0","5","","0","0","327","satelite","0","2020-07-06 16:13:00","2020-07-06 16:13:00","meting for online demo","online demostration of billing","","0","0000-00-00 00:00:00","2","2020-07-06 16:13:22","2020-07-06 16:13:00","0000-00-00 00:00:00","2020-07-06 16:13:22","0","2","27","1"),
("33","15","5","","0","0","327","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","pls submit quote","","1","2020-07-06 16:14:00","2","2020-07-06 16:14:48","2020-07-06 16:14:00","2020-07-06 16:17:30","2020-07-06 16:17:30","1","1","27","1"),
("34","19","5","","0","0","327","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-06 16:18:00","1","2020-07-06 16:18:26","0000-00-00 00:00:00","2020-07-06 16:18:48","2020-07-06 16:18:48","1","1","27","1"),
("35","16","5","","0","0","328","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Right now he has not started a company so call on month-end.","29","1","2020-07-30 10:00:00","2","2020-07-06 16:52:14","2020-07-30 10:00:00","0000-00-00 00:00:00","2020-07-06 16:52:14","0","1","29","1"),
("36","18","5","","0","0","18","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","party aeni biji compny ma che chatral vadi 2 daivas pachi rakhail aavani tyare final karvanu che","28","1","2020-07-09 10:55:00","1","2020-07-06 16:57:21","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 16:57:21","0","1","28","1"),
("37","16","5","","0","0","329","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Call  not received but emne crm software ni requirement hati but lockdown na lidhe e confirm na kari sakya . emne call karva no che","29","1","2020-07-07 10:00:00","2","2020-07-06 16:57:59","2020-07-07 10:00:00","2020-07-07 15:03:07","2020-07-07 15:03:07","1","1","29","1"),
("38","18","5","","0","0","265","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","july end ma final karvanu che","28","1","2020-07-27 10:50:00","1","2020-07-06 16:59:06","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 16:59:06","0","1","28","1"),
("39","16","5","","0","0","39","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emna mother ne hospital ma admit karya  che to 2 days pachi call karva no che","29","1","2020-07-08 11:00:00","2","2020-07-06 17:01:10","2020-07-08 11:00:00","2020-07-08 18:38:47","2020-07-08 18:38:47","1","1","29","1"),
("40","18","5","","0","0","331","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","wensday a meet kari ne final karvanu che","28","2","2020-07-08 10:30:00","1","2020-07-06 17:03:50","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:03:50","0","1","28","1"),
("41","16","5","","0","0","40","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Call karyo but emne call no answer nathi apyo to kale  morning ma farithi call karva no che","29","1","2020-07-07 10:00:00","2","2020-07-06 17:04:12","2020-07-07 10:00:00","2020-07-07 15:06:19","2020-07-07 15:06:19","1","1","29","1"),
("42","18","5","","0","0","333","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","sap erp use kare che web mate call karvano","28","3","2020-07-06 17:05:00","1","2020-07-06 17:06:31","1970-01-01 05:30:00","2020-07-07 10:34:42","2020-07-07 10:34:42","1","1","28","1"),
("43","16","5","","0","0","38","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne kale morning ma call karva no che and meeting mate java nu che . and final karse to emne tya install pan kari aapva nu che.","29","1","2020-07-07 10:00:00","2","2020-07-06 17:09:29","2020-07-07 17:08:00","2020-07-07 16:49:08","2020-07-07 16:49:08","1","1","29","1"),
("44","18","5","","0","0","335","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","kale call back karvano","28","2","2020-07-07 11:00:00","1","2020-07-06 17:10:24","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:10:24","0","1","28","1"),
("45","18","5","","0","0","337","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","bhargav bhai a num aapiyo billing mate call kariyo hato marg use kare che crm mate v at kari kale call karvano","28","2","2020-07-07 10:35:00","1","2020-07-06 17:19:11","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:19:11","0","1","28","1"),
("46","18","5","","0","0","7","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","2 divas pachi call karvano online demo aapi didho che","28","1","2020-07-09 11:15:00","1","2020-07-06 17:20:43","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:20:43","0","1","28","1"),
("47","18","4","","0","31","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","15 DATE PACHI KIDHU CHE ","28","2","2020-07-16 10:25:00","8","2020-07-06 17:21:53","2020-07-09 10:25:00","0000-00-00 00:00:00","2020-07-06 17:21:53","0","1","28","1"),
("48","16","5","","0","0","34","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Te New Startup kare che to ena mate inquiry kari hati GST No. ave pachi  FInal kara nu che.","29","1","2020-07-13 10:00:00","2","2020-07-06 17:24:21","2020-07-13 10:00:00","0000-00-00 00:00:00","2020-07-06 17:24:21","0","1","29","1"),
("49","18","5","","0","0","30","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","next week ma call back aapvano","28","1","2020-07-13 10:25:00","1","2020-07-06 17:25:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:25:48","0","1","28","1"),
("50","18","4","","0","34","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","demo link whatsapp kariyapi che demo joai ne kehse ","28","2","2020-07-10 10:25:00","8","2020-07-06 17:27:57","2020-07-03 10:25:00","0000-00-00 00:00:00","2020-07-06 17:27:57","0","1","28","1"),
("51","18","5","","0","0","16","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","next two next month kidhu che out off state che","28","1","2020-08-06 10:35:00","1","2020-07-06 17:39:14","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 17:39:14","0","1","28","1"),
("52","16","5","","0","0","341","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne 11/7 pachi call karva no che whatsup msg ma thi lead mali hati.","29","1","2020-07-13 10:00:00","2","2020-07-06 17:39:14","2020-07-13 10:00:00","0000-00-00 00:00:00","2020-07-06 17:39:14","0","1","29","1"),
("53","16","5","","0","0","344","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne call karyo hato but te work ma busy hata etle ene evu kidhu ke hu same thi call kari layis. ref by Saurabh sir.","29","1","2020-07-10 10:00:00","2","2020-07-06 17:52:27","2020-07-10 10:00:00","0000-00-00 00:00:00","2020-07-06 17:52:27","0","1","29","1"),
("54","18","5","","0","0","6","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","coutomize karavanu che aena thi pela bhargav sir nd mihir sir jai ne aaya che prise vadhare padi hati a time atiyare aene juve che pan chatral demo mate keh che online demo na pade che","28","2","2020-07-08 10:50:00","1","2020-07-06 18:03:17","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-06 18:03:17","0","1","28","1"),
("55","13","5","","0","0","327","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","tsting email sent with pdf","","1","2020-07-06 18:14:00","1","2020-07-06 18:14:49","0000-00-00 00:00:00","2020-07-06 18:14:54","2020-07-06 18:14:54","1","1","1","1"),
("56","16","5","","0","0","378","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Te New Foundary Start kare che nut emne haji machinery avi nathi te avse etle e call api dese.  month-end ma call karva no che","29","1","2020-07-30 10:00:00","2","2020-07-07 10:28:41","2020-07-30 10:00:00","0000-00-00 00:00:00","2020-07-07 10:28:41","0","1","29","1"),
("57","18","5","","0","0","379","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","using telly stock pan mange kare che crm mate kehse","28","3","2020-07-07 10:47:00","1","2020-07-07 10:48:12","0000-00-00 00:00:00","2020-07-07 10:48:19","2020-07-07 10:48:19","1","1","28","1"),
("58","16","5","","0","0","380","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne New Facotry lidhi che to atyre enu transfer nu kam chalu che emne 1 month pachi kidhu che call karva nu.","29","1","2020-08-03 10:00:00","2","2020-07-07 10:54:52","2020-08-03 10:00:00","0000-00-00 00:00:00","2020-07-07 10:54:52","0","1","29","1"),
("59","18","5","","0","0","381","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","hamda requre nathi whatspp karvanu kidhu biling protfolio next month ma call back aapvano","28","2","2020-08-12 10:30:00","1","2020-07-07 11:01:05","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 11:01:05","0","1","28","1"),
("60","16","5","","0","0","27","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne  atyre call karyo  but te just offcie avya che to sanje 4:00 vage call karva no che.","29","1","2020-07-07 16:00:00","2","2020-07-07 11:01:51","2020-07-07 16:00:00","2020-07-07 17:09:55","2020-07-07 17:09:55","1","1","29","1"),
("61","16","5","","0","0","28","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni sathe vat thayi emne software confirm levu che but te same thi call karse.","29","1","2020-07-13 10:30:00","2","2020-07-07 11:12:14","2020-07-13 10:30:00","0000-00-00 00:00:00","2020-07-07 11:12:14","0","1","29","1"),
("62","16","5","","0","0","382","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne call karyo but out of network ave che bapor pachi farithi call karis","29","1","2020-07-07 14:00:00","2","2020-07-07 11:25:00","2020-07-07 14:00:00","2020-07-07 15:09:37","2020-07-07 15:09:37","1","1","29","1"),
("63","18","5","","0","0","383","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","MAIL KARVANO MANNUALLY BILLING KARE CHE","28","2","2020-07-10 11:25:00","1","2020-07-07 11:27:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 11:27:48","0","1","28","1"),
("64","13","4","","0","491","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","BILLING DETAIL MAIL KARVANI","28","2","2020-07-07 11:28:00","8","2020-07-07 11:32:46","2020-06-30 11:28:00","0000-00-00 00:00:00","2020-07-07 11:32:46","0","1","28","1"),
("65","16","5","","0","0","385","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne 2 time call karyo but call nathi received karyo bapore farithi call karva no che","29","1","2020-07-07 14:30:00","2","2020-07-07 11:36:02","2020-07-07 14:30:00","2020-07-07 11:49:04","2020-07-07 11:49:04","1","1","29","1"),
("66","18","5","","0","0","404","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","mihir sir ne pass on karvani che ERP mate nd web mate next month ma plan karvanu che client ne","27,28","1","2020-08-22 10:25:00","1","2020-07-07 12:15:00","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 12:15:00","0","1","28","1"),
("67","16","5","","0","0","403","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni pase computer ke printer nathi  but te month na end sudhi ma layi leva na che. ti month-end ma calla  karva no che","29","1","2020-07-30 10:30:00","2","2020-07-07 12:15:13","2020-07-30 10:30:00","0000-00-00 00:00:00","2020-07-07 12:15:13","0","1","29","1"),
("68","16","5","","0","0","417","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","32","1","2020-07-07 14:00:00","6","2020-07-07 12:58:11","2020-07-07 13:00:00","2020-07-07 14:36:43","2020-07-07 14:36:43","1","1","32","1"),
("69","15","5","","0","0","3","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","crm nd billing nu qot mokli aapeli che 65 k nu  folloup levanu che next week","28","1","2020-07-14 10:20:00","1","2020-07-07 12:58:52","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 12:58:52","0","1","28","1"),
("70","13","5","","0","0","414","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","35","1","2020-07-07 13:01:00","1","2020-07-07 13:02:18","0000-00-00 00:00:00","2020-07-07 14:36:40","2020-07-07 14:36:40","1","1","32","1"),
("71","16","5","","0","0","419","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni pase prinetr nathi te manually bill banave che but te month na end sudhi ma printer layi lese and paci call karse.","29","1","2020-07-30 10:00:00","2","2020-07-07 13:05:29","2020-07-30 10:00:00","0000-00-00 00:00:00","2020-07-07 13:05:29","0","1","29","1"),
("72","16","5","","0","0","329","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne call karyo but te answer nathi aapta emne 3 days pachi call karis.","29","1","2020-07-10 10:50:00","2","2020-07-07 15:05:17","2020-07-10 10:50:00","0000-00-00 00:00:00","2020-07-07 15:05:17","0","1","29","1"),
("73","16","5","","0","0","40","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne 2 time call karya but call no answer nathi aapta 2 days pachi call karis","29","1","2020-07-10 10:45:00","2","2020-07-07 15:07:40","2020-07-10 10:45:00","0000-00-00 00:00:00","2020-07-07 15:07:40","0","1","29","1"),
("74","16","5","","0","0","382","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","te drive kari rahya hata to kale call karva no che","29","1","2020-07-08 11:00:00","2","2020-07-07 15:10:52","2020-07-08 11:00:00","2020-07-08 18:55:21","2020-07-08 18:55:21","1","1","29","1"),
("75","16","5","","0","0","425","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni pase computer ke printer nathi but te interested che te same thi sanje call karse nai to emne kale call karva no che.","29","1","2020-07-08 11:00:00","2","2020-07-07 15:21:05","2020-07-08 11:00:00","2020-07-08 17:47:30","2020-07-08 17:47:30","1","1","29","1"),
("76","16","5","","0","0","426","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne 1 month pachi call karva no che. te manually bill banave che","29","1","2020-08-03 11:00:00","2","2020-07-07 15:26:37","2020-08-03 11:00:00","0000-00-00 00:00:00","2020-07-07 15:26:37","0","1","29","1"),
("77","18","5","","0","0","427","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","15k prise aapeli che link nd fraure mail nd whatspp karvana","28","1","2020-07-07 15:40:00","8","2020-07-07 15:41:41","2020-06-30 15:40:00","0000-00-00 00:00:00","2020-07-07 15:41:41","0","1","28","1"),
("78","13","4","","0","544","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","mail by billing details ","28","1","2020-07-07 15:41:00","1","2020-07-07 15:42:30","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 15:42:30","0","1","28","1"),
("79","16","5","","0","0","428","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Te Excel File mathi bill banave che. te atyre out of city jay che to monday call kari ne demo aapvo che then final karse.","29","1","2020-07-13 11:01:00","2","2020-07-07 15:42:44","2020-07-13 11:01:00","0000-00-00 00:00:00","2020-07-07 15:42:44","0","1","29","1"),
("80","18","5","","0","0","429","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","using telly\nonther soft requre 15k prise che \nmail karvano","28","2","2020-07-07 16:19:00","1","2020-07-07 16:21:26","0000-00-00 00:00:00","2020-07-08 12:08:29","2020-07-08 12:08:29","1","1","28","1"),
("81","13","4","","0","546","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","billing features sent mail","28","2","2020-07-07 16:21:00","1","2020-07-07 16:22:24","0000-00-00 00:00:00","2020-07-08 12:08:17","2020-07-08 12:08:17","1","1","28","1"),
("82","16","5","","0","0","38","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Te aje bapor pachi bahar gaya hata etle have kale morning  ma call kari ne mlava java nu che.","29","1","2020-07-08 10:25:00","2","2020-07-07 16:50:55","2020-07-08 10:25:00","0000-00-00 00:00:00","2020-07-08 17:46:25","2","1","29","1"),
("83","18","5","","0","0","430","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","bill cocha bane aene ocha prise ma joaiye che 6k nd 12k kidha che 2 divas pachi meet karvanu kidhu che nd mail karvano","28","2","2020-07-10 10:45:00","1","2020-07-07 16:53:41","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 16:53:41","0","1","28","1"),
("84","13","4","","0","547","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","ane ocha prise ma joaiye che meet karvani che ak var mail karvano che feature no","28","2","2020-07-07 16:53:00","8","2020-07-07 16:54:48","2020-06-30 16:53:00","0000-00-00 00:00:00","2020-07-07 16:54:48","0","1","28","1"),
("85","16","5","","0","0","27","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne demo mate mlava nu che te atyre emni pase 2 marketing na person che. kale morning ma call karva no che. pachi te meeting mate no time aapse.","29","1","2020-07-08 10:31:00","2","2020-07-07 17:13:42","2020-07-08 10:31:00","2020-07-08 18:43:45","2020-07-08 18:43:45","1","1","29","1"),
("86","16","5","","0","0","431","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Narotam bhai e ref. apyo che. call karyo but emne answer nathi aapyo kale farithi call karis.","29","1","2020-07-08 10:30:00","2","2020-07-07 17:26:29","2020-07-08 10:30:00","2020-07-08 18:35:51","2020-07-08 18:35:51","1","1","29","1"),
("87","16","5","","0","0","286","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne call karyo but emne haji demo open karyi nathi bcz demo loadning leche evu keche etle emne kale morning ma call kari ne malva javanu che.","29","1","2020-07-08 10:34:00","2","2020-07-07 17:36:18","2020-07-08 10:34:00","2020-07-08 17:50:38","2020-07-10 12:42:00","2","1","29","1"),
("88","18","5","","0","0","432","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","20k prise aapi che ak var meet karvani nd mail karvano","28","1","2020-07-09 10:20:00","1","2020-07-07 17:51:51","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-07 17:51:51","0","1","28","1"),
("89","13","4","","0","550","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","billing fatures by mail","28","1","2020-07-07 17:52:00","8","2020-07-07 17:52:47","2020-06-30 17:52:00","0000-00-00 00:00:00","2020-07-07 17:52:47","0","1","28","1"),
("90","14","5","","0","0","72","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Need to give him BOM and Production cycle demo","31","1","2020-07-08 11:00:00","2","2020-07-08 00:15:58","2020-07-08 11:00:00","2020-07-13 18:49:50","2020-07-13 18:49:50","1","1","27","1"),
("91","0","5","","0","0","261","kathwada","0","2020-07-11 16:30:00","2020-07-11 17:30:00","mattimng for billing360","SUNDAY KEHTA HATA PAN STRDY LAUNCH PACHI KIDHU CHE\nMASTER BILLING NA 15K KIDHA CHE ND P&L NA 22K KIDHA CHE","","0","0000-00-00 00:00:00","0","2020-07-08 10:26:20","2020-07-11 10:25:00","0000-00-00 00:00:00","2020-07-08 11:46:54","0","2","28","1"),
("92","0","5","","0","0","331","RAKHIAL","0","2020-07-15 11:00:00","2020-07-15 16:00:00","MATTING FOR BILLING360","STRDAY RAKHAIL AAVANA CHE AMNI AK COMPANY BAKROL CHE","","0","0000-00-00 00:00:00","0","2020-07-08 10:38:51","2020-07-11 14:35:00","0000-00-00 00:00:00","2020-07-13 14:23:02","0","2","28","1"),
("93","18","5","","0","0","21","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","NEXT WEEK MA MEET KARVANI CHE","28","1","2020-07-08 10:46:00","1","2020-07-08 10:47:24","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 10:47:24","0","1","28","1"),
("94","0","5","","0","0","21","VATVA","0","2020-07-14 11:45:00","2020-07-14 13:05:00","MATTING FOR BILLING360 ","FINAL KARVANU CHE LAST 11K AAPIYA CHE OLD LEAD HATI ATLE A/CTNT JODE MEET KARI FINAL KARVANU CHE","","0","0000-00-00 00:00:00","2","2020-07-08 10:50:55","2020-07-14 11:45:00","0000-00-00 00:00:00","2020-07-08 10:50:55","0","2","28","1"),
("95","16","5","","0","0","146","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He disconnected the call  after hearing the purpose of the call.","32","1","2020-07-10 10:25:00","6","2020-07-08 11:20:08","2020-07-10 10:00:00","2020-07-10 16:40:08","2020-07-10 16:40:08","1","1","32","1"),
("96","18","5","","0","0","7","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","AAPDE 65 PRISE AAPI HATI\nMUMBAI VADI COMPANY A 40K KIDHA CHE ND AMNI INDUSTRIES NIJ BANAYI CHE CRM\nTO PAN NEEXT WEEK MA MEET KARVANU KIDHU CHE","28,29","2","2020-07-08 11:27:00","1","2020-07-08 11:30:00","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 11:30:00","0","1","28","1"),
("97","0","5","","0","0","7","VATVA","0","2020-07-15 13:30:00","2020-07-15 15:30:00","MATTING FOR CRM ","PRICE ND PROCESS ISSUE CHE \nAAPDI COMPARISION MA MUMBAI VADI COMPANY 40K MA CRM AAPE PARTICURL AMNIJ INDUSTRIES NI\nNEXT WEEK MA MEET KARVANU KIDHU CHE JO SET THAI JASE CONFORM THAI SHAKE CHE","29","0","0000-00-00 00:00:00","2","2020-07-08 11:34:21","2020-07-15 13:30:00","0000-00-00 00:00:00","2020-07-08 11:34:21","0","2","28","1"),
("98","18","5","","0","0","8","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","SIR NE TIME SET THATO NATHI AAJE MEET KARVANI HATI PAN BIJA 3 PARTY MALVA AAVI CHE \nKALE YA 2 DIVAS PACHI MEET KARVANI\n","28","2","2020-07-08 11:37:00","1","2020-07-08 11:39:46","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 11:39:46","0","1","28","1"),
("99","0","5","","0","0","8","VATVA","0","2020-07-10 12:00:00","2020-07-10 13:00:00","MATTING FOR BILLING360 DEMO","SIR NE TIME SET THATO NATHI AAJE MEET KARVANI HATI PAN BIJA 3 PARTY MALVA AAVI CHE \nKALE YA 2 DIVAS PACHI MEET KARVANI","","0","0000-00-00 00:00:00","2","2020-07-08 11:41:51","2020-07-10 12:00:00","0000-00-00 00:00:00","2020-07-08 11:41:51","0","2","28","1"),
("100","18","5","","0","0","335","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","EXCEL MA BILLING KARE CHE \nHAMDA PAYMENT NA ISSUE  CHE ATLE NEXT TWO NEXT MONTH KIDHU CHE","28","2","2020-08-20 10:20:00","1","2020-07-08 11:50:45","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 11:50:45","0","1","28","1");
INSERT INTO tbl_task VALUES
("101","18","5","","0","0","433","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","ALREADY OTHER SOFT USING NOT REQURE NOW","28","3","2020-07-08 11:56:00","1","2020-07-08 11:56:44","0000-00-00 00:00:00","2020-07-08 11:56:50","2020-07-08 11:56:50","1","1","28","1"),
("102","18","5","","0","0","434","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","MANUALLY J KARE CHE HAMDA PALN NATHI SAME THI CALL BACKE KARSE\nNEXT MONTH AAPDE AK VAR REMINDER AAPVANO 13K LAST PRICE AAPICHE","28","2","2020-08-20 10:30:00","1","2020-07-08 12:05:06","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 12:05:06","0","1","28","1"),
("103","18","5","","0","0","429","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","HAMDA NA PADI ALREADY TELLY USE KARE J CHE HASE TO CALL KARSE","28","3","2020-07-08 12:07:00","1","2020-07-08 12:08:01","0000-00-00 00:00:00","2020-07-08 12:08:07","2020-07-08 12:08:07","1","1","28","1"),
("104","18","5","","0","0","427","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","NATHI REQURE TELLY CHEJ DOUBLE DOUBLE SOFT LAI NE MATLB NAI ","28","3","2020-07-08 12:09:00","1","2020-07-08 12:10:17","0000-00-00 00:00:00","2020-07-08 12:10:21","2020-07-08 12:10:21","1","1","28","1"),
("105","18","5","","0","0","26","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","BUSY CHE CUT KARIYO CALL","28","2","2020-07-08 12:15:00","1","2020-07-08 12:15:43","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 12:15:43","0","1","28","1"),
("106","16","5","","0","0","435","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Called for demo but he was out of his workstation. Have to call next day for the same.","32","1","2020-07-10 11:10:00","6","2020-07-08 13:14:38","2020-07-10 10:10:00","2020-07-10 11:47:43","2020-07-10 11:47:43","1","1","32","1"),
("107","16","5","","0","0","368","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","32","1","2020-07-25 10:20:00","6","2020-07-08 13:23:13","2020-07-25 09:20:00","0000-00-00 00:00:00","2020-07-08 13:23:13","0","1","32","1"),
("108","18","5","","0","0","432","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","next week ma meet karvani","28","1","2020-07-08 14:14:00","1","2020-07-08 14:14:39","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 14:14:39","0","1","28","1"),
("109","0","5","","0","0","432","odhav","0","2020-07-14 14:15:00","2020-07-14 15:15:00","matting for billing360","price 20k aapeli che","","0","0000-00-00 00:00:00","1","2020-07-08 14:16:11","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 14:16:11","0","2","28","1"),
("110","18","5","","0","0","23","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","demo mate link mokli aapi che \ncall cut kare che ","28","2","2020-07-08 14:22:00","1","2020-07-08 14:23:44","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 14:23:44","0","1","28","1"),
("111","18","5","","0","0","436","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","using tally now not intrested","28","3","2020-07-15 10:25:00","1","2020-07-08 14:28:09","1970-01-01 05:30:00","2020-07-08 14:28:23","2020-07-08 14:37:39","1","1","28","1"),
("112","18","5","","0","0","25","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","amni tabiyat nathi sari hamda next to next week office aavanu kidhu che call karse","28","2","2020-07-15 10:25:00","1","2020-07-08 14:37:19","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 14:37:19","0","1","28","1"),
("113","16","5","","0","0","144","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He wants Tally s/w and not interested for billing s/w.","32","1","2020-07-09 12:20:00","1","2020-07-08 15:23:52","1970-01-01 05:30:00","2020-07-09 16:13:18","2020-07-09 16:14:28","1","1","32","1"),
("114","16","5","","0","0","145","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-09 14:40:00","1","2020-07-08 15:42:28","0000-00-00 00:00:00","2020-07-09 18:55:10","2020-07-09 18:55:10","1","1","32","1"),
("115","16","5","","0","0","151","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Called yesterday but got no reply. Have to try to call again.","","1","2020-07-09 16:35:00","1","2020-07-08 16:03:42","0000-00-00 00:00:00","2020-07-09 18:55:08","2020-07-09 18:55:08","1","1","32","1"),
("116","16","5","","0","0","153","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","32","1","2020-07-10 12:05:00","1","2020-07-08 16:08:54","0000-00-00 00:00:00","2020-07-10 14:00:46","2020-07-10 14:00:46","1","1","32","1"),
("117","16","5","","0","0","154","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call","32","1","2020-07-09 15:05:00","1","2020-07-08 16:10:33","1970-01-01 05:30:00","2020-07-09 16:21:02","2020-07-09 16:21:02","1","1","32","1"),
("118","18","5","","0","0","437","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","demo batavno","28","1","2020-07-08 16:12:00","1","2020-07-08 16:12:50","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 16:12:50","0","1","28","1"),
("119","0","5","","0","0","437","maninagr","0","2020-07-10 16:10:00","2020-07-10 16:30:00","online demo for billing360","online  demo batayo che kale call back aapse","","0","0000-00-00 00:00:00","0","2020-07-08 16:14:18","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-09 10:52:17","0","2","28","1"),
("120","16","5","","0","0","157","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Incoming facility is not available. Mail Sent","32","1","2020-07-11 16:05:00","1","2020-07-08 16:17:08","1970-01-01 05:30:00","2020-07-11 12:56:55","2020-07-11 12:59:25","1","1","32","1"),
("121","16","5","","0","0","158","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He purchased Marg s/w.","32","1","2020-07-14 18:25:00","1","2020-07-08 16:20:35","1970-01-01 05:30:00","2020-07-14 16:17:33","2020-07-14 16:17:33","1","1","32","1"),
("122","16","5","","0","0","160","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He told me that if he will be free then he will go through the demo the same day. Called him for demo at his convenient time but did not pick up the call. Mail sent along with demo link.","32","1","2020-07-09 11:05:00","1","2020-07-08 16:27:28","1970-01-01 05:30:00","2020-07-09 17:37:29","2020-07-09 17:37:29","1","1","32","1"),
("123","16","5","","0","0","162","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Tried connecting him many times but unable to reach him","","1","2020-07-09 11:05:00","1","2020-07-08 16:31:01","1970-01-01 05:30:00","2020-07-09 17:47:15","2020-07-09 17:47:15","1","1","32","1"),
("124","16","5","","0","0","163","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Purchased the s/w","32","1","2020-07-10 11:10:00","1","2020-07-08 16:32:49","1970-01-01 05:30:00","2020-07-10 11:38:59","2020-07-10 11:38:59","1","1","32","1"),
("125","16","5","","0","0","164","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He was going back to home so have to call the day later","","1","2020-07-09 15:30:00","1","2020-07-08 16:35:13","1970-01-01 05:30:00","2020-07-09 16:59:43","2020-07-09 16:59:43","1","1","32","1"),
("126","16","5","","0","0","165","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call.","","1","2020-07-09 11:30:00","1","2020-07-08 16:39:42","1970-01-01 05:30:00","2020-07-09 14:57:54","2020-07-09 14:57:54","1","1","32","1"),
("127","16","5","","0","0","167","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Purchased tally. Lead Lost","","1","2020-07-13 13:20:00","1","2020-07-08 16:41:37","1970-01-01 05:30:00","2020-07-13 18:23:51","2020-07-14 13:50:03","1","1","32","1"),
("128","16","5","","0","0","180","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is ready for demo but don\'t have access to gmail so have to do on 13 july","32","1","2020-07-10 14:40:00","1","2020-07-08 16:45:43","1970-01-01 05:30:00","2020-07-10 17:12:42","2020-07-10 17:12:42","1","1","32","1"),
("129","16","5","","0","0","183","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call","","1","2020-07-13 11:05:00","1","2020-07-08 16:48:17","1970-01-01 05:30:00","2020-07-13 18:09:00","2020-07-14 13:48:25","1","1","32","1"),
("130","16","5","","0","0","194","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Already purchased s/w.","32","1","2020-07-10 16:05:00","1","2020-07-08 16:50:10","1970-01-01 05:30:00","2020-07-10 18:19:09","2020-07-10 18:19:09","1","1","32","1"),
("131","18","5","","0","0","438","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","manually billing kare che \ndetails whatspp kari che kale call back aapvano\ncal backe kariyo gaian\namne atiyare mans nathi aavse atle same thi call back aapse","28","2","2020-08-15 10:50:00","1","2020-07-08 16:56:01","1970-01-01 05:30:00","2020-07-13 14:38:31","2020-07-13 14:41:36","1","1","28","1"),
("132","16","5","","0","0","230","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He has already purchased other s/w.","","1","2020-07-14 15:05:00","1","2020-07-08 16:59:21","1970-01-01 05:30:00","2020-07-14 16:56:26","2020-07-14 16:56:26","1","1","32","1"),
("133","16","5","","0","0","351","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is already using a billing s/w. Have send him the  details and will call again","","1","2020-07-15 11:10:00","1","2020-07-08 17:05:25","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-08 17:15:17","0","1","32","1"),
("134","16","5","","0","0","353","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is already using the s/w and the features are same as our s/w so he does not need any s/w","","1","2020-07-09 14:30:00","1","2020-07-08 17:11:18","1970-01-01 05:30:00","2020-07-09 16:25:29","2020-07-09 16:25:29","1","1","32","1"),
("135","16","5","","0","0","368","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He was not well and have to call again.","","1","2020-07-25 17:05:00","1","2020-07-08 17:13:16","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 17:13:16","0","1","32","1"),
("136","16","5","","0","0","377","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call.Lead Lost. ","","1","2020-07-13 14:40:00","1","2020-07-08 17:17:48","1970-01-01 05:30:00","2020-07-13 17:22:37","2020-07-14 13:10:10","1","1","32","1"),
("137","16","5","","0","0","389","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call","","1","2020-07-09 11:35:00","1","2020-07-08 17:19:48","1970-01-01 05:30:00","2020-07-09 14:52:26","2020-07-09 14:53:26","1","1","32","1"),
("138","16","5","","0","0","392","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is not interested","","1","2020-07-10 13:05:00","1","2020-07-08 17:23:34","1970-01-01 05:30:00","2020-07-10 17:36:39","2020-07-10 17:36:39","1","1","32","1"),
("139","16","5","","0","0","397","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Out of coverage","","1","2020-07-13 16:30:00","1","2020-07-08 17:26:40","1970-01-01 05:30:00","2020-07-13 18:26:57","2020-07-14 13:51:55","1","1","32","1"),
("140","16","5","","0","0","399","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is busy for next few days and have to call on Monday i.e 13 th July","","1","2020-07-09 10:30:00","1","2020-07-08 17:28:57","1970-01-01 05:30:00","2020-07-09 14:49:50","2020-07-09 14:53:04","1","1","32","1"),
("141","18","5","","0","0","439","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","service main important che kale meet karva javanu che 2 vagiya pachi","28","2","2020-07-08 17:40:00","1","2020-07-08 17:41:17","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 17:41:17","0","1","28","1"),
("142","0","5","","0","0","439","vatva","0","2020-07-23 10:30:00","2020-07-23 15:15:00","matting for billing36o","vatva 13k nd 20k prise aapi che\nmeet kariya pachi last 15k amne kidha che","","0","0000-00-00 00:00:00","0","2020-07-08 17:43:40","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 14:25:02","0","2","28","1"),
("143","16","5","","0","0","286","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","emne call karyo hato but emne kale morniong ma call karva no che bcz tya varsad hato etle emne kale call kari ne demo aapva no che.","29","1","2020-07-09 10:30:00","2","2020-07-08 17:51:57","2020-07-09 10:30:00","0000-00-00 00:00:00","2020-07-10 12:41:49","2","1","29","1"),
("144","18","5","","0","0","440","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","nanu kamkaj che manually kare che 12k price aapi che next to next month ma call back aapvano hamda kam kaj band che","28","2","2020-09-05 17:05:00","1","2020-07-08 17:53:16","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-08 17:53:16","0","1","28","1"),
("145","18","5","","0","0","441","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","mahuva ni party che hanumant plast jitu bhai\n15k price kidhi che \nvat kari ne kehse \nnext week ma reminder aapvanu","28","3","2020-07-13 10:40:00","1","2020-07-08 18:02:04","1970-01-01 05:30:00","2020-07-13 14:30:03","2020-07-13 14:31:03","1","1","28","1"),
("146","16","5","","0","0","308","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Purchased Vepar. Lead Lost","32","1","2020-07-13 14:25:00","1","2020-07-08 18:12:58","1970-01-01 05:30:00","2020-07-13 18:30:30","2020-07-14 13:58:33","1","1","32","1"),
("147","16","5","","0","0","431","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Te atyre ek client sathe meeting ma hata emne call karyo to emne kale morning ma call karva no che","29","1","2020-07-09 10:32:00","2","2020-07-08 18:38:28","2020-07-09 10:32:00","2020-07-13 11:12:00","2020-07-13 11:12:00","1","1","29","1"),
("148","16","5","","0","0","39","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emna mother ne haji hospital ma j che to haji 2 days pachi call karva no che.","29","1","2020-07-09 10:30:00","2","2020-07-08 18:43:29","2020-07-09 10:30:00","0000-00-00 00:00:00","2020-07-08 18:43:29","0","1","29","1"),
("149","16","5","","0","0","27","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","aje meeting mate no time set na thayi sakyo etle emne kale call akrva no che morning ma.","29","1","2020-07-09 10:34:00","2","2020-07-08 18:44:56","2020-07-09 10:34:00","0000-00-00 00:00:00","2020-07-08 18:44:56","0","1","29","1"),
("150","16","5","","0","0","382","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne kale call karva no che pachi e ke to demo aapva no che online ya to emne facotry par jayi ne.","29","1","2020-07-09 10:25:00","2","2020-07-08 18:56:45","2020-07-09 11:00:00","2020-07-14 09:48:57","2020-07-14 09:48:57","1","1","29","1"),
("151","18","5","","0","0","438","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","badhi details amne joai lidhi have same thi call back aapse","28","3","2020-08-15 10:05:00","2","2020-07-09 10:47:14","2020-08-15 10:05:00","0000-00-00 00:00:00","2020-07-09 10:47:14","0","1","28","1"),
("152","16","5","","0","0","156","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-08-10 11:05:00","1","2020-07-09 10:56:40","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-09 10:56:40","0","1","32","1"),
("153","18","5","","0","0","442","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","deatails whatspp kari che call back aapse nai to aapde call back aapvano","28","2","2020-07-11 11:10:00","2","2020-07-09 11:11:40","2020-07-11 11:10:00","0000-00-00 00:00:00","2020-07-09 11:11:40","0","1","28","1"),
("154","16","5","","0","0","152","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-11 11:30:00","1","2020-07-09 11:24:27","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-09 11:24:27","0","1","32","1"),
("155","16","5","","0","0","150","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He told that the requirement is closed. I asked about the s/w he purchased. He told that all his requirements are satisfied with the current s/w and don\'t want new s/w.","","1","2020-07-10 13:20:00","1","2020-07-09 11:25:13","1970-01-01 05:30:00","2020-07-10 17:45:11","2020-07-10 17:45:11","1","1","32","1"),
("156","16","5","","0","0","399","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He is busy for next one month so have to call after a month. ","","1","2020-07-13 15:05:00","1","2020-07-09 14:49:18","1970-01-01 05:30:00","2020-07-13 17:14:36","2020-07-14 13:05:57","1","1","32","1"),
("157","16","5","","0","0","165","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Disconnected the call","","1","2020-07-11 11:10:00","1","2020-07-09 14:58:46","1970-01-01 05:30:00","2020-07-11 12:50:54","2020-07-11 12:50:54","1","1","32","1"),
("158","16","5","","0","0","166","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Demo Done. He has requirement and that is possible from our end. ","","1","2020-07-10 11:00:00","1","2020-07-09 15:40:13","1970-01-01 05:30:00","2020-07-10 18:18:06","2020-07-10 18:18:06","1","1","32","1"),
("159","16","5","","0","0","213","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","No is constantly switched off.","","1","2020-07-10 10:50:00","1","2020-07-09 15:59:30","1970-01-01 05:30:00","2020-07-10 11:03:47","2020-07-10 11:03:47","1","1","32","1"),
("160","16","5","","0","0","174","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call","","1","2020-07-10 17:05:00","1","2020-07-09 16:04:15","1970-01-01 05:30:00","2020-07-10 17:46:14","2020-07-10 17:46:14","1","1","32","1"),
("161","16","5","","0","0","175","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He will see the demo and have to call the next day for f/up.","","1","2020-07-10 11:15:00","1","2020-07-09 16:07:11","1970-01-01 05:30:00","2020-07-10 15:14:07","2020-07-10 15:14:07","1","1","32","1"),
("162","16","5","","0","0","154","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-11 16:20:00","1","2020-07-09 16:22:01","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-09 16:22:01","0","1","32","1"),
("163","16","5","","0","0","361","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He told that currently he can\'t purchase s/w due to covid-19.","","1","2020-07-09 16:00:00","1","2020-07-09 16:47:00","1970-01-01 05:30:00","2020-07-09 17:45:09","2020-07-09 17:45:09","1","1","32","1"),
("164","16","5","","0","0","164","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-10 15:05:00","1","2020-07-09 17:00:03","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-09 17:00:03","0","1","32","1"),
("165","16","5","","0","0","179","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not get reply","","1","2020-07-11 15:20:00","1","2020-07-09 17:17:51","1970-01-01 05:30:00","2020-07-11 13:24:39","2020-07-11 13:24:39","1","1","32","1"),
("166","16","5","","0","0","160","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-10 14:00:00","1","2020-07-09 17:34:20","0000-00-00 00:00:00","2020-07-10 14:55:28","2020-07-10 14:55:28","1","1","32","1"),
("167","16","5","","0","0","160","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He told that he is busy for next 2 days, he will call from his end once he gets free. ","","1","2020-07-10 12:20:00","1","2020-07-09 17:37:06","1970-01-01 05:30:00","2020-07-10 14:52:20","2020-07-10 14:52:20","1","1","32","1"),
("168","16","5","","0","0","415","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call","","1","2020-07-10 13:20:00","1","2020-07-09 17:39:24","1970-01-01 05:30:00","2020-07-10 15:00:19","2020-07-10 17:35:50","1","1","32","1"),
("169","16","5","","0","0","162","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Not interested and disconnected the call.","","1","2020-07-11 16:45:00","1","2020-07-09 17:47:54","1970-01-01 05:30:00","2020-07-11 13:31:19","2020-07-11 13:31:19","1","1","32","1"),
("170","16","5","","0","0","161","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Not able to hear properly. Have to try later. Mail sent","","1","2020-07-11 11:55:00","1","2020-07-09 17:57:41","1970-01-01 05:30:00","2020-07-11 16:29:23","2020-07-11 16:29:23","1","1","32","1"),
("171","16","5","","0","0","187","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-10 16:55:00","1","2020-07-09 18:08:07","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-09 18:08:07","0","1","32","1"),
("172","16","5","","0","0","151","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Unable to connect","","1","2020-07-13 19:00:00","1","2020-07-09 18:55:38","1970-01-01 05:30:00","2020-07-13 18:38:51","2020-07-14 14:00:08","1","1","32","1"),
("173","16","5","","0","0","145","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 15:45:00","1","2020-07-09 18:56:35","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 18:42:47","0","1","32","1"),
("174","16","5","","0","0","174","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-13 13:25:00","1","2020-07-10 10:57:13","0000-00-00 00:00:00","2020-07-13 17:15:20","2020-07-13 17:15:20","1","1","32","1"),
("175","16","5","","0","0","213","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","No is switched off","","1","2020-07-14 13:45:00","1","2020-07-10 11:04:19","1970-01-01 05:30:00","2020-07-14 16:59:04","2020-07-14 16:59:04","1","1","32","1"),
("176","16","5","","0","0","210","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Demo arranged the next day at 2","","1","2020-07-14 10:15:00","1","2020-07-10 11:23:26","1970-01-01 05:30:00","2020-07-14 17:05:47","2020-07-14 17:05:47","1","1","32","1"),
("177","16","5","","0","0","211","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-20 13:50:00","1","2020-07-10 11:29:32","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 11:29:32","0","1","32","1"),
("178","16","5","","0","0","435","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Tried many times but did not get any reply. Have to call later.","","1","2020-07-11 11:00:00","1","2020-07-10 11:50:56","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-11 17:50:03","0","1","32","1"),
("179","16","5","","0","0","445","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni sathe vat thayi gayi che emne call kari ne demo aapva no che.","29","1","2020-07-09 16:03:00","2","2020-07-10 12:59:02","2020-07-09 16:03:00","2020-07-10 12:59:10","2020-07-10 12:59:10","1","1","29","1"),
("180","16","5","","0","0","446","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni sathe vat thayi gayi aje bapore 2 :00 vagya pachi malva nu che.","29","1","2020-07-10 15:01:00","2","2020-07-10 13:07:10","2020-07-10 15:01:00","2020-07-13 10:24:17","2020-07-13 10:24:17","1","1","29","1"),
("181","16","5","","0","0","166","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He will connect me to the account person and further have to discuss with that person.","","1","2020-07-11 15:30:00","1","2020-07-10 14:35:26","1970-01-01 05:30:00","2020-07-11 11:29:44","2020-07-11 11:29:44","1","1","32","1"),
("182","16","5","","0","0","160","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 13:25:00","1","2020-07-10 14:54:52","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 18:41:47","0","1","32","1"),
("183","16","5","","0","0","175","","0","0000-00-00 00:00:00","0000-00-00 00:00:00",""," Called him for demo but did not receive the call.","","1","2020-07-11 15:05:00","1","2020-07-10 15:12:42","1970-01-01 05:30:00","2020-07-11 17:01:22","2020-07-11 17:01:22","1","1","32","1"),
("184","16","5","","0","0","168","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Mail sent and he will  go through the details and let us know.","","1","2020-07-14 16:25:00","1","2020-07-10 15:27:10","1970-01-01 05:30:00","2020-07-14 17:15:19","2020-07-14 17:15:19","1","1","32","1"),
("185","15","5","","0","0","447","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","JIGNESH SIR A KIDHU CHE KALE SOFT INSTALL KARVANU CHE","28","1","2020-07-11 15:00:00","1","2020-07-10 15:53:31","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 15:53:31","0","1","28","1"),
("186","16","5","","0","0","221","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 16:50:00","1","2020-07-10 15:56:44","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 15:56:44","0","1","32","1"),
("187","16","5","","0","0","223","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 11:10:00","1","2020-07-10 16:21:42","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 18:41:26","0","1","32","1"),
("188","13","5","","0","0","313","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Since no is invalid mail f/up done. Lead lost","","1","2020-07-13 11:30:00","1","2020-07-10 16:30:47","1970-01-01 05:30:00","2020-07-13 17:20:21","2020-07-14 13:07:54","1","1","32","1"),
("189","16","5","","0","0","345","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Unable to connect","","1","2020-07-14 17:35:00","1","2020-07-10 16:34:37","1970-01-01 05:30:00","2020-07-14 16:16:50","2020-07-14 16:16:50","1","1","32","1"),
("190","16","5","","0","0","180","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 15:05:00","1","2020-07-10 17:12:08","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 18:39:58","0","1","32","1"),
("191","16","5","","0","0","221","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Pharma company and requirement does not match our s/w. Lead lost","","1","2020-07-13 14:30:00","1","2020-07-10 17:25:28","1970-01-01 05:30:00","2020-07-13 17:11:21","2020-07-14 12:04:21","1","1","32","1"),
("192","16","5","","0","0","174","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call.","","1","2020-07-13 11:55:00","1","2020-07-10 17:47:56","1970-01-01 05:30:00","2020-07-13 17:07:10","2020-07-14 12:03:12","1","1","32","1"),
("193","18","5","","0","0","448","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","whatsapp details send and call back ","33","2","2020-07-10 17:59:00","2","2020-07-10 18:01:22","2020-07-10 17:59:00","0000-00-00 00:00:00","2020-07-10 18:01:22","0","1","33","1"),
("194","18","5","","0","0","449","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details sends whatsapp ","","2","2020-07-10 18:05:00","2","2020-07-10 18:06:58","2020-07-10 18:05:00","0000-00-00 00:00:00","2020-07-10 18:06:58","0","1","33","1"),
("195","18","5","","0","0","450","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","detail send by whatsapp","","2","2020-07-11 11:20:00","1","2020-07-10 18:22:41","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 18:22:41","0","1","33","1"),
("196","18","5","","0","0","451","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","detail send in whatsapp","","2","2020-07-11 11:00:00","1","2020-07-10 18:27:35","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 18:27:35","0","1","33","1"),
("197","16","5","","0","0","355","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not reply","","1","2020-07-11 11:10:00","1","2020-07-10 18:32:09","1970-01-01 05:30:00","2020-07-11 12:19:28","2020-07-11 12:22:35","1","1","32","1"),
("198","18","5","","0","0","452","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","detail srnd by whatsapp","","2","2020-07-11 12:30:00","1","2020-07-10 18:34:17","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 18:34:17","0","1","34","1"),
("199","18","5","","0","0","452","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","detail sebd by whatsapp","","2","2020-07-11 11:35:00","1","2020-07-10 18:36:31","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-10 18:36:31","0","1","34","1"),
("200","16","5","","0","0","456","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","called back him for product review and finalisation. as per him, he will pay half amount by next week","","1","2020-07-15 11:10:00","2","2020-07-10 22:57:34","2020-07-15 11:10:00","2020-07-14 10:48:36","2020-07-14 10:48:36","1","1","27","1");
INSERT INTO tbl_task VALUES
("201","0","5","","0","0","457","Gandhinagar","0","2020-07-11 11:00:00","2020-07-11 12:00:00","meeting for ERP introduction and demostration","with Jignesh bhai","","0","0000-00-00 00:00:00","2","2020-07-10 23:05:00","2020-07-11 11:00:00","0000-00-00 00:00:00","2020-07-10 23:05:00","0","2","27","1"),
("202","18","5","","0","0","0","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details send by whatsapp","","2","2020-07-11 11:01:00","1","2020-07-11 10:34:13","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 10:34:13","0","1","34","1"),
("203","18","5","","0","0","454","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details send by whatsapp","","2","2020-08-11 11:00:00","1","2020-07-11 10:42:09","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 10:42:09","0","1","34","1"),
("204","18","5","","0","0","455","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details send by whatsapp","","2","2020-07-11 11:02:00","1","2020-07-11 10:43:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 10:43:48","0","1","34","1"),
("205","0","5","","0","0","430","DANILIMDA","0","2020-07-14 11:30:00","2020-07-14 11:50:00","MATTING FOR BILLING360 DEMO","MONDAY 3 BAJE BAD BODA","","0","0000-00-00 00:00:00","0","2020-07-11 11:19:50","2020-07-13 15:15:00","0000-00-00 00:00:00","2020-07-13 16:55:51","0","2","28","1"),
("206","16","5","","0","0","166","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 13:00:00","1","2020-07-11 11:29:35","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-13 18:39:20","0","1","32","1"),
("207","16","5","","0","0","348","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","No is busy","","1","2020-07-13 12:40:00","1","2020-07-11 11:40:20","1970-01-01 05:30:00","2020-07-13 16:56:40","2020-07-14 11:55:38","1","1","32","1"),
("208","16","5","","0","0","182","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-13 13:40:00","1","2020-07-11 11:43:38","0000-00-00 00:00:00","2020-07-13 16:54:29","2020-07-13 16:54:29","1","1","32","1"),
("209","16","5","","0","0","193","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 14:45:00","1","2020-07-11 11:45:03","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 11:45:03","0","1","32","1"),
("210","16","5","","0","0","366","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 14:10:00","1","2020-07-11 12:05:37","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 12:05:37","0","1","32","1"),
("211","16","5","","0","0","372","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-13 13:25:00","1","2020-07-11 12:18:35","0000-00-00 00:00:00","2020-07-13 16:52:13","2020-07-13 16:52:13","1","1","32","1"),
("212","16","5","","0","0","355","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Did not receive the call.","","1","2020-07-14 11:15:00","1","2020-07-11 12:23:22","1970-01-01 05:30:00","2020-07-14 12:02:15","2020-07-14 12:02:15","1","1","32","1"),
("213","16","5","","0","0","177","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 14:05:00","1","2020-07-11 13:12:09","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 13:12:09","0","1","32","1"),
("214","16","5","","0","0","179","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 10:30:00","1","2020-07-11 13:24:28","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 13:24:28","0","1","32","1"),
("215","16","5","","0","0","374","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 11:55:00","1","2020-07-11 14:42:57","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 14:42:57","0","1","32","1"),
("216","16","5","","0","0","405","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 16:50:00","1","2020-07-11 15:54:16","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 15:54:16","0","1","32","1"),
("217","16","5","","0","0","401","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 16:10:00","1","2020-07-11 16:18:55","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 16:18:55","0","1","32","1"),
("218","16","5","","0","0","161","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 14:25:00","1","2020-07-11 16:30:23","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 16:30:23","0","1","32","1"),
("219","16","5","","0","0","175","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Demo arranged for next day at 10","","1","2020-07-13 16:05:00","1","2020-07-11 17:00:13","1970-01-01 05:30:00","2020-07-13 16:47:51","2020-07-14 10:48:03","1","1","32","1"),
("220","16","5","","0","0","435","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 13:05:00","1","2020-07-11 17:53:38","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-11 17:53:38","0","1","32","1"),
("221","16","5","","0","0","369","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Demo Done. Have to send  quotation for 3 users and online as well as offline. F/up call on 15th July","","1","2020-07-13 13:00:00","1","2020-07-11 18:17:30","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-14 13:59:16","0","1","32","1"),
("222","16","5","","0","0","459","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emni sathe vat thayi gayi che te excel ma thi bill bnave che emne aje demo mate  mlava nu che.","29","1","2020-07-13 15:00:00","2","2020-07-13 11:02:05","2020-07-13 15:00:00","2020-07-14 09:48:11","2020-07-14 09:48:11","1","1","29","1"),
("223","16","5","","0","0","431","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne call karya but te call no answer nathi aapta to emne aje call karva no che","29","1","2020-07-13 01:13:00","2","2020-07-13 11:15:01","2020-07-13 11:13:00","0000-00-00 00:00:00","2020-07-13 11:15:14","0","1","29","1"),
("224","16","5","","0","0","460","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Our s/w will not suit his requireement","","1","2020-07-14 09:30:00","4","2020-07-13 11:57:20","2020-07-14 09:15:00","2020-07-14 16:04:38","2020-07-14 16:04:38","1","1","32","1"),
("225","16","5","","0","0","461","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 11:05:00","4","2020-07-13 12:00:33","2020-07-14 10:50:00","2020-07-13 12:02:13","2020-07-13 12:02:13","1","1","32","1"),
("226","16","5","","0","0","235","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 11:05:00","4","2020-07-13 12:05:03","2020-07-14 10:50:00","0000-00-00 00:00:00","2020-07-13 12:05:03","0","1","32","1"),
("227","16","5","","0","0","463","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 12:45:00","4","2020-07-13 12:17:30","2020-07-14 12:30:00","0000-00-00 00:00:00","2020-07-13 12:17:30","0","1","32","1"),
("228","16","5","","0","0","43","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 13:25:00","4","2020-07-13 13:22:40","2020-07-14 13:10:00","0000-00-00 00:00:00","2020-07-13 13:22:40","0","1","32","1"),
("229","13","5","","0","0","465","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 14:05:00","1","2020-07-13 13:24:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 13:24:48","0","1","32","1"),
("230","16","5","","0","0","468","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-23 12:30:00","4","2020-07-13 13:36:37","2020-07-23 12:15:00","0000-00-00 00:00:00","2020-07-13 13:36:37","0","1","32","1"),
("231","16","5","","0","0","462","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 11:15:00","1","2020-07-13 15:15:41","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 15:15:41","0","1","32","1"),
("232","18","5","","0","0","469","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details whatsapp and also demo ","28","2","2020-07-14 11:05:00","2","2020-07-13 16:54:16","2020-07-14 11:05:00","0000-00-00 00:00:00","2020-07-13 16:58:53","0","1","33","1"),
("233","18","5","","0","0","470","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","27","1","2020-07-13 17:08:00","1","2020-07-13 17:08:20","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 17:08:20","0","1","1","1"),
("234","18","5","","0","0","469","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","online demo aapiyo che \n2 divas demo use karse","28","2","2020-07-13 17:16:00","1","2020-07-13 17:17:42","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 17:17:42","0","1","28","1"),
("235","16","5","","0","0","72","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","he is out of town due to social reasons.. need to call back for meeting after 3 days","","1","2020-07-16 10:50:00","2","2020-07-13 18:50:56","2020-07-16 10:50:00","0000-00-00 00:00:00","2020-07-13 18:50:56","0","1","27","1"),
("236","16","5","","0","0","473","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 14:25:00","1","2020-07-13 18:52:18","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 18:52:18","0","1","32","1"),
("237","16","5","","0","0","474","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Invalid Inquiry","","1","2020-07-14 13:25:00","1","2020-07-13 19:04:48","1970-01-01 05:30:00","2020-07-14 16:03:33","2020-07-14 16:03:33","1","1","32","1"),
("238","14","5","","0","0","43","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Create Quotation","29","1","2020-07-14 12:00:00","1","2020-07-13 19:11:11","1970-01-01 05:30:00","0000-00-00 00:00:00","2020-07-14 17:28:35","0","1","32","1"),
("239","16","5","","0","0","476","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 12:20:00","1","2020-07-13 19:16:47","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 19:16:47","0","1","32","1"),
("240","16","5","","0","0","477","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-08-11 11:10:00","1","2020-07-13 19:20:09","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 19:20:09","0","1","32","1"),
("241","16","5","","0","0","478","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Got reference of Mr Chetan. Called him but he was not free.","","1","2020-07-14 10:00:00","1","2020-07-13 19:23:11","1970-01-01 05:30:00","2020-07-14 17:31:27","2020-07-14 17:31:27","1","1","32","1"),
("242","16","5","","0","0","480","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-14 13:05:00","1","2020-07-13 19:30:05","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-13 19:30:05","0","1","32","1"),
("243","16","5","","0","0","481","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He requires quotation for Accounting s/w. Offline and one user needed.","","1","2020-07-14 11:30:00","1","2020-07-13 19:34:21","1970-01-01 05:30:00","2020-07-14 11:42:10","2020-07-14 11:42:10","1","1","32","1"),
("244","16","5","","0","0","482","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He disconnected the call","","1","2020-07-14 14:25:00","1","2020-07-13 19:38:00","1970-01-01 05:30:00","2020-07-14 15:24:01","2020-07-14 15:24:01","1","1","32","1"),
("245","16","5","","0","0","382","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Emne demo api didho che te week ni under printer layi ne pachi confirm karse.","29","1","2020-07-21 11:00:00","2","2020-07-14 09:53:50","2020-07-21 11:00:00","0000-00-00 00:00:00","2020-07-14 09:53:50","0","1","29","1"),
("246","16","5","","0","0","467","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He wants quotation for offline s/w. ","","1","2020-07-14 11:10:00","1","2020-07-14 10:26:57","1970-01-01 05:30:00","2020-07-14 17:26:38","2020-07-14 17:26:38","1","1","32","1"),
("247","16","5","","0","0","175","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","He was busy for the day. Have to call the next day for demo","","1","2020-07-14 16:30:00","1","2020-07-14 10:45:46","1970-01-01 05:30:00","2020-07-14 15:40:21","2020-07-14 15:40:21","1","1","32","1"),
("248","18","5","","0","0","471","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","Demo given to the client. he shared his requirement pdf. as per him our product covers 60% of his requirements.","","1","2020-07-15 10:45:00","2","2020-07-14 10:48:06","2020-07-15 10:45:00","2020-07-14 10:48:39","2020-07-14 10:48:39","1","1","27","1"),
("249","16","5","","0","0","369","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 11:55:00","1","2020-07-14 10:50:48","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 10:50:48","0","1","32","1"),
("250","16","5","","0","0","481","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 11:00:00","1","2020-07-14 11:43:08","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 11:43:08","0","1","32","1"),
("251","16","5","","0","0","348","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-16 12:00:00","1","2020-07-14 11:56:11","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 11:56:11","0","1","32","1"),
("252","18","5","","0","0","484","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","details are sends whatsapp","","2","2020-07-15 11:20:00","2","2020-07-14 12:50:10","2020-07-15 11:20:00","0000-00-00 00:00:00","2020-07-14 12:50:10","0","1","33","1"),
("253","16","5","","0","0","399","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-08-14 13:05:00","1","2020-07-14 13:06:55","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 13:06:55","0","1","32","1"),
("254","16","5","","0","0","397","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-16 14:05:00","1","2020-07-14 13:52:51","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 13:52:51","0","1","32","1"),
("255","16","5","","0","0","485","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 10:10:00","1","2020-07-14 14:21:21","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 14:21:21","0","1","32","1"),
("256","16","5","","0","0","486","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-16 15:05:00","1","2020-07-14 14:27:41","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 14:27:41","0","1","32","1"),
("257","16","5","","0","0","489","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 12:00:00","1","2020-07-14 14:49:19","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 14:49:19","0","1","32","1"),
("258","16","5","","0","0","490","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 15:05:00","1","2020-07-14 14:53:40","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 14:53:40","0","1","32","1"),
("259","16","5","","0","0","283","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-16 14:05:00","1","2020-07-14 15:23:47","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 15:23:47","0","1","32","1"),
("260","16","5","","0","0","175","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 10:30:00","1","2020-07-14 15:39:49","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 15:39:49","0","1","32","1"),
("261","16","5","","0","0","495","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 16:05:00","1","2020-07-14 15:55:45","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 15:55:45","0","1","32","1"),
("262","16","5","","0","0","492","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 16:10:00","1","2020-07-14 15:59:57","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 15:59:57","0","1","32","1"),
("263","18","5","","0","0","496","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","OLD COSTMER CHE AENE SOFT UDI GAYU CHE TO WEB ND SOFT AAPVANU CHE","28","1","2020-07-14 16:17:00","1","2020-07-14 16:24:19","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 16:24:19","0","1","28","1"),
("264","16","5","","0","0","487","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 16:10:00","1","2020-07-14 16:47:44","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 16:47:44","0","1","32","1"),
("265","16","5","","0","0","210","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-15 14:00:00","1","2020-07-14 17:06:42","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 17:06:42","0","1","32","1"),
("266","16","5","","0","0","168","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","","","1","2020-07-16 16:25:00","1","2020-07-14 17:16:02","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 17:16:02","0","1","32","1"),
("267","18","5","","0","0","68","","0","0000-00-00 00:00:00","0000-00-00 00:00:00","","CORNTINT MA CHE 10 DIVAS PAACHI CALL BACK AAPVANO","","1","2020-07-30 11:20:00","1","2020-07-14 17:22:59","0000-00-00 00:00:00","0000-00-00 00:00:00","2020-07-14 17:22:59","0","1","28","1");




CREATE TABLE `tbl_tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(50) NOT NULL,
  `tax_value` double NOT NULL,
  `tax_typeid` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;


INSERT INTO tbl_tax VALUES
("1","CGST 0%","0","0","2019-09-25 19:01:14","0","1","2","1"),
("2","SGST 0%","0","0","2019-09-25 19:01:19","0","1","2","1"),
("3","CGST 2.5%","2.5","0","2019-09-25 19:01:39","0","1","2","1"),
("4","SGST 2.5%","2.5","0","2019-09-25 19:01:43","0","1","2","1"),
("5","CGST 6%","6","0","2019-09-25 19:02:01","0","1","2","1"),
("6","SGST 6%","6","0","2019-09-25 19:02:05","0","1","2","1"),
("7","CGST 9%","9","0","2019-09-25 19:02:26","0","1","2","1"),
("8","SGST 9%","9","0","2019-09-25 19:02:30","0","1","2","1"),
("9","CGST 14%","14","0","2019-09-25 19:02:57","0","1","2","1"),
("10","SGST 14%","14","0","2019-09-25 19:03:03","0","1","2","1"),
("11","IGST 0%","0","0","2019-09-25 19:03:14","0","1","2","1"),
("12","IGST 5%","5","0","2019-09-25 19:03:20","0","1","2","1"),
("13","IGST 12%","12","0","2019-09-25 19:03:32","0","1","2","1"),
("14","IGST 28%","28","0","2019-09-25 19:03:47","0","1","2","1"),
("15","IGST 18%","18","0","2019-09-25 19:04:05","0","1","2","1");




CREATE TABLE `tbl_tax_trn` (
  `invtaxtrn_id` int(11) NOT NULL AUTO_INCREMENT,
  `mst_id` int(200) NOT NULL,
  `trn_id` int(11) NOT NULL,
  `tax_for` varchar(30) NOT NULL,
  `tax_id` varchar(200) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `tax_rate` double(10,2) NOT NULL,
  `trn_status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`invtaxtrn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;


INSERT INTO tbl_tax_trn VALUES
("5","0","21","invoice","5,4","1680.00","28.00","0","0"),
("6","0","21","invoice","5,4","840.00","14.00","0","0"),
("7","0","22","invoice","5,4","32760.00","28.00","0","0"),
("8","0","22","invoice","5,4","16380.00","14.00","0","0"),
("9","0","21","invoice","5,4","1680.00","28.00","0","0"),
("10","0","21","invoice","5,4","840.00","14.00","0","0"),
("11","0","22","invoice","5,4","32760.00","28.00","0","0"),
("12","0","22","invoice","5,4","16380.00","14.00","0","0"),
("13","18","24","invoice","5,4","31220.00","28.00","0","0"),
("14","18","24","invoice","5,4","15610.00","14.00","0","0"),
("15","22","44","expense","7","44.80","20.00","0","0"),
("16","22","44","expense","8","276541.44","123456.00","0","0"),
("17","22","45","expense","9","148.08","12.00","0","0"),
("18","23","48","expense","4","34.44","28.00","0","0"),
("19","23","49","expense","4","2520.00","28.00","0","0"),
("20","23","48","expense","5","17.22","14.00","0","0"),
("21","23","49","expense","5","1260.00","14.00","0","0"),
("22","24","51","expense","4","252.00","28.00","0","0"),
("23","24","51","expense","5","126.00","14.00","0","0"),
("24","24","52","expense","6","112.00","14.00","0","0"),
("25","9","9","income","6","280.00","14.00","0","0"),
("26","9","10","income","9","1080.00","12.00","0","0");




CREATE TABLE `tbl_tax_type` (
  `tax_typeid` int(11) NOT NULL AUTO_INCREMENT,
  `tax_type_name` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`tax_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO tbl_tax_type VALUES
("1","CGST","0"),
("2","SGST","0"),
("3","IGST","0"),
("4","CESS","0");




CREATE TABLE `tbl_terms_category` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_name` varchar(100) NOT NULL,
  `tc_status` int(11) NOT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_terms_condition` (
  `tc_id` int(10) NOT NULL AUTO_INCREMENT,
  `tc_name` varchar(255) NOT NULL,
  `tc_priority` int(11) NOT NULL,
  `tc_category` longtext NOT NULL,
  `tc_details` longtext NOT NULL,
  `tc_for` varchar(400) NOT NULL DEFAULT '0',
  `tc_allow` int(11) NOT NULL,
  `tc_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_timezone` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_abbr` varchar(250) NOT NULL,
  `t_name` varchar(250) NOT NULL,
  `t_utc_offset` varchar(250) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;


INSERT INTO tbl_timezone VALUES
("2","ACDT","Australian Central Daylight Savings Time","UTC+10:30"),
("3","ACST","Australian Central Standard Time","UTC+09:30"),
("4","ACT","Acre Time","UTC?05"),
("5","ACT","ASEAN Common Time (unofficial)","UTC+06:30 – UTC+09"),
("6","ACWST","Australian Central Western Standard Time (unofficial)","UTC+08:45"),
("7","ADT","Atlantic Daylight Time","UTC?03"),
("8","AEDT","Australian Eastern Daylight Savings Time","UTC+11"),
("9","AEST","Australian Eastern Standard Time","UTC+10"),
("10","AFT","Afghanistan Time","UTC+04:30"),
("11","AKDT","Alaska Daylight Time","UTC?08"),
("12","AKST","Alaska Standard Time","UTC?09"),
("13","ALMT","Alma-Ata Time[1]","UTC+06"),
("14","AMST","Amazon Summer Time (Brazil)[2]","UTC?03"),
("15","AMT","Amazon Time (Brazil)[3]","UTC?04"),
("16","AMT","Armenia Time","UTC+04"),
("17","ANAT","Anadyr Time[4]","UTC+12"),
("18","AQTT","Aqtobe Time[5]","UTC+05"),
("19","ART","Argentina Time","UTC?03"),
("20","AST","Arabia Standard Time","UTC+03"),
("21","AST","Atlantic Standard Time","UTC?04"),
("22","AWST","Australian Western Standard Time","UTC+08"),
("23","AZOST","Azores Summer Time","UTC±00"),
("24","AZOT","Azores Standard Time","UTC?01"),
("25","AZT","Azerbaijan Time","UTC+04"),
("26","BDT","Brunei Time","UTC+08"),
("27","BIOT","British Indian Ocean Time","UTC+06"),
("28","BIT","Baker Island Time","UTC?12"),
("29","BOT","Bolivia Time","UTC?04"),
("30","BRST","Brasília Summer Time","UTC?02"),
("31","BRT","Brasília Time","UTC?03"),
("32","BST","Bangladesh Standard Time","UTC+06"),
("33","BST","Bougainville Standard Time[6]","UTC+11"),
("34","BST","British Summer Time (British Standard Time from Feb 1968 to Oct 1971)","UTC+01"),
("35","BTT","Bhutan Time","UTC+06"),
("36","CAT","Central Africa Time","UTC+02"),
("37","CCT","Cocos Islands Time","UTC+06:30"),
("38","CDT","Central Daylight Time (North America)","UTC?05"),
("39","CDT","Cuba Daylight Time[7]","UTC?04"),
("40","CEST","Central European Summer Time (Cf. HAEC)","UTC+02"),
("41","CET","Central European Time","UTC+01"),
("42","CHADT","Chatham Daylight Time","UTC+13:45"),
("43","CHAST","Chatham Standard Time","UTC+12:45"),
("44","CHOT","Choibalsan Standard Time","UTC+08"),
("45","CHOST","Choibalsan Summer Time","UTC+09"),
("46","CHST","Chamorro Standard Time","UTC+10"),
("47","CHUT","Chuuk Time","UTC+10"),
("48","CIST","Clipperton Island Standard Time","UTC?08"),
("49","CIT","Central Indonesia Time","UTC+08"),
("50","CKT","Cook Island Time","UTC?10"),
("51","CLST","Chile Summer Time","UTC?03"),
("52","CLT","Chile Standard Time","UTC?04"),
("53","COST","Colombia Summer Time","UTC?04"),
("54","COT","Colombia Time","UTC?05"),
("55","CST","Central Standard Time (North America)","UTC?06"),
("56","CST","China Standard Time","UTC+08"),
("57","CST","Cuba Standard Time","UTC?05"),
("58","CT","China Time","UTC+08"),
("59","CVT","Cape Verde Time","UTC?01"),
("60","CWST","Central Western Standard Time (Australia) unofficial","UTC+08:45"),
("61","CXT","Christmas Island Time","UTC+07"),
("62","DAVT","Davis Time","UTC+07"),
("63","DFT","AIX-specific equivalent of Central European Time[NB 1]","UTC+01"),
("64","EASST","Easter Island Summer Time","UTC?05"),
("65","EAST","Easter Island Standard Time","UTC?06"),
("66","EAT","East Africa Time","UTC+03"),
("67","ECT","Eastern Caribbean Time (does not recognise DST)","UTC?04"),
("68","ECT","Ecuador Time","UTC?05"),
("69","EDT","Eastern Daylight Time (North America)","UTC?04"),
("70","EEST","Eastern European Summer Time","UTC+03"),
("71","EET","Eastern European Time","UTC+02"),
("72","EGST","Eastern Greenland Summer Time","UTC±00"),
("73","EGT","Eastern Greenland Time","UTC?01"),
("74","EIT","Eastern Indonesian Time","UTC+09"),
("75","EST","Eastern Standard Time (North America)","UTC?05"),
("76","FET","Further-eastern European Time","UTC+03"),
("77","FJT","Fiji Time","UTC+12"),
("78","FKST","Falkland Islands Summer Time","UTC?03"),
("79","FKT","Falkland Islands Time","UTC?04"),
("80","FNT","Fernando de Noronha Time","UTC?02"),
("81","GALT","Galápagos Time","UTC?06"),
("82","GAMT","Gambier Islands Time","UTC?09"),
("83","GET","Georgia Standard Time","UTC+04"),
("84","GFT","French Guiana Time","UTC?03"),
("85","GILT","Gilbert Island Time","UTC+12"),
("86","GIT","Gambier Island Time","UTC?09"),
("87","GMT","Greenwich Mean Time","UTC±00"),
("88","GST","South Georgia and the South Sandwich Islands Time","UTC?02"),
("89","GST","Gulf Standard Time","UTC+04"),
("90","GYT","Guyana Time","UTC?04"),
("91","HDT","Hawaii–Aleutian Daylight Time","UTC?09"),
("92","HST","Hawaii–Aleutian Standard Time","UTC?10"),
("93","HKT","Hong Kong Time","UTC+08"),
("94","HMT","Heard and McDonald Islands Time","UTC+05"),
("95","HOVST","Hovd Summer Time (not used from 2017-present)","UTC+08"),
("96","HOVT","Hovd Time","UTC+07"),
("97","ICT","Indochina Time","UTC+07"),
("98","IDLW","International Day Line West time zone","UTC?12"),
("99","IDT","Israel Daylight Time","UTC+03"),
("100","IOT","Indian Ocean Time","UTC+03"),
("101","IRDT","Iran Daylight Time","UTC+04:30");
INSERT INTO tbl_timezone VALUES
("102","IRKT","Irkutsk Time","UTC+08"),
("103","IRST","Iran Standard Time","UTC+03:30"),
("104","IST","Indian Standard Time","UTC+05:30"),
("105","IST","Irish Standard Time[8]","UTC+01"),
("106","IST","Israel Standard Time","UTC+02"),
("107","JST","Japan Standard Time","UTC+09"),
("108","KALT","Kaliningrad Time","UTC+02"),
("109","KGT","Kyrgyzstan Time","UTC+06"),
("110","KOST","Kosrae Time","UTC+11"),
("111","KRAT","Krasnoyarsk Time","UTC+07"),
("112","KST","Korea Standard Time","UTC+09"),
("113","LHST","Lord Howe Standard Time","UTC+10:30"),
("114","LHST","Lord Howe Summer Time","UTC+11"),
("115","LINT","Line Islands Time","UTC+14"),
("116","MAGT","Magadan Time","UTC+12"),
("117","MART","Marquesas Islands Time","UTC?09:30"),
("118","MAWT","Mawson Station Time","UTC+05"),
("119","MDT","Mountain Daylight Time (North America)","UTC?06"),
("120","MET","Middle European Time Same zone as CET","UTC+01"),
("121","MEST","Middle European Summer Time Same zone as CEST","UTC+02"),
("122","MHT","Marshall Islands Time","UTC+12"),
("123","MIST","Macquarie Island Station Time","UTC+11"),
("124","MIT","Marquesas Islands Time","UTC?09:30"),
("125","MMT","Myanmar Standard Time","UTC+06:30"),
("126","MSK","Moscow Time","UTC+03"),
("127","MST","Malaysia Standard Time","UTC+08"),
("128","MST","Mountain Standard Time (North America)","UTC?07"),
("129","MUT","Mauritius Time","UTC+04"),
("130","MVT","Maldives Time","UTC+05"),
("131","MYT","Malaysia Time","UTC+08"),
("132","NCT","New Caledonia Time","UTC+11"),
("133","NDT","Newfoundland Daylight Time","UTC?02:30"),
("134","NFT","Norfolk Island Time","UTC+11"),
("135","NOVT","Novosibirsk Time [9]","UTC+07"),
("136","NPT","Nepal Time","UTC+05:45"),
("137","NST","Newfoundland Standard Time","UTC?03:30"),
("138","NT","Newfoundland Time","UTC?03:30"),
("139","NUT","Niue Time","UTC?11"),
("140","NZDT","New Zealand Daylight Time","UTC+13"),
("141","NZST","New Zealand Standard Time","UTC+12"),
("142","OMST","Omsk Time","UTC+06"),
("143","ORAT","Oral Time","UTC+05"),
("144","PDT","Pacific Daylight Time (North America)","UTC?07"),
("145","PET","Peru Time","UTC?05"),
("146","PETT","Kamchatka Time","UTC+12"),
("147","PGT","Papua New Guinea Time","UTC+10"),
("148","PHOT","Phoenix Island Time","UTC+13"),
("149","PHT","Philippine Time","UTC+08"),
("150","PKT","Pakistan Standard Time","UTC+05"),
("151","PMDT","Saint Pierre and Miquelon Daylight Time","UTC?02"),
("152","PMST","Saint Pierre and Miquelon Standard Time","UTC?03"),
("153","PONT","Pohnpei Standard Time","UTC+11"),
("154","PST","Pacific Standard Time (North America)","UTC?08"),
("155","PST","Philippine Standard Time","UTC+08"),
("156","PYST","Paraguay Summer Time[10]","UTC?03"),
("157","PYT","Paraguay Time[11]","UTC?04"),
("158","RET","Réunion Time","UTC+04"),
("159","ROTT","Rothera Research Station Time","UTC?03"),
("160","SAKT","Sakhalin Island Time","UTC+11"),
("161","SAMT","Samara Time","UTC+04"),
("162","SAST","South African Standard Time","UTC+02"),
("163","SBT","Solomon Islands Time","UTC+11"),
("164","SCT","Seychelles Time","UTC+04"),
("165","SDT","Samoa Daylight Time","UTC?10"),
("166","SGT","Singapore Time","UTC+08"),
("167","SLST","Sri Lanka Standard Time","UTC+05:30"),
("168","SRET","Srednekolymsk Time","UTC+11"),
("169","SRT","Suriname Time","UTC?03"),
("170","SST","Samoa Standard Time","UTC?11"),
("171","SST","Singapore Standard Time","UTC+08"),
("172","SYOT","Showa Station Time","UTC+03"),
("173","TAHT","Tahiti Time","UTC?10"),
("174","THA","Thailand Standard Time","UTC+07"),
("175","TFT","French Southern and Antarctic Time[12]","UTC+05"),
("176","TJT","Tajikistan Time","UTC+05"),
("177","TKT","Tokelau Time","UTC+13"),
("178","TLT","Timor Leste Time","UTC+09"),
("179","TMT","Turkmenistan Time","UTC+05"),
("180","TRT","Turkey Time","UTC+03"),
("181","TOT","Tonga Time","UTC+13"),
("182","TVT","Tuvalu Time","UTC+12"),
("183","ULAST","Ulaanbaatar Summer Time","UTC+09"),
("184","ULAT","Ulaanbaatar Standard Time","UTC+08"),
("185","UTC","Coordinated Universal Time","UTC±00"),
("186","UYST","Uruguay Summer Time","UTC?02"),
("187","UYT","Uruguay Standard Time","UTC?03"),
("188","UZT","Uzbekistan Time","UTC+05"),
("189","VET","Venezuelan Standard Time","UTC?04"),
("190","VLAT","Vladivostok Time","UTC+10"),
("191","VOLT","Volgograd Time","UTC+04"),
("192","VOST","Vostok Station Time","UTC+06"),
("193","VUT","Vanuatu Time","UTC+11"),
("194","WAKT","Wake Island Time","UTC+12"),
("195","WAST","West Africa Summer Time","UTC+02"),
("196","WAT","West Africa Time","UTC+01"),
("197","WEST","Western European Summer Time","UTC+01"),
("198","WET","Western European Time","UTC±00"),
("199","WIT","Western Indonesian Time","UTC+07"),
("200","WST","Western Standard Time","UTC+08"),
("201","YAKT","Yakutsk Time","UTC+09");
INSERT INTO tbl_timezone VALUES
("202","YEKT","Yekaterinburg Time","UTC+05");




CREATE TABLE `tbl_usertype` (
  `usertype_id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_name` varchar(100) NOT NULL,
  `user_module` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `deletable` int(11) NOT NULL COMMENT '0:YES,1:No',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`usertype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO tbl_usertype VALUES
("1","Admin","","0","1","2018-10-12 04:00:10","1","0"),
("2","Company Admin","","0","1","2018-10-12 04:00:10","1","1"),
("3","SALES PERSON","","0","0","2020-06-18 18:05:50","1","1"),
("4","PRODUCTION COORDINATOR","","0","0","2020-06-18 18:05:45","1","1"),
("5","SALES COORDINATOR","","0","0","2020-06-18 18:05:09","1","1"),
("6","PRODUCATION HEAD","","0","0","2020-06-18 18:04:54","1","1"),
("7","SALES HEAD","","0","0","2020-06-18 18:04:33","1","1"),
("8","TELL CALLER","","0","0","2020-06-26 14:34:41","1","1");




CREATE TABLE `territory_mst` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(50) NOT NULL,
  `t_parent` int(10) NOT NULL,
  `t_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;


INSERT INTO territory_mst VALUES
("0","Primary","0","0","2019-11-23 15:08:59","1"),
("14","GUJARAT","13","2","2019-11-19 22:15:56","1"),
("15","AHMEDABAD","14","2","2019-09-04 15:17:23","1"),
("16","SIDHPUR","14","2","2019-11-22 15:22:43","1"),
("17","AHMEDABAD","14","0","2019-09-30 15:06:48","1"),
("18","NAVSARI","13","0","2019-09-30 17:57:22","1"),
("19","SURAT","14","0","2019-09-30 17:57:50","1"),
("20","RAJKOT","14","0","2019-11-19 22:15:33","1"),
("21","GUJARAT","16","0","2019-11-21 16:18:20","1"),
("22","AMRELI","21","0","2019-11-21 16:18:31","1"),
("23","MAHARASHTRA","16","0","2019-11-21 16:19:32","1");




CREATE TABLE `todo_mst` (
  `todo_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_detail` text NOT NULL,
  `date` date NOT NULL,
  `ref_id` int(11) NOT NULL,
  `ref_table` varchar(250) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`todo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `unit_mst` (
  `unitid` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) NOT NULL,
  `unit_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO unit_mst VALUES
("1","KG","2","2016-09-06 20:31:56","0","1"),
("2","PER","2","2016-09-06 20:32:01","0","1"),
("3","PCS","2","2018-10-31 12:43:57","1","2"),
("4","MTR","2","2016-10-04 21:34:54","0","1"),
("5","FOOTJJMM","2","2018-01-24 14:47:04","1","2"),
("6","NOS","0","2019-11-24 09:38:33","1","2"),
("7","LOT","2","2019-11-24 09:38:41","1","2"),
("8","M3","2","2019-11-24 10:13:46","1","2");




CREATE TABLE `users` (
  `user_id` double NOT NULL AUTO_INCREMENT,
  `user_name` text NOT NULL,
  `user_mail` varchar(100) NOT NULL,
  `user_key` varchar(500) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `user_phone` decimal(10,0) NOT NULL,
  `user_company` varchar(50) NOT NULL,
  `user_country` int(11) NOT NULL,
  `user_stat` tinyint(1) NOT NULL DEFAULT '1',
  `user_city` varchar(50) NOT NULL,
  `user_address` mediumtext NOT NULL,
  `print_align` int(11) NOT NULL,
  `user_rid` int(11) NOT NULL,
  `user_date` varchar(100) NOT NULL,
  `setup` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `user_tmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `question_id` text NOT NULL,
  `answer` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_fname` varchar(100) NOT NULL,
  `user_lname` varchar(100) NOT NULL,
  `roletype_id` int(11) NOT NULL,
  `h_sign` longtext NOT NULL,
  `user_report` varchar(100) NOT NULL,
  `usertype_form_date` date NOT NULL,
  `usertype_expiry_date` date NOT NULL,
  `usertype_timezone` varchar(100) NOT NULL,
  `usertype_currency` int(11) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `usertype_terr` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail` (`user_mail`,`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;


INSERT INTO users VALUES
("0","ADMIN","admin@metrtechnology.com","e6e061838856bf47e1de730719fb2609","1","7405409098","metR Technology","100","1","1","TEST ADDRESS","1","0","2020202057202d44435734434c4a443058583848","1","1","2018-10-31 16:12:42","0","","","0","0","0","","","0","","","0000-00-00","0000-00-00","","0","0","0"),
("1","BDS","bds","e6e061838856bf47e1de730719fb2609","2","7405409098","BDS","100","1","1","G-608  TITANIUM CITY CENTER, ANAND NAGAR ROAD, SATELITE, AHMEDABAD, GUJARAT, INDIA","0","1","2020202057202d44435734434c4a443058583848","1","1","2020-06-19 14:45:56","0","1u6i06NiO2hv3RTstsg04NpDKKDlDSNDuqflO1AF3c4=","nCz5LAWmBU7DTl+n62PK7tGdmLrf9F5xCImkQdxpoms=","0","1","0","","","0","","0","1970-01-01","1970-01-01","104","68","1","0"),
("26","SAURABH PATEL","s.patel@gmail.com","e6e061838856bf47e1de730719fb2609","5","9925519009","","100","1","1","AHMEDABAD","0","1","","0","1","2020-06-18 18:22:40","2","","","0","1","0","","","0","","1","2020-06-18","2021-06-18","104","68","0","17"),
("27","MIHIRBHATT","mihirbhatt@metrtechnology.com","03e34666768363c0031d844b1c5dc988","7","9328850777","","100","1","1","CHANDKHEDA AHEMDABAD 12346","0","1","","1","1","2020-07-08 00:21:19","0","","","0","1","0","","","0","","1","2020-06-17","2021-06-17","104","68","0","0,17"),
("28","RIYAZMEMON","riyaz.metr@gmail.com","e6e061838856bf47e1de730719fb2609","3","9924672444","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-08 00:21:04","0","","","0","1","0","","","0","","27","2020-06-18","2021-06-18","104","68","0","17"),
("29","BHARGAV","biz@metrtechnology.com","e6e061838856bf47e1de730719fb2609","3","9924371444","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-08 00:20:51","0","","","0","1","0","","","0","","27","2020-06-18","2020-06-18","104","68","0","17"),
("30","JIGANESHPATEL","j.patel@gmail.com","d918eba14de6f3eb58f13806d3492648","4","9016781302","","100","1","1","AHMEDABAD","0","1","","0","1","2020-07-08 00:20:37","2","","","0","1","0","","","0","","1","2020-06-18","2020-06-18","104","68","0","17"),
("31","HARSHIL","harshil@metrtechnology.com","ee58d2d5dcf2091754055abb207da94f","6","7405409098","","100","1","1","G608, TIANIUM CITY CENTER, BESIDE SACHIN TOWER,\\R\\NANAND NAGAR ROAD, SATELITE, AHMEDABAD, GUJARAT, INDIA","0","1","2020202057202d445857314a3143363236373932","1","1","2020-07-08 00:20:23","0","","","0","1","0","","","0","","30","2020-06-18","2020-06-18","104","68","0","17"),
("32","TORAL","toral@bigdatasuiet.in","9f11759b66fd81359452166546d3902c","3","7405409098","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-08 00:20:05","0","","","0","1","0","","","0","","27","2020-06-26","2021-06-26","104","68","0","17"),
("33","TC2","tc2@bds.in","82c6c5a251cfb3cfca39f693ae2f55d7","8","7405409098","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-08 00:19:50","0","","","0","1","0","","","0","","29","2020-06-26","2020-06-26","104","68","0","17"),
("34","TC1","tc1@bds.in","02ce988fe11b5235419bdc2f9e0c6d14","8","7405409098","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-08 00:19:35","0","","","0","1","0","","","0","","29","2020-06-26","2020-06-26","104","68","0","17"),
("35","IBS","ibs@bigdatasuiet.in","e6e061838856bf47e1de730719fb2609","8","7405409098","","100","1","1","AHMEDABAD","0","1","","0","1","2020-07-08 00:19:23","0","","","0","1","0","","","0","","27","2020-06-26","2020-06-26","104","68","0","17"),
("36","RUHANITECHNOLOGIES","ruhanitechnologies@gmail.com","627d4073139aeb0b874cbc34bc2e4cbb","5","1234567890","","100","1","1","AHMEDABAD","0","1","","1","1","2020-07-13 17:02:43","0","","","0","1","0","","","0","","0,1,27","2020-07-13","2020-07-13","104","68","0","0");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;