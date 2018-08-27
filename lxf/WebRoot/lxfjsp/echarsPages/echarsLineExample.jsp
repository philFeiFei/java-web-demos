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
	        text: 'Issues解决率趋势分析',
	        subtext: '纯属虚构'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['最高气温','最低气温']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {},
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: ['6/1','6/4','6/7','6/10','6/13','6/16','6/19','6/21','6/24','6/27','6/30','7/2','7/5','7/8','7/11']
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        }
	    },
	    series: [
	        {
	            name:'月度解决率',
	            type:'line',
	            data:[92, 96, 99, 91, 96, 103, 100,92, 96, 99, 91, 96, 103, 100,115],
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'累计解决率',
	            type:'line',
	            data:[81, 90, 96, 81, 86, 93, 90,81, 90, 96, 81, 86, 93, 90,100],
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};
	myChart.setOption(option);
}

</script>

</html>