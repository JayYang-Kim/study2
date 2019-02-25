<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String snum = request.getParameter("num");
	int num = 0;
	String result = "";
	
	if(snum != null) {
		num = Integer.parseInt(snum);
		
		result = "짝수";
		
		if(num % 2 != 0) {
			result = "홀수";
		}
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form method = "post">
			<p>
				<span>수 : </span>
				<input type="text" name="num"/>
				<button>확인</button>
			</p>
			<div>
				<h3>기존 방식</h3>
				<% if(snum != null) { %>
					<%= num %> : <%= result %>
				<% } %>
			</div>
		</form>
	</body>
</html>