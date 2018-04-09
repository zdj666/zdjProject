<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java"%> 
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人信息显示及签到</title>
<link rel="stylesheet" type="text/css" href="css/style.stuRegister.css">

<script type="text/javascript">
		function init(){
			var getSureShow=document.getElementById("getSureShow").innerHTML;
			
			if(getSureShow=="2"){
				
				
			}else{
				
				/*添加一块DIV*/
				document.getElementById("zhuanyeName").value="";
				document.getElementById("zhuanyeName").disabled=true;
				
				document.getElementById("SchooleName").value="";
				document.getElementById("SchooleName").disabled=true;
			
			}
			
		}
	
	
	
	</script>

<style type="text/css">


	input[type="text"]{
		margin-left: 30px;
	}


</style>
</head>
<body >

	<div id="getSureShow" class="display:none;"><%=request.getAttribute("getSureShow")%></div>
<div class="max-div">
<!-- background-color:blue; -->										  
	<h1 style="color:#ffffff;font-size:40px;" align="center"> 个人基本信息 </h1>
	<div style="width:1400px;height:150px;float:left;">
		<div style="width:350px;height:150px;float:left;"></div>
		<div style="width:280px;height:150px;float:left;">
			<img src="photo/${stuUsersInfo.pictureName}" height="130" width="130" /><br/><br/>	
		</div>
		<div style="width:500px;height:150px;float: left;">
												   	
			用户账号:<input type="text" name="code" value="${stuUsersInfo.code}" readonly="readonly"/>
		</div>
	</div>
	<div>
	<div style="width:250px;height:150px;float:left;"></div>
	<div style="width:850px;height:150px;float:left;"> 
	          用户姓名:<input type="text" name="name" value="${stuUsersInfo.name}"readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;		
		身份证号:<input type="text" name="idNumber" value="${stuUsersInfo.idNumber}"readonly="readonly"/><br/>
		用户电话:<input type="text" name="phone" value="${stuUsersInfo.phone}"readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;
		用户邮箱:<input type="text" name="email" value="${stuUsersInfo.email}"readonly="readonly"/><br/>
		家庭地址:<input type="text" name="address" value="${stuUsersInfo.address}"readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;
		班级编号:<input type="text" name="class" value="${stuUsersInfo.classId}"readonly="readonly"/><br/><br/>	
		学校名称:<input type="text" id="SchooleName" name="school" value="${stuUsersInfo.school}"readonly="readonly"/>
		专业名称:<input type="text" id="major" id="zhuanyeName" name="major" value="${stuUsersInfo.major}"readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;											
		

		</div>
		
	</div>

		
</div>					 	
</body>
</html>