<?
	$arr=explode("/",$_SERVER['PHP_SELF']);
	$page_name=end($arr);
	$page_name=basename($page_name, '.php');
?>
<style>
ul.summary-list > li {
	width:15%;
}
</style>
<div style="text-align:right" class="hidden-phone">
						<ul class="summary-list" style="">
							
                            <? 
							if($page_name!="partypaymentreport")
							{?>
							<li>
								<a href="<?=ROOT.'partypaymentreport'?>">
									<i class="fa fa-user text-info"></i>
										All Party Account
                                </a>
                            </li>
							<? }
							if($page_name!="venderpaymentreport")
							{?>
							<!--<li>
                               <a href="<?=ROOT.'venderpaymentreport'?>">
                                 <i class="fa  fa-inbox text-info"></i>
										All Vendor Account 
                               </a>
                            </li>-->
							<? }if($page_name!="customer_ledger")
							{?>
                            <li>
								<a href="<?=ROOT.'customer_ledger'?>">
									<i class="fa  fa-book text-info"></i>
                                      Party Statement
                                </a>
                            </li>
                            <?}
							if($page_name!="vendor_ledger")
							{?>
                          <!-- <li>
								<a href="<?=ROOT.'vendor_ledger'?>">
									<i class="fa  fa-book text-info"></i>
                                      Vendor Statement
                                </a>
                            </li>-->
                            <?}?>
                     </ul>
		</div>
						