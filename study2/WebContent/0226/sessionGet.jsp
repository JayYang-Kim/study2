<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String id = (String)session.getAttribute("id");
	/* String name = (String)session.getAttribute("name");
	int age = (int)session.getAttribute("age"); */
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>세션 확인</h3>
		<div>
			<p>
				<span>아이디 : </span>
				<span><%=id%></span>
			</p>
			<p>
				<span>이름 : </span>
				<span>${sessionScope.name}</span> <!-- session을 나타내는 내장 객체 -->
			</p>
			<p>
				<span>나이 : </span>
				<span>${sessionScope.age}</span> <!-- session을 나타내는 내장 객체 -->
			</p>
			<p>
				<a href="sessionEx2.jsp">돌아가기</a>
			</p>
		</div>
	</body>
</html>