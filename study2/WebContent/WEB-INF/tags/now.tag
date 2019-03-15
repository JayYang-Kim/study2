<%@tag import="java.util.Calendar"%>
<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>

<%
	Calendar cal = Calendar.getInstance();

	String s = String.format("%tF %tT", cal, cal);
%>

<%=s%>