package com.bi.platform.platformaccount.server;


import com.framework.qw.hf.cache.IBaseService;
import com.bi.platform.platformaccount.bean.PlatformAccount;

/***
	*平台账号
@author lianxiaoshan
***/
public interface IPlatformAccountService   extends  IBaseService<PlatformAccount> { 
	/**
	 * 登陆
	 * @param userName用户名
	 * @param password密码 
	 * @return 返回一个实体
	 */
	public PlatformAccount findPlatformAccount(String userName, String password);
	/**
	 * 用户是否存在
	 * @param userName 用户名
	 * @return true/false
	 */
	public boolean isexit(String userName);
	/**
	 * 登陆
	 * @param userName 用户名
	 * @param password 密码,MD5加密后
	 * @return
	 */
	public PlatformAccount remember(String userName, String password);
}