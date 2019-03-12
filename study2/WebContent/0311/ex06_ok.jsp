<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	// json 데이터
	// {"키1" : "값1", "키2" : "값2"}
	
	// json 배열
	// [{"키1" : "값1", "키2" : "값2"},{"키1" : "값1", "키2" : "값2"}]
	
	// 수동으로 json 작성
	/* StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"name\":" + "\"" + name + "\"");
	sb.append(",\"content\":" + "\"" + content + "\"");
	sb.append("}");
	
	out.print(sb.toString()); */
	
	// jar파일을 사용하여 json 작성 (servlet에서 사용)
	JSONObject job = new JSONObject();
	job.put("count", 5);
	
	JSONArray jarr = new JSONArray();
	for(int i = 1; i <= 5; i++) {
		JSONObject ob = new JSONObject();
		ob.put("num", i);
		ob.put("name", name + "-" + i);
		ob.put("content", content + "-" + i);
		
		jarr.add(ob);
	}
	
	job.put("list", jarr);
	
	out.print(job.toString());
%>