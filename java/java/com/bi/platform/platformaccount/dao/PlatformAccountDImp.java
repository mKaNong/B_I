package com.bi.platform.platformaccount.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bi.platform.platformaccount.bean.PlatformAccount;
import com.jpa.qw.hf.BaseDaoImpl;
import com.utils.qw.hf.Md5CyptoUtil;

/***
 * 平台账号
 * 
 * @author lianxiaoshan
 ***/

@Component
public class PlatformAccountDImp extends BaseDaoImpl<PlatformAccount> implements PlatformAccountDao {

	protected static final Logger logger = Logger.getLogger(PlatformAccountDImp.class);

	/**
	 * 登陆
	 * @param userName 用户名
	 * @param password 密码 
	 * @return
	 */
	public PlatformAccount findPlatformAccount(String userName, String password) {
		PlatformAccount account = null;
		List<PlatformAccount> list = getScrollData(-1, -1, "accountName =? and accountPassword =?", new Object[] { userName, Md5CyptoUtil.md5(password) }).getRows();
		if (list != null && list.size() > 0) {
			account = list.get(0);
		}
		return account;
	}
	/**
	 * 登陆
	 * @param userName 用户名
	 * @param password 密码,MD5加密后
	 * @return
	 */
	public PlatformAccount remember(String userName, String password) {
		PlatformAccount account = null;
		List<PlatformAccount> list = getScrollData(-1, -1, "accountName =? and accountPassword =?", new Object[] { userName, password  }).getRows();
		if (list != null && list.size() > 0) {
			account = list.get(0);
		}
		return account;
	}
	// 用户是否存在
	public boolean isexit(String userName) {
		List<PlatformAccount> list = getScrollData(-1, -1, "accountName =? ", new Object[] { userName }).getRows();
		return (list != null && list.size() > 0);

	}
}