<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Ajax Test Page</title>

<link rel="stylesheet"
	href="http://localhost:8081/lxf/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	type="text/css" />
 <script type="text/javascript"
            src="<%=basePath%>js/jquery-3.2.1.js"></script>
</head>

<body>
	<a href="<%=basePath%>index.jsp"><button type="button"
			class="btn btn-default">Back to Home Page（固定request获取地址）</button></a>
			<input id="name" type="text" onblur="getDetailInfo()">
<div id="myDiv" style="width:50%"></div>
</body>
<script>
//Jquery ajax 请求
function getDetailInfo(){
	var name = document.getElementById("name").value;
	//var url="/lxf/servlet/GetDetailInfo?name="+name;
	var url="/lxf/servlet/GetDetailInfo";
	$("#myDiv").load(url,{name:name},callBack());
}
function callBack(){
	//alert("成功加载！！");
}


</script>
</html>
