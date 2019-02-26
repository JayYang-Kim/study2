<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Cookie c1 = new Cookie("subject", null);
	c1.setMaxAge(0); // 생성과 동시에 삭제
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("city", null);
	c2.setMaxAge(0);
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("tel", null);
	c3.setPath("/"); // 설정에서 path를 설정한 경우 삭제할때도 path 설정해줘야한다.
	c3.setMaxAge(0);
	response.addCookie(c3);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="cookieEx.jsp">돌아가기</a>
	</body>
</html>