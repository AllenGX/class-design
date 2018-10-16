<%@page import="com.sun.org.apache.xml.internal.resolver.helpers.Debug"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
		<div class="none1"></div>
		<div>
			图汇网
		</div>
		<div>
			<a href="login.jsp">首页</a>
		</div>
		<div class="none2"></div>
			<%
	String username;
	if(session.getAttribute("username")==null){
		username="";
	}else{
		//username=new String((session.getAttribute("username").toString()).getBytes("ISO-8859-1"),"utf-8");
		username=new String((session.getAttribute("username").toString()));
	}
	if(username.equals("")){
		out.print("<div class=\"username\" ><a href=\"#\" onclick=\"f1()\" id=\"user\">未登录</a></div>");
	}else{
		out.print("<div class=\"username\" ><a href=\"MyDetailServlet\" id=\"user\">"+username+"</a></div>");
		out.print("<div class=\"logout\" ><a href=\"LogoutServlet\">退出</a></div>");
		/* System.out.println(username); */
	}
%>	
	<br class="clear">
	</header>
	<br class="clear">

</body>
</html>