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
		<h3>Map</h3>
		${map.name} | ${map.age}<br/>
		
		<c:forEach var="entry" items="${map}">
			${entry.key} | ${entry.value}<br/>
		</c:forEach>
		
		<h3>List에 저장된 Map</h3>
		<c:forEach var="m" items="${list}">
			${m.subject} | ${m.year} | ${m.price}<br/>
		</c:forEach>
	</body>
</html>