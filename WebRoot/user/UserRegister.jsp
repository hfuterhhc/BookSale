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
   
   <script src="Semantic/semantic.min.js"></script>
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body><Font size=2>
<%@ include file="../head.jsp"%>

<CENTER>
<FORM action="UserRegister" method="post" name=form>
用户注册<br>
<table>
   <tr><td>电子邮件:</td><td><div class="ui input"><Input type=text name="email"></div></td></tr>
   <tr><td>用户名称:</td><td><div class="ui input"><Input type=text name="logname" ></div></td></tr>
   <tr><td>设置密码:</td><td><div class="ui input"><Input type=password name="password"></div></td></tr>
   <tr><td>真实姓名:</td><td><div class="ui input"><Input type=text name="realname"></div></td></tr>
   <tr><td>联系电话:</td><td><div class="ui input"><Input type=text name="phone"></div></td></tr>
   <tr><td>通信地址:</td><td><div class="ui input"><Input type=text name="address"></div></td></tr>
   <tr><td><Input type=submit name="g" value="提交" class="ui button" ></td> </tr>
</table>
</Form>
</CENTER>

 <%@ include file="../tail.jsp"%>
  </body>
</html>
