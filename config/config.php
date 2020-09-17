<?php
    error_reporting(0);
    date_default_timezone_set('Asia/Kolkata');	
	$authenticate = true;  
	include("../../config/constants.php");
	
	/*
     * PROJECT DETAILS
    */   
    define("TITLE","CRM By BRP Software Solutions");
    define("DOMAIN","http://www.bizaccount.in/brp_crm_demo/");
	define("DOMAIN_F","http://www.bizaccount.in/brp_crm_demo/");
    define("ROOT","/brp_crm_demo/");
	define("ROOT_F","/brp_crm_demo/");
	
    //define("INC","/metr_purchase_sale_soft/");
	
    /* CHEQUE CONFIG*/
    define("DOMAIN_CHEQUE",DOMAIN."cheque_app/");
    define("ROOT_CHEQUE",ROOT."cheque_app/");
    define("INC",ROOT."cheque_app/");
    define("CHEQUE_IMG","upload//check/");
	//image upload and view path admin side
	define("BACKUP","upload//backup//");
	define("BKP_DAYS",29);
	define("LOGO_A","..//..//view//img//logo//");
	define("LOGO","view//img//logo//");
	define("POPDF_A","..//..//view//upload_popdf//");
	define("POPDF","view//upload_popdf//");
	define("CUSTOMER_UPING","..//..//view//upload//customer_excel//");
	define("CUSTOMER_VWING","view//upload//customer_excel//");
	define("STOCKIMP_UPING","..//..//view//upload//product_stock_excel//");
	define("STOCKIMP_VWING","view//upload//product_stock_excel//");
	define("PROIMG_UPING","..//..//view//upload//product_image//");
	define("PROIMG_VWING","view//upload//product_image//");
	define("RECEIPT_FILE_UPING","..//..//view//upload//receipt_files//");
	define("RECEIPT_FILE_VWING","view//upload//receipt_files//");
	define("USER_SIGN","..//..//view//upload//user_sign//");
	define("INQ_ATTACH_UPING","..//..//view//upload//inq_attach//");
	define("INQ_ATTACH_VWING","view//upload//inq_attach//");
	define("MAIL_ATTACH_ACTUAL","..//view//upload//mail_attach//");
	define("MAIL_ATTACH_UPING","..//..//view//upload//mail_attach//");
	define("MAIL_ATTACH_VWING","view//upload//mail_attach//");
	define("PLAN_ATTACH_UPING","..//..//view//upload//plan_attach//");
	define("PLAN_ATTACH_VWING","view//upload//plan_attach//");
	define("SO_ATTACH_UPING","..//..//view//upload//so_attach//");
	define("SO_ATTACH_VWING","view//upload//so_attach//");
	
	//Company Switch Login Password 
	define('LOGIN_SETTING',"1"); //1 without password : 0 For with Password
	//define("COMPANY","metR Technology");
    define("C_URL","http://www.metrtechnology.com");
    define("DEVELOPER","");
    define("D_URL","http://www.metrtechnology.com");
    
    define("CITY","AHMEDABAD");
    define("COUNTRY","INDIA");
    define("CURRENCY","INR");
    define("C_SYMBOL","&#8377;");
	
	define("SENDMAILKEY","85rJyNsCpv0hHBbD");
    
    /*
     *	Database Credentials
     */
    define("SERVER","localhost");
    define("DB","bizaccou_bizaccou_bds_crm_demo_new");//
    define("DB_USER","bizaccou_bizaccount");//
    define("DB_PASS","]6}e*4N,d~#H");//
    /*
    * Admin Details
    */
    define("ADMIN","Rudra Enterprise");
    define("ADMIN_EMAIL","abhi.metr@gmail.com");    
    /*Database Connectivity*/
    $dbcon = new mysqli(SERVER,DB_USER,DB_PASS,DB);
	
    if($dbcon->connect_errno > 0){
            die('Unable to connect to database server. [' . $dbcon->connect_error . ']');
    }
    if(isset($_SESSION['permission'])) {
            $permission = unserialize($_SESSION['permission']);
    }	    
    /*SPECIAL FUNCTIONS*/
    function rmv($str) {
		if($str == NULL || $str == '') {
			return "NO-DATA";
		}
		else {
			$str = $str;
			return strtoupper($str);
		}
    }	
	function filter_data($connection_link, $data) {
		$str = $connection_link -> real_escape_string($data);
		$str = ($str);
		return strtoupper($str);
	}
	function bulk_filter($connection_link,$array) {
		while ($ele = current($array)) {
			if(is_array($ele)) {
				$key = key($array);
				$value = bulk_filter($connection_link,$ele);
				$array[$key] = $value;
			}
			else {
				$key = key($array);
				$value = filter_data($connection_link,$ele);
				$array[$key] = $value;
			}
			next($array);
		}
		return $array;
	}	
	define("ENCRYPTION_KEY", "!@#$%^&*");
	/**
	 * Returns an encrypted & utf8-encoded
	 */
	 
	 $key=md5('india');

	//Encrypt Function
	function encrypt($string, $key)
	{
		$string=rtrim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, $string, MCRYPT_MODE_ECB)));
		return $string;
	}
	//Deccrypt Function
	function decrypt($string, $key)
	{
		$string=rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, base64_decode($string), MCRYPT_MODE_ECB));
		return $string;

	} 
	function check_internet_connection($sCheckHost = 'www.google.com') 
	{
		return (bool) @fsockopen($sCheckHost, 80, $iErrno, $sErrStr, 5);
	}
	function encryptt($pure_string) {
		$iv_size = mcrypt_get_iv_size(MCRYPT_BLOWFISH, MCRYPT_MODE_ECB);
		$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		$encrypted_string = mcrypt_encrypt(MCRYPT_BLOWFISH, ENCRYPTION_KEY, utf8_encode($pure_string), MCRYPT_MODE_ECB, $iv);
		return $encrypted_string;
	}
	/**
	 * Returns decrypted original string
	 */
	function decryptt($encrypted_string) {
		$iv_size = mcrypt_get_iv_size(MCRYPT_BLOWFISH, MCRYPT_MODE_ECB);
		$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
		$decrypted_string = mcrypt_decrypt(MCRYPT_BLOWFISH, ENCRYPTION_KEY, $encrypted_string, MCRYPT_MODE_ECB, $iv);
		return $decrypted_string;
	}	
	//@Start
	
	// Multi user Inquiery Show Funcation
	function check_user_inq($alias)
	{
		$qry='';
		if($_SESSION['user_type']!='2')
		{
			//$qry="  and ".$alias.".company_id in ($_SESSION[company_id])";
			$qry="  and FIND_IN_SET ($_SESSION[user_id],".$alias.".assign_user_inq_ids)";
		}
		return $qry;
	}
	/////////////////
	function check_user($alias)
	{
		$qry='';
		if($_SESSION['user_type']!='2')
		{
			//$qry="  and ".$alias.".company_id in ($_SESSION[company_id])";
			$qry="  and ".$alias.".user_id in ($_SESSION[user_id])";
		}
		return $qry;
	}
	function check_user_po($alias)
	{
		$qry='';
		if($_SESSION['user_type']!='2')
		{
			//$qry="  and ".$alias.".company_id in ($_SESSION[company_id])";
			$qry="  and ".$alias.".userid in ($_SESSION[user_id])";
		}
		return $qry;
	}
	function text_rnremove($text)
	{
		return str_replace("\r\n","<br/>",($text));
	}
	function text_rnrremove_disp($text)
	{
		return str_replace("<br/>","\n",($text));
	}
	//Convert to Indian Currency Format
	function indian_number($n, $d = 0) {
		$n = number_format($n, $d, '.', '');
		$n = strrev($n);
		if ($d) $d++;
		$d += 3;
		if (strlen($n) > $d)
			$n = substr($n, 0, $d) . ','
			   . implode(',', str_split(substr($n, $d), 2));

		return strrev($n);
	}	
	//@End
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function convert_number_to_words($x) {

$no = round($x);
   $point = round($number - $no, 2) * 100;
   $hundred = null;
   $digits_1 = strlen($no);
   $i = 0;
   $str = array();
   $words = array('0' => '', '1' => 'one', '2' => 'two',
    '3' => 'three', '4' => 'four', '5' => 'five', '6' => 'six',
    '7' => 'seven', '8' => 'eight', '9' => 'nine',
    '10' => 'ten', '11' => 'eleven', '12' => 'twelve',
    '13' => 'thirteen', '14' => 'fourteen',
    '15' => 'fifteen', '16' => 'sixteen', '17' => 'seventeen',
    '18' => 'eighteen', '19' =>'nineteen', '20' => 'twenty',
    '30' => 'thirty', '40' => 'forty', '50' => 'fifty',
    '60' => 'sixty', '70' => 'seventy',
    '80' => 'eighty', '90' => 'ninety');
   $digits = array('', 'hundred', 'thousand', 'lakh', 'crore');
   while ($i < $digits_1) {
     $divider = ($i == 2) ? 10 : 100;
     $number = floor($no % $divider);
     $no = floor($no / $divider);
     $i += ($divider == 10) ? 1 : 2;
     if ($number) {
        $plural = (($counter = count($str)) && $number > 9) ? 's' : null;
        $hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
        $str [] = ($number < 21) ? $words[$number] .
            " " . $digits[$counter] . $plural . " " . $hundred
            :
            $words[floor($number / 10) * 10]
            . " " . $words[$number % 10] . " "
            . $digits[$counter] . $plural . " " . $hundred;
     } else $str[] = null;
  }
  $str = array_reverse($str);
  $result = implode('', $str);
  $points = ($point) ?
    "." . $words[$point / 10] . " " . 
          $words[$point = $point % 10] : '';
  $w = $result . "Rupees Only ";
return ($w);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*function convert_number_to_words($x) {

    $nwords = array("Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven","Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen","Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen","Nineteen", "Twenty", 30 => "Thirty", 40 => "Forty",50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty",90 => "Ninety" );
	/*if(!is_numeric($x))
	{
		$w = '#';
	}else 
	
	if(fmod($x, 1) != 0)
	{
		$w = '#';
	}else{
		if($x < 0)
		{
			$w = 'minus ';
			$x = -$x;
		}
		
		else{
			$w = '';
		}
		if($x < 21)
		{
			$w .= $nwords[$x];
		}else if($x < 100)
		{
			$w .= $nwords[10 * floor($x/10)];
			$r = fmod($x, 10);
			if($r > 0 )
			{
				$w .= '-'. $nwords[$r];
				$r = fmod($x,1);
				if($r < 1 and $r > 0)//for paisa code
				{
					$r=$r*100;
					$w .= ' and '.$nwords[10 * floor($r/10)];$r = fmod($x, 10);
					if($r > 0)
					{
						$w .= '-'. $nwords[$r];
					}
					$w .=' Paisa';
				}
			}
		} else if($x < 1000)
		{
			$w .= $nwords[floor($x/100)] .' hundred';
			$r = fmod($x, 100);
			if($r > 0)
			{
				$w .= ' and '. convert_number_to_words($r);
			}
		} else if($x < 100000)
		{
			$w .= convert_number_to_words(floor($x/1000)) .' thousand';
			$r = fmod($x, 1000);
			if($r > 0)
			{
				$w .= ' ';
				if($r < 100)
				{
					$w .= 'and ';
				}
				$w .= convert_number_to_words($r);
			}
		} else {
			$w .= convert_number_to_words(floor($x/100000)) .' lakh';
			$r = fmod($x, 100000);
			if($r > 0)
			{
				$w .= ' ';
				if($r < 100)
				{
					$word .= 'and ';
				}
				$w .= convert_number_to_words($r);
			}
		}
	/*}
	  return ($w);
    //return ucwords($w);
}*/

function smart_resize_image($file,
                              $width              = 0, 
                              $height             = 0, 
                              $proportional       = false, 
                              $output             = 'file', 
                              $delete_original    = true, 
                              $use_linux_commands = false ) {
      
    if ( $height <= 0 && $width <= 0 ) return false;
    # Setting defaults and meta
    $info                         = getimagesize($file);
    $image                        = '';
    $final_width                  = 0;
    $final_height                 = 0;
    list($width_old, $height_old) = $info;
    # Calculating proportionality
    if ($proportional) {
      if      ($width  == 0)  $factor = $height/$height_old;
      elseif  ($height == 0)  $factor = $width/$width_old;
      else                    $factor = min( $width / $width_old, $height / $height_old );
      $final_width  = round( $width_old * $factor );
      $final_height = round( $height_old * $factor );
    }
    else {
      $final_width = ( $width <= 0 ) ? $width_old : $width;
      $final_height = ( $height <= 0 ) ? $height_old : $height;
    }
    # Loading image to memory according to type
    switch ( $info[2] ) {
      case IMAGETYPE_GIF:   $image = imagecreatefromgif($file);   break;
      case IMAGETYPE_JPEG:  $image = imagecreatefromjpeg($file);  break;
      case IMAGETYPE_PNG:   $image = imagecreatefrompng($file);   break;
      default: return false;
    }
    
    
    # This is the resizing/resampling/transparency-preserving magic
    $image_resized = imagecreatetruecolor( $final_width, $final_height );
    if ( ($info[2] == IMAGETYPE_GIF) || ($info[2] == IMAGETYPE_PNG) ) {
      $transparency = imagecolortransparent($image);
      if ($transparency >= 0) {
        $transparent_color  = imagecolorsforindex($image, $trnprt_indx);
        $transparency       = imagecolorallocate($image_resized, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
        imagefill($image_resized, 0, 0, $transparency);
        imagecolortransparent($image_resized, $transparency);
      }
      elseif ($info[2] == IMAGETYPE_PNG) {
        imagealphablending($image_resized, false);
        $color = imagecolorallocatealpha($image_resized, 0, 0, 0, 127);
        imagefill($image_resized, 0, 0, $color);
        imagesavealpha($image_resized, true);
      }
    }
    imagecopyresampled($image_resized, $image, 0, 0, 0, 0, $final_width, $final_height, $width_old, $height_old);
    
    # Taking care of original, if needed
    if ( $delete_original ) {
      if ( $use_linux_commands ) exec('rm '.$file);
      else @unlink($file);
    }
    # Preparing a method of providing result
    switch ( strtolower($output) ) {
      case 'browser':
        $mime = image_type_to_mime_type($info[2]);
        header("Content-type: $mime");
        $output = NULL;
      break;
      case 'file':
        $output = $file;
      break;
      case 'return':
        return $image_resized;
      break;
      default:
      break;
    }
    
    # Writing image according to type to the output destination
    switch ( $info[2] ) {
      case IMAGETYPE_GIF:   imagegif($image_resized, $output);    break;
      case IMAGETYPE_JPEG:  imagejpeg($image_resized, $output);   break;
      case IMAGETYPE_PNG:   imagepng($image_resized, $output);    break;
      default: return false;
    }
    return true;
}
function strip_word_html($text, $allowed_tags = '<a><ul><li><b><i><sup><sub><em><strong><u><br><br/><br /><p><h2><h3><h4><h5><h6><span><div><table><tr><td><th><thead><tbody><tfoot>')
{
	mb_regex_encoding('UTF-8');
    //replace MS special characters first
    $search = array('/&lsquo;/u', '/&rsquo;/u', '/&ldquo;/u', '/&rdquo;/u', '/&mdash;/u');
    $replace = array('\'', '\'', '"', '"', '-');
    $text = preg_replace($search, $replace, $text);
    //make sure _all_ html entities are converted to the plain ascii equivalents - it appears
    //in some MS headers, some html entities are encoded and some aren't
    //$text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
    //try to strip out any C style comments first, since these, embedded in html comments, seem to
    //prevent strip_tags from removing html comments (MS Word introduced combination)
    if(mb_stripos($text, '/*') !== FALSE){
        $text = mb_eregi_replace('#/\*.*?\*/#s', '', $text, 'm');
    }
    //introduce a space into any arithmetic expressions that could be caught by strip_tags so that they won't be
    //'<1' becomes '< 1'(note: somewhat application specific)
    $text = preg_replace(array('/<([0-9]+)/'), array('< $1'), $text);
    $text = strip_tags($text, $allowed_tags);
    //eliminate extraneous whitespace from start and end of line, or anywhere there are two or more spaces, convert it to one
    $text = preg_replace(array('/^\s\s+/', '/\s\s+$/', '/\s\s+/u'), array('', '', ' '), $text);
    //strip out inline css and simplify style tags
    $search = array('#<(strong|b)[^>]*>(.*?)</(strong|b)>#isu', '#<(em|i)[^>]*>(.*?)</(em|i)>#isu', '#<u[^>]*>(.*?)</u>#isu');
    $replace = array('<b>$2</b>', '<i>$2</i>', '<u>$1</u>');
    $text = preg_replace($search, $replace, $text);
    
    $num_matches = preg_match_all("/\<!--/u", $text, $matches);
    if($num_matches){
        $text = preg_replace('/\<!--(.)*--\>/isu', '', $text);
    }
    $text = preg_replace('/(<[^>]+) style=".*?"/i', '$1', $text);
	 
return $text;
}

function check_permission($pagename,$usetype,$permission,$dbcon) {
	$query="SELECT perm.* FROM `tbl_permission` as perm left join tbl_menu as menu on perm.menu_id=menu.menu_id where perm.".$permission."_permission=1 and menu.status=0 and perm.status=0 and usertype_id=".$usetype." and menu.page_name ='".$pagename."'";
	$rs=$dbcon->query($query);
	if(mysqli_num_rows($rs)>0)
	{
		return true;
	}
	return false;
}
?>