package com.bi.platform.analyze.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 帮助中心
 *
 */
@Controller
@RequestMapping(value = "/platform/help")
public class HelpCenterController {
	
	 
	
	protected static final Logger logger = Logger.getLogger(HelpCenterController.class);
	
	/**帮助中心（指标注释）页面*/
	@RequestMapping(value = "/index")
	public String getHelpList(Model model){
		 
		return "/platform/help/index";
	}
	
	
	
	
	


}
