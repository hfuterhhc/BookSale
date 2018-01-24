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
    
    <title>用户修改个人信息</title>
    
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
     String E_mail=(String)session.getAttribute("E_mail");
     if(E_mail!=null){  
          isModify=true;
     }
     else{
        response.sendRedirect("UserLogin.jsp");
     } 
     %>
     
     	<center>
			<table width="900" border="0" style="border: solid gray 1pt solid;">
				<tr> <td height="76" colspan="2"> <%@ include file="../head.jsp"%> </td> </tr>
				<tr>
					<td height="29" bgcolor="#6C7B8B">
						<span class="STYLE1">当前位置: &gt;&gt; 修改信息</span>	
					</td>
					<td height="29" bgcolor="#6C7B8B" align="right">
						<span class="STYLE1">当前用户：<% out.print(request.getSession().getAttribute("IDName"));%></span>
					</td>	
				</tr>
				<tr>
					<td height="254" colspan="2" align="center">
						<form action="UserUpdate" method="post" >
							<table>
                              <tr><td>电子邮件:</td><td><div class="ui input"><Input type=text name="Uemail" value=<% request.getSession().getAttribute("E_mail");%>></div></td></tr>
                              <tr><td>用户名称:</td><td><div class="ui input"><Input type=text name="Ulogname" ></div></td></tr>
                              <tr><td>设置密码:</td><td><div class="ui input"><Input type=password name="Upassword"></div></td></tr>
                              <tr><td>性&emsp;&emsp;别:</td>
	                          <td width="65%" align="left">男<input type="radio" name="Uesex" value="男">
		                      &emsp;&emsp;女<input type="radio" name="Uesex" value="女"></td></tr>
                              <tr><td>真实姓名:</td><td><div class="ui input"><Input type=text name="Urealname"></div></td></tr>
                              <tr><td>联系电话:</td><td><div class="ui input"><Input type=text name="Uphone"></div></td></tr>
                              <tr><td>通信地址:</td><td><div class="ui input"><Input type=text name="Uaddress"></div></td></tr>
                              <tr>	<td><Input type=submit name="gg" value="提交" class="ui button" ></td> </tr>
                           </table>
		               </form>
					</td>
				</tr>
				<tr>
					<td height="76" colspan="2">
						<%@ include file="../tail.jsp"%>
					</td>
				</tr>
			</table>
		</center>
     
     
  </body>
</html>
