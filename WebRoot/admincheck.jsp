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
    
    <title>管理员验证</title>
    
  </head>
  
  <body>
    <%
     String name,pass;
     name=request.getParameter("name");
     pass=request.getParameter("password");
     
     Connection conn=new DbClass().getConn();
     String sql="select * from admin where name=? and password=?";
     PreparedStatement pst=conn.prepareStatement(sql);
     pst.setString(1,name);
     pst.setString(2,pass);
     ResultSet rs=pst.executeQuery();
     if(rs.next())
     {   
        session.setAttribute("admin",name);
        response.sendRedirect("opendata.jsp");
     }else
     {
       out.print("登陆失败！，请重新确认！");
     }
     
     %>
  </body>
</html>
