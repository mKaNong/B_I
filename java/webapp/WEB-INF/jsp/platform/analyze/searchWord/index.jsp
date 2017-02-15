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
        <!-- 搜索词 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg">
                <div class="tit-name">搜索词</div>

            </div>
            <div class="overlap-cont">
                <div class="operate-sea-cont">
                    <div class="operate-sea-list">
                        <div class="side" >
                            <div class="tit">日搜索排行榜</div>
                            <div class="scale-wrap" id="day_word_id">
                                <%--  <div class="scale-item first">
                                    <div data-rank="上升${result.nowDayList[0][3]}位">
                                        <p title="${result.nowDayList[0][1]}">${result.nowDayList[0][1]}</p>
                                        <p>${result.nowDayList[0][2]}</p>
                                    </div>
                                </div>
                                <div class="scale-item second">
                                    <div data-rank="上升${result.nowDayList[1][3]}位">
                                        <p title="${result.nowDayList[1][1]}">${result.nowDayList[1][1]}</p>
                                        <p>${result.nowDayList[1][2]}</p>
                                    </div>
                                </div>
                                <div class="scale-item third">
                                    <div data-rank="上升${result.nowDayList[2][3]}位">
                                        <p title="${result.nowDayList[2][1]}">${result.nowDayList[2][1]}</p>
                                        <p>${result.nowDayList[2][2]}</p>
                                    </div>
                                </div> --%>
                              
                            </div>
                        </div>
                        <div class="cont">
                            <div class="cont-link"><a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/daySearch">完整排行</a></div>
                            <div class="table-wrap ">
                                <table>
                                    <thead>
                                        <tr>
                                            <th width="10.5%">排名</th>
                                            <th width="15.5%">搜索词</th>
                                            <th>点击次数</th>
                                            <th width="20%">升降位次</th>
                                        </tr>
                                    </thead>
                                    <tbody id="day_tbody_word_id">
                                        <%-- <tr>
                                            <td>1</td>
                                            <td title="${result.nowDayList[0][1]}">${result.nowDayList[0][1]}</td>
                                            <td class="scale">${result.nowDayList[0][2]}
                                                <div class="scale-bg scale-first"><div></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td title="${result.nowDayList[1][1]}">${result.nowDayList[1][1]}</td>
                                            <td class="scale">${result.nowDayList[1][2]}
                                                <div class="scale-bg scale-second"><div style="width:67%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td title="${result.nowDayList[2][1]}">${result.nowDayList[2][1]}</td>
                                            <td class="scale">${result.nowDayList[2][2]}
                                                <div class="scale-bg scale-third"><div style="width:37%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt=""></td>
                                        </tr> --%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="operate-sea-list">
                        <div class="side">
                            <div class="tit">周搜索排行榜</div>
                            <div class="scale-wrap" id="week_word_id">
                               <%--  <div class="scale-item first">
                                    <div data-rank="上升${result.weekDayList[0][2]}位">
                                        <p title="${result.weekDayList[0][0]}">${result.weekDayList[0][0]}</p>
                                        <p>${result.weekDayList[0][1]}</p>
                                    </div>
                                </div>
                                <div class="scale-item second">
                                    <div data-rank="上升${result.weekDayList[1][2]}位">
                                        <p title="${result.weekDayList[1][0]}">${result.weekDayList[1][0]}</p>
                                        <p>${result.weekDayList[1][1]}</p>
                                    </div>
                                </div>
                                <div class="scale-item third">
                                    <div data-rank="上升${result.weekDayList[2][2]}位">
                                        <p title="${result.weekDayList[2][0]}">${result.weekDayList[2][0]}</p>
                                        <p>${result.weekDayList[2][1]}</p>
                                    </div>
                                </div> --%>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="cont-link"><a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/weekSearch">完整排行</a></div>
                            <div class="table-wrap ">
                                <table>
                                    <thead>
                                        <tr>
                                            <th width="10.5%">排名</th>
                                            <th width="15.5%">搜索词</th>
                                            <th>点击次数</th>
                                            <th width="20%">升降位次</th>
                                        </tr>
                                    </thead>
                                    <tbody id="week_search_word_id">
                                      <%--   <tr>
                                            <td>1</td>
                                            <td title="${result.weekDayList[0][0]}">${result.weekDayList[0][0]}</td>
                                            <td class="scale">${result.weekDayList[0][1]}
                                                <div class="scale-bg scale-first"><div></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td title="${result.weekDayList[1][0]}">${result.weekDayList[1][0]}</td>
                                            <td class="scale">${result.weekDayList[1][1]}
                                                <div class="scale-bg scale-second"><div style="width:67%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td title="${result.weekDayList[2][0]}">${result.weekDayList[2][0]}</td>
                                            <td class="scale">${result.weekDayList[2][1]}
                                                <div class="scale-bg scale-third"><div style="width:37%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt=""></td>
                                        </tr> --%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="operate-sea-list">
                        <div class="side">
                            <div class="tit">月搜索排行榜</div>
                            <div class="scale-wrap" id="month_word_id">
                               <%--  <div class="scale-item first">
                                    <div data-rank="上升${result.monthDayList[0][2]}位">
                                        <p title="${result.monthDayList[0][0]}">${result.monthDayList[0][0]}</p>
                                        <p>${result.monthDayList[0][1]}</p>
                                    </div>
                                </div>
                                <div class="scale-item second">
                                    <div data-rank="上升${result.monthDayList[1][2]}位">
                                        <p title="${result.monthDayList[1][0]}">${result.monthDayList[1][0]}</p>
                                        <p>${result.monthDayList[1][1]}</p>
                                    </div>
                                </div>
                                <div class="scale-item third">
                                    <div data-rank="上升${result.monthDayList[2][2]}位">
                                        <p title="${result.monthDayList[2][0]}">${result.monthDayList[2][0]}</p>
                                        <p>${result.monthDayList[2][1]}</p>
                                    </div>
                                </div> --%>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="cont-link"><a href="${pageContext.servletContext.contextPath}/platform/analyze/searchWord/monthSearch">完整排行</a></div>
                            <div class="table-wrap ">
                                <table>
                                    <thead>
                                        <tr>
                                            <th width="10.5%">排名</th>
                                            <th width="15.5%">搜索词</th>
                                            <th>点击次数</th>
                                            <th width="20%">升降位次</th>
                                        </tr>
                                    </thead>
                                    <tbody id="month_search_word_id">
                                       <%--  <tr>
                                            <td>1</td>
                                            <td title="${result.monthDayList[0][0]}">${result.monthDayList[0][0]}</td>
                                            <td class="scale">${result.monthDayList[0][1]}
                                                <div class="scale-bg scale-first"><div></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td title="${result.monthDayList[1][0]}">${result.monthDayList[1][0]}</td>
                                            <td class="scale">${result.monthDayList[1][1]}
                                                <div class="scale-bg scale-second"><div style="width:67%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td title="${result.monthDayList[2][0]}">${result.monthDayList[2][0]}</td>
                                            <td class="scale">${result.monthDayList[2][1]}
                                                <div class="scale-bg scale-third"><div style="width:37%"></div></div>
                                            </td>
                                            <td>10%<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt=""></td>
                                        </tr> --%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 按类目 -->
        <div class="overlap flow-deal light">
            <div class="sys-title title-deg operate-min">
                <div class="tit-name">按类目</div>
             
                <div class="tit-setdata min">
                   <!--  <a href="javascript:;">全部</a> -->
                    <a class="active" href="javascript:;" onclick="funOrderCateg(1)">昨日</a>
                    <a  href="javascript:;" onclick="funOrderCateg(2)">近7日</a>
                    <a href="javascript:;" onclick="funOrderCateg(3)">近30日</a>
                </div>
               
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
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/date/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>

<script type="text/javascript">
  $(function(){
	 $.ajax({
       url : '${pageContext.servletContext.contextPath}load',
       type : 'post',
       success : function(result){
    	  result = eval("(" + result + ")");
          // console.info( result.nowDayList);
          
          if(result.nowDayList.length > 0){
        	     //柱图
        	     var html = createHtml(result.nowDayList); 
                 $('#day_word_id').append(html);
                 //表格
                 var html1 = createTable(result.nowDayList);
                 $('#day_tbody_word_id').append(html1);
          }
         if(result.weekDayList.length > 0){
        	 var html = createHtml(result.weekDayList);
             $('#week_word_id').append(html);
             var html2 = createTable(result.weekDayList);
             $('#week_search_word_id').append(html2);
         }
         if(result.monthDayList.length > 0){
        	 var html = createHtml(result.monthDayList);
             $('#month_word_id').append(html);
             var html3 = createTable(result.monthDayList);
             $('#month_search_word_id').append(html3);
         }
     
        }
	});
  }); 

function createTable(arrays2){

  	  var flag; var option;var html = '';
	for(var i=0;i<arrays2.length;i++){
  	  var levels = arrays2[i][2];
  	  
  	     if(levels > 0){
  		   option = '<td>'+levels+'<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>';
         }
         if(levels < 0){
      	   option = '<td>'+Math.abs(levels)+'<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt=""></td>';
         }
         if(levels == 0 || levels == null){
      	   option = '<td>0<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt=""></td>';
         }
         if(i == 0){
      	   flag = '<div class="scale-bg scale-first"><div></div></div>';
         }else if(i==1){
      	   flag = '<div class="scale-bg scale-second"><div style="width:67%"></div></div>';
         }else {
      	   flag = '<div class="scale-bg scale-third"><div style="width:37%"></div></div>';
         }
	  html= html + ' <tr>'
		   +'<td>'+(i+1)+'</td>'
		   +'<td title="'+arrays2[i][0]+'">'+arrays2[i][0]+'</td>'
		   +' <td class="scale">'+arrays2[i][1]+''
		   +flag
		   +' </td>'
		   +option
		   +'</tr>';
	   }
  return html;
}
  
function createHtml(arrays1){

	  var flag; var option; var html= '';
      for(var i=0;i<arrays1.length;i++){
         var levels = arrays1[i][2];
         if(levels > 0){
            flag = "<div data-rank='上升"+levels+"位'>";
         }
         if(levels < 0){
        	 flag = "<div data-rank='下降"+Math.abs(levels)+"位'>";
         }
         if(levels == 0 || levels == null){
        	 flag = "<div data-rank='—'>";
         }
         if(i == 0){
        	 option = '<div class="scale-item first">';
         }else if(i==1){
        	 option = '<div class="scale-item second">';
         }else {
        	 option = '<div class="scale-item third">';
         }
         html = html + option + flag
         +' <p title="'+arrays1[i][0]+'">'+arrays1[i][0]+'</p>'
         +' <p>'+arrays1[i][1]+'</p>'
         +'</div>'
         +'</div>';
      }
         return html;
}

  
function funOrderCateg(date){
	ajaxlogin();
	var param = {day : date};
	if($("#page").pagination() != false){
		$("#page").pagination('destroy');
    }
    if($("#page").pagination() == false){

        //初始化
    	$("#page").pagination({
           showInfo: true,
           showJump: true,
           showPageSizes: true,
           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
           remote: {
              url: '${pageContext.servletContext.contextPath}searchOrder',
              params: param,
              success: function (data) {
                	$('#tbody_id').empty();
  		            for(var i=0;i<data.rows.length;i++){
  			            var flag; var flags;
  			            if(data.rows[i]["levels"] == 0 || data.rows[i]["levels"] == null){
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
    }
}


   $(function(){
	 	$("#page").pagination({
	           showInfo: true,
	           showJump: true,
	           showPageSizes: true,
	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
	           remote: {
	               url: '${pageContext.servletContext.contextPath}searchOrder',
	               success: function (data) {
	                  	$('#tbody_id').empty();
				            for(var i=0;i<data.rows.length;i++){
					            var flag; var flags;
					            if(data.rows[i]["up_dwom"] == 0){
					            	flag = "-";
						        }
						        if(data.rows[i]["up_dwom"] > 0){
	                                flag = data.rows[i]["up_dwom"]+'<img src="${pageContext.servletContext.contextPath}/static/images/common/up.png" alt="">';
							    }
					            if(data.rows[i]["up_dwom"] < 0){
					            	flag = Math.abs(data.rows[i]["up_dwom"])+'<img src="${pageContext.servletContext.contextPath}/static/images/common/down.png" alt="">';
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