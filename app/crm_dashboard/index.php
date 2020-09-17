<?php
session_start(); //start session
$AJAX = true;
include("../../config/config.php");
//error_reporting(E_ALL);
//include("../../config/session.php");
include("../../include/function_database_query.php");

include("../../include/coman_function.php");
		//print_r($_POST['mode']);
		if($_POST != NULL) {
			$POST = bulk_filter($dbcon,$_POST);
		}
		else {
			$POST = bulk_filter($dbcon,$_GET);
		}
		
		if(strtolower($POST['mode']) == "new_inq_add_load") {
			$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
			$str="";
			$str.='<table class="table">
				<tr> 
					<th width="10%" style="white-space:nowrap;" >Sr. No.</th>
					<th width="70%">Employee Name</th>
					<th width="20%">Nos.</th>
				</tr>';
				 $query="select us.user_id,us.user_name,IFNULL(cou,0) as cou from users as us
					left join 
					(select IFNULL(count(inquiry_id),0) as cou,invoice.user_id from tbl_inquiry as invoice where inquiry_status=0 and invoice.company_id=".$_SESSION['company_id']." and create_date >= '".date('Y-m-d',strtotime($POST['new_inq_start_date']))."' and create_date <= '".date('Y-m-d',strtotime($POST['new_inq_end_date']))."'  group by invoice.user_id) as debitinvoice on debitinvoice.user_id=us.user_id 
					
					where us.active=0 and us.user_id in (".$user_ids.") and us.company_id='$_SESSION[company_id]'";
				$query_rs=$dbcon->query($query);
				$i=1;
				$total=0;
				while($row_p=mysqli_fetch_assoc($query_rs))
				{ 
                                    if($row_p["cou"] <= 0){
                                        $total_link = $row_p["cou"];

                                    } else {
                                        $total_link = '<a href="'.ROOT.'inquiry_list/'.$row_p['user_id'].'" target="_blank" class="link_dash">'.$row_p['cou'].'</a>';
                                    }
					$str.='<tr> 
						<td>'.$i.'</td>
						<td>'.$row_p['user_name'].'</td>
						<td>'.$total_link.'</td>
					</tr>';
			
					$total=$total+$row_p['cou'];
					$i++;
				}
				
				$str.='<tr style="font-size:16px;"> 
						<td colspan="2" style="text-align:center"><strong>Total</strong></td>
						<td><strong>'.$total.'</strong></td>
					</tr>
			</table>';
			
		echo $str;
		}
                else if(strtolower($POST['mode']) == "sales_stage_repo") {
			$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
			$str="";
			$str.='<table class="table">
				<tr> 
					<th width="10%" style="white-space:nowrap;">Sr. No.</th>
					<th width="70%">Employee Name</th>
					<th width="20%">Nos.</th>
				</tr>';
				 $query="select us.user_id,us.user_name,IFNULL(cou,0) as cou from users as us
					left join 
					(select IFNULL(count(inquiry_id),0) as cou,invoice.user_id from tbl_inquiry as invoice where inquiry_status=0 and sales_stage_id=".$POST['sales_stage_id']." and invoice.company_id=".$_SESSION['company_id']." and mdate >= '".date('Y-m-d',strtotime($POST['sales_stage_start_date']))."' and mdate <= '".date('Y-m-d',strtotime($POST['sales_stage_end_date']))."'  group by invoice.user_id) as debitinvoice on debitinvoice.user_id=us.user_id 
					
					where us.active=0 and us.user_id in (".$user_ids.") and us.company_id='$_SESSION[company_id]'";
				$query_rs=$dbcon->query($query);
				$i=1;
				$total=0;
				while($row_p=mysqli_fetch_assoc($query_rs))
				{ 
                                    if($row_p["cou"] <= 0){
                                        $total_link = $row_p["cou"];

                                    } else {
                                        $total_link = '<a href="'.ROOT.'inquiry_list_sales_stage/'.$row_p['user_id'].'/'.$POST['sales_stage_id'].'" target="_blank" class="link_dash">'.$row_p['cou'].'</a>';
                                    }
					$str.='<tr> 
						<td>'.$i.'</td>
						<td>'.$row_p['user_name'].'</td>
						<td>'.$total_link.'</td>
					</tr>';
			
					$total = $total+$row_p['cou'];
					$i++;
				}
				
				$str.='<tr style="font-size:16px;"> 
						<td colspan="2" style="text-align:center"><strong>Total</strong></td>
						<td><strong>'.$total.'</strong></td>
					</tr>
			</table>';
			
		echo $str;
		}
                else if(strtolower($POST['mode']) == "stage_repo") {
			//$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
			$str="";
			$str.='<table class="table">
				<tr> 
					<th width="10%" style="white-space:nowrap;">Sr. No.</th>
					<th width="70%">Stage Name</th>
					<th width="20%">Nos.</th>
				</tr>';
				 $query="select ope.opp_id,ope.opp_stage,IFNULL(cou,0) as cou from tbl_opportunity_mst as ope
					left join 
					(select IFNULL(count(inquiry_id),0) as cou,invoice.opp_id from tbl_inquiry as invoice where inquiry_status=0 and user_id=".$POST['source_user_id']." and invoice.company_id=".$_SESSION['company_id']." and mdate >= '".date('Y-m-d',strtotime($POST['source_start_date']))."' and mdate <= '".date('Y-m-d',strtotime($POST['source_end_date']))."'  group by invoice.opp_id) as debitinvoice on debitinvoice.opp_id=ope.opp_id
					where ope.opp_status=0 and ope.company_id='$_SESSION[company_id]' group by ope.opp_id";
				$query_rs=$dbcon->query($query);
				$i=1;
				$total=0;
				while($row_p=mysqli_fetch_assoc($query_rs))
				{ 
                                    if($row_p["cou"] <= 0) 
                                    {
                                        $total_link = $row_p["cou"];

                                    } else {
                                        $total_link = '<a href="'.ROOT.'inquiry_list/'.$POST['source_user_id'].'/'.$row_p['opp_id'].'" target="_blank" class="link_dash">'.$row_p['cou'].'</a>';
                                    }
					$str.='<tr> 
						<td>'.$i.'</td>
						<td>'.$row_p['opp_stage'].'</td>
						<td>'.$total_link.'</td>
					</tr>';
			
					$total=$total+$row_p['cou'];
					$i++;
				}
				
				$str.='<tr style="font-size:16px;"> 
						<td colspan="2" style="text-align:center"><strong>Total</strong></td>
						<td><strong>'.$total.'</strong></td>
					</tr>
			</table>';
			
		echo $str;
		}
                else if(strtolower($POST['mode']) == "source_repo1") {
			//$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
			$str="";
			$str.='<table class="table">
				<tr> 
					<th width="10%" style="white-space:nowrap;">Sr. No.</th>
					<th width="70%" >Source Name</th>
					<th width="20%" >Nos.</th>
				</tr>';
				 $query="select ope.rb_id,ope.rb_name,IFNULL(cou,0) as cou from tbl_refer_by as ope
					left join 
					(select IFNULL(count(inquiry_id),0) as cou,invoice.rb_id from tbl_inquiry as invoice where inquiry_status=0 and user_id=".$POST['source_user_id']." and invoice.company_id=".$_SESSION['company_id']." and mdate >= '".date('Y-m-d',strtotime($POST['source_start_date']))."' and mdate <= '".date('Y-m-d',strtotime($POST['source_end_date']))."'  group by invoice.rb_id) as debitinvoice on debitinvoice.rb_id=ope.rb_id
					where ope.rb_status=0 group by ope.rb_id";
				$query_rs=$dbcon->query($query);
				$i=1;
				$total=0;
				while($row_p=mysqli_fetch_assoc($query_rs))
				{ 
                                    if($row_p["cou"] <= 0) 
                                    {
                                        $total_link = $row_p["cou"];

                                    } else {
                                        $total_link = '<a href="'.ROOT.'inquiry_list_source/'.$POST['source_user_id'].'/'.$row_p['rb_id'].'" target="_blank" class="link_dash">'.$row_p['cou'].'</a>';
                                    }
					$str.='<tr> 
						<td >'.$i.'</td>
						<td>'.$row_p['rb_name'].'</td>
						<td>'.$total_link.'</td>
					</tr>';
			
					$total=$total+$row_p['cou'];
					$i++;
				}
				
				$str.='<tr style="font-size:16px;"> 
						<td colspan="2" style="text-align:center"><strong>Total</strong></td>
						<td><strong>'.$total.'</strong></td>
					</tr>
			</table>';
			
		echo $str;
		}
                else if(strtolower($POST['mode']) == "stage_summ") {
                    $_SESSION['summary_start_date'] = $_POST['stage_summ_start_date'];
                    $_SESSION['summary_end_date'] = $_POST['stage_summ_end_date'];
                    //echo '<pre>';  print_r($_SESSION); exit;
                    
			//$user_ids=check_user_chein($dbcon,$_SESSION['user_id'],1);
			$str="";
			$str.='<table class="table" style="margin-top:50px;overflow-x:scroll;">
				<tr> 
					<th width="10%" style="white-space:nowrap;">Sr. No.</th>
					<th width="30%" >Employee Name</th>';
					$qry="select opp_id,opp_stage from tbl_opportunity_mst where opp_status=0";
					$rs_state=$dbcon->query($qry);	
					$opp=array();
					$ca="";
					$caa="";
					while($row=mysqli_fetch_assoc($rs_state))
					{	
						$str.='<th style="white-space:nowrap;">'.$row["opp_stage"].'</th>';
						array_push($opp,$row["opp_id"]);
						$ca.="sum(case when ".$row["opp_id"]." = inq.opp_id then 1 else 0 end) '".$row["opp_id"]."',";
						$caa.="sum(".$row['opp_id'].") as ".$row['opp_id'].",";
					}
					$str.='<th>Total</th>
					</tr>';
				/*  $query="select ope.rb_name,IFNULL(cou,0) as cou from tbl_refer_by as ope
					left join 
					(select IFNULL(count(inquiry_id),0) as cou,invoice.rb_id from tbl_inquiry as invoice where inquiry_status=0 and user_id=".$POST['source_user_id']." and invoice.company_id=".$_SESSION['company_id']." and mdate >= '".date('Y-m-d',strtotime($POST['source_start_date']))."' and mdate <= '".date('Y-m-d',strtotime($POST['source_end_date']))."'  group by invoice.rb_id) as debitinvoice on debitinvoice.rb_id=ope.rb_id
					where ope.rb_status=0 group by ope.rb_id"; */
				
				 /* $query="select IFNULL(count(inq.inquiry_id),0) as cou,us.user_name from users as us
						left join tbl_inquiry as inq on inq.user_id=us.user_id
						where us.active=0 and inq.inquiry_status=0 and inq.mdate >= '".date('Y-m-d',strtotime($POST['stage_summ_start_date']))."' and inq.mdate <= '".date('Y-m-d',strtotime($POST['stage_summ_end_date']))."' group by inq.user_id"; */
				$query="select ".$ca." us.user_id,us.user_name,IFNULL(count(inq.inquiry_id),0) as cou from users as us
					left join tbl_inquiry as inq on inq.user_id=us.user_id
						where us.active=0 and inq.inquiry_status=0 and inq.cdate >= '".date('Y-m-d',strtotime($POST['stage_summ_start_date']))."' and inq.cdate <= '".date('Y-m-d',strtotime($POST['stage_summ_end_date']))."' group by inq.user_id"; 
				  /* $query="Select * from (
					(select ".$ca." us.user_name,IFNULL(count(inq.inquiry_id),0) as cou from users as us
					left join tbl_inquiry as inq on inq.user_id=us.user_id
						where us.active=0 and inq.inquiry_status=0 and inq.mdate >= '".date('Y-m-d',strtotime($POST['stage_summ_start_date']))."' and inq.mdate <= '".date('Y-m-d',strtotime($POST['stage_summ_end_date']))."' group by inq.user_id)
					
					union (
						Select ".$caa.",'Total' as user_name,sum(cou) as cou from (select ".$ca." us.user_name,IFNULL(count(inq.inquiry_id),0) as cou from users as us
					left join tbl_inquiry as inq on inq.user_id=us.user_id
						where us.active=0 and inq.inquiry_status=0 and inq.mdate >= '".date('Y-m-d',strtotime($POST['stage_summ_start_date']))."' and inq.mdate <= '".date('Y-m-d',strtotime($POST['stage_summ_end_date']))."' group by inq.user_id) as a)	
					
				 ) as data order by user_name"; */
				$query_rs=$dbcon->query($query);
				$i=1;
				$total=0;
                                $opp_total = array();
				while($row_p=mysqli_fetch_assoc($query_rs))
				{ 
					$str.='<tr> 
						<td >'.$i.'</td>
						<td>'.$row_p['user_name'].'</td>';
						for($x=0;$x<count($opp);$x++){
                                                    	$kp=$opp[$x];
                                                        $opp_total[$opp[$x]] += $row_p[$kp];
                                                        if($row_p[$kp] <= 0) 
                                                        {
                                                            $link = $row_p[$kp];
                                                            
                                                        } else {
                                                            $link = '<a href="'.ROOT.'inquiry_list/'.$row_p['user_id'].'/'.$kp.'" target="_blank" class="link_dash">'.$row_p[$kp].'</a>';
                                                        }
                                                        $str.='<td style="text-align:center;">'.$link.'
                                                            </td>';
						}
                                                
                                                if($row_p["cou"] <= 0) 
                                                {
                                                    $total_link = $row_p["cou"];

                                                } else {
                                                    $total_link = '<a href="'.ROOT.'inquiry_list/'.$row_p['user_id'].'" target="_blank" class="link_dash">'.$row_p['cou'].'</a>';
                                                }
						$str.='<td style="text-align:center;"><strong>'.$total_link.'</strong></td>';
					$str.='</tr>';
			
					//$total=$total+$row_p['cou'];
					$i++;
				}
				//echo '<pre>'; print_r($opp_total);
				$str.='<tr style="font-size:16px;"> 
						<td colspan="2" style="text-align:center"><strong>Total</strong></td>';
						for($x=0;$x<count($opp);$x++){
							$kp=$opp_total[$opp[$x]];
                                                        $total = $total + $kp;
							$str.='<td style="text-align:center;"><strong>
                                                            <a href="'.ROOT.'inquiry_list/0/'.$opp[$x].'" target="_blank" class="link_dash">'.$kp.'</a></strong></td>';
						}
						$str.='<td style="text-align:center;"><strong><a href="'.ROOT.'inquiry_list" target="_blank" class="link_dash">'.$total.'</a></strong></td>';
					$str.='</tr>
			</table>';
			
		echo $str;
		}
                else if(strtolower($POST['mode']) == "team_pending_tasks") {
			$str="";
			$str.='<table class="table">
                                    <tr> 
                                            <th>
                                                    <a href="'.ROOT.'inquiry_add'.'">Add Inquiry</a>
                                            </th>
                                            <th></th>
                                    </tr>';
                                    $query="select mcd_id,mcd_name from tbl_master_category_detail where mcd_status=0 and mcd_cat_id=10 order by priority ASC";
                                    $query_rs=$dbcon->query($query);
                                    while($row_p=mysqli_fetch_assoc($query_rs))
                                    {
                                            $utr = ROOT.'pending_task_list/'.$row_p['mcd_id'].'/'.$POST["user_id"];
                                            $count = count_usr_pen_tsk($dbcon,$row_p['mcd_id'],$POST["user_id"]);
                                            $link = ($count <= 0) ? $count : '<a href="'.$utr.'" class="link_dash" target="_blank">'.$count.'</a>';
                                            
                                            $utr=ROOT.'pending_task_list/'.$row_p['mcd_id'].'/'.$POST["user_id"];
                                            $str.='<tr>
                                                    <th>'.$row_p['mcd_name'].'</th>
                                                    <th>'.$link.'</th>
                                            </tr>';

                                            $cnt++;
                                    }
                                    $str.='
                            </table>';
			echo $str;
		}
                else if(strtolower($POST['mode']) == "pending_tasks") {
			$str="";
			$str.='<table class="table">
                                    <tr> 
                                            <th>
                                                    <a href="'.ROOT.'inquiry_add'.'">Add Inquiry</a>
                                            </th>
                                            <th></th>
                                    </tr>';
                                    $query="select mcd_id,mcd_name from tbl_master_category_detail where mcd_status=0 and mcd_cat_id=10 order by priority ASC";
                                    $query_rs=$dbcon->query($query);
                                    while($row_p=mysqli_fetch_assoc($query_rs))
                                    {
                                            $utr = ROOT.'pending_task_list_one/'.$row_p['mcd_id'].'/'.$POST["user_id"];
                                            $count = count_usr_pen_tsk1($dbcon,$row_p['mcd_id'],$POST["user_id"]);
                                            $link = ($count <= 0) ? $count : '<a href="'.$utr.'" class="link_dash" target="_blank">'.$count.'</a>';
                                            
                                            $str.='<tr>
                                                    <th>'.$row_p['mcd_name'].'</th>
                                                    <th>'.$link.'</th>
                                            </tr>';

                                            $cnt++;
                                    }
                                    $str.='
                            </table>';
			echo $str;
		}

?>