<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建订单</title>
<link rel="stylesheet" type="text/css" href="../css/Tobeedited.css"></link>
<link rel="stylesheet" type="text/css" href="../css/topFile.css"></link>
<link rel="stylesheet" type="text/css" href="../css/createOrder.css"></link>
<style>

}
</style>
</head>
<body class="body">
<jsp:include page="./childer/SessionIsOk.jsp"></jsp:include>
<jsp:include page="./childer/all.jsp"></jsp:include>

<form name="myform" action="CreateOrderServlet" method="post" onsubmit="return f()">
	<div class="Main">
		<div class="Titles"><a>标题:</a><input type="text" name="title" id="title">
		</div>
			<div id="img_upload">
			</div>
		<div class="Content">
			<a>图片要求:&nbsp;&nbsp;</a>
			<textarea rows="3" cols="40" name="content" id="content"></textarea>
		</div>
		<br class="clear">
		<div class="foot">
			<a>截止日期:</a><input type="text" name="time" placeholder="默认格式   XXXX-XX-XX" id="time">
		</div>
		<div class="foots">
			<a>价格:</a><input type="text" class="piece" name="piece" id="piece"><a>元</a><div class="none"></div>
		</div>
		<!-- <br class="clear"> -->
		<div class="inpu"><input type="submit" value="提交" onclick="" /> </div>
	</div>
</form>
<script src="../js/Testing.js"></script>
<script src="../js/createOrder.js"></script>
</body>
</html>