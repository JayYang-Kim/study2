<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Map<String, Object> map = new HashMap<>();
	map.put("name", "홍길동");
	map.put("age", 20);
	
	request.setAttribute("map", map);
	
	List<Map<String, Object>> list = new ArrayList<>();
	Map<String, Object> m;
	
	m = new HashMap<>();
	m.put("subject", "자바");
	m.put("year", 2000);
	m.put("price", 100);
	list.add(m);
	
	m = new HashMap<>();
	m.put("subject", "웹");
	m.put("year", 2100);
	m.put("price", 100);
	list.add(m);
	
	m = new HashMap<>();
	m.put("subject", "서블릿");
	m.put("year", 2101);
	m.put("price", 90);
	list.add(m);
	
	request.setAttribute("list", list);
%>

<jsp:forward page="ex09_result.jsp"/>