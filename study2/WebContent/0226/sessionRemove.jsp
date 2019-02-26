<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	// session을 하나씩 지우는 방법
	session.removeAttribute("id");
	session.removeAttribute("name");
	session.removeAttribute("age");
	
	// 모든 세선값을 지우고 세션 초기화
	session.invalidate(); 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>세션 삭제</h3>
		<div>
			<p>
				<a href="sessionEx2.jsp">돌아가기</a>
			</p>
		</div>
	</body>
</html>