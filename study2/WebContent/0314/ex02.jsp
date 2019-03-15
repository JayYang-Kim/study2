<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tf" uri="/WEB-INF/myTag.tld" %>
<%@ taglib prefix="p" uri="/WEB-INF/paginate.tld" %>
<%
	String pageNum = request.getParameter("page");
	int current_page = 1;
	if(pageNum != null) {
		current_page = Integer.parseInt(pageNum);
	}
	
	int dataCount = 3000;
	int total_page = 300;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>
			<p:page total_page="<%=total_page%>" uri="ex02.jsp" current_page="<%=current_page %>"/>
		</p>
	</body>
</html>