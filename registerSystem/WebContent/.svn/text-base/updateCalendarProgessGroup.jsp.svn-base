<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

 <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>修改上课表</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	<link href="assets/css/style-updateCalendar.css" rel="stylesheet">
	<link href="assets/css/jquery-ui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/fullcalendar.css">
	<link rel="stylesheet" type="text/css" href="css/fancybox.css">
	<link rel="stylesheet" href="css/later.css">
	<style>
		body{
			width: 1150px;
			height: 500px;
		}
		.fc-header-title{
			background: #5bc0de;
		}
	</style>
  </head>
	<body onload="loadIfo()">
		<!--main content start-->
		<div  style="margin-top:20px;position:absolute;">
			<div class="input-group" style="float:left;width:200px;margin-left:30px">
				<input id="grade" value="项目组" readonly="readonly" style="height:34px;"/>

				<span class="input-group-btn" >
					<button class="btn btn-default" type="button" onclick="getIfo()">
						Go!
					</button>
				</span>
			</div>
			 
			<input type="text" class="form-control" id="userId" value="" style="display:none;float:left;"/>
			<div style="float:left;margin-top:-13px;margin-left:30px;">
				<h4 class="labelH" style="margin-top:10px;"><span class="label label-default">【点击当天添加上班时间❥(^_-)】</span></h4>
				<h4 class="labelH" style="margin-top:20px;"><span class="label label-default">【一天最多添加一个上班时间❥(^_-)】</span></h4>
			</div>
		</div>
		<!-- 模态框（Modal） -->
		<button style="display:none" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="margin-top: 100px;">
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
								<option >修改课程</option>
								<option >删除课程</option>
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
						<input class="form-control lbtn btn2" type="button" value="确定" onclick="updateEventIfo()" id="btn2" style="display:block;margin:10px 200px"/>
						
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
		<section id="main-content" Class="m_content" style="margin-top:30px;width:80%">
          <section class="wrapper">
          	<div class="resultdiv" style="margin-top:-40px;margin-left:-235px;width:130%">
				<span class="resultspan" style="color:#000000;">上班时间</span>
			</div>
              <!-- page start-->
             <div style="position: absolute;top:145px;left:550px;">
				
				<button type="button" class="btn btn-success" onclick="updateIfo()" style="background:#5bc0de">确认更新上班时间</button>
			</div>
              <div class="resultdiv" style="margin-top:80px;margin-left:-235px;width:130%">
					<span class="resultspan" style="color:#000000;">设置上班时间(查询结果)</span>
			  </div>
              <div class="row mt" style="margin-top:20px;margin-left:-235px">
                  
                  <aside class="col-lg-9 mt">
                      <section class="panel">
                          <div class="panel-body">
                              <div id="calendar" class="has-toolbar"></div>
                          </div>
                      </section>
                  </aside>
              </div>
              <!-- page end-->
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
		
      <!--footer end-->
  </section>
	<script>
		var eventData = [];
		var bool= true; 
	</script>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>  
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/js/jquery-ui.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
	<script src='js/fullcalendar.min.js'></script>
	<script src='js/jquery.fancybox-1.3.1.pack.js'></script>
	<script src="js/event.js">  </script>
	
	
	
  <script>
		//var eventData;
		function loadIfo(){
			getIfo();
			changeStyle();
			getClassName();
			var xmlhttp  = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4&&xmlhttp.status==200){
					var getIfo = xmlhttp.responseText;
					console.log(getIfo+"####");
					$("#userId").val(""+getIfo);
				}
			};
			xmlhttp.open("post","getCalUserIfoGroup.do",true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send();
		}

		function changeStyle(){
			$("span .fc-button-content").each(function(){
				var t=$(this).text();
				console.log(""+t);
				if(t=="today"){
					$(this).text("");
				}		
				if(t=="month"){
					$(this).text("月课表");
				}
				if(t=="week"){
					$(this).text("");
				}
				if(t=="day"){
					$(this).text("");
				}			
			});

			
			$(".fc-sun.fc-widget-header.fc-first").text("星期天");
			$(".fc-mon.fc-widget-header").text("星期一");
			$(".fc-tue.fc-widget-header").text("星期二");
			$(".fc-wed.fc-widget-header").text("星期三");
			$(".fc-thu.fc-widget-header").text("星期四");
			$(".fc-fri.fc-widget-header").text("星期五");
			$(".fc-sat.fc-widget-header").text("星期六");

			$(".fc-header-center").css({"background-color":"#68dff0"});
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
						$("#grade").append("<option >"+obj[i]+"</option>");
					}
				}
			};
			xmlhttp.open("post","getClassName.do",true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send();
		}
		
		//加载日历
		function load(){
			$('#calendar').fullCalendar();
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

		
		
		//更新日历表event信息
		function updateEventIfo(){
			var ifo=$('#ClassSel').val();
			
			var classroomIfo=""+$("#classroomIfo").val();
			var timeIfo=""+$("#timeIfo").val();
			var gradeIfo=""+$("#gradeIfo").val();
			var dayIfo=""+$("#dayIfo").val();
			
			
			if(ifo=="修改课程"){
				//有信息为空
				if(classroomIfo==""||timeIfo==""||gradeIfo==""){
					bool = false;
					$('#myModalAlt').modal('show');
					console.log("信息为空")
				}else if(!isDateStr(timeIfo)){
					console.log("时间格式有误");
					bool = false;
					$('#myModalAlt').modal('show');
				}else{
					console.log("修改课程");
					//格式化数据
					var title = "教室["+classroomIfo+"],详细时间["+timeIfo+"]";
					var start = dayIfo;
					console.log("修改课程"+title+"--"+start);
				
					//获取events数据
					var events =  $('#calendar').fullCalendar( 'clientEvents', );
					console.log(events.length+"$$$");
					console.log("---------1--------");
					for(var i=0;i<events.length;i++){
						console.log(events[i].start);
						var eventStart = events[i].start;
						if(events[i].start!=""&&events[i].start!=null){
							eventStart = ""+events[i].start.getFullYear()+"-"+(events[i].start.getMonth()+1)+"-"+events[i].start.getDate();
						}
						console.log(""+events[i].start+"-@1@@-"+eventStart+"-#1###-"+start);
						//找到当天的
						if(eventStart==start){
							events[i].title=title;
							console.log("匹配成功");
						}
					}
					console.log("---------1--------");
					//eventData=events;
					//重新加载日历表
					$('#calendar').fullCalendar( 'refetchEvents' );
					
				}
				
			}else if(ifo=="删除课程"){
				console.log("删除课程");
				var start = dayIfo;
				var events =  $('#calendar').fullCalendar( 'clientEvents', );
				console.log(events.length+"$$$");
					
				var index = -1;
				console.log("---------2--------");
				
				for(var i=0;i<events.length;i++){
					console.log(events[i].start);
					if(events[i].start!=""&&events[i].start!=null){
						console.log(events[i]);
						var eventStart = ""+events[i].start.getFullYear()+"-"+(events[i].start.getMonth()+1)+"-"+events[i].start.getDate();
					
						console.log(""+events[i].start+"-@2@@-"+eventStart+"-#2###-"+start);
						//找到当天的
						if(eventStart==start){
							console.log("匹配成功");
							index = i;
							events[i].start="";
							events[i].title="";
						}
					}
				}
				console.log("---------2--------");
				console.log("index"+index);
				if(index!=-1){
					//重新加载日历表
					$('#calendar').fullCalendar( 'refetchEvents' );
					//console.log("重新加载了吗？");
				}
				
			}
			//关闭弹出框
			hideModel();
		}
		function getIfo(){
			console.log("获取信息");
			changeStyle();
			var grade_id =""+ $("#grade").val();
			var user_id = ""+$("#userId").val();//假数据
			var ifo = "user_id="+user_id+"&grade_id="+grade_id;
			console.log(ifo);
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4&&xmlhttp.status==200){
					var getIfo = xmlhttp.responseText;
					console.log(getIfo);
					var json = eval("("+getIfo+")");
					console.log(json.length);

					$('#calendar').fullCalendar( 'removeEventSource	', );
					var events =  $('#calendar').fullCalendar( 'clientEvents', );
					/*eventData = events;
					for(var i=0;i<eventData.length;i++){
						console.log(eventData[i].start+"&&&");
					}
					/*for(var i=0;i<eventData.length;i++){
						eventData[i].start="";
						eventData[i].title="";
						//console.log(eventData[i].start+"&&&");
					}*/
					for(var i=0;i<events.length;i++){
						events[i].start="";
						events[i].title="";
					}
					for(var i=0;i<json.length;i++){
						console.log(json[i].classroom+"-"+json[i].date+"-"+json[i].time);
						events.push({
							"title":"教室["+json[i].classroom+"],详细时间["+json[i].time+"]",
							"start":""+json[i].date
						});
					}
					for(var i=0;i<events.length;i++){
						console.log(events[i].start+"^^^");
					}
					eventData = events;
					$.getScript("js/event.js");
					//$('#calendar').fullCalendar( 'addEventSource',events );
					//$('#calendar').fullCalendar( 'refetchEvents' );
				}
			};
			xmlhttp.open("post","getCalendarIfoGroup.do",true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send(ifo);
		}

		function updateIfo(){
			console.log("提交更新");
			$.getScript("js/event.js");
			var events =  $('#calendar').fullCalendar( 'clientEvents', );
			var eventsIfo = [];
			var index = 0;
			console.log(events.length);
			for(var i=0;i<events.length;i++){
				console.log("#####"+events[i].title+"$$"+events[i].start);
				if(events[i].title!=""&&events[i].start!=null){
						
					eventsIfo.push({
						"title":events[i].title,
						"start":(""+events[i].start.getFullYear()+"-"+(events[i].start.getMonth()+1)+"-"+events[i].start.getDate())
					});
					console.log(eventsIfo[index]);
					index++;
				}
			}
			console.log(eventsIfo.length);
			for(var i=0;i<index;i++){
				console.log("最后信息"+eventsIfo[i].title);
			}
			var bool2 = true;
			var bool1 = true;
			for(var i=0;i<eventsIfo.length;i++){
				var titleIfo = eventsIfo[i].title.split(",");
				if(titleIfo.length<2){
					bool1=false;
					console.log("title格式不合法");
					break;
				}else{
					titleIfo[1]=titleIfo[1].substring(5,titleIfo[1].length-1);
					console.log(titleIfo[1]);
					if(!isDateStr(titleIfo[1])){
						bool2=false;
						console.log("详细时间不合法");
					}
				}
				//if(!isDateStr())
			}	
			console.log(bool1+"*--*"+bool2);
			if(bool1&&bool2){
					
				var grade_id=$("#grade").val();
				console.log("加载");
				$('#myModalLoading').modal('show');
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState==4&&xmlhttp.status==200){
						var getIfo = xmlhttp.responseText;
						if(getIfo=="true"){
							$('#myModalTrue').modal('show');
						}else{
							$('#myModaFalse').modal('show');
						}
						$('#myModalLoading').modal('hide');
					}
				};
				xmlhttp.open("post","updateCalendarIfoGroup.do",true);
				xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlhttp.send("eventsData="+JSON.stringify(eventsIfo)+"&grade_id="+grade_id);
				
			}else{
				$('#myModalAlt').modal('show');
			}
			
		}
		//判断是否是HH:MM-HH:MM
		function isDateStr(time){
			var t = (""+time).split("-");
			console.log(time+"-"+t.length);
			if(t.length==2){
				var h11 = (t[0].split(":")[0]);
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

		function ChangSele(){
		}
  </script>
  </body>
 </html>