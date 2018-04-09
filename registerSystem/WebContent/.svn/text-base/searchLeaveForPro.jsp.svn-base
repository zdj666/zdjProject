<%@page import="com.hzyc.registerSystem.po.LeaveThing"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/layui.css" media="all">
 <script src="js/layui.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假信息</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">
<style type="text/css">
	<style type="text/css">
	.downDiv1{
		width: 100%;
		text-align: center;
		
	}
	.title{
		text-align: center;
	}

</style>
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

function div(){
	
	<%
	List<LeaveThing> tList = (List<LeaveThing>)request.getAttribute("tList");
	if(tList.size() <= 0){
	%>
	showModle();
	<% 		
	}

	%>
	
	
}
</script>


</head>
<body onload="div()">


	<div class="resultdiv">
		<span class="resultspan">请假记录</span>
	</div>
	<div class="downDiv1">
	<table class="layui-table" style="width:1000px;margin-left: 50px;">
		 <thead>
					<tr>
						
						<th>姓名</th>
						<th>请假时间</th>
						<th>请假类型</th>
						<th>请假原因</th>
						<th>操作</th>
					
					</tr>
		</thead>
		<tbody>
		
					<c:forEach items="${tList}" var="tList">
						<tr>
							
							<td>${tList.name }</td>
							<td>${tList.time }</td>
							<td>${tList.type }</td>
							<td>${tList.reason }</td>
							<td>
							
								<a href="deleteLeave.do?id=${tList.id}"><font color="green">删除</font></a>|
								<a href="selectLeaveById.do?id=${tList.id}"><font color="green">修改</font></a>
							</td>
							
							
						
						</tr>
					
					</c:forEach>
					
				</tbody>
				</table><br /><br />
				

</div>

<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						查询请假信息!
					</h4>
				</div>
				<div class="modal-body">
					没有请假信息！
				</div>
			</div>
		</div>
	</div>
</body>
</html>