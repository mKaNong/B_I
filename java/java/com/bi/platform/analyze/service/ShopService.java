package com.bi.platform.analyze.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.jpa.qw.hf.utils.QueryResult;
import com.utils.qw.hf.DateUtils;

/****
 * 店铺分析
 * 
 * ***/
@Service
public class ShopService implements IShopService {
	// 分类分析
	private String dicSql = "SELECT	category_name,sum(store_num) AS num,ROUND(sum(store_num) * 100 / (SELECT sum(store_num) FROM fact_storeinfo_all),2) AS rate FROM fact_storeinfo_all WHERE orgid =? GROUP BY	category_name ORDER BY num DESC ";

	// 地域分析
	private String areaSql = "SELECT area_name,	sum(store_num) AS num,ROUND(sum(store_num) * 100 / (SELECT sum(store_num) AS num FROM fact_storeinfo_all),2) AS rate FROM fact_storeinfo_all WHERE	orgid = ? GROUP BY area_name ORDER BY num DESC ";

	// 店铺入住数量
	private String proInNumSql = "select a.timed,ifnull(sum(store_num),0) as num from dim_time a LEFT JOIN fact_storeinfo_all b on a.timed=b.timeid  ";
	private String categorysql = "select first_name from dim_category  ";
	private String area_sql = "select province_name from dim_area_prov ";

	protected static final Logger logger = Logger.getLogger(ShopService.class);

	private String levelSql = "select time_mark,CASE "
			+ "WHEN pay_amount <= 1000 THEN '第一层级' "
			+ "WHEN pay_amount > 1000 and pay_amount <= 5000 THEN '第二层级' "
			+ "WHEN pay_amount > 5000 AND pay_amount <= 10000 THEN '第三层级' "
			+ "WHEN pay_amount > 10000 AND pay_amount <= 20000 THEN '第四层级' "
			+ "WHEN pay_amount > 20000 THEN '第五层级' "
			+ "END '店铺层级', "
			+ "count(store_id) '店铺数' FROM  store_level_base   where orgid=?  GROUP BY  time_markid, "
			+ "CASE " + "WHEN pay_amount <= 1000 THEN '第一层级' "
			+ "WHEN pay_amount > 1000 and pay_amount <= 5000 THEN '第二层级' "
			+ "WHEN pay_amount > 5000 AND pay_amount <= 10000 THEN '第三层级' "
			+ "WHEN pay_amount > 10000 AND pay_amount <= 20000 THEN '第四层级' "
			+ "WHEN pay_amount > 20000 THEN '第五层级' "
			  + "END ";
	// 排 名
	private String orderbySql = "select store_name,category_name,sum(pay_amount) as pay_amount,sum(pay_pronum) as pay_pronum,ROUND(sum(pay_custs)*100/sum(uv),2) as pay_convert_rate,ROUND(sum(pay_amount)*100/sum(pay_custs),2) as guest_unit_price,sum(uv) as uv "
			+ "from fact_storerank_all where orgid=? GROUP BY store_id  order by  pay_amount  desc ";

	private String countOrderbySql = "select count(store_name) num from (select store_name,category_name,sum(pay_amount) as pay_amount,sum(pay_pronum) as pay_pronum,ROUND(sum(pay_custs)*100/sum(uv),2) as pay_convert_rate,ROUND(sum(pay_amount)*100/sum(pay_custs),2) as guest_unit_price,sum(uv) as uv"
			+ "  from fact_storerank_all where orgid=? ";

	private String sql = "select store_name,category_name,sum(pay_amount) as pay_amount,sum(pay_pronum) as pay_pronum,ROUND(sum(pay_custs)*100/sum(uv),2) as pay_convert_rate,ROUND(sum(pay_amount)/sum(pay_custs),2) as guest_unit_price,sum(uv) as uv "
			+ "from fact_storerank_all where orgid=?  ";

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

	@Override
	public Map index() {
		String orgid = UserType.getPlatform().getPlatformCode();// 平台ID实际是根据登陆的账号中提取
		Map result = new HashMap();
		
		List<Map> dicList = null;
		List<Map> areaList = null;
		List<Map> orderByList = null;
		List<Map> categoryList = null;
		List<Map> area_List = null;
		String dicKey = this.getClass().getName() + "_dicsdList_" + orgid;
		String areaKey = this.getClass().getName() + "_areaList_" + orgid;
		String orderByKey = this.getClass().getName() + "_orderByList_" + orgid;
		String area_Key = this.getClass().getName() + "_area_" + orgid;
		String categoryKey = this.getClass().getName() + "_categoryList_"
				+ orgid;

		// 分类分析
		Object dicobject = cacheService.get(dicKey);
		if (dicobject != null) {
			dicList = (List<Map>) dicobject;
		} else {
			dicList = sqlService.localsqlaccountMap(dicSql,new Object[] { orgid });
			
			if (dicList != null) {
				cacheService.set(dicKey, dicList,DateUtils.DateAdd(new Date(), 1));
						
			}
		}
		// 地域
		Object areaobject = cacheService.get(areaKey);
		if (areaobject != null) {
			areaList = (List<Map>) areaobject;
		} else {
			areaList = sqlService.localsqlaccountMap(areaSql,
					new Object[] { orgid });
			if (areaList != null) {
				cacheService.set(areaKey, areaList,
						DateUtils.DateAdd(new Date(), 1));
			}
		}
		// 排名
		Object orderByKeyobject = cacheService.get(orderByKey);
		if (orderByKeyobject != null) {
			orderByList = (List<Map>) orderByKeyobject;
		} else {
			orderByList = sqlService.localsqlaccountMap(orderbySql,
					new Object[] { orgid });
			cacheService.set(orderByKey, orderByList,
					DateUtils.DateAdd(new Date(), 1));
		}
		// 所有类目
		Object categoryobject = cacheService.get(categoryKey);
		if (categoryobject != null) {
			categoryList = (List<Map>) categoryobject;
		} else {
			categoryList = sqlService.localsqlaccountMap(categorysql,
					new Object[] {});
			if (categoryList != null) {
				cacheService.set(categoryKey, categoryList,
						DateUtils.DateAdd(new Date(), 1));
			}
		}
		// 所有地域
		Object area_object = cacheService.get(area_Key);
		if (area_object != null) {
			area_List = (List<Map>) area_object;
		} else {
			area_List = sqlService
					.localsqlaccountMap(area_sql, new Object[] {});
			if (area_List != null) {
				cacheService.set(area_Key, area_List,DateUtils.DateAdd(new Date(), 1));
			}
		}

		result.put("dicList", dicList);
		result.put("areaLists", areaList);
		result.put("orderByList", orderByList);
		result.put("areaList", area_List);
		result.put("categoryList", categoryList);
		List<Map> shopValueList = sqlService.localsqlaccountMap("select * from shop_hierarchy where orgid=?", new Object[]{orgid});
		if(shopValueList!=null&&shopValueList.size()==0){
			Map m1= new HashMap();
			m1.put("start", "0");
			m1.put("end", "1000");
			Map m2= new HashMap();
			m2.put("start", "1000");
			m2.put("end", "5000");
			Map m3= new HashMap();
			m3.put("start", "5000");
			m3.put("end", "10000");
			Map m4= new HashMap();
			m4.put("start", "10000");
			m4.put("end", "20000");
			Map m5= new HashMap();
			m1.put("start", "20000");
			m1.put("end", "0");
			shopValueList.add(m1);
			shopValueList.add(m2);
			shopValueList.add(m3);
			shopValueList.add(m4);
			shopValueList.add(m5);
		}
		result.put("shopValueList", shopValueList);
		return result;
	}

	/**
	 * 店铺分布
	 */
	public List<Map> dic() {
		List<Map> dicLists = null;
		String orgid = UserType.getPlatform().getPlatformCode();
		String dicKeys = this.getClass().getName() + "_dicsLists_" + orgid;
		Object obj = cacheService.get(dicKeys);
		if (obj != null) {
			dicLists = (List<Map>) obj;
		} else {
			dicLists = sqlService.localsqlaccountMap(dicSql,
					new Object[] { orgid });
			if (dicLists != null) {
				cacheService.set(dicKeys, dicLists,DateUtils.DateAdd(new Date(), 1));
						
			}
		}
		return dicLists;
	}

	/**
	 * 地域分布
	 */
	@Override
	public List<Map> areaAnalyzed() {
		List<Map> areaLists = null;
		String orgid = UserType.getPlatform().getPlatformCode();
		String areasKey = this.getClass().getName() + "_areasLists_" + orgid;
		Object obj = cacheService.get(areasKey);
		if (obj != null) {
			areaLists = (List<Map>) obj;
		} else {
			areaLists = sqlService.localsqlaccountMap(areaSql,
					new Object[] { orgid });
			if (areaLists != null) {
				cacheService.set(areasKey, areaLists,DateUtils.DateAdd(new Date(), 1));
						
			}
		}
		return areaLists;
	}

	/**
	 * 店铺入住数量
	 * 
	 * @param startDate
	 *            起始时间
	 * @param endDate
	 *            结束时间
	 * @param categoryId
	 *            类目
	 * @param areaId
	 *            地域
	 * @return
	 */
	@Override
	public List<Map> storeInNum(String startDate, String endDate,
			String category, String area) {
		String orgid = UserType.getPlatform().getPlatformCode();
		List params = new ArrayList();
		StringBuffer whereBuffer = new StringBuffer();
		String storeKey = this.getClass().getName() + "_store_" + orgid;
		List<Map> proInNumList = null;
		if (startDate != null && endDate != null && !"".equals(startDate.trim()) && !"".equals(endDate.trim())) {
			whereBuffer.append(" and b.timeid BETWEEN ? and ? ");
			params.add(startDate);
			params.add(endDate);
			storeKey = storeKey + startDate + endDate ;
		}
		if (category != null && !"".equals(category.trim()) && !category.equals("所有类目")) {
			whereBuffer.append(" and b.category_name=? ");
			params.add(category);
			storeKey = storeKey + category;
		}
		if (area != null && !"".equals(area.trim()) && !area.equals("所有地域")) {
			whereBuffer.append(" and b.area_name=? ");
			params.add(area);
			storeKey = storeKey + area ;
		}
		whereBuffer.append(" and ORGID= ? GROUP BY a.timeid ");
		params.add(orgid);
		Object obj = cacheService.get(storeKey);
		if(obj != null){
			proInNumList = (List<Map>) obj;
		}else {
			proInNumList = sqlService.localsqlaccountMap(proInNumSql + whereBuffer.toString(), params.toArray());
			if(proInNumList != null){
				cacheService.set(storeKey, proInNumList,DateUtils.DateAdd(new Date(), 1));
			}
		}
				
		return proInNumList;
	}

	/**
	 * 层级
	 */
	@Override
	public List<Map> level() {
		List<Map> levelLists = null;
		String orgid = UserType.getPlatform().getPlatformCode();
		String levelsKey = this.getClass().getName() + "_levelsLists_" + orgid;
		Object obj = cacheService.get(levelsKey);
		if (obj != null) {
			levelLists = (List<Map>) obj;
		} else {
 
			levelLists = sqlService.localsqlaccountMap(levelSql,
					new Object[] { orgid });
			if (levelLists != null) {
				cacheService.set(levelsKey, levelLists,DateUtils.DateAdd(new Date(), 1));
						
			}
 
			
		//店铺层级配置表
		List<Map> shopValueList = sqlService.localsqlaccountMap("select * from shop_hierarchy where orgid=?", new Object[]{orgid});
		if(shopValueList!=null&&shopValueList.size()==5){
		
		levelSql = "select time_mark,CASE "
				+ "WHEN pay_amount > "+shopValueList.get(0).get("start")+" AND pay_amount <= "+shopValueList.get(0).get("end")+" THEN '第一层级' "
				+ "WHEN pay_amount > "+shopValueList.get(1).get("start")+" and pay_amount <= "+shopValueList.get(1).get("end")+" THEN '第二层级' "
				+ "WHEN pay_amount > "+shopValueList.get(2).get("start")+" AND pay_amount <= "+shopValueList.get(2).get("end")+" THEN '第三层级' "
				+ "WHEN pay_amount > "+shopValueList.get(3).get("start")+" AND pay_amount <= "+shopValueList.get(3).get("end")+" THEN '第四层级' "
				+ "WHEN pay_amount > "+shopValueList.get(4).get("start")+" THEN '第五层级' "
				+ "END '店铺层级', "
				+ "count(store_id) '店铺数' FROM  store_level_base   where orgid=?  GROUP BY  time_markid, "
				+ "CASE " + "WHEN pay_amount > "+shopValueList.get(0).get("start")+" AND pay_amount <= "+shopValueList.get(0).get("end")+" THEN '第一层级' "
				+ "WHEN pay_amount > 1000 and pay_amount <= "+shopValueList.get(1).get("end")+" THEN '第二层级' "
				+ "WHEN pay_amount > 5000 AND pay_amount <= "+shopValueList.get(2).get("end")+" THEN '第三层级' "
				+ "WHEN pay_amount > 10000 AND pay_amount <= "+shopValueList.get(3).get("end")+" THEN '第四层级' "
				+ "WHEN pay_amount > "+shopValueList.get(4).get("start")+" THEN '第五层级' "
				  + "END ";
		
 
		}
		levelLists = sqlService.localsqlaccountMap(levelSql,
				new Object[] { orgid });
		if (levelLists != null) {
			//cacheService.set(levelsKey, levelLists,
			//		DateUtils.DateAdd(new Date(), 1));
		}
	}
		return levelLists;
	}

	/**
	 * 店铺排名分页
	 */
	@Override
	public QueryResult<Map> page(int page, int pageSize, String categray,
			String day) {
		String orgid = UserType.getPlatform().getPlatformCode();
		String pageKey = this.getClass().getName() + page + pageSize;
		List params = new ArrayList();
		QueryResult<Map> qr = new QueryResult<Map>();
		StringBuffer where = new StringBuffer();
		StringBuffer countwhere = new StringBuffer();
		params.add(orgid);
		if (categray != null && !"".equals(categray.trim())
				&& !categray.equals("所有类目")) {
			where.append(" and category_name = ?");
			countwhere.append(" and category_name = ?");
			params.add(categray);
			pageKey = pageKey + categray;
		}

		if (day != null && "1".equals(day)) {
			where.append(" and timeid = DATE_SUB(CURDATE(), INTERVAL 1 day) ");
			countwhere.append(" and timeid = DATE_SUB(CURDATE(), INTERVAL 1 day) ");
					
			pageKey = pageKey + day;
		}
		if (day != null && "2".equals(day)) {
			where.append(" and timeid > DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
			countwhere.append(" and timeid > DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
					
			pageKey = pageKey + day;
		}
		if (day != null && "3".equals(day)) {
			where.append(" and timeid > DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
			countwhere.append(" and timeid > DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
					
			pageKey = pageKey + day;
		}

		where.append(" GROUP BY store_id  order by  pay_amount  desc ");
		countwhere.append(" GROUP BY store_id  order by  pay_amount  desc ) aa");

		Object obj = cacheService.get(pageKey);
		if (obj != null) {
			qr = (QueryResult<Map>) obj;
		} else {
			List<Map> result = this.sqlService.localsql(page, pageSize, sql + where.toString(), params.toArray());
					

			List<Map> countResult = sqlService.localsqlaccountMap(
					countOrderbySql + countwhere.toString(), params.toArray());
			if (countResult != null) {
				if (countResult.size() > 0) {
					qr.setTotal(Long.valueOf(countResult.get(0).get("num").toString()));
				}
			} else {
				qr.setTotal(0l);
			}
			qr.setRows(result);
			qr.setPageNo(page);
			qr.setPageSize(pageSize);
			cacheService.set(pageKey, qr, DateUtils.DateAdd(new Date(), 1));
		}
		return qr;

	}

}
