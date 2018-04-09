<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>老师登录界面</title>
<style type="text/css">
  .bigBoard{
        position:absolute;
        top:50%;
        left:50%;
        transform: translate(-50%, -50%);
        margin: 0 auto;
        height:200px;
        width:500px;
       /*  background: #CCFFFF;  */
        border: 2px solid #996699;      
  }
</style>
</head>
<body style="text-align: center;">
   <div class="bigBoard">
       
       <div style="text-align: center;color:#669999;"><font size="5">登录</font></div>
       
       <form method="post" action="login.do" >
         <p><span style="display:inline-block;width:50px;text-align:right;">账号: </span> <input type="text" name="code" id="Code" placeholder="身份证号后六位" /></p>
         <p><span style="display:inline-block;width:50px;text-align:right;">密码:</span> <input type="text" name="password" id="Password"/></p>
         <p><span style="display:inline-block;width:100px;text-align:right;"/><input type="submit" name="" id="" value="确认" /></p>   
       </form>
   
   </div>
</body>
</html>