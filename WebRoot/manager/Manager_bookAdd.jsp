<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" type="text/css" href="Semantic/semantic.min.css">
   <script
      src="https://code.jquery.com/jquery-3.1.1.min.js"
      integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
       crossorigin="anonymous">
   </script>
    <title>My JSP 'Manager_bookAdd.jsp' starting page</title>
    
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
   <CENTER>
    
    
<FORM action="AdminBookAdd" method="get" name=form>
<h2 class="ui teal image header">
      <div class="content">
        添加图书
      </div></h2><br>
      
      <table class="ui celled table">
      <thead>
      <tr>
      <th>条形码</th><th>书名</th><th>分类编号</th><th>原价</th><th>出版社</th><th>出版日期</th><th>作者</th><th>库存量</th><th>现价</th><th>状态</th>
      </tr>
      </thead>
      <tbody>
      <tr><td><div class="ui input"><Input type=text name="ISBN"></div></td>
      <td><div class="ui input"><Input type=text name="BookName"></div></td>
      <td><div class="ui input"><Input type=text name="CID" ></div></td>
      <td><div class="ui input"><Input type=text name="BookPrice"></div></td>
      <td><div class="ui input"><Input type=text name="Publisher"></div></td>
      <td><div class="ui input"><Input type=text name="PublishDate"></div></td>
      <td><div class="ui input"><Input type=text name="Author"></div></td>
      <td><div class="ui input"><Input type=text name="Stock"></div></td>
      <td><div class="ui input"><Input type=text name="BookStatus"></div></td>
   	  <td><div class="ui input"><Input type=text name="PNPrice"></div></td>
   	  <td><div class="ui input"><Input type=text name="BookStatus"></div></td></tr>
   	  </tbody>
   	 
   	  </table>
   	   <tr><td><Input type=submit name="g" value="提交" class="ui button" ></td> </tr>
   	  

</Form>
</CENTER>
  </body>
</html>
