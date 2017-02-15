<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>首页</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
	
</head>
<body>
<!--   menu -->  
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=index_p"  ></jsp:include>
<!-- end menu -->
<div class="wrapper">
	<div class="main">
		<!-- 运营概况  -->
		<div class="sys-title mb-10">
			<div class="tit-name">运营概况：</div>
			<div class="tit-setdata">
				<a href="javascript:;" onclick="funOver(1)" class="active">昨日</a>
				<a href="javascript:;" onclick="funOver(2)">近7日</a>
				<a href="javascript:;" onclick="funOver(3)">近30日</a>
			</div>
		</div>
		<div class="operate-data">
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
						<em><fmt:formatNumber value="${result.overviewList['avg_bro_vol'] }" pattern="#,#00.0#"/> </em>
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
						<em><fmt:formatNumber value="${result.overviewList['pay_amount'] }" pattern="#,#00.0#"/> </em>
						
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
					<a href="javascript:;" onclick="flowDeals(1)"  class="active">昨日</a>
					<a href="javascript:;" onclick="flowDeals(2)">近7日</a>
					<a href="javascript:;" onclick="flowDeals(3)">近30日</a>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="condition">
					<div class="name">指标：</div>
					<div class="checkboxs">
						<label for="checkbox-all">
							<input type="checkbox" name=""  id="checkbox-all" checked="checked">
							<span class="icon-defalut">全　　部</span>
						</label>
						<label for="checkbox-fkl">
							<input type="checkbox" name="" id="checkbox-fkl">
							<span class="icon-defalut">访客数</span>
						</label>
						<label for="checkbox-lll">
							<input type="checkbox" name=""   id="checkbox-lll">
							<span class="icon-defalut">浏览量</span>
						</label>
						<label for="checkbox-rjlll">
							<input type="checkbox" name=""  id="checkbox-rjlll">
							<span class="icon-defalut">人均浏览量</span>
						</label>
						<label for="checkbox-dsl">
							<input type="checkbox" name=""  id="checkbox-dsl">
							<span class="icon-defalut">跳失率</span>
						</label>
						<label for="checkbox-pjtlsj">
							<input type="checkbox" name=""  id="checkbox-pjtlsj">
							<span class="icon-defalut">平均停留时间</span>
						</label>
						<label for="checkbox-zfje">
							<input type="checkbox" name=""  id="checkbox-zfje">
							<span class="icon-defalut">支付金额</span>
						</label>
						<label for="checkbox-cjl">
							<input type="checkbox" name=""  id="checkbox-cjl">
							<span class="icon-defalut">成交量</span>
						</label>
						<label for="checkbox-dds">
							<input type="checkbox" name=""  id="checkbox-dds">
							<span class="icon-defalut">订单数</span>
						</label>
						<label for="checkbox-kdj">
							<input type="checkbox" name=""  id="checkbox-kdj">
							<span class="icon-defalut">客单价</span>
						</label>
						<label for="checkbox-zfmjs">
							<input type="checkbox" name=""  id="checkbox-zfmjs">
							<span class="icon-defalut">支付买家数</span>
						</label>
						<label for="checkbox-zfzhl">
							<input type="checkbox" name=""  id="checkbox-zfzhl">
							<span class="icon-defalut">支付转化率</span>
						</label>
					</div>
				</div>
				<div class="overlap-echarts echarts-bg">
					<div id="flow-echarts"></div>
				</div>
			</div>
		</div>

		<!-- 店铺入驻数量 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">店铺入驻数量：</div>
				<div class="tit-date">
					<input id="_sDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $s = $('#_eDate');WdatePicker({minDate:'1990-1-1',maxDate:$s.val()||_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})">
					<span>到</span>
					<input id="_eDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $e = $('#_sDate');WdatePicker({minDate:$e.val(),maxDate:_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})" >
					<input type="button" value="确定" class="tit-date-button" onclick="shopIn()">
				</div>
				<div class="tit-select-wrap">
					<div class="tit-select">
						<div class="tit-select-name" id="catid" >所有类目</div>
						<div class="tit-select-option">
							<div class="active">所有类目</div>
							<c:forEach items="${result.categoryList }" var="caList">	        
						      <div>${caList["first_name"] }</div>	
						    </c:forEach>  
							
						</div>
					</div>
					<div class="tit-select">
						<div class="tit-select-name" id="areaid" >所有地域</div>
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

		<!-- 新增会员 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">新增会员：</div>
				<div class="tit-setdata">
					<a class="active" href="javascript:;" onclick="addMembers(1)">近7日</a>
					<a  href="javascript:;" onclick="addMembers(2)">近30日</a>
					<a href="javascript:;" onclick="addMembers(3)">近6个月</a>
					<a href="javascript:;" onclick="addMembers(4)">近1年</a>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="overlap-echarts echarts-bg h390">
					<div id="member-echarts"></div>
				</div>
			</div>
		</div>

		<!-- 在线商品 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">在线商品：</div>
				<div class="tit-setdata">
					<a class="active" href="javascript:;"  onclick="online(1)">近7日</a>
					<a  href="javascript:;" onclick="online(2)">近30日</a>
					<a href="javascript:;" onclick="online(3)">近6个月</a>
					<a href="javascript:;" onclick="online(4)">近1年</a>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="overlap-echarts echarts-bg h390">
					<div id="online-echarts"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/date/WdatePicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/index.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/flow.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/formatNum.js">
</script>
</body>

<script type="text/javascript">
	  //店铺入住数量
        function shopIn(){
        	ajaxlogin();
    	   var startDate = $("#_sDate").val();
    	   var endDate = $("#_eDate").val();
    	   var category = $("#catid").html();
    	   var area = $("#areaid").html();
    	   var time2=[],times2 =[],value2=[];
    	   
    		 $.ajax({
    			url:"<%=basePath%>platform/index/query/factstoreinfo",
    			type:"post",
    			data:{startDate:startDate,endDate:endDate,category:category,area:area},
    			dataType:"json",
    			success:function(result){
        			 
    				$.each(result,function(i,p){
	       	   			time2[i]=p['timed'];		
	       	   	       	value2[i]=p['num'];   
	       	   	     });	  		
	       	   	  /*    for(var i=0;i<time2.length;i++){
	       	   	    	 var date2 = new Date(time2[i]);
	       	   	    	 times2[i]=date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate();
	       	   	      }	   	   */ 
	       	      	shopNum.setOption( 
    	    	    	     { xAxis: { data:time2  },
    		        		 series: [ {data:value2}]
    	        	   } );
    				 }
    			 }); 
    	     }
 
 	  
     //运营分析
     function funOver(data){  
    	 ajaxlogin();
		$.ajax({
	        type: "post",
	        url: "<%=basePath%>platform/index/query/factoverviewsum",
	        data: {date:data},
	        //dataType: "json",
	        success: function(maps){  
	        	var result = eval("(" + maps + ")");
	        	 $(".operate-data").empty();
	        		var html = '<div class="operate-list">'
					+'<div class="sys-title title-deg"><span class="icon icon-1">流量概况</span></div>'
					+'<ul>'
					+'<li>'
					+'	<span>访客数：</span>'
					+'		<em>'+fmoney(result["uv"],0)+'</em>'
					+'	</li>'
					+'	<li>'
					+'		<span>浏览量：</span>'
					+'		<em>'+fmoney(result["pv"],0)+'</em>'
					+'	</li>'
					+'	<li>'
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
	         $(".operate-data").append(html);
	             
	        }
	    }); 
	}

     //在线商品
     function online(date){	
    	    ajaxlogin();
			var time=[],times =[];value=[];
			$.ajax({

				url:"<%=basePath%>platform/index/query/factpronum",

				type:"post",
				data:{date:date},
				dataType:"json",
				success:function(result){
					$.each(result,function(i,p){
	        			time[i]=p['timeid'];		
	        	       	value[i]=p['num'];   
	        	     });
	        	     for(var i=0;i<time.length;i++){
	        	    	 var date = new Date(time[i]);
	        	    	 times[i]=date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
	        	     }
	        	     onlineShop.setOption(
	    	        	   { xAxis: { data:times  },
	    	        		 series: [ {data:value}]
	    	        	   }      
	        		    );
					}
				});
		    }

    //新增会员
    function addMembers(date){
    ajaxlogin();
	var time3=[],times3 =[],value3=[];
	 $.ajax({
		url:"<%=basePath%>platform/index/query/factcustssum",
		type:"post",
		data:{date:date},
		dataType:"json",
		success:function(result){
			$.each(result,function(i,p){
    			time3[i]=p['timeid'];		
    	       	value3[i]=p['num'];   
    	     });
    	     for(var i=0;i<time3.length;i++){
    	    	 var date3 = new Date(time3[i]);
    	    	 times3[i]=date3.getFullYear()+'-'+(date3.getMonth()+1)+'-'+date3.getDate();
    	      }
    	     addMember.setOption({ 
    	    	      xAxis: { data:times3  },
	        		 series: [ {data:value3}]
        	       });
			  }
		 }); 
     } 

    //流量交易趋势
     function flowDeals(date){
    	ajaxlogin();
    	localStorage.setItem("flowDealskey", date);
    	var time1=[],times1 =[], uv=[],pv=[], avg_bro_vol=[],loss_rate=[],
    	    avg_res_time=[], pay_amount=[], pay_ordernum=[], ordernum=[],
    	    guest_unit_price=[], pay_custs=[], pay_convert_rate=[];
	   var series_data = [];
    	$.ajax({
			url:"<%=basePath%>platform/index/query/factoverview",
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
   
	</script>
<script type="text/javascript">
    $(function(){
        shopIn(); // 店铺入住
    	online(1); // 在线商品
        addMembers(1); //新增会员
    	flowDeals(1); //流量
    });

    //下拉菜单事件
    oS.setData = function(){
  	   shopIn();
    }

    $(".icon-defalut").on('click',function(){
        
    	var date = localStorage.getItem("flowDealskey");
        if(date != 'undefined'){
    	   flowDeals(date);
         }else {
           flowDeals(1);
         }
     });
</script>
</html>