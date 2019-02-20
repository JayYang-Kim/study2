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

	try {
		dao.insertScore(dto);
	} catch(Exception e) {
		
	}
	
	response.sendRedirect("list.jsp");
%>