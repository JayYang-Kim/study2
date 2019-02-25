<%@page import="com.ex.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	List<String> list = new ArrayList<>();
	list.add("자바");
	list.add("안드로이드");
	list.add("웹");
	list.add("스프링");
	list.add("서블릿");
	
	request.setAttribute("list", list);
	
	List<User> list2 = new ArrayList<>();
	
	User user;
	
	user = new User();
	user.setName("홍길동");
	user.setAge(20);
	list2.add(user);
	
	user = new User();
	user.setName("홍길동2");
	user.setAge(22);
	list2.add(user);
	
	user = new User();
	user.setName("홍길동3");
	user.setAge(23);
	list2.add(user);
	
	request.setAttribute("list2", list2);
%>

<jsp:forward page="ex06_result.jsp"/>