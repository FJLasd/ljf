<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="db.DbClass" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
     String name,pass;
     name=request.getParameter("name");
     pass=request.getParameter("password");
     Connection conn=new DbClass().getConn();
     String sql="insert into user(name,password) values(?,?)";
     PreparedStatement pst=conn.prepareStatement(sql);
     pst.setString(1,name);
     pst.setString(2,pass);
     int result=pst.executeUpdate();
     if(result>0)
     {
         out.print("注册成功");
         out.println("<a href='userlogin.jsp'>返回登录页面</a>");
     }else
     {
       out.print("注册失败！");
       out.println("<a href='userlogin.jsp'>重新注册</a>");
     }
   %>
   
  </body>
</html>
