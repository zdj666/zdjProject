<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@page import="com.hzyc.registerSystem.po.Permission"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% List<Permission> pList = (List)request.getAttribute("pList"); %>
<% Users user = (Users)request.getAttribute("user"); %>
<html lang="en">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>合众易成签到网站</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
     <link rel="stylesheet" href="css/whole.css"> 
	<style>
		
	</style>
	<script type="text/javascript">
		function onload(){
			document.getElementById("click0").click();
			$("#toggleId").click(function(){
				var ml = $("#sidebar").css("margin-left");
				console.log("##"+ml);
				if(ml=="0px"){
					ml="210px";
				}else{
					ml="0px";
				}
				$("iframe").css("margin-left",ml);
			});
		}
		function destorySession(){
			window.location.href='destorySessionclue.do';
		}
	</script>
  </head>

  <body onload="onload()">

  <section id="container" >
     
      <header class="header black-bg">
              <div class="sidebar-toggle-box" id="toggleId">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="收起菜单" ></div>
              </div>
            <!--logo start-->
            <a class="logo"><b>欢迎来到合众易成签到系统</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li>
                	   <!--  <a class="logout" href="javascript:if(confirm('确认注销登录?')) window.location.href='destorySession.do'">注销</a> -->
                    	<input type="button" class="btn btn-primary" value="注销" style="margin-top:20px;" onclick="destorySession()"/>
                    </li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              	  <p class="centered"><img src="photo/${user.pictureName}" class="img-circle" id="userImg" width="60"/></p>
              	    <%if(user.getName()==null || user.getName().equals("")){%>
              	    <h5 class="centered" id="userName"> 暂无姓名</h5>
              	    <%}else{ %>
             		<h5 class="centered" id="userName"><%=user.getName() %></h5>
              	    <%} %>
				<%	for(int i = 0;i<pList.size();i++){
					%>
					  <li class="sub-menu">
                      <a id="click<%=i %>" href="<%=pList.get(i).getResourcePath() %>" target="mainContent">
                          <i class="fa fa-desktop"></i>
                          <span style="font-size:17px"><%=pList.get(i).getMenuBar() %></span>
                      </a>
                     <!--  <ul class="sub">
                          <li><a  href="new.html">General</a></li>
                          <li><a  href="buttons.html">Buttons</a></li>
                          <li><a  href="panels.html">Panels</a></li>
                      </ul> -->
                  </li>

				<% }%>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <iframe name="mainContent" src="" style="float:left;margin-top:60px;margin-left:210px;;width:100%;height:680px;max-width:100%;">
	  </iframe>

      
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
	
<!-- 	<script type="text/javascript">
		
		$('.dropdown-toggle').dropdown();
        $(document).ready(function () {
		//çæå¬å
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to HZYC!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: 'assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script> -->
  

  </body>
</html>