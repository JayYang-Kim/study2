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
					var url = "ex05_ok.jsp";
					
					var n1 = $("#num1").val();
					var n2 = $("#num2").val();
					var o = $("#oper").val();
					
					// AJAX-GET 방식 - 2 : get();
					// function(data) : 서버에서 넘어온 데이터를 저장
					$.post("ex06_ok.jsp", {num1:n1, num2:n2, oper:o}, function(data) {
						$("#layout").html(data);
					});
				});
			});
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