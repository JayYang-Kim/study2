<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 실제 작업경로
	String cp = request.getContextPath();
%>

<ul>
	<li><a href="main.jsp" class="menuItem ${param.menuItem == 'main' ? 'menuItem-is-disabled':''}">Home</a></li>
	<li><a href="guest.jsp" class="menuItem ${param.menuItem == 'guest' ? 'menuItem-is-disabled':''}">방명록</a></li>
	<li><a href="bbs.jsp" class="menuItem ${param.menuItem == 'bbs' ? 'menuItem-is-disabled':''}">게시판</a></li>
	<li><a href="#" class="menuItem">공지사항</a></li>
	<li><a href="#" class="menuItem">일정관리</a></li>
</ul>