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
        height: 300px;
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
			
			List<List<String>> doubleList = (List<List<String>>)request.getAttribute("doubleList");
			List<String> sList = (List<String>)request.getAttribute("sList");
			List<String> dList = (List<String>)request.getAttribute("dList");
		%>
	
	<div id="container"></div>
    <script type="text/javascript" src="js/flotr2.min.js"></script>
	<script type="text/javascript">
	(function basic_timeline(container) {
	
		//[从第几个开始，纵坐标第几个(唯一)，显示几个]
		  <%
	    for (int i=1; i<=doubleList.size(); i++) {
	    %>
	    var d<%=i%> = <%=doubleList.get(i-1)%>;
	    <%
	    }
	    %>
		
		  var
		    data      = [],
		    timeline  = { show : true, barWidth : .5 },
		    markers   = [],
		    labels    = <%=sList%>,
		    i, graph, point;
	
		  // Timeline
		  Flotr._.each(<%=dList%>, function (d) {
		    data.push({
		      data : d,
		      timeline : Flotr._.clone(timeline)
		    });
		  });
	
		  // Markers
		  Flotr._.each(<%=dList%>, function (d) {
		    point = d[0];
		    markers.push([point[0], point[1]]);
		  });
		  data.push({
		    data: markers,
		    markers: {
		      show: true,
		      position: 'rm',
		      fontSize: 11,
		      labelFormatter : function (o) { return labels[o.index]; }
		    }
		  });
		  
		  // Draw Graph
		  graph = Flotr.draw(container, data, {
		    xaxis: {
		      noTicks: 3,
		      tickDecimals:0, 
		      max : 9,
		      min : 1,
		      ticks:[[1,"开始"],[2,"星期一"],[3,"星期二"],[4,"星期三"],[5,"星期四"],[6,"星期五"],[7,"星期六"],[8,"星期日"],[9,"星期"]]
		    }, 
		    yaxis: {
		      title: '姓名',
		      showLabels : false
		    },
		    grid: {
		      horizontalLines : false
		    }
		  });
		})(document.getElementById("container"));
	</script>
</body>
</html>