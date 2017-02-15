package com.bi.platform.shoptype.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.platform.shoptype.bean.ShopType;
import com.bi.platform.shoptype.dao.ShopTypeDao;
import com.framework.qw.hf.cache.BaseService;

/***
	*店铺类别
@author lianxiaoshan
***/
@Service
public class ShopTypeService   extends  BaseService<ShopType> implements IShopTypeService { 

	protected static final Logger logger = Logger.getLogger(ShopTypeService.class);
	private  ShopTypeDao dao ;

	@Autowired
	public void setDao(ShopTypeDao dao) {
		this.dao = dao;
		super.setDao(dao);
	}
}