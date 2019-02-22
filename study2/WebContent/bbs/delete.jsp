<%@page import="com.bbs.BoardDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("page");
	
	String searchKey = request.getParameter("searchKey");
	// tomcat에서는 값을 받아올때 디코딩이 된 상태이다.
	// 다른 WAS에서는 값을 받아올때 인코딩만 되어있는 상태이다.
	String searchValue = request.getParameter("searchValue"); 
	
	if(searchKey == null) {
	   searchKey = "subject";
	   searchValue = "";
	}
	
	// 인코딩 > 디코딩 처리
	searchValue = URLDecoder.decode(searchValue, "UTF-8");
	
	String query = "page=" + pageNum;
	
	if(searchValue.length() != 0) {
	   query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	}
	
	BoardDAO dao = new BoardDAO();
	
	dao.deleteBoard(num);

	response.sendRedirect("list.jsp?" + query);
%>