var classify = echarts.init(document.querySelector('#classify-echarts')),

	area = echarts.init(document.querySelector('#area-echarts')),

	shopNum = echarts.init(document.querySelector('#shop-echarts')),

	level = echarts.init(document.querySelector('#level-echarts')),

    classifyOption = {
        title: {
            subtext: '',
            x: 'left'
        },
   
        legend: {
            orient: 'horizontal',
            x: 'center',
            bottom: -5,
            data: []
        },
        calculable : true,
        series: [{
            name: '访问来源',
            type: 'pie',
            //radius : '55%',
            radius: ['30%', '50%'],
            center: ['50%', '50%'],
            label: {
                normal: {
                    show: true,
                    formatter: "{b} \n 数量 : {c} \n 占比 : {d}%",
                  // position: 'inside',
                    textStyle: {
                    	fontSize: 12
                    }
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '13',
                    }
                }
            },
            data: [],

        }]
    },

    areaOption = {
	    title: {
	        //text: '按地域',
	        left: 'left'
	    },
	    tooltip: {
	        trigger: 'item',
			backgroundColor: '#fff',//背景颜色（此时为默认色）
			//formatter : 'x:{b0}: y:{c0}<br />{b1}: {c1} ({d}%)' ,
			//formatter: '{b} <br/> 店铺数量: {c} <br/>',
			borderColor : '#666',
			borderWidth : 1,
			textStyle : {
				color : '#666'	
			}
	    },

	    visualMap: {
	        min: 0,
	        max: 1000,
			orient: 'horizontal',
	        left: 'center',
	        top: 'top',
	        text: ['高','低'],           // 文本，默认为数值文本
	        calculable: true,
			color:  ['#fe7e00', '#ffa43a', '#ffb864', '#ffd4a2'],
			inverse: true,
	    },
	  
	    series: [
	        {
	            
	            type: 'map',
	            mapType: 'china',
	            roam: false,
	            label: {
	                normal: {
	                    show: true
	                },
	                emphasis: {
	                    show: true
	                }
	            },
	            data:[
	            ]
	        }
	    ]
	},

    shopNumOption = {
		dataZoom: [
	        {
	            type: 'inside',
	            xAxisIndex: 0,
	            start: 0,
	            end: 100,
	            handleStyle: {
	            	opacity: 0
	            },
	            textStyle: {
	            	fontSize: 18
	            }
	        },
	        {
	            type: 'inside',
	            xAxisIndex: 0,
	            start: 10,
	            end: 60
	        }
	    ],
	    tooltip: {
	        trigger: 'axis',
			backgroundColor: '#fff',//背景颜色（此时为默认色）
			//formatter : 'x:{b0}: y:{c0}<br />{b1}: {c1}' ,
			/*
				
			*/
			//formatter: '2016-{b0}<br />{a0}: {c0}<br />{a1}: {c1}<br />{a2}: {c2}<br />{a3}: {c3}',
			borderColor : '#ebeef4',
			borderWidth : 1,
			textStyle : {
				color : '#293469'	
			},
			padding: 10,
			axisPointer: {
				lineStyle: {
					color: '#8f90cb',
					opacity: 0.4
				}
			}
	    },
	    color: ['#fc984f'],
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },

	    // x轴刻度
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: [],
	        axisLabel: {
	        	textStyle: {
	        		color: '#8f90cb'
	        	}	
	        },
	        axisLine: {
	        	lineStyle: {
	        		color: '#2a3360',
	        		width: 1
	        	}
	        },
	        axisTick: {
	        	lineStyle: {
	        		opacity: 0
	        	}
	        },
	        boundaryGap: true
	    },
	    yAxis: {
	        type: 'value',
	        axisLine: {
	        	lineStyle: {
	        		color: '#2a3360',
	        		width: 1
	        	}
	        },
	        axisTick: {
	        	lineStyle: {
	        		opacity: 0
	        	}
	        },
	        splitLine: {
	        	lineStyle: {
	        		color: '#2a3360'
	        	}
	        },
	        axisLabel: {
	        	show: false
	        }
	    },
	    // 显示数据
	    series: [
	        {
	            name:'店铺数',
	            type:'line',
				smooth: true,
	            stack: '总量',
	            data:[]
	        }
	    ]
	},

	levelOption = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
			backgroundColor: '#fff',//背景颜色（此时为默认色）
			//formatter : 'x:{b0}: y:{c0}<br />{b1}: {c1}' ,
			borderColor : '#666',
			borderWidth : 1,
			textStyle : {
				color : '#666'	
			},
			axisPointer : {
				shadowStyle : {
					color : 'red',
					shadowBlur : 10,
					shadowColor: 'rgba(0, 0, 0, 0.5)',
					shadowOffsetY : 10,
					shadowOffsetY : 50,
					opacity : 0.5
				},
				lineStyle: {
					opacity: 0
				}				
			}			
	    },
	    color: ['#01a6e7', '#1fcfae', '#3876c1', '#fe9f02', '#f35944'],
	    legend: {
	        data: [],
	       // formatter: '{name}',
	        algin: 'left',
	        itemGap: 100,
	        left: 30
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis:  {
	        type: 'value',
	        axisTick: {
	        	lineStyle: {
	        		opacity: 0
	        	}
	        },
	        splitLine: {
	        	lineStyle: {
	        		opacity: 0
	        	}
	        }
	    },
	    yAxis: {
	        type: 'category',
	        data: ['近一月','近三月','近六月','近一年'],
	        axisTick: {
	        	inside: true,
	        	length: 10
	        }
	    },
	    series: [
	        {
	            name: '第一层级',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: []
	        },
	        {
	            name: '第二层级',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: []
	        },
	        {
	            name: '第三层级',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: []
	        },
	        {
	            name: '第四层级',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: []
	        },
	        {
	            name: '第五层级',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'insideRight'
	                }
	            },
	            data: []
	        }
	    ]
	},

    num;

classify.setOption(classifyOption);

// 地域
area.setOption(areaOption);

// 店铺入住数量
shopNum.setOption(shopNumOption);

level.setOption(levelOption);

/*oS.setDate = function(){
	var _v = this.innerHTML;
	alert(_v);
}*/