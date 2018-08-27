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
            src="js/echarts-3.8.0.js"></script>
      
<body>

<input type="button" value="演示char2" onclick="getChart2()">
	<div style="clear:both"></div>
	
	<div id="con_approvestarttaskMenu_3"
		style="width: 756px;height:280px; border:1px solid red;margin-left: 6%;">
	</div>
</body>
<script type="text/javascript">
getChart2();
function getChart2(){
	var nameValue = ['Over Scheduled', 'Under Scheduled', 'Demand Of 1 Not Met', 'Demand Short >= 50%', 
         	    'Number Of Fixed Shifts Before Schedule', 'Number Of Fixed Shifts After Schedule', 'Number Of Edited Shifts',
        	    'Licenses Or Certification Not On Duty']
     var hoursValue = ['333','234','432','20','234','432','100','234'];
     var obj=new Array()
     for (var i = 0, l = nameValue.length; i < l; i++) {
         obj[i] = {value: nameValue[i],textStyle:{fontSize: 14,fontFamily:"Montserrat",fontWeight:'400'}}
     }
   
      var myChart = echarts.init(document.getElementById('con_approvestarttaskMenu_3')); 
      var option ={
              title: {
                  text: '',
                  subtext: ''
              },
              textStyle: {
                  fontFamily: 'Montserrat',
                  fontSize: '18px'
                  
              },
              tooltip: {
                  trigger: 'axis',
                 axisPointer: {
                     type: 'shadow'
                 },
                 textStyle:{fontSize:"12",fontFamily:"Montserrat"},
              },
              color:['#6C9AB6'],
              legend: {
                  data: ['Hours'],
                  x:'right',
                 textStyle:{fontSize:"12",fontFamily:"Montserrat"}
              },
              grid: {
             	 left: '6%',
                  top: '6%',
                  bottom:'1%',
                  containLabel: true
              },
              xAxis: {
                  show:false,
                  type: 'value',
                  boundaryGap: [0, 0.01]
              },
              yAxis: {
                  type: 'category',
                  data: obj,
                  inverse:true,
                  axisLine:{
                     show:false
                 },
                 axisTick:{
                     show:false
                 },
                  axisLabel:{
                      interval:0 ,
                      clickable:true
                  },
                
              },
              series: [
                  {
                      name: 'Hours',
                      type: 'bar',
                      data: hoursValue,
                      itemStyle:{
                         normal:{
                             color:'#638ca6'
                             }
                         },
                        label: {
                             normal: {
                                 show: true,
                                 position: 'right' ,
                                 textStyle:{
                                     color:'#131313',fontSize:"14",fontFamily:"Montserrat"
                                 }
                                 }
                             }
                  },
              ]
        };
      myChart.setOption(option); 
}

</script>

</html>