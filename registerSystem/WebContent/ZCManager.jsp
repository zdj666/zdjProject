<%@page import="com.hzyc.registerSystem.po.Dictionary"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据字典管理</title>
 
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
  

<script type="text/javascript">
		
		
		function hideModel(){
			//关闭弹出框
			$('#myModal').modal('hide');
		}
		
		function showModle(){
			console.log("打开弹出框");
			$('#myModalLoading').modal('show');
		}
		//关闭弹出框
		function hideModel(){
			//关闭弹出框
			$('#myModalLoading').modal('hide');
		}
		
		
		function setStautes(){
			
			
				showModle();
			
		}
		

	
		
</script>

<style type="text/css">
.arrow {
    width:0;
    height:0;
    font-size:0;
    border:solid 10px;
     
border-color
:#f00 #0f0 #00f #000;
}

</style>

</head>
<body onload="init()" style="background:#f0f0f0;">
		
		
		
		<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							选择错误：
						</h4>
					</div>
					<div class="modal-body">
						请选择一个数据类型！！！
					</div>
					
				</div>
			</div>
		</div>
	
		<div style="background:#f0f0f0;width:1000px;height:550px;position:absolute;margin-left:50px;margin-top:0px;" >
						
						
						
						<div onclick="setStautes()">666666</div>
						
						
						
						<p class="arrow"></p>
						<div style="width:500px;height:80px;">
						<div style="width:150px;height:30px;position:absolute;margin-left:20px;margin-top:10px;background:#e0e0e0"></div>
						<div style="width:30px;height:30px;position:absolute;margin-left:170px;margin-top:10px;font-size:0;border:solid 15px;border-color:#fff #fff #fff #e0e0e0;"></div>	
						</div>
						
						
			
		</div>
		
		

		
<script src="assets/js/jquery.js"></script>  
<script src="assets/js/bootstrap.min.js"></script>







</body>
</html>