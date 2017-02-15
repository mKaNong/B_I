<!-- 运营分析 - 流量构成  -->
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
<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=overview_p"  ></jsp:include>
<div class="member-nav">
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/overview/index" >运营概况</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/custFlow/index" class="current">流量构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/tradeForm/index" class="">交易构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/index" class="">搜索词分析</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/product/index" class="">商品分析</a>
</div>
<div class="wrapper">
	<div class="main">
		<!-- 访客分部 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name">访客分布</div>
				<div class="tit-setdata">
					<a class="active" href="javascript:void(0);" onclick="payCusts(1)">昨日</a>
					<a href="javascript:void(0);" onclick="payCusts(2)">近7日</a>
					<a href="javascript:void(0);" onclick="payCusts(3)">近30日</a>
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
					<a class="active" href="javascript:;" onclick="channelAnalyzed(1)">昨日</a>
					<a href="javascript:;" onclick="channelAnalyzed(2)">近7日</a>
					<a href="javascript:;" onclick="channelAnalyzed(3)">近30日</a>
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
							<tbody>
								<c:forEach items="${qudaoinfo }" var="list" varStatus="index">
									<tr>
										<td>${index.index+1 }</td>
										<td>${list.type }</td>
										<td>${list.uv }</td>
										<td>${list.pv }</td>
										<td>${list.pjfwl }</td>
										<td>${list.stoptime }</td>
										<td>${list.tsl }%</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="sys-title">
						<div class="tit-name">点击数：</div>
						<div class="tit-date">
							<input id="_sDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $s = $('#_eDate');WdatePicker({minDate:'1990-1-1',maxDate:$s.val()||_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})">
							<span>到</span>
							<input id="_eDate" type="text" class="tit-date-input" placeholder="日期" onfocus="var _d = new Date(), $e = $('#_sDate');WdatePicker({minDate:$e.val(),maxDate:_d.getFullYear()+'-'+(_d.getMonth()+1)+'-'+_d.getDate()})" >
							<input type="button" value="确定" class="tit-date-button" onclick="click_channel()">
						</div>
						<div class="tit-setdata">
							<a class="active" href="javascript:;" onclick="channel_date()">全部</a>
							<a href="javascript:;" onclick="channel_date(1)">昨日</a>
							<a href="javascript:;" onclick="channel_date(2)">近7日</a>
							<a href="javascript:;" onclick="channel_date(3)">近30日</a>
						</div>
						<div class="tit-select-wrap">
							<div class="tit-select">
								<div class="tit-select-name">全部一级频道</div>
								<div class="tit-select-option">
								     <div>全部一级频道</div>
									<c:forEach items="${channelList }" var="list">
									   <div>${list['first_chan_name'] }</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="table-wrap deg">
						<table>
							<thead>
								<tr>
									<th width="12%">排名</th>
									<th width="15%">二级频道</th>
									<th>点击次数</th>
								</tr>
							</thead>
							<tbody id="tbody_click_id">
								<!-- table -->
							</tbody>
						</table>
					</div>
					<div class="m-pages" id="page_cust">
						<!-- 分页 -->
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
<script src="${pageContext.servletContext.contextPath}/static/js/operate-flow.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>

<script type="text/javascript">
$(function(){
	 payCusts(1);
	 channelAnalyzed(1);
});

$(function(){
	$.ajax({
	       url :'${pageContext.servletContext.contextPath}area' ,
	       type : 'post' ,
	       dataType : 'json',
	       success : function(result){
	    	  // var data = eval("(" + result + ")");
             
            var name = [],value = [], rate = [],map = [], map1 = [];
       		$.each(result, function(i, p) {
       			name[i] = p['area_name'];
       			value[i] = p['num'];
       			rate[i] = p["rate"];
       			map[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":value[i]};
       			map1[i]={"name":name[i].replace("省", "").replace("市", "").replace("自治区", ""),"value":rate[i]};
       		});


       	  $('#tbody_area_id').empty();
          for(var i=0;i<result.length;i++){
              var html='<tr>'
					+'<td>'+result[i]["area_name"]+'</td>'
					+'<td>'+result[i]["num"]+'</td>'
					+'<td>'+result[i]["rate"]+'%</td>'
					+'</tr>';
              $('#tbody_area_id').append(html); 
          }
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
			 	 visualMap:{max:maxNum + 1000},
			 	 series: [{data:map}]
            });
		}
	});
});

function payCusts(date){
	ajaxlogin();
	$.ajax({
       url :'${pageContext.servletContext.contextPath}payCusts' ,
       data:{day : date},
       dataType : 'json',
       type : 'post' ,
       success : function(result){
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
/* 渠道  饼图 折线图 */
 function channelAnalyzed(day){
	ajaxlogin();
     $.ajax({
        url : '${pageContext.servletContext.contextPath}channel',
        data : {day : day},
        dataType : 'JSON',
        type : 'post',
        success : function(result){
            if(result.channelm.length > 0){
               //饼图
               var type = [],num = [];
               $.each(result.channelm,function(i,p){
                   type[i] = p['type'];
                   num[i] = p['num'];
               });
               itemsFromLink.setOption({
            	  // legend: {data: type},
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
            }else {
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

/* 点击 */
function channel_date(dates){
    
	click_channel(dates);	
}


function click_channel(dates){
	ajaxlogin();
	 
    var start = $('#_sDate').val();
    var end = $('#_eDate').val();
    var channel_name = $('.tit-select-name').html();
    if(channel_name == '全部一级频道'){
    	channel_name = null;
    }
    if(dates == undefined){
         dates = "";
    }
    var json1 = {day : dates, s : start, e : end, channelId :channel_name};
  
       if($("#page_cust").pagination()!=false){
	    	$("#page_cust").pagination('destroy');
	 	}
	    if($("#page_cust").pagination()==false){
         //初始化
	    	$("#page_cust").pagination({
	           showInfo: true,
	           showJump: true,
	           showPageSizes: true,
	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
	           remote: {
	              url: '${pageContext.servletContext.contextPath}clicks',
	              params: json1,
	              success: function (data) {
	            	 	$('#tbody_click_id').empty();
	                    for(var i = 0;i<data.rows.length;i++){
	  						var html='<tr>'
	  							+'<td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
	  							+'<td>'+data.rows[i]["second_chan_name"]+'</td>'
	  							+'<td class="scale">'+data.rows[i]["pv"]+''
	  							+'<div class="scale-bg scale-first"><div style ="width:'+((data.rows[i]["pv"])*100/data.rows[0]["pv"]).toFixed(2)+'%"></div></div>'
	  							+'</td>'
	  							+' </tr>';
	  							$("#tbody_click_id").append(html); 
	  			            } 
			              }
			          }
			      });
	 	      }
          }


oS.setData = function(){
	  if(oS.index ==0){
		  ajaxlogin();
	     click_channel();   //排名
	  }
 }

$(function(){
   	$("#page_cust").pagination({
           showInfo: true,
           showJump: true,
           showPageSizes: true,
           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
           remote: {
               url: '${pageContext.servletContext.contextPath}clicks',
               success: function (data) {
               	$('#tbody_click_id').empty();
               	  for(var i = 0;i<data.rows.length;i++){
						var html='<tr>'
							+'<td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
							+'<td>'+data.rows[i]["second_chan_name"]+'</td>'
							+'<td class="scale">'+data.rows[i]["pv"]+''
							+'<div class="scale-bg scale-first"><div style ="width:'+((data.rows[i]["pv"])*100/data.rows[0]["pv"]).toFixed(2)+'%"></div></div>'
							+'</td>'
							+' </tr>';
							$("#tbody_click_id").append(html); 
			            }  
		              }
		          }
		      });
		  }); 

</script>
</html>