<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlogin.jsp' starting page</title>
    
  </head>
  
  <body >
     <center>
      会员登陆
        <form action="usercheck.jsp" bgcolor=yellow>
      姓名：<input type="text" name="name"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      密码：<input type="password" name="password"/><input type="submit" value="登陆"/><br/>
      <a href="register.jsp">无账号，点这里注册</a>
    </form>
     </center>
      
  </body>
</html>
