<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/myOrderDetail.css"></link>
<title>图片</title>
</head>
<body class="body">
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<%
if(request.getParameter("pictureId")!=null&&!request.getParameter("pictureId").equals("")){
	int pictureId =Integer.parseInt(request.getParameter("pictureId"));
	
	PreparedStatement pre=null;
	ResultSet rs=null;
	try{
		pre=db.prepareStatement("select * from (picture p INNER JOIN user u on p.userId=u.userId) where p.pictureId=?");
		pre.setInt(1, pictureId);
		rs=pre.executeQuery();
		if(rs.next()){
			

	
%>
<center>
	<div class="main">
		<div class="title"><p><%=rs.getString("pictureTitle") %></p></div>
		
		<div class="pic">
			<img src="<%=rs.getString("picturePath")%>">
		</div>
		
		<div class="content"><p><%=rs.getString("pictureContent")%></p></div>
		<div class="foot">
			<a>提交日期:<%=rs.getString("pictureTime")%></a>
			<a>作者:<%=rs.getString("u.username")%></a>
		</div>
		<div class="bottom">
			<a class="topfile" href="DeleteCollectorServlet?pictureId=<%=pictureId%>">
				取消收藏
			</a>
			</div>
	</div>
</center>
<%
		}else{
			out.print("<script>if(alert(\"图片不存在!!\"));window.location.href=\"User.jsp\";</script>");
		}
	}catch(SQLException e){
		System.out.println(e.toString()+"pictureDetail.jsp-");
	}
	
}else{
	response.sendRedirect("User.jsp");
}

%>
</body>
</html>