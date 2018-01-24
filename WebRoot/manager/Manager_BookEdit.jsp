<%@ page language="java" import="java.util.*,com.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'Manager_BookEdit.jsp' starting page</title>
    
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
     
     <form action="Manager_Bookdo" method="post" class="ui large form" >"
    <% 
    	request.setCharacterEncoding("UTF-8");
     	conndb a=new conndb();
     	PreparedStatement sql=null;
     	ResultSet rs=null;
     	
     	String isbn=request.getParameter("edit");
     	System.out.print("isbn:"+isbn);
    	Connection conn=a.getConn();
    	sql=conn.prepareStatement("select *from booktable where ISBN=?");
    	sql.setString(1, isbn);
    	rs=sql.executeQuery();
    	
    	out.print("<table class=\"ui celled table\"><thead><tr><th>图片路径</th><th>图书编号</th><th>图书名称</th><th>分类号</th><th>单价</th><th>出版社</th><th>出版日期</th><th>作者</th><th>库存</th><th>下架</th><th>编辑</th></tr></thead>");
    	out.print("<tbody><tr>");
    	if(rs.next()){
    	
    	out.print("<tr><td><div class=\"ui transparent input\"><input type=\"text\" name=\"photo\" value=\" "+rs.getString("photo")+"\" ></input></div></td>");
    	out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"ISBN\" value=\""+rs.getString("ISBN")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"BookName\" value=\""+rs.getString("BookName")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"CID\" value=\""+rs.getInt("CID")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"BookPrice\" value=\""+rs.getFloat("BookPrice")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"Publisher\" value=\""+rs.getString("Publisher")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"PublishDate\" value=\""+rs.getDate("PublishDate")+"\"</input></div></td>"); 
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"Author\" value=\""+rs.getString("Author")+"\"</input></div></td>");
        out.print("<td><div class=\"ui transparent input\"><input type=\"text\" name=\"PStock\" value=\""+rs.getInt("Stock")+"\"</input></div></td>"); 
		out.print("<td><div class=\"ui transparent input\"><select type=\"text\" name=\"BookStatus\" ><option values=\"已下架\">已下架</option><option value=\"正常销售\">正常销售</option></select></div></td>"); 
        //out.print("<td><button name=\"delete\" type=\"submit\" value=\"delete\" class=\"ui button\">dropdown</button> </td>"); 
        out.print("<td><button name=\"delete\" type=\"submit\" value=\"save\" class=\"ui button\">save</button> </td></tr>"); 	
    	}
     	out.print("</tbody></table>");
     	%>
     	</form>
     	
     	 
  </body>
</html>
