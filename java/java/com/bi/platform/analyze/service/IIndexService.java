package com.bi.platform.analyze.service;

import java.util.List;
import java.util.Map;

public interface IIndexService {
	
	/**
	 * 首页的首页面
	 * @return
	 */
	public abstract Map index();
		
	
		
	/**
	 * 在线商品数  
	 * @param date  7天 30天 6个月  1年
	 * @return
	 */
	List<Map> onlineProNum(String date);

}
