<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bbs.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.bbs.BoardDAO"%>
<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("utf-8");
   
   MyUtil util = new MyUtil();
   BoardDAO dao = new BoardDAO();
   
   // 파라미터로 넘어온 페이지 번호
   String pageNum = request.getParameter("page");
   int current_page = 1;
   
   if(pageNum != null) {
	   current_page = Integer.parseInt(pageNum);
   }
   
   // 검색
   String searchKey = request.getParameter("searchKey");
   String searchValue = request.getParameter("searchValue");
   
   // 검색이 없을 경우 value값 ""처리 (안할 경우, 밑에서 디코딩할때 nullPointException 발생)
   if(searchKey == null) {
	   searchKey = "subject";
	   searchValue = "";
   }
   
   // GET방식은 검색 문자열을 인코딩해서 파라미터를 보냄으로 다시 디코딩이 필요
   if(request.getMethod().equalsIgnoreCase("GET")) {
	   searchValue = URLDecoder.decode(searchValue, "UTF-8");
   }
   
   // 데이터 개수
   int dataCount;
   
   if(searchValue.length() == 0) { // 검색값이 없는 경우
	   dataCount = dao.dataCount();
   } else {                        // 검색값이 있는 경우
	   dataCount = dao.dataCount(searchKey, searchValue);
   }
   
   // 전체 페이지 수
   int rows = 2;
   //int rows = 10;
   int total_page = util.pageCount(rows, dataCount); // 전체 페이지 수 구하기
   
   // 현재 페이지가 전체 페이지 수보다 큰지 체크)
   if(current_page > total_page) {
	   current_page = total_page;
   }
   
   // 게시물 가져오기
   int start = (current_page - 1) * rows + 1; // 게시물 시작
   int end = current_page * rows;             // 게시물 끝
   
   List<BoardDTO> list;
   
   // 검색값이 있는지 없는지 체크
   if(searchValue.length() == 0) { // 검색값이 없는 경우
	   list = dao.listBoard(start, end);
   } else {                        // 검색값이 있는 경우
	   list = dao.listBoard(start, end, searchKey, searchValue);
   }
   
   // 리스트 글번호 만들기
   int listNum, n = 0;
   Iterator<BoardDTO> it = list.iterator();
   
   while(it.hasNext()) {
	   BoardDTO dto = it.next();
	   listNum = dataCount - (start + n - 1);
	   dto.setListNum(listNum);
	   n++;
   }
   
   String query = "";
   
   // 검색을 할 경우 query에 값 추가
   if(searchValue.length() != 0) {
	   query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
   }
   
   // 페이징 처리
   String listUrl = cp + "/bbs/list.jsp";
   String articleUrl = cp + "/bbs/article.jsp?page=" + current_page;
   
   // 검색값이 있는 경우
   if(query.length() != 0) {
	   listUrl += "?" + query;
	   articleUrl += "&" + query;
   }
   
   String paging = util.paging(current_page, total_page, listUrl);
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
.pagination{display:inline-block;padding-left:0}
.pagination>li {display:inline}
.pagination>li>a {cursor:pointer}
.pagination>li>a, .pagination>li>span {position:relative;float:left;padding:6px 12px;line-height:1.42857143;text-decoration:none;color:#373e4a;background-color:#fff;border:1px solid #ddd;margin-left:-1px}
.pagination>li:first-child>a, .pagination>li:first-child>span {margin-left:0;}
.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {color:#2a6496;background-color:#eee;border-color:#ddd}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {z-index:2;color:#fff;background-color:#2c2e2f;border-color:#2c2e2f;cursor:default}
.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover, .pagination>.disabled>span, .pagination>.disabled>span:focus, .pagination>.disabled>span:hover {color:#777;background-color:#fff;border-color:#ddd;cursor:not-allowed}
</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>
</head>

<body>

	<table style="width: 700px; margin: 30px auto 0px; border-spacing: 0px;">
		<tr height="45">
			<td align="left" class="title">
				<h3><span>|</span> 게시판</h3>
			</td>
		</tr>
	</table>

	<table style="width: 700px; margin: 20px auto 0px; border-spacing: 0px;">
	   <tr height="35">
	      <td align="left" width="50%">
	          <%=dataCount%>개(<%=current_page%> / <%=total_page%> 페이지)
	      </td>
	      <td align="right">
	          &nbsp;
	      </td>
	   </tr>
	</table>

	<table style="width: 700px; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		<tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		    <th width="60" style="color: #787878;">번호</th>
		    <th style="color: #787878;">제목</th>
		    <th width="100" style="color: #787878;">작성자</th>
		    <th width="80" style="color: #787878;">작성일</th>
		    <th width="60" style="color: #787878;">조회수</th>
		</tr>
	 
		<%for(BoardDTO dto : list) { %>
			<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
			    <td><%= dto.getListNum() %></td>
			    <td align="left" style="padding-left: 10px;">
			         <a href="<%=articleUrl%>&num=<%=dto.getNum()%>"><%=dto.getSubject() %></a>
			    </td>
			    <td><%=dto.getName()%></td>
			    <td><%=dto.getCreated()%></td>
			    <td><%=dto.getHitCount()%></td>
			</tr>
		<% } %>
	
	</table>
 
	<table style="width: 700px; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center" style="padding-top: 20px;">
			    <%if(dataCount == 0) { %>
			 		<span>등록된 게시물이 없습니다.</span>
			 	<% } else { %>
			 		<%= paging %>
			 	<% } %>
			</td>
		</tr>
	</table>

	<table style="width: 700px; margin: 10px auto; border-spacing: 0px;">
	   <tr height="40">
	      <td align="left" width="100">
	          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.jsp';">새로고침</button>
	      </td>
	      <td align="center">
	          <form name="searchForm" action="<%= cp %>/bbs/list.jsp" method="post">
	              <select name="searchKey" class="selectField">
	                  <option value="subject">제목</option>
	                  <option value="content">내용</option>
	                  <option value="all">제목 + 내용</option>
	                  <option value="name">작성자</option>
	                  <option value="created">등록일</option>
	            </select>
	            <input type="text" name="searchValue" class="boxTF">
	            <button type="button" class="btn" onclick="searchList()">검색</button>
	        </form>
	      </td>
	      <td align="right" width="100">
	          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created.jsp';">글올리기</button>
	      </td>
	   </tr>
	</table>
</body>
</html>