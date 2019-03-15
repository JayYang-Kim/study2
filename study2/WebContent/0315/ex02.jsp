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
			<tf:symbol>
				<b></b> : 글자를 진하게 합니다.
				<hr/> : 선을 그립니다.
			</tf:symbol>
		</div>
		<div>
			<tf:symbol2>
				<b></b> : 글자를 진하게 합니다.
				<hr/> : 선을 그립니다.
			</tf:symbol2>
		</div>
		<div>
			<tf:multi count="5"> 
				<b></b> : 글자를 진하게 합니다.
				<hr/> : 선을 그립니다.
			</tf:multi>
		</div>
		<div>
			<tf:sum end="10" begin="1">${hap}</tf:sum>
		</div>
		<div>
			<tf:sum2 var="s" end="10" begin="1"/>
			합 : ${s}
		</div>
		<div>
			<tf:symbol3 var="data">
				안녕 <b></b>태그
				반가워요
			</tf:symbol3>
			${data}
		</div>
	</body>
</html>