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
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
</head>
<body>
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=overview_p"  ></jsp:include>
<div class="member-nav">
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/overview/index" >运营概况</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/custFlow/index" class="">流量构成</a>
	<a class="current" href="${pageContext.servletContext.contextPath}/platform/analyze/tradeForm/index">交易构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/index" class="">搜索词分析</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/product/index" class="">商品分析</a>
</div>
<div class="wrapper">
    <div class="main">
        <!-- 支付买家数分布 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name">支付买家数分布</div>
                <div class="tit-setdata">
                    <a class="active" href="javascript:;" onclick="payBuyerNum(1)">昨日</a>
                    <a href="javascript:;" onclick="payBuyerNum(2)">近7日</a>
                    <a href="javascript:;" onclick="payBuyerNum(3)">近30日</a>
                </div>
            </div>
            <div class="overlap-cont operate-flow">
                <div class="operate-flow-canvases">
                    <div class="tit">性别</div>
                    <div class="items" id="items-sex"></div>
                </div>
                <div class="operate-flow-canvases">
                    <div class="tit">等级</div>
                    <div class="items" id="items-level"></div>
                </div>
                <div class="operate-flow-canvases">
                    <div class="tit">年龄</div>
                    <div class="items" id="items-age"></div>
                </div>
                <div class="operate-flow-canvases">
                    <div class="tit">新老会员</div>
                    <div class="items" id="items-new"></div>
                </div>
            </div>
        </div>

        <!-- 按地域 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name icon-shop icon-2">按地域</div>
            </div>
            <div class="overlap-cont operate-flow-pd">
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
                        <tbody id="tbody_area_id">
                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

     

        <!-- 渠道分析 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name">渠道分析</div>
                <div class="tit-setdata">
                    <a class="active" href="javascript:;" onclick="channelAnalyze(1)">昨日</a>
                    <a href="javascript:;" onclick="channelAnalyze(2)">近7日</a>
                    <a href="javascript:;" onclick="channelAnalyze(3)">近30日</a>
                </div>
            </div>
            <div class="overlap-cont">
                <div class="items-from-link-wrap">
                    <div class="operate-flow-canvases small">
                        <div id="items-from-link"></div>
                    </div>
                    <div class="items-from-link-view">
                        <div id="items-from-link-view"></div>
                    </div>
                </div>
                <div class="link-table-wrap">
                    <div class="name">详情：</div>
                    <div class="table-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th width="12%">排名</th>
                                    <th width="13%">渠道</th>
                                    <th width="13%">访客数</th>
                                    <th width="15%">浏览量</th>
                                    <th width="13%">人均浏览量</th>
                                    <th width="20%">平均停留时间（s）</th>
                                    <th>跳失率</th>
                                </tr>
                            </thead>
                            <tbody id="channel_tbody_id">
                               
								
								 
                            </tbody>
                        </table>
                    </div>
                
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
<script src="${pageContext.servletContext.contextPath}/static/js/operate-flow-trend.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>

<script type="text/javascript">
$(function (){
	payBuyerNum(1);
	channelAnalyze(1);
});

//支付买家数分布
function payBuyerNum(date){
	ajaxlogin();
	$.ajax({
     url : '${pageContext.servletContext.contextPath}payCustsTrend',
     data : {day : date},
     type : 'post',
     dataType : 'json',
     success : function(result){
    	// console.info(result);
	         //性别
	         var sex=[],sexnum=[];
	         $.each(result.sexlist, function(i, p) {
	         	sex[i] = p['sex_name'];
	         	sexnum[i] = p['num'];
	     	});
		    

	     	 itemsSex.setOption({
	         		legend: {data: sex},
	         		series: [{
	                  data: (function() {
							var res = [];
							var len = sex.length;
							while (len--) {
								res.push({name : sex[len],value : sexnum[len]});
							}	
						return res;	})()
	         	}]
	         });
	         
	     //等级
	     var level=[],levelnum=[];
	     $.each(result.levellist, function(i, p) {
	     	level[i] = p['level_name'];
	     	levelnum[i] = p['num'];
	 	});
	     itemsLevel.setOption({
	 		legend: {data: level},
	 		series: [{
	          data: (function() {
					var res = [];
					var len = level.length;
					while (len--) {
						res.push({name : level[len],value : levelnum[len]});
					}	
				return res;	})()
	 	}]
	 });
	     //年龄
	     var age=[],agenum=[];
	     $.each(result.agelist, function(i, p) {
	 	   age[i] = p['agegroup'];
	 	   agenum[i] = p['num'];
	   	});
	     itemsAge.setOption({
	 		legend: {data: age},
	 		series: [{
	          data: (function() {
					var res = [];
					var len = age.length;
					while (len--) {
						res.push({name : age[len],value : agenum[len]});
					}	
				return res;	})()
		    	}]
		    });
	  //新老
		     var nold=[],noldnum=[];
		     $.each(result.isnewlist, function(i, p) {
		    	 nold[i] = p['isnew_name'];
		 	     noldnum[i] = p['num'];
		   	});
		     itemsNew.setOption({
		    		legend: {data: nold},
		    		series: [{
		             data: (function() {
						var res = [];
						var len = nold.length;
						while (len--) {
							res.push({name : nold[len],value : noldnum[len]});
						}	
					return res;	})()
			    	}]
			    });
         }
	});
}


//地域分布

  $(function(){

	$.ajax({
      url : '${pageContext.servletContext.contextPath}areaTrend',
      type : 'post',
      dataType : 'json',
      success : function(result){
          // console.info(result);
           $('#tbody_area_id').empty();
           for(var i=0;i<result.length;i++){
           var html='<tr>'
				+'<td>'+result[i]["area_name"]+'</td>'
				+'<td>'+result[i]["num"]+'</td>'
				+'<td>'+result[i]["rate"]+'%</td>'
				+'</tr>';
           $('#tbody_area_id').append(html); 
           }
        var name = [],value = [], rate = [],map = [], map1 = [];
   		$.each(result, function(i, p) {
   			name[i] = p['area_name'];
   			value[i] = p['num'];
   			rate[i] = p["rate"];
   			map[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":value[i]};
   			map1[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":rate[i]};
   		});
   		var maxNum = value[0];
        area.setOption({
        	tooltip: {
	 		 	formatter: function (params,ticket,callback){
	                var $pna = params.name;
	                var res = '';
	                for(var i = 0;i<map.length;i++){
	                    if(map[i]["name"] == $pna){
	                        res = ' '+map[i]["name"]+' <br/> 访客数: '+map[i]["value"]+' <br/>占比: '+map1[i]["value"]+'%';//设置自定义数据的模板，这里的模板是图片
	                        break;
	                    } 
	                }
	                return res;
	            }
		 	 },
		 	visualMap:{max : maxNum+ 1000},
		 	series: [{data:map}]
            });
          }
		});
	
}); 

  //渠道分析
function channelAnalyze(date){
	 ajaxlogin();
	 $.ajax({
	        url : '${pageContext.servletContext.contextPath}channelTrend',
	        data : {day : date},
	        dataType : 'JSON',
	        type : 'post',
	        success : function(result){
		        if(result.channelInfoList.length > 0){
			       //表
                   $('#channel_tbody_id').empty();
                    for(var i=0;i<result.channelInfoList.length;i++){  
	                 var html ='<tr>'
						+'<td>'+(i+1)+'</td>'
						+'<td>'+result.channelInfoList[i]["type"]+'</td>'
						+'<td>'+result.channelInfoList[i]["uv"]+'</td>'
						+'<td>'+result.channelInfoList[i]["pv"]+'</td>'
						+'<td>'+result.channelInfoList[i]["pjfwl"]+'</td>'
						+'<td>'+result.channelInfoList[i]["stoptime"]+'</td>'
						+'<td>'+result.channelInfoList[i]["tsl"]+'%</td>'
						+'</tr> ';
					 $('#channel_tbody_id').append(html);
                    }   
			    }
		        if(result.channelm.length > 0){
	               //饼图
	               var type = [],num = [];
	               $.each(result.channelm,function(i,p){
	                   type[i] = p['type'];
	                   num[i] = p['num'];
	               });
	         
	                itemsFromLink.setOption({
	   	    		series: [{
	   	            data: (function() {
		   					var res = [];
		   					var len = type.length;
		   					while (len--) {
		   						res.push({name : type[len],value : num[len]});
		   					}	
	   				    return res;})()
	   		    	}]
	               });  
		        } else {
		        	 itemsFromLink.setOption({
			   	    	series: [{data:null}]
			         });  
			    }
	           //折线图   
	           if(result.channelline.length > 0){
		           var line1 = [],line2=[],line3=[],num1=[],num2=[],num3=[],time=[];
		           var type1,type2,type3;
		           var series_data = [];
		           line1 = result.channelline[0];
		           line2 = result.channelline[1];
		           line3 = result.channelline[2];
		           $.each(line1,function(i,p){
		              num1[i] = p['num'];
		              type1 = p['type'];
		           });
		           $.each(line2,function(i,p){
		               num2[i] = p['num'];
		               time[i] = p['days'];
		               type2 = p['type'];
		            });
		           $.each(line3,function(i,p){
		               num3[i] = p['num'];
		               type3 = p['type'];
		            });
		           series_data.push({name : '搜索引擎', type:'line',smooth: true, stack: '总量', data : num1});
		           series_data.push({name : '直接访问', type:'line',smooth: true, stack: '总量', data : num2});
		           series_data.push({name : '外部链接', type:'line',smooth: true, stack: '总量', data : num3});
		           
		           itemsFromLinkViewOption.xAxis.data=time;
		           itemsFromLinkViewOption.series=series_data;
		           itemsFromLinkView.setOption(itemsFromLinkViewOption,true);
	           } else{
	        	   itemsFromLinkViewOption.xAxis.data=[];
	        	   itemsFromLinkViewOption.series=false;
	        	   itemsFromLinkView.setOption(itemsFromLinkViewOption,true);
		       } 
	          }
	        });
}
 



</script>
</html>