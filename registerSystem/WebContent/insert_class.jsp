<%@page import="com.hzyc.registerSystem.po.Users"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>开班</title>
    <link rel="stylesheet" href="css/whole.css" media="all">
<link rel="stylesheet" href="css/layui.css" media="all">
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
<script type="text/javascript">
function min(){
	/* var selected = document.getElementById("ClassTypeName");
	console.log(selected+"@@@"+selected.length);
	selected[1].selected="true"; */
	
	var request = new XMLHttpRequest();
	//2. 设置监听
	request.onreadystatechange = function (){
		var a=document.getElementById("min");
		
		//判断状态（整个异步传输是否完成）
		if(request.readyState == 4){
		//接收返回字符串
			var data = request.responseText;
			 a.value = data;
			 //设置number控件的最小值
			 a.min=data;
			 //alert("最小值："+a.value); 
			
		}
	};
	//3. 打开通道
	request.open("post", "min.do", true);
	//4.设置请求头信息
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//5. 发送请求
	request.send("");
	
}
 
function check(){
	    var date = document.getElementById("date").value;
	    var ClassTypeName = document.getElementById("ClassTypeName").value;
	    //alert("ClassTypeName----->>>>"+ClassTypeName);
	    //alert("date------>>>"+date);
	      if(date ==  null || date == ''){
	          
	          return false;
	     }
	      if(ClassTypeName == '请选择'){  
	    	 
	    	  return false;
	      }
	      
	     return true; 
	  }
//打开弹出框
function showModle(){
	console.log("打开弹出框");
	$('#myModalLoading').modal('show');
}
//关闭弹出框
function hideModel(){
	//关闭弹出框
	$('#myModalLoading').modal('hide');
}
function isDateTime(){
	
	var dateTime = document.getElementById("date").value;
	var ClassTypeName = document.getElementById("ClassTypeName").value;
	alert(ClassTypeName);
	
	if(dateTime == "" && ClassTypeName ==""){
		showModle();
	}else{
		document.getElementById("formId").submit();
	}
}

</script>

</head>

<body>

 

<body style="text-align: center;" onload="min()">


<div style="font-size:17px;position:absolute;margin-left:200px;margin-top:150px;width:500px;height:400px;">

   <form id = "formId" action="insertClass.do" method="post" onsubmit="return check()">


     <span style="position:absolute;margin-left:10px;margin-top:7px;"> 班号 ：</span><div style="width:130px;height:20px;border-radius:10px;position:absolute;margin-left:350px;margin-top:7px;">腾飞<input type="number" style="width: 45px;" name="classId" id="min" />期</div><br/>
     <span style="position:absolute;margin-left:10px;margin-top:37px;"> 课程类型：</span><div style="width:130px;height:20px;border-radius:10px;position:absolute;margin-left:340px;margin-top:27px;"><span style="margin-left:30px;"><ex:sex  message="ClassTypeName"/></span></div><br/>
     <span style="position:absolute;margin-left:10px;margin-top:67px;"> 开班日期：</span><input type="date"  name="classData" id="date" style="width:180px;height:20px;border-radius:10px;position:absolute;margin-left:120px;margin-top:67px;"/><br/>
     <span style="position:absolute;margin-left:10px;margin-top:97px;">用户ID： </span><input type="text" value=<%=request.getAttribute("UserCode")%> name="userId" style="width:130px;height:20px;border-radius:10px;position:absolute;margin-left:120px;margin-top:97px;" readonly/><br/>    
     <span style="position:absolute;margin-left:18px;margin-top:87px;display: none;"> 状态：</span><input type="text" name="state" value="1"	style="width:130px;height:20px;border-radius:10px;position:absolute;margin-left:350px;margin-top:87px;display: none;" /><br/>
     <input type="hidden" name="state" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:100px;margin-top:107px;"/>
    							  <input type="submit" value="注册" onclick="showModle()" style="margin-left:250px;margin-top:127px;"/>


    </form>

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
					<div class="modal-body">
						班号或日期或课程类型有误！
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeAndReturn()">确定</button>
					</div>
				</div>
			</div>
		</div>  

 

</body>
</html>