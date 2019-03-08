<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");

	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String o = request.getParameter("oper");
	
	String result = "";
	if(o.equals("add")) {
		result = Integer.toString(num1 + num2);
	} else if(o.equals("sub")) {
		result = Integer.toString(num1 - num2);
	} else if(o.equals("mul")) {
		result = Integer.toString(num1 * num2);
	} else if(o.equals("div")) {
		result = Integer.toString(num1 / num2);
	}
	
	Thread.sleep(5000);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%=num1%> <%=o%> <%=num2%> = <%=result%>
	</body>
</html>