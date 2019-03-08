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
					var s = "<p><button class='btn'>확인</button></p>";
					$("#layout").append(s);
				});
				
				// 새로 추가된 .btn들은 이벤트가 등록된 후 추가되었기 때문에 이벤트 실행이 불가
				// 동적으로 등록된 버튼들은 이벤트 처리가 되지 않는다.
				/* $(".btn").click(function(){
					alert("안녕");
				}); */
				
				$("body").on("click", ".btn", function(){
					alert("안녕");
				});
			});
		</script>
	</head>
	<body>
		<h3>이벤트</h3>
		
		<div id="layout">
			<p><button class='btn'>확인</button></p>
		</div>
			
		<p>
			<button type="button" id="btn1">추가</button>
		</p>
	</body>
</html>