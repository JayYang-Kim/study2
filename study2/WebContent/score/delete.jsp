<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	ScoreDAO dao = new ScoreDAO();

	String hak = request.getParameter("hak");
	String pageNum = request.getParameter("page");
	String rows = request.getParameter("rows");
	
	try {
		dao.deleteScore(hak);
	} catch(Exception e) {
		System.out.print(e.toString());
	}
	
	response.sendRedirect("list.jsp?page=" + pageNum + "&rows=" + rows);
%>