package com.bi.platform.shophierarchy.bean;


import java.io.Serializable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import com.framework.qw.hf.bean.BaseBeanModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import  java.math.BigDecimal;
/***
	*店铺层级
@author lianxiaoshan  
***/
@Entity
@Table(name = "shop_hierarchy")
public class ShopHierarchy   extends  BaseBeanModel    implements Serializable { 

	/**平台帐号UUID**/
	@Column(name="orgid",length=100,scale=0,precision=100,nullable= true)
	private String platformUuid;

	/**层级名称**/
	@Column(name="name",length=100,scale=0,precision=100,nullable= true)
	private String name;

	/**开始金额**/
	@Column(name="start",length=11,scale=0,precision=10,nullable= true)
	private BigDecimal start;

	/**结束金额**/
	@Column(name="end",length=11,scale=0,precision=10,nullable= true)
	private BigDecimal end;



	/**平台帐号UUID**/
	public String getPlatformUuid(){
		return this.platformUuid;
	}

	/**平台帐号UUID**/
	public void setPlatformUuid(String platformUuid){
		this.platformUuid=platformUuid;
	}

	/**层级名称**/
	public String getName(){
		return this.name;
	}

	/**层级名称**/
	public void setName(String name){
		this.name=name;
	}

	/**开始金额**/
	public BigDecimal getStart(){
		return this.start;
	}

	/**开始金额**/
	public void setStart(BigDecimal start){
		this.start=start;
	}

	/**结束金额**/
	public BigDecimal getEnd(){
		return this.end;
	}

	/**结束金额**/
	public void setEnd(BigDecimal end){
		this.end=end;
	}



}