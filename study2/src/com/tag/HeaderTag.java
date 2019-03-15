package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HeaderTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	private String title;
	private Integer level;
	
	public void setTitle(String title) {
		this.title = title;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
			if(level == null || level == 1) {
				out.print("<h1>" + title + "</h1>");
			} else if(level == 2) {
				out.print("<h2>" + title + "</h2>");
			} else if(level == 3) {
				out.print("<h3>" + title + "</h3>");
			} else if(level == 4) {
				out.print("<h4>" + title + "</h4>");
			} else if(level == 5) {
				out.print("<h5>" + title + "</h5>");
			} else {
				out.print("<h6>" + title + "</h6>");
			}
		} catch (Exception e) {
			throw new JspTagException(e);
		}
		
		return SKIP_BODY;
	}
}
