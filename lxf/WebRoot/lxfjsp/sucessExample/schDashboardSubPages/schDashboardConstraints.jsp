<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="econstraints"
		style="width: 100%;height:260px;">
	</div>
                
<script>
getChart1()
function getChart1(){
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('econstraints'));
var employWithoutQuliCount = '\ncount:'+'35';
var employWithoutQuliPerInt = '6';
var employWithoutQuliPer = '55'+"%";
var employWithNoAvaiCount = '\ncount:'+'35';
var employWithNoAvaiPer = '55'+"%";
var employWithNoAvaiPerInt = '7';
var employWithNoAvaiMinCount = '\ncount:'+'35';
var employWithNoAvaiMinPer = '55'+"%";
var employWithNoAvaiMinPerInt='4';

var employWithNoAvaiMaxCount = '\ncount:'+'35';
var employWithNoAvaiMaxPer = '55'+"%"; 
var employWithNoAvaiMaxPerInt = '79';
	option = {
        
        series: [
            {
                name: '',
                type: 'pie',
                radius: ['55%', '70%'],
                center: ['10%', '50%'],
                startAngle: 270,
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
                            color: 'red'
                        }
                    },
                     name: '',
                        label: {
                            normal: {
                                formatter: 'Employees \nwithout \ntask qualifications',
                                textStyle: {
                                    color: '#FFA8A9',
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
                                "color": '#00a2ff'
                            }, {
                                "offset": 1,
                                "color": '#70ffac'
                            }]),
                        }
                    },
                    
                    name: '%',
                        label: {
                            normal: {
                                formatter: employWithoutQuliCount,
                                textStyle: {
                                    color: '#FFA8A9',
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
                center: ['25%', '50%'],
                startAngle: 270,
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
                                color: 'red'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: 'Employees \nwith \nno availability',
                                    textStyle: {
                                        color: '#FFA8A9',
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
                                    "color": '#00a2ff'
                                }, {
                                    "offset": 1,
                                    "color": '#70ffac'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiCount,
                                    textStyle: {
                                        color: '#FFA8A9',
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
                center: ['40%', '50%'],
                startAngle: 270,
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
                                color: 'red'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: 'Employees \nwith \navailability &lt; min hours',
                                    textStyle: {
                                        color: '#FFA8A9',
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
                                    "color": '#00a2ff'
                                }, {
                                    "offset": 1,
                                    "color": '#70ffac'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMinCount,
                                    textStyle: {
                                        color: '#FFA8A9',
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
                center: ['55%', '50%'],
                startAngle: 270,
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
                                color: 'red'
                            }
                        },
                         name: '',
                            label: {
                                normal: {
                                    formatter: 'Employees \nwith \navailbility &lt; max hours',
                                    textStyle: {
                                        color: '#FFA8A9',
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
                                    "color": '#00a2ff'
                                }, {
                                    "offset": 1,
                                    "color": '#70ffac'
                                }]),
                            }
                        },
                        name: '%',
                            label: {
                                normal: {
                                    formatter: employWithNoAvaiMaxCount,
                                    textStyle: {
                                        color: '#FFA8A9',
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