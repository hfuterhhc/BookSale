<%@ page language="java" import="java.util.*,java.sql.*,com.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <link rel="stylesheet" type="text/css" href="semantic/semantic.min.css">
    <script
       src="https://code.jquery.com/jquery-3.1.1.min.js"
       integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
       crossorigin="anonymous"></script>
    <script src="semantic/semantic.min.js"></script>
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
     boolean isModify=false;
     String mname=(String)session.getAttribute("Mname");
     if(mname!=null){  
          isModify=true;
     }
     else{
        response.sendRedirect("ManagerLogin.jsp");
     } 
    %>
     <%@ include file="Manager_head.jsp" %>

     <form action="Manager_OrderChange" method="post" class="ui large form">
   
    <% 
     	conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select * from order_slt"); //视图一
    	rs=sql.executeQuery();
    	
    	out.print("<table class=\"ui celled table\"><thead><tr><th>订单编号</th><th>订单日期</th><th>书名</th><th>数量</th><th>总价</th><th>用户E_mail</th><th>书的条形码</th><th>状态</th><th>删除</th><th>编辑</th></tr></thead>");
    	out.print("<tbody>");
    	while(rs.next()){
    	out.print("<tr><td><div class=\"ui transparent input\"><input type=\"text\" name=\"OrderID\" value=\""+rs.getInt("OrderID")+"\"></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"OrderDate\"value=\""+rs.getDate("OrderDate")+"\"></div</td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"BookName\" value=\""+rs.getString("BookName")+"\"></div</td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"OrderQuantity\" value=\""+rs.getInt("OrderQuantity")+"\"></div</td>");
        out.print("<td>"+rs.getFloat("TotalAmount")+"</td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"E_mail\" value=\""+rs.getString("E_mail")+"\"></div</td>"); 
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"ISBN\" value=\""+rs.getString("ISBN")+"\"></div</td>");
       // out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"status\" placeholder=\""+rs.getString("status")+"\"></div</td>"); 
        out.print("<td><button name=\"delete\" type=\"submit\" value=\"delete\" class=\"ui button\">delete</button> </td>"); 
        out.print("<td><button name=\"delete\" type=\"submit\" value=\"save\" class=\"ui button\">save</button> </td>"); 	
    	}
     	out.print("</tr></tbody></table>");
     %> 
</form>
  </body>
</html>
