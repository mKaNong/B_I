package com.bi.platform.analyze.service;

import java.util.List;
import java.util.Map;
/**运营概况*/
public interface IBusStatusService {
	
	/**
	 * 运营概况首页
	 * @return
	 */
	public abstract Map index();
	
	
	/**
	 * 运营概况
	 * @param date 1为昨日  2为近7日  3为近30日
	 * @return
	 */
	Map overview(String date);
	
	/**
	 * 流量交易趋势 
	 * @param date  1为昨日  2为近7日  3为近30日
	 * @return
	 */
	List<Map> trend(String date);
	
	
	/**
	 * 转化率
	 * @param date 时间  1为昨日  2为近7日  3为近30日
	 * @param 
	 * @return
	 */
	Map rate(String date);
	
	

}
