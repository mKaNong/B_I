package com.bi.platform.analyze.service;

import java.util.List;
import java.util.Map;

public interface IMemberService {

	
	public abstract Map index(String mvalue);

	/**
	 * 新增会员
	 * 
	 * @param day
	 *            1为7天2为30天3为6个月4为1年
	 * @return
	 */
	public abstract List<Map> newMember(String day);

	/**
	 * 会员分布--等级
	 * 
	 * @return
	 */
	public abstract List<Map> memlevel();

	/**
	 * 会员分布--新老
	 * 
	 * @return
	 */
	public abstract List<Map> memnewold();

	/**
	 * 会员分布--年龄
	 * 
	 * @return
	 */
	public abstract List<Map> memage();

	/**
	 * 会员分布--性别
	 * 
	 * @return
	 */
	public abstract List<Map> memsex();

	/****
	 * 
	 *  会员价值 
	 *  
	 *  **/
	public Map memValue(String mvalue);

	/**** 
	 * 
	 * 查看画像 
	 * 
	 * **/
	public abstract List<Map> viewPortrait (String id);

	/**
	 * 会员画像
	 * @param pageNo 页码
	 * @param pageSize 显示大小
	 * @param where 条件  key为数据库字段value为实际值
	 * @return
	 */
	Map huaxiang(int pageIndex, int pageSize, String sex,String age, String consume, String level, String area);
}