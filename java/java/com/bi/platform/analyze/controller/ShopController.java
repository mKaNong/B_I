package com.bi.platform.analyze.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.IShopService;
import com.jpa.qw.hf.utils.QueryResult;

/**
 * 平台---店铺分析
 * 
 * @author liangxiaoshan
 *
 */
@Controller
@RequestMapping("/platform/analyze/shop")
public class ShopController {

	@Autowired
	private IShopService shopService;

	protected static final Logger logger = Logger.getLogger(ShopController.class);

	/**
	 * 店铺首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("result", shopService.index());
		return "/platform/analyze/shop/index";
	}

	/**
	 * 店铺分布-饼图
	 * 
	 * @return
	 */
	@RequestMapping("/dic")
	@ResponseBody
	public List<Map> dic() {
		return shopService.dic();
	}

	/**
	 * 地域分析-地图
	 * 
	 * @return
	 */
	@RequestMapping("/area")
	@ResponseBody
	public List<Map> areaAnalyze() {
		return shopService.areaAnalyzed();
	}

	/**
	 * 店铺层级-柱状图
	 * @return
	 */
	@RequestMapping("/level")
	@ResponseBody
	public List<Map> level() {
		return shopService.level();
	}
	
	/**
	 * 入驻统计
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/enter")
	@ResponseBody
	public List<Map> enter(
			String startDate,
			String endDate,
			@RequestParam(value = "category", defaultValue = "所有类目") String category,
			@RequestParam(value = "area", defaultValue = "所有地域") String area) {

		return shopService.storeInNum(startDate, endDate, category, area);

	}
	
	/**
	 * 店铺排名分页
	 * @param page
	 * @param pageSize
	 * @param categray
	 * @param day
	 * @return
	 */
	@RequestMapping("/page")
	@ResponseBody
	public QueryResult<Map> page(int pageIndex, int pageSize, String categray, String day) {
		return shopService.page(pageIndex+1, pageSize, categray, day);
	}

}
