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
				//$("form input[name=upload]").change(function(){ // 추후 만들어진 엘리먼트들은 이벤트 처리 불가
				$("body").on("change", "form input[type=file]", function(){
					if(!$(this).val()) {
						return;
					}
					
					var $tr, $td, $input;
					$tr = $("<tr>", {height:"35"});
					//$td = "<td width="100" style="text-align:center">첨부</td>";
					$td = $("<td>", {width:"100", style:"text-align:center", html:"첨부"});
					$tr.append($td);
					
					$td = $("<td>", {style:"padding-left:10px"});
					$input = $("<input>", {type:"file",name:"upload"});
					$td.append($input);
					$tr.append($td);
					
					$("#tb").append($tr);
				});
			});
		</script>
	</head>
	<body>
		<h3>이벤트</h3>
		
		<form name="myForm" enctype="multipart/from-data" method="post">
			<table border="1" style="width:500px;border-collapse:collapse;border-spacing:0">
				<tbody id="tb">
					<tr height="35">
						<td width="100" style="text-align:center">첨부</td>
						<td style="padding-left:10px;">
							<input type="file" name="upload"/>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr height="50">
						<td colspan="2" align="center">
							<button type="button">등록</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</body>
</html>