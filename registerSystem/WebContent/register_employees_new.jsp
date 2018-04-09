<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/whole.css"> 
<script src="js/Bubbles.js"></script>
<script>
var MAX = 5;
var i = 0;

function Demo()
{
	CreateBubble();

	if(++i < MAX)
		setTimeout(Demo, 1000);
}
</script>
<script type="text/javascript">
//打开弹出框
function showModle(){
	console.log("打开弹出框");
	username();
	$('#myModalLoading').modal('show');
}

function closeAndReturn(){
	 window.location.href="register_top.jsp";
}
function pass(){
	var password = document.getElementById("Password").value;
	var VPassword = document.getElementById("VPassword").value;
	var macAddress = document.getElementById("macAddress").value;
	if (password!=VPassword || password=="") {
		alert("两次密码不匹配！或者密码不能为空");
		document.getElementById("VPassword").value ="";
		Demo();
	} else {
		var code = document.getElementById("Code").value;
		var role = document.getElementById("role").value;
		window.location.href="register.do?code="+code+"&password="+password+"&role="+role+"&mac="+macAddress+"";
	}
}
function username(){
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4){
			var username = xmlhttp.responseText;
			document.getElementById("Code").value = ""+username+"" ;
			
		}
		
	};
	xmlhttp.open("post","ajaxUser.do",true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send("");
}
function showMac(id){
	var mac = document.getElementById("mac");
	if(id ==3){
		
		mac.style.display = "block";
	}else{
		
		mac.style.display = "none";
	}
	
}
</script>
<style>
	*{
		font-family: '微软雅黑';
		color:#333;
	}
	div#wrapper{
		border-radius:10px;
		width:500px;
		height:460px;
		background-color: #f2f2f2;
		position: absolute;
		top:50%;
		margin-top:-230px;
		left:30%;
		margin-left:-250px;	
		text-align: center;	
		font-size:16px;
	}
	#img-wrapper:hover{
	   transform: scale(1.4);  
	}
	#img-wrapper{
		
		cursor: pointer;  
        transition: all 0.6s;  
		
	}
	img{
		width:40px;
		height:40px;
		position:relative;
		top:45px;
		left:-60px;
		margin-right:20px;
		vertical-align: bottom;
	}
	div#img-wrapper{
		
	}
	tr{display:block; 
		margin-top:20px;
		}
	td{
		width:200px;
		
	}
	#queren{
		margin-left: 180px;
	}
</style>

</head>
<body onload="showModle()">

<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							注册员工
						</h4>
					</div>
					<div class="modal-body">	
						 <form method="post"  >
       		<table cellpadding="10" cellspacing="20" align="center"> 
       			<tr>
       				<td>账号:</td>
       				<td><input type="text" name="code" id="Code"  readonly="readonly"/></td>
       			</tr>
       			<tr>
       				<td>密码:</td>
       				<td><input type="password" name="password" id="Password" /></td>
       			</tr>
       			<tr>
       				<td>确认密码:</td>
       				<td><input type="password" id="VPassword" /></td>
       			</tr>
       			<tr>
       				<td>角色:</td>
       				<td>
       					<select name="role" id="role" onchange="showMac(this.value)">
				         	<option value="1">老师</option>
				         	<option value="4">管理员</option>
				         	<option value="3">项目组成员</option>
			         	</select>
			         </td>
       			</tr>
       			<tr id="mac" style="display: none">
       				<td>MAC地址:</td>
       				<td><input type="text" name="macAddress" id="macAddress" /></td>
       			</tr>
       			<tr>
       				<td colspan="2">
       					<input type="button" id="queren"  value="确认"  onclick="pass()"/>
			         </td>
       			</tr>
       		</table>
       </form>
					</div>
				</div>
			</div>
		</div>

</body>
</html>