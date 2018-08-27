<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-12 column">
                <div id="staffManagementContainer1" style="width:100%;height:100px;margin-left: -10%;">
                </div>
                </div>
              
              <div class="col-md-6 column">
                <div id="staffManagementContainer2" style="width:380px;height:240px;margin-top: -4%;">
                </div>
                </div>
              
              <div class="col-md-6 column">
                <div id="staffManagementContainer3" style="width:390px;height:240px;margin-top: -4%;margin-left: -17%;">
                </div>
                </div>
                
<script>
renderStaffManagementContainerAHR();
renderStaffManagementContainerHeadCount();
renderStaffManagementContainerHoursMix();
function renderStaffManagementContainerAHR() {
    
    if(!document.getElementById('staffManagementContainer1')){
        return ;
    }
    var partAHR = '9.2';
    var fullAHR = '39.67';
    var countValue = [partAHR,fullAHR];
  
     var myChart = echarts.init(document.getElementById('staffManagementContainer1')); 
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
                 top: '1',
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
                            color: '#8AC364',
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
    var partHeadCount = '44';
    var fullHeadCount = '88';
    var data = [{
        value: partHeadCount,
        name: 'Part Time'
    }, {
        value: fullHeadCount,
        name: 'Full Time'
    }];
     var myChart = echarts.init(document.getElementById('staffManagementContainer2')); 
     option = {
             title: {
                 text: 'Head Count',
                 x: 'center',
                 y: 'center',
                 textStyle: {
                     fontWeight: 'normal',
                     fontSize: 14,
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
                 radius: ['35%', '64%'],
                 color: ['#53BF8A','#638CA6'],

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
    var partHourMIx = '35';
    var fullHourMIx = '28';
    var data = [{
        value: partHourMIx,
        name: 'Part Time'
    }, {
        value: fullHourMIx,
        name: 'Full Time'
    }];
     var myChart = echarts.init(document.getElementById('staffManagementContainer3')); 
     option = {
             title: {
                 text: 'Hours MIx',
                 x: 'center',
                 y: 'center',
                 textStyle: {
                     fontWeight: 'normal',
                     fontSize: 14,
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
                 radius: ['35%', '64%'],
                 color: ['#53BF8A','#638CA6'],

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
                                lineHeight: 16,
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

</script>                