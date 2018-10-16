<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片上传</title>
<link rel="stylesheet" type="text/css" href="../css/Tobeedited.css"></link>
<link rel="stylesheet" type="text/css" href="../css/topFile.css"></link>
<style type="text/css">

</style>
</head>
<body class="body">
<jsp:include page="./childer/all.jsp"></jsp:include>
<form class="" action="SavePictureServlet" method="post" enctype="multipart/form-data" onsubmit="return fs()">
<jsp:include page="./childer/inputFiles.jsp"></jsp:include>
	<div class="Main">
		<div class="Titles"><a>标题:</a><input type="text" name="title" id="title" >
		</div>
			<div id="img_upload">
			</div>
		<div class="file" >	
			<div class="inner">
				<a onclick="fileInto()" id="file">
					<img src="../image/+.png" />
					<br>
					<span>添加图片</span>
				</a>
			</div>
		</div>
		<div class="Content">
			<a>介绍:&nbsp;&nbsp;</a>
			<textarea rows="3" cols="40" name="content" id="content"></textarea>
		</div>
		<br class="clear">
		<div class="inpu"><input type="submit" value="提交"/> </div>
	</div>
</form>
<script src="../js/lookAll.js"></script>
<script src="../js/topFiles.js"></script>
</body>
</html>