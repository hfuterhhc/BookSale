<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

  </head>
  
  <body>
   <img class="ui fluid image"  src="image/book.jpg">
     
     <div class="ui attached stackable menu">
  <div class="ui container">
     <a class="item">
      <span class="STYLE1">当前管理员：<% out.print(request.getSession().getAttribute("Mname"));%></span>
    </a>
  
    <a class="item" href="manager/Manager_userOrder.jsp">
      <i class="home icon"></i>订单查看
    </a>
    <a class="item" href="manager/ManagerData.jsp">
      <i class="grid layout icon"></i>个人中心 
    </a>
    <a class="item" href="manager/Manager_bookTable.jsp" >
      <i class="mail icon "></i>图书管理
    </a>
    <a class="item"  href="manager/Manager_bookAdd.jsp">
        <i class="edit icon" ></i>图书分类管理
    </a>
      
     <a class="item" href="user/UserData.jsp">
      <i class="grid layout icon"></i>修改密码
      </a>
      
    </div>
    
    <div class="right item">
      <a class="ui item" href="Logout.jsp">退出</a>
    </div>
  </div>
    <div class="ui divider"></div>
  </body>
</html>
