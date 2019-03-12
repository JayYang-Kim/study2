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
			jQuery.fn.center = function() {
				this.css("position", "absolute");
				this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2 + $(window).scrollTop())) + "px");
				this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2 + $(window).scrollLeft())) + "px");
				
				return this;
			};
		
			$(function(){
				$("#btn").click(function(){
					var num = $("#num").val();
					var url = "ex04_ok.jsp";
					
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
				
				$(document)
					.ajaxStart(function(){ // ajax 시작시
						$("#loading").center();
						$("#loadingLayout").fadeTo("slow", 0.5);
					})
					
					.ajaxComplete(function() { // ajax 종료시
						$("#loadingLayout").hide();
					});
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
		<div id="loadingLayout" style="display:none;position:absolute;left:0;top:0;width:100%;height:100%;background-color:#eeeeee;z-index:9999;">
			<img src="loading.gif" alt="" id="loading" style="border:0;">
		</div>
	</body>
</html>