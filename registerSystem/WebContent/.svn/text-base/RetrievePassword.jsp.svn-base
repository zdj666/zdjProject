<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="Dashboard">
		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
		<title>找回密码</title>
		
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<!--external css-->
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		
		<!-- Custom styles for this template -->
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/style-responsive.css" rel="stylesheet">
		<link href="assets/css/style-RetrievePassword.css" rel="stylesheet">
		<link rel="stylesheet" href="css/later.css">  
		</head>
	<body onload="load()">
		<div class="fol-log-12">
			<div class="form-panel">
				<div class="resultdiv" style="margin-top: -20px;margin-left: -20px;width: 120%;">
					<span class="resultspan" >找回密码</span>
				</div>
				<form class="form-horizontal style-form" method="get" style="margin-top:40px;">
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10 ">
                            <input type="text" class="form-control" id="username">
                        </div>
                    </div>
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">密保问题</label>
                        <div class="col-sm-10 ">
                        <!--mbQuestion-->
                         <ex:sex  message="QuestionName" />
                            
                        </div>
                    </div>
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">密保答案</label>
                        <div class="col-sm-10 ">
                            <input type="text" class="form-control" id="mbAnswer">
                        </div>
                    </div>
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">新的密码</label>
                        <div class="col-sm-10 ">
                            <input type="password" class="form-control" id="password">
                        </div>
                    </div>
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">重复密码</label>
                        <div class="col-sm-10 ">
                            <input type="password" class="form-control" id="surePassword">
                        </div>
                    </div>
					<div class="form-group div_group">
                        <label class="col-sm-2 col-sm-2 control-label">点击按钮</label>
                        <div class="col-sm-5">
                            <input type="button" id="btn" class="form-control btn btn-primary" value="提交申请">
                        </div>
                    </div>
				</form>
				<div class="prompting" id="alertIfo">
					<div>
						<div class="alert alert-primary alert-dismissable">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>提示!</strong> 请填写完整信息。
						</div>
					</div>
				</div>
			</div>
		</div>
		<button style="display:none" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<input class="form-control"  disabled="disabled" style="background-color:#68dff0;"/>
						<input class="form-control" id="altIfo" type="text" placeholder="修改结果" disabled="disabled" style="margin-top:10px;"/>
						<input class="form-control"  disabled="disabled" style="background-color:#68dff0;margin-top:10px;"/>
						
					</div>
					
				</div>
			</div>
		</div>
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script>
			function load(){
				$("input#btn").click(function(){
				
					var bool =true;
					//createError(0,"信息提交成功");
					var ifo="";
					console.log("获取信息");
					var userObj = {
						"username":"",
						"password":"",
						"surePassword":"",
						"mbQuestion":"",
						"mbAnswer":""
					};
					
					userObj.username = document.getElementById("username").value;
					userObj.password = document.getElementById("password").value;
					userObj.surePassword = document.getElementById("surePassword").value;
					userObj.mbQuestion = document.getElementById("mbQuestion").value;
					userObj.mbAnswer = document.getElementById("mbAnswer").value;
					
					console.log(userObj.username+"--"+userObj.password+"--"+userObj.surePassword+"--"+userObj.mbQuestion+"--"+userObj.mbAnswer);
					
					if(userObj.username==""||userObj.username==null||
						userObj.password==""||userObj.password==null||
						userObj.surePassword==""||userObj.surePassword==null||
						userObj.mbQuestion==""||userObj.mbQuestion==null||
						userObj.mbAnswer==""||userObj.mbAnswer==null){
						ifo="你有信息为null";
						console.log(ifo);
						createAlt(1,ifo);
						
						bool=false;
					}
					if(userObj.password!=userObj.surePassword){
						ifo="两次密码不相同";
						console.log(ifo);
						createAlt(1,ifo);
						
						bool=false;
					}
					
					if(bool){
						var userIfo  = JSON.stringify(userObj);
						console.log("提交到后台验证");

						var xmlhttp = new XMLHttpRequest();
						xmlhttp.onreadystatechange = function(){
							if(xmlhttp.readyState==4&&xmlhttp.status==200){
								var getIfo = xmlhttp.responseText;
								console.log("返回的信息"+getIfo);
								$('#altIfo').val(getIfo);
								$('#myModal').modal('show');
							}
						};
						xmlhttp.open("post","getUserIfo.do",true);
						xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
						xmlhttp.send("userIfo="+userIfo);
					}
				});
			}
			
			function createAlt(bool,ifo){
				var altObj = document.getElementById("alertIfo");
				console.log("####"+altObj.className);
				var divObj = document.createElement("div");
				if(bool==0){
					console.log("成功");
					divObj.innerHTML = "<div class='alert alert-success alert-dismissable'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>成功!</strong>"+ifo+" .</div>";
				}else if(bool==1){
					console.log("警告");
					divObj.innerHTML = "<div class='alert alert-warning alert-dismissable'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>警告!</strong>"+ifo+" .</div>";
				}else{
					console.log("错误");	
					divObj.innerHTML = "<div class='alert alert-danger alert-dismissable'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>警告!</strong>"+ifo+" .</div>";
				}
				altObj.append(divObj);
			}
			
		</script>
	</body>
</html>