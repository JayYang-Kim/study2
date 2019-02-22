<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
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

.title {
	font-weight: bold;
	font-size:13px;
}
</style>

</head>

<body>
	<form method="post" action="">
		<table style="width: 300px; margin: 100px auto 0px; background:#cccccc; border-spacing: 1px;">
		    <tr align="center">
		      <td height="40" bgcolor="#E6E4E6" class="title">
		          게시물 수정
		      </td>
		    </tr>
				
		    <tr align="center">
		      <td bgcolor="white" height="50">
		            패스워드 &nbsp;:&nbsp;
	             <input type="password" name="pwd" size="10" maxlength="10" class="boxTF">
		      </td>
		  </tr>
		</table>
		
	 	<table style="width: 300px; margin: 0px auto; border-spacing: 0px;">
		    <tr align="center" height="50">
		       <td>
				  <button type="submit" class="btn">확 인</button>&nbsp;
				  <button type="button" name="cancel" class="btn"
				               onclick="javascript:location.href='<%=cp%>/';">취 소</button>
	
		          <input type="hidden" name="mode" value="">
		          <input type="hidden" name="num" value="">
		          <input type="hidden" name="page" value="">
		       </td>
		    </tr>
		</table>
	</form>

	<table style="width: 300px; margin: 10px auto 0px; border-spacing: 0px;">
	    <tr align="center" height="30">
	       <td><span style='color:red'></span></td>
	    </tr>
	</table>
</body>
</html>