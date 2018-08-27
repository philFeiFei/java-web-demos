<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Bootstrap 实例 - 基本的表格</title>
	<link href="../../Font-Awesome-3.2.1/css/font-awesome.css"
            rel="stylesheet" type="text/css" />
	<script src="../../js/echarts/echarts.js"></script>	
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>菜鸟教程(runoob.com)</title>
</head>
 
<style>
body {
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 2.428571;
    color: #333;
    background-color: #fff;
}
	.divc{
	width:1800;
	 height:1000;
	 border:1px solid red;
	 background-position:53% -51%;
	}
	
/*table style start*/
.containerTable td {
	  font-weight: normal;
	  font-size: 1em;
}

.containerTable {
	  text-align: left;
	  overflow: hidden;
	  width: 80%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.containerTable td, .containerTable th {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:2%;  
  color: aqua;
}

/* Background-color of the odd rows */
.containerTable tr:nth-child(odd) {
	  background-color: #323C50;
}

/* Background-color of the even rows */
.containerTable tr:nth-child(even) {
	  background-color: #2C3446;
}

.containerTable th {
	  background-color: #1F2739;
}

.containerTable td:first-child { color: #DEED21; }

.containerTable tr:hover {
   background-color: #464A52;
}

.containerTable td:hover {
  background-color: #FFF842;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}
/*table style end*/
.htitle{
	
  font-size:16px;
}



</style>
<body>
<a href="../../index.jsp"><button type="button" class="btn btn-default">Back to Home Page(相对路径)</button></a>
<div class="divc" >
	<div class="container" style="width:100%">
		<div class="row clearfix">
			<div class="col-md-5 column">
	   			<%@include file="schDashboardSubPages/schDashboardRequirement.jsp" %>
			</div>
			<div class="col-md-7 column">
					<%@include file="schDashboardSubPages/schDashboardStaffing.jsp" %>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-7 column">
					<%@include file="schDashboardSubPages/schDashboardConstraints.jsp" %>
			</div>
			<div class="col-md-5 column">
					<%@include file="schDashboardSubPages/schDashboardTable4rows.jsp" %>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-4 column">
						<%@include file="schDashboardSubPages/schDashboardTable4rows.jsp" %>
					</div>
			<div class="col-md-4 column">
					<%@include file="schDashboardSubPages/schDashboardTable4rows.jsp" %>
			</div>
			<div class="col-md-4 column">
					<%@include file="schDashboardSubPages/schDashboardTable4rows.jsp" %>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-9 column">
					<%@include file="schDashboardSubPages/schDashboardTable3line.jsp" %>
			</div>
			<div class="col-md-3 column">
					<%@include file="schDashboardSubPages/schDashboardTable3line.jsp" %>
			</div>
		</div>
	</div>
</div>
<script>


</script>
</body>
</html>
