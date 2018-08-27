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
	<div id="mmExcutionChartContainer"
		style="width: 800px;height:400px;">
	</div>
	<div style="clear:both"></div>
	
	<div id="chart2"
		style="width: 800px;height:400px; ">
	</div>
</body>
<script type="text/javascript">
getChart1();
function getChart1(){
// 基于准备好的dom，初始化echarts实例
var allXtick = function(){
    var data = [];
    for(var i=1;i<97;i++){
     data.push(i+"");   
    }
    return ["05: 00","05: 15","05: 30","05: 45","06: 00","06: 15","06: 30","06: 45","07: 00","07: 15","07: 30","07: 45","08: 00","08: 15","08: 30","08: 45","09: 00","09: 15","09: 30","09: 45","10: 00","10: 15","10: 30","10: 45","11: 00","11: 15","11: 30","11: 45","12: 00","12: 15","12: 30","12: 45","13: 00","13: 15","13: 30","13: 45","14: 00","14: 15","14: 30","14: 45","15: 00","15: 15","15: 30","15: 45","16: 00","16: 15","16: 30","16: 45","17: 00","17: 15","17: 30","17: 45","18: 00","18: 15","18: 30","18: 45","19: 00","19: 15","19: 30","19: 45","20: 00","20: 15","20: 30","20: 45","21: 00","21: 15","21: 30","21: 45","22: 00","22: 15","22: 30","22: 45","23: 00","23: 15","23: 30","23: 45"];
}();

var req = function(){
    var data = [];
    for(var i=1;i<97;i++){
     data.push(i%6 +3);   
    }
    return [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,1,2,3,3,3,3,2,2,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
}();

var over = function(){
    var data = [];
    for(var i=1;i<97;i++){
    	if(i%3 == 0){
         data.push(i%4);   
    	}else{
    		data.push(0);
    	}
    }
    return [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
}();

var under = function(){
    var data = [];
    for(var i=1;i<97;i++){
    	if(i%3 == 0){
       		data.push(0);
       	}else{
       		data.push(i%4);   
       	}  
    }
    return [1,1,1,1,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,1,1,0,1,1,1,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0];
}();

//-----------------start to copy
var myChart = echarts.init(document.getElementById('mmExcutionChartContainer'));

                                      option = {
                                    		    backgroundColor: "#F3F2F2",
                                    		    "tooltip": {
                                    		        "trigger": "axis", 
                                    		        "axisPointer": {
                                    		            "type": "shadow",
                                    		                textStyle: {
                                    		                    color: "#fff"
                                    		                }
                                    		        },
                                    		    }, 
                                    		    "grid": {
                                    		        "show":"true",
                                    		        "left":"5",
                                    		        "right":"20",
                                    		        "top":"40",
                                    		        "bottom":"40",
                                    		        "borderWidth": 0, 
                                    		        
                                    		        "containLabel": "true",
                                    		    }, 
                                    		    "legend": {
                                    		        "show":"true",
                                    		        "right":"10%",
                                    		        "data": ["Requirement","Schedule Over","Schedule Under" ],
                                    		        textStyle: {
                                    		            color:"#90979c"
                                    		        }
                                    		    }, 
                                    		    "toolbox": {
                                    		        "show": false, 
                                    		        "feature": {
                                    		            "restore": { }, 
                                    		            "saveAsImage": { }
                                    		        }
                                    		    }, 
                                    		    "calculable": true, 
                                    		    "xAxis": [
                                    		        {
                                    		            "type": "category", 
                                    		            "axisLine": {
                                    		                lineStyle: {
                                    		                    color: '#90979c'
                                    		                }
                                    		            },
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
                                    		                "splitNumber": 22, 
                                    		                "textStyle": {
                                    		                    "fontFamily": "", 
                                    		                    "fontSize": 10
                                    		                }
                                    		            }, 
                                    		            "data": allXtick,
                                    		        }
                                    		    ], 
                                    		    "yAxis": [
                                    		        {
                                    		            "type": "value", 
                                    		            "axisLine": {
                                    		                lineStyle: {
                                    		                    color: '#90979c'
                                    		                }
                                    		            },
                                    		            "splitLine": {
                                    		                "show": false
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
                                    		                	 "type": "inside", 
                                    		                     "show": true, 
                                    		                     "height": 10, 
                                    		                     "xAxisIndex": [
                                    		                         0
                                    		                     ], 
                                    		                     bottom:10,
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
                                    		            "name": "Requirement", 
                                    		            "type": "bar", 
                                    		            "stack": "Require", 
                                    		            "barGap": "1%", 
                                    		            "itemStyle": {
                                    		                "normal": {
                                    		                    "barBorderRadius": 0, 
                                    		                    "color": "rgba(51,204,112,1)", 
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
                                    		            "data": req, 
                                    		        }, 
                                    		        {
                                    		            "name": "Schedule Under", 
                                    		            "type": "bar", 
                                    		            "stack": "Require",
                                    		            barGap:'1%',
                                    		            "itemStyle": {
                                    		                "normal": {
                                    		                    "color": "rgba(193,35,43,1)", 
                                    		                    "barBorderRadius": 0, 
                                    		                    "label": {
                                    		                        "show": true, 
                                    		                        "position": "insideTop",
                                    		                        formatter : function(p) {
                                    		                                                    return p.value > 0 ? ('▼'
                                    		                                                            + p.value + '')
                                    		                                                            : '';
                                    		                                                }
                                    		                    }
                                    		                }
                                    		            }, 
                                    		            "data": under
                                    		        }, 
                                    		        {
                                    		            "name": "Schedule Over", 
                                    		            "type": "bar", 
                                    		            "stack": "Require", 
                                    		            barGap:'1%',
                                    		            "itemStyle": {
                                    		                "normal": {
                                    		                    "color": "#DFD854",
                                    		                    "barBorderRadius": 0, 
                                    		                    "label": {
                                    		                        "show": true, 
                                    		                        "position": "insideTop",
                                    		                        formatter : function(p) {
                                    		                                                    return p.value > 0 ? ('▲'
                                    		                                                            + p.value + '')
                                    		                                                            : '';
                                    		                                                }
                                    		                    }
                                    		                }
                                    		            }, 
                                    		            "data": over
                                    		        }
                                    		    ]
                                    		}
                                    		    myChart.setOption(option);
//-----------------end 
}

</script>

</html>