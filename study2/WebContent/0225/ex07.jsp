<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<c:forEach var="a" begin="1" end="9" step="1">
				<tr>
					<c:forEach var="b" begin="1" end="5" step="1">
						<td width="50">${a * b}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>