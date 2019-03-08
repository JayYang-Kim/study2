<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- CDN / jQuery UI -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#tabs").tabs();
			});
		</script>
	</head>
	<body>
		<h3>UI</h3>
		<div id="tabs">
			<ul>
				<li><a href="t1.jsp"><span>처음</span></a></li>
				<li><a href="t2.jsp"><span>자바</span></a></li>
				<li><a href="t3.jsp"><span>끝</span></a></li>
			</ul>
		</div>
	</body>
</html>