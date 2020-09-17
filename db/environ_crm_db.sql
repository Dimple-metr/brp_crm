-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2020 at 01:58 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `environ_crm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_mst`
--

DROP TABLE IF EXISTS `account_mst`;
CREATE TABLE IF NOT EXISTS `account_mst` (
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

-- --------------------------------------------------------

--
-- Table structure for table `account_voucher_mst`
--

DROP TABLE IF EXISTS `account_voucher_mst`;
CREATE TABLE IF NOT EXISTS `account_voucher_mst` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_voucher_mst`
--

INSERT INTO `account_voucher_mst` (`voucher_mstid`, `voucher_typeid`, `voucher_date`, `voucher_no`, `remark`, `g_total`, `mst_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 1, '2018-06-02', 'VCH-190', 'teeetet', '450.00', 0, '2018-06-16 01:25:16', 1, 1),
(2, 1, '2019-07-09', '900', 'sadasdsad', '324.00', 2, '2019-07-17 02:10:50', 1, 1),
(3, 1, '2019-07-17', '900', 'test 12', '900.00', 0, '2019-07-17 02:10:44', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_voucher_trn`
--

DROP TABLE IF EXISTS `account_voucher_trn`;
CREATE TABLE IF NOT EXISTS `account_voucher_trn` (
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

-- --------------------------------------------------------

--
-- Table structure for table `bank_mst`
--

DROP TABLE IF EXISTS `bank_mst`;
CREATE TABLE IF NOT EXISTS `bank_mst` (
  `bankid` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `bank_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_mst`
--

INSERT INTO `bank_mst` (`bankid`, `bank_name`, `bank_status`, `cdate`, `userid`, `company_id`) VALUES
(1, 'STATE BANK OF INDIA', 0, '2016-08-16 17:58:11', 0, 0),
(2, 'BANK OF BARODA', 0, '2016-11-28 13:50:02', 0, 0),
(3, 'BANK OF INDIA', 0, '2016-11-28 13:50:13', 0, 0),
(4, 'ICICI BANK', 0, '2016-11-28 13:50:20', 0, 0),
(5, 'HDFC BANK', 2, '2016-11-28 13:50:26', 0, 0),
(6, 'KOTAK BANK', 0, '2016-11-28 13:50:35', 0, 0),
(7, 'CENTRAL BANK OF INDIA', 0, '2016-11-28 13:50:44', 0, 0),
(8, 'DEUTSCHE BANK', 0, '2016-11-28 13:50:51', 0, 0),
(9, 'CANARA BANK', 0, '2016-11-28 13:51:01', 0, 0),
(10, 'THE VIJAY CO-OPERATIVE BANK LTD.', 0, '2017-11-15 06:01:04', 0, 0),
(15, 'THE NAVNIRMAN CO-OP. BANK LTD.', 0, '2017-03-27 11:33:28', 1, 0),
(16, 'BANK OF MAHARASHTRA', 0, '2017-04-11 07:28:37', 0, 0),
(17, 'PUNJAB NATIONAL BANK', 0, '2017-07-15 04:23:35', 2, 0),
(18, 'SYNDICATE BANK', 0, '2017-08-11 00:31:37', 1, 0),
(19, 'HJFKFI', 2, '2018-01-17 05:13:28', 1, 0),
(20, 'THE KALUPUR COMERCIAL CO-OPERATIV BANK LTD', 0, '2018-06-29 00:46:53', 1, 0),
(21, 'IDBI BANK', 0, '2018-07-10 01:11:19', 1, 0),
(22, 'ALLAHABAD BANK', 0, '2018-07-10 01:11:27', 1, 0),
(23, 'ANDHRA BANK', 0, '2018-07-10 01:11:33', 1, 0),
(24, 'CORPORATION BANK', 0, '2018-07-10 01:12:29', 1, 0),
(25, 'DENA BANK', 0, '2018-07-10 01:12:36', 1, 0),
(26, 'INDIAN BANK', 0, '2018-07-10 01:12:44', 1, 0),
(27, 'AXIS BANK LIMITED', 0, '2018-07-10 01:12:52', 1, 0),
(28, 'BANDHAN BANK LIMITED', 0, '2018-07-10 01:12:59', 1, 0),
(29, 'CATHOLIC SYRIAN BANK LIMITED', 0, '2018-07-10 01:13:08', 1, 0),
(30, 'CITY UNION BANK LIMITED', 0, '2018-07-10 01:13:16', 1, 0),
(31, 'DCB BANK LIMITED', 0, '2018-07-10 01:13:21', 1, 0),
(32, 'DHANLAXMI BANK LIMITED', 0, '2018-07-10 01:13:32', 1, 0),
(33, 'FEDERAL BANK LIMITED', 0, '2018-07-10 01:13:40', 1, 0),
(34, 'HDFC BANK LIMITED', 0, '2018-07-10 01:13:47', 1, 0),
(35, 'ICICI BANK LIMITED', 0, '2018-07-10 01:13:56', 1, 0),
(36, 'INDUSIND BANK LIMITED', 0, '2018-07-10 01:14:08', 1, 0),
(37, 'JAMMU & KASHMIR BANK LIMITED', 0, '2018-07-10 01:14:26', 1, 0),
(38, 'KARNATAKA BANK LIMITED', 0, '2018-07-10 03:11:18', 1, 0),
(39, 'KARUR VYSYA BANK LIMITED', 0, '2018-07-10 03:11:25', 1, 0),
(40, 'KOTAK MAHINDRA BANK LIMITED', 0, '2018-07-10 03:11:32', 1, 0),
(41, 'LAKSHMI VILAS BANK LIMITED', 0, '2018-07-10 03:11:42', 1, 0),
(42, 'NAINITAL BANK LIMITED', 0, '2018-07-10 03:11:51', 1, 0),
(43, 'RBL BANK LIMITED', 0, '2018-07-10 03:12:05', 1, 0),
(44, 'SOUTH INDIAN BANK LIMITED', 0, '2018-07-10 03:12:12', 1, 0),
(45, 'TAMILNAD MERCANTILE BANK LIMITED', 0, '2018-07-10 03:12:21', 1, 0),
(46, 'YES BANK LIMITED', 0, '2018-07-10 03:12:28', 1, 0),
(47, 'AU SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:12:50', 1, 0),
(48, 'CAPITAL SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:12:59', 1, 0),
(49, 'FINCARE SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:07', 1, 0),
(50, 'EQUITAS SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:23', 1, 0),
(51, 'ESAF SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:32', 1, 0),
(52, 'SURYODAY SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:38', 1, 0),
(53, 'UJJIVAN SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:46', 1, 0),
(54, 'UTKARSH SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:13:53', 1, 0),
(55, 'NORTH EAST SMALL FINANCE BANK LIMITED', 0, '2018-07-10 03:14:02', 1, 0),
(56, 'AIRTEL PAYMENTS BANK LIMITED', 0, '2018-07-10 03:14:11', 1, 0),
(57, 'INDIA POST PAYMENTS BANK LIMITED', 0, '2018-07-10 03:14:23', 1, 0),
(58, 'FINO PAYMENTS BANK LIMITED', 0, '2018-07-10 03:14:31', 1, 0),
(59, 'PAYTM PAYMENTS BANK LIMITED', 0, '2018-07-10 03:14:37', 1, 0),
(60, 'ANDHRA PRADESH STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:15:14', 1, 0),
(61, 'THE BIHAR STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:15:26', 1, 0),
(62, 'CHHATISGARH RAJYA SAHAKARI BANK MARYADIT', 0, '2018-07-10 03:15:33', 1, 0),
(63, 'THE GOA STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:15:41', 1, 0),
(64, 'THE GUJARAT STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:15:50', 1, 0),
(65, 'HARYANA RAJYA SAHAKARI BANK LTD.', 0, '2018-07-10 03:15:58', 1, 0),
(66, 'HIMACHAL PRADESH STATE COOPERATIVE BANK LTD.', 0, '2018-07-10 03:16:04', 1, 0),
(67, 'KARNATAKA STATE CO-OPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:16:13', 1, 0),
(68, 'KERALA STATE C-OPERATIVE BANK LTD.', 0, '2018-07-10 03:16:21', 1, 0),
(69, 'MADHYA PRADESH RAJYA SAHAKARI BANK MARYADIT', 0, '2018-07-10 03:16:29', 1, 0),
(70, 'THE MAHARASHTRA STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:16:37', 1, 0),
(71, '	THE ORISSA STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:16:42', 1, 0),
(72, 'PONDICHERRY STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:16:48', 1, 0),
(73, 'PUNJAB STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:16:54', 1, 0),
(74, 'THE RAJASTHAN STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:17:01', 1, 0),
(75, 'TAMIL NADU STATE APEX CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:17:11', 1, 0),
(76, 'THE UTTAR PRADESH CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:17:17', 1, 0),
(77, 'UTTARAKHAND STATE COOPERATIVE BANK LTD.', 0, '2018-07-10 03:17:25', 1, 0),
(78, 'WEST BENGAL STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:17:32', 1, 0),
(79, 'ANDAMAN AND NICOBAR STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:17:48', 1, 0),
(80, 'ARUNACHAL STATE CO-OPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:17:54', 1, 0),
(81, 'ASSAM CO-OPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:17:59', 1, 0),
(82, '	CHANDIGARH STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:18:04', 1, 0),
(83, 'DELHI STATE COOPERATIVE BANK LTD.', 0, '2018-07-10 03:18:10', 1, 0),
(84, 'JAMMU AND KASHMIR STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:18:15', 1, 0),
(85, 'JHARKHAND STATE COOPERATIVE BANK LTD.', 0, '2018-07-10 03:18:21', 1, 0),
(86, 'MANIPUR STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:18:28', 1, 0),
(87, 'MEGHALAYA CO-OPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:18:34', 1, 0),
(88, 'MIZORAM CO-OPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:18:40', 1, 0),
(89, 'NAGALAND STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:18:48', 1, 0),
(90, 'SIKKIM STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:18:54', 1, 0),
(91, 'TELANGANA STATE COOPERATIVE APEX BANK LTD.', 0, '2018-07-10 03:19:03', 1, 0),
(92, 'TRIPURA STATE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:19:11', 1, 0),
(93, 'AHMEDABAD MERCANTILE CO-OP BANK LTD.', 0, '2018-07-10 03:19:30', 1, 0),
(94, 'KALUPUR COMMERCIAL COOP.BANK LTD.', 0, '2018-07-10 03:19:37', 1, 0),
(95, 'MEHSANA URBAN CO-OP BANK LTD.', 0, '2018-07-10 03:19:45', 1, 0),
(96, 'NUTAN NAGARIK SAHAKARI BANK LTD., AHMEDABAD', 0, '2018-07-10 03:19:52', 1, 0),
(97, 'RAJKOT NAGRIK SAHAKARI BANK LTD.', 0, '2018-07-10 03:19:58', 1, 0),
(98, 'SARDAR BHILADWALA PARDI PEOPLES COOP BANK LTD.', 0, '2018-07-10 03:20:05', 1, 0),
(99, 'SURAT PEOPLES COOP BANK LTD.', 0, '2018-07-10 03:20:13', 1, 0),
(100, 'AMANATH CO-OPERATIVE BANK LTD. BANGALORE', 0, '2018-07-10 03:20:19', 1, 0),
(101, 'ANDHRA PRADESH MAHESH CO-OP URBAN BANK LTD.', 0, '2018-07-10 03:20:26', 1, 0),
(102, 'INDIAN MERCANTILE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:20:32', 1, 0),
(103, 'ABHYUDAYA CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:20:39', 1, 0),
(104, 'APNA SAHAKARI BANK LTD.', 0, '2018-07-10 03:20:45', 1, 0),
(105, 'BASSEIN CATHOLIC CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:20:55', 1, 0),
(106, 'BHARAT CO-OPERATIVE BANK (MUMBAI) LTD., MUMBAI', 0, '2018-07-10 03:21:00', 1, 0),
(107, 'BHARATI SAHAKARI BANK LIMITED.', 0, '2018-07-10 03:21:07', 1, 0),
(108, 'BOMBAY MERCANTILE CO-OPERATIVE BANK LIMITED', 0, '2018-07-10 03:21:14', 1, 0),
(109, 'CITIZEN CREDIT CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:21:20', 1, 0),
(110, 'COSMOS CO-OPERATIVE BANK LTD', 0, '2018-07-10 03:21:27', 1, 0),
(111, 'DOMBIVLI NAGARI SAHAKARI BANK LTD.', 0, '2018-07-10 03:21:33', 1, 0),
(112, 'GOPINATH PATIL PARSIK JANATA SAHAKARI BANK LTD., THANE', 0, '2018-07-10 03:21:43', 1, 0),
(113, 'GREATER BOMBAY CO-OPERATIVE BANK LIMITED', 0, '2018-07-10 03:21:51', 1, 0),
(114, 'JALGAON JANATA SAHAKARI BANK LTD.', 0, '2018-07-10 03:21:57', 1, 0),
(115, 'JALGAON PEOPLE\\\'S CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:22:03', 1, 0),
(116, 'JANAKALYAN SAHAKARI BANK LTD., MUMBAI', 0, '2018-07-10 03:22:09', 1, 0),
(117, 'JANATA SAHAKARI BANK LTD., PUNE.', 0, '2018-07-10 03:22:28', 1, 0),
(118, '	KALLAPPANNA AWADE ICHALKARANJI JANATA SAHAKARI BANK LTD', 0, '2018-07-10 03:22:34', 1, 0),
(119, 'KALYAN JANATA SAHAKARI BANK LTD., KALYAN', 0, '2018-07-10 03:22:42', 1, 0),
(120, '	KAPOL CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:22:47', 1, 0),
(121, 'KARAD URBAN CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:22:52', 1, 0),
(122, 'MAHANAGAR CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:22:59', 1, 0),
(123, 'NAGAR URBAN CO-OPERATIVE BANK LTD., AHMEDNAGAR', 0, '2018-07-10 03:23:08', 1, 0),
(124, 'NASIK MERCHANT\\\'S CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:23:14', 1, 0),
(125, 'NEW INDIA CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:23:20', 1, 0),
(126, 'NKGSB CO-OPERATIVE BANK LTD., MUMBAI', 0, '2018-07-10 03:23:27', 1, 0),
(127, 'PRAVARA SAHAKARI BANK LTD.', 0, '2018-07-10 03:23:34', 1, 0),
(128, 'PUNJAB & MAHARASHTRA CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:23:43', 1, 0),
(129, 'RAJARAMBAPU SAHAKARI BANK LTD.', 0, '2018-07-10 03:23:51', 1, 0),
(130, 'RUPEE CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:23:59', 1, 0),
(131, 'SANGLI URBAN CO-OPERATIVE BANK LTD., SANGLI', 0, '2018-07-10 03:24:04', 1, 0),
(132, 'SARASWAT CO-OPERATIVE BANK LTD., BOMBAY', 0, '2018-07-10 03:24:10', 1, 0),
(133, 'SHAMRAO VITHAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:24:16', 1, 0),
(134, 'SOLAPUR JANATA SAHAKARI BANK LTD.', 0, '2018-07-10 03:24:23', 1, 0),
(135, 'THANE BHARAT SAHAKARI BANK LTD.', 0, '2018-07-10 03:24:33', 1, 0),
(136, 'TJSB SAHAKARI BANK', 0, '2018-07-10 03:24:39', 1, 0),
(137, 'VASAI VIKAS SAHAKARI BANK LTD.', 0, '2018-07-10 03:24:45', 1, 0),
(138, 'NAGPUR NAGRIK SAHAKARI BANK LTD.', 0, '2018-07-10 03:24:56', 1, 0),
(139, 'AHMEDABAD DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:26:28', 1, 0),
(140, 'AMRELI JILLA MADHYASTH SAHAKARI BANK MARYADIT', 0, '2018-07-10 03:26:34', 1, 0),
(141, 'BANASKANTHA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:26:40', 1, 0),
(142, 'BARODA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:26:45', 1, 0),
(143, 'BHAVANAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:26:50', 1, 0),
(144, 'BROACH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:26:55', 1, 0),
(145, 'JAMNAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:01', 1, 0),
(146, 'JUNAGADH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:07', 1, 0),
(147, 'KACHCHH DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:13', 1, 0),
(148, 'KAIRA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:20', 1, 0),
(149, '	KODINAR TALUKA CO-OPERATIVE BANKING UNION LTD.', 0, '2018-07-10 03:27:26', 1, 0),
(150, 'MEHSANA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:35', 1, 0),
(151, 'PANCHMAHALS DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:40', 1, 0),
(152, 'SABARKANTHA DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:47', 1, 0),
(153, 'SHRI RAJKOT DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:27:53', 1, 0),
(154, 'SURAT DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:28:00', 1, 0),
(155, 'SURENDRANAGAR DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:28:05', 1, 0),
(156, 'VALSAD DISTRICT CENTRAL CO-OPERATIVE BANK LTD.', 0, '2018-07-10 03:28:11', 1, 0),
(157, 'DENA GUJARAT GRAMIN BANK', 0, '2018-07-10 03:28:52', 1, 0),
(158, 'CASH-SELF', 0, '2016-12-01 13:28:56', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch_mst`
--

DROP TABLE IF EXISTS `branch_mst`;
CREATE TABLE IF NOT EXISTS `branch_mst` (
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_mst`
--

INSERT INTO `branch_mst` (`branch_id`, `branch_user_id`, `branch_name`, `branch_email`, `branch_password`, `branch_address`, `countryid`, `stateid`, `cityid`, `branch_pincode`, `branch_status`, `cdate`, `user_id`, `usertype_id`, `company_id`) VALUES
(1, 2, 'BRANCH 1 AHM', 'abhi.metr@gmail.com', 'abhi@123', 'PO BOX #990', 101, 1, 1, '319999', 2, '2019-06-20 04:13:27', 1, 2, 1),
(2, 0, 'BRANCH 2 AHM', '', '', 'kathvada', 101, 1, 1, '380015', 2, '2019-06-20 04:15:32', 1, 2, 1),
(3, 0, 'ARCHANA ESTATE ', '', '', '', 101, 1, 1, '', 0, '2019-07-30 09:38:26', 1, 2, 1),
(4, 0, 'CUTTING ROOM', '', '', 'M B Complex', 101, 1, 1, '', 0, '2019-07-30 09:41:14', 1, 2, 1),
(5, 0, 'REXINE STOCK ', '', '', 'M B Complex', 101, 1, 1, '', 0, '2019-07-30 09:41:00', 1, 2, 1),
(6, 0, 'NEHA TRADERS SHOP', '', '', 'M B Complex', 101, 1, 1, '', 0, '2019-07-30 09:41:55', 1, 2, 1),
(7, 0, 'AYESHA BAGS', '', '', 'Jamalpur', 101, 1, 1, '', 0, '2019-07-30 09:44:07', 1, 2, 1),
(8, 0, 'Head Office', '', '', '', 0, 0, 0, '', 1, '2018-10-12 05:11:35', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city_mst`
--

DROP TABLE IF EXISTS `city_mst`;
CREATE TABLE IF NOT EXISTS `city_mst` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `stateid` int(11) NOT NULL,
  `city_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city_mst`
--

INSERT INTO `city_mst` (`cityid`, `city_name`, `stateid`, `city_status`, `cdate`, `userid`, `usertype_id`) VALUES
(1, 'AHMEDABAD', 1, 0, '2016-11-10 09:01:03', 0, 1),
(2, 'AMRELI', 1, 0, '2016-11-10 09:03:32', 0, 1),
(3, 'ANAND', 1, 0, '2016-11-10 09:05:29', 0, 1),
(4, 'ANJAR', 1, 0, '2016-11-10 09:05:40', 0, 1),
(5, 'ANKLAV', 1, 0, '2016-11-10 09:02:37', 0, 1),
(6, 'ANKLESVAR', 1, 0, '2016-11-10 09:02:33', 0, 1),
(7, 'BABRA', 1, 0, '2016-11-10 09:08:55', 0, 1),
(8, 'BAGASARA', 1, 0, '2016-11-10 09:17:36', 0, 1),
(9, 'BALASINOR', 1, 0, '2016-11-10 09:18:25', 0, 1),
(10, 'BARDOLI', 1, 0, '2016-11-10 09:18:12', 0, 1),
(11, 'BHABHAR', 1, 0, '2016-11-10 09:18:00', 0, 1),
(12, 'BHACHAU', 1, 0, '2016-11-10 09:17:48', 0, 1),
(13, 'BHANVAD', 1, 0, '2016-11-10 09:17:14', 0, 1),
(14, 'BHARACHA(BROACH)', 1, 0, '2016-11-10 09:16:59', 0, 1),
(15, 'BHAVNAGARA(BHAUNAGAR)', 1, 0, '2016-11-10 09:09:34', 0, 1),
(16, 'BHUJ', 1, 0, '2016-11-10 09:16:44', 0, 1),
(17, 'BALAMORA', 1, 0, '2016-11-10 09:14:22', 0, 1),
(18, 'BORSAD', 1, 0, '2016-11-10 09:14:59', 0, 1),
(19, 'BOTAD', 1, 0, '2016-11-10 09:11:39', 0, 1),
(20, 'CHAKLASI', 1, 0, '2016-11-10 09:02:28', 0, 1),
(21, 'CHALTHAN', 1, 0, '2016-11-10 09:16:33', 0, 1),
(22, 'CHHOTA UDAIPUR', 1, 0, '2016-11-10 09:13:15', 0, 1),
(23, 'CHORVAD', 1, 0, '2016-11-10 09:12:52', 0, 1),
(24, 'CHOTILA', 1, 0, '2016-11-10 09:11:25', 0, 1),
(25, 'DABHOI', 1, 0, '2016-11-10 09:10:59', 0, 1),
(26, 'DAHGAM', 1, 0, '2016-11-10 09:10:44', 0, 1),
(27, 'DAHOD', 1, 0, '2016-11-10 09:10:08', 0, 1),
(28, 'DAKOR', 1, 0, '2016-11-10 09:02:23', 0, 1),
(29, 'DEVGADBARIA', 1, 0, '2016-11-10 09:05:48', 0, 1),
(30, 'DHANDHUKA', 1, 0, '2016-11-10 09:02:19', 0, 1),
(31, 'DHANERA', 1, 0, '2016-11-10 09:09:49', 0, 1),
(32, 'DHARAMPUR', 1, 0, '2016-11-10 09:09:10', 0, 1),
(33, 'DHOLKA', 1, 0, '2016-11-10 09:02:14', 0, 1),
(34, 'DHORAJI', 1, 0, '2016-11-10 09:00:27', 0, 1),
(35, 'DHRANGADHRA', 1, 0, '2016-11-10 09:08:38', 0, 1),
(36, 'DHROL', 1, 0, '2016-11-10 09:08:25', 0, 1),
(37, 'DISA', 1, 0, '2016-11-10 09:08:15', 0, 1),
(38, 'DWARKA(DVARAKA)', 1, 0, '2016-11-10 09:02:09', 0, 1),
(39, 'GADHADA', 1, 0, '2016-11-10 09:07:09', 0, 1),
(40, 'GANDHIDHAM', 1, 0, '2016-11-10 09:06:54', 0, 1),
(41, 'GARIADHAR', 1, 0, '2016-11-10 09:06:35', 0, 1),
(42, 'GODHRA', 1, 0, '2016-11-10 09:06:05', 0, 1),
(43, 'GONDAL', 1, 0, '2016-11-10 09:05:05', 0, 1),
(44, 'HALOL', 1, 0, '2016-11-10 09:05:23', 0, 1),
(45, 'HALVAD', 1, 0, '2016-11-10 09:04:51', 0, 1),
(46, 'HARIJ', 1, 0, '2016-11-10 08:57:56', 0, 1),
(47, 'HIMATNAGAR', 1, 0, '2016-11-10 09:04:38', 0, 1),
(48, 'IDAR', 1, 0, '2016-11-10 09:03:53', 0, 1),
(49, 'JAFARABAD', 1, 0, '2016-11-10 08:57:48', 0, 1),
(50, 'JAMBUSAR', 1, 0, '2016-11-10 09:03:42', 0, 1),
(51, 'JAMJODHPUR', 1, 0, '2016-11-10 08:57:36', 0, 1),
(52, 'JAMNAGAR', 1, 0, '2016-11-10 08:57:31', 0, 1),
(53, 'JASDAN', 1, 0, '2016-11-10 09:03:15', 0, 1),
(54, 'JETPUR NAVAGADH', 1, 0, '2016-11-10 09:03:01', 0, 1),
(55, 'JHADESHWAR', 1, 0, '2016-11-10 09:02:52', 0, 1),
(56, 'JHALOD', 1, 0, '2016-11-10 08:57:25', 0, 1),
(57, 'JUNAGADH', 1, 0, '2016-11-10 08:57:18', 0, 1),
(58, 'KADI', 1, 0, '2016-11-10 09:02:03', 0, 1),
(59, 'KADODARA', 1, 0, '2016-11-10 09:01:56', 0, 1),
(60, 'KALAVAD', 1, 0, '2016-11-10 08:57:05', 0, 1),
(61, 'KALOL', 1, 0, '2016-11-10 08:56:44', 0, 1),
(62, 'KAPADVANJ', 1, 0, '2016-11-10 09:01:51', 0, 1),
(63, 'KARJAN', 1, 0, '2016-11-10 09:01:46', 0, 1),
(64, 'KATHLAL', 1, 0, '2016-11-10 08:56:37', 0, 1),
(65, 'KESHOD', 1, 0, '2016-11-10 09:01:37', 0, 1),
(66, 'KHAMBHALIYA', 1, 0, '2016-11-10 08:55:54', 0, 1),
(67, 'KHAMBHAT', 1, 0, '2016-11-10 08:55:34', 0, 1),
(68, 'KHEDA', 1, 0, '2016-11-10 09:01:42', 0, 1),
(69, 'KHED BRAHMA', 1, 0, '2016-11-10 09:01:29', 0, 1),
(70, 'KHERALU', 1, 0, '2016-11-10 08:55:27', 0, 1),
(71, 'KODANAR', 1, 0, '2016-11-10 08:54:40', 0, 1),
(72, 'KOSAMBA-TARSADI', 1, 0, '2016-11-10 09:01:10', 0, 1),
(73, 'LATHI', 1, 0, '2016-11-10 08:54:20', 0, 1),
(74, 'LIMBDI', 1, 0, '2016-11-10 09:01:20', 0, 1),
(75, 'LUNAWADA', 1, 0, '2016-11-10 08:54:04', 0, 1),
(76, 'MAHEMDAVAD', 1, 0, '2016-11-10 08:53:38', 0, 1),
(77, 'MAHESANA', 1, 0, '2016-11-10 08:53:31', 0, 1),
(78, 'MAHUVA', 1, 0, '2016-11-10 08:59:41', 0, 1),
(79, 'MANAVADAR', 1, 0, '2016-11-10 08:53:19', 0, 1),
(80, 'MANDVI', 1, 0, '2016-11-10 08:52:52', 0, 1),
(81, 'MANGROL', 1, 0, '2016-11-10 08:52:46', 0, 1),
(82, 'MANSA', 1, 0, '2016-11-10 08:52:29', 0, 1),
(83, 'MODASA', 1, 0, '2016-11-10 08:52:23', 0, 1),
(84, 'MORVI', 1, 0, '2016-11-10 09:00:20', 0, 1),
(85, 'MUNDRA', 1, 0, '2016-11-10 09:00:14', 0, 1),
(86, 'NADIAD', 1, 0, '2016-11-10 08:52:15', 0, 1),
(87, 'NAVSARI', 1, 0, '2016-11-10 08:49:11', 0, 1),
(88, 'ODE', 1, 0, '2016-11-10 09:00:05', 0, 1),
(89, 'OKHA', 1, 0, '2016-11-10 08:59:55', 0, 1),
(90, 'PADRA', 1, 0, '2016-11-10 08:59:47', 0, 1),
(91, 'PALANPUR', 1, 0, '2016-11-10 08:49:02', 0, 1),
(92, 'PALITANA', 1, 0, '2016-11-10 08:48:57', 0, 1),
(93, 'PARDI', 1, 0, '2016-11-10 08:48:43', 0, 1),
(94, 'PATAN', 1, 0, '2016-11-10 08:48:07', 0, 1),
(95, 'PETLAD', 1, 0, '2016-11-10 08:47:59', 0, 1),
(96, 'PORBANDAR', 1, 0, '2016-11-10 08:59:27', 0, 1),
(97, 'PRANTIJ', 1, 0, '2016-11-10 08:47:51', 0, 1),
(98, 'RADHANPUR', 1, 0, '2016-11-10 08:47:18', 0, 1),
(99, 'RAJKOT', 1, 0, '2016-11-10 08:47:12', 0, 1),
(100, 'RAJPIPLA', 1, 0, '2016-11-10 08:47:01', 0, 1),
(101, 'RAJULA', 1, 0, '2016-11-10 08:46:49', 0, 1),
(102, 'RANAVAV', 1, 0, '2016-11-10 08:46:41', 0, 1),
(103, 'RAPAR', 1, 0, '2016-11-10 08:46:13', 0, 1),
(104, 'SALAYA', 1, 0, '2016-11-10 08:46:06', 0, 1),
(105, 'SAVARKUNDLA (KUNDLA)', 1, 0, '2016-11-10 08:45:55', 0, 1),
(106, 'SIDHPUR (SIDDHAPUR)', 1, 0, '2016-11-10 08:42:34', 0, 1),
(107, 'SIHOR', 1, 0, '2016-11-10 08:59:18', 0, 1),
(108, 'SIKKA', 1, 0, '2016-11-10 08:59:13', 0, 1),
(109, 'SONGADH', 1, 0, '2016-11-10 08:59:07', 0, 1),
(110, 'SURAT', 1, 0, '2016-11-10 08:42:28', 0, 1),
(111, 'SURENDRANAGAR', 1, 0, '2016-11-10 08:59:01', 0, 1),
(112, 'SUTRAPADA', 1, 0, '2016-11-10 08:58:56', 0, 1),
(113, 'TALAJA', 1, 0, '2016-11-10 08:45:42', 0, 1),
(114, 'TALALA', 1, 0, '2016-11-10 08:58:49', 0, 1),
(115, 'THANGADH', 1, 0, '2016-11-10 08:45:21', 0, 1),
(116, 'THARAD', 1, 0, '2016-11-10 08:44:50', 0, 1),
(117, 'UMBERGAON', 1, 0, '2016-11-10 08:42:15', 0, 1),
(118, 'UMRETH', 1, 0, '2016-11-10 08:58:41', 0, 1),
(119, 'UNA', 1, 0, '2016-11-10 08:58:35', 0, 1),
(120, 'UNJHA', 1, 0, '2016-11-10 08:58:29', 0, 1),
(121, 'UPLETA', 1, 0, '2016-11-10 08:58:22', 0, 1),
(122, 'VADALI', 1, 0, '2016-11-10 08:41:46', 0, 1),
(123, 'VADNAGAR', 1, 0, '2016-11-10 08:58:16', 0, 1),
(124, 'VADODARA (BARODA)', 1, 0, '2016-11-10 08:41:30', 0, 1),
(125, 'VALSAD', 1, 0, '2016-11-10 08:41:20', 0, 1),
(126, 'VAPI', 1, 0, '2016-11-10 08:39:45', 0, 1),
(127, 'VAPI INA', 1, 0, '2016-11-10 08:41:00', 0, 1),
(128, 'VERAVAL', 1, 0, '2016-11-10 08:40:44', 0, 1),
(129, 'VIJAPUR', 1, 0, '2016-11-10 08:40:36', 0, 1),
(130, 'VIRAMGAM', 1, 0, '2016-11-10 08:40:28', 0, 1),
(131, 'VISNAGAR', 1, 0, '2016-11-10 08:58:04', 0, 1),
(132, 'VYARA', 1, 0, '2016-11-10 08:44:43', 0, 1),
(133, 'WANKANER', 1, 0, '2017-03-07 06:35:24', 1, 2),
(134, 'WQDSXA', 31, 0, '2017-03-18 06:34:30', 1, 0),
(135, 'DELHI', 32, 0, '2017-03-21 09:02:37', 1, 0),
(136, 'MORBI', 1, 0, '2017-03-21 09:12:03', 1, 0),
(137, 'HUBALI', 13, 0, '2017-04-11 05:17:29', 1, 0),
(138, 'MANAWAR', 15, 0, '2017-06-02 06:18:33', 1, 0),
(139, 'DAR ESS SALAM', 33, 0, '2017-06-06 07:26:46', 1, 0),
(140, 'MUMBAI', 16, 0, '2017-09-01 07:42:57', 1, 0),
(141, 'DUBAI', 34, 0, '2018-04-13 03:37:27', 1, 0),
(142, 'ABU DHABI', 35, 2, '2019-09-09 01:48:21', 1, 0),
(143, 'GANDHINAGAR', 1, 0, '2018-07-16 05:54:49', 1, 0),
(144, 'ROM', 1, 0, '2019-06-20 05:40:05', 1, 0),
(145, 'QWE12', 23, 2, '2019-09-09 01:48:32', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `coro_chequebook`
--

DROP TABLE IF EXISTS `coro_chequebook`;
CREATE TABLE IF NOT EXISTS `coro_chequebook` (
  `chequebookid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `acc_chequeno` int(11) NOT NULL,
  `acc_chequeleft` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`chequebookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coro_cheques`
--

DROP TABLE IF EXISTS `coro_cheques`;
CREATE TABLE IF NOT EXISTS `coro_cheques` (
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

-- --------------------------------------------------------

--
-- Table structure for table `coro_design`
--

DROP TABLE IF EXISTS `coro_design`;
CREATE TABLE IF NOT EXISTS `coro_design` (
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

--
-- Dumping data for table `coro_design`
--

INSERT INTO `coro_design` (`design_id`, `design_bank`, `design_payee`, `design_payeeWidth`, `design_date`, `design_dateWidth`, `design_dateLspace`, `design_amount_text`, `design_amount_textWidth`, `design_amount_textIndent`, `design_amount_textLHeight`, `design_amount_number`, `design_amount_numberWidth`, `design_bearer`, `design_bearerWidth`, `design_mark`, `design_notmore`, `design_notmoreWidth`, `design_preview`, `design_status`, `company_id`, `design_tmst`, `design_of`) VALUES
(12, 7, '{\"top\":\"79\",\"left\":\"70\"}', 450, '{\"top\":\"38\",\"left\":\"543\"}', 158, 13, '{\"top\":\"105\",\"left\":\"44\"}', 455, 76, 31, '{\"top\":\"136\",\"left\":\"562\"}', 113, '{\"top\":\"83\",\"left\":\"643\"}', 50, '{\"top\":\"219\",\"left\":\"257\"}', '{\"top\":\"225\",\"left\":\"391\"}', 181, 'cbi-294380415.jpg', 1, 0, '2016-01-26 19:08:59', 0),
(14, 9, '{\"top\":\"82\",\"left\":\"62\"}', 526, '{\"top\":\"30\",\"left\":\"593\"}', 155, 12, '{\"top\":\"107\",\"left\":\"56\"}', 534, 72, 28, '{\"top\":\"143\",\"left\":\"595\"}', 104, '{\"top\":\"84\",\"left\":\"631\"}', 83, '{\"top\":\"201\",\"left\":\"375\"}', '{\"top\":\"186\",\"left\":\"345\"}', 178, 'canctscopy-1388119199.jpg', 1, 0, '2016-03-08 03:20:55', 0),
(15, 3, '{\"top\":\"74\",\"left\":\"56\"}', 97, '{\"top\":\"32\",\"left\":\"554\"}', 150, 12, '{\"top\":\"96\",\"left\":\"33\"}', 538, 70, 32, '{\"top\":\"130\",\"left\":\"561\"}', 108, '{\"top\":\"80\",\"left\":\"658\"}', 46, '{\"top\":\"198\",\"left\":\"255\"}', '{\"top\":\"211\",\"left\":\"389\"}', 172, 'chaque2255393621-1214658089.jpg', 1, 0, '2016-03-27 19:56:15', 0),
(22, 8, '{\"top\":\"101\",\"left\":\"121\"}', 54, '{\"top\":\"67\",\"left\":\"550\"}', 90, 5, '{\"top\":\"129\",\"left\":\"74\"}', 550, 40, 35, '{\"top\":\"163\",\"left\":\"514\"}', 120, '{\"top\":\"104\",\"left\":\"615\"}', 58, '{\"top\":\"245\",\"left\":\"360\"}', '{\"top\":\"227\",\"left\":\"395\"}', 184, 'kotakrameshbhaihuf1408473232-8711140588.jpg', 1, 0, '2016-12-05 00:55:57', 0),
(29, 15, '{\"top\":\"74\",\"left\":\"73\"}', 522, '{\"top\":\"40\",\"left\":\"598\"}', 142, 12, '{\"top\":\"101\",\"left\":\"91\"}', 647, 40, 35, '{\"top\":\"139\",\"left\":\"642\"}', 116, '{\"top\":\"88\",\"left\":\"689\"}', 77, '{\"top\":\"218\",\"left\":\"132\"}', '{\"top\":\"218\",\"left\":\"282\"}', 180, 'thenavnirmancoopbankltd-395763292.jpg', 1, 0, '2017-03-27 11:37:30', 1),
(31, 16, '{\"top\":\"92\",\"left\":\"115\"}', 421, '{\"top\":\"39\",\"left\":\"607\"}', 150, 12, '{\"top\":\"116\",\"left\":\"29\"}', 499, 80, 31, '{\"top\":\"150\",\"left\":\"621\"}', 118, '{\"top\":\"92\",\"left\":\"699\"}', 56, '{\"top\":\"197\",\"left\":\"259\"}', '{\"top\":\"243\",\"left\":\"247\"}', 182, 'maharashtrabankedited-1157640979.jpg', 1, 0, '2017-04-11 07:30:35', 0),
(32, 17, '{\"top\":\"80\",\"left\":\"75\"}', 441, '{\"top\":\"30\",\"left\":\"588\"}', 155, 12, '{\"top\":\"100\",\"left\":\"60\"}', 552, 75, 35, '{\"top\":\"140\",\"left\":\"595\"}', 122, '{\"top\":\"85\",\"left\":\"623\"}', 86, '{\"top\":\"204\",\"left\":\"343\"}', '{\"top\":\"190\",\"left\":\"312\"}', 186, 'bhagyoday-1269910896.jpg', 1, 0, '2017-07-15 05:27:58', 0),
(33, 18, '{\"top\":\"65\",\"left\":\"68\"}', 529, '{\"top\":\"12\",\"left\":\"580\"}', 156, 13, '{\"top\":\"90\",\"left\":\"51\"}', 552, 70, 35, '{\"top\":\"126\",\"left\":\"596\"}', 122, '{\"top\":\"61\",\"left\":\"637\"}', 78, '{\"top\":\"183\",\"left\":\"339\"}', '{\"top\":\"166\",\"left\":\"309\"}', 186, 'syndicatebank192610252-721858130.jpg', 1, 0, '2017-08-11 00:37:52', 0),
(34, 10, '{\"top\":\"78\",\"left\":\"68\"}', 592, '{\"top\":\"32\",\"left\":\"587\"}', 157, 13, '{\"top\":\"102\",\"left\":\"62\"}', 542, 40, 35, '{\"top\":\"140\",\"left\":\"601\"}', 112, '{\"top\":\"79\",\"left\":\"682\"}', 69, '{\"top\":\"179\",\"left\":\"353\"}', '{\"top\":\"172\",\"left\":\"552\"}', 176, 'editedcheque-211113918.jpg', 1, 0, '2017-11-20 06:32:49', 0),
(35, 20, '{\"top\":\"75\",\"left\":\"72\"}', 550, '{\"top\":\"23\",\"left\":\"579\"}', 163, 13, '{\"top\":\"98\",\"left\":\"64\"}', 552, 40, 35, '{\"top\":\"138\",\"left\":\"597\"}', 122, '{\"top\":\"69\",\"left\":\"676\"}', 60, '{\"top\":\"227\",\"left\":\"346\"}', '{\"top\":\"205\",\"left\":\"338\"}', 186, 'vkentrprise-1156780343.jpg', 1, 0, '2018-06-29 01:17:29', 0),
(36, 34, '{\"top\":\"85\",\"left\":\"60\"}', 578, '{\"top\":\"37\",\"left\":\"586\"}', 163, 13, '{\"top\":\"110\",\"left\":\"63\"}', 552, 40, 35, '{\"top\":\"150\",\"left\":\"592\"}', 122, '{\"top\":\"92\",\"left\":\"688\"}', 60, '{\"top\":\"265\",\"left\":\"318\"}', '{\"top\":\"246\",\"left\":\"298\"}', 186, 'hdfc6960256216-409920748.jpg', 1, 0, '2018-07-16 05:38:42', 0),
(37, 40, '{\"top\":\"67\",\"left\":\"46\"}', 56, '{\"top\":\"29\",\"left\":\"586\"}', 140, 11, '{\"top\":\"97\",\"left\":\"12\"}', 528, 40, 35, '{\"top\":\"140\",\"left\":\"583\"}', 122, '{\"top\":\"68\",\"left\":\"629\"}', 60, '{\"top\":\"205\",\"left\":\"278\"}', '{\"top\":\"250\",\"left\":\"226\"}', 186, 'kotakfinal-289130538.png', 1, 0, '2018-07-25 01:45:59', 0),
(39, 1, '{\"top\":\"75\",\"left\":\"68\"}', 73, '{\"top\":\"16\",\"left\":\"596\"}', 140, 11, '{\"top\":\"100\",\"left\":\"39\"}', 552, 40, 35, '{\"top\":\"138\",\"left\":\"604\"}', 122, '{\"top\":\"62\",\"left\":\"615\"}', 60, '{\"top\":\"210\",\"left\":\"317\"}', '{\"top\":\"177\",\"left\":\"581\"}', 186, 'sbifinal-19106110.png', 1, 0, '2018-07-25 02:00:40', 0),
(41, 25, '{\"top\":\"83\",\"left\":\"54\"}', 62, '{\"top\":\"23\",\"left\":\"580\"}', 140, 11, '{\"top\":\"102\",\"left\":\"31\"}', 494, 40, 35, '{\"top\":\"141\",\"left\":\"596\"}', 122, '{\"top\":\"67\",\"left\":\"614\"}', 60, '{\"top\":\"175\",\"left\":\"342\"}', '{\"top\":\"216\",\"left\":\"317\"}', 186, 'denabankcheck-1024414584.png', 1, 0, '2018-08-10 00:40:38', 0),
(42, 2, '{\"top\":\"74\",\"left\":\"73\"}', 541, '{\"top\":\"29\",\"left\":\"598\"}', 140, 11, '{\"top\":\"96\",\"left\":\"83\"}', 418, 40, 35, '{\"top\":\"138\",\"left\":\"613\"}', 122, '{\"top\":\"65\",\"left\":\"646\"}', 60, '{\"top\":\"175\",\"left\":\"315\"}', '{\"top\":\"219\",\"left\":\"289\"}', 186, 'bob-1404987657.png', 1, 0, '2018-10-02 04:21:26', 0),
(43, 4, '{\"top\":\"78\",\"left\":\"54\"}', 527, '{\"top\":\"29\",\"left\":\"593\"}', 133, 11, '{\"top\":\"98\",\"left\":\"35\"}', 507, 40, 35, '{\"top\":\"143\",\"left\":\"610\"}', 118, '{\"top\":\"66\",\"left\":\"650\"}', 86, '{\"top\":\"201\",\"left\":\"611\"}', '{\"top\":\"244\",\"left\":\"581\"}', 182, 'icicifinal-1156995502.png', 1, 0, '2018-10-03 00:24:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `coro_vouchers`
--

DROP TABLE IF EXISTS `coro_vouchers`;
CREATE TABLE IF NOT EXISTS `coro_vouchers` (
  `v_id` double NOT NULL AUTO_INCREMENT,
  `v_cheque` double NOT NULL,
  `v_tds` float NOT NULL,
  `v_rec_name` varchar(50) NOT NULL,
  `v_rec_mobno` varchar(20) NOT NULL,
  `v_tmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `v_of` double NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country_mst`
--

DROP TABLE IF EXISTS `country_mst`;
CREATE TABLE IF NOT EXISTS `country_mst` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  `country_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_mst`
--

INSERT INTO `country_mst` (`countryid`, `country_name`, `country_status`, `cdate`, `userid`) VALUES
(1, 'Afghanistan', 0, '2016-10-17 06:18:18', 0),
(2, 'Albania', 0, '2016-10-17 06:18:18', 0),
(3, 'Algeria', 0, '2016-10-17 06:18:18', 0),
(4, 'American Samoa', 0, '2016-10-17 06:18:18', 0),
(5, 'Andorra', 0, '2016-10-17 06:18:18', 0),
(6, 'Angola', 0, '2016-10-17 06:18:18', 0),
(7, 'Anguilla', 0, '2016-10-17 06:18:18', 0),
(8, 'Antarctica', 0, '2016-10-17 06:18:18', 0),
(9, 'Antigua And Barbuda', 0, '2016-10-17 06:18:18', 0),
(10, 'Argentina', 0, '2016-10-17 06:18:18', 0),
(11, 'Armenia', 0, '2016-10-17 06:18:18', 0),
(12, 'Aruba', 0, '2016-10-17 06:18:18', 0),
(13, 'Australia', 0, '2016-10-17 06:18:18', 0),
(14, 'Austria', 0, '2016-10-17 06:18:18', 0),
(15, 'Azerbaijan', 0, '2016-10-17 06:18:18', 0),
(16, 'Bahamas The', 0, '2016-10-17 06:18:18', 0),
(17, 'Bahrain', 0, '2016-10-17 06:18:18', 0),
(18, 'Bangladesh', 0, '2016-10-17 06:18:18', 0),
(19, 'Barbados', 0, '2016-10-17 06:18:18', 0),
(20, 'Belarus', 0, '2016-10-17 06:18:18', 0),
(21, 'Belgium', 0, '2016-10-17 06:18:18', 0),
(22, 'Belize', 0, '2016-10-17 06:18:18', 0),
(23, 'Benin', 0, '2016-10-17 06:18:18', 0),
(24, 'Bermuda', 0, '2016-10-17 06:18:18', 0),
(25, 'Bhutan', 0, '2016-10-17 06:18:18', 0),
(26, 'Bolivia', 0, '2016-10-17 06:18:18', 0),
(27, 'Bosnia and Herzegovina', 0, '2016-10-17 06:18:18', 0),
(28, 'Botswana', 0, '2016-10-17 06:18:18', 0),
(29, 'Bouvet Island', 0, '2016-10-17 06:18:18', 0),
(30, 'Brazil', 0, '2016-10-17 06:18:18', 0),
(31, 'British Indian Ocean Territory', 0, '2016-10-17 06:18:18', 0),
(32, 'Brunei', 0, '2016-10-17 06:18:18', 0),
(33, 'Bulgaria', 0, '2016-10-17 06:18:18', 0),
(34, 'Burkina Faso', 0, '2016-10-17 06:18:18', 0),
(35, 'Burundi', 0, '2016-10-17 06:18:18', 0),
(36, 'Cambodia', 0, '2016-10-17 06:18:18', 0),
(37, 'Cameroon', 0, '2016-10-17 06:18:18', 0),
(38, 'Canada', 0, '2016-10-17 06:18:18', 0),
(39, 'Cape Verde', 0, '2016-10-17 06:18:18', 0),
(40, 'Cayman Islands', 0, '2016-10-17 06:18:18', 0),
(41, 'Central African Republic', 0, '2016-10-17 06:18:18', 0),
(42, 'Chad', 0, '2016-10-17 06:18:18', 0),
(43, 'Chile', 0, '2016-10-17 06:18:18', 0),
(44, 'China', 0, '2016-10-17 06:18:18', 0),
(45, 'Christmas Island', 0, '2016-10-17 06:18:18', 0),
(46, 'Cocos (Keeling) Islands', 0, '2016-10-17 06:18:18', 0),
(47, 'Colombia', 0, '2016-10-17 06:18:18', 0),
(48, 'Comoros', 0, '2016-10-17 06:18:18', 0),
(49, 'Congo', 0, '2016-10-17 06:18:18', 0),
(50, 'Congo The Democratic Republic Of The', 0, '2016-10-17 06:18:18', 0),
(51, 'Cook Islands', 0, '2016-10-17 06:18:18', 0),
(52, 'Costa Rica', 0, '2016-10-17 06:18:18', 0),
(53, 'Cote D\'Ivoire (Ivory Coast)', 0, '2016-10-17 06:18:18', 0),
(54, 'Croatia (Hrvatska)', 0, '2016-10-17 06:18:18', 0),
(55, 'Cuba', 0, '2016-10-17 06:18:18', 0),
(56, 'Cyprus', 0, '2016-10-17 06:18:18', 0),
(57, 'Czech Republic', 0, '2016-10-17 06:18:18', 0),
(58, 'Denmark', 0, '2016-10-17 06:18:18', 0),
(59, 'Djibouti', 0, '2016-10-17 06:18:18', 0),
(60, 'Dominica', 0, '2016-10-17 06:18:18', 0),
(61, 'Dominican Republic', 0, '2016-10-17 06:18:18', 0),
(62, 'East Timor', 0, '2016-10-17 06:18:18', 0),
(63, 'Ecuador', 0, '2016-10-17 06:18:18', 0),
(64, 'Egypt', 0, '2016-10-17 06:18:18', 0),
(65, 'El Salvador', 0, '2016-10-17 06:18:18', 0),
(66, 'Equatorial Guinea', 0, '2016-10-17 06:18:18', 0),
(67, 'Eritrea', 0, '2016-10-17 06:18:18', 0),
(68, 'Estonia', 0, '2016-10-17 06:18:18', 0),
(69, 'Ethiopia', 0, '2016-10-17 06:18:18', 0),
(70, 'External Territories of Australia', 0, '2016-10-17 06:18:18', 0),
(71, 'Falkland Islands', 0, '2016-10-17 06:18:18', 0),
(72, 'Faroe Islands', 0, '2016-10-17 06:18:18', 0),
(73, 'Fiji Islands', 0, '2016-10-17 06:18:18', 0),
(74, 'Finland', 0, '2016-10-17 06:18:18', 0),
(75, 'France', 0, '2016-10-17 06:18:18', 0),
(76, 'French Guiana', 0, '2016-10-17 06:18:18', 0),
(77, 'French Polynesia', 0, '2016-10-17 06:18:18', 0),
(78, 'French Southern Territories', 0, '2016-10-17 06:18:18', 0),
(79, 'Gabon', 0, '2016-10-17 06:18:18', 0),
(80, 'Gambia The', 0, '2016-10-17 06:18:18', 0),
(81, 'Georgia', 0, '2016-10-17 06:18:18', 0),
(82, 'Germany', 0, '2016-10-17 06:18:18', 0),
(83, 'Ghana', 0, '2016-10-17 06:18:18', 0),
(84, 'Gibraltar', 0, '2016-10-17 06:18:18', 0),
(85, 'Greece', 0, '2016-10-17 06:18:18', 0),
(86, 'Greenland', 0, '2016-10-17 06:18:18', 0),
(87, 'Grenada', 0, '2016-10-17 06:18:18', 0),
(88, 'Guadeloupe', 0, '2016-10-17 06:18:18', 0),
(89, 'Guam', 0, '2016-10-17 06:18:18', 0),
(90, 'Guatemala', 0, '2016-10-17 06:18:18', 0),
(91, 'Guernsey and Alderney', 0, '2016-10-17 06:18:18', 0),
(92, 'Guinea', 0, '2016-10-17 06:18:18', 0),
(93, 'Guinea-Bissau', 0, '2016-10-17 06:18:18', 0),
(94, 'Guyana', 0, '2016-10-17 06:18:18', 0),
(95, 'Haiti', 0, '2016-10-17 06:18:18', 0),
(96, 'Heard and McDonald Islands', 0, '2016-10-17 06:18:18', 0),
(97, 'Honduras', 0, '2016-10-17 06:18:18', 0),
(98, 'Hong Kong S.A.R.', 0, '2016-10-17 06:18:18', 0),
(99, 'Hungary', 0, '2016-10-17 06:18:18', 0),
(100, 'Iceland', 0, '2016-10-17 06:18:18', 0),
(101, 'India', 0, '2016-10-17 06:18:18', 0),
(102, 'Indonesia', 0, '2016-10-17 06:18:18', 0),
(103, 'Iran', 0, '2016-10-17 06:18:18', 0),
(104, 'Iraq', 0, '2016-10-17 06:18:18', 0),
(105, 'Ireland', 0, '2016-10-17 06:18:18', 0),
(106, 'Israel', 0, '2016-10-17 06:18:18', 0),
(107, 'Italy', 0, '2016-10-17 06:18:18', 0),
(108, 'Jamaica', 0, '2016-10-17 06:18:18', 0),
(109, 'Japan', 0, '2016-10-17 06:18:18', 0),
(110, 'Jersey', 0, '2016-10-17 06:18:18', 0),
(111, 'Jordan', 0, '2016-10-17 06:18:18', 0),
(112, 'Kazakhstan', 0, '2016-10-17 06:18:18', 0),
(113, 'Kenya', 0, '2016-10-17 06:18:18', 0),
(114, 'Kiribati', 0, '2016-10-17 06:18:18', 0),
(115, 'Korea North', 0, '2016-10-17 06:18:18', 0),
(116, 'Korea South', 0, '2016-10-17 06:18:18', 0),
(117, 'Kuwait', 0, '2016-10-17 06:18:18', 0),
(118, 'Kyrgyzstan', 0, '2016-10-17 06:18:18', 0),
(119, 'Laos', 0, '2016-10-17 06:18:18', 0),
(120, 'Latvia', 0, '2016-10-17 06:18:18', 0),
(121, 'Lebanon', 0, '2016-10-17 06:18:18', 0),
(122, 'Lesotho', 0, '2016-10-17 06:18:18', 0),
(123, 'Liberia', 0, '2016-10-17 06:18:18', 0),
(124, 'Libya', 0, '2016-10-17 06:18:18', 0),
(125, 'Liechtenstein', 0, '2016-10-17 06:18:18', 0),
(126, 'Lithuania', 0, '2016-10-17 06:18:18', 0),
(127, 'Luxembourg', 0, '2016-10-17 06:18:18', 0),
(128, 'Macau S.A.R.', 0, '2016-10-17 06:18:18', 0),
(129, 'Macedonia', 0, '2016-10-17 06:18:18', 0),
(130, 'Madagascar', 0, '2016-10-17 06:18:18', 0),
(131, 'Malawi', 0, '2016-10-17 06:18:18', 0),
(132, 'Malaysia', 0, '2016-10-17 06:18:18', 0),
(133, 'Maldives', 0, '2016-10-17 06:18:18', 0),
(134, 'Mali', 0, '2016-10-17 06:18:18', 0),
(135, 'Malta', 0, '2016-10-17 06:18:18', 0),
(136, 'Man (Isle of)', 0, '2016-10-17 06:18:18', 0),
(137, 'Marshall Islands', 0, '2016-10-17 06:18:18', 0),
(138, 'Martinique', 0, '2016-10-17 06:18:18', 0),
(139, 'Mauritania', 0, '2016-10-17 06:18:18', 0),
(140, 'Mauritius', 0, '2016-10-17 06:18:18', 0),
(141, 'Mayotte', 0, '2016-10-17 06:18:18', 0),
(142, 'Mexico', 0, '2016-10-17 06:18:18', 0),
(143, 'Micronesia', 0, '2016-10-17 06:18:18', 0),
(144, 'Moldova', 0, '2016-10-17 06:18:18', 0),
(145, 'Monaco', 0, '2016-10-17 06:18:18', 0),
(146, 'Mongolia', 0, '2016-10-17 06:18:18', 0),
(147, 'Montserrat', 0, '2016-10-17 06:18:18', 0),
(148, 'Morocco', 0, '2016-10-17 06:18:18', 0),
(149, 'Mozambique', 0, '2016-10-17 06:18:18', 0),
(150, 'Myanmar', 0, '2016-10-17 06:18:18', 0),
(151, 'Namibia', 0, '2016-10-17 06:18:18', 0),
(152, 'Nauru', 0, '2016-10-17 06:18:18', 0),
(153, 'Nepal', 0, '2016-10-17 06:18:18', 0),
(154, 'Netherlands Antilles', 0, '2016-10-17 06:18:18', 0),
(155, 'Netherlands The', 0, '2016-10-17 06:18:18', 0),
(156, 'New Caledonia', 0, '2016-10-17 06:18:18', 0),
(157, 'New Zealand', 0, '2016-10-17 06:18:18', 0),
(158, 'Nicaragua', 0, '2016-10-17 06:18:18', 0),
(159, 'Niger', 0, '2016-10-17 06:18:18', 0),
(160, 'Nigeria', 0, '2016-10-17 06:18:18', 0),
(161, 'Niue', 0, '2016-10-17 06:18:18', 0),
(162, 'Norfolk Island', 0, '2016-10-17 06:18:18', 0),
(163, 'Northern Mariana Islands', 0, '2016-10-17 06:18:18', 0),
(164, 'Norway', 0, '2016-10-17 06:18:18', 0),
(165, 'Oman', 0, '2016-10-17 06:18:18', 0),
(166, 'Pakistan', 0, '2016-10-17 06:18:18', 0),
(167, 'Palau', 0, '2016-10-17 06:18:18', 0),
(168, 'Palestinian Territory Occupied', 0, '2016-10-17 06:18:18', 0),
(169, 'Panama', 0, '2016-10-17 06:18:18', 0),
(170, 'Papua new Guinea', 0, '2016-10-17 06:18:18', 0),
(171, 'Paraguay', 0, '2016-10-17 06:18:18', 0),
(172, 'Peru', 0, '2016-10-17 06:18:18', 0),
(173, 'Philippines', 0, '2016-10-17 06:18:18', 0),
(174, 'Pitcairn Island', 0, '2016-10-17 06:18:18', 0),
(175, 'Poland', 0, '2016-10-17 06:18:18', 0),
(176, 'Portugal', 0, '2016-10-17 06:18:18', 0),
(177, 'Puerto Rico', 0, '2016-10-17 06:18:18', 0),
(178, 'Qatar', 0, '2016-10-17 06:18:18', 0),
(179, 'Reunion', 0, '2016-10-17 06:18:18', 0),
(180, 'Romania', 0, '2016-10-17 06:18:18', 0),
(181, 'Russia', 0, '2016-10-17 06:18:18', 0),
(182, 'Rwanda', 0, '2016-10-17 06:18:18', 0),
(183, 'Saint Helena', 0, '2016-10-17 06:18:18', 0),
(184, 'Saint Kitts And Nevis', 0, '2016-10-17 06:18:18', 0),
(185, 'Saint Lucia', 0, '2016-10-17 06:18:18', 0),
(186, 'Saint Pierre and Miquelon', 0, '2016-10-17 06:18:18', 0),
(187, 'Saint Vincent And The Grenadines', 0, '2016-10-17 06:18:18', 0),
(188, 'Samoa', 0, '2016-10-17 06:18:18', 0),
(189, 'San Marino', 0, '2016-10-17 06:18:18', 0),
(190, 'Sao Tome and Principe', 0, '2016-10-17 06:18:18', 0),
(191, 'Saudi Arabia', 0, '2016-10-17 06:18:18', 0),
(192, 'Senegal', 0, '2016-10-17 06:18:18', 0),
(193, 'Serbia', 0, '2016-10-17 06:18:18', 0),
(194, 'Seychelles', 0, '2016-10-17 06:18:18', 0),
(195, 'Sierra Leone', 0, '2016-10-17 06:18:18', 0),
(196, 'Singapore', 0, '2016-10-17 06:18:18', 0),
(197, 'Slovakia', 0, '2016-10-17 06:18:18', 0),
(198, 'Slovenia', 0, '2016-10-17 06:18:18', 0),
(199, 'Smaller Territories of the UK', 0, '2016-10-17 06:18:18', 0),
(200, 'Solomon Islands', 0, '2016-10-17 06:18:18', 0),
(201, 'Somalia', 0, '2016-10-17 06:18:18', 0),
(202, 'South Africa', 0, '2016-10-17 06:18:18', 0),
(203, 'South Georgia', 0, '2016-10-17 06:18:18', 0),
(204, 'South Sudan', 0, '2016-10-17 06:18:18', 0),
(205, 'Spain', 0, '2016-10-17 06:18:18', 0),
(206, 'Sri Lanka', 0, '2016-10-17 06:18:18', 0),
(207, 'Sudan', 0, '2016-10-17 06:18:18', 0),
(208, 'Suriname', 0, '2016-10-17 06:18:18', 0),
(209, 'Svalbard And Jan Mayen Islands', 0, '2016-10-17 06:18:18', 0),
(210, 'Swaziland', 0, '2016-10-17 06:18:18', 0),
(211, 'Sweden', 0, '2016-10-17 06:18:18', 0),
(212, 'Switzerland', 0, '2016-10-17 06:18:18', 0),
(213, 'Syria', 0, '2016-10-17 06:18:18', 0),
(214, 'Taiwan', 0, '2016-10-17 06:18:18', 0),
(215, 'Tajikistan', 0, '2016-10-17 06:18:18', 0),
(216, 'Tanzania', 0, '2016-10-17 06:18:18', 0),
(217, 'Thailand', 0, '2016-10-17 06:18:18', 0),
(218, 'Togo', 0, '2016-10-17 06:18:18', 0),
(219, 'Tokelau', 0, '2016-10-17 06:18:18', 0),
(220, 'Tonga', 0, '2016-10-17 06:18:18', 0),
(221, 'Trinidad And Tobago', 0, '2016-10-17 06:18:18', 0),
(222, 'Tunisia', 0, '2016-10-17 06:18:18', 0),
(223, 'Turkey', 0, '2016-10-17 06:18:18', 0),
(224, 'Turkmenistan', 0, '2016-10-17 06:18:18', 0),
(225, 'Turks And Caicos Islands', 0, '2016-10-17 06:18:18', 0),
(226, 'Tuvalu', 0, '2016-10-17 06:18:18', 0),
(227, 'Uganda', 0, '2016-10-17 06:18:18', 0),
(228, 'Ukraine', 0, '2016-10-17 06:18:18', 0),
(229, 'United Arab Emirates', 0, '2016-10-17 06:18:18', 0),
(230, 'United Kingdom', 0, '2016-10-17 06:18:18', 0),
(231, 'United States', 0, '2016-10-17 06:18:18', 0),
(232, 'United States Minor Outlying Islands', 0, '2016-10-17 06:18:18', 0),
(233, 'Uruguay', 0, '2016-10-17 06:18:18', 0),
(234, 'Uzbekistan', 0, '2016-10-17 06:18:18', 0),
(235, 'Vanuatu', 0, '2016-10-17 06:18:18', 0),
(236, 'Vatican City State (Holy See)', 0, '2016-10-17 06:18:18', 0),
(237, 'Venezuela', 0, '2016-10-17 06:18:18', 0),
(238, 'Vietnam', 0, '2016-10-17 06:18:18', 0),
(239, 'Virgin Islands (British)', 0, '2016-10-17 06:18:18', 0),
(240, 'Virgin Islands (US)', 0, '2016-10-17 06:18:18', 0),
(241, 'Wallis And Futuna Islands', 0, '2016-10-17 06:18:18', 0),
(242, 'Western Sahara', 0, '2016-10-17 06:18:18', 0),
(243, 'Yemen', 0, '2016-10-17 06:18:18', 0),
(244, 'Yugoslavia', 0, '2016-10-17 06:18:18', 0),
(245, 'Zambia', 0, '2016-10-17 06:18:18', 0),
(246, 'Zimbabwe', 0, '2017-09-27 12:45:38', 0),
(247, 'SADASDASDASDSAD1212', 2, '2019-09-09 01:47:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cust_tempdata`
--

DROP TABLE IF EXISTS `cust_tempdata`;
CREATE TABLE IF NOT EXISTS `cust_tempdata` (
  `cust_tempdata_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_num` int(11) NOT NULL,
  `error` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`cust_tempdata_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_mst`
--

DROP TABLE IF EXISTS `employee_mst`;
CREATE TABLE IF NOT EXISTS `employee_mst` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_mst`
--

INSERT INTO `employee_mst` (`employee_id`, `branch_id`, `employee_name`, `employee_address`, `countryid`, `stateid`, `cityid`, `emp_mobile`, `emp_email`, `emp_password`, `zone_id`, `opening_balance`, `balance_typeid`, `emp_incen`, `inc_inv_amount`, `inc_inv_qty`, `com_type`, `inc_inv_com`, `emp_salary`, `multi_company`, `cdate`, `employee_status`, `user_id`, `usertype_id`, `company_id`) VALUES
(8, 1, 'TEST 1', 'ahmedabad', 101, 1, 1, '', 'emp1@test.com', 'admin@123', 0, 0, 0, '', '', '', '', '', '', '1', '2019-06-20 06:15:06', 2, 1, 2, 0),
(9, 1, 'TEST 3', 'test address', 101, 1, 1, '7990501648', 'emp3@test.com', 'admin@123', 0, 10000, 1, 'AMOUNT', '1000', '', 'amount', '200', '', '1', '2019-06-24 04:31:00', 2, 1, 2, 0),
(10, 2, 'TEST 4', 'test 4 employee address', 101, 1, 1, '7990501648', 'emp4@test.com', 'admin@123', 0, 9000, 2, 'PERCENTAGE', '', '1', 'percentage', '5', '', '1', '2019-06-24 04:32:40', 2, 1, 2, 0),
(11, 7, 'DHAVAL D UPADHYAY', 'demo', 101, 1, 1, '', 'empd@gmail.com', '123456', 0, 0, 0, '', '', '', '', '', '10000', '1', '2019-08-21 02:11:26', 0, 1, 2, 0),
(12, 7, 'SADASD', 'sadasdasd', 101, 1, 1, '', 'rom@gmail.com', '123456', 0, 123123, 1, '', '', '', '', '', '123', '1', '2019-08-21 02:13:13', 0, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `evelope_design`
--

DROP TABLE IF EXISTS `evelope_design`;
CREATE TABLE IF NOT EXISTS `evelope_design` (
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

--
-- Dumping data for table `evelope_design`
--

INSERT INTO `evelope_design` (`envelope_design_id`, `env_name`, `width`, `height`, `from_top_margin`, `from_left_margin`, `font_size`, `font_family`, `line_height`, `top_margin`, `left_margin`, `env_status`, `user_id`, `company_id`) VALUES
(1, 'DL', '9.50', '4.50', '2.40', '0.50', 20, 'CALIBRI', 30, '1.00', '5.00', 0, 1, 1),
(2, 'LABEL', '8.50', '3.90', '3.00', '6.00', 20, 'CALIBRI', 25, '1.00', '3.00', 2, 0, 1),
(3, 'EDL', '9.00', '4.00', '3.00', '0.50', 15, '', 25, '0.50', '5.00', 0, 0, 1),
(4, 'DL', '9.50', '4.50', '1.00', '0.50', 20, 'CALIBRI', 30, '1.00', '5.00', 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `expense_head_mst`
--

DROP TABLE IF EXISTS `expense_head_mst`;
CREATE TABLE IF NOT EXISTS `expense_head_mst` (
  `expense_head_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_head_name` varchar(400) NOT NULL,
  `expense_head_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_master`
--

DROP TABLE IF EXISTS `expense_master`;
CREATE TABLE IF NOT EXISTS `expense_master` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_head_id` int(11) NOT NULL,
  `expense_name` varchar(400) NOT NULL,
  `expense_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense_master`
--

INSERT INTO `expense_master` (`expense_id`, `expense_head_id`, `expense_name`, `expense_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 0, 'exp1', 0, '2019-08-03 00:28:04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense_mst`
--

DROP TABLE IF EXISTS `expense_mst`;
CREATE TABLE IF NOT EXISTS `expense_mst` (
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

-- --------------------------------------------------------

--
-- Table structure for table `expense_trn`
--

DROP TABLE IF EXISTS `expense_trn`;
CREATE TABLE IF NOT EXISTS `expense_trn` (
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

-- --------------------------------------------------------

--
-- Table structure for table `forecast_period_mst`
--

DROP TABLE IF EXISTS `forecast_period_mst`;
CREATE TABLE IF NOT EXISTS `forecast_period_mst` (
  `f_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_by_id` int(11) NOT NULL,
  `f_target_period` int(11) NOT NULL,
  `f_period_name` varchar(400) NOT NULL,
  `f_period_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`f_period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forecast_period_mst`
--

INSERT INTO `forecast_period_mst` (`f_period_id`, `f_by_id`, `f_target_period`, `f_period_name`, `f_period_status`) VALUES
(1, 1, 1, 'JAN', 0),
(2, 1, 1, 'FEB', 0),
(3, 1, 1, 'MAR', 0),
(4, 1, 1, 'APR', 0),
(5, 1, 1, 'MAY', 0),
(6, 1, 1, 'JUN', 0),
(7, 1, 1, 'JUL', 0),
(8, 1, 1, 'AUG', 0),
(9, 1, 1, 'SEP', 0),
(10, 1, 1, 'OCT', 0),
(11, 1, 1, 'NOV', 0),
(12, 1, 1, 'DEC', 0),
(13, 1, 2, 'JAN - MAR', 0),
(14, 1, 2, 'APR - JUN', 0),
(15, 1, 2, 'JUL - SEP', 0),
(16, 1, 2, 'OCT - DEC', 0),
(17, 1, 3, 'JAN - JUN', 0),
(18, 1, 3, 'JUL - DEC', 0),
(19, 1, 4, 'JAN - DEC', 0),
(20, 2, 1, 'APR', 0),
(21, 2, 1, 'MAY', 0),
(22, 2, 1, 'JUN', 0),
(23, 2, 1, 'JUL', 0),
(24, 2, 1, 'AUG', 0),
(25, 2, 1, 'SEP', 0),
(26, 2, 1, 'OCT', 0),
(27, 2, 1, 'NOV', 0),
(28, 2, 1, 'DEC', 0),
(29, 2, 1, 'JAN', 0),
(30, 2, 1, 'FEB', 0),
(31, 2, 1, 'MAR', 0),
(32, 2, 2, 'APR - JUN', 0),
(33, 2, 2, 'JUL - SEP', 0),
(34, 2, 2, 'OCT - DEC', 0),
(35, 2, 2, 'JAN - MAR', 0),
(36, 2, 3, 'APR - SEP', 0),
(37, 2, 3, 'OCT - MAR', 0),
(38, 2, 4, 'APR - MAR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `formula_mst`
--

DROP TABLE IF EXISTS `formula_mst`;
CREATE TABLE IF NOT EXISTS `formula_mst` (
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

--
-- Dumping data for table `formula_mst`
--

INSERT INTO `formula_mst` (`formulaid`, `formula_name`, `tax_id`, `formula_status`, `cdate`, `user_id`, `usertype_id`, `company_id`) VALUES
(1, 'CGST 9% * SGST 9%', '8,7', 0, '2019-09-25 08:05:55', 1, 2, 1),
(2, 'IGST 18%', '15', 0, '2019-09-25 08:06:01', 1, 2, 1),
(3, 'CGST 6% * SGST 6%', '6,5', 0, '2019-09-25 08:06:26', 1, 2, 1),
(4, 'IGST 12%', '13', 0, '2019-09-25 08:06:32', 1, 2, 1),
(5, 'CGST 2.5% * SGST 2.5%', '4,3', 0, '2019-09-25 08:07:04', 1, 2, 1),
(6, 'IGST 5%', '12', 0, '2019-09-25 08:07:09', 1, 2, 1),
(7, 'CGST 14% * SGST 14%', '10,9', 0, '2019-09-25 08:07:26', 1, 2, 1),
(8, 'IGST 28%', '14', 0, '2019-09-25 08:07:30', 1, 2, 1),
(9, 'CGST 0% * SGST 0%', '2,1', 0, '2019-09-25 08:07:36', 1, 2, 1),
(10, 'IGST 0%', '11', 0, '2019-09-25 08:07:40', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `income_master`
--

DROP TABLE IF EXISTS `income_master`;
CREATE TABLE IF NOT EXISTS `income_master` (
  `inc_id` int(10) NOT NULL AUTO_INCREMENT,
  `inc_name` varchar(100) NOT NULL,
  `inc_group` int(11) NOT NULL,
  `inc_status` int(10) NOT NULL,
  `cdate` date NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`inc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income_mst`
--

DROP TABLE IF EXISTS `income_mst`;
CREATE TABLE IF NOT EXISTS `income_mst` (
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

-- --------------------------------------------------------

--
-- Table structure for table `income_trn`
--

DROP TABLE IF EXISTS `income_trn`;
CREATE TABLE IF NOT EXISTS `income_trn` (
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

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
CREATE TABLE IF NOT EXISTS `login_history` (
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`log_id`, `uid`, `in_time`, `out_time`, `ip`, `browser`, `version`, `os`, `city`, `state`, `country`, `lng`, `lat`) VALUES
(1, '1', '2019-08-26 11:38:48', '2019-10-17 14:45:35', '117.99.100.158', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(2, '1', '2019-08-26 12:36:42', '2019-08-26 14:33:22', '117.99.100.158', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(3, '1', '2019-08-27 11:04:07', '0000-00-00 00:00:00', '117.99.104.254', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(4, '1', '2019-09-02 11:40:57', '0000-00-00 00:00:00', '117.99.109.144', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(5, '1', '2019-09-03 09:59:32', '0000-00-00 00:00:00', 'NO-DATA', 'CHROME', '76', 'WINDOWS', '', '', '', 0, 0),
(6, '1', '2019-09-04 10:29:55', '0000-00-00 00:00:00', '117.99.101.245', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(7, '1', '2019-09-04 10:46:06', '2019-09-04 12:32:15', '117.99.101.245', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(8, '1', '2019-09-04 12:32:45', '2019-09-04 15:17:33', '117.99.101.245', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(9, '1', '2019-09-05 20:47:33', '0000-00-00 00:00:00', '2405:205:C822:A779:957A:478C:9F8B:FE37', 'CHROME', '76', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(10, '1', '2019-09-06 10:09:32', '0000-00-00 00:00:00', '117.99.101.140', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(11, '1', '2019-09-09 10:20:40', '0000-00-00 00:00:00', '117.99.103.175', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(12, '1', '2019-09-10 11:43:12', '0000-00-00 00:00:00', '117.99.96.222', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(13, '1', '2019-09-11 10:03:27', '0000-00-00 00:00:00', '117.99.107.118', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(14, '1', '2019-09-11 17:26:24', '0000-00-00 00:00:00', '117.99.107.118', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(15, '1', '2019-09-12 10:10:58', '0000-00-00 00:00:00', '117.99.99.168', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(16, '1', '2019-09-12 12:47:38', '0000-00-00 00:00:00', '117.99.99.168', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(17, '1', '2019-09-12 13:34:08', '0000-00-00 00:00:00', '117.99.99.168', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(18, '1', '2019-09-12 14:29:16', '0000-00-00 00:00:00', '117.99.99.168', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(19, '1', '2019-09-16 14:56:29', '0000-00-00 00:00:00', '117.99.107.11', 'CHROME', '76', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(20, '1', '2019-09-17 18:19:32', '0000-00-00 00:00:00', '110.227.235.225', 'CHROME', '76', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(21, '1', '2019-09-18 12:31:49', '0000-00-00 00:00:00', '27.57.171.210', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(22, '1', '2019-09-19 14:48:27', '0000-00-00 00:00:00', '117.99.98.167', 'CHROME', '75', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(23, '1', '2019-09-21 10:21:24', '0000-00-00 00:00:00', '117.99.109.145', 'CHROME', '75', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(24, '1', '2019-09-21 11:16:58', '0000-00-00 00:00:00', '117.99.109.145', 'CHROME', '75', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(25, '1', '2019-09-23 11:29:50', '0000-00-00 00:00:00', '110.227.247.118', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(26, '1', '2019-09-23 17:06:37', '0000-00-00 00:00:00', '110.227.247.118', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(27, '1', '2019-09-24 09:44:53', '0000-00-00 00:00:00', '110.227.232.97', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(28, '1', '2019-09-25 09:42:35', '0000-00-00 00:00:00', '27.57.163.2', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(29, '1', '2019-09-25 14:19:25', '0000-00-00 00:00:00', '27.57.163.2', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(30, '1', '2019-09-26 10:06:40', '0000-00-00 00:00:00', '110.227.236.162', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(31, '1', '2019-09-27 10:24:29', '0000-00-00 00:00:00', '110.227.241.139', 'CHROME', '75', 'WINDOWS', 'THURAIYUR', 'TAMIL NADU', 'INDIA', 78.5991, 11.148),
(32, '1', '2019-09-28 10:51:52', '0000-00-00 00:00:00', '110.227.233.176', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(33, '1', '2019-10-15 10:53:22', '0000-00-00 00:00:00', '27.57.170.75', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(34, '1', '2019-10-15 11:35:19', '0000-00-00 00:00:00', '27.57.170.75', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(35, '1', '2019-10-16 10:28:56', '2019-10-16 15:45:44', '27.57.183.47', 'CHROME', '75', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'NO-DATA', 0, 0),
(36, '1', '2019-10-17 10:23:46', '0000-00-00 00:00:00', '110.227.231.225', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(37, '1', '2019-10-17 14:46:38', '0000-00-00 00:00:00', '110.227.231.225', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(38, '1', '2019-10-21 10:48:04', '0000-00-00 00:00:00', '117.99.96.160', 'CHROME', '75', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(39, '1', '2019-10-22 10:22:48', '0000-00-00 00:00:00', '27.57.167.215', 'CHROME', '75', 'WINDOWS', 'JABALPUR', 'MADHYA PRADESH', 'INDIA', 79.95, 23.1667),
(40, '1', '2019-10-23 10:33:58', '0000-00-00 00:00:00', '27.57.191.59', 'CHROME', '75', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(41, '1', '2019-10-24 11:00:56', '0000-00-00 00:00:00', '110.227.245.84', 'CHROME', '75', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(42, '1', '2019-11-02 18:37:49', '0000-00-00 00:00:00', '27.57.171.236', 'CHROME', '78', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(43, '1', '2019-11-05 11:45:19', '0000-00-00 00:00:00', '117.99.108.115', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(44, '1', '2019-11-05 15:16:30', '0000-00-00 00:00:00', '117.99.108.115', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(45, '1', '2019-11-06 10:22:09', '0000-00-00 00:00:00', '117.99.108.81', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(46, '1', '2019-11-08 10:23:15', '0000-00-00 00:00:00', '122.170.66.41', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(47, '1', '2019-11-09 11:35:19', '0000-00-00 00:00:00', '27.57.164.203', 'CHROME', '78', 'WINDOWS', 'JABALPUR', 'MADHYA PRADESH', 'INDIA', 79.95, 23.1667),
(48, '1', '2019-11-11 10:37:13', '0000-00-00 00:00:00', 'NO-DATA', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(49, '1', '2019-11-12 10:48:23', '0000-00-00 00:00:00', '122.170.45.215', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(50, '1', '2019-11-13 11:12:52', '0000-00-00 00:00:00', '117.99.102.148', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(51, '1', '2019-11-14 10:31:11', '0000-00-00 00:00:00', '122.170.50.214', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(52, '1', '2019-11-19 10:04:39', '0000-00-00 00:00:00', '122.170.30.232', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(53, '1', '2019-11-20 11:57:47', '0000-00-00 00:00:00', '122.170.46.95', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(54, '1', '2019-11-21 12:03:25', '0000-00-00 00:00:00', '110.227.228.168', 'CHROME', '78', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(55, '1', '2019-11-22 12:08:55', '2019-11-23 10:48:29', '122.170.69.202', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(56, '1', '2019-11-23 10:48:40', '0000-00-00 00:00:00', '110.227.224.169', 'CHROME', '78', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(57, '1', '2019-11-28 16:09:09', '0000-00-00 00:00:00', '117.99.101.53', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(58, '1', '2019-11-28 16:50:50', '0000-00-00 00:00:00', '117.99.101.53', 'CHROME', '78', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(59, '1', '2019-11-29 11:32:58', '0000-00-00 00:00:00', '110.227.230.142', 'CHROME', '78', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(60, '1', '2019-11-29 14:36:04', '0000-00-00 00:00:00', '110.227.230.142', 'CHROME', '78', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(61, '1', '2019-12-03 14:53:35', '0000-00-00 00:00:00', '122.170.64.236', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(62, '1', '2019-12-04 11:12:42', '0000-00-00 00:00:00', '122.170.58.108', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(63, '1', '2019-12-06 10:32:14', '0000-00-00 00:00:00', '122.170.31.109', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(64, '1', '2019-12-06 11:37:47', '0000-00-00 00:00:00', '122.170.31.109', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(65, '1', '2019-12-07 15:51:40', '0000-00-00 00:00:00', '122.170.60.66', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(66, '1', '2019-12-09 10:52:50', '0000-00-00 00:00:00', '110.227.227.214', 'CHROME', '78', 'WINDOWS', 'MADURAI', 'TAMIL NADU', 'INDIA', 78.1167, 9.9333),
(67, '1', '2019-12-09 14:45:36', '0000-00-00 00:00:00', '110.227.227.214', 'CHROME', '78', 'WINDOWS', 'MADURAI', 'TAMIL NADU', 'INDIA', 78.1167, 9.9333),
(68, '1', '2019-12-11 10:43:03', '0000-00-00 00:00:00', '27.57.187.160', 'CHROME', '78', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(69, '1', '2019-12-12 10:29:13', '0000-00-00 00:00:00', '122.170.56.234', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(70, '1', '2019-12-12 11:21:16', '0000-00-00 00:00:00', '122.170.56.234', 'CHROME', '78', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(71, '1', '2019-12-13 11:01:36', '0000-00-00 00:00:00', '27.57.174.67', 'CHROME', '79', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(72, '1', '2019-12-16 10:43:08', '0000-00-00 00:00:00', '27.57.187.175', 'CHROME', '79', 'WINDOWS', 'BHOPAL', 'MADHYA PRADESH', 'INDIA', 77.4, 23.2667),
(73, '1', '2019-12-17 09:59:13', '0000-00-00 00:00:00', '117.99.101.206', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(74, '5', '2019-12-17 12:12:47', '2019-12-17 12:13:53', '117.99.101.206', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(75, '5', '2019-12-17 12:14:20', '2019-12-17 12:14:26', '117.99.101.206', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(76, '6', '2019-12-17 12:16:22', '2019-12-17 12:16:35', '117.99.101.206', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(77, '5', '2019-12-17 12:21:17', '2019-12-17 12:22:53', '117.99.101.206', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(78, '1', '2019-12-19 11:18:45', '0000-00-00 00:00:00', '110.227.246.191', 'CHROME', '79', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(79, '1', '2019-12-27 14:32:12', '0000-00-00 00:00:00', '117.99.98.255', 'CHROME', '79', 'WINDOWS', 'NO-DATA', 'NO-DATA', 'INDIA', 77, 20),
(80, '1', '2020-01-04 11:48:39', '0000-00-00 00:00:00', '122.170.76.36', 'CHROME', '79', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(81, '7', '2020-01-04 12:06:42', '0000-00-00 00:00:00', '122.170.76.36', 'CHROME', '79', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(82, '1', '2020-01-08 14:13:17', '0000-00-00 00:00:00', '122.170.61.247', 'CHROME', '79', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(83, '7', '2020-01-08 16:07:17', '0000-00-00 00:00:00', '122.170.61.247', 'CHROME', '79', 'WINDOWS', 'AHMEDABAD', 'GUJARAT', 'INDIA', 72.6167, 23.0333),
(84, '1', '2020-01-09 12:51:20', '0000-00-00 00:00:00', '110.227.231.25', 'CHROME', '78', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(85, '1', '2020-01-09 13:06:31', '0000-00-00 00:00:00', '110.227.231.25', 'CHROME', '79', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(86, '1', '2020-01-09 15:21:41', '0000-00-00 00:00:00', '110.227.231.25', 'CHROME', '79', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833),
(87, '1', '2020-01-09 17:29:58', '0000-00-00 00:00:00', '110.227.231.25', 'CHROME', '79', 'WINDOWS', 'CHENNAI', 'TAMIL NADU', 'INDIA', 80.2833, 13.0833);

-- --------------------------------------------------------

--
-- Table structure for table `mode_of_dispatch`
--

DROP TABLE IF EXISTS `mode_of_dispatch`;
CREATE TABLE IF NOT EXISTS `mode_of_dispatch` (
  `mode_dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_dispatch` varchar(250) NOT NULL,
  `mode_des_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`mode_dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module_mst`
--

DROP TABLE IF EXISTS `module_mst`;
CREATE TABLE IF NOT EXISTS `module_mst` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_mst`
--

INSERT INTO `module_mst` (`module_id`, `module_name`, `module_status`, `cdate`, `userid`) VALUES
(1, 'Admin', 0, '2019-09-02 01:14:25', 0),
(2, 'Customer', 0, '2019-09-02 01:14:25', 0),
(3, 'Opportunity', 0, '2019-09-02 01:14:40', 0),
(4, 'Activity', 0, '2019-09-02 01:14:40', 0),
(5, 'Quotation', 0, '2019-09-02 01:14:53', 0),
(6, 'Forecast', 0, '2019-09-02 01:14:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

DROP TABLE IF EXISTS `payment_mode`;
CREATE TABLE IF NOT EXISTS `payment_mode` (
  `mode_id` double NOT NULL AUTO_INCREMENT,
  `mode_name` varchar(100) NOT NULL,
  `mode_status` int(11) NOT NULL DEFAULT '1',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` double NOT NULL,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`mode_id`, `mode_name`, `mode_status`, `cdate`, `user_id`) VALUES
(1, 'CASH', 1, '2016-11-22 12:23:05', 0),
(2, 'CHEQUE', 1, '2016-11-22 12:23:07', 0),
(3, 'NEFT', 1, '2016-11-22 12:23:09', 0),
(4, 'RTGS', 1, '2016-11-22 12:23:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pay_terms`
--

DROP TABLE IF EXISTS `pay_terms`;
CREATE TABLE IF NOT EXISTS `pay_terms` (
  `terms_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_terms` varchar(250) NOT NULL,
  `payment_days` int(11) NOT NULL,
  `terms_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`terms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state_mst`
--

DROP TABLE IF EXISTS `state_mst`;
CREATE TABLE IF NOT EXISTS `state_mst` (
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

--
-- Dumping data for table `state_mst`
--

INSERT INTO `state_mst` (`stateid`, `state_name`, `gst_state_code`, `countryid`, `state_status`, `cdate`, `user_id`, `usertype_id`) VALUES
(1, 'Gujarat', 24, 101, 0, '2018-04-13 01:21:41', 0, 0),
(2, 'Andhra Pradesh', 28, 101, 0, '2018-04-13 01:21:41', 0, 0),
(3, 'Arunachal Pradesh', 12, 101, 0, '2018-04-13 01:21:41', 0, 0),
(4, 'Assam', 18, 101, 0, '2018-04-13 01:21:41', 0, 0),
(5, 'Bihar', 10, 101, 0, '2018-04-13 01:21:41', 0, 0),
(6, 'Chhattisgarh', 22, 101, 0, '2018-04-13 01:21:41', 0, 0),
(7, 'Goa', 30, 101, 0, '2018-04-13 01:21:41', 0, 0),
(9, 'Haryana', 6, 101, 0, '2018-04-13 01:21:41', 0, 0),
(10, 'Himachal Pradesh', 2, 101, 0, '2018-04-13 01:21:41', 0, 0),
(11, 'Jammu & Kashmir', 1, 101, 0, '2018-04-13 01:21:41', 0, 0),
(12, 'Jharkhand', 20, 101, 0, '2018-04-13 01:21:41', 0, 0),
(13, 'Karnataka', 29, 101, 0, '2018-04-13 01:21:41', 0, 0),
(14, 'Kerala', 32, 101, 0, '2018-04-13 01:21:41', 0, 0),
(15, 'Madhya Pradesh', 23, 101, 0, '2018-04-13 01:21:41', 0, 0),
(16, 'Maharashtra', 27, 101, 0, '2018-04-13 01:21:41', 0, 0),
(17, 'Manipur', 14, 101, 0, '2018-04-13 01:21:41', 0, 0),
(18, 'Meghalaya', 17, 101, 0, '2018-04-13 01:21:41', 0, 0),
(19, 'Mizoram', 15, 101, 0, '2018-04-13 01:21:41', 0, 0),
(20, 'Nagaland', 13, 101, 0, '2018-04-13 01:21:41', 0, 0),
(21, 'Odisha (Formerly Orissa', 21, 101, 0, '2018-04-13 01:21:41', 0, 0),
(22, 'Punjab', 3, 101, 0, '2018-04-13 01:21:41', 0, 0),
(23, 'Rajasthan', 8, 101, 0, '2018-04-13 01:21:41', 0, 0),
(24, 'Sikkim', 11, 101, 0, '2018-04-13 01:21:41', 0, 0),
(25, 'Tamil Nadu', 33, 101, 0, '2018-04-13 01:21:41', 0, 0),
(26, 'Tripura', 16, 101, 0, '2018-04-13 01:21:41', 0, 0),
(27, 'Uttar Pradesh', 9, 101, 0, '2018-04-13 01:21:41', 0, 0),
(29, 'West Bengal', 19, 101, 0, '2018-04-13 01:21:41', 0, 0),
(32, 'Delhi', 7, 101, 0, '2018-04-13 01:21:41', 0, 0),
(34, 'DUBAI', 0, 229, 0, '2018-04-13 03:37:03', 0, 0),
(35, 'ABU DHABI', 0, 229, 0, '2018-04-13 06:02:04', 0, 0),
(36, 'DEMO', 0, 101, 2, '2019-09-09 01:48:01', 0, 0),
(37, 'DEMO TEST1', 898981, 101, 2, '2019-09-09 01:47:59', 0, 0),
(38, 'SSS', 12, 96, 2, '2019-09-09 01:47:46', 0, 0),
(39, '1231', 123123, 95, 2, '2019-09-09 01:47:53', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_alert_mst`
--

DROP TABLE IF EXISTS `task_alert_mst`;
CREATE TABLE IF NOT EXISTS `task_alert_mst` (
  `task_alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_alert_name` varchar(400) NOT NULL,
  `task_gap_minutes` bigint(20) NOT NULL,
  `task_alert_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_alert_mst`
--

INSERT INTO `task_alert_mst` (`task_alert_id`, `task_alert_name`, `task_gap_minutes`, `task_alert_status`) VALUES
(1, 'None', 0, 0),
(2, 'At the Time of Event', 0, 0),
(3, '5 Minutes Before', 5, 0),
(4, '15 Minutes Before', 15, 0),
(5, '30 Minutes Before', 30, 0),
(6, '1 Hour Before', 60, 0),
(7, '1 Day Before', 1440, 0),
(8, '1 Week Before', 10080, 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_priority_mst`
--

DROP TABLE IF EXISTS `task_priority_mst`;
CREATE TABLE IF NOT EXISTS `task_priority_mst` (
  `task_priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_priority_name` varchar(400) NOT NULL,
  `task_priority_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_priority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_priority_mst`
--

INSERT INTO `task_priority_mst` (`task_priority_id`, `task_priority_name`, `task_priority_status`) VALUES
(1, 'High', 0),
(2, 'Medium', 0),
(3, 'Low', 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_rel_mst`
--

DROP TABLE IF EXISTS `task_rel_mst`;
CREATE TABLE IF NOT EXISTS `task_rel_mst` (
  `task_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_rel_name` varchar(400) NOT NULL,
  `task_rel_status` int(11) NOT NULL COMMENT '0 : Active , 1: Inactive',
  PRIMARY KEY (`task_rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_rel_mst`
--

INSERT INTO `task_rel_mst` (`task_rel_id`, `task_rel_name`, `task_rel_status`) VALUES
(1, 'General', 0),
(2, 'AMC', 0),
(3, 'Person', 0),
(4, 'Company', 0),
(5, 'Inquiry', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_annexure`
--

DROP TABLE IF EXISTS `tbl_annexure`;
CREATE TABLE IF NOT EXISTS `tbl_annexure` (
  `an_id` int(10) NOT NULL AUTO_INCREMENT,
  `an_name` varchar(400) NOT NULL,
  `an_priority` int(11) NOT NULL,
  `an_detail` longtext NOT NULL,
  `an_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`an_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_annexure`
--

INSERT INTO `tbl_annexure` (`an_id`, `an_name`, `an_priority`, `an_detail`, `an_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'ENVIRON LAB DIV', 0, '<p><strong>Water/Waste Water Analysis</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Soil /Sludge/Solid waste Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Available Nitrogen as N</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Available Phosphorus</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Bulk Density</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chloride</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Color</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Moisture</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Organic Carbon</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Organic Matter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio (SAR) in Soil Extract</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>650</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Phosphate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Water Holding Capacity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charges</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Stack Monitoring & Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SPM</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>NOx</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charges</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>2500</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Ambient Air Monitoring & Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SPM</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>NO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>RSPM ( PM10)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>PM2.5</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>1000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling charge ( 8 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>2000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charge ( 24 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>3000</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Noise Monitoring</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Noise Monitoring (One time)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>1000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Noise Monitoring (24 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>3000</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<h2 style=\"text-align: center;\"><span class=\"marker\"><strong>Level 1</strong></span></h2>\r\n\r\n<div style=\"text-align: center;\"><img alt=\"Image Here\" src=\"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png\" style=\"width: 272px; height: 92px;\" /></div>\r\n\r\n<h2 style=\"text-align: center;\"><span class=\"marker\"><strong>Level 2</strong></span></h2>\r\n', 0, '2019-12-04 11:25:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bom`
--

DROP TABLE IF EXISTS `tbl_bom`;
CREATE TABLE IF NOT EXISTS `tbl_bom` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bom`
--

INSERT INTO `tbl_bom` (`bom_id`, `bom_no`, `bom_date`, `sales_order_id`, `so_trn_id`, `bom_trn_ttl`, `cdate`, `bom_status`, `user_id`, `company_id`) VALUES
(1, 'BOM/002/19-20', '2019-10-23', 1, 1, 3100.00, '2019-10-23 02:02:44', 2, 1, 1),
(2, 'BOM/003/19-20', '2019-10-24', 1, 1, 3000.00, '2019-10-24 00:12:22', 0, 1, 1),
(3, 'BOM/004/19-20', '2019-10-24', 2, 3, 2100.00, '2019-10-24 03:01:15', 0, 1, 1),
(4, 'BOM/005/19-20', '2019-10-24', 2, 2, 220.00, '2019-11-06 12:24:15', 0, 1, 1),
(5, 'BOM/006/19-20', '2019-11-11', 3, 4, 28000.00, '2019-11-11 09:42:54', 0, 1, 1),
(6, 'BOM/007/19-20', '2019-11-22', 5, 8, 2800.00, '2019-11-22 06:57:39', 0, 1, 1),
(7, 'BOM/008/19-20', '2019-12-12', 6, 9, 2900.00, '2019-12-13 11:29:34', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bom_trn`
--

DROP TABLE IF EXISTS `tbl_bom_trn`;
CREATE TABLE IF NOT EXISTS `tbl_bom_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bom_trn`
--

INSERT INTO `tbl_bom_trn` (`bom_trn_id`, `bom_id`, `req_product_id`, `req_product_desc`, `req_product_qty`, `req_product_rate`, `req_unitid`, `req_product_amount`, `plantrn_start_date`, `plantrn_end_date`, `plantrn_status`, `bom_trn_status`, `req_status`, `out_stk`, `p_done_status`, `user_id`) VALUES
(4, 1, 7, '', 10.00, 100.00, 1, 1000.00, '0000-00-00', '0000-00-00', 0, 2, 0, 0.00, 0, 1),
(5, 1, 8, 'sem1 desc', 20.00, 105.00, 3, 2100.00, '0000-00-00', '0000-00-00', 0, 2, 0, 0.00, 0, 1),
(9, 2, 7, '', 10.00, 100.00, 1, 1000.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(10, 2, 8, 'sem1 desc', 20.00, 100.00, 3, 2000.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(12, 3, 7, '', 10.00, 10.00, 3, 100.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(13, 3, 8, '', 20.00, 100.00, 4, 2000.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(15, 4, 7, '', 1.00, 20.00, 1, 20.00, '0000-00-00', '0000-00-00', 0, 0, 1, 0.00, 0, 1),
(16, 4, 8, '', 2.00, 100.00, 3, 200.00, '0000-00-00', '0000-00-00', 0, 0, 1, 0.00, 0, 1),
(17, 5, 7, '', 100.00, 80.00, 0, 8000.00, '2019-11-02', '2019-11-26', 1, 0, 1, 0.00, 0, 1),
(18, 5, 8, 'abcdcasdca', 200.00, 100.00, 0, 20000.00, '2019-11-01', '2019-11-11', 1, 0, 1, 0.00, 1, 1),
(19, 6, 7, '', 10.00, 80.00, 0, 800.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(20, 6, 8, '', 20.00, 100.00, 3, 2000.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1),
(21, 7, 7, '', 10.00, 80.00, 0, 800.00, '0000-00-00', '0000-00-00', 0, 0, 1, 0.00, 1, 1),
(22, 7, 8, 'se vsvvs', 20.00, 100.00, 3, 2000.00, '0000-00-00', '0000-00-00', 0, 0, 1, 4.00, 1, 1),
(24, 7, 9, '', 1.00, 100.00, 3, 100.00, '0000-00-00', '0000-00-00', 0, 0, 0, 0.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_pid` int(10) NOT NULL,
  `cat_status` int(10) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `cat_name`, `cat_pid`, `cat_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'DEMO', 0, 2, '2019-09-09 14:20:11', 1, 1),
(2, 'DEMO1111111', 0, 2, '2019-09-09 14:21:05', 1, 1),
(3, 'VENDOR', 0, 0, '2019-09-09 14:21:38', 1, 1),
(4, 'CCA RENEWAL', 0, 0, '2019-09-09 14:21:43', 1, 1),
(5, 'EVAPORATOR', 0, 0, '2019-09-09 14:21:51', 1, 1),
(6, 'STP - AMC', 0, 0, '2019-09-09 14:21:55', 1, 1),
(7, 'R.O. PLANT', 0, 0, '2019-09-09 14:22:00', 1, 1),
(8, 'NOC/CCA RENEWAL', 0, 0, '2019-09-09 14:23:50', 1, 1),
(9, 'TEST CAT 1', 0, 0, '2019-11-19 15:39:51', 1, 1),
(10, 'TEST CAT 2', 0, 0, '2019-11-19 15:42:17', 1, 1),
(11, 'TEST CAT 3', 0, 0, '2019-11-19 15:49:22', 1, 1),
(12, 'TEST CAT 4', 0, 0, '2019-11-19 15:49:43', 1, 1),
(13, 'TEST CAT 5', 0, 0, '2019-11-19 15:50:10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE IF NOT EXISTS `tbl_company` (
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

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`company_id`, `company_name`, `cstno`, `cst_date`, `vatno`, `vat_date`, `serno`, `ser_date`, `logo_content`, `conditions`, `challan_condition`, `quot_condition`, `po_condition`, `show_disc`, `show_charges`, `letter_head_top_margin`, `letter_head_bottom_margin`, `letter_head_left_margin`, `letter_head_right_margin`, `dispatch_head_content`, `dispatch_footer_content`, `inq_email_content`, `quot_email_content`, `po_email_content`, `software_type`, `series_same`, `cdate`, `com_status`, `user_id`, `company_alias`, `comp_add1`, `comp_add2`, `comp_add3`, `countryid`, `stateid`, `cityid`, `comp_pincode`, `comp_email`, `comp_web`, `comp_mobile`, `comp_toll`, `comp_gst`, `comp_cin`, `comp_pan`, `comp_ryear`, `comp_per_currency`, `h_logo`, `f_logo`) VALUES
(1, 'Environ', '24575106323', '2011-01-10', '2ABCDxxxx', '2011-01-10', '', '1970-01-01', '', '', '', '', '', 2, 2, 1.80, 1.00, 0.20, 0.20, '', '', 'Hello,<br />\r\nWe thank you for your enquiry.<br />\r\n<br />\r\nOur sales team shall contact you soon, to understand your specific requirements and revert with the<br />\r\n<br />\r\nthe appropriate solution, specifications and terms.<br />\r\nThank you and assuring you of our best attention and services at all times,', 'Hello,<br />\r\n<br />\r\nThis is the Quotation Greeting text.', 'Hello,<br />\r\n<br />\r\nThis is the Purchase Order Content.', 2, 2, '2019-12-10 10:39:20', 0, 1, 'ENV 2', 'G-608, titanium city center', '', '', 101, 1, 1, '', '', '', '990413444', '', '24GUJXXXXXXXXXADZ', '', '', '', 0, 'header7869.jpg', 'footer3611.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_bank`
--

DROP TABLE IF EXISTS `tbl_company_bank`;
CREATE TABLE IF NOT EXISTS `tbl_company_bank` (
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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company_certi`
--

DROP TABLE IF EXISTS `tbl_company_certi`;
CREATE TABLE IF NOT EXISTS `tbl_company_certi` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_path` longtext NOT NULL,
  `im_name` longtext NOT NULL,
  `im_status` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_company_certi`
--

INSERT INTO `tbl_company_certi` (`img_id`, `im_path`, `im_name`, `im_status`, `cdate`, `user_id`, `company_id`) VALUES
(4, '125.jpg', 'CERTI 2', 0, '2019-09-04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conv_rate`
--

DROP TABLE IF EXISTS `tbl_conv_rate`;
CREATE TABLE IF NOT EXISTS `tbl_conv_rate` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_conv_rate`
--

INSERT INTO `tbl_conv_rate` (`conv_id`, `conv_st_date`, `conv_base`, `conv_currency`, `conv_rate`, `conv_status`, `cdate`, `user_id`, `company_id`, `loop_count`) VALUES
(9, '2019-09-11', '2', 36, 777.00, 0, '2019-09-10 16:39:03', 1, 1, 1),
(10, '2019-09-11', '2', 76, 888.00, 0, '2019-09-10 16:39:03', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currency`
--

DROP TABLE IF EXISTS `tbl_currency`;
CREATE TABLE IF NOT EXISTS `tbl_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(64) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`currency_id`),
  KEY `idx_currency_name` (`currency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_currency`
--

INSERT INTO `tbl_currency` (`currency_id`, `currency_name`, `currency_code`) VALUES
(1, 'Andorran Peseta', 'ADP'),
(2, 'United Arab Emirates Dirham', 'AED'),
(3, 'Afghanistan Afghani', 'AFA'),
(4, 'Albanian Lek', 'ALL'),
(5, 'Netherlands Antillian Guilder', 'ANG'),
(6, 'Angolan Kwanza', 'AOK'),
(7, 'Argentine Peso', 'ARS'),
(9, 'Australian Dollar', 'AUD'),
(10, 'Aruban Florin', 'AWG'),
(11, 'Barbados Dollar', 'BBD'),
(12, 'Bangladeshi Taka', 'BDT'),
(14, 'Bulgarian Lev', 'BGN'),
(15, 'Bahraini Dinar', 'BHD'),
(16, 'Burundi Franc', 'BIF'),
(17, 'Bermudian Dollar', 'BMD'),
(18, 'Brunei Dollar', 'BND'),
(19, 'Bolivian Boliviano', 'BOB'),
(20, 'Brazilian Real', 'BRL'),
(21, 'Bahamian Dollar', 'BSD'),
(22, 'Bhutan Ngultrum', 'BTN'),
(23, 'Burma Kyat', 'BUK'),
(24, 'Botswanian Pula', 'BWP'),
(25, 'Belize Dollar', 'BZD'),
(26, 'Canadian Dollar', 'CAD'),
(27, 'Swiss Franc', 'CHF'),
(28, 'Chilean Unidades de Fomento', 'CLF'),
(29, 'Chilean Peso', 'CLP'),
(30, 'Yuan (Chinese) Renminbi', 'CNY'),
(31, 'Colombian Peso', 'COP'),
(32, 'Costa Rican Colon', 'CRC'),
(33, 'Czech Republic Koruna', 'CZK'),
(34, 'Cuban Peso', 'CUP'),
(35, 'Cape Verde Escudo', 'CVE'),
(36, 'Cyprus Pound', 'CYP'),
(40, 'Danish Krone', 'DKK'),
(41, 'Dominican Peso', 'DOP'),
(42, 'Algerian Dinar', 'DZD'),
(43, 'Ecuador Sucre', 'ECS'),
(44, 'Egyptian Pound', 'EGP'),
(45, 'Estonian Kroon (EEK)', 'EEK'),
(46, 'Ethiopian Birr', 'ETB'),
(47, 'Euro', 'EUR'),
(49, 'Fiji Dollar', 'FJD'),
(50, 'Falkland Islands Pound', 'FKP'),
(52, 'British Pound', 'GBP'),
(53, 'Ghanaian Cedi', 'GHC'),
(54, 'Gibraltar Pound', 'GIP'),
(55, 'Gambian Dalasi', 'GMD'),
(56, 'Guinea Franc', 'GNF'),
(58, 'Guatemalan Quetzal', 'GTQ'),
(59, 'Guinea-Bissau Peso', 'GWP'),
(60, 'Guyanan Dollar', 'GYD'),
(61, 'Hong Kong Dollar', 'HKD'),
(62, 'Honduran Lempira', 'HNL'),
(63, 'Haitian Gourde', 'HTG'),
(64, 'Hungarian Forint', 'HUF'),
(65, 'Indonesian Rupiah', 'IDR'),
(66, 'Irish Punt', 'IEP'),
(67, 'Israeli Shekel', 'ILS'),
(68, 'Indian Rupee', 'INR'),
(69, 'Iraqi Dinar', 'IQD'),
(70, 'Iranian Rial', 'IRR'),
(73, 'Jamaican Dollar', 'JMD'),
(74, 'Jordanian Dinar', 'JOD'),
(75, 'Japanese Yen', 'JPY'),
(76, 'Kenyan Schilling', 'KES'),
(77, 'Kampuchean (Cambodian) Riel', 'KHR'),
(78, 'Comoros Franc', 'KMF'),
(79, 'North Korean Won', 'KPW'),
(80, '(South) Korean Won', 'KRW'),
(81, 'Kuwaiti Dinar', 'KWD'),
(82, 'Cayman Islands Dollar', 'KYD'),
(83, 'Lao Kip', 'LAK'),
(84, 'Lebanese Pound', 'LBP'),
(85, 'Sri Lanka Rupee', 'LKR'),
(86, 'Liberian Dollar', 'LRD'),
(87, 'Lesotho Loti', 'LSL'),
(89, 'Libyan Dinar', 'LYD'),
(90, 'Moroccan Dirham', 'MAD'),
(91, 'Malagasy Franc', 'MGF'),
(92, 'Mongolian Tugrik', 'MNT'),
(93, 'Macau Pataca', 'MOP'),
(94, 'Mauritanian Ouguiya', 'MRO'),
(95, 'Maltese Lira', 'MTL'),
(96, 'Mauritius Rupee', 'MUR'),
(97, 'Maldive Rufiyaa', 'MVR'),
(98, 'Malawi Kwacha', 'MWK'),
(99, 'Mexican Peso', 'MXP'),
(100, 'Malaysian Ringgit', 'MYR'),
(101, 'Mozambique Metical', 'MZM'),
(102, 'Namibian Dollar', 'NAD'),
(103, 'Nigerian Naira', 'NGN'),
(104, 'Nicaraguan Cordoba', 'NIO'),
(105, 'Norwegian Kroner', 'NOK'),
(106, 'Nepalese Rupee', 'NPR'),
(107, 'New Zealand Dollar', 'NZD'),
(108, 'Omani Rial', 'OMR'),
(109, 'Panamanian Balboa', 'PAB'),
(110, 'Peruvian Nuevo Sol', 'PEN'),
(111, 'Papua New Guinea Kina', 'PGK'),
(112, 'Philippine Peso', 'PHP'),
(113, 'Pakistan Rupee', 'PKR'),
(114, 'Polish Zloty', 'PLN'),
(116, 'Paraguay Guarani', 'PYG'),
(117, 'Qatari Rial', 'QAR'),
(118, 'Romanian Leu', 'RON'),
(119, 'Rwanda Franc', 'RWF'),
(120, 'Saudi Arabian Riyal', 'SAR'),
(121, 'Solomon Islands Dollar', 'SBD'),
(122, 'Seychelles Rupee', 'SCR'),
(123, 'Sudanese Pound', 'SDP'),
(124, 'Swedish Krona', 'SEK'),
(125, 'Singapore Dollar', 'SGD'),
(126, 'St. Helena Pound', 'SHP'),
(127, 'Sierra Leone Leone', 'SLL'),
(128, 'Somali Schilling', 'SOS'),
(129, 'Suriname Guilder', 'SRG'),
(130, 'Sao Tome and Principe Dobra', 'STD'),
(131, 'Russian Ruble', 'RUB'),
(132, 'El Salvador Colon', 'SVC'),
(133, 'Syrian Potmd', 'SYP'),
(134, 'Swaziland Lilangeni', 'SZL'),
(135, 'Thai Baht', 'THB'),
(136, 'Tunisian Dinar', 'TND'),
(137, 'Tongan Paanga', 'TOP'),
(138, 'East Timor Escudo', 'TPE'),
(139, 'Turkish Lira', 'TRY'),
(140, 'Trinidad and Tobago Dollar', 'TTD'),
(141, 'Taiwan Dollar', 'TWD'),
(142, 'Tanzanian Schilling', 'TZS'),
(143, 'Uganda Shilling', 'UGX'),
(144, 'US Dollar', 'USD'),
(145, 'Uruguayan Peso', 'UYU'),
(146, 'Venezualan Bolivar', 'VEF'),
(147, 'Vietnamese Dong', 'VND'),
(148, 'Vanuatu Vatu', 'VUV'),
(149, 'Samoan Tala', 'WST'),
(150, 'CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BEAC, Francs', 'XAF'),
(151, 'Silver, Ounces', 'XAG'),
(152, 'Gold, Ounces', 'XAU'),
(153, 'East Caribbean Dollar', 'XCD'),
(154, 'International Monetary Fund (IMF) Special Drawing Rights', 'XDR'),
(155, 'CommunautÃƒÂ© FinanciÃƒÂ¨re Africaine BCEAO - Francs', 'XOF'),
(156, 'Palladium Ounces', 'XPD'),
(157, 'Comptoirs FranÃƒÂ§ais du Pacifique Francs', 'XPF'),
(158, 'Platinum, Ounces', 'XPT'),
(159, 'Democratic Yemeni Dinar', 'YDD'),
(160, 'Yemeni Rial', 'YER'),
(161, 'New Yugoslavia Dinar', 'YUD'),
(162, 'South African Rand', 'ZAR'),
(163, 'Zambian Kwacha', 'ZMK'),
(164, 'Zaire Zaire', 'ZRZ'),
(165, 'Zimbabwe Dollar', 'ZWD'),
(166, 'Slovak Koruna', 'SKK'),
(167, 'Armenian Dram', 'AMD');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`cust_id`, `party_type`, `cust_name`, `cust_creator`, `cust_code`, `cust_cat`, `cust_desc`, `cust_ind`, `cust_type`, `cust_source`, `cust_gst`, `cust_mobile`, `cust_email`, `cust_assign_user`, `cdate`, `cust_status`, `cust_block_status`, `user_id`, `company_id`, `cust_code_series`) VALUES
(3, 0, 'DHAVAL', 0, 'CUS092019-1', 3, 'DEMO DESCRIPTION OF THE CUSTOMER', 3, 3, 5, '2147483647', '9033891186', 'DHAVAL@GMAIL.COM', '1,3', '2019-09-11 01:20:55', 2, 0, 1, 1, 1),
(4, 0, 'DHAVAL D UPADHYAY1', 1, 'CUS092019-2', 6, 'DEMO1', 1, 1, 1, '2147483647', '90338911861', 'DHAVALUPADHYAY717@GMAIL.COM', '0', '2019-09-18 01:32:31', 0, 0, 1, 1, 4),
(5, 0, '', 1, '', 0, '', 0, 0, 0, '0', '', '', '', '2019-09-11 07:48:53', 2, 0, 1, 1, 0),
(6, 0, '', 1, '', 0, '', 0, 0, 0, '0', '', '', '', '2019-09-11 07:49:27', 2, 0, 1, 1, 0),
(7, 0, '', 1, '', 0, '', 0, 0, 0, '0', '', '', '', '2019-09-11 07:50:14', 2, 0, 1, 1, 0),
(8, 0, 'ABHI', 1, '', 5, '', 1, 3, 1, '0', '9904704144', 'ABHI.METR@GMAIL.COM', '', '2019-09-27 00:17:52', 0, 0, 1, 1, 0),
(9, 0, 'ABHI PVT LTD', 1, '', 5, '', 0, 0, 0, '24AXXXXXXXXDZ', '', '', '', '2019-11-08 11:58:17', 0, 0, 1, 1, 6),
(10, 0, 'MS. DINA', 1, 'CUS112019-7', 3, '', 0, 0, 0, '', '', '', '', '2019-11-22 09:32:11', 0, 0, 1, 1, 9),
(11, 2, 'ABHI VENDOR', 1, 'CUS112019-10', 0, '', 0, 0, 0, '', '', '', '', '2019-11-22 09:46:51', 0, 0, 1, 1, 10),
(12, 0, 'Company Name', 1, 'CUS112019-11', 0, 'Notes', 0, 0, 0, 'Gst No', 'Mobile', 'e-mail', '', '2019-11-29 11:27:52', 0, 0, 1, 1, 11),
(13, 1, 'TEST IMPORT 1', 1, 'CUS112019-12', 1, 'CUST NOTES', 2, 0, 1, '24axxxxz', '123456789', 'abhi.metr@gmail.com', '', '2019-12-03 10:14:23', 0, 0, 1, 1, 13),
(14, 0, 'test import 2', 1, 'CUS122019-14', 0, '', 0, 0, 0, '', '', '', '', '2019-12-09 10:31:12', 0, 0, 1, 1, 14),
(15, 0, 'test import 3', 1, 'CUS122019-15', 0, '', 0, 0, 0, '', '', '', '', '2019-12-09 10:33:02', 0, 0, 1, 1, 16),
(16, 0, 'vendor 1', 1, 'CUS122019-17', 0, '', 0, 0, 0, '', '', '', '', '2019-12-09 10:34:30', 0, 0, 1, 1, 17),
(17, 0, 'Test Customer 1', 1, 'CUS012020-18', 0, '', 1, 1, 2, '', '1234567890', 'test1@gmail.com', '', '2020-01-04 06:42:02', 0, 0, 1, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_category`
--

DROP TABLE IF EXISTS `tbl_customer_category`;
CREATE TABLE IF NOT EXISTS `tbl_customer_category` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(100) NOT NULL,
  `cc_status` int(11) NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_category`
--

INSERT INTO `tbl_customer_category` (`cc_id`, `cc_name`, `cc_status`) VALUES
(1, 'AMC', 0),
(2, 'Consultant / Trader', 0),
(3, 'End Customer', 0),
(4, 'EPC', 0),
(5, 'Individual', 0),
(6, 'VENDOR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_industry`
--

DROP TABLE IF EXISTS `tbl_customer_industry`;
CREATE TABLE IF NOT EXISTS `tbl_customer_industry` (
  `ci_id` int(11) NOT NULL AUTO_INCREMENT,
  `ci_name` varchar(100) NOT NULL,
  `ci_status` int(11) NOT NULL,
  PRIMARY KEY (`ci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_industry`
--

INSERT INTO `tbl_customer_industry` (`ci_id`, `ci_name`, `ci_status`) VALUES
(1, 'Automotive', 0),
(2, 'Blower', 0),
(3, 'Breweries', 0),
(4, 'Cement', 0),
(5, 'Centrifuge', 0),
(6, 'CHEMICALS', 0),
(7, 'TEST IND 11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_type`
--

DROP TABLE IF EXISTS `tbl_customer_type`;
CREATE TABLE IF NOT EXISTS `tbl_customer_type` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(100) NOT NULL,
  `ct_status` int(11) NOT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer_type`
--

INSERT INTO `tbl_customer_type` (`ct_id`, `ct_name`, `ct_status`) VALUES
(1, 'Adult', 0),
(2, 'Dealer', 0),
(3, 'Existing Customer', 0),
(4, 'Existing Partner', 0),
(5, 'Manufacturer', 0),
(6, 'New Customer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_address`
--

DROP TABLE IF EXISTS `tbl_cust_address`;
CREATE TABLE IF NOT EXISTS `tbl_cust_address` (
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_address`
--

INSERT INTO `tbl_cust_address` (`c_add_id`, `cust_id`, `c_add_location`, `c_add_street`, `c_add_country`, `c_add_state`, `c_add_city`, `c_add_zip`, `c_add_status`, `cdate`, `user_id`, `company_id`) VALUES
(6, 4, 'KHARPADA NO MAHAD', 'MANDIBAZAR', 101, 1, 106, '384151', 0, 2019, 1, 1),
(8, 4, 'ASDSAD', 'ASDASD', 101, 1, 3, '123123', 0, 2019, 1, 1),
(9, 8, 'TEST', 'TETS A', 101, 1, 1, '1234', 0, 2019, 1, 1),
(10, 8, 'TEST 2 ', 'TESTE B', 101, 1, 2, '26651', 0, 2019, 1, 1),
(11, 12, 'Location', 'Street', 0, 0, 0, 'Postal Code', 0, 2019, 1, 1),
(12, 13, 'titanium city center', 'satellite', 101, 1, 1, '380015', 0, 2019, 1, 1),
(14, 15, 'G-608, Titanium City center', 'Satellite', 101, 1, 1, '380015', 0, 2019, 1, 1),
(15, 16, 'phase 4', 'vatva', 101, 1, 1, '123456', 0, 2019, 1, 1),
(16, 17, '123', 'abcv', 101, 1, 1, '1234', 0, 2020, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_contact`
--

DROP TABLE IF EXISTS `tbl_cust_contact`;
CREATE TABLE IF NOT EXISTS `tbl_cust_contact` (
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_contact`
--

INSERT INTO `tbl_cust_contact` (`c_con_id`, `cust_creator`, `cust_id`, `c_con_fname`, `c_con_lname`, `c_con_email`, `c_con_mobile`, `c_con_phone`, `c_con_job`, `cust_title`, `cust_email2`, `cust_mobile2`, `cust_dept`, `cust_web`, `cust_comm`, `cust_skype`, `cust_linkedin`, `cust_ship_street`, `c_ship_country`, `c_ship_state`, `c_ship_city`, `cust_ship_zip`, `cust_ship_location`, `cust_street`, `c_add_country`, `c_add_state`, `c_add_city`, `cust_zip`, `cust_location`, `cust_dob`, `cust_fax`, `cust_hp`, `cust_op`, `c_con_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 0, 4, 'DHAVAL', 'UPADHYAY', 'DHAVALUPADHYAY77@GMAIL.COM', '9033891186', '', 'php', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(2, 1, 4, '', '', '', '', '', '', 'DR', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 2, 2019, 1, 1),
(3, 1, 4, '', '', '', '', '', '', 'MR', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 2, 2019, 1, 1),
(4, 0, 8, 'ABHI', 'CUSTOMER', 'ABHI.METR@GMAIL.COM', '09904704144', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(5, 0, 8, 'ABHI 2', 'METR', 'ABHI.METR@GMAIL.COM', '09904704144', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(6, 0, 8, 'ABHI 3', 'METR', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(7, 0, 8, 'ABHI 4', 'METR', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(8, 0, 8, 'ABHI 5', 'METR', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(9, 0, 9, 'ABHI', 'METR', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(10, 0, 10, 'DINA', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(11, 0, 12, 'First Name', 'Last Name', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(12, 0, 13, 'imp', '1', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(13, 0, 15, 'TEST 1', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2019, 1, 1),
(14, 0, 17, 'TEST 1', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '0000-00-00', '', '', '', 0, 2020, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_existing`
--

DROP TABLE IF EXISTS `tbl_cust_existing`;
CREATE TABLE IF NOT EXISTS `tbl_cust_existing` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_existing`
--

INSERT INTO `tbl_cust_existing` (`c_ext_id`, `cust_id`, `c_ext_status`, `c_ext_type`, `c_ext_product`, `c_ext_remark`, `cdate`, `user_id`, `company_id`) VALUES
(2, 4, 0, 'WERTY', 5, 'SDASDSAD', 2019, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_db_backup`
--

DROP TABLE IF EXISTS `tbl_db_backup`;
CREATE TABLE IF NOT EXISTS `tbl_db_backup` (
  `dbbkpid` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`dbbkpid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_db_backup`
--

INSERT INTO `tbl_db_backup` (`dbbkpid`, `cdate`, `type`, `filename`) VALUES
(1, '2019-08-26 00:38:41', 5, 'db_environ___(26-08-2019 11)__rand.sql'),
(2, '2019-08-26 03:33:22', 5, 'db_environ___(26-08-2019 14)__rand.sql'),
(3, '2019-09-04 01:32:15', 5, 'db_environ___(04-09-2019 12)__rand.sql'),
(4, '2019-09-04 04:17:33', 5, 'db_environ___(04-09-2019 15)__rand.sql'),
(5, '2019-10-16 04:45:42', 5, 'environ_crm_db___(16-10-2019 15)__rand.sql'),
(6, '2019-11-23 05:18:27', 5, 'environ_crm_db___(23-11-2019 10)__rand.sql'),
(7, '2019-12-17 06:43:53', 5, 'environ_crm_db___(17-12-2019 12)__rand.sql'),
(8, '2019-12-17 06:44:25', 5, 'environ_crm_db___(17-12-2019 12)__rand.sql'),
(9, '2019-12-17 06:46:34', 5, 'environ_crm_db___(17-12-2019 12)__rand.sql'),
(10, '2019-12-17 06:52:52', 5, 'environ_crm_db___(17-12-2019 12)__rand.sql');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_followup`
--

DROP TABLE IF EXISTS `tbl_followup`;
CREATE TABLE IF NOT EXISTS `tbl_followup` (
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

--
-- Dumping data for table `tbl_followup`
--

INSERT INTO `tbl_followup` (`flp_id`, `task_id`, `task_flp_remark`, `flp_date`, `flp_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 2, 'flp 1', '2019-11-12 12:11:05', 0, '2019-11-12 06:41:05', 1, 1),
(2, 8, 'test rmrk', '2019-12-16 14:50:46', 0, '2019-12-16 09:20:46', 1, 1),
(3, 11, 'not receiving', '2020-01-04 12:51:16', 0, '2020-01-04 07:21:16', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forecast`
--

DROP TABLE IF EXISTS `tbl_forecast`;
CREATE TABLE IF NOT EXISTS `tbl_forecast` (
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

--
-- Dumping data for table `tbl_forecast`
--

INSERT INTO `tbl_forecast` (`forecast_id`, `t_id`, `f_by_id`, `f_year`, `f_target_period`, `f_period_id`, `f_target_amt`, `f_target_qty`, `cdate`, `forecast_status`, `user_id`, `company_id`) VALUES
(1, 0, 2, '2019', 2, 34, 100.00, 10.00, '2019-11-23 10:44:53', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forecast_byuser`
--

DROP TABLE IF EXISTS `tbl_forecast_byuser`;
CREATE TABLE IF NOT EXISTS `tbl_forecast_byuser` (
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

--
-- Dumping data for table `tbl_forecast_byuser`
--

INSERT INTO `tbl_forecast_byuser` (`forecast_id`, `t_id`, `f_by_id`, `f_year`, `f_target_period`, `f_period_id`, `f_target_amt`, `f_target_qty`, `cdate`, `forecast_status`, `user_id`, `company_id`) VALUES
(1, 0, 1, '2019', 1, 11, 100.00, 10.00, '2019-11-19 08:07:21', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_f_byuser_ter_trn`
--

DROP TABLE IF EXISTS `tbl_f_byuser_ter_trn`;
CREATE TABLE IF NOT EXISTS `tbl_f_byuser_ter_trn` (
  `f_ter_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `ref_user_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `ter_target_amt` double(10,2) NOT NULL,
  `ter_target_qty` double(10,2) NOT NULL,
  `f_ter_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_ter_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_f_byuser_ter_trn`
--

INSERT INTO `tbl_f_byuser_ter_trn` (`f_ter_trn_id`, `forecast_id`, `ref_user_id`, `t_id`, `ter_target_amt`, `ter_target_qty`, `f_ter_trn_status`, `userid`) VALUES
(3, 1, 1, 14, 300.00, 30.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_f_byuser_user_trn`
--

DROP TABLE IF EXISTS `tbl_f_byuser_user_trn`;
CREATE TABLE IF NOT EXISTS `tbl_f_byuser_user_trn` (
  `f_user_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usr_target_amt` double(10,2) NOT NULL,
  `usr_target_qty` double(10,2) NOT NULL,
  `f_user_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_user_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_f_byuser_user_trn`
--

INSERT INTO `tbl_f_byuser_user_trn` (`f_user_trn_id`, `forecast_id`, `user_id`, `usr_target_amt`, `usr_target_qty`, `f_user_trn_status`, `userid`) VALUES
(3, 1, 1, 200.00, 20.00, 0, 1),
(4, 1, 3, 600.00, 60.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_f_grp_trn`
--

DROP TABLE IF EXISTS `tbl_f_grp_trn`;
CREATE TABLE IF NOT EXISTS `tbl_f_grp_trn` (
  `f_grp_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `pg_id` int(11) NOT NULL,
  `grp_target_amt` double(10,2) NOT NULL,
  `grp_target_qty` double(10,2) NOT NULL,
  `f_grp_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`f_grp_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_f_grp_trn`
--

INSERT INTO `tbl_f_grp_trn` (`f_grp_trn_id`, `forecast_id`, `pg_id`, `grp_target_amt`, `grp_target_qty`, `f_grp_trn_status`, `user_id`) VALUES
(27, 1, 2, 1.00, 2.00, 0, 1),
(28, 1, 3, 3.00, 4.00, 0, 1),
(29, 1, 4, 5.00, 6.00, 0, 1),
(30, 1, 9, 900.00, 90.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_f_ter_trn`
--

DROP TABLE IF EXISTS `tbl_f_ter_trn`;
CREATE TABLE IF NOT EXISTS `tbl_f_ter_trn` (
  `f_ter_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `ter_target_amt` double(10,2) NOT NULL,
  `ter_target_qty` double(10,2) NOT NULL,
  `f_ter_trn_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`f_ter_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_f_ter_trn`
--

INSERT INTO `tbl_f_ter_trn` (`f_ter_trn_id`, `forecast_id`, `t_id`, `ter_target_amt`, `ter_target_qty`, `f_ter_trn_status`, `user_id`) VALUES
(16, 1, 14, 3.00, 4.00, 0, 1),
(17, 1, 16, 5.00, 6.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_f_user_trn`
--

DROP TABLE IF EXISTS `tbl_f_user_trn`;
CREATE TABLE IF NOT EXISTS `tbl_f_user_trn` (
  `f_user_trn_id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usr_target_amt` double(10,2) NOT NULL,
  `usr_target_qty` double(10,2) NOT NULL,
  `f_user_trn_status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`f_user_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_f_user_trn`
--

INSERT INTO `tbl_f_user_trn` (`f_user_trn_id`, `forecast_id`, `user_id`, `usr_target_amt`, `usr_target_qty`, `f_user_trn_status`, `userid`) VALUES
(13, 1, 1, 7.00, 8.00, 0, 1),
(14, 1, 3, 9.00, 10.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grn`
--

DROP TABLE IF EXISTS `tbl_grn`;
CREATE TABLE IF NOT EXISTS `tbl_grn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_grn`
--

INSERT INTO `tbl_grn` (`grn_id`, `grn_no`, `grn_date`, `ref_no`, `ref_date`, `cust_id`, `purchaseorder_id`, `remark`, `grn_file`, `grn_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'GRN/002/19-20', '2020-01-09', 'R1', '2020-01-09', 11, 6, '', '', 2, '2020-01-09 12:01:46', 1, 1),
(2, 'GRN/003/19-20', '2020-01-09', '', '1970-01-01', 11, 6, '', '', 0, '2020-01-09 12:33:06', 1, 1),
(3, 'GRN/004/19-20', '2020-01-09', '', '1970-01-01', 4, 5, '', '', 0, '2020-01-09 13:55:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grn_trn`
--

DROP TABLE IF EXISTS `tbl_grn_trn`;
CREATE TABLE IF NOT EXISTS `tbl_grn_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_grn_trn`
--

INSERT INTO `tbl_grn_trn` (`grn_trn_id`, `purchaseorder_id`, `pro_entry_date`, `product_id`, `description`, `grn_id`, `product_qty`, `sqr_ft`, `product_hsn_code`, `pro_mfg_date`, `pro_exp_date`, `product_des`, `product_rate`, `product_disc`, `unit_id`, `product_amount`, `product_landing_price`, `product_discount`, `discount_per`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `total`, `cdate`, `mdate`, `grn_trn_status`, `branch_id`, `user_id`, `company_id`) VALUES
(2, 6, '0000-00-00', 8, 'se vsvvs', 1, 4.00, 0.00, '', '0000-00-00', '0000-00-00', '', 0.00, 0.00, 3, 0.00, 0, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2020-01-09 12:01:32', '2020-01-09 12:01:32', 2, 0, 1, 1),
(3, 6, '0000-00-00', 8, 'se vsvvs', 2, 4.00, 0.00, '', '0000-00-00', '0000-00-00', '', 0.00, 0.00, 3, 0.00, 0, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2020-01-09 12:33:04', '2020-01-09 12:33:04', 0, 0, 1, 1),
(4, 5, '0000-00-00', 7, '', 3, 4.00, 0.00, '', '0000-00-00', '0000-00-00', '', 0.00, 0.00, 3, 0.00, 0, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2020-01-09 13:54:59', '2020-01-09 13:54:59', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE IF NOT EXISTS `tbl_group` (
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

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`g_id`, `g_name`, `g_pid`, `g_open_balance`, `g_status`, `cdate`, `user_id`, `company_id`) VALUES
(12, 'BRANCH / DIVISIONS', 0, 0, 0, '2019-07-26 17:16:20', 1, 1),
(13, 'CAPITAL ACCOUNT', 0, 0, 0, '2019-07-26 17:16:31', 1, 1),
(14, 'CURRENT ASSETS', 0, 0, 0, '2019-07-26 17:16:42', 1, 1),
(15, 'CURRENT LIABILITIES', 0, 0, 0, '2019-07-26 17:16:51', 1, 1),
(16, 'DIRECT EXPENSES', 0, 0, 0, '2019-07-26 17:17:01', 1, 1),
(17, 'DIRECT INCOMES', 0, 0, 0, '2019-07-26 17:17:08', 1, 1),
(18, 'FIXED ASSETS', 0, 0, 0, '2019-07-26 17:17:14', 1, 1),
(19, 'INDIRECT EXPENSES ', 0, 0, 0, '2019-07-26 17:17:21', 1, 1),
(20, 'INDIRECT INCOMES ', 0, 0, 0, '2019-07-26 17:17:27', 1, 1),
(21, 'INVESTMENTS', 0, 0, 0, '2019-07-26 17:17:34', 1, 1),
(22, 'LOANS (LIABILITY)', 0, 0, 0, '2019-07-26 17:17:40', 1, 1),
(23, 'MISC. EXPENSES (ASSET)', 0, 0, 0, '2019-07-26 17:17:47', 1, 1),
(24, 'PURCHASE ACCOUNTS', 0, 0, 0, '2019-07-26 17:17:55', 1, 1),
(25, 'SALES ACCOUNTS', 0, 0, 0, '2019-07-26 17:18:02', 1, 1),
(26, 'SUSPENSE A/C', 0, 0, 0, '2019-07-26 17:18:09', 1, 1),
(27, 'BANK ACCOUNTS', 14, 0, 0, '2019-07-26 17:19:13', 1, 1),
(28, 'BANK OD A/C', 22, 0, 0, '2019-07-26 17:19:26', 1, 1),
(29, 'CASH-IN-HAND', 14, 0, 0, '2019-07-26 17:19:36', 1, 1),
(30, 'DEPOSITS (ASSET)', 14, 0, 0, '2019-07-26 17:19:49', 1, 1),
(31, 'DUTIES & TAXES ', 15, 0, 0, '2019-07-26 17:19:56', 1, 1),
(32, 'LOANS & ADVANCES (ASSET)', 14, 0, 0, '2019-07-26 17:20:07', 1, 1),
(33, 'PROVISIONS', 15, 0, 0, '2019-07-26 17:20:17', 1, 1),
(34, 'RESERVES & SURPLUS', 13, 0, 0, '2019-07-26 17:20:28', 1, 1),
(35, 'SECURED LOANS', 22, 0, 0, '2019-07-26 17:20:37', 1, 1),
(36, 'STOCK-IN-HAND', 14, 0, 0, '2019-07-26 17:20:50', 1, 1),
(37, 'SUNDRY CREDITORS', 15, 0, 0, '2019-07-26 17:21:20', 1, 1),
(38, 'SUNDRY DEBTORS', 14, 0, 0, '2019-07-26 17:21:28', 1, 1),
(39, 'UNSECURED LOANS', 22, 0, 0, '2019-07-26 17:21:37', 1, 1),
(40, 'DEMO S GROUP', 19, 80000, 2, '2019-07-30 14:32:34', 1, 1),
(41, 'SDFSDF', 13, 0, 0, '2019-08-01 19:32:00', 1, 1),
(42, 'SAD', 0, 0, 0, '2019-08-01 19:37:36', 1, 1),
(43, 'ASD', 13, 0, 0, '2019-08-01 19:37:49', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inquiry`
--

DROP TABLE IF EXISTS `tbl_inquiry`;
CREATE TABLE IF NOT EXISTS `tbl_inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_no` varchar(400) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inquiry`
--

INSERT INTO `tbl_inquiry` (`inquiry_id`, `inquiry_no`, `inquiry_date`, `cust_id`, `c_con_id`, `inquiry_name`, `closing_date`, `t_id`, `opp_id`, `stage_prob`, `sales_stage_id`, `inquiry_type_id`, `rb_id`, `inquiry_cat_id`, `currency_id`, `g_total`, `inq_desc`, `inq_comp_desc`, `create_date`, `cdate`, `mdate`, `inquiry_status`, `user_id`, `company_id`) VALUES
(1, 'INQ/003/19-20', '2019-09-27', 8, 4, 'test opp', '2019-09-27', 14, 7, 20, 4, 8, 3, 12, 68, 100.00, 'test rnmrk', 'comp stats rnmrk', '2019-09-27 16:22:24', '2019-09-27 05:22:24', '2019-09-27 05:22:24', 0, 1, 1),
(2, 'INQ/004/19-20', '2019-09-28', 4, 1, 'opp2', '1970-01-01', 13, 5, 10, 0, 0, 0, 0, 68, 100.00, '', '', '2019-09-28 12:59:41', '2019-09-28 01:59:41', '2019-09-28 01:59:41', 0, 1, 1),
(3, 'INQ/005/19-20', '2019-10-24', 9, 9, 'pvt ltd inq', '2019-10-31', 13, 7, 20, 0, 0, 0, 0, 68, 1100.00, 'test', '', '2019-10-24 13:57:35', '2019-11-02 13:09:24', '2019-10-24 02:57:35', 0, 1, 1),
(4, 'INQ/006/19-20', '2019-11-02', 4, 1, 'tset 4', '1970-01-01', 13, 5, 10, 0, 0, 0, 0, 68, 100.00, '', '', '2019-11-02 18:39:59', '2019-11-02 13:09:59', '2019-11-02 13:09:59', 0, 1, 1),
(5, 'INQ/007/19-20', '2019-11-11', 4, 1, 'dhaval test inq', '2019-11-30', 14, 8, 100, 5, 8, 5, 11, 68, 100.00, 'tes desc', 'cmp desc', '2019-11-11 14:55:51', '2019-11-23 10:33:11', '2019-11-11 09:25:51', 0, 1, 1),
(6, 'INQ/008/19-20', '2019-11-21', 10, 10, 'pr @ dina', '2019-11-30', 13, 6, 15, 0, 0, 0, 0, 68, 100.00, '', '', '2019-11-21 15:10:28', '2019-11-21 09:40:28', '2019-11-21 09:40:28', 0, 1, 1),
(7, 'INQ/009/19-20', '2019-12-12', 15, 13, 'pro 1@test import 3', '1970-01-01', 0, 8, 100, 0, 0, 0, 0, 68, 0.00, '', '', '2019-12-12 11:37:38', '2019-12-12 06:07:38', '2019-12-12 06:07:38', 0, 1, 1),
(8, 'INQ/010/19-20', '2020-01-04', 17, 12, 'pro1@TEST IMPORT 1', '2020-01-04', 0, 5, 10, 4, 8, 2, 11, 68, 100.00, '', '', '2020-01-04 12:13:05', '2020-01-04 06:43:05', '2020-01-04 06:43:05', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inquiry_trn`
--

DROP TABLE IF EXISTS `tbl_inquiry_trn`;
CREATE TABLE IF NOT EXISTS `tbl_inquiry_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inquiry_trn`
--

INSERT INTO `tbl_inquiry_trn` (`inquiry_trn_id`, `inquiry_id`, `product_id`, `cat_id`, `pg_id`, `level_id`, `product_qty`, `unitid`, `product_rate`, `product_amount`, `product_desc`, `product_spec`, `inquiry_trn_status`, `user_id`, `company_id`) VALUES
(1, 1, 6, 8, 4, 1, 1, 3, 100.00, 100.00, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 0, 1, 1),
(2, 2, 5, 3, 2, 1, 1, 0, 100.00, 100.00, 'sadsad sdkjsahkjhaskjdhsaj', '', 0, 1, 1),
(3, 3, 5, 0, 2, 0, 10, 3, 100.00, 1000.00, 'sadsad sdkjsahkjhaskjdhsaj', '', 0, 1, 1),
(4, 3, 6, 0, 4, 0, 1, 3, 100.00, 100.00, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 1),
(5, 4, 6, 0, 4, 0, 1, 0, 100.00, 100.00, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 1),
(6, 5, 5, 0, 2, 0, 1, 1, 100.00, 100.00, 'sadsad sdkjsahkjhaskjdhsaj', '', 0, 1, 1),
(7, 6, 6, 0, 4, 0, 1, 3, 100.00, 100.00, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 1),
(8, 7, 6, 0, 4, 0, 1, 3, 0.00, 0.00, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 1),
(9, 8, 6, 0, 4, 0, 1, 3, 100.00, 100.00, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inq_attach`
--

DROP TABLE IF EXISTS `tbl_inq_attach`;
CREATE TABLE IF NOT EXISTS `tbl_inq_attach` (
  `inq_attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `inq_attch_doc_name` varchar(400) NOT NULL,
  `inq_attch_file` varchar(400) NOT NULL,
  `inq_attach_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inq_attach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inq_attach`
--

INSERT INTO `tbl_inq_attach` (`inq_attach_id`, `inquiry_id`, `inq_attch_doc_name`, `inq_attch_file`, `inq_attach_status`, `user_id`, `company_id`) VALUES
(1, 8, 'test attcm', 'inq_attch_87731933.pdf', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inq_notes`
--

DROP TABLE IF EXISTS `tbl_inq_notes`;
CREATE TABLE IF NOT EXISTS `tbl_inq_notes` (
  `inq_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` int(11) NOT NULL,
  `inq_note_title` varchar(400) NOT NULL,
  `inq_note_desc` longtext NOT NULL,
  `inq_note_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`inq_note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inq_notes`
--

INSERT INTO `tbl_inq_notes` (`inq_note_id`, `inquiry_id`, `inq_note_title`, `inq_note_desc`, `inq_note_status`, `user_id`, `company_id`) VALUES
(1, 1, 'note 1', 'note 1 desc', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

DROP TABLE IF EXISTS `tbl_invoice`;
CREATE TABLE IF NOT EXISTS `tbl_invoice` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`invoice_id`, `cust_id`, `inv_cust_address`, `inv_ship_address`, `sales_order_id`, `invoice_no`, `invoice_date`, `challan_no`, `challan_date`, `round_off`, `g_total`, `currency_id`, `paid_amount`, `formulaid`, `packing`, `discount`, `charges_formulaid`, `taxname1`, `taxname2`, `taxname3`, `taxvalue1`, `taxvalue2`, `taxvalue3`, `cdate`, `mdate`, `status`, `userid`, `remark`, `po_pdf`, `print_status`, `company_id`) VALUES
(1, 4, 'KHARPADA NO MAHAD\r\nMANDIBAZAR\r\nSIDHPUR (SIDDHAPUR), Gujarat, India - 384151', 'ASDASD\r\nANAND, Gujarat, India - 123123', 0, 'INV/004/19-20', '2019-11-08', 'CHLN-4', '2019-11-07', 0.000, 236, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-08 09:56:26', '2019-11-08 05:01:04', 0, 1, 'fasfasdf', '', 0, 1),
(2, 9, 'satellite area', 'odhav', 2, 'INV/005/19-20', '2019-11-08', 'CHLN-5', '2019-11-08', 0.000, 246, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-08 12:20:35', '2019-11-08 07:04:19', 0, 1, 'rmrk test', '', 0, 1),
(3, 10, '', '', 5, 'INV/006/19-20', '2019-11-22', '', '1970-01-01', 0.000, 100, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-22 07:02:59', '2019-11-22 07:02:59', 0, 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoicetype`
--

DROP TABLE IF EXISTS `tbl_invoicetype`;
CREATE TABLE IF NOT EXISTS `tbl_invoicetype` (
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

--
-- Dumping data for table `tbl_invoicetype`
--

INSERT INTO `tbl_invoicetype` (`invoicetype_id`, `invoice_type`, `taxinvoice_start`, `exciseinvoice_start`, `type_id`, `invoice_format`, `format_value`, `end_format_value`, `deletable`, `status`, `cdate`, `user_id`, `usertype_id`, `company_id`) VALUES
(1, 'INQUIRY', 10, 0, 1, 3, 'INQ/', '/19-20', 1, 0, '2019-09-18 04:30:41', 1, 2, 1),
(2, 'QUOTATION', 14, 0, 2, 3, 'QT/', '/19-20', 1, 0, '2019-09-24 06:54:36', 1, 2, 1),
(3, 'SALES ORDER', 8, 0, 3, 3, 'SO/', '/19-20', 1, 0, '2019-10-21 04:35:12', 1, 2, 1),
(4, 'BOM', 8, 0, 4, 3, 'BOM/', '/19-20', 1, 0, '2019-10-22 07:05:27', 1, 2, 1),
(5, 'PLANNING', 6, 0, 5, 3, 'PLN/', '/19-20', 1, 0, '2019-10-23 03:57:06', 1, 2, 1),
(6, 'P.O.', 10, 0, 6, 3, 'PO/', '/19-20', 1, 0, '2019-11-06 09:24:02', 1, 2, 1),
(7, 'PURCHASE', 6, 0, 7, 3, 'P/', '/19-20', 1, 0, '2019-11-07 09:44:03', 1, 2, 1),
(8, 'INVOICE', 6, 0, 8, 3, 'INV/', '/19-20', 1, 0, '2019-11-07 13:41:13', 1, 2, 1),
(9, 'ISSUE', 4, 0, 9, 3, 'IS/', '/19-20', 1, 0, '2019-12-11 06:23:18', 1, 2, 1),
(10, 'PRF', 5, 0, 10, 3, 'PRF/', '/19-20', 1, 0, '2019-12-16 06:01:25', 1, 2, 1),
(11, 'GRN', 4, 0, 11, 3, 'GRN/', '/19-20', 1, 0, '2020-01-09 10:09:33', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice_trn`
--

DROP TABLE IF EXISTS `tbl_invoice_trn`;
CREATE TABLE IF NOT EXISTS `tbl_invoice_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_invoice_trn`
--

INSERT INTO `tbl_invoice_trn` (`invoice_trn_id`, `product_id`, `description`, `invoice_id`, `product_qty`, `product_hsn_code`, `product_des`, `product_rate`, `product_disc`, `unit_id`, `product_amount`, `product_discount`, `discount_per`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `cdate`, `invoice_trn_status`, `user_id`) VALUES
(1, 7, 'RAW 1 DESC', 1, 2.00, '', '', 100.00, 0.00, 3, 200.00, 0.00, 0.00, 1, 'CGST 9%', 18.00, 'SGST 9%', 18.00, '', 0.00, 236.00, '2019-11-07 13:38:21', 0, 1),
(2, 5, 'sadsad sdkjsahkjhaskjdhsaj', 2, 1.00, '', '', 100.00, 0.00, 3, 100.00, 0.00, 0.00, 2, 'IGST 18%', 18.00, '', 0.00, '', 0.00, 118.00, '2019-11-08 06:50:53', 0, 1),
(3, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 2, 1.00, '', '', 100.00, 0.00, 3, 100.00, 0.00, 0.00, 8, 'IGST 28%', 28.00, '', 0.00, '', 0.00, 128.00, '2019-11-08 06:51:07', 0, 1),
(4, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 3, 1.00, '', '', 100.00, 0.00, 3, 100.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, '2019-11-22 07:02:51', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issue_entry`
--

DROP TABLE IF EXISTS `tbl_issue_entry`;
CREATE TABLE IF NOT EXISTS `tbl_issue_entry` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_issue_entry`
--

INSERT INTO `tbl_issue_entry` (`issue_entry_id`, `cust_id`, `inv_cust_address`, `inv_ship_address`, `sales_order_id`, `issue_entry_no`, `issue_entry_date`, `challan_no`, `challan_date`, `round_off`, `g_total`, `currency_id`, `paid_amount`, `formulaid`, `packing`, `discount`, `charges_formulaid`, `taxname1`, `taxname2`, `taxname3`, `taxvalue1`, `taxvalue2`, `taxvalue3`, `cdate`, `mdate`, `status`, `userid`, `remark`, `po_pdf`, `print_status`, `company_id`) VALUES
(1, 0, '', '', 0, 'IS/002/19-20', '2019-12-11', '', '0000-00-00', 0.000, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-11 06:40:23', '2019-12-11 06:32:20', 0, 1, 'tesrt rmrk editd', '', 0, 1),
(2, 0, '', '', 0, 'IS/003/19-20', '2019-12-12', '', '0000-00-00', 0.000, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-12 06:45:35', '2019-12-12 06:45:35', 0, 1, '', '', 0, 1),
(3, 0, '', '', 0, 'IS/004/19-20', '2019-12-12', '', '0000-00-00', 0.000, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-12 06:46:55', '2019-12-12 06:46:23', 0, 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issue_entry_trn`
--

DROP TABLE IF EXISTS `tbl_issue_entry_trn`;
CREATE TABLE IF NOT EXISTS `tbl_issue_entry_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_issue_entry_trn`
--

INSERT INTO `tbl_issue_entry_trn` (`issue_trn_id`, `product_id`, `description`, `issue_entry_id`, `product_qty`, `product_hsn_code`, `product_des`, `product_rate`, `product_disc`, `unit_id`, `product_amount`, `product_discount`, `discount_per`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `cdate`, `issue_trn_status`, `user_id`) VALUES
(1, 5, 'desc x12', 1, 1.00, '', '', 0.00, 0.00, 4, 0.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2019-12-11 06:32:08', 0, 1),
(2, 7, '', 1, 4.00, '', '', 0.00, 0.00, 3, 0.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2019-12-11 06:38:57', 0, 1),
(3, 8, '', 2, 5.00, '', '', 0.00, 0.00, 3, 0.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2019-12-12 06:45:34', 0, 1),
(4, 7, '', 3, 50.00, '', '', 0.00, 0.00, 3, 0.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 0.00, '2019-12-12 06:46:21', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_bom`
--

DROP TABLE IF EXISTS `tbl_master_bom`;
CREATE TABLE IF NOT EXISTS `tbl_master_bom` (
  `bom_mst_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `finish_pro_qty` double NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bom_mst_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`bom_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_bom`
--

INSERT INTO `tbl_master_bom` (`bom_mst_id`, `product_id`, `finish_pro_qty`, `cdate`, `bom_mst_status`, `user_id`, `company_id`) VALUES
(1, 5, 1, '2019-10-17 07:53:19', 0, 1, 1),
(2, 6, 100, '2019-10-22 03:44:37', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_bom_trn`
--

DROP TABLE IF EXISTS `tbl_master_bom_trn`;
CREATE TABLE IF NOT EXISTS `tbl_master_bom_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_bom_trn`
--

INSERT INTO `tbl_master_bom_trn` (`bom_mst_trn_id`, `bom_mst_id`, `req_product_id`, `req_product_desc`, `req_product_qty`, `req_unitid`, `act_req_qty`, `bom_mst_trn_status`, `user_id`) VALUES
(1, 1, 7, '', 100.00, 0, 100.00, 0, 1),
(2, 1, 8, '', 200.00, 0, 200.00, 0, 1),
(3, 2, 7, '', 1000.00, 0, 10.00, 0, 1),
(4, 2, 8, 'se vsvvs', 2000.00, 3, 20.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_category`
--

DROP TABLE IF EXISTS `tbl_master_category`;
CREATE TABLE IF NOT EXISTS `tbl_master_category` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_name` varchar(100) NOT NULL,
  `mc_status` int(11) NOT NULL COMMENT '1 : Active , 0: Inactive',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_category`
--

INSERT INTO `tbl_master_category` (`mc_id`, `mc_name`, `mc_status`) VALUES
(1, 'AMC Type', 1),
(2, 'AMC Warranty', 1),
(3, 'Communication Preference', 1),
(4, 'Customer Category', 1),
(5, 'Customer Type', 1),
(6, 'Data Source', 1),
(7, 'Sales Stage', 1),
(8, 'Inquiry Type', 1),
(9, 'Inquiry Category', 1),
(10, 'Task Type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_category_detail`
--

DROP TABLE IF EXISTS `tbl_master_category_detail`;
CREATE TABLE IF NOT EXISTS `tbl_master_category_detail` (
  `mcd_id` int(11) NOT NULL AUTO_INCREMENT,
  `mcd_cat_id` int(11) NOT NULL,
  `mcd_name` varchar(100) NOT NULL,
  `mcd_status` int(11) NOT NULL COMMENT '0 : Active, 1 :inactive, 2 : delete',
  `cdate` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`mcd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_master_category_detail`
--

INSERT INTO `tbl_master_category_detail` (`mcd_id`, `mcd_cat_id`, `mcd_name`, `mcd_status`, `cdate`, `user_id`, `company_id`) VALUES
(2, 1, 'DEVV', 0, '2019-09-09 22:44:11', 1, 1),
(3, 3, 'DDDD12', 2, '2019-09-09 23:57:23', 1, 1),
(4, 7, 'HOT', 0, '2019-09-18 17:34:22', 1, 1),
(5, 7, 'COLD', 0, '2019-09-18 17:34:40', 1, 1),
(6, 7, 'WARM', 0, '2019-09-18 17:35:21', 1, 1),
(7, 7, 'NOT APPLICABLE', 0, '2019-09-18 17:35:27', 1, 1),
(8, 8, 'EXISTING BUSINESS', 0, '2019-09-18 17:38:54', 1, 1),
(9, 8, 'NEW BUSINESS', 0, '2019-09-18 17:38:59', 1, 1),
(10, 9, 'SMALL BUSINESS', 0, '2019-09-18 17:44:09', 1, 1),
(11, 9, 'MEDIUM BUSINESS', 0, '2019-09-18 17:44:14', 1, 1),
(12, 9, 'LARGE BUSINESS', 0, '2019-09-18 17:44:21', 1, 1),
(13, 10, 'EMAIL ACTIVITY', 0, '2019-09-21 15:35:03', 1, 1),
(14, 10, 'GENERAL TASK', 0, '2019-09-21 15:35:20', 1, 1),
(15, 10, 'NEW QUOTATION CREATION', 0, '2019-09-21 15:35:40', 1, 1),
(16, 10, 'INQUIRY FOLLOW UP', 0, '2019-09-21 15:35:54', 1, 1),
(17, 10, 'OUTDOOR DUTY REPORT', 0, '2019-09-21 15:36:09', 1, 1),
(18, 10, 'PHONE ACTIVITY', 0, '2019-09-21 15:36:28', 1, 1),
(19, 10, 'QUOTATION FOLLOW UP', 0, '2019-09-21 15:36:57', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE IF NOT EXISTS `tbl_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_name`, `menu_module`, `menuorder`, `pid`, `page_name`, `status`, `cdate`, `user_id`, `fa_icon`) VALUES
(1, 'DASHBOARD', 1, 1, 0, 'dashboard', 0, '2019-09-02 01:56:41', 0, 'FA-DASHBOARD'),
(5, 'MASTER', 1, 7, 0, '', 0, '2019-11-08 05:54:51', 0, 'fa-gear'),
(6, 'USER MASTER', 0, 10, 0, '', 2, '2019-08-26 00:40:02', 0, 'fa-user'),
(7, 'REPORT MANAGER', 0, 19, 0, 'report_list', 0, '2019-11-13 10:08:01', 0, 'fa-bar-chart-o'),
(8, 'INWARD BILL LIST', 0, 0, 2, 'purchasebill_list', 0, '2016-05-13 05:56:35', 0, ''),
(9, 'RETURN LIST', 0, 0, 2, 'purchasereturn_list', 0, '2016-05-13 05:57:37', 0, ''),
(10, 'CREATE PROJECT', 0, 0, 3, 'project', 0, '2016-05-13 05:58:35', 0, ''),
(11, 'PROJECT LIST', 0, 0, 3, 'project_list', 0, '2016-05-13 05:59:35', 0, ''),
(12, 'Component OUTWARD LIST', 0, 0, 4, 'processorder', 0, '2016-05-24 12:09:44', 0, ''),
(13, 'DIRECT Component OUTWARD LIST', 0, 0, 4, 'directprocessorder', 0, '2016-05-24 12:09:51', 0, ''),
(14, 'RETURN LIST', 0, 0, 4, 'return_list', 0, '2016-05-13 06:05:20', 0, ''),
(15, 'PARTY LIST', 0, 0, 5, 'CUSTOMER_LIST', 2, '2019-09-09 03:14:48', 0, ''),
(17, 'SALE PAYMENT', 0, 5, 7, 'MONTHWISEPAYMENTREPORT', 2, '2019-11-13 10:05:15', 0, ''),
(19, 'CUSTOMER STATEMENT', 0, 5, 7, 'PARTYPAYMENTREPORT', 2, '2017-03-15 12:50:36', 0, ''),
(20, 'ALL CUSTOMER STATMENT', 0, 6, 7, 'PAYMENTREPORT', 2, '2017-03-14 05:42:07', 0, ''),
(21, 'SALE WISE REPORT', 0, 3, 7, 'INVOICEWISEREPORT', 2, '2017-03-14 05:38:16', 0, ''),
(22, 'PARTY WISE BILL REPORT', 0, 0, 7, 'INVOICE_REPORT', 2, '2016-05-26 06:45:19', 0, ''),
(23, 'USER LIST', 0, 0, 6, 'user_list', 0, '2016-05-13 12:29:45', 0, ''),
(24, 'USER TYPE LIST', 0, 0, 6, 'usertype_list', 0, '2016-05-13 12:30:19', 0, ''),
(25, 'MENU LIST', 0, 0, 6, 'menu_list', 0, '2017-03-18 05:48:41', 0, ''),
(26, 'USER PERMISSION MASTER', 0, 0, 6, 'user_permission', 0, '2016-05-13 12:31:02', 0, ''),
(27, 'VENDER LIST', 0, 0, 5, 'vender_list', 2, '2016-05-25 10:57:35', 0, ''),
(28, 'PRODUCT LIST', 0, 4, 5, 'PRODUCT_LIST', 2, '2019-06-20 04:13:11', 0, ''),
(29, 'UNIT LIST', 0, 4, 5, 'unit_list', 0, '2019-09-09 03:26:16', 0, ''),
(30, 'STATE LIST', 0, 15, 5, 'STATE', 2, '2019-09-09 03:15:33', 0, ''),
(31, 'CITY LIST', 0, 16, 5, 'CITY', 2, '2019-09-09 03:15:36', 0, ''),
(32, 'INVOICE', 0, 6, 0, '', 2, '2019-06-20 03:49:50', 0, 'FA FA-envelope'),
(33, 'CREATE INVOICE', 0, 1, 32, 'INVOICE', 0, '2016-07-18 11:41:42', 0, ''),
(34, 'INVOICE LIST', 0, 2, 32, 'INVOICE_LIST', 0, '2017-03-07 13:00:12', 0, ''),
(35, 'PAYMENT RECEIPT', 0, 3, 32, 'INVOICEPAYMENTRECEIPT_LIST', 2, '2017-03-11 10:17:59', 0, ''),
(36, 'SERIES TYPE', 0, 6, 5, 'INVOICETYPE_LIST', 2, '2019-09-09 03:15:08', 0, ''),
(37, 'TAX LIST', 0, 12, 5, 'TAX_LIST', 2, '2019-09-09 03:15:24', 0, ''),
(38, 'FORMULA LIST', 0, 13, 5, 'FORMULA_LIST', 2, '2019-09-09 03:15:27', 0, ''),
(39, 'TEST', 0, 0, 5, 'test', 2, '2016-05-25 11:07:19', 0, ''),
(40, 'TEST1234', 0, 0, 5, 'TESEE234', 2, '2016-05-25 11:07:26', 0, ''),
(43, 'ENVELOPE LIST', 0, 0, 5, 'envelop', 2, '2016-07-11 12:44:30', 0, ''),
(46, 'INVOICERECEIPT', 0, 0, 32, 'invoicereceipt', 1, '2016-05-28 05:24:32', 0, ''),
(47, 'YEARLY SUMMARY', 0, 11, 7, 'YEARLY-SUMMARY', 2, '2017-03-15 12:57:40', 0, ''),
(48, 'invoicereceipt', 0, 6, 0, 'invoicereceipt/0', 2, '2016-07-11 12:40:18', 0, 'FA-COG'),
(49, 'SIZE LIST', 0, 4, 5, 'sizelist', 2, '2016-07-18 11:30:54', 0, ''),
(50, 'DESCRIPTION CODE LIST', 0, 5, 5, 'DESCRIPTIONCODE_LIST', 2, '2016-07-18 11:30:52', 0, ''),
(51, 'BANK LIST', 0, 11, 5, 'BANK', 2, '2019-09-09 03:15:22', 0, ''),
(52, 'INVOICE CONTENT', 0, 11, 5, 'content_list', 2, '2016-07-18 11:30:49', 0, ''),
(54, 'MONTHLY PRODUCT REPORT', 0, 11, 7, 'MONTHWISEPRODUCTREPORT', 2, '2019-11-13 10:05:09', 0, ''),
(55, 'PURCHASE ', 0, 3, 0, '', 2, '2018-10-10 06:34:36', 0, 'fa-shopping-cart'),
(56, 'PAYMENT RECEIPT', 0, 3, 55, 'PURCHASEPAYMENT_LIST', 2, '2017-03-11 10:17:51', 0, ''),
(57, 'PURCHASE LIST', 0, 2, 55, 'PURCHASE_LIST', 0, '2017-03-04 08:13:44', 0, ''),
(58, 'CREATE PURCHASE', 0, 1, 55, 'purchase_add', 0, '2016-09-09 10:59:18', 0, ''),
(59, 'VENDOR LIST', 0, 2, 5, 'VENDER_LIST', 2, '2018-10-10 06:35:00', 0, ''),
(60, 'SALES TAX REPORT', 0, 7, 7, 'VAT_REPORT', 2, '2019-11-13 10:05:04', 0, ''),
(61, 'PURCHASE TAX REPORT', 0, 8, 7, 'PURCHASEVAT_REPORT', 2, '2019-11-13 10:05:06', 0, ''),
(62, 'ACCOUNT MASTER', 0, 1, 63, 'BANK-ACC-LIST', 0, '2017-03-07 13:00:22', 0, ''),
(63, 'BANK MANAGER', 0, 8, 0, '', 2, '2019-06-20 03:50:04', 0, 'fa-building-o'),
(64, 'BANK TRANSACTION', 0, 2, 63, 'BANK-CASH-TRANSFER', 0, '2017-03-07 13:00:26', 0, ''),
(65, 'PASSBOOK STATEMENT', 0, 12, 7, 'PASSBOOK_REPORT', 2, '2019-11-13 10:05:11', 0, ''),
(66, 'DIRECT PASSBOOK ENTRY', 0, 3, 63, 'DIRECT-ENTRY-PASSBOOK', 0, '2017-03-07 13:00:30', 0, ''),
(67, 'PURCHASE DETAIL REPORT', 0, 10, 5, 'purchase_detail_report', 2, '2017-03-03 06:56:35', 0, ''),
(68, 'PURCHASE STATEMENT', 0, 8, 7, 'PURCHASE_DETAIL_REPORT', 2, '2017-03-14 05:41:42', 0, ''),
(69, 'SALE STATEMENT', 0, 1, 7, 'INVOICE-PAYMENT-ALL', 2, '2017-03-14 05:38:13', 0, ''),
(70, 'COMPANY MANAGER', 1, 20, 0, '', 0, '2019-11-13 10:07:57', 0, 'fa-user'),
(71, 'CREATE COMPANY ', 0, 1, 70, 'create_company', 0, '2017-03-03 06:58:26', 0, ''),
(72, 'COMPANY LIST', 0, 2, 70, 'company_list', 0, '2017-03-03 06:59:13', 0, ''),
(73, 'QUOTATION  LIST', 0, 4, 0, '', 2, '2018-10-12 04:43:41', 0, ' FA-QUORA'),
(74, 'PAYMENT MANAGER', 0, 7, 0, '', 2, '2019-06-20 03:49:53', 0, 'Fa-money'),
(75, 'SALE PAYMENT LIST', 0, 1, 74, 'INVOICEPAYMENTRECEIPT_LIST', 0, '2017-03-11 10:20:52', 0, ''),
(76, 'PURCHASE PAYMENT LIST', 0, 2, 74, 'PURCHASEPAYMENT_LIST', 0, '2017-03-11 10:20:57', 0, ''),
(77, 'PARTY LEDGER', 0, 1, 7, 'CUSTOMER_LEDGER', 2, '2019-11-13 10:04:57', 0, ''),
(78, 'VENDOR LEDGER', 0, 2, 7, 'vendor_ledger', 2, '2018-10-10 06:36:15', 0, ''),
(79, 'PURCHASE PAYMENT', 0, 6, 7, 'MONTHLYPURCHASEPAYMENTREPORT', 2, '2019-11-13 10:05:02', 0, ''),
(80, 'ENVELOPE LIST', 0, 17, 5, 'ENVELOPE_LIST', 2, '2019-06-20 04:10:14', 0, ''),
(81, 'PO LIST', 0, 2, 0, '', 2, '2019-06-20 03:49:33', 0, 'FA-LIST'),
(82, 'PURCHASE PRODUCT LIST', 0, 4, 5, 'purchase_product_list', 2, '2018-10-10 06:37:22', 1, ''),
(83, 'SETTING', 1, 8, 0, '', 0, '2019-11-08 05:54:56', 0, 'FA-COG'),
(84, 'PERFORMANCE INVOICE', 0, 3, 0, 'P_INVOICE_LIST', 2, '2018-02-15 07:31:15', 1, 'FA-ENVELOPE-OPEN'),
(85, 'PARTYWISE SALES', 0, 9, 7, 'PRODUCT_SALE_REPORT', 2, '2019-11-13 10:05:07', 1, ''),
(86, 'VENDOR STATEMENT', 0, 4, 7, 'VENDERPAYMENTREPORT', 2, '2018-10-10 06:36:05', 1, ''),
(87, 'PARTY STATEMENT', 0, 3, 7, 'PARTYPAYMENTREPORT', 2, '2019-11-13 10:05:00', 1, ''),
(88, 'PARTYWISE PURCHASE', 0, 10, 7, 'PRODUCT_PURCHASE_REPORT', 2, '2019-11-13 10:05:08', 1, ''),
(89, 'INWARD LIST', 0, 3, 0, 'INWARD_LIST', 2, '2018-02-15 07:31:19', 1, 'FA-FILE-TEXT-O'),
(90, 'GSTR-1 REPORT', 0, 0, 7, 'gstr-1-report', 2, '2018-10-10 06:36:54', 1, ''),
(91, 'CHARGES LIST', 0, 5, 5, 'CHARGES_LIST', 2, '2018-10-10 06:37:52', 1, ''),
(92, 'SALES ORDER', 0, 5, 0, '', 2, '2019-06-20 03:49:42', 1, 'FA-ENVELOPE-OPEN'),
(93, 'PURCHASE ORDER LIST', 0, 2, 81, 'po_list', 0, '2018-02-15 07:29:35', 1, ''),
(94, 'CREATE PURCHASE ORDER', 0, 1, 81, 'po', 0, '2018-02-15 07:29:47', 1, ''),
(95, 'QUOTATION  LIST', 0, 2, 73, 'estimate_list', 0, '2018-02-15 07:30:15', 1, ''),
(96, 'CREATE QUOTATION', 0, 1, 73, 'estimate', 0, '2018-02-15 07:30:40', 1, ''),
(97, 'SALES ORDER LIST', 0, 2, 92, 'sales_order_list', 0, '2018-02-15 07:36:40', 1, ''),
(98, 'CREATE SALES ORDER', 0, 1, 92, 'sales_order', 0, '2018-02-15 07:37:24', 1, ''),
(99, 'SERIAL NUMBER REPORT', 0, 0, 7, 'serial_number_report', 2, '2018-10-10 06:35:24', 1, ''),
(100, 'CONSIGNEE LIST', 0, 1, 5, 'consignee_list', 2, '2019-08-26 00:40:20', 1, ''),
(101, 'COUNTRY LIST', 0, 14, 5, 'COUNTRY', 2, '2019-09-09 03:15:30', 1, ''),
(102, 'SALES REGISTER', 0, 13, 7, 'sales_register', 2, '2019-11-13 10:05:12', 1, ''),
(103, 'PURCHASE REGISTER', 0, 14, 7, 'purchase_register', 2, '2019-11-13 10:05:13', 1, ''),
(104, 'E-WAY BILL', 0, 9, 0, 'E_WAYBILL', 2, '2018-10-10 06:34:17', 1, 'FA-TRUCK'),
(105, 'PAYMENT TERMS', 0, 7, 5, 'PAYMENT_TERMS', 2, '2019-09-09 03:15:11', 1, ''),
(106, 'MODE DISPACH LIST', 0, 8, 5, 'MODE_DISPACH', 2, '2019-08-26 00:40:35', 1, ''),
(107, 'PLACE SUPPLY', 0, 10, 5, 'PLACE_SUPPLY', 2, '2019-08-26 00:40:44', 1, ''),
(108, 'PRODUCT CATEGORY', 0, 4, 5, 'product_cat_mst', 2, '2019-06-20 04:11:35', 1, ''),
(109, 'PRODUCT SUB-CATEGORY', 0, 4, 5, 'product_sub_cat_mst', 2, '2019-06-20 04:11:32', 1, ''),
(110, 'BRANCH LIST', 0, 4, 5, 'branch_mst', 2, '2019-09-09 03:15:04', 1, ''),
(111, 'PURCHASE BILL', 0, 4, 0, '', 2, '2019-06-20 03:49:40', 1, 'fa-shopping-cart'),
(112, 'CREATE PURCHASE', 0, 1, 111, 'purchase_add', 0, '2018-10-12 00:14:41', 1, ''),
(113, 'PURCHASE LIST', 0, 2, 111, 'purchase_list', 0, '2018-10-12 00:14:55', 1, ''),
(114, 'SALES-PURCHASE RETURN', 0, 7, 0, '', 2, '2019-06-20 03:49:56', 1, 'fa-random'),
(115, 'PURCHASE RETURN', 0, 1, 114, 'DEBITNOTE_LIST', 0, '2018-10-18 00:58:44', 1, ''),
(116, 'SALES RETURN', 0, 2, 114, 'CREDIT_NOTE_LIST', 0, '2018-10-18 00:58:51', 1, ''),
(117, 'STOCK TRANSFER', 0, 5, 0, 'stock_transfer_list', 2, '2019-06-20 03:49:45', 1, 'FA-EXCHANGE'),
(118, 'PRODUCT STOCK REPORT', 0, 0, 7, 'product-stock-report', 2, '2019-11-13 10:04:53', 1, ''),
(119, 'PRODUCT MAKE', 0, 4, 5, 'product_make_mst', 2, '2019-06-20 04:09:50', 1, ''),
(120, 'LANDING PRICE REPORT', 0, 0, 7, 'pro_landing_price_report', 2, '2019-11-13 10:04:55', 1, ''),
(121, 'PRODUCT SIZE', 0, 4, 5, 'product_size_mst', 2, '2019-06-20 04:10:56', 1, ''),
(122, 'PRODUCT COLOR', 0, 4, 5, 'product_color_mst', 2, '2019-06-20 04:10:45', 1, ''),
(123, 'PRODUCT MOC', 0, 4, 5, 'product_moc_mst', 2, '2019-06-20 04:10:52', 1, ''),
(124, 'GOODS RECEIPT NOTE', 0, 3, 0, '', 2, '2019-06-20 03:49:37', 1, 'FA-CART-PLUS'),
(125, 'CREATE G.R.N.', 0, 1, 124, 'grn_add', 2, '2019-03-23 03:51:14', 1, ''),
(126, 'G.R.N. LIST', 0, 2, 124, 'grn_list', 2, '2019-03-23 03:51:16', 1, ''),
(127, 'ADD G.R.N.', 0, 1, 124, 'grn_add', 0, '2019-05-27 05:14:05', 1, ''),
(128, 'G.R.N. LIST', 0, 2, 124, 'grn_list', 0, '2019-05-27 05:14:16', 1, ''),
(129, 'EMPLOYEE', 0, 3, 0, 'employee_list', 2, '2019-06-20 04:29:20', 1, ''),
(130, 'EMPLOYEE', 0, 3, 5, 'employee_list', 2, '2019-08-26 00:40:28', 1, ''),
(131, 'PRODUCT LIST', 1, 5, 5, 'product_list', 0, '2019-09-09 04:16:40', 1, ''),
(132, 'BOM', 0, 2, 0, '', 2, '2019-08-26 00:39:16', 1, 'fa fa-file-text-o'),
(133, 'CREATE BOM', 0, 1, 132, 'bom_add', 0, '2019-06-20 23:39:51', 1, ''),
(134, 'BOM LIST', 0, 2, 132, 'bom_list', 0, '2019-06-20 23:40:17', 1, ''),
(135, 'PO LIST', 0, 2, 0, '', 2, '2019-08-26 00:39:13', 1, 'fa fa-list'),
(136, 'CREATE PURCHASE ORDER	', 0, 1, 135, 'po', 0, '2019-06-21 07:38:30', 1, ''),
(137, 'PURCHASE ORDER LIST', 0, 2, 135, 'po_list', 0, '2019-06-21 07:38:48', 1, ''),
(138, 'REQUEST LIST', 0, 3, 135, 'po_req_list', 0, '2019-06-21 07:39:05', 1, ''),
(139, 'PURCHASE', 0, 4, 0, '', 2, '2019-08-26 00:39:21', 1, 'fa-shopping-cart'),
(140, 'CREATE PURCHASE', 0, 1, 139, 'purchase_add', 0, '2019-06-22 04:50:34', 1, ''),
(141, 'PURCHASE LIST', 0, 2, 139, 'purchase_list', 0, '2019-06-22 04:50:55', 1, ''),
(142, 'STOCK TRANSFER', 0, 4, 0, 'stock_transfer_list', 2, '2019-08-26 00:39:18', 1, 'FA-EXCHANGE'),
(143, 'JOBWORK', 0, 6, 0, '', 2, '2019-08-26 00:39:23', 1, 'fa fa-certificate'),
(144, 'OUTWARD', 0, 1, 143, 'jobwork_list', 0, '2019-06-25 00:18:31', 1, ''),
(145, 'INWARD', 0, 2, 143, 'jobwork_inward_list', 0, '2019-06-25 00:18:49', 1, ''),
(146, 'INVOICE', 0, 7, 0, '', 2, '2019-08-26 00:39:25', 1, 'FA FA-envelope'),
(147, 'CREATE INVOICE', 0, 1, 146, 'invoice', 0, '2019-06-27 04:23:29', 1, ''),
(148, 'INVOICE LIST', 0, 2, 146, 'invoice_list', 0, '2019-06-27 04:23:48', 1, ''),
(149, 'EXPENSE MANAGER', 0, 8, 0, '', 2, '2019-08-26 00:39:34', 1, 'fa-money'),
(150, 'EXPENSE ENTRY', 0, 1, 149, 'expense-entry', 0, '2019-06-27 05:19:43', 1, ''),
(151, 'EXPENSE LIST', 0, 2, 149, 'expense_list', 0, '2019-06-27 05:19:57', 1, ''),
(152, 'EXPENSE HEAD LIST', 0, 9, 5, 'expense_head_list', 2, '2019-08-26 00:40:38', 1, ''),
(153, 'EXPENSE LIST', 0, 9, 5, 'expense_mst', 2, '2019-09-09 03:15:16', 1, ''),
(154, 'INCOME MANAGER', 0, 9, 0, '', 2, '2019-08-26 00:39:39', 1, 'fa-money'),
(155, 'INCOME ENTRY', 0, 1, 154, 'income-entry', 0, '2019-06-27 08:02:25', 1, ''),
(156, 'INCOME LIST', 0, 2, 154, 'income_list', 0, '2019-06-27 08:02:41', 1, ''),
(157, 'INCOME LIST', 0, 9, 5, 'income_mst', 2, '2019-09-09 03:15:14', 1, ''),
(158, 'REPORT MANAGER', 0, 10, 0, '', 2, '2019-08-26 00:39:47', 1, 'fa-bar-chart-o'),
(159, 'STOCK REPORT', 0, 1, 158, 'report-stock', 0, '2019-07-15 04:43:58', 1, ''),
(160, 'JOBWORK STOCK REPORT', 0, 2, 158, 'report-jobwork-stock', 0, '2019-07-16 04:09:12', 1, ''),
(161, 'STOCK VALUATION', 0, 3, 158, 'report-stock-valuation', 0, '2019-07-16 07:57:30', 1, ''),
(162, 'ACCOUNTANT', 0, 8, 0, '', 2, '2019-08-26 00:39:28', 1, 'fa fa-building'),
(163, 'ACCOUNT CHART', 0, 1, 162, 'charts-of-account', 0, '2019-07-17 01:40:22', 1, ''),
(164, 'ACCOUNT VOUCHER', 0, 2, 162, 'account-voucher-list', 0, '2019-07-17 01:40:37', 1, ''),
(165, 'PAYMENT MANAGER', 0, 9, 0, '', 2, '2019-08-26 00:39:41', 1, 'Fa-money'),
(166, 'SALE PAYMENT LIST', 0, 1, 165, 'invoicepayment_list', 0, '2019-07-17 03:27:54', 1, ''),
(167, 'PURCHASE PAYMENT LIST', 0, 2, 165, 'purchasepayment_list', 0, '2019-07-17 03:28:06', 1, ''),
(168, 'JOBWORK PAYMENT LIST', 0, 3, 165, 'jobworkpayment_list', 0, '2019-07-17 06:52:09', 1, ''),
(169, 'PROFIT AND LOSS', 0, 4, 158, 'profit-and-loss-statement', 0, '2019-07-18 03:12:01', 1, ''),
(170, 'PRODUCT CATEGORY LIST', 1, 1, 5, 'category_list', 0, '2019-09-09 03:26:00', 1, ''),
(171, 'GROUP LIST', 0, 3, 5, 'group_list', 2, '2019-09-09 03:15:00', 1, ''),
(172, 'BANK MANAGER', 0, 8, 0, '', 2, '2019-08-26 00:39:31', 1, 'fa-building-o'),
(173, 'BANK MASTER', 0, 1, 172, 'bank-acc-list', 0, '2019-07-30 03:48:02', 1, ''),
(174, 'BANK TRANSACTION', 0, 2, 172, 'bank-cash-transfer', 0, '2019-07-30 03:47:11', 1, ''),
(175, 'SALES ORDER', 0, 8, 0, '', 2, '2019-08-26 00:39:36', 1, 'FA-ENVELOPE-OPEN'),
(176, 'CREATE SALES ORDER', 0, 1, 175, 'sales_order', 0, '2019-08-20 23:29:42', 1, ''),
(177, 'SALES ORDER LIST', 0, 2, 175, 'sales_order_list', 0, '2019-08-20 23:30:32', 1, ''),
(178, 'MANAGE COMPANY', 1, 1, 83, 'manage_company', 0, '2019-09-02 01:57:12', 1, ''),
(179, 'DEMO', 4, 4, 0, '', 2, '2019-09-02 01:56:46', 1, 'fa fa-user'),
(180, 'USER PERMISSION', 1, 2, 83, 'user_permission', 0, '2019-12-17 06:49:43', 1, ''),
(181, 'USER', 1, 3, 83, 'useradd', 0, '2019-09-04 00:42:39', 1, ''),
(182, 'TERRITORIES', 1, 4, 83, 'territory_list', 0, '2019-09-04 02:25:10', 1, ''),
(183, 'OPPORTUNITY STAGE', 1, 5, 83, 'opprotunity_list', 0, '2019-09-09 00:42:24', 1, ''),
(184, 'COUNTRY LIST', 1, 6, 83, 'country', 0, '2019-09-09 01:46:16', 1, ''),
(185, 'STATE LIST', 0, 7, 83, 'state', 0, '2019-09-09 01:46:34', 1, ''),
(186, 'CITY LIST', 0, 8, 83, 'city', 0, '2019-09-09 01:46:51', 1, ''),
(187, 'PRODUCT GROUP', 1, 2, 5, 'product_grp', 0, '2019-09-09 03:26:04', 1, ''),
(188, 'PRODUCT BRAND', 1, 3, 5, 'product_brand', 0, '2019-09-09 03:57:13', 1, ''),
(189, 'MASTER', 1, 6, 5, 'master_category_list', 0, '2019-09-09 11:07:50', 1, ''),
(190, 'ANNEXURE', 1, 7, 5, 'annexure_detail_list', 0, '2019-09-26 01:19:41', 1, ''),
(191, 'TERMS AND CONDITIONS', 1, 8, 5, 'terms_list', 0, '2019-09-10 01:08:51', 1, ''),
(192, 'CONVERSION RATE', 1, 9, 5, 'conversion_rate_add', 0, '2019-09-10 08:11:49', 1, ''),
(193, 'PARTY', 2, 6, 0, 'customer_list', 0, '2019-11-29 09:07:16', 1, 'FA FA-USER'),
(194, 'CONTACT', 2, 6, 0, 'customer_contact_list', 2, '2019-11-08 05:55:08', 1, 'FA FA-ADDRESS-CARD-O'),
(195, 'SERIES', 1, 9, 83, 'series_type_list', 0, '2019-09-18 04:28:57', 1, ''),
(196, 'INQUIRY', 0, 2, 0, '', 0, '2019-09-18 04:40:05', 1, 'fa-globe'),
(197, 'Add Inquiry', 0, 1, 196, 'inquiry_add', 0, '2019-09-18 04:40:27', 1, ''),
(198, 'Inquiry List', 0, 2, 196, 'inquiry_list', 0, '2019-09-18 04:40:44', 1, ''),
(199, 'TASK', 4, 4, 0, '', 0, '2019-11-08 05:54:28', 1, 'fa-list-alt'),
(200, 'Add Task', 0, 1, 199, 'task_add', 0, '2019-09-21 04:54:40', 1, ''),
(201, 'Task List', 0, 2, 199, 'task_list', 0, '2019-09-21 04:54:56', 1, ''),
(202, 'APPOINTMENT', 4, 5, 0, '', 0, '2019-11-08 05:54:34', 1, 'fa-clock-o'),
(203, 'Add Appointment', 0, 1, 202, 'appointment_add', 0, '2019-09-24 03:33:45', 1, ''),
(204, 'Appointment List', 0, 2, 202, 'appointment_list', 0, '2019-09-24 03:34:02', 1, ''),
(205, 'QUOTATION', 3, 3, 0, '', 0, '2019-09-24 07:13:05', 1, 'fa-diamond'),
(206, 'Add Quotation', 0, 1, 205, 'quotation_add', 0, '2019-09-24 07:13:27', 1, ''),
(207, 'Quotation List', 0, 2, 205, 'quotation_list', 0, '2019-09-24 07:13:42', 1, ''),
(208, 'MASTER BOM', 1, 10, 5, 'master_bom_list', 0, '2019-10-17 06:21:36', 1, ''),
(209, 'SALES ORDER', 1, 9, 0, '', 0, '2019-11-08 05:56:17', 1, 'fa-folder-open'),
(210, 'Add Sales Order', 0, 1, 209, 'sales_order_add', 0, '2019-10-21 04:20:47', 1, ''),
(211, 'Sales Order List', 0, 2, 209, 'sales_order_list', 0, '2019-10-21 04:21:04', 1, ''),
(212, 'BOM LIST', 0, 11, 0, 'bom_list', 0, '2019-11-08 05:57:17', 1, 'fa-building-o'),
(213, 'PLANNING', 0, 10, 0, 'planning_list', 0, '2019-11-08 05:57:12', 1, 'fa-calendar-o'),
(214, 'PURCHASE ORDER', 0, 12, 0, '', 0, '2019-11-08 05:57:33', 1, 'fa-shopping-cart'),
(215, 'Add Purchase Order', 0, 1, 214, 'po', 0, '2019-11-06 10:05:38', 1, ''),
(216, 'Purchase Order List', 0, 2, 214, 'po_list', 0, '2019-11-06 10:06:04', 1, ''),
(217, 'PURCHASE', 0, 13, 0, '', 0, '2019-11-08 05:57:47', 1, 'fa-cart-plus'),
(218, 'Add Purchase', 0, 1, 217, 'purchase_add', 0, '2019-11-07 10:00:53', 1, ''),
(219, 'Purchase List', 0, 2, 217, 'purchase_list', 0, '2019-11-07 10:01:16', 1, ''),
(220, 'INVOICE', 0, 14, 0, '', 0, '2019-11-08 06:01:27', 1, 'fa-envelope'),
(221, 'Add Invoice', 0, 1, 220, 'invoice_add', 0, '2019-11-08 06:01:56', 1, ''),
(222, 'Invoice List', 0, 2, 220, 'invoice_list', 0, '2019-11-08 06:02:12', 1, ''),
(223, 'Forecast', 0, 15, 0, '', 0, '2019-11-09 07:28:13', 1, 'fa-line-chart'),
(224, 'Forecast', 0, 1, 223, 'forecast_list', 0, '2019-11-09 07:28:41', 1, ''),
(225, 'Inquiry Product Report', 0, 1, 7, 'report_inq_pro', 0, '2019-11-13 10:06:09', 1, ''),
(226, 'Inquiry By Date Report', 0, 2, 7, 'report_inq_bydate', 0, '2019-11-13 11:10:05', 1, ''),
(227, 'Task Activity Details By Owner Report', 0, 3, 7, 'report_task_act_byowner', 0, '2019-11-13 13:52:25', 1, ''),
(228, 'Forecast By User', 0, 2, 223, 'forecast_byuser_list', 0, '2019-11-19 07:54:37', 1, ''),
(229, 'Party Industry', 0, 10, 83, 'cust_ind_mst', 0, '2019-11-22 11:52:23', 1, ''),
(230, 'Stock Issue Entry', 0, 14, 0, 'issue_entry_list', 0, '2019-12-11 06:37:40', 1, 'fa-minus-circle'),
(231, 'Product Stock Report', 0, 4, 7, 'product-stock-report', 0, '2019-12-11 10:17:02', 1, ''),
(232, 'Request List', 0, 3, 214, 'po_req_list', 0, '2019-12-13 10:32:46', 1, ''),
(233, 'PRF List', 0, 15, 0, 'prf_list', 0, '2019-12-16 06:04:30', 1, 'fa-asterisk'),
(234, 'Party Category', 0, 11, 5, 'cust_cat_mst', 0, '2020-01-08 10:00:26', 1, ''),
(235, 'GRN', 0, 13, 0, '', 0, '2020-01-09 12:27:45', 1, 'fa-archive'),
(236, 'ADD G.R.N.', 0, 1, 235, 'grn_list', 0, '2020-01-09 12:09:12', 1, ''),
(237, 'G.R.N. List', 0, 2, 235, 'grn_list', 0, '2020-01-09 12:09:19', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_opportunity_mst`
--

DROP TABLE IF EXISTS `tbl_opportunity_mst`;
CREATE TABLE IF NOT EXISTS `tbl_opportunity_mst` (
  `opp_id` int(11) NOT NULL AUTO_INCREMENT,
  `opp_stage` varchar(100) NOT NULL,
  `opp_probability` varchar(100) NOT NULL,
  `opp_priority` int(11) NOT NULL,
  `opp_status` int(11) NOT NULL COMMENT '0:active , 1: inactive , 2:delete',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`opp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_opportunity_mst`
--

INSERT INTO `tbl_opportunity_mst` (`opp_id`, `opp_stage`, `opp_probability`, `opp_priority`, `opp_status`, `cdate`, `user_id`, `company_id`) VALUES
(2, 'SADAS', '12', 12, 2, '2019-09-09 01:23:45', 1, 1),
(3, 'EEEE', '12', 12, 2, '2019-09-09 01:23:50', 1, 1),
(4, 'CLOSED LOST', '0', 10, 0, '2019-09-09 01:43:30', 1, 1),
(5, 'PROSPECTING', '10', 1, 0, '2019-09-09 01:43:49', 1, 1),
(6, 'NOT APPLICABLE', '15', 11, 0, '2019-09-09 01:44:02', 1, 1),
(7, 'QUALIFICATION', '20', 2, 0, '2019-09-09 01:44:09', 1, 1),
(8, 'WON', '100', 12, 0, '2019-11-15 08:57:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_org_currency`
--

DROP TABLE IF EXISTS `tbl_org_currency`;
CREATE TABLE IF NOT EXISTS `tbl_org_currency` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_id` int(11) NOT NULL,
  `curren_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_org_currency`
--

INSERT INTO `tbl_org_currency` (`c_id`, `comp_id`, `curren_id`) VALUES
(11, 1, 68);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

DROP TABLE IF EXISTS `tbl_permission`;
CREATE TABLE IF NOT EXISTS `tbl_permission` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8814 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`permission_id`, `usertype_id`, `menu_id`, `permission`, `add_permission`, `view_permission`, `active_permission`, `inactive_permission`, `export_permission`, `edit_permission`, `delete_permission`, `status`, `cdate`, `user_id`) VALUES
(1820, 1, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-08 11:39:31', 0),
(1821, 1, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-08 11:39:31', 0),
(1822, 1, 72, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-08 11:39:31', 0),
(1823, 1, 83, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2017-04-08 11:39:31', 0),
(7363, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7364, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7365, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7366, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7367, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7368, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7369, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:17:53', 1),
(7370, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7371, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7372, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7373, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7374, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7375, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7376, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:21:57', 1),
(7377, 7, 179, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:37', 1),
(7378, 7, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:37', 1),
(7379, 7, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, '2019-09-03 00:30:37', 1),
(7380, 7, 178, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:37', 1),
(7381, 7, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:38', 1),
(7382, 7, 180, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:38', 1),
(7383, 7, 83, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:30:38', 1),
(7384, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7385, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7386, 8, 70, 1, 1, 1, 1, 1, 1, 1, 0, 0, '2019-09-03 00:44:14', 1),
(7387, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7388, 8, 180, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7389, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7390, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:44:14', 1),
(7391, 9, 179, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7392, 9, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7393, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7394, 9, 178, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7395, 9, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7396, 9, 180, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(7397, 9, 83, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-03 00:54:58', 1),
(8677, 3, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8678, 3, 196, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8679, 3, 197, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8680, 3, 198, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8681, 3, 199, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8682, 3, 200, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8683, 3, 201, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-04 06:37:29', 1),
(8684, 3, 202, 1, 0, 0, 0, 0, 0, 1, 0, 0, '2020-01-04 06:37:29', 1),
(8685, 3, 203, 1, 0, 0, 0, 0, 0, 1, 0, 0, '2020-01-04 06:37:29', 1),
(8686, 3, 204, 1, 0, 0, 0, 0, 0, 1, 0, 0, '2020-01-04 06:37:29', 1),
(8749, 2, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8750, 2, 5, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8751, 2, 29, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8752, 2, 131, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8753, 2, 170, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8754, 2, 187, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8755, 2, 188, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8756, 2, 189, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8757, 2, 190, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8758, 2, 191, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8759, 2, 192, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8760, 2, 208, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8761, 2, 234, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8762, 2, 7, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8763, 2, 225, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8764, 2, 226, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8765, 2, 227, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8766, 2, 231, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8767, 2, 83, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8768, 2, 178, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8769, 2, 180, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8770, 2, 181, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:54', 1),
(8771, 2, 182, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8772, 2, 183, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8773, 2, 184, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8774, 2, 185, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8775, 2, 186, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8776, 2, 195, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8777, 2, 229, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8778, 2, 193, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8779, 2, 196, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8780, 2, 197, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8781, 2, 198, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8782, 2, 199, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8783, 2, 200, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8784, 2, 201, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8785, 2, 202, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8786, 2, 203, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8787, 2, 204, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8788, 2, 205, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8789, 2, 206, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8790, 2, 207, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8791, 2, 209, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8792, 2, 210, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8793, 2, 211, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8794, 2, 212, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8795, 2, 213, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8796, 2, 214, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8797, 2, 215, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8798, 2, 216, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8799, 2, 232, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8800, 2, 217, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8801, 2, 218, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8802, 2, 219, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8803, 2, 220, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8804, 2, 221, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8805, 2, 222, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:55', 1),
(8806, 2, 223, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8807, 2, 224, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8808, 2, 228, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8809, 2, 230, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8810, 2, 233, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8811, 2, 235, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8812, 2, 236, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1),
(8813, 2, 237, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2020-01-09 12:09:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_role`
--

DROP TABLE IF EXISTS `tbl_permission_role`;
CREATE TABLE IF NOT EXISTS `tbl_permission_role` (
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

--
-- Dumping data for table `tbl_permission_role`
--

INSERT INTO `tbl_permission_role` (`permission_id`, `role_id`, `menu_id`, `permission`, `add_permission`, `view_permission`, `active_permission`, `inactive_permission`, `export_permission`, `edit_permission`, `delete_permission`, `status`, `cdate`, `user_id`) VALUES
(46, 8, 179, 1, 0, 1, 0, 0, 0, 1, 0, 0, '2019-09-05 23:43:33', 1),
(47, 8, 70, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(48, 8, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(49, 8, 178, 1, 0, 0, 0, 0, 0, 1, 0, 0, '2019-09-05 23:43:33', 1),
(50, 8, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(51, 8, 180, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(52, 8, 83, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(53, 8, 182, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(54, 8, 181, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:43:33', 1),
(55, 9, 179, 1, 1, 1, 0, 0, 0, 1, 0, 0, '2019-09-05 23:44:31', 1),
(56, 9, 70, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(57, 9, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(58, 9, 178, 1, 0, 0, 0, 0, 0, 1, 0, 0, '2019-09-05 23:44:31', 1),
(59, 9, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(60, 9, 180, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(61, 9, 83, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(62, 9, 182, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1),
(63, 9, 181, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-05 23:44:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_planning`
--

DROP TABLE IF EXISTS `tbl_planning`;
CREATE TABLE IF NOT EXISTS `tbl_planning` (
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

--
-- Dumping data for table `tbl_planning`
--

INSERT INTO `tbl_planning` (`planning_id`, `planning_no`, `planning_date`, `sales_order_id`, `planning_name`, `phase1_status`, `phase1_start_date`, `phase1_end_date`, `op_sheet`, `op_sheet_attch`, `op_sheet_remark`, `budget_sheet`, `budget_sheet_attch`, `budget_sheet_attch_remark`, `pfi_inv1`, `pfi_inv1_attch`, `pfi_inv1_remark`, `pfi_inv2`, `pfi_inv2_attch`, `pfi_inv2_remark`, `process_flow_dg`, `process_flow_dg_attch`, `process_flow_dg_remark`, `civil_layout`, `civil_layout_attch`, `civil_layout_remark`, `section_drawing`, `section_drawing_attch`, `section_drawing_remark`, `fab_drawing`, `fab_drawing_attch`, `fab_drawing_remark`, `p_and_id`, `p_and_id_attch`, `p_and_id_remark`, `phase2_status`, `phase2_start_date`, `phase2_end_date`, `purchase_bill`, `purchase_bill_attch`, `purchase_bill_remark`, `inspection_status`, `inspection_attch`, `inspection_remark`, `phase3_status`, `phase3_start_date`, `phase3_end_date`, `dispatch_status`, `dispatch_status_attch`, `dispatch_status_remark`, `transport_status`, `transport_status_attch`, `transport_status_remark`, `tax_inv_status`, `tax_inv_status_attch`, `tax_inv_status_remark`, `del_challan_status`, `del_challan_status_attch`, `del_challan_status_remark`, `eway_bill_status`, `eway_bill_status_attch`, `eway_bill_status_remark`, `phase4_status`, `phase4_start_date`, `phase4_end_date`, `install_status`, `install_status_attch`, `install_status_remark`, `commission_status`, `commission_status_attch`, `commission_status_remark`, `plant_handover_status`, `plant_handover_attch`, `plant_handover_remark`, `plan_per`, `cdate`, `planning_status`, `user_id`, `company_id`) VALUES
(1, 'PLN/002/19-20', '2019-10-22', 1, 'Plan 1', 1, '2019-10-24', '2019-10-25', 1, '', 'tesrmf sm ', 1, '', 'dfcasdfasdf', 1, '', 'adsfasdf', 1, '', 'asdfasdf', 1, '', 'afasdfasdfsdf', 1, '', 'asdfasdf', 1, 'plan_attach_407401571836024.pdf', 'asdfasfd', 1, '', 'afasdfasdf', 1, '', 'adsfsadfsdf', 1, '2019-10-26', '2019-10-27', 1, '', 'asdfasdf', 0, '', '', 1, '2019-10-28', '2019-10-29', 1, '', 'asfasdfasdf', 1, 'plan_attach_3331291571836024.pdf', 'asfsdfsadf', 1, '', 'vzxvzxv', 1, '', 'asdfasdfa', 1, '', 'azfsdfasf', 0, '2019-10-30', '2019-10-31', 1, '', 'ascvzxv', 1, '', 'fvcdfafsdfasdf', 0, '', '', 75, '2019-10-24 01:50:37', 0, 1, 1),
(2, 'PLN/003/19-20', '2019-10-24', 2, 'pvt ltd inq', 1, '2019-10-24', '2019-10-24', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-10-24', '2019-10-24', 0, '', '', 1, '', 'inspec done', 0, '2019-10-24', '2019-10-24', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-10-24', '2019-10-24', 0, '', '', 0, '', '', 1, '', 'Plant Hand Over yes', 25, '2019-11-05 11:28:08', 0, 1, 1),
(3, 'PLN/004/19-20', '2019-11-20', 3, 'DHAVAL TEST INQ', 0, '2019-11-20', '2019-11-20', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-20', '2019-11-20', 0, '', '', 0, '', '', 0, '2019-11-20', '2019-11-20', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-20', '2019-11-20', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-20 09:36:54', 0, 1, 1),
(4, 'PLN/005/19-20', '2019-11-22', 5, 'PR @ DINA', 0, '2019-11-22', '2019-11-22', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-22', '2019-11-22', 0, '', '', 0, '', '', 0, '2019-11-22', '2019-11-22', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-22', '2019-11-22', 0, '', '', 0, '', '', 0, '', '', 0, '2019-11-22 07:02:22', 0, 1, 1),
(5, 'PLN/006/19-20', '2019-12-12', 6, 'PRO 1@TEST IMPORT 3', 1, '2019-12-12', '2019-12-12', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-12-12', '2019-12-12', 0, '', '', 0, '', '', 0, '2019-12-12', '2019-12-12', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '', '', 0, '2019-12-12', '2019-12-12', 0, '', '', 0, '', '', 0, '', '', 25, '2019-12-12 06:43:32', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_po_log`
--

DROP TABLE IF EXISTS `tbl_po_log`;
CREATE TABLE IF NOT EXISTS `tbl_po_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_po_log`
--

INSERT INTO `tbl_po_log` (`po_log_id`, `purchaseorder_id`, `purchaseordertrn_id`, `approve_remark`, `approve_status`, `po_log_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 4, 5, 'tset 1', 0, 0, '2019-11-22 13:27:43', 1, 1),
(2, 4, 5, 'now ok', 1, 0, '2019-11-22 13:28:22', 1, 1),
(3, 4, 5, 'ok 2', 1, 0, '2019-11-22 13:32:22', 1, 1),
(4, 4, 0, 'good', 1, 0, '2019-12-10 09:45:14', 1, 1),
(5, 6, 17, 'not ok', 0, 0, '2020-01-08 10:25:53', 1, 1),
(6, 6, 17, 'not ok', 2, 0, '2020-01-08 10:30:45', 1, 1),
(7, 6, 17, 'pending', 0, 0, '2020-01-08 10:31:42', 1, 1),
(8, 6, 17, 'not okay', 2, 0, '2020-01-08 10:32:12', 1, 1),
(9, 6, 17, 'ok', 1, 0, '2020-01-08 10:32:30', 1, 1),
(10, 5, 15, '', 1, 0, '2020-01-09 13:54:38', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_po_terms_trn`
--

DROP TABLE IF EXISTS `tbl_po_terms_trn`;
CREATE TABLE IF NOT EXISTS `tbl_po_terms_trn` (
  `po_terms_trn_id` int(10) NOT NULL AUTO_INCREMENT,
  `purchaseorder_id` int(11) NOT NULL,
  `tc_id` int(11) NOT NULL,
  `tc_priority` int(11) NOT NULL,
  `tc_details` longtext CHARACTER SET utf8 NOT NULL,
  `po_terms_trn_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`po_terms_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_po_terms_trn`
--

INSERT INTO `tbl_po_terms_trn` (`po_terms_trn_id`, `purchaseorder_id`, `tc_id`, `tc_priority`, `tc_details`, `po_terms_trn_status`, `cdate`) VALUES
(1, 2, 17, 1, 'po temrs 1 desc 1', 0, '2019-11-07 12:27:04'),
(2, 2, 18, 2, 'po terms 2 dec 2', 0, '2019-11-07 12:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prf_entry`
--

DROP TABLE IF EXISTS `tbl_prf_entry`;
CREATE TABLE IF NOT EXISTS `tbl_prf_entry` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prf_entry`
--

INSERT INTO `tbl_prf_entry` (`prf_entry_id`, `prf_entry_no`, `prf_entry_date`, `product_id`, `product_des`, `cust_id`, `cdate`, `mdate`, `status`, `prf_approve_status`, `po_status`, `user_id`, `remark`, `print_status`, `company_id`) VALUES
(1, 'PRF/005/19-20', '2020-01-08', 0, '', 0, '2020-01-08 12:04:03', '2020-01-08 11:55:11', 0, 0, 0, 1, 'test', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prf_entry_log`
--

DROP TABLE IF EXISTS `tbl_prf_entry_log`;
CREATE TABLE IF NOT EXISTS `tbl_prf_entry_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prf_entry_log`
--

INSERT INTO `tbl_prf_entry_log` (`prf_log_id`, `prf_entry_id`, `quotation_id`, `assign_user_ids`, `approve_remark`, `approve_status`, `prf_log_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 2, 0, 3, 'aprvd', 1, 0, '2019-12-16 13:39:53', 1, 1),
(2, 3, 0, 3, 'hujkhjkhjgjhgjhgjh', 1, 0, '2019-12-27 09:27:42', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prf_ven_rmrk`
--

DROP TABLE IF EXISTS `tbl_prf_ven_rmrk`;
CREATE TABLE IF NOT EXISTS `tbl_prf_ven_rmrk` (
  `ven_rmrk_id` int(11) NOT NULL AUTO_INCREMENT,
  `prf_entry_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_des` mediumtext NOT NULL,
  `new_ven_name` varchar(400) NOT NULL,
  `new_ven_rmrk` longtext NOT NULL,
  `ven_rmrk_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`ven_rmrk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prf_ven_rmrk`
--

INSERT INTO `tbl_prf_ven_rmrk` (`ven_rmrk_id`, `prf_entry_id`, `product_id`, `product_des`, `new_ven_name`, `new_ven_rmrk`, `ven_rmrk_status`, `user_id`, `company_id`) VALUES
(1, 1, 6, 'pro descx1', 'VEN 1', 'ven 1 desc', 0, 1, 1),
(2, 1, 6, 'pro desc 2', 'ven 2', 'ven 2 desc', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `item_code`, `product_cat`, `product_group`, `product_brand`, `product_type`, `product_hsn`, `product_desc`, `product_part`, `p_photo`, `product_mst_rate`, `product_purchase_mst_rate`, `product_mst_unitid`, `opening_stock`, `minimum_stock`, `cdate`, `product_status`, `user_id`, `usertype_id`, `company_id`, `branch_id`) VALUES
(3, 'PRODUCT 1', 'P0001', 4, 2, 4, 0, '90909', 'DEMO', 100, '239', 1234.00, 0.00, 3, 0.00, 0.00, '2019-09-09 08:09:22', 2, 1, 0, 1, 0),
(4, 'PRODUCT 2', 'P002', 4, 2, 4, 0, '123', 'SDSAD', 0, '790', 123213.00, 0.00, 4, 0.00, 0.00, '2019-09-09 08:10:33', 2, 1, 0, 1, 0),
(5, 'DEMO 1 12323', 'DEMO', 3, 2, 4, 1, '123333222', 'sadsad sdkjsahkjhaskjdhsaj', 909090009, '366.', 1000.00, 0.00, 4, 10.00, 0.00, '2019-12-11 09:39:12', 0, 1, 0, 1, 0),
(6, 'ENVIRON LABORATORY DIVISION', '123', 8, 4, 4, 1, '1234', 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 0, '443.jpg', 0.00, 0.00, 0, 0.00, 0.00, '2019-09-27 05:18:05', 0, 1, 0, 1, 0),
(7, 'RAW 1', '', 0, 0, 0, 3, '1234', '', 0, '229.', 100.00, 80.00, 3, 0.00, 0.00, '2019-11-07 05:54:12', 0, 1, 0, 1, 0),
(8, 'SEMI 1', '', 0, 0, 0, 2, '', 'semi 1 desc', 0, '139.', 120.00, 100.00, 3, 2.00, 1.00, '2019-12-11 09:21:06', 0, 1, 0, 1, 0),
(9, 'RAW 2', '', 0, 0, 0, 3, '', '', 0, '693.', 0.00, 0.00, 0, 10.00, 2.00, '2019-12-13 11:29:13', 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_brand`
--

DROP TABLE IF EXISTS `tbl_product_brand`;
CREATE TABLE IF NOT EXISTS `tbl_product_brand` (
  `pb_id` int(10) NOT NULL AUTO_INCREMENT,
  `pb_name` varchar(255) NOT NULL,
  `pb_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_brand`
--

INSERT INTO `tbl_product_brand` (`pb_id`, `pb_name`, `pb_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'ASDSAD', 2, '2019-09-09 15:13:07', 1, 1),
(2, 'DSF', 2, '2019-09-09 15:09:16', 1, 1),
(3, 'JIO', 2, '2019-09-09 15:09:25', 1, 1),
(4, 'ENVIRON', 0, '2019-09-09 15:13:42', 1, 1),
(5, 'PRO BRAND 1', 0, '2019-11-19 16:12:34', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_grp`
--

DROP TABLE IF EXISTS `tbl_product_grp`;
CREATE TABLE IF NOT EXISTS `tbl_product_grp` (
  `pg_id` int(10) NOT NULL AUTO_INCREMENT,
  `pg_name` varchar(255) NOT NULL,
  `pg_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`pg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_grp`
--

INSERT INTO `tbl_product_grp` (`pg_id`, `pg_name`, `pg_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'DEMO1', 2, '2019-09-09 14:52:21', 1, 1),
(2, 'VENDOR', 0, '2019-09-09 14:53:11', 1, 1),
(3, 'R & D', 0, '2019-09-09 14:53:51', 1, 1),
(4, 'LABORATORY TESTING', 0, '2019-09-09 14:53:56', 1, 1),
(5, 'ASDSAD', 2, '2019-09-09 14:54:19', 1, 1),
(6, 'HGHJG', 2, '2019-09-09 14:55:11', 1, 1),
(7, 'ASDSADASDSAD', 2, '2019-09-09 14:56:15', 1, 1),
(8, 'CONSULTING', 0, '2019-09-09 14:56:28', 1, 1),
(9, 'PROJECT', 0, '2019-09-09 14:56:34', 1, 1),
(10, 'SADSAD', 2, '2019-09-09 15:04:32', 1, 1),
(11, 'TEST GRP 1', 0, '2019-11-19 15:57:51', 1, 1),
(12, 'TEST GRP 2', 0, '2019-11-19 15:58:42', 1, 1),
(13, 'TEST GRP 3', 0, '2019-11-19 16:02:54', 1, 1),
(14, 'TEST GRP 4', 0, '2019-11-19 16:03:37', 1, 1),
(15, 'TEST GRP 5', 0, '2019-11-19 16:05:12', 1, 1),
(16, 'TEST GRP 6', 0, '2019-11-19 16:06:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_model`
--

DROP TABLE IF EXISTS `tbl_product_model`;
CREATE TABLE IF NOT EXISTS `tbl_product_model` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_product_id` int(11) NOT NULL,
  `pm_model_no` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_model`
--

INSERT INTO `tbl_product_model` (`pm_id`, `pm_product_id`, `pm_model_no`, `cdate`, `user_id`, `company_id`) VALUES
(17, 3, 'P001', '2019-09-09 08:08:56', 1, 1),
(18, 3, 'P002', '2019-09-09 08:09:00', 1, 1),
(19, 4, '123213', '2019-09-09 08:10:28', 1, 1),
(20, 4, '2222', '2019-09-09 08:10:30', 1, 1),
(21, 5, 'p0001', '2019-09-10 05:47:04', 1, 1),
(22, 5, 'p0002', '2019-09-10 05:47:04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_serial`
--

DROP TABLE IF EXISTS `tbl_product_serial`;
CREATE TABLE IF NOT EXISTS `tbl_product_serial` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `ps_product_id` int(11) NOT NULL,
  `ps_serial_no` varchar(100) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_serial`
--

INSERT INTO `tbl_product_serial` (`ps_id`, `ps_product_id`, `ps_serial_no`, `cdate`, `user_id`, `company_id`) VALUES
(11, 4, '123456', '2019-09-09 08:08:49', 1, 1),
(12, 4, '78909', '2019-09-09 08:08:52', 1, 1),
(13, 5, '123123', '2019-09-10 05:47:04', 1, 1),
(14, 5, '3333', '2019-09-10 05:47:04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_specs`
--

DROP TABLE IF EXISTS `tbl_product_specs`;
CREATE TABLE IF NOT EXISTS `tbl_product_specs` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_specs`
--

INSERT INTO `tbl_product_specs` (`pspec_id`, `pspec_product_id`, `p_priority`, `p_header`, `p_spec`, `p_value`, `cdate`, `user_id`, `company_id`) VALUES
(20, 4, '1', 'DEMO', 'DEMO', '120', '2019-09-09 08:09:13', 1, 1),
(21, 4, '2', 'DEMO1', 'DEMO1', '1200', '2019-09-09 08:09:21', 1, 1),
(22, 5, '1', 'demo', 'demo1', '100', '2019-09-10 05:47:04', 1, 1),
(23, 5, '2', 'demo1', 'demo1111', '200', '2019-09-10 05:47:04', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_type`
--

DROP TABLE IF EXISTS `tbl_product_type`;
CREATE TABLE IF NOT EXISTS `tbl_product_type` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(100) NOT NULL,
  `pt_status` int(11) NOT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_type`
--

INSERT INTO `tbl_product_type` (`pt_id`, `pt_name`, `pt_status`) VALUES
(1, 'Finish Product', 0),
(2, 'Stationary', 0),
(3, 'Raw Material', 0),
(4, 'Reagent', 0),
(5, 'Glassware', 0),
(6, 'Consulting', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_ven_hist`
--

DROP TABLE IF EXISTS `tbl_product_ven_hist`;
CREATE TABLE IF NOT EXISTS `tbl_product_ven_hist` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_ven_hist`
--

INSERT INTO `tbl_product_ven_hist` (`ven_hist_id`, `product_id`, `cust_id`, `ven_rate`, `ven_rmrk`, `ven_hist_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 0, 4, 120.00, 'good items x1', 3, '2019-12-09 13:09:13', 1, 1),
(2, 0, 8, 100.00, 'okz', 3, '2019-12-09 13:09:22', 1, 1),
(3, 9, 4, 120.00, 'expensvies', 0, '2019-12-13 11:29:13', 1, 1),
(4, 9, 8, 100.00, 'well x1', 0, '2019-12-13 11:29:13', 1, 1),
(5, 9, 4, 120.00, 'serive not good', 0, '2019-12-16 09:49:12', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase`
--

DROP TABLE IF EXISTS `tbl_purchase`;
CREATE TABLE IF NOT EXISTS `tbl_purchase` (
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchase`
--

INSERT INTO `tbl_purchase` (`purchase_id`, `cust_id`, `purchaseorder_id`, `purchase_no`, `purchase_date`, `ref_no`, `ref_date`, `round_off`, `g_total`, `currency_id`, `paid_amount`, `formulaid`, `packing`, `discount`, `charges_formulaid`, `taxname1`, `taxname2`, `taxname3`, `taxvalue1`, `taxvalue2`, `taxvalue3`, `cdate`, `mdate`, `status`, `userid`, `remark`, `po_pdf`, `print_status`, `company_id`) VALUES
(1, 8, 0, 'P/002/19-20', '2019-11-07', 'R1', '2019-11-07', 0.800, 308, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-07 10:06:07', '2019-11-07 09:53:42', 0, 1, '', '', 0, 1),
(2, 8, 2, 'P/003/19-20', '2019-11-07', 'REF-3', '2019-11-06', 0.400, 24, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-07 10:56:15', '2019-11-07 10:51:58', 0, 1, 'rmrk ', '', 0, 1),
(3, 8, 3, 'P/004/19-20', '2019-11-11', '', '1970-01-01', 0.000, 28000, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-11 09:45:16', '2019-11-11 09:45:16', 0, 1, '', '', 0, 1),
(4, 11, 0, 'P/005/19-20', '2019-12-06', '', '1970-01-01', 0.000, 18000, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-06 06:59:10', '2019-12-06 06:58:09', 0, 1, '', '', 0, 1),
(5, 11, 6, 'P/006/19-20', '2020-01-09', '', '1970-01-01', 0.000, 400, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2020-01-09 13:22:17', '2020-01-09 13:22:17', 0, 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchaseorder`
--

DROP TABLE IF EXISTS `tbl_purchaseorder`;
CREATE TABLE IF NOT EXISTS `tbl_purchaseorder` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchaseorder`
--

INSERT INTO `tbl_purchaseorder` (`purchaseorder_id`, `start_id`, `main_id`, `cust_id`, `po_ven_address`, `prf_entry_id`, `purchaseorder_no`, `purchaseorder_date`, `po_so_no`, `sales_order_id`, `po_ref_no`, `po_ref_date`, `delivery_date`, `mode_of_dispatch`, `payment_terms`, `round_off`, `g_total`, `currency_id`, `paid_amount`, `formulaid`, `packing`, `misc_charges`, `discount`, `charges_formulaid`, `taxname1`, `taxname2`, `taxname3`, `taxvalue1`, `taxvalue2`, `taxvalue3`, `cdate`, `mdate`, `status`, `delivery_status`, `purchase_status`, `used_purchase_id`, `img_disp_flag`, `userid`, `remark`, `po_terms_cond`, `po_pdf`, `po_attach`, `print_status`, `approval_status`, `po_inspect_status`, `used_grn_status`, `company_id`) VALUES
(1, 1, 0, 4, 'KHARPADA NO MAHAD\r\nMANDIBAZAR\r\nSIDHPUR (SIDDHAPUR), Gujarat, India - 384151', 0, 'PO/005/19-20', '2019-11-06', '', 0, '', '2019-11-06', '0000-00-00', '', '', 0.000, 200, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-08 07:26:41', '2019-11-06 13:34:53', 0, 0, 0, 0, 0, 1, '', '', '', '', 0, 0, 0, 0, 1),
(2, 2, 0, 8, '', 0, 'PO/006/19-20', '2019-11-06', '', 0, 'REF-006', '2019-11-05', '0000-00-00', '', '', 0.000, 24, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-07 06:57:04', '2019-11-06 13:35:24', 0, 0, 1, 2, 0, 1, 'my test remark', '', '', '', 0, 0, 0, 0, 1),
(3, 3, 0, 8, '', 0, 'PO/007/19-20', '2019-11-11', '', 0, '', '2019-11-11', '0000-00-00', '', '', 0.000, 28000, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-11-11 09:44:36', '2019-11-11 09:44:36', 0, 0, 1, 3, 0, 1, '', '', '', '', 0, 0, 0, 0, 1),
(4, 4, 0, 8, '', 0, 'PO/008/19-20', '2019-11-20', '', 0, '', '2019-11-20', '0000-00-00', '', '', 0.000, 100, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-10 10:29:11', '2019-11-20 10:29:35', 0, 0, 0, 0, 0, 1, '', '', '', 'po_attach13836.pdf', 0, 1, 1, 0, 1),
(5, 5, 0, 4, '', 0, 'PO/009/19-20', '2019-12-12', '', 0, '', '2019-12-12', '0000-00-00', '', '', 0.000, 320, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-12 06:47:18', '2019-12-12 06:47:18', 0, 0, 0, 0, 0, 1, '', '', '', '', 0, 1, 1, 1, 1),
(6, 6, 0, 11, '', 0, 'PO/010/19-20', '2019-12-13', '', 0, '', '2019-12-13', '0000-00-00', '', '', 0.000, 400, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0.00, 0.00, 0.00, '2019-12-13 11:25:55', '2019-12-13 11:25:55', 0, 0, 1, 5, 0, 1, '', '', '', '', 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchaseordertrn`
--

DROP TABLE IF EXISTS `tbl_purchaseordertrn`;
CREATE TABLE IF NOT EXISTS `tbl_purchaseordertrn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchaseordertrn`
--

INSERT INTO `tbl_purchaseordertrn` (`purchaseordertrn_id`, `product_id`, `description`, `purchaseorder_id`, `product_qty`, `product_des`, `product_rate`, `product_disc`, `unit_id`, `product_amount`, `product_discount`, `discount_per`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `bom_trn_id`, `inspect_status`, `cdate`, `mdate`, `purchaseordertrn_status`, `user_id`) VALUES
(1, 8, '', 1, 2.00, '', 100.00, 0.00, 3, 200.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 200.00, 16, 0, '2019-11-06 13:34:44', '2019-11-06 13:34:44', 0, 1),
(2, 7, 'raw 1 desc', 2, 1.00, '', 20.00, 0.00, 1, 20.00, 0.00, 0.00, 1, 'CGST 9%', 1.80, 'SGST 9%', 1.80, '', 0.00, 23.60, 15, 0, '2019-11-06 13:35:12', '2019-11-06 13:35:12', 0, 1),
(3, 7, '', 3, 100.00, '', 80.00, 0.00, 0, 8000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 8000.00, 17, 0, '2019-11-11 09:43:26', '2019-11-11 09:43:26', 0, 1),
(4, 8, '', 3, 200.00, '', 100.00, 0.00, 0, 20000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 20000.00, 18, 0, '2019-11-11 09:43:26', '2019-11-11 09:43:26', 0, 1),
(5, 5, '', 4, 1.00, '', 100.00, 0.00, 4, 100.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 0, 1, '2019-11-20 10:14:56', '2019-11-20 10:14:56', 0, 1),
(14, 8, 'se vsvvs', 0, 4.00, '', 100.00, 0.00, 3, 400.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 400.00, 22, 0, '2019-12-12 06:47:05', '2019-12-12 06:47:05', 2, 1),
(15, 7, '', 5, 4.00, '', 80.00, 0.00, 0, 320.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 320.00, 21, 1, '2019-12-12 06:47:05', '2019-12-12 06:47:05', 0, 1),
(17, 8, 'se vsvvs', 6, 4.00, '', 100.00, 0.00, 3, 400.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 400.00, 22, 1, '2019-12-13 11:25:44', '2019-12-13 11:25:44', 0, 1),
(18, 5, '', 0, 1.00, '', 10.00, 0.00, 4, 10.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 10.00, 0, 0, '2020-01-08 12:13:37', '2020-01-08 12:13:37', 3, 1),
(19, 8, '', 0, 1.00, '', 100.00, 0.00, 3, 100.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 0, 0, '2020-01-08 12:13:52', '2020-01-08 12:13:52', 3, 1),
(20, 9, '', 0, 1.00, '', 10.00, 0.00, 0, 10.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 10.00, 0, 0, '2020-01-08 12:14:04', '2020-01-08 12:14:04', 3, 1),
(21, 6, 'tset', 0, 1.00, '', 10.00, 0.00, 3, 10.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 10.00, 0, 0, '2020-01-09 09:34:09', '2020-01-09 09:34:09', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchaseorder_log`
--

DROP TABLE IF EXISTS `tbl_purchaseorder_log`;
CREATE TABLE IF NOT EXISTS `tbl_purchaseorder_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchaseorder_log`
--

INSERT INTO `tbl_purchaseorder_log` (`purchaseorder_log_id`, `purchaseorder_id`, `assign_user_ids`, `approve_remark`, `approve_status`, `purchaseorder_log_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 4, 3, 'goofdfvs', 1, 0, '2019-12-10 09:47:24', 1, 1),
(2, 5, 3, '', 1, 0, '2020-01-09 13:54:30', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_trn`
--

DROP TABLE IF EXISTS `tbl_purchase_trn`;
CREATE TABLE IF NOT EXISTS `tbl_purchase_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_purchase_trn`
--

INSERT INTO `tbl_purchase_trn` (`purchase_trn_id`, `product_id`, `description`, `purchase_id`, `product_qty`, `product_hsn_code`, `product_des`, `product_rate`, `product_disc`, `unit_id`, `product_amount`, `product_discount`, `discount_per`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `cdate`, `purchase_trn_status`, `user_id`) VALUES
(1, 7, '', 1, 2.00, '', '', 80.00, 0.00, 3, 160.00, 0.00, 0.00, 3, 'CGST 6%', 9.60, 'SGST 6%', 9.60, '', 0.00, 179.20, '2019-11-07 09:46:57', 0, 1),
(2, 8, 'semi 1 desc', 1, 1.00, '', '', 100.00, 0.00, 3, 100.00, 0.00, 0.00, 7, 'CGST 14%', 14.00, 'SGST 14%', 14.00, '', 0.00, 128.00, '2019-11-07 10:05:08', 0, 1),
(3, 7, 'raw 1 desc edited', 2, 1.00, '', '', 20.00, 0.00, 1, 20.00, 0.00, 0.00, 1, 'CGST 9%', 1.80, 'SGST 9%', 1.80, '', 0.00, 23.60, '2019-11-07 10:50:47', 0, 1),
(4, 7, '', 3, 100.00, '', '', 80.00, 0.00, 1, 8000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 8000.00, '2019-11-11 09:45:05', 0, 1),
(5, 8, '', 3, 200.00, '', '', 100.00, 0.00, 3, 20000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 20000.00, '2019-11-11 09:45:09', 0, 1),
(6, 8, '', 4, 100.00, '', '', 100.00, 0.00, 3, 10000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 10000.00, '2019-12-06 06:58:08', 0, 1),
(7, 7, '', 4, 100.00, '', '', 80.00, 0.00, 3, 8000.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 8000.00, '2019-12-06 06:59:08', 0, 1),
(10, 8, 'se vsvvs', 5, 4.00, '', '', 100.00, 0.00, 3, 400.00, 0.00, 0.00, 0, '', 0.00, '', 0.00, '', 0.00, 400.00, '2020-01-09 13:21:52', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

DROP TABLE IF EXISTS `tbl_question`;
CREATE TABLE IF NOT EXISTS `tbl_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_id`, `question`, `status`) VALUES
(1, 'What is Your child hood nick name?', 0),
(2, 'What is Your Favorite book name? ', 0),
(3, 'What is your first mobile no?', 0),
(4, 'Who is your first child hood friend?', 0),
(5, 'which city/village you born?', 0),
(6, 'what would you like to ask to world?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation`
--

DROP TABLE IF EXISTS `tbl_quotation`;
CREATE TABLE IF NOT EXISTS `tbl_quotation` (
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
  PRIMARY KEY (`quotation_id`),
  KEY `quotation_id` (`quotation_id`),
  KEY `start_quotation_id` (`start_quotation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quotation`
--

INSERT INTO `tbl_quotation` (`quotation_id`, `quotation_no`, `quotation_date`, `cust_id`, `c_con_id`, `inquiry_id`, `quot_subject`, `quot_type`, `quotation_valid_date`, `quotation_ref`, `g_total`, `currency_id`, `quot_remark`, `an_id`, `quot_annex_content`, `quot_address`, `create_date`, `cdate`, `mdate`, `quotation_status`, `revise_status`, `start_quotation_id`, `prev_quotation_id`, `approve_status`, `user_id`, `company_id`) VALUES
(1, 'QT/008/19-20', '2019-09-27', 8, 5, 1, 'test quot', 0, '2019-09-27', 'GOOGLE', 0.00, 68, 'remrk', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'TEST\r\nTETS A\r\nAHMEDABAD, Gujarat, India - 1234', '2019-09-27 16:31:38', '2019-09-27 05:31:38', '2019-09-27 05:31:38', 0, 1, 1, 0, 0, 1, 1),
(2, 'QT/008/19-20/R-1', '2019-09-28', 8, 5, 1, 'TEST QUOT', 0, '2019-09-28', 'GOOGLE', 0.00, 68, 'remrk', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'TEST\r\nTETS A\r\nAHMEDABAD, Gujarat, India - 1234', '2019-09-28 12:42:56', '2019-09-28 01:42:56', '2019-09-28 01:42:56', 0, 1, 1, 1, 0, 1, 1),
(3, 'QT/008/19-20/R-2', '2019-09-28', 8, 5, 1, 'TEST QUOT', 0, '2019-09-28', 'GOOGLE', 0.00, 68, 'remrk', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'TEST\r\nTETS A\r\nAHMEDABAD, Gujarat, India - 1234', '2019-09-28 12:46:03', '2019-09-28 01:46:03', '2019-09-28 01:46:03', 0, 1, 1, 2, 0, 1, 1),
(4, 'QT/008/19-20/R-3', '2019-09-28', 8, 5, 1, 'TEST QUOT', 0, '2019-09-28', 'GOOGLE', 0.00, 68, 'remrk', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'TEST\r\nTETS A\r\nAHMEDABAD, Gujarat, India - 1234', '2019-09-28 12:54:29', '2019-09-28 01:54:29', '2019-09-28 01:54:29', 2, 0, 1, 3, 0, 1, 1),
(5, 'QT/009/19-20', '2019-09-28', 4, 1, 2, 'opp 2', 0, '2019-09-28', '', 0.00, 68, '', 0, '', '', '2019-09-28 12:59:58', '2019-09-28 01:59:58', '2019-09-28 01:59:58', 2, 0, 5, 0, 0, 1, 1),
(6, 'QT/008/19-20/R-3', '2019-09-28', 8, 5, 1, 'TEST QUOT', 0, '2019-09-28', 'GOOGLE', 80.00, 68, 'remrk', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'TEST\r\nTETS A\r\nAHMEDABAD, Gujarat, India - 1234', '2019-09-28 13:08:24', '2019-12-12 06:06:00', '2019-09-28 02:08:24', 0, 0, 1, 3, 0, 1, 1);
INSERT INTO `tbl_quotation` (`quotation_id`, `quotation_no`, `quotation_date`, `cust_id`, `c_con_id`, `inquiry_id`, `quot_subject`, `quot_type`, `quotation_valid_date`, `quotation_ref`, `g_total`, `currency_id`, `quot_remark`, `an_id`, `quot_annex_content`, `quot_address`, `create_date`, `cdate`, `mdate`, `quotation_status`, `revise_status`, `start_quotation_id`, `prev_quotation_id`, `approve_status`, `user_id`, `company_id`) VALUES
(7, 'QT/010/19-20', '2019-10-24', 9, 9, 3, 'PVT LTD INQ', 0, '2019-10-24', 'GOOGLE', 200.00, 68, '', 1, '<p><strong>Water/Waste Water Analysis</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'test address,\r\nAhmedabad', '2019-10-24 14:00:17', '2019-12-12 06:06:10', '2019-10-24 03:00:17', 0, 0, 7, 0, 0, 1, 1),
(8, 'QT/011/19-20', '2019-11-11', 4, 1, 5, 'DHAVAL TEST INQ', 0, '2019-11-11', '', 40000.00, 68, '', 0, '', '', '2019-11-11 15:11:26', '2019-12-12 06:06:16', '2019-11-11 09:41:26', 0, 0, 8, 0, 1, 1, 1),
(9, 'QT/012/19-20', '2019-11-21', 10, 10, 6, 'PR @ DINA', 0, '2019-11-21', '', 100.00, 68, '', 1, '<p><strong>Water/Waste Water Analysis</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Acidity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Alkalinity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Ammonical Nitrogen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>BiochemicalÂ  Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chemical Oxygen Demand</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chlorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colloidal Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Colour</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Dissolved Oxygen</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Fluorides</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Free Ammonia</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Hexavalent Chromium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Iron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium (Titrimetric)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>20</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>21</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>22</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>23</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Oil and Grease</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>24</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Percent Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>25</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>26</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Phenolic Compound</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>27</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>28</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Reactive Silica</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>29</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Residual chlorine</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>30</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>31</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>32</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphates</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>33</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphide</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>34</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sulphite</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>35</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Temperature</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>60</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>36</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Dissolved Solids</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>37</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Hardness</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Soil /Sludge/Solid waste Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Available Nitrogen as N</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>350</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Available Phosphorus</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Boron</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Bulk Density</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Calcium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>6</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Chloride</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>150</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>7</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Color</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>8</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Conductivity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>9</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Magnesium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>200</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>10</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Moisture</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>11</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Nitrate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>12</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Organic Carbon</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>13</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Organic Matter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>14</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>pH</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>100</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>15</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Potassium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>16</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>17</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sodium Absorption Ratio (SAR) in Soil Extract</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>650</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>18</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Total Phosphate</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>400</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>19</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Water Holding Capacity</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>300</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charges</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Stack Monitoring & Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SPM</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>NOx</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charges</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>2500</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Ambient Air Monitoring & Analysis</strong><br />\r\n<br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SPM</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>NO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>3</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>SO2</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>4</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>RSPM ( PM10)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>600</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>5</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>PM2.5</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>1000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling charge ( 8 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>2000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>Â </p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Sampling Charge ( 24 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>3000</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<p><strong>Noise Monitoring</strong><br />\r\nÂ </p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"720\">\r\n	<tbody>\r\n		<tr height=\"12\">\r\n			<td height=\"12\" width=\"34\">\r\n			<p>Sr. No</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Parameter</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>Charges ( Rs. )</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>1</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Noise Monitoring (One time)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>1000</p>\r\n			</td>\r\n		</tr>\r\n		<tr height=\"14\">\r\n			<td height=\"14\" width=\"34\">\r\n			<p>2</p>\r\n			</td>\r\n			<td width=\"574\">\r\n			<p>Noise Monitoring (24 Hour)</p>\r\n			</td>\r\n			<td width=\"112\">\r\n			<p>3000</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\nÂ \r\n\r\n<h2 style=\"text-align: center;\"><span class=\"marker\"><strong>Level 1</strong></span></h2>\r\n\r\n<div style=\"text-align: center;\"><img alt=\"Image Here\" src=\"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png\" style=\"width: 272px; height: 92px;\" /></div>\r\n\r\n<h2 style=\"text-align: center;\"><span class=\"marker\"><strong>Level 2</strong></span></h2>\r\n', '', '2019-11-21 15:11:01', '2019-12-12 06:06:22', '2019-11-21 09:41:01', 0, 0, 9, 0, 1, 1, 1),
(10, 'QT/013/19-20', '2019-12-12', 15, 13, 7, 'PRO 1@TEST IMPORT 3', 0, '2019-12-12', '', 100.00, 68, '', 0, '<img alt=\"\" src=\"http://192.168.1.100/abhi/environ_crm/view//upload//inq_attach//dfd_attch_89147949.png\" style=\"width: 922px; height: 946px;\" />', '', '2019-12-12 11:38:03', '2019-12-16 12:52:40', '2019-12-12 06:08:03', 0, 0, 10, 0, 1, 1, 1),
(11, 'QT/014/19-20', '2020-01-04', 17, 14, 8, 'pro1@TEST IMPORT 1', 0, '2020-01-04', 'GOOGLE', 100.00, 68, '', 0, '', '', '2020-01-04 12:55:51', '2020-01-04 07:25:51', '2020-01-04 07:25:51', 0, 0, 11, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_terms_trn`
--

DROP TABLE IF EXISTS `tbl_quotation_terms_trn`;
CREATE TABLE IF NOT EXISTS `tbl_quotation_terms_trn` (
  `quotation_terms_trn_id` int(10) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `tc_id` int(11) NOT NULL,
  `tc_priority` int(11) NOT NULL,
  `tc_details` longtext CHARACTER SET utf8 NOT NULL,
  `quotation_terms_trn_status` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`quotation_terms_trn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quotation_terms_trn`
--

INSERT INTO `tbl_quotation_terms_trn` (`quotation_terms_trn_id`, `quotation_id`, `tc_id`, `tc_priority`, `tc_details`, `quotation_terms_trn_status`, `cdate`) VALUES
(1, 1, 9, 1, 'EX-WORKS AHMEDABAD', 0, '2019-09-27 16:31:38'),
(2, 1, 10, 2, 'NOT APPLICABLE', 0, '2019-09-27 16:31:38'),
(3, 1, 11, 3, '1 WEEK', 0, '2019-09-27 16:31:38'),
(4, 1, 12, 4, '100% PAYMENT AGAINST SUBMISSION OF BILL WITHIN 7 DAYS', 0, '2019-09-27 16:31:39'),
(5, 1, 13, 5, '18% GST', 0, '2019-09-27 16:31:39'),
(6, 1, 14, 6, 'NOT APPLICABLE', 0, '2019-09-27 16:31:39'),
(7, 1, 15, 9, 'In the unlikely event of a dispute relating to supplied product, dispute shall be subjected to the jurisdiction of Ahmedabad (India) courts.\r\n', 0, '2019-09-27 16:31:39'),
(8, 1, 16, 10, 'Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.\r\n', 0, '2019-09-27 16:31:39'),
(28, 6, 12, 4, '100% PAYMENT AGAINST SUBMISSION OF BILL WITHIN 7 DAYS', 0, '2019-12-12 11:36:00'),
(29, 6, 15, 9, 'In the unlikely event of a dispute relating to supplied product, dispute shall be subjected to the jurisdiction of Ahmedabad (India) courts.\r\n', 0, '2019-12-12 11:36:00'),
(30, 6, 16, 10, 'Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.\r\n\r\n', 0, '2019-12-12 11:36:00'),
(31, 7, 9, 1, 'EX-WORKS AHMEDABAD', 0, '2019-12-12 11:36:10'),
(32, 7, 10, 2, 'NOT APPLICABLE', 0, '2019-12-12 11:36:10'),
(33, 7, 11, 3, '1 WEEK', 0, '2019-12-12 11:36:10'),
(34, 7, 12, 4, '100% PAYMENT AGAINST SUBMISSION OF BILL WITHIN 7 DAYS', 0, '2019-12-12 11:36:10'),
(35, 7, 14, 6, 'NOT APPLICABLE', 0, '2019-12-12 11:36:10'),
(36, 7, 15, 9, 'In the unlikely event of a dispute relating to supplied product, dispute shall be subjected to the jurisdiction of Ahmedabad (India) courts.\r\n', 0, '2019-12-12 11:36:10'),
(37, 7, 16, 10, 'Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.\r\n', 0, '2019-12-12 11:36:10'),
(38, 10, 9, 1, 'EX-WORKS AHMEDABAD', 0, '2019-12-16 18:22:40'),
(39, 10, 10, 2, 'NOT APPLICABLE', 0, '2019-12-16 18:22:40'),
(40, 10, 11, 3, '1 WEEK', 0, '2019-12-16 18:22:40'),
(41, 10, 12, 4, '100% PAYMENT AGAINST SUBMISSION OF BILL WITHIN 7 DAYS', 0, '2019-12-16 18:22:40'),
(42, 10, 13, 5, '18% GST', 0, '2019-12-16 18:22:40'),
(43, 10, 14, 6, 'NOT APPLICABLE', 0, '2019-12-16 18:22:40'),
(44, 10, 15, 9, 'In the unlikely event of a dispute relating to supplied product, dispute shall be subjected to the jurisdiction of Ahmedabad (India) courts.\r\n', 0, '2019-12-16 18:22:40'),
(45, 10, 16, 10, 'Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.\r\n', 0, '2019-12-16 18:22:40'),
(46, 11, 9, 1, 'EX-WORKS AHMEDABAD', 0, '2020-01-04 12:55:51'),
(47, 11, 10, 2, 'NOT APPLICABLE', 0, '2020-01-04 12:55:51'),
(48, 11, 11, 3, '1 WEEK', 0, '2020-01-04 12:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_trn`
--

DROP TABLE IF EXISTS `tbl_quotation_trn`;
CREATE TABLE IF NOT EXISTS `tbl_quotation_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quotation_trn`
--

INSERT INTO `tbl_quotation_trn` (`quot_trn_id`, `quotation_id`, `product_id`, `product_desc`, `product_spec`, `level_id`, `product_qty`, `unitid`, `product_rate`, `product_discount`, `discount_per`, `product_amount`, `act_amt_flag`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `budget_trn_ttl`, `budget_margin_per`, `budget_margin_amt`, `budget_trn_g_total`, `quot_trn_status`, `user_id`, `company_id`) VALUES
(2, 1, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 1, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1),
(8, 2, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 1, 1, 3, 95.00, 0.00, 0.00, 95.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 95.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1),
(9, 3, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 1, 1, 3, 90.00, 0.00, 0.00, 90.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 90.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1),
(10, 4, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 1, 1, 3, 85.00, 0.00, 0.00, 85.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 85.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1),
(11, 5, 5, 'sadsad sdkjsahkjhaskjdhsaj', '', 1, 1, 0, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1),
(12, 6, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', '', 0, 1, 3, 80.00, 0.00, 0.00, 80.00, 1, 0, '', 0.00, '', 0.00, '', 0.00, 80.00, 3000.00, 0.00, 100.00, 3100.00, 0, 1, 1),
(16, 7, 5, 'sadsad sdkjsahkjhaskjdhsaj', '', 0, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 20.00, 10.00, 2.00, 22.00, 0, 1, 1),
(17, 7, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 2100.00, 0.00, 0.00, 2100.00, 0, 1, 1),
(22, 8, 5, 'sadsad sdkjsahkjhaskjdhsaj', '', 0, 1, 1, 40000.00, 0.00, 0.00, 40000.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 40000.00, 28000.00, 20.00, 5600.00, 33600.00, 0, 1, 1),
(23, 9, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 2080.00, 0.00, 0.00, 2080.00, 0, 1, 1),
(33, 10, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 2800.00, 0.00, 0.00, 2800.00, 0, 1, 1),
(35, 11, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', '', 0, 1, 3, 100.00, 0.00, 0.00, 100.00, 0, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quot_budget_trn`
--

DROP TABLE IF EXISTS `tbl_quot_budget_trn`;
CREATE TABLE IF NOT EXISTS `tbl_quot_budget_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quot_budget_trn`
--

INSERT INTO `tbl_quot_budget_trn` (`quot_budget_trn_id`, `quotation_id`, `quot_trn_id`, `req_product_id`, `req_product_desc`, `req_product_qty`, `req_product_rate`, `req_unitid`, `req_product_amount`, `quot_budget_trn_status`, `user_id`) VALUES
(3, 0, 0, 7, '', 10.00, 0.00, 0, 10.00, 0, 1),
(4, 0, 0, 8, '', 20.00, 100.00, 3, 120.00, 0, 1),
(6, 6, 12, 7, '', 10.00, 100.00, 1, 1000.00, 0, 1),
(7, 6, 12, 8, 'sem1 desc', 20.00, 100.00, 3, 2000.00, 0, 1),
(9, 0, 13, 7, '', 100.00, 0.00, 0, 0.00, 0, 1),
(10, 0, 13, 8, '', 200.00, 100.00, 0, 20000.00, 0, 1),
(12, 0, 15, 7, '', 100.00, 0.00, 0, 0.00, 0, 1),
(13, 0, 15, 8, '', 200.00, 100.00, 0, 20000.00, 0, 1),
(14, 7, 17, 7, '', 10.00, 10.00, 3, 100.00, 0, 1),
(15, 7, 17, 8, '', 20.00, 100.00, 4, 2000.00, 0, 1),
(17, 7, 16, 7, '', 1.00, 20.00, 1, 20.00, 0, 1),
(18, 8, 22, 7, '', 100.00, 80.00, 0, 8000.00, 0, 1),
(19, 8, 22, 8, '', 200.00, 100.00, 0, 20000.00, 0, 1),
(20, 9, 23, 7, '', 10.00, 80.00, 0, 800.00, 2, 1),
(21, 9, 23, 8, '', 20.00, 100.00, 3, 2000.00, 0, 1),
(23, 9, 23, 7, 'rw descs', 1.00, 80.00, 3, 80.00, 0, 1),
(24, 10, 33, 7, '', 10.00, 80.00, 0, 800.00, 0, 1),
(25, 10, 33, 8, 'se vsvvs', 20.00, 100.00, 3, 2000.00, 0, 1),
(26, 0, 34, 7, '', 10.00, 80.00, 0, 800.00, 0, 1),
(27, 0, 34, 8, 'se vsvvs', 20.00, 100.00, 3, 2000.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quot_dfd_attach`
--

DROP TABLE IF EXISTS `tbl_quot_dfd_attach`;
CREATE TABLE IF NOT EXISTS `tbl_quot_dfd_attach` (
  `dfd_attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `dfd_attch_doc_name` varchar(400) NOT NULL,
  `dfd_attch_file` varchar(400) NOT NULL,
  `dfd_attach_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`dfd_attach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_quot_dfd_attach`
--

INSERT INTO `tbl_quot_dfd_attach` (`dfd_attach_id`, `quotation_id`, `dfd_attch_doc_name`, `dfd_attch_file`, `dfd_attach_status`, `user_id`, `company_id`) VALUES
(1, 10, '', 'dfd_attch_89147949.png', 0, 1, 1),
(2, 11, '', 'dfd_attch_26702880.jpg', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_refer_by`
--

DROP TABLE IF EXISTS `tbl_refer_by`;
CREATE TABLE IF NOT EXISTS `tbl_refer_by` (
  `rb_id` int(11) NOT NULL AUTO_INCREMENT,
  `rb_name` varchar(100) NOT NULL,
  `rb_status` int(11) NOT NULL,
  PRIMARY KEY (`rb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_refer_by`
--

INSERT INTO `tbl_refer_by` (`rb_id`, `rb_name`, `rb_status`) VALUES
(1, 'BNI', 0),
(2, 'Cold Call', 0),
(3, 'Customer Referal', 0),
(4, 'Don\'t Know', 0),
(5, 'Exhibition', 0),
(6, 'Indiamart', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE IF NOT EXISTS `tbl_role` (
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

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`role_id`, `role_name`, `role_module`, `status`, `deletable`, `cdate`, `user_id`, `company_id`) VALUES
(8, 'SERVICE MANAGER', '4,1', 0, 0, '2019-09-05 23:43:33', 0, 0),
(9, 'PURCHASE ', '4,1', 0, 0, '2019-09-05 23:44:31', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_order`
--

DROP TABLE IF EXISTS `tbl_sales_order`;
CREATE TABLE IF NOT EXISTS `tbl_sales_order` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sales_order`
--

INSERT INTO `tbl_sales_order` (`sales_order_id`, `sales_order_no`, `sales_order_date`, `cust_id`, `quotation_id`, `so_ref_no`, `so_ref_date`, `so_remark`, `g_total`, `so_attach`, `cdate`, `sales_order_status`, `so_approve_status`, `bom_done_status`, `plan_done_status`, `invoice_done_status`, `used_invoice_id`, `user_id`, `company_id`) VALUES
(1, 'SO/003/19-20', '2019-10-23', 8, 6, '', '2019-10-23', '', 0, '', '2019-10-23 00:11:25', 0, 1, 1, 0, 0, 0, 1, 1),
(2, 'SO/004/19-20', '2019-10-24', 9, 7, '', '2019-10-24', '', 200, '', '2019-11-08 09:18:54', 0, 1, 1, 1, 1, 2, 1, 1),
(3, 'SO/005/19-20', '2019-11-11', 4, 8, '', '2019-11-11', '', 40000, '', '2019-11-11 09:42:12', 0, 0, 1, 1, 0, 0, 1, 1),
(4, 'SO/006/19-20', '2019-11-19', 9, 7, '', '2019-11-19', '', 200, 'so_attach22958.pdf', '2019-11-22 10:52:05', 0, 0, 0, 0, 0, 0, 1, 1),
(5, 'SO/007/19-20', '2019-11-22', 10, 9, '', '2019-11-22', '', 100, '', '2019-11-22 06:53:04', 0, 1, 1, 1, 1, 3, 1, 1),
(6, 'SO/008/19-20', '2019-12-12', 15, 10, '', '2019-12-12', '', 100, '', '2019-12-12 06:27:51', 0, 1, 1, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_order_log`
--

DROP TABLE IF EXISTS `tbl_sales_order_log`;
CREATE TABLE IF NOT EXISTS `tbl_sales_order_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sales_order_log`
--

INSERT INTO `tbl_sales_order_log` (`sales_order_log_id`, `sales_order_id`, `quotation_id`, `assign_user_ids`, `approve_remark`, `approve_status`, `sales_order_log_status`, `cdate`, `user_id`, `company_id`) VALUES
(1, 4, 0, 3, 'false', 2, 0, '2019-11-19 12:32:47', 1, 1),
(2, 4, 0, 3, 'check again', 2, 0, '2019-11-19 12:34:37', 1, 1),
(3, 4, 0, 3, 'mayber', 1, 0, '2019-11-19 12:45:11', 1, 1),
(4, 4, 0, 3, 'ok', 0, 0, '2019-11-19 12:46:48', 1, 1),
(5, 4, 0, 3, 'sdasda', 0, 0, '2019-11-19 12:47:06', 1, 1),
(6, 4, 0, 3, 'done', 1, 0, '2019-11-19 12:47:16', 1, 1),
(7, 4, 0, 3, 'now ok', 1, 0, '2019-11-19 12:54:17', 1, 1),
(8, 4, 0, 3, 'done by mistake', 0, 0, '2019-11-19 12:55:09', 1, 1),
(9, 0, 8, 3, 'by mistk', 0, 0, '2019-11-19 13:39:15', 1, 1),
(10, 0, 8, 0, 'now ok', 1, 0, '2019-11-19 13:39:32', 1, 1),
(11, 0, 9, 3, '', 1, 0, '2019-11-22 06:52:47', 1, 1),
(12, 5, 0, 3, '', 1, 0, '2019-11-22 06:56:18', 1, 1),
(13, 0, 10, 3, '', 1, 0, '2019-12-12 06:27:01', 1, 1),
(14, 6, 0, 3, '', 1, 0, '2019-12-12 06:28:00', 1, 1),
(15, 0, 11, 3, '', 1, 0, '2020-01-04 07:26:05', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_order_trn`
--

DROP TABLE IF EXISTS `tbl_sales_order_trn`;
CREATE TABLE IF NOT EXISTS `tbl_sales_order_trn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sales_order_trn`
--

INSERT INTO `tbl_sales_order_trn` (`so_trn_id`, `sales_order_id`, `product_id`, `product_desc`, `product_qty`, `unitid`, `product_rate`, `product_discount`, `discount_per`, `product_amount`, `formulaid`, `tax_name1`, `tax_amount1`, `tax_name2`, `tax_amount2`, `tax_name3`, `tax_amount3`, `product_total`, `quot_trn_id`, `so_trn_status`, `user_id`) VALUES
(1, 1, 6, '- Water/Waste Water Analysis\n- Soil /Sludge/Solid Waste Analysis\n- Stack Monitoring & Analysis\n- Ambient Air Monitoring & Analysis\n- Noise Monitoring', 1.00, 3, 80.00, 0.00, 0.00, 80.00, 0, '', 0.00, '', 0.00, '', 0.00, 80.00, 12, 0, 1),
(2, 2, 5, 'sadsad sdkjsahkjhaskjdhsaj', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 16, 0, 1),
(3, 2, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 17, 0, 1),
(4, 3, 5, 'sadsad sdkjsahkjhaskjdhsaj', 1.00, 1, 40000.00, 0.00, 0.00, 40000.00, 0, '', 0.00, '', 0.00, '', 0.00, 40000.00, 22, 0, 1),
(5, 4, 5, 'sadsad sdkjsahkjhaskjdhsaj', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 16, 0, 1),
(6, 4, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 17, 0, 1),
(8, 5, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 23, 0, 1),
(9, 6, 6, 'Water/Waste Water Analysis\nSoil /Sludge/Solid Waste Analysis\nStack Monitoring & Analysis\nAmbient Air Monitoring & Analysis\nNoise Monitoring', 1.00, 3, 100.00, 0.00, 0.00, 100.00, 0, '', 0.00, '', 0.00, '', 0.00, 100.00, 33, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_serialtrn`
--

DROP TABLE IF EXISTS `tbl_serialtrn`;
CREATE TABLE IF NOT EXISTS `tbl_serialtrn` (
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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

DROP TABLE IF EXISTS `tbl_setting`;
CREATE TABLE IF NOT EXISTS `tbl_setting` (
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

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `title`, `address`, `bank_detail`, `cstno`, `cst_date`, `vatno`, `vat_date`, `pan_no`, `logo`, `f_logo`, `bank_name`, `ac_no`, `ifcs`, `branch_name`, `status`, `cdate`, `user_id`) VALUES
(1, 'NIDHI PACKAGING', '<P><SPAN STYLE=\"\">11, BHAGIRATH IND ESTATE,</SPAN></P><P><SPAN STYLE=\"\">PART-3, OPP AMRAIWADI A.E.C</SPAN></P><P><SPAN STYLE=\"\">JAWAHARNAGAR ROAD AMRAIWADI</SPAN></P><P><SPAN STYLE=\"\">AHMEDABAD, 380 026</SPAN></P><P><SPAN STYLE=\"\">EMAIL: NIDHIPACKAGING49@YMAIL.COM</SPAN></P>', '', '24572304926', '1970-01-01', '24072304926', '1970-01-01', '', 'header3738.jpg', 'footer2323.jpg', 'BOI', '1236548966552', 'BOI2017', 'ANADNAGAR', 0, '2017-02-21 06:20:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_task`
--

DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE IF NOT EXISTS `tbl_task` (
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_task`
--

INSERT INTO `tbl_task` (`task_id`, `task_type_id`, `task_rel_id`, `task_name`, `c_con_id`, `cust_id`, `inquiry_id`, `task_location`, `full_day_event`, `appointment_start_time`, `appointment_end_time`, `appointment_subject`, `task_remark`, `assign_user_ids`, `task_priority_id`, `task_due_date`, `task_alert_id`, `create_date`, `alert_date_time`, `task_completion_date`, `cdate`, `task_status`, `entry_type`, `user_id`, `company_id`) VALUES
(1, 16, 5, '', 0, 0, 2, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'rsff', '', 1, '2019-10-15 14:19:00', 1, '2019-10-15 14:19:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-10-15 03:19:49', 0, 1, 1, 1),
(2, 13, 5, '', 0, 0, 5, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'test rmrk', '3', 1, '2019-11-16 11:15:00', 1, '2019-11-12 11:31:23', '1970-01-01 05:30:00', '2019-11-12 17:02:01', '2019-11-13 12:25:28', 1, 1, 1, 1),
(3, 14, 5, '', 0, 0, 5, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'rmrk 2', '', 2, '2019-11-14 10:30:00', 1, '2019-11-12 12:19:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-11-12 06:49:36', 0, 1, 1, 1),
(4, 0, 5, '', 0, 0, 5, 'test ocation', 0, '2019-11-12 12:31:00', '2019-11-12 14:00:00', 'test subt ', 'appo rmrk', '', 0, '0000-00-00 00:00:00', 1, '2019-11-12 12:32:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-11-12 07:02:19', 0, 2, 1, 1),
(5, 14, 1, 'GEN TEST 1', 0, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, '2019-11-13 18:06:00', 1, '2019-11-13 18:10:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-11-13 12:40:28', 0, 1, 1, 1),
(6, 14, 2, 'AMC TEST 1', 0, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, '2019-11-13 18:13:00', 1, '2019-11-13 18:13:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-11-13 12:43:52', 0, 1, 1, 1),
(7, 18, 3, '', 6, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, '2019-11-13 18:14:00', 1, '2019-11-13 18:16:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2019-11-13 12:46:05', 0, 1, 1, 1),
(8, 17, 4, '', 0, 8, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '1', 1, '2019-11-13 18:15:00', 1, '2019-11-13 18:17:44', '2019-12-11 01:00:00', '2019-12-16 16:05:07', '2019-12-16 09:29:10', 1, 1, 1, 1),
(9, 17, 4, '', 0, 8, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '1', 1, '2019-12-15 01:00:00', 2, '2019-12-16 15:48:55', '2019-12-15 01:00:00', '2019-12-16 16:05:26', '2019-12-16 10:35:26', 1, 1, 1, 1),
(10, 17, 4, '', 0, 8, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'meet later', '1', 1, '2019-12-15 04:00:00', 2, '2019-12-16 16:05:07', '2019-12-15 04:00:00', '0000-00-00 00:00:00', '2019-12-16 10:35:07', 0, 1, 1, 1),
(11, 16, 5, '', 0, 0, 8, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'test', '7', 1, '2020-01-04 12:28:00', 2, '2020-01-04 12:30:13', '2020-01-04 12:28:00', '2020-01-04 12:54:12', '2020-01-04 07:00:13', 1, 1, 1, 1),
(12, 16, 5, '', 0, 0, 8, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'test done', '7', 1, '2020-01-04 12:54:00', 2, '2020-01-04 12:54:11', '2020-01-04 12:54:00', '0000-00-00 00:00:00', '2020-01-04 07:24:11', 0, 1, 7, 1),
(13, 16, 5, '', 0, 0, 8, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'test rmrk', '1', 1, '2020-01-08 15:38:00', 2, '2020-01-08 15:38:29', '2020-01-08 15:38:00', '0000-00-00 00:00:00', '2020-01-08 10:08:29', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax`
--

DROP TABLE IF EXISTS `tbl_tax`;
CREATE TABLE IF NOT EXISTS `tbl_tax` (
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

--
-- Dumping data for table `tbl_tax`
--

INSERT INTO `tbl_tax` (`tax_id`, `tax_name`, `tax_value`, `tax_typeid`, `cdate`, `tax_status`, `user_id`, `usertype_id`, `company_id`) VALUES
(1, 'CGST 0%', 0, 0, '2019-09-25 08:01:14', 0, 1, 2, 1),
(2, 'SGST 0%', 0, 0, '2019-09-25 08:01:19', 0, 1, 2, 1),
(3, 'CGST 2.5%', 2.5, 0, '2019-09-25 08:01:39', 0, 1, 2, 1),
(4, 'SGST 2.5%', 2.5, 0, '2019-09-25 08:01:43', 0, 1, 2, 1),
(5, 'CGST 6%', 6, 0, '2019-09-25 08:02:01', 0, 1, 2, 1),
(6, 'SGST 6%', 6, 0, '2019-09-25 08:02:05', 0, 1, 2, 1),
(7, 'CGST 9%', 9, 0, '2019-09-25 08:02:26', 0, 1, 2, 1),
(8, 'SGST 9%', 9, 0, '2019-09-25 08:02:30', 0, 1, 2, 1),
(9, 'CGST 14%', 14, 0, '2019-09-25 08:02:57', 0, 1, 2, 1),
(10, 'SGST 14%', 14, 0, '2019-09-25 08:03:03', 0, 1, 2, 1),
(11, 'IGST 0%', 0, 0, '2019-09-25 08:03:14', 0, 1, 2, 1),
(12, 'IGST 5%', 5, 0, '2019-09-25 08:03:20', 0, 1, 2, 1),
(13, 'IGST 12%', 12, 0, '2019-09-25 08:03:32', 0, 1, 2, 1),
(14, 'IGST 28%', 28, 0, '2019-09-25 08:03:47', 0, 1, 2, 1),
(15, 'IGST 18%', 18, 0, '2019-09-25 08:04:05', 0, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_trn`
--

DROP TABLE IF EXISTS `tbl_tax_trn`;
CREATE TABLE IF NOT EXISTS `tbl_tax_trn` (
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

--
-- Dumping data for table `tbl_tax_trn`
--

INSERT INTO `tbl_tax_trn` (`invtaxtrn_id`, `mst_id`, `trn_id`, `tax_for`, `tax_id`, `tax_amount`, `tax_rate`, `trn_status`, `company_id`) VALUES
(5, 0, 21, 'invoice', '5,4', '1680.00', 28.00, 0, 0),
(6, 0, 21, 'invoice', '5,4', '840.00', 14.00, 0, 0),
(7, 0, 22, 'invoice', '5,4', '32760.00', 28.00, 0, 0),
(8, 0, 22, 'invoice', '5,4', '16380.00', 14.00, 0, 0),
(9, 0, 21, 'invoice', '5,4', '1680.00', 28.00, 0, 0),
(10, 0, 21, 'invoice', '5,4', '840.00', 14.00, 0, 0),
(11, 0, 22, 'invoice', '5,4', '32760.00', 28.00, 0, 0),
(12, 0, 22, 'invoice', '5,4', '16380.00', 14.00, 0, 0),
(13, 18, 24, 'invoice', '5,4', '31220.00', 28.00, 0, 0),
(14, 18, 24, 'invoice', '5,4', '15610.00', 14.00, 0, 0),
(15, 22, 44, 'expense', '7', '44.80', 20.00, 0, 0),
(16, 22, 44, 'expense', '8', '276541.44', 123456.00, 0, 0),
(17, 22, 45, 'expense', '9', '148.08', 12.00, 0, 0),
(18, 23, 48, 'expense', '4', '34.44', 28.00, 0, 0),
(19, 23, 49, 'expense', '4', '2520.00', 28.00, 0, 0),
(20, 23, 48, 'expense', '5', '17.22', 14.00, 0, 0),
(21, 23, 49, 'expense', '5', '1260.00', 14.00, 0, 0),
(22, 24, 51, 'expense', '4', '252.00', 28.00, 0, 0),
(23, 24, 51, 'expense', '5', '126.00', 14.00, 0, 0),
(24, 24, 52, 'expense', '6', '112.00', 14.00, 0, 0),
(25, 9, 9, 'income', '6', '280.00', 14.00, 0, 0),
(26, 9, 10, 'income', '9', '1080.00', 12.00, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_type`
--

DROP TABLE IF EXISTS `tbl_tax_type`;
CREATE TABLE IF NOT EXISTS `tbl_tax_type` (
  `tax_typeid` int(11) NOT NULL AUTO_INCREMENT,
  `tax_type_name` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`tax_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tax_type`
--

INSERT INTO `tbl_tax_type` (`tax_typeid`, `tax_type_name`, `status`) VALUES
(1, 'CGST', 0),
(2, 'SGST', 0),
(3, 'IGST', 0),
(4, 'CESS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_terms_category`
--

DROP TABLE IF EXISTS `tbl_terms_category`;
CREATE TABLE IF NOT EXISTS `tbl_terms_category` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_name` varchar(100) NOT NULL,
  `tc_status` int(11) NOT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_terms_category`
--

INSERT INTO `tbl_terms_category` (`tc_id`, `tc_name`, `tc_status`) VALUES
(1, 'Quotation', 0),
(2, 'Purchase Order', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_terms_condition`
--

DROP TABLE IF EXISTS `tbl_terms_condition`;
CREATE TABLE IF NOT EXISTS `tbl_terms_condition` (
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_terms_condition`
--

INSERT INTO `tbl_terms_condition` (`tc_id`, `tc_name`, `tc_priority`, `tc_category`, `tc_details`, `tc_for`, `tc_allow`, `tc_status`, `cdate`, `user_id`, `company_id`) VALUES
(2, 'DEMO 1', 1, '1', '1. DEMO 1 DEMO 1 DMEO\\R\\N2. DEMO 2 DEMO 2 DEMO2\\R\\N3. DEMO 3 DEMO 3 DEMO 3', '0', 0, 2, '2019-09-10 13:27:43', 1, 1),
(3, 'SAD', 21, '1', 'ASD\\R\\NASD \\R\\NSAD\\R\\N ', '0', 0, 2, '2019-09-10 14:27:52', 1, 1),
(4, 'ASD', 0, '2', 'ASD', '0', 0, 2, '2019-09-10 14:31:32', 1, 1),
(5, 'BOTH 1', 2, '1', 'BITH 1 DESC', '0,1', 1, 2, '2019-09-25 16:42:24', 1, 1),
(6, 'DOMESTIC 1', 1, '1', 'DOMESTIC 1 DESC', '0', 1, 2, '2019-09-25 09:53:12', 1, 1),
(7, '', 0, '', '', '0', 0, 2, '2019-09-10 15:50:58', 1, 1),
(8, 'EXPORT 1', 1, '1', 'DOMESTIC 1 DESC', '1', 1, 2, '2019-09-25 16:42:18', 1, 1),
(9, 'PRICE BASIS', 1, '1', 'EX-WORKS AHMEDABAD', '0,1', 1, 0, '2019-09-27 16:24:20', 1, 1),
(10, 'PACKING & FORWARDING', 2, '1', 'NOT APPLICABLE', '0,1', 1, 0, '2019-09-27 16:26:54', 1, 1),
(11, 'DELIVERY TERM', 3, '1', '1 WEEK', '0,1', 1, 0, '2019-09-27 16:27:02', 1, 1),
(12, 'TERMS OF PAYMENT', 4, '1', '100% PAYMENT AGAINST SUBMISSION OF BILL WITHIN 7 DAYS', '0,1', 1, 0, '2019-09-27 16:27:19', 1, 1),
(13, 'TAXES & DUTIES', 5, '1', '18% GST', '0,1', 1, 0, '2019-09-27 16:27:10', 1, 1),
(14, 'OCTROI & INSURANCE', 6, '1', 'NOT APPLICABLE', '0,1', 1, 0, '2019-09-27 16:27:27', 1, 1),
(15, 'JURISDICTION', 9, '1', 'In the unlikely event of a dispute relating to supplied product, dispute shall be subjected to the jurisdiction of Ahmedabad (India) courts.\r\n', '0,1', 1, 0, '2019-09-27 16:27:55', 1, 1),
(16, 'VALIDITY', 10, '1', 'Our Quotation will be valid for your kind consideration for a period of 30 days from the date hereof. Any extension thereafter will be subject to our written confirmation only.\r\n', '0,1', 1, 0, '2019-09-27 16:28:13', 1, 1),
(17, 'PO TEMRS 1', 1, '2', 'po temrs 1 desc', '0,1', 1, 0, '2019-11-06 16:11:57', 1, 1),
(18, 'PO TERMS 2', 2, '2', 'po terms 2 dec', '0,1', 1, 0, '2019-11-06 16:12:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_timezone`
--

DROP TABLE IF EXISTS `tbl_timezone`;
CREATE TABLE IF NOT EXISTS `tbl_timezone` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_abbr` varchar(250) NOT NULL,
  `t_name` varchar(250) NOT NULL,
  `t_utc_offset` varchar(250) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_timezone`
--

INSERT INTO `tbl_timezone` (`t_id`, `t_abbr`, `t_name`, `t_utc_offset`) VALUES
(2, 'ACDT', 'Australian Central Daylight Savings Time', 'UTC+10:30'),
(3, 'ACST', 'Australian Central Standard Time', 'UTC+09:30'),
(4, 'ACT', 'Acre Time', 'UTC?05'),
(5, 'ACT', 'ASEAN Common Time (unofficial)', 'UTC+06:30 – UTC+09'),
(6, 'ACWST', 'Australian Central Western Standard Time (unofficial)', 'UTC+08:45'),
(7, 'ADT', 'Atlantic Daylight Time', 'UTC?03'),
(8, 'AEDT', 'Australian Eastern Daylight Savings Time', 'UTC+11'),
(9, 'AEST', 'Australian Eastern Standard Time', 'UTC+10'),
(10, 'AFT', 'Afghanistan Time', 'UTC+04:30'),
(11, 'AKDT', 'Alaska Daylight Time', 'UTC?08'),
(12, 'AKST', 'Alaska Standard Time', 'UTC?09'),
(13, 'ALMT', 'Alma-Ata Time[1]', 'UTC+06'),
(14, 'AMST', 'Amazon Summer Time (Brazil)[2]', 'UTC?03'),
(15, 'AMT', 'Amazon Time (Brazil)[3]', 'UTC?04'),
(16, 'AMT', 'Armenia Time', 'UTC+04'),
(17, 'ANAT', 'Anadyr Time[4]', 'UTC+12'),
(18, 'AQTT', 'Aqtobe Time[5]', 'UTC+05'),
(19, 'ART', 'Argentina Time', 'UTC?03'),
(20, 'AST', 'Arabia Standard Time', 'UTC+03'),
(21, 'AST', 'Atlantic Standard Time', 'UTC?04'),
(22, 'AWST', 'Australian Western Standard Time', 'UTC+08'),
(23, 'AZOST', 'Azores Summer Time', 'UTC±00'),
(24, 'AZOT', 'Azores Standard Time', 'UTC?01'),
(25, 'AZT', 'Azerbaijan Time', 'UTC+04'),
(26, 'BDT', 'Brunei Time', 'UTC+08'),
(27, 'BIOT', 'British Indian Ocean Time', 'UTC+06'),
(28, 'BIT', 'Baker Island Time', 'UTC?12'),
(29, 'BOT', 'Bolivia Time', 'UTC?04'),
(30, 'BRST', 'Brasília Summer Time', 'UTC?02'),
(31, 'BRT', 'Brasília Time', 'UTC?03'),
(32, 'BST', 'Bangladesh Standard Time', 'UTC+06'),
(33, 'BST', 'Bougainville Standard Time[6]', 'UTC+11'),
(34, 'BST', 'British Summer Time (British Standard Time from Feb 1968 to Oct 1971)', 'UTC+01'),
(35, 'BTT', 'Bhutan Time', 'UTC+06'),
(36, 'CAT', 'Central Africa Time', 'UTC+02'),
(37, 'CCT', 'Cocos Islands Time', 'UTC+06:30'),
(38, 'CDT', 'Central Daylight Time (North America)', 'UTC?05'),
(39, 'CDT', 'Cuba Daylight Time[7]', 'UTC?04'),
(40, 'CEST', 'Central European Summer Time (Cf. HAEC)', 'UTC+02'),
(41, 'CET', 'Central European Time', 'UTC+01'),
(42, 'CHADT', 'Chatham Daylight Time', 'UTC+13:45'),
(43, 'CHAST', 'Chatham Standard Time', 'UTC+12:45'),
(44, 'CHOT', 'Choibalsan Standard Time', 'UTC+08'),
(45, 'CHOST', 'Choibalsan Summer Time', 'UTC+09'),
(46, 'CHST', 'Chamorro Standard Time', 'UTC+10'),
(47, 'CHUT', 'Chuuk Time', 'UTC+10'),
(48, 'CIST', 'Clipperton Island Standard Time', 'UTC?08'),
(49, 'CIT', 'Central Indonesia Time', 'UTC+08'),
(50, 'CKT', 'Cook Island Time', 'UTC?10'),
(51, 'CLST', 'Chile Summer Time', 'UTC?03'),
(52, 'CLT', 'Chile Standard Time', 'UTC?04'),
(53, 'COST', 'Colombia Summer Time', 'UTC?04'),
(54, 'COT', 'Colombia Time', 'UTC?05'),
(55, 'CST', 'Central Standard Time (North America)', 'UTC?06'),
(56, 'CST', 'China Standard Time', 'UTC+08'),
(57, 'CST', 'Cuba Standard Time', 'UTC?05'),
(58, 'CT', 'China Time', 'UTC+08'),
(59, 'CVT', 'Cape Verde Time', 'UTC?01'),
(60, 'CWST', 'Central Western Standard Time (Australia) unofficial', 'UTC+08:45'),
(61, 'CXT', 'Christmas Island Time', 'UTC+07'),
(62, 'DAVT', 'Davis Time', 'UTC+07'),
(63, 'DFT', 'AIX-specific equivalent of Central European Time[NB 1]', 'UTC+01'),
(64, 'EASST', 'Easter Island Summer Time', 'UTC?05'),
(65, 'EAST', 'Easter Island Standard Time', 'UTC?06'),
(66, 'EAT', 'East Africa Time', 'UTC+03'),
(67, 'ECT', 'Eastern Caribbean Time (does not recognise DST)', 'UTC?04'),
(68, 'ECT', 'Ecuador Time', 'UTC?05'),
(69, 'EDT', 'Eastern Daylight Time (North America)', 'UTC?04'),
(70, 'EEST', 'Eastern European Summer Time', 'UTC+03'),
(71, 'EET', 'Eastern European Time', 'UTC+02'),
(72, 'EGST', 'Eastern Greenland Summer Time', 'UTC±00'),
(73, 'EGT', 'Eastern Greenland Time', 'UTC?01'),
(74, 'EIT', 'Eastern Indonesian Time', 'UTC+09'),
(75, 'EST', 'Eastern Standard Time (North America)', 'UTC?05'),
(76, 'FET', 'Further-eastern European Time', 'UTC+03'),
(77, 'FJT', 'Fiji Time', 'UTC+12'),
(78, 'FKST', 'Falkland Islands Summer Time', 'UTC?03'),
(79, 'FKT', 'Falkland Islands Time', 'UTC?04'),
(80, 'FNT', 'Fernando de Noronha Time', 'UTC?02'),
(81, 'GALT', 'Galápagos Time', 'UTC?06'),
(82, 'GAMT', 'Gambier Islands Time', 'UTC?09'),
(83, 'GET', 'Georgia Standard Time', 'UTC+04'),
(84, 'GFT', 'French Guiana Time', 'UTC?03'),
(85, 'GILT', 'Gilbert Island Time', 'UTC+12'),
(86, 'GIT', 'Gambier Island Time', 'UTC?09'),
(87, 'GMT', 'Greenwich Mean Time', 'UTC±00'),
(88, 'GST', 'South Georgia and the South Sandwich Islands Time', 'UTC?02'),
(89, 'GST', 'Gulf Standard Time', 'UTC+04'),
(90, 'GYT', 'Guyana Time', 'UTC?04'),
(91, 'HDT', 'Hawaii–Aleutian Daylight Time', 'UTC?09'),
(92, 'HST', 'Hawaii–Aleutian Standard Time', 'UTC?10'),
(93, 'HKT', 'Hong Kong Time', 'UTC+08'),
(94, 'HMT', 'Heard and McDonald Islands Time', 'UTC+05'),
(95, 'HOVST', 'Hovd Summer Time (not used from 2017-present)', 'UTC+08'),
(96, 'HOVT', 'Hovd Time', 'UTC+07'),
(97, 'ICT', 'Indochina Time', 'UTC+07'),
(98, 'IDLW', 'International Day Line West time zone', 'UTC?12'),
(99, 'IDT', 'Israel Daylight Time', 'UTC+03'),
(100, 'IOT', 'Indian Ocean Time', 'UTC+03'),
(101, 'IRDT', 'Iran Daylight Time', 'UTC+04:30'),
(102, 'IRKT', 'Irkutsk Time', 'UTC+08'),
(103, 'IRST', 'Iran Standard Time', 'UTC+03:30'),
(104, 'IST', 'Indian Standard Time', 'UTC+05:30'),
(105, 'IST', 'Irish Standard Time[8]', 'UTC+01'),
(106, 'IST', 'Israel Standard Time', 'UTC+02'),
(107, 'JST', 'Japan Standard Time', 'UTC+09'),
(108, 'KALT', 'Kaliningrad Time', 'UTC+02'),
(109, 'KGT', 'Kyrgyzstan Time', 'UTC+06'),
(110, 'KOST', 'Kosrae Time', 'UTC+11'),
(111, 'KRAT', 'Krasnoyarsk Time', 'UTC+07'),
(112, 'KST', 'Korea Standard Time', 'UTC+09'),
(113, 'LHST', 'Lord Howe Standard Time', 'UTC+10:30'),
(114, 'LHST', 'Lord Howe Summer Time', 'UTC+11'),
(115, 'LINT', 'Line Islands Time', 'UTC+14'),
(116, 'MAGT', 'Magadan Time', 'UTC+12'),
(117, 'MART', 'Marquesas Islands Time', 'UTC?09:30'),
(118, 'MAWT', 'Mawson Station Time', 'UTC+05'),
(119, 'MDT', 'Mountain Daylight Time (North America)', 'UTC?06'),
(120, 'MET', 'Middle European Time Same zone as CET', 'UTC+01'),
(121, 'MEST', 'Middle European Summer Time Same zone as CEST', 'UTC+02'),
(122, 'MHT', 'Marshall Islands Time', 'UTC+12'),
(123, 'MIST', 'Macquarie Island Station Time', 'UTC+11'),
(124, 'MIT', 'Marquesas Islands Time', 'UTC?09:30'),
(125, 'MMT', 'Myanmar Standard Time', 'UTC+06:30'),
(126, 'MSK', 'Moscow Time', 'UTC+03'),
(127, 'MST', 'Malaysia Standard Time', 'UTC+08'),
(128, 'MST', 'Mountain Standard Time (North America)', 'UTC?07'),
(129, 'MUT', 'Mauritius Time', 'UTC+04'),
(130, 'MVT', 'Maldives Time', 'UTC+05'),
(131, 'MYT', 'Malaysia Time', 'UTC+08'),
(132, 'NCT', 'New Caledonia Time', 'UTC+11'),
(133, 'NDT', 'Newfoundland Daylight Time', 'UTC?02:30'),
(134, 'NFT', 'Norfolk Island Time', 'UTC+11'),
(135, 'NOVT', 'Novosibirsk Time [9]', 'UTC+07'),
(136, 'NPT', 'Nepal Time', 'UTC+05:45'),
(137, 'NST', 'Newfoundland Standard Time', 'UTC?03:30'),
(138, 'NT', 'Newfoundland Time', 'UTC?03:30'),
(139, 'NUT', 'Niue Time', 'UTC?11'),
(140, 'NZDT', 'New Zealand Daylight Time', 'UTC+13'),
(141, 'NZST', 'New Zealand Standard Time', 'UTC+12'),
(142, 'OMST', 'Omsk Time', 'UTC+06'),
(143, 'ORAT', 'Oral Time', 'UTC+05'),
(144, 'PDT', 'Pacific Daylight Time (North America)', 'UTC?07'),
(145, 'PET', 'Peru Time', 'UTC?05'),
(146, 'PETT', 'Kamchatka Time', 'UTC+12'),
(147, 'PGT', 'Papua New Guinea Time', 'UTC+10'),
(148, 'PHOT', 'Phoenix Island Time', 'UTC+13'),
(149, 'PHT', 'Philippine Time', 'UTC+08'),
(150, 'PKT', 'Pakistan Standard Time', 'UTC+05'),
(151, 'PMDT', 'Saint Pierre and Miquelon Daylight Time', 'UTC?02'),
(152, 'PMST', 'Saint Pierre and Miquelon Standard Time', 'UTC?03'),
(153, 'PONT', 'Pohnpei Standard Time', 'UTC+11'),
(154, 'PST', 'Pacific Standard Time (North America)', 'UTC?08'),
(155, 'PST', 'Philippine Standard Time', 'UTC+08'),
(156, 'PYST', 'Paraguay Summer Time[10]', 'UTC?03'),
(157, 'PYT', 'Paraguay Time[11]', 'UTC?04'),
(158, 'RET', 'Réunion Time', 'UTC+04'),
(159, 'ROTT', 'Rothera Research Station Time', 'UTC?03'),
(160, 'SAKT', 'Sakhalin Island Time', 'UTC+11'),
(161, 'SAMT', 'Samara Time', 'UTC+04'),
(162, 'SAST', 'South African Standard Time', 'UTC+02'),
(163, 'SBT', 'Solomon Islands Time', 'UTC+11'),
(164, 'SCT', 'Seychelles Time', 'UTC+04'),
(165, 'SDT', 'Samoa Daylight Time', 'UTC?10'),
(166, 'SGT', 'Singapore Time', 'UTC+08'),
(167, 'SLST', 'Sri Lanka Standard Time', 'UTC+05:30'),
(168, 'SRET', 'Srednekolymsk Time', 'UTC+11'),
(169, 'SRT', 'Suriname Time', 'UTC?03'),
(170, 'SST', 'Samoa Standard Time', 'UTC?11'),
(171, 'SST', 'Singapore Standard Time', 'UTC+08'),
(172, 'SYOT', 'Showa Station Time', 'UTC+03'),
(173, 'TAHT', 'Tahiti Time', 'UTC?10'),
(174, 'THA', 'Thailand Standard Time', 'UTC+07'),
(175, 'TFT', 'French Southern and Antarctic Time[12]', 'UTC+05'),
(176, 'TJT', 'Tajikistan Time', 'UTC+05'),
(177, 'TKT', 'Tokelau Time', 'UTC+13'),
(178, 'TLT', 'Timor Leste Time', 'UTC+09'),
(179, 'TMT', 'Turkmenistan Time', 'UTC+05'),
(180, 'TRT', 'Turkey Time', 'UTC+03'),
(181, 'TOT', 'Tonga Time', 'UTC+13'),
(182, 'TVT', 'Tuvalu Time', 'UTC+12'),
(183, 'ULAST', 'Ulaanbaatar Summer Time', 'UTC+09'),
(184, 'ULAT', 'Ulaanbaatar Standard Time', 'UTC+08'),
(185, 'UTC', 'Coordinated Universal Time', 'UTC±00'),
(186, 'UYST', 'Uruguay Summer Time', 'UTC?02'),
(187, 'UYT', 'Uruguay Standard Time', 'UTC?03'),
(188, 'UZT', 'Uzbekistan Time', 'UTC+05'),
(189, 'VET', 'Venezuelan Standard Time', 'UTC?04'),
(190, 'VLAT', 'Vladivostok Time', 'UTC+10'),
(191, 'VOLT', 'Volgograd Time', 'UTC+04'),
(192, 'VOST', 'Vostok Station Time', 'UTC+06'),
(193, 'VUT', 'Vanuatu Time', 'UTC+11'),
(194, 'WAKT', 'Wake Island Time', 'UTC+12'),
(195, 'WAST', 'West Africa Summer Time', 'UTC+02'),
(196, 'WAT', 'West Africa Time', 'UTC+01'),
(197, 'WEST', 'Western European Summer Time', 'UTC+01'),
(198, 'WET', 'Western European Time', 'UTC±00'),
(199, 'WIT', 'Western Indonesian Time', 'UTC+07'),
(200, 'WST', 'Western Standard Time', 'UTC+08'),
(201, 'YAKT', 'Yakutsk Time', 'UTC+09'),
(202, 'YEKT', 'Yekaterinburg Time', 'UTC+05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usertype`
--

DROP TABLE IF EXISTS `tbl_usertype`;
CREATE TABLE IF NOT EXISTS `tbl_usertype` (
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

--
-- Dumping data for table `tbl_usertype`
--

INSERT INTO `tbl_usertype` (`usertype_id`, `usertype_name`, `user_module`, `status`, `deletable`, `cdate`, `user_id`, `company_id`) VALUES
(1, 'Admin', '', 0, 1, '2018-10-12 04:00:10', 0, 0),
(2, 'Company Admin', '', 0, 1, '2018-10-12 04:00:10', 0, 0),
(3, 'Sales Person', '', 0, 0, '2019-12-17 06:20:08', 0, 0),
(4, 'Purchase Person', '', 0, 0, '2019-12-17 06:20:08', 0, 0),
(5, 'Accountant', '', 0, 0, '2019-12-17 06:20:36', 0, 0),
(6, 'BOE (Back Office Executive)', '', 0, 0, '2019-12-17 06:21:04', 0, 0),
(7, 'Lab Department', '', 0, 0, '2019-12-17 06:21:14', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `territory_mst`
--

DROP TABLE IF EXISTS `territory_mst`;
CREATE TABLE IF NOT EXISTS `territory_mst` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(50) NOT NULL,
  `t_parent` int(10) NOT NULL,
  `t_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `territory_mst`
--

INSERT INTO `territory_mst` (`t_id`, `t_name`, `t_parent`, `t_status`, `cdate`, `userid`) VALUES
(0, 'Primary', 0, 0, '2019-11-22 12:06:05', 1),
(14, 'GUJARAT', 13, 0, '2019-09-04 04:15:42', 1),
(15, 'AHMEDABAD', 14, 2, '2019-09-04 04:17:23', 1),
(16, 'SIDHPUR', 14, 0, '2019-11-08 12:40:40', 1),
(17, 'MHZ', 0, 0, '2019-11-22 12:01:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `todo_mst`
--

DROP TABLE IF EXISTS `todo_mst`;
CREATE TABLE IF NOT EXISTS `todo_mst` (
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

-- --------------------------------------------------------

--
-- Table structure for table `unit_mst`
--

DROP TABLE IF EXISTS `unit_mst`;
CREATE TABLE IF NOT EXISTS `unit_mst` (
  `unitid` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) NOT NULL,
  `unit_status` int(11) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL,
  PRIMARY KEY (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_mst`
--

INSERT INTO `unit_mst` (`unitid`, `unit_name`, `unit_status`, `cdate`, `user_id`, `usertype_id`) VALUES
(1, 'KG', 0, '2016-09-06 09:31:56', 0, 1),
(2, 'PER', 2, '2016-09-06 09:32:01', 0, 1),
(3, 'PCS', 0, '2018-10-31 01:43:57', 1, 2),
(4, 'MTR', 0, '2016-10-04 10:34:54', 0, 1),
(5, 'FOOTJJMM', 2, '2018-01-24 03:47:04', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_mail`, `user_key`, `user_type`, `user_phone`, `user_company`, `user_country`, `user_stat`, `user_city`, `user_address`, `print_align`, `user_rid`, `user_date`, `setup`, `payment_status`, `user_tmst`, `active`, `question_id`, `answer`, `branch_id`, `company_id`, `employee_id`, `user_fname`, `user_lname`, `roletype_id`, `h_sign`, `user_report`, `usertype_form_date`, `usertype_expiry_date`, `usertype_timezone`, `usertype_currency`, `is_admin`, `usertype_terr`) VALUES
(1, 'Environ', 'environ', 'e6e061838856bf47e1de730719fb2609', '2', '9898780178', 'ENVIRON', 100, 1, '1', 'G-608, titanium city center', 0, 1, '2020202057202d44435734434c4a443058583848', 1, 1, '2018-10-31 05:12:42', 0, '1u6i06NiO2hv3RTstsg04NpDKKDlDSNDuqflO1AF3c4=', 'nCz5LAWmBU7DTl+n62PK7tGdmLrf9F5xCImkQdxpoms=', 0, 1, 0, '', '', 0, '', '', '0000-00-00', '0000-00-00', '', 0, 0, '0'),
(3, 'USER 11', 'user11@test.com', 'd41d8cd98f00b204e9800998ecf8427e', '6', '9033891189', 'ENVIRON', 100, 1, '4', 'G-608, titanium city center', 0, 1, '', 0, 1, '2019-09-08 23:51:33', 0, '', '', 0, 1, 0, 'USER11', 'USER11', 9, 'header5432.jpg', '1', '2019-10-08', '2019-01-14', '75', 0, 0, '14'),
(4, 'ADMIN', 'admin@metrtechnology.com', 'e6e061838856bf47e1de730719fb2609', '1', '7405409098', 'metR Technology', 100, 1, '1', 'TEST ADDRESS', 1, 0, '2020202057202d44435734434c4a443058583848', 1, 1, '2018-10-31 05:12:42', 0, '', '', 0, 0, 0, '', '', 0, '', '', '0000-00-00', '0000-00-00', '', 0, 0, '0'),
(5, 'EMP 1', 'emp1@gmail.com', '1532518cdde862ed16383fe0a9f58157', '3', '12345', '', 100, 1, '1', 'TEST ADDRESSSS', 0, 1, 'WD-WCC4JL0DXXH8', 1, 1, '2019-12-17 06:25:23', 0, '', '', 0, 1, 0, '', '', 0, 'header2865.jpg', '', '2019-12-17', '2019-12-17', '', 0, 0, ''),
(6, 'EMP 2', 'emp2@gmail.com', '22c8d7a74951d50873bfdedeb269d3c1', '4', '9999999999', '', 100, 1, '1', 'EMP 2 ADDRESS', 0, 1, 'WD-WCC4JL0DXXH8', 1, 1, '2019-12-17 06:46:02', 0, '', '', 0, 1, 0, 'EMP 2', 'TEST', 9, 'header988.jpg', '', '2019-12-17', '2019-12-17', '', 0, 0, ''),
(7, 'SALES 1', 'sales@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '3', '12345', '', 100, 1, '1', 'TEST', 0, 1, 'WD-WCC4JL0DXXH8', 1, 1, '2020-01-04 06:36:02', 0, '', '', 0, 1, 0, '', '', 0, '', '1', '2020-01-04', '2020-01-04', '', 0, 0, '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
