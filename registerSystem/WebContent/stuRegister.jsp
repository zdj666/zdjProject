<%@page import="com.hzyc.registerSystem.tools.Dict"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>   
<%@ page language="java"%> 
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册页面</title>
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
//-----------上传图片显示图片---------
		function getFileName(o){
		    var pos=o.lastIndexOf("\\");
		    return o.substring(pos+1);  
		}
picSign=false;
function viewImage(file){
	var picInfoDiv = document.getElementById('picInfoDiv');

	//获取图片名^[A-Za-z0-9]+$
		var fileObj = $("#caseImage").val();
		var fileName = getFileName(fileObj);
		//alert(fileName);
	if(/[\u4E00-\u9FA5]/g.test(fileName) == false){
		//英文
		//alert("11");
		picSign=true;
		picInfoDiv.style.display="none";
		//设置按钮可以点击
		document.getElementById("submitId").style.backgroundColor="#ffffff";
		document.getElementById("submitId").disabled=false;
        var preview = document.getElementById('preview');
        var srcSpanId =document.getElementById("srcSpanId");
        if(file.files && file.files[0]){
            //火狐下
            //设置图片两字不可见
            srcSpanId.style.display = "none";
            preview.style.display = "block";
            preview.style.width = "120px";
            preview.style.height = "140px";
            preview.src = window.URL.createObjectURL(file.files[0]);
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
		picInfoDiv.style.display="block";
		//有汉字
		//alert("22");
		openLogin("请检查图片格式");
		picSign=false;
		return false; 
	}
        }
//身份证号
var idNumSign=false;
function existIdCode(){
	var idNumber=document.getElementById("idNumberId").value;
	if(idNumber==""){
	//如果为空则需要提示,获取span标签
	openLogin("身份证号不能为空");
	//设置按钮不可点击
	document.getElementById("submitId").style.backgroundColor="#e3e3e3";
	document.getElementById("submitId").disabled=true;
	}else{
		//限制身份证号只能为18位或者15正则表达式
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		if(reg.test(idNumber) == false){
			openLogin("身份证号格式不对");	
			//设置按钮不可点击
			document.getElementById("submitId").style.backgroundColor="#e3e3e3";
			document.getElementById("submitId").disabled=true;
		}else{
			//限制身份证号不能重复
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4){
					var data = xmlhttp.responseText;
					if(data == 'NO'){
						openLogin("该号已存在");
						//设置按钮不可点击
						document.getElementById("submitId").style.backgroundColor="#e3e3e3";
						document.getElementById("submitId").disabled=true;
					}else{
						idNumSign=true;
						var idCode=document.getElementById("codeId");
						//截取字符串后六位
						idCode.value=idNumber.substr(idNumber.length-6);  
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
//账号截取
function codeSet(){
var idNumber=document.getElementById("idNumberId").value;
if(idNumber!=""){
	var idCode=document.getElementById("codeId");
	//截取字符串后六位
	idCode.value=idNumber.substr(idNumber.length-6);
}else{
	openLogin("账号不用手动填写，请输入身份证号自动截取");
}
}
//校验密码
var passwordSign=false;
function cheakoutPw(){
var password01=document.getElementById("password01Id").value;
var password02=document.getElementById("password02Id").value;
	if(password01==""||password02==""){
		openLogin("密码不能为空");
		//设置按钮不可点击
		document.getElementById("submitId").style.backgroundColor="#e3e3e3";
		document.getElementById("submitId").disabled=true;
	}else{	
		if(password01!=password02){
				openLogin("密码不匹配");
				//设置按钮不可点击
				document.getElementById("submitId").style.backgroundColor="#e3e3e3";
				document.getElementById("submitId").disabled=true;
				}else{
				passwordSign=true;
				//设置按钮可以点击
				document.getElementById("submitId").style.backgroundColor="#ffffff";
				document.getElementById("submitId").disabled=false;
				}
	}
}

var phoneSign=false;
//设置电话号码位数
function setStyle(){
	var phoneId=document.getElementById("phoneId").value;
		if(phoneId == ""){
		//如果为空则需要提示,获取span标签
		openLogin("联系方式不能为空");
		//设置按钮不可点击
		document.getElementById("submitId").style.backgroundColor="#e3e3e3";
		document.getElementById("submitId").disabled=true;
		}else{
			if(!(/^1[34578]\d{9}$/.test(phoneId))){
				openLogin("输入格式不正确");
				//设置按钮不可点击
				document.getElementById("submitId").style.backgroundColor="#e3e3e3";
				document.getElementById("submitId").disabled=true;
				
			}else{
				phoneSign=true;
				//设置按钮可以点击
				document.getElementById("submitId").style.backgroundColor="#ffffff";
				document.getElementById("submitId").disabled=false;
			}
		}	
}
//校验邮箱  
var emailSign=false;
 function  setEmailStyle(){
		var emailId=document.getElementById("emailId").value;
			if(emailId == ""){
			//如果为空则需要提示,获取span标签
			openLogin("邮箱不能为空");
			//设置按钮不可点击
			document.getElementById("submitId").style.backgroundColor="#e3e3e3";
			document.getElementById("submitId").disabled=true;
			}else{
				if(!(/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(emailId))){
					openLogin("邮箱输入格式不正确");
					sign=false;	
					//设置按钮不可点击
					document.getElementById("submitId").style.backgroundColor="#e3e3e3";
					document.getElementById("submitId").disabled=true;
					
				}else{
					emailSign=true;
					//设置按钮可以点击
					document.getElementById("submitId").style.backgroundColor="#ffffff";
					document.getElementById("submitId").disabled=false;
				}
			}	
}
//再次校验密码
var ppSign=false;
function  cheakPw(){
	var password01=document.getElementById("password01Id").value;
	var password02=document.getElementById("password02Id").value;
		if(password01==""){
			openLogin("密码不能为空");
			//设置按钮不可点击
			document.getElementById("submitId").style.backgroundColor="#e3e3e3";
			document.getElementById("submitId").disabled=true;
		}else{	
			if((password01!=password02)&&(password02!="")){
					openLogin("密码不匹配！请确认密码");
					//设置按钮不可点击
					document.getElementById("submitId").style.backgroundColor="#e3e3e3";
					document.getElementById("submitId").disabled=true;
					}else{
					ppSign=true;
					//设置按钮可以点击
					document.getElementById("submitId").style.backgroundColor="#ffffff";
					document.getElementById("submitId").disabled=false;
					}
		}
}
//校验所有
function  allThing(){
	var idNumbervalue=document.getElementById("idNumberId").value;
	var phoneIdvalue=document.getElementById("phoneId").value;
	var password01Idvalue=document.getElementById("password01Id").value;
	var password02Idvalue=document.getElementById("password02Id").value;
	var mbSelectvalue=document.getElementById("mbSelect").value;
	var emailIdvalue=document.getElementById("emailId").value;
	//图片校验
	if(picSign==false||idNumbervalue==""||phoneIdvalue==""||password01Idvalue==""||password02Idvalue==""||mbSelectvalue==""||emailIdvalue==""){
		openLogin("请仔细核对信息是否填写完整");
		//设置按钮不可点击
		document.getElementById("submitId").style.backgroundColor="#e3e3e3";
		document.getElementById("submitId").disabled=true;
	}else{
		
		if(ppSign==false||emailSign==false||phoneSign==false||picSign==false||passwordSign==false||idNumSign==false){
			openLogin("请仔细核对信息是否填写正确");
			//设置按钮不可点击
			document.getElementById("submitId").style.backgroundColor="#e3e3e3";
			document.getElementById("submitId").disabled=true;
			
			
		}else{
			//设置按钮可以点击
			document.getElementById("submitId").style.backgroundColor="#ffffff";
			document.getElementById("submitId").disabled=false;
		}

	}
	
}
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
		width:250px;
		height:35px;
		
		border:1px solid #555;
		border-radius:5px;
		background-color: #fff;
		font-size:16px;
	}
	/* input[type='file']{
		width:200px;
		height:40px;
		border:1px solid #555;
		border-radius:5px;
		background-color: #fff;
		font-size:16px;
	} */
select,option{
		width:250px;
		height:35px;
		border:0;
		border:1px solid #666;
		border-radius:5px;
		font-size:16px;
		background-color: #fff;
		text-align:center;
	}
input[type='submit']{
		width:160px;
		height:35px;
		/* background-color: #e2e2e2; */
		background-color: #fff;
		border-radius:5px;
		border:0;
		color:#666;
		font-size:24px;
		/* font-weight:600; */
 		
}
/* input[type='button']{
		width:100px;
		height:30px;
		background-color: #68dff0;
		border-radius:5px;
		border:0;
		color:#fff;
		font-size:20px;
		font-weight:600;
		
} */
/* button{
		width:200px;
		height:50px;
		background-color: #68dff0;
		border-radius:5px;
		border:0;
		color:#fff;
		font-size:20px;
		font-weight:600;
		
} */
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
	width:1000px;
	}
	td{
	width:450px;
	}
	h1{
		margin-top:10px;
	}
	body{
		background-size:100%;
 		background-image:url(img/tu01.jpg);
 		background-repeat:no-repeat;
	}
</style>
</head>
<body ><!-- onload="init()" -->
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
	<h1>合众易成学生注册</h1>
	<form  action="stuRegister.do"  method="post" enctype="multipart/form-data" style="margin-left:17%;margin-top:-1%;">
   		<table>
	   		<tr>
<!-- 	   		<td colspan="3">
	   				   <div style="width:1000px;height:140px;  float:left;"  id="caseIma">
								    <div style="margin-left:100px; float:left;">
									   <div id="localImag" style="margin-left:100px; float:left;width:120px;height:140px;border:1px solid #555;border-radius:5px;">
								        	<img id="preview"  src="" style="margin-left:-1px;margin-top:-1px; float:left;width:130px;height:120px; display: none"/>
								        	<span id="srcSpanId" style="width:130px; height:140px; line-height:140px; text-align:center;font-size:17px;">照片</span>
								    	</div>
							    	</div>
							    	<div style="margin-left:180px; margin-top: 20px;float:left;">
								    	<div id="image"  style="width:400px;height:140px;">
								    	   	<span style="font-size:17px;float:left; margin-top: 20px;">上传头像:</span><input type="file"  id="caseImage" name="caseImage" onchange="viewImage(this)" style="float:left;margin-left:30px; margin-top: 20px;"/>
		    							</div>
		    							
		    							<div style=" width:400px;height:140px; margin-top: -80px; ">
		    								<span style="font-size:17px;float:left; margin-top: 20px;">用户姓名:</span><input type="text" name="name"  placeholder="请输入姓名" style="float:left;margin-left:30px; margin-top: 20px;"/>
								    	</div>
							    	</div>
	    			</div>
	   		
	   		</td> -->
	   		<td>
				<div style="margin-left:100px;margin-top:50px; float:left;">
					<div id="localImag" style="margin-left:100px; float:left;width:120px;height:140px;border:1px solid #555;border-radius:5px;">
						<img id="preview"  src="" style="margin-left:-1px;margin-top:-1px; float:left;width:130px;height:120px; display: none"/>
						<span id="srcSpanId" style="width:130px; height:140px; line-height:140px; text-align:center;font-size:17px;">照片</span>
					</div>
				</div>	   		
	   		</td>
	   		<td>
				<div style="margin-left:50px; margin-top: -10px;float:left;">
				  <div id="image"  style="width:400px;height:140px;float:left;">
					<span style="font-size:17px;float:left; margin-top: 110px;">上传头像:</span><input type="file"  id="caseImage" name="caseImage" onchange="viewImage(this)" style="float:left;margin-left:30px; margin-top: 110px;"/>
		    	  </div>
		    	  <div id="picInfoDiv" style="">
		    	  	<span style="color:#FF3030;font-size:10px;">图片名只能为英文字母</span>
		    	  </div>
		    	  <div>
		    		<span style="font-size:17px;float:left; margin-top: 20px;">用户姓名:</span><input type="text" name="name"  placeholder="请输入姓名" style="float:left;margin-left:30px; margin-top: 20px;"/>
				  </div>
				</div>	   		
	   		</td>
	   		</tr>
   			<tr>
   				<td>
   					<span id="numberSpanInfo" style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">身份证号:</span><input type="text" name="idNumber" id="idNumberId"  placeholder="请输入身份证号" onblur="existIdCode()"style="margin-left:30px; margin-top: 20px;"/>
   				</td>
   				<td>
   					<span style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">用户账号:</span><input type="text" name="code"  id="codeId" placeholder="用户账号" onblur ="codeSet()" readonly="readonly"style="margin-left:30px; margin-top: 20px;"/>
   				</td>
   			</tr>
   			<tr>
   			   	<td>
   					<span style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">用户密码:</span><input type="password" name="password01" id="password01Id" placeholder="请输入密码" onblur="cheakPw()" style="margin-left:30px; margin-top: 20px;"/>

   				</td>
   				<td>
   					<span style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">确认密码:</span><input type="password" name="password"  id="password02Id" placeholder="请确认密码" onblur="cheakoutPw()"style="margin-left:30px; margin-top: 20px;"/>
   				</td>
   			</tr>
   			<tr>	
   				<td>
   				 	<span style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">联系电话:</span><input type="text" name="phone"  placeholder="请输入常用电话" id="phoneId" onblur="setStyle()" style="margin-left:30px; margin-top: 20px;"/>
   				</td>
   				<td>
   					<span style="color:#FF3030;font-size:24px;text-align: center;">*</span><span style="font-size:17px">常用邮箱:</span><input type="text" name="email"  placeholder="请输入邮箱" id="emailId" onblur="setEmailStyle()"  style="margin-left:30px; margin-top: 20px;"/>
   				</td>
   			</tr>
   			<tr>
   				<td>
   				 	<span style="font-size:17px">班级编码:</span><select id="classSelect" name="classId" style="margin-left:40px; margin-top: 20px;"></select>
   				 	<script type="text/javascript">
   				 	var selectObj=document.getElementById("classSelect");
   				 	 <%String []arr=Dict.getClassData();
   				 	 for(int i=0;i<arr.length;i++){
   				 	String className=arr[i];
   				 	%> 
   				 	selectObj.innerHTML+="<option>"+'<%=className%>'+"</option>";
   				 	<% }%>	 	
   				 	</script>
   				</td>
   				<td>
   				 	<span style="font-size:17px">家庭住址:</span><input type="text" name="address"  placeholder="请输入家庭住址" style="margin-left:40px; margin-top: 20px;"/>

   				</td>
   				</tr>
   			<tr>
  				<td><span style="font-size:17px">学校名称:</span><select id="schoolSelect" name="school"  style="margin-left:40px; margin-top: 20px;"></select> 
 					<script type="text/javascript">
   				 	var selectObj=document.getElementById("schoolSelect");
   				 	 <%String []ar=Dict.getSchoolData();
   				 	 for(int i=0;i<ar.length;i++){
   				 	String school=ar[i];
   				 	%> 
 					
 					selectObj.innerHTML+="<option >"+'<%=school%>'+"</option>";	
   				 	<% }%>
   				 	 
   				 	
   				 	</script>
   				</td> 
   				<td>
   					<span style="font-size:17px">专业名称:</span><input type="text" name="major"  placeholder="请输入专业"style="margin-left:40px; margin-top: 20px;"/>
   				</td>  			
   			</tr>
   			<tr>
   				<td>
   					<span style="font-size:17px">密保问题:</span><select id="mbSelect" name="question" style="margin-left:40px; margin-top: 20px;"></select>
   				 	<script type="text/javascript">
   				 	var selectObj=document.getElementById("mbSelect");
   				 	 <%String []array=Dict.getQuestionData();
   				 	 for(int i=0;i<array.length;i++){
   				 	String question=array[i];
   				 	%> 
   				
   				 	selectObj.innerHTML+="<option>"+'<%=question%>'+"</option>";
   					
   				 	<% }%>
   				 	 
   				 	
   				 	</script>
   				</td>
   				<td>
   				  <span style="font-size:17px">密保答案:</span><input type="text" name="answer"  placeholder="请输入答案"style="margin-left:40px; margin-top: 20px;" />
   				</td>
   			</tr>
   			<tr>
   				<td colspan="3" align="center">
   					<input type="hidden" name="remark" value="0"/>
	    			<input type="submit" value="注册"  id="submitId" class="sub_btn" onmouseover="allThing()" style="margin-left:-1%; margin-top:30px;"/>
   				</td>

   			</tr>
   			<tr>
   			<td>
<% 
String registerTime=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>	
  <input type="hidden" name="registerTime"  value=<%=registerTime%>>	
  <div style="display:none;width:1566px;height:50px;">
  	<ex:sex message="RoleName" />
  </div>
   			</td>
   			</tr>
   		</table>
	</form>	
</body>
</html>