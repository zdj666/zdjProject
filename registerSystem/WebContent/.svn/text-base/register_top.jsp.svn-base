<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@page import="java.util.List"%>
     <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%List<Users> uList = (List)request.getAttribute("uList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" href="css/layui.css" media="all">
 <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
 <link rel="stylesheet" href="css/whole.css"> 
 <script src="js/layui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function allSelForUserForShenHe(){
		sel();
		var isFirst = document.getElementById("isFirst");
		if(isFirst.value == 1){
		
			var myForm = document.getElementById("myForm");
			myForm.submit();
		}
	}
	function register(){
		window.location.href="registerEmployees.do";
	}
	function sel(){
		document.getElementById("myForm").submit();
	}
</script>
</head>
<body onload="allSelForUserForShenHe()">
<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">查询条件</span>
	</div>
	<form id="myForm" action="selEmployees.do" enctype="application/x-www-form-urlencoded" method="post" target="registerBottom">
			<div class="tiaojianDiv">
	
		<div class="firstRowDiv"><span style="padding-left:40px;font-size:15px;">姓名：</span><input type="text" style="border: 1px solid #ccc;
		border-radius: 4px;background-color: #f2f2f2;height: 34px;margin-top:5px" name="name"/>
		<span style="padding-left:40px;font-size:15px;">身份：</span>
		<select	style="border: 1px solid #ccc;
		border-radius: 4px;background-color: #f2f2f2;height: 34px;margin-top:5px" name="remark">
		<option>请选择</option>
		<option value="1">老师</option>
		<option value="2">学生</option>
		<option value="4">管理员</option>
		<option value="3">项目组组员</option>
		</select>
			<span style="padding-left:160px;"></span><input type="submit" value="查询" class="btn btn-primary" onclick="sel()"/>
			<span style="padding-left:160px;"></span><input type="button" class="btn btn-primary" onclick="register()" value="注册员工" />
		</div>
	
	</div>
	
	</form>

</div>	
	<div>
		<iframe src="register_bottom.jsp" name="registerBottom" width="100%" height="600px">
		</iframe>
	</div>
</body>
</html>