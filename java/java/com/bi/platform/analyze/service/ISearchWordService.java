package com.bi.platform.analyze.service;

import java.util.Map;

import com.jpa.qw.hf.utils.QueryResult;

public interface ISearchWordService {
	
	//public abstract Map index();
	
	
	public abstract Map load();
	
	/**
	 * 搜索词
	 * @param day 日期
	 * @return
	 */
	public abstract Map SearchWord(String day);
	
	/**
	 * 日搜
	 * @return
	 */
	
	public abstract QueryResult<Map> daySearchWord(int pageIndex, int pageSize);
	
	/**
	 * 周搜
	 * @return
	 */
	
	public abstract QueryResult<Map> weekSearchWord(int pageIndex, int pageSize);
	
	/**
	 * 月搜
	 * @return
	 */
	
	public abstract QueryResult<Map> monthSearchWord(int pageIndex, int pageSize);
	
	/**
	 * 按类目排序
	 * @param start 起始时间
	 * @param end  终止时间
	 * @param day  1 昨天 2 近7天 3 近30天
	 * @param category 类目
	 * @return
	 */
	public abstract QueryResult<Map> orderByCategory(int pageIndex, int pageSize, String day);
	

}
