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
		// �Ķ���� �̸��� pay�� ��� ��ȭ��ȣ�� ����
		if(name.equals("pay")) {
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			String s = nf.format(Long.parseLong(super.getParameter(name)));
			return s;
		}
		
		return super.getParameter(name);
	}
	
}
