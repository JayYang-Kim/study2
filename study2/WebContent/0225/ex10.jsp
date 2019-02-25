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
		<!-- c:set 데이터를 저장(map형식으로) -->
		<c:set var="a" value="1"/>
		<c:forEach var="n" begin="1" end="10" step="1">
			<c:set var="a" value="${a * 2}"/>
			2 ^ ${n} = ${a}<br/>
		</c:forEach>
		<br/>
		<p>
			<!-- value안에 있는걸 그대로 출력 -->
			<c:out value="안녕<br/>반가워요."/>
		</p>
		<p>
			<!-- escapeXml : 기본값 true -->
			<!-- false : <br/>태그를 인식 -->
			<c:out value="안녕<br/>반가워요." escapeXml="false"/>
		</p>
		<p>
			<c:out value="안녕<br/>반가워요." escapeXml="true"/>
		</p>
		<c:import url="ex03.jsp"/>
		<div>
			<h3>import에서 var로 변수를 선언하지 않고 출력한 경우 : 결과가 출력</h3>
			<p>
				<c:out value="${url}"></c:out>
			</p>
		</div>
		<c:set var="url" value="https://www.naver.com"/>
		<c:import url="${url}" var="u"/>
		
		<h3>홈페이지 결과</h3>
		<c:out value="${u}" escapeXml="false"></c:out>
		
		<h3>홈페이지 결과</h3>
		<c:out value="${u}"></c:out>
	</body>
</html>