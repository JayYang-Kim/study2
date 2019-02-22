<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>${3 + 5}</p>
		<p><%= 3 + 5 %></p>
		
		<p>${'seoul'} ${"korea"}</p>
		<p>${"seoul \'korea"}</p>
		<p><%="korea" %></p>
		<%-- <p><%='korea' %></p> --%> <!-- [오류 : 표현식은 순수 자바형식만 입력 가능] -->
		
		<!-- EL에서는 숫자 + 문자열은 문자열을 숫자로 변환하여 계산한다. -->
		<p>${5 + "10"}</p> <!-- [결과 : 15] -->
		<p>${5 + null}</p> <!-- [결과 : 5] -->
		<%-- <p>${"일" + 10}</p> --%> <!-- [결과 : 오류] -->
		<p>${13/5}</p>
		
		<p>${13 div 5}</p> <!-- div : 몫 구하기 -->
		<p>${13 mod 5}</p> <!-- mod : 나머지 구하기 -->
		
		<p>${"korea" == "korea"}</p> <!-- mod : 나머지 구하기 -->
		
		<p>${empty null}</p> <!-- [결과 : true] -->
		<p>${empty ""}</p> <!-- [결과 : true] -->
		
		<p>${3 > 5 ? "예" : "아니오"}</p>
		
		<p>${"korea" += "seoul"}</p>
		
		<p>${1 + 2; 3 + 5}</p>
		<p>${a = 1 + 2}</p>
		<p>${a = 2; b = 5; a+b}</p>
		<p>${x = ["A","B","C"]}</p>
		<p>${y = ["A","B","C"]; ""}</p>
		<p>${y[1]}</p>
	</body>
</html>