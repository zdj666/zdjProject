<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.hzyc.registerSystem.po.Users"%>
<%@page import="java.util.List"%>
 <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假管理</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">
<style type="text/css">
	
	.upDiv{
		width: 1150px;
		height: 100px;
		
		
		
	}
	.downDiv{
		width: 100%;
		text-align: center;
		
	}
	input{
		height: 25px;
	}
	.title{
		text-align: center;
	}
</style>
<script type="text/javascript">
function searchLeave(){ 
	document.location.href="searchLeave.do";
}
</script>
</head>

<body>
<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">查询条件</span>
	</div>
	<div style="margin-top:30px;">
		<div class="title">
			
			<div style="float:right;margin-right:400px;margin-top:7px;">
					<input type="button" value="查询请假记录" onclick="searchLeave()" style="width:150px;height:35px;" class="btn btn-primary"/>
			</div>
		</div>
		
		<div class="upDiv">
		
			<div style="text-align: center;margin:0 auto;">
				<div style="float:left;margin-left:180px;width:200px;margin-top:3px">
				<form action="selectStuByClass.do" method="post" target="bottom">
				<font size="5" style="position:absolute;margin-left: -180px;">查询:</font>
					<span style="" ><ex:sex message="ClassName"/> </span>
					<input type="text" id ="dimSelect" maxlength="30"  name="dimSelect" placeholder="学员信息" style="position:absolute;margin-top:-34px;margin-left:140px;background:#f2f2f2; width:200px;height:35px;"/>
					
					<input type="submit" style="position:absolute;margin-top:-34px;margin-left:380px;height:35px;" value="确定" class="btn btn-primary"/>
					
				</form>
				</div>
				
			</div>
		</div>
	
	</div>
</div>		
		<div class="downDiv">
			<iframe src="iframe.jsp" name="bottom" width="100%" height="480px">
			</iframe>
			
		</div>
		
		</body>
</html>