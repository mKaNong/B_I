package com.bi.utils;

/***
 * html处理
 * 
 * @author Thinkpad
 *
 */
public class HtmlExp {

	public static String replaceMark(String context) {
		if (context != null) {
			 
			return context.replace("<=", "≤").replace(">", " &gt ").replace("<", " &lt ").replace(">=", "≥") ;
		}
		return context;
	}

}
