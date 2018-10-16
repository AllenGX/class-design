<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<link rel="stylesheet" type="text/css" href="../css/myorder.css"></link>
<link rel="stylesheet" type="text/css" href="../css/selectOrder.css"></link>
<style>

</style>
</head>
<body class="body">
<jsp:include page="./childer/all.jsp"></jsp:include>
	<form action="selectOrder.jsp" method="get" name="form1">
		<div class="select">
			<p>图汇,让你离艺术更近一步</p><br>
			<div class="selects">
				<div><input type="text" name="keyWord"/></div>
				<div><input class="a" type="submit" value="搜索"/></div>
			</div>
		</div>
	</form>
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<div class="water">
			<div class="tp"><p>订单</p></div>
			<div class="type_order"><a onclick="lookAll()">全部</a><a onclick="lookPush()">已付款</a><a onclick="lookNoPush()">未付款</a></div>
<%	/**********分页参数************/
	int maxOrderInPage=9;		//一页放9张
	int nowpage=1;				//记录当前页面
	int maxPage=1;				//总页数
	int cntOrder=0;				//总记录条数
	int maxLineOrder=3;			//一行三张订单
	/***********分页参数***********/
	PreparedStatement pre=null;
	ResultSet rs=null;
	//取到关键字
	String keyWord="";
	if(request.getParameter("keyWord")!=null&&!request.getParameter("keyWord").equals("")){
		keyWord=request.getParameter("keyWord");
		System.out.println("keyWord"+keyWord);
	}
	if(request.getParameter("nowpage")!=null&&!request.getParameter("nowpage").equals("")){
		nowpage=Integer.parseInt(request.getParameter("nowpage"));
	}
	pre=db.prepareStatement("select count(*) as cnt from `order` where (orderTitle like ? or orderContent like ?) and orderStates!=1 ");
	try{
		pre.setString(1, "%"+keyWord+"%");
		pre.setString(2,  "%"+keyWord+"%");
		rs=pre.executeQuery();
		if(rs.next()){
			cntOrder=rs.getInt("cnt");
		}
		pre.close();
		rs.close();
	}catch(SQLException e){
		System.out.println(e.toString()+"");
	}
	
	if(cntOrder%maxOrderInPage==0){
		maxPage=cntOrder/maxOrderInPage;
	}else{
		maxPage=cntOrder/maxOrderInPage+1;
	}
	
	if(nowpage>maxPage){
		nowpage=maxPage;
	}
	if(nowpage<1)nowpage=1;
	if(cntOrder!=0){
		pre=db.prepareStatement("select * from (`order` od INNER JOIN user u on od.buyerId=u.userId) where (od.orderTitle like ? or od.orderContent like ?) and od.orderStates!=1");
		pre.setString(1, "%"+keyWord+"%");
		pre.setString(2, "%"+keyWord+"%");
		try{
			rs=pre.executeQuery();
			if(rs.next()){
				System.out.println("第几条记录"+(nowpage-1)*maxOrderInPage);
				System.out.println("总记录"+cntOrder);
				rs.absolute((nowpage-1)*maxOrderInPage);		//定位到上一个页面最后一条记录
				int i=0;
				while(rs.next()&&i<maxOrderInPage){
					if(i%maxLineOrder==0)/***********输出div行开头***********/
					{
						out.print("<div class=\"orderBox\">");
					}
					/********输出一个box**********/
						out.print("<div class=\"order\" onclick=\"javascript:location.href='MyOrderServlet?orderId="+rs.getInt("orderId")+"'\">");
							out.print("<div class=\"title\">");
								out.print("<a>标题:"+rs.getString("orderTitle")+"</a>");
							out.print("</div>");
							out.print("<div class=\"content\">");
								out.print("<P>介绍:<br>"+rs.getString("orderContent")+"</P>");
							out.print("</div>");
							out.print("<div class=\"foot\">");
								out.print("<a>发起人:"+rs.getString("u.username")+"</a>");
								out.print("<a>金额:"+rs.getDouble("piece")+"元</a>");
							out.print("</div>");
							out.print("<a class=\"time\">截止日期:<i>"+rs.getString("orderTime")+"</i></a>");
						out.print("</div>");
					/********输出一个box**********/
					i++;
					if((i%maxLineOrder==0)||(i+(nowpage-1)*maxOrderInPage)==cntOrder)/***********输出div结束开头***********/
					{
						System.out.println("第"+i+"个");
						out.print("<br class=\"\"/>");
						out.print("</div>");
					}
				}
			}
		}catch(SQLException e){
			System.out.print(e.toString()+"");
		}
		pre.close();
		rs.close();
	}
%>
			<!-- 	<div class="orderBox" >
					<div class="order" onclick="javascript:location.href='detailtakeOrder.jsp?orderId=2'">
						<div class="title">
							<a>标题</a>
						</div>
						<div class="content">
							<P></P>
						</div>
						<div class="foot">
							<a>发起人:嘎嘎嘎</a>
							<a>金额:</a>
						</div>
						<a class="time">截止日期:<i></i></a>
					</div>
				</div> -->
		<div class="jump">
			<form name="form" method="get" action="selectOrder.jsp">
 <%
	if(maxPage>1){
		out.print("<a href=selectOrder.jsp?nowpage="+1+">首页</a>");
		out.print("<a href=selectOrder.jsp?nowpage="+(nowpage-1)+">上一页</a>");
		out.print("<a href=selectOrder.jsp?nowpage="+(nowpage+1)+">下一页</a>");
		out.print("<a href=selectOrder.jsp?nowpage="+maxPage+">尾页("+maxPage+")</a>");
		out.print("<input type=text name='nowpage'>");
		out.print("<input type=submit class=\"sub\" value=跳转>");
	}
%>
			</form>
		</div>
	</div>
</body>

</html>