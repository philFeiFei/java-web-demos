<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String name = (String)request.getParameter("name");
String age = (String)request.getParameter("age");
	System.out.println(name);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Ajax Test Page</title>

<link rel="stylesheet"
	href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"
	type="text/css" />
</head>

<body>
	<h3>${param.name},你好,得知您今年<%=age %>高龄，您辛苦了</h3>
	<h4>------PS---------------</h4>
	<p>因为ajax请求过来，是parameter形式过来的，不是attribute，所以前台获取两种方式：</p>
	<p>1.request.getParameter("name");  2、el表达式 ${param.name },这里不能直接写{name}，因为name不在默认所取的
	      四中范围内（Page、Request、Session、Application）</p>
	      <table class="table table-striped">
	      	<thead><tr><th>属性范围（jstl名称）</th><th>EL中的名称</th></tr></thead>
	      	<tbody>
	      	<tr><td>Page</td><td>PageScope</td></tr>
	      	<tr><td>Request</td><td>RequestScope</td></tr>
	      	<tr><td>Session</td><td>SessionScope</td></tr>
	      	<tr><td>Application</td><td>ApplicationScope</td></tr></tbody>
	      </table>
		
</body>
<script>

</script>
</html>
