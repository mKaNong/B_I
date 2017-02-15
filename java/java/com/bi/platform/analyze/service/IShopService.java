package com.bi.platform.analyze.service;

import java.util.List;
import java.util.Map;

import com.jpa.qw.hf.utils.QueryResult;

public interface IShopService {
    
	/**
	 * 店铺分析首页
	 * @return
	 */
	public abstract Map index();
	
	/**
	 * 店铺分布
	 * @return
	 */
	public List<Map> dic();		
	
	/**
	 * 地域分布
	 * @return
	 */
	public List<Map> areaAnalyzed();
	
	/**
	 * 店铺入住数量 
	 * 
	 * @param startDate 起始时间
	 * @param endDate  结束时间   
	 * @param category 类目
	 * @param area 地域
	 * @return
	 * 
	 */
	List<Map> storeInNum(String startDate, String endDate, String category, String area);
	
	/**
	 * 店铺层级
	 */
	public List<Map> level();
	
	
	/**
	 * 店铺排名
	 * @param page  页码
	 * @param pageSize 每页大小
	 * @param categray 类目
	 * @param day 1昨天 2为近7日 3为近30日
	 *
	 * @return
	 */	
	
	QueryResult<Map> page(int page, int pageSize, String categray, String day );
	

}