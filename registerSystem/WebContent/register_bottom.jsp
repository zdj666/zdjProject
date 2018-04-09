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
 <script type="text/javascript">
 	function del(id){
 		window.location.href = "delEmployeesclue.do?id="+id;
 	}
 </script>
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">查询结果</span>
	</div>
 <form id="formId" method="post" target="_parent"></form>
	<table class="layui-table" >
	  <colgroup>
      <col width="100">
      <col width="100">
      <col width="100">
      <col width="150">
      <col width="150">
      <col width="200">
      <col>
    </colgroup>
	
  <thead>
    <tr>
   	  <th>序号</th>
      <th>姓名</th>
      <th>账号</th>
      <th>电话</th>
      <th>邮箱</th>
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
		<td><%=uList.get(i).getCode() %></td>
		<td><%=uList.get(i).getPhone() %></td>
		<td><%=uList.get(i).getEmail() %></td>
		<td>
		<input class="btn btn-primary" type="button" value="删&nbsp;&nbsp; 除" onclick="del('<%=uList.get(i).getId()%>')">
		</td>
		</tr>
		<% }}else{
		%>
			<tr>
				<td colspan = "6" style="font-size:20px;text-align:center">暂无员工</td>
			</tr>
		<%} %>
  </tbody>
</table>
</div>
</body>
</html>