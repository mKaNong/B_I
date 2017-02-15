package com.bi.platform.analyze.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.utils.qw.hf.DateUtils;

@Service
public class IndexService implements IIndexService{

	protected static final Logger logger = Logger.getLogger(IndexService.class);
	
	/**
	 * 服务类的基类，此类适合纯SQL查询操作
	 */
	@Autowired
	private IBaseMemcacheService sqlService;
	
	/**
	 * 缓存
	 */
	@Autowired
	private CacheService cacheService;

	//运营概况
	String overviewSql = "SELECT uv,loss_rate,pv,avg_res_time,avg_bro_vol,pay_amount,guest_unit_price,pay_ordernum,pay_custs,ordernum,pay_rate,pay_pronum,(SELECT SUM(f.pro_num) from (SELECT pro_num FROM fact_pro_num WHERE timeid = (SELECT max(timeid) FROM fact_pro_num))f)as num FROM fact_overview_sum where time_markid='1' AND ORGID=?";
	//类目
	String categorySql = "select first_name from dim_category ";
	//地域
	String areaSql = "select province_name from dim_area_prov ";
	//在线商品数
	String onlineProNumSql = "select timeid,sum(pro_num) as num FROM fact_pro_num ";
	
	@Override
	public Map index() {
		String orgid = UserType.getPlatform().getPlatformCode();
		Map result = new HashMap();
		List<Map> overviewList = null;
		List<Map> categoryList = null;
		List<Map> areaList = null;
		String overviewKey = this.getClass().getName() + "_overviewList_" + orgid;
		String categoryKey = this.getClass().getName() + "_categoryList_" + orgid;
		String areaKey = this.getClass().getName() + "_areaList_" + orgid;	
		//运营数据 缓存
		Object overview = cacheService.get(overviewKey);
		if(overview != null){
			overviewList = (List<Map>) overview;
		} else {
			overviewList = sqlService.localsqlaccountMap(overviewSql, new Object[] { orgid });
			cacheService.set(overviewKey, overviewList, DateUtils.DateAdd(new Date(), 1));
		}
		//类目缓存
		Object categoryObj = cacheService.get(categoryKey);
		if(categoryObj != null){
			categoryList = (List<Map>) categoryObj;			
		} else {
			categoryList = sqlService.localsqlaccountMap(categorySql, new Object[] {  });
			cacheService.set(categoryKey, categoryList, DateUtils.DateAdd(new Date(), 1));
		}
		//地域缓存
		Object areaObj = cacheService.get(areaKey);
		if(areaObj != null){
			areaList = (List<Map>) areaObj;
		} else {
			areaList = sqlService.localsqlaccountMap(areaSql, new Object[] {  });
			cacheService.set(areaKey, areaList, DateUtils.DateAdd(new Date(), 1));
		}
		
		if(overviewList != null){
			if(overviewList.size() > 0){
				result.put("overviewList", overviewList.get(0));
			}
		}
		result.put("categoryList", categoryList);
		result.put("areaList", areaList);
		
		return result;
	}


	
	/**
	 * 在线商品数  
	 * 
	 * @param date 7天 30天 6个月  1年
	 * @return
	 */
	@Override
	public List<Map> onlineProNum(String date) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> onlineProNumList = null;
		String onlineProNumKey = this.getClass().getName() + "_onlineProNumList_" + orgid + date;
		StringBuffer whereBuffer = new StringBuffer();	  
		if(date!=null && date.equals("1")){
			whereBuffer.append("  where timeid >DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
		}
		if(date!=null && date.equals("2")){
			whereBuffer.append("  where  timeid >DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
		}
		if(date!=null && date.equals("3")){
			whereBuffer.append("  where  timeid >DATE_SUB(CURDATE(), INTERVAL 6 month) and timeid<=CURDATE() ");
		}
		if(date!=null && date.equals("4")){
			whereBuffer.append("  where  timeid >DATE_SUB(CURDATE(), INTERVAL 1 year) and timeid<=CURDATE() ");
		}
		whereBuffer.append(" and ORGID=? GROUP BY timeid");
		Object obj = cacheService.get(onlineProNumKey);
		if(obj != null){
			onlineProNumList = (List<Map>) obj;
		} else {
			onlineProNumList = sqlService.localsqlaccountMap(onlineProNumSql + whereBuffer.toString(), new Object[] {orgid});
			cacheService.set(onlineProNumKey, onlineProNumList, DateUtils.DateAdd(new Date(), 1));
		}
		 return onlineProNumList;
	}

}
