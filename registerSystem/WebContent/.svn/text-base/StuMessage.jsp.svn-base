<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息查询页面</title>
    <link rel="stylesheet" href="css/layui.css" media="all">
    <link rel="stylesheet" href="css/whole.css" media="all">   
 	<script src="js/layui.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body> 
<div class="totalDiv">
	<div class="resultdiv">
	<span class="resultspan">学生信息管理</span>
		<span class="resultspan">查询条件</span>
	</div>

     <form action="queryStuMessageByClassID.do" method="post" target="bottom">

		      <div style="margin-left: 200px;margin-top: 33px;font-size: 17px;">
		         <div style="float: left;">班级：<ex:sex message="ClassName"/></div>
                 <div style="float: left;margin-left: 50px">学校：<ex:sex  message="SchoolName" /></div>
                 <div style="float: left;margin-left: 80px;margin-top: 7px"><input class="btn btn-primary" type="submit" value="确认" /></div>
             </div>
             
      
     </form>
  	
  	  
</div>  	  
    <div class="downDiv">
			<iframe src="stuMessageFrame.jsp" name="bottom" width="100%" height="480px">
	        </iframe>
			
	</div>
  </body>
</html>