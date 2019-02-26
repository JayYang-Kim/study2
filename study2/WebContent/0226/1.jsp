<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 쿠키 설정
	Cookie c1 = new Cookie("product1", URLEncoder.encode("핸드폰", "UTF-8")); // 이름, 값
	response.addCookie(c1);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<p>상품명 : 핸드폰</p>
			<p>가격 : 100</p>
			<p>상품설명 : 핸드폰</p>
		</div>
		<a href="shop.jsp">돌아가기</a>
	</body>
</html>