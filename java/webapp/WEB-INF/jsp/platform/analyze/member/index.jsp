<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>会员分析</title>
	<link href="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">

</head>
<body>

<jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=member_p"  ></jsp:include>
<div class="wrapper">
	<div class="main">
		<!-- 新增会员 -->
		<div class="overlap flow-deal">
			<div class="sys-title title-deg">
				<div class="tit-name">新增会员：</div>
				<div class="tit-setdata">
					<a class="active" href="javascript:;" onclick="funOverlap(1)">近7日</a>
					<a href="javascript:;" onclick="funOverlap(2)">近30日</a>
					<a href="javascript:;" onclick="funOverlap(3)">近6个月</a>
					<a href="javascript:;" onclick="funOverlap(4)">近1年</a>
				</div>
			</div>
			<div class="overlap-cont">
				<div class="overlap-echarts echarts-bg h390">
					<div id="member-echarts"></div>
				</div>
			</div>
		</div>

		<!-- 会员分布 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop">会员分布</div>
				<div class="member-map">
					<div class="tit">店铺数量：</div>
					<div class="changes-list">
						<a class="active" href="javascript:void(0);" onclick="mem_1('memlevel')">按等级</a>
						<a   href="javascript:void(0);" onclick="mem_1('memnewold')">按新老</a>
						<a  href="javascript:void(0);" onclick="mem_1('memage')">按年龄</a>
						<a   href="javascript:void(0);" onclick="mem_1('memsex')">按性别</a>
					</div>
				</div>
			</div>
			
			<div class="overlap-cont member" id="overlap-cont_member">
				<!-- 初始化echarts  表格 -->
			</div>
		</div>

		<!-- 会员价值 -->
		<div class="overlap flow-deal light" id="memValue">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop">会员价值</div>
				<div class="member-checkbox">
					<label for="radio-jycs">
						<input type="radio" checked="checked" value="1" name="nums" id="radio-jycs">
						<span class="icon-defalut">交易次数F(次)</span>
					</label>  
					<label for="radio-jyze">
						<input type="radio" name="nums"  id="radio-jyze" value="2">
						<span class="icon-defalut">交易总额M(元)</span>
					</label>
					<label for="radio-jypj">
						<input type="radio" name="nums" id="radio-jypj" value="3">
						<span class="icon-defalut">平均交易额M(元)</span>
					</label>
				</div>
				<div class="template-checkbox">
					<label for="radio-znmb">
						<input type="radio" checked="checked" name="template" id="radio-znmb">
						<span class="icon-defalut">智能模版</span>
					</label>
					<label for="radio-zdy">
						<input type="radio" name="template" id="radio-zdy">
						<span class="icon-defalut">自定义</span>
					</label>
				</div>
			</div>
			<c:set value="${result.rowlist[0][1]+ result.rowlist[0][2]+ result.rowlist[0][3]+ result.rowlist[0][4]}" var="a7"></c:set>
			<c:set value="${result.rowlist[1][1]+ result.rowlist[1][2]+ result.rowlist[1][3]+ result.rowlist[1][4]}" var="b7"></c:set>
			<c:set value="${result.rowlist[2][1]+ result.rowlist[2][2]+ result.rowlist[2][3]+ result.rowlist[2][4]}" var="c7"></c:set>
			<c:set value="${result.rowlist[3][1]+ result.rowlist[3][2]+ result.rowlist[3][3]+ result.rowlist[3][4]}" var="d7"></c:set>
			<c:set value="${result.rowlist[4][1]+ result.rowlist[4][2]+ result.rowlist[4][3]+ result.rowlist[4][4]}" var="e7"></c:set>
			
			
			<c:set value="${result.rowlist[0][1]+ result.rowlist[1][1]+ result.rowlist[2][1]+ result.rowlist[3][1]+ result.rowlist[4][1]}" var="a8"></c:set>
			<c:set value="${result.rowlist[0][2]+ result.rowlist[1][2]+ result.rowlist[2][2]+ result.rowlist[3][2]+ result.rowlist[4][2]}" var="b8"></c:set>
			<c:set value="${result.rowlist[0][3]+ result.rowlist[1][3]+ result.rowlist[2][3]+ result.rowlist[3][3]+ result.rowlist[4][3]}" var="c8"></c:set>
			<c:set value="${result.rowlist[0][4]+ result.rowlist[1][4]+ result.rowlist[2][4]+ result.rowlist[3][4]+ result.rowlist[4][4]}" var="d8"></c:set>
			 
			
			<div class="overlap-cont">
				<div class="table-wrap table-member">
					<table>
						<thead>
							<tr>
								<th width="14.28%">
									<div class="oblique"></div>
									<div class="recent recent-time">最近交易时间<br>R（天）</div>
									<div class="recent recent-stat">交易次数<br>F（次）</div>
								</th>
								<th width="20.28%">${result.rowlist[0][0]}</th>
								<th width="13.28%">${result.rowlist[1][0]}</th>
								<th width="13.28%">${result.rowlist[2][0]}</th>
								<th width="13.28%">${result.rowlist[3][0]}</th>
								<%-- <th width="14.28%">${result.rowlist[4]}</th> --%>
								<th>合计</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${result.columlist[0]}</td>
								<td id="a1">
								<c:choose>
									 <c:when test="${result.rowlist[0][1]!=null}">
									      ${result.rowlist[0][1]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
							   </td>
								<td id="a2">
								<c:choose>
									 <c:when test="${result.rowlist[0][2]!=null}">
									      ${result.rowlist[0][2]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								 </td>
								<td id="a3">
								<c:choose>
									 <c:when test="${result.rowlist[0][3]!=null}">
									      ${result.rowlist[0][3]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								 </td>
								<td id="a4">
								<c:choose>
									 <c:when test="${result.rowlist[0][4]!=null}">
									      ${result.rowlist[0][4]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								  </td>
								<%-- <td id="a5">${result.valueList.get("R<=2000<F<=1") }人</td> --%>
								<td id="a6"><c:choose>
								     <c:when test="${a7>0}">${a7}人<p class="scale"><fmt:formatNumber value="${a7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[1]}</td>
								<td id="b1">
								<c:choose>
									 <c:when test="${result.rowlist[1][1]!=null}">
									      ${result.rowlist[1][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose>
								</td>
								<td  id="b2">
								<c:choose>
									 <c:when test="${result.rowlist[1][2]!=null}">
									      ${result.rowlist[1][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="b3">
								<c:choose>
									 <c:when test="${result.rowlist[1][3]!=null}">
									      ${result.rowlist[1][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="b4">
								<c:choose>
									 <c:when test="${result.rowlist[1][4]!=null}">
									      ${result.rowlist[1][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="b5">${result.valueList.get("R<=2001<F<=3") }人</td> --%>
								<td id="b6"><c:choose>
								     <c:when test="${b7>0}">${b7}人<p class="scale"><fmt:formatNumber value="${b7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[2]}</td>
								<td id="c1"><c:choose>
									 <c:when test="${result.rowlist[2][1]!=null}">
									      ${result.rowlist[2][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c2"><c:choose>
									 <c:when test="${result.rowlist[2][2]!=null}">
									      ${result.rowlist[2][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c3"><c:choose>
									 <c:when test="${result.rowlist[2][3]!=null}">
									      ${result.rowlist[2][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c4"><c:choose>
									 <c:when test="${result.rowlist[2][4]!=null}">
									      ${result.rowlist[2][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="c5">${result.valueList.get("R<=2003<F<=4") }人</td> --%>
								<td id="c6"><c:choose>
								     <c:when test="${c7>0}">${c7}人<p class="scale"><fmt:formatNumber value="${c7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[3]}</td>
								<td id="d1"><c:choose>
									 <c:when test="${result.rowlist[3][1]!=null}">
									      ${result.rowlist[3][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d2"><c:choose>
									 <c:when test="${result.rowlist[3][2]!=null}">
									      ${result.rowlist[3][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d3"><c:choose>
									 <c:when test="${result.rowlist[3][3]!=null}">
									      ${result.rowlist[3][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d4"><c:choose>
									 <c:when test="${result.rowlist[3][4]!=null}">
									      ${result.rowlist[3][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="d5">${result.valueList.get("R<=2004<F<=5") }人</td> --%>
								
								<td id="d6"><c:choose>
								     <c:when test="${d7>0}">${d7}人<p class="scale"><fmt:formatNumber value="${d7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
							
								<td>${result.columlist[4]}</td>
								<td id="e1"><c:choose>
									 <c:when test="${result.rowlist[4][1]!=null}">
									      ${result.rowlist[4][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e2"><c:choose>
									 <c:when test="${result.rowlist[4][2]!=null}">
									      ${result.rowlist[4][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e3"><c:choose>
									 <c:when test="${result.rowlist[4][3]!=null}">
									      ${result.rowlist[4][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e4"><c:choose>
									 <c:when test="${result.rowlist[4][4]!=null}">
									      ${result.rowlist[4][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="e5">${result.valueList.get("R<=2005<F<=6") }人</td> --%>
								<td id="e6">
								<c:choose>
								     <c:when test="${e7>0}">${e7}人<p class="scale"><fmt:formatNumber value="${e7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose>
								</td>
							</tr>
							<tr>
								<td>列合计</td>
								<td  >
									 <c:choose>
									     <c:when test="${a8>0}">${a8}人<p class="scale"><fmt:formatNumber value="${a8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td>
								<td  >
									 <c:choose>
									     <c:when test="${b8>0}">${b8}人<p class="scale"><fmt:formatNumber value="${b8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><td  >
									 <c:choose>
									     <c:when test="${c8>0}">${c8}人<p class="scale"><fmt:formatNumber value="${c8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><td  >
									 <c:choose>
									     <c:when test="${d8>0}">${d8}人<p class="scale"><fmt:formatNumber value="${d8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><!-- 	<td id="f5">111人<p class="scale">20%</p></td> -->
								<td  >${ result.valueList.allpaycusts }人<p class="scale">100%</p><input type="hidden" value="${result.valueList.allpaycusts}" id="allpaycusts"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="user-stat">
					<label for="radio-hyyh">
						<input type="radio" name="users" id="radio-hyyh">
						<span class="icon-defalut">活跃用户</span>
					</label>
					<label for="radio-cmyh">
						<input type="radio" name="users" id="radio-cmyh">
						<span class="icon-defalut">沉默用户</span>
					</label>
					<label for="radio-lsyh">
						<input type="radio" name="users" id="radio-lsyh">
						<span class="icon-defalut">流失用户</span>
					</label>
					 
					 <input onclick="down()" type="button" value="导出" class="btn"> 
				</div>
			</div>
		</div>

		<!-- 会员画像 -->
		<div class="overlap flow-deal light">
			<div class="sys-title title-deg">
				<div class="tit-name icon-shop">会员画像</div>
			</div>
			<div class="overlap-cont">
				<div class="member-pic-change">
					<div class="member-pic">
						<div class="name">性&#12288;&#12288;别：</div>
						<div class="changes-list" data-type="sex">
							<a class="active" href="javascript:;">全部</a>
							<a href="javascript:;">男</a>
							<a href="javascript:;">女</a>
						</div>
					</div>
					<div class="member-pic">
						<div class="name">年&#12288;&#12288;龄：</div>
							<div class="changes-list" data-type="age">
							<a class="active" href="javascript:;">全部</a>
							<a href="javascript:;">19岁及以下</a>
							<a href="javascript:;">20-29岁</a>
							<a href="javascript:;">30-39岁</a>
							<a href="javascript:;">40-49岁</a>
							<a href="javascript:;">50岁及以上</a>
						</div>
					</div>
					<div class="member-pic">
						<div class="name">会员等级：</div>
						<div class="changes-list" data-type="level">
							<a class="active" href="javascript:;">全部</a>
							<a href="javascript:;">普通会员</a>
							<a href="javascript:;">VIP会员</a>
							<a href="javascript:;">高级会员</a>
							<a href="javascript:;">至尊会员</a>
						</div>
					</div>
					<div class="member-pic">
						<div class="name">消费能力：</div>
						<div class="changes-list" data-type="power">
							<a class="active" href="javascript:;">全部</a>
							<a href="javascript:;">偏低</a>
							<a href="javascript:;">低</a>
							<a href="javascript:;">中等</a>
							<a href="javascript:;">偏高</a>
							<a href="javascript:;">高</a>
						</div>
					</div>
					<div class="member-pic">
						<div class="name">地&#12288;&#12288;域：</div>
						<div class="changes-list changes-area" data-type="area">
							<a class="active" href="javascript:;">全部</a>
							<a href="javascript:;">北京市</a>
							<a href="javascript:;">上海市</a>
							<a href="javascript:;">天津市</a>
							<a href="javascript:;">河北省</a>
							<a href="javascript:;">山西省</a>
							<a href="javascript:;">辽宁省</a>
							<a href="javascript:;">吉林省</a>
							<a href="javascript:;">江苏省</a>
							<a href="javascript:;">浙江省</a>
							<a href="javascript:;">安徽省</a>
							<a href="javascript:;">福建省</a>
							<a href="javascript:;">江西省</a>
							<a href="javascript:;">山东省</a>
							<a href="javascript:;">河南省</a>
							<a href="javascript:;">湖北省</a>
							<a href="javascript:;">湖南省</a>
							<a href="javascript:;">广东省</a>
							<a href="javascript:;">海南省</a>
							<a href="javascript:;">四川省</a>
							<a href="javascript:;">重庆市</a>
							<a href="javascript:;">贵州省</a>
							<a href="javascript:;">云南省</a>
							<a href="javascript:;">陕西省</a>
							<a href="javascript:;">甘肃省</a>
							<a href="javascript:;">青海省</a>
							<a href="javascript:;">台湾省</a>
							<a href="javascript:;">黑龙江</a>
							<a href="javascript:;">广西</a>
							<a href="javascript:;">西藏</a>
							<a href="javascript:;">内蒙</a>
							<a href="javascript:;">新疆</a>
							<a href="javascript:;">宁夏</a>
							<a href="javascript:;">香港</a>
							<a href="javascript:;">澳门</a>
							
						</div>
					</div>
				</div>

				<div class="member-pic-scale">
					<div class="desc">您已选择标签 (最多选5个)</div>
					<div class="label" id="label">
					</div>
				</div>

				<div class="member-round-view">
					<div class="member-round-data">
						<div class="tit">具有所选标签人数：</div>
						<div class="member-round-pic" id="member-round-pic-id" data-scale=""></div>
					</div>
					<div class="member-round-data">
						<div class="tit">占平台总人群比例：</div>
						<div id="data-scale" class="member-round-pic">					
				            <div class="member-mask member-mask-l"></div>
				            <div class="member-mask member-mask-r"></div>
						</div>
					</div>
				</div>
				
				<div class="member-table">
					<div class="table-wrap">
						<table>
							<thead>
								<tr>
									<th width="10.7%">序号</th>
									<th width="14.9%">用户ID</th>
									<th width="10%">性别</th>
									<th width="12%">年龄段</th>
									<th width="14.4%">地域</th>
									<th width="12.6%">会员等级</th>
									<th width="12.4%">消费能力</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="huaxiang_id">
								<!-- 列表 -->
							</tbody>
						</table>
					</div>
					<div class="m-pages" id="page">
						<!-- 分页 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="layer-member" id="huaxiang_data_id">
	<div class="m-mask"></div>
	<div class="layer-member-bg"></div>
	<div class="feature feature-l feature-b feature-sex"><span>性别</span></div>
	<div class="feature feature-l feature-b feature-age"><span>年龄</span></div>
	<div class="feature feature-l feature-b feature-education"><span>教育程度</span></div>
	<div class="feature feature-l feature-b feature-constellation"><span>星座</span></div>

	<div class="feature feature-l feature-t feature-waist"><span>腰围</span></div>
	<div class="feature feature-l feature-t feature-house"><span>是否有房</span></div>
	<div class="feature feature-l feature-t feature-buy-peo"><span>所属购买群体</span></div>

	<div class="feature feature-r feature-b feature-marry"><span>婚否</span></div>
	<div class="feature feature-r feature-b feature-income"><span>收入</span></div>
	<div class="feature feature-r feature-b feature-active"><span>活跃程度</span></div>
	<div class="feature feature-r feature-b feature-buy-type"><span>购物类型</span></div>

	<div class="feature feature-r feature-t feature-color"><span>颜色偏好</span></div>
	<div class="feature feature-r feature-t feature-buy-power"><span>购买力</span></div>
	<div class="feature feature-r feature-t feature-buy-loyalty"><span>购物忠诚度</span></div>
</div>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/echarts.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/js/plugins/select.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/member.js">
</script> 
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/myPagination/mricode.pagination.js">
</script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/area.js">
</script> 
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/ajaxlogin.js">
</script>
</body>

<script type="text/javascript">
    //一打开就  加载
	$(function(){
		 mem_1("memlevel");
		 funOverlap(1);  //新增会员
	});
	
    //新增会员
    function funOverlap(date){
    	ajaxlogin();
    	var time3=[],times3 =[],value3=[];
	   	 $.ajax({
	   		url:"${pageContext.servletContext.contextPath}newMember",
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

  
    //会员分布  等级 年龄 性别 新老
    function mem_1(o){
    	ajaxlogin();
    	 $.ajax({
  	   		url:"${pageContext.servletContext.contextPath}"+o,
  	   		type:"post",
  	   		//dataType:"json",
  	   		success:function(data){
  	   		  $("#overlap-cont_member").html(data);
  	   		}
  	   	}); 
    }


 
    $('.member-pic-change').on('click','.member-pic',function(){   
    	ajaxlogin(); 
    	var sexs = $("span[data-type='sex']").html();
 		var ages = $("span[data-type='age']").html();
 		var powers = $("span[data-type='power']").html();
 		var levels = $("span[data-type='level']").html();
 		var areas = $("span[data-type='area']").html();
 	
 	 	var area_name = getAreaRealName(areas);
   	   	var param = {sex:sexs,age:ages,consume:powers,level:levels,area:area_name};
    	if($("#page").pagination()!=false){
	    	$("#page").pagination('destroy');
	 	}
	    if($("#page").pagination()==false){
            //初始化
	    	$("#page").pagination({
	           showInfo: true,
	           showJump: true,
	           showPageSizes: true,
	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
	           remote: {
	              url: '${pageContext.servletContext.contextPath}huaxiang',
	              params: param,
	              success: function (data) {
	            	  var num = data.memNumList[0]['num'];
	     	   		  var rate = data.memNumList[0]['rate'];
	     	   		  setOStyle(num, rate);
	               	$('#huaxiang_id').empty();
	               //	console.info(data.huaxiangList);
	               	 var i = 0;
	               	  for(i;i<data.huaxiangList.length;i++){
		               	  var sex_name = data.huaxiangList[i][1];
		               	  var area_name = data.huaxiangList[i][3];
			               	   if(sex_name == null){
			               		   sex_name = '未知';
					           }
					           if(area_name == null){
					        	   area_name = '未知';
						       }
	               		var html='<tr>'
							+'<td>' + ((parseInt(data.page) - 1)*(data.pageSize) + i +1) +'</td>'
							+'<td title="'+data.huaxiangList[i][0] +'">'+data.huaxiangList[i][0] +'</td>'
							+'<td>'+sex_name +'</td>'
							+'<td>'+data.huaxiangList[i][2] +'</td>'
							+'<td>'+area_name +'</td>'
							+'<td>'+data.huaxiangList[i][4] +'</td>'
							+'<td>'+data.huaxiangList[i][4] +'</td>'
							+'<td><a href="javascript:;" data-type="man" onclick="lookHuaXiangd(\''+data.huaxiangList[i][0]+'\')">查看画像</a></td>'
							+'</tr>';						
						$("#huaxiang_id").append(html); 
				            } 
			              }
			          }
			      });
	 	      }
    });
     
   //初始化加载 会员画像(分页)
   $(function(){
	   	$("#page").pagination({
	           showInfo: true,
	           showJump: true,
	           showPageSizes: true,
	           infoFormat: '{start} ~ {end} 条，共 {total} 条记录',
	           remote: {
	               url: '${pageContext.servletContext.contextPath}huaxiang',
	               success: function (data) {
            	   var num = data.memNumList[0]['num'];
     	   		   var rate = data.memNumList[0]['rate'];
     	   		   
     	   		   setOStyle(num, rate);
	                 $('#huaxiang_id').empty();
	               	 var i = 0;
	               	  for(i;i<data.huaxiangList.length;i++){
	               		  var sex_name = data.huaxiangList[i][1];
		               	  var area_name = data.huaxiangList[i][3];
			               	   if(sex_name == null){
			               		   sex_name = '未知';
					           }
					           if(area_name == null){
					        	   area_name = '未知';
						       }
							var html='<tr>'
								+'<td>' + ((parseInt(data.page) - 1)*(data.pageSize) + i +1) +'</td>'
								+'<td title="'+data.huaxiangList[i][0] +'">'+data.huaxiangList[i][0] +'</td>'
								+'<td>'+sex_name +'</td>'
								+'<td>'+data.huaxiangList[i][2] +'</td>'
								+'<td>'+area_name +'</td>'
								+'<td>'+data.huaxiangList[i][4] +'</td>'
								+'<td>'+data.huaxiangList[i][4] +'</td>'
								+'<td><a href="javascript:;" data-type="man" onclick="lookHuaXiangd(\''+data.huaxiangList[i][0]+'\')">查看画像</a></td>'
								+'</tr>';
							$("#huaxiang_id").append(html); 
				            } 
			              }
			          }
			      });
	   	
	   	     
		   	$("#radio-jycs").on("click",function(e){
		   		  ajaxlogin();
		   		  $.post("${pageContext.servletContext.contextPath}/platform/analyze/member/memValue",{vm:"1"},function(data){
		   			  $(".table-member").html(data);
		   			  
		   		  });
		   		
		   		
		   	});
			$("#radio-jyze").on("click",function(e){
				ajaxlogin();	
				$.post("${pageContext.servletContext.contextPath}/platform/analyze/member/memValue",{vm:"2"},function(data){
		   			  $(".table-member").html(data);
		   			  
		   		  });	
				   		
				   	});
			$("#radio-jypj").on("click",function(e){
				ajaxlogin();	
				$.post("${pageContext.servletContext.contextPath}/platform/analyze/member/memValue",{vm:"3"},function(data){
		   			  $(".table-member").html(data);
		   			  
		   		  });
					
				});
	   	
			  });   

  //查看画像
   function lookHuaXiangd(huaxiang_id){
	   ajaxlogin();
	   $.ajax({
		   url:'${pageContext.servletContext.contextPath}viewPortrait',
		   data:{id : huaxiang_id},
		   dataType:'json',
		   type:'post',
		   success : function(data){
           var sex = data[0]["sex_name"];
           if(sex == null){
               sex = '未知';
           }
           var area = data[0]["province_name"];
           if(area == null){
              area = '未知';
           }
           var mine_name = data[0]["real_name"];
           if(mine_name == null){
        	   mine_name = '未知';
           }
           $('.feature-sex').html("性别 : "+ sex);
           $('.feature-age').html("年龄 : "+ data[0]["age"]);
           
           $('.feature-education').html("总消费 : "+ data[0]["summoney"]);
           $('.feature-constellation').html("地域 : "+ area);
           $('.feature-waist').html("家庭人数 : "+ data[0]["fa_count"]);
           $('.feature-house').html("登录次数: "+ data[0]["login_count"]);
           $('.feature-buy-peo').html("姓名 : "+ mine_name);
           
		   }
	   });
   }
    
   function down(){
	   window.location.href='${pageContext.servletContext.contextPath}/platform/analyze/member/down?mvalue='+$("input[name='nums']:checked").val();
   }
</script>
</html>
