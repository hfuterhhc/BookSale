<%@ page language="java" import="java.util.*,java.sql.*,com.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单查看</title>
    
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
     boolean isModify=false; //是否 修改
     String E_mail=(String)session.getAttribute("E_mail");
     if(E_mail!=null){  
          isModify=true;
     }
     else{
        response.sendRedirect("UserLogin.jsp");
     } 
     %>
     
     <%@ include file="../head.jsp" %>
  
     <% 
     	conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select * from uesr_order_info where E_mail=? "); //视图二
    	
    	String e_mail=(String)session.getAttribute("E_mail");
    	sql.setString(1, e_mail);
    	rs=sql.executeQuery();
    	
    	out.print("<table class=\"ui celled table\"><thead><tr><th>订单编号</th><th>订单日期</th><th>书名</th><th>数量</th><th>状态</th></tr></thead>");
    	out.print("<tbody>");
    	while(rs.next()){
    	out.print("<tr><td>"+rs.getInt("OrderID")+"</td>");
      	out.print("<td>"+rs.getDate("OrderDate")+"</td>");
     	out.print("<td>"+rs.getString("BookName")+"</td>");
     	out.print("<td>"+rs.getInt("OrderQuantity")+"</td>");
     	out.print("<td>"+rs.getString("OrderStatus")+"</td></tr>");
    	}
     	out.print("</tbody></table>");
     %>
  </body>
</html>
