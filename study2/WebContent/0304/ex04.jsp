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
				$("#container form div input+span").hide();
				
				$("#container form div input[type=text]").css("border","1px solid #c4c4c4");
				
				// focus를 받았을때
				$("#container form div input[type=text]").focus(function(){
					$(this).css("border","1px solid #4c4c4c");
					$(this).next("span").show();
				});
				
				// focus를 벗어났을때
				$("#container form div input[type=text]").blur(function(){
					$(this).css("border","1px solid #c4c4c4");
					$(this).next("span").hide();
				});
			});
		</script>
		<style type="text/css">
			*{padding:0;margin:0;}
			input:focus{outline:none;}
		</style>
	</head>
	<body>
		<div id="container">
			<form>
				<div>
					<input type="text" name="id"/>
					<span>아이디</span>
					<span>아이디는 5자 이상 입력해주세요.</span>
				</div>
				<div>
					<input type="text" name="name"/>
					<span>이름</span>
				</div>
				<div>
					<input type="text" name="birth"/>
					<span>생일</span>
				</div>
				<div>
					<button type="button">등록하기</button>
					<button type="reset">다시입력</button>
				</div>
			</form>
		</div>
	</body>
</html>