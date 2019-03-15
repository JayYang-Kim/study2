package com.tag;

import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class NowTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	// Ŀ���� �±� �ۼ��� - 1
	
	// ���� ��ǻ���� �ð��� �������� Ŀ���� �±�
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
			Calendar cal = Calendar.getInstance();
			
			String s = String.format("%d�� %d�� %d��", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DATE));
			
			out.print(s);
		} catch (Exception e) {
			throw new JspTagException(e);
		}
		
		return SKIP_BODY; // ��ü�� ���� �±�
	}
	
}
