<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/calendar.css" />
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<script type="text/javascript" src="js/calendar.js"></script>
<link rel="stylesheet" href="css/later.css">
<script type="text/javascript">
//打开弹出框
function showModle(){
	console.log("打开弹出框");
	$('#myModalLoading').modal('show');
}
//关闭弹出框
function hideModel(){
	//关闭弹出框
	$('#myModalLoading').modal('hide');
}
</script>
<style type="text/css">
	#line{
	      	height: 10px;
	      	width : 100%;
	      	margin-top: 10px;
	      }
	#select{
	      	margin-left: 10%;
	      	margin-top: 10px;	
	}
select{
		width:180px;
		height:34px;
		border:0;
		border:1px solid #666;
		border-radius:5px;
		font-size:16px;
		background-color: #fff;
		text-align:center;
		margin-top: 25px;
	}
iframe{
 		width:100%; 
 		height:535px;
}
</style>
<script type="text/javascript">
	function sel(){
		var left = document.getElementById("date3").value;
		var right = document.getElementById("date4").value;
		var value = document.getElementById("option").value;
		if (left > right || left == "开始时间" || right == "截止时间") {
			showModle();
		} else {
			window.open("statsProcess.do?left="+left+"&right="+right+"&value="+value+"","right");
		}
		
	}
</script>
</head>
<link rel="stylesheet" href="css/style.min.css" />	
<body>


	<% 
		String left = request.getParameter("left");
		String right = request.getParameter("right");
	%>

<div class="totalDiv">
		
		<div class="resultdiv">
			<span class="resultspan">统计条件</span>
		</div>
		<div id="select">
			<div style="float:left;width:100px;font-size:17px;height:34px;border-radius:5px;margin-left:15%;margin-top: 28px;">统计方式:</div>
			<select style="float:left;width:150px;text-align:center;" id="option">
				<option value="柱状图">柱状图</option>
				<option value="折线图">折线图</option>
				<option value="饼形图">饼形图</option>
				<option value="柱状堆">柱状堆</option>
			</select>
		</div>

	
	<div class="demo-box">
    <div class="demo-view">
	    <div class="form-item">
	        <div class="form-field">
	            <div id="date-btn1">
	                <div class="select-win" id="datesWrap3">
	                    <div class="select-btn">
	                        <span class="select-btn-icon new-icon-calendar" id="dateBtn3"></span>
	                    </div>
	                    <input type="button" value="开始时间" id="date3" style="width:150px;float:left;margin-left:20px;margin-top: 26px;" class="btn btn-primary"/>
	                </div>
	            </div>
	        </div>
	    </div>
		<div style="float:left;margin-top:30px;margin-left:5px;">——</div>
	    <div class="form-item">
	        <div class="form-field">
	            <div class="select-win">
	                <input type="button" value="截止时间" id="date4" style="width:150px;float:left;margin-left:5px;margin-top:26px;" class="btn btn-primary"/>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<div>
		<button style="width:80px;float:left;margin-left:20px;margin-top:26px;" onclick="sel()" class="btn btn-primary">查询</button>
	</div>
</div>
<script type="text/javascript">
		var opts3 = {//example 3 opts
                'targetId':'date3',
                'hms':'off',
                'format':'-',
                'min':'<%=left%>',
                'max':'<%=right%>'
            },opts4={
                'targetId':'date4',//时间写入对象的id
                'hms':'off',
                'format':'-',
                'min':'<%=left%>',
                'max':'<%=right%>'
            };

    //example 1:
    xvDate(opts3);
    xvDate(opts4);
</script>
	
	<div>
  		<iframe src="blank.jsp" name="right"></iframe>
	</div>
 	
 	<div class="modal fade" id="myModalLoading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						查询报错信息
					</h4>
				</div>
				<div class="modal-body">
					请重新确认时间！
				</div>
			</div>
		</div>
	</div>
 	
</body>
</html>