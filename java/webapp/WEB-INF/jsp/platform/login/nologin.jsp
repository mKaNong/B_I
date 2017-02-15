<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
	<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 
<%String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; request.setAttribute("basePath", basePath);%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=basePath %>static/css/login.min.css">
<title>登录</title>
</head>



<body> 

	<div class="login-nav">
		<div class="main">
			<div class="logo">
				<a href="javascript:;"><img src="<%=basePath %>static/images/login/logo.png"
					alt=""><span>大数据分析领航者</span></a>
			</div>
			<div class="tel">业务咨询电话：400-8300-1200</div>
		</div>
	</div>
	<div class="login-inner">
	   	<s:form method="post" id="loginform" modelAttribute = "loginBean" action="${basePath}platform/login">
			
			<input type="hidden" name="returnurl" value="${returnurl}">
			<div class="main">
				<div class="login-wrap">
					<h3>账户登录</h3>
					<div class="input-wrap user">
						<input type="text" onfocus="this.value=''" value="${userName}" name="userName" id="userName" class="text-user"
							placeholder="邮箱/用户名">
					</div>
					<div class="tips"><s:errors path="userName"></s:errors></div>
					<div class="input-wrap pwd">
						<input type="password" name="password" id="password"
							class="text-pwd" placeholder="密码">
					</div>
					<div class="tips"><s:errors path="password"></s:errors></div>
					<c:choose>
					    <c:when test="${erroCount!=null&&erroCount>=3}">
					        <div class="input-wrap code">
								<input type="text" name="code" id="code" class="text-code"
									placeholder="验证码"> <img id="captchaImage"
									src="<%=basePath %>/platform/captcha"
									title="换一换">
							</div>
							<div class="tips"><s:errors path="code" ></s:errors></div>
					    
					    </c:when>
					     <c:otherwise>
					      <div class="input-wrap code" style="display: none">
								<input type="hidden" name="code" id="code"  >
								<input type="hidden" id="captchaImage"  >  
									 
							</div>
							<div class="tips"><s:errors path="code" ></s:errors></div>
					     </c:otherwise>
					</c:choose>
					
					 
					 
					<div class="div-wrap mt">
						<label for="auto-logon">  
						 
					 <input type="checkbox" value="1"   name="remMe" id="auto-logon">自动登录
					 </label> <a href="javascript:;" class="forget-pwd">忘记密码</a>
					</div>
					<div class="btns">
						<input class="btn btn-login" type="button" value="登录"> <a
							class="btn btn-reg" href="javascript:;">注册</a>
					</div>
				</div>
			</div>
		</s:form>
	</div>
	<div class="login-footer">
		<div class="main">
			<div>Copyright© 2016（QUANWANG）皖ICP备16000523号 版权所有</div>
			<div class="link">
				<!-- <a href="index.html">首页</a> <a href="shop.html">店铺分析</a> <a
					href="member.html">会员分析</a> <a href="operate.html">运营分析</a> <a
					href="setting.html">参数设置</a> <a href="help.html">帮助中心</a> -->
			</div>
		</div>
	</div>
	<script src="<%=basePath %>static/js/plugins/jquery.js"></script>
	<script src="<%=basePath %>static/js/login.js"></script>
	<script src="<%=basePath %>static/js/base64.js"></script>
	  <script type="text/javascript">
	  //获取cookie
	  function getCookieValue(cookieName)
	 {
	 	var cookieValue = document.cookie;
	 	var cookieStartAt = cookieValue.indexOf(""+cookieName+"=");
	 	if(cookieStartAt==-1)
	 	{
	 		cookieStartAt = cookieValue.indexOf(cookieName+"=");
	 	}
	 	if(cookieStartAt==-1)
	 	{
	 		cookieValue = null;
	 	}
	 	else
	 	{
	 		cookieStartAt = cookieValue.indexOf("=",cookieStartAt)+1;
	 		cookieEndAt = cookieValue.indexOf(";",cookieStartAt);
	 		if(cookieEndAt==-1)
	 		{
	 			cookieEndAt = cookieValue.length;
	 		}
	 		cookieValue = unescape(cookieValue.substring(cookieStartAt,cookieEndAt));//解码latin-1
	 	}
	 	return cookieValue;
	 }
	      $(function(){
	    	   var base64=new Base64();
	    	  var cookieuser =  getCookieValue('<%=request.getSession().getId()%>_remember') ; 
	    	   if(cookieuser!=undefined&&cookieuser!=''){
	    		  $('#userName').val(cookieuser.split('_')[0]);
	    		  $('#password').val(base64.decode(cookieuser.split('_')[1]));
	    		  $('#auto-logon').attr("checked","checked");
	    		  console.info(base64.decode(cookieuser.split('_')[1]));
	 	    	 
	    	  }
	    		  
	    		  
	          // 更换验证码
              $('#captchaImage').click(function() 
              {
                  $('#captchaImage').attr("src", "<%=basePath %>/platform/captcha?timestamp=" + (new Date()).valueOf());
              }); 
	    	  
            //回车提交事件
              $("body").keydown(function(event) {
                  if (event.keyCode == "13") {//keyCode=13是回车键
                      $("#loginform").submit();
                  }
              }); 
	          
	      });
	  
	  
	  </script> 
</body>
</html>