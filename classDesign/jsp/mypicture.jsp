<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@page import="com.Design.Bean.Order" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page" />
<%@page import="com.Design.Bean.Picture" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/myPicture.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的作品</title>
<style type="text/css">

</style>

</head>
<body class="body">	
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Mylocation.jsp"></jsp:include>	

<%

System.out.print(request.getContextPath());

	List<Picture> ps=new ArrayList<Picture>();
	int userId=-1;
	try{
		userId=Integer.parseInt(session.getAttribute("userId").toString());
 	}
	catch(Exception e){
		out.print("window.location.href=document.referrer;</script>");
		System.out.print(e.toString()+"myPicture.jsp-33");
	}
/* 	String username="admin"; */
	PreparedStatement pre=null;
	ResultSet rs=null;
	int i=0;
	try{
		pre=db.prepareStatement("select * from picture where userId =?");
		pre.setInt(1, userId);
		rs=pre.executeQuery();
		while(rs.next()){
			Picture p=new Picture(rs.getInt("pictureId"),
					rs.getString("picturePath"),
					rs.getString("pictureTime"),
					rs.getString("pictureTitle"),
					rs.getString("pictureContent"),
					rs.getString("keyWord"),
					rs.getInt("userId"));
			ps.add(p);
			i++;
		}
		//System.out.print(i);
	}catch(SQLException e){
		System.out.print(e.toString()+"myPicture.jsp-56");
	}
%>


<div class="water">
	<div class="tp"><p>我的作品</p></div>
	<div class="cent">
		<!-- //中件这段固定格式 -->
		<div id="container">
				<%
					int cnt=0;
					while(cnt<i){
						out.print("<div class=\"cell\"><div class=\"every\"><a href=pictureDetail.jsp?pictureId="+ps.get(cnt).getPictureId()+"><img  width=\"200px\" src="+ps.get(cnt).getPicturePath()+" /><p>"+ps.get(cnt).getPictureTitle()+"</p></a></div></div>");
						cnt++;
					}
				%>
		</div>
	</div>
	<div class="bottom"><a class="topfile" href="topFile.jsp">上传</a></div>
</div>
<jsp:include page="./childer/water.jsp"></jsp:include>	
</body>
</html>