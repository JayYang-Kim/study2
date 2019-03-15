<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ tag dynamic-attributes="optionMap" %>
<%@ attribute name="name" required="true" type="String" %> 

<%-- 동적속성은 Map 타입의 EL로 저장 --%>

<select name="${name}">
	<c:forEach var="opt" items="${optionMap}">
		<option value="${opt.key}">${opt.value}</option>
	</c:forEach>
</select>