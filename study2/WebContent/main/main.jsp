<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 실제 작업경로
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="common.css" type="text/css"/>
	</head>
	<body>
		<div id="main-layout">
			<div id="header">
				<jsp:include page="header.jsp">
					<jsp:param value="main" name="menuItem"/>
				</jsp:include>
			</div>
			<div id="body-content">
				메인화면입니다.
			</div>
			<div id="footer">
				<jsp:include page="footer.jsp"/>
			</div>
		</div>
	</body>
</html>