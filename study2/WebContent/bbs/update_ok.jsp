<%@page import="java.net.URLEncoder"%>
<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.bbs.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	BoardDAO dao = new BoardDAO();
	
	dao.updateBoard(dto);
	
	String pageNum = request.getParameter("page");
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	searchValue = URLEncoder.encode(searchValue, "UTF-8");
	
	String query = "page=" + pageNum;
	if(searchValue.length() != 0) {
		query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
	}
	
	response.sendRedirect("article.jsp?" + query + "&num=" + dto.getNum());
%>
