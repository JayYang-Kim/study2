<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var httpRequest;	
		
			function sendOk() {
				var q;
				var n1 = document.getElementById("num1").value;
				var n2 = document.getElementById("num2").value;
				var o = document.getElementById("oper").value;
				
				q = "num1=" + n1 + "&num2=" + n2 + "&oper=" + o;
				
				var url = "ex02_ok.jsp?" + q;
				
				// AJAX 객체 생성
				httpRequest = new XMLHttpRequest();
				// 서버에서 응답할때 호출할 자바스크립트 함수
				httpRequest.onreadystatechange = callback;
				// GET방식 설정
				httpRequest.open("GET", url, true);
				// send
				httpRequest.send(null);
			}
			
			function callback() {
				if(httpRequest.readyState == 4 && httpRequest.status == 200) {
					printData();	
				}
			}
			
			function printData() {
				var layout = document.getElementById("layout");
				
				var s = httpRequest.responseText;
				
				layout.innerHTML = s;
			}
		</script>
	</head>
	<body>
		<div>
			<input type="text" id="num1"/>
			<select id="oper">
				<option value="add">더하기</option>
				<option value="sub">빼기</option>
				<option value="mul">곱하기</option>
				<option value="div">나누기</option>
			</select>
			<input type="text" id="num2"/>
			<button type="button" onclick="sendOk()">확인</button>
		</div>
		<hr/>
		<div id="layout"></div>
	</body>
</html>