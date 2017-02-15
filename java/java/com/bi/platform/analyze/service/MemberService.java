package com.bi.platform.analyze.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.utils.CacheUtils;
import com.bi.utils.HtmlExp;
import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.utils.qw.hf.DateUtils;

/*** 会员分析 
 * 在会员价值功能中的自定义功能，页面只提供将参数值存seting_members_value表，然后交由黄勇算
 * JAVA从rmf表中取 ,rmf表结构变动了，等这个智能功能做好后再来调整seting_members_value 表结构
 * 
 * 
 * ***/
@Service
public class MemberService implements IMemberService {
	
	private String cname = this.getClass().getName();
	String levelSql = "SELECT level_name,sum(custs_num) as num,ROUND(sum(custs_num)*100/(select sum(f.num) from (SELECT sum(custs_num) as num from fact_custs_stats_all GROUP BY level_name)f),2) as rate from fact_custs_stats_all where orgid=? GROUP BY level_name";
	/** 会员价值*/
	String memValueSql = "select * from rfm where orgid=?";
	/** 会员画像*/ 
	String huaxiangsql = " select c.customerid,area.province_name,case c.sex when '1' then '男' when '0' then '女' end as sex ,agegroup,dl.level_name from customer c left JOIN dim_area area on c.area_id=area.province_code     left JOIN   dim_cust_level  dl on dl.level_id=c.level_id  where c.orgid=? limit 1,10";
	String areaSql = "SELECT province_name from dim_area_prov  GROUP BY province_name ORDER BY province_code ";
	/**新增会员sql*/
	String incVipSql = "select timeid, sum(custs_num) as num from fact_custs_new ";
	
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.bi.platform.analyze.service.IMemberService#index()
	 */
	@Override
	public Map index(String mvalue) {
		String orgid = UserType.getPlatform().getPlatformCode();
		Map result = new HashMap();

		String key = cname + "index" +mvalue+ orgid;
		Object obj = cacheService.get(key);
		if (obj != null) {
			result = (Map) obj;
		} else {
 
   /*        String levelSql = "SELECT level_name,sum(custs_num) as num,ROUND(sum(custs_num)*100/(select sum(f.num) from (SELECT sum(custs_num) as num from fact_custs_stats_all GROUP BY level_name)f),2) as rate from fact_custs_stats_all where orgid=? GROUP BY level_name";

			// 会员画像
			String huaxiangsql = " select c.customerid,area.province_name,case c.sex when '1' then '男' when '0' then '女' end as sex ,agegroup,dl.level_name from customer c left JOIN dim_area area on c.area_id=area.province_code     left JOIN   dim_cust_level  dl on dl.level_id=c.level_id  where c.orgid=? limit 1,10";
			String areaSql = "SELECT province_name from dim_area_prov  GROUP BY province_name ORDER BY province_code ";
			List<Map> areaList = service.localsqlaccountMap(areaSql, new Object[] {});
			List<Map> levelList = service.localsqlaccountMap(levelSql, new Object[] { orgid });
			List<Map> huaxiangList = service.localsqlaccountMap(huaxiangsql, new Object[] { orgid });
 
			// 会员价值
			if (areaList != null) {
				result.put("areaList", areaList);
			}
			if (levelList != null) {
				result.put("levelList", levelList);
			}
			if (huaxiangList != null) {
				result.put("huaxiangList", huaxiangList);
			}*/
			buildIndexDate(mvalue, orgid, result);
			if (result.size() > 0) {
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
			}
		}

		return result;

		 
	}

	private void buildIndexDate(String mvalue, String orgid, Map result) {
		String key = mvalue + orgid;
		Object[] o = null;
		Object obj = cacheService.get(key);
		if (obj != null) {
			o = (Object[]) obj;
		} else {
			String mvalue3 = "select r,m as f ,sum(pay_custs) pay_custs from rfm where orgid=? group by r,m order by mid asc ";

			String mvalue2 = "select r,avg_m as f ,sum(pay_custs) pay_custs from rfm where orgid=? group by r,avg_m  order by avg_mid asc ";

			String mvalue1 = "select r,f,sum(pay_custs) pay_custs  from rfm  where orgid=? group by r,f  order by fid asc ";

			String memValueSql = mvalue1;
			String f = "f";
			if (mvalue != null && !"".equals(mvalue.trim())) {
				switch (mvalue) {
				case "2":
					memValueSql = mvalue2;
					f = "avg_m";
					break;
				case "3":
					memValueSql = mvalue3;
					f = "m";
					break;

				}

			}
			List<Map> valueList = service.localsqlaccountMap(memValueSql, new Object[] { orgid });
			if (valueList != null) {
				Map valueMap = new HashMap();

				// 总人员
				List<Map> sumvalueList = service.localsqlaccountMap("select sum(pay_custs) as allpaycusts from rfm where orgid=?", new Object[] { orgid });
				if (sumvalueList != null && sumvalueList.size() > 0) {
					valueMap.put("allpaycusts", Long.parseLong(sumvalueList.get(0).get("allpaycusts").toString()));
				}
				// 存行
				List rowlist = service.localsql("select DISTINCT r from rfm  where orgid=?   order by " +f+"id asc ", new Object[] { orgid });
				// 存列
				List columlist = service.localsql("select DISTINCT " + f + " from rfm  where orgid=?   order by "+ f +"id asc ", new Object[] { orgid });
				for (int i = 0; i < columlist.size(); i++) {
					columlist.set(i, HtmlExp.replaceMark(columlist.get(i).toString().replaceAll("\\s*", "")));
				}
				for (int i = 0; i < rowlist.size(); i++) {
					List vl = new ArrayList();
					vl.add(HtmlExp.replaceMark(rowlist.get(i).toString().replaceAll("\\s*", "")));
					for (int j = 0; j < valueList.size(); j++) {

						if (valueList.get(j).get("r").toString().equals(rowlist.get(i).toString())) {
							vl.add(valueList.get(j).get("pay_custs").toString());
						}
					}

					rowlist.set(i, vl.toArray());
				}
				o = new Object[] { columlist, rowlist, valueMap };
				cacheService.set(key, o, DateUtils.DateAdd(new Date(), 1));

			}
		}
		if (o != null) {
			result.put("columlist", o[0]);
			result.put("rowlist", o[1]);
			result.put("valueList", o[2]);
		}
	}

	/*
	 * 新增会员
	 */
	public List<Map> newMember(String date) {
		String incVipSql = "select timeid, sum(custs_num) as num from fact_custs_new ";
		String orgid = UserType.getPlatform().getPlatformCode();
		List<Map> incVipList = null;
		String incVipKey = this.getClass().getName() + "_inckey_" + orgid + date;
        StringBuffer whereBuffer = new StringBuffer();
	    if(date.equals("1")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 7 day) ");	
		}
		if(date.equals("2")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 30 day) ");				
		}
		if(date.equals("3")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 6 month) ");
		}
		if(date.equals("4")){
			whereBuffer.append(" where timeid >DATE_SUB(CURDATE(), INTERVAL 1 year) ");
		}
		whereBuffer.append(" and timeid<=CURDATE() and ORGID=? GROUP BY timeid");
		Object obj = cacheService.get(incVipKey);
		if(obj != null){
			incVipList = (List<Map>) obj;
		} else {
			incVipList = service.localsqlaccountMap(incVipSql + whereBuffer.toString(), new Object[] {orgid});
			cacheService.set(incVipKey, incVipList, DateUtils.DateAdd(new Date(), 1));
		}
		 return incVipList;
	}

	/*
	 * 等级
	 */
 
	public List<Map> memlevel() {
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = "memlevel";
 
		String levelSql = "SELECT level_name,sum(custs_num) as num,ROUND(sum(custs_num)*100/(select sum(f.num) from (SELECT sum(custs_num) as num from fact_custs_stats_all where orgid=? GROUP BY level_name)f),2) as rate from fact_custs_stats_all where orgid=? GROUP BY level_name ";
		return getResult(key, levelSql, new Object[] {orgid,orgid }); 
 
	}

	/*
	 * 新老会员
	 */
	@Override
	public List<Map> memnewold() {
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = "memnew";
 
		String memnewoldSql = " SELECT isnew_name,sum(custs_num) as num,round(sum(custs_num)*100/(select sum(f.num) from (SELECT sum(custs_num) as num from fact_custs_stats_all  where orgid=? GROUP BY isnew_name)f),2) as rate from fact_custs_stats_all where orgid=? GROUP BY isnew_name ";
		return getResult(key, memnewoldSql, new Object[] {orgid,orgid  });
 
	 
	}

	/*
	 * 年龄
	 */
	@Override
	public List<Map> memage() {
		String key = "memage";
		String memageSql = "select sum(CUSTS_NUM)  as num ,agegroup from fact_custs_stats_all  where orgid=?   group by agegroup ";
		return getResult(key, memageSql, new Object[] { UserType.getPlatform().getPlatformCode() });
	}

	/*
	 * 性别
	 */
	@Override
	public List<Map> memsex() {
		String key = "memsex";
		String sexSql = "select sum(custs_num) as num,sex_name, ROUND(sum(custs_num)*100/(select sum(f.num) from (select sum(CUSTS_NUM)  as num from fact_custs_stats_all where orgid=? group by sex_name )f ),2) as rate from fact_custs_stats_all where orgid=? group by sex_name";
		return getResult(key, sexSql, new Object[] { UserType.getPlatform().getPlatformCode(), UserType.getPlatform().getPlatformCode() });
	}

	/*
	 * 会员价值
	 */

	public Map memValue(String mvalue) {
		Map result = new HashMap();
		buildIndexDate(mvalue, UserType.getPlatform().getPlatformCode(), result);
		return result;
	}


	private List<Map> getResult(String keyv, String sql, Object[] params) {
		String orgid = UserType.getPlatform().getPlatformCode();
		// 会员分布--等级
		String key = cname + keyv + orgid;
		List<Map> result = null;
		Object obj = cacheService.get(key);
		if (obj != null) {
			result = (List<Map>) obj;
		} else {
			result = service.localsqlaccountMap(sql, params);
			CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
		}
		return result;
	}

	
	/* 
	 * 会员画像
	 */
	@Override
	public Map huaxiang(int pageIndex, int pageSize, String sex,String age, String consume, String level, String area) {
		String orgid = UserType.getPlatform().getPlatformCode();
		Map result = new HashMap();
		StringBuffer wherebuff = new StringBuffer();
		StringBuffer countwhere = new StringBuffer();
		StringBuffer wheres = new StringBuffer();
		List params = new ArrayList();
		// 会员分布--等级
		String key = cname + "huaxiang" + orgid+"_"+pageIndex+"_"+pageSize+sex+age+consume+level+area;
		String numKey = cname + "num" + orgid;
		String huaxiangsql = "select c.customerid,c.sex_name ,c.agegroup,area.province_name,c.level_name from customer c left JOIN dim_area_prov area on c.area_id=area.province_code where c.orgid=? ";
		String totalSql = "select COUNT(*) totalnum from (select c.customerid from customer c  where c.orgid=? ";
		String numSql = "select sum(custs_num) as num,ROUND(sum(custs_num)*100/(select sum(custs_num) from fact_custs_stats_all ),2) as rate from fact_custs_stats_all where orgid=? ";
		List<Map> total = null;
        List<Map> memNumList = null;
        List<Map> huaxiangList = null;
        Object obj = cacheService.get(key);
        if(obj != null){
        	result = (Map) obj;
        }else{
         params.add(orgid);
            if(sex != null){
            	if(params.size()>0){
            		wheres.append(" and ");
            		wherebuff.append(" and ");
            		countwhere.append(" and ");
    			}
            	wheres.append(" sex_name=? ");
            	wherebuff.append(" c.sex_name=? ");
            	countwhere.append(" c.sex_name=? ");
    			params.add(sex);
            }
            if(age != null){
            	if(params.size()>0){
            		wheres.append(" and ");
            		wherebuff.append(" and "); 
            		countwhere.append(" and ");
    			}
            	wheres.append(" agegroup=? ");
            	wherebuff.append(" c.agegroup=? ");
            	countwhere.append(" c.agegroup=? ");
    			params.add(age);
            }
           /* if(consume != null){  //消费能力
            	if(params.size()>0){
            		wheres.append(" and ");
            		wherebuff.append(" and "); 
            		countwhere.append(" and ");
    			}
            	wheres.append(" =? ");
            	wherebuff.append(" =? ");  // X
            	countwhere.append("  ");
    			params.add(consume);
            }*/
            if(level != null){  //会员等级
            	if(params.size()>0){
            		wheres.append(" and ");
            		wherebuff.append(" and ");
            		countwhere.append(" and ");
    			}
            	wheres.append(" level_name=? ");
            	wherebuff.append(" c.level_name=? ");
            	countwhere.append(" c.level_name=? ");
    			params.add(level);
            }
            if(area != null){  //地域
            	if(params.size()>0){
            		wheres.append(" and ");
            		wherebuff.append(" and ");
            		countwhere.append(" and ");
    			}
            	wheres.append(" area_name=? ");
            	wherebuff.append(" c.area_id=(select province_code from dim_area_prov where province_name=?) ");
            	countwhere.append(" c.area_id=(select province_code from dim_area_prov where province_name=?) ");
    			params.add(area);
            }
            
        countwhere.append(" ) as total ");
        memNumList = service.localsqlaccountMap(numSql + wheres.toString(), params.toArray());
        huaxiangList = service.localsql(pageIndex, pageSize, huaxiangsql + wherebuff.toString(), params.toArray());
        total = service.localsqlaccountMap(totalSql + countwhere.toString(),  params.toArray());
        
        result.put("memNumList", memNumList);
        result.put("huaxiangList", huaxiangList);
        result.put("total",  Long.valueOf(total.get(0).get("totalnum").toString()));
        result.put("page", pageIndex);
        result.put("pageSize", pageSize);
        cacheService.set(key, result,  DateUtils.DateAdd(new Date(), 1));
        }
        return result;
	}

	/**
	 * 画像
	 */
	@Override
	public List<Map> viewPortrait(String id) {
		String orgid = UserType.getPlatform().getPlatformCode();
		String sql = "select area.province_name,c.sex_name,c.level_name,c.summoney,c.login_count,c.real_name,c.age,c.fa_count from customer c left JOIN dim_area_prov area on c.area_id=area.province_code where orgid=? ";
		List<Map> portraitList = null;
		String portraitKey = cname + "_portrait_"+id;
		StringBuffer wheres = new StringBuffer();
		List params = new ArrayList();
		Object obj = cacheService.get(portraitKey);
		if(obj != null){
			portraitList = (List<Map>) obj;
		} else {
		params.add(orgid);
		if(id != null){
			if(params.size()>0){
        		wheres.append(" and ");
			}
			wheres.append(" customerid=? ");
			params.add(id);
		}
		portraitList = service.localsqlaccountMap(sql + wheres.toString(), params.toArray());
		cacheService.set(portraitKey, portraitList,  DateUtils.DateAdd(new Date(), 1));
		}
		return portraitList;
	}
	
}
