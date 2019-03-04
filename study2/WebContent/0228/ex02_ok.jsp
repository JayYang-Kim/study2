<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");

	String root = pageContext.getServletContext().getRealPath("/");
	//System.out.println(root);
	String pathname = root + "uploads" + File.separator + "pds";
	
	File f = new File(pathname);
	if(!f.exists()) { // 폴더가 없으면 
		f.mkdirs(); // 모든 폴더 만들기
	}
	
	String encType = "UTF-8"; // 파리미터의 enctype
	int maxFileSize = 5 * 1024 * 1024; // 5M
	
	/* cos.jar */
	// request, 파일저장경로, 파일최대크기, 파라미터 enctype, 동일 파일명 보호 (파일명이 같을 경우, 이름이 바뀜)
	MultipartRequest merq = new MultipartRequest(request, pathname, maxFileSize, encType, new DefaultFileRenamePolicy());
	
	String subject = merq.getParameter("subject");
	String name = merq.getParameter("name");
	// "upload"는  form 태그에서 <input type="file" name="upload"/>
	String saveFileName = merq.getFilesystemName("upload"); // 서버에 저장된 파일명
	String originalFileName = merq.getOriginalFileName("upload");
	File ff = merq.getFile("upload");
	long size = 0;
	if(ff != null) {
		size = ff.length();
	}
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p>제목 : <%=subject%></p>
		<p>이름 : <%=name%></p>
		<p>서버에 저장된 파일명 : <%=saveFileName%></p>
		<p>클라이언트가 올린 파일명 : <%=originalFileName%></p>
		<p>파일크기 : <%=size%>(byte)</p>
	</body>
</html>