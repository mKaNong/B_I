package com.bi.platform.shoptype.controller;


import   org.apache.log4j.Logger;
import   org.springframework.beans.factory.annotation.Autowired;
import   org.springframework.stereotype.Controller;
import   javax.servlet.http.HttpServletRequest;
import   org.springframework.stereotype.Controller;
import   org.springframework.ui.Model;
import   org.springframework.web.bind.annotation.PathVariable; 
import   org.springframework.web.bind.annotation.RequestMapping; 
import   org.springframework.web.bind.annotation.RequestMethod; 
import   org.springframework.web.bind.annotation.RequestParam; 
import   org.springframework.web.bind.annotation.ResponseBody; 
import   org.springframework.web.multipart.MultipartFile; 
import   com.framework.qw.hf.bean.BaseBeanModel; 
import   com.jpa.qw.hf.utils.ResultMode; 
import   com.jpa.qw.hf.utils.QueryResult; 
import   com.bi.platform.shoptype.bean.ShopType;
import   com.bi.platform.shoptype.server.IShopTypeService;

/***
	*店铺类别
@author lianxiaoshan
***/
@Controller
@RequestMapping("/platform/shopType")
public class ShopTypeController   { 

	protected static final Logger logger = Logger.getLogger(ShopTypeController.class);
	@Autowired
	private  IShopTypeService service ;

	/**列表查询**/
 	@RequestMapping(value = "/list")
 	public String list(int pageNo,int pageSize,Model model) {
		QueryResult<ShopType> result =service.getScrollData(pageNo,pageSize,null,null,null);
		model.addAttribute("list", result);
 		return "platform/shoptype/list";
	}

	/**新增页**/
 	@RequestMapping(value = "/addUI")
 	public String addUI(Model model) {
		return "platform/shoptype/addUI";
	}

	/**保存**/
 	@RequestMapping(value = "/save")
 	public String save(ShopType shoptype  ,Model model,HttpServletRequest request) {
		service.save(shoptype);
		model.addAttribute("url", request.getRequestURL().toString()+"?"+request.getQueryString());
 		model.addAttribute("msg", "save");
 		return "platform/shoptype/success";
	}

	/**修改页**/
 	@RequestMapping(value = "/updateUI")
 	public String updateUI(String uuid,Model model) {
		model.addAttribute("shoptype", service.getByUuid(uuid));
 		return "platform/shoptype/updateUI";
	}

	/**修改**/
 	@RequestMapping(value = "/update")
 	public String update(ShopType shoptype,Model model,HttpServletRequest request) {
		service.update(shoptype );
		model.addAttribute("url", request.getRequestURL().toString()+"?"+request.getQueryString());
 		model.addAttribute("msg", "update");
 		return "platform/shoptype/success";
	}

	/**删除直接跳页面**/
 	@RequestMapping(value = "/delete")
 	public   String  delete(String uuid,Model model,HttpServletRequest request) {
		service.delete(uuid);
		model.addAttribute("msg", "delete");
 		model.addAttribute("url", request.getRequestURL().toString()+"?"+request.getQueryString());
 		return "platform/shoptype/success";
	}

	/**删除返回值为json**/
 	@RequestMapping(value = "/deleteJson")
 	public @ResponseBody ResultMode deleteJson(String uuid,Model model) {
		return service.delete(uuid);
		 
	}

}