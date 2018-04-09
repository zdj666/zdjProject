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
        height: 384px;
        margin: 8px auto;
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
		List<String> bin = (List<String>)request.getAttribute("bin");
		List<String> binCount = (List<String>)request.getAttribute("binCount");
	%>

	<div id="container"></div>
	<script type="text/javascript" src="js/flotr2.min.js"></script>
	<script type="text/javascript">
	(function basic_pie(container) {
	
		<%
	    for (int i=1; i<=binCount.size(); i++) {
	    %>
	    var d<%=i%> = [[0, <%=binCount.get(i-1)%>]];
	    <%
	    }
	    %>
		var graph;
	    
		  graph = Flotr.draw(container,<%=bin%>, {
		    HtmlText : false,
		    grid : {
		      verticalLines : false,
		      horizontalLines : false
		    },
		    xaxis : { showLabels : false },
		    yaxis : { showLabels : false },
		    pie : {
		      show : true, 
		      explode : 6
		    },
		    mouse : { track : true },
		    legend : {
		      position : 'se',
		      backgroundColor : '#D2E8FF'
		    }
		  });
		})(document.getElementById("container"));
	</script>

</body>
</html>