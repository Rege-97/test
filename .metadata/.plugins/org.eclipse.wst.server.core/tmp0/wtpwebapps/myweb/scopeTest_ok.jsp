<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeTest_ok.jsp</h1>
	<jsp:useBean id="stest" class="com.yong.scope.ScopeTest" scope="application"></jsp:useBean>
	<h2 style="color: red;">count의 값 : <%=stest.getCount()%></h2>
	<a href="scopeTest.jsp">이전 페이지로...</a>
</body>
</html>