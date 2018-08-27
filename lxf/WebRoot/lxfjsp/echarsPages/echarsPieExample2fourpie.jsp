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

	<div id="econstraints"
		style="width:100%;height:220px;border:1px solid red">
	</div>
	
	 <div class="col-md-3 column"><span class="constraintItem">Employees without task qualifications</span></div>
	                <div class="col-md-3 column"><span class="constraintItem">Employees with no availability</span></div>
	                <div class="col-md-3 column"><span class="constraintItem">Employees with availability &lt; min hours</span></div>
	                <div class="col-md-3 column"><span class="constraintItem">Employees with availbility &lt; max hours</span></div>
	                <div style="clear:both;"></div>
	<div style="clear:both"></div>
	
</body>
<script type="text/javascript">
getChart1()
function getChart1(){
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('econstraints'));
var employWithoutQuliCount = '\ncount:'+'35';
var employWithoutQuliPerInt = '75';
var employWithoutQuliPer = '55'+"%";
var employWithNoAvaiCount = '\ncount:'+'35';
var employWithNoAvaiPer = '55'+"%";
var employWithNoAvaiPerInt = '50';
var employWithNoAvaiMinCount = '\ncount:'+'35';
var employWithNoAvaiMinPer = '55'+"%";
var employWithNoAvaiMinPerInt='33';
var employWithNoAvaiMaxCount = '\ncount:'+'35';
var employWithNoAvaiMaxPer = '55'+"%"; 
var employWithNoAvaiMaxPerInt = '79'; 
option = {
        
        series: [
            {
                name: '',
                type: 'pie',
                radius: ['55%', '70%'],
                center: ['13%', '50%'],
                startAngle: 90,
                "itemStyle":{
                    "normal":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    },
                    "emphasis":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                        normal: {
                            position: 'center'
                        }
                    },
                data: [{
                    value: employWithoutQuliPerInt,
                    itemStyle: {
                        normal: {
                            color: '#FF5555'
                        }
                    },
                     name: '',
                        label: {
                            normal: {
                                formatter: '',
                                textStyle: {
                                    color: '#FF5555',
                                    fontSize: 14

                                }
                            }
                        }
                }, {
                    value: (100-employWithoutQuliPerInt),
                    "itemStyle": {
                        "normal": {
                            "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                "offset": 0,
                                "color": 'white'
                            }, {
                                "offset": 1,
                                "color": 'white'
                            }]),
                        }
                    },
                    
                    name: '%',
                        label: {
                            normal: {
                                formatter: employWithoutQuliCount,
                                textStyle: {
                                    color: 'red',
                                    fontSize: 15

                                }
                            }
                        }
                },
                {
                    value: 0,
                    name: '%',
                        label: {
                            normal: {
                                formatter: employWithoutQuliPer,
                                textStyle: {
                                    color: 'red',
                                    fontSize: 12

                                }
                            }
                        }
                }]
            },
            {
                name: '',
                type: 'pie',
                radius: ['55%', '70%'],
                center: ['38%', '50%'],
                startAngle: 90,
                "itemStyle":{
                    "normal":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    },
                    "emphasis":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: employWithNoAvaiPerInt,
                        itemStyle: {
                            normal: {
                                color: '#FF5555'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: '',
                                    textStyle: {
                                        color: '#FF5555',
                                        fontSize: 14

                                    }
                                }
                            }
                    }, {
                        value: (100-employWithNoAvaiPerInt),
                       
                        "itemStyle": {
                            "normal": {
                                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    "offset": 0,
                                    "color": 'white'
                                }, {
                                    "offset": 1,
                                    "color": 'white'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiCount,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 15

                                    }
                                }
                            }
                    },
                    {
                        value: 0,
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiPer,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 14

                                    }
                                }
                            }
                    }]
            },
            {
                name: ' ',
                type: 'pie',
                radius: ['55%', '70%'],
                center: ['63%', '50%'],
                startAngle: 90,
                "itemStyle":{
                    "normal":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    },
                    "emphasis":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: employWithNoAvaiMinPerInt,
                        itemStyle: {
                            normal: {
                                color: '#FF5555'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: '',
                                    textStyle: {
                                        color: '#FF5555',
                                        fontSize: 14

                                    }
                                }
                            }
                    }, {
                        value: (100-employWithNoAvaiMinPerInt),
                      
                        "itemStyle": {
                            "normal": {
                                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    "offset": 0,
                                    "color": 'white'
                                }, {
                                    "offset": 1,
                                    "color": 'white'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMinCount,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 15

                                    }
                                }
                            }
                    },
                    {
                        value: 0,
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMinPer,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 14

                                    }
                                }
                            }
                    }]
            },
             {
                name: '',
                type: 'pie',
                radius: ['55%', '70%'],
                center: ['88%', '50%'],
                startAngle: 90,
                "itemStyle":{
                    "normal":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    },
                    "emphasis":{
                        "borderColor":"#54C08A",
                        "borderWidth":"1"
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                        normal: {
                            position: 'center'
                        }
                    },
                    data: [{
                        value: employWithNoAvaiMaxPerInt,
                        itemStyle: {
                            normal: {
                                color: '#FF5555'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: '',
                                    textStyle: {
                                        color: '#FF5555',
                                        fontSize: 14

                                    }
                                }
                            }
                    }, {
                        value: (100-employWithNoAvaiMaxPerInt),
                       
                        "itemStyle": {
                            "normal": {
                                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    "offset": 0,
                                    "color": 'white'
                                }, {
                                    "offset": 1,
                                    "color": 'white'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMaxCount,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 15

                                    }
                                }
                            }
                    },
                    {
                        value: 0,
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMaxPer,
                                    textStyle: {
                                        color: 'red',
                                        fontSize: 14

                                    }
                                }
                            }
                    }]
            },
        ]
    };
myChart.setOption(option);
}


</script>

</html>