<%@ page language="java" import="java.util.*,java.sql.*,com.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员个人中心</title>
    
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
  
      <%@ include file="Manager_head.jsp" %>
      <div class="ui middle aligned center aligned grid">
    <% conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select * from AdminTable where Name=?");
    	
    	String Mname=(String)session.getAttribute("Mname");
    	sql.setString(1, Mname);
    	rs=sql.executeQuery();
    	
    	out.print("<table  class=\"ui collapsing table\"><thead><tr><th colspan=\"3\" class=\"three wide\">个人信息</th></tr></thead>");
    	out.print("<tbody>");
    	if(rs.next()){
    	out.print("<tr><td><i class=\"Mail icon\"></i> "+"管理员编号:  "+rs.getString("AdminNo")+"</td></tr>");
      	out.print("<tr><td><i class=\"User icon\"></i>"+"管理员姓名:  "+rs.getString("Name")+"</td></tr>");
      	out.print("<tr><td><i class=\"lock icon\"></i>"+"管理员密码:    "+rs.getString("Password")+"</td></tr>");
    	out.print("</tbody></table>");
    	}
     	
     %>
  <%@ include file="../tail.jsp"%>
  </body>
</html>
