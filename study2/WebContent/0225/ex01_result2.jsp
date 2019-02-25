<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>EL로 출력</h3>
		<p><span>name : </span>${param.name}</p>
		<p><span>age : </span>${param.age}</p>
		<p><span>city : </span>${param.city}</p>
		<p><span>s : </span>${result}</p>
		<p><span>s2 : </span>${param.age >= 19 ? "어른" : "미성년자"}</p>
		
		<p><span>name(vo) : </span>${vo.name}</p>
		<p><span>age(vo) : </span>${vo.age}</p>
		<!-- vo에 없는 Property를 사용하면  PropertyNotFoundException 발생 -->
		<%-- <p><span>age(vo) : </span>${vo.subject}</p> --%> 
	</body>
</html>