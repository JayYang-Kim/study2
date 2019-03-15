<%@tag import="java.util.Calendar"%>
<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>

<%@ attribute name="title" required="true" %>
<%@ attribute name="level" type="Integer" %>

<%
	String s = null, e = null;

	if(level == null || level <= 1) {
		s = "<h1>";
		e = "</h1>";
	} else if (level >= 6) {
		s = "<h6>";
		e = "</h6>";
	} else {
		s = "<h" + level + ">";
		e = "</h" + level + ">";
	}
%>

<%-- 속성은 스크립릿, EL 표현식 사용 가능 --%>
<%=s%>${title}<%=e%>