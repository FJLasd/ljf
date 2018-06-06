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
    
    <title>删除留言</title>
    
  </head>
  
  <body>
    <%
     try{
      Connection conn=new DbClass().getConn();
      String subject=request.getParameter("subject");
      String sql="delete from messa where subject=?";
      PreparedStatement pst=conn.prepareStatement(sql);
      pst.setString(1,subject);
      int result=pst.executeUpdate();
      if(result>0)
      {
        out.print("留言删除成功！");
        out.println("<a href='opendata.jsp'>返回管理页面</a>");
      }
      else
      {
         out.print("留言删除失败！");
         out.println("<a href='opendata.jsp'>返回管理页面</a>");
      }
      }catch(Exception ex){
        ex.printStackTrace();
       }
      
     %>
  </body>
</html>
