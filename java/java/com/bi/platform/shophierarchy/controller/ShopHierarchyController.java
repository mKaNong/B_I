package com.bi.platform.shophierarchy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bi.platform.newmembersetting.bean.NewMemberSetting;
import com.bi.platform.newmembersetting.server.INewMemberSettingService;
import com.bi.platform.shophierarchy.bean.ShopHierarchy;
import com.bi.platform.shophierarchy.server.IShopHierarchyService;
import com.bi.utils.UserType;
import com.jpa.qw.hf.utils.ResultMode;

/***
 * 店铺层级
 * 
 * @author lianxiaoshan
 ***/

@Controller
@RequestMapping("/platform/shopHierarchy")
public class ShopHierarchyController {

	protected static final Logger logger = Logger.getLogger(ShopHierarchyController.class);
	@Autowired
	private IShopHierarchyService service;
	@Autowired
	private INewMemberSettingService nmemService;

	/** 新增页 **/
	@RequestMapping(value = "/index")
	public String index(Model model) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> memlist = nmemService.localsqlaccountMap(" select * from new_member_setting where platform_account=? ", new Object[] { orgid });
		if (memlist != null && memlist.size() > 0) {
			model.addAttribute("memlist", memlist.get(0));
		}

		List<Map> shoplist = nmemService.localsqlaccountMap(" select * from shop_hierarchy where orgid=? ", new Object[] { orgid });
		model.addAttribute("shoplist", JSONArray.fromObject(shoplist).toString());
		return "platform/shophierarchy/setting";
	}

	/** 保存店铺层级 **/
	@RequestMapping(value = "/saveshop")
	@ResponseBody
	public ResultMode saveshop(String listVo, Model model, HttpServletRequest request) {
		JSONArray array = JSONArray.fromObject(listVo);
		String orgid = UserType.getPlatform().getPlatformCode();
		for (int i = 0; i < array.size(); i++) {
			ShopHierarchy shopHierarchy = (ShopHierarchy) JSONObject.toBean(array.getJSONObject(i), ShopHierarchy.class);
			shopHierarchy.setPlatformUuid(orgid);
			if (shopHierarchy.getUuid() != null && !"".equals(shopHierarchy.getUuid().trim())) {
				service.update(shopHierarchy);
			} else {
				service.save(shopHierarchy);
			}
		}

		ResultMode result = new ResultMode("1", null, null);
		return result;
	}

	/** 保存新会员设置 **/
	@RequestMapping(value = "/saveNewMember")
	@ResponseBody
	public ResultMode saveNewMember(NewMemberSetting mem, Model model, HttpServletRequest request) {
		String orgid = UserType.getPlatform().getPlatformCode();
		if (mem.getUuid() != null) {
			mem.setPlatformAccount(orgid);
			nmemService.update(mem);

		} else {
			mem.setPlatformAccount(orgid);
			nmemService.save(mem);
		}
		ResultMode result = new ResultMode("1", mem.getUuid(), null);
		return result;
	}

}