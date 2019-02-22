<%@page import="com.util.MyUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	MyUtil util = new MyUtil();
	GuestDAO dao = new GuestDAO();
	
	//List<GuestDTO> list = dao.listGuest();

	// 작성자
	String name = null;
	if(request.getParameter("name") != null) {
		name = request.getParameter("name");	
	}
	
	// 내용
	String msg = null;
	if(request.getParameter("msg") != null) {
		msg = request.getParameter("msg");
		msg = msg.replaceAll("&", "&amp;")
				.replaceAll("\"", "&quot;")
				.replaceAll("<", "&lt;")
				.replaceAll(">", "&gt;")
				.replaceAll(" ", "&nbsp;") // \\s를 사용하면 \n도 공백으로 바꿔버림
				.replaceAll("\n", "<br/>");	
	}
	
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
	List<GuestDTO> list = dao.listGuest(start, end);
	
	// 페이징 처리
	String listUrl = "guest.jsp";
	String paging = util.paging(current_page, total_page, listUrl);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="common.css" type="text/css"/>
		<style type="text/css">
			
		</style>
		<script type="text/javascript">
			function sendOk() {
				var f = document.textForm;
				
				if(!f.name.value) {
					alert("작성자를 입력해주세요.");
					f.name.focus();
					return;
				}
				
				if(!f.content.value) {
					alert("내용을 입력해주세요.");
					f.content.focus();
					return;
				}
				
				f.action = "guest_ok.jsp"; // 보내는 주소와 받는 주소가 같은 경우 action 생략 가능
				f.submit();
			}
			
			function delContent(num) {
				var f = document.textForm;
				var con = confirm("글을 삭제하시겠습니까?");
				
				if(con == true) {
					location.href="delete.jsp?num=" + num + "&page=" + <%= current_page%>;
				} else {
					alert("취소 되었습니다.");
					return;
				}
			}
		</script>
	</head>
	<body>
		<div style="width:800px;margin:30px auto;">
			<div>
				<div class="title">
					<h3>방명록</h3>
				</div>
				<div>
					<form name="textForm" method="post">
						<table>
							<tr>
								<th>작성자</th>
								<td>
									<input type="text" name="name" style="width:100%;padding:10px;box-sizing:border-box;border: 1px solid #c4c4c4;border-radius:4px;" placeholder="작성자를 입력해주세요."/>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea rows="5" cols="15" name="content" placeholder="내용을 입력해주세요." style="width:100%;padding:10px;box-sizing:border-box;border: 1px solid #c4c4c4;border-radius:4px;"></textarea>
								</td>
							</tr>
						</table>
						<div style="float:right;margin:20px 0;">
							<input type="hidden" name="page" value="<%= current_page%>"/>
							<input type="button" class="btn" value="등록하기" onclick="sendOk()"/>
							<input type="reset" class="btn" value="다시입력"/>
						</div>
					</form>
				</div>
			</div>
			
			<% for(GuestDTO dto : list) { %>
				<div style="border-top: 1px solid #c4c4c4;clear: both;">
					<div style="padding: 10px; background-color: #eeeeee;">
						<span style="font-weight: bold;"><%= dto.getName() %></span>
						<div style="float: right;">
							<span><%= dto.getCreated() %></span>
							<span> | <a href="javascript:delContent('<%= dto.getNum()%>')" style="color:#000000;text-decoration:none;">삭제</a></span>
						</div>
					</div>
					<div style="padding: 10px; clear: both;">
						<span style="white-space: pre;"><%= dto.getContent() %></span>
					</div>
				</div>
			<% } %>
			<div>
				<div class="mt20 t_center clear">
					<%if(dataCount == 0) { %>
						<span>등록된 글이 없습니다.</span>
					<% } else { %>
						<%= paging %>
					<% } %>
				</div>
			</div>
		</div>
	</body>
</html>