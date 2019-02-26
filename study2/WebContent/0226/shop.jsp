<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
			<table>
				<tr>
					<th>제품명</th>
					<th>가격</th>
				</tr>
				<tr>
					<td><a href="1.jsp">컴퓨터</a></td>
					<td>100</td>
				</tr>
				<tr>
					<td><a href="2.jsp">노트북</a></td>
					<td>120</td>
				</tr>
				<tr>
					<td><a href="3.jsp">모니터</a></td>
					<td>30</td>
				</tr>
			</table>
			<div>
				<h3>오늘본 상품목록</h3>
				<%
					Cookie []cc = request.getCookies();
				
					if(cc != null) {
						for(Cookie c : cc) {
							String name = c.getName();
							if(name.startsWith("product")) {
								String value = URLDecoder.decode(c.getValue(), "UTF-8");
								out.print(value + "<br/>");	
							}
							/* if(!name.equals("JSESSIONID")) {
								String value = URLDecoder.decode(c.getValue(), "UTF-8");
								out.print(value + "<br/>");
							} */
						}
					}
				%>
			</div>
		</div>
	</body>
</html>