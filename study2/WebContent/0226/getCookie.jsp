<%@page import="java.net.URLDecoder"%>
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
		<p>
			<span>쿠키 가져오기</span>
			<div>
				<%
					Cookie []cc = request.getCookies();
				
					if(cc != null) {
						for(Cookie c : cc) {
							String name = c.getName();
							String value = URLDecoder.decode(c.getValue(), "UTF-8");
							out.print(name + " : " + value + "<br/>");
						}
					}
				%>
			</div>
			<a href="cookieEx.jsp">돌아가기</a>
		</p>
	</body>
</html>