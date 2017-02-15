package com.bi.platform.platformaccount.controller;


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
import   com.bi.platform.platformaccount.bean.PlatformAccount;
import   com.bi.platform.platformaccount.server.IPlatformAccountService;

/***
	*平台账号
@author lianxiaoshan
***/
@Controller
@RequestMapping("/platform/platformAccount")
public class PlatformAccountController   { 

	protected static final Logger logger = Logger.getLogger(PlatformAccountController.class);
	@Autowired
	private  IPlatformAccountService service ;

}