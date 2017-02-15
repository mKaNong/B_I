package com.bi.platform.analyze.controller;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.analyze.service.IMemberService;

/**
 * 平台---会员分析
 * 
 * @author liangxiaoshan
 *
 */
@Controller
@RequestMapping("/platform/analyze/member")
public class MemberAnalyzeController {

	protected static final Logger logger = Logger
			.getLogger(MemberAnalyzeController.class);

	@Autowired
	private IMemberService service;

	@RequestMapping("/index")
	public String index(Model model,String mvalue) {
		model.addAttribute("result", service.index(mvalue));
		return "platform/analyze/member/index";
	}

	/**
	 * 新增会员
	 * 
	 * @param day
	 *            1为7天 2为30天 3为6个月 4为1年
	 * @return
	 */
	@RequestMapping("/newMember")
	public @ResponseBody List<Map> newMember(String date) {
		return service.newMember(date);
	}

	/**
	 * 会员分布--等级
	 * 
	 * @return
	 */
	@RequestMapping("/memlevel")
	public String memlevel(Model model) {
		List<Map> memlevel = service.memlevel();
		model.addAttribute("result", memlevel);
		model.addAttribute("resultjson", JSONArray.fromObject(memlevel));
		return "platform/analyze/member/memlevel";
	}

	/**
	 * 会员分布--新老
	 * 
	 * @return
	 */
	@RequestMapping("/memnewold")
	public String memnewold(Model model) {
		List<Map> memnewold = service.memnewold();
		model.addAttribute("result", memnewold);
		model.addAttribute("resultjson", JSONArray.fromObject(memnewold));
		return "platform/analyze/member/memnewold";
	}

	/**
	 * 会员分布--年龄
	 * 
	 * @return
	 */
	@RequestMapping("/memage")
	public String memage(Model model) {
		List<Map> memage = service.memage();
		model.addAttribute("result", memage);
		model.addAttribute("resultjson", JSONArray.fromObject(memage));
		return "platform/analyze/member/memage";
	}

	/**
	 * 会员分布--性别
	 * 
	 * @return
	 */
	@RequestMapping("/memsex")
	public String memsex(Model model) {
		List<Map> memsex = service.memsex();
		model.addAttribute("result", memsex);
		model.addAttribute("resultjson", JSONArray.fromObject(memsex));
		return "platform/analyze/member/memsex";
	}

	/**** 会员价值 **/
	@RequestMapping("/memValue")
	public String memValue(String vm,Model model) {
		model.addAttribute("result", service.memValue(vm)) ;
        return "platform/analyze/member/memValue";
	}

	/**** 查看画像 **/
	@RequestMapping("/viewPortrait")
	public @ResponseBody List<Map> viewPortrait(String id) {
		return service.viewPortrait(id);

	}

	/**
	 * 会员画像
	 * 
	 * @param pageIndex
	 *            页码
	 * @param pageSize
	 *            显示大小
	 * @param where
	 *            条件 key为数据库字段value为实际值 页面上name="mapVo['a']" 这个a就是key
	 *            mapVo是where内部变量
	 * @return
	 */
	@RequestMapping("/huaxiang")
	@ResponseBody
	public Map huaxiang(int pageIndex, int pageSize, String sex, String age,
			String consume, String level, String area) {

		return service.huaxiang(pageIndex + 1, pageSize, sex, age, consume,level, area);
	}
	@RequestMapping("/down")
	public String down(Model model,String mvalue){
		model.addAttribute("result", service.index(mvalue));
		return "platform/analyze/member/down";
	}
}
