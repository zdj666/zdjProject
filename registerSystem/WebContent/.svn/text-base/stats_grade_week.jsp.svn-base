<%@page import="java.util.List"%>
<%@page import="com.hzyc.registerSystem.po.Grade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/later.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#line{
	      	height: 10px;
	      	width : 100%;
	      	margin-top: 10px;
	      }
	#select{
	      	margin-left: 10%;
	      	margin-top: 5px;	
	}
	
select{
		width:180px;
		height:30px;
		border:0;
		border:1px solid #666;
		border-radius:5px;
		font-size:16px;
		background-color: #fff;
		text-align:center;
		margin-top:25px;
	}
iframe{
 		width:100%; 
 		height:535px;
}
</style>
<script type="text/javascript">
	function select(){
		var option1 = document.getElementById("option1").value;
		var option2 = document.getElementById("option2").value;
		var option3 = document.getElementById("option3").value;
		if(option2=="出勤情况"){
			document.getElementById("value").style.display="block";
			document.getElementById("option3").style.display="block";
			$("#bin").css("marginLeft","80px");
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4){
					//获取select元素
					var cityObj = document.getElementById("option3");
					//获取select元素的全部子节点，删除
					var cityNodes = cityObj.childNodes;
					
					while(cityNodes.length > 0 ){
						cityObj.removeChild(cityNodes[cityNodes.length-1]);
					}
					
					var studentData = xmlhttp.responseText;
					//解析数据
					var cityArray = eval("("+studentData+")");
					for(var i = 0;i < cityArray.length;i++){
						var cityOption = document.createElement("option");
						cityOption.innerText = cityArray[i].name;
						cityOption.value = cityArray[i].name;
						cityObj.appendChild(cityOption);
					}
					student();
				}
				
			};
			xmlhttp.open("post","studentAjax.do",true);
			xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlhttp.send("option1="+option1);
			
		}else{
			document.getElementById("value").style.display="none";
			document.getElementById("option3").style.display="none";
			$("#bin").css("marginLeft","200px");
			
			window.open("gradeWeek.do?option1="+option1+"&option2="+option2+"","right");
		}
	}
	
	function student(){
		var option3 = document.getElementById("option3").value;
		var option1 = document.getElementById("option1").value;
		window.open("gradeCondition.do?option1="+option1+"&option3="+option3+"","right");
	}
</script>
</head>
<link rel="stylesheet" href="css/style.min.css" />	
<body onload="select()">
	<% 
		List<Grade> gList = (List<Grade>)request.getAttribute("gList");
	%>
	<div class="totalDiv">		
		<div class="resultdiv">
			<span class="resultspan">统计条件</span>
		</div>
		<div id="select" >
			<div style="float:left;margin-top: 28px;width:100px;height:25px;border-radius:5px;font-size:17px;margin-left:200px;"id="bin">选择班级：</div>
			<select style="float:left;width:150px;text-align:center;" onchange="select()" id="option1">
				<%
					for (int i=0; i<gList.size();i++) {
				%>
						<option value="<%=gList.get(i).getClassId() %>"><%=gList.get(i).getClassId() %></option>
				<%		
					}
				%>
				
			</select>
		</div>
		<div id="select" >
			<div style="float:left;width:100px;height:25px;border-radius:5px; font-size:17px;margin-left: 20px;margin-top: 28px;">统计方式:</div>
			<select style="float:left;width:150px;text-align:center;" onchange="select()" id="option2">
				<option value="柱状图">柱状图</option>
				<option value="折线图">折线图</option>
				<option value="出勤情况">出勤情况</option>
			</select>
		</div>
		<div id="select">
				<div style="float:left;width:100px;height:25px;display: none;margin-top: 28px;border-radius:5px;font-size: 17px;margin-left: 20px;" id="value">选择学生:</div>
				<select style="float:left;width:150px;text-align:center;display: none;" onchange="student()" id="option3">
				</select>
		</div>
	</div>
	<div class="downDiv">
  		<iframe src="" name="right">
  		</iframe>
	</div>

</body>
</html>