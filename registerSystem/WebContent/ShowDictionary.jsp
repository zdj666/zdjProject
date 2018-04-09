<%@page import="com.hzyc.registerSystem.po.Dictionary"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据字典管理</title>
 <link rel="stylesheet" href="../registerSystem/css/layui.css" media="all">
<link type="text/css" href="../registerSystem/css/ZDaoHang/index.css" rel="stylesheet">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
 <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	<link href="assets/css/style-updateCalendar.css" rel="stylesheet">
	<link href="assets/css/jquery-ui.css" rel="stylesheet">
	<link href="css/whole.css" rel="stylesheet">
<script type="text/javascript" src="../registerSystem/js/jquery1.42.min.js"></script>
<script type="text/javascript">
		
		function init(){
			var TiaoValue=document.getElementById("TiaoValue").innerHTML;
			/*null直接写入就行，null和"null"的区别*/
			if(null==TiaoValue){
			window.location.href="showAll.do";
			}
		}





		$(document).ready(function(){
		    function anim(duration){
		        $('#mint').animate(
		            {height: 'toggle'},
		            {duration: duration}
		        );
		    }
		    $('#closebtn').click(function() {
		    	
		        $('#mintbar').slideUp();
		        document.getElementById("getReturn").style.display="block";
		        anim(600);
		    });
		   
		    $('#mint').click(function() {
		        anim(600);
		        $('#mintbar').slideDown('slow');
		    });
			
		});
		/*当鼠标划过该位置时候*/
		function huaThis(value){
			var PerValues=document.getElementById("PerValues"+value);
				PerValues.style.background="#f0f0f0";
		}
		function yuchuThis(value){
			/* var PerValues=document.getElementById("PerValues"+value);
			PerValues.style.backgroundImage=""; */
			var checks = document.getElementsByName("getCheck");
			for(var i=0;i<checks.length;i++){
				var k=i+1;
				if(checks[i].checked){
					var PerValues=document.getElementById("PerValues"+k);
					PerValues.style.background="#f0f0f0";
					
					
				}else{
				   
				   var PerValues=document.getElementById("PerValues"+k);
					PerValues.style.background="";
				}
			}			
			
			
		}
		function selectThis(value){
			var getSelectCheck=document.getElementById("selectCheck"+value);
			var checks = document.getElementsByName("getCheck");
			for(var i=0;i<checks.length;i++){
				var k=i+1;
				if(k==value){
					
					checks[i].checked=true;
					var PerValues=document.getElementById("PerValues"+k);
					PerValues.style.background="#f0f0f0";
					
				}else{
				   checks[i].checked = false;
				   var PerValues=document.getElementById("PerValues"+k);
					PerValues.style.background="";
				}
			}			
		}
		
		/*修改表单信息*/
		function UpdateForm(){
			var checks = document.getElementsByName("getCheck");
			var getChecked;
			var getBeChecked;
			for(var i=0;i<checks.length;i++){
				if(checks[i].checked){
					/*获取到对应I得值*/
					
					 getChecked=1;
					 /*对于原始定义的数，不必再需要强转了*/
					 getBeChecked=i+1;
				}
			}			
			/*如果有被选中的了，则将选中的获取到,我这里面的i其实是一直在自增的状态的*/
			if(getChecked==1){
				
				/*先将背景显示出来*/
				var AllBackground=document.getElementById("AllBackground");
					AllBackground.style.display="block";
				var updayPageShow=document.getElementById("updayPageShow");
					updayPageShow.style.display="block";	
				/*对选中的数进行操做，获取到类型先(不可改)，再将原有值获取到，要修改的值，点击确认*/
				/*先获取到原属类型填充的地方*/
				var getDataType=document.getElementById("dataType");
			
				/*获取原数据类型值*/	
				var getDataTyleValue=document.getElementById("PerName"+getBeChecked).innerText;
				
					getDataType.value=getDataTyleValue;
				/*获取到数据原来值*/	
				var getYuanDate=document.getElementById("PerCode"+getBeChecked).innerText;
				/*获取到源数据填充地方*/
				var dataYuanValu=document.getElementById("dataYuanValu");
					dataYuanValu.value=getYuanDate;
				/*修改的唯一标识,填充的地方*/
				var	getThisSureCode=document.getElementById("thisSureCode");
				/*获取到真实的ocde值*/	
				var getYuanDate=document.getElementById("PerCodes"+getBeChecked).innerText;
					getThisSureCode.value=getYuanDate;
			}else{
				showModle();
			}
			
			
			
		}
		function hideModel(){
			//关闭弹出框
			$('#myModal').modal('hide');
		}
		
		
		
		
		
		
		
		
		
		function addData(){
			
			/*先将背景显示出来*/
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="block";
			var addPageShow=document.getElementById("addPageShow");
				addPageShow.style.display="block";
			/*①:将该有的数据类型，对应下的新的数据编号给出*/	
			/*②：添加新的数据类型时候，将1：切换为新的input标签，2：将添加的编号切换为可填入的编号*/
			/*先完成①，使用ajax将编号是多少得到*/
				var getSelectValue=document.getElementById("addType").value;
				var HttpRequest=new XMLHttpRequest();
				HttpRequest.onreadystatechange=function(){
						
					
					if(HttpRequest.readyState==4){
						var data=HttpRequest.responseText;
						var getCodeinput=document.getElementById("addCode");
						getCodeinput.value=data;
					}
					
				}
														/*这个请求是还没完成继续执行别的请求？*/
				HttpRequest.open("post","getNewCode.do",true);
				HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
				HttpRequest.send("getType="+getSelectValue);
			
			
		}
		
		
		
		
		
		
		
		/*当选择框改变的时候，获取到改变值*/
		function getSeleFun(selectType){
			var getSelectTypeName=selectType.value;
			/*得到改变值以后就查找到对应的code值*/
			var HttpRequest=new XMLHttpRequest();
			HttpRequest.onreadystatechange=function(){
				if(HttpRequest.readyState==4){
					var data=HttpRequest.responseText;
					var getCodeinput=document.getElementById("addCode");
					getCodeinput.value=data;
				}
				
			}
		
			HttpRequest.open("post","getNewCode.do",true);
			HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
			HttpRequest.send("getType="+getSelectTypeName);

		}
		
		function showModle(){
			console.log("打开弹出框");
			$('#myModalLoading').modal('show');
		}
		//关闭弹出框
		function hideModel(){
			//关闭弹出框
			$('#myModalLoading').modal('hide');
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		function setStautes(){
			
			/*在这里面进行设置状态的操作*/
			var checks = document.getElementsByName("getCheck");
			var getChecked;
			var getBeChecked;
			for(var i=0;i<checks.length;i++){
				if(checks[i].checked){
					/*获取到对应I得值*/
					 getChecked=1;
					 /*对于原始定义的数，不必再需要强转了*/
					 getBeChecked=i+1;
				}
			}			
			/*如果有被选中的了，则将选中的获取到,我这里面的i其实是一直在自增的状态的*/
			if(getChecked==1){
				/*先将背景显示出来*/
					/*先将背景显示出来*/
				var AllBackground=document.getElementById("AllBackground");
					AllBackground.style.display="block";
				var deleteShow=document.getElementById("setStautes");
					deleteShow.style.display="block";
				/*对选中的数进行操做，获取到类型先(不可改)，再将原有值获取到，要修改的值，点击确认*/
				/*先获取到原属类型填充的地方*/
				var getDataType=document.getElementById("setStautType");
				/*获取原数据类型值*/	
				var getDataTyleValue=document.getElementById("PerName"+getBeChecked).innerText;
					getDataType.value=getDataTyleValue;
				/*获取到数据原来值*/	
				var getYuanDate=document.getElementById("PerCode"+getBeChecked).innerText;
				/*获取到源数据填充地方*/
				var dataYuanValu=document.getElementById("setStautData");
					dataYuanValu.value=getYuanDate;
				
			}else{
				showModle();
			}
		}
		
		
		
		
		
		function quxiao(value){
			
			if(value=="1"){
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="none";
			var updayPageShow=document.getElementById("updayPageShow");
				updayPageShow.style.display="none";
			}else if(value=="2"){
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="none";
			var updayPageShow=document.getElementById("addPageShow");
				updayPageShow.style.display="none";	
				
			}else if(value=="3"){
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="none";
			var deleteShow=document.getElementById("deletesShow");
				deleteShow.style.display="none";	
			}else if(value=="4"){
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="none";
			var setStautes=document.getElementById("setStautes");
				setStautes.style.display="none";	
			}else if(value=="5"){
			var AllBackground=document.getElementById("AllBackground");
				AllBackground.style.display="none";
			var setStautes=document.getElementById("setNewType");
				setStautes.style.display="none";	
			}
		}
		
		/*这里面进行下一页的跳转*/
		function upPage(){
			var seleSecValue=document.getElementById("seleSecValue").innerHTML;
			var seleSecValueName=document.getElementById("seleSecValueName").innerHTML;
			var getNowPage=document.getElementById("nowPage").innerText;
			/*获取到当前页*/
			
			if(getNowPage=="1"){
				
				
			}else{
			if(seleSecValue=="null"){
			var getNowPage=document.getElementById("nowPage").innerText;
			window.location.href="upPageDic.do?NowPage="+getNowPage;
			}else{
			var getNowPage=document.getElementById("nowPage").innerText;
			window.location.href="upPageSecDic.do?NowPage="+getNowPage+"&seleSecValueName="+seleSecValueName;	
					}
				}
			}
		
		function downPage(){
			var seleSecValue=document.getElementById("seleSecValue").innerHTML;
			var seleSecValueName=document.getElementById("seleSecValueName").innerHTML;
			/*获取到当前页*/
			if(seleSecValue=="null"){
			var getPageSize=document.getElementById("showPageSize").innerHTML;	
			var getNowPage=document.getElementById("nowPage").innerText;
			if(getPageSize==8){
			window.location.href="downPageDic.do?NowPage="+getNowPage;
			}
			}else{
			/*获取到跳转后的页的大下*/	
			var getPageSize=document.getElementById("showPageSize").innerHTML;
			var getNowPage=document.getElementById("nowPage").innerText;
			
			if(getPageSize==8){
			window.location.href="downPageSecDic.do?NowPage="+getNowPage+"&seleSecValueName="+seleSecValueName;	
			}
			}
		}
		
	
	
	 function setNewType(){
		 
		 var getNewType=document.getElementById("");
		 var HttpRequest=new XMLHttpRequest();
			HttpRequest.onreadystatechange=function(){
				if(HttpRequest.readyState==4){
					var data=HttpRequest.responseText;
					var getNewShow=document.getElementById("setNewType");
						getNewShow.style.display="block";
					var getNewShow=document.getElementById("AllBackground");
						getNewShow.style.display="block";	
					var getCode=document.getElementById("getNewTypeCode");
						getCode.value=data;
					
				}
				
			}
		
			HttpRequest.open("post","getMaxCode.do",true);
			HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
			HttpRequest.send("");
		 /*这里面进行赋值：①将ajax返回的回传值返回过来赋予到input(code)里面,并设置为不可更改
		 				     ②将隐藏的页面显示出来
		 */
		 
		 
		 
		 
	 }
	 
	function SelectType(){
		
		var getType=document.getElementById("getType").value;
		
		
		window.location.href="showSectValue.do?getSeletSection="+getType;
		
		
		
	}	
	
	
	function firstPage(){
		
		var seleSecValue=document.getElementById("seleSecValue").innerHTML;
		var seleSecValueName=document.getElementById("seleSecValueName").innerHTML;
		var getNowPage=document.getElementById("nowPage").innerText;
		/*获取到当前页*/
		
		if(getNowPage=="1"){
			
			
		}else{
		if(seleSecValue=="null"){
		var getNowPage=document.getElementById("nowPage").innerText;
		window.location.href="upPageDic.do?NowPage=2";
		}else{
		var getNowPage=document.getElementById("nowPage").innerText;
		window.location.href="upPageSecDic.do?NowPage=2&seleSecValueName="+seleSecValueName;	
				}
			}
	}
	function endPage(){
		
		var seleSecValue=document.getElementById("seleSecValue").innerHTML;
		var seleSecValueName=document.getElementById("seleSecValueName").innerHTML;
		if(seleSecValue=="null"){
			var getNowPage=document.getElementById("nowPage").innerText;
			window.location.href="endPageDic.do";
		}else{
			var getNowPage=document.getElementById("nowPage").innerText;
			window.location.href="endPageSecDic.do?seleSecValueName="+seleSecValueName;	
					}
		
		
	}
	
		
</script>
<style type="text/css">
		
	select{
		width:180px;
		height:30px;
		border:0;
		border:1px solid #666;
		border-radius:5px;
		font-size:16px;
		background-color: #fff;
		text-align:center;
		margin-top: 25px;
	}


</style>


</head>
<body onload="init()" style="background:#f0f0f0;">
			<script src="../registerSystem/js/laydate.js"></script>
			<div style="display:none;" id="TiaoValue"><%=request.getAttribute("TiaoValue")%></div>
			<div style="display:none;" id="seleSecValue"><%=request.getAttribute("seleSecValue")%></div>
			<div style="display:none;" id="seleSecValueName"><%=request.getAttribute("seleSecValueName")%></div>
			<div style="display:none;" id="showPageSize"><%=request.getAttribute("pageSize")%></div>
		<div style="width:100%;height:30px;background:#bbb;">
			<h3 style="position:absolute;margin-top:8px;margin-left:30px;"><span style="color:#000;font-size:15px;">查询条件</span></h3>
		</div>
		
		
		<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							选择错误：
						</h4>
					</div>
					<div class="modal-body">
						请选择一个数据类型！！！
					</div>
					
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModalLoadings" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示：
						</h4>
					</div>
					<div class="modal-body">
						修改成功！！！
					</div>
					
				</div>
			</div>
		</div>
		<div style="background:#f0f0f0;width:1000px;height:550px;position:absolute;margin-left:50px;margin-top:0px;" >
					
						
						<!--这里是设置左侧的下拉框，显示类型  -->
						<div style="width:800px;height:80px;position:absolute;margin-left:50px;margin-top:10px;">
						
							<span style="position:absolute;margin-top:20px;margin-left:20px;font-size:15px;color:#000"  >查询您想要的字典类型:</span>
							<div style="position:absolute;margin-top:-10px;margin-left:200px;">
								<select style="width:150px;" id="getType">
									<c:forEach items="${getPerDic}" var="PerDic">
										<option>${PerDic.type}</option>
									</c:forEach>
								</select>
							</div>
							<div style="position:absolute;margin-top:15px;margin-left:400px;" onclick="SelectType()"><div class="btn btn-primary">确认</div></div>
						</div>
						
						<!--四种状态值的设置  -->
						<div style="width:1566px;height:30px;background:#b0b0b0;position:absolute;margin-left:-50px;margin-top:100px;">
							<span style="position:absolute;margin-top:5px;margin-left:20px;font-size:15px;color:#000">您可选择的几种设置：</span>
							<!--修改表单信息  -->
						<div style="width:132px;height:50px;float:left;position:absolute;margin-top:-18px;margin-left:130px;" onclick="UpdateForm()">
							<i id="Judges1" class="layui-icon" style="color: #000;font-size:20px;position:absolute;margin-left:40px;margin-top:18px;">&#xe642;</i>
							<div style="position:absolute;margin-top:28px;margin-left:55px;"><span style="font-size:15px;color:#000;font-weight:600">修改表单</span></div>
						</div>
						<!--添加表单信息  -->
						<div style="width:132px;height:50px;float:left;cursor:pointer;position:absolute;margin-top:-10px;margin-left:230px;" onclick="addData()">
							<i id="Judges1" class="layui-icon" style="color: #000;font-size:20px;position:absolute;margin-left:40px;margin-top:12px;">&#xe654;</i>
							<div style="position:absolute;margin-top:21px;margin-left:55px;"><span style="font-size:15px;color:#000;font-weight:600">添加信息</span></div>
						</div>
					
						<!--更改表单状态  -->
						<div style="width:142px;height:50px;float:left;cursor:pointer;position:absolute;margin-top:-10px;margin-left:330px;" onclick="setStautes()">
							<i id="Judges1" class="layui-icon" style="color: #000;font-size:20px;position:absolute;margin-left:40px;margin-top:12px;">&#xe620;</i>
							<div style="width:80px;height:40px;position:absolute;margin-top:21px;margin-left:65px;"><span style="font-size:15px;color:#000;font-weight:600">设置状态</span></div>
						</div>
						<!--编辑新的字典类型  -->
						<div style="width:132px;height:50px;float:left;cursor:pointer;position:absolute;margin-top:-9px;margin-left:430px; ">
							<i id="Judges1" class="layui-icon" style="color:#000;font-size:20px;position:absolute;margin-left:40px;margin-top:12px;">&#xe608;</i>
							<div style="width:200px;height:40px;position:absolute;margin-top:21px;margin-left:65px;"><span style="font-size:15px;color:#000;font-weight:600"  onclick="setNewType()">添加新的字典类型</span></div>
						</div>
						</div>
						
						
						
						
						
						
						
						
						
						
						
			
			<!--这里面显示的是查询出来的对应的该类下面的信息  -->
			<div style="width:750px;height:550px;border:4px;border-color:#c0c0c0;position:absolute;margin-left:250px;margin-top:200px;">
				<!--着这里画东西  -->
				<div style="width:750px;height:500px;background:#f0f0f0;position:absolute;margin-left:-200px;margin-top:-60px;">
					
					
					<!--这里面写入具体的每列值  -->
					<div style="width:750px;height:450px;background:#f0f0f0;float:left;">
						<!--头部位置一行有哪些信息  -->
						<form action="" method="post"> 
							<table >
								
								<tr style="width:750px;height:50px;border-style:solid;border-width:1px;/* background-image: url(./image/huise.jpg); */border-color:#c0c0c0;">
									<td style="width:100px;height:50px;"><span style="position:absolute;margin-left:40px;margin-top:-7px;"><input type="radio"/></span></td>
									<td style="width:100px;height:50px;"><span style="position:absolute;margin-left:40px;margin-top:-10px;font-size:18px;font-weight:600;color:#000;">ID</span></td><!-- <td style="transform: rotate(90deg) translate(0px,0px) ;"></td> -->
									<td style="width:160px;height:50px;"><span style="position:absolute;margin-left:70px;margin-top:-10px;font-size:18px;font-weight:600;color:#000;">类型</span></td>
									<td style="width:240px;height:50px;"><span style="position:absolute;margin-left:70px;margin-top:-10px;font-size:18px;font-weight:600;color:#000;">名称/值</span></td>
									<td style="width:150px;height:50px;"><span style="position:absolute;margin-left:40px;margin-top:-10px;font-size:18px;font-weight:600;color:#000;">状态</span></td>
								</tr>
								
								<c:forEach items="${getAllPerDic}" var="PerAllDic">
								<tr id="PerValues${PerAllDic.shunXuId}" style="border-style:solid;border-width:1px;color:#000;border-color:#c0c0c0;ursor:pointer;" onmouseover="huaThis(${PerAllDic.shunXuId})" onmouseout="yuchuThis(${PerAllDic.shunXuId})" onclick="selectThis(${PerAllDic.shunXuId})" >
									<td style="width:100px;height:40px;"><span style="position:absolute;margin-left:40px;margin-top:-10px;"><input id="selectCheck${PerAllDic.shunXuId}" name="getCheck" type="radio"/></span></td>
									<td style="width:100px;height:40px;"><span style="position:absolute;margin-left:40px;margin-top:-10px;font-size:15px;font-weight:600">${PerAllDic.shunXuId}</span></td>
									<td id="PerName${PerAllDic.shunXuId}" style="width:100px;height:40px;"><span style="position:absolute;margin-left:70px;margin-top:-10px;font-size:15px;font-weight:600">${PerAllDic.type}</span></td>
									<td id="PerCodes${PerAllDic.shunXuId}" style="display:none;width:100px;height:40px;"><span style="position:absolute;margin-left:76px;margin-top:-10px;font-size:15px;font-weight:600">${PerAllDic.code}</span></td>
									<td id="PerCode${PerAllDic.shunXuId}" style="width:100px;height:40px;"><span style="position:absolute;margin-left:76px;margin-top:-10px;font-size:15px;font-weight:600">${PerAllDic.name}</span></td>
									<td style="width:100px;height:40px;"><span style="position:absolute;margin-left:40px;margin-top:-10px;font-size:15px;font-weight:600">${PerAllDic.states}</span></td>
								</tr>
								</c:forEach>
							
								
							</table>
						</form>
						<!--展示上一页，下一页的  -->
						<div style="width:750px;height:100px;position:absolute;margin-top:-10px;margin-left:0px;border-color:#c0c0c0;">
							<div onclick="firstPage()" style="cursor:pointercursor:pointer;width:50px;height:20px;position:absolute;margin-top:30px;margin-left:55px;"><button style="width:80px;height:25px;"><span style="font-weight:600;color:#000">首页</span></button></div>
							<div onclick="upPage()" style="cursor:pointercursor:pointer;width:50px;height:20px;position:absolute;margin-top:30px;margin-left:165px;"><button style="width:80px;height:25px;"><span style="font-weight:600;color:#000">上一页</span></button></div>
							<div  style="border-radius:10px;border-style:solid;border-width:1px;border-color:#000;cursor:pointer;width:50px;height:20px;position:absolute;margin-top:30px;margin-left:282px;"><button  style="color:#000;position:absolute;margin-left:-2px;margin-top:-2px;width:80px;height:25px;" >第<span id="nowPage" style="font-weight:600;color:#000" ><%=request.getAttribute("getNowPage")%></span>页</button></div>
							<div onclick="downPage()" style="cursor:pointer;cursor:pointer;width:50px;height:20px;position:absolute;margin-top:30px;margin-left:400px"><button style="width:80px;height:25px;"  ><span style="font-weight:600;color:#000">下一页</span></button></div>
							<div onclick="endPage()" style="cursor:pointercursor:pointer;width:50px;height:20px;position:absolute;margin-top:30px;margin-left:505px;"><button style="width:80px;height:25px;"><span style="font-weight:600;color:#000">尾页</span></button></div>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
		<!--这里面显示的是要更改的页面  -->
		<div  id="AllBackground"  style="display:none;width:100%;height:100%;background:#000;position:absolute;margin-left:0px;margin-top:0px;opacity:0.6;z-index:4000;">
		</div>
		<div id="updayPageShow" style="display:none;width:545px;height:380px;border-style:solid;border-width:1px;border-color:#c0c0c0;background:#e0e0e0;position:absolute;margin-left:390px;margin-top:70px;opacity:0.95;z-index:4000;">
					<!--在这里面设置头部信息  -->
					<div style="width:545px;height:48px;background:#e0e0e0;position:absolute;margin-left:0px;margin-top:0px;">
						<!--在这里面点击×后，消失  -->
						<div style="width:30px;height:30px;position:absolute;margin-left:500px;margin-top:3px;cursor:pointer;" onclick="quxiao(1)"><span style="font-size:30px;">×</span></div>
						<!--在这里面画上一块用于标记修改的地方  -->
						<div style="width:200px;height:40px;position:absolute;margin-left:180px;margin-top:4px;">
							<i id="Judges1" class="layui-icon" style="color: #000;font-size:40px;position:absolute;margin-left:10px;margin-top:1px;">&#xe642;</i>
							<div style="position:absolute;margin-top:20px;margin-left:42px;"><span style="font-size:20px;color:#000;">修改表单</span></div>
						</div>
					</div>
					<div style="width:545px;height:2px;background:#c0c0c0;position:absolute;margin-left:0px;margin-top:48px;"></div>
					<!--这里面写入正文的地方  -->
					<div  style="width:345px;height:240px;border-style:solid;border-width:1px;border-color:#c0c0c0;position:absolute;margin-left:100px;margin-top:80px;">
						<form action="updateFormss.do" method="post">
							<!--在这里写入修改的类型 -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:20px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">数据类型：</span>
								<input id="dataType" name="dataType" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" readonly/>
							</div>
							<!--在这里面写入修改的原本值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:70px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">原数据值：</span>
								<input id="dataYuanValu" name="dataYuanValu" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" readonly/>
							</div>
							<!--在这里面写入修改的最终值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:120px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">更改值为：</span>
								<input id="changeValue" name="changeValue" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;"/>
							</div>
							<!--作为唯一标识的修改值 -->
							<div style="display:none;"><input id="thisSureCode" name="thisSureCode" type="text" /></div>
							<!--确认按钮 -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:170px;"> 
								
								<input type="submit" value="确认修改" class="btn btn-primary" style="color:#fff;width:80px;height:30px;position:absolute;margin-left:50px;margin-top:7px;border-radius:10px;"/>
							</div>
						</form>
					</div>
		</div>
		<!--这里面是添加的部分  -->
		<div id="addPageShow" style="display:none;width:545px;height:380px;border-style:solid;border-width:1px;border-color:#c0c0c0;background:#e0e0e0;position:absolute;margin-left:390px;margin-top:70px;opacity:0.95;z-index:4000;">
					<!--在这里面设置头部信息  -->
					<div style="width:545px;height:48px;background:#e0e0e0;position:absolute;margin-left:0px;margin-top:0px;">
						<!--在这里面点击×后，消失  -->
						<div style="width:30px;height:30px;position:absolute;margin-left:500px;margin-top:3px;cursor:pointer;" onclick="quxiao(2)"><span style="font-size:30px;">×</span></div>
						<!--在这里面画上一块用于标记修改的地方  -->
						<div style="width:200px;height:40px;position:absolute;margin-left:180px;margin-top:4px;">
							<i id="Judges1" class="layui-icon" style="color: #000;font-size:40px;position:absolute;margin-left:5px;margin-top:0px;">&#xe654;</i>
							<div style="position:absolute;margin-top:20px;margin-left:42px;"><span style="font-size:20px;color:#000;">添加信息</span></div>
						</div>
					</div>
					<div style="width:545px;height:2px;background:#c0c0c0;position:absolute;margin-left:0px;margin-top:48px;"></div>
					<!--这里面写入正文的地方  -->
					<div  style="width:345px;height:240px;border-style:solid;border-width:1px;border-color:#c0c0c0;position:absolute;margin-left:100px;margin-top:80px;">
						<form action="addData.do" method="post">
							<!--在这里写入修改的类型 -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:20px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">数据类型：</span>
								<select id="addType" name="addType" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" onchange="getSeleFun(this)">
									<c:forEach items="${getPerDic}" var="PerDic">
									<option>${PerDic.type}</option>
									</c:forEach>
								</select>
							</div>
							<!--在这里面写入修改的原本值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:70px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">添加编号：</span>
								<input id="addCode" name="addCode" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" readonly/>
							</div>
							<!--在这里面写入修改的最终值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:120px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">添加数据：</span>
								<input id="addData" name="addData" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;"/>
							</div>
							<!--确认按钮-->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:170px;"> 
								<input type="submit" value="确认添加" class="btn btn-primary"  style="color:#fff;width:80px;height:30px;position:absolute;margin-left:50px;margin-top:7px;border-radius:10px;"/>
							</div>
						</form>
					</div>
		</div>
		

		<!--这里面是设置状态  -->
		<div id="setStautes" style="display:none;width:545px;height:380px;border-style:solid;border-width:1px;border-color:#c0c0c0;background:#e0e0e0;position:absolute;margin-left:390px;margin-top:70px;opacity:0.95;z-index:4000;">
					<!--在这里面设置头部信息  -->
					<div style="width:545px;height:48px;background:#e0e0e0;position:absolute;margin-left:0px;margin-top:0px;">
						<!--在这里面点击×后，消失  -->
						<div style="width:30px;height:30px;position:absolute;margin-left:500px;margin-top:3px;cursor:pointer;" onclick="quxiao(4)"><span style="font-size:30px;">×</span></div>
						<!--在这里面画上一块用于标记修改的地方  -->
						<div style="width:200px;height:40px;position:absolute;margin-left:180px;margin-top:4px;">
							<i  class="layui-icon" style="color: #000;font-size:40px;position:absolute;margin-left:5px;margin-top:0px;">&#xe620;</i>
							<div style="position:absolute;margin-top:20px;margin-left:42px;"><span style="font-size:20px;color:#000;">设置状态</span></div>
						</div>
					</div>
					<div style="width:545px;height:2px;background:#c0c0c0;position:absolute;margin-left:0px;margin-top:48px;"></div>
					<!--这里面写入正文的地方  -->
					<div  style="width:345px;height:240px;border-style:solid;border-width:1px;border-color:#c0c0c0;position:absolute;margin-left:100px;margin-top:80px;">
						<form action="setStautData.do" method="post">
							<!--在这里写入修改的类型 -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:20px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">数据类型：</span>
								<input id="setStautType" name="setStautType" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;">
									
								
							</div>
							<!--在这里面写入修改的原本值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:70px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">数据信息：</span>
								<input id="setStautData" name="setStautData" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" readonly/>
							</div>
							<!--在这里面写入修改的最终值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:120px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">设置状态：</span>
								<select id="setStautState" name="setStautState" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;">
								<option>启用</option>
								<option>禁用</option>
								</select>
							</div>
							<!--确认按钮-->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:170px;"> 
								<input type="submit" value="确认设置" class="btn btn-primary"  style="color:#fff;width:80px;height:30px;position:absolute;margin-left:50px;margin-top:7px;border-radius:10px;"/>
							</div>
						</form>
					</div>
		</div>
		<!--这里是设置添加新的类别  -->
		<div id="setNewType" style="display:none;width:545px;height:380px;border-style:solid;border-width:1px;border-color:#c0c0c0;background:#e0e0e0;position:absolute;margin-left:390px;margin-top:70px;opacity:0.95;z-index:4000;">
					<!--在这里面设置头部信息  -->
					<div style="width:545px;height:48px;background:#e0e0e0;position:absolute;margin-left:0px;margin-top:0px;">
						<!--在这里面点击×后，消失  -->
						<div style="width:30px;height:30px;position:absolute;margin-left:500px;margin-top:3px;cursor:pointer;" onclick="quxiao(5)"><span style="font-size:30px;">×</span></div>
						<!--在这里面画上一块用于标记修改的地方  -->
						<div style="width:200px;height:40px;position:absolute;margin-left:180px;margin-top:4px;">
							<i  class="layui-icon" style="color: #000;font-size:40px;position:absolute;margin-left:-25px;margin-top:0px;">&#xe608;</i>
							<div style="position:absolute;margin-top:20px;margin-left:12px;"><span style="font-size:20px;color:#000;">添加新的字典类型</span></div>
						</div>
					</div>
					<div style="width:545px;height:2px;background:#c0c0c0;position:absolute;margin-left:0px;margin-top:48px;"></div>
					<!--这里面写入正文的地方  -->
					<div  style="width:345px;height:240px;border-style:solid;border-width:1px;border-color:#c0c0c0;position:absolute;margin-left:100px;margin-top:80px;">
						<form action="setNewType.do" method="post">
							<!--在这里写入修改的类型 -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:20px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">数据类型：</span>
								<input id="getNewType" name="getNewType" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" />
							</div>
							<!--在这里面写入修改的原本值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:70px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">类型编号：</span>
								<input id="getNewTypeCode" name="getNewTypeCode" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;" readonly/>
							</div>
							<!--在这里面写入添加的类型值  -->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:120px;"> 
								<span	style="width:80px;height:20px;position:absolute;margin-left:10px;margin-top:10px;font-weight:600;font-style:solid;color:#000;">类型值：</span>
								<input id="getNewTypeVal" name="getNewTypeVal" type="text" style="width:80px;height:20px;border-radius:10px;position:absolute;margin-left:80px;margin-top:7px;font-weight:600;font-style:solid;color:#000;"/>
							</div>
							
							<!--确认按钮-->
							<div style="width:200px;height:40px;border-style:solid;border-width:1px;border-color:#c0c0c0;border-radius:10px;position:absolute;margin-left:70px;margin-top:170px;"> 
								<input type="submit" value="确认添加" class="btn btn-primary"  style="color:#fff;width:80px;height:30px;position:absolute;margin-left:50px;margin-top:7px;border-radius:10px;"/>
							</div>
						</form>
					</div>
		</div>

		
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="assets/js/fullcalendar/fullcalendar.min.js"></script>    
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery-ui.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>






</body>
</html>