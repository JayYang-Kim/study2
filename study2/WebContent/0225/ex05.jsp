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
					${param.num} 단 <br/>
					<c:forEach var="n" begin="1" end="9" step="1">
						${param.num} * ${n} = ${param.num * n}<br/>
					</c:forEach>
				</c:if>
			</div>
		</form>
	</body>
</html>