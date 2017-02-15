package com.bi.platform.analyze.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.ICustFlowService;
import com.bi.platform.analyze.service.ITradeFormService;

/**
 * 运营分析--交易构成
 * @author lxs
 *
 */
@Controller
@RequestMapping("/platform/analyze/tradeForm")
public class TradeFormController{
	
	@Autowired
	private ITradeFormService iTradeFormService;
	
	protected static final Logger logger = Logger.getLogger(TradeFormController.class);

	@RequestMapping("/index")
	public String index(Model model) {
	    model.addAttribute("result", iTradeFormService);
		return "/platform/analyze/tradeForm/index";
	}
	
	

	
	/**
	 * 支付买家数分布 由于较为固定可以缓存一天
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	@RequestMapping("/payCustsTrend")
	public @ResponseBody Map<String,List<Map >> payCusts(String day, Model model){
		return iTradeFormService.payCusts(day);
	}
	
	/***
	 * 地域
	 * @return
	 */
	@RequestMapping("/areaTrend")
	public @ResponseBody List<Map> payCustsArea() {
		
		return iTradeFormService.areaTrade();
	}
	
	
	
	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	@RequestMapping("/channelTrend")
	public @ResponseBody  Map channel(String day){
		return iTradeFormService.channel(day);
	}
}
