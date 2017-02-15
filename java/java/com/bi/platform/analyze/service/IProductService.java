package com.bi.platform.analyze.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.jpa.qw.hf.utils.QueryResult;

/**
 * 运营分析--商品分析
 * 
 * @author lxs
 *
 */
public interface IProductService {

	void index(Model model);
	/**
	 * 在线商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 */
	Map onlineProduct(String day);

	/**
	 * 被下单商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	public List<Map> buyProduct(String day, String channelId);

	/**
	 * 被支付商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	public List<Map> payProduct(String day, String channelId);
	/**
	 * 商品排行
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目 product_name 商品名 pv 浏览器 uv 访客数 pay_qty 成交量 pay_amount支付金额
	 *            zhl转化率
	 */
	public QueryResult<Map> orderbyProduct(String day,int pageIndex, int pageSize, String s, String e) ;
}
