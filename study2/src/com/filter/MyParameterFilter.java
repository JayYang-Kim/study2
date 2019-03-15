package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/insa/*")
public class MyParameterFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		MyParameterWrapper mReq = new MyParameterWrapper((HttpServletRequest)request);
		
		chain.doFilter(mReq, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
