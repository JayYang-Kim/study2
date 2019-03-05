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
				// ~ : 모든형제(태그 아래의 같은 레벨)
				$(".form span ~ b").css("background-color","#c4c4c4");
				// > : 한단계 자식
				$(".form div > b").css("background-color","red");
				// 모든 자식
				$(".form div b").css("color","green");
				// + : 다음 형제
				$(".form div span + b").css("background-color","#4c4c4c");
			});
		</script>
	</head>
	<body>
		<div class="form">
			<h3>Selectors 예제</h3>
			<div id="subject">과목</div>
			<div>
				<b>자바</b>
				<span>객체지향 프로그램</span>
				<b>HTML5</b>
				<b>5</b>
				<span>웹 프로그래밍</span>
				<b>스프링</b>
				<span>프레임워크</span>
				<p>
					<b>CSS</b>
					<span>스타일시트</span>
				</p>
			</div>
		</div>
	</body>
</html>