
	<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
			  <ul class="sidebar-menu" id="nav-accordion">		 
              
                  <li>
                      <a class="active" href="<?=ROOT.'dashboard'?>">
                          <i class="fa fa-dashboard"></i>
                          <span style="font-size:14px">Dashboard</span>
                      </a>
                  </li>
				 <!-- <li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-book"></i>
					  <span  style="font-size:14px">Item Manager</span>
				  </a>
				  <ul class="sub">
					<li><a  style="font-size:14px" href="<?=ROOT.'item_list'?>">Item List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'purchasebill_list'?>">Item Purchase Bill List</a></li>	
					<li><a  style="font-size:14px" href="<?=ROOT.'processorder'?>">Item Process List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'directprocessorder'?>">Item DirectProcess List</a></li>
					
					</ul>
				</li>
				  <li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-money"></i>
					  <span  style="font-size:14px">Finacial Manager</span>
				  </a>
				  <ul class="sub">
					<li><a  style="font-size:14px" href="<?=ROOT.'finacial_list'?>">Finacial Status List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'income_party_list'?>">Income Party List</a></li>	
					<li><a  style="font-size:14px" href="<?=ROOT.'expenses_party_list'?>">Expenses Party List</a></li>
					
					</ul>
				</li> -->
				<li>
                 	    <a class="" href="<?=ROOT.'po_venderlist'?>">
                          <i class="fa fa-list"></i>
                          <span style="font-size:14px">Vender Purchase Order</span>
                      </a>
                </li>
				<li>
                 	    <a class="" href="<?=ROOT.'po_list'?>">
                          <i class="fa fa-list"></i>
                          <span style="font-size:14px">Customer PurchaseOrder</span>
                      </a>
                </li>
				 
			<!--	<li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-envelope"></i>
					  <span  style="font-size:14px">Excise Master</span>
				  </a>
				  <ul class="sub">
					<li><a  style="font-size:14px" href="<?=ROOT.'exsice_invoice'?>">Create Excise Invoice</a></li>	
					<li><a  style="font-size:14px" href="<?=ROOT.'exciseinvoice_list'?>">Excise invoice List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'einvoicepaymentreceipt_list'?>">Payment Receipt List</a></li>
					
					</ul>
				</li>-->
				<li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-envelope"></i>
					  <span style="font-size:14px">Invoice Manager</span>
				  </a>
				  <ul class="sub">
					<li><a  style="font-size:14px" href="<?=ROOT.'invoice'?>">Create Invoice</a></li>	
					<li><a  style="font-size:14px" href="<?=ROOT.'invoice_list'?>">Invoice List</a></li>
				<li><a  style="font-size:14px" href="<?=ROOT.'invoicepaymentreceipt_list'?>">Payment Receipt List</a></li>							 					
					</ul>
				</li>
				<li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-gear"></i>
					  <span style="font-size:14px">Master</span>
				  </a>
				  <ul class="sub">
					<li><a style="font-size:14px" href="<?=ROOT.'customer_list'?>">Customer List</a></li>
					<!--<li><a style="font-size:14px" href="<?=ROOT.'vender_list'?>">Vender List</a></li>-->
					<li><a style="font-size:14px" href="<?=ROOT.'unit_list'?>">Unit List</a></li>
					<li><a style="font-size:14px" href="<?=ROOT.'invoicetype_list'?>">Invoice Type List</a></li>
					<li><a style="font-size:14px" href="<?=ROOT.'product_list'?>">Product List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'tax_list'?>">Tax List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'formula_list'?>">Formula List</a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'state'?>">State List</a></li>
					<li><a style="font-size:14px" href="<?=ROOT.'city'?>">City List</a></li>
					</ul>
				</li>
				<li class="sub-menu">
				  <a href="javascript:;" >
					  <i class="fa fa-bar-chart-o"></i>
					  <span style="font-size:14px">Report Manager</span>
				  </a>
				  <ul class="sub">
				<!--	<li><a  style="font-size:14px" href="<?=ROOT.'excise_report'?>">Excise Party Ledger </a></li>
				<li><a  style="font-size:14px" href="<?=ROOT.'stock-material-report'?>">Item Stock </a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'income-expense-lesar'?>">Income/Expenses Report</a></li>
					-->
					<li><a  style="font-size:14px" href="<?=ROOT.'invoice_report'?>">Party Ledger </a></li>
					<li><a  style="font-size:14px" href="<?=ROOT.'vat_report'?>">Vat Report</a></li>
					</ul>
				</li>
				<li>
                 	    <a class="" href="<?=ROOT.'changepassword/'.$_SESSION['user_id'] ?>">
                          <i class="fa fa-cog"></i>
                          <span style="font-size:14px">Change Password</span>
                      </a>
                </li>
				<li>
                      <a href="<?=ROOT.'setting/1'?>">
                          <i class="fa fa-cog"></i>
                          <span style="font-size:14px">Setting</span>
                      </a>
                  </li>
				</ul>
				 </li>
				 </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>