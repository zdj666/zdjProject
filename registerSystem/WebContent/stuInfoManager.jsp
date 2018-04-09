<%@page import="com.hzyc.registerSystem.tools.Dict"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String role = (String)request.getSession().getAttribute("role"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>个人信息管理</title>
<link rel="stylesheet" href="css/layui.css">
<!-- <link rel="stylesheet" href="css/whole.css">
 -->
<link rel="stylesheet" href="css/login.css">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    
<!-- Custom styles for this template -->
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
 
 
 <script type="text/javascript">

function upDateAction(){
    document.name.action="updateStuInfo.do";
    document.name.submit();
}
</script>
<script type="text/javascript">

function getFileName(o){
    var pos=o.lastIndexOf("\\");
    return o.substring(pos+1);  
}
var  picSign=true;     
function viewImage(file){
	var picInfoDiv = document.getElementById('picInfoDiv');

	//获取图片名^[A-Za-z0-9]+$
		var fileObj = $("#caseImage").val();
		var fileName = getFileName(fileObj);
		//alert(fileName);
	if(/[\u4E00-\u9FA5]/g.test(fileName) == false){
		picInfoDiv.style.display="none";
		//设置图片两字div不可见
		var spanDivId =document.getElementById("spanDivId");
		var picDivId =document.getElementById("picDivId"); 
		spanDivId.style.display = "none";
		picDivId.style.display="block";
		picSign=false;
	    var preview = document.getElementById('preview');
	    if(file.files && file.files[0]){
	        //火狐下
	        preview.style.display = "block";
	    	preview.style.width = "120px";
	        preview.style.height = "140px"; 
	        preview.src = window.URL.createObjectURL(file.files[0]); 
	        picSign=true;  
	    }else{
	        //ie下，使用滤镜
	        file.select();
	        var imgSrc = document.selection.createRange().text;
	        var localImagId = document.getElementById("localImag"); 
	        //必须设置初始大小 
	  		localImagId.style.width = "120px"; 
	        localImagId.style.height = "140px";  
	        try{ 
	        localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	        locem("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
	        picSign=true;  
	        }catch(e){ 
	        	openLogin("您上传的图片格式不正确，请重新选择!");
	        	picSign=false;  
	        return false; 
	        } 
	        preview.style.display = 'none'; 
	        document.selection.empty(); 
	        } 
	        return true; 	
		
	}else{
		picSign=false;
		picInfoDiv.style.display="block";
		openLogin("图片格式不正确");
		return false; 
	}
	
	
}
//校验电话
var  phoneSign=true; 
function setStyle(){
	var phoneWarm=document.getElementById("phoneWarm");
	var phoneId=document.getElementById("phoneId").value;
		if(phoneId == ""){
		phoneWarm.style.color="red";
		openLogin("联系方式不能为空");
		phoneSign=false; 
		//设置按钮不可点击
		document.getElementById("buttonId").style.backgroundColor="#5bc0de";
		document.getElementById("buttonId").disabled=true;
		}else{
			if(!(/^1[34578]\d{9}$/.test(phoneId))){
				phoneWarm.style.color="red";
				openLogin("输入格式不正确");
				phoneSign=false; 
				//设置按钮不可点击
				document.getElementById("buttonId").style.backgroundColor="#5bc0de";
				document.getElementById("buttonId").disabled=true;
			}else{
				phoneWarm.style.color="#333";
				phoneSign=true;
				//设置按钮可点击
				document.getElementById("buttonId").disabled=false;
			}
		}	
}

//校验身份证号
var idNumSign=true;
function existIdCode(){
	var idnumberWarm=document.getElementById("idnumberWarm");
	var idNumber=document.getElementById("idNumberId").value;
	var idNumberInit=document.getElementById("numberId").value;

	if(idNumber==""){
		idnumberWarm.style.color="red";
	//如果为空则需要提示,获取span标签
	openLogin("身份证号不能为空");
	idNumSign=false;
	//设置按钮不可点击
	document.getElementById("submitId").style.backgroundColor="#e3e3e3";
	document.getElementById("submitId").disabled=true;
	}else{
		//限制身份证号只能为18位或者15正则表达式
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		if(reg.test(idNumber) == false){
			idnumberWarm.style.color="red";
			openLogin("身份证号格式不对");
			idNumSign=false;
			//设置按钮不可点击
			document.getElementById("submitId").style.backgroundColor="#e3e3e3";
			document.getElementById("submitId").disabled=true;
		}else{
		 	if(idNumberInit==idNumber){
		 		idNumSign=true;	
			}else{
				//限制身份证号不能重复
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState == 4){
						var data = xmlhttp.responseText;
						if(data == 'NO'){
							idnumberWarm.style.color="red";
							openLogin("该号已存在");
							idNumSign=false;
							//设置按钮不可点击
							document.getElementById("submitId").style.backgroundColor="#e3e3e3";
							document.getElementById("submitId").disabled=true;
						}else{
							idnumberWarm.style.color="#333";
							idNumSign=true; 
							document.getElementById("submitId").style.backgroundColor="#ffffff";
							document.getElementById("submitId").disabled=false;
						}
						}
				};
				xmlhttp.open("post","selectIdNumber.do",true);
				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xmlhttp.send("idNumber="+idNumber);	
		
			}
				
			}
	}	
}

//校验邮箱  
var  emailSign=true;
 function  setEmailStyle(){
		var emailWarm=document.getElementById("emailWarm");
		var emailId=document.getElementById("emailId").value;
			if(emailId == ""){
			emailWarm.style.color="red";
			openLogin("邮箱不能为空");
			emailSign=false;
			//设置按钮不可点击
			document.getElementById("buttonId").style.backgroundColor="#5bc0de";
			document.getElementById("buttonId").disabled=true;
			}else{
				if(!(/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(emailId))){
					emailWarm.style.color="red";
					openLogin("邮箱输入格式不正确");
					emailSign=false;
					//设置按钮不可点击
					document.getElementById("buttonId").style.backgroundColor="#5bc0de";
					document.getElementById("buttonId").disabled=true;
				}else{
					emailWarm.style.color="#333";
					emailSign=true;
					//设置按钮可点击
					document.getElementById("buttonId").style.backgroundColor="#5bc0de";
					document.getElementById("buttonId").disabled=false;
				}
			}	
}
//校验密码
var  passwordSign=true;
 function  exitPassword(){
	 var passwordWarm=document.getElementById("passwordWarm");
	var passwordIdvalue=document.getElementById("passwordId").value;
	if(passwordIdvalue==""){
		openLogin("密码不能为空");
		passwordWarm.style.color="red";
		passwordSign=false;
		//设置按钮不可点击
		document.getElementById("buttonId").style.backgroundColor="#5bc0de";
		document.getElementById("buttonId").disabled=true;
	}else{
		passwordWarm.style.color="#333";
		passwordSign=true;
		//设置按钮可点击
		document.getElementById("buttonId").style.backgroundColor="#5bc0de";
		document.getElementById("buttonId").disabled=false;
		
	}		
	
}
//校验所有信息
 function  allThing(){

		var phoneIdvalue=document.getElementById("phoneId").value;
		var passwordIdvalue=document.getElementById("passwordId").value;
		var emailIdvalue=document.getElementById("emailId").value;
		var idNumber=document.getElementById("idNumberId").value;
		if(phoneIdvalue==""||passwordIdvalue==""||emailIdvalue==""||idNumber==""){
			openLogin("请仔细核对信息是否填写完整");
			//设置按钮不可点击
			document.getElementById("buttonId").style.backgroundColor="#5bc0de";
			document.getElementById("buttonId").disabled=true;
		}else{
			if(passwordSign == false || emailSign == false ||  phoneSign == false || picSign == false ||idNumSign==false){
				//设置按钮不可点击
				document.getElementById("buttonId").style.backgroundColor="#5bc0de";
				document.getElementById("buttonId").disabled=true;	
				openLogin("请仔细核对信息是否填写正确");
			}else{
				//设置按钮可点击
				document.getElementById("buttonId").style.backgroundColor="#5bc0de";
				document.getElementById("buttonId").disabled=false;
				
			}

		}
	} 
	
//提示框
	function openLogin(info){
		console.log("打开弹出框");
		var spanObj = document.getElementById("spanId");
		spanObj.innerHTML = "<font size='3' color='black'><b>"+info+"</b></font>";
		$('#myModalLoading').modal('show');
		
	}
	//关闭弹出框
	function hideModel(){
		//关闭弹出框
		$('#myModalLoading').modal('hide');
	}
</script>

<style>

*{
		margin:0;
		padding:0;
		font-family: '微软雅黑';
		color:#333;
	}
input[type='text'],input[type='password']{
	width:250px;height:35px;
		border:1px solid #555;
		border-radius:5px;
		background-color: #fff;
		font-size:16px;
	}
select,option{
	width:250px;height:35px;
		border:0;
		border:1px solid #666;
		border-radius:5px;
		font-size:16px;
		background-color: #fff;
		text-align:center;
	}
input[type='submit']{
		width:100px;
		height:30px;
		background-color: #68dff0;
		border-radius:5px;
		border:0;
		color:#fff;
		font-size:20px;
		font-weight:600;
		
}
input[type='button']{
		width:160px;
		height:35px;
		background-color: #68dff0;
		border-radius:5px;
		border:0;
		color:#fff;
		font-size:20px;
		/* font-weight:600; */
		
}
button{

	border:0;
	border-radius:5px;
	background:#5bc0de;
	width:100px;
	height:35px;
	font-size:20px;
}
	img{
		margin-left:10%;
		width:120px;
		height:140px;
		float: left;
	}
	#img-wrapper:hover{
	   transform: scale(2);  
	}
	#img-wrapper{
		
		cursor: pointer;  
        transition: all 0.6s;  
		
	}

	tr{
	width:1200px;
	}
	td{
	width:370px;
/* 	margin-left:-430px; 
	margin-top:-435px; */
	}
</style>
	<script type="text/javascript">
		function init(){		
			/* var getSureShow=document.getElementById("getSureShow").innerHTML;
			alert(getSureShow);
			if(getSureShow=="2"){
				document.getElementById("major").value="";
				document.getElementById("major").style.display="block";
					
				document.getElementById("SchoolName").value="";
				document.getElementById("SchoolName").style.display="block";
				
			}else{
				
				/*添加一块DIV*/
	
		
		/* 	document.getElementById("major").value="";
			document.getElementById("major").disabled=false;
			
			document.getElementById("SchoolName").value="";
			document.getElementById("SchoolName").disabled=false; */
			
			
			
		}

	</script>
</head>
<body onload="init()">
<!-- 提示框 -->
			<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
							友情提示
						</h4>
					</div>
					<div class="modal-body">
						<span id="spanId"></span><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
<h3 style="font-size:24px; margin-left: -150px">个人信息管理</h3>
	<div style="display:none;" id="getSureShow" class="display:none;"><%=request.getAttribute("getSureShow")%></div>
	<div id="SureShowDiv" style="opacity:1;display:none;background:#e2e2e2;width:100%;height:65px;position:absolute;margin-left:0px;margin-top:492px;"></div>
	<div id="getSureShow" style="display:none;"><%=request.getAttribute("getSureShow")%></div>	
	<form  name="name"  method="post" enctype="multipart/form-data" style="margin-left:10%;margin-top: 2%;">
   		<table>
   			<tr >
<%--    				<td colspan="3" id="localImag">
   					
   				   	<div style="width:1350px;height:140px;float:left;">
   						<div style="width:120px;height:140px; float:left;margin-top:10px;  margin-left: 210px;border-radius:5px;border: 1px solid #666">
   						   	<div  id="picDivId" style="width:120px;height:140px; float:left;margin-top:0px;">
   						   		<img id="preview" style="width:120px;height:140px;margin-top:-1px;  margin-left: -1px;diplay:none" /> 			
   						   	</div>
   							<div id="spanDivId" style="width:120px;height:140px;float:left;margin-top:0px;">
								<span id="spanpictureId" style="width:120px; height:140px; line-height:140px; text-align:center;font-size:17px;">照片</span>
   						   	</div>
   							<input type="hidden" id="picIdInput" value="${stuUsersInfo.pictureName}"/>
   							<script type="text/javascript">
   								var picPath=document.getElementById("picIdInput").value;
   								
   								if(picPath==""){
   						            var spanDivId =document.getElementById("spanDivId");
   						         	var picDivId =document.getElementById("picDivId"); 
   	   					            var preview = document.getElementById('preview');
   	   					      		var spanpictureId = document.getElementById('spanpictureId');
   	   					         	preview.style.display = "none";
   	   					      		spanDivId.style.display = "block";
   	   					      		picDivId.style.display="none";
   	   					      		spanpictureId.style.display="block";
   								}else{
   									var preview = document.getElementById('preview');
   									preview.style.display="block";
   	   					      		preview.src="photo/"+picPath;
   	   					      		var spanDivId =document.getElementById("spanDivId");
						         	var picDivId =document.getElementById("picDivId");
						         	var spanpictureId = document.getElementById('spanpictureId');
	   					      		spanDivId.style.display = "none";
	   					      		picDivId.style.display="block";
	   					      		spanpictureId.style.display="none";
   								}

   							</script>
   						</div>
   						
   						<div style="width:800px;height:140px;float:left;margin-left:-60px;">
   							<div style="width:800px;height:70px;float:left;">
   							<input type="hidden" name="id" value="${stuUsersInfo.id}" /> 
   							<span style="font-size:17px;margin-left:220px;margin-top:56px;float:left;">更改头像：</span><input type="file" id="caseImage" value="1" name="caseImage" onchange="viewImage(this)" style="margin-left:340px; margin-top: 56px;"/>

   							</div>
   							<div style="margin-left:10px;">
   								<span style="font-size:17px">用户账号：</span><input type="text" name="code" value="${stuUsersInfo.code}" readonly="readonly" style="margin-left:30px; margin-top:35px;"/>
   							</div>
   						</div>
   						
   					</div>
   				</td> --%>
   			<td>
   					<div style="width:120px;height:140px; float:left;margin-top:10px;  margin-left:180px;border-radius:5px;border: 1px solid #666">
   						   	<div  id="picDivId" style="width:120px;height:140px; float:left;margin-top:0px;">
   						   		<img id="preview" style="width:120px;height:140px;margin-top:-1px;  margin-left: -1px;diplay:none" /> 			
   						   	</div>
   							<div id="spanDivId" style="width:120px;height:140px;float:left;margin-top:0px;">
								<span id="spanpictureId" style="width:120px; height:140px; line-height:140px; text-align:center;font-size:17px;">照片</span>
   						   	</div>
   							<input type="hidden" id="picIdInput" value="${stuUsersInfo.pictureName}"/>
   							<script type="text/javascript">
   								var picPath=document.getElementById("picIdInput").value;
   								
   								if(picPath==""){
   						            var spanDivId =document.getElementById("spanDivId");
   						         	var picDivId =document.getElementById("picDivId"); 
   	   					            var preview = document.getElementById('preview');
   	   					      		var spanpictureId = document.getElementById('spanpictureId');
   	   					         	preview.style.display = "none";
   	   					      		spanDivId.style.display = "block";
   	   					      		picDivId.style.display="none";
   	   					      		spanpictureId.style.display="block";
   								}else{
   									var preview = document.getElementById('preview');
   									preview.style.display="block";
   	   					      		preview.src="photo/"+picPath;
   	   					      		var spanDivId =document.getElementById("spanDivId");
						         	var picDivId =document.getElementById("picDivId");
						         	var spanpictureId = document.getElementById('spanpictureId');
	   					      		spanDivId.style.display = "none";
	   					      		picDivId.style.display="block";
	   					      		spanpictureId.style.display="none";
   								}

   							</script>
   						</div>
   			
   			</td>
   			<td>
   						<div style="width:600px;height:140px;float:left;">
   							<div style="width:600px;height:70px;float:left;">
   							<input type="hidden" name="id" value="${stuUsersInfo.id}" /> 
   							<span style="font-size:17px;margin-left:120px;margin-top:56px;float:left;">更改头像:</span><input type="file" id="caseImage" value="1" name="caseImage" onchange="viewImage(this)" style="margin-left:240px; margin-top: 56px;"/><span id="picInfoDiv" style="color:#FF3030;font-size:10px;display:none;">图片名只能为英文字母</span>

   							</div>
   					<!-- <div id="picInfoDiv" style="">
		    	  	<span style="color:#FF3030;font-size:10px;">图片名只能为英文字母</span>
		    	  </div> -->
   							<div>
   								<span style="font-size:17px">用户账号:</span><input type="text" name="code" value="${stuUsersInfo.code}" readonly="readonly" style="margin-left:30px; margin-top:35px;"/>
   							</div>
   						</div>			
   			</td>
   			</tr>
   			<tr>
   				<td>
   					<span style="font-size:17px">用户姓名:</span><input type="text" name="name" value="${stuUsersInfo.name}" id="nameId"  style="margin-left:30px; margin-top: 16px;"/>
   				</td>
   				<td>
   					<span  id="passwordWarm" style="font-size:17px">用户密码:</span><input type="password" name="password" id="passwordId"   onblur="exitPassword()" value="${stuUsersInfo.password}" style="margin-left:30px; margin-top: 16px;"/>
   				</td>

   			</tr>
   			<tr>
   				<td>
   					<span id="phoneWarm" style="font-size:17px;">用户电话:</span><input type="text" name="phone"   id="phoneId"  onblur="setStyle()"  value="${stuUsersInfo.phone}"  style="margin-left:30px; margin-top: 16px;"/>											
   				</td>
   				<td>
   					<span id="emailWarm" style="font-size:17px">用户邮箱:</span><input type="text" name="email"  id="emailId"  onblur="setEmailStyle()"  value="${stuUsersInfo.email}" style="margin-left:30px; margin-top: 16px;"/>       
   				</td>
   				
   			</tr>
   			<tr>
   			<td id ="mbTd">
   				 	<span style="font-size:17px">密保问题:</span><select id="mbSelect" name="question" style="margin-left:30px; margin-top: 16px;"><option id="questionId" >${stuUsersInfo.question}</option></select>
   				 	<script type="text/javascript">
   				 	var selectObj=document.getElementById("mbSelect");
   				    var optionObj=document.getElementById("questionId").value;
   				 	 <%String []array=Dict.getQuestionData();
   				 	 for(int i=0;i<array.length;i++){
   				 	String question=array[i];
   				 	%> 
   				 if(optionObj!="<%=question%>"){
   				 	selectObj.innerHTML+="<option>"+'<%=question%>'+"</option>";
   				 	}	
   				 	<% }%>
   				 	 
   				 	
   				 	</script>
   				</td>
   				<td>
   					<span style="font-size:17px">密保答案:</span><input type="text" name="answer" value="${stuUsersInfo.answer}" style="margin-left:30px; margin-top: 16px;"/>
   				</td>

   			</tr>
   			<tr>

   				<%if(role !=null && role.equals("2")){%>
   				 <td>
   				 	<span style="font-size:17px">身份证号:</span><input type="text"  readonly="readonly" name="idNumber" value="${stuUsersInfo.idNumber}" style="margin-left:30px; margin-top: 16px;"/>
   				</td>
   				<%}else{ %>
   				<td>
   					<input type="hidden" id="numberId"  value="${stuUsersInfo.idNumber}"/>
   				 	<span id="idnumberWarm" style="font-size:17px">身份证号:</span><input type="text" id="idNumberId"  name="idNumber" value="${stuUsersInfo.idNumber}" onblur="existIdCode()"  style="margin-left:30px; margin-top: 16px;"/>
   				</td>
   				<%} %>
				
   				<td>
   					<span style="font-size:17px">家庭地址:</span><input type="text" name="address" value="${stuUsersInfo.address}" style="margin-left:30px; margin-top: 16px;"/>
   				</td>
   			</tr>
		<%if(role !=null && role.equals("2")){
			
		System.out.println("role ==========" +role );
			%>
			<tr>
   				<td>
   					<span style="font-size:17px">学校名称:</span><select id="schoolSelect" name="school" style="margin-left:30px; margin-top: 16px;"><option id="schoolId" >${stuUsersInfo.school}</option></select> 
 					<script type="text/javascript">
   				 	var selectObj=document.getElementById("schoolSelect");
   				 	var optionObj=document.getElementById("schoolId").value;
   				 	 <%String []ar=Dict.getSchoolData();
   				 	 for(int i=0;i<ar.length;i++){
   				 	String school=ar[i];
   				 	%> 
 					if(optionObj!="<%=school%>"){
 					selectObj.innerHTML+="<option >"+'<%=school%>'+"</option>";
 					}
   				 		
   				 	<% }%>
   				 	 
   				 	
   				 	</script>
   				
   				</td>
   				<td>
   					<span style="font-size:17px">专业名称:</span><input id="major"  type="text" name="major" value="${stuUsersInfo.major}" style="margin-left:30px; margin-top: 16px;"/>
   				</td>
   			</tr>
		<% }else{%>
		
		<%} %>
   			<tr>
   				<td colspan="2">
   					<button  value="修改" onclick="upDateAction()" id="buttonId"   onmouseover="allThing()" style="margin-left:-15%;margin-top: 26px;">修改</button>
   				</td>

   			</tr>
   		</table>
	</form>	
</body>
</html>