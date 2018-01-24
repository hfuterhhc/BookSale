<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>用户登陆</title>
    
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
 <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  </head>
  
  <body>
       <%@ include file="../head.jsp"%>
   

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <div class="content">
        登录到账号
      </div>
    </h2>
    <form action="UserLogin" class="ui large form" method="post" >
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="E_mail" placeholder="用户E_mail">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="密码">
          </div>
        </div>
        <div class="ui fluid large teal submit button" >
           <input type="submit" value="登陆">
        </div>
      </div>

      <div class="ui error message"></div>

    <div class="ui message">
      新用户？ <a href="user/UserRegister.jsp">注册</a>
    </div>
    </form>
  </div>
</div>

 <%@ include file="../tail.jsp"%>
  </body>
</html>
