<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	ScoreDAO dao = new ScoreDAO();

	String []haks = request.getParameterValues("haks");
	String rows = request.getParameter("rows");
	String pageNum = request.getParameter("page");
	
	try {
		dao.deleteScore(haks);		
	} catch(Exception e) {

	}
	
	response.sendRedirect("list.jsp?page" + pageNum + "&rows=" + rows);
%>