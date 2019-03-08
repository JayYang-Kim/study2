<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Style -->
		<style type="text/css">
			.yb{background:yellow;border:1px solid red}
		</style>
		<!-- CDN / jQuery UI -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<script type="text/javascript">
			/*
				.attr("checked") => "checked" / "", undefined
				.prop("checked") => true / false
				.is(":checked") -> true / false
			*/
			$(function(){
				$("#btn1").click(function(){
					//$("form input[name=txt]").attr("readOnly", true);
					//$("form input[name=txt]").prop("readonly", true);
					$("form input[name=txt]").prop("disabled", true);
					$("form select[name=select]").prop("selected", true);
					
					// 크롬에서는 여러번 실행할 경우 문제가 발생 (브라우저마다 차이가 발생)
					// checked 속성은 반드시 prop() 함수를 이용하여 설정 / 해제한다.
					//$("form input[name=chk]").attr("checked", true);
					$("form input[name=chk]").prop("checked", true);
				});
				
				$("#btn2").click(function(){
					//$("from input[name=txt]").removeAttr("readonly");
					//$("form input[name=txt]").prop("readonly", false);
					$("form input[name=txt]").prop("disabled", false);
					
					// 크롬에서는 여러번 실행할 경우 문제가 발생 (브라우저마다 차이가 발생)
					$("form input[name=chk]").prop("checked", false);
				});
			});
				
			$(function(){
				$("#btn3").click(function(){
					// 속성 설정
					//$("#img").attr("src", "img1.jpg");
					$("#img").attr({
						src : "img1.jpg",
						alt : "img"
					});
				});
				
				$("#btn4").click(function(){
					$("#img").removeAttr("src");
				});
				
				$("#div1")
					.bind("mouseover", function(){$(this).addClass("yb")})
					.bind("mouseout", function(){$(this).removeClass("yb")})
			});
		</script>
	</head>
	<body>
		<h3>속성</h3>
		<form>
			<p>
				<input type="text" name="txt"/>
			</p>
			<p>
				<input type="checkbox" name="chk"/>
			</p>
			<p>
				<select name="select">
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
			</p>
			<p>
				<button type="button" id="btn1">설정</button>
				<button type="button" id="btn2">해제</button>
			</p>
		</form>
		
		<hr/>
		
		<p>
			<img id="img">
		</p>
		<p>
			<button type="button" id="btn3">그림설정</button>
			<button type="button" id="btn4">그림제거</button>
		</p>
		
		<hr/>
		
		<div id="div1">마우스를 올려주세요.</div>
	</body>
</html>