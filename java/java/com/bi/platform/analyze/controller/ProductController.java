package com.bi.platform.analyze.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.IProductService;
import com.jpa.qw.hf.utils.QueryResult;

/**
 * 运营分析--商品分析
 * 
 * @author lxs
 *
 */
@Controller
@RequestMapping("/platform/analyze/product")
public class ProductController {
	@Autowired
	private IProductService productService;
	
	protected static final Logger logger = Logger.getLogger(ProductController.class);

	@RequestMapping("/index")
	public String index(Model model) {
		productService.index(model);
		return "/platform/analyze/product/index";
	}

	/**
	 * 在线商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 */
	@RequestMapping("/onlineProductNum")
	public @ResponseBody Map onlineProduct(String day) {
        return productService.onlineProduct(day);
	}

	/**
	 * 被下单商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	@RequestMapping("/placedProduct")
	public @ResponseBody List<Map> buyProduct(String day, String channelId) {
		
		return productService.buyProduct(day, channelId);
	}

	/**
	 * 被支付商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	@RequestMapping("/paidProductNum")
	public @ResponseBody List<Map> payProduct(String day, String channelId) {
		return productService.payProduct(day, channelId);
	}

	/**
	 * 商品排行
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目 product_name 商品名 pv 浏览器 uv 访客数 pay_qty 成交量 pay_amount支付金额
	 *            zhl转化率
	 */
	@RequestMapping("/productRank")
	public @ResponseBody QueryResult<Map> orderbyProduct(int pageIndex, int pageSize, String day, String s, String e) {
		return productService.orderbyProduct(day, pageIndex + 1, pageSize, s, e);
	}
}
