<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form method = "post">
			<p>
				<span>수 : </span>
				<input type="text" name="num" value="${param.num}"/>
				<button>확인</button>
			</p>
			<div>
				<h3>JSTL 방식</h3>
				<c:if test="${not empty param.num}"> <!-- param.num에 값이 존재하면 -->
					${param.num} :
					<c:choose>
						<c:when test="${param.num % 3 == 0 && param.num % 4 == 0}">3과 4의 배수</c:when>
						<c:when test="${param.num % 3 == 0}">3의 배수</c:when>
						<c:when test="${param.num % 4 == 0}">4의 배수</c:when>
						<c:otherwise>3또는 4의 배수가 아닙니다.</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</form>
	</body>
</html>