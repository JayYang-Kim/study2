<%@page import="com.bbs.BoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.bbs.BoardDAO"%>
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
   
   BoardDTO dto = dao.readBoard(num);
   if(dto == null) {
	   response.sendRedirect("list.jsp?" + query);
	   return;
   }
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
.boxTA {
    border:1px solid #999999;
    height:150px;
    padding:3px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
</style>

<script type="text/javascript">
  // 좌우의 공백을 제거하는 함수
  if(typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
        return this.replace(TRIM_PATTERN, "");
    };
  }

  function sendBoard() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

	    str = f.name.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.name.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return;
        }
    	
        f.action = "<%=cp%>/bbs/update_ok.jsp";
        f.submit();
  }
</script>

</head>

<body>

<table style="width: 600px; margin: 30px auto 0px; border-spacing: 0px;">
<tr height="45">
	<td align="left" class="title">
		<h3><span>|</span> 게시판</h3>
	</td>
</tr>
</table>

<form name="boardForm" method="post">
  <table style="width: 600px; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td style="padding-left:10px;"> 
        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="<%=dto.getSubject()%>">
      </td>
  </tr>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
      <td style="padding-left:10px;"> 
        <input type="text" name="name" size="35" maxlength="20" class="boxTF" value="<%=dto.getName()%>">
      </td>
  </tr>

  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
      <td valign="top" style="padding:5px 0px 5px 10px;"> 
        <textarea name="content" rows="12" class="boxTA" style="width: 95%;"><%=dto.getContent()%></textarea>
      </td>
  </tr>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">패스워드</td>
      <td style="padding-left:10px;"> 
           <input type="password" name="pwd" size="35" maxlength="7" class="boxTF">&nbsp;(게시물 수정 및 삭제시 필요 !!!)
       </td>
  </tr> 
  </table>

  <table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
      	<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
      	<input type="hidden" name="page" value="<%=pageNum%>"/>
      	<input type="hidden" name="searchKey" value="<%=searchKey%>"/>
      	<input type="hidden" name="searchValue" value="<%=searchValue%>"/>
      	
        <button type="button" class="btn" onclick="sendBoard();">수정완료</button>
        <button type="reset" class="btn">다시입력</button>
        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.jsp?<%=query%>';">수정취소</button>
      </td>
    </tr>
  </table>
</form>

</body>
</html>