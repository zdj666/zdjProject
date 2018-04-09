<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">
<link rel="stylesheet" href="css/layui.css" media="all">
 <script src="js/layui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你想给项目组请假吗？</title>

<style type="text/css">
	.downDiv1{
		width: 100%;
		text-align: center;
	}

</style>
</head>

<body>
	<div class="resultdiv">
		<span class="resultspan">查询结果</span>
	</div>
<div class="downDiv1">
	<table class="layui-table" style="width:1150px;">
		<thead>
					<tr>
						<th>账号</th>
						<th>姓名</th>
						<th>学校</th>
						<th>专业</th>
						<th>邮箱</th>
						<th>联系方式</th>
						<th>操作</th>
					
					</tr>
		</thead>
					<c:forEach items="${uList}" var="users">
						<tr>
							<td>${users.code }</td>
							<td>${users.name }</td>
							<td>${users.school }</td>
							<td>${users.major }</td>
							<td>${users.email }</td>
							<td>${users.phone }</td>
							<td><a href="isLeaveForPro.jsp?name=${users.name}&id=${users.id}">请假</a></td>
							
							
						
						</tr>
					
					</c:forEach>
				
				</table>

</div>
</body>

</html>