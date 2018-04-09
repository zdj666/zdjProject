<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>设置课程表</title>
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
		<link rel="stylesheet" href="css/later.css">  
		<script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style>
			ul li{
				font-size: 20px;
			}
			.headContent{
				margin-top:20px;
			}
			.weekContent{
				margin-top:20px;
			}
			.inputG{
				width:300px;
				margin-left:100px;
			}
		</style>
	</head>
	<body onload="load()">
		<div class="headContent">
			<div class="resultdiv" style="margin-top: -20px;">
				<span class="resultspan" >设置上班时间</span>
			</div>
			<div class="input-group inputG" style="margin-top:10px;">
				
				<span class="input-group-addon">选择</span>
				<input id="ClassName" value="项目组" class="form-control" readonly="readonly" style="height:34px;"/>
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" onclick="getIfo()">
						Go!
					</button>
				</span>
			</div>
			
		</div>
		<div class="resultdiv" style="margin-top: 10px;">
			<span class="resultspan" >设置上班时间(查询结果)</span>
		</div>
		<div class="weekContent">
		<div style="position:relative;float:left">
			<ul class="list-group" style="bolder:2px solid #000;width:100px;margin-left:100px;">
			
				<li class="list-group-item">星期日</li>
				<li class="list-group-item">星期一</li>
				<li class="list-group-item">星期二</li>
				<li class="list-group-item">星期三</li>
				<li class="list-group-item">星期四</li>
				<li class="list-group-item">星期五</li>
				<li class="list-group-item">星期六</li>
			</ul>
		</div>
		<div style="position:relative;float:left">
			<ul class="list-group" style="bolder:2px solid #000;width:600px;margin-left:10px;">
			
				<li class="list-group-item" onclick="week(0)" id="week0">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(1)" id="week1">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(2)" id="week2">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(3)" id="week3">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(4)" id="week4">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(5)" id="week5">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
				<li class="list-group-item" onclick="week(6)" id="week6">
					<span class="label label-success" name="crIfo">教室信息</span>
					<span class="label label-info" name="tIfo">时间信息</span>
				</li>
			</ul>
		</div>
		
		<button class="btn btn-default" type="button" onclick="sendIfo()" style="position:absolute;left: 520px;top: 485px;background:#5bc0de">
			确认设置上班时间
		</button>
		<!-- 模态框（Modal） -->
		<button style="display:none" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							更新课表
						</h4>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<select class="form-control" id="ClassSel" style="width:250px;margin-left:150px;">
								<option >设置课程</option>
							</select>
						</div>
					
					</div>
					<div class="modal-footer">
						<div class="input-group">
							<span class="input-group-addon">详细时间</span>
							<input class="form-control" id="timeIfo" type="text" placeholder="修改时间信息,格式为hh:mm-hh:mm" />
						</div>
						<div class="input-group">
							<span class="input-group-addon">教室信息</span>
							<ex:sex  message="ClassPlace" />
							
						</div>
						<div class="input-group">
							<span class="input-group-addon">当天日期</span>
							<input class="form-control" id="dayIfo" type="text" placeholder="日期" disabled="disabled"/>
						</div>
						<input class="form-control lbtn btn2" type="button" value="确定" onclick="updateIfo()" id="btn2" style="display:block;margin:10px 200px;width:170px;"/>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalAlt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							警告！
						</h4>
					</div>
					<div class="modal-body">
						信息有误，无法完成操作
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalTrue" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示！
						</h4>
					</div>
					<div class="modal-body">
						信息更新成功，完成操作
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalFalse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示！
						</h4>
					</div>
					<div class="modal-body">
						信息更新失败，未完成操作
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalConflict" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示！
						</h4>
					</div>
					<div class="modal-body" id="confictIfo">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							加载！
						</h4>
					</div>
					<div class="modal-body">
						<img src="image/wait.gif" style="margin-left:130px;">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			function load(){
				getIfo();
				getClassName();
			}
			
			var point = 0;
			function week(i){
				var time=$("#week"+i).children("span.label-success").html();
				var cl=$("#week"+i).children("span.label-info").html();
				console.log(time+"-"+cl);
				
				classroomIfo=""+$("#classroomIfo").val(time.substring(4,time.length));
				timeIfo=""+$("#timeIfo").val(cl.substring(4,cl.length));
				dayIfo=""+$("#dayIfo").val(isWeek(i));
				point = i;
				showModle();
			}

			function getIfo(){

				var classId = $("#ClassName").val();
				var xmlhttp  = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState==4&&xmlhttp.status==200){
						var getIfo = xmlhttp.responseText;
						console.log(getIfo);
						weekIfo = eval("("+getIfo+")");
						for(var i=0;i<weekIfo.length;i++){
							var point = isWeekTwo(weekIfo[i].week);
							$("#week"+point).children("span.label-success").html("教室信息"+weekIfo[i].classroom);
							$("#week"+point).children("span.label-info").html("时间信息"+weekIfo[i].time);
						}
						
					}
				};
				xmlhttp.open("post","getWeekCalendarGroup.do",true);
				xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlhttp.send("classId="+classId);
			}

			function getClassName(){
				var xmlhttp  = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState==4&&xmlhttp.status==200){
						var getIfo = xmlhttp.responseText;
						console.log(getIfo+"####");
						var obj = eval("("+getIfo+")");
						for(var i=0;i<obj.length;i++){
							console.log("班级信息"+obj[i]);
							$("#ClassName").append("<option >"+obj[i]+"</option>");
						}
					}
				};
				xmlhttp.open("post","getClassName.do",true);
				xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlhttp.send();
			}
			
			function isWeek(i){
				if(i==0){
					return "星期日";
				}
				if(i==1){
					return "星期一";
				}
				if(i==2){
					return "星期二";
				}
				if(i==3){
					return "星期三";
				}
				if(i==4){
					return "星期四";
				}
				if(i==5){
					return "星期五";
				}
				if(i==6){
					return "星期六";
				}
			}
			function isWeekTwo(i){
				if(i=="星期日"){
					return 0;
				}
				if(i=="星期一"){
					return 1;
				}
				if(i=="星期二"){
					return 2;
				}
				if(i=="星期三"){
					return 3;
				}
				if(i=="星期四"){
					return 4;
				}
				if(i=="星期五"){
					return 5;
				}
				if(i=="星期六"){
					return 6;
				}
			}
			//打开弹出框
			function showModle(){
				console.log("打开弹出框");
				$('#myModal').modal('show');
			}
			//关闭弹出框
			function hideModel(){
				//关闭弹出框
				$('#myModal').modal('hide');
			}
			function updateIfo(){
				var classroomIfo=""+$("#classroomIfo").val();
				var timeIfo=""+$("#timeIfo").val();
				var dayIfo=""+$("#dayIfo").val();
				
				console.log(classroomIfo+"-"+timeIfo+"-"+dayIfo);
				var bool1 = false;
				if(isDateStr(timeIfo)){
					console.log("时间格式合法");
					bool1 = true;
					hideModel();
				}else if(timeIfo==""){
					console.log("时间为null");
					bool1 = true;
					hideModel();
				}else{
					console.log("时间格式不合法");
					$('#myModalAlt').modal('show');
				}
				if(timeIfo!=""&&classroomIfo==""){
					bool1 = false;
					console.log("时间不为空，教室信息为空");
					$('#myModalAlt').modal('show');
				}
				if(bool1){
					$("#week"+point).children("span.label-success").html("教室信息"+classroomIfo);
					$("#week"+point).children("span.label-info").html("时间信息"+timeIfo);
				}
			}
			//判断是否是HH:MM-HH:MM
			function isDateStr(time){
				var t = (""+time).split("-");
				console.log(time+"-"+t.length);
				if(t.length==2){
					var h11 = t[0].split(":")[0];
					var m11 = t[0].split(":")[1];
					var h12 = t[1].split(":")[0];
					var m12 = t[1].split(":")[1];
					console.log(h11);
					var h1 = parseInt(h11);
					var m1 = parseInt(m11);
					var h2 = parseInt(h12);
					var m2 = parseInt(m12);
				
				
					//var s = (t[2].charAt(0)-'0')*10+t[2].charAt(1)-'0';
					console.log(h1+"-"+m1+"-"+"-"+h2+"-"+m2);
					if(h1>=0&&h1<=24&&m1<=59&&m1>=0&&h2>=0&&h2<=24&&m2<=59&&m2>=0){
						return true;
					}else{
						return false;
					}
				}else{
					return false;
				}
			}
		
			function sendIfo(){
				var bool1 = true;
				var bool2 = true;
				var classroomIfo  = "";
				$("span[name='crIfo']").each(function(){  
					var cl = "" +  $(this).html();
					cl  = cl.substring(4,cl.length);
					console.log("教室信息"+cl);
					if(cl=="undefined"){
						bool=false;
					}
					classroomIfo=classroomIfo+"-"+cl;
				});
				
				var timeIfo = "";
				$("span[name='tIfo']").each(function(){  
					var t = "" +  $(this).html();
					t  = t.substring(4,t.length);
					console.log("时间信息"+t);
					if(t=="undefined"){
						bool2 = false;
					}
					timeIfo=timeIfo+"#"+t;
				});
				console.log(bool1+"##"+bool2);

				if(bool1&&bool2){
					var classId = $("#ClassName").val();
					console.log(timeIfo+"#"+classroomIfo+"#"+classId);
					console.log("加载");
					$('#myModalLoading').modal('show');
					var xmlhttp  = new XMLHttpRequest();
					xmlhttp.onreadystatechange = function(){
						
						if(xmlhttp.readyState==4&&xmlhttp.status==200){
							var getIfo = xmlhttp.responseText;
							var bo = getIfo.split("#")[0]; 
							var index = getIfo.split("#")[1];
							console.log(getIfo+"##");
							if(bo=="1"&&index=="0"){
								$('#myModalTrue').modal('show');
							}else if(bo=="1"&&index!="0"){
								$('#myModalConflict').modal('show');
								$('#confictIfo').text("部分信息更新成功，有"+index+"次课时间冲突");
							}else{
								$('#myModalFalse').modal('show');
								
							}
							$('#myModalLoading').modal('hide');
						}
					};
					xmlhttp.open("post","updateWeekCalendarGroup.do",true);
					xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					xmlhttp.send("classroomIfo="+classroomIfo+"&timeIfo="+timeIfo+"&classId="+classId);
				}else{
					$('#myModalFalse').modal('show');
				}
				
			}

			function ChangSele(){
			}
		</script>
	</body>
</html>