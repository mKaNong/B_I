package com.bi.platform.analyze.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bi.utils.CacheUtils;
import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.utils.qw.hf.DateUtils;

/**
 * 运营分析--交易构成
 * 
 * @author lxs
 *
 */
@Service
public class TradeFormService implements ITradeFormService {
	// 支付买家数分布--性别
	private String sexSql = "SELECT sex_name,sum(pay_custs) as num from fact_cust_trade_all where orgid=? ";
	// 支付买家数分布--等级
	private String levelSql = "SELECT level_name,sum(pay_custs) as num from fact_cust_trade_all where orgid=? ";
	// 支付买家数分布--年龄
	private String ageSql = "select agegroup,sum(pay_custs) as num from fact_cust_trade_all where orgid=? ";
	// 支付买家数分布--新老会员
	private String isnewSql = "select isnew_name,sum(pay_custs)  as num from fact_cust_trade_all where orgid=? ";
	// 支付买家数分布--区域
	private String areaSql = "SELECT area_name,sum(pay_custs) as num,ROUND(sum(pay_custs)*100/(select sum(f.num) from (SELECT area_name,sum(pay_custs) as num from fact_cust_trade_all GROUP BY area_name )f),2) as rate from fact_cust_trade_all where orgid =? ";
	// 渠道分析饼图
	private String channelSqlm = "SELECT st.num,dt.type  from  (SELECT sum(uv) num , typeid,orgid   from fact_flow_srctype  fts  "
			+ " where  fts.days >DATE_SUB(CURDATE(), INTERVAL ? day) and fts.days<=CURDATE() and fts.orgid=?  GROUP BY fts.typeid) st INNER JOIN dim_src_type  dt on dt.typeid=st.typeid ";
	// 渠道详细
	private String qudaoInfo = "select uv,pv,pjfwl,tsl ,dt.type,stoptime from (select typeid,  sum(uv)  uv,sum(pv) pv ,ROUND(sum(pv)/sum(uv),2) pjfwl,ROUND(sum(res_time) *100/sum(pv),2) stoptime,ROUND(sum(one_visit_uv)*100/sum(uv),2) tsl  from fact_flow_srctype where orgid=? GROUP BY typeid) srctype INNER JOIN dim_src_type dt on dt.typeid=srctype.typeid ORDER BY  uv desc ";
	//点击数--一级类目
	private String clicksChannel = "select first_chan_name from fact_chan_click where orgid=? GROUP BY first_chan_name ";	
	private String cname = TradeFormService.class.getName();
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

	public void index(Model model) {
		// 详情 pay_camount支付金额,pay_custs支付买家数,pay_qty成义量,kdj客单价,zfl转化率
				String platformCode = UserType.getPlatform().getPlatformCode();
				String key = cname + "_index_" + platformCode;
				String channelkey = cname + "_index_channel_trend" + platformCode;//一级类目
				List<Map> channelList = null;
				Object channelcache = cacheService.get(channelkey);
				if (channelcache != null) {
					channelList = (List<Map>) channelcache;
				} else {
					channelList = service.localsqlaccountMap(clicksChannel, new Object[] { platformCode });
					if (channelList != null && channelList.size() > 0) {
						cacheService.set(key, channelList, DateUtils.DateAdd(new Date(), 1));
					}
				}
				model.addAttribute("channelList", channelList);//点周数用的一级类目下拉
	}

	/**
	 * 支付买家数分布 由于较为固定可以缓存一天
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public Map<String, List<Map>> payCusts(String day) {
		String orgid = UserType.getPlatform().getPlatformCode();
		Map<String, List<Map>> result = new HashMap<String, List<Map>>();
		StringBuffer buff = new StringBuffer();
		if (day != null) {
			if (day.equals("1")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 1 day) and timeid<=CURDATE() ");
			} else if (day.equals("2")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
			} else if (day.equals("3")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
			}
		} 
		String key = cname + "_payCusts_" + orgid + day;
		Object cache = cacheService.get(key);
		if (cache != null) {
			result = (Map<String, List<Map>>) cache;
		} else {
			List<Map> sexlist = service.localsqlaccountMap(sexSql + buff.toString() + " GROUP BY sex ", new Object[] { orgid });
			List<Map> levellist = service.localsqlaccountMap(levelSql + buff.toString() + " GROUP BY level_name", new Object[] { orgid });
			List<Map> agelist = service.localsqlaccountMap(ageSql + buff.toString() + " GROUP BY agegroup", new Object[] { orgid });
			List<Map> isnewlist = service.localsqlaccountMap(isnewSql + buff.toString() + " GROUP BY isnew_name", new Object[] { orgid });

			result.put("levellist", levellist);
			result.put("sexlist", sexlist);
			result.put("agelist", agelist);
			result.put("isnewlist", isnewlist);
			if (levellist != null && levellist.size() > 0) {
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
			}
		}
		return result;
	}

	
	public List<Map> areaTrade(){
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = cname + "_areaTrades_" + orgid ;
		List<Map> result = null;
		Object obj = cacheService.get(key);
		if(obj != null){
			result = (List<Map>) obj;
		}else{
			result = service.localsqlaccountMap(areaSql + " GROUP BY area_name order by num desc ", new Object[]{ orgid});
			if(result !=null && result.size() > 0){
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
			}
		}
		
		return result;
	}
	
	
	
	/**
	 * 终端分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public void terminal(String day) {
		// 暂不做了
	}

	/**
	 * 渠道分析由于较为固定可以缓存一天 fact_trade_srctype
	 * 
	 * @param day
	 *            1为昨天2为7天3为30天
	 * @param model
	 */
	public Map channel(String day) {
		Map<String, List<Map>> result = new HashMap<String, List<Map>>();
		String orgid = UserType.getPlatform().getPlatformCode();
		List params1 = new ArrayList();
		String key = cname + "_channel_" + orgid + day;
		Object cache = cacheService.get(key);
		if (cache != null) {
			result = (Map<String, List<Map>>) cache;
		} else {
			List listMap = new ArrayList();
			List<Map> typeList = service.localsqlaccountMap("select typeid,type,orgid from dim_src_type where orgid=?", new Object[] { orgid });
			if (typeList != null && typeList.size() > 0) {
				List params = new ArrayList();
				params.add(orgid);
				if (day != null) {
					if (day.equals("1")) {
						params1.add("1");
						for (Map map : typeList) {
							List<Map> list = service.localsqlaccountMap(
									"SELECT st.num,dt.type,hours as days from (SELECT sum(uv) num , typeid,orgid,hours from fact_trade_srctype  fts where days  >DATE_SUB(CURDATE(), INTERVAL 1 day) and days<=CURDATE()  "
											+ " and fts.orgid=? and fts.typeid=? GROUP BY fts.hours) st INNER JOIN dim_src_type   dt on dt.typeid=st.typeid  ORDER BY hours asc ", new Object[] {
											orgid, map.get("typeid") });
							if (list != null && list.size() > 0) {
								listMap.add(list);
							}
						}
					} else if (day.equals("2")) {
						params1.add("7");
						for (Map map : typeList) {
							List<Map> list = service
									.localsqlaccountMap(
											" SELECT st.num,dt.type,days from  (SELECT sum(uv) num , typeid,orgid,days   from fact_trade_srctype  fts where days  >DATE_SUB(CURDATE(), INTERVAL 7 day) and days<=CURDATE() and fts.orgid=? and fts.typeid=? GROUP BY fts.days) st "
													+ " INNER JOIN dim_src_type   dt on dt.typeid=st.typeid  ORDER BY days asc", new Object[] { orgid, map.get("typeid") });
							if (list != null && list.size() > 0) {
								listMap.add(list);
							}
						}
					} else if (day.equals("3")) {
						params1.add("30");
						for (Map map : typeList) {
							List<Map> list = service
									.localsqlaccountMap(
											" SELECT st.num,dt.type,days from  (SELECT sum(uv) num , typeid,orgid,days from fact_trade_srctype  fts where days >DATE_SUB(CURDATE(), INTERVAL 30 day) and days<=CURDATE() and fts.orgid=? and fts.typeid=? GROUP BY fts.days) st "
													+ " INNER JOIN dim_src_type   dt on dt.typeid=st.typeid  ORDER BY days asc", new Object[] { orgid, map.get("typeid") });
							if (list != null && list.size() > 0) {
								listMap.add(list);
							}
						}
					}
				}
				params1.add(orgid);
                List<Map> channelInfoList = service.localsqlaccountMap(qudaoInfo, params.toArray());
				List<Map> channelm = service.localsqlaccountMap(channelSqlm, params1.toArray());
				result.put("channelm", channelm);// 饼图
				result.put("channelline", listMap);// 曲线
				result.put("channelInfoList",channelInfoList);
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
			}
		}
		return result;
	}

}
