package com.filter;

import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyParameterWrapper extends HttpServletRequestWrapper {

	public MyParameterWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		// 파라미터 이름이 pay인 경우 원화기호를 붙임
		if(name.equals("pay")) {
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			String s = nf.format(Long.parseLong(super.getParameter(name)));
			return s;
		}
		
		return super.getParameter(name);
	}
	
}
