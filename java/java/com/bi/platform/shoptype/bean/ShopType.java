package com.bi.platform.shoptype.bean;


import java.io.Serializable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import com.framework.qw.hf.bean.BaseBeanModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/***
	*店铺类别
@author lianxiaoshan
***/
@Entity
@Table(name = "shop_type")
public class ShopType   extends  BaseBeanModel    implements Serializable { 

	/**类别名称**/
	@Column(name="name",length=100,scale=0,precision=100,nullable= true)
	private String name;

	/**类别编号**/
	@Column(name="code",length=100,scale=0,precision=100,nullable= true)
	private String code;



	/**类别名称**/
	public String getName(){
		return this.name;
	}

	/**类别名称**/
	public void setName(String name){
		this.name=name;
	}

	/**类别编号**/
	public String getCode(){
		return this.code;
	}

	/**类别编号**/
	public void setCode(String code){
		this.code=code;
	}



}