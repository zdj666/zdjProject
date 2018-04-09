<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.hzyc.registerSystem.po.Grade"%>
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
<style type="text/css">
td  
{  
    text-align:center;  
} 
</style>
</head>
<script type="text/javascript">

function selDetailClass(){
	//document.getElementsByName(elementName)
	var classId1 = document.getElementsByName("classId");
	var classId = classId1[0].innerHTML;
	window.location.href="queryStuMessageDetail.do?classId="+classId;
}
/*  
修改的id值和单元格的值，可转成json串
用ajax提交数据到后台，后台解析json，更新数据库
*/
// 将单元格转化成文本框 

var tdValue ="";
var list=[];
function changeTotext(obj) {
//获取标签内的文本值,原来单元格的值
tdValue = obj.innerText;

//alert(tdValue);
//讲双击的单元格值设为空
obj.innerText = "";
//在双击单元格处创建input标签对象
var txt = document.createElement("input");
txt.type = "text";
//将文本值赋给input的value
txt.value = tdValue;
//新建input的id值(可以用数据库的ID值)
txt.id = "_text_000000000_";


//添加input节点，并放到td中
obj.appendChild(txt);
//选取域中的文本（双击时文本全选）
txt.select();
//双击之后改变样式
//单元格边框样式
obj.style.border = "1px dashed #ff9900"; 
//input标签边框
txt.style.border = "0px";
txt.style.outline = "none";


}
// 取消单元格中的文本框，并将文本框中的值赋给单元格 
function cancel(obj) {
var txtValue = document.getElementById("_text_000000000_").value;
var tr = obj.parentElement;
//更改之后的值
obj.innerText = txtValue;
var array;
//原来的值与新值如果不相等相等,则需要更新数据库

	//2把字符串格式转换为日期类
			var startTime = new Date(Date.parse(tr.cells[1].innerText));
			var endTime = new Date(Date.parse(tr.cells[2].innerText));
			 
if(tdValue!=obj.innerText&&startTime<=endTime){
	
	//alert("cells的长度"+tr.cells.length);
	for(var i=0;i<tr.cells.length;i++){
		//alert("gid:_______?"+tr.cells[4].innerText);
		if(tr.cells[i].innerText==obj.innerText){
			array = {"classId":tr.cells[0].innerText,"classData":tr.cells[1].innerText,"endTime":tr.cells[2].innerText,"courseName":tr.cells[3].innerText,"index":i};
		
		}
		
	}
	list.push(array);
	
	var json=JSON.stringify(array);
	//alert(json);
	/* var dataarr = eval("("+json+")");
	alert(dataarr.classId); */
	
	//1. 创建XMLHttpRequest
	var request = new XMLHttpRequest();
	//2. 设置监听
	request.onreadystatechange = function (){
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
	/* 		//接收返回字符串
			var data = request.responseText;
			//转换成数组
			var dataarr = eval("("+data+")"); */
			
			showModle();
			
			window.location.href="classFrame.jsp";
		}
	};
	//3. 打开通道
	request.open("post", "updateGradeForGrade.do", true);
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("list=" + json);

	//弹出提示：接班日期大于开班
}else if(startTime>endTime){
	alert("开班日期应小于接班日期");
	return false;
}


}

/*********************************************/
// 事件 
document.ondblclick = function() {
//取得标签属性
if (event.srcElement.tagName.toLowerCase() == "td") {
//获得触发事件的元素
//对象
changeTotext(event.srcElement);
}
}
//当鼠标抬起执行
document.onmouseup = function() {
if (document.getElementById("_text_000000000_")
&& event.srcElement.id != "_text_000000000_") {
var obj = document.getElementById("_text_000000000_").parentElement;
//var tr = document.getElementById("_text_000000000_").parentElement.parentElement;
//alert(tr.id);
cancel(obj);
}
}
function check(){
	
	console.log("$$$"+$("#txt1 input").val());
	var a = /^(\d{4})-(\d{2})-(\d{2})$/ ;
	if (!a.test($("#txt1 input").val())) { 
	  alert("日期格式不正确!") ;
	return false ;
	} 
	else {return true ;}
	} 

function yesOrNo(){
	//1. 创建XMLHttpRequest
	var request = new XMLHttpRequest();
	//2. 设置监听
	request.onreadystatechange = function (){
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
			//接收返回字符串
			var data = request.responseText;
			//alert(data);
			if(data != ""){
				var a = data.substring(0,10);
				var b = data.substring(10,20);
				//alert("拆分字符串11————————》》》》"+data.substring(0,10));
				//alert("拆分字符串22————————》》》》"+data.substring(10,20));
				alert("您有课程在"+a+"结课了");
				//alert("a==b????"+(a==b));
				if(a==b){		
					updateState(b);
				}
				
			}
		
			
		}
	};
	//3. 打开通道
	request.open("post", "yesOrNo.do", true);
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("");
	
	
}
function updateState(b){
	//1. 创建XMLHttpRequest
	var request = new XMLHttpRequest();
	//2. 设置监听
	request.onreadystatechange = function (){
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
			//接收返回字符串
			alert("你有课程今天结课!");
			
		}
	};
	//3. 打开通道
	request.open("post", "updateState.do", true);
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("endTime="+b);
	
	
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
<body onload="yesOrNo()">
<div class="resultdiv">
	<span class="resultspan">查询结果</span>
</div>
<div>
      <table class="table table-bordered table-hover"  style="width: 85%"> 

      <tr style="font-weight: bold; ">
        <th style="width:140px;text-align:center;">班号</th>
        <th style="width:220px;text-align:center;">开班日期</th>
        <th style="width:220px;text-align:center;">预计结班日期</th>
        <th style="width:180px;text-align:center;">课程名</th>
        <th style="width:100px;text-align:center;">人数</th>
        <th style="width:100px;text-align:center;">操作</th>
      </tr> 
        <% 
        List<Grade> gList = (List)request.getAttribute("list");
        if(gList !=null && gList.size()!=0){
			for(int i=0;i<gList.size();i++){	
			
        %>
        
    <tr>
        <td name="classId"><%=gList.get(i).getClassId()%></td>
        <td><%=gList.get(i).getClassData() %></td>
        <td><%=gList.get(i).getEndTime() %></td>
        <td><%=gList.get(i).getCourseName() %></td>
        <td><%=gList.get(i).getCount() %></td>
     	<td><input class="btn btn-primary" type="button" value="查看详情" onclick="selDetailClass()"/></td>
     	
     </tr>
        <%
        }
        }
        
        else{
        
        %>
        	<td colspan="6" style="font-size:20px;text-align:center">暂无此课程信息</td>
        	<%
       		 }
        %>
      
     </table>
    </div>
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
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAndReturn()">确定</button>
					</div>
				</div>
			</div>
		</div> 
</body>
</html>