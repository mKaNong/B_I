package com.bi.platform.analyze.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bi.utils.UserType;
import com.framework.qw.hf.cache.IBaseMemcacheService;
import com.framework.qw.hf.cacheservice.CacheService;
import com.jpa.qw.hf.utils.QueryResult;
import com.utils.qw.hf.DateUtils;

/**
 * 搜索词
 * 
 * @author lxs
 *
 */
@Service
public class SearchWordsService implements ISearchWordService{
	// 当天,暂时没有平台ID，等，齐大神定吧
	private String nowDay = "select ss.`name`,  ss.num ,ss.levels,ss.time,ss.LEVELs-(select s.levels from split_words s where s.time = CURDATE()-1  and s.name=ss.name) as up_dwom  from split_words ss where ss.time=CURDATE() ORDER BY num desc  LIMIT 0,3 ";

	// 本周排行,负为上涨
	private String nowWeek = "  select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
			+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where YEARWEEK(date_format(ss.time,'%Y-%m-%d')) = YEARWEEK(now()) GROUP BY ss.name     "
			+ "  ) cw " + " LEFT JOIN "
			+ "  (select   sss.`name`,   sum(sss.levels) levels from split_words sss where YEARWEEK(date_format(sss.time,'%Y-%m-%d')) = YEARWEEK(now())-1 GROUP BY sss.name       ) bw"
			+ " ON cw.name=bw.name  ORDER BY num desc limit 0,3";

	//当月
	private String nowMoth = " select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
			+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where date_format(time,'%Y-%m')=date_format(now(),'%Y-%m') GROUP BY ss.name    "
			+ "  ) cw" + " LEFT JOIN "
			+ " (select   sss.`name`,   sum(sss.levels) levels from split_words sss where date_format( time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')"
			+ " GROUP BY sss.name       ) bw"
			+ " ON cw.name=bw.name  ORDER BY num desc limit 0,3";
	
	 String nowDaySearch = "select ss.time,ss.`name`,  ss.num ,ss.levels,ss.LEVELs-(select s.levels from split_words s where s.time = CURDATE()-1  and s.name=ss.name) as up_dwom  from split_words ss where ss.time=CURDATE() ORDER BY num desc ";

	 String nowWeekSearch = "  select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
			+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where YEARWEEK(date_format(ss.time,'%Y-%m-%d')) = YEARWEEK(now()) GROUP BY ss.name     "
			+ "  ) cw " + " LEFT JOIN "
			+ "  (select   sss.`name`,   sum(sss.levels) levels from split_words sss where YEARWEEK(date_format(sss.time,'%Y-%m-%d')) = YEARWEEK(now())-1 GROUP BY sss.name       ) bw"
			+ " ON cw.name=bw.name ORDER BY num desc ";
	
	 String nowMothSearch = " select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
				+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where date_format(time,'%Y-%m')=date_format(now(),'%Y-%m') GROUP BY ss.name    "
				+ "  ) cw" + " LEFT JOIN "
				+ " (select   sss.`name`,   sum(sss.levels) levels from split_words sss where date_format( time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')"
				+ " GROUP BY sss.name       ) bw"
				+ " ON cw.name=bw.name  ORDER BY num desc ";
	
	private String cname = TradeFormService.class.getName();
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
	public Map load() {
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = cname + "_serachWord_" + orgid;
		Map result = new HashMap();
		List<Map> nowDayList = null;
		List<Map> weekDayList = null;
		List<Map> monthDayList = null;
		Object obj = cacheService.get(key);
		if(obj != null){
			result = (Map) obj;
		} else {
			nowDayList = sqlService.localsql(nowDay, new Object[]{});
			weekDayList = sqlService.localsql(nowWeek, new Object[]{});
			monthDayList = sqlService.localsql(nowMoth, new Object[]{});
			if(nowDayList != null){
		
				result.put("nowDayList", nowDayList);
			}
			if(weekDayList != null){
				result.put("weekDayList", weekDayList);
			}
			if(monthDayList != null){
				result.put("monthDayList", monthDayList);
			}
			if(result.size() > 0){
				cacheService.set(key, result,DateUtils.DateAdd(new Date(), 1));
			}
		}
		return result;
	}

    /**暂时不做*/
	@Override
	public Map SearchWord(String day) {
		String daySql = "select ss.time,ss.`name`,  ss.num ,ss.levels,ss.LEVELs-(select s.levels from split_words s where s.time = ?-1  and s.name=ss.name) as up_dwom  from split_words ss where ss.time=? ORDER BY num desc  LIMIT 0,3 ";
		String weekSql = "  select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
				+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where YEARWEEK(date_format(ss.time,'%Y-%m-%d')) = YEARWEEK(now()) GROUP BY ss.name     "
				+ "  ) cw " + " LEFT JOIN "
				+ "  (select   sss.`name`,   sum(sss.levels) levels from split_words sss where YEARWEEK(date_format(sss.time,'%Y-%m-%d')) = YEARWEEK(now())-1 GROUP BY sss.name       ) bw"
				+ " ON cw.name=bw.name  ORDER BY num desc limit 0,3";
		String monthSql = " select cw.name,cw.num ,(cw.levels- bw.levels) as levels" + " from "
				+ " (select   ss.`name`,  sum(ss.num) num,sum(ss.levels) levels from split_words ss where date_format(time,'%Y-%m')=date_format(now(),'%Y-%m') GROUP BY ss.name    "
				+ "  ) cw" + " LEFT JOIN "
				+ " (select   sss.`name`,   sum(sss.levels) levels from split_words sss where date_format( time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')"
				+ " GROUP BY sss.name       ) bw"
				+ " ON cw.name=bw.name  ORDER BY num desc limit 0,3";
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = cname + "_serachWordKey_" + orgid + day;
		StringBuffer where = new StringBuffer();
		List params = new ArrayList();
		Map result = new HashMap();
		List<Map> nowDayList = null;
		List<Map> weekDayList = null;
		List<Map> monthDayList = null;
		Object obj = cacheService.get(key);
		if(obj != null){
			result = (Map) obj;
		} else {
			if(day != null){
				where.append(" ");
				params.add(day);
			}
			nowDayList = sqlService.localsql(nowDay, params.toArray());
			weekDayList = sqlService.localsql(nowWeek, params.toArray());
			monthDayList = sqlService.localsql(nowMoth, params.toArray());
			if(nowDayList != null){
				result.put("nowDayList", nowDayList);
			}
			if(weekDayList != null){
				result.put("weekDayList", weekDayList);
			}
			if(monthDayList != null){
				result.put("monthDayList", monthDayList);
			}
			if(result.size() > 0){
				cacheService.set(key, result,DateUtils.DateAdd(new Date(), 1));
			}
		}
		return result;
	}


	@Override
	public QueryResult<Map> daySearchWord(int pageIndex, int pageSize) {
		
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = cname + "_daySerach_" + orgid + pageIndex + pageSize;
		QueryResult<Map> daySearchList = null;
		Object obj = cacheService.get(key);
		if(obj != null){
			daySearchList = (QueryResult<Map>) obj;
		} else {
			daySearchList = sqlService.toList(pageIndex, pageSize, nowDaySearch, new Object[]{});
			List<Map> count = sqlService.localsqlaccountMap(nowDaySearch, new Object[]{});
			if(count != null){
				if(count.size() > 0){
					daySearchList.setTotal(Long.valueOf(count.size()));
					daySearchList.setPageNo(pageIndex);
					daySearchList.setPageSize(pageSize);
				}
			}
			if(daySearchList.getRows().size() > 0){
				cacheService.set(key, daySearchList, DateUtils.DateAdd(new Date(), 1));
				
			}
		}
		return daySearchList;
	}


	
	@Override
	public QueryResult<Map> weekSearchWord(int pageIndex, int pageSize) {
		
			String orgid = UserType.getPlatform().getPlatformCode();
			String key = cname + "_weekSerach_" + orgid+ pageIndex + pageSize;
			QueryResult<Map> weekSearchList = null;
			Object obj = cacheService.get(key);
			if(obj != null){
				weekSearchList = (QueryResult<Map>) obj;
			} else {
				weekSearchList = sqlService.toList(pageIndex, pageSize, nowWeekSearch, new Object[]{});
				List<Map> count = sqlService.localsqlaccountMap(nowWeekSearch, new Object[]{});
				if(count != null){
					if(count.size() > 0){
						weekSearchList.setTotal(Long.valueOf(count.size()));
						weekSearchList.setPageNo(pageIndex);
						weekSearchList.setPageSize(pageSize);
					}
				}
				if(weekSearchList.getRows().size() > 0){
					cacheService.set(key, weekSearchList, DateUtils.DateAdd(new Date(), 1));
				}
			}
			return weekSearchList;
	}
	
	
	@Override
	public QueryResult<Map> monthSearchWord(int pageIndex, int pageSize) {

			String orgid = UserType.getPlatform().getPlatformCode();
			String key = cname + "_MonthSerach_" + orgid + pageIndex + pageSize;
			QueryResult<Map> MonthSearchList = null;
			Object obj = cacheService.get(key);
			if(obj != null){
				MonthSearchList = (QueryResult<Map>) obj;
			} else {
				MonthSearchList = sqlService.toList(pageIndex, pageSize, nowMothSearch, new Object[]{});
				List<Map> count = sqlService.localsqlaccountMap(nowMothSearch, new Object[]{});
				if(count != null){
					if(count.size() > 0){
						MonthSearchList.setTotal(Long.valueOf(count.size()));
						MonthSearchList.setPageNo(pageIndex);
						MonthSearchList.setPageSize(pageSize);
					}
				}
				if(MonthSearchList.getRows().size() > 0){
					cacheService.set(key, MonthSearchList, DateUtils.DateAdd(new Date(), 1));
				}
			}
			return MonthSearchList;
	}
	


	@Override
	public QueryResult<Map> orderByCategory(int pageIndex, int pageSize, String day) {
		String orgid = UserType.getPlatform().getPlatformCode();
		String key = cname + "_orderCategory_" + orgid + pageIndex + pageSize + day;
		QueryResult<Map> result = null;
		Object obj = cacheService.get(key);
		if(obj != null){
			result = (QueryResult<Map>) obj;
		} else {
			if(day.equals("1")){
				result = sqlService.toList(pageIndex, pageSize, nowDaySearch, new Object[]{});
				List<Map> count = sqlService.localsqlaccountMap(nowDaySearch, new Object[]{});
				if(count != null){
					if(count.size() > 0){
						result.setTotal(Long.valueOf(count.size()));
						result.setPageNo(pageIndex);
						result.setPageSize(pageSize);
					}
				}
			}
			if(day.equals("2")){
				result = sqlService.toList(pageIndex, pageSize, nowWeekSearch, new Object[]{});
				List<Map> count = sqlService.localsqlaccountMap(nowWeekSearch, new Object[]{});
				if(count != null){
					if(count.size() > 0){
						result.setTotal(Long.valueOf(count.size()));
						result.setPageNo(pageIndex);
						result.setPageSize(pageSize);
					}
				}
			}
			if(day.equals("3")){
				result = sqlService.toList(pageIndex, pageSize, nowMothSearch, new Object[]{});
				List<Map> count = sqlService.localsqlaccountMap(nowMothSearch, new Object[]{});
				if(count != null){
					if(count.size() > 0){
						result.setTotal(Long.valueOf(count.size()));
						result.setPageNo(pageIndex);
						result.setPageSize(pageSize);
					}
				}
			}
		 if(result.getRows().size() > 0){
			cacheService.set(key, result, DateUtils.DateAdd(new Date(), 1));
		  }
		}
		return result;
	}



}
