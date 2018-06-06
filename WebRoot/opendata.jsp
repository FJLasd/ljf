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
    
    <title>管理留言</title>
    
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
        String name=(String)session.getAttribute("admin");
        if(name==null||name.equals("")){
        response.sendRedirect("adminlogin.jsp");
        }
     %>
    <%
      String email,subject,memo;
      Connection conn=new DbClass().getConn();
      Statement smt=conn.createStatement();
      ResultSet rs;
      String sql;
      sql="select * from messa";
      rs=smt.executeQuery(sql); 
      out.print("<center>"); 
      out.print("<table border=1>");
      out.print("<tr>");
      out.print("<td bgcolor=yellow>姓名</td>");
      out.print("<td bgcolor=yellow>E-Mail</td>");
      out.print("<td bgcolor=yellow>主题</td>");
      out.print("<td bgcolor=yellow>内容</td>");
      out.print("<td bgcolor=yellow>删除</td>");
      while(rs.next()) 
{ 
name=rs.getString(1); 
email=rs.getString(2); 
subject=rs.getString(3);  
memo=rs.getString(4); 
//out.print("<center>"); 
//out.print("<table border=1>"); 
out.print("<tr>");
out.print("<td>"+name+"</td>"); 
out.print("<td>"+email+"</td>"); 
out.print("<td>"+subject+"</td>"); 
out.print("<td>"+memo+"</td>"); 
out.print("<td><a href='delete.jsp?subject="+subject+"'>删除</a></td>");
out.print("</tr>");
//out.print("</table><p>"); 
} 
out.print("</table><p>"); 
 %>
  </body>
</html>
