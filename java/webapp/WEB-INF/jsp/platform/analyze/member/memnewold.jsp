
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <div class="classify-echarts">
			<div id="classify-order-old"></div>
		</div>
		<div class="table-wrap classify-datalist member-old">
			<table>
				<thead>
					<tr>
						<th width="33%">新老会员</th>
						<th width="33%">数量</th>
						<th>占比</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result }" var="list">
						    <tr>
								<td>${list.isnew_name }</td>
								<td>${list.num }</td>
								<td>${list.rate }%</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
<script type="text/javascript">

	var results = ${resultjson};
	var isnews_name = [],value = [],rate=[]; 
	$.each(results, function(i, p) {
		isnews_name[i] = p['isnew_name'];
		value[i] = p['num'];
		rate[i] = p['rate'];
	});	
	
	var isOld = echarts.init(document.querySelector('#classify-order-old'));
	 orderOldOption = {
		        title: {
		            subtext: '',
		            x: 'left'
		        },
		        legend: {
		            orient: 'horizontal',
		            x: 'center',
		            bottom: 0,
		            data : isnews_name
		        },
		        series: [{
		            name: '',
		            type: 'pie',
		            radius: ['30%', '80%'],
		            center: ['50%', '50%'],
		            label: {
		                normal: {
		                    show: true,
		                    formatter: "{b} : {c} \n 占比 : {d}%",
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
		            color: ['#3876c1', '#ffa003'],
		            data: (function() {
						var res = [];
						var len = value.length;
						while (len--) {
							res.push({name : isnews_name[len],value : value[len]});
						}	
						return res;	})()
		        }]
		    }
		    
	 isOld.setOption(orderOldOption);
</script>		
