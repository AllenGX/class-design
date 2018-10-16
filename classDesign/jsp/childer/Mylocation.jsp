<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/User.css"></link>
<title>Insert title here</title>
</head>
<body>
	<div class="center2">
		<div class="image">
			<img src="../image/3.png" />
			<div class="myfans"><p><%=session.getAttribute("fsN") %></p><h3>粉丝</h3></div>
			<span></span>
			<div class="fansmy"><p><%=session.getAttribute("bfsN") %></p><h3>关注</h3></div>
		</div>
		<div class="content">
			<div><a href="mypicture.jsp"><img src="../image/29.png"><p>作品</p></a></div>
			<div><a href="myLike.jsp"><img src="../image/30.png"><p>收藏</p></a></div>
			<div><a href="myorder.jsp"><img src="../image/31.png"><p>订单</p></a></div>
			<div><a href="takeorder.jsp"><img src="../image/32.png"><p>任务</p></a></div>
		</div>
		
		<div class="foot">
			<div class="mypicture"><a>作品</a><p><%=session.getAttribute("picN") %><p></div>
			<div class="mylike"><a >收藏</a><p><%=session.getAttribute("colN") %><p></div>
			<div class="myorder"><a>订单</a><p><%=session.getAttribute("orderN") %><p></div>
			<div class="takeorder"><a>任务</a><p><%=session.getAttribute("sellerN") %><p></div>
		</div>
	</div>
</body>
</html>