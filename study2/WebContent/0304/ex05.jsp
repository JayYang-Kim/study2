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
				$("div .tb_basic tbody tr:even td").css("background-color","#c4c4c4");
				$("div .tb_basic thead tr:first th").css("background-color","#4c4c4c").css("color","#ffffff");
				$("div .tb_basic tfoot tr:last td").css("background-color","#eeeeee").css("font-weight","bold");
				
				$("div .tb_basic2 tbody tr td:empty").css("background-color","red");
				$("div .tb_basic2 tbody tr td:contains('F')").css("background-color","pink");
				$("div .tb_basic2 tbody tr td:contains('F')").parent().css("font-weight","bold");
				$("div .tb_basic2 tbody tr td:contains('40')").css("color","blue");
				
				// child는 index가 1부터 시작한다.
				//$("div .tb_basic3 tbody tr td:first-child").css("color","blue");
				//$("div .tb_basic3 tbody tr td:last-child").css("color","red");
				//$("div .tb_basic3 tbody tr td:nth-child(1)").css("color","red");
				$("div .tb_basic3 tbody tr td:nth-child(2n + 1)").css("color","red");
			});
		</script>
		<style>
			*{padding:0;margin:0;}
			.tb_basic{width:500px;border-collapse:collapse;border-spacing:0;}
			.tb_basic2{width:500px;border-collapse:collapse;border-spacing:0;}
			.tb_basic3{width:500px;border-collapse:collapse;border-spacing:0;}
			.tb_basic tr th, .tb_basic tr td{padding:5px 10px;}
			.tb_basic2 tr th, .tb_basic2 tr td{padding:5px 10px;}
			.tb_basic3 tr th, .tb_basic3 tr td{padding:5px 10px;}
		</style>
	</head>
	<body>
		<div>
			<table class="tb_basic" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동2</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동3</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동4</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동5</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동6</td>
						<td>30</td>
						<td>40</td>
					</tr>
					<tr>
						<td>홍길동7</td>
						<td>30</td>
						<td>40</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>총계</td>
						<td>210</td>
						<td>280</td>
					</tr>
				</tfoot>
			</table>
			
			<br/>
			<hr/>
			<br/>
			
			<table class="tb_basic2" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>성별</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>30</td>
						<td></td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동2</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동3</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동4</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
					<tr>
						<td>홍길동5</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동6</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
					<tr>
						<td>홍길동7</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">총계</td>
						<td>210</td>
						<td>280</td>
					</tr>
				</tfoot>
			</table>
			
			<br/>
			<hr/>
			<br/>
			
			<table class="tb_basic3" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>성별</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>30</td>
						<td></td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동2</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동3</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동4</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
					<tr>
						<td>홍길동5</td>
						<td>30</td>
						<td>40</td>
						<td>M</td>
					</tr>
					<tr>
						<td>홍길동6</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
					<tr>
						<td>홍길동7</td>
						<td>30</td>
						<td>40</td>
						<td>F</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">총계</td>
						<td>210</td>
						<td>280</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</body>
</html>