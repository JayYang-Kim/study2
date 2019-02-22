<%@page import="com.score.ScoreDTO"%>
<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	ScoreDAO dao = new ScoreDAO();

	String hak = request.getParameter("hak");
	String pageNum = request.getParameter("page");
	int rows = Integer.parseInt(request.getParameter("rows"));
	
	ScoreDTO dto = dao.readScroe(hak);
	if(dto == null) {
		response.sendRedirect("list.jsp?page" + pageNum + "%rows=" + rows);
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="common.css" type="text/css"/>
		<script src="basic.js" type="text/javascript"></script>
		<script type="text/javascript">
			function isValidDateFormat(data){
			    var regexp = /[12][0-9]{3}[\.|\-|\/]?[0-9]{2}[\.|\-|\/]?[0-9]{2}/;
			    if(! regexp.test(data))
			        return false;
	
			    regexp=/(\.)|(\-)|(\/)/g;
			    data=data.replace(regexp, "");
			    
				var y=parseInt(data.substr(0, 4));
			    var m=parseInt(data.substr(4, 2));
			    if(m<1||m>12) 
			    	return false;
			    var d=parseInt(data.substr(6));
			    var lastDay = (new Date(y, m, 0)).getDate();
			    if(d<1||d>lastDay)
			    	return false;
					
				return true;
			}
			
			function sendOk() {
				var f = document.scoreForm;
				
				/* 유효성 검사 */
				if(!/^\d{4,10}$/.test(f.hak.value)) {
					alert("학번은 4 ~ 10자 이내 숫자만 입력가능합니다.");
					f.hak.focus();
					return;
				}
				
				if(!/^[가-힣]{2,5}$/.test(f.name.value)) {
					alert("이름은 2 ~ 5자 이내 한글만 입력가능합니다.");
					f.name.focfus();
					return;
				}
				
				if(!isValidDateFormat(f.birth.value)) {
					alert("생년월일을 정확히 입력해주세요.");
					f.birth.focus();
					return;
				}
				
				if(!/^\d{1,3}$/.test(f.kor.value) || parseInt(f.kor.value) > 100) {
					alert("성적은 1 ~ 3자리 숫자만 입력가능합니다.");
					f.kor.focus();
					return;
				}
				
				if(!/^\d{1,3}$/.test(f.eng.value) || parseInt(f.eng.value) > 100) {
					alert("성적은 1 ~ 3자리 숫자만 입력가능합니다.");
					f.eng.focus();
					return;
				}
				
				if(!/^\d{1,3}$/.test(f.mat.value) || parseInt(f.mat.value) > 100) {
					alert("성적은 1 ~ 3자리 숫자만 입력가능합니다.");
					f.mat.focus();
					return;
				}
				
				f.submit();
			}
		</script>
	</head>
	<body>
		<div id="container">
			<div>
				<div class="title">
					<h3>성적처리</h3>
				</div>
				<form name="scoreForm" action="update_ok.jsp" method="post">
					<table class="tb2">
						<tr>
							<th>학번</th>
							<td>
								<input type="text" name="hak" class="boxTF" maxlength="10" value="<%= dto.getHak()%>" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="name" class="boxTF" maxlength="10" value="<%= dto.getName()%>"/>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<input type="text" name="birth" class="boxTF" maxlength="10" value="<%= dto.getBirth()%>"/>
							</td>
						</tr>
						<tr>
							<th>국어</th>
							<td>
								<input type="text" name="kor" class="boxTF" maxlength="3" value="<%= dto.getKor()%>"/>
							</td>
						</tr>
						<tr>
							<th>영어</th>
							<td>
								<input type="text" name="eng" class="boxTF" maxlength="3" value="<%= dto.getEng()%>"/>
							</td>
						</tr>
						<tr>
							<th>수학</th>
							<td>
								<input type="text" name="mat" class="boxTF" maxlength="3" value="<%= dto.getMat()%>"/>
							</td>
						</tr>
					</table>
					<div class="box_btn">
						<input type="hidden" name="page" value="<%= pageNum %>"/>
						<input type="hidden" name="rows" value="<%= rows %>"/>
						<button type="button" onclick="sendOk()" class="btn">수정완료</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="javascript:location.href='list.jsp?page=<%= pageNum%>&rows=<%= rows%>'">수정취소</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>