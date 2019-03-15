<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<h3>tag - new</h3>
			<tf:now/>
		</div>
		<div>
			<h3>tag - header</h3>
			<tf:header title="Hello World"/>
			<tf:header title="Hello World" level="3"/>
		</div>
		<div>
			<h3>tag - grade</h3>
			<tf:grade subject="수학" score="90"/>
			<tf:grade subject="수학" score="80"/>
			<tf:grade subject="수학" score="70"/>
			<tf:grade subject="수학" score="60"/>
			<tf:grade subject="수학" score="50"/>
			<tf:grade subject="수학" score="40"/>
			<tf:grade subject="수학" score="30"/>
			<tf:grade subject="수학" score="20"/>
			<tf:grade subject="수학" score="10"/>
			<tf:grade subject="수학" score="5"/>
		</div>
		<div>
			<h3>tag - select</h3>
			<tf:select name="city" seoul="서울" busan="부산" incheon="인천"/>
		</div>
	</body>
</html>