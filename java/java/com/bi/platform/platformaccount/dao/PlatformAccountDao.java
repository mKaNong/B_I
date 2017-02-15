package com.bi.platform.platformaccount.dao;


import java.util.List;

import  com.jpa.qw.hf.BaseDao;
import com.bi.platform.platformaccount.bean.PlatformAccount;

/***
	*平台账号
@author lianxiaoshan
***/
public interface PlatformAccountDao   extends  BaseDao     <PlatformAccount> {
	/**
	 * 登陆
	 * @param userName 用户名
	 * @param password 密码,MD5加密后
	 * @return
	 */
	public PlatformAccount findPlatformAccount(String userName, String password); 

	// 用户是否存在
	public boolean isexit(String userName);
	/**
	 * 登陆
	 * @param userName 用户名
	 * @param password 密码,MD5加密后
	 * @return
	 */
	public PlatformAccount remember(String userName, String password) ;
}