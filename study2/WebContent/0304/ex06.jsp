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
				$("#btn").click(function(){
					$("#subject > div").each(function() {
						if($(this).is(":visible")) { // :hidden
							$(this).hide(500);
						} else {
							$(this).show(500);
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<div id="subject">
			<div>자바</div>
			<div>자바스크립트</div>
			<div style="display:none">프레임워크</div>
			<div>웹</div>
			<div>서블릿</div>
			<div style="display:none">오라클</div>
			<div>빅데이터</div>
		</div>
		<div>
			<button type="button" id="btn">확인</button>
		</div>
	</body>
</html>