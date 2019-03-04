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
		<div>
			<h3>기본 enctype : application/x-www-form-urlencoded</h3>
			<p>문자열을 전송할 때 사용</p>
			<h3>파일 enctype : multipart/form-data</h3>
			<p>파일을 전송할 때 사용하며 파일명과 파일내용이 전송될때 사용</p>
		</div>
		<form action="ex02_ok.jsp" method="post" enctype="multipart/form-data">
			<p>제목 : <input type="text" name="subject"/></p>
			<p>이름 : <input type="text" name="name"/></p>
			<p>파일 : <input type="file" name="upload"/></p>
			<p><button>전송</button></p>
		</form>
	</body>
</html>