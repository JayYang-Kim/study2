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
		<style type="text/css">
		* {
		    margin:0; padding:0;
		}
		
		body {
		    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
		    font-size: 14px;
		}
		
		a {
		    cursor: pointer;
		    color: #000000;
		    text-decoration: none;
		    /*line-height: 150%;*/
		}
		a:hover, a:active {
		    color: #F28011;
		    text-decoration: underline;
		}
		
		.btn {
		    color:#333333;
		    font-weight:500;
		    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
		    border:1px solid #cccccc;
		    background-color:#fff;
		    text-align:center;
		    cursor:cursor;
		    padding:3px 10px 5px;
		    border-radius:4px;
		}
		.btn:active, .btn:focus, .btn:hover {
		    background-color:#e6e6e6;
		    border-color: #adadad;
		    color: #333333;
		}
		.boxTA {
		    border:1px solid #999999;
		    height:150px;
		    padding:3px 5px;
		    border-radius:4px;
		    background-color:#ffffff;
		    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
		}
		</style>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btn1").click(function(){
					/* $(this).siblings().prop("disabled", true); */
					$("#dlg1").dialog();
				});
				$("#btn2").click(function(){
					$("#dlg2").dialog({
						title : "데이터 검색",
						width : 500,
						height : 500
					});
				});
				$("#btn3").click(function(){
					$("#dlg3").dialog({
						title : "우편 검색",
						modal : true,
						width : 500,
						height : 500
					});
				});
				$("#btn4").click(function(){
					$("<div>").dialog({
						title : "게시판 - 댓글",
						modal : true,
						width : 800,
						height : 1000,
						open : function(){
							//$(this).append("<p>sss</p>");
							$(this).load("reply_ex.jsp");
						}
					});
				});
				$("#btn5").click(function(){
					$("#dlg5").dialog({
						title : "예제",
						modal : true,
						width : 500,
						height : 500
					});
				});
				$("#btn6").click(function(){
					$("#dlg6").dialog({
						title : "예제",
						modal : true,
						width : 500,
						height : "auto",
						show : "blind", 
						hide : "explode",
						buttons : {
							"확인" : function() {
								alert("확인");
							},
							"취소" : function() {
								$(this).dialog("close");
							}
						}
					});
				});
			});
			
			function dlgclose5() {
				$("#dlg5").dialog("close");
			}
		</script>
	</head>
	<body>
		<h3>UI</h3>
		<p>
			<button type="button" id="btn1">대화상자1</button>
			<button type="button" id="btn2">대화상자2</button>
			<button type="button" id="btn3">대화상자3</button>
			<button type="button" id="btn4">대화상자4</button>
			<button type="button" id="btn5">대화상자5</button>
			<button type="button" id="btn6">대화상자6</button>	
		</p>
		<div id="dlg1" style="display:none">
			<h3>간단한 대화상자</h3>
			<p>대화상자 입니다.</p>
		</div>
		<div id="dlg2" style="display:none">
			<h3>검색</h3>
			<p>
				<input type="text"/>
			</p>
		</div>
		<div id="dlg3" style="display:none">
			<h3>우편번호</h3>
			<p>
				동이름 : <input type="text"/>
			</p>
		</div>
		<div id="dlg5" style="display:none">
			<h3>대화상자</h3>
			<p>
				<input type="text"/>
			</p>
			<p>
				<button type="button">확인</button>
				<button type="button" onclick="dlgclose5()">취소</button>
			</p>
		</div>
		<div id="dlg6" style="display:none">
			<h3>대화상자</h3>
			<p>대화상자 입니다.</p>
		</div>
	</body>
</html>