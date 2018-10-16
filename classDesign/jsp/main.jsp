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
<link rel="stylesheet" type="text/css" href="../css/keywordSelect.css"></link>
<title>图汇网</title>
<style>
.cent{
width:60%;
}
</style>
</head>
<body class="body">
<jsp:include page="./childer/all.jsp"></jsp:include>
<jsp:include page="./childer/Select.html"></jsp:include>
<jsp:include page="./childer/keywordSelect.jsp"></jsp:include>
</body>
</html>