<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" uri="/WEB-INF/myTag.tld" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>오늘은<tf:now/>입니다.</p>
		<p>
			<tf:header title="자바"/>
			<tf:header title="자바" level="3"/>
		</p>
		<p>
			<tf:for var="a" begin="1" end="10">
				자바 - ${a}<br/>
			</tf:for>
		</p>
		<p>
			<tf:for var="a" begin="10" end="1" step="-1">
				자바 - ${a}<br/>
			</tf:for>
		</p>
	</body>
</html>