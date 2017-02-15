package com.bi.platform.analyze.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.utils.qw.hf.DateUtils;
/**运营概况*/
@Service
public class BusStatusService implements IBusStatusService{
	
	/**
	 * 服务类的基类，此类适合纯SQL查询操作
	 */
	@Autowired
	private IBaseMemcacheService service;

	/**
	 * 缓存
	 */
	@Autowired
	private CacheService cacheService;
	
	//运营概况
	String overviewSql = "select uv,loss_rate,pv,avg_res_time,avg_bro_vol,pay_amount,guest_unit_price,pay_ordernum,pay_custs,ordernum,pay_rate,pay_pronum,(SELECT SUM(f.pro_num) from (SELECT pro_num FROM fact_pro_num WHERE timeid = (SELECT max(timeid) FROM fact_pro_num))f)as num FROM fact_overview_sum where time_markid='1' AND orgid=?";
	//转化率
	String rateIndexSql = "select ROUND((uv-t_uv)*100/t_uv,2) as uv_rate,ROUND((order_custs-t_order_custs)*100/t_order_custs,2) as order_custs_rate,ROUND((order_amount-t_order_amount)*100/t_order_amount,2) as order_amount_rate,ROUND((pay_custs-t_pay_custs)*100/t_pay_custs,2) as pay_custs_rate,ROUND((pay_amount-t_pay_amount)*100/t_pay_amount,2) as pay_amount_rate,ROUND((guest_unit_price-t_guest_unit_price)*100/t_guest_unit_price,2) as guest_unit_price_rate,uv,order_custs,order_amount,pay_custs,pay_amount,guest_unit_price,order_rate,order_pay_rate,pay_rate from fact_overview_sum where time_markid='1' AND ORGID=? ";
	//运营(日期 date)
	String factOverviewSql = "select uv,loss_rate,pv,avg_res_time,avg_bro_vol,pay_amount,guest_unit_price,pay_ordernum,pay_custs,ordernum,pay_rate,pay_pronum,(SELECT SUM(f.pro_num) from (SELECT pro_num FROM fact_pro_num WHERE timeid = (SELECT max(timeid) FROM fact_pro_num))f)as num FROM fact_overview_sum where orgid=?";
	//流量交易趋势
	String trendSql= "select * from fact_overview_trend ";
	//转化率
	String rateSql = "select ROUND((uv-t_uv)*100/t_uv,2) as uv_rate,ROUND((order_custs-t_order_custs)*100/t_order_custs,2) as order_custs_rate,ROUND((order_amount-t_order_amount)*100/t_order_amount,2) as order_amount_rate,ROUND((pay_custs-t_pay_custs)*100/t_pay_custs,2) as pay_custs_rate,ROUND((pay_amount-t_pay_amount)*100/t_pay_amount,2) as pay_amount_rate,ROUND((guest_unit_price-t_guest_unit_price)*100/t_guest_unit_price,2) as guest_unit_price_rate,uv,order_custs,order_amount,pay_custs,pay_amount,guest_unit_price,order_rate,order_pay_rate,pay_rate from fact_overview_sum where orgid= ? ";
	
	@Override
	public Map index() {
		String orgid = UserType.getPlatform().getPlatformCode();
		Map result = new HashMap();
		//运营
		List<Map> overviewList = null;
		String overviewKey = this.getClass().getName() + "_overviewList_" + orgid;
		//转化率		
		List<Map> rateIndexList = null;
		String rateIndexKey = this.getClass().getName() + "_rateIndexList_" + orgid;
		
		//运营数据 缓存
		Object overview = cacheService.get(overviewKey);
		if(overview != null){
			overviewList = (List<Map>) overview;
		} else {
			overviewList = service.localsqlaccountMap(overviewSql, new Object[] { orgid });
			cacheService.set(overviewKey, overviewList, DateUtils.DateAdd(new Date(), 1));
		}
		//转化率
		Object rateobj = cacheService.get(rateIndexKey);
		if(rateobj != null){
			rateIndexList = (List<Map>) rateobj;
		} else {
			rateIndexList = service.localsqlaccountMap(rateIndexSql, new Object[] { orgid });
			cacheService.set(rateIndexKey, rateIndexList, DateUtils.DateAdd(new Date(), 1));
		}
		
		if(overviewList != null){
			if(overviewList.size() > 0){
				result.put("overviewList", overviewList.get(0));
			}
		}
		if(rateIndexList != null){
			if(rateIndexList.size() > 0){
				result.put("rateIndexList", rateIndexList.get(0));
			}
		}

		return result;
	}
	
	
	/**
	 * 运营概况 昨天 近7日 近30日
	 * 
	 * @param date
	 * @return
	 */
	@Override
	public Map overview(String date) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> factOverviewList = null;
		String factOverviewKey = this.getClass().getName() + "_factVList_" + orgid + date;
		List params = new ArrayList();
		params.add(orgid);
		StringBuffer whereBuffer = new StringBuffer();		
		whereBuffer.append(" and TIME_MARKID=? ");
		params.add(date);
		Object obj = cacheService.get(factOverviewKey);
		if(obj != null){
			factOverviewList = (List<Map>) obj;
		} else {
			factOverviewList = service.localsqlaccountMap(factOverviewSql + whereBuffer.toString(), params.toArray());	
			cacheService.set(factOverviewKey, factOverviewList, DateUtils.DateAdd(new Date(), 1));
		}
		if(factOverviewList != null){
			if(factOverviewList.size() > 0){
				Map map = factOverviewList.get(0);
				return map;
			}
		}
		return null;
	}
	
	
	/**
	 * 流量交易趋势
	 * 
	 * @param date 1 昨日 2近7天 3近30天
	 * @return
	 */
	@Override
	public List<Map> trend(String date) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> trendList = null;
		String trendKey = this.getClass().getName() + "_trendList_" + orgid + date;
        StringBuffer whereBuffer = new StringBuffer();
		if(date.equals("1")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 1 day) ");
		}
		if(date.equals("2")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 7 day) ");
		}
		if(date.equals("3")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 30 day) ");
		}
		whereBuffer.append(" and timeid<=CURDATE() and ORGID=? ORDER BY timeid");
		
		Object obj = cacheService.get(trendKey);
		if(obj != null){
			trendList = (List<Map>) obj;
		} else {
			trendList = service.localsqlaccountMap(trendSql+whereBuffer.toString(), new Object[] {orgid});
			cacheService.set(trendKey, trendList, DateUtils.DateAdd(new Date(), 1));
		}
		
		return trendList;
	        	
	}

	
	/**
	 * 转化率
	 * @param date 1为昨日  2为近7日  3为近30日
	 * @return 
	 */
	@Override
	public Map rate(String date) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> rateList = new ArrayList();
		List params = new ArrayList();
		String rateKey = this.getClass().getName() + "_rateList_" + orgid + date;
		params.add(orgid);
		StringBuffer whereBuffer = new StringBuffer();	
		if(date != null){
			if(params.size()>0){
				whereBuffer.append(" and ");
			}
			whereBuffer.append(" time_markid=? ");
			params.add(date);			
		}
		
		Object object = cacheService.get(rateKey);
		if(object!=null){
			rateList = (List<Map>) object;
		} else {
			rateList = service.localsqlaccountMap(rateSql + whereBuffer.toString(), params.toArray());
			cacheService.set(rateKey, rateList, DateUtils.DateAdd(new Date(), 1));
		}
		if(rateList != null){
			if(rateList.size() > 0){
				return rateList.get(0);
			}
		}
		return null;
	}

}
