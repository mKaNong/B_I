package com.bi.platform.platformaccount.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.qw.hf.cache.BaseService;
import com.bi.platform.platformaccount.bean.PlatformAccount;
import com.bi.platform.platformaccount.dao.PlatformAccountDao;

/***
	*平台账号
@author lianxiaoshan
***/
@Service
public class PlatformAccountService   extends  BaseService<PlatformAccount> implements IPlatformAccountService { 

	protected static final Logger logger = Logger.getLogger(PlatformAccountService.class);
	private  PlatformAccountDao dao ;

	@Autowired
	public void setDao(PlatformAccountDao dao) {
		this.dao = dao;
		super.setDao(dao);
	}
	
	public PlatformAccount findPlatformAccount(String userName, String password){
		return dao.findPlatformAccount(userName,password);
	}
	public boolean isexit(String userName){
		return dao.isexit(userName);
	}

	@Override
	public PlatformAccount remember(String userName, String password) {
		 
		return dao.remember(userName, password);
	}
}