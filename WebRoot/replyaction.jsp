<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="db.DbClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>回复结果 </title>
    
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
      String name,subject,time,reply;
      name=(String)session.getAttribute("username");
      subject=(String)session.getAttribute("subject");
      reply=request.getParameter("reply");
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Date date=new Date();
      time=df.format(date);
      try{
        Connection conn=new DbClass().getConn();
        String sql="insert into replytable(name,subject,replycontent,time) values(?,?,?,?)";
        PreparedStatement pst=conn.prepareStatement(sql);
        pst.setString(1,name);
        pst.setString(2,subject);
        pst.setString(3,reply);
        pst.setString(4,time);
        int m=pst.executeUpdate();
        if(m>0)
        {
          out.println("回复成功 ！");
          out.println("<a href='showall.jsp'>返回查看留言页面</a>");
        }
        else
        {
         out.println("回复失败 ！");
         out.println("<a href='showall.jsp'>返回查看留言页面</a>");
        }
      }catch(Exception ex)
      {
        ex.printStackTrace();
      }
     %>
     
  </body>
</html>
