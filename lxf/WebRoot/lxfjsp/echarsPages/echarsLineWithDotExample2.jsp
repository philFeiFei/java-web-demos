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
             <script type="text/javascript"
            src="js/echarts/ecStat.min.js"></script>
      
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
//ecStat 是 ECharts 的统计扩展，需要额外添加扩展脚本，参加上方“脚本”
//详情请移步 https://github.com/ecomfe/echarts-stat
//图中的曲线是通过指数回归拟合出的

var data = [
  [1, 4862.4],
  [2, 5294.7],
  [3, 5934.5],
  [4, 7171.0],
  [5, 8964.4],
  [6, 10202.2],
  [7, 11962.5],
  [8, 14928.3],
  [9, 16909.2],
  [10, 18547.9],
  [11, 21617.8],
  [12, 26638.1],
  [13, 34634.4],
  [14, 46759.4],
  [15, 58478.1],
  [16, 67884.6],
  [17, 74462.6],
  [18, 79395.7]
];

var myRegression = ecStat.regression('exponential', data);

myRegression.points.sort(function(a, b) {
  return a[0] - b[0];
});

option={
title: {
  text: '1981 - 1998 gross domestic product GDP (trillion yuan)',
  left: 'center',
  top: 21
},
tooltip: {
  trigger: 'axis',
  axisPointer: {
      type: 'cross'
  }
},
xAxis: {
  type: 'value',
  splitLine: {
      lineStyle: {
          type: 'dashed'
      }
  },
  splitNumber: 20
},
yAxis: {
  type: 'value',
  splitLine: {
      lineStyle: {
          type: 'dashed'
      }
  }
},
series: [{
  name: 'scatter',
  type: 'scatter',
  label: {
      emphasis: {
          show: true
      }
  },
  data: data
}, {
  name: 'line',
  type: 'line',
  showSymbol: false,
  smooth: true,
  data: myRegression.points,
  markPoint: {
      itemStyle: {
          normal: {
              color: 'transparent'
          }
      },
      label: {
          normal: {
              show: true,
              position: 'left',
              formatter: myRegression.expression,
              textStyle: {
                  color: '#333',
                  fontSize: 14
              }
          }
      },
      data: [{
          coord: myRegression.points[myRegression.points.length - 1]
      }]
  }
}]
};
	myChart.setOption(option);
}

</script>

</html>