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
		<!-- Datepicker-Ko -->
		<script type="text/javascript" src="jquery.ui.datepicker-ko.js"></script>
		<script type="text/javascript">
			$(function(){
				//$("#date1").datepicker();
				$("#date1").datepicker({
					showMonthAfterYear : true
				});
			});
			
			$(function(){
				$("#date2").datepicker({
					showMonthAfterYear : true,
					defaultDate : "2019-03-08",
					//minDate : 1,
					//maxDate : "+5D"
					//minDate : -3,
					//maxDate : "+1M + 5D"
					minDate : "2019-03-07",
					maxDate : "2019-03-20"
				});
			});
			
			$(function(){
				$("#date3").datepicker({
					showMonthAfterYear : true,
					showOn : "button",
					buttonImage : "calendar.gif",
					buttonImageOnly : true
				});
				
				$(".ui-datepicker-trigger").css({
					position : "relative",
					top : "3px",
					left : "5px"
				});
			});
		</script>
	</head>
	<body>
		<h3>UI</h3>
		<p>
			<input type="text" id="date1" readonly="readonly"/>
		</p>
		<p>
			<input type="text" id="date2" readonly="readonly"/>
		</p>
		<p>
			<input type="text" id="date3" readonly="readonly"/>
		</p>
	</body>
</html>