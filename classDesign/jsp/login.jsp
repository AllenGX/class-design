<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图汇网</title>

</head>

<body class="body">
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Select.html"></jsp:include>

	<!-- 分类栏 -->
	<div class="fenlei">
		<div class="fen">
			<div class="lei1"><span></span><a href="main.jsp?keyword=ACG">CG场景图</a></div>
			<div class="lei2"><span></span><a href="main.jsp?keyword=动漫,角色">动漫角色</a></div>
			<div class="lei3"><span></span><a href="main.jsp?keyword=东方,project">东方project</a></div>
			<div class="lei4"><span></span><a href="main.jsp?keyword=漫画,人物">漫画人物</a></div>
		</div>
	</div>
	<br class="clear">
</body>
</html>