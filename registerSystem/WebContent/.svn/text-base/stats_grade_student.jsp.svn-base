<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/later.css">
<style type="text/css">
      body {s
        margin: 0px;
        padding: 0px;
      }
      #container {
        width : 1000px;
        height: 384px;
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
			//哪期应该上课记录对应的星期
			List<String> stList =(List<String>)request.getAttribute("stList");
			//哪个学生的签到记录对应的状态
			List<String> striList =(List<String>)request.getAttribute("striList");
			//今天星期几
			String date = request.getParameter("date");
	%>

	<div id="container"></div>
	<script type="text/javascript" src="js/flotr2.min.js"></script>
	    <script type="text/javascript">
	    (function advanced_markers(container) {
	
	    	  var
	    	    xmark = new Image(),
	    	    checkmark = new Image(),
	    	    bars = {
	    	      data: [],
	    	      bars: {
	    	        show: true,
	    	        barWidth: 0.6,
	    	        lineWidth: 0,
	    	        fillOpacity: 0.8
	    	      }
	    	    }, markers = {
	    	      data: [],
	    	      markers: {
	    	        show: true,
	    	        position: 'ct',
	    	        labelFormatter: function (o) {
	    	        	if (o.y <= 2&&o.y>0) {
	    	        		return checkmark;
	    	        	} else {
	    	        		return xmark;
	    	        	}
	    	        }
	    	      }
	    	    },
	    	    flotr = Flotr,
	    	    point,
	    	    graph,
	    	    j,
	    	    i;
	
	    	  <%
	    	  int b = 0;
	    	  for (int i = 1; i <= Integer.parseInt(date); i++) {
	    		int x = 0;
	    		for (int j = 0; j < stList.size(); j++) {
	    	  		if (i==Integer.parseInt(stList.get(j))) {
	    	  			x++;
	    	  		}
	    		}
	    		if (x==0) {
	    		%>
	    		point = [<%=i%>, 0];
	    		<%
	    		} else {
	    		%>
	    		point = [<%=i%>, <%=striList.get(b)%>];
	    		<%
	    		b++;
	    		}
	    	  %>
	    	    bars.data.push(point);
	    	    markers.data.push(point);
	    	  <%
	    	  }
	    	  %>
	    	  var runner = function () {
	    	    if (!xmark.complete || !checkmark.complete) {
	    	        setTimeout(runner, 50);
	    	        return;
	    	    }
	
	    	    graph = flotr.draw(
	    	      container,
	    	      [bars, markers], {
	    	        yaxis: {
	    	          min: 0,
	    	          tickDecimals:0, 
	    	          title: '状态',
	      	          ticks:[[0,"没课"],[1,"没来"],[2,"迟到"],[3,"请假"],[4,"准时"]],
	    	          max: 5
	    	        },
	    	        xaxis: {
	    	          min: 0,
	    	          tickDecimals:0,
	      	          ticks:[[1,"星期一"],[2,"星期二"],[3,"星期三"],[4,"星期四"],[5,"星期五"],[6,"星期六"],[7,"星期日"],[8,"星期"]],
	    	          max: 8
	    	        },
	    	        grid: {
	    	          verticalLines: false
	    	        }
	    	      }
	    	    );
	    	  }
	
	    	  xmark.onload = runner;
	    	  xmark.src = 'images/yes.png';
	    	  checkmark.src = 'images/no.png';
	    	})(document.getElementById("container"));
	</script>
</body>
</html>