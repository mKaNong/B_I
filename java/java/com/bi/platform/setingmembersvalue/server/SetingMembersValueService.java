package com.bi.platform.setingmembersvalue.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.framework.qw.hf.cache.BaseService;
import com.bi.platform.setingmembersvalue.bean.SetingMembersValue;
import com.bi.platform.setingmembersvalue.dao.SetingMembersValueDao;

/***
	*设置会员价值
@author lianxiaoshan
***/
@Service
public class SetingMembersValueService   extends  BaseService<SetingMembersValue> implements ISetingMembersValueService { 

	protected static final Logger logger = Logger.getLogger(SetingMembersValueService.class);
	private  SetingMembersValueDao dao ;

	@Autowired
	public void setDao(SetingMembersValueDao dao) {
		this.dao = dao;
		super.setDao(dao);
	}
}