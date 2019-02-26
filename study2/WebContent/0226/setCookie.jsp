<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	// 쿠키 설정
	Cookie c1 = new Cookie("subject", "JSP"); // 이름, 값
	c1.setMaxAge(60 * 60); // 쿠키 유효시간(단위 : 초, 기본 : -1 => 브라우져가 닫히면 지워짐)
	response.addCookie(c1); // 쿠키 저장
	
	// 쿠키값은 숫자, 영문자가 아닌 경우 반드시 인코딩
	Cookie c2 = new Cookie("city", URLEncoder.encode("서울", "UTF-8"));
	c2.setMaxAge(-1); // 기본 값
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("tel", "010-1234-1234");
	c3.setPath("/"); // 모든 경로에서 접근 가능. 기본은 설정한 경로에서만 접근가능
	response.addCookie(c3);
	
	Cookie c4 = new Cookie("year", "2010"); // 쿠기값은 문자열만 가능
	c4.setMaxAge(0); // 생성과 동시에 삭제
	response.addCookie(c4);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>
			<span>쿠기 설정 완료</span>
			<a href="cookieEx.jsp">돌아가기</a>
		</p>
	</body>
</html>