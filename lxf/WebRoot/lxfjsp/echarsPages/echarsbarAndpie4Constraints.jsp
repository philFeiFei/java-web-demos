<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
<base href="<%=basePath%>"></base>
<meta charset="utf-8">
<title>Echarts Pie</title>
 <script type="text/javascript"
            src="js/echarts-3.8.0.js"></script>
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />               
            <style>
 .ctitlediv {
    text-align: center;
    color: #DEED21;
    font-style: italic;
    margin-top: 20px;
    margin-bottom: -20px;
}
 </style>
      </head>
<body>
<div style="width:773px; border:1px solid red">
	<div id="staffManagementContainer4" style="height:70px;margin-left: -10%;">
                    </div>
                  
                    <div class="col-md-6 column" id="staffManagementContainer2" style="height:210px;margin-top: -3%;width:385px;padding-right:1px">
                    </div>
                  
                    <div class="col-md-6 column" id="staffManagementContainer3" style="height:210px;margin-top: -3%;width:385px;padding-right:1px">
                    </div>
                    
	<div style="clear:both"></div>
                    </div>
	
</body>
<script type="text/javascript">
renderStaffManagementContainerAHR();
renderStaffManagementContainerHeadCount();
renderStaffManagementContainerHoursMix();
function renderStaffManagementContainerAHR() {
    
    if(!document.getElementById('staffManagementContainer4')){
        return ;
    }
    var partAHR = 34;
    var fullAHR = 223;
    var countValue = [partAHR,fullAHR];
  
     var myChart = echarts.init(document.getElementById('staffManagementContainer4')); 
     option ={
             title: {
                 textStyle: {
                     fontSize: 16,
                     fontStyle:'italic'
                 },
                 left:'40%',
             },
             textStyle: {
                 fontFamily: 'Montserrat',
                 fontSize: '18px',
                 
             },
             tooltip: {
                 trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                textStyle:{fontSize:"12",fontFamily:"Montserrat"},
             },
             grid: {
                 right: '10%',
                 left:'23%',
                 top: '10%',
                 bottom:'1',
                 containLabel: true
             },
             xAxis: {
                 show:false,
                 type: 'value',
                 boundaryGap: [0, 0.01]
             },
             yAxis: {
                 type: 'category',
                 data: [
                        {
                    value: 'Part Time AHR',
                    textStyle: {
                        fontSize: 14,
                        fontFamily:"Montserrat",
                        fontWeight:'400'
                    }
                },
                {value: 'Full Time AHR',
                    textStyle: {
                        fontSize: 14,
                        fontFamily:"Montserrat",
                        fontWeight:'400'
                    }
                },],
                 textStyle: {
                     fontSize: 12,
                     fontFamily:"Montserrat"
                 },
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
                 nameTextStyle:{
                    fontWeight:'bold'
                },
               
             },
             series: [
                 {
                     name: 'Count',
                     type: 'bar',
                     data: countValue,
                     itemStyle:{
                         normal: {
                            show: true,
                            color: '#79C447',
                            borderWidth: 0,
                            borderColor: '#333',
                        }
                        },
                       label: {
                            normal: {
                                show: true,
                                position: 'right' ,
                                textStyle:{
                                    color:'#131313',fontSize:"16",fontFamily:"Montserrat"
                                }
                                }
                            },
                 },
                
             ]
       };
     myChart.setOption(option); 
                 
}
function renderStaffManagementContainerHeadCount() {
     
    if(!document.getElementById('staffManagementContainer2')){
        return ;
    }
    var partHeadCount = 251.25;
    var fullHeadCount = 251.25;
    var data = [{
        value: partHeadCount,
        name: 'PartTime'
    }, {
        value: fullHeadCount,
        name: 'FullTime'
    }];
     var myChart = echarts.init(document.getElementById('staffManagementContainer2')); 
     option = {
                title: {
                    text: 'Count',
                    x: 'center',
                    y: 'center',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 13,
                        fontFamily:"Montserrat",
                    }
                },
                tooltip: {
                    show: true,
                    trigger: 'item',
                    formatter: "{b}: {c} ({d}%)"
                },
                series: [{
                    type: 'pie',
                    selectedMode: 'single',
                    radius: ['32%', '45%'],
                    color: ['#638CA6','#54C08A'],

                    label: {
                        normal: {
                             formatter: '{b|{b}：}{c}\n  {per|{d}%}  ',
                             borderColor: '#638CA6',
                             borderWidth: 1,
                            // shadowBlur:3,
                            // shadowOffsetX: 2,
                            // shadowOffsetY: 2,
                            // shadowColor: '#999',
                            // padding: [0, 7],
                            rich: {
                                b: {
                                    fontSize: 13,
                                    lineHeight: 18,
                                    color:'#131313',
                                    
                                    
                                },
                                per: {
                                    color: '#131313',
                                    padding: [2, 4],
                                    borderRadius: 4,
                                    fontSize: 13,
                                }
                                }
                        }
                    },
                    data: data
                }]
            };
     myChart.setOption(option); 
                 
}
function renderStaffManagementContainerHoursMix() {
    
    if(!document.getElementById('staffManagementContainer3')){
        return ;
    }
    var partHourMIx = 251.25;
    var fullHourMIx = 251.25;
    var data = [{
        value: partHourMIx,
        name: 'PartTime'
    }, {
        value: fullHourMIx,
        name: 'FullTime'
    }];
     var myChart = echarts.init(document.getElementById('staffManagementContainer3')); 
     option = {
             title: {
                 text: 'Hours',
                 x: 'center',
                 y: 'center',
                 textStyle: {
                     fontWeight: 'normal',
                     fontSize: 13,
                     fontFamily:"Montserrat",
                 }
             },
             tooltip: {
                 show: true,
                 trigger: 'item',
                 formatter: "{b}: {c} ({d}%)"
             },
             series: [{
                 type: 'pie',
                 selectedMode: 'single',
                 radius: ['32%', '47%'],
                 color: ['#638CA6','#54C08A'],

                 label: {
                     normal: {
                         formatter: '{b|{b}：}{c}\n  {per|{d}%}  ',
                         borderColor: '#638CA6',
                         borderWidth: 1,
                        // shadowBlur:3,
                        // shadowOffsetX: 2,
                        // shadowOffsetY: 2,
                        // shadowColor: '#999',
                        // padding: [0, 7],
                        rich: {
                            b: {
                                fontSize: 13,
                                lineHeight: 18,
                                color:'#131313'
                                
                            },
                            per: {
                                color: '#131313',
                                padding: [2, 4],
                                borderRadius: 4,
                                fontSize: 13,
                            }
                        }
                    }
                 },
                 data: data
             }]
         };
     myChart.setOption(option); 
                 
}

</script>

</html>