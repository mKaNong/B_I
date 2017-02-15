package com.bi.utils;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.framework.qw.hf.cacheservice.CacheService;
import com.utils.qw.hf.DateUtils;

/***缓存工具类
 * @author liangxiaoshan
 * 
 * **/
public class CacheUtils {
	public  static void saveCache(CacheService cacheService ,String key, Object result,Date day) {
		if (result != null) {
			cacheService.set(key, result, day);
		}
	}
	
	public  static void saveCache(CacheService cacheService ,String key, Object result ) {
		if (result != null) {
			cacheService.set(key, result  );
		}
	}
}
