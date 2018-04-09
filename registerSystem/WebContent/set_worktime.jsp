<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<title>Insert title here</title>
<style>
	.hasImg{
		background-image:url('image/yes.png');
		background-repeat: no-repeat;
	}
	td{
		width:80px;
		height:80px;
		text-align:center;
		valign:top;
	}
	table td{border:1px solid #F00}
</style>
<script type="text/javascript">
	var finalString = "";
  	$(function(){
		$("td").click(function(){
			$(this).toggleClass("hasImg");
		});	
	});    
	function test(){
		var tds = document.getElementsByTagName("td");
		for(var i = 0 ; i < tds.length ; i++){
 			if($(tds[i]).attr('class') == "hasImg"){
 				finalString = finalString + "@" + $(tds[i]).attr('id');
			}
		}
		alert(finalString);
		var formId = document.getElementById("formId");
		formId.method="post";
		formId.action = "setWorktime.do?param="+finalString+"";
		formId.submit();
	}
	</script>
</head>
<body>
	<!--这个页面是用来设置上班时间的  -->
	<table id="tas" style="width: 800px; height: 300px;">
		<thead>
			<tr>
				<th id="0">@@@@@@@@</th>
				<th id="1">星期一</th>
				<th id="2">星期二</th>
				<th id="3">星期三</th>
				<th id="4">星期四</th>
				<th id="5">星期五</th>
				<th id="6">星期六</th>
				<th id="7">星期日</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 1; i <= 4; i++) {
			%>
			<tr>
				<th id="0">13:00~15:30</th>
				<td id="1<%=i%>"></td>
				<td id="2<%=i%>"></td>
				<td id="3<%=i%>"></td>
				<td id="4<%=i%>"></td>
				<td id="5<%=i%>"></td>
				<td id="6<%=i%>"></td>
				<td id="7<%=i%>"></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<form id="formId" onsubmit="return test()">
		<input type="submit" id="ensure" value="确定"/>
	</form>
</body>
</html>