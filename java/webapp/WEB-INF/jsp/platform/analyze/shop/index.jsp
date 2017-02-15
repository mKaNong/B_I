<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>店铺分析</title>
	<link href="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
 
</head>
<body>
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=shop_p"  ></jsp:include>
<div class="wrapper">
	<div class="main">
		<!-- 按类目 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop icon-1">按类目</div>
			</div>
			<div class="overlap-cont classify-pd">
				<div class="classify-echarts">
					<div id="classify-echarts"></div>
				</div>
				<div class="table-wrap classify-datalist">
					<table>
						<thead>
							<tr>
								<th width="33%">类目</th>
								<th width="33%">数量</th>
								<th>占比</th>
							</tr>
						</thead>
						<tbody id="cat_tbody_id">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 按地域 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop icon-2">按地域</div>
			</div>
			<div class="overlap-cont classify-pd">
				<div class="classify-echarts">
					<div id="area-echarts"></div>
				</div>
				<div class="table-wrap classify-datalist">
					<table>
						<thead>
							<tr>
								<th width="33%">地域</th>
								<th width="33%">数量</th>
								<th>占比</th>
							</tr>
						</thead>
						<tbody id="area_tbody_id">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 店铺入驻数量 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">店铺入驻数量</div>
				<div class="tit-date">
					<input id="_sDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $s = $('#_eDate');WdatePicker({minDate:'1990-1-1',maxDate:$s.val()||_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})">
					<span>到</span>
					<input id="_eDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $e = $('#_sDate');WdatePicker({minDate:$e.val(),maxDate:_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})" >
					<input type="button" value="确定" class="tit-date-button" onclick="shopIn()">
				</div>
				<div class="tit-select-wrap">
					<div class="tit-select">
						<div class="tit-select-name" id="catid">所有类目</div>
						<div class="tit-select-option">
							<div class="active">所有类目</div>
							<c:forEach items="${result.categoryList }" var="caList">
								<div>${caList["first_name"] }</div>
							</c:forEach>
						</div>
					</div>
					<div class="tit-select">
						<div class="tit-select-name" id="areaid">所有地域</div>
						<div class="tit-select-option">
							<div class="active">所有地域</div>
							<c:forEach items="${result.areaList }" var="areaList">
								<div>${areaList["province_name"] }</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="overlap-echarts echarts-bg h385">
					<div id="shop-echarts"></div>
				</div>
			</div>
		</div>

		<!-- 店铺层级 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop icon-3">店铺层级</div>
			</div>
			<div class="overlap-cont level-pd">
				<div id="level-echarts"></div>
			</div>
		</div>

		<!-- 店铺排名 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name">店铺排名</div>
				<div class="tit-setdata">	
				    <a class="active" href="javascript:;" onclick="orderbyo()">全部</a>			
					<a  href="javascript:;" onclick="orderbyo(1)">昨日</a>
					<a href="javascript:;" onclick="orderbyo(2)">近7日</a>
					<a href="javascript:;" onclick="orderbyo(3)">近30日</a>
				</div>
				<div class="tit-select-wrap fl">
					<div class="tit-select">
						<div class="tit-select-name" id="categoryId1s">所有类目</div>
						<div class="tit-select-option">
							<div class="active">所有类目</div>
							<c:forEach items="${result.categoryList }" var="caList">
						         <div>${caList["first_name"] }</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="overlap-cont table-pd" id = "paginations">
				<div class="table-wrap" id = "pagination">
					<table > 
						<thead>
							<tr>
								<th width="10%">排名</th>
								<th width="14.9%">店铺名称</th>
								<th width="10%">类目</th>
								<th width="12.1%">支付金额</th>
								<th width="14.4%">成交商品种数</th>
								<th width="12.6%">支付转化率</th>
								<th width="12.2%">客单价</th>
								<th>店铺访客数</th>
							</tr>
						</thead>
						<tbody id="tbodyid">
							
						</tbody>
					</table>
				</div>
				<div class="m-pages">
				    <div id = 'page' class="m-pagination"></div>
				</div>
			</div>
		</div>

	</div>
</div>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/china.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/date/WdatePicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/shop.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>
<script type="text/javascript">
 
//初始化分页
$(function(){
   	$("#page").pagination({
           showInfo: true,
           showJump: true,
           showPageSizes: true,
           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
           remote: {
               url: '${pageContext.servletContext.contextPath}page',
               success: function (data) {
                
               	$('#tbodyid').empty();
               	 var i = 0;
               	  for(i;i<data.rows.length;i++){
               		 var html='<tr><td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
               		+'<td title = "'+data.rows[i][0]+'">'+data.rows[i][0]+'</td>'
						+'<td title = "'+data.rows[i][1]+'">'+data.rows[i][1]+'</td>'
							+'<td>'+data.rows[i][2] +'</td>'
							+'<td>'+data.rows[i][3]+'</td>'
							+'<td>'+data.rows[i][4]+'%</td>'
							+'<td>'+data.rows[i][5]+'</td>'
							+'<td>'+data.rows[i][6]+'</td></tr>';							
							$("#tbodyid").append(html); 
			            } 
		              }
		          }
		      });
		  }); 
 
    //ajax分页
    function orderbyo(date) {
    	ajaxlogin();
    	localStorage.setItem("key11", date);
 		var category = $("#categoryId1s").html();
 	    var json1 = {categray : category,day : date};
 	    if($("#page").pagination()!=false){
 	    	$("#page").pagination('destroy');
 	 	}
 	    if($("#page").pagination()==false){
 	    	$("#page").pagination({
 	           showInfo: true,
 	           showJump: true,
 	           showPageSizes: true,
 	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
 	           remote: {
 	              url: '${pageContext.servletContext.contextPath}page',
 	              params: json1,
 	              success: function (data) {
 	               	$('#tbodyid').empty();
 	               	 var i = 0;
 	               	  for(i;i<data.rows.length;i++){
 	               		 var html='<tr><td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
 								+'<td title = "'+data.rows[i][0]+'">'+data.rows[i][0]+'</td>'
 								+'<td title = "'+data.rows[i][1]+'">'+data.rows[i][1]+'</td>'
 								+'<td>'+data.rows[i][2] +'</td>'
 								+'<td>'+data.rows[i][3]+'</td>'
 								+'<td>'+data.rows[i][4]+'%</td>'
 								+'<td>'+data.rows[i][5]+'</td>'
 								+'<td>'+data.rows[i][6]+'</td></tr>';							
 								$("#tbodyid").append(html); 
 				            } 
 			              }
 			          }
 			      });
 	 	      }
 	       }

   

</script>
<script type="text/javascript">
   //进入即加载
   $(function(){
	   shopIn();  //店铺入住
	   
	   //类目分布
	 	$.ajax({
			url:"${pageContext.servletContext.contextPath}dic",
			type:"post",
			dataType:"json",
			success:function(result){
			var name = [],value = [],rate=[]; 
			var named=[],valued=[],rated=[];
			var sumNum=0.0;
		    var dd = 0;
			$.each(result, function(i, p) {
				named[i] = p['category_name'];
				valued[i] = p['num'];
				rated[i] = p['rate'];
				if(p['rate'] < 5.0){   
					sumNum = sumNum + p['num'];
			    }else {  
			    	name[i] = p['category_name'];
					value[i] = p['num'];
					rate[i] = p['rate'];
				}
			});
			for(var i=0;i<rate.length;i++){
				dd = dd + rate[i];
		    }
			
            if(dd != 100){
            	name.push("其他");
            	value.push(sumNum);
            	rate.push((100 - dd).toFixed(2));
            }
            for(var i=0;i<named.length;i++){
                var html = '<tr>'
				+'<td>'+named[i]+'</td>'
				+'<td>'+valued[i]+'</td>'
				+'<td>'+rated[i]+'%</td>'
				+'</tr>';
				$('#cat_tbody_id').append(html);
            }
            
			classify.setOption( {
	        		 legend: {data : name},
	        		 series: [{
                        data : (function() {
							var res = [];
							var len = value.length;
							while (len--) {
								res.push({name : name[len],value : value[len]});
							}	
							return res;	})()	
	        		 }]  });
			      }
		       }); 
   
		
   // 地域分布
  	$.ajax({
		url:"${pageContext.servletContext.contextPath}area",
		type:"post",
		dataType:"json",
		success:function(result){
		var name = [],value = [], rate = [],map = [], map1 = [];
		var named=[],valued=[],rated=[];
		var maxNum;
		var sumNum = 0;
		var flag = 0;
		$.each(result, function(i, p) {
           	name[i] = p['area_name'];
   			value[i] = p['num'];
   			rate[i] = p["rate"];
			map[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":value[i]};
			map1[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":rate[i]};
		 
		});
 
        for(var i=0;i<name.length;i++){
            var html = '<tr>'
					  +'<td>'+name[i]+'</td>'
					  +'<td>'+value[i]+'</td>'
					  +'<td>'+rate[i]+'%</td>'
					  +'</tr>';
			$('#area_tbody_id').append(html);
        }
	
		maxNum = value[0];
		area.setOption( {
	    	   tooltip: {
		 		 	formatter: function (params,ticket,callback){
		                var $pna = params.name;
		                var res = '';
		                for(var i = 0;i<map.length;i++){
		                    if(map[i]["name"] == $pna){
		                        res = ' '+map[i]["name"]+' <br/> 店铺数量: '+map[i]["value"]+' <br/>占比: '+map1[i]["value"]+'%';//设置自定义数据的模板，这里的模板是图片
		                        break;
		                    } 
		                }
		      
		                return res;
		            }
			 	 },
			 	visualMap : { max: maxNum + 1000},
			 	series: [{data:map}]
				 });
		      }
	       }); 

    //店铺层级
	$.ajax({
		url:"${pageContext.servletContext.contextPath}level",
		type:"post",
		dataType:"json",
		success:function(result){
			var lev = [], num = [], time = [],one = [], two = [],
			    three = [], four = [], five = [];
			$.each(result, function(i, p) {
				time[i] = p['time_mark'];  num[i] = p['店铺数'];  lev[i] = p['店铺层级'];
				if (p['店铺层级'] == "第一层级") {
					one.push(p['店铺数']);
				}
				if (p['店铺层级'] == "第二层级") {
					two.push(p['店铺数']);
				}
				if (p['店铺层级'] == "第三层级") {
					three.push(p['店铺数']);
				}
				if (p['店铺层级'] == "第四层级") {
					four.push(p['店铺数']);
				}
				if (p['店铺层级'] == "第五层级") {
					five.push(p['店铺数']);
				}
			});
			level.setOption({
				 legend: {
					 formatter: function (name) {
						 if(name == '第一层级'){
                             name = name + ' (${result.shopValueList[0].start}-${result.shopValueList[0].end})';
						 }
						 if(name == '第二层级'){
							 name = name + ' (${result.shopValueList[1].start}-${result.shopValueList[1].end})';
						  }
						 if(name == '第三层级'){
							 name = name + ' (${result.shopValueList[2].start}-${result.shopValueList[2].end})';
						  }
						 if(name == '第四层级'){
							 name = name + ' (${result.shopValueList[3].start}-${result.shopValueList[3].end})';
						  }
						 if(name == '第五层级'){
							 name = name + ' (${result.shopValueList[4].start}以上)';
						  }
						 return name;
						 },
					 data: ['第一层级', '第二层级','第三层级','第四层级','第五层级'] 
			      },
				 series: [
					        {name: '第一层级',data: one},
					        {name: '第二层级',data: two },
					        {name: '第三层级',data: three },
					        {name: '第四层级',data: four },
					        {name: '第五层级',data: five}
					    ]       
						 
					});
			      }
                }); 
		
     }); 

   //店铺入住数量
   function shopIn(){
	   ajaxlogin();
	   var startDate = $("#_sDate").val();
	   var endDate = $("#_eDate").val();
	   var category = $("#catid").html();
	   var area = $("#areaid").html();
	   var time2=[],times2 =[],value2=[];
	   
		 $.ajax({
			url:"${pageContext.servletContext.contextPath}enter",
			type:"post",
			data:{startDate:startDate,endDate:endDate,category:category,area:area},
			dataType:"json",
			success:function(result){
			   $.each(result,function(i,p){
       	   			  time2[i]=p['timed'];		
       	   	       	  value2[i]=p['num'];   
       	   	       });	  		

	       	      	shopNum.setOption( 
	    	    	     { xAxis: { data:time2 },
		        		 series: [ {data:value2}]
	        	   } );
				 }
			 }); 
	     }
 
   //改变下拉选的时候  eacharts数据也跟着改变
   oS.setData = function(){
	  
	  if(oS.index ==1 || oS.index ==0){
	    shopIn();  //店铺入住
	  }
	  if(oS.index ==2){
		  var date1 = localStorage.getItem("key11");
		  if(date1 == null){
			  orderbyo(1);
	      }else {
	    	  orderbyo(date1);   //排名
		  }
      }
   }
   
</script>
</html>