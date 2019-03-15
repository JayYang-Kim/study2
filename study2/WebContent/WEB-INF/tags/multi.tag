<%@ tag body-content="scriptless" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="count" required="true" type="Integer" %>

<c:forEach var="n" begin="1" end="${count}">
	<jsp:doBody/>
</c:forEach>