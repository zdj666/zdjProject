<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息修改页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/whole.css" media="all">
<link rel="stylesheet" href="css/layui.css" media="all">

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
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">  
<script type="text/javascript">
//打开弹出框
function showModle(){
	console.log("打开弹出框");
	$('#myModalLoading').modal('show');
}
function closeAndReturn(){
	   $('#myModalLoading').modal('hide');
	   document.getElementById("formId").submit();
}

</script>
  </head>
  
  <body >
  <%
 	Users user = (Users)request.getAttribute("user");
  %>
   <div class="resultdiv">
		<span class="resultspan">查询结果</span>
	</div>
	<div  style="text-align:center;width: 82%">
   <form id="formId"  action="updateStuMessageByIDForInsert.do" method="post" >
  
  <div style="margin:0 auto;height: 1000px ;margin-top: 20px ;margin-left: 20px" >
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 账号：</span><input type="text" name="code" readonly="readonly" value="${user.code}"/>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 姓名：</span><input type="text" name="name" value="${user.name}"/></br>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 电话：</span><input type="text" name="phone"value="${user.phone}"/>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 邮箱：</span><input type="text" name="email" value="${user.email}"/></br>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 家庭住址：</span><input type="text" name="address" value="${user.address}"/>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 学校：</span><input type="text" name="school" value="${user.school}"/></br>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> 专业：</span><input type="text" name="major" value="${user.major}"/>
  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px"> mac：</span><input type="text" name="mac" value="${user.mac}"/></br>

  <span style="display:inline-block;width:80px;text-align:right;margin-top: 20px">  <input type="button" value="修改" onclick="showModle()"/></span>
  </div>
  <div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示信息
						</h4>
					</div>
					<div class="modal-body">
						修改成功！
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAndReturn()">确定</button>
					</div>
				</div>
			</div>
		</div>  
    </form>
    </div>
  </body>
</html>
