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
    
    <title>My JSP 'usercheck.jsp' starting page</title>
    
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
   try{
     String name,pass;
     // 接收用户名、密码
     name=request.getParameter("name");
     pass=request.getParameter("password");
     
     
     Connection conn=new DbClass().getConn();
     String sql="select * from user where name=? and password=?";
     PreparedStatement pst=conn.prepareStatement(sql);
     pst.setString(1,name);
     pst.setString(2,pass);
     ResultSet rs=pst.executeQuery();
     
     // 如果存在该用户
     if(rs.next())
     { 
        session.setAttribute("username",name);//session保存用户登录名
        response.sendRedirect("index.jsp");
     }else
     {
       out.print("登陆失败！，请重新确认！");
     }
   }catch(Exception ex){
	   ex.printStackTrace();
   }
     
     %>
  </body>
</html>
