/**
 * Project Name:system_management
 * File Name:UserShiroRealm.java
 * Package Name:com.system.wq.hf.shiro
 * Date:2016年7月12日下午1:47:15
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
 */

package com.system.wq.hf.shiro;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.platform.platformaccount.bean.PlatformAccount;
import com.bi.platform.platformaccount.server.IPlatformAccountService;
import com.bi.utils.UserType;
import com.framework.qw.hf.shiro.ShiroRealm;

/**
 * ClassName:UserShiroRealm <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年7月12日 下午1:47:15 <br/>
 * 
 * @author liangxiaoshan
 * @version
 * @since JDK 1.6
 * @see
 */
@Service
public class UserShiroRealm extends ShiroRealm {
	@Autowired
	private IPlatformAccountService service;
	protected final Logger logger = Logger.getLogger(ShiroRealm.class);

	/** 权限验证 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		
		 
		return info;
	}

	/**
	 * 登录授权
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// token中储存着输入的用户名和密码
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String userString = upToken.getUsername();
		if (userString != null) {
			// 登录
			try {
				PlatformAccount account = service.findPlatformAccount(userString, String.valueOf(upToken.getPassword()));
				if (account != null) {
					Subject adminSubject = SecurityUtils.getSubject();
					adminSubject.getSession().setAttribute(UserType.platform, account);
					SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userString, account.getAccountPassword(), getName());
					return info;
				}

			} catch (Exception e) {
				logger.error("error", e);
				e.printStackTrace();

			}

		}
		return null;
	}

	/**
	 * 自己添加的，用来清除shiro缓存的用户权限数据
	 * 
	 * @param userId
	 *            要清除Shiro缓存的userId
	 */
	public void removeUserCache(String userId) {
		SimplePrincipalCollection pc = new SimplePrincipalCollection();
		pc.add(userId, super.getName());
		super.clearCachedAuthorizationInfo(pc);

	}

}
