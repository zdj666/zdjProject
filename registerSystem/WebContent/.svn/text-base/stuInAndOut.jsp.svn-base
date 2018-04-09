<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/layui.css" media="all">
 <script src="js/layui.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>学员导入导出</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 

<link rel="stylesheet" href="css/whole.css">
<script type="text/javascript">
//打开弹出框
function showModle(){
	console.log("打开弹出框");
	$('#myModalLoading').modal('show');
}
function showModle2(){
	console.log("打开弹出框");
	$('#ModalLoading').modal('show');
}
//关闭弹出框
function hideModel(){
	//关闭弹出框
	$('#myModalLoading').modal('hide');
}
function judeFile(){
	
	var oInput = document.getElementById('fileInput').value;
	if(oInput == '') {
		showModle();
    }else if(oInput.endsWith(".xls")||oInput.endsWith(".xlsx")||oInput.endsWith(".xlsm")){
     	
    	var myFormId = document.getElementById("myFormId");
    	
    	myFormId.submit();
    	
    }else{
    	showModle2();
    }
}    
	
	
	</script>
<style type="text/css">
	.leftDiv{
		float: left;
		width: 450px;
		height: 100px;
		margin-top: -20px;
	}
	.rightDiv{
		float: left;
		width: 550px;
		height: 100px;
		margin-top: -20px;
	}
	.form-control{
		width: 200px;
	}
</style>
</head>
<body >

<div class="totalDiv">
	<div class="resultdiv">
		<span class="resultspan">学员导入导出</span>
	</div>
	
		<div class="leftDiv">
			<div style="float:left;margin-left: 50px;margin-top: 50px;"><h4>导入学员：</h4></div>
			<div style="margin-top: 50px;">
				<form id="myFormId" action="stuExcelIn.do" method="post" enctype="multipart/form-data" >
						
							<input type="file" name="uploadfile" id="fileInput" style="width: 200px;"/>&nbsp;
						
							<input type="button" onclick="judeFile()" value="导入学员" style="position: absolute;margin-top: -35px;margin-left: 210px;" class="btn btn-primary"/>
						
				</form>	
			</div>
		</div>
		<div class="rightDiv">	
			<div style="float:left;margin-left: 50px;margin-top: 50px;"><h4>导出学员：</h4></div>
			<div style="margin-top: 50px;">
				<form action="exportStuByClass.do" method="post" target="bottom">
					<span><ex:sex message="ClassName"/> </span>
					<input type="submit" value="按班导出" style="position: absolute;margin-left: 215px;margin-top: -35px;" class="btn btn-primary"/>
				</form>
			</div>
		</div>
		<div style="float: left;margin-left: -50px;margin-top: 30px;">
			<form action="selExportStudent.do" method="post" target="bottom">
				<input type="submit" value="导出所有学员" style="width: 150px;margin-top: -1px;" class="btn btn-primary"/>
			</form>
		</div>
</div>
		<iframe src="selExportStudent.jsp" name="bottom" width="100%" height="480px;"></iframe>
		<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						导入学员信息！
					</h4>
				</div>
				<div class="modal-body">
					请选择文件后导入！
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="ModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						导入学员信息！
					</h4>
				</div>
				<div class="modal-body">
					文件格式错误：请选择.xls,xlsx或xlsm文件！
				</div>
			</div>
		</div>
	</div>
</body>
</html>