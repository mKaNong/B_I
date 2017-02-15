<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	      <%String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
	    
<div class="nav">
	<div class="main">
		<div class="logo"><a href="<%=basePath %>platform/nologin"><img src="${pageContext.servletContext.contextPath}/static/images/common/logo.png" alt="logo"></a></div>
		<div class="links"> 
			<a id="index_p" <c:if test='${memuid=="index_p"}'>class='current'</c:if>  href="${pageContext.servletContext.contextPath}/platform/index/index">首　页</a>
			<a id="shop_p" <c:if test='${memuid=="shop_p"}'>class='current'</c:if> href="${pageContext.servletContext.contextPath}/platform/analyze/shop/index">店铺分析</a>
			<a id="member_p" <c:if test='${memuid=="member_p"}'>class='current'</c:if> href="${pageContext.servletContext.contextPath}/platform/analyze/member/index">会员分析</a>
			<a id="overview_p" <c:if test='${memuid=="overview_p"}'>class='current'</c:if> href="${pageContext.servletContext.contextPath}/platform/analyze/overview/index">运营分析</a>
			<a id="params_p" <c:if test='${memuid=="params_p"}'>class='current'</c:if> href="${pageContext.servletContext.contextPath}/platform/shopHierarchy/index">参数设置</a>
			<a id="help_p" <c:if test='${memuid=="help_p"}'>class='current'</c:if> href="${pageContext.servletContext.contextPath}/platform/help/index">帮助中心</a>
			 
		</div>
	</div>
</div>
<script>
	if(window.screen.width<=1440){document.body.style.zoom = 0.9}
</script>