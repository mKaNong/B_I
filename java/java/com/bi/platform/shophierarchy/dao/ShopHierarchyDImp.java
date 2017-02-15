package com.bi.platform.shophierarchy.dao;


import com.jpa.qw.hf.BaseDaoImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import com.bi.platform.shophierarchy.bean.ShopHierarchy;

/***
	*店铺层级
@author lianxiaoshan
***/
@Component
public class ShopHierarchyDImp   extends  BaseDaoImpl<ShopHierarchy> implements ShopHierarchyDao { 

	protected static final Logger logger = Logger.getLogger(ShopHierarchyDImp.class);
}