<%@ page language="java" import="java.util.*,com.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <link rel="stylesheet" type="text/css" href="semantic/semantic.min.css">
	  <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous">
     </script>
    <script src="semantic/semantic.min.js"></script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <base href="<%=basePath%>">
    
    <title>My JSP 'Manager_bookTable.jsp' starting page</title>

  </head>
  
  <body>
   <%@ include file="Manager_head.jsp" %>
   
   <% 
     	conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select * from BookTable ");
    	
    	rs=sql.executeQuery();
    
    	out.print("<table class=\"ui celled table\"><thead><tr><th>图片</th><th>图书编号</th><th>图书名称</th><th>分类号</th><th>单价</th><th>出版社</th><th>出版日期</th><th>作者</th><th>库存</th><th>状态</th><th>编辑</th></tr></thead>");
    	out.print("<tbody><tr>");
    	while(rs.next()){
    	out.print("<form action=\"manager/Manager_BookEdit.jsp\" method=\"post\" class=\"ui large form\" >");
    	out.print("<tr><td><img src=\""+rs.getString("photo")+"\" width=\"100\" height=\"120\" /></td>");
    	out.print("<td>"+rs.getString("ISBN")+"</td>");
        out.print("<td>"+rs.getString("BookName")+"</td>");
        out.print("<td>"+rs.getInt("CID")+"</td>");
        out.print("<td>"+rs.getFloat("BookPrice")+"</td>");
        out.print("<td>"+rs.getString("Publisher")+"</td>");
        out.print("<td>"+rs.getDate("PublishDate")+"</td>"); 
        out.print("<td>"+rs.getString("Author")+"</td>");
        out.print("<td>"+rs.getInt("Stock")+"</td>"); 
        out.print("<td>"+rs.getString("BookStatus")+"</td>"); 
       
        out.print("<td><button name=\"edit\" type=\"submit\" value=\""+rs.getString("ISBN")+"\" class=\"ui button\">编辑</button> </td></tr></form>"); 	
    	}
     	out.print("</tbody></table>");
     %> 
  <tfoot class="full-width">
    <tr>
      <th></th>
      <th colspan="9">
        <a class="ui right floated small primary labeled icon button" href="manager/Manager_bookAdd.jsp">
          <i class="user icon" ></i> Add book
        </a>
        
      </th>
    </tr>
  </tfoot>
</table>
  </body>
</html>
