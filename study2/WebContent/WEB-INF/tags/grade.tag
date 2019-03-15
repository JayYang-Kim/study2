<%@tag import="java.util.Calendar"%>
<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>

<%@ attribute name="subject" required="true" type="String" %>
<%@ attribute name="score" required="true" type="Integer" %>

<%-- 0.0 ~ 4.5 => 점수 : 평점 --%>

<%
	String s = null;
	if(score >= 90) {
		s = "<span>4.5</span>";
	} else if(score >= 80) {
		s = "<span>4.0</span>";
	} else if(score >= 70) {
		s = "<span>3.5</span>";
	}else if(score >= 60) {
		s = "<span>3.0</span>";
	}else if(score >= 50) {
		s = "<span>2.5</span>";
	}else if(score >= 40) {
		s = "<span>2.0</span>";
	}else if(score >= 30) {
		s = "<span>1.5</span>";
	}else if(score >= 20) {
		s = "<span>1.0</span>";
	}else if(score >= 10) {
		s = "<span>0.5</span>";
	}else {
		s = "<span>0.0</span>";
	}
%>

<p>
	${score} : <%=s%>
</p>