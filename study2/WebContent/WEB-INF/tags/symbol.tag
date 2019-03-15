<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="trim" %>

<jsp:doBody var="content" scope="page"/>

<%
	String content = (String)jspContext.getAttribute("content");

	if(trim != null && trim.equals("true")) {
		content = content.trim();
	}
	
	content = content.replaceAll("&", "&amp");
	content = content.replaceAll("\"", "&quot");
	content = content.replaceAll(">", "&gt");
	content = content.replaceAll("<", "&lt");
	content = content.replaceAll("\n", "<br/>");
	content = content.replaceAll("\\s", "&nbsp");
%>