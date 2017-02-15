<!-- 性别 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
    <div class="overlap-cont member-sex">
		<div class="classify-order-sex-pic"><img src="${pageContext.servletContext.contextPath}/static/images/common/sex.jpg" alt=""></div>
		<div class="classify-order-sex">
			<div id="classify-order-sex"></div>
		</div>
	</div>

	
<script type="text/javascript">
var results = ${resultjson};
var sex_num = [],sex_name = [];
var male;
var female;
var mrate;
var frate;

$.each(results, function(i, p) {

	sex_name[i] = p['sex_name'];
	sex_num[i]=p['num'];
	
});	

var orderSex = echarts.init(document.querySelector('#classify-order-sex'));

orderSexOption = {/* 
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            },
            formatter: function (params,ticket){
            	  var res = '';
            	 for(var i = 0;i < 2;i++){
                     if(ticket == 'axis_x0y0_0'){
                    	 res = ' 男 <br/> 数量: '+male+' <br/>占比: '+mrate+'%';
                      }
                     if(ticket == 'axis_x1y1_0'){
                    	 res = ' 女 <br/> 数量: '+female+' <br/>占比: '+frate+'%';
                      }
                 }
                 return res; 

                
            }
        },
        backgroundColor: '#d8deeb',
        grid: [{
            left: 50,
            right: 0,
            height: '35%'
        }, {
            left: 50,
            right: 0,
            top: '52%',
            height: '35%'
        }],
        xAxis : [
            {
                type : 'category',
                data : [''],
                axisTick: {
                    alignWithLabel: true,
                    lineStyle: {
                        opacity: 0
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#616086'
                    }
                }
            },
            {
                gridIndex: 1,
                type : 'category',
                data : [''],
                axisTick: {
                    alignWithLabel: true
                },
                axisLine: {
                    show: false
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                interval: 50,
                max: 100,
                axisTick: {
                    alignWithLabel: true,
                    lineStyle: {
                        opacity: 0
                    }
                },
                axisLabel: {
                    show: true,
                    interval: 'auto',
                    formatter: '{value} %'
               
                },
                axisLine: {
                    lineStyle: {
                        color: '#b6bace'
                    }
                }
            },
            {
                interval: 50,
                max: 100,
                gridIndex: 1,
                type : 'value',
                inverse: true,
                axisTick: {
                    alignWithLabel: true,
                    lineStyle: {
                        opacity: 0
                    }
                },
                axisLabel: {
                    show: true,
                    interval: 'auto',
                    formatter: '{value} %'
                },
                axisLine: {
                    lineStyle: {
                        color: '#b6bace'
                    }
                }
                
            }
        ],
        series : [
            {
                name:'男',
                type:'bar',
                barWidth: '10%',
                data:[{
                      value : mrate,
                      itemStyle: {
                          normal: {
                              label : {
                                  show:true,
                                  formatter:function(params){
                                      return male;
                                  }
                              }
                          }
                      }
                    }]
            },
            {
                xAxisIndex: 1,
                yAxisIndex: 1,
                name:'女',
                type:'bar',
                barWidth: '10%',
                data:[{
                    value: frate,
                    itemStyle: {
                        normal: {
                            color: '#fb5284',
                            label : {
                                show:true,
                                formatter:function(params){
                                    return female;
                                }
                            }
                        }
                    }
                }]
            }
        ] */

        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            },
            formatter: "{b} <br/> 数量 : {c} "
        },
        backgroundColor: '#d8deeb',
        grid: {
            left: '3%',
            right: 0,
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : sex_name,
                axisTick: {
                    alignWithLabel: true,
                    lineStyle: {
                        opacity: 0
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#b6bace'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#8f90cb'
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                boundaryGap: ['0', '100%'],
                axisTick: {
                    lineStyle: {
                        opacity: 0
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#b6bace'
                    }
                },
                axisLabel: {
                    textStyle: {
                        color: '#8f90cb'
                    }
                }
            }
        ],
        series : [
            {
                name:'',
                type:'bar',
                barWidth: '60%',
                data:sex_num
            }
        ]
    }
orderSex.setOption(orderSexOption);
</script>