/**
 * Project Name:system_management
 * File Name:UserInterceptor.java
 * Package Name:com.system.wq.hf.filter
 * Date:2016年7月18日上午9:00:01
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
 */

package com.system.wq.hf.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bi.utils.UserType;
import com.utils.qw.hf.EncodeUtils;

/**
 * 此拦截器目前只处理针对系统用户的拦截
 * SecurityUtils.getSubject().getSession().getAttribute(UserType.ADMIN);
 * 如要处理其他用户需要添加拦截器 ClassName:UserInterceptor <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年7月18日 上午9:00:01 <br/>
 * 
 * @author liangxiaoshan
 * @version
 * @since JDK 1.6
 * @see
 */
public class UserInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {

		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String path = request.getContextPath();

		Object object = SecurityUtils.getSubject().getSession().getAttribute(UserType.platform);
		boolean f = true;
		if (object == null) {
			 
			String queryString = request.getQueryString();
			String pathurl = request.getRequestURL()+(queryString!=null?"?"+queryString:"");
			String returnurl = EncodeUtils.base64Encode(pathurl.getBytes());
			request.setAttribute("returnurl", returnurl);
		    request.getRequestDispatcher(request.getContextPath()+"/platform/nologin").forward(request, response);
			
			//response.sendRedirect(path + "/platform/loginout");//这个路径可用在退出登陆的时候
			f = false;

		}
		return f;
	}

}
