<%@page import="java.net.URLEncoder"%>
<%@page import="com.bbs.BoardDTO"%>
<%@page import="com.bbs.BoardDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("utf-8");   
   
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("page");
   
   String searchKey = request.getParameter("searchKey");
   // tomcat에서는 값을 받아올때 디코딩이 된 상태이다.
   // 다른 WAS에서는 값을 받아올때 인코딩만 되어있는 상태이다.
   String searchValue = request.getParameter("searchValue"); 
   
   if(searchKey == null) {
	   searchKey = "subject";
	   searchValue = "";
   }
   
   // 인코딩 > 디코딩 처리
   searchValue = URLDecoder.decode(searchValue, "UTF-8");
   
   String query = "page=" + pageNum;
   
   if(searchValue.length() != 0) {
	   query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
   }
   
   BoardDAO dao = new BoardDAO();
   
   // 조회 수 증가
   dao.updateHitCount(num);
   
   BoardDTO dto = dao.readBoard(num);
   
   // 다른 사람이 해당 게시글을 지울 수 있기 때문에 null 체크
   if(dto == null) {
	   response.sendRedirect("list.jsp?" + query);
	   return;
   }
   
   // Content에 엔터가 있을 경우 <br/> 태그 처리
   dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
   
   // 이전 글, 다음 글 가져오기
   BoardDTO preReadDto = dao.preReadBoard(num, searchKey, searchValue);
   BoardDTO nextReadDto = dao.nextReadBoard(num, searchKey, searchValue);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>
<style type="text/css">
*{
    margin: 0; padding: 0;
}
body {
    font-size: 13px; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
a{
    color: #000000;
    text-decoration: none;
    cursor: pointer;
}
a:active, a:hover {
    text-decoration: underline;
    color: tomato;
}
.title {
    font-weight: bold;
    font-size:15px;
    margin-bottom:10px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.btn {
    color:#333;
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
    color: #333;
}
.boxTF {
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.selectField {
    border:1px solid #999999;
    padding:2px 5px 4px;
    border-radius:4px;
    font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
</style>
<script type="text/javascript">
	function deleteBoard() {
		if(confirm("게시글을 삭제하시겠습니까?")) {
			var url = "delete.jsp?<%=query%>&num=<%=dto.getNum()%>";
			location.href = url;
		}
	}
</script>
</head>

<body>

	<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
		<tr height="40">
			<td align="left" class="title">
				<h3>
					<span>|</span> 게시판
				</h3>
			</td>
		</tr>
	</table>

	<table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
		<tr height="35"
			style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="center"><%=dto.getSubject()%></td>
		</tr>

		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td width="50%" align="left" style="padding-left: 5px;">이름 : <%=dto.getName()%>
			</td>
			<td width="50%" align="right" style="padding-right: 5px;">
				<%=dto.getCreated()%> | 조회 <%=dto.getHitCount() %></td>
		</tr>

		<tr style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding: 10px 5px;" valign="top"
				height="200"><%=dto.getContent()%></td>
		</tr>

		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px;">
				이전글 :
				<% if(preReadDto != null) { %>
					<a href="article.jsp?<%=query%>&num=<%=preReadDto.getNum()%>"><%=preReadDto.getSubject() %></a>
				<% } %>
				</td>
		</tr>

		<tr height="35" style="border-bottom: 1px solid #cccccc;">
			<td colspan="2" align="left" style="padding-left: 5px;">
				다음글 :
				<% if(nextReadDto != null) { %>
					<a href="article.jsp?<%=query%>&num=<%=nextReadDto.getNum()%>"><%=nextReadDto.getSubject() %></a>
				<% } %>
				</td>
		</tr>
	</table>

	<table
		style="width: 600px; margin: 0px auto 20px; border-spacing: 0px;">
		<tr height="45">
			<td width="300" align="left">
				<button type="button" class="btn" onclick="javascript:location.href='update.jsp?<%=query%>&num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn" onclick="javascript:deleteBoard()">삭제</button>
			</td>

			<td align="right">
				<button type="button" class="btn" onclick="javascript:location.href='list.jsp?<%=query%>'">리스트</button>
			</td>
		</tr>
	</table>

</body>
</html>
