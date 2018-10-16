<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/water.css"></link> 
</head>
<body>
<script src="../jQuery/jquery-3.3.1.min.js"></script>
<script src="../js/waterFall.js"></script>
<script>
//实现流布局
 var opt={
  getResource:function(index,render){//index为已加载次数,render为渲染接口函数,接受一个dom集合或jquery对象作为参数。通过ajax等异步方法得到的数据可以传入该接口进行渲染，如 render(elem)
	  /* return $(html); */
  },
  auto_imgHeight:true,
  insert_type:1
}
$('#container').waterfall(opt); 
</script>

</body>
</html>