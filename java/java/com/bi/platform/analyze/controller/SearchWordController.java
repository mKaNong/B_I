package com.bi.platform.analyze.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.ISearchWordService;
import com.jpa.qw.hf.utils.QueryResult;

@Controller
@RequestMapping("/platform/analyze/searchWord")
public class SearchWordController {

	@Autowired
	private ISearchWordService searchWordsService;

	@RequestMapping("/index")
	public String index(Model model) {
		//model.addAttribute("result", searchWordsService.index());
		return "/platform/analyze/searchWord/index";
	}

	@RequestMapping("/load")
	@ResponseBody
	public Map loadWord () {
		return searchWordsService.load();
	}
	
	
	/**
	 * 搜索词
	 * 
	 * @param day
	 * @return
	 */
	@RequestMapping("/searchWordDate")
	@ResponseBody
	public Map searchWordDate(String day) {
		return searchWordsService.SearchWord(day);
	}

	/**
	 * 日搜
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/daySearch")
	public String daySearchWord(Model model) {

		return "/platform/analyze/searchWord/daySearch";
	}

	/**
	 * 日搜排序
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/daySearchWord")
	@ResponseBody
	public QueryResult<Map> daySearchWord(int pageIndex, int pageSize) {

		return searchWordsService.daySearchWord(pageIndex + 1, pageSize);
	}

	/**
	 * 周搜
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/weekSearch")
	public String weekSearchWord(Model model) {
		return "/platform/analyze/searchWord/weekSearch";
	}

	/**
	 * 周搜排序
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/weekSearchWord")
	@ResponseBody
	public QueryResult<Map> weekSearchWord(int pageIndex, int pageSize) {

		return searchWordsService.weekSearchWord(pageIndex + 1, pageSize);
	}

	/**
	 * 月搜
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/monthSearch")
	public String monSearchWord(Model model) {
		return "/platform/analyze/searchWord/monthSearch";
	}

	@RequestMapping("/monthSearchWord")
	@ResponseBody
	public QueryResult<Map> monthSearchWord(int pageIndex, int pageSize) {

		return searchWordsService.monthSearchWord(pageIndex + 1, pageSize);
	}

	/**
	 * 搜索词 排序
	 * 
	 * @param pageIndex
	 *            页码
	 * @param pageSize
	 *            每页数
	 * @param day
	 *            日期
	 * @return
	 */
	@RequestMapping("/searchOrder")
	@ResponseBody
	public QueryResult<Map> orderBySearch(int pageIndex, int pageSize,
			@RequestParam(value = "day", defaultValue = "1") String day) {

		return searchWordsService.orderByCategory(pageIndex + 1 , pageSize, day);
	}

}
