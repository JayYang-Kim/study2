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
				$("#btn1").click(function(){
					$("#div1").append("<p>추가</p>");
				});
				
				$("#btn2").click(function(){
					$("<p>추가!!</p>").appendTo("#div1");
				});
				
				$("#btn3").click(function(){
					$("#div1").prepend("<p>선두!!</p>");
				});
				
				$("#btn4").click(function(){
					$("#div1").remove(); // div 객체 자체를 제거
				});
				
				$("#btn5").click(function(){
					$("#div1").empty(); // div 안의 내용만 제거
				});
			})
		</script>
	</head>
	<body>
		<h3>조작</h3>
		
		<div id="div1">
			<p>test</p>
		</div>
		
		<p>
			<button type="button" id="btn1">추가1</button>
			<button type="button" id="btn2">추가2</button>
			<button type="button" id="btn3">선삽입</button>
			<button type="button" id="btn4">remove</button>
			<button type="button" id="btn5">empty</button>
		</p>
	</body>
</html>