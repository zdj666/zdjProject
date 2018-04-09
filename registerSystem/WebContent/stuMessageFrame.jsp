<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="com.hzyc.registerSystem.po.Users"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="css/whole.css">
<style type="text/css">
td  
{  
    text-align:center;  
} 
</style>
<script type="text/javascript">
   
function delayURL() { 
    var delay = document.getElementById("time").innerHTML;
    var t = setTimeout("delayURL()", 1000);
    if (delay > 0) {
        delay--;
        document.getElementById("time").innerHTML = delay;
    } else {
        clearTimeout(t); 
        window.location.href = "queryStuMessageAll.do";
    }        
} 
function del(i){
	//1. 创建XMLHttpRequest
	var request = new XMLHttpRequest();
	//2. 设置监听
	
	request.onreadystatechange = function (){
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
			$('#myModalLoading').modal('show');
			delayURL();
		}
	};
	//3. 打开通道
	request.open("post", "deleteStuMessageByID.do", true);
	alert("1111");
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("id=" + i);
	
}

//打开弹出框
function showModle(){
	console.log("打开弹出框");
	$('#myModalLoading').modal('show');
}
function closeAndReturn(){
	   $('#myModalLoading').modal('hide');
}

</script>
</head>
<body >
     <div style="display:none;" id="getTiao"><%=request.getAttribute("getTiao")%></div>
<div class="resultdiv">
	<span class="resultspan">查询结果</span>
</div>

<form action=""  id="formId">
     <table  class="table table-bordered table-hover" style="width: 85%;" >
    	<thead>
     	<tr style="font-weight: bold; " >
    		<td>姓名</td>
    		<td>Mac</td>
    		<td>班级</td> 
    		<td>操作</td>  		 
    	</tr>
     </thead>	
     	
    	 <% 
        List<Users> gList = (List)request.getAttribute("list");
        if(gList !=null && gList.size()!=0){
			for(int i=0;i<gList.size();i++){
				
        %>		
    	
    	<%-- <c:forEach items="${list}" var="list"> --%>
    
    	<tr  id="tr">     		
    		<td><%=gList.get(i).getName()%></td>
    		<td><%=gList.get(i).getMac()%></td>  		
    		<td><%=gList.get(i).getClassId()%></td>    		
    		<td>
    		<a href="updateStuMessageByID.do?id=<%=gList.get(i).getId()%>">查看详情</a> |
    		<a href="javascript:void(0);" onclick="del('<%=gList.get(i).getId()%>')">删除</a><br/>
    		</td>
    		</tr>  
    	  <%
        }
        }else{
        
        %>
        	<td colspan="11" style="font-size:20px;text-align:center">暂时没有查询出来的学员</td>
        	<%
       		 }
        %>	 		 

    </table>
    </form>
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
					<div class="modal-body" >
					
						<div style="text-align:center;">操作成功！</div><br/>
						<span id="time" style="text-align: left;">5</span>秒之后跳转页面
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAndReturn()">确定</button>
					</div>
				</div>
			</div>
		</div>  
</html>