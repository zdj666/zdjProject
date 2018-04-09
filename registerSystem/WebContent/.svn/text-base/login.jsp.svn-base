<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录</title>
<link rel="stylesheet" href="css/login.css">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    
<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/style-updateCalendar.css" rel="stylesheet">
<link href="assets/css/jquery-ui.css" rel="stylesheet">
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="assets/js/fullcalendar/fullcalendar.min.js"></script>    
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
<script src="js/index.js"></script>
	   <script type="text/javascript">
	   
		//打开弹出框
		function showModle(){
			console.log("打开弹出框");
			$('#myModalLoading').modal('show');
		}
		//关闭弹出框
		function hideModel(){
			//关闭弹出框
			$('#myModalLoading').modal('hide');
		}
	   document.onkeydown=keyListener;
	   function keyListener(e){
	    if(e.keyCode == 13){
	    	login();
	    }
	   }
  		function register(){
   			window.location.href="stuRegister.jsp";
   		}
		function getXMLHttpRequest() {
			var xmlReq;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlReq = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlReq;
		}
   		function login(){
   			var code = document.getElementById("code").value;
   			var password = document.getElementById("password").value;
			var oReq = getXMLHttpRequest();
			oReq.open("POST", "login.do", true);
			oReq.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //提交表单必须
			oReq.send("code="+code+"&password="+password);
			oReq.onreadystatechange = function() {
				if (oReq.readyState == 4) {				
					var flag = oReq.responseText;
					if(flag =="true"){
						window.location.href="sureUser.do";
					}else{
						showModle();
					}
				}
			}
   		}
   		function returnLogin(){
   			document.getElementById("div1").style.display="none";
			document.getElementById("body").style.display="none";
   		}
	   </script>
<style type="text/css">
	body{
		background-size:100%;
		background-image:url(img/po.jpg);
		background-repeat:no-repeat;
	}
	#div1{
		width:600px;
		height:400px;
		z-index:99;
		position:absolute;
		left:50%;top:50%;
		margin-left:-250px;
		margin-top:-190px;
		background:#fff;
		border-radius:15px;
		display:none;
	}
</style>
</head>

<body onload="cambiar_login()">
<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
          </div>
        </div>

      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="img/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"><img src="img/po.jpg" alt="" /> </div>
        <div class="cont_form_login">
          <h2>合众易成签到系统</h2>
          <input type="text" id="code" name="code" placeholder="账号" />
          <input type="password" id="password" name="password" placeholder="密码" />
          <button class="btn_login" onClick="login()">登录</button>
		  <button class="btn_login" onClick="register()">注册</button>
        </div>
        <div class="cont_form_sign_up">
        </div>
      </div>
    </div>
  </div>
</div>
			<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							登录报错信息
						</h4>
					</div>
					<div class="modal-body">
						账号名或密码或验证码有误或等待审核
					</div>
					<div class="modal-footer">
						<a href="RetrievePassword.jsp"	target="_blank" style="cursor: pointer;">找回密码</a>
					</div>
				</div>
			</div>
		</div>
<div style="text-align:center;">
</div>
</body>
</html>