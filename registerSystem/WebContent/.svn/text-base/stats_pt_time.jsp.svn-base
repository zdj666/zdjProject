<%@page import="com.hzyc.registerSystem.po.RealSchedule"%>
<%@page import="com.hzyc.registerSystem.po.Users"%>
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
    	List<List<String>> binList = (List<List<String>>)request.getAttribute("binList");
		List<Users> binUsers = (List<Users>)request.getAttribute("usersList");
		List<RealSchedule> selList = (List<RealSchedule>)request.getAttribute("selList");
		List<String> countList = (List<String>)request.getAttribute("countList");
		List<String> binCount = (List<String>)request.getAttribute("binCount");
		String sign = request.getParameter("sign");
		String result = request.getParameter("result");
    %>
    
    <input type="hidden" id="nameInfo" value="<%=binList%>"/> 
    <input type="hidden" id="binCount" value="<%=binCount%>"/> 
    <input type="hidden" id="sign" value="<%=sign%>"/> 
    <input type="hidden" id="left" value="<%=selList.get(0).getDate()%>"/>
    <input type="hidden" id="right" value="<%=selList.get(selList.size()-1).getDate()%>"/>
	<div id="container"></div>
    <script type="text/javascript" src="js/flotr2.min.js"></script>
    <script type="text/javascript">
    
      (function basic_bars(container, horizontal) {
    	  var ary=aaa();
    	  var bry=bbb();
    	  var
    	    horizontal = (horizontal ? true : false), // Show horizontal bars
    	    d1 = [],                                  // First data series
    	    d2 = [],                                  // Second data series
    	    point,                                    // Data point variable declaration
    	    i;

    	  <%
    	  for (int i = 1; i <=binList.size(); i++) {
    	  %>
    	    if (horizontal) { 
    	      //point = [Math.ceil(Math.random()*10), i];
    	        point = [10, i];
    	    } else {
    	      //point = [i, Math.ceil(Math.random()*10)];
    	      	point = [<%=i%>,<%=countList.get(i-1)%>];
    	    
    	    }
    	   
    	    d1.push(point);
    	    <% } %>;  
    	 
    	  // Draw the graph
    	  Flotr.draw(
    	    container,
    	    [d1, d2],
    	    {
    	      bars : {
    	        show : <%=sign%>,
    	        horizontal : horizontal,
    	        //阴影
    	        shadowSize : 10,
    	        barWidth : 0.5
    	      },
    	      mouse : {
    	        track : true,
    	        relative : true,
    	        trackFormatter: function(obj){ return '姓名 = ' + ary[parseInt(obj.x-1)] + '，出勤次数 =' + bry[obj.x-1] +'次' ;}
    	      },
    	      yaxis : {
    	        min : 0,
    	        max : 1,
    	        track : true,
    	        title: '出勤率',
    	        ticks:[[0.25,"25%"],[0.5,"50%"],[0.75,"75%"],[1.0,"100%"]]
    	      },
    	      
    	      xaxis: {
    	    	  title : '学生名称',
    	    	  titleAlign:'center', 
    	    	  ticks:<%=binList%>
    	      },
    	      
    	      lines: {show: <%=result%>},
    	      points: {show: <%=result%>}
    	      
    	    }
    	  );
    	})(document.getElementById("container")); 
      
      function aaa(){
    	  var name = document.getElementById("nameInfo").value;
    	  name = name.substring(2,name.length-2);
    	  console.log(name);
    	  var obj = name.split("], [");
    	  for (var i=0;i<obj.length;i++){
    	  	console.log(obj[i]+"--");
    		var index = 0;
    		for(var j=0;j<obj[i].length;j++){
    			if(obj[i][j]==','){
    				index=j;  
    		 	}
    		}
    		obj[i]=obj[i].substring(index+2,obj[i].length-1);
    		 
    		console.log(obj[i]+"***");
    		 
    	  }
    	  
    	  for(var i=0;i<obj.length;i++){
    		  console.log(obj[i]+"---"+i);
    	  }
    	  return obj;
      }
      function bbb(){
    	  var name = document.getElementById("binCount").value;
    	  name = name.substring(1,name.length-1);
    	  console.log("###"+name);
    	  
    	  var obj = name.split(",");
    	  console.log("%%"+obj[0]);
    	  for(var i=0;i<obj.length;i++){
    		  console.log(obj[i]+"-###--"+i);
    	  } 
    	  return obj;
      }
    </script>

</body>
</html>