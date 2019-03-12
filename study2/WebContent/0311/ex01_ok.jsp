<%@page import="java.net.URLDecoder"%>
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
	if(o.equals("+")) {
		result = Integer.toString(num1 + num2);
	} else if(o.equals("-")) {
		result = Integer.toString(num1 - num2);
	} else if(o.equals("*")) {
		result = Integer.toString(num1 * num2);
	} else if(o.equals("/")) {
		result = Integer.toString(num1 / num2);
	}
	
	//Thread.sleep(5000);
%>

	<div style="color:#4c4c4c;">
		<%=num1%> <%=o%> <%=num2%> = <%=result%>
	</div>
	