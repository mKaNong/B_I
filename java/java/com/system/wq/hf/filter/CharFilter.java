package com.system.wq.hf.filter;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;

public class CharFilter implements Filter {
	private String toUnicode = "ISO-8859-1";

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain) throws IOException, ServletException {
		request.setCharacterEncoding(this.toUnicode);
		// response.setCharacterEncoding(this.toUnicode);
		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
	
		response.setContentType("text/html;charset=utf-8");
		// req.getQueryString()获取参数
		filterchain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		String unicode = config.getInitParameter("toUnicode");
		if (unicode != null && unicode.length() > 0) {
			this.toUnicode = unicode;
		}
	 
			/**
			 * 初始模板参数
			 */
			Properties p = new Properties();
			/**
			 * 加载绝对路径模板
			 */
			/*
			 * p.put("file.resource.loader.class",
			 * "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader"
			 * );
			 */
			p.put(VelocityEngine.FILE_RESOURCE_LOADER_PATH, config.getServletContext().getRealPath("/temp"));
			p.put("input.encoding", "utf-8");
			p.put("output.encoding", "utf-8");
			p.put("default.contentType", "text/html; charset=utf-8");
			/**
			 * 自定义标签的配置
			 */
			// p.put("userdirective",
			// "com.sys.velocity.service.SqlDirectiveTag,com.sys.velocity.service.CmsAttrValueTag,com.sys.velocity.service.PageDirectiveTag");
			Velocity.init(p);

		 
	}

}
