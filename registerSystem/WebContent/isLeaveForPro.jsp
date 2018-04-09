<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>确定要请假了吗？</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">

<%
String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
String id = new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8");
%>
<style type="text/css">
	.divClass{
		width: 100%;
		height:100%;
		text-align: center;
		margin-top: 10px;
		
	}
	.reason{
		width: 300px;
		height: 60px;
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
function isDateTime(){
	
	var dateTime = document.getElementById("dateTime").value;
	
	if(dateTime == ""){
		
		showModle();
	}else{
		document.getElementById("formId").submit();
	}
}
</script>
</head>
<body>
<div class="resultdiv">
		<span class="resultspan">确认请假</span>
	</div>
<div class="divClass">
	 <form id="formId" action="isLeaveForPro.do" method="post">
		<input type="text" name="userId" value="<%=id %>" style="display: none;"/>
		姓  &nbsp;&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;<input type="text" name="name" value="<%=name %>" readonly="readonly" style="width: 200px;height: 30px;"/><br /><br /><br />
		请假时间：<input type="date" name="time" id="dateTime" style="width: 200px;height: 30px;"/><br /><br /><br />
		 请假类型：<select name="type" style="width: 200px;height: 40px;">
		
					<option>事假</option>
					<option>病假</option>
					<option>公假</option>
				</select><br /><br /><br />
		 请假原因：<textarea rows="4" cols="40" name="reason" placeholder="请简要说明，不超过100字!"></textarea><br /><br /><br />
		
		<input type="button" style="width: 150px;height: 30px;text-align: center;" value="确定" onclick="isDateTime()" class="btn btn-primary"/>
	
	</form>
</div>
<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						确定请假！
					</h4>
				</div>
				<div class="modal-body">
					请填写请假时间！
				</div>
			</div>
		</div>
	</div>
</body>
</html>