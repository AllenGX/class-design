<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:useBean id="db" class="com.Design.Bean.DB" scope="page"></jsp:useBean>
<jsp:useBean id="S" class="com.Design.Untils.StringOperation" scope="page"></jsp:useBean>
<%@page import="java.sql.*" %>
<%@page import="com.Design.Bean.Picture" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div class="cent" id="cent">
<div id="container">
<%
ResultSet rs=null;
PreparedStatement pre=null;

/**********关键字的筛选和拼接*********/
	List<Picture> ps=new ArrayList<Picture>();
	String keyword="";
	if(request.getParameter("keyword")!=null){
		keyword=new String(request.getParameter("keyword").getBytes("iso-8859-1"),"utf-8");
	}
	ArrayList<String> keywords=S.stringToArrayList1(keyword, ",");
	String sql="";
	if(keywords.size()!=0){
		for(int i=0;i<keywords.size();i++){
			sql+="pictureContent like ? or pictureTitle like ? ";
			if(i<keywords.size()-1){
				sql+=" or ";
			}
		}
	}else{
		sql+=" 1=1";
	}
	
/**********拼接完毕*********/

/**********SQL语句执行并输出结果*********/

	//System.out.println(sql);
	int temp=1;
	int cnt=0;
	int i=0;
	try{
		pre=db.prepareStatement("select count(*) as cnt from picture where "+sql);
		for(String s:keywords){
			pre.setString(temp, "%"+s+"%");
			temp++;
			pre.setString(temp, "%"+s+"%");
			temp++;
		}
		rs=pre.executeQuery();
		if(rs.next()){
			cnt=rs.getInt("cnt");
		}
	temp=1;	
		pre=db.prepareStatement("select * from picture where "+sql);
		for(String s:keywords){
			pre.setString(temp, "%"+s+"%");
			temp++;
			pre.setString(temp, "%"+s+"%");
			temp++;
		}
		rs=pre.executeQuery();
		while(rs.next()){
			Picture p=new Picture(
					rs.getInt("pictureId"),
					rs.getString("picturePath"),
					rs.getString("pictureTime"),
					rs.getString("pictureTitle"),
					rs.getString("pictureContent"),
					rs.getString("keyWord"),
					rs.getInt("userId"));
			ps.add(p);
		}
		while(i<10&&i<cnt){
			out.print("<div class=\"cell\"><div class=\"every\"><a href=pictureDetail.jsp?pictureId="+ps.get(i).getPictureId()+"><img  width=\"200px\" src="+ps.get(i).getPicturePath()+" /><p>"+ps.get(i).getPictureTitle()+"</p></a></div></div>");
			i++;
		}
	}catch(SQLException e){
		System.out.print(e.toString()+"error-main.jsp-82");
		
	}
/**********执行完毕*********/	
%>

</div>
</div>
<script src="../jQuery/jquery-3.3.1.min.js"></script>
<script src="../js/waterFall.js"></script>

<script>
	var pictureId = new Array();  
	var picturePath = new Array();
	var title = new Array();
	<%   for(int j=0;j <ps.size();j++){   %>    
			pictureId[<%=j%>] = "<%=ps.get(j).getPictureId()%>";  
			picturePath[<%=j%>] = "<%=ps.get(j).getPicturePath()%>";  
			title[<%=j%>] = "<%=ps.get(j).getPictureTitle()%>";
	<%   }   %>     


var opt={
  getResource:function(index,render){
	  var cnt=<%=cnt%>;
	  var html="";
	  var count=11;
	  for(var j=0;j<cnt;j++){
		  if(count>=cnt)count%=cnt;
		 //console.log(count);
		 html+="<div class=cell><div class=every><a href=pictureDetail.jsp?pictureId="+pictureId[count]+"><img src="+picturePath[count]+" width=200px/><p>"+title[count]+"</p></a></div></div>";
		 count++;
	  }return $(html);},auto_imgHeight:true,insert_type:1}
$('#container').waterfall(opt);
</script>
</html>