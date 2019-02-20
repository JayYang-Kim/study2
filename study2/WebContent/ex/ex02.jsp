<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	MyUtil util = new MyUtil();
	
	// JSP에선 PAGE가 예약어이므로 변수로 사용 불가
	String pageNum = request.getParameter("page");
	int current_page = 1;
	if(pageNum!=null) {
		current_page = Integer.parseInt(pageNum);
	}
	
	// 전체 데이터 수
	int dataCount = 965;
	
	// 한 페이지에 표시할 데이터 수
	int rows = 10;
	
	// 총 페이지 수
	int total_page = util.pageCount(rows, dataCount);
	
	// 총 페이지 수보다 표시할 페이지가 클 경우
	if(current_page > total_page) {
		current_page = total_page;
	}
	
	// 페이징 처리
	String list_url = "ex02.jsp";
	
	String paging = util.paging(current_page, total_page, list_url);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="common.css" type="text/css"/>
	</head>
	<body>
		<h3>페이징 처리 테스트</h3>
		<div style="text-align:center;">
			<%= paging %>
		</div>
	</body>
</html>