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
		<form action="ex01_ok.jsp" method="post">
			<p>
				<span>이름 : </span>
				<input type="text" name="name"/>
			</p>
			<p>
				<span>나이 : </span>
				<input type="text" name="age"/>
			</p>
			<p>
				<span>급여 : </span>
				<input type="text" name="pay"/>
			</p>
			<p>
				<button type="submit">전송</button>
			</p>
		</form>
	</body>
</html>