<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改请假信息</title>
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">  
<link rel="stylesheet" href="css/whole.css">
</head>
<body>
<div class="resultdiv">
		<span class="resultspan">修改请假信息</span>
	</div>
  <div style="margin-left: 300px;margin-top: 30px;">
  
	 <form action="updateLeave.do" method="post">
  
	       <div style="display: none;"><input type="text" name="id" value="${LeaveThing.id }" readonly="readonly" style="width: 200px;height: 35px"/><br /><br /><br /></div>
	       姓名：<input type="text" name="name" value="${LeaveThing.name }" style="width: 200px;height: 35px"/><br /><br /><br />
	       时间：<input type="date" name="time" value="${LeaveThing.time }" style="width: 200px;height: 35px"/><br /><br /><br />
	       类型：<input type="text" name="type"value="${LeaveThing.type }" style="width: 200px;height: 35px"/><br /><br /><br />
	       原因：<input type="text" name="reason"value="${LeaveThing.reason }" style="width: 400px;height: 80px"/><br /><br /><br />
	       <input type="submit" value="确定" class="btn btn-primary"/>
       </form>
       </div>
</body>
</html>