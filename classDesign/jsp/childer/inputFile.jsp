<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="SessionIsOk.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/all.css"></link>
<link rel="stylesheet" type="text/css" href="../css/login.css"></link>
<link rel="stylesheet" type="text/css" href="../css/inputFile.css"></link>
</head>
<body>
<!-- 登陆界面 -->
	<center id="FIle">
		<div class="dialog-overlay">
		<div class="contt">
		<div class="XX"><a href="#" onclick="f5()">x</a></div>
		<div class="top"> 上传图片  </div>
		<div class="files">
			<!-- <input type="file" style="opacity: 0"/> -->
			<input type="file"  id="FILE" style="opacity: 0" name="file" onchange="preview(this)"/>
			<span>上传图片</span></div>
		</div>
		</div>
	</center>
</body>
<script src="../js/file.js"></script>

</html>