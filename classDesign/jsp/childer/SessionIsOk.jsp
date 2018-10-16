

	<%
	/************ 没有用户这个session时返回登陆界面 ***********/
			if(session.getAttribute("username")==null||session.getAttribute("username").equals("")){
				out.print("<script>location.href=\"login.jsp\";</script>");
			}
	
	/************ 没有用户的详细信息时返回main.jsp ***********/
	
			if(session.getAttribute("orderN")!=null
					&&session.getAttribute("picN")!=null
					&&session.getAttribute("fsN")!=null
					&&session.getAttribute("bfsN")!=null
					&&session.getAttribute("colN")!=null
					&&session.getAttribute("sellerN")!=null
					&&session.getAttribute("userId")!=null){
			}else{
				out.print("<script>location.href=\"main.jsp\";</script>");
			}
	%>
