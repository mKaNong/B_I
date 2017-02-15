package com.bi.utils;

import org.apache.shiro.SecurityUtils;

import com.bi.platform.platformaccount.bean.PlatformAccount;

/**
 * 账号工具类
 * @author liangxiaoshan
 *
 */
public class UserType {
	public static final String platform = "platform";

	/*** 获取当前登录的平台账号 **/
	public static PlatformAccount getPlatform() {
		Object object = SecurityUtils.getSubject().getSession().getAttribute(platform);
		if (object != null) {
			return (PlatformAccount) object;
		}
		return null;
	}
}
