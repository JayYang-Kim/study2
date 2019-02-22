<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.guest.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	GuestDAO dao = new GuestDAO();
	
	String pageNum = request.getParameter("page");

	try {
		dao.inserGuest(dto);
	} catch(Exception e) {
		
	}
	
	response.sendRedirect("guest.jsp?page=" + pageNum);
%>