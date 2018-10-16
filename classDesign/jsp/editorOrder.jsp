<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单编辑</title>
<%@page import="java.sql.*" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page" />
<link rel="stylesheet" type="text/css" href="../css/Tobeedited.css"></link>
<link rel="stylesheet" type="text/css" href="../css/topFile.css"></link>
<link rel="stylesheet" type="text/css" href="../css/createOrder.css"></link>
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<style type="text/css">
.Main .img_upload img {
	max-width: 1000px;
}
</style>
</head>
<body class="body">
<%
	if(session.getAttribute("userId")==null||session.getAttribute("userId").equals("")||
		request.getParameter("orderId")==null||request.getParameter("orderId").equals("")){
		response.sendRedirect("login.jsp");
	}else{
		int userId=Integer.parseInt(session.getAttribute("userId").toString());
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		PreparedStatement pre=null;
		ResultSet rs=null;
		pre=db.prepareStatement("select * from `order` where orderId=? and buyerId=?");
		try{
			pre.setInt(1, orderId);
			pre.setInt(2, userId);
			rs=pre.executeQuery();
			if(rs.next()){
				
				
%>

<form name="myform" action="SaveOrderServlet?orderId=<%=orderId %>" method="post" onsubmit="return f()">
	<div class="Main">
		<div class="Titles"><a>标题:</a><input id="title" type="text" name="title" value="<%=rs.getString("orderTitle") %>">
		</div>
		<div id="img_upload" class="img_upload">
			<img  src="../image/timg.jpg" name="img">
		</div>
		<div class="Content">
			<a>图片要求:&nbsp;&nbsp;</a>
			<textarea rows="3" cols="40" id="content" name="content" ><%=rs.getString("orderContent") %></textarea>
		</div>
		<br class="clear">
		<div class="foot">
			<a>截止日期:</a><input type="text" name="time" placeholder="默认格式   XXXX-XX-XX" id="time" value="<%=rs.getString("orderTime") %>">
		</div>
		<div class="foots">
			<a>价格:</a><input type="text" class="piece" name="piece" id="piece" value="<%=rs.getDouble("piece") %>"><a>元</a><div class="none"></div>
		</div>
		<!-- <br class="clear"> -->
		<div class="inpu"><input type="submit" value="保存" onclick="" /> </div>
	</div>
</form>
<script src="../js/Testing.js"></script>
<script>


function f(){
	if(titleIsOk()&&contentIsOk()&&timeIsOk()&&pieceIsOk())return true;
	else return false;
}
</script>
<%
			}
		}catch(SQLException e){
			
		}
	}
%>


</body>
</html>