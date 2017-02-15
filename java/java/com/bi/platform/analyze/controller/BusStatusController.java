package com.bi.platform.analyze.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.IBusStatusService;
import com.bi.platform.analyze.service.IIndexService;
/***
 * 运营分析-运营概况
 * @author xuerming
 *
 */
@Controller
@RequestMapping("/platform/analyze/overview")
public class BusStatusController {
	
	@Autowired
	private IBusStatusService statusService;
	
	protected static final Logger logger = Logger.getLogger(BusStatusController.class);
	
	/**默认打开首页显示*/
	@RequestMapping(value = "/index")
	public String index(Model model){
		model.addAttribute("result", statusService.index());
		return "/platform/analyze/overview/index";
	}
	
	/**运营概况*/
	@RequestMapping(value = "/overview")
	@ResponseBody
	public Map overview(String date){
		return statusService.overview(date);
	}
	
	/**流量交易趋势*/
	@RequestMapping(value = "/trend")
	@ResponseBody
	public List<Map> trend(String date){
		return statusService.trend(date);
	}
	
	/**转化率*/
	@RequestMapping(value = "/rate")
	@ResponseBody
	public Map rated(String date){
		return statusService.rate(date);
	}

}
