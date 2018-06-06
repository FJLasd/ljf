<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
   <%
    String name=(String)session.getAttribute("username");
    %>
   <BODY>&nbsp;  
<font size=5 color=pink>留言板</font> 
<hr> 
<center> 
<form action=savememo.jsp method=get> 
<table border=3 width="300" height="260"> 
<tr> 
<td>姓名:</td> 
<td><input type=text size=20 name="name" value="<%=name%>" disabled></td> 
</tr> 
<tr> 
<td>性别</td> 
<td>男<input type=radio name=sex value=boy.gif checked>女 
<input type=radio name=sex value=girl.gif checked></td> 
</tr> 
<tr> 
<td>Email:</td> 
<td><input type=text size=40 name="email"></td> 
</tr> 
<tr> 
<td>主题：</td> 
<td><input type=text size=60 name="subject"></td> 
</tr> 
<tr> 
<td>留言:</td> 
<td><textarea name="memo" rows=4 cols=60></textarea></td> 
</tr> 
<tr align=center><td colspan=3><input type=submit method=send value=留言> 
<input type=reset value=重新输入></td> 

</tr> 
</table> 
</form> 
<hr> 
<center> 
<a href=adminlogin.jsp>管理留言</a> 
<a href=showall.jsp>查看留言</a> 
</BODY> 
  </body>
</html>
