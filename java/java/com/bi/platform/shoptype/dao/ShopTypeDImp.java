package com.bi.platform.shoptype.dao;


import com.jpa.qw.hf.BaseDaoImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import com.bi.platform.shoptype.bean.ShopType;

/***
	*店铺类别
@author lianxiaoshan
***/
@Component
public class ShopTypeDImp   extends  BaseDaoImpl<ShopType> implements ShopTypeDao { 

	protected static final Logger logger = Logger.getLogger(ShopTypeDImp.class);
}