<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	int age = Integer.parseInt(request.getParameter("age"));
	String result = "성인";
	
	if(age < 19) {
		result = "미성년자";
	}
	
	request.setAttribute("result", result);
%>

<jsp:useBean id="vo" class="com.ex.User"/>
<jsp:setProperty property="*" name="vo"/>

<%
	request.setAttribute("vo", vo);
%>

<jsp:forward page="ex01_result.jsp"></jsp:forward>