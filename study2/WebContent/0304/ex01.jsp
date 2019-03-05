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
			/* javaScript */
			/* 결과 : Hello World2만 출력됨 */
			/* window.onload = function() {
				alert("Hello World");
			};
			
			window.onload = function() {
				alert("Hello World2");
			}; */
			
			/* jQuery */
			/* $(function() {
				alert("HellO World");
			}); */
			//document.getElementById("layout").innerHTML = "<b>하이</b>"; // [에러]
			
			// window.onload는 중복으로 생성될 경우 소스보기 했을때 제일 하단에 있는 onload가 실행된다.
			/* window.onload = function() {
				document.getElementById("layout").innerHTML = "<b>하이</b>";
				alert("방가");
			} */
			
			/* jQuery(function() {
				alert("HellO World");
			}); */
			
			/* $(function() {
				alert("HellO World2");
			}); */
			
			/* jQuery(function() {
				alert("HellO World2");
			}); */
			
			// 해당 페이지를 그릴 준비가 완료 되었을때 실행
			// 방법 - 1
			$(document).ready(function() {
				//document.getElementById("layout").innerHTML = "<b>하이</b>";
				//layout.innerHTML = "<b>하이</b>"; // id가 중복될 경우가 적어서 오류는 안날 수 있지만 변수명과 중복될 수 있기 때문에 사용을 권장하지 않는다.
				$("#layout").html("<br/><b>안녕</b>");
				alert("방가");
			});
			// 방법 - 2
			$(function() {
				$("#layout").html("<br/><b>안녕</b>");
				alert("방가");
			});
		</script>
	</head>
	<body>
		<div id="layout"></div>
	</body>
</html>