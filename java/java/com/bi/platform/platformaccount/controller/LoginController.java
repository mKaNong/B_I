package com.bi.platform.platformaccount.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bi.platform.platformaccount.bean.LoginBean;
import com.bi.platform.platformaccount.server.IPlatformAccountService;
import com.bi.utils.CaptchaUtil;
import com.bi.utils.CookieUtils;
import com.bi.utils.UserType;
import com.jpa.qw.hf.utils.ResultMode;
import com.utils.qw.hf.EncodeUtils;
import com.utils.qw.hf.Md5CyptoUtil;

/**
 * 平台登陆
 * 
 * @author liangxiaoshan
 *
 */
@Controller
@RequestMapping("/platform")
public class LoginController {
	@Autowired
	private org.apache.shiro.mgt.SecurityManager sm = null;
	@Autowired
	private IPlatformAccountService service;
	protected static final Logger logger = Logger.getLogger(LoginController.class);

	/**** 登陆 ***/
	@RequestMapping("/login")
	public String login(@Valid LoginBean loginBean, Errors validErrors, HttpServletRequest request, HttpServletResponse response, Model model) {
		String nologin = "/platform/login/nologin";
		Session session = SecurityUtils.getSubject().getSession();
		// 登陆成功后判断是否勾选了自动登陆功能，如果是就写入cookie
		if (loginBean.getRemMe() != null) {
			Object remember = CookieUtils.getCookie(request, session.getId().toString() + "_remember");
			if (remember != null && !"".equals(remember.toString().trim())) {
				String[] arrrem = remember.toString().split("_");
				if (arrrem != null && arrrem.length == 2) {
					loginBean.setUserName(arrrem[0]);
					loginBean.setPassword(new String(EncodeUtils.base64Decode(arrrem[1])));
					return loginexc(loginBean, validErrors, request, response, model, nologin, session, 0);
				}
			}
		}

		if (validErrors.hasErrors()) {
			return nologin;
		}
		model.addAttribute("userName", loginBean.getUserName());
		Object randomString = session.getAttribute("randomString") + "";
		// 取错误 次数
		String erroStr = CookieUtils.getCookieValue(request, session.getId().toString());
		int errorcount = 0;
		if (erroStr != null && erroStr.matches("[0-9]+")) {
			errorcount = Integer.parseInt(erroStr);
		}

		// 如果大于等于3次则判断验证码是否正确
		if (errorcount >= 3) {
			if (loginBean.getCode() != null && !randomString.toString().toLowerCase().equals(loginBean.getCode().trim().toLowerCase())) {
				validErrors.rejectValue("code", "platform.code.empty.error");
				setLoginCookie(response, model, session, errorcount);
				return nologin;
			}
		}
		if (service.isexit(loginBean.getUserName())) {

			return loginexc(loginBean, validErrors, request, response, model, nologin, session, errorcount);
		} else {
			validErrors.rejectValue("userName", "platform.userName.empty.error");
			setLoginCookie(response, model, session, errorcount);
			return nologin;
		}

	}

	private String loginexc(LoginBean loginBean, Errors validErrors, HttpServletRequest request, HttpServletResponse response, Model model, String nologin, Session session, int errorcount) {
		SecurityUtils.setSecurityManager(sm);
		UsernamePasswordToken token = new UsernamePasswordToken(loginBean.getUserName(), loginBean.getPassword());
		token.setRememberMe(true);
		Subject adminSubject = SecurityUtils.getSubject();
		try {
			adminSubject.login(token);
			// 登陆成功后判断是否勾选了自动登陆功能，如果是就写入cookie
			 if (loginBean.getRemMe() != null) {
				 CookieUtils.setCookie(response, session.getId().toString()+"_remember", loginBean.getUserName() + "_" + EncodeUtils.base64Encode(loginBean.getPassword().getBytes()));
			} else {
				CookieUtils.setCookie(response,session.getId().toString()+"_remember","");
				
			}
			  
			Object returnurl = request.getParameter("returnurl");
			if (returnurl != null && !"".equals(returnurl.toString().trim())) {
				String reutrnurl = returnurl.toString();
				response.sendRedirect(new String(EncodeUtils.base64Decode(reutrnurl)));
				setLoginCookie(response, model, session, 0);
				return null;
			}
			setLoginCookie(response, model, session, 0);
			return "redirect:/platform/index/index";
		} catch (InvalidSessionException | AuthenticationException e) {
			logger.error("loginerror", e);
			validErrors.rejectValue("password", "platform.password.empty.error");
			setLoginCookie(response, model, session, errorcount);
			return nologin;
		} catch (IOException e) {
			logger.error("loginerror", e);
			return nologin;
		}
	}

	private void setLoginCookie(HttpServletResponse response, Model model, Session session, int errorcount) {
		errorcount = errorcount + 1;
		model.addAttribute("erroCount", errorcount);
		CookieUtils.setCookie(response, session.getId().toString(), errorcount + "");
	}

	/**
	 * 登出
	 * 
	 * @param request
	 * @param error
	 * @param model
	 * @return
	 */
	@RequestMapping("/nologin")
	public String nologin(HttpServletRequest request, String error, Model model) {
		Object returnurl = request.getAttribute("returnurl");
		if (returnurl != null) {
			model.addAttribute("returnurl", returnurl);
		}
		model.addAttribute("error", error);
		SecurityUtils.getSubject().logout();
		return "platform/login/nologin";
	}

	/**
	 * 验证码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	@ResponseBody
	public void captcha(HttpServletRequest request, HttpServletResponse response) {
		try {
			CaptchaUtil.outputCaptcha(request, response);
		} catch (ServletException e) {
			logger.error(e);
			e.printStackTrace();
		} catch (IOException e) {
			logger.error(e);
			e.printStackTrace();
		}
	}

	/**
	 * 是否退出0
	 * 
	 * @return
	 */
	@RequestMapping(value = "/isLoginout", method = RequestMethod.GET)
	@ResponseBody
	public ResultMode isLoginout() {
		ResultMode result = new ResultMode();
		Object object = SecurityUtils.getSubject().getSession().getAttribute(UserType.platform);
		if (object != null) {
			result.setCode("1");
		} else {
			result.setCode("0");
		}
		return result;
	}
}