<%@page import="java.util.List"%>
<%@page import="com.hzyc.registerSystem.po.Signing"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

    <script type="text/javascript">
       function createTable(){
  var div = document.getElementById("dd"); 
  var table = document.createElement("table");//创建table 
  //table.align="center";
  <%
  List<Signing> signingState=(List)request.getAttribute("signingState");
  for(int i=0;i<signingState.size();i++){
  	Signing signing=signingState.get(i);
  	String time=signing.getSignTime();
  	String Date=signing.getSignData();
  	Integer state=signing.getState();
  	
  	%>
  var row = table.insertRow();//创建一行 
  row .align="center";
  var cell = row.insertCell();//创建一个单元 
  cell.width = "150";//更改cell的各种属性 
  cell.style.backgroundColor = "#999999"; 
  cell.innerHTML="<%=Date%>"; 
  cell = row.insertCell();//创建一个单元 
  cell.width = "150";//更改cell的各种属性 
  cell.style.backgroundColor = "#999999"; 
  cell.innerHTML="<%=time%>";
  cell = row.insertCell();//创建一个单元 
  cell.width = "150";//更改cell的各种属性 
  cell.style.backgroundColor = "#999999";
  <%
  if(state==1){
  %>
  var img = new Image();
  img.src = 'images/smile.jpg';
 cell.appendChild(img);
  <%}else if(state==2){%>
  var img = new Image();
  img.src = 'images/sad.jpg';
 cell.appendChild(img);  
	  
  <%}else{%>
	  
  var img = new Image();
  img.src = 'images/leave.jpg';
 cell.appendChild(img);   
  <%}%> 
  <%}%>
  div.appendChild(table); 
  }

  
    </script>
</head>
<body onload="createTable()">
<!-- 	document.getElementById("imgId").src="images/smile.jpg";
		<img id="imgId" height="130" width="130" /><br/><br/>	 -->
<div id="dd" style="width:600px;height:100%;float: left;">
<h1 style="width:400px;color:#ffffff;font-size:26px;background-color:blue" align="center"> 近一个月具体签到情况 </h1>


</div>
<div style="width:400px;height:600px;float:left;">
<h1 style="width:300px;color:#ffffff;font-size:26px;background-color:blue" align="center"> 近一个月签到情况总计</h1>
<!-- <img src="images/OK.jpg" height="130" width="130" />-->
 <div style="width:150px;height:130px;float:left;">
 
 </div>
 <img src="images/ok.gif" height="130" width="130"/>
<table>

					<tr>
							<td width="150px" height="80px" style="border:1px solid #999999;">准时总数</td>
							<td width="150px" height="80px" style="border:1px solid #999999;">迟到总数</td>
							<td width="150px" height="80px" style="border:1px solid #999999;">请假总数</td>
					</tr>
					<tr>
						<td width="150px" height="80px" style="border:1px solid #999999;">${inTimeCount}</td>
						<td width="150px" height="80px" style="border:1px solid #999999;">${noTimeCount}</td>
						<td width="150px" height="80px" style="border:1px solid #999999;">${leave}</td>
									
					<tr/>
</table>
</div> 
</body>
</html>