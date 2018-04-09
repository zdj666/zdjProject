<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/later.css">
<title>Insert title here</title>
<style type="text/css">
      body {
        margin: 0px;
        padding: 0px;
      }
      #container {
        width : 1000px;
        height: 330px;
        margin: 58px auto;
       margin-top:2%;
        margin-left: 7%;
      }
</style>
</head>
<body>
<div class="resultdiv">
		<span class="resultspan">统计结果</span>
	</div>
	<% 
		List<List<String>> binList = (List<List<String>>)request.getAttribute("binList");
		List<String> timesList = (List<String>)request.getAttribute("timesList");
	%>
	<input type="hidden" value="<%=timesList%>" id="value"/>
	<div id="container"></div>
	<script type="text/javascript" src="js/flotr2.min.js"></script>
	<script type="text/javascript">
	(function bars_stacked(container, horizontal) {
	
		  var
		    d1 = [],
		    d2 = [],
		    d3 = [],
		    graph, i;
		  var value = document.getElementById("value").value;
		  var name = value.substring(1,value.length-1);
		  var obj = name.split(",");
		  console.log(obj[0]);
		  console.log(obj[1]);
		  console.log(obj[2]);
		  for (i = 1; i <= <%=binList.size()%>; i++) {
		    if (horizontal) {
		      d1.push([i, obj[(i-1)*3]-0]);
			  d2.push([i, obj[(i-1)*3+1]-0]);
			  d3.push([i, obj[(i-1)*3+2]-0]);
		    } else {
		      d1.push([i, obj[(i-1)*3]-0]);
		      d2.push([i, obj[(i-1)*3+1]-0]);
		      d3.push([i, obj[(i-1)*3+2]-0]);
		    }
		  }
		  graph = Flotr.draw(container,[
		    { data : d1, label : '准时' },
		    { data : d2, label : '迟到' },
		    { data : d3, label : '请假' }
		  ], {
		    legend : {
		      backgroundColor : '#D2E8FF' // Light blue 
		    },
		    bars : {
		      show : true,
		      stacked : true,
		      horizontal : horizontal,
		      barWidth : 0.6,
		      lineWidth : 1,
		      shadowSize : 0
		    },
		    xaxis: {
  	    	  title : '学生名称',
  	    	  titleAlign:'center', 
  	    	  ticks:<%=binList%>
  	      },
  	    	yaxis: {
	    	  title : '出勤次数',
	    	  titleAlign:'center', 
	    	  tickDecimals:0, 
	    	  min : '0'
	      },
		    grid : {
		      verticalLines : horizontal,
		      horizontalLines : !horizontal
		    }
		  });
		})(document.getElementById("container"));
	</script>
	
</body>
</html>