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
		<c:forEach var = "s" items="${list}">
			${s}<br/>
		</c:forEach>
		<hr/>
		<c:forEach var = "vo" items="${list2}">
			${vo.name} | ${vo.age}<br/>
		</c:forEach>
		<hr/>
		<span>개수 : ${list2.size()}</span>
		<c:forEach var = "vo" items="${list2}" varStatus="status">
			${vo.name} | ${vo.age} |
			${status.current} | ${status.index} | ${status.count} | ${status.first} | ${status.last}<br/>
		</c:forEach>
	</body>
</html>