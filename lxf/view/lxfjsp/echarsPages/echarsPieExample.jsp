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
      </head>
<body >

<input type="button" value="演示char1" onclick="getChart1()">
<input type="button" value="演示char2" onclick="getChart2()">
	<div id="chart1"
		style="width: 541px;height:240px;border:1px solid red">
	</div>
	<div style="clear:both"></div>
	
	<div id="chart2"
		style="width: 541px;height:270px; ">
	</div>
</body>
<script type="text/javascript">
getChart1();
getChart2();
function getChart1(){
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('chart1'));
var data = [{
    value: 0,
    name: 'Part Time'
}, {
    value: 5713,
    name: 'Full Time'
}];
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
            color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#FFCC67'],

            label: {
                normal: {
                	 formatter: '{b|{b}：}{c}\n  {per|{d}%}  ',
                     borderColor: '#aaa',
                     borderWidth: 1,
                     borderRadius: 4,
                    // shadowBlur:3,
                    // shadowOffsetX: 2,
                    // shadowOffsetY: 2,
                    // shadowColor: '#999',
                    // padding: [0, 7],
                    rich: {
                            b: {
                                fontSize: 16,
                                lineHeight: 33,
                                color:'#363691',
                                
                            },
                            per: {
                                backgroundColor: '#FFF7DE',
                                padding: [2, 4],
                                borderRadius: 4,
                                fontSize: 15,
                                color:'#363691',
                            }
                        }
                }
            },
            data: data
        }]
    };
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
}


function getChart2(){
	var myChart = echarts.init(document.getElementById('chart2'));
	var data = [{
	    value: 0,
	    name: 'Part Time'
	}, {
	    value: 22,
	    name: 'Full Time'
	}];

	 option = {
             title: {
                 text: 'Hours MIx',
                 x: 'center',
                 y: 'center',
                 textStyle: {
                     fontWeight: 'normal',
                     fontSize: 14,
                     color:'#DEED21'
                 }
             },
             tooltip: {
                 show: true,
                 trigger: 'item',
                 formatter: "{b}: {c} ({d}%)"
             },
             legend: {
                 orient: 'horizontal',
                 left:'30%',
                 bottom: '0%',
                 data: ['Part Time', 'Full Time'],
                 textStyle:{fontSize:"12",fontFamily:"Montserrat",color:'#FB667A'}
             },
             series: [{
                 type: 'pie',
                 selectedMode: 'single',
                 radius: ['35%', '75%'],
                 color: ['#59ADF3','#86D560', '#AF89D6' ],

                 label: {
                	 normal: {
                    	 formatter: '{b|{b}：}{c}\n  {per|{d}%}  ',
                         borderColor: '#aaa',
                         borderWidth: 1,
                         borderRadius: 8,
                        // shadowBlur:3,
                        // shadowOffsetX: 2,
                        // shadowOffsetY: 2,
                        // shadowColor: '#999',
                        // padding: [0, 7],
                        rich: {
                            b: {
                                fontSize: 16,
                                lineHeight: 33,
                                color:'#eee'
                                
                            },
                            per: {
                                color: '#eee',
                                backgroundColor: '#800100',
                                padding: [2, 4],
                                borderRadius: 4,
                                fontSize: 15,
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