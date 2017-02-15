<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>运营分析</title>
	<link href="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
</head>
<body>
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=overview_p" ></jsp:include>
<div class="member-nav">
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/overview/index" >运营概况</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/custFlow/index" class="">流量构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/tradeForm/index" class="">交易构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/index" class="">搜索词分析</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/product/index" class="current">商品分析</a>
</div>
<div class="wrapper">
    <div class="main">
        <!-- 在线商品数 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name">在线商品数</div>
                <div class="tit-setdata">
                    <a class="active" href="javascript:;" onclick="onlineProductNum(1)">近7日</a>
                    <a href="javascript:;" onclick="onlineProductNum(2)">近30日</a>
                </div>
            </div>
            <div class="overlap-cont">
                <div class="items-from-link-wrap">
                    <div class="operate-flow-canvases small fr">
                        <div id="commodity-round"></div>
                    </div>
                    <div class="items-from-link-view fl">
                        <div id="commodity-view"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 被下单商品数 -->
        <div class="overlap flow-deal">
            <div class="sys-title title-deg">
                <div class="tit-name">被下单商品数</div>
                <div class="tit-setdata">
                    <a class="active" href="javascript:;" onclick="placedProduct(1)">近7日</a>
                    <a href="javascript:;" onclick="placedProduct(2)">近30日</a>
                </div>
                <div class="tit-select-wrap">
                    
                    <div class="tit-select">
                        <div class="tit-select-name" id="placed_id">所有类目</div>
                        <div class="tit-select-option">
                            <div class="active">所有类目</div>
                            <c:forEach items="${categoryList }" var="list">
                               <div>${list['first_name'] }</div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlap-cont">
                <div class="overlap-echarts echarts-bg h390">
                    <div id="commodity-order"></div>
                </div>
            </div>
        </div>

        <!-- 被支付商品数 -->
        <div class="overlap flow-deal">
            <div class="sys-title title-deg">
                <div class="tit-name">被支付商品数</div>
                <div class="tit-setdata">
                    <a class="active" href="javascript:;" onclick="paidProductNum(1)">近7日</a>
                    <a href="javascript:;" onclick="paidProductNum(2)">近30日</a>
                </div>
                <div class="tit-select-wrap">
                    <div class="tit-select">
                        <div class="tit-select-name" id="channel_paid_id">所有类目</div>
                        <div class="tit-select-option">
                            <div class="active">所有类目</div>
                            <c:forEach items="${categoryList }" var="list">
                               <div>${list['first_name'] }</div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlap-cont">
                <div class="overlap-echarts echarts-bg h390">
                    <div id="commodity-pay"></div>
                </div>
            </div>
        </div>

        <!-- 商品排行 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name">商品排行</div>
                <div class="tit-date">
                    <input id="_sDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $s = $('#_eDate');WdatePicker({minDate:'1990-1-1',maxDate:$s.val()||_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})">
                    <span>到</span>
                    <input id="_eDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $e = $('#_sDate');WdatePicker({minDate:$e.val(),maxDate:_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})" >
                    <input type="button" value="确定" class="tit-date-button" onclick="productRank()">
                </div>
                <div class="tit-setdata min">
                    <a class="active" href="javascript:;" onclick="clickProduct()">全部</a>
                    <a href="javascript:;" onclick="clickProduct(1)">昨日</a>
                    <a href="javascript:;" onclick="clickProduct(2)">近7日</a>
                    <a href="javascript:;" onclick="clickProduct(3)">近30日</a>
                </div>
            </div>
            <div class="overlap-cont table-pd">
                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th width="10%">排名</th>
                                <th width="14.9%">商品名称</th>
                                <th width="16%">浏览量</th>
                                <th width="16%">访客数</th>
                                <th width="14.4%">成交量</th>
                                <th width="13.7%">交易金额</th>
                                <th>支付转化率</th>
                            </tr>
                        </thead>
                        <tbody id="tbodyid">
                           
                        </tbody>
                    </table>
                </div>
                <div class="m-pages">
                   <div id="page"></div>
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
<script src="${pageContext.servletContext.contextPath}/static/js/operate-commodity.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>

<script type="text/javascript">
  $(function(){
	  onlineProductNum(1); //在线商品数
	  placedProduct(1);  //被下单商品
	  paidProductNum(1); //被支付商品数
   });

  //被下单商品
  function placedProduct(date){
	  ajaxlogin();
      var channelId = $('#placed_id').html();
      if(channelId == '所有类目'){
 		 channelId = null;
      }
       localStorage.setItem("placedProductKey", date);
       $.ajax({
          url : '${pageContext.servletContext.contextPath}placedProduct',
          data : {day : date, channelId : channelId},
          type : 'post',
          dataType : 'JSON',
          success : function(result){
                 var time = [],num = [];
                 $.each(result,function(i,p) {
                 	  time[i] = p['timeid'];
                 	  num[i] = p['num'];
                 });
               
                 commodityOrderOption.xAxis.data = time;
                 commodityOrderOption.series=[{
                     name:'被下单商品数',
                     type:'line',
                     smooth: true,
                     stack: '总量',
                     data:num
                 }]
                 commodityOrder.setOption(commodityOrderOption);
              }
           });
  }

  //被支付商品数
  function paidProductNum(date){
	 ajaxlogin();
     localStorage.setItem("paidProductNumKey", date);
	 var channelId = $('#channel_paid_id').html();
	 if(channelId == '所有类目'){
		 channelId = null;
      }
     $.ajax({
        url : '${pageContext.servletContext.contextPath}paidProductNum',
        data : {day : date, channelId : channelId},
        type : 'post',
        dataType : 'JSON',
        success : function(result){
               var time = [],num = [];
               $.each(result,function(i,p) {
               	  time[i] = p['timeid'];
               	  num[i] = p['num'];
               });
               commodityPayOption.xAxis.data = time;
               commodityPayOption.series=[{
                   name:'被支付商品数',
                   type:'line',
                   smooth: true,
                   stack: '总量',
                   data:num
               }]
               commodityPay.setOption(commodityPayOption);
            }
         });
  }

  //在线商品数
  function onlineProductNum(date){
	  ajaxlogin();
	  $.ajax({
		  url : '${pageContext.servletContext.contextPath}onlineProductNum',
		  data : {day : date},
		  dataType : 'JSON',
		  type : 'post',
		  success : function(result){
			
            if(result.qushiList != undefined && result.channelList != undefined){
            //趋势
            if(result.qushiList.length > 0){
                var time = [], num = [];
                $.each(result.qushiList,function(i,p){
                	time[i] = p['timeid'];
                	num[i] = p['num'];
                });
                commodityView.setOption({
                	xAxis: { data:time },
	        		 series: [{ data:num }]
                });
             //类目
             if(result.channelList.length){
                var name = [],cnum = [];
                $.each(result.channelList,function(i,p){
                	name[i] = p['category_name'];
                	cnum[i] = p['num'];
                });
             }   
             commodityRound.setOption({
            	// legend: {data : name},
        		 series: [{
                    data : (function() {
						var res = [];
						var len = name.length;
						while (len--) {
							res.push({name : name[len],value : cnum[len]});
						}	
						return res;	})()	
        		 }]
              });
            }
		}
		  }
	});
  }



  //排名
    $(function(){
	   	$("#page").pagination({
	           showInfo: true,
	           showJump: true,
	           showPageSizes: true,
	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
	           remote: {
	               url: '${pageContext.servletContext.contextPath}productRank',
	               success: function (data) {
	                //console.info(data);
	               	$('#tbodyid').empty();
	               	 var i = 0;
	               	  for(i;i<data.rows.length;i++){
	               		 var html='<tr><td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
								+'<td title="'+data.rows[i][0]+'">'+data.rows[i][0]+'</td>'
								+'<td>'+data.rows[i][1]+'</td>'
								+'<td>'+data.rows[i][2] +'</td>'
								+'<td>'+data.rows[i][3]+'</td>'
								+'<td>'+data.rows[i][4]+'</td>'
								+'<td>'+data.rows[i][5]+'%</td>'
								+'</tr>';							
								$("#tbodyid").append(html); 
				            } 
			              }
			          }
			      });
			  }); 
  
  function clickProduct(date){
	
	  localStorage.setItem("productRankKey", date);
	  productRank();
  }
  
  function productRank(){
	  ajaxlogin();
      var start = $('#_sDate').val();
      var end = $('#_eDate').val();
      var date = localStorage.getItem("productRankKey");
      var json1 = {s : start,e : end,day : date};
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
              url: '${pageContext.servletContext.contextPath}productRank',
              params: json1,
              success: function (data) {
               //console.info(data);
              	$('#tbodyid').empty();
              	 var i = 0;
              	  for(i;i<data.rows.length;i++){
              		 var html='<tr><td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
							+'<td title="'+data.rows[i][0]+'">'+data.rows[i][0]+'</td>'
							+'<td>'+data.rows[i][1]+'</td>'
							+'<td>'+data.rows[i][2] +'</td>'
							+'<td>'+data.rows[i][3]+'</td>'
							+'<td>'+data.rows[i][4]+'</td>'
							+'<td>'+data.rows[i][5]+'%</td>'
							+'</tr>';							
							$("#tbodyid").append(html); 
			            } 
		              }
		          }
		      });
	      }
  }

  //改变下拉选的时候  eacharts数据也跟着改变
  oS.setData = function(){
	 
	  if(oS.index ==0){
		 var dateValue = localStorage.getItem("placedProductKey");
		 if(dateValue == null){
		   placedProduct(1);
		 } else {
			 placedProduct(dateValue);
	     }

	  }
	  if(oS.index ==1){
		  var date1 = localStorage.getItem("paidProductNumKey");
		  if(date1 == null){
			  paidProductNum(1);
	      }else {
	    	  paidProductNum(date1);   //排名
		  }
     }
  }
		 
  
</script>
</html>