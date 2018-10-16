<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<link rel="stylesheet" type="text/css" href="../css/keywordSelect.css"></link>
<style type="text/css">
</style>

</head>
<body class="body">	
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Mylocation.jsp"></jsp:include>		
	
	<div class="water">
		<div class="tp"><p>更多推荐</p></div>
		<jsp:include page="./childer/keywordSelect.jsp"></jsp:include>
	</div>
</body>
</html>