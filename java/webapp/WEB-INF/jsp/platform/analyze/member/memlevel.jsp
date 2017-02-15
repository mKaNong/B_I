<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
				<div class="classify-echarts">
					<div id="classify-echarts"></div>
				</div>
				<div class="table-wrap classify-datalist member">
					<table>
						<thead>
							<tr>
								<th width="33%">会员等级</th>
								<th width="33%">数量</th>
								<th>占比</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach items="${result }" var="list">
						    <tr>
								<td>${list.level_name }</td>
								<td>${list.num }</td>
								<td>${list.rate }%</td>
							</tr>
						</c:forEach>
						</tbody>
			</table>
		</div>
		
<script type="text/javascript">

    var results = ${resultjson};
	var level_name = [],value = [],rate=[]; 
	$.each(results, function(i, p) {
		level_name[i] = p['level_name'];
		value[i] = p['num'];
		rate[i] = p['rate'];
	});	 
  
/* 	classify.setOption( {
	     legend: {data : level_name},
		 series: [{
            data : (function() {
				var res = [];
				var len = value.length;
				while (len--) {
					res.push({name : level_name[len],value : value[len]});
				}	
				return res;	})()	
		 }]  }); 
 */

	var classify = echarts.init(document.querySelector('#classify-echarts'));
    classifyOption = {
		        title: {
		            subtext: '',
		            x: 'left'
		        },
		        legend: {
		            orient: 'horizontal',
		            x: 'center',
		            bottom: 0,
		            data: level_name
		        },
		        series: [{
		            name: '',
		            type: 'pie',
		            //radius : '55%',
		            radius: ['30%', '80%'],
		            center: ['50%', '50%'],
		            label: {
		                normal: {
		                    show: true,
		                    formatter: "{b} \n 数量 : {c} \n 占比 : {d}%",
		                    position: 'inside',
		                    textStyle: {
		                    	fontSize: 14
		                    }
		                },
		                emphasis: {
		                    show: true,
		                    textStyle: {
		                        fontSize: '16',
		                    }
		                }
		            },
		            data: (function() {
						var res = [];
						var len = value.length;
						while (len--) {
							res.push({name : level_name[len],value : value[len]});
						}	
						return res;	})()
		        }]
		    }
	 classify.setOption(classifyOption);
</script>
 