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
var xData = function(){
    var data = [];
    for(var i=1;i<15;i++){
     data.push(i+"号店");   
    }
    return data;
}();

option = {
    "title": {
        "text": "人流环比图", 
        "subtext": "昨天 vs 前天", 
        "x": "center"
    }, 
    "tooltip": {
        "trigger": "axis", 
        "axisPointer": {
            "type": "shadow"
        },
    }, 
    "grid": {
        "borderWidth": 0, 
        "y2": 120
    }, 
    "legend": {
        "x": "right", 
        "data": [ ]
    }, 
    "toolbox": {
        "show": true, 
        "feature": {
            "restore": { }, 
            "saveAsImage": { }
        }
    }, 
    "calculable": true, 
    "xAxis": [
        {
            "type": "category", 
            "splitLine": {
                "show": false
            }, 
            "axisTick": {
                "show": false
            }, 
            "splitArea": {
                "show": false
            }, 
            "axisLabel": {
                "interval": 0, 
                "rotate": 45, 
                "show": true, 
                "splitNumber": 15, 
                "textStyle": {
                    "fontFamily": "微软雅黑", 
                    "fontSize": 12
                }
            }, 
            "data": xData,
        }
    ], 
    "yAxis": [
        {
            "type": "value", 
            "splitLine": {
                "show": false
            }, 
            "axisLine": {
                "show": true
            }, 
            "axisTick": {
                "show": false
            }, 
            "splitArea": {
                "show": false
            }
        }
    ], 
    "dataZoom": [
        {
            "show": true, 
            "height": 30, 
            "xAxisIndex": [
                0
            ], 
            bottom:40,
            "start": 0, 
            "end": 80
        }, 
        {
            "type": "inside", 
            "show": true, 
            "height": 15, 
            "xAxisIndex": [
                0
            ], 
            "start": 1, 
            "end": 35
        }
    ], 
    "series": [
        {
            "name": "昨日", 
            "type": "bar", 
            "stack": "总量", 
            "barMaxWidth": 50, 
            "barGap": "10%", 
            "itemStyle": {
                "normal": {
                    "barBorderRadius": 0, 
                    "color": "rgba(60,169,196,0.5)", 
                    "label": {
                        "show": true, 
                        "textStyle": {
                            "color": "rgba(0,0,0,1)"
                        }, 
                        "position": "insideTop",
                        formatter : function(p) {
	                                                return p.value > 0 ? (p.value ): '';
	                                            }
                    }
                }
            }, 
            "data": [
                3709, 
                2417, 
                755, 
                2610, 
                1719, 
                433, 
                2544, 
                4285, 
                3372, 
                2484, 
                4078, 
                1355, 
                5208, 
                1723
            ], 
        }, 
        {
            "name": "人流减少", 
            "type": "bar", 
            "stack": "总量", 
            "itemStyle": {
                "normal": {
                    "color": "rgba(51,204,112,1)", 
                    "barBorderRadius": 0, 
                    "label": {
                        "show": true, 
                        "position": "top",
                        formatter : function(p) {
	                                                return p.value > 0 ? ('▼'
	                                                        + p.value + '')
	                                                        : '';
	                                            }
                    }
                }
            }, 
            "data": [
                386, 
                2000, 
                2, 
                122, 
                261, 
                171, 
                0, 
                40, 
                246, 
                0, 
                815, 
                275, 
                570, 
                159,
            ]
        }, 
        {
            "name": "人流增长", 
            "type": "bar", 
            "stack": "总量", 
            "itemStyle": {
                "normal": {
                    "color": "rgba(193,35,43,1)", 
                    "barBorderRadius": 0, 
                    "label": {
                        "show": true, 
                        "position": "top",
                        formatter : function(p) {
	                                                return p.value > 0 ? ('▲'
	                                                        + p.value + '')
	                                                        : '';
	                                            }
                    }
                }
            }, 
            "data": [
                0, 
                376, 
                1727, 
                0, 
                0, 
                0, 
                220, 
                0, 
                0, 
                1951, 
                0, 
                0, 
                0, 
                0
            ]
        }
    ]
}
	
	myChart.setOption(option);
}

</script>

</html>