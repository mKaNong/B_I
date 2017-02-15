package com.bi.utils;

import java.util.List;

/**
 * 方便获取页面list数组对象
 * 
 * @author Thinkpad
 *
 */
public class ListVo<T> {
	private List<T> listVo;

	public List<T> getListVo() {
		return listVo;
	}

	public void setListVo(List<T> listVo) {
		this.listVo = listVo;
	}

	 

}
