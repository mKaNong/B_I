<!-- 年龄 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
    <div class="overlap-cont member-age">
		<div id="classify-order-age"></div>
	</div>
	
<script type="text/javascript">

var results = ${resultjson};
var agegroup= [],num=[];
$.each(results, function(i, p) {
	agegroup[i] = p['agegroup'];
	num[i] = p['num'];
});	

var orderAge = echarts.init(document.querySelector('#classify-order-age'));

orderAgeOption = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            },
            formatter: "{b} <br/> 数量 : {c}"
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
                data : agegroup,
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
                data:num
            }
        ]
    }

orderAge.setOption(orderAgeOption);
</script>	
	
	
	
	
	