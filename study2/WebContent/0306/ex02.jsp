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
				$("form input[name=name]").val("홍길동");
				$("#g1").prop("checked", true);
				$("form select[name=hak]").val("대졸");
				$("form select[name=subject]").val(["자바","빅데이터"]);
				
				$("#btn").click(function(){
					var out = "";
					var name = $("form input[name=name]").val();
					//var name = $("form input[name=name]").val().trim();
					
					var gender = "";
					if($("form input:radio[name=gender]").is(":checked")) {
						gender = $("form input[name=gender]:checked").val();
					}
					
					var hak = $("form select[name=hak]").val();
					//var subjects = $("form select[name=subject]").val();
					var subjects = "";
					// 선택값이 하나가 아니고 여러개일 경우
					$("form select[name=subject] option:selected").each(function(){
						subjects += $(this).val() + " ";
					});
					
					out = "name : " + name + "<br/>";
					out += "gender : " + gender + "<br/>";
					out += "hak : " + hak + "<br/>";
					out += "subjects : " + subjects + "<br/>";
					$("#layout").html(out);
				});
			})
		</script>
	</head>
	<body>
		<h3>속성</h3>
		<form>
			<p>
				<span>이름 : </span>
				<input type="text" name="name"/>
			</p>
			<p>
				<span>성별 : </span>
				<input type="radio" id="g1" name="gender" value="남">남자
				<input type="radio" id="g2" name="gender" value="여">여자
			</p>
			<p>
				<span>학력 : </span>
				<select name="hak">
					<option value="">선택</option>
					<option value="대졸">대졸</option>
					<option value="고졸">고졸</option>
					<option value="기타">기타</option>
				</select>
			</p>
			<p>
				<span>좋아하는 과목 : </span>
				<select name="subject" multiple="multiple">
					<option>자바</option>
					<option>스프링</option>
					<option>안드로이드</option>
					<option>빅데이터</option>
					<option>오라클</option>
				</select>
			</p>
			<p>
				<button type="button" id="btn">확인</button>
			</p>
		</form>
		<div id="layout">
		</div>
	</body>
</html>