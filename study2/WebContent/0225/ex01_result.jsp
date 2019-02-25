<%@page import="com.ex.User"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String city = request.getParameter("city");
	
	String s = (String)request.getAttribute("result");
	String s2 = (String)request.getAttribute("subject");
	
	User vo = (User)request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>표현식으로 표현</h3>
		<p><span>name : </span><%=name%></p>
		<p><span>age : </span><%=age%></p>
		<p><span>city : </span><%=city%></p>
		<p><span>s : </span><%=s%></p>
		<p><span>s2 : </span><%=s2%></p>
		<p><span>name(vo) : </span><%=vo.getName()%></p>
		<p><span>age(vo) : </span><%=vo.getAge()%></p>
	</body>
</html>