package com.bi.platform.newmembersetting.bean;


import java.io.Serializable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import com.framework.qw.hf.bean.BaseBeanModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/***
	*新会员设置
@author lianxiaoshan
***/
@Entity
@Table(name = "new_member_setting")
public class NewMemberSetting   extends  BaseBeanModel    implements Serializable { 

	/**平台账号**/
	@Column(name="platform_account",length=100,scale=0,precision=100,nullable= true)
	private String platformAccount;

	/**天数**/
	@Column(name="day_num",length=11,scale=0,precision=11,nullable= true)
	private Integer dayNum;



	/**平台账号**/
	public String getPlatformAccount(){
		return this.platformAccount;
	}

	/**平台账号**/
	public void setPlatformAccount(String platformAccount){
		this.platformAccount=platformAccount;
	}

	/**天数**/
	public Integer getDayNum(){
		return this.dayNum;
	}

	/**天数**/
	public void setDayNum(Integer dayNum){
		this.dayNum=dayNum;
	}



}