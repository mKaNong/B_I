package com.bi.platform.setingmembersvalue.bean;


import java.io.Serializable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import com.framework.qw.hf.bean.BaseBeanModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/***
	*设置会员价值
@author lianxiaoshan
***/
@Entity
@Table(name = "seting_members_value")
public class SetingMembersValue   extends  BaseBeanModel    implements Serializable { 

	/****/
	@Column(name="values",length=11,scale=0,precision=11,nullable= true)
	private Integer values;

	/**最新交易时间**/
	@Column(name="r",length=50,scale=0,precision=50,nullable= true)
	private String r;

	/**交易次数**/
	@Column(name="f",length=50,scale=0,precision=50,nullable= true)
	private String f;

	/**交易总额**/
	@Column(name="sm",length=50,scale=0,precision=50,nullable= true)
	private String sm;

	/**平均交易额**/
	@Column(name="m",length=50,scale=0,precision=50,nullable= true)
	private String m;

	/**店铺**/
	@Column(name="shopid",length=100,scale=0,precision=100,nullable= true)
	private String shopid;

	/**平台**/
	@Column(name="orgid",length=100,scale=0,precision=100,nullable= true)
	private String orgid;



	/****/
	public Integer getValues(){
		return this.values;
	}

	/****/
	public void setValues(Integer values){
		this.values=values;
	}

	/**最新交易时间**/
	public String getR(){
		return this.r;
	}

	/**最新交易时间**/
	public void setR(String r){
		this.r=r;
	}

	/**交易次数**/
	public String getF(){
		return this.f;
	}

	/**交易次数**/
	public void setF(String f){
		this.f=f;
	}

	/**交易总额**/
	public String getSm(){
		return this.sm;
	}

	/**交易总额**/
	public void setSm(String sm){
		this.sm=sm;
	}

	/**平均交易额**/
	public String getM(){
		return this.m;
	}

	/**平均交易额**/
	public void setM(String m){
		this.m=m;
	}

	/**店铺**/
	public String getShopid(){
		return this.shopid;
	}

	/**店铺**/
	public void setShopid(String shopid){
		this.shopid=shopid;
	}

	/**平台**/
	public String getOrgid(){
		return this.orgid;
	}

	/**平台**/
	public void setOrgid(String orgid){
		this.orgid=orgid;
	}



}