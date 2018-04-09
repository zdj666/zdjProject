<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/later.css">
<style type="text/css">
	#line{
	      	height: 10px;
	      	width : 100%;
	      	margin-top: 10px;
	      }
	#select{
			margin-left:12%;
	      	margin-top: 5px;	
	}
	
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
iframe{
 		width:100%; 
 		height:535px;
}
#shuoming{margin-top: 30px;}
</style>
<script type="text/javascript">
	function select(){
		var value = document.getElementById("option").value;
		window.open("StatsPTWK.do?value="+value+"","right");
	}
</script>
</head>
<link rel="stylesheet" href="css/style.min.css" />	
<body onload="select()">
	<div class="totalDiv">
		<div class="resultdiv">
			<span class="resultspan">统计条件</span>
		</div>
		<div id="select">
			<div style="float:left;width:100px;height:30px;border-radius:5px;font-size: 17px;margin-top: 28px;">统计方式:</div>
			<select style="float:left;width:150px;text-align:center;" onchange="select()" id="option">
				<option value="柱状图">柱状图</option>
				<option value="折线图">折线图</option>
				<option value="时间轴">时间轴</option>
			</select>
		</div>
		<div id="shuoming"><h3>&nbsp;使用说明：如需查是否迟到请用时间段中的柱状堆查询！</h3></div>
	</div>
	<div>
  		<iframe src="blank.jsp" name="right"></iframe>
	</div>
</body>
</html>