package com.bi.platform.analyze.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.ICustFlowService;
import com.jpa.qw.hf.utils.QueryResult;

/**
 * 运营分析--流量构成
 * 
 * @author lxs
 *
 */
@Controller
@RequestMapping("/platform/analyze/custFlow")
public class CustFlowController {
	@Autowired
	private ICustFlowService custFlowService;
	
	protected static final Logger logger = Logger.getLogger(CustFlowController.class);

	@RequestMapping("/index")
	public String index(Model model) {
		custFlowService.index(model);
		return "/platform/analyze/custFlow/index";
	}

	/**
	 * 支付买家数分布 由于较为固定可以缓存一天
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	@RequestMapping("/payCusts")
	public @ResponseBody Map<String, List<Map>> payCusts(String day, Model model) {
		return custFlowService.payCusts(day);
	}
	
	/**
	 * 地域
	 */
	@RequestMapping("/area")
	public @ResponseBody List<Map> payCustsArea() {
		
		return custFlowService.areaDistribute();
	}

	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	@RequestMapping("/channel")
	public @ResponseBody Map channel(String day) {
		return custFlowService.channel(day);
	}
	
	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	@RequestMapping("/clicks")
	public @ResponseBody QueryResult<Map> clicks(int pageIndex, int pageSize,String day,String s,String e,String channelId) {
		return custFlowService.clicks(pageIndex + 1, pageSize,day, s, e, channelId);
	}
}
