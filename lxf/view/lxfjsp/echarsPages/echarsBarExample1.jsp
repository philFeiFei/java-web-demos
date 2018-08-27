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

<input type="button" value="演示char2" onclick="getChart2()">
	<div style="clear:both"></div>
	
	<div id="chart2"
		style="width: 800px;height:300px; ">
	</div>
</body>
<script type="text/javascript">
getChart2();
function getChart2(){
	var myChart = echarts.init(document.getElementById('chart2'));
	var nameValue = ['Over Scheduled', 'Under Scheduled', 'Demand Of 1 Not Met', 'Demand Short >= 50%', 
         	    'Number Of Fixed Shifts Before Schedule', 'Number Of Fixed Shifts After Schedule', 'Number Of Edited Shifts',
        	    'Licenses Or Certification Not On Duty']
	var hoursValue = ['56.25','','120','110.5','','','230',''];
	var countValue = ['221','332','88','','','412','300','144'];

	option = {
			  title: {
			        text: '',
			        subtext: ''
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'shadow'
			        }
			    },
			    color:['#FFCD42','#6C9AB6'],
			    legend: {
			        data: ['Hours', 'Count'],
			        x:'right'
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        top: '8%',
			        "bottom":"1",
			        containLabel: true
			    },
			    xAxis: {
			    	splitLine:{
			    	       show : false,
			    	     },
			        type: 'value',
			        boundaryGap: [0, 0.01],
			        textStyle:{
			        	fontSize:6
			        }
			    },
			    yAxis: {
			    	splitLine:{
			    	       show : true,
			    	     },
			        type: 'category',
			        inverse:true,
			        data: nameValue,
			    	     axisLabel:{
					        	fontSize:10
					        }
			    },
			    series: [
			        {
			            name: 'Hours',
			            type: 'bar',
			            data: hoursValue
			        },
			        {
			            name: 'Count',
			            type: 'bar',
			            data: countValue
			        },
			       
			    ]
          };
	
	myChart.setOption(option);
}

</script>

</html>