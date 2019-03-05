<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- CDN / jQuery -->
		<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<!-- CDN / jQuery UI -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#subject > div").click(function(){
					//console.log($(this));
					var num = $(this).attr("data-num");
					alert(num + $(this).html());
				});
			});
		</script>
	</head>
	<body>
		<div id="subject">
			<div data-num="1">자바</div>
			<div data-num="2">스프링</div>
			<div data-num="3">자바스크립트</div>
			<div data-num="4">HTML</div>
			<div data-num="5">CSS</div>
		</div>
	</body>
</html>