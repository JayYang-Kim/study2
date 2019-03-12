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
					var num = $("#num").val();
					var url = "ex02_ok.jsp";
					
					// ajax는 비동기 방식이기 때문에 밑의 "after ajax call..."이 나온후에 "결과 : " + data가 출력된다.
					$.ajax({
						type : "POST",
						url : url,
						data : "num=" + num,
						// 성공했을때
						success : function(data) {
							$("#layout").html("결과 : " + data);
						},
						// 실패했을때
						error : function(e) {
							console.log(e.responseText);	
						}
					});
				});
				
				$("#layout").html("after ajax call...");
			});
		</script>
	</head>
	<body>
		<form name="myForm">
			<div>
				<input type="text" id="num" name="num"/>
				<button type="button" id="btn">결과</button>
			</div>
		</form>
		<hr/>
		<div id="layout"></div>
	</body>
</html>