package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter {
	private FilterConfig filterConfig;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// Request 필터
		long before = System.currentTimeMillis();
		
		chain.doFilter(request, response); // 다음 필터 또는 마지막 필터인 경우 resource(servlet 등) 실행
		
		// Response 필터
		long after = System.currentTimeMillis();
		
		String url;
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest)request;
			
			url = req.getRequestURI();
			
			String s = url + " : " + (after-before) + "ms";
			
			filterConfig.getServletContext().log(s); // 로그 출력
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		
	}

}
