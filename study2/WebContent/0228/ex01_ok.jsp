<%@page import="java.io.InputStream"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// enctype = "multipart/form-data"는 getParameter()로 받을 수 없다. (getParameter는 문자열만 받을 수 있다.)
	/* String subject = request.getParameter("subject");
	String upload = request.getParameter("upload"); */
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- <p>제목 : <%=subject%></p>
		<p>파일 : <%=upload%></p> --%>
		
		<!-- mutipart/form-data로 넘어온 파일 출력 -->
		<%
			// request로 넘어온 데이터(POST)
			InputStream is = request.getInputStream();
			byte []b = new byte[1024];
			
			int size;
			String s;
			
			while((size = is.read(b)) != -1) {
				// enctype = "multipart/from-data"인 경우
				//s = new String(b, 0, size, "UTF-8");
				s = new String(b, 0, size, "UTF-8");
				out.println(s + "<br/>");
			}
		%>
	</body>
</html>