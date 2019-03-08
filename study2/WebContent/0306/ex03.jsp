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
				var s;
				s = $("#div1").html();
				//s = $("#div1").text();
				
				//alert(s);
				
				//$("#div2").text(s);
				$("#div2").html(s);
			})
		</script>
	</head>
	<body>
		<h3>속성</h3>
		<div id="div1">
			<span>안녕<b>반가워요</b></span>
			<p>또 만나요</p>
		</div>
		<div id="div2">
		</div>
	</body>
</html>