package com.bi.platform.platformaccount.bean;


import java.io.Serializable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import com.framework.qw.hf.bean.BaseBeanModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/***
	*平台账号
@author lianxiaoshan
***/
@Entity
@Table(name = "platform_account")
public class PlatformAccount   extends  BaseBeanModel    implements Serializable { 

	/**店铺类别编号**/
	@Column(name="platform_code",length=100,scale=0,precision=100,nullable= true)
	private String platformCode;

	/**帐号**/
	@Column(name="account_name",unique=true,length=100,scale=0,precision=100,nullable= false)
	@Id
	private String accountName;

	/**密码**/
	@Column(name="account_password",length=100,scale=0,precision=100,nullable= true)
	private String accountPassword;



	/**店铺类别编号**/
	public String getPlatformCode(){
		return this.platformCode;
	}

	/**店铺类别编号**/
	public void setPlatformCode(String platformCode){
		this.platformCode=platformCode;
	}

	/**帐号**/
	public String getAccountName(){
		return this.accountName;
	}

	/**帐号**/
	public void setAccountName(String accountName){
		this.accountName=accountName;
	}

	/**密码**/
	public String getAccountPassword(){
		return this.accountPassword;
	}

	/**密码**/
	public void setAccountPassword(String accountPassword){
		this.accountPassword=accountPassword;
	}



}