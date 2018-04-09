<%@page import="com.hzyc.registerSystem.po.Grade"%>
<%@page import="java.util.List"%>
<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>班级管理界面</title>
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
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="./css/layui.css" media="all">
<script src="./js/jquery-1.8.3.min.js" charset="utf-8"></script>
<script src="./js/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/whole.css">
<script type="text/javascript">
function insertClass(){   window.location.href="insert_class.do";}
function init(){

	//1. 创建XMLHttpRequest
	var request = new XMLHttpRequest();
	//2. 设置监听
	request.onreadystatechange = function (){
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
			//接收返回字符串
			var data = request.responseText;
			//转换成数组
			var dataarr = eval("("+data+")");
			var classIdSelect = document.getElementById("classId");
			//对于老师登录useSize一定是1
			var userSize =  dataarr.length;
			//默认追加请选择选项
			var qingxuanzeOption = document.createElement("option");	
			qingxuanzeOption.innerText="请选择";			
			classIdSelect.appendChild(qingxuanzeOption);
			//追加班级名称给下拉框
			var gradeSize = dataarr[0].gList.length;
			for(var n=0;n<gradeSize;n++){
				var option = document.createElement("option");	
				option.innerText=dataarr[0].gList[n].classId;
				//alert("classId=="+ dataarr[0].gList[n].classId);
				classIdSelect.appendChild(option);
			}
		}
		
	};
	//3. 打开通道
    request.open("post", "queryGradeAndUsersByUserId.do", true);
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("");
	
}

	
</script>
 <!-- Bootstrap core CSS --> 
</head> 
<body onload="init()"> 
<div class="totalDiv">
<div class="resultdiv">
	<span class="resultspan">班级管理</span>
		<span class="resultspan">查询条件</span>
</div> 

<form action="selectGradeByTwo2.do" method="post" target="bottom" >
     <div style="margin-left: 150px">
       <div style="margin-top: 30px;font-size: 17px;">
                 <div style="float: left;margin-left: 10px;"> 班级：<select id="classId" name="classId"></select></div>  
                 <div style="float: left;margin-left: 25px;"> 课程类型：<ex:sex  message="ClassTypeName"/></div>
                 <div style="float: left;margin-left: 35px;margin-top: 8px"> <input class="btn btn-primary" type="submit" value="确认" /></div>
                 <div style="float: left;margin-left: 15px;margin-top: 8px"><input type="button" class="btn btn-primary" onclick="insertClass()" value="开班  "></div>
       </div>
     </div>
 
</form>
</div>  
   
 

  <div style="display:none;" id="TiaoVal"><%=request.getAttribute("TiaoVal")%></div>
   
  <div class="downDiv">
			<iframe src="classFrame.jsp" name="bottom" width="100%" height="480px"></iframe>		
  </div>
</body>

</html>