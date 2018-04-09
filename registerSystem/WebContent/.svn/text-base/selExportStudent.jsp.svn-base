<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">
<link rel="stylesheet" href="css/layui.css" media="all">
 <script src="js/layui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>要导出的学员信息</title>

<style type="text/css">
	.downDiv1{
		width: 100%;
		text-align: center;
		
	}

</style>
<script type="text/javascript">
	function outStudent(){
		
		var getClassId = document.getElementById("getClassId").innerHTML;
		
		var sign = document.getElementById("sign").innerHTML;
		
		if(sign == 1){
			document.location.href="stuExcelOutByClass.do?classId="+getClassId;
		}else if(sign == 2){
			document.location.href="stuExcelOut.do";
		}else{
			alert("请先选择导出方式");
		}
		
	}
	function loadButtonDiv(){
		document.getElementById("buttonDiv").style.display = "none";
		var sign = document.getElementById("sign").innerHTML;
		if(sign == 1 || sign ==2){
			document.getElementById("buttonDiv").style.display = "block";
		}
	}
</script>

</head>
<body onload="loadButtonDiv()">

<div style="display: none;">
<font color="red" id="sign"><%=request.getAttribute("sign")%></font>
<font color="green" id="getClassId"><%=request.getParameter("classId")%>
</font>
</div>
<div class="resultdiv">
		<span class="resultspan">导出学员信息</span>
	</div>
	<div id="buttonDiv" style="margin-left: 50px;margin-top:10px;">
				你要导出以下学员信息吗？&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="确定导出" onclick="outStudent()" class="btn btn-primary"/>
		</div>
	<div class="downDiv1">
	<table class="layui-table" style="width:1150px;">
		<thead>
					<tr>
						<th>账号</th>
						<th>姓名</th>
						<th>班级</th>
						<th>学校</th>
						<th>专业</th>
						<th>联系方式</th>
						<th>邮箱</th>
						<th>密码</th>
					
					</tr>
		</thead>
					<c:forEach items="${allList}" var="users">
						<tr>
							<td>${users.code }</td>
							<td>${users.name }</td>
							<td>${users.classId}</td>
							<td>${users.school }</td>
							<td>${users.major }</td>
							<td>${users.phone }</td>
							<td>${users.email }</td>
							<td>${users.password }</td>
							
						
						</tr>
					
					</c:forEach>
				
				</table>
		
</div>
</body>
</html>