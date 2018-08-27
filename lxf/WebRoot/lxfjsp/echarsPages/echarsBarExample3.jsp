<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="utf-8">
<title>Jqplot控件测试学习</title>

   <script type="text/javascript"
            src="js/echarts/echarts.js"></script>
      
<body>

<input type="button" value="演示char1" onclick="getChart1()">
<input type="button" value="演示char2" onclick="getChart2()">
	<div id="chart1"
		style="width: 1800px;height:600px;">
	</div>
	<div style="clear:both"></div>
	
	<div id="chart2"
		style="width: 1200px;height:400px; ">
	</div>
</body>
<script type="text/javascript">
function getChart1(){
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('chart1'));
option = {
	    title: {
	        text: '2016年12月长宁区合规成本分析'
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: { // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data: ['包租费', '装修费', '保洁费', '物业费'],
	        align: 'right',
	        right: 10
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: [{
	        type: 'category',
	        data: ['新虹桥', '中山公园', '虹桥', '镇宁路', '天山古北']
	    }],
	    yAxis: [{
	        type: 'value',
	        name: '总价(万元)',
	        axisLabel: {
	            formatter: '{value}'
	        }
	    }],
	    series: [{
	        name: '包租费',
	        type: 'bar',
	        data: [20, 12, 31, 34, 31]
	    }, {
	        name: '装修费',
	        type: 'bar',
	        data: [10, 20, 5, 9, 3]
	    }, {
	        name: '保洁费',
	        type: 'bar',
	        data: [1, 1, 2, 3, 1]
	    }, {
	        name: '物业费',
	        type: 'bar',
	        data: [0.1, 2, 3, 1, 0.5]
	    }]
	};	
	myChart.setOption(option);
}

</script>

</html>