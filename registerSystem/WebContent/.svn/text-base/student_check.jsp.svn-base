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
	function tongyi(x){
		var formId = document.getElementById("formId");
		formId.action = "accept.do?id="+x;
		formId.submit();
	}
	function deny(x){
		var formId = document.getElementById("formId");
		formId.action = "deny.do?id="+x;
		formId.submit();
	}
	
	function allSelForUserForShenHe(){
		
		var isFirst = document.getElementById("isFirst");
		if(isFirst.value == 1){
		
			var myForm = document.getElementById("myForm");
			myForm.submit();
		}
		
	}
</script>
</head>
<body onload="allSelForUserForShenHe()">
<input type="hidden" value="<%=(String)request.getAttribute("isFirst")%>" id="isFirst"/>
<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">查询条件</span>
	</div>
	<form id="myForm" action="student_checkForSel.do" enctype="application/x-www-form-urlencoded" method="post" target="studentCheckFrame">
			<div class="tiaojianDiv">
	
		<div class="firstRowDiv"><span style="padding-left:40px;font-size:15px;">姓名：</span><input type="text" style="border: 1px solid #ccc;
		border-radius: 4px;background-color: #f2f2f2;height: 34px;margin-top:5px" name="name"/>
		<span style="padding-left:40px;font-size:15px;">审核状态：</span>
		<select	style="border: 1px solid #ccc;
		border-radius: 4px;background-color: #f2f2f2;height: 34px;margin-top:5px" name="remark">
		<option>请选择</option>
		<option value="已审核">已审核</option>
		<option value="未审核">未审核</option>
		</select>
			<span style="padding-left:160px;"></span><input class="btn btn-primary"  type="submit" value="查询" />
		</div>
	
	</div>
	
	</form>

</div>	
	<div>
		<iframe src="student_check_frame.jsp" name="studentCheckFrame" width="100%" height="400px">
		</iframe>
	</div>
</body>
</html>