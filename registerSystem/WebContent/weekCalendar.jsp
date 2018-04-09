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
				<span class="resultspan" >设置课程表(按班级查询)</span>
			</div>
			<div class="input-group inputG" style="margin-top:10px;">
				
				<span class="input-group-addon">选择期数</span>
				<select class="form-control" id="ClassName">
				</select>
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" onclick="getIfo()">
						查询
					</button>
				</span>
			</div>
			
		</div>
		<div class="resultdiv" style="margin-top: 10px;">
			<span class="resultspan" >设置课程表(查询结果)</span>
		</div>
		<div class="weekContent" style="margin-top:10px;">
		
		<div style="position:relative;float:left;">
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
		</div>
		<button class="btn btn-primary" type="button" onclick="sendIfo()" style="position:absolute;left: 520px;top: 485px;">
			确认设置课表
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
						<h4 class="labelH" style="margin-top:10px;"><span class="label label-default">【❥(^_-)格式为hh:mm-hh:mm】</span></h4>
						
						<div class="input-group">
							<span class="input-group-addon">详细时间</span>
							<select class="form-control" id="h1" type="text" style="width:75px;position:relative;float:left;"/>
								<option >01</option><option >02</option><option >03</option><option >04</option><option >05</option><option >06</option>
								<option >07</option><option >08</option><option >09</option><option >10</option><option >11</option><option >12</option>
								<option >13</option><option >14</option><option >15</option><option >16</option><option >17</option><option >18</option>
								<option >19</option><option >20</option><option >21</option><option >22</option><option >23</option><option >24</option>
							</select>
							<input class="form-control" type="text" value="时" disabled="disabled" style="width:40px;position:relative;float:left;"/>
							<select class="form-control" id="m1" type="text" style="width:70px;position:relative;float:left;"/>
								<option >01</option><option >02</option><option >03</option><option >04</option><option >05</option><option >06</option>
								<option >07</option><option >08</option><option >09</option><option >10</option><option >11</option><option >12</option>
								<option >13</option><option >14</option><option >15</option><option >16</option><option >17</option><option >18</option>
								<option >19</option><option >20</option><option >21</option><option >22</option><option >23</option><option >24</option>
								<option >25</option><option >26</option><option >27</option><option >28</option><option >29</option><option >30</option>
								<option >31</option><option >32</option><option >33</option><option >34</option><option >35</option><option >36</option>
								<option >37</option><option >38</option><option >39</option><option >40</option><option >41</option><option >42</option>
								<option >43</option><option >44</option><option >45</option><option >46</option><option >47</option><option >48</option>
								<option >49</option><option >50</option><option >51</option><option >52</option><option >53</option><option >54</option>
								<option >55</option><option >56</option><option >57</option><option >58</option><option >59</option><option >60</option>
							</select>
							<input class="form-control" type="text" value="分" disabled="disabled" style="width:40px;position:relative;float:left;"/>
							<select class="form-control" id="h2" type="text" style="width:70px;position:relative;float:left;margin-left:40px;"/>
								<option >01</option><option >02</option><option >03</option><option >04</option><option >05</option><option >06</option>
								<option >07</option><option >08</option><option >09</option><option >10</option><option >11</option><option >12</option>
								<option >13</option><option >14</option><option >15</option><option >16</option><option >17</option><option >18</option>
								<option >19</option><option >20</option><option >21</option><option >22</option><option >23</option><option >24</option>
							</select>
							<input class="form-control" type="text" value="时" disabled="disabled" style="width:40px;position:relative;float:left;"/>
							<select class="form-control" id="m2" type="text" style="width:70px;position:relative;float:left;"/>
								<option >01</option><option >02</option><option >03</option><option >04</option><option >05</option><option >06</option>
								<option >07</option><option >08</option><option >09</option><option >10</option><option >11</option><option >12</option>
								<option >13</option><option >14</option><option >15</option><option >16</option><option >17</option><option >18</option>
								<option >19</option><option >20</option><option >21</option><option >22</option><option >23</option><option >24</option>
								<option >25</option><option >26</option><option >27</option><option >28</option><option >29</option><option >30</option>
								<option >31</option><option >32</option><option >33</option><option >34</option><option >35</option><option >36</option>
								<option >37</option><option >38</option><option >39</option><option >40</option><option >41</option><option >42</option>
								<option >43</option><option >44</option><option >45</option><option >46</option><option >47</option><option >48</option>
								<option >49</option><option >50</option><option >51</option><option >52</option><option >53</option><option >54</option>
								<option >55</option><option >56</option><option >57</option><option >58</option><option >59</option><option >60</option>
							</select>
							<input class="form-control" type="text" value="分" disabled="disabled" style="width:40px;position:relative;float:left;"/>
							
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
				getClassName();
				getIfo();
			}
			
			var point = 0;
			function week(i){
				var time=$("#week"+i).children("span.label-success").html();
				var cl=$("#week"+i).children("span.label-info").html();
				console.log(time+"-"+cl);
				
				classroomIfo=""+$("#classroomIfo").val(time.substring(4,time.length));
				//timeIfo=""+$("#timeIfo").val();
				var timeIfo = cl.substring(4,cl.length);
				$("#h1").val(""+timeIfo.substring(0,2));
				$("#m1").val(""+timeIfo.substring(3,5));
				$("#h2").val(""+timeIfo.substring(6,8));
				$("#m2").val(""+timeIfo.substring(9,11));
				console.log(timeIfo);
				dayIfo=""+$("#dayIfo").val(isWeek(i));
				point = i;
				showModle();
			}

			function getIfo(){

				var classId = $("#ClassName").val();
				console.log(""+classId);
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
				xmlhttp.open("post","getWeekCalendar.do",true);
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
				xmlhttp.open("post","getClassName.do",false);
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
				var timeIfo=""+$("#h1").val()+":"+$("#m1").val()+"-"+$("#h2").val()+":"+$("#m1").val();
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
					xmlhttp.open("post","updateWeekCalendar.do",true);
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