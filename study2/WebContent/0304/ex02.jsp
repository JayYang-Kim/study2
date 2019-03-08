<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- CDN / jQuery UI -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function(){
				$("*").css("font-size","16px");
				$("span").css("color","red");
				$("#div1").css("color","blue");
				
				$(".c1").css("background","green");
				
				$("span, label").css("font-family","궁서");
				
				$("input[name=aa1]").css("font-family","궁서");
				
				$("form input").css("background-color","#eeeeee");
				
				$("form input[type=text]").css("border","none");
				
				// * = 포함
				$("input[name*=aa]").css("border","2px solid #4c4c4c");
				// ^ = 시작
				$("input[name^=aa]").css("border-bottom","1px solid blue");
				// $ = 끝
				$("input[name$=2]").css("border-left","2px solid green");
				
				// 해당 엘리먼트가 아닌것
				$("form :not(input[type=text])").css("background-color","#00fff");
			});
		</script>
	</head>
	<body>
		<div>
			<h3>Selectors 예제</h3>
			<div id="div1">test1</div>
			<div id="div2">test2</div>
			<span>test3</span><br/>
			<span>test4</span>
			<div id="div3" class="c1">test5</div>
			<span class="c1">test6</span><br/>
			<label class="c1">test7</label><br/>
			<label class="c2">test8</label><br/>
			
			<input type="text" name="aa1"/><br/><br/>
			
			<form>
				<input type="text" name="aa1"/><br/><br/>
				<input type="text" name="aa2"/><br/><br/>
				<input type="text" name="zzaabb"/><br/><br/>
				<input type="text" name="bb1"/><br/><br/>
				<input type="text" name="bb2"/><br/><br/>
				<input type="password" name="cc1"><br/><br/>
				<input type="button" value="등록하기"/>
				<input type="reset" value="다시입력"/>
			</form>
		</div>
	</body>
</html>