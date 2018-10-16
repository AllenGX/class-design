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
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="../css/myorder.css"></link>
</head>
<body class="body">	
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Mylocation.jsp"></jsp:include>	
<%
	/*************取到userId***************/
	List<Order> ods=new ArrayList<Order>();
	int userId=18;
	String username="无";
	try{
		username=session.getAttribute("username").toString();
		userId=Integer.parseInt(session.getAttribute("userId").toString());
 	}
	catch(Exception e){
		out.print("window.location.href=document.referrer;</script>");
		System.out.print(e.toString()+"myorder.jsp-36");
	}
	/*************取到userId***************/
	int i=0;	//总人物
	int m=0;	//已完成任务
	int state=0;	//人物状态
	String orderStates="未付款";
	PreparedStatement pre=null;
	ResultSet rs=null;
	List<String> sellernames=new ArrayList<String>();		//存储买家姓名
	try{
		pre=db.prepareStatement("select * from (design.`order` od INNER JOIN user u on od.sellerId=u.userId) where od.buyerId=?");
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
	 		sellernames.add(i, rs.getString("u.username"));
	 		/* System.out.println(sellernames.get(i)); */
			i++;
		}
	}catch(SQLException e){
		System.out.print(e.toString()+"myorder.jsp-74");
	}
%>	
	<div class="water">
		<div class="tp"><p>我的订单</p></div>
		<div class="type_order"><a onclick="lookAll()">全部(<%=i %>)</a><a onclick="lookPush()">已付款(<%=m %>)</a><a onclick="lookNoPush()">未付款(<%=(i-m) %>)</a></div>
		<%
			int cnt=0;
			while(cnt<ods.size()){
				if(ods.get(cnt).getOrderStates()==1)orderStates="已付款";
				else orderStates="未付款";
				out.print(""+
					"<div class=\"number number"+ods.get(cnt).getOrderStates()+"\">"+
						"<a href=\"myorderDetail.jsp?orderId="+ods.get(cnt).getOrderId()+"\"><img src=\""+ods.get(cnt).getPicturePath()+"\"></a>"+
						"<div class=\"information\">"+
							"<div class=\"Titles\"><a>"+ods.get(cnt).getOrderTitle()+"</a></div>"+
							"<div class=\"Content\"><a>"+ods.get(cnt).getOrderContent()+"</a></div>"+
							"<div class=\"ACTIVE\">"+
								"<a>价格:"+ods.get(cnt).getPiece()+"元</a>"+
								"<a>收款人:"+sellernames.get(cnt)+"</a>"+
								"<a>截止日期:"+ods.get(cnt).getOrderTime()+"</a>"+
								"<a>订单号:"+ods.get(cnt).getOrderId()+"</a>"+
								"<a>付款人:"+username+"</a>"+
								"<a>订单状态:"+orderStates+"</a>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"");
				cnt++;
			}
		%>
		<div class="bottom"><a class="topfile" href="createOrder.jsp">创建订单</a></div>
	</div>
<script src="../js/lookAll.js"></script>
</body>
</html>