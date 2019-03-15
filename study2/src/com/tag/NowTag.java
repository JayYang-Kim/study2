package com.tag;

import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class NowTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	// 커스텀 태그 작성법 - 1
	
	// 현재 컴퓨터의 시간을 가져오는 커스텀 태그
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
			Calendar cal = Calendar.getInstance();
			
			String s = String.format("%d년 %d월 %d일", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DATE));
			
			out.print(s);
		} catch (Exception e) {
			throw new JspTagException(e);
		}
		
		return SKIP_BODY; // 몸체가 없는 태그
	}
	
}
