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
</head>

<body>
	<a href="<%=basePath%>index.jsp"><button type="button"
			class="btn btn-default">Back to Home Page（固定request获取地址）</button></a>
			<br><button type="button" onclick="myFunc0()">从txt请求数据</button>
			<br><button type="button" class="btn btn-default" onclick="myFunc1()">从jsp请求数据</button>
<div id="myDiv"></div>
</body>
<script>

//分离出ajax请求公共部分
var xmlhttp;
function xmlHpptRequestPub(url){
	if (window.XMLHttpRequest)
	  {
	    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
	    xmlhttp=new XMLHttpRequest();
	  }
	  else
	  {
	    // IE6, IE5 浏览器执行代码
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }

	  xmlhttp.open("GET",url,true);
	  xmlhttp.send(null);
}

function myFunc0(){
	var url="test.txt";
	xmlHpptRequestPub(url)
	 xmlhttp.onreadystatechange=function()
	  {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	      document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	  }
}

function myFunc1(){
	var url="request.jsp?name=张总&age="+18;
	xmlHpptRequestPub(url)
	 xmlhttp.onreadystatechange=function()
	  {
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	      document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	  }
}

</script>
</html>
