package com.bi.platform.analyze.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
/**
 * 运营分析--交易构成
 * 
 * @author lxs
 *
 */
public interface ITradeFormService {
	public void index(Model model);
	
	
	/**
	 * 支付买家数分布 由于较为固定可以缓存一天
	 * 
	 * @param day  1为昨天 2为7天 3为30天
	 *          
	 * @param model
	 */
	public Map<String,List<Map >> payCusts(String day );
	
	/**
	 * 
	 * @return
	 */
	public List<Map> areaTrade();
	
	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public  Map channel(String day);
	
	
	
}
