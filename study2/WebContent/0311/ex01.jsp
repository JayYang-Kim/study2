<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btn").click(function(){
					var query= $("form[name=myForm]").serialize();
					var url = "ex01_ok.jsp";
					
					// .ajax 메소드를 사용하여 메소드를 처리하여하는 이유 : 에러 검사 하기가 쉽다, 다양한 옵션을 제공
					$.ajax({
						type : "POST",
						url : url,
						data : query,
						// 성공했을때
						success : function(data) {
							$("#layout").html(data);
						},
						beforeSend : check, // 서버에 전송하기 전에 check 함수의 주소를 알려줘서 유효성 검사 처리
						// 실패했을때
						error : function(e) {
							console.log(e.responseText);	
						}
					});
				});
			});
			
			// true, false값을 리턴하여 서버로 전송할지 안할지 결정
			function check() {
				if(!$("#num1").val()) {
					$("#num1").focus();
					return false;
				}
				
				if(!$("#num2").val()) {
					$("#num2").focus();
					return false;
				}
				
				return true;
			}
		</script>
	</head>
	<body>
		<form name="myForm">
			<div>
				<input type="text" id="num1" name="num1"/>
				<select id="oper" name="oper">
					<option value="+">더하기</option>
					<option value="-">빼기</option>
					<option value="*">곱하기</option>
					<option value="/">나누기</option>
				</select>
				<input type="text" id="num2" name="num2"/>
				<button type="button" id="btn">확인</button>
			</div>
		</form>
		<hr/>
		<div id="layout"></div>
	</body>
</html>