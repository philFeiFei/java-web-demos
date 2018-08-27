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
		style="width: 428px;height:300px; border:1px solid red">
	</div>
</body>
<script type="text/javascript">
getChart2();
function getChart2(){
	var myChart = echarts.init(document.getElementById('chart2'));
	var nameValue = ['Over Scheduled', 'Under Scheduled', 'Demand Of 1 Not Met', 'Demand Short >= 50%', 
         	    'Number Of Fixed Shifts Before Schedule', 'Number Of Fixed Shifts After Schedule', 'Number Of Edited Shifts',
        	    'Licenses Or Certification Not On Duty']
	var hoursValue = ['221','332'];

	 var option ={
             title: {
                 text: 'forecast effective summary',
                 textStyle: {
                     color: '#85523E',
                     fontSize: 16
                 },
                 left:'10%',
             },
             grid: {
                 left:'-20%',
                 top: '15%',
                 bottom:'1',
                 containLabel: true
             },
             xAxis: {
            	 show:true,
                 type: 'category',
                 boundaryGap: [0, 0.5],
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
                  nameTextStyle:{
   		            fontWeight:'bold'
   		        },
                 data: [
                        {
 		            value: 'Part Time AHR',
 		            textStyle: {
 		                fontSize: 12,
 		                fontFamily:"Montserrat",
 		                color:'#93EA69',
 		            }
 		        },
 		        {value: 'Full Time AHR',
 		            textStyle: {
 		                fontSize: 12,
 		                fontFamily:"Montserrat",
 		               color:'#FFA8A9',
 		            }
 		        },
                        
                        
                        ],
             },
             yAxis: {
            	 show:'false',
            	 axisLine:{
 		            show:false
 		        },
 		       axisTick:{
 		            show:false
 		        },
                
 		       splitLine:{
 		          show : false,
 		        },
  		       
 		       axisLabel:{
 		    	   show:false,
 		       }
                
               
             },
             series: [
                 {
                     name: 'Hours',
                     type: 'bar',
                     data: hoursValue,
                     barWidth:'14%',
                     itemStyle:{
                    	 normal: {
     	                    show: true,
     	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
     	                        offset: 0,
     	                        color: '#00FFE6'
     	                    }, {
     	                        offset: 1,
     	                        color: '#007CC6'
     	                    }]),
     	                    barBorderRadius: 50,
     	                    borderWidth: 0,
     	                    borderColor: '#333',
     	                  
     	                }
 			            },
 			           label: {
 			                normal: {
 			                    show: true,
 			                    position: 'top' ,
 			                    textStyle:{
 			                        color:'#131313',fontSize:"12",fontFamily:"Montserrat"
 			                    }
 			                    }
 			                },
                 },
                
             ]
       };
	myChart.setOption(option);
}

</script>

</html>