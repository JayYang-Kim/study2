<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.bbs.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setIpAddr(request.getRemoteAddr());

	BoardDAO dao = new BoardDAO();
	
	dao.insertBorad(dto);
	
	response.sendRedirect("list.jsp");
%>
