<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	ScoreDAO dao = new ScoreDAO();
	
	int rows = Integer.parseInt(request.getParameter("rows"));

	try {
		dao.insertScore(dto);
	} catch(Exception e) {
		
	}
	
	response.sendRedirect("list.jsp?rows=" + rows);
%>