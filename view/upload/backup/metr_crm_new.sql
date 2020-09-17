SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--Database: `metr_crm_new`




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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;


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
("148","DANAM","16","0","2020-01-12 08:31:49","1","0");




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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO login_history VALUES
("1","1","2020-06-18 17:42:31","0000-00-00 00:00:00","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("2","1","2020-06-18 18:03:50","2020-06-18 19:20:49","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("3","31","2020-06-18 19:21:08","2020-06-18 19:21:21","27.57.162.146","CHROME","78","WINDOWS","BHOPAL","MADHYA PRADESH","INDIA","77.4045","23.2526"),
("4","1","2020-06-19 11:19:48","2020-06-19 14:34:54","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("5","1","2020-06-19 14:35:12","2020-06-19 14:39:26","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276"),
("6","1","2020-06-19 14:39:42","0000-00-00 00:00:00","27.57.184.4","CHROME","78","WINDOWS","AHMEDABAD","GUJARAT","INDIA","72.5871","23.0276");




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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO tbl_category VALUES
("1","CONSULTING","0","0","2019-11-19 20:51:54","1","1"),
("2","PROJECT","0","0","2019-11-19 20:51:34","1","1"),
("3","LABORATORY TESTING & REPORTING","0","0","2019-11-19 20:52:07","1","1"),
("4","GENERAL OFFICE RELATED","0","0","2019-12-28 10:23:23","1","1"),
("5","WEBSITE DEVELOPMENT","0","0","2020-01-01 15:57:43","1","1");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO tbl_cust_existing VALUES
("1","5","0","150 KL EFFLUENT TREATMENT PLANT","32","","2019","1","1"),
("2","38","0","","413","","2020","1","1"),
("3","212","0","FIREWALL AND LANE CONNECTION","467","","2020","1","1");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO tbl_db_backup VALUES
("1","2020-06-18 17:39:16","5","metr_crm_new___(18-06-2020 17)__rand.sql"),
("2","2020-06-18 19:20:48","5","metr_crm_new___(18-06-2020 19)__rand.sql"),
("3","2020-06-18 19:21:21","5","metr_crm_new___(18-06-2020 19)__rand.sql"),
("4","2020-06-19 14:34:54","5","metr_crm_new___(19-06-2020 14)__rand.sql"),
("5","2020-06-19 14:39:26","5","metr_crm_new___(19-06-2020 14)__rand.sql");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO tbl_followup VALUES
("1","1","CAll for meeting ","2019-11-18 15:24:38","0","2019-11-18 15:24:38","1","1"),
("2","30","I have call party Will do in the eveing ","2020-02-27 19:12:47","0","2020-02-27 19:12:47","1","1"),
("3","58","Mail done, waiting for confirmation mail.","2020-06-06 13:02:58","0","2020-06-06 13:02:58","10","1");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
("1","INQUIRY","14","0","1","1","INQ/19-20/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
("2","QUOTATION","1","0","2","3","QUO/","/19-20","1","0","2020-04-01 00:00:00","1","2","1"),
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
  PRIMARY KEY (`mcd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;


INSERT INTO tbl_master_category_detail VALUES
("2","1","DEVV","2","2019-09-09 22:44:11","1","1"),
("3","3","DDDD12","2","2019-09-09 23:57:23","1","1"),
("4","7","HOT","0","2019-09-18 17:34:22","1","1"),
("5","7","COLD","0","2019-09-18 17:34:40","1","1"),
("6","7","WARM","0","2019-09-18 17:35:21","1","1"),
("7","7","NOT APPLICABLE","0","2019-09-18 17:35:27","1","1"),
("8","8","EXISTING BUSINESS","0","2019-09-18 17:38:54","1","1"),
("9","8","NEW BUSINESS","0","2019-09-18 17:38:59","1","1"),
("10","9","SMALL BUSINESS","0","2019-09-18 17:44:09","1","1"),
("11","9","MEDIUM BUSINESS","0","2019-09-18 17:44:14","1","1"),
("12","9","LARGE BUSINESS","0","2019-09-18 17:44:21","1","1"),
("13","10","EMAIL ACTIVITY","0","2019-09-21 15:35:03","1","1"),
("14","10","GENERAL TASK","0","2019-09-21 15:35:20","1","1"),
("15","10","NEW QUOTATION CREATION","0","2019-09-21 15:35:40","1","1"),
("16","10","INQUIRY FOLLOW UP","0","2019-09-21 15:35:54","1","1"),
("17","10","OUTDOOR DUTY REPORT","0","2019-09-21 15:36:09","1","1"),
("18","10","PHONE ACTIVITY","0","2019-09-21 15:36:28","1","1"),
("19","10","QUOTATION FOLLOW UP","0","2019-09-21 15:36:57","1","1"),
("20","4","TEST CAT","0","2019-11-21 16:06:17","1","1");




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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;


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
("243","USER TYPE LIST","1","12","83","usertype_list","0","2020-06-18 15:25:34","0","");




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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO tbl_opportunity_mst VALUES
("2","SADAS","12","12","2","2019-09-09 12:23:45","1","1"),
("3","EEEE","12","12","2","2019-09-09 12:23:50","1","1"),
("4","CLOSED LOST","0","10","0","2019-09-09 12:43:30","1","1"),
("5","PROSPECTING","10","1","0","2019-12-28 06:23:20","1","1"),
("6","NOT APPLICABLE","15","11","1","2019-09-09 12:44:02","1","1"),
("7","QUALIFICATION","20","2","0","2019-12-28 06:23:25","1","1"),
("8","CLOSE WON","100","1","0","2019-09-30 18:05:17","1","1"),
("9","TECHNICAL STAGE","30","3","0","2019-12-28 06:24:40","1","1"),
("10","COMMERCIAL STAGE","4","40","0","2019-12-28 06:25:04","1","1"),
("11","NEGOTOATION STAGE","80","5","0","2019-12-28 06:25:39","1","1");




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
) ENGINE=InnoDB AUTO_INCREMENT=9955 DEFAULT CHARSET=latin1;


INSERT INTO tbl_permission VALUES
("7363","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7364","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7365","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7366","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7367","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7368","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7369","0","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:17:53","1"),
("7384","8","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
("7385","8","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
("7386","8","70","1","1","1","1","1","1","1","0","0","2019-09-03 11:44:14","1"),
("7387","8","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
("7388","8","180","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
("7389","8","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
("7390","8","0","1","0","0","0","0","0","0","0","0","2019-09-03 11:44:14","1"),
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
("9700","2","1","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:18","1"),
("9701","2","5","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9702","2","29","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9703","2","131","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9704","2","170","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9705","2","187","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9706","2","188","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9707","2","189","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9708","2","190","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9709","2","191","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1");
INSERT INTO tbl_permission VALUES
("9710","2","192","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9711","2","208","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9712","2","238","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9713","2","7","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9714","2","226","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9715","2","227","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9716","2","228","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9717","2","231","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9718","2","83","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9719","2","178","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9720","2","180","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9721","2","181","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9722","2","182","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9723","2","183","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9724","2","184","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9725","2","185","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9726","2","186","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9727","2","195","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9728","2","229","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9729","2","242","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9730","2","243","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9731","2","193","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:19","1"),
("9732","2","196","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9733","2","197","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9734","2","198","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9735","2","199","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9736","2","200","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9737","2","201","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9738","2","202","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9739","2","203","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9740","2","204","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9741","2","205","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9742","2","206","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9743","2","207","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9744","2","235","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9745","2","236","1","0","0","0","0","0","1","1","0","2020-06-18 15:53:20","1"),
("9746","3","1","1","0","0","0","0","0","0","0","0","2020-06-19 14:47:29","1"),
("9747","3","83","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:29","1"),
("9748","3","182","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9749","3","184","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9750","3","185","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9751","3","186","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9752","3","193","1","0","0","0","0","0","0","0","0","2020-06-19 14:47:30","1"),
("9753","3","196","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9754","3","197","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9755","3","198","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9756","3","199","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9757","3","200","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9758","3","201","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9759","3","202","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9760","3","203","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9761","3","204","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9762","3","205","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9763","3","206","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9764","3","207","1","0","0","0","0","0","1","0","0","2020-06-19 14:47:30","1"),
("9809","5","1","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9810","5","7","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9811","5","226","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9812","5","227","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9813","5","228","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9814","5","231","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9815","5","182","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9816","5","183","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9817","5","184","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9818","5","185","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9819","5","186","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9820","5","229","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9821","5","242","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9822","5","193","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9823","5","196","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9824","5","197","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9825","5","198","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9826","5","199","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9827","5","200","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9828","5","201","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9829","5","202","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9830","5","203","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9831","5","204","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9832","5","205","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:13","1"),
("9833","5","206","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:14","1"),
("9834","5","207","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:14","1"),
("9835","4","1","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9836","4","5","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9837","4","29","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9838","4","131","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9839","4","170","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9840","4","187","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9841","4","188","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9842","4","189","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9843","4","190","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9844","4","191","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9845","4","192","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9846","4","208","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9847","4","238","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9848","4","7","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9849","4","226","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9850","4","227","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9851","4","228","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9852","4","231","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9853","4","83","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1");
INSERT INTO tbl_permission VALUES
("9854","4","178","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:24","1"),
("9855","4","180","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9856","4","181","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9857","4","182","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9858","4","183","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9859","4","184","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9860","4","185","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9861","4","186","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9862","4","195","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9863","4","229","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9864","4","242","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9865","4","243","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9866","4","193","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9867","4","196","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9868","4","197","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9869","4","198","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9870","4","199","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9871","4","200","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9872","4","201","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9873","4","202","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9874","4","203","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9875","4","204","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9876","4","205","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9877","4","206","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9878","4","207","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9879","4","235","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9880","4","236","1","0","0","0","0","0","1","1","0","2020-06-19 14:50:25","1"),
("9881","6","1","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9882","6","5","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9883","6","29","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9884","6","131","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9885","6","170","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9886","6","187","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9887","6","188","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:35","1"),
("9888","6","189","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9889","6","190","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9890","6","191","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9891","6","192","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9892","6","208","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9893","6","238","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9894","6","7","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9895","6","226","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9896","6","227","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9897","6","228","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9898","6","231","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9899","6","83","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9900","6","178","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9901","6","180","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9902","6","181","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9903","6","182","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9904","6","183","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9905","6","184","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9906","6","185","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9907","6","186","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9908","6","195","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9909","6","229","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9910","6","242","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9911","6","243","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9912","6","193","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9913","6","196","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9914","6","197","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9915","6","198","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9916","6","199","1","0","0","0","0","0","1","0","0","2020-06-19 14:51:36","1"),
("9917","6","200","1","0","0","0","0","0","1","0","0","2020-06-19 14:51:36","1"),
("9918","6","201","1","0","0","0","0","0","1","0","0","2020-06-19 14:51:36","1"),
("9919","6","202","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9920","6","203","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9921","6","204","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9922","6","205","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9923","6","206","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:36","1"),
("9924","6","207","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:37","1"),
("9925","6","235","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:37","1"),
("9926","6","236","1","0","0","0","0","0","1","1","0","2020-06-19 14:51:37","1"),
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
("9943","7","198","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9944","7","199","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9945","7","200","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9946","7","201","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:58","1"),
("9947","7","202","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9948","7","203","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9949","7","204","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9950","7","205","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9951","7","206","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9952","7","207","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1"),
("9953","7","235","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1");
INSERT INTO tbl_permission VALUES
("9954","7","236","1","0","0","0","0","0","1","1","0","2020-06-19 14:53:59","1");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_product_brand` (
  `pb_id` int(10) NOT NULL AUTO_INCREMENT,
  `pb_name` varchar(255) NOT NULL,
  `pb_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_brand VALUES
("1","ASDSAD","2","2019-09-09 15:13:07","1","1"),
("2","DSF","2","2019-09-09 15:09:16","1","1"),
("3","JIO","2","2019-09-09 15:09:25","1","1"),
("4","ENVIRON","0","2019-09-09 15:13:42","1","1"),
("5","LUBI","0","2019-11-18 15:15:29","1","1"),
("6","COOL DECK","0","2019-11-18 15:15:36","1","1"),
("7","PENTIRE ","0","2019-11-18 15:15:50","1","1"),
("8","USHA ","0","2019-11-18 15:15:59","1","1"),
("9","WORDPRESS","0","2020-01-01 15:58:03","1","1");




CREATE TABLE `tbl_product_grp` (
  `pg_id` int(10) NOT NULL AUTO_INCREMENT,
  `pg_name` varchar(255) NOT NULL,
  `pg_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;


INSERT INTO tbl_product_grp VALUES
("1","DEMO1","2","2019-09-09 14:52:21","1","1"),
("2","VENDOR","2","2019-09-09 14:53:11","1","1"),
("3","NON-NABL REPORTING","0","2019-11-19 20:55:49","1","1"),
("4","NABL REPORTING","0","2019-11-19 20:56:16","1","1"),
("5","ASDSAD","2","2019-09-09 14:54:19","1","1"),
("6","HGHJG","2","2019-09-09 14:55:11","1","1"),
("7","ASDSADASDSAD","2","2019-09-09 14:56:15","1","1"),
("8","ENVIRONMENTAL AUDIT","0","2019-11-19 20:55:24","1","1"),
("9","ANNUAL MAINTENANCE CONTRACT","0","2019-11-19 20:53:55","1","1"),
("10","SADSAD","2","2019-09-09 15:04:32","1","1"),
("11","NOC/CCA","0","2019-11-19 20:53:33","1","1"),
("12","ANNUAL MAINTENANCE CONTRACT ( STP)","2","2019-11-18 17:50:05","1","1"),
("13","ANNUAL MAINTENANCE CONTRACT ( GPCB)","2","2019-11-18 17:50:18","1","1"),
("14","ENVIRONMENTAL CLEARANCE ","0","2019-11-19 20:53:11","1","1"),
("15","PROJECT CONSULTING ","0","2019-11-19 20:54:30","1","1"),
("16","EFFLUENT TREATMENT PLANT ","0","2019-11-19 20:57:15","1","1"),
("17","SEWAGE TREATMENT PLANT ","0","2019-11-19 20:57:40","1","1"),
("18","AIR POLLUTION CONTROL EQUIPMENT","0","2019-11-19 20:58:03","1","1"),
("19","GLASSWARE","0","2019-12-05 06:30:35","1","1"),
("20","REAGENT","0","2019-12-05 06:45:55","1","1"),
("21","CRM","0","2019-12-05 06:46:05","1","1"),
("22","STATIONARY ITEM","0","2019-12-28 10:23:53","1","1"),
("23"," LOCATION: ENV/OFFICE/ PROJECT","0","2020-01-15 14:16:34","1","1"),
("24"," LOCATION: ENV/OFFICE/LAB","0","2020-01-15 14:15:28","1","1"),
("25","ASSET (LABORATORY)","0","2020-01-27 11:50:07","1","1"),
("26","ASSET (OFFICE)","0","2020-02-13 18:05:38","1","1"),
("27","CONSULTING","0","2020-03-02 16:47:29","1","1"),
("28","CLEANING ITEM","0","2020-06-10 12:35:58","1","1"),
("29","GROCERY ITEM","0","2020-06-10 12:36:47","1","1");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `tbl_refer_by` (
  `rb_id` int(11) NOT NULL AUTO_INCREMENT,
  `rb_name` varchar(100) NOT NULL,
  `rb_status` int(11) NOT NULL,
  PRIMARY KEY (`rb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO tbl_refer_by VALUES
("1","BNI","0"),
("2","Cold Call","0"),
("3","Customer Referal","0"),
("4","Don\'t Know","0"),
("5","Exhibition","0"),
("6","Indiamart","0");




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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO tbl_usertype VALUES
("1","Admin","","0","1","2018-10-12 04:00:10","1","0"),
("2","Company Admin","","0","1","2018-10-12 04:00:10","1","1"),
("3","SALES PERSON","","0","0","2020-06-18 18:05:50","1","1"),
("4","PRODUCTION COORDINATOR","","0","0","2020-06-18 18:05:45","1","1"),
("5","SALES COORDINATOR","","0","0","2020-06-18 18:05:09","1","1"),
("6","PRODUCATION HEAD","","0","0","2020-06-18 18:04:54","1","1"),
("7","SALES HEAD","","0","0","2020-06-18 18:04:33","1","1");




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
("1","KG","0","2016-09-06 20:31:56","0","1"),
("2","PER","2","2016-09-06 20:32:01","0","1"),
("3","PCS","0","2018-10-31 12:43:57","1","2"),
("4","MTR","0","2016-10-04 21:34:54","0","1"),
("5","FOOTJJMM","2","2018-01-24 14:47:04","1","2"),
("6","NOS","0","2019-11-24 09:38:33","1","2"),
("7","LOT","0","2019-11-24 09:38:41","1","2"),
("8","M3","0","2019-11-24 10:13:46","1","2");




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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


INSERT INTO users VALUES
("0","ADMIN","admin@metrtechnology.com","e6e061838856bf47e1de730719fb2609","1","7405409098","metR Technology","100","1","1","TEST ADDRESS","1","0","2020202057202d44435734434c4a443058583848","1","1","2018-10-31 16:12:42","0","","","0","0","0","","","0","","","0000-00-00","0000-00-00","","0","0","0"),
("1","BDS","bds","e6e061838856bf47e1de730719fb2609","2","7405409098","BDS","100","1","1","G-608  TITANIUM CITY CENTER, ANAND NAGAR ROAD, SATELITE, AHMEDABAD, GUJARAT, INDIA","0","1","2020202057202d44435734434c4a443058583848","1","1","2020-06-19 14:45:56","0","1u6i06NiO2hv3RTstsg04NpDKKDlDSNDuqflO1AF3c4=","nCz5LAWmBU7DTl+n62PK7tGdmLrf9F5xCImkQdxpoms=","0","1","0","","","0","","0","1970-01-01","1970-01-01","104","68","1","0"),
("26","SAURABH PATEL","s.patel@gmail.com","e6e061838856bf47e1de730719fb2609","5","9925519009","","100","1","1","AHMEDABAD","0","1","","0","1","2020-06-18 18:22:40","0","","","0","1","0","","","0","","1","2020-06-18","2021-06-18","104","68","0","17"),
("27","MIHIRBHATT","mihirbhatt@metrtechnology.com","cafd46c7dc821eec4580578b1b1c7464","7","9328850777","","100","1","1","CHANGKHEDA AHEMDABAD 12346","0","1","","0","1","2020-06-18 18:50:35","0","","","0","1","0","","","0","","1,26","2020-06-17","2021-06-17","104","68","0","17"),
("28","RIYAZMEMON","riyaz.metr@gmail.com","6037a0dfe79ba2eb789a932d8f0d949c","3","9924672444","","100","1","1","AHMEDABAD","0","1","","0","1","2020-06-18 18:25:45","0","","","0","1","0","","","0","","1,26,27","2020-06-18","2021-06-18","104","68","0","17"),
("29","BHARGAV","biz@metrtechnology.com","9c9edd8e458ddac8d8ada328e456517f","3","9924371444","","100","1","1","AHMEDABAD","0","1","","0","1","2020-06-18 19:16:38","0","","","0","1","0","","","0","","1,26,27","2020-06-18","2020-06-18","104","68","0","17"),
("30","JIGANESHPATEL","j.patel@gmail.com","d918eba14de6f3eb58f13806d3492648","4","9016781302","","100","1","1","AHMEDABAD","0","1","","0","1","2020-06-18 19:18:39","0","","","0","1","0","","","0","","1","2020-06-18","2020-06-18","104","68","0","17"),
("31","HARSHIL","harshil@metrtechnology.com","ee58d2d5dcf2091754055abb207da94f","6","7405409098","","100","1","1","G608, TIANIUM CITY CENTER, BESIDE SACHIN TOWER,\\R\\NANAND NAGAR ROAD, SATELITE, AHMEDABAD, GUJARAT, INDIA","0","1","2020202057202d445857314a3143363236373932","1","1","2020-06-18 19:20:42","0","","","0","1","0","","","0","","1,30","2020-06-18","2020-06-18","104","68","0","17");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;