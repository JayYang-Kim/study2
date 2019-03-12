<%@ page contentType="text/xml; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
%>
<root>
	<dataCount>5</dataCount>
	<%for(int i = 0; i < 5; i++) { %>
		<recoed num="<%=i%>">
			<name><%=i%> : <%=name%></name>
			<!-- CDATA 태그안에 있는 것은 태그가 아니라 값이라는걸 명시 (xml에서 사용) -->
			<content><![CDATA[<%=i%> : <%=content%>]]></content>
		</recoed>
	<% } %>
</root>