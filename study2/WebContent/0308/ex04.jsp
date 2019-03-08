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
					//var query = "num1=" + $("#num1").val() + "&num2=" + $("#num2").val();
					//query += "&oper=" + encodeURIComponent($("#oper").val());
					
					// serialize() : form의 데이터를 키=값&키=값 형식으로 만들어 주며 인코딩도 해준다.
					// 주의사항 : form의 요소들은 name 속성이 필수
					var query= $("form[name=myForm]").serialize();
					
					var url = "ex04_ok.jsp?" + query;
					
					// AJAX-GET 방식 - 1 : load();
					$("#layout").load(url);
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