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
import com.jpa.qw.hf.utils.QueryResult;
import com.utils.qw.hf.DateUtils;

/**
 * 运营分析--商品分析
 * 
 * @author lxs
 *
 */
@Service
public class ProductService implements IProductService {
	private String cname = this.getClass().getName();
	// 类目饼图  WHERE timeid = (SELECT SUBDATE(CURDATE(), INTERVAL ? DAY))    timeid = (SELECT SUBDATE(CURDATE(), INTERVAL ? DAY)) and
	private String channel = "SELECT category_name, pro_num  as num FROM fact_pro_num WHERE timeid = SUBDATE(CURDATE(), INTERVAL 1 DAY) and orgid=? GROUP BY category_id ";
	// 趋势
	private String qushi = "SELECT timeid, sum(pro_num) AS 'num'  FROM	fact_pro_num WHERE timeid > SUBDATE(CURDATE(), INTERVAL ? DAY)  and timeid<=CURDATE() and orgid=? GROUP BY timeid"; //timeid > SUBDATE(CURDATE(), INTERVAL ? DAY) and

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
        String categorysql = "select first_name from dim_category where orgid =? ";
        String orgid = UserType.getPlatform().getPlatformCode();
    	String key = cname + "_categorykey_" + "index";
    	List<Map> categoryList = null;
    	Object obj = cacheService.get(key);
    	if(obj != null){
    		categoryList = (List<Map>) obj;
    	} else {
    		categoryList = service.localsqlaccountMap(categorysql, new Object[]{orgid});
    		cacheService.set(key, categoryList, DateUtils.DateAdd(new Date(), 1));
    	}
    	if(categoryList != null){
    		if(categoryList.size() > 0){
    			model.addAttribute("categoryList", categoryList);
    		}
    	}
	}

	/**
	 * 在线商品数
	 * 
	 * @param day
	 *            1   7天 2 30 天
	 */
	public Map onlineProduct(String day) {
		Map result = null;
		String orgid = UserType.getPlatform().getPlatformCode();
		List params = new ArrayList();
		List params1 = new ArrayList();
		String key = null;
		if (day != null && !"".equals(day.trim())) {
			key = cname + "_onlineProduct_" + orgid + "_" + day;
			Object cache = cacheService.get(key);
			if (cache != null) {
				result = (Map) cache;
			} else {
				result = new HashMap();
				
				if (day.equals("1")) {
					params.add(7);

				} else if (day.equals("2")) {
					params.add(30);
				}
				params.add(orgid);
				params1.add(orgid);
				if (params.size() > 1) { //params.size() > 1
					// 类目饼图
					List<Map> channelList = service.localsqlaccountMap(channel, params1.toArray());
					List<Map> qushiList = service.localsqlaccountMap(qushi, params.toArray());
					if (channelList != null && channelList.size() > 0) {
						result.put("channelList", channelList);
					}
					if (qushiList != null && qushiList.size() > 0) {
						result.put("qushiList", qushiList);
					}
					if (result.get("channelList") != null && result.get("qushiList") != null) {
						CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
					}
				}
			}
		}
		return result;
	}

	/**
	 * 被下单商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	public List<Map> buyProduct(String day, String channelId) {
		List<Map> result = null;
		String sql = "select sum(order_pronum) num,   timeid from fact_cate_sum where orgid=? ";
		String orgid = UserType.getPlatform().getPlatformCode();
		StringBuffer where = new StringBuffer();
		List params = new ArrayList();
		params.add(orgid);
		String key = cname + "_buyProduct_" + orgid;
		if (day != null && !"".equals(day.trim())) {
			if (day.equals("1")) {
				where.append(" and timeid>DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
				key = key + "_" + day;
			} else if (day.equals("2")) {
				where.append(" and  timeid>DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
				key = key + "_" + day;
			}
		}

		if (channelId != null && !"".equals(channelId.trim())) {
			where.append(" and  fact_cate_sum.category_id=(select first_code from dim_category where first_name=? and orgid=?) ");
			params.add(channelId);
			params.add(orgid);
			key = key + "_" + channelId;
		}
		if (key != null) {
			Object cache = cacheService.get(key);
			if (cache != null) {
				result = (List<Map>) cache;
			} else {
				result = service.localsqlaccountMap(sql + where.toString() + "   group  by fact_cate_sum.timeid ", params.toArray());
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));

			}
		}
		return result;
	}

	/**
	 * 被支付商品数
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目
	 */
	public List<Map> payProduct(String day, String channelId) {
		List<Map> result = null;
		String sql = "select sum(pay_pronum) num,   timeid from fact_cate_sum where orgid=? ";
		String orgid = UserType.getPlatform().getPlatformCode();
		StringBuffer where = new StringBuffer();
		List params = new ArrayList();
		params.add(orgid);
		String key = cname + "_buyProduct_" + orgid;
		if (day != null && !"".equals(day.trim())) {
			if (day.equals("1")) {
				where.append(" and timeid>DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
				key = key + "_" + day;
			} else if (day.equals("2")) {
				where.append(" and timeid>DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
				key = key + "_" + day;
			}
		}

		if (channelId != null && !"".equals(channelId.trim())) {
			where.append(" and  fact_cate_sum.category_id=(select first_code from dim_category where first_name=? and orgid=?) ");
			params.add(channelId);
			params.add(orgid);
			key = key + "_" + channelId;
		}
		if (key != null) {
			Object cache = cacheService.get(key);
			if (cache != null) {
				result = (List<Map>) cache;
			} else {
				result = service.localsqlaccountMap(sql + where.toString() + "   group  by fact_cate_sum.timeid ", params.toArray());
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));

			}
		}
		return result;
	}

	/**
	 * 商品排行
	 * 
	 * @param day
	 *            1 7天 2 30 天
	 * @param channelId
	 *            类目 product_name 商品名 pv 浏览器 uv 访客数 pay_qty 成交量 pay_amount支付金额
	 *            zhl转化率
	 */
	public QueryResult<Map> orderbyProduct(String day, int pageIndex,int pageSize, String s, String e) {
		String sql = "SELECT  product_name ,sum(pv)pv ,sum(uv) uv ,pay_qty,pay_amount,ROUND(sum(pay_custs)*100/sum(uv),2) as zhl from fact_pro_rank where orgid=?  ";
		QueryResult<Map> result = new QueryResult<Map>();
		String orgid = UserType.getPlatform().getPlatformCode();
		StringBuffer buff = new StringBuffer();
		List params = new ArrayList();
		params.add(orgid);
		String key = cname + "_orderbyProduct_" + orgid + pageIndex + pageSize;
		if (day != null && !"".equals(day.trim())) {
			key = key + day ;
			if (day.equals("1")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 1 day) and timeid<=CURDATE() ");
			} else if (day.equals("2")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 7 day) and timeid<=CURDATE() ");
			} else if (day.equals("3")) {
				buff.append(" and timeid >DATE_SUB(CURDATE(), INTERVAL 30 day) and timeid<=CURDATE() ");
			}
            
		} else if (s != null && e != null) {
			buff.append(" and timeid BETWEEN ? and ? ");
			params.add(s);
			params.add(e);
			key = key + "_BETWEEN" + s + "_" + e;
		}
		buff.append("  GROUP BY product_name ORDER BY pay_qty desc   ");
		Object obj = cacheService.get(key);
		if (obj != null) {
			result = (QueryResult<Map>) obj;
		} else {
			List<Map> qr = service.localsql(pageIndex, pageSize,sql + buff.toString(), params.toArray());
			List<Map> countList = service.localsqlaccountMap(sql + buff.toString(), params.toArray());
			result.setRows(qr);
			if(countList != null){
				if(countList.size() > 0){
					result.setTotal(Long.valueOf(countList.size()));
				}
			}
			result.setPageNo(pageIndex);
			result.setPageSize(pageSize);
			if (result.getRows() != null && result.getRows().size() > 0) {
				CacheUtils.saveCache(cacheService, key, result, DateUtils.DateAdd(new Date(), 1));
			}
		}
		return result;
	}

}
