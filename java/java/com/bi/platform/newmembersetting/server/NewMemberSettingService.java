package com.bi.platform.newmembersetting.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.framework.qw.hf.cache.BaseService;
import com.bi.platform.newmembersetting.bean.NewMemberSetting;
import com.bi.platform.newmembersetting.dao.NewMemberSettingDao;

/***
	*新会员设置
@author lianxiaoshan
***/
@Service
public class NewMemberSettingService   extends  BaseService<NewMemberSetting> implements INewMemberSettingService { 

	protected static final Logger logger = Logger.getLogger(NewMemberSettingService.class);
	private  NewMemberSettingDao dao ;

	@Autowired
	public void setDao(NewMemberSettingDao dao) {
		this.dao = dao;
		super.setDao(dao);
	}
}