<%@ page contentType="text/xml; charset=UTF-8" %>
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
	
	//Thread.sleep(5000);
%>

<root>
	<num1><%=num1%></num1>
	<num2><%=num2%></num2>
	<oper><%=o%></oper>
	<result value="<%=result%>"/>
</root>