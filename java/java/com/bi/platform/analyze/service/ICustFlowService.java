package com.bi.platform.analyze.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.jpa.qw.hf.utils.QueryResult;

/**
 * 运营分析--流量构成
 * 
 * @author lxs
 *
 */
public interface ICustFlowService {
	/**
	 * 访客分布 由于较为固定可以缓存一天
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public Map<String,List<Map >> payCusts(String day );
	
	/***
	 * 
	 */
	public List<Map> areaDistribute();
	
	
	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public  Map channel(String day);
	public void index(Model model);
	/***
	 * 点击数
	 * 
	 * @param day
	 *            1昨2 7天3 30天
	 * @param pageNo页码
	 * @param s开始时间
	 * @param e结束时间
	 * @param channelId一级频道
	 * @return
	 */
	public QueryResult<Map> clicks(int pageIndex, int pageSize,String day, String s,String e, String channelId) ;
}
