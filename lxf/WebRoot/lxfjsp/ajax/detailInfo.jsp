<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String comp = (String)request.getParameter("company");
String name = (String)request.getAttribute("name");
System.out.println("comp="+comp);
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
	<h3>个人详细信息</h3>
	      <table class="table table-bordered">
	      	<tr><td>${company}</td></tr>
	      	<tr><td>${home}</td></tr>
	      </table>
		
</body>
<script>

</script>
</html>
