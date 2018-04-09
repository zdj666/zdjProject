

<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>
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
 <title>超级管理员授权</title>
 <link href="css/EmPower/theme-css.css" rel="stylesheet">
<link href="css/EmPower/zui.css" rel="stylesheet">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet"> 
<link href="css/whole.css" rel="stylesheet">
<script src="layui/layui.js"></script>
	<script type="text/javascript">
		function init(){
			var getTiao=document.getElementById("getTiao").innerHTML;
				if(getTiao=="null"){
					
					window.location.href="getValue.do";
				}
				if(getTiao=="2"){
					/*得到要赋予值的名字Id*/
					var getName=document.getElementById("NameValue");
					/*得到名字值*/
					var getShowName=document.getElementById("trueshowName");
					    getShowName.style.display="block";
					var getNameTrue=document.getElementById("getNameValue").innerHTML;
						getName.innerHTML=getNameTrue;
						getName.style.fontWeight="bold";
						getName.style.color="#000";
						
						
					/*得到要赋予值的名字Id*/
					var getItem=document.getElementById("ItemValue");
					/*得到名字值*/
					var getItemTrue=document.getElementById("getItemValue").innerHTML;
						getItem.innerHTML="当前已被授予的角色为："+getItemTrue;
						getItem.style.fontWeight="bold";
						getItem.style.color="#000";	
				}
				if(getTiao=="3"){
					var getName=document.getElementById("NameValue");
					/*得到名字值*/
					var getShowName=document.getElementById("trueshowName");
					    getShowName.style.display="block";
					var getNameTrue=document.getElementById("getNameValue").innerHTML;
						getName.innerHTML=getNameTrue;
						getName.style.fontWeight="bold";
						getName.style.color="#000";
					/*得到要赋予值的名字Id*/
					var getItem=document.getElementById("ItemValue");
					/*得到名字值*/
					var getItemTrue=document.getElementById("getItemValue").innerHTML;
						getItem.innerHTML="当前已被授予的角色为："+getItemTrue;
						getItem.style.fontWeight="bold";
						getItem.style.color="#000";
					/*得到了所有被授权的功能，现在就是将这些功能前面打上勾*/
					/*先获取到有的功能*/
					var getShouFun=document.getElementById("getFunctinValue").innerHTML;
					/*全部功能长度*/
					var functionSize=document.getElementById("functionSize").innerHTML;
					
					/*得到单选框*/
					var checks = document.getElementsByName("getFun");
					/*得到每一个得值*/
					var getPerHas=getShouFun.split(",");
					for(var j=0;j<functionSize;j++){
					var ks=parseInt(j)+1;	
					var kss=ks.toString();
					var getPerFun=document.getElementById("getPerFun"+kss).innerText;	
						for(var k=1;k<getPerHas.length;k++){
								var ks=k.toString();
							if(getPerFun.trim()==getPerHas[k].trim()){
								checks[j].checked=true;
								continue;
							}
						}
					}
					/*根据打对号的来*/
					var checks = document.getElementsByName("getFun");
					for(var j=0;j<functionSize;j++){
						var ks=parseInt(j)+1;	
						var kss=ks.toString();
					if(checks[j].checked){
						var getUser=document.getElementById("UserPla"+kss);
						
						getUser.style.background="#337ab7";
						var getUnUser=document.getElementById("UnUsedPla"+kss);
						getUnUser.style.background="#708090";
					}else{
						var getUser=document.getElementById("UserPla"+kss);
						getUser.style.background="#708090";
						var getUnUser=document.getElementById("UnUsedPla"+kss);
						getUnUser.style.background="#337ab7";
					}
					}
				}
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*这里是将要授权的人的角色*/
		function getItems(roleId){
			var  getBackground=document.getElementById("AllBackground");
			     getBackground.style.display="block";
			var  getBackground=document.getElementById("showGetRole");
			     getBackground.style.display="block";
			     
		   var  getRoleName=document.getElementById("ItemValue").innerHTML;     
		   var  giveRole=document.getElementById("giveRole"); 
		        giveRole.innerHTML=getRoleName;
		   var  getNameValue=document.getElementById("NameValue").innerHTML;     
		   var  giveName=document.getElementById("giveName"); 
		        giveName.innerHTML=getNameValue;
		}
		
		
		
		
		
		
		
		
		
		
		

		function upPage(){
			/*获取到当前页*/
			var NowDown=document.getElementById("NowDown").innerHTML;
			var getNowPage=document.getElementById("nowPage").innerHTML;
			if(getNowPage=="1"){
				
			}else{
				if(NowDown=="2"){
					var getNowPage=document.getElementById("nowPage").innerHTML;
					var PowerName=document.getElementById("PowerName").innerHTML;
					window.location.href="JueUpPage.do?NowPage="+getNowPage+"&PowerName="+PowerName;	
				}else if(NowDown=="1"){
					var getName=document.getElementById("PowerName").innerHTML;
					window.location.href="upRenPage.do?NowPage="+getNowPage+"&getName="+getName;
				}else{
			var getNowPage=document.getElementById("nowPage").innerHTML;
			window.location.href="upPage.do?NowPage="+getNowPage;
					}
				}
			}
		
		function downPage(){
			/*获取到当前页*/
			
			var NowDown=document.getElementById("NowDown").innerHTML;
			
			/*根据姓名查询了*/
			if(NowDown=="1"){
				/*得到要查询的人姓名名称*/
				var getNowPage=document.getElementById("nowPage").innerHTML;
				var getName=document.getElementById("PowerName").innerHTML;
				
				window.location.href="downRenPage.do?NowPage="+getNowPage+"&getName="+getName;
			/*这里进行了角色的查询的下一页*/
			}else if(NowDown=="2"){
				var getNowPage=document.getElementById("nowPage").innerHTML;
				var PowerName=document.getElementById("PowerName").innerHTML;
				window.location.href="JueDownPage.do?NowPage="+getNowPage+"&PowerName="+PowerName;
				
			}else{
		
			var getNowPage=document.getElementById("nowPage").innerHTML;
			window.location.href="downPage.do?NowPage="+getNowPage;
			}
		}
		
		function Used(value,updataId){
			/*使用该功能*/
			
			var getQuan=document.getElementById("ItemValue").innerHTML;
			
			var getQu=getQuan.split("：");
			
			var getQuans=getQu[1];
				
			var HttpRequest=new XMLHttpRequest();
			HttpRequest.onreadystatechange=function(){
				if(HttpRequest.readyState==4){
					var data=HttpRequest.responseText;
					var data=HttpRequest.responseText;
					var getUser=document.getElementById("UserPla"+data);
						getUser.style.background="#337ab7";
					var getUnUser=document.getElementById("UnUsedPla"+data);
						getUnUser.style.background="#708090";
					var checks = document.getElementById("getCheck"+value);
						checks.checked=true;
				}
				
			}
		
			HttpRequest.open("post","Used.do",true);
			HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
			HttpRequest.send("UserFun="+value+"&updataId="+updataId+"&getQuan="+getQuans);
			
		}
		function UnUsed(value,updataId){
			/*禁用该功能*/
			/*都得到禁用的权级*/
			
			var getQuan=document.getElementById("ItemValue").innerHTML;
			
			var getQu=getQuan.split("：");
			
			var getQuans=getQu[1];
			
			var HttpRequest=new XMLHttpRequest();
			HttpRequest.onreadystatechange=function(){
				if(HttpRequest.readyState==4){
					var data=HttpRequest.responseText;
					var getUser=document.getElementById("UserPla"+data);
						getUser.style.background="#708090";
					var getUnUser=document.getElementById("UnUsedPla"+data);
						getUnUser.style.background="#337ab7";
					var checks = document.getElementById("getCheck"+value);
						checks.checked=false;
				}
				}
				
			
		
			HttpRequest.open("post","UnUsed.do",true);
			HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
			HttpRequest.send("JinFun="+value+"&updataId="+updataId+"&getQuan="+getQuans);
			
		}
		
		function getSelect(){
			var getSelectValue=document.getElementById("getSelect").value;
				if(getSelectValue=="人员查询"){
					var getJueSe=document.getElementById("selectJueSe");
						getJueSe.style.display="none";
					var getPerSon=document.getElementById("selectPerson");
						getPerSon.style.display="block";	
				}else if(getSelectValue=="角色查询"){
					var getPerSon=document.getElementById("selectPerson");
						getPerSon.style.display="none";
					var getJueSe=document.getElementById("selectJueSe");
						getJueSe.style.display="block";
				}
			
			
		}
		
		
		function jueseSele(){
			/*得到角色名称*/
			
			var geyPowerName=document.getElementById("getPower").value;
			
				window.location.href="SelPowerByName.do?PowerName="+geyPowerName;
				
			}
		
		function personSel(){
			var getName=document.getElementById("getName").value;
			window.location.href="SeleByName.do?Name="+getName;
		}
		
		/*这里面点击了选择的人名*/
		function getPerName(UserId){
			
			var getQuan=document.getElementById("ItemValue").innerHTML;
			var HttpRequest=new XMLHttpRequest();
			HttpRequest.onreadystatechange=function(){
				if(HttpRequest.readyState==4){
					var data=HttpRequest.responseText;
					var getShowName=document.getElementById("trueshowName");
					    getShowName.style.display="block";
					   
					var getRole=document.getElementById("ItemValue");
					
						getRole.innerHTML="当前已被授予的角色为："+data;
						getRole.style.fontWeight="bold";
						getRole.style.color="#000";
					var getName=document.getElementById("NameValue");
					
						getName.style.fontWeight="bold";
						getName.style.color="#000";	
					}
				}
				
			
		
			HttpRequest.open("post","SeleRole.do",true);
			HttpRequest.setRequestHeader("content-Type","application/x-www-form-urlencoded;charset=utf-8;scriptCharset=utf-8");
			HttpRequest.send("UserId="+UserId);
			
			
		}
		
		function judgeMa(value){
			
			/*这时候是一定已经选择了角色了,获取角色名称*/
			var getRoleName=document.getElementById("ItemValue").innerHTML;
			if(value=="2"){
			    
				var getPower= document.getElementById("ItemValue").innerHTML;
				document.getElementById("values").value=document.getElementById("ItemValue").innerHTML;
				var getAllVal=document.getElementById("NameValue").innerHTML;
				var PerCode=getAllVal.split(":");
			
				var PerCodes=PerCode[1].split(")");
				
				var PerName=getAllVal.split(",");
				
				document.getElementById("nameValue").value =PerName;
				document.getElementById("pages").value = document.getElementById("nowPage").innerHTML;
				
				document.getElementById("AllVal").value =getAllVal;
				document.getElementById("NameCodess").value =PerCodes[0];
				if(getPower=="角色选择"){
			
				}else{
					document.getElementById("formId").action = "getFunction.do";
					document.getElementById("formId").submit();
				
				}
			/*否则就是取消回到原来*/	
			}else{
				
			     window.location.href="getValue.do";
			
			}
			
		}
	
		function judgeQuCiao(){
			
			var judgeQuXiao= document.getElementById("judgeQuXiao");
			    judgeQuXiao.style.display="block";
			
		}
		
		function judgeSure(){
			
			var judgeSure= document.getElementById("judgeSure");
			    judgeSure.style.display="block";
		}
		function judgeQuCiaos(){
			
			var judgeQuXiao= document.getElementById("judgeQuXiao");
			    judgeQuXiao.style.display="none";
			
		}
		
		function judgeSures(){
			
			var judgeSure= document.getElementById("judgeSure");
			    judgeSure.style.display="none";
		}
		
		
	</script>
	

</head>
	
<body class="layui-layout-body" onload="init()">
	<div style="display:none;" id="getTiao"><%=request.getAttribute("tiaoValue")%></div>
	<div style="display:none;" id="getNameValue"><%=request.getAttribute("NameValue")%></div>
	<div style="display:none;" id="getItemValue"><%=request.getAttribute("ItemValue")%></div>
	<div style="display:none;" id="getFunctinValue"><%=request.getAttribute("getFunctinValue")%></div>
	<div style="display:none;" id="functionSize"><%=request.getAttribute("functionSize")%></div>
	<div style="display:none;" id="NowDown"><%=request.getAttribute("NowDown")%></div>
	<div style="display:none;" id="PowerName"><%=request.getAttribute("PowerName")%></div>
	
	
	
	
	
	
	
	<div  id="AllBackground"  style="display:none;width:100%;height:100%;background:#000;position:absolute;margin-left:0px;margin-top:0px;opacity:0.6;z-index:4000;">
	</div>
	<div   id="showGetRole" style="display:none;width:600px;height:110px;position:absolute;margin-top:40px;margin-left:380px;z-index:10000;" >
		<div id="title" style="width:600px;height:60px;background:#68dff0;">
		<span style="font-size:15px;font-weight:600;font-style:solid;color:#000;">温馨提示:</span>
		<span style="position:absolute;margin-top:16px;margin-left:40px;font-size:15px;color:#000;">是否确认将<span id="giveName" style="font-size:15px;font-weight:600;font-style:solid;color:#000;"></span>授权为:<span id="giveRole" style="font-size:15px;font-weight:600;font-style:solid;color:#000;" ></span>?</span>
		<!--取消授权的提示栏  -->
		<div id="judgeQuXiao" style="width:500px;height:80px;display:none;position:absolute;margin-left:5px;margin-top:38px;">
						<div style="width:135px;height:30px;position:absolute;margin-left:5px;margin-top:10px;background:#e0e0e0"><span style="position:absolute;margin-top:5px;margin-left:10px;font-size:10px;color:#000;">点击取消将全部重置！</span></div>
						<div style="width:30px;height:30px;position:absolute;margin-left:140px;margin-top:10px;font-size:0;border:solid 15px;border-color:#fff #fff #fff #e0e0e0;"></div>	
		</div>
		<!--确认授权的提示栏  -->
		<div id="judgeSure" style="width:500px;height:80px;display:none;position:absolute;margin-left:280px;margin-top:35px;">
						<div style="width:140px;height:30px;position:absolute;margin-left:80px;margin-top:10px;background:#e0e0e0"><span style="position:absolute;margin-top:5px;margin-left:20px;font-size:10px;color:#000;">点击确认将授权成功！</span></div>
						<div style="width:30px;height:30px;position:absolute;margin-left:50px;margin-top:10px;font-size:0;border:solid 15px;border-color:#fff #e0e0e0 #fff #fff;"></div>	
		</div>
	
		</div>	
		<div id="buttons" style="width:600px;height:50px;background:#fff;">
			<div onclick="judgeMa(1)" class="btn btn-primary" style="position:absolute;margin-top:5px;margin-left:160px;" onmouseover="judgeQuCiao()" onmouseout="judgeQuCiaos()">取消</div>
			<div onclick="judgeMa(2)" class="btn btn-primary" style="position:absolute;margin-top:5px;margin-left:260px;" onmouseover="judgeSure()"   onmouseout="judgeSures()">确认</div>
		</div>	
			
			
	</div>
	
	<div style="width:100%;height:40px;background:#bbb;">
	
	<h3 style="position:absolute;margin-top:8px;"><i class="fa fa-angle-right" style="margin-left:30px"></i><span style="color:#000;font-size:15px;">选择要授予的人：</span></h3>
	</div>
	
	
	<div class="choose_area">
		<button class="choose_area_title">
			<div id="trueshowName" style="display:none;width:230px;height:40px;float:left;"><span style="position:absolute;margin-top:10px;margin-left:30px;font-size:18px;font-weight:600;color:#000;">您所选中的授权人名为：</span></div><h3 id="NameValue" style="font-size:18px;width:200px;height:40px;float:left;">授权人名</h3>
			<img src="image/sj.png"class="on">
		</button>
		<div class="choose_area_cont" id="getChooseName">
			<div style="width:100%;height:80px;">
					<!--这里设置授权框(选择人员/查询人员)  -->
			<div style="position:absolute;margin-top:0px;margin-left:410px;border-radius:10px;width:485px;height:80px;background:#e6e6e6;border-style:solid;border-width:1px;border-color:#fff;">
			  <div style="width:200px;height:30px;">
				  <select id="getSelect" onchange="getSelect()" style="width:150px;height:35px;position:absolute;margin-top:18px;margin-left:52px;font-style:solid;" >
				  	  <option style="">角色查询</option>
				  	  <option style="">人员查询</option>
				  </select>		
					<!--角色查询  -->
					<div style="width:110px;height:50px;position:absolute;margin-top:9px;margin-left:270px;" id="selectJueSe" >
				            <div style="position:absolute;margin-left:-50px;margin-top:5px;"">
				             <ex:sex  message="RoleName" />
						 	</div> 
						 	 <input type="button" value="查询" onclick="jueseSele()" class="btn btn-primary" style="width:54px;height:32px;position:absolute;margin-top:11px;margin-left:142px;font-weight:600;font-style:solid;color:#000;" >
					</div>
					<!--人员查询  -->		 
					<div style="width:110px;height:50px;position:absolute;margin-top:5px;margin-left:310px;display:none;" id="selectPerson">
						
					          <input type="text" id="getName" style="width:180px;height:35px;position:absolute;margin-top:12px;margin-left:-91px;" >
						 	  <input type="button" value="查询"  onclick="personSel()" class="btn btn-primary" style="width:55px;height:34px;position:absolute;margin-top:13px;margin-left:100px;font-weight:600;font-style:solid;color:#000;">
						 	 
					</div>	 
				</div>
				
			
			 </div>
			
			</div>
			

			
			
			<div style="width:100%;height:1px;background:#e6e6fa;"></div>
			
			<div style="width:100%;height:300px;position:absolute;margin-left:200px;">
				<!--平移该人名div  -->
				<div style="width:300px;height:30px;position:absolute;margin-left:400px;"><span style="font-size:15px;font-weight:600;font-style:solid;color:#000;">请选择要授权人</span></div>
				<div style="border-style:solid;border-width:1px;border-color:#e6e6fa;width:385px;height:230px;position:absolute;margin-top:20px;margin-left:263px;">
				<c:forEach items="${getPerson}" var="getPerson">
				<div style="position:absolute;width:100%;height:1px;background:#e6e6e6;"></div><br />
				<ul style="float:left;cursor:pointer; position:absolute;height:300px;width:100%;;">
				<li id="NameMing" onclick="getPerName(${getPerson.id})" style="width:300px;height:50px;overflow:hidden;float:left;position:absolute;margin-left:30px;"><h4>${getPerson.name},(用户名:${getPerson.code})</h4></li>
				</ul>
				<br />
				</c:forEach>
				
			</div>
			<div style="width:385px;height:1px;background:#e6e6fa;position:absolute;margin-left:263px;margin-top:220px;"></div>
				<div style="width:200px;height:30px;position:static;margin-left:340px;margin-top:330px;">
					<button onclick="upPage()" style="width:66px;height:20px;position:absolute;margin-left:4px;margin-top:-106px;cursor:pointer;font-weight:600;font-style:solid;color:#000;">上一页</button>
					<button style="width:66px;height:20px;position:absolute;margin-left:83px;margin-top:-105px;font-weight:600;font-style:solid;color:#000;">第<span id="nowPage" style="font-weight:600;font-style:solid;color:#000;" ><%=request.getAttribute("getNowPage")%></span>页</button>
					<button onclick="downPage()" style="width:66px;height:20px;position:absolute;margin-left:160px;margin-top:-105px;cursor:pointer;font-weight:600;font-style:solid;color:#000;">下一页</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<form id="formId" method="post">
	<input type="hidden" id="values" name="PowerVal"/>
	<input type="hidden" id="nameValue" name="NameTrue"/>
	<input type="hidden" id="pages" name="page"/>
	<input type="hidden" id="AllVal" name="AllVals"/>
	<input type="hidden" id="NameCodess" name="NameCodele"/>
			</form>
			
			
			
			
			
			
			
			
			
	<div class="choose_shcool">
		<button class="choose_shcool_title" disabled>
			<h3 id="ItemValue" style="font-size:18px;position:absolute;margin-left:30px;">角色选择 </h3>
			<img src="image/sj.png">
		</button>
		<div class="choose_shcool_cont">
			<!--这里面显示一横线注释上您所表示的角色一栏  -->
			<div style="width:100%;height:40px;background:#c0c0c0;">
					<span style="position:absolute;margin-left:50px;margin-top:10px;font-size:15px;">以下是您可重新授予的权限：</span>	
			</div>
			<ul>				
				<c:forEach items="${getRole}" var="getRoles">
				<li onclick="getItems(${getRoles.id})" style="cursor:pointer;width:100%;height:49px">
					<h3 style="cursor:pointer;width:100%;height:55px;position:absolute;margin-left:50px;">${getRoles.roleName}</h3>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</div>
	<div class="choose_subject" >
		<button class="choose_subject_title" disabled>
			<h3 style="font-size:18px;position:absolute;margin-left:30px;">选择权限</h3>
			<img src="image/sj.png">
		</button>
		
		<div class="choose_subject_cont" id="chooseSub" style="height:300px;">
		
		
		
		
					<!--这里面显示一横线注释上您所表示的角色一栏  -->
				<div style="width:100%;height:40px;background:#c0c0c0;">
						<span style="position:absolute;margin-left:50px;margin-top:10px;font-size:15px;">以下是您可选择授予的功能：</span>	
				</div>
			
				<c:forEach items="${getFun}" var="getFun">
				<div style="width:800px;height:35px;position:absolute;margin-left:50px;margin-top:20px;">
				<div style="width:20px;height:20px;position:absolute;margin-left:0px;margin-top:10px;"><input id="getCheck${getFun.lineId}" type="checkbox" name="getFun" /></div>
				<ul>
				<li id="getPerFun${getFun.lineId}" style="width:400px;height:35px;position:absolute;margin-left:50px;margin-top:0px;">
					<h4>${getFun.menuBar}</h4>
				</li>
				</ul>
				<div  style="width:200px;height:30px;position:absolute;margin-left:400px;margin-top:2px;">
				<div onclick="Used(${getFun.lineId},${getFun.id})" id="UserPla${getFun.lineId}" style="cursor:pointer;width:60px;height:24px;position:absolute;margin-left:10px;margin-top:2px;border-radius:10px;"><span  style="color:#e0e0e0;position:absolute;margin-left:12px;">启用</span></div>
				<div onclick="UnUsed(${getFun.lineId},${getFun.id})" id="UnUsedPla${getFun.lineId}" style="cursor:pointer;width:60px;height:24px;position:absolute;margin-left:80px;margin-top:2px;border-radius:10px;"><span style="color:#e0e0e0;position:absolute;margin-left:12px;">禁用</span></div>
				</div>
				</div><br />
				<div  style="background:#e6e6fa;width:100%;height:1px;position:absolute;margin-left:0px;margin-top:35px;"></div>
				<br />
				</c:forEach>
			
		
		
		
		
		
			
			</div>
			
		</div>
			
	
<script src="assets/js/jquery.js"></script>  
<script src="assets/js/bootstrap.min.js"></script>	
<script src="js/jquery.min.js"></script>
<script src="js/exams.js"></script>
<script>
	$(function(){
		$("body").css("min-height",document.documentElement.clientHeight);
	});
</script>
	
</body>
</html>