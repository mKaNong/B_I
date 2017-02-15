package com.bi.platform.index;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.IBusStatusService;
import com.bi.platform.analyze.service.IIndexService;
import com.bi.platform.analyze.service.IMemberService;
import com.bi.platform.analyze.service.IShopService;

/**
 * 平台首页
 * 
 * @author xuerming
 *
 */
@Controller
@RequestMapping("/platform/index")
public class IndexController {

	protected static final Logger logger = Logger.getLogger(IndexController.class);

	@Autowired
	private IIndexService homePageService;
	@Autowired
	private IBusStatusService busStatusService;
	@Autowired
	private IShopService ishopService;
	@Autowired
	private IMemberService IMemberService;
	

	/**
	 * 平台首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("result", homePageService.index());
		return "/platform/index/index";
	}

	/**
	 * 运营概况 昨天 近7日 近30日
	 * 
	 * @param date
	 * @return
	 */
	@RequestMapping(value = "/query/factoverviewsum")
	@ResponseBody
	public Map factOverviewSum(String date) {

		return busStatusService.overview(date);

	}

	/**
	 * 流量交易趋势
	 * 
	 * @param date
	 * @return
	 */
	@RequestMapping(value = "/query/factoverview")
	@ResponseBody
	public List<Map> factOverview(@RequestParam(value = "date", defaultValue = "2") String date) {
		return busStatusService.trend(date);

	}

	/**
	 * 在线商品数
	 * 
	 * @param date
	 *            7天 30天 6个月 1年
	 * @return
	 */
	@RequestMapping(value = "/query/factpronum")
	@ResponseBody
	public List<Map> factProNum(String date) {

		return homePageService.onlineProNum(date);

	}

	/**
	 * 新增会员
	 * 
	 * @param date
	 *            7天 30天 6个月 1年
	 * @return
	 */
	@RequestMapping(value = "/query/factcustssum{date}")
	@ResponseBody
	public List<Map> factCustsSum(String date) {

		return IMemberService.newMember(date);
	}

	/**
	 * 店铺入住数量
	 * 
	 * @param startDate
	 *            起始时间
	 * @param endDate
	 *            结束时间
	 * @param categoryId
	 *            类目
	 * @param areaId
	 *            地域
	 * @return
	 * 
	 */
	@RequestMapping(value = "/query/factstoreinfo")
	@ResponseBody
	public List<Map> factStoreinfo(String startDate, String endDate, @RequestParam(value = "category", defaultValue = "所有类目") String category,
			@RequestParam(value = "area", defaultValue = "所有地域") String area) {

		return ishopService.storeInNum(startDate, endDate, category, area);

	}

	/**
	 * 菜单
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/menu")
	public String menu(String id,Model model) {
		model.addAttribute("memuid", id);
		return "/common/platform_menu";

	}
}
