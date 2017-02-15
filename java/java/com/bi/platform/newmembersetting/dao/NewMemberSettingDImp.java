package com.bi.platform.newmembersetting.dao;


import com.jpa.qw.hf.BaseDaoImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import com.bi.platform.newmembersetting.bean.NewMemberSetting;

/***
	*新会员设置
@author lianxiaoshan
***/
@Component
public class NewMemberSettingDImp   extends  BaseDaoImpl<NewMemberSetting> implements NewMemberSettingDao { 

	protected static final Logger logger = Logger.getLogger(NewMemberSettingDImp.class);
}