<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/whole.css"> 
<title>登录界面</title>
 
<script type="text/javascript">

/* 	function img(){
		
		alert("一猜你就想点！");
		alert("然而并没有什么功能！");
	}
	 */
</script>
<script type="text/javascript">

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
		window.location.href="register.do?code="+code+"&password="+password+"&role=3&mac="+macAddress+"";
	}
}

</script>

<script type="text/javascript">

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

<body style="background-color: #f2f2f2" onload="username()" >
	<h3 style="margin-left:30px;">项目组成员注册</h3>
     <div id="wrapper">
     <div id="img-wrapper"><img src="images/hzyc.png" onclick="img()"/><h2 onclick="img()">注册</h2></div>
       
       <form  method="post"  >
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
       				<td  ><input type="text" id="role" name="role" value="项目组组员" disabled/></td>
       			</tr>
       			<tr>
       				<td>MAC地址:</td>
       				<td  ><input type="text" name="macAddress" id="macAddress" /></td>
       			</tr>
       			<tr>
       				<td colspan="2">
       					<input type="button" id="queren"  value="确认"  onclick="pass()"/>
			         </td>
       			</tr>
       		</table>
       </form>
   		</div>
</body>
</html>