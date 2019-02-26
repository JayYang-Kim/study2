<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	session.setMaxInactiveInterval(60 * 25); // 유지시간 (단위 : 초), 기본 : 30(분)
	session.setAttribute("id", "test");
	session.setAttribute("name", "홍길동");
	session.setAttribute("age", 20);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>세션 설정</h3>
		<p>
			<a href="sessionEx2.jsp">돌아가기</a>
		</p>
	</body>
</html>