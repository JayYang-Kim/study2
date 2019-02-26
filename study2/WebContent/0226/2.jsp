<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 쿠키 설정
	Cookie c2 = new Cookie("product2", URLEncoder.encode("노트북", "UTF-8")); // 이름, 값
	response.addCookie(c2);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<p>상품명 : 노트북</p>
			<p>가격 : 120</p>
			<p>상품설명 : 노트북</p>
		</div>
		<a href="shop.jsp">돌아가기</a>
	</body>
</html>