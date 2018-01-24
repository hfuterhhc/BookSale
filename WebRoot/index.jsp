<%@ page language="java" import="java.util.*,java.sql.*,com.util.*,com.javabeen.*,com.sqls.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <!-- HTML中文编码转换 -->
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
     <base href="<%=basePath%>">

    
    <title>在线图书销售</title>
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
   
   <%@ include file="head.jsp"%>
   
  	<table width="100%" border="0">
		<tr>
		<td height="30" colspan="5" class="STYLE4" align="center">
			<form action="SearchBook" method="post">
				图书检索：&nbsp;&nbsp; 分类选择:&nbsp;&nbsp;
		     <select  name="dname" style="width: 110px;">
                   <option value=""  selected="selected">请选择</option>
                   <option value="1">计算机</option>
                   <option value="2">传记</option>
                   <option value="3">史学</option>
                   <option value="4">文学</option>
                   <option value="5">经济学</option>
                   <option value="6">心理学</option>
                   <option value="7">建筑学</option>
			 </select>
			 <input class="ui button" type="submit" value="查询">
		  </form>
		 <br></td>
      </tr>
    </table>
  
   
      <%  
    	ArrayList<BookBeen> listbook =(ArrayList<BookBeen>)session.getAttribute("booksC");
		if(listbook!=null)
		{
	    %>
    	<table class="ui celled table"><thead><tr><th>图片</th><th>书条形码</th><th>书名</th><th>作者</th><th>价格</th><th>库存数量</th><th>出版日期</th><th>购买数量</th><th>购买</th></tr></thead>
    	<tbody>
    	<%
	      for(BookBeen book : listbook){
	    %>
	       <form action="UserGoumai" method="post">
	       <tr><td><img src="<%=book.getPhoto() %>"width="100" height="120"/></td>
	       <td><%=book.getISBN() %></td>
    	   <td><%=book.getBookName()%></td>
           <td><%=book.getAuthor() %></td>
            <td><%=book.getPNPrice()%></td>
            <td><%=book.getStock()%></td>
    	    <td><%=book.getPublishDate()%></td>
    	     <td><select  name="shuliang" style="width: 90px;">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                <option value="5">5</option></select></td>
    	    <td><Input type=submit name="goumai" value="购买" class="ui button" ></td>
    	    </tr>
    	    <input type="hidden" name="bb"  value="<%=book.getISBN() %>">
    	    <input type="hidden" name="action" value="ADD">
    	    </form>
    	<% 
    	}
    	%>
    	
     	</tbody></table>
     <% 
     	}
     %>
     
     
       <%  
       BookSql booksql = new BookSql();
       ArrayList<BookBeen> listbook1 = booksql.getBookByBookC(1);
       if(listbook==null)
		{
	    %>
    	<table class="ui celled table"><thead><tr><th>图片</th><th>书条形码</th><th>书名</th><th>作者</th><th>价格</th><th>库存数量</th><th>出版日期</th><th>购买数量</th><th>购买</th></tr></thead>
    	<tbody>
    	<%
	      for(BookBeen book1 : listbook1){
	    %>
	       <form action="UserGoumai" method="post">
	       <tr><td><img src="<%=book1.getPhoto() %>"width="100" height="120"/></td>
	       <td><%=book1.getISBN() %></td>
    	   <td><%=book1.getBookName()%></td>
           <td><%=book1.getAuthor() %></td>
            <td><%=book1.getPNPrice()%></td>
            <td><%=book1.getStock()%></td>
    	    <td><%=book1.getPublishDate()%></td>
    	     <td><select  name="shuliang" style="width: 90px;">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                <option value="5">5</option></select></td>
    	    <td><Input type=submit name="goumai" value="购买" class="ui button" ></td>
    	    </tr>
    	    <input type="hidden" name="bb"  value="<%=book1.getISBN() %>">
    	    <input type="hidden" name="action" value="ADD">
    	    </form>
    	<% 
    	}
    	%>
    	
     	</tbody></table>
     <% 
     	}
     %>
    
  
   <%@ include file="tail.jsp"%>

  </body>
</html>
