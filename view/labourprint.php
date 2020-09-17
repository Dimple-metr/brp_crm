<?php 
	session_start();
	include_once("../config/config.php");
	include_once("../config/session.php");	
	include_once("../include/coman_function.php");
	$token = md5(rand(1000,9999));
	$_SESSION['token'] = $token;
	$form="Envelope Print";
		$mode="Print";
		$id=$dbcon->real_escape_string($_REQUEST['id']);
		$type=$_REQUEST['type'];
					
		if($type=='customer'){
		$query="select * from tbl_customer as cust left join city_mst as city on cust.cityid=city.cityid  left join state_mst as state on cust.stateid=state.stateid where cust_id=".$id;
		$r=mysqli_fetch_assoc($dbcon->query($query));
		$to_address='To, '.ucwords(strtolower($r['city_name'])).'<div style="margin-left:20px;">';
		$to_address .= ucwords(strtolower($r['company_name'])).'<br/>'.ucwords(strtolower($r['cust_address'])).',<br/>'.ucwords(strtolower($r['city_name'])).', '.ucwords(strtolower($r['state_name'])); 
			if(!empty($r['cust_mobile']))
			{
				$to_address .= '<br/> Mob : '.($r['cust_mobile']);
			}
			$to_address .= '</div>';
		$cancle="customer_list";
		}
		else if($type=='vendor'){
			$query="select * from tbl_vender as ven left join city_mst as city on ven.cityid=city.cityid  left join state_mst as state on ven.stateid=state.stateid where vender_id=".$id;
			$r=mysqli_fetch_assoc($dbcon->query($query));
			$to_address='To, <div style="margin-left:20px;">';
			$to_address .= ucwords(strtolower($r['vender_name'])).'<br/>'.ucwords(strtolower($r['vender_address'])).',<br/>'.ucwords(strtolower($r['city_name'])).', '.ucwords(strtolower($r['state_name'])); 
			if(!empty($r['vender_phone']))
			{
				$to_address .= 'Phone : '.($r['vender_phone']);
			}
			$to_address .= '</div>';
			$cancle="vender_list";
		
		}
		
	$query1="select * from tbl_company where company_id=".$_SESSION['company_id'];
	$rel_form=mysqli_fetch_assoc($dbcon->query($query1));
	$from_address='From, <br/><div style="margin-left:35px;"> '.($rel_form['company_name']).'<br/> '.str_ireplace('\n','<br/>',ucwords($rel_form['address'])).'</div>';
	  $query="select * from evelope_design where envelope_design_id=2";
	$rel_design = mysqli_fetch_assoc($dbcon -> query($query));
 
?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php include_once('../include/include_css_file.php');?>

<style type="text/css" for="all">

	body {
			display: block;
			padding-top: 0px;
			margin:0px auto;
			
		}	
		.print_content {
					vertical-align: middle;
					
					width: <?=$rel_design['width']?>in;
					height: <?=$rel_design['height']?>in;
					border:1px solid;
					/*margin-top:20%;*/
				/*-webkit-transform: rotate(90deg); 
				-moz-transform: rotate(90deg);
				-o-transform: rotate(90deg);
				
				filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);		*/
		}		
		/*
		#print_content {
			width:<?=$rel_design['width']?>in;
			height:<?=$rel_design['height']?>in;
			vertical-align: middle
			display: inline-block;
			margin:0px;
			padding:0px;
			font-family: 'Roboto', sans-serif;
			width:705px;
			height:320px;
			vertical-align: middle
		}*/
		
		
</style>

</head>
<body>
  <section id="container" >
      <?php include_once('../include/include_top_menu.php');?>
      <!--sidebar start-->
      <?php include_once('../include/left_menu.php');?>
      <!--sidebar end-->
      <!--main content start-->
           <section id="main-content">
          <section class="wrapper">
			<div class="row">
			  <div class="col-lg-12">
				  <!--breadcrumbs start -->
				  <section class="panel">
					  <header class="panel-heading">
						  <h3><?=$form?></h3>
						</header>	
						  <div class="">
						  <ul class="breadcrumb">
							  <li><a href="<?=ROOT.'dashboard'?>"><i class="fa fa-home"></i> Home</a></li>
							  <li><a href="<?=ROOT.$cancle?>"> List</a></li>
						  </ul>
						  </div>
					</section>
				  <!--breadcrumbs end -->
			  </div>	
             </div>
              <!--state overview start-->
		  <div class="row">			
			<div class="col-sm-8 col-md-offset-2">
				<section class="panel">
				  <header class="panel-heading">
					  New <?=$form?>
					</header>	
			<div class="panel-body">
		 
				<div class="form-group">
					<label class="col-md-3 control-label" style="font-size: 20px;">Envelope Design</label>
					<div class="col-md-5 col-xs-11">
						<select style="padding-right: 0px;" class="form-control" name="envdesign_id" id="envdesign_id" onChange="load_envelope(this.value)">
									<?getenvelope($dbcon,2);?>
						</select>
					</div>
				</div>
				<div class="col-md-12"  style="height:20px"></div>	 
				<div class="form-group">
					<label class="col-md-3 control-label" style="font-size: 20px;">Envelope Type</label>
					<div class="col-md-5 col-xs-11">
						<div class="radio"> 
				<label> <input name="pay_mode" type="radio" value="1" checked onclick="cover_change(this.value);"> Printed Envelope</label> 
				<label> <input name="pay_mode" type="radio" value="2" onclick="cover_change(this.value);"> Blank Envelope</label> 
			 
			</div>
					</div>
				</div>
			<div class="form-group">
		 <div class="col-md-12"></div>	 
			
			
			</div>
			<div class="col-md-4">
							<button type="submit" class="btn btn-success" onClick="PrintMe('envelope_print');">Print</button>
			<a href="<?=ROOT.$cancle?>" type="button" class="btn btn-danger">Cancel</a></div>
			</div>
			<div class="col-md-12">
						<div class="panel-body" id="envelope_print">
								<div id="print_content" class="print_content panel" >
								<div id="address" class="ui-widget-content" style="<?='width: 3in;position:absolute;font-size:'.$rel_design['font_size'].'px;font-family:'.$rel_design['font_family'].';line-height:'.$rel_design['line_height'].'px;margin-top:'.$rel_design['top_margin'].'in;margin-left:'.($rel_design['left_margin']).'in'?>"><?=$to_address?>
			
			</div>
								<div class="ui-widget-content" id="from_content" style="<?='width:2.2in;position:absolute;font-size:'.$rel_design['font_size'].'px;font-family:\''.$rel_design['font_family'].'\';line-height:'.$rel_design['line_height'].'px;margin-top:'.($rel_design['from_top_margin']+0.5).'in;margin-left:'.$rel_design['from_left_margin'].'in'?>;display:none;">
					<?=ucwords(strtolower($from_address))?>
			</div>
							</div>
						</div>
				
	<!--print_receipt()-->
					</section>
				</div>
			  </div>
			  <!--state overview end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
	<?php include_once('../include/footer.php');?>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<?php include_once('../include/include_js_file.php');?>   
<!--<script src="js/count.js"></script>-->
<script type="text/javascript"> 
function cover_change(val1)
{

if(val1=="1")
{
	$('#from_content').css("display","none");
	
}
else if(val1=="2")
{
	$('#from_content').css("display","");
}
}
function load_envelope(id)
{
	$.ajax({
	type: "POST",
	url: root_domain+'app/envelope/',
	data: { mode : "load_envelope", typeid : id},
	success: function(data){
				//console.log(data);
				var env = jQuery.parseJSON(data);
				$("#address_content").attr("style","width:2.5in;font-size:"+env.font_size+"px;line-height:"+env.line_height+"px;margin-top:"+env.top_margin+"in;margin-left:"+env.left_margin+"in;font-family:"+env.font_family+";");
	
				$("#maindiv").attr("style","width:"+env.width+"in;height:"+env.height+"in;border:1px solid black;background-color:white;color:black;");
							
	}
	});
}
function print_receipt()
{
	var originalContents = document.body.innerHTML;
	var duplicate = $("#receipt_data").clone().appendTo("#receipt_duplicate");
	document.body.innerHTML = document.getElementById('envelope_print').innerHTML;
    window.print();

}

function PrintMe(DivID) {
if($('#envdesign_id').val()=='')
{
	alert('Select Envelope Design');
	return false;
}

$("#maindiv").attr("style","border:none;");

var disp_setting="toolbar=yes,location=no,";
disp_setting+="directories=yes,menubar=yes,";
disp_setting+="scrollbars=yes,width=800, height=600, left=100, top=25";
  var content_vlue = document.getElementById(DivID).innerHTML;
  var docprint=window.open("","",disp_setting);
  docprint.document.open();
 docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
  docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
  docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
  docprint.document.write('<head><title><? echo TITLE;?></title>');
  docprint.document.write('<style type="text/css"> @media print { @page { size: portrait;margin:0px;}}  body { display: block;padding-top: 0px;height:4.5in;width: 4.5in;margin:auto; vertical-align: middle; -webkit-transform: rotate(90deg); -moz-transform: rotate(90deg);-o-transform: rotate(90deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);}</style>');
  docprint.document.write('</head><body onLoad="self.print()">');
  docprint.document.write(content_vlue);
  docprint.document.write('</body></html>');
  docprint.document.close();
  docprint.focus();
  $("#duplicat_data").hide();
  $('#table_head').show();
  location.reload();
 // docprint.close();
}

</script>

<?
	echo "<script>load_envelope(2)</script>";
?>
  </body>
</html>
