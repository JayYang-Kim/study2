package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		ServletConfig config = getServletConfig(); // 해당 서블릿 정보
		ServletContext context = getServletContext(); // 웹 어플리케이션 정보
		
		try {
			String subject = config.getInitParameter("subject");
			String year = config.getInitParameter("year");
			
			String city = context.getInitParameter("city");
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.print("<html><body>");
			out.print("subject : " + subject + "<br/>");
			out.print("year : " + year + "<br/>");
			out.print("city : " + city + "<br/>");
			out.print("</body></html>");
		} catch (Exception e) {
			context.log(getClass() + e.toString()); // 에러 메시지를 로그로 출력
		}
	}
}
