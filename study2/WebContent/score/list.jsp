<%@page import="com.score.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.score.ScoreDAO"%>
<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	MyUtil util = new MyUtil();
	ScoreDAO dao = new ScoreDAO();
	
	// 파라미터로 넘어온 페이지 번호 (없으면 1페이지 출력, page는 JSP 예약어로 변수로 사용 불가)
	String pageNum = request.getParameter("page");
	int current_page = 1;
	
	if(pageNum != null) {
		current_page = Integer.parseInt(pageNum);
	}
	
	// 전체 데이터 개수
	int dataCount = dao.dataCount();
	
	// 한 페이지에 출력할 데이터 수
	int rows = 10;
	String sr = request.getParameter("rows");
	if(sr != null) {
		rows = Integer.parseInt(sr);
	}
	
	// 전체 페이지
	int total_page = util.pageCount(rows, dataCount);
	
	// 전체 페이지수보다 표시할 페이지가 큰 경우 (다른 사람이 삭제한 경우 등)
	if(current_page > total_page) {
		current_page = total_page;
	}
	
	// 테이블에서 가져올 시작과 끝 위치
	int start = (current_page - 1) * rows + 1;
	int end = current_page * rows;
	
	// 테이블에서 데이터 가져오기
	List<ScoreDTO> list = dao.listScore(start, end);
	
	// 페이징 처리
	String listUrl = "list.jsp?rows=" + rows;
	String paging = util.paging(current_page, total_page, listUrl);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="common.css" type="text/css"/>
		<script type="text/javascript">
			function changeRows() {
				var rows = document.getElementById("rows").value;
				
				location.href = "list.jsp?rows=" + rows;
			}
			
			function deleteScore(hak) {
				if(confirm("삭제 하시겠습니까?")) {
					var url = "delete.jsp?hak=" + hak + "&page=<%= current_page%>&rows=<%= rows%>";
					location.href = url;
				}
			}
			
			function deleteList() {
				var f = document.scoreListForm;
				var cnt = 0;
				// checkBox가 선택되어 있는지 체크
				if(f.haks.length == undefined) { // checkBox가 하나인 경우
					if(f.haks.checked) {
						cnt++;
					}
				} else { // 여러개인 경우
					for(var i = 0; i < f.haks.length; i++) {
						if(f.haks[i].checked) {
							cnt++;
						}
					}
				}
				
				if(cnt == 0) {
					alert("삭제할 학번을 선택해주세요.");
					return;
				}
				
				if(confirm("선택한 학번을 삭제하시겠습니까?")) {
					f.action = "deleteList.jsp";
					f.submit();
				}
			}
			
			function check() {
				var f = document.scoreListForm; 
				
				if(f.haks == undefined) {
					return;
				}
				
				if(f.haks.length == undefined) { // checkBox가 하나인 경우
					f.haks.checked = f.chkAll.checked;
				} else { // 여러개인 경우
					for(var i = 0; i < f.haks.length; i++) {
						f.haks[i].checked = f.chkAll.checked;
					}
				}
			}
		</script>
	</head>
	<body>
		<div id="container">
			<div>
				<div class="title">
					<h3>성적처리</h3>
				</div>
				<div>
					<button type="button" class="btn" onclick="deleteList()">삭제</button>
				</div>
				<form name="scoreListForm" method="post">
					<div>
						<table class="tb1 clear">
							<colgroup>
								<col style="width:40px;"/>
								<col style="width:90px;"/>
								<col style="width:90px;"/>
								<col style="width:120px;"/>
								<col style="width:70px" span="5"/>
							</colgroup>
							<thead>
								<tr>
									<th>
										<input type="checkbox" name="chkAll" onclick="check()"/>
									</th>
									<th width="60">학번</th>
									<th width="60">이름</th>
									<th width="60">생년월일</th>
									<th width="60">국어</th>
									<th width="60">영어</th>
									<th width="60">수학</th>
									<th width="60">총점</th>
									<th width="60">평균</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
								<% for(ScoreDTO dto : list) { %>
									<tr>
										<td>
											<input type="checkbox" name="haks" value="<%= dto.getHak() %>"/>
										</td>
										<td><%= dto.getHak() %></td>
										<td><%= dto.getName() %></td>
										<td><%= dto.getBirth() %></td>
										<td><%= dto.getKor() %></td>
										<td><%= dto.getEng() %></td>
										<td><%= dto.getMat() %></td>
										<td><%= dto.getTot() %></td>
										<td><%= dto.getAve() %></td>
										<td>
											<a href="update.jsp?hak=<%= dto.getHak()%>&page=<%= current_page%>&rows=<%= rows%>">수정</a>
											<a href="javascript:deleteScore('<%= dto.getHak()%>')">삭제</a>
										</td>
									</tr>
								<% } %>
							</tbody>
						</table>
					</div>
					<div>
						<div class="f_right">
							<input type="hidden" name="page" value="<%= current_page %>"/>
							<select id="rows" name="rows" onchange="changeRows()">
								<option value="5" <%= rows == 5 ? "selected='selected'" : "" %>>5개씩 출력</option>
								<option value="10" <%= rows == 10 ? "selected='selected'" : "" %>>10개씩 출력</option>
								<option value="20" <%= rows == 20 ? "selected='selected'" : "" %>>20개씩 출력</option>
								<option value="30" <%= rows == 30 ? "selected='selected'" : "" %>>30개씩 출력</option>
								<option value="50" <%= rows == 50 ? "selected='selected'" : "" %>>50개씩 출력</option>
							</select>
						</div>
						<div class="t_center clear">
							<%= paging %>
						</div>
					</div>
				</form>
				<div class="t_right">
					<button type="button" class="btn" onclick="javascript:location.href='write.jsp?rows=<%= rows%>'">등록하기</button>
				</div>
			</div>
		</div>
	</body>
</html>