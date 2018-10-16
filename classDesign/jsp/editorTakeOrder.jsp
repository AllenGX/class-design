<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@page import="java.sql.*" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page" />
<%@page import="com.Design.Bean.Order" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑订单</title>
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/detail.css"></link>
<link rel="stylesheet" type="text/css" href="../css/topFile.css"></link>
<link rel="stylesheet" type="text/css" href="../css/Tobeedited.css"></link>
<%
if(request.getParameter("orderId")!=null&&!request.getParameter("orderId").equals("")){
	int orderId =Integer.parseInt(request.getParameter("orderId"));
	
	PreparedStatement pre=null;
	ResultSet rs=null;
	try{
		pre=db.prepareStatement("select * from (design.`order` od INNER JOIN user u on od.sellerId=u.userId INNER JOIN user d on od.buyerId=d.userId) where od.orderId=?");
		pre.setInt(1, orderId);
		rs=pre.executeQuery();
		String states="未完成";
		int state=0;
		if(rs.next()){
			if((state=rs.getInt("orderStates"))==1){
				states="已完成";
			}
%>

</head>
<body class="body">	
<jsp:include page="./childer/all.jsp"></jsp:include>
<form class="" action="SaveOrderPictureServlet?orderId=<%=orderId%>" method="post" enctype="multipart/form-data" >
<jsp:include page="./childer/inputFile.jsp"></jsp:include>
	<center>
	<div class="main Main">
		<div class="title"><p><%=rs.getString("orderTitle")%></p></div>
		
		
		<div id="img_upload" class="pic"><img src="<%=rs.getString("picturePath")%>"></div>
		<div class="file" >	
			<div class="inner">
				<a onclick="fileInto()" id="file">
					<img src="../image/+.png" />
					<br>
					<span>更换图片</span>
				</a>
			</div>
		</div>
		
		<div class="content"><p><%=rs.getString("orderContent")%></p></div>
		<div class="foot">
			<a>价格:<%=rs.getDouble("piece")%>元</a>
			<a>付款人:<%=rs.getString("d.username")%></a>
			<a>收款人:<%=rs.getString("u.username")%></a>
			<a>截止日期:<%=rs.getString("orderTime")%></a>
			<a>订单号:<%=rs.getInt("orderId")%></a>
			<a>订单状态:<%=states %></a></div>
		<div class="bottom">
			<input class="topfile" type="submit"  value="保存任务" />
		</div>
	</div>
	</center>
<%
		}else{
			out.print("<script>if(alert(\"订单不存在!!\"));window.location.href=\"User.jsp\";</script>");
		}
	}catch(SQLException e){
		System.out.println(e.toString()+"myorderDetail.jsp-");
	}
	
}else{
	response.sendRedirect("User.jsp");
}
%>	
</form>	
</body>
</html>