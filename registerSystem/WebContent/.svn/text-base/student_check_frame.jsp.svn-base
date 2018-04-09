<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%List<Users> uList = (List)request.getAttribute("uList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" href="css/layui.css" media="all">
 <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
 <link rel="stylesheet" href="css/whole.css"> 
 <script src="js/layui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function tongyi(x){
		//同意按钮所在的tr
		var tr = document.getElementById("tr" + x);
		
		if(tr.cells[4].innerText != "已审核"){
			var formId = document.getElementById("formId");
			formId.action = "accept.do?id="+x;
			formId.submit();
		}
		
	
	}
	function deny(x){
		var tr = document.getElementById("tr" + x);
		
		if(tr.cells[4].innerText != "已审核"){
			var formId = document.getElementById("formId");
			formId.action = "deny.do?id="+x;
			formId.submit();
		}
		
		
	}
</script>
<style>
	th{
	text-align:center;
	}
</style>
</head>
<body>
<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">查询结果</span>
	</div>
 <form id="formId" method="post" target="_parent"></form>
	<table  class="table table-bordered table-hover"  >
  <thead>
    <tr>
   	  <th>序号</th>
      <th>姓名</th>
      <th>申请时间</th>
      <th>班级</th>
      <th>审核状态</th>
      <th>操作</th>
    </tr> 
  </thead>
  	
  <tbody>
 		 <%if(uList !=null && uList.size()>0){
  		%>
  		<%for(int i = 0;i<uList.size();i++){
		%>
		<tr id="tr<%=uList.get(i).getId()%>">
		<td><%=i+1 %></td>
		<td><%=uList.get(i).getName() %></td>
		<td><%=uList.get(i).getRegisterTime() %></td>
		<td><%=uList.get(i).getClassId() %></td>
			<%if(uList.get(i).getRemark().equals("0")){
			%>
			<td>未审核</td>
		<% 
		}else{
			%>
			<td>已审核</td>
		<% 
		}
		%>
		<td>
		<input class="btn btn-primary" type="button" value="同意" onclick="tongyi('<%=uList.get(i).getId()%>')">
		<input class="btn btn-primary" type="button" value="拒绝" onclick="deny('<%=uList.get(i).getId()%>')">
		</td>
		</tr>
		<% }}else{
		%>
			<tr>
				<td colspan = "6" style="font-size:20px;text-align:center">暂时没有需要审核的学员</td>
			</tr>
		<%} %>
  </tbody>
</table>
</div>
</body>
</html>