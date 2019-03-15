<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<%
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	int total_page=370;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	margin:0;
	padding:0;
	font-size: 14px;
	font-family: "맑은 고딕", 돋움;
}
</style>

</head>
<body>

  <div style="width:800px; margin:30px auto; text-align: center;">
     <tf:paginate uri="ex_paginate.jsp" total_page="<%=total_page%>" current_page="<%=current_page%>"/>
  </div>

</body>
</html>