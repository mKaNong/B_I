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
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/custFlow/index" class="">流量构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/tradeForm/index" class="">交易构成</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/index" class="current">搜索词分析</a>
	<a href="${pageContext.servletContext.contextPath}/platform/analyze/product/index" class="">商品分析</a>
</div>
<div class="wrapper">
    <div class="main">
        <!-- 按类目 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg operate-min">
                <div class="tit-name">周搜索排行榜</div>
            </div>
            <div class="overlap-cont table-pd">
                <div class="table-wrap">
                    <table>
                        <thead>
                            <tr>
                                <th width="12%">排名</th>
                                <th width="17.5%">搜索词</th>
                                <th>点击次数</th>
                                <th width="17%">升降位次</th>
                            </tr>
                        </thead>
                        <tbody id="tbody_id">
                          
                        </tbody>
                    </table>
                </div>
                <div class="m-pages" id="page">
                   
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/date/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
</body>
<script type="text/javascript">

$(function(){
	$("#page").pagination({
       showInfo: true,
       showJump: true,
       showPageSizes: true,
       infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
       remote: {
           url: '${pageContext.servletContext.contextPath}weekSearchWord',
           success: function (data) {
              	$('#tbody_id').empty();
		            for(var i=0;i<data.rows.length;i++){
			            var flag; var flags;
			            if(data.rows[i]["levels"] == 0){
			            	flag = "-";
				        }
				        if(data.rows[i]["levels"] > 0){
                            flag = data.rows[i]["levels"]+'<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">';
					    }
			            if(data.rows[i]["levels"] < 0){
			            	flag = Math.abs(data.rows[i]["levels"])+'<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">';
				        }
				        if(i == 0){
                            flags = '<div class="scale-bg scale-first"><div>';
					    }
					     if(i == 1){
					    	 flags = '<div class="scale-bg scale-second"><div style="width:80%">';
						}
					     if(i == 2){
					    	 flags = '<div class="scale-bg scale-third"><div style="width:75%">';
						}
					     if(i == 3){
					    	 flags = '<div class="scale-bg scale-fourth"><div style="width:70%">';
						}
					     if(i == 4){
					    	 flags = ' <div class="scale-bg scale-fifth"><div style="width:65%">';
						}
					     if(i == 5){
					    	 flags = '<div class="scale-bg scale-first"><div style="width:60%">';
						}
					     if(i == 6){
					    	 flags = '<div class="scale-bg scale-second"><div style="width:55%">';
						}
					     if(i == 7){
					    	 flags = '<div class="scale-bg scale-third"><div style="width:50%">';
						}
					     if(i == 8){
					    	 flags = '<div class="scale-bg scale-fourth"><div style="width:45%">';
						}
					     if(i == 9){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:40%">';
						}
					     if(i == 10){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:35%">';
						}
					     if(i == 11){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:30%">';
						}
					     if(i == 12){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:27%">';
						}
					     if(i == 13){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:23%">';
						}
					     if(i == 14){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:20%">';
						}
					     if(i == 15){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:17%">';
						}
					     if(i == 16){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:14%">';
						}
					     if(i == 17){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:11%">';
						}
					     if(i == 18){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:8%">';
						}
					     if(i == 19){
					    	 flags = '<div class="scale-bg scale-fifth"><div style="width:5%">';
						}
					   
		            var html='<tr>'
		            	+'<td>' + ((parseInt(data.pageNo) - 1)*(data.pageSize) + i +1) +'</td>'
		            	+'<td title="'+data.rows[i]["name"]+'">'+data.rows[i]["name"]+'</td>'
		            	+'<td class="scale">'+data.rows[i]["num"]+''
		            	+' '+flags+'</div></div>'
		            	+'</td>'
		            	+'<td>'+flag+'</td>'
		            	+' </tr>';
		            $('#tbody_id').append(html);
		            }
	              }
	          }
	      });
	  }); 
</script>
</html>