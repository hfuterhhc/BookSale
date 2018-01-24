<%@ page language="java" import="java.util.*,java.sql.*,com.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>

function change(){
	

}
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
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
     String E_mail=(String)session.getAttribute("E_mail");
     if(E_mail!=null){  
          isModify=true;
     }
     else{
        response.sendRedirect("UserLogin.jsp");
     } 
     %>
     
    <%@ include file="../head.jsp" %>
    
    


<div class="ui middle aligned center aligned grid">
    <% conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select * from UserTable where E_mail=?");
    	
    	String e_mail=(String)session.getAttribute("E_mail");
    	sql.setString(1, e_mail);
    	rs=sql.executeQuery();
    	
    	out.print("<table  class=\"ui collapsing table\"><thead><tr><th colspan=\"3\" class=\"three wide\">个人信息</th></tr></thead>");
    	out.print("<tbody>");
    	if(rs.next()){
    	out.print("<tr><td><i class=\"Mail icon\"></i> "+rs.getString("E_mail")+"</td></tr>");
      	out.print("<tr><td><i class=\"User icon\"></i>"+rs.getString("IDName")+"</td></tr>");
     	out.print("<tr><td><i class=\"Intergender icon\"></i>"+rs.getString("Sex")+"</td></tr>");
     	out.print("<tr><td><i class=\"Tag icon\"></i>"+rs.getString("Address")+"</td></tr>");
      	out.print("<tr><td><i class=\"Call icon\"></i>"+rs.getString("Telephone")+"</td></tr>");
    	out.print("</tbody></table>");
    	}
     	
     %>
  
  </body>
</html>
