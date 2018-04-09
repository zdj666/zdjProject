<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>通过班级查找学生信息</title>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	<link href="assets/css/style-updateCalendar.css" rel="stylesheet">
	<link href="assets/css/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" href="css/whole.css" media="all">   
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript">

</script>
</head>
<body>
<div class="resultdiv">
		<span class="resultspan">查询结果</span>
</div>
<div>

  <table class="table table-bordered table-hover" style="width: 85%"> 
       <tr>
    		<td>姓名</td> 
    		<td>班级</td> 
    		<td>电话</td>
    		<td>身份证号</td>
    		<td>Mac地址</td> 
    		<td>操作</td>
    		  		 
    	</tr>
    	<%
    		List<Users> uList = (List)request.getAttribute("usersItems");
    	if(uList!=null&&uList.size()!=0){
    		for(int i =0;i<uList.size();i++){
    			System.out.println("classID:"+uList.get(i).getClassId());
    		}
    	}
    	%>
    <c:forEach items="${usersItems}" var="users">
    		<tr>
    			<td>${users.name}</td>
    			<td>${users.classId}</td>
    			<td>${users.phone}</td>
    			<td>${users.idNumber}</td>
    			<td>${users.mac}</td>	
    			<td>
    			  <a href="updateStuMessageByID.do?id=${users.id}">查看详情</a>|
    		      <a href="deleteStuMessageByID.do?id=${users.id}">删除</a>
    			</td>	
    		</tr>
    </c:forEach>
    
  
  </table>
  </div>
</body>
</html>