<?php
include("Mailin.php");
function final_send_email($to_email_id,$ccemail_id,$bccemail_id,$email_subject,$email_content,$files){
	
	$mailin = new Mailin("https://api.sendinblue.com/v2.0",SENDMAILKEY);
	
	$from = ADMIN_EMAIL;

	/*$attch=array();
	if(!empty($file)){
		$files = fopen(MAIL_ATTACH_ACTUAL.$file,"rb");
		$data = fread($files,filesize(MAIL_ATTACH_ACTUAL.$file));
		fclose($files);
		$data = chunk_split(base64_encode($data));
		$attch[$file]= $data;
	}*/
	$attch=array(); 
	for($x=0;$x<count($files);$x++){
		if(!empty($files[$x])){
			$file = fopen(MAIL_ATTACH_ACTUAL.$files[$x],"rb");
			$data = fread($file,filesize(MAIL_ATTACH_ACTUAL.$files[$x]));
			fclose($file);
			$data = chunk_split(base64_encode($data));
			$attch[$files[$x]]= $data;
		}
	}
	
	$ccemail=explode(";",$ccemail_id);
	$cc=array();
	for($i=0;$i<count($ccemail);$i++){
		$cc[$ccemail[$i]]= $ccemail[$i];
	}
	
	$bccemail=explode(",",$bccemail_id);
	$bcc=array();
	for($b=0;$b<count($bccemail);$b++){
		$bcc[$bccemail[$b]]=$bccemail[$b];
	}
	
	$cc1 = array_filter($cc); 
	if (empty($cc1)){
		$c='echo //';
	}
	$bcc1 = array_filter($bcc); 

	if (empty($bcc1)){
		$bc='echo //';
	}
	

# Define the campaign settings
	if($files[0]){	
		$data = array( "to" => array($to_email_id=>$to_email_id),
			$c."cc" => $cc1,
			$bc."bcc" => $bcc1,
			"from" => array($from,$from),
			"subject" => $email_subject,
			"html" => $email_content,
			"attachment" => $attch
		);
	}
	else{
		$data = array( "to" => array($to_email_id=>$to_email_id),
			$c."cc" => $cc1,
			$bc."bcc" => $bcc1,
			"from" => array($from,$from),
			"subject" => $email_subject,
			"html" => $email_content
		);
	}
		
//var_dump($files);
return ($mailin->send_email($data));

}
?>