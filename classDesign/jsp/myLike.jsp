<%@page import="java.sql.*" %>
<%@page import="com.Design.Bean.Order" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page" />
<%@page import="com.Design.Bean.Picture" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的喜欢</title>
<style type="text/css">
.mylike{
height:80px;
}
</style>
</head>
<body class="body">	
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Mylocation.jsp"></jsp:include>	
	
<%
	List<Picture> ps=new ArrayList<Picture>();

	/*************取到userId***************/
	int userId=-1;
	try{
		userId=Integer.parseInt(session.getAttribute("userId").toString());
 	}
	catch(Exception e){
		out.print("window.location.href=document.referrer;</script>");
		System.out.print(e.toString()+"myLike.jsp-36");
	}
	/*************取到userId***************/
	
/* 	String username="admin"; */
	PreparedStatement pre=null;
	ResultSet rs=null;
	try{
		pre=db.prepareStatement("select * from picture where pictureId in"+
				"(select pictureId from collector where userId =?)");
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
		}
		//System.out.print(i);
	}catch(SQLException e){
		System.out.print(e.toString()+"myLike.jsp-60");
	}
%>
<div class="water">
	<div class="tp"><p>我的收藏</p></div>
	<div class="cent">
		<!-- //中件这段固定格式 -->
		<div id="container">
				<%
					int cnt=0;
					while(cnt<ps.size()){
						out.print("<div class=\"cell\"><div class=\"every\"><a href=collectorDetail.jsp?pictureId="+ps.get(cnt).getPictureId()+"><img  width=\"200px\" src="+ps.get(cnt).getPicturePath()+" /><p>"+ps.get(cnt).getPictureTitle()+"</p></a></div></div>");
						cnt++;
					}
				%>
		</div>
	</div>
</div>
<jsp:include page="./childer/water.jsp"></jsp:include>	
</body>
</html>