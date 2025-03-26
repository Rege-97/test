<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest.jsp</h1>
	<%
	String name = (String) session.getAttribute("name");
	Integer age = (Integer) session.getAttribute("age");
	%>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	<%
	session.setAttribute("name", "홍길동");
	session.setAttribute("age", 20);
	%>
</body>
</html>