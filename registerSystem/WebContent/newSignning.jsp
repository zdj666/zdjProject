<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java"%> 
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>签到页面</title>
<link href="registerSystem/css/style.css" rel="stylesheet"/>


<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<style>
.row-fluid  .zAccountPlanRinner {
	position: relative;
}

.waveBox {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 61px;
	overflow: hidden;
}

.waveInner {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 1200px;
	height: 61px;
}

.waveInner img {
	float: left;
	display: block;
}

.zAccountPlanR .detail {
	color: #68dff0;
	position: relative;
	z-index: 3;
}

.row-fluid .zAccountPlanR {
	background-image: none;
}
</style>
<script type="text/javascript">
//查询时间查看签到状态，迟到20分钟不允许签到
			function signningState(){
			//判断是否已经签到
				submitOnclik();
				//获取状态	
				var stateObj = document.getElementById("stateId"); 
				//获取日期
				var  dateValue= document.getElementById("signDateId").value;				
				//获取时间
				var  timeValue= document.getElementById("signTimeId").value;
						
				//将此值发送到后台服务器中，进行校验-->ajax
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4){
						var data = xmlhttp.responseText;
						//var jsonObj = eval("("+data+")");
						//gosn
						//alert(data);
						//alert(data!="null");
						if(data!="null"){
							var selectData=data.split("-");
							//alert(selectData[0]);
							//起始时间
							var getRuleData=selectData[0].split(":");
							//终止时间
							var endData=selectData[1].split(":");
							var hour = getRuleData[0];
							var min = getRuleData[1];
							var gettimeValue=timeValue.split(":");
							//开始时间
							var ctime = "";
							for(var i = 0 ; i < getRuleData.length ; i++){
								ctime += getRuleData[i];
							}
							//系统时间
							var stime = "";
							for(var i = 0 ; i < gettimeValue.length ; i++){
								stime += gettimeValue[i];
							}
							//终止时间
							var endtime="";
							for(var i = 0 ; i < endData.length ; i++){
								endtime += endData[i];
							}
							
							
							hour = parseInt(min) - 20 >= 0 ? parseInt(hour) : parseInt(hour) - 1;
							min = parseInt(min) - 20  >= 0 ? parseInt(min)-20 : (60-20) + parseInt(min) ;
							if(min < 10){
								min = "0"+min;
							}
							if(hour<10){
								hour="0"+hour;
							}
							ctimeAdd = hour+""+min;//ctime = hour+""+min;
							//签到时间大于上课时间-20分钟  或者 小于 下课时间
							//alert("系统时间"+stime);
							//alert("开始时间"+ctime);
							//alert("截止时间"+endtime);
							//alert("减后时间"+ctimeAdd);
								if((stime >= ctimeAdd  && stime <= endtime)){
									//alert("可以签到");
									/*这里面判断的是有没有迟到。如果没有迟到：*/
									if(ctime>=stime){
										stateObj.value="1";
									/*否则就是迟到了*/
									}else{
										stateObj.value="2";
									}
									return true;
						/*否则就是在时间范围外了，不可签到*/		
								}else{
									//alert("不可以签到");
									document.getElementById("submitId").style.backgroundColor="#e3e3e3";
									document.getElementById("submitId").disabled=true;
									return false;
									
								}  	
							
						}else{
								//alert("不可以签到");
								document.getElementById("submitId").style.backgroundColor="#e3e3e3";
								document.getElementById("submitId").disabled=true;
								return false;
								
							}  
						}
				};
				xmlhttp.open("post","selectReal_Schedule.do",true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xmlhttp.send("date="+dateValue);
				
				
			}
			//设置按不可点击
			
			function submitOnclik(){
				var  dateValue= document.getElementById("signDateId").value;
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4){
						var state = xmlhttp.responseText;
		 					if(state=="YES"){
		 						//alert("还可以签到");
		 						return true;
		 					}else{
		 						//alert("已经签到不可以在签到");	
								//alert("不可以签到");
								document.getElementById("submitId").style.backgroundColor="#e3e3e3";
								document.getElementById("submitId").disabled=true;
								return false;
		 					}
						}
				};
				xmlhttp.open("post","selectStateById.do",true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xmlhttp.send("signData="+dateValue);	

			}
			/*提示框div  */
		function openLogin(info){
				   document.getElementById("win").style.display="";
					var spanObj = document.getElementById("spanId");
					spanObj.innerHTML = "<font size='3' color='black'><b>"+info+"</b></font>";
				}
				function closeLogin(){
				   document.getElementById("win").style.display="none";
				  /*  document.getElementById("formId").submit(); */
				}
	</script>
</head>
<body onload="signningState()">
	<form action="insertSignning.do" method="post" onsubmit="return signningState()" id="formId" >
	<%String signDate=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new Date());%>	
	<%String signTime=new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime());%>	
  	<!--签到日期:--><input type="hidden" name="signData"  value=<%=signDate%> id="signDateId" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;	
  	<!--签到时间:--><input type="hidden" name="signTime"  value=<%=signTime%> id="signTimeId" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;	
	<!-- 隐藏状态标签 --><input type="hidden" name="state" id="stateId"/>	 
	 <div style="width: 900px; height: 600px;border:1px solid #68dff0;;position: absolute;left:50%;margin-left:-550px;top:0px;">
		<div style="width: 100%; height: 100px; background-color: #68dff0;color:#fff;font-weight:600;font-size:35px;text-align: center;line-height:80px;top:0px;">
			合众易成学员签到系统
		</div>
		<div style="width: 100%; height: 500px;">
			<div class="zAccountInner zAccount2 clearfix" style="position: relative;">
				<div class="colorsBox clearfix">
					已签到:<div style="background-color: #68dff0;margin-left:10px;height:20px;width:20px;display: inline-block;vertical-align:bottom "> </div>
				 	<br />
				 	未签到:<div style="background-color:#d2d2d2;margin-left:10px;height:20px;width:20px;display: inline-block;vertical-align:bottom"> </div>
				 </div>
				<div class="zAccountPlanL span5 no-margin-left"
					style="position: absolute; left: 0px; top: 50px; width: 550px; height: 375px">
					<div id="div1"></div>
					<input type="hidden" id="index_clander" /> 
					<input type="hidden" id="d523_y">
				</div>
				<div class="span7"
					style="height: 320px; position: absolute; right: 0; text-align: center; top: 50px; width: 290px;">
					<div class="zAccount5 boxSize no-margin-left">
						<div class="zAccountPlanRinner zAccountPlanR">
							<div class="today">今天</div>
							<div class="week" id="d523_w">星期三</div>
							<div class="day" id="d523_d">27</div>

							<p class="date">保持签到是一种良好的习惯</p>
							<a href="selectGradeId.do" class="detail">重新加载</a>
							

							<div class="waveBox">
								<div class="line_water waveInner">
									<img src="images/zz111.png"> <img src="images/zz111.png">
								</div>
								<div class="line_water2 waveInner">
									<img src="images/zz222.png"> <img src="images/zz222.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!--<input type="submit" value="签到" onclick="return submitOnclik()" id="submit" style="width:200px;height:39px;border:0;background-color:#fdab01;color:#fff;font-size:19px;position:absolute;top:530px;left:610px;">
-->
		  
<input type="submit" value="签到"  id="submitId"   style="width:200px;height:39px;border:0;background-color: #68dff0;color:#fff;font-size:19px;position:absolute;top:530px;left:610px;">	
<!-- onclick="remindInfo()" -->	  
</div>
	</div>
	 </form>
<!-- 提示框 -->
<div id="win" style="display:none; POSITION:absolute; left:50%; top:50%; width:553px; height:175px; margin-left:-400px; margin-top:-200px; border:1px solid #d2d2d2; background-color:#ffffff; text-align:center">
	<div style="background-color:#68dff0; width:553px; height:59px;">
		<h1 style="width:553px;color:#ffffff;font-size:26px;background-color:#68dff0;margin-top: 0px; " >友情提示 </h1>
	</div>
	<div  style="background-color:#ffffff; width:553px; height:38px;margin-top: 20px;">
		<span id="spanId" ></span>
	</div>
	<div style="background-color:#ffffff; width:552px; height:57px;border:1px solid #d2d2d2;">
		<button style="margin-left: 480px;margin-top: 20px;" onclick="closeLogin()">关闭 </button>
	</div>

</div>


	<script src="js/jquery-1.8.3.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/DatePicker/extraDate.js"></script>
	<script>
		//运动的水波纹
		function rollTwo() {
			$(".line_water").animate(
					{
						marginLeft : "-297px"
					},
					5000,
					"linear",
					function() {
						$(this).css({
							marginLeft : "0px"
						});
						$(this).find("img:first").remove().clone(true)
								.appendTo($(this));
					});
		}
		rollTwo();
		var startRollTwo = setInterval(rollTwo, 40);

		function rollOne() {
			$(".line_water2").animate(
					{
						marginLeft : "-297px"
					},
					5000,
					"linear",
					function() {
						$(this).css({
							marginLeft : "0px"
						});
						$(this).find("img:first").remove().clone(true)
								.appendTo($(this));
					});
		}
		rollOne();
		var startRollTwo = setInterval(rollOne, 20);
		//提示信息
		function	remindInfo(){
			var  stateValue= document.getElementById("stateId").value;
			if(stateValue=="1"){
				openLogin("恭喜你,准时签到 ");
			}else{
				openLogin("迟到,下次早点哦");
				
			}
		}	
	</script>	 	 
</body>
</html>