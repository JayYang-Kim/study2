<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="begin" required="true" type="Integer" %>
<%@ attribute name="end" required="true" type="Integer" %>

<%@ variable name-given="hap" variable-class="Integer" scope="NESTED" %>

<%-- NESTED : 태그 내에서만 사용 가능 --%>
<c:set var="hap" value="0"/>
<c:forEach var="n" begin="${begin}" end="${end}">
	<c:set var="hap" value="${hap + n}"/>
</c:forEach>
<jsp:doBody/>