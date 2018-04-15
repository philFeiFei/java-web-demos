<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String text = (String)request.getParameter("text");
int aaa = (int)request.getAttribute("aaa");//后台设置setAtrribute,前台当然要用getAttribute了。sb。。像上一行一样，通过getParameter方式能获取吗？
String bbb = (String)request.getAttribute("bbb");
String ses = (String)session.getAttribute("bbb");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <base href="<%=basePath%>">
    
    <title>欢迎登陆进来${RequestScope.bbb}</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <h2>------------------request方式等直接获取-------------</h2>
     <h4>request方式直接获取前台传至后台的text=：<%=text %></h2>
     <h4>request方式直接获取后台加入的属性aaa=：<%=aaa %></h2>
     <h4>request方式直接获取后台加入的属性bbb=：<%=bbb %></h2>
     <h4>session方式直接获取后台加入的属性bbb=：<%=ses %></h2>
     
     <h2>----------------El表达式获取值---------------------</h2>
     <h4>El表达式  从request中获取bbb=：${requestScope.bbb}</h2>
     <h4>El表达式 从session中获取bbb=：${sessionScope.bbb}</h2>
  </body>
</html>
