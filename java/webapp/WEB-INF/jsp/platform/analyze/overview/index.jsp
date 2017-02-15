<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>运营分析</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
</head>
<body>
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=overview_p"  ></jsp:include>
<div class="member-nav">
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/overview/index" class="current">运营概况</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/custFlow/index" class="">流量构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/tradeForm/index" class="">交易构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/index" class="">搜索词分析</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/product/index" class="">商品分析</a>
</div>
<div class="wrapper">
	<div class="main">
		<!-- 运营概况  -->
		<div class="sys-title mb-10">
			<div class="tit-name">运营概况：</div>
			<div class="tit-setdata">
				<a class="active" href="javascript:;" onclick="funOverView(1)">昨日</a>
				<a href="javascript:;" onclick="funOverView(2)">近7日</a>
				<a href="javascript:;" onclick="funOverView(3)">近30日</a>
			</div>
		</div>
		<div class="operate-data" id="operate-data-id">
			<div class="operate-list">
				<div class="sys-title title-deg"><span class="icon icon-1">流量概况</span></div>
				<ul>
					<li>
						<span>访客数：</span>
						<em><fmt:formatNumber value="${result.overviewList['uv'] }" pattern="#,#00"/></em>
					</li>
					<li>
						<span>浏览量：</span>
						<em><fmt:formatNumber value="${result.overviewList['pv'] }" pattern="#,#00"/></em>
					</li>
					<li>
						<span>人均浏览量：</span>
						<em><fmt:formatNumber value="${result.overviewList['avg_bro_vol'] }" pattern="#,#00.0#"/></em>
					</li>
					<li>
						<span>跳失率：</span>
						<em>${result.overviewList['loss_rate'] } %</em>
					</li>
					<li>
						<span>平均停留时间：</span>
						<em><fmt:formatNumber value="${result.overviewList['avg_res_time'] }" pattern="#,#00"/></em>
					</li>
				</ul>
			</div>
			<div class="operate-list">
				<div class="sys-title title-deg"><span class="icon icon-2">交易概况</span></div>
				<ul>
					<li>
						<span>支付金额：</span>
						<em><fmt:formatNumber value="${result.overviewList['pay_amount'] }" pattern="#,#00.0#"/></em>
					</li>
					<li>
						<span>成交量：</span>
						<em><fmt:formatNumber value="${result.overviewList['pay_ordernum'] }" pattern="#,#00"/></em>
					</li>
					<li>
						<span>订单数：</span>
						<em><fmt:formatNumber value="${result.overviewList['ordernum'] }" pattern="#,#00"/></em>
					</li>
					<li>
						<span>客单价：</span>
						<em><fmt:formatNumber value="${result.overviewList['guest_unit_price'] }" pattern="#,#00.0#"/></em>
					</li>
					<li>
						<span>支付买家数：</span>
						<em><fmt:formatNumber value="${result.overviewList['pay_custs'] }" pattern="#,#00"/> </em>
					</li>
					<li>
						<span>支付转化率：</span>
						<em>${result.overviewList['pay_rate'] } %</em>
					</li>
				</ul>
			</div>
			<div class="operate-list">
				<div class="sys-title title-deg"><span class="icon icon-3">商品概况</span></div>
				<ul>
					<li>
						<span>在线商品数：</span>						
					</li>
					<li>
						<em><fmt:formatNumber value="${result.overviewList['num'] }" pattern="#,#00"/></em>
					</li>
					<li>
						<span>被支付商品数：</span>
					</li>
					<li>
						<em><fmt:formatNumber value="${result.overviewList['pay_pronum'] }" pattern="#,#00"/></em>
					</li>
				</ul>
			</div>
		</div>

		<!-- 流量交易趋势 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">流量交易趋势：</div>
				<div class="tit-setdata">
					<a  class="active" href="javascript:;" onclick="funFlowDeal(1)">昨日</a>
					<a  href="javascript:;" onclick="funFlowDeal(2)">近7日</a>
					<a href="javascript:;" onclick="funFlowDeal(3)">近30日</a>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="condition">
					<div class="name">指标：</div>
					<div class="checkboxs">
						<label for="checkbox-all">
							<input type="checkbox" name="" id="checkbox-all"  checked="checked">
							<span class="icon-defalut">全　　部</span>
						</label>
						<label for="checkbox-fkl">
							<input type="checkbox" name="" id="checkbox-fkl">
							<span class="icon-defalut">访客数</span>
						</label>
						<label for="checkbox-lll">
							<input type="checkbox" name="" id="checkbox-lll">
							<span class="icon-defalut">浏览量</span>
						</label>
						<label for="checkbox-rjlll">
							<input type="checkbox" name="" id="checkbox-rjlll">
							<span class="icon-defalut">人均浏览量</span>
						</label>
						<label for="checkbox-dsl">
							<input type="checkbox" name="" id="checkbox-dsl">
							<span class="icon-defalut">跳失率</span>
						</label>
						<label for="checkbox-pjtlsj">
							<input type="checkbox" name="" id="checkbox-pjtlsj">
							<span class="icon-defalut">平均停留时间</span>
						</label>
						<label for="checkbox-zfje">
							<input type="checkbox" name="" id="checkbox-zfje">
							<span class="icon-defalut">支付金额</span>
						</label>
						<label for="checkbox-cjl">
							<input type="checkbox" name="" id="checkbox-cjl">
							<span class="icon-defalut">成交量</span>
						</label>
						<label for="checkbox-dds">
							<input type="checkbox" name="" id="checkbox-dds">
							<span class="icon-defalut">订单数</span>
						</label>
						<label for="checkbox-kdj">
							<input type="checkbox" name="" id="checkbox-kdj">
							<span class="icon-defalut">客单价</span>
						</label>
						<label for="checkbox-zfmjs">
							<input type="checkbox" name="" id="checkbox-zfmjs">
							<span class="icon-defalut">支付买家数</span>
						</label>
						<label for="checkbox-zfzhl">
							<input type="checkbox" name="" id="checkbox-zfzhl">
							<span class="icon-defalut">支付转化率</span>
						</label>
					</div>
				</div>
				<div class="overlap-echarts echarts-bg">
					<div id="flow-echarts"></div>
				</div>
			</div>
		</div>
           
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name">转化率</div>
				<div class="tit-setdata">
					<a class="active" href="javascript:;" onclick="funRate(1)">昨日</a>
					<a href="javascript:;" onclick="funRate(2)">近7日</a>
					<a href="javascript:;" onclick="funRate(3)">近30日</a>
				</div>
			</div>
			<div class="overlap-cont operate" id="percent-list-id">
				<ul class="percent-list">
					<li>
						<div>
							<c:if test="${result.rateIndexList['uv_rate'] > 0 }">
							    <p>访客数 <img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['uv_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['uv_rate'] < 0 }">
							    <p>访客数 <img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['uv_rate'] }%</p>
							</c:if>
							<p class="num-first"><fmt:formatNumber value="${result.rateIndexList['uv'] }" pattern="#,#00"/></p>
						</div>
					</li>
					<li>
						<div>
							<c:if test="${result.rateIndexList['order_custs_rate'] > 0 }">
							    <p>下单买家数 <img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['order_custs_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['order_custs_rate'] < 0 }">
							    <p>下单买家数 <img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['order_custs_rate'] }%</p>
							</c:if>
							<p class="num-second"><fmt:formatNumber value="${result.rateIndexList['order_custs'] }" pattern="#,#00"/></p>
						</div>
						<div>
							<c:if test="${result.rateIndexList['order_amount_rate'] > 0 }">
							    <p>下单金额<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['order_amount_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['order_amount_rate'] < 0 }">
							    <p>下单金额 <img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['order_amount_rate'] }%</p>
							</c:if>
							<p class="num-second"><fmt:formatNumber value="${result.rateIndexList['order_amount'] }" pattern="#,#00.0#"/></p>
						</div>
					</li>
					<li>
						<div>
							<c:if test="${result.rateIndexList['pay_custs_rate'] > 0 }">
							    <p>支付买家数 <img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['pay_custs_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['pay_custs_rate'] < 0 }">
							    <p>支付买家数 <img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['pay_custs_rate'] }%</p>
							</c:if>
							<p class="num-third"><fmt:formatNumber value="${result.rateIndexList['pay_custs'] }" pattern="#,#00"/></p>
						</div>
						<div>
							<c:if test="${result.rateIndexList['pay_amount_rate'] > 0 }">
							    <p>支付金额 <img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['pay_amount_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['pay_amount_rate'] < 0 }">
							    <p>支付金额<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['pay_amount_rate'] }%</p>
							</c:if>
							<p class="num-third"><fmt:formatNumber value="${result.rateIndexList['pay_amount'] }" pattern="#,#00.0#"/></p>
						</div>
						<div>
							<c:if test="${result.rateIndexList['guest_unit_price_rate'] > 0 }">
							    <p>客单价 <img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">${result.rateIndexList['guest_unit_price_rate'] }%</p>
							</c:if>
							<c:if test="${result.rateIndexList['guest_unit_price_rate'] < 0 }">
							    <p>客单价 <img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">${result.rateIndexList['guest_unit_price_rate'] }%</p>
							</c:if>
							<p class="num-third"><fmt:formatNumber value="${result.rateIndexList['guest_unit_price'] }" pattern="#,#00.0#"/></p>
						</div>
					</li>
				</ul>
				<div class="percent-img">
					<img src="${pageContext.servletContext.contextPath}/static/images/common/percent.png" alt="转化率">
					<div class="percent-pos percent-pos-t">
						<p>下单转化率</p>
						<p>${result.rateIndexList['order_rate'] }%</p>
					</div>
					<div class="percent-pos percent-pos-b">
						<p>下单-支付</p>
						<p>转化率</p>
						<p>${result.rateIndexList['order_pay_rate'] }%</p>
					</div>
					<div class="percent-pos percent-pos-r">
						<p>支付转化率</p>
						<p>${result.rateIndexList['pay_rate'] }%</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/operate.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/flow.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/formatNum.js">
</script>
</body>

<script type="text/javascript">
    //运营
    function funOverView(date){
    	ajaxlogin();
    	$.ajax({
			url:"${pageContext.servletContext.contextPath}overview",
			type:"post",
			data:{date : date},
			dataType:"json",
			success:function(result){
				$('#operate-data-id').empty();
				var html='<div class="operate-list">'
						+'<div class="sys-title title-deg"><span class="icon icon-1">流量概况</span></div>'
						+'<ul>'
						+'<li>'
						+'<span>访客数：</span>'
						+'<em>'+fmoney(result["uv"],0)+'</em>'
						+'</li>'
						+'	<li>'
						+'	<span>浏览量：</span>'
						+'<em>'+fmoney(result["pv"],0)+'</em>'
						+'</li>'
						+'<li>'
						+'		<span>人均浏览量：</span>'
						+'		<em>'+fmoney(result["avg_bro_vol"],2)+'</em>'
						+'	</li>'
						+'	<li>'
						+'		<span>跳失率：</span>'
						+'		<em>'+result["loss_rate"]+' %</em>'
						+'	</li>'
						+'	<li>'
						+'		<span>平均停留时间：</span>'
						+'		<em>'+fmoney(result["avg_res_time"],0)+'</em>'
						+'	</li>'
						+'</ul>'
						+'</div>'
						+'<div class="operate-list">'
						+'<div class="sys-title title-deg"><span class="icon icon-2">交易概况</span></div>'
						+'<ul>'
						+'	<li>'
						+'		<span>支付金额：</span>'
						+'		<em>'+fmoney(result["pay_amount"],2)+'</em>'
						+'	</li>'
						+'	<li>'
						+'		<span>成交量：</span>'
						+'		<em>'+fmoney(result["pay_ordernum"],0)+'</em>'
						+'	</li>'
						+'	<li>'
						+'		<span>订单数：</span>'
						+'		<em>'+fmoney(result["ordernum"],0)+' </em>'
						+'	</li>'
						+'	<li>'
						+'		<span>客单价：</span>'
						+'		<em>'+fmoney(result["guest_unit_price"],2)+'</em>'
						+'	</li>'
						+'	<li>'
						+'		<span>支付买家数：</span>'
						+'		<em>'+fmoney(result["pay_custs"],0)+' </em>'
						+'	</li>'
						+'	<li>'
						+'		<span>支付转化率：</span>'
						+'		<em>'+result["pay_rate"]+' %</em>'
						+'	</li>'
						+'</ul>'
						+'</div>'
						+'<div class="operate-list">'
						+'<div class="sys-title title-deg"><span class="icon icon-3">商品概况</span></div>'
						+'<ul>'
						+'	<li>'
						+'		<span>在线商品数：</span>	'					
						+'	</li>'
						+'	<li>'
						+'		<em>'+fmoney(result["num"],0)+' </em>'
						+'	</li>'
						+'	<li>'
						+'		<span>被支付商品数：</span>'
						+'	</li>'
						+'	<li>'
						+'		<em>'+fmoney(result["pay_pronum"],0)+'</em>'
						+'	</li>'
						+'</ul>'
						+'</div>';
				$('#operate-data-id').append(html);
			 }
		  }); 
    }

    //转化率
     function funRate(date){
    	 ajaxlogin();
         var upImg = "${pageContext.servletContext.contextPath}/static/images/common/up.png";
         var downImg = "${pageContext.servletContext.contextPath}/static/images/common/down.png";
    	 $.ajax({
 			url:"${pageContext.servletContext.contextPath}rate",
 			type:"post",
 			data:{date : date},
 			dataType:"json",
 			success:function(result){
 				$('#percent-list-id').empty();
 			    //取数据的绝对值
 				var rateArray = [];
 				rateArray.push(Math.abs(result["uv_rate"]));
 				rateArray.push(Math.abs(result["order_custs_rate"]));
 				rateArray.push(Math.abs(result["order_amount_rate"]));
 				rateArray.push(Math.abs(result["pay_custs_rate"]));
 				rateArray.push(Math.abs(result["pay_amount_rate"]));
 				rateArray.push(Math.abs(result["guest_unit_price_rate"]));
 				var html='<ul class="percent-list">'
 					+'<li>' 
 					+'<div>' 
 					+'	<p>访客数 <img src="" alt="" id="uv_rate_id">'+rateArray[0]+'%</p>' 
 					+'	<p class="num-first">'+fmoney(result["uv"],0)+'</p>' 
 					+'</div>' 
 					+'</li>' 
 					+'<li>' 
 					+'<div>' 
 					+'	<p>下单买家数<img src="" alt="" id="order_custs_rate_id">'+rateArray[1]+'%</p>' 
 					+'	<p class="num-second">'+fmoney(result["order_custs"],0)+' </p>' 
 					+'</div>' 
 					+'<div>' 
 					+'	<p>下单金额<img src="" alt="" id="order_amount_rate_id">'+rateArray[2]+'%</p>' 
 					+'	<p class="num-second">'+fmoney(result["order_amount"],2)+' </p>' 
 					+'</div>' 
 					+'</li>' 
 					+'<li>' 
 					+'<div>' 
 					+'	<p>支付买家数<img src="" alt="" id="pay_custs_rate_id">'+rateArray[3]+'%</p>' 
 					+'	<p class="num-third">'+fmoney(result["pay_custs"],0)+' </p>' 
 					+'</div>' 
 					+'<div>' 
 					+'	<p>支付金额<img src="" alt="" id="pay_amount_rate_id">'+rateArray[4]+'%</p>' 
 					+'	<p class="num-third">'+fmoney(result["pay_amount"],2)+' </p>' 
 					+'</div>' 
 					+'<div>' 
 					+'	<p>客单价<img src="" alt="" id="guest_unit_price_rate_id">'+rateArray[5]+'%</p>' 
 					+'	<p class="num-third">'+fmoney(result["guest_unit_price"],2)+'</p>' 
 					+'</div>' 
 					+'</li>' 
				+'</ul>' 
				+'<div class="percent-img">'
				+'<img src="${pageContext.servletContext.contextPath}/static/images/common/percent.png" alt="转化率">'
				+'<div class="percent-pos percent-pos-t">'
				+'	<p>下单转化率</p>'
				+'	<p>'+result["order_rate"]+'%</p>'
				+'</div>'
				+'<div class="percent-pos percent-pos-b">'
				+'	<p>下单-支付</p>'
				+'	<p>转化率</p>'
				+'	<p>'+result["order_pay_rate"]+'%</p>'
				+'</div>'
				+'<div class="percent-pos percent-pos-r">'
				+'	<p>支付转化率</p>'
				+'	<p>'+result["pay_rate"]+'%</p>'
				+'</div>'
				+'</div>';
 				$('#percent-list-id').append(html);
 			
 				if(result["uv_rate"] > 0){
 	 				$('#uv_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#uv_rate_id").attr("src",downImg);
 	 	 		}
 	 	 		
 				if(result["order_custs_rate"] > 0){
 	 				$('#order_custs_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#order_custs_rate_id").attr("src",downImg);
 	 	 		}
 	 	 		
 				if(result["order_amount_rate"] > 0){
 	 				$('#order_amount_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#order_amount_rate_id").attr("src",downImg);
 	 	 		}
 	 	 		
 				if(result["pay_custs_rate"] > 0){
 	 				$('#pay_custs_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#pay_custs_rate_id").attr("src",downImg);
 	 	 		}
 	 	 		
 				if(result["pay_amount_rate"] > 0){
 	 				$('#pay_amount_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#pay_amount_rate_id").attr("src",downImg);
 	 	 		}
 	 	 		
 				if(result["guest_unit_price_rate"] > 0){
 	 				$('#guest_unit_price_rate_id').attr("src",upImg);
 	 			}else {
 	 				$("#guest_unit_price_rate_id").attr("src",downImg);
 	 	 		}
 			  }
 			});
       }
    

    function funFlowDeal(date){
    	ajaxlogin();
    	localStorage.setItem("flowDealskey", date);
    	var time1=[],times1 =[], uv=[],pv=[], avg_bro_vol=[],loss_rate=[],
    	    avg_res_time=[], pay_amount=[], pay_ordernum=[], ordernum=[],
    	    guest_unit_price=[], pay_custs=[], pay_convert_rate=[];
	   var series_data = []; var formatNum = [];
    	$.ajax({
			url:"${pageContext.servletContext.contextPath}trend",
			type:"post",
			async : true, //同步执行
			data:{date:date},
			dataType:"json",
			success:function(result){
					$.each(result,function(i,p){
	     	   			uv[i]=p['uv']; 
	     	   			pv[i]=p['pv']; 
	     	   			avg_bro_vol[i]=p['avg_bro_vol']; 
	     	   			loss_rate[i]=p['loss_rate']; 
	     	   			avg_res_time[i]=p['avg_res_time'];   
	     	   			pay_amount[i]=p['pay_amount'];   
	     	   			pay_ordernum[i]=p['pay_ordernum'];   
	     	   			ordernum[i]=p['ordernum'];   
	     	   			guest_unit_price[i]=p['guest_unit_price'];   
	     	   			pay_custs[i]=p['pay_custs'];   
	     	   			pay_convert_rate[i]=p['pay_convert_rate'];   
	 	   			});	
					 $.each(result,function(i,p){
		      	   			time1[i]=p['timeid'];	
		     	   		 });
				     for(var i=0;i<time1.length;i++){
	    	   	    	 var date1 = new Date(time1[i]);
	    	   	    	 times1[i]=date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate();
	    	   	      }	

				     var uvd = transformArrayNum(uv);
				     var pvd = transformArrayNum(pv);
				     var avg_bro_vold = transformArrayNum(avg_bro_vol);
				     var loss_rated = transformArrayNum(loss_rate);
				     var avg_res_timed = transformArrayNum(avg_res_time);
				     var pay_amountd = transformArrayNum(pay_amount);
				     var pay_ordernumd = transformArrayNum(pay_ordernum);
				     var ordernumd = transformArrayNum(ordernum);
				     var guest_unit_priced = transformArrayNum(guest_unit_price);
				     var pay_custsd = transformArrayNum(pay_custs);
				     var pay_convert_rated = transformArrayNum(pay_convert_rate);

				     
				     if($("#checkbox-all").is(':checked')){
		  					series_data.push( {name : '访客数', type:'line',smooth: true, stack: '总量', data : uvd} );
		  					series_data.push( {name : '浏览量', type:'line',smooth: true, stack: '总量', data : pvd} );
		  					series_data.push(  {name : '人均浏览量', type:'line',smooth: true, stack: '总量', data : avg_bro_vold} );
		  					series_data.push(   {name : '跳失率', type:'line',smooth: true, stack: '总量', data : loss_rated} );
		  					series_data.push(  {name : '平均停留时间', type:'line',smooth: true, stack: '总量', data : avg_res_timed});
		  					series_data.push(  {name : '支付金额', type:'line',smooth: true, stack: '总量', data : pay_amountd});
		  					series_data.push( {name : '成交量', type:'line',smooth: true, stack: '总量', data : pay_ordernumd} );
		  					series_data.push(  {name : '订单数', type:'line',smooth: true, stack: '总量', data : ordernumd});
		  					series_data.push(  {name : '客单价', type:'line',smooth: true, stack: '总量', data : guest_unit_priced} );
		  					series_data.push(  {name : '支付买家数', type:'line',smooth: true, stack: '总量', data : pay_custsd} );
		  					series_data.push( {name : '支付转化率', type:'line',smooth: true, stack: '总量', data : pay_convert_rated});
		  			  }
		  			
            	    if($("#checkbox-fkl").is(':checked')){
  					   series_data.push( {name : '访客数', type:'line',smooth: true, stack: '总量', data : uvd} );
  				    }
	            	  
					if($("#checkbox-lll").is(':checked')){
						series_data.push( {name : '浏览量', type:'line',smooth: true, stack: '总量', data : pvd} );
					}
				
					if($("#checkbox-rjlll").is(':checked')){
						series_data.push(  {name : '人均浏览量', type:'line',smooth: true, stack: '总量', data : avg_bro_vold} );
					}
				
					if($("#checkbox-dsl").is(':checked')){
						series_data.push(   {name : '跳失率', type:'line',smooth: true, stack: '总量', data : loss_rated} );
					}
				
					if($("#checkbox-pjtlsj").is(':checked')){
						series_data.push(  {name : '平均停留时间', type:'line',smooth: true, stack: '总量', data : avg_res_timed});
					}
			
					if($("#checkbox-zfje").is(':checked')){
						series_data.push(  {name : '支付金额', type:'line',smooth: true, stack: '总量', data : pay_amountd});
					}
				
					if($("#checkbox-cjl").is(':checked')){
						series_data.push( {name : '成交量', type:'line',smooth: true, stack: '总量', data : pay_ordernumd} );
					}
				
					if($("#checkbox-dds").is(':checked')){
						series_data.push(  {name : '订单数', type:'line',smooth: true, stack: '总量', data : ordernumd});
					}
			
					if($("#checkbox-kdj").is(':checked')){
						series_data.push(  {name : '客单价', type:'line',smooth: true, stack: '总量', data : guest_unit_priced} );
					}
				
					if($("#checkbox-zfmjs").is(':checked')){
						series_data.push(  {name : '支付买家数', type:'line',smooth: true, stack: '总量', data : pay_custsd} );
					}
				
				    if($("#checkbox-zfzhl").is(':checked')){
						series_data.push( {name : '支付转化率', type:'line',smooth: true, stack: '总量', data : pay_convert_rated});
					}
                  
                  //传值到eacharts
                  flowDealOption.tooltip.formatter = function(value){
                	   var datas = value[0].name;
                	   var name = value[0].seriesName;
                	   var res = '';
                	   var flag = false;
                       if($("#checkbox-fkl").is(':checked')){
	                        for(var i=0;i<times1.length;i++){
	                           if(datas == times1[i]){
	                                res = res +'<br/>访客数 : '+ uv[i];
	                            }
	                        } 
	                        flag = true;
                        }
                       if($("#checkbox-lll").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>浏览量 : '+ pv[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   } 
                       if($("#checkbox-rjlll").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>人均浏览量 : '+ avg_bro_vol[i];	  
	                            }                	  
                    	   }  
                    	   flag = true;                 
   					   }
                       if($("#checkbox-dsl").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>跳失率 : '+ loss_rate[i];	  
	                            }                	  
                    	   }
                    	   flag = true;                   
   					   }  
                       if($("#checkbox-pjtlsj").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>平均停留时间 : '+ avg_res_time[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }  
                       if($("#checkbox-zfje").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>支付金额 : '+ pay_amount[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }
                       if($("#checkbox-cjl").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>成交量 : '+ pay_ordernum[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }
                       if($("#checkbox-dds").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>订单数 : '+ ordernum[i];	  
	                            }                	  
                    	   }
                    	   flag = true;                   
   					   }       
                       if($("#checkbox-kdj").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>客单价 : '+ guest_unit_price[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }   
                       if($("#checkbox-zfmjs").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>支付买家数 : '+ pay_custs[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }   
                       if($("#checkbox-zfzhl").is(':checked')){  
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + '<br/>支付转化率 : '+ pay_convert_rate[i];	  
	                            }                	  
                    	   } 
                    	   flag = true;                  
   					   }  
   					   if(flag){
   						for(var i=0;i<times1.length;i++){ 
                 		   if(datas == times1[i]){
                 			   res = times1[i] + res;	  
	                         }                	  
                 	   } 
   	   					}
                       if($("#checkbox-all").is(':checked')){
                    	   for(var i=0;i<times1.length;i++){ 
                    		   if(datas == times1[i]){
                    			   res = res + times1[i] +'<br/>访客数 : '+ uv[i];
                    			   res = res + '<br/>浏览量 : '+ pv[i];
                    			   res = res + '<br/>人均浏览量 : '+ avg_bro_vol[i];
                    			   res = res + '<br/>跳失率 : '+ loss_rate[i];	 
                    			   res = res + '<br/>平均停留时间 : '+ avg_res_time[i];	 
                    			   res = res + '<br/>支付金额 : '+ pay_amount[i];	  
                    			   res = res + '<br/>成交量 : '+ pay_ordernum[i];	  
                    			   res = res + '<br/>订单数 : '+ ordernum[i];	  
                    			   res = res + '<br/>客单价 : '+ guest_unit_price[i];	  
                    			   res = res + '<br/>支付买家数 : '+ pay_custs[i];	  
                    			   res = res + '<br/>支付转化率 : '+ pay_convert_rate[i];	  
	                            }                	  
                    	   }  
                       } 
                       return res;
                   };
                  flowDealOption.xAxis.data=times1;
                  flowDealOption.series=series_data;
                  flowDeal.setOption(flowDealOption,true);
                  
				}
			});
       }

    $(".icon-defalut").on('click',function(){
     
    	var date = localStorage.getItem("flowDealskey");
        if(date != 'undefined'){
        	funFlowDeal(date);
         }else {
        	 funFlowDeal(1);
         }
     });

    $(function(){
    	funFlowDeal(1); //流量
    });
</script>
</html>