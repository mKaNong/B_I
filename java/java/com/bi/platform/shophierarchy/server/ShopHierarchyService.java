package com.bi.platform.shophierarchy.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.framework.qw.hf.cache.BaseService;
import com.bi.platform.shophierarchy.bean.ShopHierarchy;
import com.bi.platform.shophierarchy.dao.ShopHierarchyDao;

/***
	*店铺层级
@author lianxiaoshan
***/
@Service
public class ShopHierarchyService   extends  BaseService<ShopHierarchy> implements IShopHierarchyService { 

	protected static final Logger logger = Logger.getLogger(ShopHierarchyService.class);
	private  ShopHierarchyDao dao ;

	@Autowired
	public void setDao(ShopHierarchyDao dao) {
		this.dao = dao;
		super.setDao(dao);
	}
}