<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
     
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="semantic/semantic.min.css">
    <script
       src="https://code.jquery.com/jquery-3.1.1.min.js"
       integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
       crossorigin="anonymous"></script>
    <script src="semantic/semantic.min.js"></script>
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  
.b-sec:after{display:block;clear:both;visibility:hidden;height:0;overflow:hidden;content:".";}
.b-sec{margin-top:30px;zoom:1;clear: both; overflow:hidden;}

.b-sec .left{float:left;width:700px;}
.b-sec .right{float:right;width:260px;position:relative;}
.main a:hover{color:#c9483c!important;}

.b-sec header{margin-bottom:18px;position:relative;}
.b-sec header h2{font-size:18px;line-height:18px;color:#000;}
.b-sec header .more{position:absolute;top:4px;right:0;font-size:13px;color:#888;}
.b-sec h2{font-size:18px;line-height:28px;color:#000;margin-bottom:8px;}
.b-sec .contents{border:#ebe6e1 solid 1px;}


.m-tui{border:#ebe6e1 solid 1px;}
.m-tui ul li{float:left;padding:20px 15px 20px 10px;width:320px;border-right:#ebe6e1 solid 1px;}
.m-tui ul li:hover{background-color:#f5f5f5;}
.m-tui ul li.rt{border-right:none;padding-right:21px;}
.m-tui ul li.up{border-bottom:#ebe6e1 solid 1px;}
.m-tui-info{position:relative;}
.m-tui-info .cover{float:left;display:inline;width:160px;height:160px;margin:0 15px 0 0;overflow:hidden;}
.m-tui-info .cover img{width:160px;height:160px;box-shadow:1px 1px 3px #aaa;}
.m-tui-info h3{max-height:44px;line-height:22px;overflow:hidden;font-size:16px;color:#655;font-weight:bold;}
.m-tui-info h3 a{color:#4c4c4c;}
.m-tui-info p{color:#888;line-height:18px;margin:6px 0 5px;}
.m-tui-info p a{color:#1c77ba;}
.m-tui-info p.disc{height:54px;line-height:18px;white-space:normal;display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;letter-spacing:1px;}
.m-tui-info a.read{position:absolute;bottom:-3px;left:176px;color:#655;font-weight:bold;}
.m-tui-info a.read i{display:inline-block;position:relative;width:4px;height:7px;margin:0 0 0 3px;top:0;background:url(../img/arrow.png) 0 0 no-repeat;}
.m-tui-info a.read:hover i{background:url(../img/arrow-red.png) 0 0 no-repeat;}

.m-list{border:#ebe6e1 solid 1px;border-top:#37485A solid 3px;}
.m-list li{border-bottom:#f5f2f0 solid 1px;}
.m-list li:hover{background-color:#f5f5f5;}
.m-list .fold,.m-list .folda{padding:0 14px 0 22px;height:39px;line-height:39px;overflow:hidden;}
.m-list .fold a,.m-list .folda a{color:#655;font-size:14px;display:block;height:39px;width:220px;line-height:39px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
.m-list .fold i,.m-list .folda i{color:#aaa;margin-right:16px;font-family:arial;}
.m-list .unfold{padding:24px 14px 8px 20px;position:relative;height:118px;}
.m-list .unfold:hover{background-color:#f5f5f5;}
.m-list .unfold i{position:absolute;top:14px;left:20px;color:#c9483c;font-size:18px;font-family:arial;}
.m-list .unfold .img{float:left;margin-left:34px;margin-right:8px;}
.m-list .unfold img{width:96px;height:96px;}
.m-list .unfold h3{font-size:16px;line-height:22px;max-height:44px;overflow:hidden;}
.m-list .unfold h3 a{color:#4c4c4c;font-weight:bold;}
.m-list .unfold p{color:#888;margin-top:5px;}
.m-list .more,.m-list .morea{position:relative;display:block;height:39px;line-height:39px;padding:0 0 0 54px;font-size:14px;color:#655;background-color:#fdfdfd;}
.m-list .more i,.m-list .morea i{position:absolute;width:10px;height:9px;top:16px;left:26px;background-position:0 0;}

.m-list .folda,.m-list .folda a,.m-list .morea{height:41px;line-height:41px;}
  
  </style>

  </head>
 
  <body>
  
   <%@ include file="head.jsp"%>
   
<!-- 主编推荐 -->
<div class="b-sec">
	<div class="right">
		<header><h2>主编推荐</h2></header>
		<div class="m-tui"><ul class="book f-cb">
				<li class="up">
                <div class="m-tui-info f-cb">
                <a class="cover" href="book/17508/"><img src="bkimg/2015/25206575-1_w_1.jpg" /></a>
                <h3><a href="book/17508/">你值得世间所有的美好</a></h3>
                <p>林小仙</p><p class="disc eps">双鱼宁愿像个孩子，不肯看太多的事，听太多的不是，单纯一辈子。...</p>
                <a class="read" href="book-sample/17508/">立即领取<i></i></a>
                </div></li>
				<li class="up rt">
                <div class="m-tui-info f-cb">
                <a class="cover" href="book/17511/"><img src="bkimg/2015/25205679-1_w_1.jpg" /></a>
                <h3><a href="book/17511/">假如我被困在同一天</a></h3>
                <p>王左中右、唐梓严、灵魂厨娘 等，</p><p class="disc eps">神秘诡异的绑架 小心埋藏的爱情 拼命坚守的道义 我困住了时间...</p>
                <a class="read" href="book-sample/17511/">立即领取<i></i></a>
                </div></li>
				<li>
                <div class="m-tui-info f-cb">
                <a class="cover" href="book/17510/"><img src="bkimg/2015/25206714-1_w_1.jpg" /></a>
                <h3><a href="book/17510/">我们都在大大的绝望里，小小地努力着</a></h3>
                <p>林小仙</p><p class="disc eps">摩羯是比较实在的一类人，爱你就对你掏心窝的好，不爱你就一秒钟...</p>
                <a class="read" href="book-sample/17510/">立即领取<i></i></a>
                </div></li>
				<li class="rt">
                <div class="m-tui-info f-cb">
                <a class="cover" href="book/17505/"><img src="bkimg/2015/25206098-1_w_1.jpg" /></a>
                <h3><a href="book/17505/">清风烈酒后，愿你终能懂自己</a></h3>
                <p>潘云贵</p><p class="disc eps">在这个世界上，一定有比爱情更重要的事，在发生，在等待我们：梦...</p>
                <a class="read" href="book-sample/17505/">立即领取<i></i></a>
                </div></li></ul>
		</div>
	</div>
	<div class="left">
		<header><h2>作家风云榜</h2></header>
		<div class="m-list"><ul>
			
			<li><p class="fold"><a href="author/A01569.asp"><i>01</i>辛夷坞</a></p></li>
			
			<li><p class="fold"><a href="author/A17380.asp"><i>02</i>郑寿全</a></p></li>
			
			<li><p class="fold"><a href="author/A09658.asp"><i>03</i>圣埃克絮佩里</a></p></li>
			
			<li><p class="fold"><a href="author/A09462.asp"><i>04</i>汤素兰</a></p></li>
			
			<li><p class="fold"><a href="author/A41172.asp"><i>05</i>六六</a></p></li>
			
			<li><p class="fold"><a href="author/A10570.asp"><i>06</i>维·苏·奈保尔</a></p></li>
			
			<li><p class="fold"><a href="author/A19887.asp"><i>07</i>张欣尧</a></p></li>
			
			<li><p class="fold"><a href="author/A13422.asp"><i>08</i>内尔森·德米勒</a></p></li>
			
			<li><p class="fold"><a href="author/A21694.asp"><i>09</i>白文</a></p></li>
			</ul><a class="more" href="../../author/"><i></i>查看更多</a>
		</div>
	</div>
</div>

]
 <%@ include file="tail.jsp"%>
  </body>
</html>
