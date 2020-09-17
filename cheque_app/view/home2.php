<?php
	session_start();
	include("../../config/config.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<?php
		$TITLE = "Home";
		include("../common/head.php");
	?>
</head>
<body>

<div id="cl-wrapper">

  <div class="cl-sidebar">
    <div class="cl-toggle"><i class="fa fa-bars"></i></div>
    <div class="cl-navblock">
      <div class="menu-space">
        <div class="content">
          <div class="sidebar-logo">
            <div class="logo">
                <a href="index2.html"></a>
            </div>
          </div>
          <div class="side-user">
            <div class="avatar"><img src="images/avatar6.jpg" alt="Avatar" /></div>
            <div class="info">
              <p>40 <b>GB</b> / 100 <b>GB</b><span><a href="#"><i class="fa fa-plus"></i></a></span></p>
              <div class="progress progress-user">
                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                  <span class="sr-only">50% Complete (success)</span>
                </div>
              </div>
            </div>
          </div>
          <ul class="cl-vnavigation">
            <li class="active" ><a href="index.html"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="#"><i class="fa fa-desktop"></i><span>Layouts</span></a>
              <ul class="sub-menu">
                <li><a href="layout-boxed.html"><span class="label label-primary pull-right">New</span>Boxed Layout</a></li>
                <li><a href="layout-topbar.html"><span class="label label-primary pull-right">New</span>Top Menu</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-smile-o"></i><span>UI Elements</span></a>
              <ul class="sub-menu">
                <li  ><a href="ui-elements.html">General</a></li>
                <li  ><a href="ui-alerts.html">Alerts</a></li>
                <li  ><a href="ui-porlets.html"><span class="label label-primary pull-right">New</span>Porlets</a></li>
                <li  ><a href="ui-buttons.html">Buttons</a></li>
                <li  ><a href="ui-modals.html">Modals</a></li>
                <li  ><a href="ui-notifications.html">Notifications</a></li>
                <li  ><a href="ui-tiles.html"><span class="label label-primary pull-right">New</span>Tiles</a></li>
                <li  ><a href="ui-progress.html">Progress Bars</a></li>
                <li  ><a href="ui-icons.html">Icons</a></li>
                <li  ><a href="ui-grid.html">Grid</a></li>
                <li  ><a href="ui-tabs-accordions.html">Tabs & Accordions</a></li>
                <li  ><a href="ui-nestable-lists.html">Nestable Lists</a></li>
                <li  ><a href="ui-treeview.html">Tree View</a></li>
                <li  ><a href="ui-calendar.html"><span class="label label-primary pull-right">New</span>Calendar</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-list-alt"></i><span>Forms</span></a>
              <ul class="sub-menu">
                <li  ><a href="form-elements.html">Components</a></li>
                <li  ><a href="form-multiselect.html"><span class="label label-primary pull-right">New</span>Multiselect</a></li>
                <li  ><a href="form-validation.html">Validation</a></li>
                <li  ><a href="form-wizard.html">Wizard</a></li>
                <li  ><a href="form-masks.html">Input Masks</a></li>
                <li  ><a href="form-wysiwyg.html">WYSIWYG Editor</a></li>
                <li  ><a href="form-upload.html">Multi Upload</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-table"></i><span>Tables</span></a>
              <ul class="sub-menu">
                <li  ><a href="tables-general.html">General</a></li>
                <li  ><a href="tables-datatables.html"><span class="label label-primary pull-right">New</span>Data Tables</a></li>
                <li  ><a href="tables-xeditable.html"><span class="label label-primary pull-right">New</span>X-Editable</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-map-marker nav-icon"></i><span>Maps</span></a>
              <ul class="sub-menu">
                <li  ><a href="maps.html">Maps</a></li>
                <li  ><a href="vector-maps.html">Vector Maps</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-envelope nav-icon"></i><span>Email</span></a>
              <ul class="sub-menu">
                <li  ><a href="email-inbox.html">Inbox</a></li>
                <li  ><a href="email-read.html">Email Detail</a></li>
              </ul>
            </li>
            <li  ><a href="typography.html"><i class="fa fa-text-height"></i><span>Typography</span></a></li>
            <li  ><a href="charts.html"><i class="fa fa-bar-chart-o"></i><span>Charts</span></a></li>
            <li><a href="#"><i class="fa fa-file"></i><span>Pages</span></a>
              <ul class="sub-menu">
                <li  ><a href="pages-blank.html">Blank Page</a></li>
                <li  ><a href="pages-blank-header.html">Blank Page Header</a></li>
                <li  ><a href="pages-blank-aside.html">Blank Page Aside</a></li>
                <li  ><a href="pages-blank-aside-header.html"><span class="label label-primary pull-right">New</span>Blank Page Aside Header</a></li>
                <li  ><a href="pages-profile.html"><span class="label label-primary pull-right">New</span>Profile</a></li>
                <li><a href="pages-login.html">Login</a></li>
                <li><a href="pages-sign-up.html"><span class="label label-primary pull-right">New</span>Sign Up</a></li>
                <li><a href="pages-forgot.html"><span class="label label-primary pull-right">New</span>Forgot Password</a></li>
                <li><a href="pages-404.html">404 Page</a></li>
                <li><a href="pages-500.html">500 Page</a></li>
                <li  ><a href="pages-tour.html"><span class="label label-primary pull-right">New</span>Tour Guide</a></li>
                <li  ><a href="pages-gallery.html">Gallery</a></li>
                <li  ><a href="pages-search.html"><span class="label label-primary pull-right">New</span>Search</a></li>
                <li  ><a href="pages-timeline.html">Timeline</a></li>
                <li  ><a href="pages-code-editor.html">Code Editor</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="text-right collapse-button" style="padding:7px 9px;">
        <input type="text" class="form-control search" placeholder="Search..." />
        <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
      </div>
    </div>
  </div>
	<div class="container-fluid" id="pcont">
   <!-- TOP NAVBAR -->
  <div id="head-nav" class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-collapse">
        <ul class="nav navbar-nav navbar-right user-nav">
          <li class="dropdown profile_menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="images/avatar6-2.jpg" /><span>Jane Smith</span> <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">My Account</a></li>
              <li><a href="#">Profile</a></li>
              <li><a href="#">Messages</a></li>
              <li class="divider"></li>
              <li><a href="#">Sign Out</a></li>
            </ul>
          </li>
        </ul>			
        <ul class="nav navbar-nav not-nav">
          <li class="button dropdown">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class=" fa fa-inbox"></i></a>
            <ul class="dropdown-menu messages">
              <li>
                <div class="nano nscroller">
                  <div class="content">
                    <ul>
                      <li>
                        <a href="#">
                          <img src="images/avatar2.jpg" alt="avatar" /><span class="date pull-right">13 Sept.</span> <span class="name">Daniel</span> Hey! How are you?
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <img src="images/avatar_50.jpg" alt="avatar" /><span class="date pull-right">20 Oct.</span><span class="name">Adam</span> Hi! Can you fix my phone?
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <img src="images/avatar4_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Michael</span> Regards!
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <img src="images/avatar3_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Lucy</span> Hello, my name is Lucy
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                <ul class="foot"><li><a href="#">View all messages </a></li></ul>           
              </li>
            </ul>
          </li>
          <li class="button dropdown">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i><span class="bubble">2</span></a>
            <ul class="dropdown-menu">
              <li>
                <div class="nano nscroller">
                  <div class="content">
                    <ul>
                      <li><a href="#"><i class="fa fa-cloud-upload info"></i><b>Daniel</b> is now following you <span class="date">2 minutes ago.</span></a></li>
                      <li><a href="#"><i class="fa fa-male success"></i> <b>Michael</b> commented on your link <span class="date">15 minutes ago.</span></a></li>
                      <li><a href="#"><i class="fa fa-bug warning"></i> <b>Mia</b> commented on post <span class="date">30 minutes ago.</span></a></li>
                      <li><a href="#"><i class="fa fa-credit-card danger"></i> <b>Andrew</b> sent you a request <span class="date">1 hour ago.</span></a></li>
                    </ul>
                  </div>
                </div>
                <ul class="foot"><li><a href="#">View all activity </a></li></ul>           
              </li>
            </ul>
          </li>
          <li class="button"><a class="toggle-menu menu-right push-body" href="javascript:;" class="speech-button"><i class="fa fa-comments"></i></a></li>				
        </ul>

      </div><!--/.nav-collapse animate-collapse -->
    </div>
  </div>
  
    
	<div class="cl-mcont">		<div class="row">
      
      <div class="col-md-3 col-sm-6">
        <div class="fd-tile detail clean tile-purple">
          <div class="content"><h1 class="text-left">170</h1><p>New Visitors</p></div>
          <div class="icon"><i class="fa fa-flag"></i></div>
          <a class="details" href="#">Details <span><i class="fa fa-arrow-circle-right pull-right"></i></span></a>
        </div>
      </div>
    
      
      <div class="col-md-3 col-sm-6">
        <div class="fd-tile detail clean tile-green">
          <div class="content"><h1 class="text-left">24</h1><p>New Comments</p></div>
          <div class="icon"><i class="fa fa-comments"></i></div>
          <a class="details" href="#">Details <span><i class="fa fa-arrow-circle-right pull-right"></i></span></a>
        </div>
      </div>
    
      
      
      <div class="col-md-3 col-sm-6">
        <div class="fd-tile detail clean tile-prusia">
          <div class="content"><h1 class="text-left">25</h1><p>New Likes</p></div>
          <div class="icon"><i class="fa fa-heart"></i></div>
          <a class="details" href="#">Details <span><i class="fa fa-arrow-circle-right pull-right"></i></span></a>
        </div>
      </div>
      
      <div class="col-md-3 col-sm-6">
        <div class="fd-tile detail clean tile-red">
          <div class="content"><h1 class="text-left">72</h1><p>New Views</p></div>
          <div class="icon"><i class="fa fa-eye"></i></div>
          <a class="details" href="#">Details <span><i class="fa fa-arrow-circle-right pull-right"></i></span></a>
        </div>
      </div>
    
    </div>
    <div class="row">
      <div class="col-md-7">
        <div class="block-flat">
          <div class="header">							
            <h3>Visitors</h3>
          </div>
          <div class="content full-width">
            <div id="chart3-legend" class="legend-container"></div>
            <div id="chart3" style="height: 180px;"></div>
            <div class="counter-detail">
              <div class="counter"><div class="spk1"></div><p>New Visitors</p><h5>146</h5></div>
              <div class="counter"><div class="spk2"></div><p>Old Visitors</p><h5>109</h5></div>
            </div>
          </div>
        </div>
        <div class="block-flat">
          <div class="header">							
            <h3>Tasks</h3>
          </div>
          <div class="content">
            <div class="table-responsive">
            <table class="no-border hover list">
              <tbody class="no-border-y">
                <tr class="items">
                  <td style="width: 10%;"><span class="label label-warning">Task</span></td>
                  <td><p><strong>Graphics</strong><span>description</span></p></td>
                  <td class="color-success"><div class="progress"><div class="progress-bar progress-bar-warning" style="width: 80%">80%</div></div></td>
                  <td class="text-right" style="width: 15%;"><a class="label label-default" href="#"><i class="fa fa-pencil"></i></a> <a class="label label-danger" href="#"><i class="fa fa-times"></i></a></td>
                </tr>
                <tr class="items">
                  <td><span class="label label-danger">File</span></td>
                  <td><p><strong>Contact_form.psd</strong><span>description</span></p></td>
                  <td class="color-success"><div class="progress"><div class="progress-bar progress-bar-danger" style="width: 60%">60%</div></div></td>
                  <td class="text-right"><a class="label label-default" href="#"><i class="fa fa-pencil"></i></a> <a class="label label-danger" href="#"><i class="fa fa-times"></i></a></td>
                </tr>
                <tr class="items">
                  <td><span class="label label-success">Item</span></td>
                  <td><p><strong>Header</strong><span>description</span></p></td>
                  <td class="color-success"><div class="progress"><div class="progress-bar progress-bar-success" style="width: 100%">100%</div></div></td>
                  <td class="text-right"><a class="label label-default" href="#"><i class="fa fa-pencil"></i></a> <a class="label label-danger" href="#"><i class="fa fa-times"></i></a></td>
                </tr>
                <tr class="items">
                  <td><span class="label label-info">Social</span></td>
                  <td><p><strong>Social Networks</strong><span>description</span></p></td>
                  <td class="color-success"><div class="progress"><div class="progress-bar progress-bar-info" style="width: 100%">100%</div></div></td>
                  <td class="text-right"><a class="label label-default" href="#"><i class="fa fa-pencil"></i></a> <a class="label label-danger" href="#"><i class="fa fa-times"></i></a></td>
                </tr>
              </tbody>
            </table>		
            </div>
          </div>
        </div>				

      </div>
      <div class="col-md-5">
        <div class="block-flat">
          <div class="header">							
            <h3>Services</h3>
          </div>
          <div class="content">
            <div id="site_statistics2" style="height: 165px; padding: 0px; position: relative;"></div>							
          </div>
          <div class="content">
            <table class="no-border hover">
              <thead class="no-border">
                <tr>
                  <th style="width:50%;">Service</th>
                  <th>Date</th>
                  <th class="text-right">Amount</th>
                </tr>
              </thead>
              <tbody class="no-border-y">
                <tr>
                  <td style="width:30%;"><i class="fa fa-cloud"></i>Cloud Services</td>
                  <td>01/01/2014</td>
                  <td class="text-right color-success"><i class="fa fa-angle-up"></i>33%</td>
                </tr>
                <tr>
                  <td style="width:30%;"><i class="fa fa-inbox"></i> Hosting Space</td>
                  <td>04/01/2014</td>
                  <td class="text-right color-danger"><i class="fa fa-angle-down"></i>75%</td>
                </tr>
                <tr>
                  <td style="width:30%;"><i class="fa  fa-envelope"></i> Mails Received</td>
                  <td>07/01/2014</td>
                  <td class="text-right color-primary"><i class="fa fa-angle-right"></i>256</td>
                </tr>
              </tbody>
            </table>						
          </div>
        </div>
        <div class="block-flat dark-box visitors">				
            <h4 class="no-margin">Visitors</h4>
          <div class="row">
            <div class="counters col-md-4">
            <h1>477</h1>
            <h1>23</h1>
            </div>							
            <div class="col-md-8">
              <div id="ticket-chart" style="height: 140px;"></div>
            </div>							
          </div>
          <div class="row footer">
            <div class="col-md-6"><p><i class=" fa fa-square"></i> New Visitors</p></div>
            <div class="col-md-6"><p><i class=" return fa fa-square"></i> Returning Visitors</p></div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-7">
        <div class="block ">
          <div class="content  no-padding" id="world-map" style="height: 320px;"></div>
          <div class="content">
            <table class="no-border">
              <thead class="no-border">
                <tr>
                  <th style="width:50%;">Country</th>
                  <th>New Visits</th>
                  <th>Rebound</th>
                  <th class="text-right">Visits</th>
                </tr>
              </thead>
              <tbody class="no-border-x no-border-y">
                <tr>
                  <td style="width:30%;"><img src="images/flags/us.png" alt="flag" /> United States</td>
                  <td>679</td>
                  <td>27%</td>
                  <td class="text-right">1800</td>
                </tr>
                <tr>
                  <td style="width:30%;"><img src="images/flags/in.png" alt="flag" /> India</td>
                  <td>349</td>
                  <td>57%</td>
                  <td class="text-right">1512</td>
                </tr>
                <tr>
                  <td style="width:30%;"><img src="images/flags/gb.png" alt="flag" /> United Kingdom</td>
                  <td>234</td>
                  <td>50%</td>
                  <td class="text-right">530</td>
                </tr>
                <tr>
                  <td style="width:30%;"><img src="images/flags/br.png" alt="flag" /> Brazil</td>
                  <td>34</td>
                  <td>8%</td>
                  <td class="text-right">340</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>				
      </div>
      <div class="col-md-5">
        <div class="block widget-notes">
          <div class="header dark"><h4>Notes</h4></div>
          <div class="content">
            <div class="paper" contenteditable="true">
            Send e-mails.<br>
            <s>meeting at 4 pm.</s><br>
            <s>Buy some coffee.</s><br>
            Talk with Mom about John Doe.
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-5">
        <div class="block widget-notes">
          <div class="header dark"><h4>Console</h4></div>
          <div class="content">
            <div id="console">
            </div>
          </div>
        </div>
      </div>
    </div>
	</div>
	</div>
	
	</div> 
	
</div>
<!-- Right Chat-->
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right side-chat">
	<div class="header">
    <h3>Chat</h3>
  </div>
  <div class="sub-header" href="#">
    <div class="icon"><i class="fa fa-user"></i></div> <p>Online (4)</p>
  </div>
  <div class="content">
    <p class="title">Family</p>
    <ul class="nav nav-pills nav-stacked contacts">
      <li class="online"><a href="#"><i class="fa fa-circle-o"></i> Michael Smith</a></li>
      <li class="online"><a href="#"><i class="fa fa-circle-o"></i> John Doe</a></li>
      <li class="online"><a href="#"><i class="fa fa-circle-o"></i> Richard Avedon</a></li>
      <li class="busy"><a href="#"><i class="fa fa-circle-o"></i> Allen Collins</a></li>
    </ul>
    
    <p class="title">Friends</p>
    <ul class="nav nav-pills nav-stacked contacts">
      <li class="online"><a href="#"><i class="fa fa-circle-o"></i> Jaime Garzon</a></li>
      <li class="outside"><a href="#"><i class="fa fa-circle-o"></i> Dave Grohl</a></li>
      <li><a href="#"><i class="fa fa-circle-o"></i> Victor Jara</a></li>
    </ul>   
    
    <p class="title">Work</p>
    <ul class="nav nav-pills nav-stacked contacts">
      <li><a href="#"><i class="fa fa-circle-o"></i> Ansel Adams</a></li>
      <li><a href="#"><i class="fa fa-circle-o"></i> Gustavo Cerati</a></li>
    </ul>
    
  </div>
  <div id="chat-box">
    <div class="header">
      <span>Richard Avedon</span>
      <a class="close"><i class="fa fa-times"></i></a>
    </div>
    <div class="messages nano nscroller">
      <div class="content">
        <ul class="conversation">
          <li class="odd">
            <p>Hi Jane, how are you?</p>
          </li>
          <li class="text-right">
            <p>Hello I was looking for you</p>
          </li>
          <li class="odd">
            <p>Tell me what you need?</p>
          </li>
          <li class="text-right">
            <p>Sorry, I'm late... see you</p>
          </li>
          <li class="odd unread">
            <p>OK, call me later...</p>
          </li>
        </ul>
      </div>
    </div>
    <div class="chat-input">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Enter a message...">
        <span class="input-group-btn">
        <button type="button" class="btn btn-primary">Send</button>
        </span>
      </div>
    </div>
  </div>
</nav>
  
	<script src="js/jquery.js"></script>
	<script src="js/jquery.cookie/jquery.cookie.js"></script>
  <script src="js/jquery.pushmenu/js/jPushMenu.js"></script>
	<script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.js"></script>
  <script type="text/javascript" src="js/jquery.ui/jquery-ui.js" ></script>
	<script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="js/behaviour/core.js"></script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
  <script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
      <style type="text/css">
    #color-switcher{
      position:fixed;
      background:#272930;
      padding:10px;
      top:50%;
      right:0;
      margin-right:-109px;
    }
    
    #color-switcher .toggle{
      cursor:pointer;
      font-size:15px;
      color: #FFF;
      display:block;
      position:absolute;
      padding:4px 10px;
      background:#272930;
      width:25px;
      height:30px;
      left:-24px;
      top:22px;
    }
    
    #color-switcher p{color: rgba(255, 255, 255, 0.6);font-size:12px;margin-bottom:3px;}
    #color-switcher .palette{padding:1px;}
    #color-switcher .color{width:15px;height:15px;display:inline-block;cursor:pointer;}
    #color-switcher .color.purple{background:#7761A7;}
    #color-switcher .color.green{background:#19B698;}
    #color-switcher .color.red{background:#EA6153;}
    #color-switcher .color.blue{background:#54ADE9;}
    #color-switcher .color.orange{background:#FB7849;}
    #color-switcher .color.prusia{background:#476077;}
    #color-switcher .color.yellow{background:#fec35d;}
    #color-switcher .color.pink{background:#ea6c9c;}
    #color-switcher .color.brown{background:#9d6835;}
    #color-switcher .color.gray{background:#afb5b8;}
 </style>
  <div id="color-switcher">
    <p>Select Color</p>
    <div class="palette">
      <div class="color purple" data-color="purple"></div>
      <div class="color green" data-color="green"></div>
      <div class="color red" data-color="red"></div>
      <div class="color blue" data-color="blue"></div>
      <div class="color orange" data-color="orange"></div>
    </div>
    <div class="palette">
      <div class="color prusia" data-color="prusia"></div>
      <div class="color yellow" data-color="yellow"></div>
      <div class="color pink" data-color="pink"></div>
      <div class="color brown" data-color="brown"></div>
      <div class="color gray" data-color="gray"></div>
    </div>
    <div class="toggle"><i class="fa fa-angle-left"></i></div>
  </div>

  <script type="text/javascript">
    var link = $('link[href="css/style.css"]');
    
    if($.cookie("css")) {
      link.attr("href",'css/skin-' + $.cookie("css") + '.css');
    }
    
    $(function(){
      $("#color-switcher .toggle").click(function(){
        var s = $(this).parent();
        if(s.hasClass("open")){
          s.animate({'margin-right':'-109px'},400).toggleClass("open");
        }else{
          s.animate({'margin-right':'0'},400).toggleClass("open");
        }
      });
      
      $("#color-switcher .color").click(function(){
        var color = $(this).data("color");
        $("body").fadeOut(function(){
          //link.attr('href','css/skin-' + color + '.css');
          $.cookie("css", color, {expires: 365, path: '/'});
          window.location.href = "";
          $(this).fadeIn("slow");
        });
      });
    });
  </script>   <script src="js/jquery.codemirror/lib/codemirror.js"></script>
  <script src="js/jquery.codemirror/mode/xml/xml.js"></script>
  <script src="js/jquery.codemirror/mode/css/css.js"></script>
  <script src="js/jquery.codemirror/mode/htmlmixed/htmlmixed.js"></script>
  <script src="js/jquery.codemirror/addon/edit/matchbrackets.js"></script>
  <script src="js/jquery.vectormaps/jquery-jvectormap-1.2.2.min.js"></script>
  <script src="js/jquery.vectormaps/maps/jquery-jvectormap-world-mill-en.js"></script>
  <script src="js/behaviour/dashboard.js"></script>
  
  
<script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
</body>
</html>
