<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>
<%@page import="com.Design.Bean.Order" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/myorder.css"></link>

<title>接单</title>
<style type="text/css">
.takeorder{
height:80px;
}

.type_order a{
    cursor: pointer;
}
</style>
</head>
<body class="body">	
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Mylocation.jsp"></jsp:include>	

<%
	/*************取到userId***************/
	List<Order> ods=new ArrayList<Order>();
	int userId=-1;
	try{
		userId=Integer.parseInt(session.getAttribute("userId").toString());
 	}
	catch(Exception e){
		out.print("window.location.href=document.referrer;</script>");
		System.out.print(e.toString()+"takeorder.jsp-36");
	}
	/*************取到userId***************/
	

	int i=0;	//总人物
	int m=0;	//已完成任务
	int state=0;	//人物状态
	String orderStates="未完成";
	PreparedStatement pre=null;
	ResultSet rs=null;
	List<String> buyernames=new ArrayList<String>();		//存储卖家姓名
	try{
		pre=db.prepareStatement("select * from (design.`order` od INNER JOIN "+
								"user u on od.buyerId=u.userId) where od.sellerId=?");
		pre.setInt(1, userId);
		rs=pre.executeQuery();
		Order p=null;
		while(rs.next()){
			/* int orderId, String picturePath, String orderTime,
			String orderTitle, String orderContent, int sellerId, int buyerId,
			double piece, int orderStates */
			state=rs.getInt("orderStates");
			if(state==1)m++;
	 				p=new  Order(
					rs.getInt("orderId"),
					rs.getString("picturePath"),
					rs.getString("orderTime"),
					rs.getString("orderTitle"),
					rs.getString("orderContent"),
					rs.getInt("sellerId"),
					rs.getInt("buyerId"),
					rs.getDouble("piece"),
					state
					);
	 		ods.add(p); 
	 		buyernames.add(i, rs.getString("u.username"));	
			i++;
		}
	}catch(SQLException e){
		System.out.print(e.toString()+"takeorder.jsp-76");
	}
%>	
	<div class="water">
		<div class="tp"><p>我的任务</p></div>
		<div class="type_order"><a onclick="lookAll()">全部(<%=i %>)</a><a onclick="lookPush()">已完成(<%=m %>)</a><a onclick="lookNoPush()">未完成(<%=(i-m) %>)</a></div>
		<%
			int cnt=0;
			while(cnt<ods.size()){
				if(ods.get(cnt).getOrderStates()==1)orderStates="已完成";
				else orderStates="未完成";
				out.print(""+
					"<div class=\"number number"+ods.get(cnt).getOrderStates()+"\">"+
						"<a href=\"detailtakeOrder.jsp?orderId="+ods.get(cnt).getOrderId()+"\"><img src=\""+ods.get(cnt).getPicturePath()+"\"></a>"+
						"<div class=\"information\">"+
							"<div class=\"Titles\"><a>"+ods.get(cnt).getOrderTitle()+"</a></div>"+
							"<div class=\"Content\"><a>"+ods.get(cnt).getOrderContent()+"</a></div>"+
							"<div class=\"ACTIVE\">"+
								"<a>价格:"+ods.get(cnt).getPiece()+"元</a>"+
								"<a>付款人:"+buyernames.get(cnt)+"</a>"+
								"<a>截止日期:"+ods.get(cnt).getOrderTime()+"</a>"+
								"<a>订单号:"+ods.get(cnt).getOrderId()+"</a>"+
								"<a>订单状态:"+orderStates+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"");
				cnt++;
			}
		
		%>
		<div class="bottom"><a class="topfile" href="selectOrder.jsp">接单</a></div>
	</div>
<script src="../js/lookAll.js"></script>
</body>
</html>