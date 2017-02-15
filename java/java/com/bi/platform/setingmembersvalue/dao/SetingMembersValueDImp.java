package com.bi.platform.setingmembersvalue.dao;


import com.jpa.qw.hf.BaseDaoImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import com.bi.platform.setingmembersvalue.bean.SetingMembersValue;

/***
	*设置会员价值
@author lianxiaoshan
***/
@Component
public class SetingMembersValueDImp   extends  BaseDaoImpl<SetingMembersValue> implements SetingMembersValueDao { 

	protected static final Logger logger = Logger.getLogger(SetingMembersValueDImp.class);
}