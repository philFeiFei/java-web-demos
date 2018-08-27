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
	    title : {
	        text: 'Baidu index',
	        subtext: ''
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['Pantene','Rejoice','Ziyuan','Clear','Loreal']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:'Pantene',
	            type:'line',
	            smooth:true,
	            data:[67,63,60,65,62,60,73,78,77,68,68,69]
	        },
	        {
	            name:'Rejoice',
	            type:'line',
	            smooth:true,
	            data:[51,49,50,50,53,53,53,54,60,50,52,52 ]
	        },
	        {
	            name:'Ziyuan',
	            type:'line',
	            smooth:true,
	            data:[52,59,71,76,91,97,99,94,83,73,89,85]
	        },
	        {
	            name:'Clear',
	            type:'line',
	            smooth:true,
	            data:[47,48,49,71,102,73,69,54,51,51,55,54]
	        },
	        {
	            name:'Loreal',
	            type:'line',
	            smooth:true,
	            data:[364,361,365,342,339,353,312,284,319,395,296,319]
	        }
	    ]
	};
	myChart.setOption(option);
}

</script>

</html>